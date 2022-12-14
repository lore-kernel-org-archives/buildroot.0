Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2422C001B2
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 23:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE8C41847;
	Wed, 14 Dec 2022 23:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BE8C41847
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPMuxG59AHVJ; Wed, 14 Dec 2022 23:36:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF95041848;
	Wed, 14 Dec 2022 23:36:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF95041848
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3CD71BF423
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 23:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB53040BC4
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 23:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB53040BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aclqBrhoPC5S for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 23:36:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D195400F6
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D195400F6
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 23:36:52 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id c7so3861293qtw.8
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 15:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwcksH6q9lcYngHEZMJnlfPdo/Xsdcd6vS9X6hPW/Mo=;
 b=w8O4Iq7YscsqOyehFz7VKRMaXzzetWk19YaKTy9EKheksUaONdqnfZ7MssNDNdNQi+
 oORcdgQvmZuxsmyL5Qz9VbyRsMuniw3eGiiFpU2kSGaepDvATsc77oo1QxDi0WZH17nr
 U8Hgwm9VHrkon2z/1hWwVGd//DkhzzEVQSA63aHmHZuyHLgw4scocNu6vlmMqbF+sZqE
 pts9qFlKiqyvFlXlsKxpi+msSz+zpqTqExiILgRXZCYf9phG33uc+maQJy9mMEcD1BEb
 dPmzbeeVtqF2tZ87ZSfFAwFuUskUOW7lAHkp1QPNcbBdCVewRplopOr35wwDZbnC38mt
 sXtA==
X-Gm-Message-State: ANoB5plLzW1IksPX6+AG6DRUp6kQ9A/c4nYLW1p8xKD89Tc37QrsMGz/
 0qVodguTJpsAKM8YYxc13o+1I/LhGuk=
X-Google-Smtp-Source: AA0mqf4t9cqUtBxG2yIP8SBzxTDZ5yP/HHd86eTgSq4KDFeEHnySWGEI0yO5lROC+nRuuFhVPx8zSw==
X-Received: by 2002:a05:622a:4805:b0:3a8:15d2:6e8e with SMTP id
 fb5-20020a05622a480500b003a815d26e8emr24689214qtb.41.1671061011042; 
 Wed, 14 Dec 2022 15:36:51 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
 by smtp.gmail.com with ESMTPSA id
 he15-20020a05622a600f00b003a591194221sm2496634qtb.7.2022.12.14.15.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 15:36:50 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 18:36:49 -0500
Message-Id: <20221214233649.3928722-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OwcksH6q9lcYngHEZMJnlfPdo/Xsdcd6vS9X6hPW/Mo=;
 b=mlhyzgLxQyTW2Z3G9yLnvENZdzv7GWCGmlCtvk0JUY/yG9NuebPsvJ/dG9P6eURATO
 tPs9z8YEki9/nshzuois/WIrVZHCPswqfOWcA7+Npmh/X1yz2WIcHB2Lf31fFp9mWOtz
 H0CJeAaspU6zOwvUFzOKZUYAR6x75MFTNv8CD74T0zQi98v+rbqCQomDwNPl2cHtydaW
 oL3EvdFd9KlwzJs/xlE2mXHrPElBbXBpXiNdHLUN0z1hmUbQvqObtEjJ1CiujXWs1Yw9
 ZmSrPo+y4Z6HrHY+ftyzdUDYwQ6feW0omS4dvNNpEp/kGubIPGLSthW5dVp5Vb+3o1Dg
 q+OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mlhyzgLx
Subject: [Buildroot] [PATCH v4] configs/imxrt1050-evk: New defconfig
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
Cc: festevam@gmail.com, Jesse Taube <Mr.Bossman075@gmail.com>,
 James Autry <jautry@tekvox.com>, stephane.viau@oss.nxp.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 maeva.manuel@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add defconfig for imxrt1050-evk is a development board from NXP.

Giulio and I worked on Linux and U-boot for this board. And now I'm
adding support for the new board in Buildroot.

The i.MXRTxxxx family spreads from i.MXRT1020 to i.MXRT1170 with the
first one supporting 1 USB OTG & 100M ethernet with a cortex-M7@500Mhz
up to the latter with i.MXRT1170 with cortex-M7@1Ghz and
cortex-M4@400Mhz, 2MB of internal SRAM, 2D GPU, 2x 1Gb and
1x 100Mb ENET. The i.MXRT family is NXP's answer to STM32F7xx, as it
uses only simple SDRAM, it gives the chance of a 4 or less layer PCBs.
Seeing that these chips are comparable to the STM32F7xxs which have
buildroot ported to them it seems reasonable to add support for them.

