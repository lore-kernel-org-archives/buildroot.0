From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Dec 2020 22:28:58 +0100
Subject: [Buildroot] [git commit] package/graphicsmagick: bump to version
 1.3.36
Message-ID: <20201228211137.E7AA983253@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3591056cd2ae04db3a73c50530bdc927773f26f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...MNG-Fix-small-heap-overwrite-or-assertion.patch | 78 ----------------------
 package/graphicsmagick/graphicsmagick.hash         |  2 +-
 package/graphicsmagick/graphicsmagick.mk           |  5 +-
 3 files changed, 2 insertions(+), 83 deletions(-)

diff --git a/package/graphicsmagick/0001-MNG-Fix-small-heap-overwrite-or-assertion.patch b/package/graphicsmagick/0001-MNG-Fix-small-heap-overwrite-or-assertion.patch
deleted file mode 100644
index 6fac7d0302..0000000000
--- a/package/graphicsmagick/0001-MNG-Fix-small-heap-overwrite-or-assertion.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-# HG changeset patch
-# User Bob Friesenhahn <bfriesen@GraphicsMagick.org>
-# Date 1590851896 18000
-#      Sat May 30 10:18:16 2020 -0500
-# Node ID 50395430a37188d0d197e71bd85ed6dd0f649ee3
-# Parent  4917a4242fc0a12f2f6baa10f1c5a9b3e68c20dd
-MNG: Fix small heap overwrite or assertion if magnifying and image to be magnified has rows or columns == 1.
-
-[Retrieved (and updated to remove ChangeLog and version changes) from:
-https://sourceforge.net/p/graphicsmagick/code/ci/50395430a37188d0d197e71bd85ed6dd0f649ee3]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -r 4917a4242fc0 -r 50395430a371 coders/png.c
---- a/coders/png.c	Fri May 01 13:49:13 2020 -0500
-+++ b/coders/png.c	Sat May 30 10:18:16 2020 -0500
-@@ -5304,7 +5304,7 @@
-               if (logging)
-                 (void) LogMagickEvent(CoderEvent,GetMagickModule(),
-                                       "MAGN chunk (%lu bytes): "
--                                      "First_magnified_object_id=%u, Last_magnified_object_id=%u, "
-+                                      "First_magnified_object_id=%u, Las t_magnified_object_id=%u, "
-                                       "MB=%u, ML=%u, MR=%u, MT=%u, MX=%u, MY=%u, "
-                                       "X_method=%u, Y_method=%u",
-                                       length,
-@@ -5679,6 +5679,8 @@
-           /*
-             If magnifying and a supported method is requested then
-             magnify the image.
-+
-+            http://www.libpng.org/pub/mng/spec/mng-1.0-20010209-pdg.html#mng-MAGN
-           */
-           if (((mng_info->magn_methx > 0) && (mng_info->magn_methx <= 5)) &&
-               ((mng_info->magn_methy > 0) && (mng_info->magn_methy <= 5)))
-@@ -5689,7 +5691,28 @@
- 
-               if (logging)
-                 (void) LogMagickEvent(CoderEvent,GetMagickModule(),
--                                      "  Processing MNG MAGN chunk");
-+                                      "  Processing MNG MAGN chunk: MB=%u, ML=%u,"
-+                                      " MR=%u, MT=%u, MX=%u, MY=%u,"
-+                                      " X_method=%u, Y_method=%u",
-+                                      mng_info->magn_mb,mng_info->magn_ml,
-+                                      mng_info->magn_mr,mng_info->magn_mt,
-+                                      mng_info->magn_mx,mng_info->magn_my,
-+                                      mng_info->magn_methx,
-+                                      mng_info->magn_methy);
-+
-+              /*
-+                If the image width is 1, then X magnification is done
-+                by simple pixel replication.
-+              */
-+              if (image->columns == 1)
-+                  mng_info->magn_methx = 1;
-+
-+              /*
-+                If the image height is 1, then Y magnification is done
-+                by simple pixel replication.
-+              */
-+              if (image->rows == 1)
-+                  mng_info->magn_methy = 1;
- 
-               if (mng_info->magn_methx == 1)
-                 {
-@@ -5734,12 +5757,10 @@
-                   Image
-                     *large_image;
- 
--                  int
--                    yy;
--
-                   long
-                     m,
--                    y;
-+                    y,
-+                    yy;
- 
-                   register long
-                     x;
diff --git a/package/graphicsmagick/graphicsmagick.hash b/package/graphicsmagick/graphicsmagick.hash
index cb91ff0d03..5a006dd160 100644
--- a/package/graphicsmagick/graphicsmagick.hash
+++ b/package/graphicsmagick/graphicsmagick.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  188a8d6108fea87a0208723e8d206ec1d4d7299022be8ce5d0a9720509250250  GraphicsMagick-1.3.35.tar.xz
+sha256  5d5b3fde759cdfc307aaf21df9ebd8c752e3f088bb051dd5df8aac7ba7338f46  GraphicsMagick-1.3.36.tar.xz
 sha256  1d28851631892098e0bf8653fd4e89f3524184d136391b54c664e89251ca3a9a  Copyright.txt
diff --git a/package/graphicsmagick/graphicsmagick.mk b/package/graphicsmagick/graphicsmagick.mk
index 7e71870482..8b96d7235d 100644
--- a/package/graphicsmagick/graphicsmagick.mk
+++ b/package/graphicsmagick/graphicsmagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHICSMAGICK_VERSION = 1.3.35
+GRAPHICSMAGICK_VERSION = 1.3.36
 GRAPHICSMAGICK_SOURCE = GraphicsMagick-$(GRAPHICSMAGICK_VERSION).tar.xz
 GRAPHICSMAGICK_SITE = https://downloads.sourceforge.net/project/graphicsmagick/graphicsmagick/$(GRAPHICSMAGICK_VERSION)
 GRAPHICSMAGICK_LICENSE = MIT
@@ -13,9 +13,6 @@ GRAPHICSMAGICK_LICENSE_FILES = Copyright.txt
 GRAPHICSMAGICK_INSTALL_STAGING = YES
 GRAPHICSMAGICK_CONFIG_SCRIPTS = GraphicsMagick-config GraphicsMagickWand-config
 
-# 0001-MNG-Fix-small-heap-overwrite-or-assertion.patch
-GRAPHICSMAGICK_IGNORE_CVES += CVE-2020-12672
-
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 GRAPHICSMAGICK_CONFIG_SCRIPTS += GraphicsMagick++-config
 endif
