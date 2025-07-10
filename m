Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A107DC83F17
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 17:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F22283CFA;
	Thu, 10 Jul 2025 17:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCHcOmvjYSFS; Thu, 10 Jul 2025 17:46:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A9983CD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A9983CD7;
	Thu, 10 Jul 2025 17:46:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A822114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 17:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D0CE83CD7
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 17:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qevuwg5eAoS9 for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 17:46:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7178A83CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7178A83CE7
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7178A83CE7
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 17:46:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-454cc6e987dso5461035e9.0
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 10:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752169562; x=1752774362;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n2z8GJ+UNxGNQjouTDI8g8VnVOeicHzqdS6l5OJdtwM=;
 b=WOWESgg+WppeIj8d6itQe7N9dskfQpOpFKNyUMERQyKy5gBsL+SMAPkuuw9Q87cs5F
 GwWFyQBqKpdR09fOdDTUJ8QpduaYQGb9BpJs2+Z31xogaxASl16mb5GGh9igMmJHvaa1
 Ap0VmUHBu1qzGquFf69x7n34xZPceMSFoGOrTkP1d1n+5t6dfoOW0EMZOr6+LNp6KZVB
 3qFHULTsRsk5zGrh+oYeQZwokcqKiTquRdgpLDz0UphnCJjh+CfmMpnH8h5F3a1ulpko
 G7DqrkeZ/y35Q1o3ba1SHgg0quUJ0/OTDNPbvT91Giwl1gvSX+FjJracFFLbHlmFM0nh
 cY3A==
X-Gm-Message-State: AOJu0YwkfFiRE1YHLTFl3yYxnbsDcTZOKcvD5zrtqKDf9dUeXm0l7ZVx
 gLWkP3nIRwuMYTzE1YsnX7GEm+D//qSGYsFPElG71FaW3A6WPnW2A6qLds+GmYuXNCI0gCSyR7w
 +GeW2
X-Gm-Gg: ASbGncvVi7nQUk8/mUpWPVUV4w1b4yn7VFkfyAc+4/NkZ2Il0v/kCZTSyJASKFF96UJ
 aVtvPt4SonK2qYYFfG7EE+4aJCKtnwT/z/cC6pEiIPGn0vFODrlxWw27XtlMNbA1tKMGG7vHU+A
 nwqOFmBiBEOyIkk5em2v1nSw8r1kmwXVX47rEEWsmC4N976AKoIVzx1Vwr4ZXakc5GYeu0Mc7+4
 /I1wasE8OP8LOVfm42Nh5Xt626Gb3fpu/bP8YOVkp/eN7f014uQo2DgBIvZhM/hZR6PkCYF7E9F
 GARsACdrT26PU7QhAPddSL0++X8pvLoYDJ8qqznE/3m4enXLGeKPSinVJNcvZNBBc9dA9nGIxMv
 liaKbX3NQKCO1vTY9F5RS5U/GHQtHVSS2aofHVw3Vju4M2MaQit9C1bIc8mdm
X-Google-Smtp-Source: AGHT+IHhAkmsT/ku6KvYQQ9688JV2+caSJA0avDL5hju46hXUF6cSHaXOWhypTsGRTLH9RcnOTHE7g==
X-Received: by 2002:a05:600c:3508:b0:454:b97a:486e with SMTP id
 5b1f17b1804b1-454e2b351d7mr2053195e9.10.1752169562006; 
 Thu, 10 Jul 2025 10:46:02 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50537b2sm63213645e9.15.2025.07.10.10.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 10:46:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu, 10 Jul 2025 19:45:57 +0200
Message-ID: <20250710174557.558115-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1752169562; x=1752774362; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n2z8GJ+UNxGNQjouTDI8g8VnVOeicHzqdS6l5OJdtwM=;
 b=F8HYXpAX7Yz59/HUkB3Uti9dS8glYONqTpXDoaYT9SNP9nqCyuZx0aOOKb6pK3+mAZ
 kmIWgN30TI/47XcoRXpR2yLqfTpBD7jWPNOVHv6bK7XfgtNpqM5HLesfdW2ivoYvDrJC
 Zx29Wapm2mCT0sQiNamNr+iY1FVKgVQWM+Yz8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=F8HYXpAX
Subject: [Buildroot] [PATCH] configs/beagley_ai_defconfig: new defconfig
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for BeagleY-AI board by introducing the
beagley_ai_defconfig file and related support files.

The BeagleY-AI uses the TI J722S SoC, also known as AM67A, also
known as TDA4VEN or TDA4AEN.

Retrieve BSP settings from meta-ti (may be useful for other TI boards):

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/j722s.inc:TFA_BOARD = "lite"

- Set BR2_TARGET_UBOOT_NEEDS_ATF_BL31 to provide BL31 variable pointing
  to ATF bl31.bin to the U-Boot build process [1].

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE to OP-TEE as BL32
  secure payload. meta-ti set "SPD=opteed" to build ATF [2].

- Set BR2_TARGET_OPTEE_OS_PLATFORM to "k3-am62x".
  meta-ti uses the OPTEEMACHINE to set optee-os platform [3].
  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"

- Use am67a_beagley_ai_a53 and am67a_beagley_ai_r5 u-boot
  defconfigs introduced in u-boot v2025.07 [4]

- u-boot distroboot (bootflow) detect extlinux.conf file from the first
  SDcard partition, so we have to install the kernel and its dtb file.
  Use devicetreedir instead of devicetree in extlinux.conf file to
  avoid hardcoding the devicetree file name. TI boards are able to
  retrieve dtb file name from an EEPROM (see TI_I2C_BOARD_DETECT in
  uboot).

- Use 6.15.6 stable release instead of the latest 6.12 LTS since the
  k3-j722s support was only introduced in 6.11 kernels.

