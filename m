Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565D4C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 16:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA80F60612;
	Sun,  5 Jul 2026 16:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyEaaMWASY0Q; Sun,  5 Jul 2026 16:09:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED49360684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783267792;
	bh=50zQoeLiY4q4egjdKkOv9TAqejPaHI3M3nmBd5gJ7zk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=b676Cy7wRmq7GtEuAcnw7dpE5gzgmaJ4fqV16CxIGaP2TRL7+y5rD/CGTeJ++ZOL4
	 1AP+pvqbEm77ckXc4LUt2iuwVsWjbuuyQYF23kZS5Qqm0eEXGDxXDOlkjG6AEaAPyE
	 z6/xVYeNrADzeZVI93cu6mLSNax5thVm1c5guxT3LcsTnSc17mzIWBouyXtYbMY4kC
	 MP4cQWwXwTCz8RnXskeMbYIBnCX9TsEhUa1XNOpKIkXsCXFAEJT5ebIjd5m/uuPHUR
	 0IAGXzzKA17izV6i7c5S2MFpA31xW2Ce2Y+QWvfgAlWnKOmj4cSWiERl8cGZNzoHM3
	 VfMfW9C0S6V8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED49360684;
	Sun,  5 Jul 2026 16:09:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F2B5B316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E153781000
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKCsj29Ybyvh for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 16:09:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=sofiane.hamam@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5BE280FFF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5BE280FFF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5BE280FFF
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 16:09:48 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-474560436c3so2153084f8f.0
 for <buildroot@buildroot.org>; Sun, 05 Jul 2026 09:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783267786; x=1783872586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Hy12sBXmrL0oJk4Sc2avurniGTD3Bh3QYldX8SdTy/4=;
 b=WnOXYLpKHweRp2dnE7OMrtMokZgx62Z4n2s9jXbaz75PofqlRCvhAHu7d2BMB/yv9w
 L0BSK0m9fikIxeVZzATjwwzkU4YtfcljbhZoV9YPDV1XKYOmDsjiBkT1bGKuBfbun0VA
 Wg411w/61mvjzoRFp4hCZbpQfiDAVo0/dDwXB7d4VDrKuhhA867UrpgHrtCpWUEsrzZ+
 dNejwrdcx73F81K3E6mKIMFwPESZPZdQr61+V8Omjrc8fz7j4q/DWU4++U3iorq4E7nE
 /CL4/Xa3di6itnMqVio2GtXZziTjng/EdK6MTCRYO4NMWc5UxfHx3KjXT41jaEJWBBbi
 kWYA==
X-Gm-Message-State: AOJu0YwHS9aiXTorsgwBW683cO2KxbCxxNU1BVlIgkj6rUZUIZuHjTSf
 zHrle33lUWntgPHGnerLazHVHT4Dbe4ucFwESCy/P792MIIBHl5aJOm4LN/IWnbtzomsSwLstrR
 eIS0mt5gXtA==
X-Gm-Gg: AfdE7cnyPpYP7S3M9CS5GlwJQek9tzZqDD158UqFNSMF5lXUqZU0HcMab4E2onXxR5G
 ISuplGNrgra7jeAi4w7UolQtSyfgC5+jQZHBM5x6F54IPOuvfTRlHGcMAmNiSldwCHtKVzMwuzI
 Dj14TdMD9Wd5VZHZ7lKKERS6CV8L/eY0zq3hwRjNI7Al8EnTL6T1WAUtvXGnLJ4jjiHx0t52nco
 Fv7nDT9Ms3LmCcD1jD5aES84Esg+gSnJjTSQllogP8e5MTBbISLW6VUqtFFWNK7B5dKPe+3EYQA
 SqatP0ynmz5RAIH/im0qjuOuxGRxHSl9nO+D90FBw0dGopLitMe2yOLz2FxFdHxfTfbHSxnQgnZ
 cSSAWBkI7rPPVWty2HDKoVTWrgoz4ZR86zO/2MDPuEzKRKoEXvU3/EbS5vzn6N0+OHhwNj+4U9Y
 bbwFk3mUv95GNRHaOaO6cw6k2i
X-Received: by 2002:a05:6000:1881:b0:45e:f439:9def with SMTP id
 ffacd0b85a97d-47aaaada343mr8017399f8f.15.1783267786029; 
 Sun, 05 Jul 2026 09:09:46 -0700 (PDT)
