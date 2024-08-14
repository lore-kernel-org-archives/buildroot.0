Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9506EC52D7F
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 18:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 105D640C56;
	Wed, 14 Aug 2024 18:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amm3YjhHVvio; Wed, 14 Aug 2024 18:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF66340DBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF66340DBE;
	Wed, 14 Aug 2024 18:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDFC1BF97A
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6926F40264
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 18:37:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6oBlwD9OR_n for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 18:37:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C955740299
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C955740299
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C955740299
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 18:37:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-428e0d184b4so608075e9.2
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723660637; x=1724265437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hrulqbjCaIuW04QAWfHvIhmRSrLUe71qGczVuMUbgh8=;
 b=vnWEjpCqB/E7P65bddErYJXWdYqAnmfF2vFlfFmKUGhqO92JH0cCSUO0DEwnewBr/Y
 R/BqO8ryKSSbGVKgQh9NPYdRHdPAvIlbhapsiJuEYBLV2Z7szCP+YP6g75xeAJiA1c2y
 GD0vV80lWkoYoWxL7jMq/n1zy0OGR7bmsuX0bbzS2Z6126gdGNVSkSHXTzCMQLetYO+1
 /kGfmOo/rpkiF474ixuAcWuQqTH4ZW2QAQFDG7CiKERI6m5J6xAkWQr4ZyUWUcqd9GJu
 cMxe9wZCBB7vjIA/Tg2n1p4yD+Ro9WiaWo54p7lMjk2u/6QcMv4+GG0PDB5+rOUIBn8l
 ITfQ==
X-Gm-Message-State: AOJu0YyKBvaNuU3STDCcDCaB/O9fZwlCoQsqupIQiKSNdK7PRrZ6gL++
 YxG1joPaWuWv4GdPl4yZze0SKZECbP5Tz7i74xAjcgJ0SmU5MZkL
X-Google-Smtp-Source: AGHT+IGYxZ6qWjxeehhhM9L9k1tf6kxLzbz3/5fJ/1PJ/+uUhHFGaMkAfOAyqAax65QaMxq58Ho8Fw==
X-Received: by 2002:a05:600c:35c9:b0:426:6171:6083 with SMTP id
 5b1f17b1804b1-429dd23c0acmr30123415e9.13.1723660636150; 
 Wed, 14 Aug 2024 11:37:16 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded3596esm27677275e9.22.2024.08.14.11.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 11:37:15 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Wed, 14 Aug 2024 20:37:03 +0200
MIME-Version: 1.0
Message-Id: <20240814-master-v1-2-7834f3deddcb@gmail.com>
References: <20240814-master-v1-0-7834f3deddcb@gmail.com>
In-Reply-To: <20240814-master-v1-0-7834f3deddcb@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723660637; x=1724265437; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hrulqbjCaIuW04QAWfHvIhmRSrLUe71qGczVuMUbgh8=;
 b=hi/BHZFXTYqF4t7e8t+6Dx0EizUWTakXmwxXr16wAHSaUbfByAu0LK3/GgHSxsdPP5
 s3VnnlwVsbEdcY2GRJT4yGBS7h/Nuy1y3lXDs+Lau+4zz1duCNztDHZgE6CsMkKQeCw6
 gPkugARh8A9rNMSqmojhmnx0ap4HABu8T9e9AUg9t1Qz0qRZdYUWJmlh/F7yW17JsR+q
 x2DNIwreLuZrd5HJ7lha8rUGoayeP3RAMJkZRkI4517XTjGXSEbOV88huNkD4XRO8yEM
 e58md6SfVIgjfenVPcq2BPjITHiqfIQlOrksTiqmLX3fg0JT3Bra5h+4Qv18eI/py3mg
 Pd8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hi/BHZFX
Subject: [Buildroot] [PATCH RESEND 2/2] configs/stm32mp135f-dk: new defconfig
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
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new defconfig for STMicroelectronics board STM32MP135F-DK.

STM32MP135F-DK features can be found here:
  https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 .../overlay/boot/extlinux/extlinux.conf            |  4 ++
 board/stmicroelectronics/stm32mp135f-dk/readme.txt | 38 ++++++++++++++
 configs/stm32mp135f_dk_defconfig                   | 59 ++++++++++++++++++++++
 3 files changed, 101 insertions(+)

diff --git a/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf b/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 0000000000..0cc49d6a56
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp135f-dk/overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32mp135f-dk-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp135f-dk.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/stmicroelectronics/stm32mp135f-dk/readme.txt b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
new file mode 100644
index 0000000000..46879f88cf
--- /dev/null
+++ b/board/stmicroelectronics/stm32mp135f-dk/readme.txt
@@ -0,0 +1,38 @@
+STM32MP135F Discovery Kit
+
+Intro
+=====
+
+This configuration supports the STM32MP135F Discovery Kit (DK)
+platform:
+
+  https://www.st.com/en/evaluation-tools/stm32mp135f-dk.html
+
+How to build
+============
+
+ $ make stm32mp135f_dk_defconfig
+ $ make
+
+How to write the microSD card
+=============================
+
+Once the build process is finished you will have an image called
+"sdcard.img" in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an microSD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Boot the board
+==============
+
+ (1) Insert the microSD card in connector CN15
+
+ (2) Plug a micro-USB cable in connector CN11 and run your serial
+     communication program on /dev/ttyACM0.
+
+ (3) Plug a USB-C cable in CN6 to power-up the board.
+
+ (4) The system will start, with the console on UART, but also visible
+     on the screen.
diff --git a/configs/stm32mp135f_dk_defconfig b/configs/stm32mp135f_dk_defconfig
new file mode 100644
index 0000000000..cc01a2bd40
--- /dev/null
+++ b/configs/stm32mp135f_dk_defconfig
@@ -0,0 +1,59 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Linux headers same as kernel, a 6.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_9=y
+
+# System configuration
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_ROOTFS_OVERLAY="board/stmicroelectronics/stm32mp135f-dk/overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp1xx/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.9.8"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp135f-dk"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_OPTEE_CLIENT=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 DTB_FILE_NAME=stm32mp135f-dk.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="stm32mp1"
+BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR="135F_DK"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp13"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin u-boot.dtb"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=stm32mp135f-dk"
+
+# Additional tools
+BR2_PACKAGE_HOST_BMAP_TOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
