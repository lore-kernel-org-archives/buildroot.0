Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4A3C6FD18
	for <buildroot@archiver.kernel.org>; Sat, 22 Apr 2023 14:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2B2060E1B;
	Sat, 22 Apr 2023 14:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2B2060E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GzuQJuOCaZlS; Sat, 22 Apr 2023 14:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77DEF60E1D;
	Sat, 22 Apr 2023 14:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77DEF60E1D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A67F1C2745
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 14:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 332FB405D0
 for <buildroot@lists.busybox.net>; Sat, 22 Apr 2023 14:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 332FB405D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtWAbCU9-aUI for <buildroot@lists.busybox.net>;
 Sat, 22 Apr 2023 14:00:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEF3F403C4
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEF3F403C4
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 14:00:24 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-504eac2f0b2so4570562a12.3
 for <buildroot@buildroot.org>; Sat, 22 Apr 2023 07:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682172022; x=1684764022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UWCc2KlKT1UqFoOkDYcAsPnmrDtINBLHWy1c1Hoqh0I=;
 b=X4MPSzvwYf9nHBk7Vr/FnK8Nkga93Ya1l34kC6JKeVPptUEvfC+y9JKK/71WjSfbTs
 MKSNgeE6eg79Dusi3wnFBou5rpSb3DSzia/QBDckwJv63bB/MiEhgM/gs1nwoxrudecK
 k+SFS6oo5kyEN8NpyZ3RDxTqoFKFPLJPH/FhgWBSLRnVf1rMfeRWusFEHIx7kkiL/gHm
 N5O6sP3ZuMfS/ZTgyGmQKyRv0kVnbmzUvWE4sJXOWmx59U3PvZ4WSawICZMh0FKpm2rG
 TEUlmV6TEYPKfp5WrfCBlRX6iAOibV19JyYNDDM8jfw9uZ94Iu5a1AQv2JcU6Ed90AF+
 P+Zg==
X-Gm-Message-State: AAQBX9dMWZ+745Jw4LbcwNNRzDiMj7itqcGayp4Fy7dywRIbIGMrCZ3H
 naykhAXYvFkMJ6twgwhS+Lu8sBilq7FlalKjZAtkmw==
X-Google-Smtp-Source: AKy350YkmSLULNCQ22LyJGzrgIHyXa+949uE3XoK6BcZrzczh2oDEy27enUvT1fzmqFHd4OiSMUAFg==
X-Received: by 2002:a17:907:c30b:b0:93d:ae74:fa9e with SMTP id
 tl11-20020a170907c30b00b0093dae74fa9emr5181342ejc.7.1682172022616; 
 Sat, 22 Apr 2023 07:00:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 hy12-20020a1709068a6c00b0094f09cd4658sm3345622ejc.71.2023.04.22.07.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 07:00:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 22 Apr 2023 16:00:18 +0200
Message-Id: <20230422140018.616018-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682172022; x=1684764022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UWCc2KlKT1UqFoOkDYcAsPnmrDtINBLHWy1c1Hoqh0I=;
 b=BJRC4nSVWPqTCozlrKQprCGCpbK5ISjRw/SuKzoIo0Rh4SZP0KNLnf43IkQBP444ci
 5slB0Vu2opxfsbztGxsjyLGvqKan/wyLNbSj1Gi0oIQOQKeJYIzswPThDJqWPIaddTpD
 bVGHIRzUHxknWBpIvLrM4CGJ6Og51muvSc5xo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BJRC4nSV
Subject: [Buildroot] [PATCH 1/1] configs/stm32f769_disco_sd_defconfig: new
 defconfig
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

Board support package includes the following components:
- mainline Linux kernel 5.14.21
- mainline U-Boot 2023.04
- default packages from buildroot

Note: There is a problem in u-boot display management. It should display
the ST microelectronics logo but "noise" is displayed (like when running
the command dd if=/dev/urandom of=/dev/fb0 in Linux). I also tried to
change version (even the first version in which this feature was
introduced), but without success. Despite this I decided not to disable
the video management configuration to remind us that it needs to be
fixed :).

