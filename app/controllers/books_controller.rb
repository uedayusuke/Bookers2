class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  	@user = User.find(current_user.id)
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	@book.save
  	redirect_to books_path #後で詳細ページに変更！
  end

  def edit
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end
end
