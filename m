From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Wed, 15 Oct 2014 15:18:48 +0200
Subject: [Buildroot] [PATCH v2 2/8] package/mpd: sort plugins by type in
	Config.in
In-Reply-To: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413379134-28918-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v1 -> v2:
  - fix dependency in comment
---
 package/mpd/Config.in | 215 ++++++++++++++++++++++++++------------------------
 1 file changed, 114 insertions(+), 101 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index f2dbbb0..10f3cf0 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -22,65 +22,45 @@ menuconfig BR2_PACKAGE_MPD
 
 if BR2_PACKAGE_MPD
 
-config BR2_PACKAGE_MPD_ALSA
-	bool "alsa"
-	default y
-	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_ALSA_LIB_PCM
-	select BR2_PACKAGE_ALSA_LIB_MIXER
-	help
-	  Enable alsa output support.
+comment "Archive plugins"
 
-config BR2_PACKAGE_MPD_AO
-	bool "ao"
-	select BR2_PACKAGE_LIBAO
-	help
-	  Enable libao output support.
-
-config BR2_PACKAGE_MPD_AUDIOFILE
-	bool "audiofile"
-	select BR2_PACKAGE_AUDIOFILE
+config BR2_PACKAGE_MPD_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_BZIP2
 	help
-	  Enable audiofile input/streaming support.
-	  Select this if you want to play back WAV files.
+		Enable bzip2 archive support.
 
-config BR2_PACKAGE_MPD_PULSEAUDIO
-	bool "pulseaudio"
-	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
-	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
-	select BR2_PACKAGE_PULSEAUDIO
+config BR2_PACKAGE_MPD_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_SQLITE
 	help
-	  Enable pulseaudio output support.
+		Enable sqlite database support.
+		If you don't use sqlite it will use an ASCII database.
 
-comment "pulseaudio support needs a toolchain w/ largefile"
-	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_LARGEFILE
+comment "Converter plugins"
 
-config BR2_PACKAGE_MPD_BZIP2
-	bool "bzip2"
-	select BR2_PACKAGE_BZIP2
+config BR2_PACKAGE_MPD_LIBSAMPLERATE
+	bool "libsamplerate"
+	select BR2_PACKAGE_LIBSAMPLERATE
 	help
-	  Enable bzip2 archive support.
+		Enable libsamplerate input support.
+		Select this for software sample rate conversion.
 
-config BR2_PACKAGE_MPD_CURL
-	bool "curl"
-	select BR2_PACKAGE_LIBCURL
+comment "Decoder plugins"
+
+config BR2_PACKAGE_MPD_AUDIOFILE
+	bool "audiofile"
+	select BR2_PACKAGE_AUDIOFILE
 	help
-	  Enable curl streaming (http) support.
+		Enable audiofile input/streaming support.
+		Select this if you want to play back WAV files.
 
 config BR2_PACKAGE_MPD_FAAD2
 	bool "faad2"
 	select BR2_PACKAGE_FAAD2
 	help
-	  Enable faad2 input support.
-	  Select this if you want to play back MP4/AAC files.
-
-config BR2_PACKAGE_MPD_FLAC
-	bool "flac"
-	select BR2_PACKAGE_FLAC
-	help
-	  Enable flac input/streaming support.
-	  Select this if you want to play back FLAC files.
+		Enable faad2 input support.
+		Select this if you want to play back MP4/AAC files.
 
 config BR2_PACKAGE_MPD_FFMPEG
 	bool "ffmpeg"
@@ -88,32 +68,26 @@ config BR2_PACKAGE_MPD_FFMPEG
 	depends on BR2_LARGEFILE
 	depends on BR2_INET_IPV6
 	help
-	  Enable ffmpeg input support.
-	  Select this if you want to play back files supported by ffmpeg.
+		Enable ffmpeg input support.
+		Select this if you want to play back files supported by ffmpeg.
 
 comment "ffmpeg support needs a toolchain w/ largefile, IPv6"
 	depends on !(BR2_LARGEFILE && BR2_INET_IPV6)
 
-config BR2_PACKAGE_MPD_LAME
-	bool "lame"
-	select BR2_PACKAGE_LAME
-	help
-	  Enable lame (mp3) encoding support.
-
-config BR2_PACKAGE_MPD_LIBSAMPLERATE
-	bool "libsamplerate"
-	select BR2_PACKAGE_LIBSAMPLERATE
+config BR2_PACKAGE_MPD_FLAC
+	bool "flac"
+	select BR2_PACKAGE_FLAC
 	help
-	  Enable libsamplerate input support.
-	  Select this for software sample rate conversion.
+		Enable flac input/streaming support.
+		Select this if you want to play back FLAC files.
 
 config BR2_PACKAGE_MPD_LIBSNDFILE
 	bool "libsndfile"
 	select BR2_PACKAGE_LIBSNDFILE
 	depends on BR2_LARGEFILE
 	help
-	  Enable libsndfile input/streaming support.
-	  Select this if you want to play back WAV files.
+		Enable libsndfile input/streaming support.
+		Select this if you want to play back WAV files.
 
 comment "libsndfile support needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
@@ -124,16 +98,16 @@ config BR2_PACKAGE_MPD_MAD
 	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_LIBMAD
 	help
