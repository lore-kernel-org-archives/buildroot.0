From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Jan 2011 13:54:40 -0300
Subject: [Buildroot] [PATCH 10/10] mpd: new package
In-Reply-To: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1295369680-24816-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Music Player Daemon package.
Enjoy, send me beers ;)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/Config.in     |    1 +
 package/multimedia/mpd/Config.in |  138 ++++++++++++++++++++++++++++++++++++++
 package/multimedia/mpd/S95mpd    |   30 ++++++++
 package/multimedia/mpd/mpd.conf  |   32 +++++++++
 package/multimedia/mpd/mpd.mk    |   85 +++++++++++++++++++++++
 5 files changed, 286 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/mpd/Config.in
 create mode 100755 package/multimedia/mpd/S95mpd
 create mode 100644 package/multimedia/mpd/mpd.conf
 create mode 100644 package/multimedia/mpd/mpd.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 14c4145..ae26ceb 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -28,6 +28,7 @@ source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/libvorbis/Config.in"
 source "package/multimedia/madplay/Config.in"
+source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/musepack/Config.in"
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
new file mode 100644
index 0000000..b902b7b
--- /dev/null
+++ b/package/multimedia/mpd/Config.in
@@ -0,0 +1,138 @@
+menuconfig BR2_PACKAGE_MPD
+	bool "mpd"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	help
+	  MPD is a flexible, powerful, server-side application
+	  for playing music. Through plugins and libraries
+	  it can play a variety of sound files while being
+	  controlled by its network protocol.
+
+	  http://www.musicpd.org
+
+if BR2_PACKAGE_MPD
+
+config BR2_PACKAGE_MPD_ALSA
+	bool "alsa"
+	select BR2_PACKAGE_ALSA_LIB
+	help
+	  Enable alsa output support.
+
+config BR2_PACKAGE_MPD_AO
+	bool "ao"
+	select BR2_PACKAGE_LIBAO
+	help
+	  Enable libao output support.
+
+config BR2_PACKAGE_MPD_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_BZIP2
+	help
+	  Enable bzip2 archive support.
+
+config BR2_PACKAGE_MPD_CURL
+	bool "curl"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Enable curl streaming (http) support.
+
+config BR2_PACKAGE_MPD_FAAD2
+	bool "faad2"
+	select BR2_PACKAGE_FAAD2
+	help
+	  Enable faad2 input support.
+	  Select this if you want to play back MP4/AAC files.
+
+config BR2_PACKAGE_MPD_FLAC
+	bool "flac"
+	select BR2_PACKAGE_FLAC
+	help
+	  Enable flac input/streaming support.
+	  Select this if you want to play back FLAC files.
+
+config BR2_PACKAGE_MPD_LIBSAMPLERATE
+	bool "libsamplerate"
+	select BR2_PACKAGE_LIBSAMPLERATE
+	help
+	  Enable libsamplerate input support.
+	  Select this for software sample rate conversion.
+
+config BR2_PACKAGE_MPD_LIBSNDFILE
+	bool "libsndfile"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  Enable libsndfile input/streaming support.
+	  Select this if you want to play back WAV files.
+
+config BR2_PACKAGE_MPD_MAD
+	bool "mad"
+	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_LIBMAD
+	help
+	  Enable mad input support.
+	  Select this if you want to play back MP3 files.
+	  mpg123 has better quality support (24-bit) but doesn't seek.
+
+config BR2_PACKAGE_MPD_MPG123
+	bool "mpg123"
+	select BR2_PACKAGE_LIBID3TAG
+	select BR2_PACKAGE_MPG123
+	help
+	  Enable mpg123 input support.
+	  Select this if you want to play back MP3 files.
+	  mpg123 has better quality support (24-bit) but doesn't seek.
+
+config BR2_PACKAGE_MPD_MUSEPACK
+	bool "musepack"
+	select BR2_PACKAGE_LIBCUE
+	select BR2_PACKAGE_LIBREPLAYGAIN
+	select BR2_PACKAGE_MUSEPACK
+	help
+	  Enable musepack input support.
+	  Select this if you want to play back MPC files.
+
+config BR2_PACKAGE_MPD_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Enable sqlite database support.
+	  If you don't use sqlite it will use an ASCII database.
+
+config BR2_PACKAGE_MPD_TCP
+	bool "tcp sockets"
+	default y
+	help
+	  Enable mpd to listen on tcp sockets.
+
+	  You want this on if mpd and the client(s) work
+	  on different machines (the usual scenario).
+
+config BR2_PACKAGE_MPD_TREMOR
+	bool "tremor"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_TREMOR
+	help
+	  Enable vorbis input support.
+	  Select this if you want to play back OGG files.
+
+config BR2_PACKAGE_MPD_VORBIS
+	bool "vorbis"
+	select BR2_PACKAGE_LIBOGG
+	select BR2_PACKAGE_LIBVORBIS
+	help
+	  Enable vorbis input/streaming support.
+	  Select this if you want to play back OGG files. 
+
+config BR2_PACKAGE_MPD_WAVPACK
+	bool "wavpack"
+	select BR2_PACKAGE_WAVPACK
+	help
+	  Enable wavpack input support.
+	  Select this if you want to play back WV files.
+
+endif
+
+comment "mpd requires a toolchain with C++ and WCHAR support"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/multimedia/mpd/S95mpd b/package/multimedia/mpd/S95mpd
new file mode 100755
index 0000000..7c242f4
--- /dev/null
+++ b/package/multimedia/mpd/S95mpd
@@ -0,0 +1,30 @@
+#!/bin/sh
+
+start() {
+	echo -n "Starting mpd: "
+	start-stop-daemon --start --quiet --background --exec /usr/bin/mpd
+	echo "OK"
+}
+
+stop() {
+	echo -n "Stopping mpd: "
+	start-stop-daemon --stop --quiet --pidfile /var/run/mpd.pid
+	echo "OK"
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		stop
+		sleep 1
+		start
+		;;
+	*)
+		echo $"Usage: $0 {start|stop|restart}"
+		exit 1
+esac
diff --git a/package/multimedia/mpd/mpd.conf b/package/multimedia/mpd/mpd.conf
new file mode 100644
index 0000000..1a08ed0
--- /dev/null
+++ b/package/multimedia/mpd/mpd.conf
@@ -0,0 +1,32 @@
+#
+# Sample configuration file for mpd
+# This is a minimal configuration, see the manpage for more options
+#
+
+# Directory where the music is stored
+music_directory		"/var/lib/mpd/music"
+
+# Directory where user-made playlists are stored (RW)
+playlist_directory	"/mnt/mpd/playlists"
+
+# Database file (RW)
+db_file			"/var/lib/mpd/database"
+
+# Log file (RW)
+log_file		"/var/log/mpd.log"
+
+# Process ID file (RW)
+pid_file		"/var/run/mpd.pid"
+
+# State file (RW)
+state_file		"/var/lib/mpd/state"
+
+# User id to run the daemon as
+#user			"nobody"
+
+# TCP socket binding
+bind_to_address		"any"
+#bind_to_address	"localhost"
+
+# Unix socket to listen on
+bind_to_address		"/var/lib/mpd/socket"
diff --git a/package/multimedia/mpd/mpd.mk b/package/multimedia/mpd/mpd.mk
new file mode 100644
index 0000000..15fb215
--- /dev/null
+++ b/package/multimedia/mpd/mpd.mk
@@ -0,0 +1,85 @@
+#############################################################
+#
+# mpd
+#
+#############################################################
+
+MPD_VERSION = 0.16.1
+MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
+MPD_DEPENDENCIES = host-pkg-config libglib2
+
+# Config.in selects most options to make life easier and avoid guess work
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+MPD_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_LIBAO),y)
+MPD_DEPENDENCIES += libao
+endif
+
+ifeq ($(BR2_PACKAGE_MPD_BZIP2),y)
+MPD_DEPENDENCIES += bzip2
+MPD_CONF_OPT += --enable-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_FAAD2),y)
+MPD_DEPENDENCIES += faad2
+endif
+
+ifeq ($(BR2_PACKAGE_FLAC),y)
+MPD_DEPENDENCIES += flac
+endif
+
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+MPD_DEPENDENCIES += libcurl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
+MPD_DEPENDENCIES += libsamplerate
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
+MPD_DEPENDENCIES += libsndfile
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+MPD_DEPENDENCIES += libvorbis
+endif
+
+ifeq ($(BR2_PACKAGE_MPG123),y)
+MPD_DEPENDENCIES += libid3tag mpg123
+endif
+
+ifeq ($(BR2_PACKAGE_MUSEPACK),y)
+MPD_DEPENDENCIES += musepack
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+MPD_DEPENDENCIES += sqlite
+endif
+
+ifneq ($(BR2_PACKAGE_MPD_TCP),y)
+MPD_CONF_OPT += --disable-tcp
+endif
+
+ifeq ($(BR2_PACKAGE_TREMOR),y)
+MPD_DEPENDENCIES += tremor
+MPD_CONF_OPT += --with-tremor
+endif
+
+ifeq ($(BR2_PACKAGE_WAVPACK),y)
+MPD_DEPENDENCIES += wavpack
+endif
+
+define MPD_INSTALL_EXTRA_FILES
+	[ ! -f $(TARGET_DIR)/etc/mpd.conf ] && \
+		$(INSTALL) -D package/multimedia/mpd/mpd.conf \
+			$(TARGET_DIR)/etc/mpd.conf
+	$(INSTALL) -m 0755 -D package/multimedia/mpd/S95mpd \
+		$(TARGET_DIR)/etc/init.d/S95mpd
+endef
+
+MPD_POST_INSTALL_TARGET_HOOKS += MPD_INSTALL_EXTRA_FILES
+
+$(eval $(call AUTOTARGETS,package/multimedia,mpd))
-- 
1.7.3.4
