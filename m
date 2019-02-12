From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 19:59:46 +0100
Subject: [Buildroot] [git commit branch/next] package/jpeg-turbo: add
 upstream security fixes
Message-ID: <20190213214530.960BF835F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f60925beda57b67d0ce9c8bd5fc4b237f09e2024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

CVE-2018-20330: Integer overflow causing segfault occurred when
attempting to load a BMP file with more than 1 billion pixels using the
`tjLoadImage()` function.

CVE-2018-19664: Buffer overrun occurred when attempting to decompress a
specially-crafted malformed JPEG image to a 256-color BMP using djpeg.

Cc: Murat Demirten <mdemirten@yh.com.tr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Image-Fix-int-overflow-segfault-w-big-BMP.patch | 51 ++++++++++++++++++++++
 ...p.c-Don-t-allow-quantization-w-non-RGB-CS.patch | 39 +++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/package/jpeg-turbo/0001-tjLoadImage-Fix-int-overflow-segfault-w-big-BMP.patch b/package/jpeg-turbo/0001-tjLoadImage-Fix-int-overflow-segfault-w-big-BMP.patch
new file mode 100644
index 0000000000..a10fcf62af
--- /dev/null
+++ b/package/jpeg-turbo/0001-tjLoadImage-Fix-int-overflow-segfault-w-big-BMP.patch
@@ -0,0 +1,51 @@
+From 3d9c64e9f8aa1ee954d1d0bb3390fc894bb84da3 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Tue, 1 Jan 2019 18:57:36 -0600
+Subject: [PATCH] tjLoadImage(): Fix int overflow/segfault w/big BMP
+
+Fixes #304
+
+[baruch: drop the ChangeLog.md hunk]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 3d9c64e9f8aa
+
+ ChangeLog.md | 4 ++++
+ turbojpeg.c  | 9 ++++++---
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/turbojpeg.c b/turbojpeg.c
+index 90a9ce6a0be8..3f7cd640677f 100644
+--- a/turbojpeg.c
++++ b/turbojpeg.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C)2009-2018 D. R. Commander.  All Rights Reserved.
++ * Copyright (C)2009-2019 D. R. Commander.  All Rights Reserved.
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions are met:
+@@ -1960,7 +1960,8 @@ DLLEXPORT unsigned char *tjLoadImage(const char *filename, int *width,
+                                      int align, int *height, int *pixelFormat,
+                                      int flags)
+ {
+-  int retval = 0, tempc, pitch;
++  int retval = 0, tempc;
++  size_t pitch;
+   tjhandle handle = NULL;
+   tjinstance *this;
+   j_compress_ptr cinfo = NULL;
+@@ -2013,7 +2014,9 @@ DLLEXPORT unsigned char *tjLoadImage(const char *filename, int *width,
+   *pixelFormat = cs2pf[cinfo->in_color_space];
+ 
+   pitch = PAD((*width) * tjPixelSize[*pixelFormat], align);
+-  if ((dstBuf = (unsigned char *)malloc(pitch * (*height))) == NULL)
++  if ((unsigned long long)pitch * (unsigned long long)(*height) >
++      (unsigned long long)((size_t)-1) ||
++      (dstBuf = (unsigned char *)malloc(pitch * (*height))) == NULL)
+     _throwg("tjLoadImage(): Memory allocation failure");
+ 
+   if (setjmp(this->jerr.setjmp_buffer)) {
+-- 
+2.20.1
+
diff --git a/package/jpeg-turbo/0002-wrbmp.c-Don-t-allow-quantization-w-non-RGB-CS.patch b/package/jpeg-turbo/0002-wrbmp.c-Don-t-allow-quantization-w-non-RGB-CS.patch
new file mode 100644
index 0000000000..3e4e5bd082
--- /dev/null
+++ b/package/jpeg-turbo/0002-wrbmp.c-Don-t-allow-quantization-w-non-RGB-CS.patch
@@ -0,0 +1,39 @@
+From f8cca819a4fb42aafa5f70df43c45e8c416d716f Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Tue, 1 Jan 2019 20:32:40 -0600
+Subject: [PATCH] wrbmp.c: Don't allow quantization w/ non-RGB CS
+
+If cinfo->quantize_colors == 1, then jpeg_calc_output_dimensions() will
+set cinfo->output_components to 1, and if cinfo->out_color_space is not
+RGB (or extended RGB), hilarity will ensue.
+
+Fixes #305
+
+[baruch: drop the ChangeLog.md hunk]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit f8cca819a4
+
+ ChangeLog.md | 4 ++++
+ wrbmp.c      | 5 +++--
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/wrbmp.c b/wrbmp.c
+index 4bf81426b0ef..239f64eb3c3f 100644
+--- a/wrbmp.c
++++ b/wrbmp.c
+@@ -502,8 +502,9 @@ jinit_write_bmp(j_decompress_ptr cinfo, boolean is_os2,
+       dest->pub.put_pixel_rows = put_gray_rows;
+     else
+       dest->pub.put_pixel_rows = put_pixel_rows;
+-  } else if (cinfo->out_color_space == JCS_RGB565 ||
+-             cinfo->out_color_space == JCS_CMYK) {
++  } else if (!cinfo->quantize_colors &&
++             (cinfo->out_color_space == JCS_RGB565 ||
++              cinfo->out_color_space == JCS_CMYK)) {
+     dest->pub.put_pixel_rows = put_pixel_rows;
+   } else {
+     ERREXIT(cinfo, JERR_BMP_COLORSPACE);
+-- 
+2.20.1
+