Received: from FRSMI25-BPYTOP.. ([2a01:e0a:e88:c5f0:b1fc:13fe:83eb:b15c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9b4d850dsm17983032f8f.0.2026.07.05.09.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2026 09:09:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun,  5 Jul 2026 18:08:51 +0200
Message-ID: <20260705160851.817019-1-sofiane.hamam@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783267786; x=1783872586; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Hy12sBXmrL0oJk4Sc2avurniGTD3Bh3QYldX8SdTy/4=;
 b=Q+UXLLeD8tk3TcUdxLyZ/PKTmmn4jt5aP5MS5WnxN5z6ahCbViZYp90EhPTYjiUNpb
 5Jx1aMgRW4mtEJntAfXxNz6VH3T8yVTaLqczLLL9nTlkMLEWfI8NT9m3xyuMBnO0HnrJ
 7uB4afvPBbXK90jz540tyzGJPPKXELrL8Z7sU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Q+UXLLeD
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx95frdm_defconfig: add
 support for freescale FRDM i.MX95 board
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
From: Sofiane HAMAM via buildroot <buildroot@buildroot.org>
Reply-To: Sofiane HAMAM <sofiane.hamam@smile.fr>
Cc: Sofiane HAMAM <sofiane.hamam@smile.fr>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add board support for FRDM i.MX 95 Development Board.

https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX95

Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
---
 .../common/imx/genimage.cfg.template_imx95    |  44 +++++++
 board/freescale/common/imx/post-image.sh      |   2 +
 .../arm-trusted-firmware.hash                 |   2 +
 .../patches/linux-headers/linux-headers.hash  |   1 +
 .../imx95frdm/patches/linux/linux.hash        |   2 +
 .../0001-imx95-15x15-frdm-select-binman.patch |  22 ++++
 .../imx95frdm/patches/uboot/uboot.hash        |   2 +
 board/freescale/imx95frdm/readme.txt          | 115 ++++++++++++++++++
 boot/uboot/uboot.mk                           |  25 ++++
 configs/freescale_imx95frdm_defconfig         |  50 ++++++++
 package/freescale-imx/Config.in               |  28 ++++-
 .../freescale-imx/firmware-ele-imx/Config.in  |   2 +
 .../firmware-ele-imx/firmware-ele-imx.hash    |   2 +-
 .../firmware-ele-imx/firmware-ele-imx.mk      |   7 +-
 package/freescale-imx/firmware-imx/Config.in  |   8 ++
 .../firmware-imx/firmware-imx.mk              |  13 ++
 package/freescale-imx/imx-oei/Config.in       |  48 ++++++++
 package/freescale-imx/imx-oei/imx-oei.hash    |   5 +
 package/freescale-imx/imx-oei/imx-oei.mk      |  55 +++++++++
 package/freescale-imx/imx-sm/Config.in        |  26 ++++
 package/freescale-imx/imx-sm/imx-sm.hash      |   5 +
 package/freescale-imx/imx-sm/imx-sm.mk        |  45 +++++++
 22 files changed, 505 insertions(+), 4 deletions(-)
 create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx95
 create mode 100644 board/freescale/imx95frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/freescale/imx95frdm/patches/linux-headers/linux-headers.hash
 create mode 100644 board/freescale/imx95frdm/patches/linux/linux.hash
 create mode 100644 board/freescale/imx95frdm/patches/uboot/0001-imx95-15x15-frdm-select-binman.patch
 create mode 100644 board/freescale/imx95frdm/patches/uboot/uboot.hash
 create mode 100644 board/freescale/imx95frdm/readme.txt
 create mode 100644 configs/freescale_imx95frdm_defconfig
 create mode 100644 package/freescale-imx/imx-oei/Config.in
 create mode 100644 package/freescale-imx/imx-oei/imx-oei.hash
 create mode 100644 package/freescale-imx/imx-oei/imx-oei.mk
 create mode 100644 package/freescale-imx/imx-sm/Config.in
 create mode 100644 package/freescale-imx/imx-sm/imx-sm.hash
 create mode 100644 package/freescale-imx/imx-sm/imx-sm.mk

diff --git a/board/freescale/common/imx/genimage.cfg.template_imx95 b/board/freescale/common/imx/genimage.cfg.template_imx95
new file mode 100644
index 0000000000..f03490b98e
--- /dev/null
+++ b/board/freescale/common/imx/genimage.cfg.template_imx95
@@ -0,0 +1,44 @@
+# Minimal SD card image for the NXP i.MX95 boards
+#
+# We mimic the .sdcard NXP's image format:
+# * the SD card must have 32 kB free space at the beginning,
+# * the bootloader is the "flash.bin" produced by U-Boot's binman
+#   (SPL + DDR/OEI + System Manager + ELE container + ATF + U-Boot)
+#   and is dumped as is,
+# * a FAT partition at offset 8MB is containing Image and DTB files
+# * a single root filesystem partition is required (ext2, ext3 or ext4)
+#
+
+image boot.vfat {
+	vfat {
+		label = "boot"
+		files = {
+			%FILES%
+		}
+	}
+
+	size = 64M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition imx-boot {
+		in-partition-table = "no"
+		image = "flash.bin"
+		offset = %IMXOFFSET%
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 8M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/freescale/common/imx/post-image.sh b/board/freescale/common/imx/post-image.sh
index 8d9bce5328..5c13b2c3a3 100755
--- a/board/freescale/common/imx/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -56,6 +56,8 @@ genimage_type()
 		echo "genimage.cfg.template_imx9"
 	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y$" "${BR2_CONFIG}"; then
 		echo "genimage.cfg.template_imx9"
+	elif grep -Eq "^BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95=y$" "${BR2_CONFIG}"; then
+		echo "genimage.cfg.template_imx95"
 	elif grep -Eq "^BR2_LINUX_KERNEL_INSTALL_TARGET=y$" "${BR2_CONFIG}"; then
 		if grep -Eq "^BR2_TARGET_UBOOT_SPL=y$" "${BR2_CONFIG}"; then
 		    echo "genimage.cfg.template_no_boot_part_spl"
diff --git a/board/freescale/imx95frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx95frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..bf39f1e9c7
--- /dev/null
+++ b/board/freescale/imx95frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d7813f4ad5431edb162d6be2775bc021f9007b9c6934e977330291168523a507  imx-atf-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/imx95frdm/patches/linux-headers/linux-headers.hash b/board/freescale/imx95frdm/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx95frdm/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx95frdm/patches/linux/linux.hash b/board/freescale/imx95frdm/patches/linux/linux.hash
new file mode 100644
index 0000000000..222ec55328
--- /dev/null
+++ b/board/freescale/imx95frdm/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  a8f55764fd1418db8adfd2711c0abb7d5464a8ee1cbfd0f6878f1059ecfa1316  linux-imx-lf-6.18.20-2.0.0.tar.gz
diff --git a/board/freescale/imx95frdm/patches/uboot/0001-imx95-15x15-frdm-select-binman.patch b/board/freescale/imx95frdm/patches/uboot/0001-imx95-15x15-frdm-select-binman.patch
new file mode 100644
index 0000000000..2480a99335
--- /dev/null
+++ b/board/freescale/imx95frdm/patches/uboot/0001-imx95-15x15-frdm-select-binman.patch
@@ -0,0 +1,22 @@
+The NXP uboot-imx fork does not enable binman for the i.MX95 targets
+(NXP assembles the boot image, flash.bin, with the external imx-mkimage
+tool). Buildroot integrates the i.MX95 boot image assembly through
+U-Boot's in-tree binman instead (blob staging + pre-build hooks), so
+select BINMAN for the FRDM target.
+
+Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>
+---
+ arch/arm/mach-imx/imx9/Kconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-imx/imx9/Kconfig b/arch/arm/mach-imx/imx9/Kconfig
+--- a/arch/arm/mach-imx/imx9/Kconfig
++++ b/arch/arm/mach-imx/imx9/Kconfig
+@@ -223,6 +223,7 @@ config TARGET_IMX95_15X15_EVK
+ config TARGET_IMX95_15X15_FRDM
+ 	bool "imx95_15x15_frdm"
+ 	select IMX95
++	select BINMAN
+ 	imply BOOTSTD_BOOTCOMMAND
+ 	imply BOOTSTD_FULL
+ 
diff --git a/board/freescale/imx95frdm/patches/uboot/uboot.hash b/board/freescale/imx95frdm/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..d8267eb309
--- /dev/null
+++ b/board/freescale/imx95frdm/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  f3bccf5d960370e6d170d24a07351592399d264777e31dc689f27eebc661bf25  uboot-imx-lf_v2026.04.tar.gz
diff --git a/board/freescale/imx95frdm/readme.txt b/board/freescale/imx95frdm/readme.txt
new file mode 100644
index 0000000000..8bf70dfafe
--- /dev/null
+++ b/board/freescale/imx95frdm/readme.txt
@@ -0,0 +1,115 @@
+**********************
+NXP i.MX 95 FRDM board
+**********************
+
+This file documents the Buildroot support for the i.MX 95 FRDM
+(Freedom) board. For more information on this board, see [1].
+
+
+Boot flow / flash.bin
+=====================
+
+Unlike earlier i.MX SoCs, the i.MX 95 final boot image (flash.bin) is
+assembled by U-Boot's "binman" tool rather than by a post-image script
+calling imx-mkimage. binman gathers the following components, which
+Buildroot stages into output/images/ before U-Boot is built:
+
+  - SPL + U-Boot proper                       (uboot)
+  - ATF BL31 (bl31.bin)                        (arm-trusted-firmware)
+  - ELE container (mx95b0-ahab-container.img)  (firmware-ele-imx)
+  - LPDDR4X training (lpddr4x_*_v202409.bin)   (firmware-imx)
+  - OEI DDR init (oei-m33-ddr.bin)             (imx-oei)
+  - System Manager (m33_image.bin)             (imx-sm)
+
+The resulting flash.bin is installed to output/images/ and written to
+the SD card image at a 32 kB offset (see
+board/freescale/common/imx/genimage.cfg.template_imx95).
+
+
+Toolchain for the M33 firmware
+==============================
+
+The System Manager (imx-sm) and OEI (imx-oei) are bare-metal Cortex-M33
+firmware and CANNOT be built with Buildroot's target toolchain; they
+need an Arm GNU "arm-none-eabi" bare-metal toolchain.
+
+By default Buildroot downloads and uses this toolchain automatically
+(the version documented for the i.MX95 U-Boot build), so no manual step
+is required. If you would rather reuse a toolchain you already have,
+set BR2_PACKAGE_FREESCALE_IMX_MCORE_TOOLCHAIN_PATH to the directory that
+CONTAINS the extracted "arm-gnu-toolchain-*-x86_64-arm-none-eabi/" dir
+(it is passed as the "TOOLS" variable to imx-sm/imx-oei).
+
+The imx-sm and imx-oei sources are pinned to specific upstream commits
+(from the nxp-imx GitHub repositories) with locally computed hashes,
+matching the "branch master" instructions in the i.MX95 U-Boot docs.
+
+OEI : (Optional) Operating Environment Image
+SM : System Manager
+ELE Container : EdgeLock Enclave
+
+The ele firmware version is based on nxp imx95_evn u-boot v2026.04 doc [2] 
+
+Silicon revision
+----------------
+The defconfig targets B0 silicon (FRDM-IMX95) and uses
+mx95b0-ahab-container.img from firmware-ele-imx 2.0.2. To build for A0
+instead, set BR2_PACKAGE_IMX_OEI_REV_A0=y; this also builds
+oei-m33-tcm.bin and switches the ELE container to
+mx95a0-ahab-container.img. You must then also enable CONFIG_IMX95_A0 in
+the U-Boot configuration.
+
+
+Build
+=====
+
+First, configure Buildroot for the i.MX 95 FRDM board:
+
+    make freescale_imx95frdm_defconfig
+
+Build all components (the M33 toolchain is fetched automatically):
+
+    make
+
+When this command completes, the generated image containing everything
+to boot from the SD card is located in "output/images/sdcard.img".
+
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+    cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+    dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx95.
+
+
+Boot the i.MX 95 FRDM board
+===========================
+
+- insert the SD card in the SD slot of the board;
+- set the boot switches for SD boot (SW1[1:2] = 11 on FRDM-IMX95);
+- connect the debug USB port and open a terminal emulator at
+  115200 bps, 8n1 (the Cortex-A55 console is the first UART);
+- power on the board.
+
+Enjoy!
+
+
+References
+==========
+[1] https://www.nxp.com/FRDM-IMX95
+[2] https://docs.u-boot.org/en/v2026.04/board/nxp/imx95_evk.html?__\
+cf_chl_f_tk=1tiwEoQGthCRi80TzJXBrrR6mtlgL9gE7eIQyHYzSKU-1783004148-1.0.1.1-\
+aoHFZkl_yN9wJctxrqplXiAahRJ2qAFcPuSeny70E68
\ No newline at end of file
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 5b3f46ac74..bd89c97d0a 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -240,6 +240,31 @@ endef
 UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_FW_FILES
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN)$(BR2_PACKAGE_FIRMWARE_ELE_IMX),yy)
+UBOOT_DEPENDENCIES += firmware-ele-imx
+define UBOOT_COPY_ELE_CONTAINER
+	cp $(BINARIES_DIR)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_ELE_CONTAINER
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_SM),y)
+UBOOT_DEPENDENCIES += imx-sm
+define UBOOT_COPY_IMX_SM_FW
+	cp $(BINARIES_DIR)/m33_image.bin $(@D)/
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_SM_FW
+endif
+
+ifeq ($(BR2_PACKAGE_IMX_OEI),y)
+UBOOT_DEPENDENCIES += imx-oei
+define UBOOT_COPY_IMX_OEI_FW
+	cp $(BINARIES_DIR)/oei-m33-ddr.bin $(@D)/
+	$(if $(BR2_PACKAGE_IMX_OEI_REV_A0),cp $(BINARIES_DIR)/oei-m33-tcm.bin $(@D)/)
+endef
+UBOOT_PRE_BUILD_HOOKS += UBOOT_COPY_IMX_OEI_FW
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN),y)
 UBOOT_DEPENDENCIES += rockchip-rkbin
 define UBOOT_INSTALL_UBOOT_ROCKCHIP_BIN
