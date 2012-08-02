From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:56 -0000
Subject: [Buildroot] [git commit branch/next] package: add mediastreamer
Message-ID: <20120802195235.242A896AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdf093b7cef81cc9cbf8bdab3a7e2d88a02d611d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

It doesn't really need C++ support on Linux, but the configure script
checks for it (and fails if not available), and the package is not easy
to autoreconf as there's C++ source files for Android/Windows, causing
automake to fail if AC_PROG_CXX isn't set.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                      |    1 +
 package/mediastreamer/Config.in        |   16 +++++++
 package/mediastreamer/mediastreamer.mk |   77 ++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3e97ae5..dde5800 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -388,6 +388,7 @@ source "package/libogg/Config.in"
 source "package/libplayer/Config.in"
 source "package/libtheora/Config.in"
 source "package/live555/Config.in"
+source "package/mediastreamer/Config.in"
 endmenu
 
 menu "Networking"
diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
new file mode 100644
index 0000000..2e1af93
--- /dev/null
+++ b/package/mediastreamer/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_MEDIASTREAMER
+	bool "mediastreamer"
+	select BR2_PACKAGE_ORTP
+	depends on BR2_INSTALL_LIBSTDCPP # until fixed
+	help
+	  Mediastreamer is a powerful and lightweighted streaming
+	  engine specialized for voice/video telephony applications.
+
+	  It is the library that is responsible for all the receiving
+	  and sending of multimedia streams in linphone, including
+	  voice/video capture, encoding and decoding, and rendering.
+
+	  http://www.linphone.org/eng/documentation/dev/mediastreamer2.html
+
+comment "mediastreamer requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
new file mode 100644
index 0000000..bea6fb3
--- /dev/null
+++ b/package/mediastreamer/mediastreamer.mk
@@ -0,0 +1,77 @@
+MEDIASTREAMER_VERSION = 2.8.2
+MEDIASTREAMER_SITE = http://download.savannah.nongnu.org/releases/linphone/mediastreamer
+MEDIASTREAMER_INSTALL_STAGING = YES
+MEDIASTREAMER_DEPENDENCIES = host-pkg-config ortp
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+MEDIASTREAMER_CONF_OPT += --enable-alsa
+MEDIASTREAMER_DEPENDENCIES += alsa-lib
+else
+MEDIASTREAMER_CONF_OPT += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+MEDIASTREAMER_CONF_OPT += --enable-portaudio
+MEDIASTREAMER_DEPENDENCIES += portaudio
+else
+MEDIASTREAMER_CONF_OPT += --disable-portaudio
+endif
+
+ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
+MEDIASTREAMER_CONF_OPT += --enable-pulseaudio
+MEDIASTREAMER_DEPENDENCIES += pulseaudio
+else
+MEDIASTREAMER_CONF_OPT += --disable-pulseaudio
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+MEDIASTREAMER_CONF_OPT += --enable-speex
+MEDIASTREAMER_DEPENDENCIES += speex
+else
+MEDIASTREAMER_CONF_OPT += --disable-speex
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
+MEDIASTREAMER_CONF_OPT += --enable-ffmpeg
+MEDIASTREAMER_DEPENDENCIES += ffmpeg
+else
+MEDIASTREAMER_CONF_OPT += --disable-ffmpeg
+endif
+
+ifeq ($(BR2_PACKAGE_SDL),y)
+MEDIASTREAMER_CONF_OPT += --enable-sdl
+MEDIASTREAMER_DEPENDENCIES += sdl
+else
+MEDIASTREAMER_CONF_OPT += --disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+MEDIASTREAMER_CONF_OPT += --enable-x11
+MEDIASTREAMER_DEPENDENCIES += xlib_libX11
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
+MEDIASTREAMER_CONF_OPT += --enable-xv
+MEDIASTREAMER_DEPENDENCIES += xlib_libXv
+else
+MEDIASTREAMER_CONF_OPT += --disable-xv
+endif
+
+else
+MEDIASTREAMER_CONF_OPT += --disable-x11
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
+MEDIASTREAMER_CONF_OPT += --enable-theora
+MEDIASTREAMER_DEPENDENCIES += libtheora
+else
+MEDIASTREAMER_CONF_OPT += --disable-theora
+endif
+
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+MEDIASTREAMER_CONF_OPT += --enable-libv4l1 --enable-libv4l2
+MEDIASTREAMER_DEPENDENCIES += libv4l
+else
+MEDIASTREAMER_CONF_OPT += --disable-libv4l1 --disable-libv4l2
+endif
+
+$(eval $(call AUTOTARGETS))