Link: https://www.st.com/en/evaluation-tools/32f769idiscovery.html
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                                    |  2 ++
 .../stm32f769-disco/extlinux.conf             |  4 +++
 .../stm32f769-disco/flash_sd.sh               | 18 +++++++++++
 .../stm32f769-disco/genimage.cfg              | 27 ++++++++++++++++
 .../stm32f769-disco/linux-sd.fragment         |  1 +
 .../stm32f769-disco/post-build.sh             |  7 ++++
 .../stm32f769-disco/readme.txt                | 32 +++++++++++++++++++
 configs/stm32f769_disco_sd_defconfig          | 30 +++++++++++++++++
 8 files changed, 121 insertions(+)
 create mode 100644 board/stmicroelectronics/stm32f769-disco/extlinux.conf
 create mode 100755 board/stmicroelectronics/stm32f769-disco/flash_sd.sh
 create mode 100644 board/stmicroelectronics/stm32f769-disco/genimage.cfg
 create mode 100644 board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
 create mode 100755 board/stmicroelectronics/stm32f769-disco/post-build.sh
 create mode 100644 board/stmicroelectronics/stm32f769-disco/readme.txt
 create mode 100644 configs/stm32f769_disco_sd_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 5cd882b5791c..88ed40412ae8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -702,8 +702,10 @@ F:	package/xinetd/
 
 N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
 F:	board/bsh/
+F:	board/stmicroelectronics/stm32f769-disco/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
+F:	configs/stm32f769_disco_sd_defconfig
 F:	package/sscep/
 F:	package/uuu/
 
diff --git a/board/stmicroelectronics/stm32f769-disco/extlinux.conf b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
new file mode 100644
index 000000000000..48483a01fc4e
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
@@ -0,0 +1,4 @@
+label stm32f769-disco-buildroot
+  kernel /zImage
+  devicetree /stm32f769-disco.dtb
+  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
diff --git a/board/stmicroelectronics/stm32f769-disco/flash_sd.sh b/board/stmicroelectronics/stm32f769-disco/flash_sd.sh
new file mode 100755
index 000000000000..0ff3ae7dbfb3
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/flash_sd.sh
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
+"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32f769i-disco.cfg \
+  -c "init" \
+  -c "reset init" \
+  -c "flash probe 0" \
+  -c "flash info 0" \
+  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
+  -c "reset run" \
+  -c "shutdown"
diff --git a/board/stmicroelectronics/stm32f769-disco/genimage.cfg b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
new file mode 100644
index 000000000000..41f9da512489
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/genimage.cfg
@@ -0,0 +1,27 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"stm32f769-disco.dtb",
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
diff --git a/board/stmicroelectronics/stm32f769-disco/linux-sd.fragment b/board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
new file mode 100644
index 000000000000..846229d0d468
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
@@ -0,0 +1 @@
+# CONFIG_XIP_KERNEL is not set
diff --git a/board/stmicroelectronics/stm32f769-disco/post-build.sh b/board/stmicroelectronics/stm32f769-disco/post-build.sh
new file mode 100755
index 000000000000..c8cca3de8c9b
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname "$0")"
+
+# Kernel is built without devpts support
+sed -i '/^devpts/d' "${TARGET_DIR}"/etc/fstab
+
+install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${BINARIES_DIR}"/extlinux/extlinux.conf
diff --git a/board/stmicroelectronics/stm32f769-disco/readme.txt b/board/stmicroelectronics/stm32f769-disco/readme.txt
new file mode 100644
index 000000000000..8f4f79a86138
--- /dev/null
+++ b/board/stmicroelectronics/stm32f769-disco/readme.txt
@@ -0,0 +1,32 @@
+STM32F769 Discovery
+===================
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the STM32F769 Discovery evaluation platform.
+
+Building
+--------
+
+  make stm32f769_disco_sd_defconfig
+  make
+
+Flashing
+--------
+
+  ./board/stmicroelectronics/stm32f769-disco/flash_sd.sh output/
+
+It will flash the U-boot bootloader.
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
+definition in board/stmicroelectronics/stm32f769-disco/genimage.cfg.
+
diff --git a/configs/stm32f769_disco_sd_defconfig b/configs/stm32f769_disco_sd_defconfig
new file mode 100644
index 000000000000..4d43658403ca
--- /dev/null
+++ b/configs/stm32f769_disco_sd_defconfig
@@ -0,0 +1,30 @@
+BR2_arm=y
+BR2_cortex_m4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32f769-disco/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f769-disco/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.21"
+BR2_LINUX_KERNEL_DEFCONFIG="stm32"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="$(LINUX_DIR)/arch/arm/configs/dram_0xc0000000.config board/stmicroelectronics/stm32f769-disco/linux-sd.fragment"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f769-disco"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+# BR2_PACKAGE_IFUPDOWN_SCRIPTS is not set
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f769-disco"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_OPENOCD=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
