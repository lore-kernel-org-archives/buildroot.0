Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A31D4A5F4
	for <buildroot@archiver.kernel.org>; Sun, 18 Jan 2026 15:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1278C81511;
	Sun, 18 Jan 2026 15:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPEy49e7WNsi; Sun, 18 Jan 2026 15:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EA4D816DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768751711;
	bh=fTQAkAWdPtyRe/hlmKDgmFtoCFyAgenVWaEBTIitpl0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qqjStuaWHEcz0ze4uF8wHitE7gy3tAsjHxZErUB+W9+Tz2J7M1wQctIyohrRNiQh6
	 AIO1aBpGWP7xmkzdo7+2gTFnrxNOdJINAeRbMqjay/JulcMfj7FxXXxOOSj9ak6xeU
	 R54hslKpQHXYhdNH7m3rhcmj1/xPtdGqlPnkq/Q8WqH8I0vWp36K1JPbX2+nAICvjw
	 QZRM90qoaTWQNGNZzX5vyHpvJ1l3d1bkmuYQ75inVzeSWV3Zn8OjeKcNBLS5L3F/an
	 sQ2kRAM/HCbXkQJ++/+uaoKW3hGiaIhAJKKwh8N9m1UtCzkf0tGSWQKUuBRGQeMd6I
	 MCNrgLUjBvzKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EA4D816DF;
	Sun, 18 Jan 2026 15:55:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D9D3160
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 576324023A
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPCSl_diMJhu for <buildroot@buildroot.org>;
 Sun, 18 Jan 2026 15:55:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7B81740131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B81740131
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B81740131
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 15:55:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-64b92abe63aso6994329a12.0
 for <buildroot@buildroot.org>; Sun, 18 Jan 2026 07:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768751705; x=1769356505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ykaaQR+aM45DUlc4qjb+czUVeuLThgKk64wyVFeHPbc=;
 b=B7TJFo9fSjgK9mVitQzWJnRfHT3J0tgezzZdNZgPqy+l1r+kGU/cXLyVVKVUCleG1M
 mig5pHZWctXmqoD/cHfn0l6qFUnTcmspQXa7YEHRuzNfZSsG4wve7c/LfSxKvtKmxDwv
 45TruBcv3GgNduKumBXYolm9MIbMO6J9tvdb1ZCkQ75IkRT1Hr+T0d0eCXnLf+83Mo+F
 41vOFf55Y56baM4MlhjMt8ekW9fMwnE5fAYaSXHyMXmzN4Kx3caqXqXICS4w1KgGjVGM
 VBOrtnOVqRAcWxE862/D+U5ZqBsMpc9ivVvyAGsnJZGvK+dBWXnU+fqoC30UKXRaDXtF
 l8pg==
X-Gm-Message-State: AOJu0Yy8odivLsy9RuqETFWz0jshVtFs8L2lGoROJFw0PBNa3Co2GLTq
 kIFhFifC18ZQXcJTn5r7yidMGaHyiVxdO19ahdE+QBomWHTm9Aeum94QmLUdd42mXj6fYyxq+KM
 oHlhl
X-Gm-Gg: AY/fxX5+WQN130VP6XLBlgV9b7h2fsJiXPEdvXzhb2Mi9GHe6DAkSF72vmPSj3lmAAQ
 jnu+BId77sb+WcrUFTRY+u3cUR3QJbOa5hwG+hX2pexJnuDThPquCI87aQ6DZ0R6/fSyXxMRnCL
 cBr/MBu+dUy2Y2lUozYa4tVLQ4azL+wQFwo5yRDRrHUdPGCC+rcVKkukw/ixqubtqJT7vEpPR1+
 b1cOz7R+XYyqh5yvjZktfv/8/xHnlECBSVyvmOP/8Ch7cDDOgBdLoVNvzOuj5oDbu7Jvea7rCju
 u/n+k8fskem0sMK+D3y448dp3qNnOsrpCz0MXXUP34er2UpYcfpRlOxgqq9ayvJrTrV/4cSYy1i
 jCtthNe9rAdcFhcrzIGYDBIG4CrKDc4NQyiYUcN3ssoaWTTm+mu+D4v5fX/zW2RPk+4GfNcJs3q
 FP05VoU5sbV15DvOOd7BZj2X7Ax1paJqaUdHzftClx68QmcKujN8mWiU21njjeuUUIKWqt3uuOw
 Lb4vokQDcAMWv3tAEPlF6VwRrWPu8jp/7nvscJFxyQL/Xg/rIpLWzYVYuwkBczezojOQvSIF4Es
 FtwU+Jfho3A=
X-Received: by 2002:a17:906:dc90:b0:b86:f194:9ee9 with SMTP id
 a640c23a62f3a-b8792f5ac8emr740385066b.19.1768751705097; 
 Sun, 18 Jan 2026 07:55:05 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87959fb980sm897583966b.49.2026.01.18.07.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 07:55:04 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Sun, 18 Jan 2026 16:55:01 +0100
Message-ID: <20260118155501.2379846-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1768751705; x=1769356505;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ykaaQR+aM45DUlc4qjb+czUVeuLThgKk64wyVFeHPbc=;
 b=TP2qWLLse0ccQyfrJhVzTAgUSToJYveN1ESQp9hCVgIVE0GIuuuQIhcMkXk5bsuVBE
 gOjZSCNzB11GFDo2Ff2KBTNsJPPeFys2TUaEe8DQYqzJEcXMOUP3FnN4r4o0g1tNI3BL
 FSBYGl68BKMRYK237oCXe2jdgxDUxqdW7N6Uc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=TP2qWLLs
