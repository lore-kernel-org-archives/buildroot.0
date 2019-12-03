From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 13:25:39 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/jpeg-turbo: bump
 to version 2.0.2
Message-ID: <20191203121752.4D26683D24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8996a2dba2510cad072580834be1a86843ab2c3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Remove two patches (already in version)
- Update hash of LICENSE.md, clarifications on BSD and zlib were added:
  https://github.com/libjpeg-turbo/libjpeg-turbo/commit/90e2d7f3fdbfbc00afc2d21c4a5b61eebcd3c849

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7939c4d39bac73ebc5e61f3d0e0a46c11e707021)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Image-Fix-int-overflow-segfault-w-big-BMP.patch | 51 ----------------------
 ...p.c-Don-t-allow-quantization-w-non-RGB-CS.patch | 39 -----------------
 package/jpeg-turbo/jpeg-turbo.hash                 | 10 ++---
 package/jpeg-turbo/jpeg-turbo.mk                   |  2 +-
 4 files changed, 6 insertions(+), 96 deletions(-)

diff --git a/package/jpeg-turbo/0001-tjLoadImage-Fix-int-overflow-segfault-w-big-BMP.patch b/package/jpeg-turbo/0001-tjLoadImage-Fix-int-overflow-segfault-w-big-BMP.patch
deleted file mode 100644
index a10fcf62af..0000000000
--- a/package/jpeg-turbo/0001-tjLoadImage-Fix-int-overflow-segfault-w-big-BMP.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 3d9c64e9f8aa1ee954d1d0bb3390fc894bb84da3 Mon Sep 17 00:00:00 2001
-From: DRC <information@libjpeg-turbo.org>
-Date: Tue, 1 Jan 2019 18:57:36 -0600
-Subject: [PATCH] tjLoadImage(): Fix int overflow/segfault w/big BMP
-
-Fixes #304
-
-[baruch: drop the ChangeLog.md hunk]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 3d9c64e9f8aa
-
- ChangeLog.md | 4 ++++
- turbojpeg.c  | 9 ++++++---
- 2 files changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/turbojpeg.c b/turbojpeg.c
-index 90a9ce6a0be8..3f7cd640677f 100644
---- a/turbojpeg.c
-+++ b/turbojpeg.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C)2009-2018 D. R. Commander.  All Rights Reserved.
-+ * Copyright (C)2009-2019 D. R. Commander.  All Rights Reserved.
-  *
-  * Redistribution and use in source and binary forms, with or without
-  * modification, are permitted provided that the following conditions are met:
-@@ -1960,7 +1960,8 @@ DLLEXPORT unsigned char *tjLoadImage(const char *filename, int *width,
-                                      int align, int *height, int *pixelFormat,
-                                      int flags)
- {
--  int retval = 0, tempc, pitch;
-+  int retval = 0, tempc;
-+  size_t pitch;
-   tjhandle handle = NULL;
-   tjinstance *this;
-   j_compress_ptr cinfo = NULL;
-@@ -2013,7 +2014,9 @@ DLLEXPORT unsigned char *tjLoadImage(const char *filename, int *width,
-   *pixelFormat = cs2pf[cinfo->in_color_space];
- 
-   pitch = PAD((*width) * tjPixelSize[*pixelFormat], align);
--  if ((dstBuf = (unsigned char *)malloc(pitch * (*height))) == NULL)
-+  if ((unsigned long long)pitch * (unsigned long long)(*height) >
-+      (unsigned long long)((size_t)-1) ||
-+      (dstBuf = (unsigned char *)malloc(pitch * (*height))) == NULL)
-     _throwg("tjLoadImage(): Memory allocation failure");
- 
-   if (setjmp(this->jerr.setjmp_buffer)) {
--- 
-2.20.1
-
diff --git a/package/jpeg-turbo/0002-wrbmp.c-Don-t-allow-quantization-w-non-RGB-CS.patch b/package/jpeg-turbo/0002-wrbmp.c-Don-t-allow-quantization-w-non-RGB-CS.patch
deleted file mode 100644
index 3e4e5bd082..0000000000
--- a/package/jpeg-turbo/0002-wrbmp.c-Don-t-allow-quantization-w-non-RGB-CS.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f8cca819a4fb42aafa5f70df43c45e8c416d716f Mon Sep 17 00:00:00 2001
-From: DRC <information@libjpeg-turbo.org>
-Date: Tue, 1 Jan 2019 20:32:40 -0600
-Subject: [PATCH] wrbmp.c: Don't allow quantization w/ non-RGB CS
-
-If cinfo->quantize_colors == 1, then jpeg_calc_output_dimensions() will
-set cinfo->output_components to 1, and if cinfo->out_color_space is not
-RGB (or extended RGB), hilarity will ensue.
-
-Fixes #305
-
-[baruch: drop the ChangeLog.md hunk]
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit f8cca819a4
-
- ChangeLog.md | 4 ++++
- wrbmp.c      | 5 +++--
- 2 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/wrbmp.c b/wrbmp.c
-index 4bf81426b0ef..239f64eb3c3f 100644
---- a/wrbmp.c
-+++ b/wrbmp.c
-@@ -502,8 +502,9 @@ jinit_write_bmp(j_decompress_ptr cinfo, boolean is_os2,
-       dest->pub.put_pixel_rows = put_gray_rows;
-     else
-       dest->pub.put_pixel_rows = put_pixel_rows;
--  } else if (cinfo->out_color_space == JCS_RGB565 ||
--             cinfo->out_color_space == JCS_CMYK) {
-+  } else if (!cinfo->quantize_colors &&
-+             (cinfo->out_color_space == JCS_RGB565 ||
-+              cinfo->out_color_space == JCS_CMYK)) {
-     dest->pub.put_pixel_rows = put_pixel_rows;
-   } else {
-     ERREXIT(cinfo, JERR_BMP_COLORSPACE);
--- 
-2.20.1
-
diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 1779324c51..56b3478ab6 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.1/
-sha1 7ea4a288bccbb5a2d5bfad5fb328d4a839853f4e  libjpeg-turbo-2.0.1.tar.gz
-md5 1b05a66aa9b006fd04ed29f408e68f46  libjpeg-turbo-2.0.1.tar.gz
+# From https://sourceforge.net/projects/libjpeg-turbo/files/2.0.2/
+sha1 1cff52d50b81755d0bdcf9055eb22157f39a1695  libjpeg-turbo-2.0.2.tar.gz
+md5 79f76fbfb0c6109631332762d10e16d2  libjpeg-turbo-2.0.2.tar.gz
 # Locally computed
-sha256 e5f86cec31df1d39596e0cca619ab1b01f99025a27dafdfc97a30f3a12f866ff  libjpeg-turbo-2.0.1.tar.gz
-sha256 8412238c5ad95965cf3c3197791e9dea8b5fae505d133449e33ee2fa754fe61e  LICENSE.md
+sha256 acb8599fe5399af114287ee5907aea4456f8f2c1cc96d26c28aebfdf5ee82fed  libjpeg-turbo-2.0.2.tar.gz
+sha256 69e570a251515ced17d4492256d57c89db77ed949652f88a44c80c1ca9607920  LICENSE.md
 sha256 82fece2bff2669c476495f0fe70096b154e8bc5b40916a64e99836d9a01c3110  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index b848b66899..3735132b2e 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 2.0.1
+JPEG_TURBO_VERSION = 2.0.2
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://downloads.sourceforge.net/project/libjpeg-turbo/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
