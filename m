From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Fri, 17 Oct 2014 00:28:57 +0200
Subject: [Buildroot] [PATCH v3 2/8] package/mpd: sort plugins by type in
	Config.in
In-Reply-To: <1413498543-643-1-git-send-email-jkrause@posteo.de>
References: <1413498543-643-1-git-send-email-jkrause@posteo.de>
Message-ID: <1413498543-643-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* sort plugins by type
* fix indentation of config symbols help text

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
Changes v2 -> v3:
  - fix indentation of help texts
  - add commit log
Changes v1 -> v2:
  - fix dependency in comment
---
 package/mpd/Config.in | 183 +++++++++++++++++++++++++++-----------------------
 1 file changed, 98 insertions(+), 85 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index f2dbbb0..5ef1d3f 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -22,20 +22,31 @@ menuconfig BR2_PACKAGE_MPD
 
 if BR2_PACKAGE_MPD
 
-config BR2_PACKAGE_MPD_ALSA
-	bool "alsa"
-	default y
-	select BR2_PACKAGE_ALSA_LIB
-	select BR2_PACKAGE_ALSA_LIB_PCM
-	select BR2_PACKAGE_ALSA_LIB_MIXER
+comment "Archive plugins"
+
+config BR2_PACKAGE_MPD_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_BZIP2
 	help
-	  Enable alsa output support.
+	  Enable bzip2 archive support.
 
-config BR2_PACKAGE_MPD_AO
-	bool "ao"
-	select BR2_PACKAGE_LIBAO
+config BR2_PACKAGE_MPD_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_SQLITE
 	help
-	  Enable libao output support.
+	  Enable sqlite database support.
+	  If you don't use sqlite it will use an ASCII database.
+
+comment "Converter plugins"
+
+config BR2_PACKAGE_MPD_LIBSAMPLERATE
+	bool "libsamplerate"
+	select BR2_PACKAGE_LIBSAMPLERATE
+	help
+	  Enable libsamplerate input support.
+	  Select this for software sample rate conversion.
+
+comment "Decoder plugins"
 
 config BR2_PACKAGE_MPD_AUDIOFILE
 	bool "audiofile"
@@ -44,30 +55,6 @@ config BR2_PACKAGE_MPD_AUDIOFILE
 	  Enable audiofile input/streaming support.
 	  Select this if you want to play back WAV files.
 
-config BR2_PACKAGE_MPD_PULSEAUDIO
-	bool "pulseaudio"
-	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
-	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
-	select BR2_PACKAGE_PULSEAUDIO
-	help
-	  Enable pulseaudio output support.
-
-comment "pulseaudio support needs a toolchain w/ largefile"
-	depends on BR2_ARCH_HAS_ATOMICS
-	depends on !BR2_LARGEFILE
-
-config BR2_PACKAGE_MPD_BZIP2
-	bool "bzip2"
-	select BR2_PACKAGE_BZIP2
-	help
-	  Enable bzip2 archive support.
-
-config BR2_PACKAGE_MPD_CURL
-	bool "curl"
-	select BR2_PACKAGE_LIBCURL
-	help
-	  Enable curl streaming (http) support.
-
 config BR2_PACKAGE_MPD_FAAD2
 	bool "faad2"
 	select BR2_PACKAGE_FAAD2
@@ -75,13 +62,6 @@ config BR2_PACKAGE_MPD_FAAD2
 	  Enable faad2 input support.
 	  Select this if you want to play back MP4/AAC files.
 
-config BR2_PACKAGE_MPD_FLAC
-	bool "flac"
-	select BR2_PACKAGE_FLAC
-	help
-	  Enable flac input/streaming support.
-	  Select this if you want to play back FLAC files.
-
 config BR2_PACKAGE_MPD_FFMPEG
 	bool "ffmpeg"
 	select BR2_PACKAGE_FFMPEG
