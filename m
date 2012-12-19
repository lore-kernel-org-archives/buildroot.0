From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Wed, 19 Dec 2012 23:42:22 +0100
Subject: [Buildroot] [PATCH 1/1] cairo graphics bump version to 1.12.8 and
	drop patch
Message-ID: <1355956942-30228-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/cairo/cairo-1.10.2-directfb.patch | 36 -------------------------------
 package/cairo/cairo.mk                    |  6 ++++--
 2 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 package/cairo/cairo-1.10.2-directfb.patch

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
index 59a032a..46881ef 100644
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
 
-- 
1.8.0.1
