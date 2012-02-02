From: Will Newton <will.newton@gmail.com>
Date: Thu, 2 Feb 2012 12:55:43 +0000
Subject: [Buildroot] [PATCH] cairo: Bump version to 1.10.2
Message-ID: <CAFbHwiTXjCwcfAD=KxKjrYUnP5hkWibjwFxNNXO7K=eG5Cf7MA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the DirectFB patch as it no longer applied cleanly.

Signed-off-by: Will Newton <will.newton@imgtec.com>
---
 package/cairo/cairo-1.10.2-directfb.patch |   36 ++++++++++++++++++++++++++
 package/cairo/cairo-1.8.10-directfb.patch |   39 -----------------------------
 package/cairo/cairo.mk                    |    3 +-
 3 files changed, 37 insertions(+), 41 deletions(-)
 create mode 100644 package/cairo/cairo-1.10.2-directfb.patch
 delete mode 100644 package/cairo/cairo-1.8.10-directfb.patch

diff --git a/package/cairo/cairo-1.10.2-directfb.patch
b/package/cairo/cairo-1.10.2-directfb.patch
new file mode 100644
index 0000000..8b4c6f7
--- /dev/null
+++ b/package/cairo/cairo-1.10.2-directfb.patch
@@ -0,0 +1,36 @@
+--- cairo-1.10.2/src/cairo-directfb-surface.c	2010-06-18
12:47:12.000000000 +0100
++++ cairo-1.10.2.mod/src/cairo-directfb-surface.c	2012-02-02
11:40:57.835273391 +0000
+@@ -700,6 +700,7 @@
+ 	surface->dfbsurface->Blit (surface->dfbsurface,
+ 				   buffer, NULL,
+ 				   image_rect->x, image_rect->y);
++        surface->dfbsurface->ReleaseSource (surface->dfbsurface);
+     }
+
+     cairo_surface_destroy (&image->base);
+@@ -928,6 +929,9 @@
+                             cairo_surface_attributes_t *src_attr)
+ {
+     _cairo_pattern_release_surface (src_pattern, src, src_attr);
++
++    if (dst->dfbsurface)
++        dst->dfbsurface->ReleaseSource (dst->dfbsurface);
+ }
+ #endif /* DFB_COMPOSITE || DFB_COMPOSITE_TRAPEZOIDS */
+
+@@ -1584,6 +1588,7 @@
+
+ 	    new_cache->dfbsurface->Blit (new_cache->dfbsurface,
+ 					 cache->dfbsurface, NULL, 0, 0);
++            new_cache->dfbsurface->ReleaseSource (new_cache->dfbsurface);
+
+ 	    _directfb_destroy_font_cache (cache);
+ 	    scaled_font->surface_private = cache = new_cache;
+@@ -1809,6 +1814,7 @@
+     RUN_CLIPPED (dst, clip_region, NULL,
+ 		 dst->dfbsurface->BatchBlit (dst->dfbsurface,
+ 					     cache->dfbsurface, rects, points, num));
++    dst->dfbsurface->ReleaseSource (dst->dfbsurface);
+
+     return CAIRO_STATUS_SUCCESS;
+ }
diff --git a/package/cairo/cairo-1.8.10-directfb.patch
b/package/cairo/cairo-1.8.10-directfb.patch
deleted file mode 100644
index 12a51ec..0000000
--- a/package/cairo/cairo-1.8.10-directfb.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-diff --git a/src/cairo-directfb-surface.c b/src/cairo-directfb-surface.c
-index bb02dbf..65f2d55 100644
---- a/src/cairo-directfb-surface.c
-+++ b/src/cairo-directfb-surface.c
-@@ -609,6 +609,8 @@ _cairo_directfb_surface_release_dest_image (void
                *abstract_surf
- 		     surface->dfbsurface->Blit (surface->dfbsurface,
- 						buffer, NULL,
- 						image_rect->x, image_rect->y));
-+
-+    surface->dfbsurface->ReleaseSource (surface->dfbsurface);
-     }
-
-     cairo_surface_destroy (&image->base);
-@@ -848,6 +850,9 @@ _directfb_finish_composite
(cairo_directfb_surface_t   *dst,
-                             cairo_surface_attributes_t *src_attr)
- {
-     _cairo_pattern_release_surface (src_pattern, src, src_attr);
-+
-+    if (dst->dfbsurface)
-+         dst->dfbsurface->ReleaseSource( dst->dfbsurface );
- }
- #endif /* DFB_COMPOSITE || DFB_COMPOSITE_TRAPEZOIDS */
-
-@@ -1555,6 +1560,7 @@ _directfb_acquire_font_cache
(cairo_directfb_surface_t     *surface,
-
- 	    new_cache->dfbsurface->Blit (new_cache->dfbsurface,
- 					 cache->dfbsurface, NULL, 0, 0);
-+        new_cache->dfbsurface->ReleaseSource (new_cache->dfbsurface);
-
- 	    _directfb_destroy_font_cache (cache);
- 	    scaled_font->surface_private = cache = new_cache;
-@@ -1778,6 +1784,7 @@ _cairo_directfb_surface_show_glyphs (void
         *abstract_dst,
-     RUN_CLIPPED (dst, NULL,
- 		 dst->dfbsurface->BatchBlit (dst->dfbsurface,
- 					     cache->dfbsurface, rects, points, num));
-+    dst->dfbsurface->ReleaseSource (dst->dfbsurface);
-
-     return CAIRO_STATUS_SUCCESS;
- }
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 2230587..26984c4 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -3,12 +3,11 @@
 # cairo
 #
 #############################################################
-CAIRO_VERSION = 1.8.10
+CAIRO_VERSION = 1.10.2
 CAIRO_SOURCE = cairo-$(CAIRO_VERSION).tar.gz
 CAIRO_SITE = http://cairographics.org/releases
 CAIRO_AUTORECONF = NO
 CAIRO_INSTALL_STAGING = YES
-CAIRO_INSTALL_TARGET = YES

 CAIRO_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes glib_cv_stack_grows=no \
 		glib_cv_uscore=no ac_cv_func_strtod=yes \
-- 
1.7.1
-------------- next part --------------
