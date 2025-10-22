Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE50CCD1BB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D449E611DD;
	Wed, 22 Oct 2025 16:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 58ST392B__WD; Wed, 22 Oct 2025 16:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC745611DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC745611DE;
	Wed, 22 Oct 2025 16:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 432D0DE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 290F583D17
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k-ZLdBdscryD for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:31:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E201E80B4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E201E80B4E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E201E80B4E
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:31:16 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b4c89df6145so1160661666b.3
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 09:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761150675; x=1761755475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rui3l+QpH4p5pYZ/YyeuSnW2Bdx0wu32niA671DJYmg=;
 b=dvpct2EGsRoBu3zPSjr6RP5pdif7BGhgMf9DI+XRZVgxUhliTZVsBC5ZD87OBSYGXJ
 KMPFOjjAaVVcZzX2E24/mcluOP6Us16cvmQmauUjRTkzSrLcoLf+l3wZjXnJmqggoQvK
 987OTxBs57aps1A0HRi9nFPCT+t2O5MC19jyXKDtWeqwrcJFH3yE2NlwHOi6KKW8wKYM
 lyykDYQeAY7NhuzXUJiQdmdij57O1OpIMOG/Oz6nhuW08FZYXYL9oN5ByosrjiJ65zs3
 WnCDfJ6l9pKmY1z8szqY2RG7z93CKzgVj7SX1QcvTM/N/PdQzWnBRa2YG5S6D4k2kKOu
 SdUw==
X-Gm-Message-State: AOJu0YyZn6RfHqFQSl9Ow6+K9z8FKc7FbxOd0gskZCOu65XMhYEF5sko
 rMmKTGncupPdf0yOFqgHzWCH9qWhDMGpLIRL6IIPWzmiEvIPNb0wmVvI0em766kLqDr+K4kRIx+
 gf1Bc
X-Gm-Gg: ASbGnctfWRJXmZ4FPcwUwvFFn3yn16VZBhbd7OjS5UlQoKYxo9EsHtmWCWZ3XbMOOfs
 +EoWSplOVX7jWADcxKiqkFs8FU/rXJLqgggGXbO95selFj6X1yoFhyFCarsWzTr4s0ui8cWNMzz
 KNluPJy1gV6RD/Md7VeVV7kfcOYOgW80Rv64VmjoTzf9PqrnhfJVq0a9JBjPOX4QMsu5nzzlwy0
 9/P6tBcwK0fonDc+OwCm346QVSxpDpNDE648EYYoTNMV0PGnyOV07AqtzQelNBkNhUFvQjenRQh
 XthMvAHCPCuRyu2JlyYog7LUYsLmxjqwt3fcS29FgfDFX32d20ne2ggAODL+xw90XxuH/sCE3J/
 mlQHY2ZClCpxuKglsRT0RimuQzYHmzkE0/S4NOE6JjC24DX4A8rSThYUL6wmnRWAowAdGOlnumf
 VFyWO7QRa6+xTwAdhX+8tc53K/MtN6PFdTILkv0A==
X-Google-Smtp-Source: AGHT+IGKwYaXaei5URHx1tiq7ct5x9kWQ+Hmrneouq2TUTUGOgjyJeD1/hlbP4bspH2BYVkfF8sjjg==
X-Received: by 2002:a17:906:eecd:b0:b3f:9b9c:d49e with SMTP id
 a640c23a62f3a-b6475706f5emr2504639966b.57.1761150674553; 
 Wed, 22 Oct 2025 09:31:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.42.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d3fb6a63csm43837666b.29.2025.10.22.09.31.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 09:31:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 22 Oct 2025 18:31:03 +0200
Message-ID: <20251022163104.17325-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
References: <20251022163104.17325-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1761150675; x=1761755475;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rui3l+QpH4p5pYZ/YyeuSnW2Bdx0wu32niA671DJYmg=;
 b=OeFPH0zhfKrGxN+2fWYhwZbn5YiHkgDNAGAmbaVTwKX4moh1WjVZYMw9yy2HIQDIlb
 GCZstZnhhacHRxF1ILN6/tPCiPEXYUSS0z6OYjhu3xi0WKtCHDPHI/tvQT7UAFQCSh+t
 KkDYZE6dxfk+oLMk7prlS9MysZLfq0QiXzOyE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=OeFPH0zh
