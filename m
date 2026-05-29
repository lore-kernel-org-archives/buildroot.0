Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0207ECD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBA6E6135A;
	Fri, 29 May 2026 08:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O9fKZCO4BdMC; Fri, 29 May 2026 08:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C84B46142D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043311;
	bh=UWspwM9syA7TE0rK+IWZwLWUgScItRZokP2t0b0JSQI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s8JzqeJUFyYP0hlT2SY1b8TIe9FsTJrRmzVJsVF/SI09WM43vTrEwMECjM/nodqWb
	 JLhYdRH4jTQKHsqa6K3gf/iqtwPaK2ivrJsuh1F2pxwNT1Qsjt/OtsmU0AGNfyb6sh
	 iT32iXQI4bzL5ckwchjgggSwPXMwSMaUXFTGyD+o9n0JzxeIyTEL+uFIvqcynXO3bt
	 sFJUgoRbiTCKsCHgju3mwLml5WJlEJzjPeF6iZYK4pWqtG1m1KQPk4ylUMHI/dFOir
	 spl4O9PH1qz+sKje+9B0EkjPfwDedTFSNLtCCY+1z8bYAUasHeiZsbbYK5QqYjiAif
	 9fB1i7tQtR//g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C84B46142D;
	Fri, 29 May 2026 08:28:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 119AD288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AE1B61429
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwHOHbsKQLZm for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0DAB61320
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0DAB61320
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5ECD7873A6; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:14 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 33ec270f8a4235ae76d99d8c5ae1634eef47a98b
X-Git-Newrev: 4de77652d63264a2a5e63307be06db5eee9345ad
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.5ECD7873A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libgphoto2: fix
 build with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4de77652d63264a2a5e63307be06db5eee9345ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The commit adds an upstream patch to fix the following build failure:

jl2005c/jl2005bcd_decompress.c: In function 'jl2005bcd_decompress':
jl2005c/jl2005bcd_decompress.c:161:46: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
  161 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
      |                                              ^~~~~~~~~~~~~~~~~
      |                                              |
      |                                              long unsigned int *

Fixes:
- https://autobuild.buildroot.org/results/cb983d9ad90170aa8d7f2b9a5dfc30055d83b5de

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit d2ad5b883342b92c354c8a110ffbaf1ca7dda20f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...checks-for-the-size-type-of-jpeg_mem_dest.patch | 143 +++++++++++++++++++++
 package/libgphoto2/libgphoto2.mk                   |   2 +
 2 files changed, 145 insertions(+)

