From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 26 Jul 2015 20:55:44 +0200
Subject: [Buildroot] [RFC 34/37] package/libevas: remove package
In-Reply-To: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
References: <1437936947-17632-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1437936947-17632-35-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Libevas is now available in efl package.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 Config.in.legacy                  |   7 ++
 package/Config.in                 |   1 -
 package/libevas/0001-giflib.patch |  98 ---------------
 package/libevas/Config.in         | 213 --------------------------------
 package/libevas/libevas.mk        | 247 --------------------------------------
 5 files changed, 7 insertions(+), 559 deletions(-)
 delete mode 100644 package/libevas/0001-giflib.patch
 delete mode 100644 package/libevas/Config.in
 delete mode 100644 package/libevas/libevas.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index b3c718a..d73adff 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.08"
 
+config BR2_PACKAGE_LIBEVAS
+	bool "libevas package has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_EFL
+	help
+	  The libevas package has been removed with the efl bump to 1.14.
+
 config BR2_PACKAGE_LIBECORE
 	bool "libecore package has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 51444de..55f6121 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,7 +245,6 @@ endif
 	source "package/libeet/Config.in"
 	source "package/libeina/Config.in"
 	source "package/libelementary/Config.in"
-	source "package/libevas/Config.in"
 	source "package/libevas-generic-loaders/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