Subject: [Buildroot] [PATCH 1/1] configs/stm32h747_disco_sd: new defconfig
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

Support STM32h747i-disco board. It includes an STM32H747XI SoC with the
following resources:

 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  2 ++
 .../stm32h747-disco/extlinux.conf             |  4 +++
 .../stm32h747-disco/flash_sd.sh               | 18 +++++++++++
 .../stm32h747-disco/genimage.cfg              | 10 ++++++
 .../stm32h747-disco/linux-sd.fragment         |  1 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../stm32h747-disco/patches/linux/linux.hash  |  2 ++
 .../stm32h747-disco/patches/uboot/uboot.hash  |  2 ++
 .../stm32h747-disco/post-build.sh             |  7 ++++
 .../stm32h747-disco/readme.txt                | 32 +++++++++++++++++++
 configs/stm32h747_disco_sd_defconfig          | 31 ++++++++++++++++++
 11 files changed, 110 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32h747-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32h747-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32h747-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32h747-disco/linux-sd.fragment
 create mode 120000 board/stmicroelectronics/stm32h747-disco/patches/linux-headers/linux-headers.hash
 create mode 100644 board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
 create mode 100644 board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
 create mode 100755 board/stmicroelectronics/stm32h747-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32h747-disco/readme.txt
 create mode 100644 configs/stm32h747_disco_sd_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ed4bdb0a073..08c98ec53bf5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -800,12 +800,14 @@ N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
 F:	board/stmicroelectronics/stm32f746-disco/
 F:	board/stmicroelectronics/stm32f769-disco/
+F:	board/stmicroelectronics/stm32h747-disco/
 F:	boot/ti-k3-boot-firmware/
 F:	configs/imx6ulz_bsh_smm_m2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	configs/stm32h747_disco_sd_defconfig
 F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
diff --git a/board/stmicroelectronics/stm32h747-disco/extlinux.conf b/board/stmicroelectronics/stm32h747-disco/extlinux.conf
new file mode 100644
index 000000000000..36f60e346b6d
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32h747i-disco-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32h747i-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p1 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32h747-disco/flash_sd.sh b/board/stmicroelectronics/stm32h747-disco/flash_sd.sh
new file mode 100755
index 000000000000..db51fa7b6689
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/flash_sd.sh
@@ -0,0 +1,18 @@
+#!/bin/bash
+
+OUTPUT_DIR=$1
+
+if ! test -d "${OUTPUT_DIR}" ; then
+    echo "ERROR: no output directory specified."
+    echo "Usage: $0 OUTPUT_DIR"
+    exit 1
+fi
+
+"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32h747i-disco.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32h747-disco/genimage.cfg b/board/stmicroelectronics/stm32h747-disco/genimage.cfg
new file mode 100644
index 000000000000..e911a94e46b5
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/genimage.cfg
@@ -0,0 +1,10 @@
+image sdcard.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+		size = 32M
+	}
+}
diff --git a/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment b/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment
new file mode 100644
index 000000000000..846229d0d468
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/linux-sd.fragment
@@ -0,0 +1 @@
+# CONFIG_XIP_KERNEL is not set
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/linux-headers/linux-headers.hash b/board/stmicroelectronics/stm32h747-disco/patches/linux-headers/linux-headers.hash
new file mode 120000
index 000000000000..5808d92afe89
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
new file mode 100644
index 000000000000..9f5d285c3569
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  189d1f409cef8d0d234210e04595172df392f8cb297e14b447ed95720e2fd940  linux-6.18.5.tar.xz
diff --git a/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
new file mode 100644
index 000000000000..b6a925ea4e89
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b60d5865cefdbc75da8da4156c56c458e00de75a49b80c1a2e58a96e30ad0d54  u-boot-2026.01.tar.bz2
diff --git a/board/stmicroelectronics/stm32h747-disco/post-build.sh b/board/stmicroelectronics/stm32h747-disco/post-build.sh
new file mode 100755
index 000000000000..45100509411b
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+# Kernel is built without devpts support
+sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
diff --git a/board/stmicroelectronics/stm32h747-disco/readme.txt b/board/stmicroelectronics/stm32h747-disco/readme.txt
new file mode 100644
index 000000000000..7125d4d12604
--- /dev/null
+++ b/board/stmicroelectronics/stm32h747-disco/readme.txt
@@ -0,0 +1,32 @@
+STM32H747 Discovery
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32H747 Discovery evaluation platform.
+
+Building
+--------
+
+  make stm32h747_disco_sd_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32h747-disco/flash_sd.sh output/
+
+It will flash the U-Boot bootloader.
+
+Creating SD card
+----------------
+
+Buildroot prepares an"sdcard.img" image in the output/images/ directory,
+ready to be dumped on a SD card. Launch the following command as root:
+
+  dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout and its content, see the
+definition in board/stmicroelectronics/stm32h747-disco/genimage.cfg.
+
diff --git a/configs/stm32h747_disco_sd_defconfig b/configs/stm32h747_disco_sd_defconfig
new file mode 100644
index 000000000000..8c3db61d108e
--- /dev/null
+++ b/configs/stm32h747_disco_sd_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_m7=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32h747-disco/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32h747-disco/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32h747-disco/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.5"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xd0000000.config board/stmicroelectronics/stm32h747-disco/linux-sd.fragment"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32h747i-disco"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_PACKAGE_EVTEST=y
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32h747-disco"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
