Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C469ECEB2CC
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 10:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B53183F20;
	Sat, 15 Nov 2025 10:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isf3C9kO9_f1; Sat, 15 Nov 2025 10:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6292D8403E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6292D8403E;
	Sat, 15 Nov 2025 10:58:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EA081A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 304784048A
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTcSwN1KocIT for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 10:58:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C852840451
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C852840451
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C852840451
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 10:58:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 973F4A4C6958;
 Sat, 15 Nov 2025 11:58:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42054)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKDzJ-0000000047B-0pvi;
 Sat, 15 Nov 2025 10:58:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 15 Nov 2025 11:58:37 +0100
Message-ID: <20251115105837.3847502-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763204317;
 bh=UDhz0rJ34nFQpX3hnQw3OGcj8KnxJXSzvpI8cxJHVWM=;
 h=From:To:Cc:Subject:Date:From;
 b=C4GTxEyEJYEhPikMyjwV60owb9g0xvzjQKnYNU/s5NUIDTzdOOHfGPpD3pCweW0Or
 2rgiBpECz7oRAvI69zzgjcCZfkK1tMqYlNbDV+gxga+hI+/T57lsHY5pQUDVY72aty
 LcqyGy8lQtL11t7XKBuF1M1rnpCj8Y7csGnv8hI+h249GiV1TFT7s6nPRLwzyzN64H
 XsgC+jISq3C4vYDfKH+Rg6bHAyMQJQKgXjDALzfkpjwLORIJ5f8kJKzI3uexWd//40
 MwGLGCuJsZuLpJzdYe60sorBYmcVi6y+TM6K8KcIjUpfJ4Yb5Ah3Wdv+sCNPUAdUqu
 T9ZNNJHEEBIiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=C4GTxEyE
Subject: [Buildroot] [PATCH 1/1] package/libgphoto2: Fix compile errors with
 gcc 14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/57b/57bb5f02209d8216f0c472d39b15603e0f5db3c5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...atible-pointer-types-compiler-error-.patch | 41 ++++++++++++++++++
 ...ompatible-pointer-types-compiler-err.patch | 42 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 package/libgphoto2/0001-ptp2-fix-Wincompatible-pointer-types-compiler-error-.patch
 create mode 100644 package/libgphoto2/0002-jl2005c-fix-Wincompatible-pointer-types-compiler-err.patch

diff --git a/package/libgphoto2/0001-ptp2-fix-Wincompatible-pointer-types-compiler-error-.patch b/package/libgphoto2/0001-ptp2-fix-Wincompatible-pointer-types-compiler-error-.patch
new file mode 100644
index 0000000000..dd67891bd4
--- /dev/null
+++ b/package/libgphoto2/0001-ptp2-fix-Wincompatible-pointer-types-compiler-error-.patch
@@ -0,0 +1,41 @@
+From c0479bd5aa532a052461179bc64480d4a0ed26ac Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 15 Nov 2025 11:53:20 +0100
+Subject: [PATCH] ptp2: fix -Wincompatible-pointer-types compiler error in
+ chdk.c
+
+Fixes build error seen with gcc 14.3.0:
+
+ptp2/chdk.c: In function 'yuv_live_to_jpeg':
+ptp2/chdk.c:1182:41: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
+ 1182 |         jpeg_mem_dest (&cinfo, &outbuf, &outlen);
+      |                                         ^~~~~~~
+      |                                         |
+      |                                         long unsigned int *
+In file included from ptp2/chdk.c:32:
+/home/autobuild/autobuild/instance-4/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/jpeglib.h:979:28: note: expected 'size_t *' {aka 'unsigned int *'} but argument is of type 'long unsigned int *'
+  979 | EXTERN(void) jpeg_mem_dest JPP((j_compress_ptr cinfo,
+
+Upstream: https://github.com/gphoto/libgphoto2/pull/1176
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ camlibs/ptp2/chdk.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
+index 2787a7261..3b0dd4eb5 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1145,7 +1145,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 	struct		jpeg_error_mgr jerr;
+ 	JSAMPROW	row_ptr[1];
+ 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
+-	unsigned long	outlen = 0;
++	unsigned int	outlen = 0;
+ 	unsigned int	row_inc;
+ 	int		sshift, dshift, xshift, skip;
+ 
+-- 
+2.47.3
+
diff --git a/package/libgphoto2/0002-jl2005c-fix-Wincompatible-pointer-types-compiler-err.patch b/package/libgphoto2/0002-jl2005c-fix-Wincompatible-pointer-types-compiler-err.patch
new file mode 100644
index 0000000000..5207f3eda2
--- /dev/null
+++ b/package/libgphoto2/0002-jl2005c-fix-Wincompatible-pointer-types-compiler-err.patch
@@ -0,0 +1,42 @@
+From 48f2ae8bba151166f6f1ffbea359fdcbad0b0133 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 15 Nov 2025 11:54:24 +0100
+Subject: [PATCH] jl2005c: fix -Wincompatible-pointer-types compiler error
+ in jl2005bcd_decompress.c
+
+Seen with gcc 14.3.0:
+
+jl2005c/jl2005bcd_decompress.c: In function 'jl2005bcd_decompress':
+jl2005c/jl2005bcd_decompress.c:161:46: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
+  161 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
+      |                                              ^~~~~~~~~~~~~~~~~
+      |                                              |
+      |                                              long unsigned int *
+In file included from jl2005c/jpeg_memsrcdest.h:4,
+                 from jl2005c/jl2005bcd_decompress.c:39:
+/home/autobuild/autobuild/instance-4/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/jpeglib.h:979:28: note: expected 'size_t *' {aka 'unsigned int *'} but argument is of type 'long unsigned int *'
+  979 | EXTERN(void) jpeg_mem_dest JPP((j_compress_ptr cinfo,
+
+Upstream: https://github.com/gphoto/libgphoto2/pull/1176
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ camlibs/jl2005c/jl2005bcd_decompress.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/camlibs/jl2005c/jl2005bcd_decompress.c b/camlibs/jl2005c/jl2005bcd_decompress.c
+index dff2d6264..6e1631c92 100644
+--- a/camlibs/jl2005c/jl2005bcd_decompress.c
++++ b/camlibs/jl2005c/jl2005bcd_decompress.c
+@@ -85,7 +85,7 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
+ 	struct jpeg_error_mgr jcerr, jderr;
+ 	JOCTET *jpeg_header = NULL;
+ 	int outputsize = 0;
+-	unsigned long jpeg_header_size = 0;
++	unsigned int jpeg_header_size = 0;
+ 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size, ret;
+ 	JSAMPLE green[8 * 16];
+ 	JSAMPLE red[8 * 8];
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
