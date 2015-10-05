From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Oct 2015 16:52:36 -0300
Subject: [Buildroot] [PATCH] gdk-pixbuf: security bump to version 2.32.1
Message-ID: <1444074756-30032-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2015-4491 already fixed in the release so drop patch.

Fixes a heap overflow with a gif file and a heap overflow and DoS with a
tga file. CVEs not assigned yet.

Tests disabled since they fail to build properly on uClibc toolchains.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gdk-pixbuf/0001-fix-CVE-2015-4491.patch | 84 -------------------------
 package/gdk-pixbuf/gdk-pixbuf.hash              |  4 +-
 package/gdk-pixbuf/gdk-pixbuf.mk                | 10 ++-
 3 files changed, 10 insertions(+), 88 deletions(-)
 delete mode 100644 package/gdk-pixbuf/0001-fix-CVE-2015-4491.patch

diff --git a/package/gdk-pixbuf/0001-fix-CVE-2015-4491.patch b/package/gdk-pixbuf/0001-fix-CVE-2015-4491.patch
deleted file mode 100644
index d2a68bd..0000000
--- a/package/gdk-pixbuf/0001-fix-CVE-2015-4491.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From ffec86ed5010c5a2be14f47b33bcf4ed3169a199 Mon Sep 17 00:00:00 2001
-From: Matthias Clasen <mclasen@redhat.com>
-Date: Mon, 13 Jul 2015 00:33:40 -0400
-Subject: pixops: Be more careful about integer overflow
-
-Our loader code is supposed to handle out-of-memory and overflow
-situations gracefully, reporting errors instead of aborting. But
-if you load an image at a specific size, we also execute our
-scaling code, which was not careful enough about overflow in some
-places.
-
-This commit makes the scaling code silently return if it fails to
-allocate filter tables. This is the best we can do, since
-gdk_pixbuf_scale() is not taking a GError.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=752297
-
-Signed-off-by: Gustavo Zacarisa <gustavo@zacarias.com.ar>
-
-diff --git a/gdk-pixbuf/pixops/pixops.c b/gdk-pixbuf/pixops/pixops.c
-index 29a1c14..ce51745 100644
---- a/gdk-pixbuf/pixops/pixops.c
-+++ b/gdk-pixbuf/pixops/pixops.c
-@@ -1272,7 +1272,16 @@ make_filter_table (PixopsFilter *filter)
-   int i_offset, j_offset;
-   int n_x = filter->x.n;
-   int n_y = filter->y.n;
--  int *weights = g_new (int, SUBSAMPLE * SUBSAMPLE * n_x * n_y);
-+  gsize n_weights;
-+  int *weights;
-+
-+  n_weights = SUBSAMPLE * SUBSAMPLE * n_x * n_y;
-+  if (n_weights / (SUBSAMPLE * SUBSAMPLE * n_x) != n_y)
-+    return NULL; /* overflow, bail */
-+
-+  weights = g_try_new (int, n_weights);
-+  if (!weights)
-+    return NULL; /* overflow, bail */
- 
-   for (i_offset=0; i_offset < SUBSAMPLE; i_offset++)
-     for (j_offset=0; j_offset < SUBSAMPLE; j_offset++)
-@@ -1347,8 +1356,11 @@ pixops_process (guchar         *dest_buf,
-   if (x_step == 0 || y_step == 0)
-     return; /* overflow, bail out */
- 
--  line_bufs = g_new (guchar *, filter->y.n);
-   filter_weights = make_filter_table (filter);
-+  if (!filter_weights)
-+    return; /* overflow, bail out */
-+
-+  line_bufs = g_new (guchar *, filter->y.n);
- 
-   check_shift = check_size ? get_check_shift (check_size) : 0;
- 
-@@ -1468,7 +1480,7 @@ tile_make_weights (PixopsFilterDimension *dim,
- 		   double                 scale)
- {
-   int n = ceil (1 / scale + 1);
--  double *pixel_weights = g_new (double, SUBSAMPLE * n);
-+  double *pixel_weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
-   int offset;
-   int i;
- 
-@@ -1526,7 +1538,7 @@ bilinear_magnify_make_weights (PixopsFilterDimension *dim,
-     }
- 
-   dim->n = n;
--  dim->weights = g_new (double, SUBSAMPLE * n);
-+  dim->weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
- 
-   pixel_weights = dim->weights;
- 
-@@ -1617,7 +1629,7 @@ bilinear_box_make_weights (PixopsFilterDimension *dim,
- 			   double                 scale)
- {
-   int n = ceil (1/scale + 3.0);
--  double *pixel_weights = g_new (double, SUBSAMPLE * n);
-+  double *pixel_weights = g_malloc_n (sizeof (double) * SUBSAMPLE, n);
-   double w;
-   int offset, i;
- 
--- 
-cgit v0.10.2
-
diff --git a/package/gdk-pixbuf/gdk-pixbuf.hash b/package/gdk-pixbuf/gdk-pixbuf.hash
index 3efe9d3..3bf6ae6 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.hash
+++ b/package/gdk-pixbuf/gdk-pixbuf.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.30/gdk-pixbuf-2.30.8.sha256sum
-sha256	4853830616113db4435837992c0aebd94cbb993c44dc55063cee7f72a7bef8be	gdk-pixbuf-2.30.8.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.32/gdk-pixbuf-2.32.1.sha256sum
+sha256	4432b74f25538c7d6bcb3ca51adabdd666168955f25812a2568dc9637697f3bc	gdk-pixbuf-2.32.1.tar.xz
diff --git a/package/gdk-pixbuf/gdk-pixbuf.mk b/package/gdk-pixbuf/gdk-pixbuf.mk
index 3a66e61..1167fb9 100644
--- a/package/gdk-pixbuf/gdk-pixbuf.mk
+++ b/package/gdk-pixbuf/gdk-pixbuf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GDK_PIXBUF_VERSION_MAJOR = 2.30
-GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).8
+GDK_PIXBUF_VERSION_MAJOR = 2.32
+GDK_PIXBUF_VERSION = $(GDK_PIXBUF_VERSION_MAJOR).1
 GDK_PIXBUF_SOURCE = gdk-pixbuf-$(GDK_PIXBUF_VERSION).tar.xz
 GDK_PIXBUF_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/$(GDK_PIXBUF_VERSION_MAJOR)
 GDK_PIXBUF_LICENSE = LGPLv2+
@@ -52,6 +52,12 @@ define GDK_PIXBUF_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S26gdk-pixbuf
 endef
 
+# Tests don't build correctly with uClibc
+define GDK_PIXBUF_DISABLE_TESTS
+	$(SED) 's/ tests//' $(@D)/Makefile.in
+endef
+GDK_PIXBUF_POST_PATCH_HOOKS += GDK_PIXBUF_DISABLE_TESTS
+
 $(eval $(autotools-package))
 
 HOST_GDK_PIXBUF_CONF_OPTS = \
-- 
2.4.9
