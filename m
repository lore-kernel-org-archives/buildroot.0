From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Thu, 24 Dec 2009 01:35:13 +0100
Subject: [Buildroot] [PATCH 2/5] efl: added libevas package
In-Reply-To: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
References: <1261614916-8219-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1261614916-8219-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/efl/Config.in          |    1 +
 package/efl/libevas/Config.in  |  199 ++++++++++++++++++++++++++++++++++++++++
 package/efl/libevas/libevas.mk |  163 ++++++++++++++++++++++++++++++++
 3 files changed, 363 insertions(+), 0 deletions(-)
 create mode 100644 package/efl/libevas/Config.in
 create mode 100644 package/efl/libevas/libevas.mk

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 1e3d8ae..8c7514b 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -9,5 +9,6 @@ if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
 source "package/efl/libeet/Config.in"
+source "package/efl/libevas/Config.in"
 
 endif # BR2_PACKAGE_EFL
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
new file mode 100644
index 0000000..23c7db1
--- /dev/null
+++ b/package/efl/libevas/Config.in
@@ -0,0 +1,199 @@
+config BR2_PACKAGE_LIBEVAS
+	bool "libevas"
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBEINA
+	help
+	  Evas is a clean display canvas API for several target
+	  display systems that can draw anti-aliased text, smooth
+	  super and sub-sampled scaled images, alpha-blend objects
+	  much and more.
+
+if BR2_PACKAGE_LIBEVAS
+
+comment "libevas rendering options"
+
+config BR2_PACKAGE_LIBEVAS_SCALE_SIMPLE
+	bool "libevas simple scaling"
+	help
+	  This enables the sampling scaler code. this is the fastest
+	  image scaling code, but also the lowest quality.
+
+config BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
+	bool "libevas smooth scaling"
+	help
+	  This is the nicest looking scaler that is not that much
+	  slower than tri-linear, but it looks really good.
+
+config BR2_PACKAGE_LIBEVAS_SMALL_DITHERING
+	bool "libevas small dithering"
+	help
+	  This uses a 4x4 dither mask instead of 128x128. on desktop
+	  boxes these days (pentium, pentium2, amd etc.) the speed
+	  difference is not really measurable, but the quality of the
+	  128x128 dither mask is quite a lot better.
+
+config BR2_PACKAGE_LIBEVAS_LINE_DITHERING
+	bool "libevas line dithering"
+
+config BR2_PACKAGE_LIBEVAS_NO_DITHERING
+	bool "libevas no dithering"
+
+comment "libevas backends"
+
+config BR2_PACKAGE_LIBEVAS_BUFFER
+	bool "libevas buffer backend"
+        depends on BR2_PACKAGE_XORG7
+	help
+	  This enables the software buffer rendering engine. There is
+	  no hardware assist here.
+
+config BR2_PACKAGE_LIBEVAS_DIRECTFB
+	bool "libevas directfb backend"
+	depends on BR2_PACKAGE_DIRECTFB
+	help
+          This is the direct fb engine that uses direcftb
+          (http://www.directfb.org) on linux to access the framebuffer
+          with (or maybe without) acceleration.
+
+config BR2_PACKAGE_LIBEVAS_FB
+	bool "libevas frame buffer backend"
+	help
+          This is the software framebuffer driving engine. this uses
+          the linux framebuffer device (/dev/fb<x>) and will currently
+          just inherit the current framebuffer settings on the fb
+          device and use them to run in.
+
+config BR2_PACKAGE_LIBEVAS_GL
+	bool "libevas gl backend"
+        depends on BR2_PACKAGE_XORG7
+	help
+          This is the gl engine that uses GLX-GL or EGL-GLES
+          implementation.
+
+if BR2_PACKAGE_LIBEVAS_GL_X11
+
+choice
+	prompt "libevas gl-x11 implementation"
+	default BR2_PACKAGE_LIBEVAS_GL_GLX
+	help
+	  Selects which gl implementation will be used.
+
+config BR2_PACKAGE_LIBEVAS_GL_GLX
+	bool "glx"
+
+config BR2_PACKAGE_LIBEVAS_GL_FLAVOR_GLES
+	bool "flavor gles"
+
+config BR2_PACKAGE_LIBEVAS_GL_SGX
+	bool "gles (sgx)"
+
+config BR2_PACKAGE_LIBEVAS_GL_S3C6410
+	bool "gles (s3c6410)"
+
+endchoice
+
+endif # BR2_PACKAGE_LIBEVAS_GL_X11
+
+config BR2_PACKAGE_LIBEVAS_SDL
+	bool "libevas sdl backend"
+	help
+          This is the sdl engine that uses sdl library
+          (http://www.libsdl.org). This library should work on many
+          operating system.
+
+config BR2_PACKAGE_LIBEVAS_X11
+	bool "libevas x11 backend"
+        depends on BR2_PACKAGE_XORG7
+	help
+	  This enables the software x11 rendering engine that renders
+	  to X drawable targets using highly optimised software
+	  routines. There is no hardware assist here.
+
+config BR2_PACKAGE_LIBEVAS_XCB
+	bool "libevas xcd backend"
+        depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBXCB
+	help
+          This enable the software xcb rendering engine. It allows the
+          same features than the software x11 engine.
+
+comment "libevas code tunning"
+
+config BR2_PACKAGE_LIBEVAS_C
+	bool "libevas c code"
+	help
+          This enabled the c code. you can actually build the code
+          without the c fallback code and only have the mmx routines
+          for example.
+
+config BR2_PACKAGE_LIBEVAS_MMX
+	bool "libevas mmx routines"
+        depends on BR2_i386 || BR2_x86_64
+	help
+          This enables the mmx optimised routines. this works for
+          pentium, pentium2, pentium3, pentium4, athlon and duron
+          processors.
+
+config BR2_PACKAGE_LIBEVAS_SSE
+	bool "libevas sse routines"
+        depends on BR2_i386 || BR2_x86_64
+	help
+          This enables sse optimizations availbale in he pentium3 and
+          4 cpus (not athlon and duron or pentium 2 or pentium cpu's).
+
+comment "libevas loaders"
+
+config BR2_PACKAGE_LIBEVAS_PNG
+	bool "libevas png loader"
+        select BR2_PACKAGE_LIBPNG
+	help
+          This enables the loader code that loads png files using
+          libpng.
+
+config BR2_PACKAGE_LIBEVAS_JPEG
+	bool "libevas jpeg loader"
+        select BR2_PACKAGE_JPEG
+	help
+          This enables the loader code that loads jpeg files using
+          libjpeg.
+
+config BR2_PACKAGE_LIBEVAS_GIF
+	bool "libevas gif loader"
+        select BR2_PACKAGE_LIBUNGIF
+	help
+          This enables the loader code that loads gif files using
+          libungif.
+
+config BR2_PACKAGE_LIBEVAS_PMAPS
+	bool "libevas pmaps loader"
+	help
+          This enables the loader code that loads pmaps files.
+
+config BR2_PACKAGE_LIBEVAS_TIFF
+	bool "libevas tiff loader"
+        select BR2_PACKAGE_TIFF
+	help
+          This enables the loader code that loads tiff files.
+
+config BR2_PACKAGE_LIBEVAS_SVG
+	bool "libevas svg loader"
+	help
+          This enables the loader code that loads svg files.
+
+config BR2_PACKAGE_LIBEVAS_XPM
+	bool "libevas xpm loader"
+	help
+          This enables the loader code that loads xpm files.
+
+config BR2_PACKAGE_LIBEVAS_EET
+	bool "libevas eet image loader"
+        select BR2_PACKAGE_LIBEET
+	help
+          This enables the loader code that loads images using libeet.
+
+config BR2_PACKAGE_LIBEVAS_EET_FONT
+	bool "libevas eet font loader"
+        select BR2_PACKAGE_LIBEET
+	help
+          This enables the loader code that loads fonts using libeet.
+
+endif # BR2_PACKAGE_LIBEVAS
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
new file mode 100644
index 0000000..5c87424
--- /dev/null
+++ b/package/efl/libevas/libevas.mk
@@ -0,0 +1,163 @@
+#############################################################
+#
+# libevas
+#
+#############################################################
+
+LIBEVAS_VERSION = 0.9.9.063
+LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
+LIBEVAS_SITE = $(EFL_SNAPSHOT_URL)
+LIBEVAS_INSTALL_STAGING = YES
+LIBEVAS_INSTALL_TARGET = YES
+
+LIBEVAS_DEPENDENCIES = host-pkg-config zlib libeina
+
+LIBEVAS_CONF_OPT =
+
+# rendering options
+ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SIMPLE),y)
+LIBEVAS_CONF_OPT += --enable-scale-sample
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH),y)
+LIBEVAS_CONF_OPT += --enable-scale-smooth
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SMALL_DITHERING),y)
+LIBEVAS_CONF_OPT += --enable-small-dither-mask
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_LINE_DITHERING),y)
+LIBEVAS_CONF_OPT += --enable-line-dither-mask
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_NO_DITHERING),y)
+LIBEVAS_CONF_OPT += --enable-no-dither-mask
+endif
+
+# backends
+ifeq ($(BR2_PACKAGE_LIBEVAS_BUFFER),y)
+LIBEVAS_CONF_OPT += --enable-buffer
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
+LIBEVAS_CONF_OPT += --enable-software-x11
+LIBEVAS_DEPENDENCIES += xproto_xproto
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
+LIBEVAS_CONF_OPT += --enable-software-xcb
+LIBEVAS_DEPENDENCIES += xcb-proto
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_FB),y)
+LIBEVAS_CONF_OPT += --enable-fb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_DIRECTFB),y)
+LIBEVAS_CONF_OPT += --enable-directfb
+LIBEVAS_DEPENDENCIES += directfb
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SDL),y)
+LIBEVAS_CONF_OPT += --enable-sdl
+LIBEVAS_DEPENDENCIES += sdl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GL_X11),y)
+LIBEVAS_CONF_OPT += --enable-gl-x11
+LIBEVAS_DEPENDENCIES += xserver_xorg-server
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GL_FLAVOR_GLES),y)
+LIBEVAS_CONF_OPT += --enable-gl-flavor-gles
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GL_SGX),y)
+LIBEVAS_CONF_OPT += --enable-gles-variety-sgx
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GL_S3C6410),y)
+LIBEVAS_CONF_OPT += --enable-gles-variety-s3c6410
+endif
+endif # BR2_PACKAGE_LIBEVAS_GL_X11
+
+# code options
+ifeq ($(BR2_PACKAGE_LIBEVAS_C),y)
+LIBEVAS_CONF_OPT += --enable-cpu-c
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_MMX),y)
+LIBEVAS_CONF_OPT += --enable-cpu-mmx
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SSE),y)
+LIBEVAS_CONF_OPT += --enable-cpu-sse
+endif
+
+# loaders
+ifeq ($(BR2_PACKAGE_LIBEVAS_PNG),y)
+LIBEVAS_CONF_OPT += --enable-image-loader-png
+LIBEVAS_DEPENDENCIES += libpng
+else
+LIBEVAS_CONF_OPT += --disable-image-loader-png
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_JPEG),y)
+LIBEVAS_CONF_OPT += --enable-image-loader-jpeg
+LIBEVAS_DEPENDENCIES += jpeg
+else
+LIBEVAS_CONF_OPT += --disable-image-loader-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GIF),y)
+LIBEVAS_CONF_OPT += --enable-image-loader-gif
+LIBEVAS_DEPENDENCIES += libungif
+else
+LIBEVAS_CONF_OPT += --disable-image-loader-gif
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_PMAPS),y)
+LIBEVAS_CONF_OPT += --enable-image-loader-pmaps
+else
+LIBEVAS_CONF_OPT += --disable-image-loader-pmaps
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SVG),y)
+LIBEVAS_CONF_OPT += --enable-image-loader-svg
+else
+LIBEVAS_CONF_OPT += --disable-image-loader-svg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_TIFF),y)
+LIBEVAS_CONF_OPT += --enable-image-loader-tiff
+LIBEVAS_DEPENDENCIES += tiff
+else
+LIBEVAS_CONF_OPT += --disable-image-loader-tiff
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_XPM),y)
+LIBEVAS_CONF_OPT += --enable-image-loader-xpm
+else
+LIBEVAS_CONF_OPT += --disable-image-loader-xpm
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_EET),y)
+LIBEVAS_CONF_OPT += --enable-image-loader-eet
+LIBEVAS_DEPENDENCIES += libeet
+else
+LIBEVAS_CONF_OPT += --disable-image-loader-eet
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_EET_FONT),y)
+LIBEVAS_CONF_OPT += --enable-font-loader-eet
+LIBEVAS_DEPENDENCIES += libeet
+else
+LIBEVAS_CONF_OPT += --disable-font-loader-eet
+endif
+
+# documentation
+ifneq ($(BR2_HAVE_DOCUMENTATION),y)
+LIBEVAS_CONF_OPT += --disable-doc
+endif
+
+$(eval $(call AUTOTARGETS,package,libevas))
-- 
1.6.5.7
