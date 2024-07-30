Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B34AC3DA7E
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 13:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBCF280F42;
	Tue, 30 Jul 2024 13:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meURoP1jY0x0; Tue, 30 Jul 2024 13:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F8D880FA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F8D880FA4;
	Tue, 30 Jul 2024 13:10:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29F271BF969
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 13:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C77A9605A9
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 13:10:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vB12WqunJQu for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 13:10:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=rgallaispou@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 79581608F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79581608F9
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79581608F9
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 13:10:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso27596015e9.0
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722345015; x=1722949815;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5/PcpMMjTNfjS3MG8iVpqjLkMgQZL7UCmkdchd52oQ=;
 b=QFlsYEjsKeNZAQaCaah2RB+8ccKnqHONY5hXSkBqHf4p9FR4qqyy5oiyL7kHyXWCrb
 iSUEsXmjEwt80mTW69c4ZHYA8+1l+UbC4U5g6bF8E5dZLOLmE5PM9fVd7j7fRcXrzlOQ
 bFfnp0gHXFIprUowDuGfYqvFJiSbD3Nbb/gvwKrtx2H7EB4RyC5nEPdmF0fDjGz3LDgZ
 RYc2PsvrDukjLV5ZYeiZeTCNBuv1E9xUDmXa2nH7CW/sZawNC4SGK6PlgCRv1DbkqWPl
 eKoL8vSXIhfRWxrAJO6HkaJHbeZU9HUlW+JpAlYZrvbufwcTXsmTHHQb5pNrihkXuJ+k
 6hBg==
X-Gm-Message-State: AOJu0YzP2YSwnlFzxY0fg2e7ER9nTYw5rRnjih56k7bRV5unPZKfZPDV
 3hlwGiS7OQuWFB/fnrFgLLLKiGc1ZVmdbNErA+DOwg9mhc3tbpS98rTOFA==
X-Google-Smtp-Source: AGHT+IHJGkV82yEn/qqNRSizp/ThYP3GGVZsMmQ6qF7MEFtEWJ9Gx7/IOvMt3G9jD3LjwMZzl+qyXQ==
X-Received: by 2002:a5d:4bcd:0:b0:367:9279:c401 with SMTP id
 ffacd0b85a97d-36b5cf1e5abmr7815322f8f.34.1722345014959; 
 Tue, 30 Jul 2024 06:10:14 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367fce64sm14698067f8f.61.2024.07.30.06.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 06:10:14 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Tue, 30 Jul 2024 15:08:45 +0200
MIME-Version: 1.0
Message-Id: <20240730-master-v1-2-3ca889c14ea4@gmail.com>
References: <20240730-master-v1-0-3ca889c14ea4@gmail.com>
In-Reply-To: <20240730-master-v1-0-3ca889c14ea4@gmail.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722345015; x=1722949815; darn=buildroot.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z5/PcpMMjTNfjS3MG8iVpqjLkMgQZL7UCmkdchd52oQ=;
 b=DsHTe7ecztzlKo37Wrd5ujLwjslj7FUAgPSeatWvS6NBgC9PbuaewVG+JwuTT7Fa7M
 +sfBd+/oJsptjGZ7rptP6SbJobd472SRni0zEZZ0qKmKHr37ZHFnYKtJcHeyljoqTPXF
 NAlCPOg6vsgCc2GU8rEeS+PM9wPbDH8CX8TqflE2NATDg4n00em7kReVuthE0b2SIJUU
 RGVYBjGsNXMC51Mw+4MYzjqr2tagrJH48LBxdMIAa2uQpROjiaRI8UpS5dloZ/bj9Xx/
 FMlsLk5LYu/+rhHhnZCDurWcdY+iZ2tkA0LK9k1P90WCiVi+/2NYrJ1YktDiPeIjcuK2
 PAOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DsHTe7ec
Subject: [Buildroot] [PATCH RFC 2/2] configs/stm32mp135f-dk: new defconfig
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
