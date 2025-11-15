Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761C4CEB2E6
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 17:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A30240FD2;
	Sat, 15 Nov 2025 17:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z79mZhjLltN; Sat, 15 Nov 2025 17:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 373C740FD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 373C740FD3;
	Sat, 15 Nov 2025 17:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43E4A1A9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 258906086C
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdtEn4fVp_Tz for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 17:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 047E06086B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 047E06086B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 047E06086B
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:14:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b06c.dip0.t-ipconnect.de [84.161.176.108])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29596A4C6BE0;
 Sat, 15 Nov 2025 18:14:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37284)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vKJr6-000000007Hk-3CCT;
 Sat, 15 Nov 2025 17:14:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 15 Nov 2025 18:14:32 +0100
Message-ID: <20251115171432.1930126-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763226873;
 bh=tENqyR0/Plyi3+Xr0kdmMAZ2bHGG+EJ4DZPR03Dk8gg=;
 h=From:To:Cc:Subject:Date:From;
 b=05S9Q8y0GKEy83fBDrgt/O4qkNdeHjcPwRZ08WFs7KtY4PBPuxN9mK25UT6iWSbsZ
 ot2AO0O/buTeepg9fyyavnbyZ67z8WTE9LqKKLWBH+OaUqYeyWxVoK6qyzrATQKCRc
 Pm6Sg5RdIQlAyVrgc7zmJQAAbcEWy9HfySNyHOxfOMH1XrrhoIrF4++0+jgo5Dl9VE
 C6oSXn2XzT+FD2KNQrrJdt9nZPBlYNk58f731HGCgWNFs992TTYym1JgJDlU2ggyFx
 19/bqFMCVxobCSP+gdS5AcHSsYg9ays9ft9YQR1JlLAWgBJCVZGLEKRKcF9agv1VOb
 4dZOzDDboeM5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=05S9Q8y0
Subject: [Buildroot] [PATCH v2 1/1] package/libgphoto2: Fix compile errors
 with gcc 14
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
v2: updated patched due to upstream feedback

 ...atible-pointer-types-compiler-error-.patch | 41 ++++++++++++++++++
 ...ompatible-pointer-types-compiler-err.patch | 42 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 package/libgphoto2/0001-ptp2-fix-Wincompatible-pointer-types-compiler-error-.patch
 create mode 100644 package/libgphoto2/0002-jl2005c-fix-Wincompatible-pointer-types-compiler-err.patch

diff --git a/package/libgphoto2/0001-ptp2-fix-Wincompatible-pointer-types-compiler-error-.patch b/package/libgphoto2/0001-ptp2-fix-Wincompatible-pointer-types-compiler-error-.patch
new file mode 100644
index 0000000000..19d95990f5
--- /dev/null
+++ b/package/libgphoto2/0001-ptp2-fix-Wincompatible-pointer-types-compiler-error-.patch
@@ -0,0 +1,41 @@
+From e3b7d7a17b8e6b40baded87679f214f67c2d14ca Mon Sep 17 00:00:00 2001
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
+index 2787a7261..bc966a299 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1145,7 +1145,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 	struct		jpeg_error_mgr jerr;
+ 	JSAMPROW	row_ptr[1];
+ 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
+-	unsigned long	outlen = 0;
++	uint32_t	outlen = 0;
+ 	unsigned int	row_inc;
+ 	int		sshift, dshift, xshift, skip;
+ 
+-- 
+2.47.3
+
diff --git a/package/libgphoto2/0002-jl2005c-fix-Wincompatible-pointer-types-compiler-err.patch b/package/libgphoto2/0002-jl2005c-fix-Wincompatible-pointer-types-compiler-err.patch
new file mode 100644
index 0000000000..d9319ddb3b
--- /dev/null
+++ b/package/libgphoto2/0002-jl2005c-fix-Wincompatible-pointer-types-compiler-err.patch
@@ -0,0 +1,42 @@
+From 360909cca24da5dab36cb5bc21756dcfde344257 Mon Sep 17 00:00:00 2001
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
+index dff2d6264..63c55c4e9 100644
+--- a/camlibs/jl2005c/jl2005bcd_decompress.c
++++ b/camlibs/jl2005c/jl2005bcd_decompress.c
+@@ -85,7 +85,7 @@ jl2005bcd_decompress (unsigned char *output, unsigned char *input,
+ 	struct jpeg_error_mgr jcerr, jderr;
+ 	JOCTET *jpeg_header = NULL;
+ 	int outputsize = 0;
+-	unsigned long jpeg_header_size = 0;
++	uint32_t jpeg_header_size = 0;
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
