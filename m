From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  6 Jan 2014 22:09:02 +0000
Subject: [Buildroot] [PATCH] vlc: new package
Message-ID: <1389046142-12472-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                         |   1 +
 package/vlc/Config.in                     |  12 ++
 package/vlc/vlc-0001-fix-link-error.patch |  28 ++++
 package/vlc/vlc.mk                        | 231 ++++++++++++++++++++++++++++++
 4 files changed, 272 insertions(+)
 create mode 100644 package/vlc/Config.in
 create mode 100644 package/vlc/vlc-0001-fix-link-error.patch
 create mode 100644 package/vlc/vlc.mk

diff --git a/package/Config.in b/package/Config.in
index e502cde..02097ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -23,6 +23,7 @@ source "package/opus-tools/Config.in"
 source "package/pulseaudio/Config.in"
 source "package/tidsp-binaries/Config.in"
 source "package/tstools/Config.in"
+source "package/vlc/Config.in"
 source "package/vorbis-tools/Config.in"
 source "package/wavpack/Config.in"
 source "package/yavta/Config.in"
diff --git a/package/vlc/Config.in b/package/vlc/Config.in
new file mode 100644
index 0000000..83576e9
--- /dev/null
+++ b/package/vlc/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_VLC
+	bool "vlc"
+	depends on BR2_TOOLCHAIN_USES_GLIBC # spawn.h
+	help
+	  VLC is a free and open source cross-platform multimedia player
+	  and framework that plays most multimedia files as well as DVD,
+	  Audio CD, VCD, and various streaming protocols.
+
+	  http://www.videolan.org/vlc/
+
+comment "vlc needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/vlc/vlc-0001-fix-link-error.patch b/package/vlc/vlc-0001-fix-link-error.patch
new file mode 100644
index 0000000..0acae8f
--- /dev/null
+++ b/package/vlc/vlc-0001-fix-link-error.patch
@@ -0,0 +1,28 @@
+Fix a link error.
+
+Signed-off-by: Simon Dawson <spdawson@gmail.com>
+
+diff -Nurp a/bin/Makefile.am b/bin/Makefile.am
+--- a/bin/Makefile.am	2013-12-03 09:12:34.000000000 +0000
++++ b/bin/Makefile.am	2014-01-06 22:03:34.888581851 +0000
+@@ -44,7 +44,7 @@ vlc_static_CFLAGS = $(AM_CFLAGS) \
+ 	-DTOP_SRCDIR=\"$$(cd "$(top_srcdir)"; pwd)\" \
+ 	$(NULL)
+ vlc_static_DEPENDENCIES = $(vlc_DEPENDENCIES)
+-vlc_static_LDADD = $(vlc_LDADD)
++vlc_static_LDADD = $(vlc_LDADD) ../compat/libcompat.la
+ vlc_static_LDFLAGS = $(vlc_LDFLAGS)
+ 
+ if HAVE_WIN32
+diff -Nurp a/bin/Makefile.in b/bin/Makefile.in
+--- a/bin/Makefile.in	2013-12-07 16:17:01.000000000 +0000
++++ b/bin/Makefile.in	2014-01-06 22:04:10.888444978 +0000
+@@ -1049,7 +1049,7 @@ vlc_static_CFLAGS = $(AM_CFLAGS) \
+ 	$(NULL)
+ 
+ vlc_static_DEPENDENCIES = $(vlc_DEPENDENCIES)
+-vlc_static_LDADD = $(vlc_LDADD)
++vlc_static_LDADD = $(vlc_LDADD) ../compat/libcompat.la
+ vlc_static_LDFLAGS = $(vlc_LDFLAGS) $(am__append_7)
+ @HAVE_WIN32_TRUE at vlc_DEPENDENCIES = vlc_win32_rc.$(OBJEXT)
+ vlc_cache_gen_SOURCES = cachegen.c
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
new file mode 100644
index 0000000..1958f87
--- /dev/null
+++ b/package/vlc/vlc.mk
@@ -0,0 +1,231 @@
+################################################################################
+#
+# vlc
+#
+################################################################################
+
+VLC_VERSION = 2.1.2
+VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
+VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
+VLC_LICENSE = GPLv2+ LGPLv2.1+
+VLC_LICENSE_FILES = COPYING COPYING.LIB
+
+VLC_CONF_OPT += \
+	--disable-a52 \
+	--disable-shout \
+	--disable-mod \
+	--disable-faad \
+	--disable-twolame \
+	--disable-dca \
+	--disable-dirac \
+	--disable-schroedinger \
+	--disable-quicksync \
+	--disable-fluidsynth \
+	--disable-zvbi \
+	--disable-libass \
+	--disable-kate \
+	--disable-caca \
+	--disable-jack \
+	--disable-samplerate \
+	--disable-chromaprint \
+	--disable-goom \
+	--disable-projectm \
+	--disable-vsxu \
+	--disable-udev \
+	--disable-mtp
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),)
+VLC_CONF_OPT += --disable-alsa
+else
+VLC_CONF_OPT += --enable-alsa
+VLC_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_AVAHI),)
+VLC_CONF_OPT += --disable-bonjour
+else
+VLC_CONF_OPT += --enable-bonjour
+VLC_DEPENDENCIES += avahi
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),)
+VLC_CONF_OPT += --disable-dbus
+else
+VLC_CONF_OPT += --enable-dbus
+VLC_DEPENDENCIES += dbus
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB),)
+VLC_CONF_OPT += --disable-directfb
+else
+VLC_CONF_OPT += --enable-directfb
+VLC_DEPENDENCIES += directfb
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG),)
+VLC_CONF_OPT += --disable-avcodec
+else
+VLC_CONF_OPT += --enable-avcodec
+VLC_DEPENDENCIES += ffmpeg
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),)
+VLC_CONF_OPT += --disable-postproc
+else
+VLC_CONF_OPT += --enable-postproc
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),)
+VLC_CONF_OPT += --disable-swscale
+else
+VLC_CONF_OPT += --enable-swscale
+endif
+
+ifeq ($(BR2_PACKAGE_FLAC),)
+VLC_CONF_OPT += --disable-flac
+else
+VLC_CONF_OPT += --enable-flac
+VLC_DEPENDENCIES += flac
+endif
+
+ifeq ($(BR2_PACKAGE_OPUS),)
+VLC_CONF_OPT += --disable-opus
+else
+VLC_CONF_OPT += --enable-opus
+VLC_DEPENDENCIES += opus
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),)
+VLC_CONF_OPT += --disable-libgcrypt
+else
+VLC_CONF_OPT += --enable-libgcrypt
+VLC_DEPENDENCIES += libgcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMAD),)
+VLC_CONF_OPT += --disable-mad
+else
+VLC_CONF_OPT += --enable-mad
+VLC_DEPENDENCIES += libmad
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMPEG2),)
+VLC_CONF_OPT += --disable-libmpeg2
+else
+VLC_CONF_OPT += --enable-libmpeg2
+VLC_DEPENDENCIES += libmpeg2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),)
+VLC_CONF_OPT += --disable-png
+else
+VLC_CONF_OPT += --enable-png
+VLC_DEPENDENCIES += libpng
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSVG),)
+VLC_CONF_OPT += --disable-svg
+else
+VLC_CONF_OPT += --enable-svg
+VLC_DEPENDENCIES += libsvg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTHEORA),)
+VLC_CONF_OPT += --disable-theora
+else
+VLC_CONF_OPT += --enable-theora
+VLC_DEPENDENCIES += theora
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUPNP),)
+VLC_CONF_OPT += --disable-upnp
+else
+VLC_CONF_OPT += --enable-upnp
+VLC_DEPENDENCIES += libupnp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),)
+VLC_CONF_OPT += --disable-vorbis
+else
+VLC_CONF_OPT += --enable-vorbis
+VLC_DEPENDENCIES += libvorbis
+endif
+
+ifeq ($(BR2_PACKAGE_LIBV4L),)
+VLC_CONF_OPT += --disable-v4l2
+else
+VLC_CONF_OPT += --enable-v4l2
+VLC_DEPENDENCIES += libv4l
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXCB),)
+VLC_CONF_OPT += --disable-xcb
+else
+VLC_CONF_OPT += --enable-xcb
+VLC_DEPENDENCIES += libxcb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),)
+VLC_CONF_OPT += --disable-libxml2
+else
+VLC_CONF_OPT += --enable-libxml2
+VLC_DEPENDENCIES += libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_LIVE555),)
+VLC_CONF_OPT += --disable-live555
+else
+VLC_CONF_OPT += --disable-live555
+VLC_DEPENDENCIES += live555
+endif
+
+ifeq ($(BR2_PACKAGE_LUA),)
+VLC_CONF_OPT += --disable-lua
+else
+VLC_CONF_OPT += --disable-lua
+VLC_DEPENDENCIES += lua
+endif
+
+ifeq ($(BR2_PACKAGE_QT),)
+VLC_CONF_OPT += --disable-qt
+else
+VLC_CONF_OPT += --disable-qt
+VLC_DEPENDENCIES += qt
+endif
+
+ifeq ($(BR2_PACKAGE_SDL),)
+VLC_CONF_OPT += --disable-sdl
+else
+VLC_CONF_OPT += --disable-sdl
+VLC_DEPENDENCIES += sdl
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE),)
+VLC_CONF_OPT += --disable-sdl-image
+else
+VLC_CONF_OPT += --disable-sdl-image
+VLC_DEPENDENCIES += sdl-image
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),)
+VLC_CONF_OPT += --disable-speex
+else
+VLC_CONF_OPT += --enable-speex
+VLC_DEPENDENCIES += speex
+endif
+
+ifeq ($(BR2_PACKAGE_TREMOR),)
+VLC_CONF_OPT += --disable-tremor
+else
+VLC_CONF_OPT += --enable-tremor
+VLC_DEPENDENCIES += tremor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),)
+VLC_CONF_OPT += --without-x
+else
+VLC_CONF_OPT += --with-x
+VLC_DEPENDENCIES += xlib_libX11
+endif
+
+$(eval $(autotools-package))
-- 
1.8.3.2
