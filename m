Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD1FC52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 18:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D374A605C3;
	Sat, 24 Aug 2024 18:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QIW-GlIoH7RW; Sat, 24 Aug 2024 18:03:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90B63605CF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90B63605CF;
	Sat, 24 Aug 2024 18:03:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A9831BF359
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 18:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58F1640351
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 18:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1QLt5ZlPP_5 for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 18:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1FC6840246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FC6840246
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FC6840246
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 18:03:15 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-7141e20e31cso2558009b3a.3
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 11:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724522595; x=1725127395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=muZEf22afssPc+NeRhHP/NItHn15cE7G0H6hqsgXWgE=;
 b=JoF6Hs3T9ChtKUjWYI6Zob349dr9M3DP9aqpPbbSBlY2bxDafZ7qr94960mfBqOcgF
 HySf6onmLTkKIdOVhjGuE2X7owYHkTqUCRjEvBA5qDXEd9pnZ6oZCDO+UYS7lnMKPeY6
 rxu/tASI46ZOAMA3CL+huPkgYuPnscb7K/eoblLyjDsMXBdr9pdIJfLQfqWiiNjoKqfC
 OqboIpNn1fGJ5ACPHpIIwe5VrEj55CWjma8IUhPVdbJPgylHUviW1shZyFaEAJrjhK+8
 QfMAQJ0aqpK8hwxXAUB69fU0tooWRsdBCdfQcUaNoZoRadZxyCIT/5Xeg8AmCb/Llo4F
 oEjg==
X-Gm-Message-State: AOJu0YyTfi83bl/rN9J+bExNiB1PZWRs/hiBEa7fa2EE0WjJImSg5bLB
 2lLUTqm4YomEbnJfTH4Ln99Fc2Cd1zHfjuv8UM1pXrpw9VLh58ikg9+jEg==
X-Google-Smtp-Source: AGHT+IGg10yUMjFsDA8lZD+RUDH+mS/eLLV8I260M0cx0rE1Lj78AqSGeNWGYW2ejRHohO8JfDQBlA==
X-Received: by 2002:a05:6a00:3ccd:b0:70d:2621:5808 with SMTP id
 d2e1a72fcca58-714457706b0mr7431995b3a.9.1724522594673; 
 Sat, 24 Aug 2024 11:03:14 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:44ec:77f0:fcc9:d01d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7143423143bsm4919889b3a.17.2024.08.24.11.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 11:03:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 15:03:07 -0300
Message-Id: <20240824180307.829708-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724522595; x=1725127395; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=muZEf22afssPc+NeRhHP/NItHn15cE7G0H6hqsgXWgE=;
 b=b7/vurnxCayoHZ3D/wLqrX/LdPq7KlRV89P8xciHBMSFGOw0oo8UX3QzFrX2cc+yHa
 YNqUDK1MTGbOJlTE+Sk0c8XBV/SgT8Qc9u/w8sqCdk+hs2PZVBPyQZL4SucoC0+d+tuj
 WGFTzQ447TUXgiPJEJszs2qnMRJlg8Hne6BdwYd/n6vD1tKsZwYm7PcuoZRd9UqRral3
 9KOZX/SR6loocvDJ3rzvODjG9GbBg7FiKiHB59O2Vr00ChFSSYKYAm4HWoRYe7ZrxN6S
 Z3v38lBzf5z7EKKpkL+yuBlvZOR8VBfwEzuXSl2vPXC/6LyTFcbNjnXNib+nPSVWXjr2
 i6xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=b7/vurnx
Subject: [Buildroot] [PATCH] configs/mx25pdk: remove defconfig
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The imx25pdk board has been removed from U-Boot and I no
longer have access to the board.

Remove its support.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .checkpackageignore                          |  1 -
 DEVELOPERS                                   |  1 -
 board/freescale/imx25pdk/readme.txt          | 54 --------------------
 configs/mx25pdk_defconfig                    | 35 -------------
 package/freescale-imx/Config.in              |  3 --
 package/freescale-imx/firmware-imx/Config.in |  1 -
 6 files changed, 95 deletions(-)
 delete mode 100644 board/freescale/imx25pdk/readme.txt
 delete mode 100644 configs/mx25pdk_defconfig