- Provide a hash file for all custom package version
  (arm-trusted-firmware, linux, ti-k3-r5-loader, uboot) to enable
  BR2_DOWNLOAD_FORCE_CHECK_HASHES.

[1] https://git.yoctoproject.org/meta-ti/commit/?id=e74b9a1746d4d04757c87c1920a0f743e55ff096
[2] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc?h=09.02.00.004#n7
[3] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23
[4] https://source.denx.de/u-boot/u-boot/-/commit/b27c94958b976213e3f21e53943a699ffa53f16e

More information about the board can be found at:
https://www.beagleboard.org/boards/beagley-ai

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                                    |  2 +
 board/beagleboard/beagley-ai/extlinux.conf    |  5 ++
 board/beagleboard/beagley-ai/genimage.cfg     | 32 ++++++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../beagley-ai/patches/linux/linux.hash       |  2 +
 .../ti-k3-r5-loader/ti-k3-r5-loader.hash      |  2 +
 .../beagley-ai/patches/uboot/uboot.hash       |  2 +
 board/beagleboard/beagley-ai/post-build.sh    |  5 ++
 board/beagleboard/beagley-ai/readme.txt       | 38 ++++++++++++++
 configs/beagley_ai_defconfig                  | 49 +++++++++++++++++++
 10 files changed, 138 insertions(+)
 create mode 100644 board/beagleboard/beagley-ai/extlinux.conf
 create mode 100644 board/beagleboard/beagley-ai/genimage.cfg
 create mode 120000 board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
 create mode 100644 board/beagleboard/beagley-ai/patches/linux/linux.hash
 create mode 100644 board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 board/beagleboard/beagley-ai/patches/uboot/uboot.hash
 create mode 100755 board/beagleboard/beagley-ai/post-build.sh
 create mode 100644 board/beagleboard/beagley-ai/readme.txt
 create mode 100644 configs/beagley_ai_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 824585094e..6029cf9858 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2923,11 +2923,13 @@ F:	package/vnstat/
 
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/beagleboard/beagleboneai64/
+F:	board/beagleboard/beagley-ai/
 F:	board/qemu/
 F:	board/ti/am574x-idk/
 F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
 F:	configs/beagleboneai64_defconfig
+F:	configs/beagley_ai_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
diff --git a/board/beagleboard/beagley-ai/extlinux.conf b/board/beagleboard/beagley-ai/extlinux.conf
new file mode 100644
index 0000000000..582d510b5d
--- /dev/null
+++ b/board/beagleboard/beagley-ai/extlinux.conf
@@ -0,0 +1,5 @@
+default buildroot
+label buildroot
+   kernel /Image
+   devicetreedir /
+append root=/dev/mmcblk1p2 rootwait rw console=ttyS2,115200n8
diff --git a/board/beagleboard/beagley-ai/genimage.cfg b/board/beagleboard/beagley-ai/genimage.cfg
new file mode 100644
index 0000000000..3965b9388e
--- /dev/null
+++ b/board/beagleboard/beagley-ai/genimage.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
+			"Image",
+			"ti",
+			"extlinux",
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
+	partition u-boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beagleboard/beagley-ai/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagley-ai/patches/linux/linux.hash b/board/beagleboard/beagley-ai/patches/linux/linux.hash
new file mode 100644
index 0000000000..794837b285
--- /dev/null
+++ b/board/beagleboard/beagley-ai/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2bb586c954277d070c8fdf6d7275faa93b4807d9bf3353b491d8149cca02b4fc  linux-6.15.6.tar.xz
diff --git a/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/beagleboard/beagley-ai/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/board/beagleboard/beagley-ai/patches/uboot/uboot.hash b/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..440526977b
--- /dev/null
+++ b/board/beagleboard/beagley-ai/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
diff --git a/board/beagleboard/beagley-ai/post-build.sh b/board/beagleboard/beagley-ai/post-build.sh
new file mode 100755
index 0000000000..8dae08a47c
--- /dev/null
+++ b/board/beagleboard/beagley-ai/post-build.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "$BOARD_DIR"/extlinux.conf "$BINARIES_DIR"/extlinux/extlinux.conf
diff --git a/board/beagleboard/beagley-ai/readme.txt b/board/beagleboard/beagley-ai/readme.txt
new file mode 100644
index 0000000000..62001aac6f
--- /dev/null
+++ b/board/beagleboard/beagley-ai/readme.txt
@@ -0,0 +1,38 @@
+BeagleBoard.org BeagleY-AI Development Board
+
+Description
+===========
+
+This configuration will build a basic image for the BeagleBoard.org
+BeagleY-AI. For more details about the board, visit:
+
+https://www.beagleboard.org/boards/beagley-ai
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make beagley_ai_defconfig
+
+Optional: modify the configuration:
+
+$ make menuconfig
+
+Build:
+
+$ make
+
+To copy the resultimg output image file to an SD card use dd:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+How to Run
+==========
+
+Insert the SD card into the BeagleY-AI board, and power it up
+through the USB Type-C connector. The system should come up.
+You can use a USB to serial adapter to connect to the connector
+labeled UART0 (J13) to communicate with the board.
+
+https://docs.beagle.cc/boards/beagley/ai/02-quick-start.html
diff --git a/configs/beagley_ai_defconfig b/configs/beagley_ai_defconfig
new file mode 100644
index 0000000000..67516d8681
--- /dev/null
+++ b/configs/beagley_ai_defconfig
@@ -0,0 +1,49 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagley-ai/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagley-ai/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagley-ai/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.15.6"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am67a-beagley-ai"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_LTS_2_12_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am62x"
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="am67a_beagley_ai_r5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am67a_beagley_ai_a53"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
