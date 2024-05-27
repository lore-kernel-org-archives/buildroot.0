Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367F9C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 10:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDB65400AB;
	Mon, 27 May 2024 10:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sQL-Ktlj1gC; Mon, 27 May 2024 10:04:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8419B405E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8419B405E9;
	Mon, 27 May 2024 10:04:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7FB1BF3FB
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 10:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0963360690
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 10:04:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MyF9Ot8b-9nR for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 10:04:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E98CE6066C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E98CE6066C
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E98CE6066C
 for <buildroot@buildroot.org>; Mon, 27 May 2024 10:04:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5238b5c080cso12891194e87.1
 for <buildroot@buildroot.org>; Mon, 27 May 2024 03:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716804267; x=1717409067;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GldVDrSxboiSpvoxq3tKbvI/wELOoGD5U5Deg0AjljE=;
 b=vUIWRmQVwJtnua40GH7bQnhq0qPXoChropiaikAHLf05XzzWTM+7UuLBsJe44mlO5I
 SmIUAxeAims/NguD/VMvE1TOYL52WHXjzkfBlbpMeEX6wXUJ8WUHNgGGvVUdTPIiHwIL
 TvnQleWYCyD5lA6HISNBUa+1T5kns3gHQGJS7pJ0ry19lhF34nvyxSI6DgdkeMddI4rL
 pPmZR0SDf4AgtBjZnOHl2M0Xl0/XvtYaJtjs7Q8hqWh7f5DabzR2JWnqAKWHu59ru+Uv
 QxHdSBX+j5J+hmSZS8Uaa0GNClshPJUY3R1m4O7dkv4CvRahXdy393RME0RMKsp+x0ug
 VafQ==
X-Gm-Message-State: AOJu0YwGFvN77ulcOdLIti38dNpzCj41PxHKJntuTRa0bthYa8p6gV2n
 Sp7mtdhF4N0pt4IwkQv5vpDFx1SPEcIM6w36c9MxudJYPaOKQsMUL6qsriy/5zjndkYUCJj3fPj
 i
X-Google-Smtp-Source: AGHT+IFg4BjfnEMsShf++I7QyyBlfvAh/QsjzJMn5XZXcQymnn4Eoc40LA0L7UVa9kr9FsE0iLDe6A==
X-Received: by 2002:ac2:521b:0:b0:519:1047:7eac with SMTP id
 2adb3069b0e04-529645e3256mr5309570e87.23.1716804266861; 
 Mon, 27 May 2024 03:04:26 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100eeca80sm137349435e9.2.2024.05.27.03.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 03:04:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 12:04:24 +0200
Message-ID: <20240527100424.397567-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1716804267; x=1717409067;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GldVDrSxboiSpvoxq3tKbvI/wELOoGD5U5Deg0AjljE=;
 b=w6/znxAtuzWyyjr1oAa71Dn7DDuj3t7JNC2rVhuU4pXwAOofOry0jePRVplOf/w9ZS
 Uyfw7rZ0nRy5now0qgJyfg0XHIZaG+NbRw6SnrMpJcVJeRauZuShpXnP5lK8zvwCFxD9
 ybzk0aGKvYzpWRZhwwVdIUhvPSyzMySuvjj/yCmxtZAHhsPIaaaFuhyStEQGJ9RCdB6W
 H/c0hIgdEVEHw/NlMZnTtb2/4jeMchHJnKr8qvNhKK1G4Yh3O2M2nn7B53ZTYDByzs7+
 paTrWtE9NHwXJsZcGV1tgB1I4U0z5gmMMl96Qqi0YZIN64To8YA9ilyBxaPEwwRbISaG
 x/5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=w6/znxAt
Subject: [Buildroot] [PATCHv2] configs/lepotato_defconfig: new defconfig
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add basic support for the Libre Computer "Le Potato" SBC.

https://libre.computer/products/aml-s905x-cc

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v2: add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and hashes
    update kernel to 6.6.32 and u-boot 2024.04.
