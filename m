Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E480C3ABC9
	for <buildroot@archiver.kernel.org>; Tue, 13 May 2025 21:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC4740E5C;
	Tue, 13 May 2025 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgT0bkGt3Z38; Tue, 13 May 2025 21:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3717A410C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3717A410C6;
	Tue, 13 May 2025 21:42:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D011150
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4223C61014
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiqHbAyW1XzH for <buildroot@buildroot.org>;
 Tue, 13 May 2025 21:42:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=johan.patrik.olsson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2DB8F60FEA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB8F60FEA
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DB8F60FEA
 for <buildroot@buildroot.org>; Tue, 13 May 2025 21:42:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-550d4b7a076so694465e87.2
 for <buildroot@buildroot.org>; Tue, 13 May 2025 14:42:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747172559; x=1747777359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AIK2Oz+0tBTt4nbyqNnN2yT8Qlee2MnjNDDEhqhSfUs=;
 b=uyYLvFqyPkGqqWPRRz2YWaUHNImCDh2d645RMIKcb0Heri7nz9Qwpfd247jRJz8+7L
 9iBatXR0WnhcIiasuPI60cRBCQQ/AnUM8YICu8htTWc5eOg1MKrR0LsWFuud4ctqcY3w
 SzV/3gTPOLsq9B7Vk6OOZ+ll/x32hiCuCSJNT9cojHyq2j4+kdZsGNIQDK+UJGcF9nT2
 vPN4TCxPqvpNak2V4UXNXMSnbFo8yOCc8bN0DNQMyz4q//1kxr8/aN61tyaUI+ELUKMm
 z5qgAqWMJIm7fq38W21+cW9zeDEotab1TJp+2YoGUWT1s+Q6MKIBnDleEoIY7/aw7DqC
 wwrA==
X-Gm-Message-State: AOJu0YySYJYsEawXlcqy69yzm5KZrvVQTuA+x3+z5RPk0ZAurLUtTeXK
 r3Q3cE1/rlhbFINiYMMrgDZgHi+HDZtTVVE0GooyiscVL07h1fTVFwhz+om+
X-Gm-Gg: ASbGncu7J0RUTtMY4sqxXfdS7UB6Tqi9oAaJlobHP57kcnzp3O2m4DlJukrV/M7KctB
 F3Z7BMIXiZfxfml8Xf2Ao/Jv/wi3bmtl5+4qXQ9usRtcn9bFFuOsISVzScGrp/cxG/Jzm+aLCGg
 ixiTJE9DhiL5yrMxi0dCGxQ2ga0FfzPqzkTcm5JicMKFR64yZ7qV1w5eA4yNK1IuOmvxJFeOLr9
 XBqEmLjd6QaBmwrGTeUWPzsT+G1HEnhoqcgpCGZHk2bgKNLbvNdXxKe7LtvbZlsd3RdkaMuzOXM
 eOQD+HfRxwdGiS3EX/YJNzZQaJhd1tfOk3LqYWIHKeSi5+xN8QgRL1Y6XUHo3pd75p8Jgrq9fHU
 J2N8IE3U3JTpA7Fh3Xnwq8tL6gE0C+EMRDoe0Rx+kiwg=
X-Google-Smtp-Source: AGHT+IFtZtdh+rGaQnaqxRYSU15goGBBhoAabowQgkgKv8h6vtMGL7r/JPFB5VYDB5SQqBqnOSX0Lw==
X-Received: by 2002:a05:6512:31c7:b0:54f:c44d:894b with SMTP id
 2adb3069b0e04-550d5fc3edemr344303e87.19.1747172558766; 
 Tue, 13 May 2025 14:42:38 -0700 (PDT)
Received: from DESKTOP.localdomain (94-255-243-81.cust.bredband2.com.
 [94.255.243.81]) by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54fc645cecasm2021635e87.62.2025.05.13.14.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 14:42:37 -0700 (PDT)
From: Patrik Olsson <johan.patrik.olsson@gmail.com>
To: buildroot@buildroot.org
Cc: kuzminov.sergey81@gmail.com,
	johan.patrik.olsson@gmail.com
Date: Tue, 13 May 2025 23:42:26 +0200
Message-ID: <20250513214226.1119477-2-johan.patrik.olsson@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513214226.1119477-1-johan.patrik.olsson@gmail.com>
References: <20250513214226.1119477-1-johan.patrik.olsson@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747172559; x=1747777359; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIK2Oz+0tBTt4nbyqNnN2yT8Qlee2MnjNDDEhqhSfUs=;
 b=RpsHi2Li2lbhSjVkoQaO9UHT18c13dA4f3omG704ape9GuORnRAKDaehv+PnDxr2dr
 +7KB/QSnweL0mgqHpPfiYbr2SDb+sqgH8Z/25U2lQZ3Tic/e/h5lQB8IhpNbbibe7UeU
 xHcNiGbGj0CqdYagGEGpoH6XPPBwRhVx8zCBBAyUBhsuNrUFOepgMRjfbPSUuhBNm4Lo
 VJg/ztI0zEikhN8rWxrBIeUw99aMtxi4RdXi+g1rXJup3Gk01B33XrViY+PTe5lKK6pd
 Q3d4SB+qMEvmehk+C5uDf2pnb1FaQxcbCVNvVAT7y5uAfd/Ef5ghurkK1oStjtYqsv9C
 LY7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=RpsHi2Li
Subject: [Buildroot] [PATCH 2/2] configs: friendlyarm_nanopi_r3s: bump TF-A,
 U-Boot and Linux versions
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

- TF-A to version v2.12 (LTS)
- U-Boot to version v2025.04
- Linux kernel to version 6.14.6

Signed-off-by: Patrik Olsson <johan.patrik.olsson@gmail.com>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash | 2 --
 board/friendlyarm/nanopi-r3s/patches/linux/linux.hash      | 2 +-
 board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash      | 2 +-
 configs/friendlyarm_nanopi_r3s_defconfig                   | 7 +++----
 4 files changed, 5 insertions(+), 8 deletions(-)
 delete mode 100644 board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash

diff --git a/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index b5898cba3f..0000000000
--- a/board/friendlyarm/nanopi-r3s/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
index b2e8ee602b..451159a6dc 100644
--- a/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
+++ b/board/friendlyarm/nanopi-r3s/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b80e0bc8efbc31e9ce5a84d1084dcccfa40e01bea8cc25afd06648b93d61339e  linux-6.13.4.tar.xz
+sha256  21817f1998e2230f81f7e4f605fa6fdcb040e14fa27d99c27ddb16ce749797a9  linux-6.14.6.tar.xz
diff --git a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
index f9bb6166d1..b550824126 100644
--- a/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
+++ b/board/friendlyarm/nanopi-r3s/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  e54102f17328397d5d63b00865e9108d5806d18018509fc24ce6e7e3fe6a12f1  u-boot-2025.04-rc2.tar.bz2
+sha256  439d3bef296effd54130be6a731c5b118be7fddd7fcc663ccbc5fb18294d8718  u-boot-2025.04.tar.bz2
diff --git a/configs/friendlyarm_nanopi_r3s_defconfig b/configs/friendlyarm_nanopi_r3s_defconfig
index 5844c5bb4c..beeab11c5e 100644
--- a/configs/friendlyarm_nanopi_r3s_defconfig
+++ b/configs/friendlyarm_nanopi_r3s_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.13.4"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.14.6"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/nanopi-r3s/kernel.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -29,14 +29,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3568"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="bl31/bl31.elf"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04-rc2"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi-r3s-rk3566"
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