https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                                  |  6 +++
 board/freescale/imxrt1050evk/genimage.cfg   | 40 +++++++++++++++++++
 board/freescale/imxrt1050evk/post-build.sh  |  3 ++
 board/freescale/imxrt1050evk/readme.txt     | 30 ++++++++++++++
 board/freescale/imxrt1050evk/uboot.fragment |  2 +
 configs/imxrt1050-evk_defconfig             | 43 +++++++++++++++++++++
 6 files changed, 124 insertions(+)
 create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
 create mode 100755 board/freescale/imxrt1050evk/post-build.sh
 create mode 100644 board/freescale/imxrt1050evk/readme.txt
 create mode 100644 board/freescale/imxrt1050evk/uboot.fragment
 create mode 100644 configs/imxrt1050-evk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 59121c6a54..ee33c65fd4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1132,9 +1132,11 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	board/freescale/imxrt1050evk/*
 F:	board/olimex/a*
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
+F:	configs/imxrt1050-evk_defconfig
 F:	configs/olimex_a*
 F:	package/at/
 F:	package/binutils/
@@ -1477,6 +1479,10 @@ F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
+N:	Jesse Taube <Mr.Bossman075@gmail.com>
+F:	board/freescale/imxrt1050evk/*
+F:	configs/imxrt1050-evk_defconfig
+
 N:	Jesse Van Gavere <jesseevg@gmail.com>
 F:	package/qt6/qt6serialport/
 
diff --git a/board/freescale/imxrt1050evk/genimage.cfg b/board/freescale/imxrt1050evk/genimage.cfg
new file mode 100644
index 0000000000..7e1e932d37
--- /dev/null
+++ b/board/freescale/imxrt1050evk/genimage.cfg
@@ -0,0 +1,40 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"uImage",
+			"imxrt1050-evk.dtb",
+		}
+	}
+
+	size = 6M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition SPL {
+		in-partition-table = "no"
+		image = "SPL"
+		offset = 1K
+		size = 127K
+	}
+
+	partition u-boot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 128K
+		size = 512K
+	}
+
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/freescale/imxrt1050evk/post-build.sh b/board/freescale/imxrt1050evk/post-build.sh
new file mode 100755
index 0000000000..a13789f231
--- /dev/null
+++ b/board/freescale/imxrt1050evk/post-build.sh
@@ -0,0 +1,3 @@
+#!/bin/sh
+MKIMAGE=$HOST_DIR/bin/mkimage
+$MKIMAGE -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d $BINARIES_DIR/Image $BINARIES_DIR/uImage
diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
new file mode 100644
index 0000000000..1fc4edd88b
--- /dev/null
+++ b/board/freescale/imxrt1050evk/readme.txt
@@ -0,0 +1,30 @@
+NXP i.MXRT1050 EVK board
+------------------------
+
+i.MX RT1050 are NXP's crossover MCUs. They combine the high performance and high
+level of integration of an applications processors with the ease-of-use and
+real-time functionality of a microcontroller. The i.MX RT1050 MCU runs on the Arm
+Cortex-M7 core at 600 MHz.
+https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/i-mx-rt1050-evaluation-kit:MIMXRT1050-EVK
+
+To build a minimal support for this board:
+
+$ make imxrt1050-evk_defconfig
+$ make
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be flashed into the SD card:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX
+Where 'sdX' is the device node of the uSD.
+
+Jumper settings:
+
+   SW7: 1 0 1 0
+
+Where 0 means bottom position and 1 means top position (from the
+switch label numbers reference).
+
+Connect the USB cable between the EVK and the PC for the console.
+
+Insert the micro SD card in the board, power it up and U-Boot messages should come up.
diff --git a/board/freescale/imxrt1050evk/uboot.fragment b/board/freescale/imxrt1050evk/uboot.fragment
new file mode 100644
index 0000000000..1c5bb6af35
--- /dev/null
+++ b/board/freescale/imxrt1050evk/uboot.fragment
@@ -0,0 +1,2 @@
+CONFIG_USE_BOOTCOMMAND=y
+CONFIG_BOOTCOMMAND="setenv bootargs console=ttyLP0 root=/dev/mmcblk0p2 rw earlycon rootwait;load mmc 0:1 0x80800000 imxrt1050-evk.dtb;load mmc 0:1 0x80000000 uImage;bootm 0x80000000 - 0x80800000"
diff --git a/configs/imxrt1050-evk_defconfig b/configs/imxrt1050-evk_defconfig
new file mode 100644
index 0000000000..c9022649be
--- /dev/null
+++ b/configs/imxrt1050-evk_defconfig
@@ -0,0 +1,43 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_m7=y
+
+# Image
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/freescale/imxrt1050evk/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
+BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
+BR2_LINUX_KERNEL_IMAGE_NAME="Image"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="3M"
+
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="imxrt1050-evk"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.11"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imxrt1050-evk"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imxrt1050evk/uboot.fragment"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+
+# Required tools to create the SD card image
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MKPASSWD=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
