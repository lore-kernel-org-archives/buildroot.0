Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6CBC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E17B41778;
	Tue, 13 Feb 2024 17:29:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gPGF5F9GLzn; Tue, 13 Feb 2024 17:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E96341729
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E96341729;
	Tue, 13 Feb 2024 17:29:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 044361BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D71D781AD7
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iHGfZWInTMvQ for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E6AD817ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E6AD817ED
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E6AD817ED
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33cda3dfa06so522559f8f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845309; x=1708450109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/dNnuz7XZhN0GfCEyI1ISf36AyI721tUif1STjlf6/s=;
 b=e/hAQGb5f61biBzHtXJ2V6HkHWys9t3zaLHWwBnbWJXcPtEEfYu+XB3V32zgDIRG1q
 MzJ5lEmMUeGTQHwUWVgryWG43coMcXOQg2PA2+084hQEAwB3EcIwQg9Rv0RjsnwbKCNW
 QMt8aMpAVLzAG91LTJNK9VfJ5SmyrQeeHbxY04Gh/BgKyS5CQ2F0wDfOPGdX0gLU+Z9G
 PvMyQEFM7PSMreXOYDvYCSCNdRHz1Xh3yzfkvtNaz8WkNKS0XLQUjqQ0JNDpunkuG7ZD
 XpOutD0g2YOXvYidMjQuMWXSYCRky885sWJSVWBqQKUcXHlDzxmRkFXwiXUyazLS6Z/m
 jCqw==
X-Gm-Message-State: AOJu0YxRpz9U/atPqU22i5OS4LmXZhMV2Kg40j0ZMlwoF4IqMSshhIbr
 R4+fEP+mlcmP7OFNTyt23ojl8e3Rn8u/bIBjcWPPFVAFbd7sZGlVfKtFJeXGOBSJDDMuhplKOLR
 5
X-Google-Smtp-Source: AGHT+IHVooivQ3zOeCYMVXj7uEDkFE09TJ4CZ8ijbdX0mvBIQF5U4OBun0CocuXWSqdGIKJoej6l8w==
X-Received: by 2002:a5d:6daa:0:b0:33b:2f8f:da32 with SMTP id
 u10-20020a5d6daa000000b0033b2f8fda32mr9111547wrs.10.1707845309575; 
 Tue, 13 Feb 2024 09:28:29 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:29 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:14 +0100
Message-ID: <20240213172817.2872849-19-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845309; x=1708450109;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/dNnuz7XZhN0GfCEyI1ISf36AyI721tUif1STjlf6/s=;
 b=Ol0tDgeciTXD8qLkOloH9b1WvIC9r3tyIiQyKRN2930+pBd26FIw1GlYuE2oDY84ey
 DvVfqWKSrF74BYaYy7cjd+9CnSuUdC4A8TarreLOf+56LtodVfT67H33UWnDxZCIJI86
 IFwpYrG2/b/WZ4JVLqSxDlABwDcT1T2KEKZ03aCjvfx94YHYX0wqR15uehJnJkefdRRs
 lyK6/Ibzp/xJh8lR2yiaKTJiz39hw7OEO/zykmkIwN0N9IoJeIa9Mgn4EEhJtJBp4MrN
 CId3na0csWDIzpvvdOWxj3+/O1xNJgesH8BS6tvL5MhZHXcWKNzBEJYiLeYV40rWUwNd
 gYqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Ol0tDgec
Subject: [Buildroot] [PATCH 18/21] configs/ti_j721e_sk_defconfig: new
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for TI's SK-TDA4VM board by introducing the
ti_j721e_sk_defconfig file and related support files.

Retrieve BSP settings from meta-ti (may be useful for other TI boards):

- Don't set BR2_TARGET_TI_K3_IMAGE_GEN since this tool is deprecated
  [1] and must be replaced by u-boot binman (upstream).
  See FOSDEM 2024 talk by TI folks about Binman and how it simplify the
  overall boot-loader build flow [2].

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD = "generic"

  meta-ti]$ git grep TFA_BOARD
  meta-ti-bsp/conf/machine/beagleplay.conf:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62axx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62xx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am64xx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am65xx.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j7200.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j721e.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j721s2.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j722s.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/j784s4.inc:TFA_BOARD = "j784s4"

- Set BR2_TARGET_UBOOT_NEEDS_ATF_BL31 to provide BL31 variable pointing
  to ATF bl31.bin to the U-Boot build process [3].

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE to OP-TEE as BL32
  secure payload. meta-ti set "SPD=opteed" to build ATF [4].

