Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE53CCCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE67F6100C;
	Wed, 22 Oct 2025 16:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5B65qVtDrXK; Wed, 22 Oct 2025 16:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8DCD611AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8DCD611AA;
	Wed, 22 Oct 2025 16:31:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5E5843F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBF6D611AA
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZaNZcxb8lpH for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:31:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E74C26100C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E74C26100C
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E74C26100C
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:11 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b3e234fcd4bso1290673466b.3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150670; x=1761755470;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2tzqAz1dkMiKLrP2jfy4LcOE8V/1Hsltn978A+7msNA=;
 b=RsIpT7HsZciPDJD1OdIoQUQRVr02ccEl6QiN1KK+xeHP+0XiI9oKcYw4Hg7ryZt7Q3
 I4s5gHbWxLe75jY393Gvx3pwyF9sWpOQ8kIrUiIvqhbSC9l3jyMNBD9VvIuCfln5Efk8
 nZQC3HEs9rSvPNCnhfE087LxC2cwh67eP26pxSlmkEs6pVUTjiWrJn9ZvziXHDbAhZcX
 bMXU4B4UdJSbNqhe9jWWBzZSUNy2ua4Nvik0bx6c8tkx0pInNAnNYlRs+oRoD4Q2Luqv
 6cRHpcF5cNm2BJ5cmLyAWkbLpOP6MVKop/zLgf3Z22q9r2jl+ajML673uJwqxlhuxrQK
 1yqA==
X-Gm-Message-State: AOJu0YwpvrfljsN8iuWdrSNml6W3xtaX4Xgw51woQXvRE0ZYEmogh9rQ
 6ggaNtLAEAaSh4EvYVbkd1sfYUppk80cgfMxOhAA5GqRCUBFMFxRlJleVH9az7YMuNNA7sxs0K+
 6ncqX
X-Gm-Gg: ASbGncv6MbkaHpAlb3ZbkvXtKUaihdiKBW4uGBUwT3wye4A+kVWy9aCr5xebFgJQ4Sh
 VhwjLWdAh+1uwBAJpD5YHmvVW4vlgEdD/S0MgpjbTjy509up1R4got7vPkRQm4T0ULWErHXsP0N
 uwQdD/9FtEpJz4TcnpFQ8nR2gA/W+nWx4GNK2VTPopKVsenL2oR6SY7AgMIBZhbFIwlGITjaYG0
 XeWfDAnSs8vp0HkTkucztassc9dMooEqM1rD6KkM57t/+RJneON2G/ZnKV1iG/1smtW8DysuEaC
 WkfdgBDXZ+4Qqm3knsNDColmT6yzHCjVL/PHU2NEauWb09GzW6Hi/f2fHU5SJrtBIy7d3J0AxPs
 RPX2xMTotD+hn68A7lnHrACGVBbOgFM928MGPiJh6h7wj35UHgK4/kXfQGi0IezJUn3bStbZZEJ
 ORyb6Yzc1ViOFZP7PGdg65HwHgB7VnV5H5YoyJWw==
X-Google-Smtp-Source: AGHT+IHIqt5VxwdWIIGotHNHW8oW0m1LsEwGqY7C50DcGdMk+ItextGuZ09IliUAYioVFj7zgqemLw==
X-Received: by 2002:a17:907:934b:b0:b0d:ee43:d762 with SMTP id
 a640c23a62f3a-b647195b883mr2566316866b.4.1761150669561; 
 Wed, 22 Oct 2025 09:31:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d3fb6a63csm43837666b.29.2025.10.22.09.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:31:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:31:02 +0200
Message-ID: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761150670; x=1761755470;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2tzqAz1dkMiKLrP2jfy4LcOE8V/1Hsltn978A+7msNA=;
 b=Xy7JZ+76LVGsYUZgheYfuuaMikCDk3H7TmfK9ZW9I8Nsr7UoRLkvX660tX6f8ke26N
 QUeseIVz7iYtJDw7KXXN410eylLzEWGMyM6rqGWw0pOapd2kQBzI70KSj5jGfu5CqXF2
 NDV6rxdQ8OjHMrLd+qPJMm2NhhiXDmMIPWZ08=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Xy7JZ+76
Subject: [Buildroot] [PATCH 1/3] package/libgphoto2: fix build with gcc >= 14
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

The commit adds a backported upstream patch to fix the following build
failure:

ptp2/ptp-pack.c:3168:31: note: earlier argument should specify number of elements, later size of each element
ptp2/chdk.c: In function 'yuv_live_to_jpeg':
ptp2/chdk.c:1203:41: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
 1203 |         jpeg_mem_dest (&cinfo, &outbuf, &outlen);
      |                                         ^~~~~~~
      |                                         |
      |                                         uint64_t * {aka long long unsigned int *}
In file included from ptp2/chdk.c:31:
/home/autobuild/autobuild/instance-0/output-1/per-package/libgphoto2/host/armeb-buildroot-linux-gnueabi/sysroot/usr/include/jpeglib.h:989:43: note: expected 'long unsigned int *' but argument is of type 'uint64_t *' {aka 'long long unsigned int *'}
  989 |                            unsigned long *outsize);

Fixes:
- https://autobuild.buildroot.org/results/db742e301a401c9f4bdf3c7e8cfde9f0ba1c4558

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...gth-with-jpeg-jeaders.-fixes-https-g.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch

diff --git a/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch b/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
new file mode 100644
index 000000000000..910c9b125add
--- /dev/null
+++ b/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
@@ -0,0 +1,39 @@
+From 721f7f8c3ec8058d504607873e4c317aac0c99c5 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Mon, 4 Dec 2023 13:26:08 +0100
+Subject: [PATCH] align outlen length with jpeg jeaders. fixes
+ https://github.com/gphoto/libgphoto2/issues/941
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/gphoto/libgphoto2/commit/721f7f8c3ec8058d504607873e4c317aac0c99c5
+---
+ camlibs/ptp2/chdk.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
+index e1d898f37811..e775ea1d4bbb 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1150,7 +1150,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 	struct		jpeg_error_mgr jerr;
+ 	JSAMPROW	row_ptr[1];
+ 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
+-	uint64_t	outlen = 0;
++	unsigned long	outlen = 0;
+ 	unsigned int	row_inc;
+ 	int		sshift, dshift, xshift, skip;
+ 
+@@ -1161,8 +1161,8 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 		sshift = 6;
+ 		dshift = (width/height > 2) ? 6 : 12;
+ 		xshift = 4;
+-	/* Digic 6 cameras: 8 bit per element UYVY,
+-	 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
++		/* Digic 6 cameras: 8 bit per element UYVY,
++		 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
+ 	} else {
+ 		row_inc = buf_width*2;
+ 		sshift = 4;
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