diff --git a/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch b/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
new file mode 100644
index 0000000000..543678181b
--- /dev/null
+++ b/package/libgphoto2/0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
@@ -0,0 +1,143 @@
+From ca4441f48117c681cecfb3c883115e0546aed985 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Sun, 29 Mar 2026 21:31:49 +0200
+Subject: [PATCH] autoconf checks for the size type of jpeg_mem_dest
+
+fixes https://github.com/gphoto/libgphoto2/pull/1176
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/gphoto/libgphoto2/commit/ca4441f48117c681cecfb3c883115e0546aed985
+---
+ camlibs/ax203/ax203.c                   |  2 +-
+ camlibs/ax203/ax203_compress_jpeg.c     |  2 +-
+ camlibs/ax203/jpeg_memsrcdest.h         |  2 ++
+ camlibs/jl2005c/jl2005bcd_decompress.c  |  2 +-
+ camlibs/jl2005c/jpeg_memsrcdest.h       |  2 ++
+ camlibs/ptp2/chdk.c                     |  2 +-
+ libgphoto2_port/gphoto-m4/gp-libjpeg.m4 | 32 +++++++++++++++++++++++++
+ 7 files changed, 40 insertions(+), 4 deletions(-)
+
+diff --git a/camlibs/ax203/ax203.c b/camlibs/ax203/ax203.c
+index 62f572686c44..b9db8ebdabf1 100644
+--- a/camlibs/ax203/ax203.c
++++ b/camlibs/ax203/ax203.c
+@@ -1202,7 +1202,7 @@ ax203_encode_image(Camera *camera, int **src, char *dest, unsigned int dest_size
+ 	struct jpeg_compress_struct cinfo;
+ 	struct jpeg_error_mgr jcerr;
+ 	JOCTET *jpeg_dest = NULL;
+-	unsigned long jpeg_size = 0;
++	JPEG_SIZE jpeg_size = 0;
+ 	JSAMPLE row[camera->pl->width * 3];
+ 	JSAMPROW row_pointer[1] = { row };
+ #endif
+diff --git a/camlibs/ax203/ax203_compress_jpeg.c b/camlibs/ax203/ax203_compress_jpeg.c
+index 1ec7534ff484..22068afd79c0 100644
+--- a/camlibs/ax203/ax203_compress_jpeg.c
++++ b/camlibs/ax203/ax203_compress_jpeg.c
+@@ -124,7 +124,7 @@ ax206_compress_jpeg(Camera *camera, int **in, uint8_t *outbuf, int out_size,
+ 	jvirt_barray_ptr *in_coefficients;
+ 	unsigned int i, x, y;
+ 	int stop, size, ret, outc;
+-	unsigned long regular_jpeg_size = 0, buf_size = 0;
++	JPEG_SIZE regular_jpeg_size = 0, buf_size = 0;
+ 	int last_dc_val[3] = { 0, 0, 0 };
+ 
+ 	/* We have a rgb24bit image in the desired dimensions, first we
+diff --git a/camlibs/ax203/jpeg_memsrcdest.h b/camlibs/ax203/jpeg_memsrcdest.h
+index 674ab7128f8e..22ba2ac1e2c7 100644
+--- a/camlibs/ax203/jpeg_memsrcdest.h
++++ b/camlibs/ax203/jpeg_memsrcdest.h
+@@ -5,6 +5,8 @@
+ 
+ #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
++#define JPEG_SIZE unsigned long
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
+index dff2d6264025..8c3307fd6098 100644
+--- a/camlibs/jl2005c/jl2005bcd_decompress.c
++++ b/camlibs/jl2005c/jl2005bcd_decompress.c
+@@ -85,7 +85,7 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
+ 	struct jpeg_error_mgr jcerr, jderr;
+ 	JOCTET *jpeg_header = NULL;
+ 	int outputsize = 0;
+-	unsigned long jpeg_header_size = 0;
++	JPEG_SIZE jpeg_header_size = 0;
+ 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size, ret;
+ 	JSAMPLE green[8 * 16];
+ 	JSAMPLE red[8 * 8];
+diff --git a/camlibs/jl2005c/jpeg_memsrcdest.h b/camlibs/jl2005c/jpeg_memsrcdest.h
+index 4334e099688a..94fca070d05b 100644
+--- a/camlibs/jl2005c/jpeg_memsrcdest.h
++++ b/camlibs/jl2005c/jpeg_memsrcdest.h
+@@ -5,6 +5,8 @@
+ 
+ #if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
++#define JPEG_SIZE unsigned long
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
+index 2787a7261c4a..2646c3ba0fb1 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1145,7 +1145,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 	struct		jpeg_error_mgr jerr;
+ 	JSAMPROW	row_ptr[1];
+ 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
+-	unsigned long	outlen = 0;
++	JPEG_SIZE	outlen = 0;
+ 	unsigned int	row_inc;
+ 	int		sshift, dshift, xshift, skip;
+ 
+diff --git a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4 b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
+index ce9e816fdbce..4870882a686d 100644
+--- a/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
++++ b/libgphoto2_port/gphoto-m4/gp-libjpeg.m4
+@@ -77,6 +77,38 @@ found and made to work.
+     GP_CONFIG_MSG([JPEG mangling support],
+                   [${have_libjpeg}])
+   ])
++  dnl find type of memdest
++  AC_LANG_PUSH([C])
++
++  AC_MSG_CHECKING([type of jpeg_mem_dest size])
++  AC_COMPILE_IFELSE([
++    #include <stdio.h>
++    #include <unistd.h>
++    #include <jpeglib.h>
++    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, unsigned long * outsize) {
++	    jpeg_mem_dest(cinfo, outbuffer, outsize);
++    }
++  ],[
++     AC_MSG_RESULT([unsigned long*])
++     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
++  ],[
++     AC_COMPILE_IFELSE([
++    #include <stdio.h>
++    #include <unistd.h>
++    #include <jpeglib.h>
++    void f(j_compress_ptr cinfo, unsigned char ** outbuffer, size_t * outsize) {
++	    jpeg_mem_dest(cinfo, outbuffer, outsize);
++    }
++    ],[
++     AC_MSG_RESULT([size_t*])
++     AC_DEFINE([JPEG_SIZE],[size_t], "JPEG memdest size type")
++    ],[
++     AC_MSG_RESULT([unknown, using unsigned long*])
++     AC_DEFINE([JPEG_SIZE],[unsigned long], "JPEG memdest size type")
++    ])
++  ]
++  )
++  AC_LANG_POP([C])
+ ],
+ [AC_MSG_ERROR([
+ Unhandled value given to --with-jpeg: ${with_jpeg}
+-- 
+2.43.0
+
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index 95c0190ee6..4265d1c57e 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -9,6 +9,8 @@ LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
 	LGPL-2.0 (sipix), LGPL-3.0+ (pentax), BSD-3-Clause (ax203/tinyjpeg)
+# 0001-autoconf-checks-for-the-size-type-of-jpeg_mem_dest.patch
+LIBGPHOTO2_AUTORECONF = YES
 # There is a single license file for the LGPL-2.1, no license files
 # for other licenses
 LIBGPHOTO2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