- Set BR2_TARGET_OPTEE_OS_PLATFORM to "k3-j721e".
  meta-ti uses the OPTEEMACHINE to set optee-os platform [5].
  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
  meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
  meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
  meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
  meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"

- Set BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME since u-boot is looking at /boot/dtb/ti
  for devicetree. (Yocto uses KERNEL_DTBDEST)
  Create a symlink to make sure /boot/dtb/ti exist.
  (We want to keep the u-boot environment provided by upstream as is).

[1] https://git.yoctoproject.org/meta-ti/commit/?id=835811cf8586926cf78a961d090f4e6150432235
[2] https://fosdem.org/2024/schedule/event/fosdem-2024-3067-standardizing-the-generation-and-signing-of-boot-images/
[3] https://git.yoctoproject.org/meta-ti/commit/?id=e74b9a1746d4d04757c87c1920a0f743e55ff096
[4] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc?h=09.02.00.004#n7
[5] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

More information about the board can be found at:
https://www.ti.com/tool/SK-TDA4VM

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                      |  2 ++
 board/ti/j721e-sk/genimage.cfg  | 28 ++++++++++++++++++
 board/ti/j721e-sk/post-build.sh | 16 +++++++++++
 board/ti/j721e-sk/readme.txt    | 34 ++++++++++++++++++++++
 configs/ti_j721e_sk_defconfig   | 51 +++++++++++++++++++++++++++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 board/ti/j721e-sk/genimage.cfg
 create mode 100755 board/ti/j721e-sk/post-build.sh
 create mode 100644 board/ti/j721e-sk/readme.txt
 create mode 100644 configs/ti_j721e_sk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index ff44741f9f..e5f2dd2327 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2668,8 +2668,10 @@ F:	package/vnstat/
 N:	Romain Naour <romain.naour@gmail.com>
 F:	board/qemu/
 F:	board/ti/am574x-idk/
+F:	board/ti/j721e-sk/
 F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
+F:	configs/ti_j721e_sk_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/binutils/
diff --git a/board/ti/j721e-sk/genimage.cfg b/board/ti/j721e-sk/genimage.cfg
new file mode 100644
index 0000000000..2a991748d5
--- /dev/null
+++ b/board/ti/j721e-sk/genimage.cfg
@@ -0,0 +1,28 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"sysfw.itb",
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
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
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/ti/j721e-sk/post-build.sh b/board/ti/j721e-sk/post-build.sh
new file mode 100755
index 0000000000..01af6ca474
--- /dev/null
+++ b/board/ti/j721e-sk/post-build.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+# u-boot is looking at /boot/dtb/ti for devicetree in the rootfs
+# partition while Buildroot install the kernel and its devicetree
+# in /boot (BR2_LINUX_KERNEL_INSTALL_TARGET enabled).
+# Enabling BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME allows to keep the
+# "ti" subdirectory but "dts" is still missing.
+# Make sure /boot/dtb/ti exist by creating a symlink in
+# ${TARGET_DIR}/boot
+# https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc?h=09.02.00.004#n13
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/include/env/ti/mmc.env?ref_type=tags#L18
+if [ -L ${TARGET_DIR}/boot/dtb ]; then
+    rm ${TARGET_DIR}/boot/dtb
+    ln -sf . ${TARGET_DIR}/boot/dtb
+fi
diff --git a/board/ti/j721e-sk/readme.txt b/board/ti/j721e-sk/readme.txt
new file mode 100644
index 0000000000..bebed1b3f6
--- /dev/null
+++ b/board/ti/j721e-sk/readme.txt
@@ -0,0 +1,34 @@
+Texas Instuments SK-TDA4VM Test and Development Board
+
+Description
+===========
+
+This configuration will build a basic image for the TI SK-TDA4VM
+board: https://www.ti.com/tool/SK-TDA4VM.
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make ti_j721e_sk_defconfig
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
+Insert the SD card into the SK-TDA4VM board, and power it up through the
+USB Type-C connector. The system should come up. You can use a
+micro-USB cable to connect to the connector labeled DEBUG CONSOLE to
+communicate with the board.
diff --git a/configs/ti_j721e_sk_defconfig b/configs/ti_j721e_sk_defconfig
new file mode 100644
index 0000000000..fc2d70d76f
--- /dev/null
+++ b/configs/ti_j721e_sk_defconfig
@@ -0,0 +1,51 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/j721e-sk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/j721e-sk/genimage.cfg"
+BR2_SYSTEM_DHCP="eth0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.4"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-sk"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="generic"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-j721e"
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
+BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E=y
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_evm_r5"
+BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_evm_a72"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=y
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