diff --git a/.checkpackageignore b/.checkpackageignore
index 778e3b865154..80445921444b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -191,7 +191,6 @@ configs/microchip_sama5d2_icp_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sama7g5ek_mmc_defconfig lib_defconfig.ForceCheckHash
 configs/microchip_sama7g5ek_mmc_dev_defconfig lib_defconfig.ForceCheckHash
 configs/minnowboard_max_defconfig lib_defconfig.ForceCheckHash
-configs/mx25pdk_defconfig lib_defconfig.ForceCheckHash
 configs/mx53loco_defconfig lib_defconfig.ForceCheckHash
 configs/mx6udoo_defconfig lib_defconfig.ForceCheckHash
 configs/nexbox_a95x_defconfig lib_defconfig.ForceCheckHash
diff --git a/DEVELOPERS b/DEVELOPERS
index d2b64ee5c6f4..f3b3a21b79fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -984,7 +984,6 @@ F:	configs/imx6ulpico_defconfig
 F:	configs/imx7d-sdb_defconfig
 F:	configs/imx7dpico_defconfig
 F:	configs/imx8mqevk_defconfig
-F:	configs/mx25pdk_defconfig
 F:	configs/mx51evk_defconfig
 F:	configs/mx53loco_defconfig
 F:	configs/mx6cubox_defconfig
diff --git a/board/freescale/imx25pdk/readme.txt b/board/freescale/imx25pdk/readme.txt
deleted file mode 100644
index 1aece6c9b3c1..000000000000
--- a/board/freescale/imx25pdk/readme.txt
+++ /dev/null
@@ -1,54 +0,0 @@
-**************************
-Freescale i.MX25 PDK board
-**************************
-
-This file documents the Buildroot support for the Freescale i.MX25 PDK board.
-
-Build
-=====
-
-First, configure Buildroot for the i.MX25 PDK board:
-
-  make mx25pdk_defconfig
-
-Build all components:
-
-  make
-
-You will find in output/images/ the following files:
-  - imx25-pdk.dtb
-  - rootfs.ext4
-  - rootfs.tar
-  - sdcard.img
-  - u-boot.imx
-  - zImage
-
-Create a bootable SD card
-=========================
-
-To determine the device associated to the SD card have a look in the
-/proc/partitions file:
-
-  cat /proc/partitions
-
-Buildroot prepares a bootable "sdcard.img" image in the output/images/
-directory, ready to be dumped on a SD card. Launch the following
-command as root:
-
-  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
-
-*** WARNING! This will destroy all the card content. Use with care! ***
-
-For details about the medium image layout, see the definition in
-board/freescale/common/imx/genimage.cfg.template.
-
-Boot the i.MX25 PDK board
-=========================
-
-To boot your newly created system:
-- insert the SD card in the SD slot of the board;
-- put a USB cable into the Debug USB Port and connect using a terminal
-  emulator at 115200 bps, 8n1;
-- power on the board.
-
-Enjoy!
diff --git a/configs/mx25pdk_defconfig b/configs/mx25pdk_defconfig
deleted file mode 100644
index ec4f8b8289d7..000000000000
--- a/configs/mx25pdk_defconfig
+++ /dev/null
@@ -1,35 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Linux headers same as kernel, a 4.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
-
-# System
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-
-# required tools to create the SD card image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-
-# Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx25pdk"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx25-pdk"
-BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 6d196a052dae..05a358723545 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -10,9 +10,6 @@ if BR2_PACKAGE_FREESCALE_IMX
 choice
 	prompt "i.MX platform"
 
-config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
-	bool "imx25-3stack"
-
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
 	bool "imx27ads"
 
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 4a9986448f8b..7d27c8e14b07 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -14,7 +14,6 @@ if BR2_PACKAGE_FIRMWARE_IMX
 
 config BR2_PACKAGE_FIRMWARE_IMX_SDMA_FW_NAME
 	string
-	default "imx25" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
 	default "imx51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
 	default "imx53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "imx6q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
