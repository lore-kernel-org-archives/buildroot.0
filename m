From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 19:56:46 +0100
Subject: [Buildroot] [git commit] cairo: bump version to 1.12.8
Message-ID: <20130113192104.60B1D806B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=526dd5d272e519f80ee0422de1dc191df8ba6604
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Directfb patch no longer needed.

[Peter: Add options for script/xml backends, support for Xrender backend]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cairo/Config.in                   |    9 +++++++
 package/cairo/cairo-1.10.2-directfb.patch |   36 -----------------------------
 package/cairo/cairo.mk                    |   26 +++++++++++++++++++-
 3 files changed, 33 insertions(+), 38 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 4a2078e..3a3fb88 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -28,6 +28,10 @@ config BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_ZLIB
 
+config BR2_PACKAGE_CAIRO_SCRIPT
+	bool "script support"
+	select BR2_PACKAGE_ZLIB
+
 config BR2_PACKAGE_CAIRO_SVG
 	bool "svg support"
 	select BR2_PACKAGE_CAIRO_PNG
@@ -35,5 +39,10 @@ config BR2_PACKAGE_CAIRO_SVG
 
 config BR2_PACKAGE_CAIRO_TEE
 	bool "tee support"
+
+config BR2_PACKAGE_CAIRO_XML
+	bool "xml support"
+	select BR2_PACKAGE_CAIRO_PNG
+
 endif
 
diff --git a/package/cairo/cairo-1.10.2-directfb.patch b/package/cairo/cairo-1.10.2-directfb.patch
deleted file mode 100644
index 8b4c6f7..0000000
--- a/package/cairo/cairo-1.10.2-directfb.patch
+++ /dev/null
@@ -1,36 +0,0 @@
---- cairo-1.10.2/src/cairo-directfb-surface.c	2010-06-18 12:47:12.000000000 +0100
-+++ cairo-1.10.2.mod/src/cairo-directfb-surface.c	2012-02-02 11:40:57.835273391 +0000
-@@ -700,6 +700,7 @@
- 	surface->dfbsurface->Blit (surface->dfbsurface,
- 				   buffer, NULL,
- 				   image_rect->x, image_rect->y);
-+        surface->dfbsurface->ReleaseSource (surface->dfbsurface);
-     }
- 
-     cairo_surface_destroy (&image->base);
-@@ -928,6 +929,9 @@
-                             cairo_surface_attributes_t *src_attr)
- {
-     _cairo_pattern_release_surface (src_pattern, src, src_attr);
-+
-+    if (dst->dfbsurface)
-+        dst->dfbsurface->ReleaseSource (dst->dfbsurface);
- }
- #endif /* DFB_COMPOSITE || DFB_COMPOSITE_TRAPEZOIDS */
- 
-@@ -1584,6 +1588,7 @@
- 
- 	    new_cache->dfbsurface->Blit (new_cache->dfbsurface,
- 					 cache->dfbsurface, NULL, 0, 0);
-+            new_cache->dfbsurface->ReleaseSource (new_cache->dfbsurface);
- 
- 	    _directfb_destroy_font_cache (cache);
- 	    scaled_font->surface_private = cache = new_cache;
-@@ -1809,6 +1814,7 @@
-     RUN_CLIPPED (dst, clip_region, NULL,
- 		 dst->dfbsurface->BatchBlit (dst->dfbsurface,
- 					     cache->dfbsurface, rects, points, num));
-+    dst->dfbsurface->ReleaseSource (dst->dfbsurface);
- 
-     return CAIRO_STATUS_SUCCESS;
- }
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 6cf910a..8885ab0 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -3,8 +3,10 @@
 # cairo
 #
 #############################################################
-CAIRO_VERSION = 1.10.2
-CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.gz
+CAIRO_VERSION = 1.12.8
+CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.xz
+CAIRO_LICENSE = LGPLv2.1+
+CAIRO_LICENSE_FILES = COPYING
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_INSTALL_STAGING = YES
 
@@ -54,6 +56,13 @@ else
 	CAIRO_CONF_OPT += --disable-xlib --disable-xcb --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRENDER),y)
+	CAIRO_CONF_OPT += --enable-xlib-xrender
+	CAIRO_DEPENDENCIES += xlib_libXrender
+else
+	CAIRO_CONF_OPT += --disable-xlib-xrender
+endif
+
 ifeq ($(BR2_PACKAGE_CAIRO_PS),y)
 	CAIRO_CONF_OPT += --enable-ps
 	CAIRO_DEPENDENCIES += zlib
@@ -75,6 +84,13 @@ else
 	CAIRO_CONF_OPT += --disable-png
 endif
 
+ifeq ($(BR2_PACKAGE_CAIRO_SCRIPT),y)
+	CAIRO_CONF_OPT += --enable-script
+	CAIRO_DEPENDENCIES += zlib
+else
+	CAIRO_CONF_OPT += --disable-script
+endif
+
 ifeq ($(BR2_PACKAGE_CAIRO_SVG),y)
 	CAIRO_CONF_OPT += --enable-svg
 else
@@ -87,4 +103,10 @@ else
 	CAIRO_CONF_OPT += --disable-tee
 endif
 
+ifeq ($(BR2_PACKAGE_CAIRO_XML),y)
+	CAIRO_CONF_OPT += --enable-xml
+else
+	CAIRO_CONF_OPT += --disable-xml
+endif
+
 $(eval $(autotools-package))