diff --git a/package/libevas/0001-giflib.patch b/package/libevas/0001-giflib.patch
deleted file mode 100644
index 9342687..0000000
--- a/package/libevas/0001-giflib.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Adjust source code to work with giflib 5.1x
-
-From http://giflib.sourceforge.net/gif_lib.html: GIF file openers and
-closers - DGifOpenFileName(), DGifOpenFileHandle(), DGifOpen(),
-DGifClose(), EGifOpenFileName(), EGifOpenFileHandle(), EGifOpen(), and
-EGifClose() - all now take a final integer address argument. If
-non-null, this is used to pass back an error code when the function
-returns NULL.
-
-Downloaded from
-http://commit.cvs.pld.groups.com.ru/332837-packagesevas_fix_building_with_giflib_51_rel_6
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr evas-1.7.10.org/src/modules/loaders/gif/evas_image_load_gif.c evas-1.7.10/src/modules/loaders/gif/evas_image_load_gif.c
---- evas-1.7.10.org/src/modules/loaders/gif/evas_image_load_gif.c	2013-08-01 17:41:35.000000000 +0200
-+++ evas-1.7.10/src/modules/loaders/gif/evas_image_load_gif.c	2015-01-26 19:44:20.132955194 +0100
-@@ -338,7 +338,7 @@
- 
-    if (!cmap)
-      {
--        DGifCloseFile(gif);
-+        DGifCloseFile(gif, NULL);
-         for (i = 0; i < scale_h; i++)
-           {
-              free(rows[i]);
-@@ -725,7 +725,7 @@
-    if ((w < 1) || (h < 1) || (w > IMG_MAX_SIZE) || (h > IMG_MAX_SIZE) ||
-        IMG_TOO_BIG(w, h))
-      {
--        DGifCloseFile(gif);
-+        DGifCloseFile(gif, NULL);
-         if (IMG_TOO_BIG(w, h))
-           *error = EVAS_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED;
-         else
-@@ -740,7 +740,7 @@
-         if (DGifGetRecordType(gif, &rec) == GIF_ERROR)
-           {
-              /* PrintGifError(); */
--             DGifCloseFile(gif);
-+             DGifCloseFile(gif, NULL);
-              *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
-              return EINA_FALSE;
-           }
-@@ -754,7 +754,7 @@
-              if (DGifGetImageDesc(gif) == GIF_ERROR)
-                {
-                   /* PrintGifError(); */
--                  DGifCloseFile(gif);
-+                  DGifCloseFile(gif, NULL);
-                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
-                   return EINA_FALSE;
-                }
-@@ -762,7 +762,7 @@
-              if (DGifGetCode(gif, &img_code, &img) == GIF_ERROR)
-                {
-                   /* PrintGifError(); */
--                  DGifCloseFile(gif);
-+                  DGifCloseFile(gif, NULL);
-                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
-                   return EINA_FALSE;
-                }
-@@ -818,7 +818,7 @@
-         ie->frames = NULL;
-      }
- 
--   DGifCloseFile(gif);
-+   DGifCloseFile(gif, NULL);
-    *error = EVAS_LOAD_ERROR_NONE;
-    return EINA_TRUE;
- }
-@@ -885,7 +885,7 @@
-      }
- 
-    ie->frames = eina_list_append(ie->frames, frame);
--   DGifCloseFile(gif);
-+   DGifCloseFile(gif, NULL);
-    return EINA_TRUE;
- }
- 
-@@ -959,7 +959,7 @@
-                   *error = EVAS_LOAD_ERROR_UNKNOWN_FORMAT;
-                   return EINA_FALSE;
-                }
--             DGifCloseFile(gif);
-+             DGifCloseFile(gif, NULL);
-              *error = EVAS_LOAD_ERROR_NONE;
-              return EINA_TRUE;
-           }
-@@ -1080,7 +1080,7 @@
-          }
-      } while (rec != TERMINATE_RECORD_TYPE);
- 
--   DGifCloseFile(gif);
-+   DGifCloseFile(gif, NULL);
-    return duration;
- }
- 
diff --git a/package/libevas/Config.in b/package/libevas/Config.in
deleted file mode 100644
index 1f17fa3..0000000
--- a/package/libevas/Config.in
+++ /dev/null
@@ -1,213 +0,0 @@
-comment "libevas needs a toolchain w/ threads, wchar"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-
-config BR2_PACKAGE_LIBEVAS
-	bool "libevas"
-	# libevas should normally build without threads, but due to a
-	# build issue when the async preloader is disabled, which is
-	# needed when no threads are available, we don't allow evas to
-	# be built without threads. This should be revisited when efl
-	# is bumped to 1.8.
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU # efl
-	depends on BR2_USE_WCHAR # efl
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LIBEINA
-	# required to build so far
-	select BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
-	help
-	  Evas is a clean display canvas API for several target
-	  display systems that can draw anti-aliased text, smooth
-	  super and sub-sampled scaled images, alpha-blend objects
-	  much and more.
-
-	  http://trac.enlightenment.org/e/wiki/Evas
-
-if BR2_PACKAGE_LIBEVAS
-
-comment "libevas rendering options"
-
-config BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE
-	bool "libevas sampling scaler"
-	help
-	  This enables the sampling scaler code. This is the fastest
-	  image scaling code, but also the lowest quality.
-
-config BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH
-	bool "libevas smooth scaler"
-	help
-	  This is the nicest looking scaler that is not that much
-	  slower than tri-linear, but it looks really good.
-
-config BR2_PACKAGE_LIBEVAS_SMALL_DITHERING
-	bool "libevas small dithering"
-	help
-	  This uses a 4x4 dither mask instead of 128x128. On desktop
-	  boxes these days (Pentium, Pentium2, amd etc.) the speed
-	  difference is not really measurable, but the quality of the
-	  128x128 dither mask is quite a lot better.
-
-config BR2_PACKAGE_LIBEVAS_LINE_DITHERING
-	bool "libevas line dithering"
-
-config BR2_PACKAGE_LIBEVAS_NO_DITHERING
-	bool "libevas no dithering"
-
-
-comment "libevas backends"
-
-config BR2_PACKAGE_LIBEVAS_BUFFER
-	bool "libevas buffer backend"
-	help
-	  This enables the software buffer rendering engine. There is
-	  no hardware assist here.
-
-config BR2_PACKAGE_LIBEVAS_DIRECTFB
-	bool "libevas DirectFB backend"
-	depends on BR2_PACKAGE_DIRECTFB
-	default y
-	help
-	  This is the DirectFB engine that uses the DirectFB library
-	  (http://www.directfb.org) on Linux to access the framebuffer
-	  with (or maybe without) acceleration.
-
-config BR2_PACKAGE_LIBEVAS_FB
-	bool "libevas frame buffer backend"
-	help
-	  This is the software framebuffer driving engine. this uses
-	  the linux framebuffer device (/dev/fb<x>) and will currently
-	  just inherit the current framebuffer settings on the fb
-	  device and use them to run in.
-
-config BR2_PACKAGE_LIBEVAS_SDL
-	bool "libevas SDL backend"
-	select BR2_PACKAGE_SDL
-	help
-	  This is the software SDL engine that uses SDL library
-	  (http://www.libsdl.org). This library should work on many
-	  operating systems.
-
-config BR2_PACKAGE_LIBEVAS_SDL_GL
-	bool "libevas SDL OpenGL backend"
-	depends on BR2_PACKAGE_SDL_X11
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	help
-	  This is the SDL OpenGL engine that uses SDL library
-	  and OpenGL to render. This may be hardware accelerated.
-
-comment "SDL OpenGL backend needs modular X.org and X11 support in SDL"
-	depends on !(BR2_PACKAGE_SDL_X11 && BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR)
-
-config BR2_PACKAGE_LIBEVAS_X11
-	bool "libevas X11 backend"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	help
-	  This enables the software X11 rendering engine that renders
-	  to X drawable targets using highly optimised software
-	  routines. There is no hardware assist here.
-
-config BR2_PACKAGE_LIBEVAS_X11_GLX
-	bool "libevas X11 GLX backend"
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXRENDER
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	help
-	  This enables the OpenGL X11 rendering engine that renders
-	  using GLX which may be hardware accelerated.
-
-config BR2_PACKAGE_LIBEVAS_XCB
-	bool "libevas XCB backend"
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XCB_UTIL
-	select BR2_PACKAGE_XCB_PROTO
-	select BR2_PACKAGE_PIXMAN
-	help
-	  This enable the software XCB rendering engine. It allows the
-	  same features than the software X11 engine.
-
-config BR2_PACKAGE_LIBEVAS_XCB_GLX
-	bool "libevas XCB GLX backend"
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR # mesa needs big X
-	select BR2_PACKAGE_LIBXCB
-	select BR2_PACKAGE_XCB_UTIL
-	select BR2_PACKAGE_XCB_PROTO
-	select BR2_PACKAGE_XPROTO_GLPROTO
-	help
-	  This enables the OpenGL X11 XCB rendering engine that renders
-	  using GLX which may be hardware accelerated.
-
-choice
-	prompt "libevas OpenGL flavor"
-	depends on BR2_PACKAGE_LIBEVAS_SDL_GL || BR2_PACKAGE_LIBEVAS_X11_GLX || BR2_PACKAGE_LIBEVAS_XCB_GLX
-	default BR2_PACKAGE_LIBEVAS_GL
-
-config BR2_PACKAGE_LIBEVAS_GL
-	bool "generic OpenGL"
-	depends on BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_LIBEET
-
-config BR2_PACKAGE_LIBEVAS_GLES_SGX
-	bool "OpenGL-ES SGX"
-
-config BR2_PACKAGE_LIBEVAS_GLES_S3C6410
-	bool "OpenGL-ES S3C6410"
-endchoice
-
-
-comment "libevas loaders"
-
-config BR2_PACKAGE_LIBEVAS_PNG
-	bool "libevas png loader"
-	select BR2_PACKAGE_LIBPNG
-	help
-	  This enables the loader code that loads png files using
-	  libpng.
-
-config BR2_PACKAGE_LIBEVAS_JPEG
-	bool "libevas jpeg loader"
-	select BR2_PACKAGE_JPEG
-	help
-	  This enables the loader code that loads jpeg files using
-	  libjpeg.
-
-config BR2_PACKAGE_LIBEVAS_GIF
-	bool "libevas gif loader"
-	select BR2_PACKAGE_GIFLIB
-	help
-	  This enables the loader code that loads gif files using
-	  libungif.
-
-config BR2_PACKAGE_LIBEVAS_PMAPS
-	bool "libevas pmaps loader"
-	help
-	  This enables the loader code that loads pmaps files.
-
-config BR2_PACKAGE_LIBEVAS_TIFF
-	bool "libevas tiff loader"
-	select BR2_PACKAGE_TIFF
-	help
-	  This enables the loader code that loads tiff files.
-
-config BR2_PACKAGE_LIBEVAS_XPM
-	bool "libevas xpm loader"
-	help
-	  This enables the loader code that loads xpm files.
-
-config BR2_PACKAGE_LIBEVAS_EET
-	bool "libevas eet image loader"
-	select BR2_PACKAGE_LIBEET
-	help
-	  This enables the loader code that loads images using libeet.
-
-config BR2_PACKAGE_LIBEVAS_EET_FONT
-	bool "libevas eet font loader"
-	select BR2_PACKAGE_LIBEET
-	help
-	  This enables the loader code that loads fonts using libeet.
-
-endif # BR2_PACKAGE_LIBEVAS
diff --git a/package/libevas/libevas.mk b/package/libevas/libevas.mk
deleted file mode 100644
index 9adb128..0000000
--- a/package/libevas/libevas.mk
+++ /dev/null
@@ -1,247 +0,0 @@
-################################################################################
-#
-# libevas
-#
-################################################################################
-
-LIBEVAS_VERSION = 1.7.10
-LIBEVAS_SOURCE = evas-$(LIBEVAS_VERSION).tar.bz2
-LIBEVAS_SITE = http://download.enlightenment.org/releases
-LIBEVAS_LICENSE = BSD-2c
-LIBEVAS_LICENSE_FILES = COPYING
-
-LIBEVAS_INSTALL_STAGING = YES
-
-LIBEVAS_DEPENDENCIES = host-pkgconf zlib libeina freetype
-
-HOST_LIBEVAS_DEPENDENCIES = \
-	host-pkgconf host-zlib host-libeina \
-	host-freetype host-libpng host-libjpeg
-HOST_LIBEVAS_CONF_OPTS += \
-	--enable-image-loader-png \
-	--enable-image-loader-jpeg \
-	--disable-image-loader-gif \
-	--disable-image-loader-tiff \
-	--disable-image-loader-eet \
-	--disable-font-loader-eet \
-	--disable-cpu-sse3 \
-	--disable-software-sdl \
-	--disable-gl-sdl \
-	--disable-software-xlib \
-	--disable-gl-xlib \
-	--enable-software-xcb \
-	--disable-gl-xcb
-
-# rendering options
-ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SAMPLE),y)
-LIBEVAS_CONF_OPTS += --enable-scale-sample
-else
-LIBEVAS_CONF_OPTS += --disable-scale-sample
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_SCALE_SMOOTH),y)
-LIBEVAS_CONF_OPTS += --enable-scale-smooth
-else
-LIBEVAS_CONF_OPTS += --disable-scale-smooth
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_SMALL_DITHERING),y)
-LIBEVAS_CONF_OPTS += --enable-small-dither-mask
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_LINE_DITHERING),y)
-LIBEVAS_CONF_OPTS += --enable-line-dither-mask
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_NO_DITHERING),y)
-LIBEVAS_CONF_OPTS += --enable-no-dither-mask
-endif
-
-# backends
-ifeq ($(BR2_PACKAGE_LIBEVAS_BUFFER),y)
-LIBEVAS_CONF_OPTS += --enable-buffer
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_X11),y)
-LIBEVAS_CONF_OPTS += --enable-software-xlib \
-	--with-x=$(STAGING_DIR) \
-	--x-includes=$(STAGING_DIR)/usr/include \
-	--x-libraries=$(STAGING_DIR)/usr/lib
-LIBEVAS_DEPENDENCIES += xlib_libX11 xlib_libXext
-else
-LIBEVAS_CONF_OPTS += --disable-software-xlib
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_X11_GLX),y)
-LIBEVAS_CONF_OPTS += --enable-gl-xlib
-LIBEVAS_DEPENDENCIES += \
-	xproto_glproto xlib_libX11 xlib_libXrender \
-	xlib_libXext libeet
-else
-LIBEVAS_CONF_OPTS += --disable-gl-xlib
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_XCB),y)
-LIBEVAS_CONF_OPTS += --enable-software-xcb
-LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util pixman
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_XCB_GLX),y)
-LIBEVAS_CONF_OPTS += --enable-gl-xcb
-LIBEVAS_DEPENDENCIES += libxcb xcb-proto xcb-util xproto_glproto
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_FB),y)
-LIBEVAS_CONF_OPTS += --enable-fb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_DIRECTFB),y)
-LIBEVAS_CONF_OPTS += --enable-directfb
-LIBEVAS_DEPENDENCIES += directfb
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_SDL),y)
-LIBEVAS_CONF_OPTS += --enable-software-sdl
-LIBEVAS_DEPENDENCIES += sdl
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_SDL_GL),y)
-LIBEVAS_CONF_OPTS += --enable-gl-sdl
-LIBEVAS_DEPENDENCIES += sdl
-# configure script forgets to check for eet / fill this out
-LIBEVAS_CONF_ENV += \
-	GL_EET_CFLAGS='-I$(STAGING_DIR)/usr/include/eet-1' \
-	GL_EET_LIBS='-leet'
-endif
-
-# libevas OpenGL flavor
-ifeq ($(BR2_PACKAGE_LIBEVAS_GL),y)
-LIBEVAS_DEPENDENCIES += mesa3d libeet
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
-LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-sgx
-else
-LIBEVAS_CONF_OPTS += --disable-gles-variety-sgx
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),y)
-LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
-else
-LIBEVAS_CONF_OPTS += --disable-gles-variety-s3c6410
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX)$(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),)
-LIBEVAS_CONF_OPTS += --disable-gl-flavor-gles
-endif
-
-# code options
-ifeq ($(BR2_X86_CPU_HAS_MMX),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-mmx
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-mmx
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-sse
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-sse
-endif
-
-ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-sse3
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-sse3
-endif
-
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-altivec
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-altivec
-endif
-
-ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
-LIBEVAS_CONF_OPTS += --enable-cpu-neon
-else
-LIBEVAS_CONF_OPTS += --disable-cpu-neon
-endif
-
-# loaders
-ifeq ($(BR2_PACKAGE_LIBEVAS_PNG),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-png
-LIBEVAS_DEPENDENCIES += libpng
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-png
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_JPEG),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-jpeg
-LIBEVAS_DEPENDENCIES += jpeg
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-jpeg
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_GIF),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-gif
-LIBEVAS_DEPENDENCIES += giflib
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-gif
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_PMAPS),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-pmaps
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-pmaps
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_TIFF),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-tiff
-LIBEVAS_DEPENDENCIES += tiff
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-tiff
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_XPM),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-xpm
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-xpm
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_EET),y)
-LIBEVAS_CONF_OPTS += --enable-image-loader-eet
-LIBEVAS_DEPENDENCIES += libeet
-else
-LIBEVAS_CONF_OPTS += --disable-image-loader-eet
-endif
-
-ifeq ($(BR2_PACKAGE_LIBEVAS_EET_FONT),y)
-LIBEVAS_CONF_OPTS += --enable-font-loader-eet
-LIBEVAS_DEPENDENCIES += libeet
-else
-LIBEVAS_CONF_OPTS += --disable-font-loader-eet
-endif
-
-ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
-LIBEVAS_CONF_OPTS += --enable-fontconfig
-LIBEVAS_DEPENDENCIES += fontconfig
-else
-LIBEVAS_CONF_OPTS += --disable-fontconfig
-endif
-
-ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
-LIBEVAS_CONF_OPTS += --enable-fribidi
-LIBEVAS_DEPENDENCIES += libfribidi
-else
-LIBEVAS_CONF_OPTS += --disable-fribidi
-endif
-
-# libevas installs the source code of examples on the target, which
-# are generally not useful.
-define LIBEVAS_REMOVE_EXAMPLES
-	rm -rf $(TARGET_DIR)/usr/share/evas/examples/
-endef
-
-LIBEVAS_POST_INSTALL_TARGET_HOOKS += LIBEVAS_REMOVE_EXAMPLES
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-- 
2.4.3
