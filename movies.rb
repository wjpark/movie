require 'pry'
gem 'sinatra', '1.3.0'
require 'sinatra'
require 'sinatra/reloader'
require 'better_errors'
require 'erubis'
require 'open-uri'
require 'json'
require 'uri'

get "/" do
	erb :home
end

post "/search-results" do
	s = params[:movie_title]
	file = open("http://www.omdbapi.com/?s=#{URI.escape(s)}")
	@list = JSON.load(file.read)
	erb :search_results
end

get "/search-results/:id" do
	i = params[:id]
	file = open("http://www.omdbapi.com/?i=#{URI.escape(i)}")
	@imdb = JSON.load(file.read)
	erb :movie_detail
end


