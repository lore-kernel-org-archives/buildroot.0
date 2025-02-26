Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE30C021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 20:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 156234049E;
	Wed, 26 Feb 2025 20:51:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bl3E8CeHXT2a; Wed, 26 Feb 2025 20:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71E88403D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71E88403D1;
	Wed, 26 Feb 2025 20:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1137D68
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 044604019E
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JXSCeNuRUlK for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 20:51:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74CB040187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CB040187
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74CB040187
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 20:51:53 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2232aead377so4202445ad.0
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 12:51:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740603112; x=1741207912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7rJFn4F7VDRN6j/AUP9WB2Pk62etM3gvA/k40mJ+MeE=;
 b=F9D0fjYl8oiZRPfJDnl3d29dwUfOF/s+nTWcwCN0Pw/N1JhhibmqRVAYF9+c78Eb3Z
 xSCLnKTLmLqnLW+GRe+Pu0BXkTaIW/poZW5Af1RlLaLiXVt2fdb1ylXK9agK+Kk0g1yq
 3rpNap6B+aznwBKN5Dqfga7A6ZkdSWmp1Cku3nBb9eA9ZF0e9RzAFLEnQI8nFiHsiX0U
 Rusw/aXxctjtFyK5FApJ6sf/T3MMo45PONsb5XFtPKTS6equWpRpI8MJlTv83f9cX5KT
 JKqwfKVjLD7fKW+E9mKk0Mds54KdwO0WonCjPmvg6vXOTIFt0ZW7sviZzQOmJcYZ+5ee
 HR7g==
X-Gm-Message-State: AOJu0YzFd0d0n4EnaZlvn7dTXyBfC+PLVWPPd6TZvKxbESgWZDvo9ml/
 80M48JS+c8mtyAAlGmDiiWQMIQxTh5rBeKJ1e5EnYRapV+/75womRFENng==
X-Gm-Gg: ASbGncsvft3QjQxnlEvf2R00ZbMI9uDB6mp7J42iedUQdU9UuQji+l7VAUCuTSlFuyE
 cTfL5uXPG8uQeT1vy0kAxmE8wx4q0o9iCQDiboK205fNCnaQSqB3wj1+FYhHf0twe2hkP0dQ03c
 ttH6pHokv98tCpMUr1TjH5XvNTuAjFPgf/JfABNJwjjlfcPMXl90uh/knS9/eTkNQ4JzfGPKLIK
 YEHvU9yksn4NNgbYVFqTxL/fS2Rn5nhzJ8l259xjvqT/krNDCz+e3kWv/eXEj6h+Da3F3eCUArZ
 LcLxdn9DyyfUx7abzOLI6IV2QNRKRCoRSc3JrPv4
X-Google-Smtp-Source: AGHT+IGY2/nczocZ4wyCBieSI70EYspUv0Om4ZvNmicRw8nzjzaGtfy3jtoHQfDatG8XIdBNAMJw2g==
X-Received: by 2002:a05:6a00:2353:b0:730:9a85:c940 with SMTP id
 d2e1a72fcca58-7348be5125fmr7011291b3a.20.1740603111682; 
 Wed, 26 Feb 2025 12:51:51 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e9d4:2e72:39f5:e5da])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7347a6f9ea7sm4146423b3a.65.2025.02.26.12.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 12:51:51 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Feb 2025 17:51:44 -0300
Message-Id: <20250226205144.1843356-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226205144.1843356-1-festevam@gmail.com>
References: <20250226205144.1843356-1-festevam@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740603112; x=1741207912; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rJFn4F7VDRN6j/AUP9WB2Pk62etM3gvA/k40mJ+MeE=;
 b=QJMw/oG0edAPJQaTQfR3XQDyCaDruyw12V9iqmvWeoUtfrdIy6klx2zLO9/4JywCK3
 YZ+/V2InUpN9G39xfmtsEXvFh39z4k10yTluA4IwaHcER++ACSVScUHlvJNxa/9eg/zV
 K4iyzAIGY5wx6IHgCa6lNoADJCbzsT/R6A+B24wmVSsgd+kECmD67mmw0lC6tJhV9X4w
 pKnGLeoPIFUAYo576P45vfrxu1PMrN8vNS++i6yYGXS235fAO2OFhiYIl59ekV8bbXCF
 I7iFT5T84wxbPXxszbKPX9p1QnBArzv0vAAax8ysy4Puatc/LuNXiJGMkgQWTxlqYPCy
 my0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QJMw/oG0
