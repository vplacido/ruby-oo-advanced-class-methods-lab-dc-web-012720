class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    songname = self.new
    songname.name = name
    songname
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song 
  end

  def self.find_by_name(name)
        self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      song = find_by_name(name)
      song
    else 
      song = create_by_name(name)
      song
    end
  end

    def self.alphabetical
      self.all.sort_by{|song| song.name}
    end

    def self.new_from_filename(name)
      newName = name.split(" - ")
      artist = newName[0]
      song = newName[1].gsub(".mp3","")
      oldSong = Song.new 
      oldSong.name = song
      oldSong.artist_name = artist
      oldSong
    end

    def self.create_from_filename(name)
      newName = name.split(" - ")
      artist = newName[0]
      song = newName[1].gsub(".mp3","")
      oldSong = self.create
      oldSong.name = song
      oldSong.artist_name = artist
      oldSong
    end

    def self.destroy_all
      self.all.clear
    end
end
