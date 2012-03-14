From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Wed, 14 Mar 2012 15:31:30 -0200
Subject: [Buildroot] [PATCHv4] vlc: New package
Message-ID: <1331746290-30643-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
Changes since v3:
 * Removed scm-version bootstrapping support

Changes since v2:
 * Replaced multi-line assignments to VLC_CONF_OPTS with individual ones
   for each line.
 * Split additional commands required to build into macros and added them
   to the appropriate hook. Also added comments.

Changes since v1:
  * Added a description for the package
  * Described and signed-off the patch
  * Added configuration knobs for all available dependencies and other
    build options.

 package/multimedia/Config.in                  |    1 +
 package/multimedia/vlc/Config.in              |  286 ++++++++++++++++++++
 package/multimedia/vlc/vlc-uclibc-fixes.patch |   25 ++
 package/multimedia/vlc/vlc.mk                 |  352 +++++++++++++++++++++++++
 4 files changed, 664 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/vlc/Config.in
 create mode 100644 package/multimedia/vlc/vlc-uclibc-fixes.patch
 create mode 100644 package/multimedia/vlc/vlc.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index a05d1d9..fc20d74 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -44,6 +44,7 @@ source "package/multimedia/speex/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
+source "package/multimedia/vlc/Config.in"
 source "package/multimedia/vorbis-tools/Config.in"
 source "package/multimedia/wavpack/Config.in"
 endmenu
