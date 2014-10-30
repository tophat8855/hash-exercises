require 'spec_helper'

describe "More fun with hashes" do
  let(:people) { people_data}
  let(:___) { nil }

  it "gets joes first name" do
    first_name = people["joe"][:first_name]
    expect( first_name ).to be == "Joe"
  end

  it "gets the last names of all the people and returns them as a comma separated string" do
    holding_array = []
    people.each_key do |person|
      holding_array << people[person][:last_name]
    end
    names = holding_array.join(", ")
    expect( names ).to be == "Jenkins, Summers"
  end

  it "gets the first genre of each person, and returns a comma separated string" do
    holding_array = []
    people.each_key do |person|
      holding_array << people[person][:preferences][:favorite_genres][0]
    end
    top_genres = holding_array.join(", ")
    expect( top_genres ).to be == "jazz, funk"
  end

  it "calculates and returns the last name of the person sitting next to joe" do
    # Use code! Hint: find who joe is sitting next to, then use that to find their data
    neighbors_last_name = people[people["joe"][:sitting_next_to].to_s][:last_name]
    expect( neighbors_last_name ).to be == "Summers"
  end

  it "gets the date of the first correspondence with joe" do
    joes_first_correspondence = people["joe"][:correspondence][0][:date]
    expect( joes_first_correspondence ).to be == "11/4/2014"
  end
end
