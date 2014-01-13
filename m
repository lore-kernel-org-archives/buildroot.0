From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:22:17 +0100
Subject: [Buildroot] [git commit] mpd: bump to version 0.18.7
Message-ID: <20140113222409.1A0C39C4A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1753c3bf2aaad284cf92aaddab4e250b50949d5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mpd/Config.in |   15 +++++++++++++++
 package/mpd/S95mpd    |   12 ++++++++----
 package/mpd/mpd.mk    |   18 +++++++++++++++---
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 62bdfa7..5a03a62 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -4,6 +4,8 @@ menuconfig BR2_PACKAGE_MPD
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on !(BR2_avr32 || BR2_sparc) # gcc too old
+	depends on !BR2_UCLIBC_VERSION_0_9_32 # lacks signalfd
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_MPD_TREMOR if !(BR2_PACKAGE_MPD_MAD || BR2_PACKAGE_MPD_MPG123 || BR2_PACKAGE_MPD_VORBIS || BR2_PACKAGE_MPD_WAVPACK || BR2_PACKAGE_MPD_FLAC || BR2_PACKAGE_MPD_MUSEPACK || BR2_PACKAGE_MPD_FFMPEG)
@@ -142,6 +144,19 @@ config BR2_PACKAGE_MPD_MUSEPACK
 	  Enable musepack input support.
 	  Select this if you want to play back MPC files.
 
+config BR2_PACKAGE_MPD_OPUS
+	bool "opus"
+	select BR2_PACKAGE_OPUS
+	help
+	  Enable opus input support.
+	  Select this if you want to play back OPUS encoded files.
+
+config BR2_PACKAGE_MPD_SOUNDCLOUD
+	bool "soundcloud"
+	select BR2_PACKAGE_YAJL
+	help
+	  Enable soundcloud.com playlist support.
+
 config BR2_PACKAGE_MPD_SQLITE
 	bool "sqlite"
 	select BR2_PACKAGE_SQLITE
diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index a4f1271..f25135d 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -1,15 +1,19 @@
 #!/bin/sh
 
+# Sanity checks
+test -f /usr/bin/mpd || exit 0
+test -f /etc/mpd.conf || exit 0
+
 start() {
 	echo -n "Starting mpd: "
-	start-stop-daemon --start --quiet --background --exec /usr/bin/mpd
-	echo "OK"
+	start-stop-daemon --start --quiet --background --exec /usr/bin/mpd \
+		&& echo "OK" || echo "FAIL"
 }
 
 stop() {
 	echo -n "Stopping mpd: "
-	start-stop-daemon --stop --quiet --pidfile /var/run/mpd.pid
-	echo "OK"
+	start-stop-daemon --stop --quiet --pidfile /var/run/mpd.pid \
+		&& echo "OK" || echo "FAIL"
 }
 
 case "$1" in
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 4367cae..4a7926c 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.17
-MPD_VERSION = $(MPD_VERSION_MAJOR).6
+MPD_VERSION_MAJOR = 0.18
+MPD_VERSION = $(MPD_VERSION_MAJOR).7
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf libglib2
-MPD_LICENSE = GPLv2
+MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 
 # Some options need an explicit --disable or --enable
@@ -82,6 +82,12 @@ else
 MPD_CONF_OPT += --disable-sndfile
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
+MPD_DEPENDENCIES += opus
+else
+MPD_CONF_OPT += --disable-opus
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_VORBIS),y)
 MPD_DEPENDENCIES += libvorbis
 else
@@ -100,6 +106,12 @@ else
 MPD_CONF_OPT += --disable-mpc
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
+MPD_DEPENDENCIES += yajl
+else
+MPD_CONF_OPT += --disable-soundcloud
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
 MPD_DEPENDENCIES += sqlite
 else