diff --git a/configs/freescale_imx95frdm_defconfig b/configs/freescale_imx95frdm_defconfig
new file mode 100644
index 0000000000..febb1340c4
--- /dev/null
+++ b/configs/freescale_imx95frdm_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx95frdm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.18.20-2.0.0)/linux-imx-lf-6.18.20-2.0.0.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx95-15x15-frdm"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_IMX_OEI=y
+BR2_PACKAGE_IMX_SM=y
+BR2_PACKAGE_FREESCALE_IMX_MCORE_TOOLCHAIN_PATH=""
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.18.20-2.0.0)/imx-atf-lf-6.18.20-2.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx95"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf_v2026.04)/uboot-imx-lf_v2026.04.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx95_15x15_frdm"
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 77d6547cec..4dfd0cf3de 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -70,6 +70,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 	bool "imx93"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
+	bool "imx95"
 endchoice
 
 choice
@@ -146,6 +148,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX8ULP" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
 	default "IMX91" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 	default "IMX93" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
+	default "IMX95" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
@@ -178,12 +181,33 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_ELE
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_UPOWER
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8ULP
 
+# i.MX95 (and i.MX94) boot with a Cortex-M33 System Manager (imx-sm)
+# and Optional Early Init (imx-oei) firmware. Both are bare-metal M33
+# firmware that must be cross-compiled with an external arm-none-eabi
+# toolchain. Check Readme ref [3].
+config BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE_FIRMWARE
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
+
+config BR2_PACKAGE_FREESCALE_IMX_MCORE_TOOLCHAIN_PATH
+	string "Bare-metal arm-none-eabi toolchain directory (TOOLS)"
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE_FIRMWARE
+	help
+	  Optional. Absolute path to the directory that CONTAINS an
+	  already extracted Arm GNU bare-metal toolchain, e.g. a
+	  directory holding
+	  "arm-gnu-toolchain-<version>-x86_64-arm-none-eabi/".
+
+	  This is passed as the "TOOLS" variable to the NXP imx-sm and
+	  imx-oei build systems.
+
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
 source "package/freescale-imx/imx-kobs/Config.in"