@@ -94,18 +74,12 @@ config BR2_PACKAGE_MPD_FFMPEG
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
+	  Enable flac input/streaming support.
+	  Select this if you want to play back FLAC files.
 
 config BR2_PACKAGE_MPD_LIBSNDFILE
 	bool "libsndfile"
@@ -152,28 +126,6 @@ config BR2_PACKAGE_MPD_OPUS
 	  Enable opus input support.
 	  Select this if you want to play back OPUS encoded files.
 
-config BR2_PACKAGE_MPD_SOUNDCLOUD
-	bool "soundcloud"
-	select BR2_PACKAGE_YAJL
-	help
-	  Enable soundcloud.com playlist support.
-
-config BR2_PACKAGE_MPD_SQLITE
-	bool "sqlite"
-	select BR2_PACKAGE_SQLITE
-	help
-	  Enable sqlite database support.
-	  If you don't use sqlite it will use an ASCII database.
-
-config BR2_PACKAGE_MPD_TCP
-	bool "tcp sockets"
-	default y
-	help
-	  Enable mpd to listen on tcp sockets.
-
-	  You want this on if mpd and the client(s) work
-	  on different machines (the usual scenario).
-
 config BR2_PACKAGE_MPD_TREMOR
 	bool "tremor"
 	select BR2_PACKAGE_LIBOGG
@@ -182,16 +134,6 @@ config BR2_PACKAGE_MPD_TREMOR
 	  Enable vorbis input support.
 	  Select this if you want to play back OGG files on softfloat targets.
 
-config BR2_PACKAGE_MPD_TWOLAME
-	bool "twolame"
-	depends on BR2_LARGEFILE # twolame -> libsndfile
-	select BR2_PACKAGE_TWOLAME
-	help
-	  Enable TwoLAME mp2 encoding.
-
-comment "twolame support needs a toolchain w/ largefile"
-	depends on !BR2_LARGEFILE
-
 config BR2_PACKAGE_MPD_VORBIS
 	bool "vorbis"
 	select BR2_PACKAGE_LIBOGG
@@ -207,6 +149,77 @@ config BR2_PACKAGE_MPD_WAVPACK
 	  Enable wavpack input support.
 	  Select this if you want to play back WV files.
 
+comment "Encoder plugins"
+
+config BR2_PACKAGE_MPD_LAME
+	bool "lame"
+	select BR2_PACKAGE_LAME
+	help
+	  Enable lame (mp3) encoding support.
+
+config BR2_PACKAGE_MPD_TWOLAME
+	bool "twolame"
+	depends on BR2_LARGEFILE # twolame -> libsndfile
+	select BR2_PACKAGE_TWOLAME
+	help
+	  Enable TwoLAME mp2 encoding.
+
+comment "twolame support needs a toolchain w/ largefile"
+	depends on !BR2_LARGEFILE
+
+comment "Input plugins"
+
+config BR2_PACKAGE_MPD_CURL
+	bool "curl"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Enable curl streaming (http) support.
+
+config BR2_PACKAGE_MPD_SOUNDCLOUD
+	bool "soundcloud"
+	select BR2_PACKAGE_YAJL
+	help
+	  Enable soundcloud.com playlist support.
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
+	  Enable alsa output support.
+
+config BR2_PACKAGE_MPD_AO
+	bool "ao"
+	select BR2_PACKAGE_LIBAO
+	help
+	  Enable libao output support.
+
+config BR2_PACKAGE_MPD_PULSEAUDIO
+	bool "pulseaudio"
+	depends on BR2_LARGEFILE # pulseaudio -> libsndfile
+	depends on BR2_ARCH_HAS_ATOMICS # pulseaudio
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  Enable pulseaudio output support.
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
+	help
+	  Enable mpd to listen on tcp sockets.
+
+	  You want this on if mpd and the client(s) work
+	  on different machines (the usual scenario).
 endif
 
 comment "mpd needs a toolchain w/ C++, threads, wchar"
-- 
2.1.2