---
 DEVELOPERS                                    |  2 +
 board/librecomputer/lepotato/extlinux.conf    |  4 +
 board/librecomputer/lepotato/genimage.cfg     | 33 ++++++++
 .../patches/linux-headers/linux-headers.hash  |  2 +
 .../lepotato/patches/linux/linux.hash         |  2 +
 .../lepotato/patches/uboot/uboot.hash         |  2 +
 board/librecomputer/lepotato/post-build.sh    |  5 ++
 board/librecomputer/lepotato/post-image.sh    | 23 ++++++
 board/librecomputer/lepotato/readme.txt       | 82 +++++++++++++++++++
 configs/lepotato_defconfig                    | 52 ++++++++++++
 10 files changed, 207 insertions(+)
 create mode 100644 board/librecomputer/lepotato/extlinux.conf
 create mode 100644 board/librecomputer/lepotato/genimage.cfg
 create mode 100644 board/librecomputer/lepotato/patches/linux-headers/linux-headers.hash
 create mode 100644 board/librecomputer/lepotato/patches/linux/linux.hash
 create mode 100644 board/librecomputer/lepotato/patches/uboot/uboot.hash
 create mode 100755 board/librecomputer/lepotato/post-build.sh
 create mode 100755 board/librecomputer/lepotato/post-image.sh
 create mode 100644 board/librecomputer/lepotato/readme.txt
 create mode 100644 configs/lepotato_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d..1a41edb38e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2729,10 +2729,12 @@ F:	package/vnstat/
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/beagleboard/beagleboneai64/
 F:	board/qemu/
+F:	board/librecomputer/lepotato/
 F:	board/ti/am574x-idk/
 F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
 F:	configs/beagleboneai64_defconfig