diff --git a/package/multimedia/vlc/Config.in b/package/multimedia/vlc/Config.in
new file mode 100644
index 0000000..26b76cf
--- /dev/null
+++ b/package/multimedia/vlc/Config.in
@@ -0,0 +1,286 @@
+menuconfig BR2_PACKAGE_VLC
+	bool "vlc"
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
+       bool "FFmpeg (Many CODECs)"
+       select BR2_PACKAGE_FFMPEG
+       help
+	 There is an awful lot of CODECs in libavcodec. You might want to avoid
+	 duplication.
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
+       select BR2_PACKAGE_GFVS
+
+config BR2_PACKAGE_VLC_V4L2
+       bool "Video4Linux 2 support"
+       select BR2_PACKAGE_LIBV4L
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
+       select BR2_PACKAGE_UDEV
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
index 0000000..5471b08
--- /dev/null
+++ b/package/multimedia/vlc/vlc-uclibc-fixes.patch
@@ -0,0 +1,25 @@
+Fixes compilation with uClibc, which doesn't provide gnu/libc-version.h nor
+gnu_get_libc_version.
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
index 0000000..0015df5
--- /dev/null
+++ b/package/multimedia/vlc/vlc.mk
@@ -0,0 +1,352 @@
+#############################################################
+#
+# vlc
+#
+#############################################################
+VLC_VERSION = 2.0.0
+VLC_SOURCE= vlc-$(VLC_VERSION).tar.xz
+VLC_SITE = http://download.videolan.org/pub/videolan/vlc/$(VLC_VERSION)
+
+VLC_CONF_OPTS += --disable-rpath --enable-run-as-root
+
+ifeq ($(BR2_PACKAGE_VLC_ALSA),y)
+VLC_DEPENDENCIES += alsa-lib
+VLC_CONF_OPTS    += --enable-alsa
+else
+VLC_CONF_OPTS    += --disable-alsa
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_DIRECTFB),y)
+VLC_CONF_OPTS += --enable-directfb
+VLC_DEPENDENCIES += directfb
+else
+VLC_CONF_OPTS += --disable-directfb
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SDL),y)
+VLC_CONF_OPTS += --enable-sdl
+VLC_DEPENDENCIES += sdl
+else
+VLC_CONF_OPTS += --disable-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SDL_IMAGE),y)
+VLC_CONF_OPTS += --enable-sdl-image
+VLC_DEPENDENCIES += sdl_image
+else
+VLC_CONF_OPTS += --disable-sdl-image
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_MAD),y)
+VLC_CONF_OPTS += --enable-mad
+VLC_DEPENDENCIES += libmad
+else
+VLC_CONF_OPTS += --disable-mad
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_TREMOR),y)
+VLC_DEPENDENCIES += tremor
+VLC_CONF_OPTS += --enable-tremor
+else
+VLC_CONF_OPTS += --disable-tremor
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_PNG),y)
+VLC_DEPENDENCIES += libpng
+VLC_CONF_OPTS += --enable-png
+else
+VLC_CONF_OPTS += --disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_AVCODEC),y)
+VLC_DEPENDENCIES += ffmpeg
+VLC_CONF_OPTS += --enable-avcodec --enable-avformat
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_POSTPROC),en,dis)able-postproc
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_SWSCALE),en,dis)able-swscale
+else
+VLC_CONF_OPTS += --disable-avcodec --disable-avformat
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_DBUS),y)
+VLC_DEPENDENCIES += dbus
+VLC_CONF_OPTS += --enable-dbus
+else
+VLC_CONF_OPTS += --disable-dbus
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIBGCRYPT),y)
+VLC_DEPENDENCIES += libgcrypt
+VLC_CONF_OPTS += --enable-libgcrypt
+else
+VLC_CONF_OPTS += --disable-libgcrypt
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_V4L2),y)
+VLC_DEPENDENCIES += libv4l
+VLC_CONF_OPTS += --enable-libv4l2
+else
+VLC_CONF_OPTS += --disable-libv4l2
+endif
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+VLC_DEPENDENCIES += lua
+VLC_CONF_OPTS += --enable-lua
+else
+VLC_CONF_OPTS += --disable-lua
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_XCB),y)
+VLC_DEPENDENCIES += libxcb
+VLC_CONF_OPTS += --enable-xcb
+else
+VLC_CONF_OPTS += --disable-xcb
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIVE555),y)
+VLC_DEPENDENCIES += live555
+VLC_CONF_OPTS += --enable-live555
+else
+VLC_CONF_OPTS += --disable-live555
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIBX11),y)
+VLC_DEPENDENCIES += xlib_libX11
+VLC_CONF_OPTS += --with-x
+else
+VLC_CONF_OPTS += --without-x
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_QT4),y)
+VLC_DEPENDENCIES += qt
+VLC_CONF_OPTS += --enable-qt4
+else
+VLC_CONF_OPTS += --disable-qt4
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_VORBIS),y)
+VLC_DEPENDENCIES += libvorbis
+VLC_CONF_OPTS += --enable-vorbis
+else
+VLC_CONF_OPTS += --disable-vorbis
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_THEORA),y)
+VLC_DEPENDENCIES += libtheora
+VLC_CONF_OPTS += --enable-theora
+else
+VLC_CONF_OPTS += --disable-theora
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SPEEX),y)
+VLC_DEPENDENCIES += speex
+VLC_CONF_OPTS += --enable-speex
+else
+VLC_CONF_OPTS += --disable-speex
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_FLAC),y)
+VLC_DEPENDENCIES += flac
+VLC_CONF_OPTS += --enable-flac
+else
+VLC_CONF_OPTS += --disable-flac
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_XV),y)
+VLC_DEPENDENCIES += libxcb xcb-proto xproto_videoproto
+VLC_CONF_OPTS += --enable-xvideo
+else
+VLC_CONF_OPTS += --disable-xvideo
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_FREETYPE),y)
+VLC_DEPENDENCIES += freetype
+VLC_CONF_OPTS += --enable-freetype
+else
+VLC_CONF_OPTS += --disable-freetype
+endif
+
+VLC_CONF_OPTS += --disable-a52
+
+ifeq ($(BR2_PACKAGE_VLC_FAAD),y)
+VLC_DEPENDENCIES += faad2
+VLC_CONF_OPTS += --enable-faad
+else
+VLC_CONF_OPTS += --disable-faad
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SVG),y)
+VLC_DEPENDENCIES += librsvg
+VLC_CONF_OPTS += --enable-svg
+else
+VLC_CONF_OPTS += --disable-svg
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_OGG),y)
+VLC_DEPENDENCIES += libogg
+VLC_CONF_OPTS += --enable-ogg
+else
+VLC_CONF_OPTS += --disable-ogg
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_MUX_OGG),y)
+VLC_CONF_OPTS += --enable-mux_ogg
+else
+VLC_CONF_OPTS += --disable-mux_ogg
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_GLX),y)
+VLC_DEPENDENCIES += libxcb xcb-proto xproto_glproto
+VLC_CONF_OPTS += --enable-glx
+else
+VLC_CONF_OPTS += --disable-glx
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SQLITE),y)
+VLC_DEPENDENCIES += sqlite
+VLC_CONF_OPTS += --enable-sqlite
+else
+VLC_CONF_OPTS += --disable-sqlite
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_NCURSES),y)
+VLC_DEPENDENCIES += ncurses
+VLC_CONF_OPTS += --enable-ncurses
+else
+VLC_CONF_OPTS += --disable-ncurses
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_GVFS),y)
+VLC_DEPENDENCIES += gvfs
+VLC_CONF_OPTS += --enable-gnomevfs
+else
+VLC_CONF_OPTS += --disable-gnomevfs
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_DVD),y)
+VLC_DEPENDENCIES += libdvdread
+VLC_CONF_OPTS += --enable-dvdread
+else
+VLC_CONF_OPTS += --disable-dvdread
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_DVDNAV),y)
+VLC_DEPENDENCIES += libdvdnav
+VLC_CONF_OPTS += --enable-dvdnav
+else
+VLC_CONF_OPTS += --disable-dvdnav
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_GNUTLS),y)
+VLC_DEPENDENCIES += gnutls
+VLC_CONF_OPTS += --enable-gnutls
+else
+VLC_CONF_OPTS += --disable-gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIBMPEG2),y)
+VLC_DEPENDENCIES += libmpeg2
+VLC_CONF_OPTS += --enable-libmpeg2
+else
+VLC_CONF_OPTS += --disable-libmpeg2
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_LIBXML2),y)
+VLC_DEPENDENCIES += libxml2
+VLC_CONF_OPTS += --enable-libxml2
+else
+VLC_CONF_OPTS += --disable-libxml2
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_PULSE),y)
+VLC_DEPENDENCIES += pulseaudio
+VLC_CONF_OPTS += --enable-pulse
+else
+VLC_CONF_OPTS += --disable-pulse
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SAMPLERATE),y)
+VLC_DEPENDENCIES += libsamplerate
+VLC_CONF_OPTS += --enable-samplerate
+else
+VLC_CONF_OPTS += --disable-samplerate
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_TAGLIB),y)
+VLC_DEPENDENCIES += taglib
+VLC_CONF_OPTS += --enable-taglib
+else
+VLC_CONF_OPTS += --disable-taglib
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_BONJOUR),y)
+VLC_DEPENDENCIES += avahi
+VLC_CONF_OPTS += --enable-bonjour
+else
+VLC_CONF_OPTS += --disable-bonjour
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_UDEV),y)
+VLC_DEPENDENCIES += udev
+VLC_CONF_OPTS += --enable-udev
+else
+VLC_CONF_OPTS += --disable-udev
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_UPNP),y)
+VLC_DEPENDENCIES += libupnp
+VLC_CONF_OPTS += --enable-upnp
+else
+VLC_CONF_OPTS += --disable-upnp
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_SMB),y)
+VLC_DEPENDENCIES += samba
+VLC_CONF_OPTS += --enable-smb
+else
+VLC_CONF_OPTS += --disable-smb
+endif
+
+ifeq ($(BR2_PACKAGE_VLC_OPENCV),y)
+VLC_DEPENDENCIES += opencv
+VLC_CONF_OPTS += --enable-opencv
+else
+VLC_CONF_OPTS += --disable-opencv
+endif
+
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_LOWMEM),en,dis)able-optimize-memory
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_SOUT),en,dis)able-sout
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_HTTPD),en,dis)able-httpd
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_VLM),en,dis)able-vlm
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_SCREEN),en,dis)able-screen
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_VCD),en,dis)able-vcd
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_VISUAL),en,dis)able-visual
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_ATMO),en,dis)able-atmo
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_OSS),en,dis)able-oss
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_FRONTEND),en,dis)able-vlc
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_XOSD),en,dis)able-xosd
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_FBOSD),en,dis)able-fbosd
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_PVR),en,dis)able-pvr
+VLC_CONF_OPTS += --$(if $(BR2_PACKAGE_VLC_MEDIALIB),en,dis)able-media-library
+
+ifeq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),armv7-a)
+VLC_CONF_OPTS += --enable-neon
+else
+VLC_CONF_OPTS += --disable-neon
+endif
+
+# The configure script fails to detect vasprintf on uClibc.
+VLC_POST_CONFIGURE_HOOKS += VLC_FIX_CONF
+define VLC_FIX_CONF
+	$(SED) '1i#define HAVE_VASPRINTF 1' $(@D)/config.h
+endef
+
+# The following rmoves the relink_command. If not removed, libtool tries to
+# relink against the host libraries, instead of the sysroot.
+VLC_POST_BUILD_HOOKS += VLC_FIX_LA_FILES
+define VLC_FIX_LA_FILES
+	find $(@D) -name '*.la' -exec $(SED) '/^relink_command=/d' '{}' +
+	touch $(@D)/modules/access/zip/libzip_plugin.la \
+		$(@D)/modules/misc/liblogger_plugin.la
+endef
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.1
