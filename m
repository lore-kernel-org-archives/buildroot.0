Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF4BC021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 16:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA17880CD9;
	Mon, 24 Feb 2025 16:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rer7b56lPjGg; Mon, 24 Feb 2025 16:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8722A80D58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8722A80D58;
	Mon, 24 Feb 2025 16:09:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F25094E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 16:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F027960E14
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 16:09:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ojF3aB5FrvFP for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 16:09:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C4F1260E06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F1260E06
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4F1260E06
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 16:09:35 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-220c665ef4cso79485425ad.3
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 08:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740413374; x=1741018174;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nCejOOq+aYbXd8PDVjulMCQb50Zkdd065WUTHjf9kWA=;
 b=WJBDYua/AE51Wy7rwqjQFtpI8FqFZtUTSJvnA4/7jqIgUmZ+jzs0vkF7aNQtA3MYvn
 LvoTHuKBbIpWcgDESXie4oU+kvRwu8gGEmbW3E92k5BlBAmtxAXQVKj/DhDYCvP770ta
 cBtYi47Lte7jx5eDqGLKatjV76BNDRIC9nXY8jpceGZ/ih7eE20AezZ2aWxYkrvCjRRL
 6CB/7TPTh5kZp5BLtGZipkw5UcNRA/CAsTQkuA+uer37+MtLk701oq+Xs0UcYxaBaQ0M
 08N+G4sJEDZatmEceaNnt9ykZFAX6MoF4nhljHSJ4SLlXFZalOUkggS+5cOBed9jDMpD
 fVZA==
X-Gm-Message-State: AOJu0YyIdeA9koi3sgX6nFw1mMfd9xG9JH3023dztPK3AqfzjsLolwuJ
 brvAHN/VpqKYcMXQ/TsLA4JIMJJRUb9i62aJ9eDJi7v7dGg+2ApOTTiYqQ==
X-Gm-Gg: ASbGnctgc0vpWpdFelUX3stnJe3uNg0KZ5ldo5luE2POprWx57f+5bhV61mrLo0Ns93
 puqqy7E1WAlZhqLWh4PJw7XpI79nrem+cciHpYI+ODOGc4Dx7i+oTDbDqIQio9BmUJV+Q9NBjwH
 VWB6IAumOu6w5X5spq7G/vXoIKvfSry8F7iznTWxR5qyawnjFXnF+j8elNuQp6QFjjW3eeYm8HM
 SLhQFuUtqa79n3vin6cm9syboK0f+wVSOi7Rsq3Uoj87yJur4Ph4OZRGlYLirpLQhD+TQoHc+yR
 voQ658471HbX0ZqsZoLA3db1VQvg97PfmSqKxmkX
X-Google-Smtp-Source: AGHT+IEiSTYL+eGqzRQsBfks3aHUpxDJB7rVTw/O7DUC4iIXYsHv/o+8JYvLWMFzD6bB8vazAlFtJg==
X-Received: by 2002:a05:6a00:9aa:b0:729:a31:892d with SMTP id
 d2e1a72fcca58-73426cb1292mr24692473b3a.8.1740413374017; 
 Mon, 24 Feb 2025 08:09:34 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5291:bbb9:f462:e26e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-732713ff922sm16136144b3a.58.2025.02.24.08.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 08:09:33 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Cc: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Feb 2025 13:09:27 -0300
Message-Id: <20250224160927.909402-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740413374; x=1741018174; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nCejOOq+aYbXd8PDVjulMCQb50Zkdd065WUTHjf9kWA=;
 b=JOCay/79mXrMEcahJ8MHHCHNz0bwdfgEAAgO95xeYQQpB1GOxTYmj4dBC9YGF8SLaH
 axPude5X5iTWwgny45h8QjD8sXhg6oDDIY0h3Ltq4k7hJd9JUhTGUcktsWTHW1rN5nId
 boYkRJppJyd6w3HKZadV4q6xUfKMOiLr/VRhf1woVA7D5JIsTn7cLnHIrSAD/LLf0Moc
 VvUnF7kbJOEscpknMyyzbNC0ctyalW06ihi3KVHTNO8IV4U/yBidWhEg8MT7uLuBOOJi
 LOb+/3vIT9Jnih2uVTlxTba1zaElEV4pveZHGvviWMsS0Wfww3gLCaHy7FdIjGa6Shy+
 npVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JOCay/79
Subject: [Buildroot] [PATCH] configs/imx8mn-ddr4-evk_defconfig: new defconfig
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

Add a new defconfig for the imx8mn-ddr4-evk board that uses upstream
components, such as:
    
