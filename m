Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89809C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 18:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B1860AAC;
	Mon,  2 Jan 2023 18:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B1860AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IozPEhOplSbO; Mon,  2 Jan 2023 18:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CE8160B1F;
	Mon,  2 Jan 2023 18:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CE8160B1F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3611BF2C6
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 18:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6500D813AE
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 18:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6500D813AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IA6M8EZRSux4 for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 18:16:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE95F8144A
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE95F8144A
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 18:16:06 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id x11so22899121qtv.13
 for <buildroot@buildroot.org>; Mon, 02 Jan 2023 10:16:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5xTthOH7lQ068ebjzs1kEQ+kCkJQg3kEJmF5++pYu8c=;
 b=wuWwq/9kkDO1AqaBIe1ctAlh3uCpep3gymDimAijfMK9UayCjEwxfJ5JAzAkss//sQ
 I7tjGAvcWltM/39ksMClDkdo5onN3pp/mU920dqJF8OP6CXs0nv+gJyIEyYtdl6FsIm0
 plZI0xJQXtSG5VzG0D9lcJj8Pk5vkGxZkoH5uBx/3HwfwbtYXvG7FDEwglpLaJn6uu32
 eVoz0azMX2GmZASOtfNDvGJOO3OXjt7x7eAJIO3QLpKdBtI3hlCbbBMTT2euzJZiXoG/
 yLXMsGNxK1m4bIvhHySXsq590P+WLwWr37stSj8K7r/HqWn+i7muw1SYMeW2RJvjY4gy
 jurg==
X-Gm-Message-State: AFqh2kpy1JcJD0XFM1o/cZt4caqyyE29yaOS2vOscJYFBB+wQHPgUrGl
 xOnw1FKHw9U5s4x4uRvVCVv9bO+IHqU=
X-Google-Smtp-Source: AMrXdXvI9R/c6M8lhHD7v1i9dYnpMstMzrx5L+6FbT4tsWiHkU3f61qHB/5ZKJAGTaJmaS6btU5o2w==
X-Received: by 2002:ac8:53cd:0:b0:3a8:2d6:521e with SMTP id
 c13-20020ac853cd000000b003a802d6521emr66382440qtq.37.1672683365518; 
 Mon, 02 Jan 2023 10:16:05 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
 by smtp.gmail.com with ESMTPSA id
 bp33-20020a05620a45a100b006e99290e83fsm12499125qkb.107.2023.01.02.10.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 10:16:04 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Jan 2023 13:16:03 -0500
Message-Id: <20230102181603.3337480-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5xTthOH7lQ068ebjzs1kEQ+kCkJQg3kEJmF5++pYu8c=;
 b=XPw24xb//1pZEnDvWFJ7UenvoZvEBNpllMwF4TdbUXXWBiNIm0uObudZA4EL97d9jR
 +O6y6yGW3XJLG4ebTqLm+wcLeOfFizGsWCny1H2s6ZUlnpqo4bEHA1/uh0bbKXZHeMIj
 G9dRB2H0S73GC5EH/C+Q8uhMunU54Wf4UKbC1squJuovinprNOCoh0GdXK9iEbo8qCwD
 TDD4DML3GzlFrWFvsOrXzl7c5beYaiTBjd9JdmgflvMHHwSP4o3B7wfETA0hFW4AwOZE
 KQnoIudsaAHDeskrTgvuKmnEYmXvYxv0z1oCoDkn/NZyCGQZ8NvOYe9eZzAEh5MgKrh9
 dinw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XPw24xb/
Subject: [Buildroot] [PATCH v6] configs/imxrt1050-evk: New defconfig
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
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                                  |  6 +++
 board/freescale/imxrt1050evk/genimage.cfg   | 40 ++++++++++++++++++
 board/freescale/imxrt1050evk/readme.txt     | 30 ++++++++++++++
 board/freescale/imxrt1050evk/uboot.fragment |  2 +
 configs/imxrt1050-evk_defconfig             | 45 +++++++++++++++++++++
 5 files changed, 123 insertions(+)
 create mode 100644 board/freescale/imxrt1050evk/genimage.cfg
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
index 0000000000..daa51bdbe0
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
+	size = 8M
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
index 0000000000..e1b8f2013b
--- /dev/null
+++ b/configs/imxrt1050-evk_defconfig
@@ -0,0 +1,45 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_m7=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
+
+# Toolchain
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1"
+BR2_LINUX_KERNEL_DEFCONFIG="imxrt"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imxrt1050-evk"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="16M"
+
+# NOMMU Busybox
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
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
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