+F:	configs/lepotato_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
diff --git a/board/librecomputer/lepotato/extlinux.conf b/board/librecomputer/lepotato/extlinux.conf
new file mode 100644
index 0000000000..e0fea6c7aa
--- /dev/null
+++ b/board/librecomputer/lepotato/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /Image
+  devicetree /meson-gxl-s905x-libretech-cc.dtb
+  append console=ttyAML0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
diff --git a/board/librecomputer/lepotato/genimage.cfg b/board/librecomputer/lepotato/genimage.cfg
new file mode 100644
index 0000000000..b10e5d9440
--- /dev/null
+++ b/board/librecomputer/lepotato/genimage.cfg
@@ -0,0 +1,33 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"Image",
+			"meson-gxl-s905x-libretech-cc.dtb",
+			"extlinux"
+		}
+
+		label = "boot"
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image="boot.vfat"
+		size = 64M
+		offset = 2M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 128M
+		offset = 0
+	}
+}
diff --git a/board/librecomputer/lepotato/patches/linux-headers/linux-headers.hash b/board/librecomputer/lepotato/patches/linux-headers/linux-headers.hash
new file mode 100644
index 0000000000..1b188a3f4a
--- /dev/null
+++ b/board/librecomputer/lepotato/patches/linux-headers/linux-headers.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  aaa824eaf07f61911d22b75ff090a403c3dd0bd73e23933e0bba8b5971436ce1  linux-6.6.32.tar.xz
diff --git a/board/librecomputer/lepotato/patches/linux/linux.hash b/board/librecomputer/lepotato/patches/linux/linux.hash
new file mode 100644
index 0000000000..1b188a3f4a
--- /dev/null
+++ b/board/librecomputer/lepotato/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  aaa824eaf07f61911d22b75ff090a403c3dd0bd73e23933e0bba8b5971436ce1  linux-6.6.32.tar.xz
diff --git a/board/librecomputer/lepotato/patches/uboot/uboot.hash b/board/librecomputer/lepotato/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..97a2b4eaf9
--- /dev/null
+++ b/board/librecomputer/lepotato/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/librecomputer/lepotato/post-build.sh b/board/librecomputer/lepotato/post-build.sh
new file mode 100755
index 0000000000..8dae08a47c
--- /dev/null
+++ b/board/librecomputer/lepotato/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/board/librecomputer/lepotato/post-image.sh b/board/librecomputer/lepotato/post-image.sh
new file mode 100755
index 0000000000..69fb382dc1
--- /dev/null
+++ b/board/librecomputer/lepotato/post-image.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+support/scripts/genimage.sh -c "${BOARD_DIR}/genimage.cfg"
+
+AMLOGIC_DIR=${BINARIES_DIR}/amlogic-boot-fip
+FIP_DIR=${BINARIES_DIR}/fip
+
+mkdir -p "${FIP_DIR}"
+
+(cd "${AMLOGIC_DIR}" && \
+	./build-fip.sh lepotato \
+	"${BINARIES_DIR}"/u-boot.bin \
+	"${FIP_DIR}")
+
+dd if="${FIP_DIR}"/u-boot.bin.sd.bin \
+   of="${BINARIES_DIR}"/sdcard.img \
+   conv=fsync,notrunc bs=1 count=444
+
+dd if="${FIP_DIR}"/u-boot.bin.sd.bin \
+   of="${BINARIES_DIR}"/sdcard.img \
+   conv=fsync,notrunc bs=512 skip=1 seek=1
diff --git a/board/librecomputer/lepotato/readme.txt b/board/librecomputer/lepotato/readme.txt
new file mode 100644
index 0000000000..391b030e1f
--- /dev/null
+++ b/board/librecomputer/lepotato/readme.txt
@@ -0,0 +1,82 @@
+Libre Computer Le Potato (AML-S905X-CC)
+
+Intro
+=====
+
+Libre Computer "Le Potato" is a low cost SBC based around an Amlogic
+s905x SoC (quad A53), 2GB DDR3, Mali-450:
+
+https://libre.computer/products/aml-s905x-cc/
+
+How to build it
+===============
+
+Configure Buildroot:
+
+  $ make lepotato_defconfig
+
+Then you can edit the build options using
+
+  $ make menuconfig
+
+Compile everything and build rootfs image:
+
+  $ make
+
+Note: you will need to have access to the network, since Buildroot
+will download the packages' sources.
+
+Result of the build
+-------------------
+
+After building, you should obtain this tree:
+
+output/images/
++-- amlogic-boot-fip
++   +-- axg.inc
++   +--  build-fip.sh
++   +--  g12a.inc
++   +--  gxbb.inc
++   +--  gxl.inc
++   `-- lepotato
++       +-- acs.bin
++       +-- acs_tool.py
++       +-- aml_encrypt_gxl
++       +-- bl21.bin
++       +-- bl2.bin
++       +-- bl301.bin
++       +-- bl30.bin
++       +-- bl31.img
++       +-- blx_fix.sh
++       `-- Makefile
++-- boot.vfat
++-- extlinux
++   `-- extlinux.conf
++-- fip
++   +--  u-boot.bin
++   +--  u-boot.bin.sd.bin
++   +--  u-boot.bin.usb.bl2
++   `-- u-boot.bin.usb.tpl
++-- Image
++-- meson-gxl-s905x-libretech-cc.dtb
++-- rootfs.ext2
++-- rootfs.ext4 -> rootfs.ext2
++-- rootfs.tar
++-- sdcard.img
+`-- u-boot.bin
+
+The post-image script uses the files in the amlogic-boot-fip folder to sign
+the bootloader image before integrating it into the sdcard image.
+
+How to write the SD card or eMMC
+================================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Insert the micro SDcard into your Le Potato and power it up. The console
+is on the serial line, 115200 8N1.
diff --git a/configs/lepotato_defconfig b/configs/lepotato_defconfig
new file mode 100644
index 0000000000..1d4549e0c1
--- /dev/null
+++ b/configs/lepotato_defconfig
@@ -0,0 +1,52 @@
+# Architecture
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/librecomputer/lepotato/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/librecomputer/lepotato/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s905x-libretech-cc"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# For kernel modules autoloading
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+BR2_GLOBAL_PATCH_DIR="board/librecomputer/lepotato/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="libretech-cc"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required tool to sign the bootloader image
+BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP=y
+BR2_PACKAGE_HOST_AMLOGIC_BOOT_FIP_DEVICE="lepotato"
+
+# Required tools to create the SD image
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