- Linux Kernel: Upstream version 6.12.16
- U-boot: Upstream version 2025.01
- ATF: Upstream version 2.12
    
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx8mn-evk/extlinux.conf.in   |  4 ++
 board/freescale/imx8mn-evk/genimage.cfg.in    | 17 +++++++
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../imx8mn-evk/patches/linux/linux.hash       |  2 +
 .../imx8mn-evk/patches/uboot/uboot.hash       |  2 +
 board/freescale/imx8mn-evk/post-build.sh      |  7 +++
 board/freescale/imx8mn-evk/readme.txt         | 31 ++++++++++++
 configs/imx8mn-ddr4-evk_defconfig             | 48 +++++++++++++++++++
 9 files changed, 114 insertions(+)
 create mode 100644 board/freescale/imx8mn-evk/extlinux.conf.in
 create mode 100644 board/freescale/imx8mn-evk/genimage.cfg.in
 create mode 100644 board/freescale/imx8mn-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx8mn-evk/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx8mn-evk/patches/linux/linux.hash
 create mode 100644 board/freescale/imx8mn-evk/patches/uboot/uboot.hash
 create mode 100755 board/freescale/imx8mn-evk/post-build.sh
 create mode 100644 board/freescale/imx8mn-evk/readme.txt
 create mode 100644 configs/imx8mn-ddr4-evk_defconfig

diff --git a/board/freescale/imx8mn-evk/extlinux.conf.in b/board/freescale/imx8mn-evk/extlinux.conf.in
new file mode 100644
index 000000000000..e408dd6a15ff
--- /dev/null
+++ b/board/freescale/imx8mn-evk/extlinux.conf.in
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mn-ddr4-evk.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/freescale/imx8mn-evk/genimage.cfg.in b/board/freescale/imx8mn-evk/genimage.cfg.in
new file mode 100644
index 000000000000..10c52548cdfa
--- /dev/null
+++ b/board/freescale/imx8mn-evk/genimage.cfg.in
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
diff --git a/board/freescale/imx8mn-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx8mn-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 000000000000..b5898cba3f96
--- /dev/null
+++ b/board/freescale/imx8mn-evk/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  06b35a3596b8417bf66f7bfdd7acd181bcb53fc36dc13216227b5cae154e0219  arm-trusted-firmware-v2.12-git4.tar.gz
diff --git a/board/freescale/imx8mn-evk/patches/linux-headers/linux-headers.hash b/board/freescale/imx8mn-evk/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/freescale/imx8mn-evk/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx8mn-evk/patches/linux/linux.hash b/board/freescale/imx8mn-evk/patches/linux/linux.hash
new file mode 100644
index 000000000000..5e0df51126d5
--- /dev/null
+++ b/board/freescale/imx8mn-evk/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  5f81362a694f51520bff9faecb73f1cc9bc7bece6fdd10d5c27e348df39d7dc4  linux-6.12.16.tar.xz
diff --git a/board/freescale/imx8mn-evk/patches/uboot/uboot.hash b/board/freescale/imx8mn-evk/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..50674352d71d
--- /dev/null
+++ b/board/freescale/imx8mn-evk/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  cdef7d507c93f1bbd9f015ea9bc21fa074268481405501945abc6f854d5b686f  u-boot-2025.01.tar.bz2
diff --git a/board/freescale/imx8mn-evk/post-build.sh b/board/freescale/imx8mn-evk/post-build.sh
new file mode 100755
index 000000000000..604f387768d8
--- /dev/null
+++ b/board/freescale/imx8mn-evk/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+PARTUUID="$("$HOST_DIR"/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf.in" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg.in" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/freescale/imx8mn-evk/readme.txt b/board/freescale/imx8mn-evk/readme.txt
new file mode 100644
index 000000000000..c5b4c05c48cd
--- /dev/null
+++ b/board/freescale/imx8mn-evk/readme.txt
@@ -0,0 +1,31 @@
+NXP i.MX8MN DDR4 EVK
+====================
+
+This is a Buildroot target for building an image for the imx8mn-ddr4-evk
+board using upstream components: TF-A, U-Boot and kernel.
+
+How to build it
+===============
+
+Configure Buildroot and build it:
+
+  $ make imx8mn-ddr4-evk_defconfig
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
+- Open a terminal on ttyUSB2 port. For example: sudo picocom -b 115200 /dev/ttyUSB1
+- Power on the board.
diff --git a/configs/imx8mn-ddr4-evk_defconfig b/configs/imx8mn-ddr4-evk_defconfig
new file mode 100644
index 000000000000..fa38a62f0e97
--- /dev/null
+++ b/configs/imx8mn-ddr4-evk_defconfig
@@ -0,0 +1,48 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx8mn-evk/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imx8mn-evk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.16"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mn-ddr4-evk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX_DDR4=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.12"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mn_ddr4_evk"
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
