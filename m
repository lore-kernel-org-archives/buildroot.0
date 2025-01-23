Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F93CC02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 19:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD2442480;
	Thu, 23 Jan 2025 19:27:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30IoQ2CFxHc4; Thu, 23 Jan 2025 19:27:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D596242459
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D596242459;
	Thu, 23 Jan 2025 19:27:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88B85959
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 19:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61D844244C
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 19:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2QsUPEJgB8g for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 19:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=johan.patrik.olsson@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9742F40904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9742F40904
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9742F40904
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 19:27:46 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso1466157e87.0
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 11:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737660464; x=1738265264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FqTlyzfl7QcUHQqhGgHJr7VACRmZwW69YIGum9d/HNc=;
 b=ezUek6y/RVT1WkBUAoSR+yUV9Jkp58L8BnroX1jJhEcJd/q1PSsUXb/sJHf5SHmyfr
 ReXrFCuZZ1cwYjHFoKfIjSGGk+4ukT/lwWxkxbF2yQQypqPItuS+hm0vh90YoB6AALg/
 gQpdDrVtQMF1CY0oL/BhHwxakTYWyHOWaHiq8nfQ248GrE3dCoPf/1d+f71mri8zSqXB
 BB2ohUon2n7FVBGKTji/ZEqRsFbpBE6Nkcadm6NpjBJU4OfDB4avptJUeTOMNZLu++Up
 kjboI3MigJdq/1xcqHoF9jEmrYKflcIT69FPAYOxY4cG/tjkRAnv5MKbqqdg8xENR3uG
 r9CA==
X-Gm-Message-State: AOJu0YwYyF2Am66k9LHceN5LTYOPHRBs5M4hn5H8WVRLIMwNdvZ0vU3+
 qtgTWKWRuaojwkQRKNo+9X0i+ysRRQvOm/8iqWiIb4sPGW+PjgxUdyAVf5Dr
X-Gm-Gg: ASbGncuDItFqn9kUI8yjOm5TX4ZxBVffdbpnZkjB3S0cmwWRggUb0e4NNmuVwzUHMzV
 DQkXp3MaVnvVVsniooTrUiS5qSqypEpkRuibno9VY68bcwrmEAL6ngS6HGf7+gvtBkRbQf9Wl5f
 Zi6Hfc9mezsZDps3XVAtttqYUZdkYZcOZfUOEJ9/HH9DOxa1flecTKhwtSNF74p36XLOgPlOX+H
 unnbi7rY/NGuMsGVKGDF2E8q2bcw6eeWFKbKqXwsIxZYTziWUQjtBY7U0kGuc90qSO6tPvdv991
 JsxmYY+L3ar5OGW3PgG4WDzY/4YYXQitFktTmTY4yRxhwIAAMVjpwFOOwyUAY/3idwDv4nY=
X-Google-Smtp-Source: AGHT+IHh1VbGEebIarJg5lNvdmuFwKYcghsWtPU2vnTEB4STtbuyQkWkYkYRsu+gbm6HAtLQC0dncg==
X-Received: by 2002:a05:6512:4007:b0:540:1fb5:3f9f with SMTP id
 2adb3069b0e04-5439c28ae38mr10359443e87.47.1737660463801; 
 Thu, 23 Jan 2025 11:27:43 -0800 (PST)
Received: from localhost.localdomain (81-224-225-107-no2661.tbcn.telia.com.
 [81.224.225.107]) by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-543c837995esm18147e87.189.2025.01.23.11.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 11:27:42 -0800 (PST)
From: Patrik Olsson <johan.patrik.olsson@gmail.com>
To: buildroot@buildroot.org
Cc: Patrik Olsson <johan.patrik.olsson@gmail.com>
Date: Thu, 23 Jan 2025 20:27:34 +0100
Message-ID: <20250123192735.896424-1-johan.patrik.olsson@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737660464; x=1738265264; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FqTlyzfl7QcUHQqhGgHJr7VACRmZwW69YIGum9d/HNc=;
 b=TWCZGQO2kb1Gi24IUqCHPUCq+dAp7+5PElHry17ReBVcfNxVk+oulA1rpjG52dkBXw
 WU0WabgdSzF4yHtiaPsvjdmGwPZ9c8cXQU7YiM93gXL6IlLtU3gpCfnOYfmW61nnAkfz
 qqli8aaPuCwG3iKnN++GehQe7ircyxmShSQ9rsKqgwshqNU+7TX4vOz4tU0VrHMKFjRV
 7RJOgsb/szmWjh2LhvyTzrlV+CHjTU1YVvr3jsm1wKLklwol3W6jcMVv9vYPw6a5RhS7
 epfafninrbJ2Fnt19DYrvzPEMaKQpWoXhlhvzzTNVQRSgneRSShYbGElpnWWxwmsCJ81
 UcvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TWCZGQO2
Subject: [Buildroot] [PATCH] configs/rock4se: new defconfig
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

