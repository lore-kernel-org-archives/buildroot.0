Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885CDCA0EED
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 21:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3334B61B0A;
	Sun, 24 Aug 2025 21:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uW80PFjFfN_B; Sun, 24 Aug 2025 21:09:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A4DD61B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A4DD61B0B;
	Sun, 24 Aug 2025 21:09:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4443D19C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 21:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AE4D61B0C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 21:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y79Mj4hM0poK for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 21:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF23061B0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF23061B0A
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF23061B0A
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 21:09:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3c68ac7e2bdso1364162f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756069779; x=1756674579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tFuiUZGrakiklXHBFI24xPLOb53dGGq8C8cqKrx2FXM=;
 b=T84H05dpwxuObqMrF1hhsuFArUuV+oGA1iEFBIRqGfPHsAlcOfJOsfFlglkBp48Q7G
 SkVlcQQu4njwycl0TPjHiuhn1CyGaVxHGoi4uQnp6YWt7itpbUAHUQXUGb17Qma/SYQa
 FWW6IbqIvDT76fDC2nsuaue05DROoUUIiy2nsskZ+k4SuLtHets+aLcKQ7Nw+MXzvzdG
 pYG0dWHrX6CGLjbTydpexjMzHrpxaaXH5OTzLfG8fdiDJhT0qkqtnuKmR//uSetGOd6M
 WVq56rw/Oa9IV1FcYlcizcCQhBd8BAiC13J72FxeXKgmCpdGxww9u5bsX4vWOnurPFng
 NCag==
X-Gm-Message-State: AOJu0YwYNqzFw7ImsGjIvgmTqyMhjDthPJzFeHW3a5RdQ463nkkdiQMG
 6npTeJf8Ig6INeOmHxACBS+jGhnBDqx/7vGHYiBTWQK7rn6N85LWOLRXlTcB13NQhppOiD74aRz
 WNJWa
X-Gm-Gg: ASbGncufctwJwnC2H1sTHwG8/x+QFnutjOaAtqomodmoIj7WuR8y/yAOD7TWxQq1JkT
 DNyFBB49CBLXeaRTiHFlz2Do5YGjpYgMcCL+6UC/NDgaYL4U+MSAdBY+l3R1dp9Mc2XqJLlC8QM
 yUi6Qkv0FKnsSiFRPCOTmuU09hiMigJ7PMdL/xJnYs0MOyMKxO6yPIOEjTFxiW2oCBXOFbas16F
 m+bYFaKb7ik61W9ro93aImL88OOgcV9SEOMADBTN8RnwsBIWi2NO/ay8UcVw9zQ+I6fMfcwsZ+u
 84q9JL804ihjckcE+xLUBKJEwRTDRXSzpvbExTP3zgdlIWKFn/RvEHu1XNI92/kmzrI2YUA9vyy
 6RYyNdY0jVfImL/oivfEnNEKq+meEcgwcsHcWpIV5pZD1QTqthZVqF0ADdOnOSJwC+jC7DddW02
 WDizsKG+G24e4+MPTDV0IqFSKgfuItNrk=
X-Google-Smtp-Source: AGHT+IFFXsIGUhfY7w8whBot69cDKv1wil7+w5bDd3+K/9CplGjBNh104G+PbvZj7jwRr/qz3bwqew==
X-Received: by 2002:a05:6000:25c7:b0:3b7:8832:fdcc with SMTP id
 ffacd0b85a97d-3c5dcdfd72emr7556526f8f.38.1756069778845; 
 Sun, 24 Aug 2025 14:09:38 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b5758a018sm86610585e9.21.2025.08.24.14.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 14:09:38 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sun, 24 Aug 2025 23:09:26 +0200
Message-ID: <20250824210933.4132510-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756069779; x=1756674579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tFuiUZGrakiklXHBFI24xPLOb53dGGq8C8cqKrx2FXM=;
 b=KO1DlVl33d+2IV+38S0IIF8AsU6ob+DXJ88VT+0fHCzaIMUiQbZzEQSz1mPK72M602
 V1bmOs8fOvwAff9nakG+X9pIP41fJv9FPH74pnUivQ07pvpjc2yFPwxd/mifUT/Jf+6T
 uZiSBamjN/oWLybpNuwOaY7VAm73Pv3xMFKGA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=KO1DlVl3
Subject: [Buildroot] [PATCH] package/libv4l: backport fix jpeg-v9x/gcc-14.x
 build
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: multipart/mixed; boundary="===============8132521109163917201=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8132521109163917201==
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit

This issue seems to caused by gcc-14 (added in 2024.05) which has
become the default version in 2025.08.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295052 (TestZbar)
https://autobuild.buildroot.org/results/e0f/e0fac4a10181139d975c627f22a55d6681547d33

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...x-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch

diff --git a/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch b/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch
new file mode 100644
index 0000000000..298eaaf888
--- /dev/null
+++ b/package/libv4l/0002-libv4lconvert-fix-jpeg-v9x-gcc-14.x-compile-jpeg_mem.patch
@@ -0,0 +1,83 @@
+From 9f0da8467183f9f647bddc4a5b4f01aad930846a Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 2 Sep 2024 15:59:53 +0200
+Subject: [PATCH] libv4lconvert: fix jpeg-v9x/gcc-14.x compile (jpeg_mem_dest
+ argument mismatch)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- fix jpeg_mem_dest pointer arument mismatch (long unsigned int vs. size_t)
+  with jpeg-v9x/gcc-14.x 32-bit arm compile
+
+Fixes:
+
+  ../lib/libv4lconvert/jl2005bcd.c: In function ‘v4lconvert_decode_jl2005bcd’:
+  ../lib/libv4lconvert/jl2005bcd.c:94:46: error: passing argument 3 of ‘jpeg_mem_dest’ from incompatible pointer type [-Wincompatible-pointer-types]
+     94 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
+        |                                              ^~~~~~~~~~~~~~~~~
+        |                                              |
+        |                                              long unsigned int *
+  In file included from ../lib/libv4lconvert/libv4lconvert-priv.h:26,
+                   from ../lib/libv4lconvert/jl2005bcd.c:30:
+  .../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/jpeglib.h:979:28: note: expected ‘size_t *’ {aka ‘unsigned int *’} but argument is of type ‘long unsigned int *’
+    979 | EXTERN(void) jpeg_mem_dest JPP((j_compress_ptr cinfo,
+        |                            ^~~
+
+  ../lib/libv4lconvert/jpeg.c: In function ‘init_libjpeg_cinfo’:
+  ../lib/libv4lconvert/jpeg.c:157:45: error: passing argument 3 of ‘jpeg_mem_dest’ from incompatible pointer type [-Wincompatible-pointer-types]
+    157 |         jpeg_mem_dest(&cinfo, &jpeg_header, &jpeg_header_size);
+        |                                             ^~~~~~~~~~~~~~~~~
+        |                                             |
+        |                                             long unsigned int *
+  In file included from ../lib/libv4lconvert/libv4lconvert-priv.h:26,
+                   from ../lib/libv4lconvert/jpeg.c:21:
+  .../host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/jpeglib.h:979:28: note: expected ‘size_t *’ {aka ‘unsigned int *’} but argument is of type ‘long unsigned int *’
+    979 | EXTERN(void) jpeg_mem_dest JPP((j_compress_ptr cinfo,
+        |                            ^~~
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
+Upstream: https://git.linuxtv.org/v4l-utils.git/commit/?id=e11e10ff7c8a4ef69526edd275c0ed92a450fbf3
+[Romain: backport to 1.28.1]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ lib/libv4lconvert/jl2005bcd.c | 4 ++++
+ lib/libv4lconvert/jpeg.c      | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/lib/libv4lconvert/jl2005bcd.c b/lib/libv4lconvert/jl2005bcd.c
+index 707c3205..14b040f3 100644
+--- a/lib/libv4lconvert/jl2005bcd.c
++++ b/lib/libv4lconvert/jl2005bcd.c
+@@ -63,7 +63,11 @@ int v4lconvert_decode_jl2005bcd(struct v4lconvert_data *data,
+ 	struct jpeg_decompress_struct dinfo;
+ 	struct jpeg_error_mgr jcerr, jderr;
+ 	JOCTET *jpeg_header = NULL;
++#if JPEG_LIB_VERSION >= 90
++	size_t jpeg_header_size = 0;
++#else
+ 	unsigned long jpeg_header_size = 0;
++#endif
+ 	int i, x, y, x1, y1, jpeg_data_size, jpeg_data_idx, eoi, size;
+ 
+ 	/* src_size had better be bigger than 16 */
+diff --git a/lib/libv4lconvert/jpeg.c b/lib/libv4lconvert/jpeg.c
+index ebfc8149..450d0967 100644
+--- a/lib/libv4lconvert/jpeg.c
++++ b/lib/libv4lconvert/jpeg.c
+@@ -136,7 +136,11 @@ static void init_libjpeg_cinfo(struct v4lconvert_data *data)
+ {
+ 	struct jpeg_compress_struct cinfo;
+ 	unsigned char *jpeg_header = NULL;
++#if JPEG_LIB_VERSION >= 90
++	size_t jpeg_header_size = 0;
++#else
+ 	unsigned long jpeg_header_size = 0;
++#endif
+ 
+ 	if (data->cinfo_initialized)
+ 		return;
+-- 
+2.50.1
+
-- 
2.50.1


--===============8132521109163917201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8132521109163917201==--
