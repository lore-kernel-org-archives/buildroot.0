Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C89CD5C0C5
	for <buildroot@archiver.kernel.org>; Fri,  8 Nov 2024 13:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBB0642B01;
	Fri,  8 Nov 2024 13:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKqGr8c3dxam; Fri,  8 Nov 2024 13:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75B8442AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75B8442AF2;
	Fri,  8 Nov 2024 13:36:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82B3AC0
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 13:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 624A9613D8
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 13:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBIVqQmPZZOI for <buildroot@buildroot.org>;
 Fri,  8 Nov 2024 13:36:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87B3E613CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87B3E613CB
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87B3E613CB
 for <buildroot@buildroot.org>; Fri,  8 Nov 2024 13:36:52 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-20ce65c8e13so23480305ad.1
 for <buildroot@buildroot.org>; Fri, 08 Nov 2024 05:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731073011; x=1731677811;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eYvN8R0ZrcJxPT605KOyYVR56IT3lM01i4jV6tCZdiY=;
 b=K3dfpb1ILZU28uWy9l3cGB+cM6fkY9uPv8dNyoG02VoX1gOG8J8mHuX1i1JvAq5uc2
 MlwDwotyGJtQ3LEWLAzb6GR5HmKHJaJ6o9F7Z9+JwgOIUaHogrUfiKHB1yHrXtHuMRHK
 Kwn7+JUGYjZtmPVf7YsyKIK9Gb/4SdmZ/InVC5XKVEgET8lYkCiD2n7cpPhPOoiDH4qJ
 OMSf/vARzkm3YfyfFUVKlvILGx/idCUyoYa2CLdnyEyS5COSYuAIzmV474ollaPlhib4
 cWN+DShT0W+aSItw+5twv4eBhwZIaOcGEcagmDcbnZj07nyH3UfcyXZ0xkk8XlFbKhp/
 R29w==
X-Gm-Message-State: AOJu0YxIYxJq8dGPHfHuWJxW11ewIbXrbbsFAKmMkuJ5gLdrWJf8wJ/x
 b9fWsqXfD+up6Xwl1os6e+qBTYEE3Tbw4ogv6+PR5EvqXdceuCDfA6ENtw==
X-Google-Smtp-Source: AGHT+IFFTbw4hTP5D5TLRQ52oISHA7R8bF67Q87ZUXAW23Phot4MG0nNQkJkGLX8W98nu2xw4MUlug==
X-Received: by 2002:a17:902:ce8b:b0:20c:dd71:c94f with SMTP id
 d9443c01a7336-2118359aea5mr30102555ad.41.1731073011259; 
 Fri, 08 Nov 2024 05:36:51 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177de1b5esm29864475ad.111.2024.11.08.05.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 05:36:50 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Cc: Scott Fan <fancp2007@gmail.com>,
 Gero Schwaericke <gero.schwaericke@posteo.de>
Date: Fri,  8 Nov 2024 21:36:39 +0800
Message-ID: <20241108133641.1216345-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108120935.540508-1-fancp2007@gmail.com>
References: <20241108120935.540508-1-fancp2007@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731073011; x=1731677811; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eYvN8R0ZrcJxPT605KOyYVR56IT3lM01i4jV6tCZdiY=;
 b=kPQDYdbS3eq5JRWj+KXDag5hmAHV2B97pS/GO9jdlsyVnJY4PdAH0tnFt6lCzauupZ
 X6ac4FaZTWehv9MZVunWXVfYqNAFzyLGwoC9Ruut55ur9a3d3uqA+9ooLeea6qXlFY+T
 OSoaotmfGCPF4Hl1jVdgRVfBtWm5OExMnskQDHCpsri0u5Bz8kOuXuYWStxAOT7uYAIU
 5Vf50u5TMhKdDU8cgzaMs1e8gmvUELzwoZFwgtHhhh6+dyO3lmxTLlcil1v2oIyPbn3E
 UOp/iZ7vISGPPQHmAxItWzKNrDOs6QbecBPAMsgTyX1pnAQdM49vpu24+OEkredFrxS2
 7KFw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kPQDYdbS
Subject: [Buildroot] [PATCH v2] configs/cubieboard1: bump Linux to 6.11.6
 and U-Boot to 2024.10
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

Signed-off-by: Scott Fan <fancp2007@gmail.com>

---
Changes v1 -> v2:
  - update the linux.hash and uboot.hash file
---
 board/cubietech/cubieboard1/patches/linux/linux.hash | 2 +-
 board/cubietech/cubieboard1/patches/uboot/uboot.hash | 2 +-
 configs/cubieboard1_defconfig                        | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/cubietech/cubieboard1/patches/linux/linux.hash b/board/cubietech/cubieboard1/patches/linux/linux.hash
index 5e9df51ecd..42d02c9f78 100644
--- a/board/cubietech/cubieboard1/patches/linux/linux.hash
+++ b/board/cubietech/cubieboard1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
+sha256  c954f60197008f1e1f32a1e77293903cf3801d2543ec4bf521f5651eb7f133ce  linux-6.11.6.tar.xz
diff --git a/board/cubietech/cubieboard1/patches/uboot/uboot.hash b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
index 97a2b4eaf9..904fa56c02 100644
--- a/board/cubietech/cubieboard1/patches/uboot/uboot.hash
+++ b/board/cubietech/cubieboard1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/cubieboard1_defconfig b/configs/cubieboard1_defconfig
index c2ced443ef..aeea988201 100644
--- a/configs/cubieboard1_defconfig
+++ b/configs/cubieboard1_defconfig
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
 BR2_GLOBAL_PATCH_DIR="board/cubietech/cubieboard1/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/cubietech/cubieboard1/rootfs_overlay"
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/cubietech/cubieboard1/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.11.6"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun4i-a10-cubieboard"
@@ -18,7 +18,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