---
 DEVELOPERS                                    |  4 ++
 board/radxa/rock4se/extlinux.conf             |  4 ++
 board/radxa/rock4se/genimage.cfg              | 22 ++++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 board/radxa/rock4se/patches/linux/linux.hash  |  2 +
 board/radxa/rock4se/patches/uboot/uboot.hash  |  2 +
 board/radxa/rock4se/post-build.sh             |  5 +++
 board/radxa/rock4se/readme.txt                | 37 ++++++++++++++++
 configs/rock4se_defconfig                     | 43 +++++++++++++++++++
 9 files changed, 120 insertions(+)
 create mode 100644 board/radxa/rock4se/extlinux.conf
 create mode 100644 board/radxa/rock4se/genimage.cfg
 create mode 120000 board/radxa/rock4se/patches/linux-headers/linux-headers.hash
 create mode 100644 board/radxa/rock4se/patches/linux/linux.hash
 create mode 100644 board/radxa/rock4se/patches/uboot/uboot.hash
 create mode 100755 board/radxa/rock4se/post-build.sh
 create mode 100644 board/radxa/rock4se/readme.txt
 create mode 100644 configs/rock4se_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d8ae8289b..059383d364 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2564,6 +2564,10 @@ F:	support/testing/tests/package/test_lxc/
 N:	Patrick Oppenlander <patrick.oppenlander@gmail.com>
 F:	package/minisign/
 
+N:	Patrik Olsson <johan.patrik.olsson@gmail.com>
+F:	board/radxa/rock4se
+F:	configs/rock4se_defconfig
+
 N:	Paul Cercueil <paul@crapouillou.net>
 F:	package/libiio/
 F:	package/lightning/
diff --git a/board/radxa/rock4se/extlinux.conf b/board/radxa/rock4se/extlinux.conf
new file mode 100644
index 0000000000..eb037e0e0f
--- /dev/null
+++ b/board/radxa/rock4se/extlinux.conf
@@ -0,0 +1,4 @@
+label Radxa ROCK 4SE Linux
+  kernel /boot/Image
+  devicetree /boot/rk3399-rock-4se.dtb
+  append root=/dev/mmcblk1p1 rw rootfstype=ext4 earlycon rootwait
diff --git a/board/radxa/rock4se/genimage.cfg b/board/radxa/rock4se/genimage.cfg
new file mode 100644
index 0000000000..966c869273
--- /dev/null
+++ b/board/radxa/rock4se/genimage.cfg
@@ -0,0 +1,22 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot-tpl-spl-dtb {
+		in-partition-table = "no"
+		image = "idbloader.img"
+		offset = 32K
+	}
+
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 8M
+		size = 30M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/radxa/rock4se/patches/linux-headers/linux-headers.hash b/board/radxa/rock4se/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/radxa/rock4se/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/radxa/rock4se/patches/linux/linux.hash b/board/radxa/rock4se/patches/linux/linux.hash
new file mode 100644
index 0000000000..9108b3e01a
--- /dev/null
+++ b/board/radxa/rock4se/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  4a516e5ed748537a73cb42ec47fbbeb6df8b1298e8892c29c0e91de79095b297  linux-6.12.10.tar.xz
diff --git a/board/radxa/rock4se/patches/uboot/uboot.hash b/board/radxa/rock4se/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..904fa56c02
--- /dev/null
+++ b/board/radxa/rock4se/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/board/radxa/rock4se/post-build.sh b/board/radxa/rock4se/post-build.sh
new file mode 100755
index 0000000000..d84a5da0b0
--- /dev/null
+++ b/board/radxa/rock4se/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$TARGET_DIR"/boot/extlinux/extlinux.conf
diff --git a/board/radxa/rock4se/readme.txt b/board/radxa/rock4se/readme.txt
new file mode 100644
index 0000000000..30cf621746
--- /dev/null
+++ b/board/radxa/rock4se/readme.txt
@@ -0,0 +1,37 @@
+Intro
+=====
+
+This default configuration will allow you to start experimenting with the
+buildroot environment for the Radxa ROCK 4SE. With the current configuration
+it will bring-up the board, and allow access through the serial console.
+
+Radxa ROCK 4SE link:
+https://radxa.com/products/rock4/4se/
+
+Wiki link:
+https://forum.radxa.com/c/rockpi4
+
+GPIO connector pinout link:
+https://wiki.radxa.com/Rockpi4/hardware/gpio
+
+This configuration uses mainline ATF, U-Boot and kernel.
+
+How to build
+============
+
+    $ make rock4se_defconfig
+    $ make
+
+How to write the SD card
+========================
+
+Once the build process is finished you will have an image called "sdcard.img"
+in the output/images/ directory.
+
+Copy the bootable "sdcard.img" onto an SD card with "dd":
+
+  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+  $ sudo sync
+
+Insert the micro SDcard in your Radxa ROCK 4SE and power it up. The console
+is available on UART2 on the GPIO connector, 1500000bps 8N1.
diff --git a/configs/rock4se_defconfig b/configs/rock4se_defconfig
new file mode 100644
index 0000000000..4d8dceccb0
--- /dev/null
+++ b/configs/rock4se_defconfig
@@ -0,0 +1,43 @@
+BR2_aarch64=y
+BR2_cortex_a72_a53=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
+BR2_GLOBAL_PATCH_DIR="board/radxa/rock4se/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="rock-4se"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Radxa ROCK 4SE"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_10_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES=""
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-4se-rk3399"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="idbloader.img"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.10"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3399-rock-4se"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/radxa/rock4se/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/radxa/rock4se/genimage.cfg"
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
