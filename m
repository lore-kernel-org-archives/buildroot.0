Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8734EC04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 06:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFEB283E50;
	Sat, 30 Jul 2022 06:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFEB283E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_5DjRsSXU0r; Sat, 30 Jul 2022 06:12:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A752583E2C;
	Sat, 30 Jul 2022 06:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A752583E2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C8A11BF386
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 06:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7340860AE9
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 06:12:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7340860AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHnqXOQnjc29 for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 06:12:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D02960776
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D02960776
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 06:12:23 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id u8so2922684qvv.1
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 23:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SInk8wiqs7uUARozs+t9vUN49GBA8/Pb3tHEFaOfxbU=;
 b=M67xIu7JCBqE9WFR5d9tCC/XKaztu5Rmrn8zg5D5dd39Ef7GHV/juu+OabfhGUeHcT
 ZUf0L29FiKFT8+8SX+vcFjGhOHsd8Ryi/qvGd3dYboDLOu9sjrr972D1oJ3GStuVi2WT
 iLmnr25hRUOyzxgxQ/kBxfguhs6UucyLu8gteKACg4cR4A1eD1gwOdZgnmKRLtP/rv7U
 ZsNi5gruuoTXTw/LN8eWloj24TfLkG2UyNAy/UQTvwsumWyDKC/7Opb5JLpNU1s6VqIU
 riyMvpq4pv+6/FE484QSMz7mXtDjuGlskkY4uGQULq/9rlMnlgkrg3cKnZVHt0F0tivR
 /htg==
X-Gm-Message-State: ACgBeo3mqiYYN59R8YXtMxLdfH1TXVWUkpfCZDnJzz1LIRml8IsIibHY
 Tc0Op8zitOHt/9OcYTMTwL9JkoVoDlE=
X-Google-Smtp-Source: AA6agR4u+pwIbaNhV0nR+7Cs3h3XwJKoT0lroIU0iHOHmMCiJx/IRQCBLC1OuHIvQIwoExtBrt2Wdg==
X-Received: by 2002:a05:6214:d4b:b0:476:5d58:9b63 with SMTP id
 11-20020a0562140d4b00b004765d589b63mr15336qvr.33.1659161541751; 
 Fri, 29 Jul 2022 23:12:21 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab
 (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com.
 [146.115.144.188]) by smtp.gmail.com with ESMTPSA id
 bm7-20020a05620a198700b006b629f86244sm4080768qkb.50.2022.07.29.23.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 23:12:21 -0700 (PDT)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 30 Jul 2022 02:12:19 -0400
Message-Id: <20220730061219.3061864-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SInk8wiqs7uUARozs+t9vUN49GBA8/Pb3tHEFaOfxbU=;
 b=dEs+s2YPtGAzNNVoiEAWKLfXvxY7CamXK6HtgZdFuOys85t5X9kTU3puO0rS0cz2HI
 9QY8M3x1nP1nuj6FfKCdRKZiwB0iVH/uatjMFHwlTkAvu2HQAIrcOu/EaCcUSdYUyrT4
 EN6TaFJOWdt/H6T9FNv2XCbKv5nv+OQYwFmvjUMKGQo5zH6XFmReL838oiajkiOOYlfq
 1aDfWu3ohsVMDIpQyn/ElJv446MhVaM/8TfXBOl0zP0aWEe4e/XgyBSJtkEL/Fv2rC2k
 QqeXYOluo8QJbHqcGXPBK4jnvkQJLrMbBwsWttmgC8W0+g3VD8ApgauwSeWNOQ0Br/WK
 gRZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dEs+s2YP
Subject: [Buildroot] [PATCH v2] configs/imxrt1050-evk: New defconfig
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
Cc: maeva.manuel@oss.nxp.com,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, festevam@gmail.com,
 stephane.viau@oss.nxp.com, Jesse Taube <Mr.Bossman075@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add defconfig for imxrt1050-evk is a development board from NXP.

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
 board/freescale/imxrt1050evk/post-build.sh  |  6 +++
 board/freescale/imxrt1050evk/readme.txt     | 24 +++++++++++
 board/freescale/imxrt1050evk/uboot.fragment |  2 +
 configs/imxrt1050-evk_defconfig             | 44 +++++++++++++++++++++
 6 files changed, 122 insertions(+)
 create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
 create mode 100755 board/freescale/imxrt1050evk/post-build.sh
 create mode 100644 board/freescale/imxrt1050evk/readme.txt
 create mode 100644 board/freescale/imxrt1050evk/uboot.fragment
 create mode 100644 configs/imxrt1050-evk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 0afd697b6c..206bac99e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1096,9 +1096,11 @@ F:	package/webp/
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
@@ -1421,6 +1423,10 @@ F:	package/wmctrl/
 F:	package/x11r7/xdriver_xf86-video-imx/
 F:	package/x11r7/xdriver_xf86-video-imx-viv/
 
+N:	Jesse Taube <Mr.Bossman075@gmail.com>
+F:	board/freescale/imxrt1050evk/*
+F:	configs/imxrt1050-evk_defconfig
+
 N:	Jianhui Zhao <zhaojh329@gmail.com>
 F:	package/libuhttpd/
 F:	package/libuwsc/
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
index 0000000000..476958a691
--- /dev/null
+++ b/board/freescale/imxrt1050evk/post-build.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+MKIMAGE=$HOST_DIR/bin/mkimage
+
+if [ -e $BINARIES_DIR/Image ]; then
+	$MKIMAGE -A arm -O linux -T kernel -C none -a 0x80008000 -e 0x80008000 -n "Linux kernel" -d $BINARIES_DIR/Image $BINARIES_DIR/uImage
+fi
diff --git a/board/freescale/imxrt1050evk/readme.txt b/board/freescale/imxrt1050evk/readme.txt
new file mode 100644
index 0000000000..bbbcd5307f
--- /dev/null
+++ b/board/freescale/imxrt1050evk/readme.txt
@@ -0,0 +1,24 @@
+NXP i.MXRT1050 EVK board
+---------------------
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
index 0000000000..22da281e3a
--- /dev/null
+++ b/configs/imxrt1050-evk_defconfig
@@ -0,0 +1,44 @@
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
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.19-rc5"
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
+BR2_TARGET_ROOTFS_EXT2_LABEL="root"
+BR2_TARGET_ROOTFS_EXT2_SIZE="3M"
+
+
+# Bootloader
+BR2_TARGET_UBOOT=y
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
+
+# Misc
+BR2_BINUTILS_VERSION_2_36_X=y
+# thumb2 ADR bug introduced in 2.37 fix is not yet in u-boot
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
