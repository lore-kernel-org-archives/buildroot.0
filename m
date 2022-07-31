Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB02C00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 09:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA37682F76;
	Sun, 31 Jul 2022 09:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA37682F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVaEuBFnKsUZ; Sun, 31 Jul 2022 09:49:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90DDD81C21;
	Sun, 31 Jul 2022 09:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90DDD81C21
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE791BF342
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 09:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA3B1812E3
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 09:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA3B1812E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjauNYbL3gPm for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 09:48:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9553881394
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9553881394
 for <buildroot@busybox.net>; Sun, 31 Jul 2022 09:48:30 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k8so8546603wrd.5
 for <buildroot@busybox.net>; Sun, 31 Jul 2022 02:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ajvaXS9p08ZPCmfvk6ejHgERkBkxZpL1Nygoo9ALa4=;
 b=InoCAwAEF9Bic7dqQ2k6pMmAXK3n15uaVDHiSlwtXIbf2r00gDHR9ghxK3Fs1fjwh8
 hAwHYVVA7q1OXEspTAOpwu+wW8jsMm7aaTY23XGJ41IHJCazthSQtpgwlcyynk5epwU7
 96XYiwLJUbv9ork3i6vLamVZITquFLyyzJy/AStWcv10ciHMNpMQAn6sZC5Z69G1MT3r
 +Uu7P4mvPGRPm+U9U2+uiVAogdCHSPDM502yxvshU+hn5MyyuG/3SmFjbxemySkFgyN2
 rvdQc2fq702i9J8l1Fb4/hQFjfpJfMWLjDR6tb1kg9FMqV5v1oU8DuquiAZPRb6lHe2/
 ylJw==
X-Gm-Message-State: ACgBeo2LhQjluWLJ0KWRj9ctGxuG6YP8YiaTGDWRwGqTkTw6Kolz4/7/
 fKlGZza4ZbGipTCyD4Z7gm4M/Ot04F8=
X-Google-Smtp-Source: AA6agR4adZE2fRHri1cDX0HC7cicPXZO+d7DY9r8CxJM3ptpmt0yqavcrAYHbqNiPHAti0NV6lpJGA==
X-Received: by 2002:a05:6000:1d98:b0:21b:aead:9b6c with SMTP id
 bk24-20020a0560001d9800b0021baead9b6cmr7228469wrb.531.1659260908842; 
 Sun, 31 Jul 2022 02:48:28 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a0375c4f73sm10241477wmb.44.2022.07.31.02.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 02:48:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 31 Jul 2022 11:48:08 +0200
Message-Id: <20220731094808.1347975-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220731094808.1347975-1-francois.perrad@gadz.org>
References: <20220731094808.1347975-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ajvaXS9p08ZPCmfvk6ejHgERkBkxZpL1Nygoo9ALa4=;
 b=RL0G6kvZzwEac3AQJkyZm+ROFIu2AMS/IlgJQgzFcKMM4pFYxScUm+kHxqbhI6h8aM
 sswIhowqDl86UivGXi/p5SZQaC+O+h8OrIcYlG/TCdOFJnLj/poNsx1isY9KTUkdvlDu
 VsKDv/6KNghHSaAYg3CspqNtHQd7rAZrY8K0qNOjEs0x3KbuX9negG2f3K5KYcR7QF+Q
 oU2n1Ul//JNeAc5b+IEBDvO5XThth9s5ezt9Rlri8whxAaWcjfT1ylbvZVgl1xOKY3GS
 ZDwtAMVcpz90ggUyNDJ7LOl6ZREWWdXAgY6yzowRx4DrJHczD3xDus2thASIo1B661zS
 4w+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RL0G6kvZ
Subject: [Buildroot] [PATCH 3/3] board/freescale/ls1028ardb: new board
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS                                    |  2 +
 board/freescale/ls1028ardb/genimage.cfg       | 23 +++++++
 board/freescale/ls1028ardb/readme.txt         | 60 +++++++++++++++++++
 .../boot/extlinux/extlinux.conf               |  4 ++
 configs/ls1028ardb_defconfig                  | 60 +++++++++++++++++++
 5 files changed, 149 insertions(+)
 create mode 100644 board/freescale/ls1028ardb/genimage.cfg
 create mode 100644 board/freescale/ls1028ardb/readme.txt
 create mode 100644 board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 configs/ls1028ardb_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 780ec2041..7bca42074 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -980,9 +980,11 @@ N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
 N:	Francois Perrad <francois.perrad@gadz.org>