@@ -196,6 +220,8 @@ source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-ele-imx/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
+source "package/freescale-imx/imx-oei/Config.in"
+source "package/freescale-imx/imx-sm/Config.in"
 source "package/freescale-imx/firmware-upower/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 source "package/freescale-imx/imx-seco/Config.in"
diff --git a/package/freescale-imx/firmware-ele-imx/Config.in b/package/freescale-imx/firmware-ele-imx/Config.in
index d8a55ed219..3831e4a62a 100644
--- a/package/freescale-imx/firmware-ele-imx/Config.in
+++ b/package/freescale-imx/firmware-ele-imx/Config.in
@@ -21,5 +21,7 @@ config BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE
 	default "mx93a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A0
 	default "mx93a1-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93A1
 	default "mx91a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91A0
+	default "mx95a0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95 && BR2_PACKAGE_IMX_OEI_REV_A0
+	default "mx95b0-ahab-container.img" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
 
 endif # BR2_PACKAGE_FIRMWARE_ELE_IMX
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
index 55e1864e31..6870889ec3 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a2f16e43e8aff9cf018d0962b70313940f77079b314331ab3980c4c5f44249cb  firmware-ele-imx-2.0.1-0a66c34.bin
+sha256  2d29f0a4de3662ba15f6a7d9069702d4eaed415d96a17f29d5b127f2c6fdd634  firmware-ele-imx-2.0.2-89161a8.bin
 sha256  3f4a12c82a84bd1c3578c9c986d6371a61d3399525e76288ecbbae01daf0ae26  COPYING
 sha256  38f1408d6e935c564efd9119c313269e643c1a85cab1d930c3c5bd70bc261769  EULA
 sha256  8721a617a5d4c7f366aaf857ebda21eb4c9fc9175dc92b70f627c611d403ec8e  SCR.txt
diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index 8f25f4b5b5..a95f7b0db5 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIRMWARE_ELE_IMX_VERSION = 2.0.1
-FIRMWARE_ELE_IMX_REVISION = 0a66c34
+FIRMWARE_ELE_IMX_VERSION = 2.0.2
+FIRMWARE_ELE_IMX_REVISION = 89161a8
 FIRMWARE_ELE_IMX_SITE = $(FREESCALE_IMX_SITE)
 FIRMWARE_ELE_IMX_SOURCE = firmware-ele-imx-$(FIRMWARE_ELE_IMX_VERSION)-$(FIRMWARE_ELE_IMX_REVISION).bin
 
@@ -23,6 +23,9 @@ FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_ELE
 
 define FIRMWARE_ELE_IMX_INSTALL_IMAGES_CMDS
 	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-container.img
+	# Reference it by the exact filename binman expects (e.g. mx95b0-ahab-container.img).
+	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) \
+		$(BINARIES_DIR)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE)
 endef
 
 $(eval $(generic-package))
diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
index 0acc235e0a..8e25d92652 100644
--- a/package/freescale-imx/firmware-imx/Config.in
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -62,6 +62,14 @@ config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX91
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93
 
+# On i.MX95 the final boot image (flash.bin) is assembled by U-Boot's
+# binman, which references the raw Synopsys (LP)DDR training blobs by
+# name. No host-side padding/concatenation is required, the blobs just
+# need to be made available in the binaries directory.
+config BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX95
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
+
 if BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW || BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX9
 
 choice
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
index f8c9df1cce..256771f89f 100644
--- a/package/freescale-imx/firmware-imx/firmware-imx.mk
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -149,6 +149,19 @@ define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_FIRMWARE_IMX_NEEDS_DDR_FW_IMX95),y)
+FIRMWARE_IMX_DDRFW_DIR = $(@D)/firmware/ddr/synopsys
+
+define FIRMWARE_IMX_INSTALL_IMAGE_DDR_FW
+	# i.MX95 U-Boot assembles flash.bin with binman, which references the
+	# raw Synopsys (LP)DDR training blobs by name (e.g.
+	# lpddr4x_imem_v202409.bin). binman locates them through BINMAN_INDIRS
+	# which points at the binaries directory, so simply copy them there.
+	cp $(FIRMWARE_IMX_DDRFW_DIR)/lpddr4x_*.bin $(BINARIES_DIR)/
+	cp $(FIRMWARE_IMX_DDRFW_DIR)/lpddr5_*.bin $(BINARIES_DIR)/
+endef
+endif
+
 #
 # HDMI firmware
 #