-	  Enable mad input support.
-	  Select this if you want to play back MP3 files.
+		Enable mad input support.
+		Select this if you want to play back MP3 files.
 
 config BR2_PACKAGE_MPD_MPG123
 	bool "mpg123"
 	select BR2_PACKAGE_LIBID3TAG
 	select BR2_PACKAGE_MPG123
 	help
-	  Enable mpg123 input support.
-	  Select this if you want to play back MP3 files.
+		Enable mpg123 input support.
+		Select this if you want to play back MP3 files.
 
 config BR2_PACKAGE_MPD_MUSEPACK
 	bool "musepack"
@@ -141,72 +115,111 @@ config BR2_PACKAGE_MPD_MUSEPACK
 	select BR2_PACKAGE_LIBREPLAYGAIN
 	select BR2_PACKAGE_MUSEPACK
 	help
-	  Enable musepack input support.
-	  Select this if you want to play back MPC files.
+		Enable musepack input support.
+		Select this if you want to play back MPC files.
 
 config BR2_PACKAGE_MPD_OPUS
 	bool "opus"
 	select BR2_PACKAGE_OPUS
 	select BR2_PACKAGE_LIBOGG
 	help
-	  Enable opus input support.
-	  Select this if you want to play back OPUS encoded files.
+		Enable opus input support.
+		Select this if you want to play back OPUS encoded files.
 
-config BR2_PACKAGE_MPD_SOUNDCLOUD
-	bool "soundcloud"
-	select BR2_PACKAGE_YAJL
+config BR2_PACKAGE_MPD_TREMOR
+	bool "tremor"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_TREMOR
 	help
-	  Enable soundcloud.com playlist support.
+		Enable vorbis input support.
+		Select this if you want to play back OGG files on softfloat targets.
 
-config BR2_PACKAGE_MPD_SQLITE
-	bool "sqlite"
-	select BR2_PACKAGE_SQLITE
+config BR2_PACKAGE_MPD_VORBIS
+	bool "vorbis"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
 	help
-	  Enable sqlite database support.
-	  If you don't use sqlite it will use an ASCII database.
+		Enable vorbis input/streaming support.
+		Select this if you want to play back OGG files on hardfloat targets.
 
-config BR2_PACKAGE_MPD_TCP
-	bool "tcp sockets"
-	default y
+config BR2_PACKAGE_MPD_WAVPACK
+	bool "wavpack"
+	select BR2_PACKAGE_WAVPACK
 	help
-	  Enable mpd to listen on tcp sockets.
+		Enable wavpack input support.
+		Select this if you want to play back WV files.
 
-	  You want this on if mpd and the client(s) work
-	  on different machines (the usual scenario).
+comment "Encoder plugins"
 
-config BR2_PACKAGE_MPD_TREMOR
-	bool "tremor"
-	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_TREMOR
+config BR2_PACKAGE_MPD_LAME
+	bool "lame"
+	select BR2_PACKAGE_LAME
 	help
-	  Enable vorbis input support.
-	  Select this if you want to play back OGG files on softfloat targets.
+		Enable lame (mp3) encoding support.
 
 config BR2_PACKAGE_MPD_TWOLAME
 	bool "twolame"
 	depends on BR2_LARGEFILE # twolame -> libsndfile
 	select BR2_PACKAGE_TWOLAME
 	help
-	  Enable TwoLAME mp2 encoding.
+		Enable TwoLAME mp2 encoding.
 
 comment "twolame support needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
 
-config BR2_PACKAGE_MPD_VORBIS
-	bool "vorbis"
-	select BR2_PACKAGE_LIBOGG
-	select BR2_PACKAGE_LIBVORBIS
+comment "Input plugins"
+
+config BR2_PACKAGE_MPD_CURL
+	bool "curl"
+	select BR2_PACKAGE_LIBCURL
 	help
-	  Enable vorbis input/streaming support.
-	  Select this if you want to play back OGG files on hardfloat targets.
+		Enable curl streaming (http) support.
 
-config BR2_PACKAGE_MPD_WAVPACK
-	bool "wavpack"
-	select BR2_PACKAGE_WAVPACK
+config BR2_PACKAGE_MPD_SOUNDCLOUD
+	bool "soundcloud"
+	select BR2_PACKAGE_YAJL
+	help
+		Enable soundcloud.com playlist support.
+
+comment "Output plugins"
+
+config BR2_PACKAGE_MPD_ALSA
+	bool "alsa"
+	default y
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_PCM
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	help
+		Enable alsa output support.
+
+config BR2_PACKAGE_MPD_AO
+	bool "ao"
+	select BR2_PACKAGE_LIBAO
+	help
+		Enable libao output support.
+
+config BR2_PACKAGE_MPD_PULSEAUDIO
+	bool "pulseaudio"
+	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+		Enable pulseaudio output support.
+
+comment "pulseaudio support needs a toolchain w/ largefile"
+	depends on BR2_ARCH_HAS_ATOMICS
+	depends on !BR2_LARGEFILE
+
+comment "Miscellaneous plugins"
+
+config BR2_PACKAGE_MPD_TCP
+	bool "tcp sockets"
+	default y
 	help
-	  Enable wavpack input support.
-	  Select this if you want to play back WV files.
+		Enable mpd to listen on tcp sockets.
 
+		You want this on if mpd and the client(s) work
+		on different machines (the usual scenario).
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar"
-- 
2.1.2
