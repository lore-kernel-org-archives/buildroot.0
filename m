From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2020 22:58:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/graphicsmagick: fix CVE-2020-12672
Message-ID: <20200905205810.1642301-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GraphicsMagick through 1.3.35 has a heap-based buffer overflow in
ReadMNGImage in coders/png.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-small-heap-overwrite-or-assertion.patch | 78 +++++++++++++++++++
 package/graphicsmagick/graphicsmagick.mk      |  3 +
 2 files changed, 81 insertions(+)
 create mode 100644 package/graphicsmagick/0001-MNG-Fix-small-heap-overwrite-or-assertion.patch

diff --git a/package/graphicsmagick/0001-MNG-Fix-small-heap-overwrite-or-assertion.patch b/package/graphicsmagick/0001-MNG-Fix-small-heap-overwrite-or-assertion.patch
new file mode 100644
index 0000000000..6fac7d0302
--- /dev/null
+++ b/package/graphicsmagick/0001-MNG-Fix-small-heap-overwrite-or-assertion.patch
@@ -0,0 +1,78 @@
+# HG changeset patch
+# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
+# Date 1590851896 18000
+#      Sat May 30 10:18:16 2020 -0500
+# Node ID 50395430a37188d0d197e71bd85ed6dd0f649ee3
+# Parent  4917a4242fc0a12f2f6baa10f1c5a9b3e68c20dd
+MNG: Fix small heap overwrite or assertion if magnifying and image to be magnified has rows or columns == 1.
+
+[Retrieved (and updated to remove ChangeLog and version changes) from:
+https://sourceforge.net/p/graphicsmagick/code/ci/50395430a37188d0d197e71bd85ed6dd0f649ee3]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -r 4917a4242fc0 -r 50395430a371 coders/png.c
+--- a/coders/png.c	Fri May 01 13:49:13 2020 -0500
++++ b/coders/png.c	Sat May 30 10:18:16 2020 -0500
+@@ -5304,7 +5304,7 @@
+               if (logging)
+                 (void) LogMagickEvent(CoderEvent,GetMagickModule(),
+                                       "MAGN chunk (%lu bytes): "
+-                                      "First_magnified_object_id=%u, Last_magnified_object_id=%u, "
++                                      "First_magnified_object_id=%u, Las t_magnified_object_id=%u, "
+                                       "MB=%u, ML=%u, MR=%u, MT=%u, MX=%u, MY=%u, "
+                                       "X_method=%u, Y_method=%u",
+                                       length,
+@@ -5679,6 +5679,8 @@
+           /*
+             If magnifying and a supported method is requested then
+             magnify the image.
++
++            http://www.libpng.org/pub/mng/spec/mng-1.0-20010209-pdg.html#mng-MAGN
+           */
+           if (((mng_info->magn_methx > 0) && (mng_info->magn_methx <= 5)) &&
+               ((mng_info->magn_methy > 0) && (mng_info->magn_methy <= 5)))
+@@ -5689,7 +5691,28 @@
+ 
+               if (logging)
+                 (void) LogMagickEvent(CoderEvent,GetMagickModule(),
+-                                      "  Processing MNG MAGN chunk");
++                                      "  Processing MNG MAGN chunk: MB=%u, ML=%u,"
++                                      " MR=%u, MT=%u, MX=%u, MY=%u,"
++                                      " X_method=%u, Y_method=%u",
++                                      mng_info->magn_mb,mng_info->magn_ml,
++                                      mng_info->magn_mr,mng_info->magn_mt,
++                                      mng_info->magn_mx,mng_info->magn_my,
++                                      mng_info->magn_methx,
++                                      mng_info->magn_methy);
++
++              /*
++                If the image width is 1, then X magnification is done
++                by simple pixel replication.
++              */
++              if (image->columns == 1)
++                  mng_info->magn_methx = 1;
++
++              /*
++                If the image height is 1, then Y magnification is done
++                by simple pixel replication.
++              */
++              if (image->rows == 1)
++                  mng_info->magn_methy = 1;
+ 
+               if (mng_info->magn_methx == 1)
+                 {
+@@ -5734,12 +5757,10 @@
+                   Image
+                     *large_image;
+ 
+-                  int
+-                    yy;
+-
+                   long
+                     m,
+-                    y;
++                    y,
++                    yy;
+ 
+                   register long
+                     x;
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 782dd1431e..436df709e7 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -13,6 +13,9 @@ GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
 GRAPHICSMAGICK_INSTALL_STAGING = YES
 GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
 
+# 0001-MNG-Fix-small-heap-overwrite-or-assertion.patch
+GRAPHICSMAGICK_IGNORE_CVES += CVE-2020-12672
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP)$(BR2_USE_WCHAR),yy)
 GRAPHICSMAGICK_CONFIG_SCRIPTS += GraphicsMagick++-config
 endif
-- 
2.28.0