diff --git a/package/freescale-imx/imx-oei/Config.in b/package/freescale-imx/imx-oei/Config.in
new file mode 100644
index 0000000000..891a5fb0f6
--- /dev/null
+++ b/package/freescale-imx/imx-oei/Config.in
@@ -0,0 +1,48 @@
+config BR2_PACKAGE_IMX_OEI
+	bool "imx-oei"
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE_FIRMWARE
+	help
+	  NXP i.MX OEI (Optional Early Init) firmware. This is Cortex-M33
+	  firmware that performs early initialisation - most importantly
+	  LPDDR training - and is embedded into the i.MX95 boot image
+	  (flash.bin) assembled by U-Boot's binman as "oei-m33-ddr.bin"
+	  (and "oei-m33-tcm.bin" on A0 silicon).
+
+	  Building this firmware requires a bare-metal arm-none-eabi
+	  toolchain configured through
+	  BR2_PACKAGE_FREESCALE_IMX_MCORE_TOOLCHAIN_PATH.
+
+	  https://github.com/nxp-imx/imx-oei
+
+if BR2_PACKAGE_IMX_OEI
+
+config BR2_PACKAGE_IMX_OEI_BOARD
+	string "OEI board"
+	default "mx95lp4x-15" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
+	help
+	  Value passed as "board=" to the imx-oei build system. Use
+	  "mx95lp4x-15" for the 15x15 LPDDR4X EVK and FRDM-IMX95, or
+	  "mx95lp5" for the 19x19 LPDDR5 EVK.
+
+choice
+	prompt "i.MX95 silicon revision"
+	default BR2_PACKAGE_IMX_OEI_REV_B0
+	help
+	  Silicon revision of the target i.MX95. This selects the "r="
+	  argument for the OEI build and, on A0, pulls in the extra
+	  TCM OEI image.
+
+config BR2_PACKAGE_IMX_OEI_REV_B0
+	bool "B0"
+
+config BR2_PACKAGE_IMX_OEI_REV_A0
+	bool "A0"
+
+endchoice
+
+config BR2_PACKAGE_IMX_OEI_REV
+	string
+	default "B0" if BR2_PACKAGE_IMX_OEI_REV_B0
+	default "A0" if BR2_PACKAGE_IMX_OEI_REV_A0
+
+endif # BR2_PACKAGE_IMX_OEI
diff --git a/package/freescale-imx/imx-oei/imx-oei.hash b/package/freescale-imx/imx-oei/imx-oei.hash
new file mode 100644
index 0000000000..1e3c6477bb
--- /dev/null
+++ b/package/freescale-imx/imx-oei/imx-oei.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  6d6aa6380010839ffe9b6fc97b2d0406108175eeb5c46d273e9211792d04fbda  imx-oei-e9bce6f4f69dceaf3664b7e28eb4302004ee0361.tar.gz
+sha256  38e5f362f6141e65856fbfd9f3e0a1b75c897e58f08050186c6af0f6b23f6a3f  LICENSE.txt
+# Arm GNU bare-metal toolchain (host build tool, auto-downloaded)
+sha256  95c011cee430e64dd6087c75c800f04b9c49832cc1000127a92a97f9c8d83af4  arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz
diff --git a/package/freescale-imx/imx-oei/imx-oei.mk b/package/freescale-imx/imx-oei/imx-oei.mk
new file mode 100644
index 0000000000..6f6fdca0c9
--- /dev/null
+++ b/package/freescale-imx/imx-oei/imx-oei.mk
@@ -0,0 +1,55 @@
+################################################################################
+#
+# imx-oei
+#
+################################################################################
+
+IMX_OEI_VERSION = e9bce6f4f69dceaf3664b7e28eb4302004ee0361
+IMX_OEI_SITE = $(call github,nxp-imx,imx-oei,$(IMX_OEI_VERSION))
+IMX_OEI_LICENSE = BSD-3-Clause
+IMX_OEI_LICENSE_FILES = LICENSE.txt
+
+IMX_OEI_INSTALL_IMAGES = YES
+
+# imx-oei is Cortex-M33 (bare-metal) firmware and is built with an
+# external arm-none-eabi toolchain, not Buildroot's target toolchain.
+IMX_OEI_TOOLS = $(call qstrip,$(BR2_PACKAGE_FREESCALE_IMX_MCORE_TOOLCHAIN_PATH))
+IMX_OEI_BOARD = $(call qstrip,$(BR2_PACKAGE_IMX_OEI_BOARD))
+IMX_OEI_REV = $(call qstrip,$(BR2_PACKAGE_IMX_OEI_REV))
+
+IMX_OEI_MAKE_OPTS = \
+	board=$(IMX_OEI_BOARD) \
+	r=$(IMX_OEI_REV) \
+	DEBUG=1
+
+ifeq ($(IMX_OEI_TOOLS),)
+IMX_OEI_TC_VERSION = 13.3.rel1
+IMX_OEI_TC_BASE = arm-gnu-toolchain-$(IMX_OEI_TC_VERSION)-x86_64-arm-none-eabi
+IMX_OEI_TC_TARBALL = $(IMX_OEI_TC_BASE).tar.xz
+IMX_OEI_EXTRA_DOWNLOADS += https://developer.arm.com/-/media/Files/downloads/gnu/$(IMX_OEI_TC_VERSION)/binrel/$(IMX_OEI_TC_TARBALL)
+IMX_OEI_TOOLS = $(@D)/toolchain
+IMX_OEI_MAKE_OPTS += TC_VERSION=$(IMX_OEI_TC_VERSION)
+
+define IMX_OEI_EXTRACT_TOOLCHAIN
+	mkdir -p $(@D)/toolchain
+	$(XZCAT) $(IMX_OEI_DL_DIR)/$(IMX_OEI_TC_TARBALL) | \
+		$(TAR) -C $(@D)/toolchain -xf -
+endef
+IMX_OEI_PRE_BUILD_HOOKS += IMX_OEI_EXTRACT_TOOLCHAIN
+endif
+
+IMX_OEI_MAKE_OPTS += TOOLS=$(IMX_OEI_TOOLS)
+
+define IMX_OEI_BUILD_CMDS
+	$(MAKE) -C $(@D) $(IMX_OEI_MAKE_OPTS) oei=ddr all
+	$(if $(BR2_PACKAGE_IMX_OEI_REV_A0),\
+		$(MAKE) -C $(@D) $(IMX_OEI_MAKE_OPTS) oei=tcm all)
+endef
+
+define IMX_OEI_INSTALL_IMAGES_CMDS
+	cp $(@D)/build/$(IMX_OEI_BOARD)/ddr/oei-m33-ddr.bin $(BINARIES_DIR)/
+	$(if $(BR2_PACKAGE_IMX_OEI_REV_A0),\
+		cp $(@D)/build/$(IMX_OEI_BOARD)/tcm/oei-m33-tcm.bin $(BINARIES_DIR)/)
+endef
+
+$(eval $(generic-package))
diff --git a/package/freescale-imx/imx-sm/Config.in b/package/freescale-imx/imx-sm/Config.in
new file mode 100644
index 0000000000..a29791b339
--- /dev/null
+++ b/package/freescale-imx/imx-sm/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_IMX_SM
+	bool "imx-sm"
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_MCORE_FIRMWARE
+	help
+	  NXP i.MX System Manager (SM). This is Cortex-M33 firmware that
+	  acts as the trusted boot and system resource manager on i.MX95
+	  (and i.MX94). It is embedded into the boot image (flash.bin)
+	  assembled by U-Boot's binman as "m33_image.bin".
+
+	  Building this firmware requires a bare-metal arm-none-eabi
+	  toolchain configured through
+	  BR2_PACKAGE_FREESCALE_IMX_MCORE_TOOLCHAIN_PATH.
+
+	  https://github.com/nxp-imx/imx-sm
+
+if BR2_PACKAGE_IMX_SM
+
+config BR2_PACKAGE_IMX_SM_CONFIG
+	string "System Manager configuration"
+	default "mx95evk" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX95
+	help
+	  Value passed as "config=" to the imx-sm build system, selecting
+	  the resource-partitioning configuration (e.g. mx95evk, mx95alt,
+	  mx95netc). This is board/use-case specific.
+
+endif # BR2_PACKAGE_IMX_SM
diff --git a/package/freescale-imx/imx-sm/imx-sm.hash b/package/freescale-imx/imx-sm/imx-sm.hash
new file mode 100644
index 0000000000..f0fb266728
--- /dev/null
+++ b/package/freescale-imx/imx-sm/imx-sm.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  723dc93e49d4e6374a45518cb0ae23184931d92106ab8dd573d8e55df97eccf5  imx-sm-44f76dcb32945a60e08ea0133700b820349efbd3.tar.gz
+sha256  ea2ae6b89b80c3c7cd0b4d0b86d84d927e1fc3e3ef81f65e6917162f13c78542  LICENSE.txt
+# Arm GNU bare-metal toolchain (host build tool, auto-downloaded)
+sha256  95c011cee430e64dd6087c75c800f04b9c49832cc1000127a92a97f9c8d83af4  arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz
diff --git a/package/freescale-imx/imx-sm/imx-sm.mk b/package/freescale-imx/imx-sm/imx-sm.mk
new file mode 100644
index 0000000000..da45675bc1
--- /dev/null
+++ b/package/freescale-imx/imx-sm/imx-sm.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# imx-sm
+#
+################################################################################
+
+IMX_SM_VERSION = 44f76dcb32945a60e08ea0133700b820349efbd3
+IMX_SM_SITE = $(call github,nxp-imx,imx-sm,$(IMX_SM_VERSION))
+IMX_SM_LICENSE = BSD-3-Clause
+IMX_SM_LICENSE_FILES = LICENSE.txt
+
+IMX_SM_INSTALL_IMAGES = YES
+
+IMX_SM_TOOLS = $(call qstrip,$(BR2_PACKAGE_FREESCALE_IMX_MCORE_TOOLCHAIN_PATH))
+IMX_SM_CONFIG = $(call qstrip,$(BR2_PACKAGE_IMX_SM_CONFIG))
+
+IMX_SM_MAKE_OPTS = config=$(IMX_SM_CONFIG)
+
+ifeq ($(IMX_SM_TOOLS),)
+IMX_SM_TC_VERSION = 13.3.rel1
+IMX_SM_TC_BASE = arm-gnu-toolchain-$(IMX_SM_TC_VERSION)-x86_64-arm-none-eabi
+IMX_SM_TC_TARBALL = $(IMX_SM_TC_BASE).tar.xz
+IMX_SM_EXTRA_DOWNLOADS += https://developer.arm.com/-/media/Files/downloads/gnu/$(IMX_SM_TC_VERSION)/binrel/$(IMX_SM_TC_TARBALL)
+IMX_SM_TOOLS = $(@D)/toolchain
+IMX_SM_MAKE_OPTS += TC_VERSION=$(IMX_SM_TC_VERSION)
+
+define IMX_SM_EXTRACT_TOOLCHAIN
+	mkdir -p $(@D)/toolchain
+	$(XZCAT) $(IMX_SM_DL_DIR)/$(IMX_SM_TC_TARBALL) | \
+		$(TAR) -C $(@D)/toolchain -xf -
+endef
+IMX_SM_PRE_BUILD_HOOKS += IMX_SM_EXTRACT_TOOLCHAIN
+endif
+
+IMX_SM_MAKE_OPTS += TOOLS=$(IMX_SM_TOOLS)
+
+define IMX_SM_BUILD_CMDS
+	$(MAKE) -C $(@D) $(IMX_SM_MAKE_OPTS) all
+endef
+
+define IMX_SM_INSTALL_IMAGES_CMDS
+	cp $(@D)/build/$(IMX_SM_CONFIG)/m33_image.bin $(BINARIES_DIR)/
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
