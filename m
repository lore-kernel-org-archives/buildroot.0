Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8E9C021B5
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 21:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13D98607D5;
	Sat, 22 Feb 2025 21:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3PAIxzxzCqO; Sat, 22 Feb 2025 21:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBCA3607E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBCA3607E5;
	Sat, 22 Feb 2025 21:28:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB9D01ED5
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE986607E5
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TuW4wcrkIUgW for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 21:28:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B555E607D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B555E607D5
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B555E607D5
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 21:28:33 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-220d132f16dso50547075ad.0
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 13:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740259712; x=1740864512;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FTKDd+0e1F0zOODY0aSc0ZpOPIk8CvFJ5+wj0aAOHUY=;
 b=p+IYwSVWD3+eYAQ/1WeO1gX1EgIXN1edZGYfpJbAHuLY6lFTpWr9FNHgnTFIuJRZ+Y
 7Y8MyfUEKnV5kXW7Um8XSuKpkAod2dWVD7rGs01TixnxhzQMQZXcBMba9mXXXhIc5N4R
 vweqqidwXat329ajmmhGFfSP+vBSzub0T7/VJ05mp/WdQDnyGr3bIkVlnDN6ns3Wm/lK
 dcc+E3bB7Y2CY6WqujfUVm+HHcn3qsvpWWjiUTJTZvU+GzCGQuuLFtIr9BAAt7JqS1Dj
 4tb1iUWNDDpgDFrfd4ToCRfDu68fvtgm0ML1vghRwVzyUpMA8pfGG4WeP8M9jd3ziAbD
 57KQ==
X-Gm-Message-State: AOJu0Yz0SQ86R6lQJCxjO2hFDzu9J6EoVrj0f2j0tGKuobZhkOALDFlL
 7H7BOoSwR29jAPfPDf9003eCY9NWCiV5OZhA7K2BQ300eHz9N+OA/+RUkA==
X-Gm-Gg: ASbGncsVHQNeFwdAYPafPqZECugJpSdYPQjOR5Hg/puSDHYjMoJqMOVkjLUNiCNZA+H
 NUTb7a7pwIBUwzYpXkveaCa58tXXsbJjmefb0QI0GQqJwA8artuLwHkcjKv/auG4mBlmOzpg8iU
 +iLTje/DsVhIgFP+/NcLguTgLKekdq9Fts+8rxUchb+9fGIrDSLo9HbbwNwoWB91sl10PM2NAoG
 EJpXCEE2LEB4gFTvzWbZbM8icPjmqKiV6uiWAqMK1XC+zUCK6rKa/1JtGahVJPQ21EZbKikhd5p
 Een+qTkNbVa/nNrIDjkckdtmm79N/0IhIR4ZB+5B
X-Google-Smtp-Source: AGHT+IEaWs1fab8y95l9Ha02HfPMZ8zD+nQx1p4O9JyLjm4PbWzgrgksWuh/0qorSb8GG9PGdGQveQ==
X-Received: by 2002:a17:902:cf10:b0:21a:8300:b9d5 with SMTP id
 d9443c01a7336-2219ff5f65emr141457995ad.23.1740259712053; 
 Sat, 22 Feb 2025 13:28:32 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:fc1a:61c2:8ac8:ba50])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556dad1sm156078395ad.185.2025.02.22.13.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Feb 2025 13:28:31 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: gilles.talis@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Date: Sat, 22 Feb 2025 18:28:24 -0300
Message-Id: <20250222212824.3745939-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740259712; x=1740864512; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FTKDd+0e1F0zOODY0aSc0ZpOPIk8CvFJ5+wj0aAOHUY=;
 b=kS0pR0lxi/GrPVTC37MBbkbsH1ISiTXEe4fVyO9o50/gabHG/Jm4nesZJJ1/m0rRF7
 QaAIkPJl+tZKm9//kvkBQgBMo3KPN4/VURfua3fg3BIr3/7A2hHFaqxeHxn3QNNfgiyn
 wBSjghaPBVljTHSzcnDxTJZaAVXfduFc8jHGRxL2WK0SM8HwDkrCrb41/jqttlG/6MFj
 1DUeOSRrKJRtX1xMVF+MYu6gWPOZ5RTCHE7DwVZ3dtFaF97e8ej+o8p724ZLvuXxY3a/
 pGcjCi0oWRFgt7vf1jhiDyoNmDoJPER72JnXY8wgYnCrEDBpeuf/8Gcnx618qAjqFnJl
 tskg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kS0pR0lx
Subject: [Buildroot] [PATCH] configs/imx8mp-evk_defconfig: new defconfig
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