Subject: [Buildroot] [PATCH 2/3] package/libgphoto2: bump to version 2.5.33
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

The removed patch has been merged in version 2.5.32.

Update file hash due to conversion the ISO-8859 text to UTF-8:
https://github.com/gphoto/libgphoto2/commit/6fdc5f8f370b2716e7342f994c19b9c7ae37a0f6

Release notes:
https://github.com/gphoto/libgphoto2/releases

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...gth-with-jpeg-jeaders.-fixes-https-g.patch | 39 -------------------
 package/libgphoto2/libgphoto2.hash            |  4 +-
 package/libgphoto2/libgphoto2.mk              |  2 +-
 3 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch

diff --git a/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch b/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
deleted file mode 100644
index 910c9b125add..000000000000
--- a/package/libgphoto2/0001-align-outlen-length-with-jpeg-jeaders.-fixes-https-g.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 721f7f8c3ec8058d504607873e4c317aac0c99c5 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Mon, 4 Dec 2023 13:26:08 +0100
-Subject: [PATCH] align outlen length with jpeg jeaders. fixes
- https://github.com/gphoto/libgphoto2/issues/941
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: https://github.com/gphoto/libgphoto2/commit/721f7f8c3ec8058d504607873e4c317aac0c99c5
----
- camlibs/ptp2/chdk.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
-index e1d898f37811..e775ea1d4bbb 100644
---- a/camlibs/ptp2/chdk.c
-+++ b/camlibs/ptp2/chdk.c
-@@ -1150,7 +1150,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
- 	struct		jpeg_error_mgr jerr;
- 	JSAMPROW	row_ptr[1];
- 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
--	uint64_t	outlen = 0;
-+	unsigned long	outlen = 0;
- 	unsigned int	row_inc;
- 	int		sshift, dshift, xshift, skip;
- 
-@@ -1161,8 +1161,8 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
- 		sshift = 6;
- 		dshift = (width/height > 2) ? 6 : 12;
- 		xshift = 4;
--	/* Digic 6 cameras: 8 bit per element UYVY,
--	 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
-+		/* Digic 6 cameras: 8 bit per element UYVY,
-+		 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
- 	} else {
- 		row_inc = buf_width*2;
- 		sshift = 4;
--- 
-2.43.0
-
diff --git a/package/libgphoto2/libgphoto2.hash b/package/libgphoto2/libgphoto2.hash
index af52b47dc804..c2ff672613a2 100644
--- a/package/libgphoto2/libgphoto2.hash
+++ b/package/libgphoto2/libgphoto2.hash
@@ -1,3 +1,3 @@
 # Locally calculated hash
-sha256  a7253bd18c6ef65352150ac36a668f883a5ad2634eb6455b3ca9aa6ac98d0073  libgphoto2-2.5.27.tar.xz
-sha256  ebc385a0b1d477be5177ed6d9129557aa59a3ad0f26ebe7dd97ee942a0fb68ee  COPYING
+sha256  28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2  libgphoto2-2.5.33.tar.xz
+sha256  530128f45fc02d92d4dae04d9c1e1f28a078a9b0d32c0ab254c406ba8fba43ec  COPYING
diff --git a/package/libgphoto2/libgphoto2.mk b/package/libgphoto2/libgphoto2.mk
index c1d5352c00f8..851eb401a136 100644
--- a/package/libgphoto2/libgphoto2.mk
+++ b/package/libgphoto2/libgphoto2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPHOTO2_VERSION = 2.5.27
+LIBGPHOTO2_VERSION = 2.5.33
 LIBGPHOTO2_SOURCE = libgphoto2-$(LIBGPHOTO2_VERSION).tar.xz
 LIBGPHOTO2_SITE = https://github.com/gphoto/libgphoto2/releases/download/v$(LIBGPHOTO2_VERSION)
 LIBGPHOTO2_LICENSE = LGPL-2.1+, GPL-2.0 (adc65), GPL-2.0+ (some camlibs), \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
