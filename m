From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 28 Jan 2012 23:48:32 +0100
Subject: [Buildroot] [git commit] libevas: Add new package
Message-ID: <20120128232349.3585E9092F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73b942e57efa4fe27e61030f798a092412e08561
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Config.in tweaks]
Signed-off-by: Will Newton <will.newton@imgtec.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/efl/Config.in          |    1 +
 package/efl/libevas/Config.in  |  240 ++++++++++++++++++++++++++++++++++++++++
 package/efl/libevas/libevas.mk |  187 +++++++++++++++++++++++++++++++
 3 files changed, 428 insertions(+), 0 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 8ca514d..27d1f95 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -10,6 +10,7 @@ if BR2_PACKAGE_EFL
 
 source "package/efl/libeina/Config.in"
 source "package/efl/libeet/Config.in"
+source "package/efl/libevas/Config.in"
 
 endif # BR2_PACKAGE_EFL
 
diff --git a/package/efl/libevas/Config.in b/package/efl/libevas/Config.in
new file mode 100644
index 0000000..5b48af2
--- /dev/null
+++ b/package/efl/libevas/Config.in
@@ -0,0 +1,240 @@
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
+config BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE
+	bool "libevas sampling scaler"
+	help
+	  This enables the sampling scaler code. This is the fastest
+	  image scaling code, but also the lowest quality.
+
+config BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
+	bool "libevas smooth scaler"
+	help
+	  This is the nicest looking scaler that is not that much
+	  slower than tri-linear, but it looks really good.
+
+config BR2_PACKAGE_LIBEVAS_SMALL_DITHERING
+	bool "libevas small dithering"
+	help
+	  This uses a 4x4 dither mask instead of 128x128. On desktop
+	  boxes these days (Pentium, Pentium2, amd etc.) the speed
+	  difference is not really measurable, but the quality of the
+	  128x128 dither mask is quite a lot better.
+
+config BR2_PACKAGE_LIBEVAS_LINE_DITHERING
+	bool "libevas line dithering"
+
+config BR2_PACKAGE_LIBEVAS_NO_DITHERING
+	bool "libevas no dithering"
+
+
+comment "libevas backends"
+
+config BR2_PACKAGE_LIBEVAS_BUFFER
+	bool "libevas buffer backend"
+	depends on BR2_PACKAGE_XORG7
+	help
+	  This enables the software buffer rendering engine. There is
+	  no hardware assist here.
+
+config BR2_PACKAGE_LIBEVAS_DIRECTFB
+	bool "libevas DirectFB backend"
+	depends on BR2_PACKAGE_DIRECTFB
+	default y
+	help
+	  This is the DirectFB engine that uses the DirectFB library
+	  (http://www.directfb.org) on Linux to access the framebuffer
+	  with (or maybe without) acceleration.
+
+config BR2_PACKAGE_LIBEVAS_FB
+	bool "libevas frame buffer backend"
+	help
+	  This is the software framebuffer driving engine. this uses
+	  the linux framebuffer device (/dev/fb<x>) and will currently
+	  just inherit the current framebuffer settings on the fb
+	  device and use them to run in.
+
+config BR2_PACKAGE_LIBEVAS_SDL
+	bool "libevas SDL backend"
+	select BR2_PACKAGE_SDL
+	help
+	  This is the software SDL engine that uses SDL library
+	  (http://www.libsdl.org). This library should work on many
+	  operating systems.
+
+config BR2_PACKAGE_LIBEVAS_SDL_GL
+	bool "libevas SDL OpenGL backend"
+	depends on BR2_PACKAGE_SDL_X11
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	help
+	  This is the SDL OpenGL engine that uses SDL library
+	  and OpenGL to render. This may be hardware accelerated.
+
+config BR2_PACKAGE_LIBEVAS_X11
+	bool "libevas X11 backend"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  This enables the software X11 rendering engine that renders
+	  to X drawable targets using highly optimised software
+	  routines. There is no hardware assist here.
+
+config BR2_PACKAGE_LIBEVAS_X11_GLX
+	bool "libevas X11 GLX backend"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	help
+	  This enables the OpenGL X11 rendering engine that renders
+	  using GLX which may be hardware accelerated.
+
+config BR2_PACKAGE_LIBEVAS_XCB
+	bool "libevas XCB backend"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL
+	select BR2_PACKAGE_XCB_PROTO
+	select BR2_PACKAGE_PIXMAN
+	help
+	  This enable the software XCB rendering engine. It allows the
+	  same features than the software X11 engine.
+
+config BR2_PACKAGE_LIBEVAS_XCB_GLX
+	bool "libevas XCB GLX backend"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL
+	select BR2_PACKAGE_XCB_PROTO
+	select BR2_PACKAGE_XPROTO_GLPROTO
+	help
+	  This enables the OpenGL X11 XCB rendering engine that renders
+	  using GLX which may be hardware accelerated.
+
+choice
+	prompt "libevas OpenGL flavor"
+	depends on BR2_PACKAGE_LIBEVAS_SDL_GL || BR2_PACKAGE_LIBEVAS_X11_GLX || BR2_PACKAGE_LIBEVAS_XCB_GLX
+	default BR2_PACKAGE_LIBEVAS_GL
+
+config BR2_PACKAGE_LIBEVAS_GL
+       bool "generic OpenGL"
+
+config BR2_PACKAGE_LIBEVAS_GLES_SGX
+       bool "OpenGL-ES SGX"
+
+config BR2_PACKAGE_LIBEVAS_GLES_S3C6410
+       bool "OpenGL-ES S3C6410"
+endchoice
+
+
+comment "libevas code tuning"
+
+config BR2_PACKAGE_LIBEVAS_DISABLE_C
+	bool "libevas disable C code"
+	depends on BR2_PACKAGE_LIBEVAS_MMX || BR2_PACKAGE_LIBEVAS_SSE || BR2_PACKAGE_LIBEVAS_SSE3
+	help
+	  This disables the generic C fallback code which is not required
+	  if MMX or SSE is used instead.
+
+config BR2_PACKAGE_LIBEVAS_MMX
+	bool "libevas MMX routines"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  This enables the MMX optimized routines. this works for
+	  Pentium, Pentium 2, Pentium 3, Pentium 4, Athlon and Duron
+	  processors.
+
+config BR2_PACKAGE_LIBEVAS_SSE
+	bool "libevas SSE routines"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  This enables SSE optimizations available in the Pentium 3 and
+	  4 cpus (not Athlon and Duron or Pentium 2 or Pentium cpus).
+
+config BR2_PACKAGE_LIBEVAS_SSE3
+	bool "libevas SSE3 routines"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  This enables SSE3 optimizations available in the Pentium 4 and
+	  above cpus.
+
+config BR2_PACKAGE_LIBEVAS_ALTIVEC
+	bool "libevas altivec routines"
+	depends on BR2_powerpc
+	help
+	  This enables AltiVec optimizations available in some PowerPC cpus.
+
+config BR2_PACKAGE_LIBEVAS_NEON
+	bool "libevas neon routines"
+	depends on BR2_arm
+	help
+	  This enables NEON optimizations available in some ARM cpus.
+
+
+comment "libevas loaders"
+
+config BR2_PACKAGE_LIBEVAS_PNG
+	bool "libevas png loader"
+	select BR2_PACKAGE_LIBPNG
+	help
+	  This enables the loader code that loads png files using
+	  libpng.
+
+config BR2_PACKAGE_LIBEVAS_JPEG
+	bool "libevas jpeg loader"
+	select BR2_PACKAGE_JPEG
+	help
+	  This enables the loader code that loads jpeg files using
+	  libjpeg.
+
+config BR2_PACKAGE_LIBEVAS_GIF
+	bool "libevas gif loader"
+	select BR2_PACKAGE_LIBUNGIF
+	help
+	  This enables the loader code that loads gif files using
+	  libungif.
+
+config BR2_PACKAGE_LIBEVAS_PMAPS
+	bool "libevas pmaps loader"
+	help
+	  This enables the loader code that loads pmaps files.
+
+config BR2_PACKAGE_LIBEVAS_TIFF
+	bool "libevas tiff loader"
+	select BR2_PACKAGE_TIFF
+	help
+	  This enables the loader code that loads tiff files.
+
+config BR2_PACKAGE_LIBEVAS_SVG
+	bool "libevas svg loader"
+	help
+	  This enables the loader code that loads svg files.
+
+config BR2_PACKAGE_LIBEVAS_XPM
+	bool "libevas xpm loader"
+	help
+	  This enables the loader code that loads xpm files.
+
+config BR2_PACKAGE_LIBEVAS_EET
+	bool "libevas eet image loader"
+	select BR2_PACKAGE_LIBEET
+	help
+	  This enables the loader code that loads images using libeet.
+
+config BR2_PACKAGE_LIBEVAS_EET_FONT
+	bool "libevas eet font loader"
+	select BR2_PACKAGE_LIBEET
+	help
+	  This enables the loader code that loads fonts using libeet.
+
+endif # BR2_PACKAGE_LIBEVAS
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
new file mode 100644
index 0000000..1a96551
--- /dev/null
+++ b/package/efl/libevas/libevas.mk
@@ -0,0 +1,187 @@
+#############################################################
+#
+# libevas
+#
+#############################################################
+
+LIBEVAS_VERSION = 1.1.0
+LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
+LIBEVAS_SITE = http://download.enlightenment.org/releases/
+LIBEVAS_INSTALL_STAGING = YES
+
+LIBEVAS_DEPENDENCIES = host-pkg-config zlib libeina freetype
+
+HOST_LIBEVAS_DEPENDENCIES = host-pkg-config host-zlib host-libeina \
+				host-freetype host-libpng
+HOST_LIBEVAS_CONF_OPT += --enable-image-loader-png
+
+# rendering options
+ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE),y)
+LIBEVAS_CONF_OPT += --enable-scale-sample
+else
+LIBEVAS_CONF_OPT += --disable-scale-sample
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH),y)
+LIBEVAS_CONF_OPT += --enable-scale-smooth
+else
+LIBEVAS_CONF_OPT += --disable-scale-smooth
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
+LIBEVAS_CONF_OPT += --enable-software-xlib
+LIBEVAS_DEPENDENCIES += xproto_xproto
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
+LIBEVAS_CONF_OPT += --enable-gl-xlib
+LIBEVAS_DEPENDENCIES += xproto_glproto xlib_libX11
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
+LIBEVAS_CONF_OPT += --enable-software-xcb
+LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util pixman
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_XCB_GLX),y)
+LIBEVAS_CONF_OPT += --enable-gl-xcb
+LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util xproto_glproto
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
+LIBEVAS_CONF_OPT += --enable-software-sdl
+LIBEVAS_DEPENDENCIES += sdl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_SDL_GL),y)
+LIBEVAS_CONF_OPT += --enable-gl-sdl
+LIBEVAS_DEPENDENCIES += sdl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
+LIBEVAS_CONF_OPT += --enable-gl-flavor-gles --enable-gles-variety-sgx
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),y)
+LIBEVAS_CONF_OPT += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
+endif
+
+# code options
+ifeq ($(BR2_PACKAGE_LIBEVAS_DISABLE_C),y)
+LIBEVAS_CONF_OPT += --disable-cpu-c
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
+ifeq ($(BR2_PACKAGE_LIBEVAS_SSE3),y)
+LIBEVAS_CONF_OPT += --enable-cpu-sse3
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_ALTIVEC),y)
+LIBEVAS_CONF_OPT += --enable-cpu-altivec
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_NEON),y)
+LIBEVAS_CONF_OPT += --enable-cpu-neon
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
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
