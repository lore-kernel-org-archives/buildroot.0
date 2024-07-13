Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CCAC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 13:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 114C880BC1;
	Sat, 13 Jul 2024 13:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co4yYtLmEHIB; Sat, 13 Jul 2024 13:09:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D9B580BD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D9B580BD0;
	Sat, 13 Jul 2024 13:09:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8B51BF400
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A1EF40611
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUCSQpF0mGeS for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 13:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE8BC4052B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE8BC4052B
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE8BC4052B
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:08:57 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso387393966b.0
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 06:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720876135; x=1721480935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=85FDAGICK70wxaDXClU8bQTfB1rytpX40QbmD4VlhEg=;
 b=qBvM/1b3RxB5oisGL/+/biLjDIpdmpeniGp4GbdkRS75EVD9uv1L8HlwvDPWFZQNMn
 2CZTb1S/wTQGNLY9+JrtFc59U3/S47TtHe9OM4ObZtZY/ZevkAvOPP1/yek5Mnr9Ak5a
 tOz83YNEDfxJSdRiFSseGPbcE/65aorn5TxvUywnjZw/andOq6aWg27nGVxrJtVTtgSU
 fgcmD09ZNfhZYSoU+PPFomAH22vQhAQxjgolYIz4FXAk97MAwwMs9CrXXR/OZFAjdCjV
 FU5WI8NRPi4M4QgzOs9k8O/Dx/rh37C/Z2dDTSdSN2cMCPnJIb/R7sR1vc18c9DL2UDP
 65Bw==
X-Gm-Message-State: AOJu0Yw8PHXxGTgKexONtMWZT/LsyuQ0sUMh0AbBiAMjhFKuRyjZlRB7
 QhEUNQpp5qeJ/7tW4nPze6TP1ptmQuWgZcQl+5RabjvAncleekMnqSrkPWPcMJFG6jBhP0ghDf1
 T/k4=
X-Google-Smtp-Source: AGHT+IHA3QJWT5S+M7afd4QlFxk70est06/RWt4yQZzinuCZOJ3uFXN4TlNTS0sPgHv9ILd7zP9ryA==
X-Received: by 2002:a17:907:94c5:b0:a6f:4fc8:266b with SMTP id
 a640c23a62f3a-a780b68a226mr1161550366b.3.1720876133171; 
 Sat, 13 Jul 2024 06:08:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-101-21.retail.telecomitalia.it. [95.244.101.21])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc5b3f8bsm50177466b.53.2024.07.13.06.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 06:08:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 15:08:47 +0200
Message-ID: <20240713130847.4097389-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720876135; x=1721480935;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=85FDAGICK70wxaDXClU8bQTfB1rytpX40QbmD4VlhEg=;
 b=n3K+Hi+PNHP6I3LaSJPAsBfjQFiTNovLb+xfUf3fNPMLUBBVZMSO9DFzpayFH62inQ
 Qk0njFyMrlKeEncbsCvtW1yIlpPEKeJeKsrjy5zIyxtNR/E57yw83/Yd3wVkRpaKUm3i
 l5agMmMlBNo/NyMzYuzqLh5jdGtj/KGeGuuCE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=n3K+Hi+P
Subject: [Buildroot] [PATCH 1/1] configs/stm32mp157a_dk1: bump Linux to
 6.6.39 and U-Boot to 2024.07
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
Cc: linux-amarula@amarulasolutions.com,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch bumps the Linux kernel to version 6.6.39 and U-Boot to version
2024.07.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../stm32mp157a-dk1/patches/linux/linux.hash           |  2 +-
 .../stm32mp157a-dk1/patches/uboot/uboot.hash           |  2 +-
 configs/stm32mp157a_dk1_defconfig                      | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
index 8b7624cceb9e..f4b1146f83b6 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9  linux-5.13.tar.xz
+sha256  2783d42112095f95c510e1b421f056df8cbfa845f9040c6115080434a77a776b  linux-6.6.39.tar.xz
diff --git a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
index 7cef5b688ec3..fe9b4f53dc63 100644
--- a/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
+++ b/board/stmicroelectronics/stm32mp157a-dk1/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e31cac91545ff41b71cec5d8c22afd695645cd6e2a442ccdacacd60534069341  u-boot-2023.04.tar.bz2
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/configs/stm32mp157a_dk1_defconfig b/configs/stm32mp157a_dk1_defconfig
index 38f7bc8946c1..31c52a7723a2 100644
--- a/configs/stm32mp157a_dk1_defconfig
+++ b/configs/stm32mp157a_dk1_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a7=y
 
-# Linux headers same as kernel, a 5.13 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32mp157a-dk1/patches"
@@ -14,11 +14,11 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.39"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32mp157a-dk1/linux.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dk1"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dk1"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # Filesystem
@@ -41,7 +41,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
