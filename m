Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AEBC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 05:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B3460B42;
	Sun, 18 Dec 2022 05:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B3460B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iG5yArVxu_WC; Sun, 18 Dec 2022 05:50:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02897607E3;
	Sun, 18 Dec 2022 05:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02897607E3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52A421BF2F9
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 05:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 343F1607E3
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 05:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 343F1607E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVDSXy8B4Tfb for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 05:50:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11CE560671
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11CE560671
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 05:50:05 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id j16so6029940qtv.4
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 21:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=znCAvckJbKN0sqpv0CJvrc7lguNbQdFDHfSoXMoo6VU=;
 b=bRq8AZ5bY0H+We5rzvIcGxdrE9SmS5VPc/5SFzaqSSv0uRL8RQAI1b2NdtunDt6+Bk
 sWuFmJ/JEnMmfAsDMPzF5+qwcOJ4FUiBegovIWGgE5U2a2D7e0fBeg3MlWpJopecCR3b
 aBJeIEwIrDG/MUhe1tr32U9P8Axsh5n+WBZh30Jv3UUJk0OKSu9b+tz5sXuM21aod1sC
 8BvCeKVeETWvviG1jEnke3lFegMawMfu0dut9+qPYOZqLMAv/lM0Qlho5IxT3nLT9BIu
 NJK1Plcz/n9G8Q/GwXkmXOPNqipzknsj/lby9wykpQGotkNZZmY5ihnuA4/cHyfOwhEh
 HCrw==
X-Gm-Message-State: ANoB5pmAKatDUdXuOmCSaIUZI5fUJgjqCqcIFrXSLUE/WUIi8FBGIWAT
 UJ6Ljw9m4tjwuiLJPyQwnTCdCP2S+Gs=
X-Google-Smtp-Source: AA0mqf7FIi82o2oxFG8luAZHxjDj9hsWYs9WYrQ1WquXYm2dfH1zwdi0f9e2uUmxqtw8mrCgevrYhQ==
X-Received: by 2002:ac8:6e87:0:b0:3a8:2ab9:7f9c with SMTP id
 c7-20020ac86e87000000b003a82ab97f9cmr24380930qtv.57.1671342604478; 
 Sat, 17 Dec 2022 21:50:04 -0800 (PST)
Received: from jesse-desktop.jtp-bos.lab
 (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05620a22d400b006e07228ed53sm4633300qki.18.2022.12.17.21.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 21:50:04 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 00:50:03 -0500
Message-Id: <20221218055003.701405-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=znCAvckJbKN0sqpv0CJvrc7lguNbQdFDHfSoXMoo6VU=;
 b=Vqmgx0uNCgAJaDCuFxH2hzDZk6Aiyc6rTWBFh5OfryaCMHzWompZG55r8DG0KKwQ0S
 EBf+t5EYhO3HSQf1iMKozn1PAdHWKs0DYenKBrS0zy29Kl5kduKdMD7xOFkeGG9Uqk8z
 PGBa9IVu5dVns1d4fHELRAlm7iOvJ3uKHhDnwaaUGaVhWFrI+LWKJVK7cBTqiKj6PKvs
 LEXobVIe3Q1oKFHs9T3HLP0w0DqKlh/M4gebByYM8vSK1NtE9K2/2PLRn23l8illewFU
 wkvAWKneaocmnb2g+B5FWE4/3SIsuPBqQbzXxA2mUG7nc2nmb3F0+kbt5NUuihMi+DgI
 f7Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vqmgx0uN
Subject: [Buildroot] [PATCH v5] configs/imxrt1050-evk: New defconfig
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
 DEVELOPERS                                  |  6 ++++
 board/freescale/imxrt1050evk/genimage.cfg   | 40 +++++++++++++++++++++
 board/freescale/imxrt1050evk/readme.txt     | 30 ++++++++++++++++
 board/freescale/imxrt1050evk/uboot.fragment |  2 ++
 configs/imxrt1050-evk_defconfig             | 40 +++++++++++++++++++++
 5 files changed, 118 insertions(+)
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
index 0000000000..7dc58d1e7f
--- /dev/null
+++ b/configs/imxrt1050-evk_defconfig
@@ -0,0 +1,40 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_m7=y
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/freescale/imxrt1050evk/genimage.cfg"
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
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
