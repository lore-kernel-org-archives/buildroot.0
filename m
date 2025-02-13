Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8B3C0219D
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 14:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CDEC40B88;
	Thu, 13 Feb 2025 14:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1fXMlDW0blEr; Thu, 13 Feb 2025 14:41:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05204407FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05204407FE;
	Thu, 13 Feb 2025 14:41:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B35F12D
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDB3F407FE
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vt6MAHcFhwW2 for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 14:41:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 938D040999
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 938D040999
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 938D040999
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 14:41:51 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e545c1e8a15so993139276.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:41:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739457710; x=1740062510;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M3HwkxxvVOfUH9sIe8rYixvCrhWtbfNM19ClOXpPLpM=;
 b=u4Vhxyc0mUOyDAl12og6ZwwIBeELxaPQxcDYguMieNVWF2pFqWOCEA+e4rmA7du84C
 4IAIvMOzdzOMzx9tA741MHMnL24l7ppKYco+iEUiw04mWDbTYy77yyaNdimCx8tiwDGR
 BvktxZ5lPP1VfkoAQvygQ6+sYmobsC+K7qxLPPDH0Q/iXeH33nfjTMmNKkbCuG/cyk0l
 XC7vBzXPwb3pzmJy0COXLodCAVjJbFgR4vR91bgCtt5fckLNQgeUKyNl7j5rQmgSGumj
 bUeRRu6Uh4cfGaqVFf0kyOxX9DgD31sZ+ATDdAg5Rmr3BKAbQ0dJA1kErEprAGJfInAp
 MJmQ==
X-Gm-Message-State: AOJu0Yycs2iUSJYP6fLvUhQBCkjbF/UolERSyrBhrxkqMAS0IPWLCSNN
 TRBI842XwWUd2oYu2a6uvpAUP0gtsoYQXIDSAI26tdwRkZaG+6bBO4DFXA==
X-Gm-Gg: ASbGncuZPbKrkykH3btqzfufveBxekcSu8KdAdDHzK2xsUwPPaZu/5mzf0kLZvwX/dH
 CsvDD4ipvaGdldGvIkF903qV7wdBovdMSb9+J2WCQacHZCVuPp2Kd8LUMxpQtO9U5LIuTH+xNg+
 iM6xSF3G6k+oqFtscF4m/5X25kZjzwjT/qV2eLxoMLvHwMXr0lXPoJY7xT66hsH2oo6qmdUbZyp
 zOYF01IjdlQ+/KVXn+L+21pus5q7+GHNZswvwSv2tjMP2f203XMq47sPnwQgdsRGU6den8k8ooO
 Sw3/xsQRCTpp
X-Google-Smtp-Source: AGHT+IGFHpeni1f8VmGKO81DW8zM7VmaS9Io4NjMlOG5OM4nlySsg8JPPnps9NUlhRMCXal0nOc75A==
X-Received: by 2002:a05:6902:843:b0:e58:1556:2c18 with SMTP id
 3f1490d57ef6-e5da820c6c0mr3405707276.41.1739457709946; 
 Thu, 13 Feb 2025 06:41:49 -0800 (PST)
Received: from localhost ([66.112.214.180]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e5dae0da314sm418128276.45.2025.02.13.06.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 06:41:49 -0800 (PST)
From: Scott Fan <fancp2007@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Feb 2025 22:41:33 +0800
Message-ID: <20250213144135.1969776-1-fancp2007@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739457710; x=1740062510; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M3HwkxxvVOfUH9sIe8rYixvCrhWtbfNM19ClOXpPLpM=;
 b=WDwRMBaoj92L6rplyKi7Ao89v2NZwjCM6+BuMRS5Zn/Yj82UWzL2fUnxZkGoUup2GS
 c8wkmDlevFRpt3oSoUpfGaNNQzoW8U4xKYz1gGw3gP+ySsqot15j3KRsmG0ayBJz0kSc
 U7R/3KiuQWjhIRzhJ+KxgcEbmP8rq9OThXDC0eEt3dJH+594ilSFAJuTNNyBbtKV9b3p
 g2vTuM9+gRJoIm9cDdbxGG0hnmSLW1+FegRCQGyFme+06nJELkgUdVzO11lQmcj1aIj2
 1uo3ZJkGGJaVUJQAppWNhalPI+ta0SfBQVYgl1g446afslICTY1O6xvx9h1ABy4m9uMh
 97/g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WDwRMBao
Subject: [Buildroot] [PATCH] configs/beaglebone: bump Linux to
 6.6.58-ti-arm32-r10 and U-Boot to 2025.01
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
Cc: Lothar Felten <lothar.felten@gmail.com>, Scott Fan <fancp2007@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.6.58-ti-arm32-r10 and
U-Boot to version 2025.01.

Tested on beaglebone black.

Link: https://github.com/beagleboard/linux/releases/tag/6.6.58-ti-arm32-r10

Signed-off-by: Scott Fan <fancp2007@gmail.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash | 2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash | 2 +-
 configs/beaglebone_defconfig                          | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index 4a7384d036..b7d4412941 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f1ae7325c6c146e0f852866a3bfd3f90ae1b5f46e414bc99a38384ed677e3721  linux-6.6.32-ti-arm32-r7.tar.gz
+sha256  c6ee813cc48fe7e308c149798100d621514e832da507e34d1dfd8247ef9ae39f  linux-6.6.58-ti-arm32-r10.tar.gz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index 904fa56c02..50674352d7 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index cad32e90b1..ddeb221e86 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.6.32-ti-arm32-r7)/linux-6.6.32-ti-arm32-r7.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.6.58-ti-arm32-r10)/linux-6.6.58-ti-arm32-r10.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
