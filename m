Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EC7CE8D49
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 04:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0E49849CD;
	Thu, 19 Sep 2024 04:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QedwWmfCC6xw; Thu, 19 Sep 2024 04:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EC29849D0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC29849D0;
	Thu, 19 Sep 2024 04:00:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98AAB1BF215
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 947C884917
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 03:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mat0KwOoqZYC for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 03:59:52 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@helium.openadk.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C73784911
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C73784911
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C73784911
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 03:59:51 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8D5683537474; Thu, 19 Sep 2024 05:53:37 +0200 (CEST)
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 05:53:08 +0200
Message-Id: <20240919035308.2622723-10-wbx@openadk.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240919035308.2622723-1-wbx@openadk.org>
References: <20240919035308.2622723-1-wbx@openadk.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1726718018; bh=fl8S6QGuMOYoBspATQjcVdEQtvgMCUzdhB2H9GIl9A0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mhOF7jd84lYzQIDJgCav7A6u2rkncIqLEqE4AxJSetnF/zf1i1EpYs+GhCnptdiIl
 iDC5ThJiFMMEtAvfLWE/VoZA7GNYdPz/SSEV1kUXpsJ8q/U4rdnP4tVkYFCuryOdAZ
 Z/+7QeKI7mvsoZfU2jJi4V139SbLHn7cNJUDxG2wvXxk6YHB8vTso/LS9BsEoKaBfU
 oRsCJXwVBXJ2cOTVyYhiKN6bxdcmT17wC9uPabWTNUOX6z/1hYoKVpRHvMVP7N4qpt
 1ut/U3RYHOuLoXl+wMmnppEAC8xwSlyFIQn1z3UBO0NzN39D1TNe/+zuRNqBpHpOnK
 FCK9Ow8wB8J/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=mhOF7jd8
Subject: [Buildroot] [PATCH 9/9] configs/stm32f746_disco_sd: new defconfig
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The commit adds support for STM32F746G-DISCO board. The discovery kit is
a complete demonstration and development platform for STMicroelectronics
Arm Cortex-M7-core-based STM32F746NG.

Board support package includes the following components:
- mainline Linux kernel 5.15.165
- mainline U-Boot 2024.07
- default packages from buildroot

Link: https://www.st.com/en/evaluation-tools/32f746gdiscovery.html
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                                    |  2 ++
 .../stm32f746-disco/extlinux.conf             |  4 +++
 .../stm32f746-disco/flash_sd.sh               | 22 +++++++++++++
 .../stm32f746-disco/genimage.cfg              | 27 ++++++++++++++++
 .../stm32f746-disco/linux.fragment            | 13 ++++++++
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../stm32f746-disco/patches/linux/linux.hash  |  2 ++
 .../stm32f746-disco/patches/uboot/uboot.hash  |  2 ++
 .../stm32f746-disco/post-build.sh             |  4 +++
 .../stm32f746-disco/readme.txt                | 31 ++++++++++++++++++
 configs/stm32f746_disco_sd_defconfig          | 32 +++++++++++++++++++
 11 files changed, 140 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32f746-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32f746-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32f746-disco/linux.fragment
 create mode 120000 board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32f746-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32f746-disco/readme.txt
 create mode 100644 configs/stm32f746_disco_sd_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ea4ee3377f..39da7ba38e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3304,7 +3304,9 @@ F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
 F:	board/qemu/riscv32-virt/
+F:	board/stmicroelectronics/stm32f746-disco/
 F:	configs/qemu_riscv32_nommu_virt_defconfig
+F:	configs/stm32f746_disco_sd_defconfig
 F:	package/asterisk/
 F:	package/evilwm/
 F:	package/fbv/
diff --git a/board/stmicroelectronics/stm32f746-disco/extlinux.conf b/board/stmicroelectronics/stm32f746-disco/extlinux.conf
new file mode 100644
index 0000000000..bb79c0b412
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32f746-disco-buildroot
+  kernel /zImage
+  devicetree /stm32f746-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootwait consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32f746-disco/flash_sd.sh b/board/stmicroelectronics/stm32f746-disco/flash_sd.sh
new file mode 100755
index 0000000000..b4858cb9da
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/flash_sd.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+if [ $# -eq 0 ]; then
+    OUTPUT_DIR=output
+else
+    OUTPUT_DIR=$1
+fi
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32f746g-disco.cfg \
+    -c "init" \
+    -c "reset init" \
+    -c "flash probe 0" \
+    -c "flash info 0" \
+    -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+    -c "reset run" \
+    -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f746-disco/genimage.cfg b/board/stmicroelectronics/stm32f746-disco/genimage.cfg
new file mode 100644
index 0000000000..6743d41972
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/genimage.cfg
@@ -0,0 +1,27 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"stm32f746-disco.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
+		partition-type = 0xC
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 32M
+	}
+}
diff --git a/board/stmicroelectronics/stm32f746-disco/linux.fragment b/board/stmicroelectronics/stm32f746-disco/linux.fragment
new file mode 100644
index 0000000000..625fdced9e
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/linux.fragment
@@ -0,0 +1,13 @@
+# CONFIG_PREEMPT is not set
+# CONFIG_MULTIUSER is not set
+# CONFIG_TIMERFD is not set
+CONFIG_SET_MEM_PARAM=y
+CONFIG_DRAM_BASE=0xC0000000
+CONFIG_DRAM_SIZE=0x01000000
+# CONFIG_GCC_PLUGINS is not set
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_BLK_DEV is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_PROC_SYSCTL is not set
+# CONFIG_CRYPTO is not set
+CONFIG_RCU_TRACE=y
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
new file mode 100644
index 0000000000..7f78b950f3
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a36dd3e82ceb634afded31f2656568f57c4d9c4b399859f298b18116df11c6fe  linux-5.15.165.tar.xz
diff --git a/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..fe9b4f53dc
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
diff --git a/board/stmicroelectronics/stm32f746-disco/post-build.sh b/board/stmicroelectronics/stm32f746-disco/post-build.sh
new file mode 100755
index 0000000000..5dcdb352eb
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
diff --git a/board/stmicroelectronics/stm32f746-disco/readme.txt b/board/stmicroelectronics/stm32f746-disco/readme.txt
new file mode 100644
index 0000000000..4ac16da331
--- /dev/null
+++ b/board/stmicroelectronics/stm32f746-disco/readme.txt
@@ -0,0 +1,31 @@
+STM32F746-DISCO
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32F746-DISCO evaluation platform.
+
+Building
+--------
+
+  make stm32f746_disco_sd_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32f746-disco/flash_sd.sh output/
+
+It will flash the U-boot bootloader.
+
+Creating SD card
+----------------
+
+Buildroot prepares an "sdcard.img" image in the output/images/ directory,
+ready to be dumped on a SD card. Launch the following command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout and its content, see the
+definition in board/stmicroelectronics/stm32f746-disco/genimage.cfg.
diff --git a/configs/stm32f746_disco_sd_defconfig b/configs/stm32f746_disco_sd_defconfig
new file mode 100644
index 0000000000..5766e975f4
--- /dev/null
+++ b/configs/stm32f746_disco_sd_defconfig
@@ -0,0 +1,32 @@
+BR2_arm=y
+BR2_cortex_m7=y
+BR2_BINFMT_FDPIC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f746-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_INIT_TINYINIT=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f746-disco/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f746-disco/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.165"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/stmicroelectronics/stm32f746-disco/linux.fragment"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f746-disco"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f746-disco"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
