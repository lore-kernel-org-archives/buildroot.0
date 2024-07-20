Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67132C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 20:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3556681E76;
	Sat, 20 Jul 2024 20:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PVchZJ8Shhwe; Sat, 20 Jul 2024 20:17:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E276781E7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E276781E7E;
	Sat, 20 Jul 2024 20:17:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BBA81BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0963C40390
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 20:17:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ocHqS1z3Lf7k for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 20:17:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94CA0403A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94CA0403A2
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94CA0403A2
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 20:17:15 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a77b60cafecso313081766b.1
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 13:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721506634; x=1722111434;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPfgidpmLVAB14IuLGtPiruRZ6gI5sz7mTCh2C1/GZQ=;
 b=hzNgKpnN/ju7igPQftBBl/FAX2tDVK79efYrDwpWz8xhngoG9flk8lcCtE/w1IWche
 W9kwaEz5NayYpeojE+1llQpJP3JIFl6MsPY4w3GoDUh+KhdhfOM69zo/dxBbRStwPphk
 8tCefRxZbNhKOBaCck2CFxL002qCzLiDLFYheZGSMF9pEP7u9cXwvgj/ook1nsD2qmvN
 /8qtkkhmBtU47eyOPsyJ3n703aKiNsnk6IuIphAM3+m0ndF73ehlndtjw2L5SmhnKIlA
 QXP0GNGfdg94W/T8blV7T0n8NbvP/iQTr8VQTotplb6hhtYxMA3MGT7k4a2kOE9/O1Gg
 OCMA==
X-Gm-Message-State: AOJu0YzcCTdOC5iSHijmmEsknq3dQ61v6mQkNBdM5KYkJTqZHyvDyxJp
 WpZiNeh842TBlelwB67HZCKJkfVyetyGDimcorsUY5zPlir3o2IccJgldlL08f9paqF5dC8MMhM
 2lFY=
X-Google-Smtp-Source: AGHT+IGhBxC9dqsJpfBkVZCTHM1CoOZXnb+ZuRwbYfQtz30wjlbspej1HXn7hfZcOQ7CkD/N3KKEOw==
X-Received: by 2002:a17:907:94c9:b0:a7a:3904:f45 with SMTP id
 a640c23a62f3a-a7a4bf39545mr159754566b.8.1721506633858; 
 Sat, 20 Jul 2024 13:17:13 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (host-80-180-25-123.retail.telecomitalia.it. [80.180.25.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7e7871sm204723766b.96.2024.07.20.13.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 13:17:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 22:16:59 +0200
Message-ID: <20240720201659.2253736-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
References: <20240720201659.2253736-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721506634; x=1722111434;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PPfgidpmLVAB14IuLGtPiruRZ6gI5sz7mTCh2C1/GZQ=;
 b=gC9TADmjV8tTEusu/6pmWQ5zjYfl5ucRuQV0Tg6Hy9Kmo3oxYemNQRnOFmAu0NDUaE
 jGotydaxhLV2XAh2DIPQmPcegN7lvCJ8oIchD/WbB8HT0GguyeM4k0LD/eFCv8G5HxJP
 dtfwyLoOLI7JVxydzJshOKzgRWBzfyzoGXuR8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=gC9TADmj
Subject: [Buildroot] [PATCH 5/5] configs/beaglebone: bump Linux to
 6.6.32-ti-rt-arm32-r7 and U-Boot to 2024.07
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.6.32-ti-rt-arm32-r7 and
U-Boot to version 2024.07.

Tested on beaglebone black.

Link: https://github.com/beagleboard/linux/releases/tag/6.6.32-ti-rt-arm32-r7
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 board/beagleboard/beaglebone/patches/linux/linux.hash |  2 +-
 board/beagleboard/beaglebone/patches/uboot/uboot.hash |  2 +-
 configs/beaglebone_defconfig                          | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/beagleboard/beaglebone/patches/linux/linux.hash b/board/beagleboard/beaglebone/patches/linux/linux.hash
index ce0613ad4467..4a7384d03634 100644
--- a/board/beagleboard/beaglebone/patches/linux/linux.hash
+++ b/board/beagleboard/beaglebone/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  6b73d8dca21000030acd2e37aed43f23de2fdd2850a2808722658241df48e671  linux-6.1.80-ti-r34.tar.gz
+sha256  f1ae7325c6c146e0f852866a3bfd3f90ae1b5f46e414bc99a38384ed677e3721  linux-6.6.32-ti-arm32-r7.tar.gz
diff --git a/board/beagleboard/beaglebone/patches/uboot/uboot.hash b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
index bc999536af21..fe9b4f53dc63 100644
--- a/board/beagleboard/beaglebone/patches/uboot/uboot.hash
+++ b/board/beagleboard/beaglebone/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b99611f1ed237bf3541bdc8434b68c96a6e05967061f992443cb30aabebef5b3  u-boot-2024.01.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 28f3c20c00ee..ca418bed2083 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a8=y
 BR2_ARM_FPU_VFPV3=y
 
-# Linux headers same as kernel, a 6.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System
 BR2_GLOBAL_PATCH_DIR="board/beagleboard/beaglebone/patches"
@@ -19,10 +19,10 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beaglebone/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.1.80-ti-r34)/linux-6.1.80-ti-r34.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,6.6.32-ti-arm32-r7)/linux-6.6.32-ti-arm32-r7.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bb.org"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless am335x-bonegreen-wireless"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am335x-evm ti/omap/am335x-bone ti/omap/am335x-boneblack ti/omap/am335x-bonegreen ti/omap/am335x-evmsk ti/omap/am335x-boneblue ti/omap/am335x-boneblack-wireless ti/omap/am335x-bonegreen-wireless"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
@@ -33,7 +33,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
