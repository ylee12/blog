# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

User.delete_all

u1 = User.create :email => 'mary@example.com', :password => 'guessit' 

u1.articles.create(title: "Fun book in JavaScript", body: " Dynamic web dev to perform rake, install rake 4.0", location: "USA - Oakland", excerpt: "A very detail approach to JavaScript development.")
u1.articles.create(title: "First test book in ROR", body: "Ruby on Rails is fun to work with.", location: "USA - California", excerpt: "A very detail approach to Rails development.")





u2 = User.create(email: 'ylee@mtc.ca.gov', password: '1cyst0rm')

u2.articles.create(title: 'Rails 4 Development', body: 'Rails is fun', location: 'USA - CA', published_at: DateTime.now)
u2.articles.create(title: 'SASS Development in 21 days', body: 'Web design is fun', location: 'USA - CA', published_at: DateTime.now - 3)
u2.articles.create(title: 'JavaScript Hotshot', body: 'Javascript is powerful', location: 'USA - Oakland', published_at: DateTime.now)
u2.articles.create(title: "Yong book in JavaScript", body: " Dynamic web dev to perform rake, install rake 4.0", location: "USA - Oakland", excerpt: "A very detail approach to JavaScript development.")



Category.create [{:name => 'Programming'}, 
  {:name => 'Event'}, 
  {:name => 'Travel'},
  {:name => 'Food'},  
  {:name => 'Movie'}, 
  {:name => 'Music'}, 
  {:name => 'TV'}]

# add a category to the article associate with the user
 User.find_by(email: 'ylee@mtc.ca.gov').articles.where(["title like :title", {title: "%Rails%"}]).first.categories << Category.find_by_name('Programming')

#create an article and assign categories to it
a1 = Article.create(title: 'JQuery Hotshot', body: 'JQuery GUI is powerful', location: 'USA - Oakland', published_at: DateTime.now - 5)
a1.categories << Category.where(["name like :name", {name: '%prog%'}]).all
a1.save

a2 = Article.create(title: 'JQuery and CSS Development', body: 'JQuery + CSS GUI is powerful and fun', location: 'USA - San Jose', published_at: DateTime.now - 3)
a2.categories << Category.where(["name like :name", {name: '%M%'}]).all
a2.save


u1.articles << a1
u2.articles << a2
u1.save
u2.save

 