Add a new defconfig for the imx8mp-evk board that uses upstream
components, such as:   

- Linux Kernel: Upstream version 6.12.16
- U-boot: Upstream version 2025.01
- ATF: Upstream version 2.12

Based on bcc799328334 ("configs/polyhex_debix_model_a_defconfig: new
defconfig") from Gilles Talis.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx8mp-evk/extlinux.conf.in   |  4 ++
 board/freescale/imx8mp-evk/genimage.cfg.in    | 17 +++++++
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  2 +
 .../imx8mp-evk/patches/linux/linux.hash       |  2 +
 .../imx8mp-evk/patches/uboot/uboot.hash       |  2 +
 board/freescale/imx8mp-evk/post-build.sh      |  7 +++
 board/freescale/imx8mp-evk/readme.txt         | 31 ++++++++++++
 configs/imx8mp-evk_defconfig                  | 47 +++++++++++++++++++
 9 files changed, 114 insertions(+)
 create mode 100644 board/freescale/imx8mp-evk/extlinux.conf.in
 create mode 100644 board/freescale/imx8mp-evk/genimage.cfg.in
 create mode 100644 board/freescale/imx8mp-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 100644 board/freescale/imx8mp-evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx8mp-evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx8mp-evk/patches/uboot/uboot.hash
 create mode 100755 board/freescale/imx8mp-evk/post-build.sh
 create mode 100644 board/freescale/imx8mp-evk/readme.txt
 create mode 100644 configs/imx8mp-evk_defconfig

diff --git a/board/freescale/imx8mp-evk/extlinux.conf.in b/board/freescale/imx8mp-evk/extlinux.conf.in
new file mode 100644
index 000000000000..5348a01c07cc
--- /dev/null
+++ b/board/freescale/imx8mp-evk/extlinux.conf.in
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mp-evk.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/freescale/imx8mp-evk/genimage.cfg.in b/board/freescale/imx8mp-evk/genimage.cfg.in
new file mode 100644
index 000000000000..10c52548cdfa
--- /dev/null
+++ b/board/freescale/imx8mp-evk/genimage.cfg.in
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
diff --git a/board/freescale/imx8mp-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mp-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..b5898cba3f96
--- /dev/null
+++ b/board/freescale/imx8mp-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/freescale/imx8mp-evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx8mp-evk/patches/linux-headers/linux-headers.hash
new file mode 100644
index 000000000000..6072c12e729a
--- /dev/null
+++ b/board/freescale/imx8mp-evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5f81362a694f51520bff9faecb73f1cc9bc7bece6fdd10d5c27e348df39d7dc4  linux-6.12.14.tar.xz
diff --git a/board/freescale/imx8mp-evk/patches/linux/linux.hash b/board/freescale/imx8mp-evk/patches/linux/linux.hash
new file mode 100644
index 000000000000..6072c12e729a
--- /dev/null
+++ b/board/freescale/imx8mp-evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5f81362a694f51520bff9faecb73f1cc9bc7bece6fdd10d5c27e348df39d7dc4  linux-6.12.14.tar.xz
diff --git a/board/freescale/imx8mp-evk/patches/uboot/uboot.hash b/board/freescale/imx8mp-evk/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..50674352d71d
--- /dev/null
+++ b/board/freescale/imx8mp-evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/board/freescale/imx8mp-evk/post-build.sh b/board/freescale/imx8mp-evk/post-build.sh
new file mode 100755
index 000000000000..604f387768d8
--- /dev/null
+++ b/board/freescale/imx8mp-evk/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR"/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf.in" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg.in" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/freescale/imx8mp-evk/readme.txt b/board/freescale/imx8mp-evk/readme.txt
new file mode 100644
index 000000000000..ef52b403b6c9
--- /dev/null
+++ b/board/freescale/imx8mp-evk/readme.txt
@@ -0,0 +1,31 @@
+NXP i.MX8MP EVK
+===============
+
+This is a Buildroot target for building an image for the imx8mp-evk
+board using upstream components: TF-A, U-Boot and kernel.
+
+How to build it
+===============
+
+Configure Buildroot and build it:
+
+  $ make imx8mp-evk_defconfig
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
+- Connect a serial to USB cable to the DEBUG port.
+- Open a terminal on ttyUSB2 port. For example: sudo picocom -b 115200 /dev/ttyUSB2
+- Power on the board.
diff --git a/configs/imx8mp-evk_defconfig b/configs/imx8mp-evk_defconfig
new file mode 100644
index 000000000000..2cb7ecbbde83
--- /dev/null
+++ b/configs/imx8mp-evk_defconfig
@@ -0,0 +1,47 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mp-evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx8mp-evk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
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
