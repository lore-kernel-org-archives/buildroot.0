From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 19 Mar 2013 14:05:26 +0400
Subject: [Buildroot] [PATCH] vlc: new package
Message-ID: <1363687526-8469-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Alexey Brodkin <alexey.brodkin@synopsys.com>

Based on "[PATCHv6] vlc: New package" found here http://patchwork.ozlabs.org/patch/171335/

Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
Signed-off-by: Alexey Brodkin <alexey.brodkin@synopsys.com>
---
 package/multimedia/Config.in                  |    1 +
 package/multimedia/vlc/Config.in              |  305 ++++++++++++++++++++
 package/multimedia/vlc/vlc-uclibc-fixes.patch |   27 ++
 package/multimedia/vlc/vlc.mk                 |  372 +++++++++++++++++++++++++
 4 files changed, 705 insertions(+)
 create mode 100644 package/multimedia/vlc/Config.in
 create mode 100644 package/multimedia/vlc/vlc-uclibc-fixes.patch
 create mode 100644 package/multimedia/vlc/vlc.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 931e6d3..00f2ac2 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -23,6 +23,7 @@ source "package/multimedia/musepack/Config.in"
 source "package/opus-tools/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
+source "package/multimedia/vlc/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
 source "package/multimedia/wavpack/Config.in"
 source "package/yavta/Config.in"
diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
new file mode 100644
index 0000000..bf81d5b
--- /dev/null
+++ b/package/multimedia/vlc/Config.in
@@ -0,0 +1,305 @@
+menuconfig BR2_PACKAGE_VLC
+	bool "vlc"
+	select BR2_PACKAGE_ZLIB
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
+	help
+	  VLC is a free and open source cross-platform multimedia player and
+	  framework that plays most multimedia files as well as DVD, Audio CD,
+	  VCD, and various streaming protocols.
+
+	  http://www.videolan.org/vlc/
+
+
+if BR2_PACKAGE_VLC
+
+config BR2_PACKAGE_VLC_LOWMEM
+       bool "Optimize memory usage over performance"
+
+config BR2_PACKAGE_VLC_SOUT
+       bool "Enable streaming output"
+
+config BR2_PACKAGE_VLC_HTTPD
+       bool "Enable built-in HTTP server"
+
+config BR2_PACKAGE_VLC_VLM
+       bool "Enable stream manager (VLM)"
+
+config BR2_PACKAGE_VLC_SCREEN
+       bool "Screen capture support"
+
+comment "Audio output"
+
+config BR2_PACKAGE_VLC_ALSA
+       bool "ALSA support"
+       select BR2_PACKAGE_ALSA_LIB
+
+config BR2_PACKAGE_VLC_OSS
+       bool "OSS support"
+
+config BR2_PACKAGE_VLC_PULSE
+       bool "PulseAudio support"
+       select BR2_PACKAGE_PULSEAUDIO
+       depends on BR2_USE_WCHAR # pulseaudio
+
+comment "PulseAudio support requires a toolchain with WCHAR support"
+       depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_VLC_SAMPLERATE
+       bool "Audio resampling support"
+       select BR2_PACKAGE_LIBSAMPLERATE
+
+comment "Video output"
+
+if BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_VLC_XCB
+       bool "XCB support"
+       select BR2_PACKAGE_LIBXCB
+       select BR2_PACKAGE_XCB_PROTO
+
+config BR2_PACKAGE_VLC_LIBX11
+       bool "Xlib support"
+       select BR2_PACKAGE_XLIB_LIBX11
+
+config BR2_PACKAGE_VLC_XV
+       bool "XVideo support (XCB)"
+       select BR2_PACKAGE_LIBXCB
+       select BR2_PACKAGE_XCB_PROTO
+       select BR2_PACKAGE_XPROTO_VIDEOPROTO
+
+config BR2_PACKAGE_VLC_GLX
+       bool "OpenGL (XCB GLX)"
+       select BR2_PACKAGE_LIBXCB
+       select BR2_PACKAGE_XCB_PROTO
+       select BR2_PACKAGE_XPROTO_GLPROTO
+
+endif # BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_VLC_DIRECTFB
+       bool "DirectFB support"
+       select BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_VLC_SDL
+       bool "SDL support"
+       select BR2_PACKAGE_SDL
+
+config BR2_PACKAGE_VLC_SDL_IMAGE
+       bool "SDL-image support"
+       depends on BR2_PACKAGE_VLC_SDL
+       select BR2_PACKAGE_SDL_IMAGE
+
+config BR2_PACKAGE_VLC_FREETYPE
+       bool "FreeType support (for subtitles)"
+       select BR2_PACKAGE_FREETYPE
+
+config BR2_PACKAGE_VLC_FONTCONFIG
+       bool "fontconfig support"
+       depends on BR2_PACKAGE_VLC_FREETYPE
+       select BR2_PACKAGE_FONTCONFIG
+
+comment "Codecs"
+
+config BR2_PACKAGE_VLC_FAAD
+       bool "MPEG AAC"
+       select BR2_PACKAGE_FAAD2
+
+config BR2_PACKAGE_VLC_MAD
+       bool "MAD (Fixed-point, MPEG audio)"
+       select BR2_PACKAGE_LIBMAD
+
+config BR2_PACKAGE_VLC_TREMOR
+       bool "Tremor (Fixed-point, Vorbis)"
+       select BR2_PACKAGE_TREMOR
+
+config BR2_PACKAGE_VLC_AVCODEC
+       bool "FFmpeg (Many codecs)"
+       depends on BR2_LARGEFILE
+       depends on BR2_INET_IPV6
+       select BR2_PACKAGE_FFMPEG
+       help
+         There is a large number of codecs in FFmpeg/libavcodec.
+
+         To avoid duplication, select either the FFmpeg or the vlc
+         implementation for each codec, not both.
+
+if BR2_PACKAGE_VLC_AVCODEC
+
+config BR2_PACKAGE_VLC_POSTPROC
+       bool "Post-processing support"
+       select BR2_PACKAGE_FFMPEG_POSTPROC
+
+config BR2_PACKAGE_VLC_SWSCALE
+       bool "Software scaling support"
+       select BR2_PACKAGE_FFMPEG_SWSCALE
+
+endif # BR2_PACKAGE_VLC_AVCODEC
+
+config BR2_PACKAGE_VLC_LIBMPEG2
+       bool "MPEG-1/2 (libmpeg2)"
+       select BR2_PACKAGE_LIBMPEG2
+
+config BR2_PACKAGE_VLC_VORBIS
+       bool "Vorbis (Floating-point)"
+       select BR2_PACKAGE_LIBVORBIS
+
+config BR2_PACKAGE_VLC_THEORA
+       bool "Theora"
+       select BR2_PACKAGE_LIBTHEORA
+
+config BR2_PACKAGE_VLC_SPEEX
+       bool "Speex"
+       select BR2_PACKAGE_SPEEX
+
+config BR2_PACKAGE_VLC_FLAC
+       bool "FLAC"
+       select BR2_PACKAGE_FLAC
+
+config BR2_PACKAGE_VLC_PNG
+       bool "PNG support"
+       select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_VLC_SVG
+       bool "SVG support"
+       select BR2_PACKAGE_LIBRSVG
+
+comment "Container formats"
+
+config BR2_PACKAGE_VLC_OGG
+       bool "Ogg"
+       select BR2_PACKAGE_LIBOGG
+
+config BR2_PACKAGE_VLC_MUX_OGG
+       bool "Ogg mux support"
+       depends on BR2_PACKAGE_VLC_OGG
+
+comment "Input devices"
+
+config BR2_PACKAGE_VLC_VCD
+       bool "Built-in VCD and CD-DA support"
+
+config BR2_PACKAGE_VLC_DVD
+       bool "DVD support"
+       select BR2_PACKAGE_LIBDVDREAD
+
+config BR2_PACKAGE_VLC_DVDNAV
+       bool "DVD Navigation support"
+       depends on BR2_PACKAGE_VLC_DVD
+       select BR2_PACKAGE_LIBDVDNAV
+
+config BR2_PACKAGE_VLC_OPENCV
+       bool "OpenCV (Computer Vision) support"
+       select BR2_PACKAGE_OPENCV
+
+comment "Transport protocols"
+
+config BR2_PACKAGE_VLC_GVFS
+       bool "Gnome VFS support"
+       select BR2_PACKAGE_GVFS
+       depends on BR2_LARGEFILE && BR2_USE_WCHAR # gvfs
+
+comment "Gnome VFS support requires a toolchain with LARGEFILE and WCHAR support"
+       depends on !BR2_LARGEFILE || !BR2_USE_WCHAR
+
+config BR2_PACKAGE_VLC_V4L2
+       bool "Video4Linux 2 support"
+       select BR2_PACKAGE_LIBV4L
+       depends on BR2_LARGEFILE
+
+comment "Video4Linux 2 support requires a toolchain with LARGEFILE support"
+       depends on !BR2_LARGEFILE
+
+config BR2_PACKAGE_VLC_PVR
+       bool "Support PVR Video4Linux 2 cards"
+       depends on BR2_PACKAGE_VLC_V4L2
+
+config BR2_PACKAGE_VLC_LIVE555
+       bool "Sreaming support (RTP/RTCP, RTSP, SIP)"
+       select BR2_PACKAGE_LIVE555
+
+config BR2_PACKAGE_VLC_SMB
+       bool "Samba support (SMB/CIFS)"
+       select BR2_PACKAGES_SAMBA
+
+comment "Video filters and Visualization"
+
+config BR2_PACKAGE_VLC_VISUAL
+       bool "Visualization plugin"
+
+config BR2_PACKAGE_VLC_ATMO
+       bool "AtmoLight (homemade Philips Ambilight clone)"
+
+comment "Misc. options"
+
+config BR2_PACKAGE_VLC_MEDIALIB
+       bool "VLC Media Library"
+
+config BR2_PACKAGE_VLC_TAGLIB
+       bool "TagLib support"
+       select BR2_PACKAGE_TAGLIB
+
+config BR2_PACKAGE_VLC_DBUS
+       bool "DBus support"
+       select BR2_PACKAGE_DBUS
+
+config BR2_PACKAGE_VLC_LIBGCRYPT
+       bool "libgcrypt support"
+       select BR2_PACKAGE_LIBGCRYPT
+
+config BR2_PACKAGE_VLC_GNUTLS
+       bool "TLS/SSL support (using GnuTLS)"
+       select BR2_PACKAGE_GNUTLS
+
+config BR2_PACKAGE_VLC_SQLITE
+       bool "SQLite support"
+       select BR2_PACKAGE_SQLITE
+
+config BR2_PACKAGE_VLC_LUA
+       bool "Lua scripting support"
+       select BR2_PACKAGE_LUA
+
+config BR2_PACKAGE_VLC_LIBXML2
+       bool "libxml2 support"
+       select BR2_PACKAGE_LIBXML2
+
+comment "Service discovery"
+
+config BR2_PACKAGE_VLC_BONJOUR
+       bool "Bonjour / Avahi support"
+       select BR2_PACKAGE_AVAHI
+
+config BR2_PACKAGE_VLC_UDEV
+       bool "Udev support"
+       depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
+
+config BR2_PACKAGE_VLC_UPNP
+       bool "Universal Plug and Play support (UPNP)"
+       select BR2_PACKAGE_LIBUPNP
+
+comment "Interface"
+
+config BR2_PACKAGE_VLC_FRONTEND
+	bool "Build and install frontend binary"
+	default y
+	help
+	  This will install the video player.
+
+if BR2_PACKAGE_VLC_FRONTEND
+
+config BR2_PACKAGE_VLC_QT4
+       bool "QT4-based interface"
+       depends on BR2_PACKAGE_QT_GUI_X11
+
+config BR2_PACKAGE_VLC_NCURSES
+       bool "Ncurses text-based interface"
+       select BR2_PACKAGE_NCURSES
+
+config BR2_PACKAGE_VLC_XOSD
+       bool "X On Screen Display"
+       depends on BR2_PACKAGE_VLC_LIBX11
+
+config BR2_PACKAGE_VLC_FBOSD
+       bool "Framebuffer On Screen Display"
+
+endif # BR2_PACKAGE_VLC_FRONTEND
+endif # BR2_PACKAGE_VLC
diff --git a/package/multimedia/vlc/vlc-uclibc-fixes.patch b/package/multimedia/vlc/vlc-uclibc-fixes.patch
new file mode 100644
index 0000000..28e17a9
--- /dev/null
+++ b/package/multimedia/vlc/vlc-uclibc-fixes.patch
@@ -0,0 +1,27 @@
+Fixes compilation with uClibc, which doesn't provide gnu/libc-version.h nor
+gnu_get_libc_version.
+
+Upstream Status: Rejected
+
+Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
+
+diff -u a/src/posix/linux_specific.c b/src/posix/linux_specific.c
+--- a/src/posix/linux_specific.c	2012-02-08 16:43:30.000000000 -0200
++++ b/src/posix/linux_specific.c	2012-02-09 03:51:20.925504594 -0200
+@@ -74,14 +74,14 @@
+     return (path != NULL) ? path : strdup (PKGLIBDIR);
+ }
+ 
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+ # include <gnu/libc-version.h>
+ # include <stdlib.h>
+ #endif
+ 
+ void system_Init (void)
+ {
+-#ifdef __GLIBC__
++#if defined(__GLIBC__) && !defined(__UCLIBC__)
+     const char *glcv = gnu_get_libc_version ();
+ 
+     /* gettext in glibc 2.5-2.7 is not thread-safe. LibVLC keeps crashing,
diff --git a/package/multimedia/vlc/vlc.mk b/package/multimedia/vlc/vlc.mk
new file mode 100644
index 0000000..6a0d4ce
--- /dev/null
+++ b/package/multimedia/vlc/vlc.mk
@@ -0,0 +1,372 @@
+#############################################################
+#
+# vlc
+#
+#############################################################
+VLC_VERSION = 2.0.0
+VLC_SOURCE= vlc-$(VLC_VERSION).tar.xz
+VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
+VLC_LICENSE = GPLv2
+VLC_LICENSE_FILES = COPYING
+VLC_DEPENDENCIES = zlib
+
+VLC_CONF_OPT += --disable-rpath --enable-run-as-root \
+		--disable-a52 \
+		--disable-jack \
+		--disable-mkv \
+		--disable-x264 \
+		--disable-libass \
+		--disable-crystalhd \
+		--disable-libva \
+		--disable-dca \
+		--disable-vcdx \
+		--disable-lirc \
+		--disable-goom \
+		--disable-projectm \
+		--disable-libcddb \
+		--disable-dc1394 \
+		--disable-bluray
+
+VLC_CFLAGS = $(TARGET_CFLAGS)
+VLC_CFLAGS += -std=gnu99
+
+ifeq ($(BR2_PACKAGE_VLC_ALSA),y)
+VLC_DEPENDENCIES += alsa-lib
+VLC_CONF_OPT += --enable-alsa
+else
+VLC_CONF_OPT += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_DIRECTFB),y)
+VLC_CONF_OPT += --enable-directfb
+VLC_DEPENDENCIES += directfb
+else
+VLC_CONF_OPT += --disable-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SDL),y)
+VLC_CONF_OPT += --enable-sdl
+VLC_DEPENDENCIES += sdl
+else
+VLC_CONF_OPT += --disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SDL_IMAGE),y)
+VLC_CONF_OPT += --enable-sdl-image
+VLC_DEPENDENCIES += sdl_image
+else
+VLC_CONF_OPT += --disable-sdl-image
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_MAD),y)
+VLC_CONF_OPT += --enable-mad
+VLC_DEPENDENCIES += libmad
+else
+VLC_CONF_OPT += --disable-mad
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_TREMOR),y)
+VLC_DEPENDENCIES += tremor
+VLC_CONF_OPT += --enable-tremor
+else
+VLC_CONF_OPT += --disable-tremor
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_PNG),y)
+VLC_DEPENDENCIES += libpng
+VLC_CONF_OPT += --enable-png
+else
+VLC_CONF_OPT += --disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_AVCODEC),y)
+VLC_DEPENDENCIES += ffmpeg
+VLC_CONF_OPT += --enable-avcodec --enable-avformat
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_POSTPROC),en,dis)able-postproc
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_SWSCALE),en,dis)able-swscale
+else
+VLC_CONF_OPT += $(foreach i,avcodec avformat postproc swscale,--disable-$i)
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_DBUS),y)
+VLC_DEPENDENCIES += dbus
+VLC_CONF_OPT += --enable-dbus
+else
+VLC_CONF_OPT += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIBGCRYPT),y)
+VLC_DEPENDENCIES += libgcrypt
+VLC_CONF_OPT += --enable-libgcrypt
+else
+VLC_CONF_OPT += --disable-libgcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_V4L2),y)
+VLC_DEPENDENCIES += libv4l
+VLC_CONF_OPT += --enable-libv4l2
+else
+VLC_CONF_OPT += --disable-libv4l2
+endif
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+VLC_DEPENDENCIES += lua
+VLC_CONF_OPT += --enable-lua
+else
+VLC_CONF_OPT += --disable-lua
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_XCB),y)
+VLC_DEPENDENCIES += libxcb
+VLC_CONF_OPT += --enable-xcb
+else
+VLC_CONF_OPT += --disable-xcb
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIVE555),y)
+VLC_DEPENDENCIES += live555
+VLC_CONF_OPT += --enable-live555
+else
+VLC_CONF_OPT += --disable-live555
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIBX11),y)
+VLC_DEPENDENCIES += xlib_libX11
+VLC_CONF_OPT += --with-x
+else
+VLC_CONF_OPT += --without-x
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_QT4),y)
+VLC_DEPENDENCIES += qt
+VLC_CONF_OPT += --enable-qt4
+else
+VLC_CONF_OPT += --disable-qt4
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_VORBIS),y)
+VLC_DEPENDENCIES += libvorbis
+VLC_CONF_OPT += --enable-vorbis
+else
+VLC_CONF_OPT += --disable-vorbis
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_THEORA),y)
+VLC_DEPENDENCIES += libtheora
+VLC_CONF_OPT += --enable-theora
+else
+VLC_CONF_OPT += --disable-theora
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SPEEX),y)
+VLC_DEPENDENCIES += speex
+VLC_CONF_OPT += --enable-speex
+else
+VLC_CONF_OPT += --disable-speex
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_FLAC),y)
+VLC_DEPENDENCIES += flac
+VLC_CONF_OPT += --enable-flac
+else
+VLC_CONF_OPT += --disable-flac
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_XV),y)
+VLC_DEPENDENCIES += libxcb xcb-proto xproto_videoproto
+VLC_CONF_OPT += --enable-xvideo
+else
+VLC_CONF_OPT += --disable-xvideo
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_FREETYPE),y)
+VLC_DEPENDENCIES += freetype
+VLC_CONF_OPT += --enable-freetype
+else
+VLC_CONF_OPT += --disable-freetype
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_FAAD),y)
+VLC_DEPENDENCIES += faad2
+VLC_CONF_OPT += --enable-faad
+else
+VLC_CONF_OPT += --disable-faad
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SVG),y)
+VLC_DEPENDENCIES += librsvg
+VLC_CONF_OPT += --enable-svg
+else
+VLC_CONF_OPT += --disable-svg
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_OGG),y)
+VLC_DEPENDENCIES += libogg
+VLC_CONF_OPT += --enable-ogg
+else
+VLC_CONF_OPT += --disable-ogg
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_MUX_OGG),y)
+VLC_CONF_OPT += --enable-mux_ogg
+else
+VLC_CONF_OPT += --disable-mux_ogg
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_GLX),y)
+VLC_DEPENDENCIES += libxcb xcb-proto xproto_glproto
+VLC_CONF_OPT += --enable-glx
+else
+VLC_CONF_OPT += --disable-glx
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SQLITE),y)
+VLC_DEPENDENCIES += sqlite
+VLC_CONF_OPT += --enable-sqlite
+else
+VLC_CONF_OPT += --disable-sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_NCURSES),y)
+VLC_DEPENDENCIES += ncurses
+VLC_CONF_OPT += --enable-ncurses
+else
+VLC_CONF_OPT += --disable-ncurses
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_GVFS),y)
+VLC_DEPENDENCIES += gvfs
+VLC_CONF_OPT += --enable-gnomevfs
+else
+VLC_CONF_OPT += --disable-gnomevfs
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_DVD),y)
+VLC_DEPENDENCIES += libdvdread
+VLC_CONF_OPT += --enable-dvdread
+else
+VLC_CONF_OPT += --disable-dvdread
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_DVDNAV),y)
+VLC_DEPENDENCIES += libdvdnav
+VLC_CONF_OPT += --enable-dvdnav
+else
+VLC_CONF_OPT += --disable-dvdnav
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_GNUTLS),y)
+VLC_DEPENDENCIES += gnutls
+VLC_CONF_OPT += --enable-gnutls
+else
+VLC_CONF_OPT += --disable-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIBMPEG2),y)
+VLC_DEPENDENCIES += libmpeg2
+VLC_CONF_OPT += --enable-libmpeg2
+else
+VLC_CONF_OPT += --disable-libmpeg2
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIBXML2),y)
+VLC_DEPENDENCIES += libxml2
+VLC_CONF_OPT += --enable-libxml2
+else
+VLC_CONF_OPT += --disable-libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_PULSE),y)
+VLC_DEPENDENCIES += pulseaudio
+VLC_CONF_OPT += --enable-pulse
+else
+VLC_CONF_OPT += --disable-pulse
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SAMPLERATE),y)
+VLC_DEPENDENCIES += libsamplerate
+VLC_CONF_OPT += --enable-samplerate
+else
+VLC_CONF_OPT += --disable-samplerate
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_TAGLIB),y)
+VLC_DEPENDENCIES += taglib
+VLC_CONF_OPT += --enable-taglib
+else
+VLC_CONF_OPT += --disable-taglib
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_BONJOUR),y)
+VLC_DEPENDENCIES += avahi
+VLC_CONF_OPT += --enable-bonjour
+else
+VLC_CONF_OPT += --disable-bonjour
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_UDEV),y)
+VLC_DEPENDENCIES += udev
+VLC_CONF_OPT += --enable-udev
+else
+VLC_CONF_OPT += --disable-udev
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_UPNP),y)
+VLC_DEPENDENCIES += libupnp
+VLC_CONF_OPT += --enable-upnp
+else
+VLC_CONF_OPT += --disable-upnp
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SMB),y)
+VLC_DEPENDENCIES += samba
+VLC_CONF_OPT += --enable-smb
+else
+VLC_CONF_OPT += --disable-smb
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_OPENCV),y)
+VLC_DEPENDENCIES += opencv
+VLC_CONF_OPT += --enable-opencv
+else
+VLC_CONF_OPT += --disable-opencv
+endif
+
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_LOWMEM),en,dis)able-optimize-memory
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_SOUT),en,dis)able-sout
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_HTTPD),en,dis)able-httpd
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_VLM),en,dis)able-vlm
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_SCREEN),en,dis)able-screen
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_VCD),en,dis)able-vcd
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_VISUAL),en,dis)able-visual
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_ATMO),en,dis)able-atmo
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_OSS),en,dis)able-oss
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_FRONTEND),en,dis)able-vlc
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_XOSD),en,dis)able-xosd
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_FBOSD),en,dis)able-fbosd
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_PVR),en,dis)able-pvr
+VLC_CONF_OPT += --$(if $(BR2_PACKAGE_VLC_MEDIALIB),en,dis)able-media-library
+
+ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv7-a)
+VLC_CONF_OPT += --enable-neon
+else
+VLC_CONF_OPT += --disable-neon
+endif
+
+# The configure script fails to detect vasprintf on uClibc. The issue was fixed
+# recently in scm, so this code should be removed upon next version bump.
+define VLC_FIX_CONF
+	$(SED) '/HAVE_VASPRINTF/d;1i#define HAVE_VASPRINTF 1' $(@D)/config.h
+endef
+VLC_POST_CONFIGURE_HOOKS += VLC_FIX_CONF
+
+# The following removes the relink_command. If not removed, libtool tries to
+# relink against the host libraries, instead of the sysroot.
+define VLC_FIX_LA_FILES
+	find $(@D) -name '*.la' -exec $(SED) '/^relink_command=/d' '{}' +
+	touch $(@D)/modules/access/zip/libzip_plugin.la \
+		$(@D)/modules/misc/liblogger_plugin.la
+endef
+VLC_POST_BUILD_HOOKS += VLC_FIX_LA_FILES
+
+$(eval $(autotools-package))
-- 
1.7.10.4