Subject: [Buildroot] [PATCH 2/2] configs/imx93-evk_defconfig: new defconfig
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

Add a new defconfig for the imx93-evk board that uses upstream
components, such as:
    
- Linux Kernel: Upstream version 6.12.16
- U-boot: Upstream version 2025.01
- ATF: Upstream version 2.12

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx93-evk/extlinux.conf.in    |  4 ++
 board/freescale/imx93-evk/genimage.cfg.in     | 17 +++++++
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx93-evk/patches/linux/linux.hash        |  2 +
 .../imx93-evk/patches/uboot/uboot.hash        |  2 +
 board/freescale/imx93-evk/post-build.sh       |  7 +++
 board/freescale/imx93-evk/readme.txt          | 31 ++++++++++++
 configs/imx93-evk_defconfig                   | 50 +++++++++++++++++++
 9 files changed, 116 insertions(+)
 create mode 100644 board/freescale/imx93-evk/extlinux.conf.in
 create mode 100644 board/freescale/imx93-evk/genimage.cfg.in
 create mode 100644 board/freescale/imx93-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx93-evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx93-evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx93-evk/patches/uboot/uboot.hash
 create mode 100755 board/freescale/imx93-evk/post-build.sh
 create mode 100644 board/freescale/imx93-evk/readme.txt
 create mode 100644 configs/imx93-evk_defconfig

diff --git a/board/freescale/imx93-evk/extlinux.conf.in b/board/freescale/imx93-evk/extlinux.conf.in
new file mode 100644
index 000000000000..143e28a823c3
--- /dev/null
+++ b/board/freescale/imx93-evk/extlinux.conf.in
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx93-11x11-evk.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/freescale/imx93-evk/genimage.cfg.in b/board/freescale/imx93-evk/genimage.cfg.in
new file mode 100644
index 000000000000..10c52548cdfa
--- /dev/null
+++ b/board/freescale/imx93-evk/genimage.cfg.in
@@ -0,0 +1,17 @@
+image sdcard.img {
+	hdimage {
+		partition-table-type = "gpt"
+	}
+
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "flash.bin"
+		offset = 32K
+	}
+
+	partition rootfs {
+		offset = 8M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/freescale/imx93-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..b5898cba3f96
--- /dev/null
+++ b/board/freescale/imx93-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/freescale/imx93-evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx93-evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/freescale/imx93-evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx93-evk/patches/linux/linux.hash b/board/freescale/imx93-evk/patches/linux/linux.hash
new file mode 100644
index 000000000000..5e0df51126d5
--- /dev/null
+++ b/board/freescale/imx93-evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5f81362a694f51520bff9faecb73f1cc9bc7bece6fdd10d5c27e348df39d7dc4  linux-6.12.16.tar.xz
diff --git a/board/freescale/imx93-evk/patches/uboot/uboot.hash b/board/freescale/imx93-evk/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..50674352d71d
--- /dev/null
+++ b/board/freescale/imx93-evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/board/freescale/imx93-evk/post-build.sh b/board/freescale/imx93-evk/post-build.sh
new file mode 100755
index 000000000000..604f387768d8
--- /dev/null
+++ b/board/freescale/imx93-evk/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR"/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf.in" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg.in" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/freescale/imx93-evk/readme.txt b/board/freescale/imx93-evk/readme.txt
new file mode 100644
index 000000000000..9d3302a0ca10
--- /dev/null
+++ b/board/freescale/imx93-evk/readme.txt
@@ -0,0 +1,31 @@
+NXP i.MX93 EVK
+==============
+
+This is a Buildroot target for building an image for the imx93-evk
+board using upstream components: TF-A, U-Boot and kernel.
+
+How to build it
+===============
+
+Configure Buildroot and build it:
+
+  $ make imx93-evk_defconfig
+  $ make
+
+Flashing the SD card image
+==========================
+
+Copy the sdcard.img file into the SD card:
+
+  $ sudo dd if=output/images/sdcard.img of=<your-sd-device>; sync
+
+
+Booting the board
+=================
+
+To boot your newly created system:
+
+- Insert the SD card in the MicroSD slot of the board.
+- Connect a serial to USB cable to the DBG port.
+- Open a terminal on the ttyUSB2 port. For example: sudo picocom -b 115200 /dev/ttyUSB2
+- Power on the board.
diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
new file mode 100644
index 000000000000..f3af2b51830e
--- /dev/null
+++ b/configs/imx93-evk_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx93-evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx93-evk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-evk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX_LPDDR4=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