+F:	board/freescale/ls1028ardb/
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
+F:	configs/ls1028ardb_defconfig
 F:	configs/olimex_a20_olinuxino_*
 F:	configs/olimex_imx233_olinuxino_defconfig
 F:	configs/olimex_stmp157_olinuxino_lime_defconfig
diff --git a/board/freescale/ls1028ardb/genimage.cfg b/board/freescale/ls1028ardb/genimage.cfg
new file mode 100644
index 000000000..3efef0bff
--- /dev/null
+++ b/board/freescale/ls1028ardb/genimage.cfg
@@ -0,0 +1,23 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition fsbl {
+		offset = 4K
+		in-partition-table = "no"
+		image = "bl2_sd.pbl"
+	}
+
+	partition ssbl {
+		offset = 1M
+		in-partition-table = "no"
+		image = "fip.bin"
+	}
+
+	partition rootfs {
+		offset = 8M
+		partition-type = 0x83
+		bootable = "true"
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/freescale/ls1028ardb/readme.txt b/board/freescale/ls1028ardb/readme.txt
new file mode 100644
index 000000000..9fc8e989c
--- /dev/null
+++ b/board/freescale/ls1028ardb/readme.txt
@@ -0,0 +1,60 @@
+**************
+NXP LS1028ARDB
+**************
+
+This file documents the Buildroot support for the LS1028A Reference Design Board.
+
+for more details about the board and the QorIQ Layerscape SoC, see the following pages:
+  - https://www.nxp.com/design/qoriq-developer-resources/layerscape-ls1028a-reference-design-board:LS1028ARDB
+  - https://www.nxp.com/LS1028A
+
+Build
+=====
+
+First, configure Buildroot for the LS1028ARDB board:
+
+  make ls1028ardb_defconfig
+
+Build all components:
+
+  make
+
+You will find in output/images/ the following files:
+  - bl2_sd.pbl
+  - fip.bin
+  - fsl-ls1028a-rdb.dtb
+  - Image
+  - PBL.bin
+  - rootfs.ext2
+  - rootfs.ext4 -> rootfs.ext2
+  - sdcard.img
+  - u-boot.bin
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+  cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/ls1028ardb/genimage.cfg.
+
+Boot the LS1028ARDB board
+=========================
+
+To boot your newly created system:
+- insert the SD card in the SD slot of the board;
+- Configure the switches SW2[1:4] = 1000 (select SD Card boot option)
+- put a DB9F cable into the UART1 Port and connect using a terminal
+  emulator at 115200 bps, 8n1;
+- power on the board.
diff --git a/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000..c08ddde10
--- /dev/null
+++ b/board/freescale/ls1028ardb/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label ls1028ardb-buildroot
+  kernel /boot/Image
+  devicetree /boot/fsl-ls1028a-rdb.dtb
+  append root=/dev/mmcblk0p1 rootwait
diff --git a/configs/ls1028ardb_defconfig b/configs/ls1028ardb_defconfig
new file mode 100644
index 000000000..e3e4760cd
--- /dev/null
+++ b/configs/ls1028ardb_defconfig
@@ -0,0 +1,60 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a72=y
+
+# Toolchain
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="ls1028a"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_ROOTFS_OVERLAY="board/freescale/ls1028ardb/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/ls1028ardb/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm64/configs/lsdk.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-rdb"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Target package
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_QORIQ_CADENCE_DP_FIRMWARE=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="ls1028ardb"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_RCW=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="BOOT_MODE=sd"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin bl2_sd.pbl"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/qoriq/qoriq-components/u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="LSDK-21.08"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ls1028ardb_tfa"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+
+# Host utilities
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_QORIQ_RCW_INTREE="ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
