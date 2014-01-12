From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2014 21:18:01 +0100
Subject: [Buildroot] [git commit] vlc: new package
Message-ID: <20140112203643.0CFFB9C488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab5bdc09d21ff9bd6b10f844263c99fdca7518b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                         |    1 +
 package/vlc/Config.in                     |   15 ++
 package/vlc/vlc-0001-fix-link-error.patch |   28 ++++
 package/vlc/vlc.mk                        |  237 +++++++++++++++++++++++++++++
 4 files changed, 281 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 29e00eb..de1132b 100644
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
index 0000000..2335894
--- /dev/null
+++ b/package/vlc/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_VLC
+	bool "vlc"
+	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  VLC is a free and open source cross-platform multimedia player
+	  and framework that plays most multimedia files as well as DVD,
+	  Audio CD, VCD, and various streaming protocols.
+
+	  http://www.videolan.org/vlc/
+
+comment "vlc needs a uclibc snapshot or (e)glibc toolchain w/ largefile, wchar, threads"
+	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC) || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000..606be0e
--- /dev/null
+++ b/package/vlc/vlc.mk
@@ -0,0 +1,237 @@
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
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+VLC_CONF_OPT += --enable-alsa
+VLC_DEPENDENCIES += alsa-lib
+else
+VLC_CONF_OPT += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+VLC_CONF_OPT += --enable-bonjour
+VLC_DEPENDENCIES += avahi
+else
+VLC_CONF_OPT += --disable-bonjour
+endif
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+VLC_CONF_OPT += --enable-dbus
+VLC_DEPENDENCIES += dbus
+else
+VLC_CONF_OPT += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_DIRECTFB),y)
+VLC_CONF_OPT += --enable-directfb
+VLC_DEPENDENCIES += directfb
+else
+VLC_CONF_OPT += --disable-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_FAAD2),y)
+VLC_CONF_OPT += --enable-faad
+VLC_DEPENDENCIES += faad2
+else
+VLC_CONF_OPT += --disable-faad
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG),y)
+VLC_CONF_OPT += --enable-avcodec
+VLC_DEPENDENCIES += ffmpeg
+else
+VLC_CONF_OPT += --disable-avcodec
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
+VLC_CONF_OPT += --enable-postproc
+else
+VLC_CONF_OPT += --disable-postproc
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
+VLC_CONF_OPT += --enable-swscale
+else
+VLC_CONF_OPT += --disable-swscale
+endif
+
+ifeq ($(BR2_PACKAGE_FLAC),y)
+VLC_CONF_OPT += --enable-flac
+VLC_DEPENDENCIES += flac
+else
+VLC_CONF_OPT += --disable-flac
+endif
+
+ifeq ($(BR2_PACKAGE_OPUS),y)
+VLC_CONF_OPT += --enable-opus
+VLC_DEPENDENCIES += opus
+else
+VLC_CONF_OPT += --disable-opus
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+VLC_CONF_OPT += --enable-libgcrypt
+VLC_DEPENDENCIES += libgcrypt
+else
+VLC_CONF_OPT += --disable-libgcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMAD),y)
+VLC_CONF_OPT += --enable-mad
+VLC_DEPENDENCIES += libmad
+else
+VLC_CONF_OPT += --disable-mad
+endif
+
+ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
+VLC_CONF_OPT += --enable-libmpeg2
+VLC_DEPENDENCIES += libmpeg2
+else
+VLC_CONF_OPT += --disable-libmpeg2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+VLC_CONF_OPT += --enable-png
+VLC_DEPENDENCIES += libpng
+else
+VLC_CONF_OPT += --disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSVG),y)
+VLC_CONF_OPT += --enable-svg
+VLC_DEPENDENCIES += libsvg
+else
+VLC_CONF_OPT += --disable-svg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTHEORA),y)
+VLC_CONF_OPT += --enable-theora
+VLC_DEPENDENCIES += theora
+else
+VLC_CONF_OPT += --disable-theora
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+VLC_CONF_OPT += --enable-upnp
+VLC_DEPENDENCIES += libupnp
+else
+VLC_CONF_OPT += --disable-upnp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
+VLC_CONF_OPT += --enable-vorbis
+VLC_DEPENDENCIES += libvorbis
+else
+VLC_CONF_OPT += --disable-vorbis
+endif
+
+ifeq ($(BR2_PACKAGE_LIBV4L),y)
+VLC_CONF_OPT += --enable-v4l2
+VLC_DEPENDENCIES += libv4l
+else
+VLC_CONF_OPT += --disable-v4l2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXCB),y)
+VLC_CONF_OPT += --enable-xcb
+VLC_DEPENDENCIES += libxcb
+else
+VLC_CONF_OPT += --disable-xcb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+VLC_CONF_OPT += --enable-libxml2
+VLC_DEPENDENCIES += libxml2
+else
+VLC_CONF_OPT += --disable-libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_LIVE555),y)
+VLC_CONF_OPT += --enable-live555
+VLC_DEPENDENCIES += live555
+else
+VLC_CONF_OPT += --disable-live555
+endif
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+VLC_CONF_OPT += --enable-lua
+VLC_DEPENDENCIES += lua
+else
+VLC_CONF_OPT += --disable-lua
+endif
+
+ifeq ($(BR2_PACKAGE_QT),y)
+VLC_CONF_OPT += --enable-qt
+VLC_DEPENDENCIES += qt
+else
+VLC_CONF_OPT += --disable-qt
+endif
+
+ifeq ($(BR2_PACKAGE_SDL),y)
+VLC_CONF_OPT += --enable-sdl
+VLC_DEPENDENCIES += sdl
+else
+VLC_CONF_OPT += --disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_SDL_IMAGE),y)
+VLC_CONF_OPT += --enable-sdl-image
+VLC_DEPENDENCIES += sdl-image
+else
+VLC_CONF_OPT += --disable-sdl-image
+endif
+
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+VLC_CONF_OPT += --enable-speex
+VLC_DEPENDENCIES += speex
+else
+VLC_CONF_OPT += --disable-speex
+endif
+
+ifeq ($(BR2_PACKAGE_TREMOR),y)
+VLC_CONF_OPT += --enable-tremor
+VLC_DEPENDENCIES += tremor
+else
+VLC_CONF_OPT += --disable-tremor
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
+VLC_CONF_OPT += --with-x
+VLC_DEPENDENCIES += xlib_libX11
+else
+VLC_CONF_OPT += --without-x
+endif
+
+$(eval $(autotools-package))
