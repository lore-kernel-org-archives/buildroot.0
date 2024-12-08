Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C440FE7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 14:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 443DF4075C;
	Sun,  8 Dec 2024 14:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7YRGw-kQM5dk; Sun,  8 Dec 2024 14:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57C89407B0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57C89407B0;
	Sun,  8 Dec 2024 14:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 047EBED7
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 86DB460B71
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gYVPo_Jd4wue for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 14:38:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4AFA560C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AFA560C14
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AFA560C14
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 14:38:44 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aa543c4dbadso54849766b.1
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 06:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733668722; x=1734273522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=klj0DaP6mgjOW5bP4MTD7qBWf7/qiPC3te29X5cS3zQ=;
 b=VspPj4FgoAsbv3/moKTkH2s7kDW8ck/gda+enn0qlPdnygtYWML/eDNLYQeQYGSLzH
 dQVnLmW+8a50Zsfa3pWJoiUtqoygeroawoWoF2L8DG/JljD2oR2P1GQJxyap3w5wUcmo
 EoqaOykYWKDZ8JKJXKKFpDjfRMSfjCNXDjJZZxCKKM7zs+lz5O+RoEpKfnthtxCrnLlH
 d9N7SVIFmv1/vSBF92kfOPpKM2vCXK7YScSjkV+0kaVo8s1fUUOs2Z42dchjgor2Vgly
 Ba5lsJelAluUSURFCTZwj4gjPPyR1vcZF5zg7+AidKVuOhI6Ir5sJ9E5K2MdrdUBwmQ8
 ycFA==
X-Gm-Message-State: AOJu0YxgHamsR6Xju6xU4vW9gWIBpsxxiCgZ9YfMk5uVns8uMpHirOlb
 m5nmb4vZAUcMsKjTu1hLD6rpC7paFbrjFqla/9dme+Y0lfhPWnvGa1EpxA==
X-Gm-Gg: ASbGncuGEoh/okQRp7T8L0CH6zWntO0/+Jjxb9FNQU8mFRO39Uzo3l1BL8V2vDMiFdI
 klCY4iYZsagOhAJZY10hf6Zf4bEqzuUVHKO3fB+dDaNHiA2Nar+OTlgz6Mhadvf+i9yEtg4/0Ug
 ruCOPk7E/I0LkciFnvIPegXP/KjlVbPS5KMareJ/WLw/AvuSVPbgEQTwNzYMKuLRjzhh0h4uic6
 D6Gzn4/4ByLJ7cDYg2WCt1FKCse54xLseNdjdMGAVo=
X-Google-Smtp-Source: AGHT+IG6eyfKrsLgScrP0qla8/rXwhJcMGWsIwU+07zfge3hRGv1bu+Mk5gTnR7l5OMFNWWvXzthWQ==
X-Received: by 2002:a17:907:c008:b0:aa6:79e6:5b03 with SMTP id
 a640c23a62f3a-aa679e65d87mr67905366b.6.1733668720497; 
 Sun, 08 Dec 2024 06:38:40 -0800 (PST)
Received: from skbuf.lan ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa666cf5743sm204660366b.65.2024.12.08.06.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 06:38:39 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sun,  8 Dec 2024 16:38:01 +0200
Message-ID: <20241208143802.1048266-11-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241208143802.1048266-1-olteanv@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733668722; x=1734273522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=klj0DaP6mgjOW5bP4MTD7qBWf7/qiPC3te29X5cS3zQ=;
 b=iG2DBQMNyuXMTLr5ZVYhY0QFynrocVXb0ga5xzKhtutgsDU/EEgMpyYdK4gnqitI/O
 dkg1uJT09dVdv4B30N8OwPKlKg6eyQ3qG7qCF6wR//rQMyQc4jUtJtdVtfoExq3w7Q+9
 dh9W0MIVZQwsnSYyhJ39JSe0r7wVIwKbG6n8UU455B31HbHhs/0746evB+fh7Z0QP6p9
 0dlRPKs0FxX/jCzlr68t11I0ThLd1A8r/6XuZF4jl52Thuyy7HC2uJHdIGSm7LAn2ddH
 lVK2CH4km4ocS3qqdtVvwF3UM6RQhepaEJKDTDHBjwJ9WKhb8M1GzdWT4Vt+2XyGIRbn
 rAmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iG2DBQMN
Subject: [Buildroot] [PATCH v2 10/11] board/lx2160acex7: add u-boot patches
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

The board is not supported in upstream U-Boot. Add the SolidRun patches
over NXP lf-5.15.71-2.2.0 which allow it to have a functional bootloader.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
v1->v2:
- split out from previous [PATCH 6/7] board/lx2160acex7: new platform
- update to latest lx2160a_build HEAD

 ...d-solidrun-lx2160-cex7-board-support.patch | 1342 +++++++++++++++++
 ...ait-100ms-for-Link-Up-in-ls_pcie_g4_.patch |   65 +
 ...t-100ms-for-Link-Up-in-ls_pcie_probe.patch |   64 +
 ...-calculation-of-ddr-clock-rate-to-in.patch |   63 +
 ...able-workaround-for-SPI-erratum-A-05.patch |  102 ++
 ...x2160-cex7-enable-additional-drivers.patch |   96 ++
 ...on-t-fail-boot-when-reading-eeprom-f.patch |   32 +
 ...x2160-cex7-fixup-u-boot-dts-dpmac-by.patch |  389 +++++
 ...x2160acex7-enable-reading-tlv-eeprom.patch |   40 +
 ...x2160acex7-disable-second-usb-on-lx2.patch |   32 +
 ...x2160acex7-allocate-memory-before-pa.patch |   39 +
 ...upport-specifying-tlv-eeprom-in-DT-a.patch |   58 +
 ...x2160acex7-use-dt-alias-for-tlv-eepr.patch |   90 ++
 ...om-fix-alias-access-to-second-eeprom.patch |   32 +
 14 files changed, 2444 insertions(+)
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0001-add-solidrun-lx2160-cex7-board-support.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0002-pci-ls_pcie_g4-Wait-100ms-for-Link-Up-in-ls_pcie_g4_.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0003-pci-ls_pcie-Wait-100ms-for-Link-Up-in-ls_pcie_probe.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0004-fsl-lsch3-update-calculation-of-ddr-clock-rate-to-in.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0005-armv8-lx2160a-enable-workaround-for-SPI-erratum-A-05.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0006-configs-lx2160-cex7-enable-additional-drivers.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0007-cmd-tlv_eeprom-don-t-fail-boot-when-reading-eeprom-f.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0008-board-solidrun-lx2160-cex7-fixup-u-boot-dts-dpmac-by.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0009-board-solidrun-lx2160acex7-enable-reading-tlv-eeprom.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0010-board-solidrun-lx2160acex7-disable-second-usb-on-lx2.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0011-board-solidrun-lx2160acex7-allocate-memory-before-pa.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0012-cmd-tlv_eeprom-support-specifying-tlv-eeprom-in-DT-a.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0013-board-solidrun-lx2160acex7-use-dt-alias-for-tlv-eepr.patch
 create mode 100644 board/solidrun/lx2160acex7/patches/uboot/0014-cmd-tlv_eeprom-fix-alias-access-to-second-eeprom.patch

diff --git a/board/solidrun/lx2160acex7/patches/uboot/0001-add-solidrun-lx2160-cex7-board-support.patch b/board/solidrun/lx2160acex7/patches/uboot/0001-add-solidrun-lx2160-cex7-board-support.patch
new file mode 100644
index 000000000000..93884d09a5f2
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0001-add-solidrun-lx2160-cex7-board-support.patch
@@ -0,0 +1,1342 @@
+From 9e4a5468f62cf4f639a2d6224d33f545c67d1a88 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Thu, 13 Jun 2024 17:26:47 +0200
+Subject: [PATCH] add solidrun lx2160-cex7 board support
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ arch/arm/Kconfig                              |  14 +
+ arch/arm/dts/Makefile                         |   1 +
+ arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi     |  22 ++
+ arch/arm/dts/fsl-lx2160a-cex7.dts             |  20 ++
+ arch/arm/dts/fsl-lx2160a-cex7.dtsi            | 187 ++++++++++
+ board/solidrun/lx2160acex7/Kconfig            |  15 +
+ board/solidrun/lx2160acex7/Makefile           |  10 +
+ board/solidrun/lx2160acex7/ddr.c              |  22 ++
+ board/solidrun/lx2160acex7/eth_lx2160acex7.c  |  88 +++++
+ board/solidrun/lx2160acex7/lx2160a.c          | 308 +++++++++++++++++
+ configs/lx2160acex7_tfa_SECURE_BOOT_defconfig |  86 +++++
+ configs/lx2160acex7_tfa_defconfig             |  96 ++++++
+ include/configs/lx2160acex7.h                 | 324 ++++++++++++++++++
+ scripts/config_whitelist.txt                  |   6 +
+ 14 files changed, 1199 insertions(+)
+ create mode 100644 arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi
+ create mode 100644 arch/arm/dts/fsl-lx2160a-cex7.dts
+ create mode 100644 arch/arm/dts/fsl-lx2160a-cex7.dtsi
+ create mode 100644 board/solidrun/lx2160acex7/Kconfig
+ create mode 100644 board/solidrun/lx2160acex7/Makefile
+ create mode 100644 board/solidrun/lx2160acex7/ddr.c
+ create mode 100644 board/solidrun/lx2160acex7/eth_lx2160acex7.c
+ create mode 100644 board/solidrun/lx2160acex7/lx2160a.c
+ create mode 100644 configs/lx2160acex7_tfa_SECURE_BOOT_defconfig
+ create mode 100644 configs/lx2160acex7_tfa_defconfig
+ create mode 100644 include/configs/lx2160acex7.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 39b6a2b1b5..7c51c37c93 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1375,6 +1375,19 @@ config TARGET_LS2081ARDB
+ 	  development platform that supports the QorIQ LS2081A/LS2041A
+ 	  Layerscape Architecture processor.
+ 
++config TARGET_LX2160ACEX7
++	bool "Support lx2160acex7"
++	select ARCH_LX2160A
++	select ARM64
++	select ARMV8_MULTIENTRY
++	select ARCH_SUPPORT_TFABOOT
++	select BOARD_LATE_INIT
++	help
++	  Support for SolidRun LX2160ACEX7 platform.
++	  The lx2160acex7 (LX2160A COM-Express Type 7)
++	  is a high-performance platform based on the
++	  QorIQ LX2160A Layerscape Architecture processor.
++
+ config TARGET_LX2160ARDB
+ 	bool "Support lx2160ardb"
+ 	select ARCH_LX2160A
+@@ -2261,6 +2274,7 @@ source "board/kontron/sl28/Kconfig"
+ source "board/myir/mys_6ulx/Kconfig"
+ source "board/seeed/npi_imx6ull/Kconfig"
+ source "board/socionext/developerbox/Kconfig"
++source "board/solidrun/lx2160acex7/Kconfig"
+ source "board/st/stv0991/Kconfig"
+ source "board/tcl/sl50/Kconfig"
+ source "board/toradex/colibri_pxa270/Kconfig"
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 709fdaecd7..8f6f5bf7cc 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -454,6 +454,7 @@ dtb-$(CONFIG_FSL_LSCH3) += fsl-ls2080a-qds.dtb \
+ 	fsl-ls1028a-rdb.dtb \
+ 	fsl-ls1028a-qds-duart.dtb \
+ 	fsl-ls1028a-qds-lpuart.dtb \
++	fsl-lx2160a-cex7.dtb \
+ 	fsl-lx2160a-rdb.dtb \
+ 	fsl-lx2160a-qds.dtb \
+ 	fsl-lx2160a-qds-3-x-x.dtb \
+diff --git a/arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi b/arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi
+new file mode 100644
+index 0000000000..9855fcb31c
+--- /dev/null
++++ b/arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi
+@@ -0,0 +1,22 @@
++// SPDX-License-Identifier: GPL-2.0+
++
++/ {
++	fanctrl-override {
++		compatible = "solidrun,lx2160acex7-fanctrl-override";
++		override-gpios = <&gpio2 2 0>;
++	};
++};
++
++&i2c0 {
++	u-boot,dm-pre-reloc;
++
++	i2c-mux@77 {
++		u-boot,dm-pre-reloc;
++
++		i2c@0 {
++			eeprom@57 {
++				u-boot,dm-pre-reloc;
++			};
++		};
++	};
++};
+diff --git a/arch/arm/dts/fsl-lx2160a-cex7.dts b/arch/arm/dts/fsl-lx2160a-cex7.dts
+new file mode 100644
+index 0000000000..60f99f143c
+--- /dev/null
++++ b/arch/arm/dts/fsl-lx2160a-cex7.dts
+@@ -0,0 +1,20 @@
++// SPDX-License-Identifier: (GPL-2.0 OR MIT)
++/*
++ * Device Tree file for LX2160A-CEx7 Standalone (Generic Carrier Board)
++ *
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
++ */
++
++#include "fsl-lx2160a-cex7.dtsi"
++
++&dpmac17 {
++	status = "okay";
++};
++
++&esdhc0 {
++	sd-uhs-sdr104;
++	sd-uhs-sdr50;
++	sd-uhs-sdr25;
++	sd-uhs-sdr12;
++	status = "okay";
++};
+diff --git a/arch/arm/dts/fsl-lx2160a-cex7.dtsi b/arch/arm/dts/fsl-lx2160a-cex7.dtsi
+new file mode 100644
+index 0000000000..d32a52ab00
+--- /dev/null
++++ b/arch/arm/dts/fsl-lx2160a-cex7.dtsi
+@@ -0,0 +1,187 @@
++// SPDX-License-Identifier: (GPL-2.0 OR MIT)
++//
++// Device Tree file for LX2160A-CEx7
++//
++// Copyright 2019 SolidRun Ltd.
++
++/dts-v1/;
++
++#include "fsl-lx2160a.dtsi"
++
++/ {
++	model = "SolidRun LX2160A COM Express Type 7 module";
++	compatible = "solidrun,lx2160a-cex7", "fsl,lx2160a";
++
++	aliases {
++		crypto = &crypto;
++	};
++
++	sb_3v3: regulator-sb3v3 {
++		compatible = "regulator-fixed";
++		regulator-name = "RT7290";
++		regulator-min-microvolt = <3300000>;
++		regulator-max-microvolt = <3300000>;
++		regulator-boot-on;
++		regulator-always-on;
++	};
++};
++
++&crypto {
++	status = "okay";
++};
++
++&dpmac17 {
++	phy-handle = <&rgmii_phy1>;
++	phy-connection-type = "rgmii-id";
++};
++
++&emdio1 {
++	status = "okay";
++
++	rgmii_phy1: ethernet-phy@1 {
++		reg = <1>;
++		qca,smarteee-tw-us-1g = <24>;
++	};
++};
++
++&esdhc1 {
++	mmc-hs200-1_8v;
++	mmc-hs400-1_8v;
++	bus-width = <8>;
++	status = "okay";
++};
++
++&i2c0 {
++	status = "okay";
++
++	i2c-mux@77 {
++		compatible = "nxp,pca9547";
++		#address-cells = <1>;
++		#size-cells = <0>;
++		reg = <0x77>;
++
++		i2c@0 {
++			#address-cells = <1>;
++			#size-cells = <0>;
++			reg = <0>;
++
++			eeprom@50 {
++				compatible = "atmel,24c512";
++				reg = <0x50>;
++			};
++
++			eeprom@51 {
++				compatible = "atmel,spd";
++				reg = <0x51>;
++			};
++
++			eeprom@53 {
++				compatible = "atmel,spd";
++				reg = <0x53>;
++			};
++
++			eeprom@57 {
++				compatible = "atmel,24c02";
++				reg = <0x57>;
++			};
++		};
++
++		i2c@1 {
++			#address-cells = <1>;
++			#size-cells = <0>;
++			reg = <1>;
++
++			fan-temperature-ctrlr@18 {
++				compatible = "ti,amc6821";
++				reg = <0x18>;
++				cooling-min-state = <0>;
++				cooling-max-state = <9>;
++				#cooling-cells = <2>;
++			};
++		};
++
++		i2c@2 {
++			#address-cells = <1>;
++			#size-cells = <0>;
++			reg = <2>;
++
++			regulator@5c {
++				compatible = "lltc,ltc3882";
++				reg = <0x5c>;
++			};
++		};
++
++		i2c@3 {
++			#address-cells = <1>;
++			#size-cells = <0>;
++			reg = <3>;
++
++			temperature-sensor@48 {
++				compatible = "nxp,sa56004";
++				reg = <0x48>;
++				vcc-supply = <&sb_3v3>;
++			};
++		};
++
++		sfp0_i2c: i2c@4 {
++			#address-cells = <1>;
++			#size-cells = <0>;
++			reg = <4>;
++		};
++
++		sfp1_i2c: i2c@5 {
++			#address-cells = <1>;
++			#size-cells = <0>;
++			reg = <5>;
++		};
++
++		sfp2_i2c: i2c@6 {
++			#address-cells = <1>;
++			#size-cells = <0>;
++			reg = <6>;
++		};
++
++		sfp3_i2c: i2c@7 {
++			#address-cells = <1>;
++			#size-cells = <0>;
++			reg = <7>;
++		};
++	};
++};
++
++&i2c2 {
++	status = "okay";
++};
++
++&i2c4 {
++	status = "okay";
++
++	rtc@51 {
++		compatible = "nxp,pcf2129";
++		reg = <0x51>;
++	};
++};
++
++&fspi {
++	status = "okay";
++
++	flash@0 {
++		#address-cells = <1>;
++		#size-cells = <1>;
++		compatible = "micron,m25p80";
++		m25p,fast-read;
++		spi-max-frequency = <50000000>;
++		reg = <0>;
++		/* The following setting enables 1-1-8 (CMD-ADDR-DATA) mode */
++		spi-rx-bus-width = <8>;
++		spi-tx-bus-width = <1>;
++	};
++};
++
++&usb0 {
++	status = "okay";
++};
++
++&usb1 {
++	status = "okay";
++};
+diff --git a/board/solidrun/lx2160acex7/Kconfig b/board/solidrun/lx2160acex7/Kconfig
+new file mode 100644
+index 0000000000..85673846a4
+--- /dev/null
++++ b/board/solidrun/lx2160acex7/Kconfig
+@@ -0,0 +1,15 @@
++if TARGET_LX2160ACEX7
++
++config SYS_BOARD
++	default "lx2160acex7"
++
++config SYS_VENDOR
++	default "solidrun"
++
++config SYS_SOC
++	default "fsl-layerscape"
++
++config SYS_CONFIG_NAME
++	default "lx2160acex7"
++
++endif
+diff --git a/board/solidrun/lx2160acex7/Makefile b/board/solidrun/lx2160acex7/Makefile
+new file mode 100644
+index 0000000000..4a3b039a5c
+--- /dev/null
++++ b/board/solidrun/lx2160acex7/Makefile
+@@ -0,0 +1,10 @@
++#
++# Copyright 2018 Freescale Semiconductor
++# Copyright 2024 Josua Mayer <josua@solid-run.com>
++#
++# SPDX-License-Identifier:	GPL-2.0+
++#
++
++obj-y += lx2160a.o
++obj-y += ddr.o
++obj-$(CONFIG_TARGET_LX2160ACEX7) += eth_lx2160acex7.o
+diff --git a/board/solidrun/lx2160acex7/ddr.c b/board/solidrun/lx2160acex7/ddr.c
+new file mode 100644
+index 0000000000..d872e57530
+--- /dev/null
++++ b/board/solidrun/lx2160acex7/ddr.c
+@@ -0,0 +1,22 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2018 NXP
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
++ */
++
++#include <common.h>
++#include <fsl_ddr_sdram.h>
++#include <fsl_ddr_dimm_params.h>
++#include <asm/global_data.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++int fsl_initdram(void)
++{
++	gd->ram_size = tfa_get_dram_size();
++
++	if (!gd->ram_size)
++		gd->ram_size = fsl_ddr_sdram_size();
++
++	return 0;
++}
+diff --git a/board/solidrun/lx2160acex7/eth_lx2160acex7.c b/board/solidrun/lx2160acex7/eth_lx2160acex7.c
+new file mode 100644
+index 0000000000..d2c68d3424
+--- /dev/null
++++ b/board/solidrun/lx2160acex7/eth_lx2160acex7.c
+@@ -0,0 +1,88 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2018-2021 NXP
++ *
++ */
++
++#include <common.h>
++#include <asm/io.h>
++#include <command.h>
++#include <fm_eth.h>
++#include <fsl_mdio.h>
++#include <fsl-mc/fsl_mc.h>
++#include <fsl-mc/ldpaa_wriop.h>
++#include <netdev.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++int board_eth_init(struct bd_info *bis)
++{
++#if defined(CONFIG_FSL_MC_ENET)
++	struct memac_mdio_info mdio_info;
++	struct memac_mdio_controller *reg;
++	int i, interface;
++	struct mii_dev *dev;
++	struct ccsr_gur *gur = (void *)(CONFIG_SYS_FSL_GUTS_ADDR);
++	u32 srds_s1;
++
++	srds_s1 = in_le32(&gur->rcwsr[28]) &
++				FSL_CHASSIS3_RCWSR28_SRDS1_PRTCL_MASK;
++	srds_s1 >>= FSL_CHASSIS3_RCWSR28_SRDS1_PRTCL_SHIFT;
++
++	reg = (struct memac_mdio_controller *)CONFIG_SYS_FSL_WRIOP1_MDIO1;
++	mdio_info.regs = reg;
++	mdio_info.name = DEFAULT_WRIOP_MDIO1_NAME;
++
++	/* Register the EMI 1 */
++	fm_memac_mdio_init(bis, &mdio_info);
++
++	switch (srds_s1) {
++	case 8:
++		wriop_set_phy_address(WRIOP1_DPMAC17, 0, RGMII_PHY_ADDR1);
++		break;
++
++	default:
++		printf("SerDes1 protocol 0x%x is not supported on LX2160ACEX7\n",
++		       srds_s1);
++		goto next;
++	}
++
++	for (i = WRIOP1_DPMAC17; i <= WRIOP1_DPMAC17; i++) {
++		interface = wriop_get_enet_if(i);
++		switch (interface) {
++		case PHY_INTERFACE_MODE_RGMII:
++		case PHY_INTERFACE_MODE_RGMII_ID:
++			dev = miiphy_get_dev_by_name(DEFAULT_WRIOP_MDIO1_NAME);
++			wriop_set_mdio(i, dev);
++			break;
++		default:
++			break;
++		}
++	}
++
++next:
++	cpu_eth_init(bis);
++#endif /* CONFIG_FSL_MC_ENET */
++
++	return pci_eth_init(bis);
++}
++
++#if defined(CONFIG_RESET_PHY_R)
++void reset_phy(void)
++{
++#if defined(CONFIG_FSL_MC_ENET)
++	mc_env_boot();
++#endif
++}
++#endif /* CONFIG_RESET_PHY_R */
++
++int mac_read_from_eeprom(void)
++{
++	return 0;
++}
++
++int do_mac(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
++{
++	puts("Not implemented.\n");
++	return CMD_RET_FAILURE;
++}
+diff --git a/board/solidrun/lx2160acex7/lx2160a.c b/board/solidrun/lx2160acex7/lx2160a.c
+new file mode 100644
+index 0000000000..08fa607067
+--- /dev/null
++++ b/board/solidrun/lx2160acex7/lx2160a.c
+@@ -0,0 +1,308 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * Copyright 2018-2021 NXP
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
++ */
++
++#include <common.h>
++#include <asm/arch/clock.h>
++#include <asm/arch-fsl-layerscape/fsl_icid.h>
++#include <asm/arch/soc.h>
++#include <asm/gpio.h>
++#include <clock_legacy.h>
++#include <dm.h>
++#include <dm/platform_data/serial_pl01x.h>
++#include <fdt_support.h>
++#include <fsl-mc/fsl_mc.h>
++#include <fsl_ddr.h>
++#include <init.h>
++#include <malloc.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++static struct pl01x_serial_plat serial0 = {
++#if CONFIG_CONS_INDEX == 0
++	.base = CONFIG_SYS_SERIAL0,
++#elif CONFIG_CONS_INDEX == 1
++	.base = CONFIG_SYS_SERIAL1,
++#else
++#error "Unsupported console index value."
++#endif
++	.type = TYPE_PL011,
++};
++
++U_BOOT_DRVINFO(nxp_serial0) = {
++	.name = "serial_pl01x",
++	.plat = &serial0,
++};
++
++static struct pl01x_serial_plat serial1 = {
++	.base = CONFIG_SYS_SERIAL1,
++	.type = TYPE_PL011,
++};
++
++U_BOOT_DRVINFO(nxp_serial1) = {
++	.name = "serial_pl01x",
++	.plat = &serial1,
++};
++
++static void uart_get_clock(void)
++{
++	serial0.clock = get_serial_clock();
++	serial1.clock = get_serial_clock();
++}
++
++int board_early_init_f(void)
++{
++#ifdef CONFIG_SYS_I2C_EARLY_INIT
++	i2c_early_init_f();
++#endif
++	/* get required clock for UART IP */
++	uart_get_clock();
++
++	fsl_lsch3_early_init_f();
++	return 0;
++}
++
++#ifdef CONFIG_OF_BOARD_FIXUP
++int board_fix_fdt(void *fdt)
++{
++	char *reg_names, *reg_name;
++	int names_len, old_name_len, new_name_len, remaining_names_len;
++	struct str_map {
++		char *old_str;
++		char *new_str;
++	} reg_names_map[] = {
++		{ "ccsr", "dbi" },
++		{ "pf_ctrl", "ctrl" }
++	};
++	int off = -1, i = 0;
++
++	if (IS_SVR_REV(get_svr(), 1, 0))
++		return 0;
++
++	off = fdt_node_offset_by_compatible(fdt, -1, "fsl,lx2160a-pcie");
++	while (off != -FDT_ERR_NOTFOUND) {
++		fdt_setprop(fdt, off, "compatible", "fsl,ls-pcie",
++			    strlen("fsl,ls-pcie") + 1);
++
++		reg_names = (char *)fdt_getprop(fdt, off, "reg-names",
++						&names_len);
++		if (!reg_names)
++			continue;
++
++		reg_name = reg_names;
++		remaining_names_len = names_len - (reg_name - reg_names);
++		i = 0;
++		while ((i < ARRAY_SIZE(reg_names_map)) && remaining_names_len) {
++			old_name_len = strlen(reg_names_map[i].old_str);
++			new_name_len = strlen(reg_names_map[i].new_str);
++			if (memcmp(reg_name, reg_names_map[i].old_str,
++				   old_name_len) == 0) {
++				/* first only leave required bytes for new_str
++				 * and copy rest of the string after it
++				 */
++				memcpy(reg_name + new_name_len,
++				       reg_name + old_name_len,
++				       remaining_names_len - old_name_len);
++				/* Now copy new_str */
++				memcpy(reg_name, reg_names_map[i].new_str,
++				       new_name_len);
++				names_len -= old_name_len;
++				names_len += new_name_len;
++				i++;
++			}
++
++			reg_name = memchr(reg_name, '\0', remaining_names_len);
++			if (!reg_name)
++				break;
++
++			reg_name += 1;
++
++			remaining_names_len = names_len -
++					      (reg_name - reg_names);
++		}
++
++		fdt_setprop(fdt, off, "reg-names", reg_names, names_len);
++		off = fdt_node_offset_by_compatible(fdt, off,
++						    "fsl,lx2160a-pcie");
++	}
++
++	return 0;
++}
++#endif
++
++int esdhc_status_fixup(void *blob, const char *compat)
++{
++	/* Enable both esdhc DT nodes for LX2160ARDB */
++	do_fixup_by_compat(blob, compat, "status", "okay",
++			   sizeof("okay"), 1);
++
++	return 0;
++}
++
++int checkboard(void)
++{
++	enum boot_src src = get_boot_src();
++	char buf[64];
++
++	cpu_name(buf);
++	printf("Board: LX2160A-CEX7, %s, boot from ", buf);
++
++	if (src == BOOT_SOURCE_SD_MMC) {
++		puts("SD\n");
++	} else if (src == BOOT_SOURCE_SD_MMC2) {
++		puts("eMMC\n");
++	} else if (src == BOOT_SOURCE_XSPI_NOR) {
++		puts("FlexSPI\n");
++	}
++
++	return 0;
++}
++
++int config_board_mux(void)
++{
++	return 0;
++}
++
++unsigned long get_board_sys_clk(void)
++{
++	return 100000000;
++}
++
++unsigned long get_board_ddr_clk(void)
++{
++	return 100000000;
++}
++
++int board_init(void)
++{
++#ifdef CONFIG_ENV_IS_NOWHERE
++	gd->env_addr = (ulong)&default_environment[0];
++#endif
++
++#if !defined(CONFIG_SYS_EARLY_PCI_INIT) && defined(CONFIG_DM_ETH)
++	pci_init();
++#endif
++	return 0;
++}
++
++void detail_board_ddr_info(void)
++{
++	int i;
++	u64 ddr_size = 0;
++
++	puts("\nDDR    ");
++	for (i = 0; i < CONFIG_NR_DRAM_BANKS; i++)
++		ddr_size += gd->bd->bi_dram[i].size;
++	print_size(ddr_size, "");
++	print_ddr_info(0);
++}
++
++#ifdef CONFIG_MISC_INIT_R
++int misc_init_r(void)
++{
++	config_board_mux();
++
++	return 0;
++}
++#endif
++
++#ifdef CONFIG_FSL_MC_ENET
++void fdt_fixup_board_enet(void *fdt)
++{
++	int offset;
++
++	offset = fdt_path_offset(fdt, "/soc/fsl-mc");
++
++	if (offset < 0)
++		offset = fdt_path_offset(fdt, "/fsl-mc");
++
++	if (offset < 0) {
++		printf("%s: fsl-mc node not found in device tree (error %d)\n",
++		       __func__, offset);
++		return;
++	}
++
++	if (get_mc_boot_status() == 0 &&
++	    (is_lazy_dpl_addr_valid() || get_dpl_apply_status() == 0)) {
++		fdt_status_okay(fdt, offset);
++	} else {
++		fdt_status_fail(fdt, offset);
++	}
++}
++
++void board_quiesce_devices(void)
++{
++	fsl_mc_ldpaa_exit(gd->bd);
++}
++#endif
++
++#ifdef CONFIG_OF_BOARD_SETUP
++int ft_board_setup(void *blob, struct bd_info *bd)
++{
++	int i;
++	u16 mc_memory_bank = 0;
++
++	u64 *base;
++	u64 *size;
++	u64 mc_memory_base = 0;
++	u64 mc_memory_size = 0;
++	u16 total_memory_banks;
++
++	ft_cpu_setup(blob, bd);
++
++	fdt_fixup_mc_ddr(&mc_memory_base, &mc_memory_size);
++
++	if (mc_memory_base != 0)
++		mc_memory_bank++;
++
++	total_memory_banks = CONFIG_NR_DRAM_BANKS + mc_memory_bank;
++
++	base = calloc(total_memory_banks, sizeof(u64));
++	size = calloc(total_memory_banks, sizeof(u64));
++
++	/* fixup DT for the three GPP DDR banks */
++	for (i = 0; i < CONFIG_NR_DRAM_BANKS; i++) {
++		base[i] = gd->bd->bi_dram[i].start;
++		size[i] = gd->bd->bi_dram[i].size;
++	}
++
++#ifdef CONFIG_RESV_RAM
++	/* reduce size if reserved memory is within this bank */
++	if (gd->arch.resv_ram >= base[0] &&
++	    gd->arch.resv_ram < base[0] + size[0])
++		size[0] = gd->arch.resv_ram - base[0];
++	else if (gd->arch.resv_ram >= base[1] &&
++		 gd->arch.resv_ram < base[1] + size[1])
++		size[1] = gd->arch.resv_ram - base[1];
++	else if (gd->arch.resv_ram >= base[2] &&
++		 gd->arch.resv_ram < base[2] + size[2])
++		size[2] = gd->arch.resv_ram - base[2];
++#endif
++
++	if (mc_memory_base != 0) {
++		for (i = 0; i <= total_memory_banks; i++) {
++			if (base[i] == 0 && size[i] == 0) {
++				base[i] = mc_memory_base;
++				size[i] = mc_memory_size;
++				break;
++			}
++		}
++	}
++
++	fdt_fixup_memory_banks(blob, base, size, total_memory_banks);
++
++#ifdef CONFIG_USB
++	fsl_fdt_fixup_dr_usb(blob, bd);
++#endif
++
++#ifdef CONFIG_FSL_MC_ENET
++	fdt_fsl_mc_fixup_iommu_map_entry(blob);
++	fdt_fixup_board_enet(blob);
++#endif
++	fdt_fixup_icid(blob);
++
++	return 0;
++}
++#endif
+diff --git a/configs/lx2160acex7_tfa_SECURE_BOOT_defconfig b/configs/lx2160acex7_tfa_SECURE_BOOT_defconfig
+new file mode 100644
+index 0000000000..12f236aad0
+--- /dev/null
++++ b/configs/lx2160acex7_tfa_SECURE_BOOT_defconfig
+@@ -0,0 +1,86 @@
++CONFIG_ARM=y
++CONFIG_SKIP_LOWLEVEL_INIT=y
++CONFIG_GIC_V3_ITS=y
++CONFIG_TARGET_LX2160ACEX7=y
++CONFIG_TFABOOT=y
++CONFIG_SYS_TEXT_BASE=0x82000000
++CONFIG_SYS_MALLOC_LEN=0x202000
++CONFIG_SYS_MALLOC_F_LEN=0x6000
++CONFIG_NR_DRAM_BANKS=3
++CONFIG_ENV_SIZE=0x2000
++CONFIG_NXP_ESBC=y
++CONFIG_DM_GPIO=y
++CONFIG_DEFAULT_DEVICE_TREE="fsl-lx2160a-cex7"
++CONFIG_FSPI_AHB_EN_4BYTE=y
++CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
++CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
++CONFIG_AHCI=y
++CONFIG_OF_BOARD_FIXUP=y
++CONFIG_REMAKE_ELF=y
++CONFIG_MP=y
++CONFIG_FIT_VERBOSE=y
++CONFIG_OF_BOARD_SETUP=y
++CONFIG_OF_STDOUT_VIA_ALIAS=y
++CONFIG_DYNAMIC_SYS_CLK_FREQ=y
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0,115200 root=/dev/ram0 earlycon=pl011,mmio32,0x21c0000 ramdisk_size=0x2000000 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf"
++CONFIG_DEFAULT_FDT_FILE="freescale/fsl-lx2160a-clearfog-cx.dtb"
++CONFIG_MISC_INIT_R=y
++CONFIG_CMD_GREPENV=y
++CONFIG_CMD_EEPROM=y
++CONFIG_SYS_EEPROM_PAGE_WRITE_BITS=3
++CONFIG_SYS_EEPROM_PAGE_WRITE_DELAY_MS=5
++CONFIG_CMD_DM=y
++CONFIG_CMD_GPIO=y
++CONFIG_CMD_GPT=y
++CONFIG_CMD_I2C=y
++CONFIG_CMD_MMC=y
++CONFIG_CMD_PCI=y
++CONFIG_CMD_USB=y
++CONFIG_CMD_CACHE=y
++CONFIG_OF_CONTROL=y
++CONFIG_ENV_OVERWRITE=y
++CONFIG_NET_RANDOM_ETHADDR=y
++CONFIG_DM=y
++CONFIG_SATA=y
++CONFIG_SATA_CEVA=y
++CONFIG_DYNAMIC_DDR_CLK_FREQ=y
++CONFIG_DDR_ECC=y
++CONFIG_ECC_INIT_VIA_DDRCONTROLLER=y
++CONFIG_MPC8XXX_GPIO=y
++CONFIG_DM_I2C=y
++CONFIG_I2C_SET_DEFAULT_BUS_NUM=y
++CONFIG_SYS_I2C_EEPROM_ADDR=0x57
++CONFIG_MMC_HS400_SUPPORT=y
++CONFIG_FSL_ESDHC=y
++CONFIG_MTD=y
++CONFIG_DM_SPI_FLASH=y
++CONFIG_SPI_FLASH_STMICRO=y
++CONFIG_SPI_FLASH_MT35XU=y
++# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
++CONFIG_PHYLIB=y
++CONFIG_PHY_ATHEROS=y
++CONFIG_DM_ETH=y
++CONFIG_DM_MDIO=y
++CONFIG_E1000=y
++CONFIG_MII=y
++CONFIG_FSL_LS_MDIO=y
++CONFIG_NVME_PCI=y
++CONFIG_PCI=y
++CONFIG_PCIE_LAYERSCAPE_RC=y
++CONFIG_PCIE_LAYERSCAPE_GEN4=y
++CONFIG_DM_RTC=y
++CONFIG_RTC_PCF2127=y
++CONFIG_DM_SCSI=y
++CONFIG_DM_SERIAL=y
++CONFIG_PL01X_SERIAL=y
++CONFIG_SPI=y
++CONFIG_DM_SPI=y
++CONFIG_NXP_FSPI=y
++CONFIG_USB=y
++CONFIG_USB_XHCI_HCD=y
++CONFIG_USB_XHCI_DWC3=y
++CONFIG_RSA=y
++CONFIG_SPL_RSA=y
++CONFIG_RSA_SOFTWARE_EXP=y
++CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
+diff --git a/configs/lx2160acex7_tfa_defconfig b/configs/lx2160acex7_tfa_defconfig
+new file mode 100644
+index 0000000000..9f24e12a85
+--- /dev/null
++++ b/configs/lx2160acex7_tfa_defconfig
+@@ -0,0 +1,96 @@
++CONFIG_ARM=y
++CONFIG_SKIP_LOWLEVEL_INIT=y
++CONFIG_GIC_V3_ITS=y
++CONFIG_TARGET_LX2160ACEX7=y
++CONFIG_TFABOOT=y
++CONFIG_SYS_TEXT_BASE=0x82000000
++CONFIG_SYS_MALLOC_LEN=0x202000
++CONFIG_SYS_MALLOC_F_LEN=0x6000
++CONFIG_NR_DRAM_BANKS=3
++CONFIG_ENV_SIZE=0x2000
++CONFIG_ENV_OFFSET=0x500000
++CONFIG_ENV_SECT_SIZE=0x20000
++CONFIG_DM_GPIO=y
++CONFIG_DEFAULT_DEVICE_TREE="fsl-lx2160a-cex7"
++CONFIG_FSPI_AHB_EN_4BYTE=y
++CONFIG_ARMV8_SEC_FIRMWARE_SUPPORT=y
++CONFIG_SEC_FIRMWARE_ARMV8_PSCI=y
++CONFIG_AHCI=y
++CONFIG_OF_BOARD_FIXUP=y
++CONFIG_REMAKE_ELF=y
++CONFIG_MP=y
++CONFIG_FIT_VERBOSE=y
++CONFIG_OF_BOARD_SETUP=y
++CONFIG_OF_STDOUT_VIA_ALIAS=y
++CONFIG_DYNAMIC_SYS_CLK_FREQ=y
++CONFIG_BOOTDELAY=10
++CONFIG_USE_BOOTARGS=y
++CONFIG_BOOTARGS="console=ttyAMA0,115200 root=/dev/ram0 earlycon=pl011,mmio32,0x21c0000 ramdisk_size=0x2000000 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf"
++CONFIG_DEFAULT_FDT_FILE="freescale/fsl-lx2160a-clearfog-cx.dtb"
++CONFIG_MISC_INIT_R=y
++CONFIG_CMD_GREPENV=y
++CONFIG_CMD_EEPROM=y
++CONFIG_SYS_EEPROM_PAGE_WRITE_BITS=3
++CONFIG_SYS_EEPROM_PAGE_WRITE_DELAY_MS=5
++CONFIG_CMD_DM=y
++CONFIG_CMD_GPIO=y
++CONFIG_CMD_GPT=y
++CONFIG_CMD_I2C=y
++CONFIG_CMD_MMC=y
++CONFIG_CMD_OPTEE_RPMB=y
++CONFIG_CMD_PCI=y
++CONFIG_CMD_USB=y
++CONFIG_CMD_WDT=y
++CONFIG_CMD_CACHE=y
++CONFIG_OF_CONTROL=y
++CONFIG_ENV_OVERWRITE=y
++CONFIG_ENV_IS_IN_MMC=y
++CONFIG_ENV_IS_IN_SPI_FLASH=y
++CONFIG_ENV_ADDR=0x20500000
++CONFIG_NET_RANDOM_ETHADDR=y
++CONFIG_DM=y
++CONFIG_SATA=y
++CONFIG_SATA_CEVA=y
++CONFIG_FSL_CAAM=y
++CONFIG_DYNAMIC_DDR_CLK_FREQ=y
++CONFIG_DDR_ECC=y
++CONFIG_ECC_INIT_VIA_DDRCONTROLLER=y
++CONFIG_MPC8XXX_GPIO=y
++CONFIG_DM_I2C=y
++CONFIG_I2C_SET_DEFAULT_BUS_NUM=y
++CONFIG_SYS_I2C_EEPROM_ADDR=0x57
++CONFIG_SUPPORT_EMMC_RPMB=y
++CONFIG_MMC_HS400_SUPPORT=y
++CONFIG_FSL_ESDHC=y
++CONFIG_MTD=y
++CONFIG_DM_SPI_FLASH=y
++CONFIG_SPI_FLASH_STMICRO=y
++CONFIG_SPI_FLASH_MT35XU=y
++# CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
++CONFIG_PHYLIB=y
++CONFIG_PHY_ATHEROS=y
++CONFIG_DM_ETH=y
++CONFIG_DM_MDIO=y
++CONFIG_E1000=y
++CONFIG_MII=y
++CONFIG_FSL_LS_MDIO=y
++CONFIG_NVME_PCI=y
++CONFIG_PCI=y
++CONFIG_PCIE_LAYERSCAPE_RC=y
++CONFIG_PCIE_LAYERSCAPE_GEN4=y
++CONFIG_DM_RTC=y
++CONFIG_RTC_PCF2127=y
++CONFIG_DM_SCSI=y
++CONFIG_DM_SERIAL=y
++CONFIG_PL01X_SERIAL=y
++CONFIG_SPI=y
++CONFIG_DM_SPI=y
++CONFIG_NXP_FSPI=y
++CONFIG_TEE=y
++CONFIG_OPTEE=y
++CONFIG_USB=y
++CONFIG_USB_XHCI_HCD=y
++CONFIG_USB_XHCI_DWC3=y
++CONFIG_WDT=y
++CONFIG_WDT_SBSA=y
++CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
+diff --git a/include/configs/lx2160acex7.h b/include/configs/lx2160acex7.h
+new file mode 100644
+index 0000000000..83f64e65a8
+--- /dev/null
++++ b/include/configs/lx2160acex7.h
+@@ -0,0 +1,324 @@
++/* SPDX-License-Identifier: GPL-2.0+ */
++/*
++ * Copyright 2018-2022 NXP
++ * Copyright 2024 Josua Mayer <josua@solid-run.com>
++ */
++
++#ifndef __CONFIG_LX2160ACEX7_H
++#define __CONFIG_LX2160ACEX7_H
++
++#include <asm/arch/stream_id_lsch3.h>
++#include <asm/arch/config.h>
++#include <asm/arch/soc.h>
++
++#define CONFIG_FSL_MEMAC
++
++#define CONFIG_SYS_INIT_SP_ADDR		CONFIG_SYS_TEXT_BASE
++#define CONFIG_SYS_FLASH_BASE		0x20000000
++
++/* DDR */
++#define CONFIG_SYS_FSL_DDR_INTLV_256B	/* force 256 byte interleaving */
++#define CONFIG_VERY_BIG_RAM
++#define CONFIG_SYS_DDR_SDRAM_BASE		0x80000000UL
++#define CONFIG_SYS_FSL_DDR_SDRAM_BASE_PHY	0
++#define CONFIG_SYS_DDR_BLOCK2_BASE		0x2080000000ULL
++#define CONFIG_SYS_FSL_DDR_MAIN_NUM_CTRLS	2
++#define CONFIG_SYS_SDRAM_SIZE			0x200000000UL
++#define CONFIG_SYS_SDRAM_BASE		CONFIG_SYS_DDR_SDRAM_BASE
++#define CONFIG_MEM_INIT_VALUE		0xdeadbeef
++#define SPD_EEPROM_ADDRESS1		0x51
++#define SPD_EEPROM_ADDRESS2		0x52
++#define SPD_EEPROM_ADDRESS3		0x53
++#define SPD_EEPROM_ADDRESS4		0x54
++#define SPD_EEPROM_ADDRESS5		0x55
++#define SPD_EEPROM_ADDRESS6		0x56
++#define SPD_EEPROM_ADDRESS		SPD_EEPROM_ADDRESS1
++#define CONFIG_SYS_SPD_BUS_NUM		0	/* SPD on I2C bus 0 */
++#define CONFIG_DIMM_SLOTS_PER_CTLR	1
++#define CONFIG_CHIP_SELECTS_PER_CTRL	4
++#define CONFIG_SYS_MONITOR_LEN		(936 * 1024)
++
++/* SMP Definitinos  */
++#define CPU_RELEASE_ADDR		secondary_boot_addr
++
++/* Generic Timer Definitions */
++/*
++ * This is not an accurate number. It is used in start.S. The frequency
++ * will be udpated later when get_bus_freq(0) is available.
++ */
++
++#define COUNTER_FREQUENCY		25000000	/* 25MHz */
++
++/* Serial Port */
++#define CONFIG_PL011_CLOCK		(get_bus_freq(0) / 4)
++#define CONFIG_SYS_SERIAL0		0x21c0000
++#define CONFIG_SYS_SERIAL1		0x21d0000
++#define CONFIG_SYS_SERIAL2		0x21e0000
++#define CONFIG_SYS_SERIAL3		0x21f0000
++/*below might needs to be removed*/
++#define CONFIG_PL01x_PORTS		{(void *)CONFIG_SYS_SERIAL0, \
++					(void *)CONFIG_SYS_SERIAL1, \
++					(void *)CONFIG_SYS_SERIAL2, \
++					(void *)CONFIG_SYS_SERIAL3 }
++
++/* MC firmware */
++#define CONFIG_SYS_LS_MC_DPC_MAX_LENGTH		0x20000
++#define CONFIG_SYS_LS_MC_DRAM_DPC_OFFSET	0x00F00000
++#define CONFIG_SYS_LS_MC_DPL_MAX_LENGTH		0x20000
++#define CONFIG_SYS_LS_MC_DRAM_DPL_OFFSET	0x00F20000
++#define CONFIG_SYS_LS_MC_BOOT_TIMEOUT_MS	5000
++
++/* Define phy_reset function to boot the MC based on mcinitcmd.
++ * This happens late enough to properly fixup u-boot env MAC addresses.
++ */
++#define CONFIG_RESET_PHY_R
++
++/*
++ * Carve out a DDR region which will not be used by u-boot/Linux
++ *
++ * It will be used by MC and Debug Server. The MC region must be
++ * 512MB aligned, so the min size to hide is 512MB.
++ */
++#ifdef CONFIG_FSL_MC_ENET
++#define CONFIG_SYS_LS_MC_DRAM_BLOCK_MIN_SIZE	(256UL * 1024 * 1024)
++#endif
++
++/* GPIO */
++#define CONFIG_GPIO_EXTRA_HEADER
++
++/* SATA */
++#ifdef CONFIG_SCSI
++#define CONFIG_SYS_SATA1		AHCI_BASE_ADDR1
++#define CONFIG_SYS_SATA2		AHCI_BASE_ADDR2
++#define CONFIG_SYS_SATA3		AHCI_BASE_ADDR3
++#define CONFIG_SYS_SATA4		AHCI_BASE_ADDR4
++#define CONFIG_SYS_SCSI_MAX_SCSI_ID	4
++#define CONFIG_SYS_SCSI_MAX_LUN		1
++#endif
++
++/* USB */
++#ifdef CONFIG_USB
++#define CONFIG_USB_MAX_CONTROLLER_COUNT	2
++#endif
++
++/* MAC/PHY configuration */
++#if defined(CONFIG_FSL_MC_ENET)
++#define CONFIG_ETHPRIME		"DPMAC17@rgmii-id"
++#define RGMII_PHY_ADDR1		0x01
++#endif
++
++#define COUNTER_FREQUENCY_REAL		(get_board_sys_clk() / 4)
++
++#define CONFIG_HWCONFIG
++#define HWCONFIG_BUFFER_SIZE		128
++
++/* Monitor Command Prompt */
++#define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
++#define CONFIG_SYS_PBSIZE		(CONFIG_SYS_CBSIZE + \
++					sizeof(CONFIG_SYS_PROMPT) + 16)
++#define CONFIG_SYS_BARGSIZE		CONFIG_SYS_CBSIZE /* Boot args buffer */
++#define CONFIG_SYS_MAXARGS		64	/* max command args */
++
++#define CONFIG_SYS_BOOTM_LEN   (64 << 20)      /* Increase max gunzip size */
++
++/*
++ * Memory Layout Ovverview:
++ *
++ */
++
++/*
++ * Boot-Media Latout:
++ * - SD/eMMC MC offsets (in sectors):
++ *   - 0x3000: kernel header
++ *   - 0x3200: mc firmware header
++ *   - 0x3400: dpc header
++ *   - 0x5000: firmware
++ *   - 0x6800: dpl
++ *   - 0x7000: dpc
++ *   - 0x7800: dtb
++ *   - 0x8000: kernel
++ * - SPI offsets (in byte):
++ *   - 0x0600000: kernel header
++ *   - 0x0640000: mc firmware header
++ *   - 0x0680000: dpc header
++ *   - 0x0a00000: mc firmware
++ *   - 0x0e00000: dpc
++ *   - 0x0d00000: dpl
++ *   - 0x0f00000: dtb
++ *   - 0x1000000: kernel
++ */
++
++/*
++ * Load Adresses (different from lx2160a_common.h):
++ * Use GPP DRAM Region #1 (2GB: [0x80000000-0xffffffff]).
++ * - 16MB for secure-boot / mc ([0x80000000-0x80ffffff])
++ * - 1MB for boot-script
++ * - 1MB for pxe
++ * - 1MB for DTB
++ * - 64MB for compressed kernel
++ * - 512MB for uncompressed kernel
++ * - ~1.5GB for ramdisk
++ */
++#define SCRIPT_ADDR_R		__stringify(0x81000000)
++#define PXEFILE_ADDR_R		__stringify(0x81100000)
++#define FDT_ADDR_R		__stringify(0x81200000)
++#define KERNEL_COMP_ADDR_R	__stringify(0x81300000)
++#define KERNEL_COMP_SIZE	__stringify(0x04000000)
++#define KERNEL_ADDR_R		__stringify(0x85300000)
++#define RAMDISK_ADDR_R		__stringify(0xa5300000)
++#define FDT_RELOCATION_LIMIT	__stringify(0xffffffff)
++
++/* Initial environment variables */
++#define XSPI_MC_INIT_CMD				\
++	"sf probe 0:0 && "				\
++	"sf read 0x80640000 0x640000 0x80000 && "	\
++	"sf read $fdt_addr_r 0xf00000 0x100000 && "	\
++	"env exists secureboot && "			\
++	"esbc_validate 0x80640000 && "			\
++	"esbc_validate 0x80680000; "			\
++	"sf read 0x80a00000 0xa00000 0x300000 && "	\
++	"sf read 0x80e00000 0xe00000 0x100000; "	\
++	"fsl_mc start mc 0x80a00000 0x80e00000\0"
++
++#define SD_MC_INIT_CMD				\
++	"mmc read 0x80a00000 0x5000 0x1200;"	\
++	"mmc read 0x80e00000 0x7000 0x800;"	\
++	"mmc read $fdt_addr_r 0x7800 0x800;"	\
++	"env exists secureboot && "		\
++	"mmc read 0x80640000 0x3200 0x20 && "	\
++	"mmc read 0x80680000 0x3400 0x20 && "	\
++	"esbc_validate 0x80640000 && "		\
++	"esbc_validate 0x80680000 ;"		\
++	"fsl_mc start mc 0x80a00000 0x80e00000\0"
++
++#define SD2_MC_INIT_CMD				\
++	"mmc dev 1; mmc read 0x80a00000 0x5000 0x1200;"	\
++	"mmc read 0x80e00000 0x7000 0x800;"	\
++	"mmc read $fdt_addr_r 0x7800 0x800;"	\
++	"env exists secureboot && "		\
++	"mmc read 0x80640000 0x3200 0x20 && "	\
++	"mmc read 0x80680000 0x3400 0x20 && "	\
++	"esbc_validate 0x80640000 && "		\
++	"esbc_validate 0x80680000 ;"		\
++	"fsl_mc start mc 0x80a00000 0x80e00000\0"
++
++#define EXTRA_ENV_SETTINGS			\
++	"hwconfig=fsl_ddr:bank_intlv=auto\0"	\
++	"ramdisk_addr_r=" RAMDISK_ADDR_R "\0"	\
++	"fdt_high=" FDT_RELOCATION_LIMIT "\0"			\
++	"initrd_high=0xffffffffffffffff\0"	\
++	"kernel_start=0x1000000\0"		\
++	"kernelheader_start=0x600000\0"		\
++	"scriptaddr=" SCRIPT_ADDR_R "\0"	\
++	"scripthdraddr=0x80080000\0"		\
++	"fdtheader_addr_r=0x80100000\0"		\
++	"kernelheader_addr_r=0x80200000\0"	\
++	"kernel_addr_r=" KERNEL_ADDR_R "\0"		\
++	"kernelheader_size=0x40000\0"		\
++	"fdt_addr_r=" FDT_ADDR_R "\0"		\
++	"pxefile_addr_r=" PXEFILE_ADDR_R "\0"	\
++	"kernel_comp_addr_r=" KERNEL_COMP_ADDR_R "\0" \
++	"kernel_comp_size=" KERNEL_COMP_SIZE "\0" \
++	"load_addr=" KERNEL_ADDR_R "\0"		\
++	"kernel_size=0x2800000\0"		\
++	"kernel_addr_sd=0x8000\0"		\
++	"kernelhdr_addr_sd=0x3000\0"            \
++	"kernel_size_sd=0x14000\0"              \
++	"kernelhdr_size_sd=0x20\0"              \
++	"console=ttyAMA0,115200n8\0"		\
++	BOOTENV					\
++	"mcmemsize=0x70000000\0"		\
++	XSPI_MC_INIT_CMD				\
++	"scan_dev_for_boot_part="		\
++		"part list ${devtype} ${devnum} devplist; "	\
++		"env exists devplist || setenv devplist 1; "	\
++		"for distro_bootpart in ${devplist}; do "	\
++			"if fstype ${devtype} "			\
++				"${devnum}:${distro_bootpart} "	\
++				"bootfstype; then "		\
++				"run scan_dev_for_boot; "	\
++			"fi; "					\
++		"done\0"					\
++	"boot_a_script="					\
++		"load ${devtype} ${devnum}:${distro_bootpart} "	\
++			"${scriptaddr} ${prefix}${script}; "	\
++		"env exists secureboot && load ${devtype} "	\
++			"${devnum}:${distro_bootpart} "		\
++			"${scripthdraddr} ${prefix}${boot_script_hdr} "	\
++			"&& esbc_validate ${scripthdraddr};"	\
++		"source ${scriptaddr}\0"
++
++#define XSPI_NOR_BOOTCOMMAND						\
++			"sf probe 0:0; "				\
++			"sf read 0x806c0000 0x6c0000 0x40000; "		\
++			"env exists mcinitcmd && env exists secureboot"	\
++			" && esbc_validate 0x806c0000; "		\
++			"sf read 0x80d00000 0xd00000 0x100000; "	\
++			"env exists mcinitcmd && "			\
++			"fsl_mc lazyapply dpl 0x80d00000; "		\
++			"run distro_bootcmd;run xspi_bootcmd; "		\
++			"env exists secureboot && esbc_halt;"
++
++#define SD_BOOTCOMMAND						\
++		"env exists mcinitcmd && mmcinfo; "		\
++		"mmc read 0x80d00000 0x6800 0x800; "		\
++		"env exists mcinitcmd && env exists secureboot "	\
++		" && mmc read 0x806C0000 0x3600 0x20 "		\
++		"&& esbc_validate 0x806C0000;env exists mcinitcmd "	\
++		"&& fsl_mc lazyapply dpl 0x80d00000;"		\
++		"run distro_bootcmd;run sd_bootcmd;"		\
++		"env exists secureboot && esbc_halt;"
++
++#define SD2_BOOTCOMMAND						\
++		"mmc dev 1; env exists mcinitcmd && mmcinfo; "	\
++		"mmc read 0x80d00000 0x6800 0x800; "		\
++		"env exists mcinitcmd && env exists secureboot "	\
++		" && mmc read 0x806C0000 0x3600 0x20 "		\
++		"&& esbc_validate 0x806C0000;env exists mcinitcmd "	\
++		"&& fsl_mc lazyapply dpl 0x80d00000;"		\
++		"run distro_bootcmd;run sd2_bootcmd;"		\
++		"env exists secureboot && esbc_halt;"
++
++/* configure boot order for distro-boot feature */
++#define BOOT_TARGET_DEVICES(func) \
++	func(USB, usb, 0) \
++	func(MMC, mmc, 0) \
++	func(MMC, mmc, 1) \
++	func(SCSI, scsi, 0) \
++	func(SCSI, scsi, 1) \
++	func(SCSI, scsi, 2) \
++	func(SCSI, scsi, 3) \
++	func(PXE, pxe, na) \
++	func(DHCP, dhcp, na)
++#include <config_distro_bootcmd.h>
++
++#define CONFIG_EXTRA_ENV_SETTINGS		\
++	EXTRA_ENV_SETTINGS			\
++	"fdtfile=" CONFIG_DEFAULT_FDT_FILE "\0" \
++	"boot_scripts=lx2160acex7_boot.scr\0"	\
++	"boot_script_hdr=hdr_lx2160acex7_bs.out\0"	\
++	"BOARD=lx2160acex7\0"			\
++	"xspi_bootcmd=echo Trying load from flexspi..;"		\
++		"sf probe 0:0 && sf read $load_addr "		\
++		"$kernel_start $kernel_size ; env exists secureboot &&"	\
++		"sf read $kernelheader_addr_r $kernelheader_start "	\
++		"$kernelheader_size && esbc_validate ${kernelheader_addr_r}; "\
++		" bootm $load_addr#$BOARD\0"			\
++	"sd_bootcmd=echo Trying load from sd card..;"		\
++		"mmc dev 0; mmcinfo; mmc read $load_addr "			\
++		"$kernel_addr_sd $kernel_size_sd ;"		\
++		"env exists secureboot && mmc read $kernelheader_addr_r "\
++		"$kernelhdr_addr_sd $kernelhdr_size_sd "	\
++		" && esbc_validate ${kernelheader_addr_r};"	\
++		"bootm $load_addr#$BOARD\0"			\
++	"sd2_bootcmd=echo Trying load from emmc card..;"	\
++		"mmc dev 1; mmcinfo; mmc read $load_addr "	\
++		"$kernel_addr_sd $kernel_size_sd ;"		\
++		"env exists secureboot && mmc read $kernelheader_addr_r "\
++		"$kernelhdr_addr_sd $kernelhdr_size_sd "	\
++		" && esbc_validate ${kernelheader_addr_r};"	\
++		"bootm $load_addr#$BOARD\0"
++
++#include <asm/fsl_secure_boot.h>
++
++#endif /* __CONFIG_LX2160ACEX7_H */
+diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
+index 8abfe47888..b8c0735d75 100644
+--- a/scripts/config_whitelist.txt
++++ b/scripts/config_whitelist.txt
+@@ -1858,6 +1858,12 @@ CONFIG_SYS_SATA1_OFFSET
+ CONFIG_SYS_SATA2
+ CONFIG_SYS_SATA2_FLAGS
+ CONFIG_SYS_SATA2_OFFSET
++CONFIG_SYS_SATA3
++CONFIG_SYS_SATA3_FLAGS
++CONFIG_SYS_SATA3_OFFSET
++CONFIG_SYS_SATA4
++CONFIG_SYS_SATA4_FLAGS
++CONFIG_SYS_SATA4_OFFSET
+ CONFIG_SYS_SATA_ENV_DEV
+ CONFIG_SYS_SATA_FAT_BOOT_PARTITION
+ CONFIG_SYS_SBFHDR_DATA_OFFSET
+-- 
+2.35.3
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0002-pci-ls_pcie_g4-Wait-100ms-for-Link-Up-in-ls_pcie_g4_.patch b/board/solidrun/lx2160acex7/patches/uboot/0002-pci-ls_pcie_g4-Wait-100ms-for-Link-Up-in-ls_pcie_g4_.patch
new file mode 100644
index 000000000000..02cdff7ac52e
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0002-pci-ls_pcie_g4-Wait-100ms-for-Link-Up-in-ls_pcie_g4_.patch
@@ -0,0 +1,65 @@
+From 4c869a8ebbd4eff85f7fbd7d7102777dadcc0dd9 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Wed, 3 Apr 2024 17:58:37 +0200
+Subject: [PATCH 2/3] pci: ls_pcie_g4: Wait 100ms for Link Up in
+ ls_pcie_g4_probe
+
+PCI Link-up can be delayed especially with pci bridges or fpga starting
+up slowly.
+
+Add a 100ms delay during probe polling for link-up.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ drivers/pci/pcie_layerscape_gen4.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/pci/pcie_layerscape_gen4.c b/drivers/pci/pcie_layerscape_gen4.c
+index 6ecdd6af408..eeda47470c1 100644
+--- a/drivers/pci/pcie_layerscape_gen4.c
++++ b/drivers/pci/pcie_layerscape_gen4.c
+@@ -19,6 +19,9 @@
+ 
+ #include "pcie_layerscape_gen4.h"
+ 
++#define LINK_WAIT_RETRIES	100
++#define LINK_WAIT_TIMEOUT	1000
++
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+ LIST_HEAD(ls_pcie_g4_list);
+@@ -50,6 +53,22 @@ static int ls_pcie_g4_link_up(struct ls_pcie_g4 *pcie)
+ 	return 1;
+ }
+ 
++static int ls_pcie_g4_wait_for_link(struct ls_pcie_g4 *pcie)
++{
++	int retries;
++
++	/* check if the link is up or not */
++	for (retries = 0; retries < LINK_WAIT_RETRIES; retries++) {
++		if (ls_pcie_g4_link_up(pcie)) {
++			return 1;
++		}
++
++		udelay(LINK_WAIT_TIMEOUT);
++	}
++
++	return 0;
++}
++
+ static void ls_pcie_g4_ep_enable_cfg(struct ls_pcie_g4 *pcie)
+ {
+ 	ccsr_writel(pcie, GPEX_CFG_READY, PCIE_CONFIG_READY);
+@@ -548,7 +567,7 @@ static int ls_pcie_g4_probe(struct udevice *dev)
+ 	val |= PPIO_EN;
+ 	ccsr_writel(pcie, PAB_PEX_PIO_CTRL(0), val);
+ 
+-	if (!ls_pcie_g4_link_up(pcie)) {
++	if (!ls_pcie_g4_wait_for_link(pcie)) {
+ 		/* Let the user know there's no PCIe link */
+ 		printf(": no link\n");
+ 		return 0;
+-- 
+2.35.3
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0003-pci-ls_pcie-Wait-100ms-for-Link-Up-in-ls_pcie_probe.patch b/board/solidrun/lx2160acex7/patches/uboot/0003-pci-ls_pcie-Wait-100ms-for-Link-Up-in-ls_pcie_probe.patch
new file mode 100644
index 000000000000..074c73500ca5
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0003-pci-ls_pcie-Wait-100ms-for-Link-Up-in-ls_pcie_probe.patch
@@ -0,0 +1,64 @@
+From 1abb4b0ba3dd29f3b52c839cc3d2844e8bf78790 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sun, 14 Apr 2024 16:45:42 +0200
+Subject: [PATCH 3/3] pci: ls_pcie: Wait 100ms for Link Up in ls_pcie_probe
+
+PCI Link-up can be delayed especially with pci bridges or fpga starting
+up slowly.
+
+Add a 100ms delay during probe polling for link-up.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ drivers/pci/pcie_layerscape_rc.c | 21 ++++++++++++++++++++-
+ 1 file changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/pci/pcie_layerscape_rc.c b/drivers/pci/pcie_layerscape_rc.c
+index 17969e2f236..c78b8efd521 100644
+--- a/drivers/pci/pcie_layerscape_rc.c
++++ b/drivers/pci/pcie_layerscape_rc.c
+@@ -19,6 +19,9 @@
+ #endif
+ #include "pcie_layerscape.h"
+ 
++#define LINK_WAIT_RETRIES	100
++#define LINK_WAIT_TIMEOUT	1000
++
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+ struct ls_pcie_drvdata {
+@@ -27,6 +30,22 @@ struct ls_pcie_drvdata {
+ 	bool big_endian;
+ };
+ 
++static int ls_pcie_wait_for_link(struct ls_pcie *pcie)
++{
++	int retries;
++
++	/* check if the link is up or not */
++	for (retries = 0; retries < LINK_WAIT_RETRIES; retries++) {
++		if (ls_pcie_link_up(pcie)) {
++			return 1;
++		}
++
++		udelay(LINK_WAIT_TIMEOUT);
++	}
++
++	return 0;
++}
++
+ static void ls_pcie_cfg0_set_busdev(struct ls_pcie_rc *pcie_rc, u32 busdev)
+ {
+ 	struct ls_pcie *pcie = pcie_rc->pcie;
+@@ -375,7 +394,7 @@ static int ls_pcie_probe(struct udevice *dev)
+ 	       "Root Complex");
+ 	ls_pcie_setup_ctrl(pcie_rc);
+ 
+-	if (!ls_pcie_link_up(pcie)) {
++	if (!ls_pcie_wait_for_link(pcie)) {
+ 		/* Let the user know there's no PCIe link */
+ 		printf(": no link\n");
+ 		return 0;
+-- 
+2.35.3
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0004-fsl-lsch3-update-calculation-of-ddr-clock-rate-to-in.patch b/board/solidrun/lx2160acex7/patches/uboot/0004-fsl-lsch3-update-calculation-of-ddr-clock-rate-to-in.patch
new file mode 100644
index 000000000000..a961bd77d7f0
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0004-fsl-lsch3-update-calculation-of-ddr-clock-rate-to-in.patch
@@ -0,0 +1,63 @@
+From 7320dd540f97a56f7f7cfcbd0dc2e9fae393a8a1 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Tue, 8 Oct 2024 13:29:36 +0200
+Subject: [PATCH] fsl-lsch3: update calculation of ddr clock rate to include
+ divider
+
+DDR clock is passes through a divider and a multiplier - and is then
+again doubled once by the phy and once by the controller.
+The doubling was previously hidden by divider default value of 4.
+
+Take into account the divider value per MEM_PLL_CFG when calculating ddr
+bus frequency, and multiply the result by 4.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ arch/arm/cpu/armv8/fsl-layerscape/fsl_lsch3_speed.c    | 8 ++++++++
+ arch/arm/include/asm/arch-fsl-layerscape/immap_lsch3.h | 4 ++++
+ 2 files changed, 12 insertions(+)
+
+diff --git a/arch/arm/cpu/armv8/fsl-layerscape/fsl_lsch3_speed.c b/arch/arm/cpu/armv8/fsl-layerscape/fsl_lsch3_speed.c
+index 1c04a5b5b7e..29a786bf26c 100644
+--- a/arch/arm/cpu/armv8/fsl-layerscape/fsl_lsch3_speed.c
++++ b/arch/arm/cpu/armv8/fsl-layerscape/fsl_lsch3_speed.c
+@@ -97,11 +97,19 @@ void get_sys_info(struct sys_info *sys_info)
+ 	sys_info->freq_ddrbus *= (gur_in32(&gur->rcwsr[0]) >>
+ 			FSL_CHASSIS3_RCWSR0_MEM_PLL_RAT_SHIFT) &
+ 			FSL_CHASSIS3_RCWSR0_MEM_PLL_RAT_MASK;
++	sys_info->freq_ddrbus /= ((gur_in32(&gur->rcwsr[0]) >>
++			FSL_CHASSIS3_RCWSR0_MEM_PLL_CFG_SHIFT) &
++			FSL_CHASSIS3_RCWSR0_MEM_PLL_CFG_MASK) + 1;
++	/* ddr clock is doubled at phy, then doubled again controller */
++	sys_info->freq_ddrbus *= 4;
+ #ifdef CONFIG_SYS_FSL_HAS_DP_DDR
+ 	if (soc_has_dp_ddr()) {
+ 		sys_info->freq_ddrbus2 *= (gur_in32(&gur->rcwsr[0]) >>
+ 			FSL_CHASSIS3_RCWSR0_MEM2_PLL_RAT_SHIFT) &
+ 			FSL_CHASSIS3_RCWSR0_MEM2_PLL_RAT_MASK;
++		sys_info->freq_ddrbus2 /= ((gur_in32(&gur->rcwsr[0]) >>
++			FSL_CHASSIS3_RCWSR0_MEM2_PLL_CFG_SHIFT) &
++			FSL_CHASSIS3_RCWSR0_MEM2_PLL_CFG_MASK) + 1;
+ 	} else {
+ 		sys_info->freq_ddrbus2 = 0;
+ 	}
+diff --git a/arch/arm/include/asm/arch-fsl-layerscape/immap_lsch3.h b/arch/arm/include/asm/arch-fsl-layerscape/immap_lsch3.h
+index 863618a5f3d..ec9505fb6f1 100644
+--- a/arch/arm/include/asm/arch-fsl-layerscape/immap_lsch3.h
++++ b/arch/arm/include/asm/arch-fsl-layerscape/immap_lsch3.h
+@@ -374,8 +374,12 @@ struct ccsr_gur {
+ 
+ #define FSL_CHASSIS3_RCWSR0_SYS_PLL_RAT_SHIFT	2
+ #define FSL_CHASSIS3_RCWSR0_SYS_PLL_RAT_MASK	0x1f
++#define FSL_CHASSIS3_RCWSR0_MEM_PLL_CFG_SHIFT	8
++#define FSL_CHASSIS3_RCWSR0_MEM_PLL_CFG_MASK	0x3
+ #define FSL_CHASSIS3_RCWSR0_MEM_PLL_RAT_SHIFT	10
+ #define FSL_CHASSIS3_RCWSR0_MEM_PLL_RAT_MASK	0x3f
++#define FSL_CHASSIS3_RCWSR0_MEM2_PLL_CFG_SHIFT	16
++#define FSL_CHASSIS3_RCWSR0_MEM2_PLL_CFG_MASK	0x3
+ #define FSL_CHASSIS3_RCWSR0_MEM2_PLL_RAT_SHIFT	18
+ #define FSL_CHASSIS3_RCWSR0_MEM2_PLL_RAT_MASK	0x3f
+ 
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0005-armv8-lx2160a-enable-workaround-for-SPI-erratum-A-05.patch b/board/solidrun/lx2160acex7/patches/uboot/0005-armv8-lx2160a-enable-workaround-for-SPI-erratum-A-05.patch
new file mode 100644
index 000000000000..d6c9de0d6d3d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0005-armv8-lx2160a-enable-workaround-for-SPI-erratum-A-05.patch
@@ -0,0 +1,102 @@
+From f107c333541cdb1dd35fdd056c4f72d1e23f610a Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Thu, 24 Oct 2024 16:17:49 +0200
+Subject: [PATCH] armv8: lx2160a: enable workaround for SPI erratum A-050752
+
+When RCW is loaded from SDHC1, chip-selects signals for SPI3 are always
+low and not usable.
+
+Implement workaround for erratum A-050752 by clearing rcw source values
+in dynamic configuration register and masking HRESET_B.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ arch/arm/cpu/armv8/fsl-layerscape/Kconfig      |  4 ++++
+ arch/arm/cpu/armv8/fsl-layerscape/cpu.c        |  3 +++
+ arch/arm/cpu/armv8/fsl-layerscape/soc.c        | 18 ++++++++++++++++++
+ arch/arm/include/asm/arch-fsl-layerscape/soc.h |  4 ++++
+ 4 files changed, 29 insertions(+)
+
+diff --git a/arch/arm/cpu/armv8/fsl-layerscape/Kconfig b/arch/arm/cpu/armv8/fsl-layerscape/Kconfig
+index 9bb870dcd8c..ad7bea8e44e 100644
+--- a/arch/arm/cpu/armv8/fsl-layerscape/Kconfig
++++ b/arch/arm/cpu/armv8/fsl-layerscape/Kconfig
+@@ -296,6 +296,7 @@ config ARCH_LX2160A
+ 	select SYS_FSL_EC2
+ 	select SYS_FSL_ERRATUM_A050204
+ 	select SYS_FSL_ERRATUM_A011334
++	select SYS_FSL_ERRATUM_A050752
+ 	select SYS_FSL_ESDHC_UNRELIABLE_PULSE_DETECTION_WORKAROUND
+ 	select SYS_FSL_HAS_RGMII
+ 	select SYS_FSL_HAS_SEC
+@@ -671,6 +672,9 @@ config SYS_FSL_ERRATUM_A009660
+ config SYS_FSL_ERRATUM_A050382
+ 	bool
+ 
++config SYS_FSL_ERRATUM_A050752
++	bool
++
+ config SYS_FSL_HAS_RGMII
+ 	bool
+ 	depends on SYS_FSL_EC1 || SYS_FSL_EC2
+diff --git a/arch/arm/cpu/armv8/fsl-layerscape/cpu.c b/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
+index 16650526e7d..eea3bd7c88f 100644
+--- a/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
++++ b/arch/arm/cpu/armv8/fsl-layerscape/cpu.c
+@@ -1133,6 +1133,9 @@ int arch_early_init_r(void)
+ #endif
+ #if defined(CONFIG_SYS_FSL_ERRATUM_A009942) && defined(CONFIG_SYS_FSL_DDR)
+ 	erratum_a009942_check_cpo();
++#endif
++#ifdef CONFIG_SYS_FSL_ERRATUM_A050752
++	erratum_a050752();
+ #endif
+ 	if (check_psci()) {
+ 		debug("PSCI: PSCI does not exist.\n");
+diff --git a/arch/arm/cpu/armv8/fsl-layerscape/soc.c b/arch/arm/cpu/armv8/fsl-layerscape/soc.c
+index d3a5cfaac19..bfe7c7f5d9f 100644
+--- a/arch/arm/cpu/armv8/fsl-layerscape/soc.c
++++ b/arch/arm/cpu/armv8/fsl-layerscape/soc.c
+@@ -315,6 +315,24 @@ void erratum_a009635(void)
+ 	writel(val | 0x80000000, EPU_EPGCR);
+ }
+ #endif	/* CONFIG_SYS_FSL_ERRATUM_A009635 */
++#ifdef CONFIG_SYS_FSL_ERRATUM_A050752
++#define RESET_BASE 0x01e60000
++#define RESET_CCSR 0
++#define RESET_CCSR_HRESET_B_DIS BIT(25)
++
++void erratum_a050752(void)
++{
++	u32 __iomem *dcfg_ccsr = (u32 __iomem *)DCFG_BASE;
++	u32 __iomem *dcfg_dcsr = (u32 __iomem *)DCFG_DCSR_BASE;
++	u32 __iomem *reset_ccsr = (u32 __iomem *)RESET_BASE;
++	u32 val;
++
++	val = in_le32(dcfg_ccsr + DCFG_PORSR1 / 4);
++	val &= ~DCFG_PORSR1_RCW_SRC;
++	out_le32(dcfg_dcsr + DCFG_DCSR_PORCR1 / 4, val);
++	out_le32(reset_ccsr + RESET_CCSR / 4, RESET_CCSR_HRESET_B_DIS);
++}
++#endif	/* CONFIG_SYS_FSL_ERRATUM_A050752 */
+ 
+ static void erratum_rcw_src(void)
+ {
+diff --git a/arch/arm/include/asm/arch-fsl-layerscape/soc.h b/arch/arm/include/asm/arch-fsl-layerscape/soc.h
+index bd41df1be44..3e7c5b0e724 100644
+--- a/arch/arm/include/asm/arch-fsl-layerscape/soc.h
++++ b/arch/arm/include/asm/arch-fsl-layerscape/soc.h
+@@ -131,6 +131,10 @@ void erratum_a009635(void);
+ void erratum_a010315(void);
+ #endif
+ 
++#ifdef CONFIG_SYS_FSL_ERRATUM_A050752
++void erratum_a050752(void);
++#endif
++
+ bool soc_has_dp_ddr(void);
+ bool soc_has_aiop(void);
+ 
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0006-configs-lx2160-cex7-enable-additional-drivers.patch b/board/solidrun/lx2160acex7/patches/uboot/0006-configs-lx2160-cex7-enable-additional-drivers.patch
new file mode 100644
index 000000000000..46b4cab7e686
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0006-configs-lx2160-cex7-enable-additional-drivers.patch
@@ -0,0 +1,96 @@
+From 9f64e0b7828602683f618793e795350128f4760b Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 26 Oct 2024 13:50:39 +0200
+Subject: [PATCH] configs: lx2160-cex7: enable additional drivers
+
+---
+ configs/lx2160acex7_tfa_SECURE_BOOT_defconfig | 11 +++++++++++
+ configs/lx2160acex7_tfa_defconfig             |  3 +++
+ 2 files changed, 14 insertions(+)
+
+diff --git a/configs/lx2160acex7_tfa_SECURE_BOOT_defconfig b/configs/lx2160acex7_tfa_SECURE_BOOT_defconfig
+index 12f236aad06..d55bdb24a4b 100644
+--- a/configs/lx2160acex7_tfa_SECURE_BOOT_defconfig
++++ b/configs/lx2160acex7_tfa_SECURE_BOOT_defconfig
+@@ -35,8 +35,10 @@ CONFIG_CMD_GPIO=y
+ CONFIG_CMD_GPT=y
+ CONFIG_CMD_I2C=y
+ CONFIG_CMD_MMC=y
++CONFIG_CMD_OPTEE_RPMB=y
+ CONFIG_CMD_PCI=y
+ CONFIG_CMD_USB=y
++CONFIG_CMD_WDT=y
+ CONFIG_CMD_CACHE=y
+ CONFIG_OF_CONTROL=y
+ CONFIG_ENV_OVERWRITE=y
+@@ -44,6 +46,7 @@ CONFIG_NET_RANDOM_ETHADDR=y
+ CONFIG_DM=y
+ CONFIG_SATA=y
+ CONFIG_SATA_CEVA=y
++CONFIG_FSL_CAAM=y
+ CONFIG_DYNAMIC_DDR_CLK_FREQ=y
+ CONFIG_DDR_ECC=y
+ CONFIG_ECC_INIT_VIA_DDRCONTROLLER=y
+@@ -51,12 +54,15 @@ CONFIG_MPC8XXX_GPIO=y
+ CONFIG_DM_I2C=y
+ CONFIG_I2C_SET_DEFAULT_BUS_NUM=y
+ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
++CONFIG_SUPPORT_EMMC_RPMB=y
++CONFIG_SUPPORT_EMMC_BOOT=y
+ CONFIG_MMC_HS400_SUPPORT=y
+ CONFIG_FSL_ESDHC=y
+ CONFIG_MTD=y
+ CONFIG_DM_SPI_FLASH=y
+ CONFIG_SPI_FLASH_STMICRO=y
+ CONFIG_SPI_FLASH_MT35XU=y
++CONFIG_SPI_FLASH_WINBOND=y
+ # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+ CONFIG_PHYLIB=y
+ CONFIG_PHY_ATHEROS=y
+@@ -76,11 +82,16 @@ CONFIG_DM_SERIAL=y
+ CONFIG_PL01X_SERIAL=y
+ CONFIG_SPI=y
+ CONFIG_DM_SPI=y
++CONFIG_FSL_DSPI=y
+ CONFIG_NXP_FSPI=y
++CONFIG_TEE=y
++CONFIG_OPTEE=y
+ CONFIG_USB=y
+ CONFIG_USB_XHCI_HCD=y
+ CONFIG_USB_XHCI_DWC3=y
+ CONFIG_RSA=y
+ CONFIG_SPL_RSA=y
+ CONFIG_RSA_SOFTWARE_EXP=y
++CONFIG_WDT=y
++CONFIG_WDT_SBSA=y
+ CONFIG_EFI_LOADER_BOUNCE_BUFFER=y
+diff --git a/configs/lx2160acex7_tfa_defconfig b/configs/lx2160acex7_tfa_defconfig
+index 9f24e12a85d..8fd603cb87e 100644
+--- a/configs/lx2160acex7_tfa_defconfig
++++ b/configs/lx2160acex7_tfa_defconfig
+@@ -60,12 +60,14 @@ CONFIG_DM_I2C=y
+ CONFIG_I2C_SET_DEFAULT_BUS_NUM=y
+ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
+ CONFIG_SUPPORT_EMMC_RPMB=y
++CONFIG_SUPPORT_EMMC_BOOT=y
+ CONFIG_MMC_HS400_SUPPORT=y
+ CONFIG_FSL_ESDHC=y
+ CONFIG_MTD=y
+ CONFIG_DM_SPI_FLASH=y
+ CONFIG_SPI_FLASH_STMICRO=y
+ CONFIG_SPI_FLASH_MT35XU=y
++CONFIG_SPI_FLASH_WINBOND=y
+ # CONFIG_SPI_FLASH_USE_4K_SECTORS is not set
+ CONFIG_PHYLIB=y
+ CONFIG_PHY_ATHEROS=y
+@@ -85,6 +87,7 @@ CONFIG_DM_SERIAL=y
+ CONFIG_PL01X_SERIAL=y
+ CONFIG_SPI=y
+ CONFIG_DM_SPI=y
++CONFIG_FSL_DSPI=y
+ CONFIG_NXP_FSPI=y
+ CONFIG_TEE=y
+ CONFIG_OPTEE=y
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0007-cmd-tlv_eeprom-don-t-fail-boot-when-reading-eeprom-f.patch b/board/solidrun/lx2160acex7/patches/uboot/0007-cmd-tlv_eeprom-don-t-fail-boot-when-reading-eeprom-f.patch
new file mode 100644
index 000000000000..d84ea44e1688
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0007-cmd-tlv_eeprom-don-t-fail-boot-when-reading-eeprom-f.patch
@@ -0,0 +1,32 @@
+From fff14a56662e7f4ff86cdb5452e5c1b1e35f28bd Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 2 Nov 2024 16:31:01 +0100
+Subject: [PATCH 07/10] cmd: tlv_eeprom: don't fail boot when reading eeprom
+ fails
+
+When u-boot calls mac_read_from_eeprom during init an error return code
+will fail the boot before reaching u-boot shell.
+
+Return success error code even on error, mac addresses are not critical.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ cmd/tlv_eeprom.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmd/tlv_eeprom.c b/cmd/tlv_eeprom.c
+index bf8d453dc5b..cbc11ebf421 100644
+--- a/cmd/tlv_eeprom.c
++++ b/cmd/tlv_eeprom.c
+@@ -1023,7 +1023,7 @@ int mac_read_from_eeprom(void)
+ 
+ 	if (read_eeprom(eeprom)) {
+ 		printf("Read failed.\n");
+-		return -1;
++		return 0;
+ 	}
+ 
+ 	maccount = 1;
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0008-board-solidrun-lx2160-cex7-fixup-u-boot-dts-dpmac-by.patch b/board/solidrun/lx2160acex7/patches/uboot/0008-board-solidrun-lx2160-cex7-fixup-u-boot-dts-dpmac-by.patch
new file mode 100644
index 000000000000..219f6eaf559d
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0008-board-solidrun-lx2160-cex7-fixup-u-boot-dts-dpmac-by.patch
@@ -0,0 +1,389 @@
+From 23e2133cf0e5bdd8d2556fe0fe63f5b9ab534e65 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 2 Nov 2024 17:55:53 +0100
+Subject: [PATCH 08/10] board: solidrun: lx2160-cex7: fixup u-boot dts dpmac by
+ serdes protocol
+
+LX2160A network interface availability and speed depend on serdes
+protocol selected in RCW. Creating device-tree for every possible
+combination would be cumbersome and hard to maintain.
+
+U-Boot dpaa2 driver does not reconfigure network interfaces but leaves
+them as brought up by MC firmware, based on serdes protocol.
+At the same time, u-boot expects the dt phy-mode property to match
+actual interface protocol.
+
+Fixup u-boot fdt during board_fix_fdt, setting status property and
+phy-mode according to default protocol for the running serdes protocol.
+
+This allows with the same u-boot build and internal device-tree to
+enable all available network interfaces as dictatd by a particular RCW.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ board/solidrun/lx2160acex7/eth_lx2160acex7.c | 312 +++++++++++++++++++
+ board/solidrun/lx2160acex7/lx2160a.c         |   4 +
+ 2 files changed, 316 insertions(+)
+
+diff --git a/board/solidrun/lx2160acex7/eth_lx2160acex7.c b/board/solidrun/lx2160acex7/eth_lx2160acex7.c
+index d2c68d34243..63aa6610a02 100644
+--- a/board/solidrun/lx2160acex7/eth_lx2160acex7.c
++++ b/board/solidrun/lx2160acex7/eth_lx2160acex7.c
+@@ -12,6 +12,8 @@
+ #include <fsl-mc/fsl_mc.h>
+ #include <fsl-mc/ldpaa_wriop.h>
+ #include <netdev.h>
++#include <asm/arch/clock.h>
++#include <fdt_support.h>
+ 
+ DECLARE_GLOBAL_DATA_PTR;
+ 
+@@ -76,13 +78,323 @@ void reset_phy(void)
+ }
+ #endif /* CONFIG_RESET_PHY_R */
+ 
++#ifndef CONFIG_CMD_TLV_EEPROM
+ int mac_read_from_eeprom(void)
+ {
+ 	return 0;
+ }
++#endif
+ 
+ int do_mac(struct cmd_tbl *cmdtp, int flag, int argc, char *const argv[])
+ {
+ 	puts("Not implemented.\n");
+ 	return CMD_RET_FAILURE;
+ }
++
++static void dpmac_set_phymode(void *fdt, unsigned int id, const char *mode) {
++	char path[34] = {};
++	int node;
++
++	snprintf(path, sizeof(path), "/fsl-mc@80c000000/dpmacs/dpmac@%x", id);
++	node = fdt_path_offset(fdt, path);
++	fdt_delprop(fdt, node, "phy-mode");
++	do_fixup_by_path_string(fdt, path, "phy-connection-type", mode);
++	do_fixup_by_path_string(fdt, path, "status", "okay");
++}
++
++/*
++ * Fixup dpmac phy-modes by serdes protocol to fix ethernet driver probe
++ */
++void board_fix_fdt_eth(void *fdt) {
++	struct ccsr_gur *gur = (void *)(CONFIG_SYS_FSL_GUTS_ADDR);
++	u32 is_lx2162 = get_svr() & 0x800;
++	u32 srds_s1, srds_s2;
++
++	srds_s1 = in_le32(&gur->rcwsr[28]) &
++			  FSL_CHASSIS3_RCWSR28_SRDS1_PRTCL_MASK;
++	srds_s1 >>= FSL_CHASSIS3_RCWSR28_SRDS1_PRTCL_SHIFT;
++
++	srds_s2 = in_le32(&gur->rcwsr[28]) &
++			  FSL_CHASSIS3_RCWSR28_SRDS2_PRTCL_MASK;
++	srds_s2 >>= FSL_CHASSIS3_RCWSR28_SRDS2_PRTCL_SHIFT;
++
++	/* allocate space in case properties must be added */
++	fdt_increase_size(fdt, 256);
++
++	switch (srds_s1) {
++	case 0:
++	case 1:
++		break;
++	case 2:
++		/* 3, 4, 5, 6 = sgmii */
++		dpmac_set_phymode(fdt, 3, "sgmii");
++		dpmac_set_phymode(fdt, 4, "sgmii");
++		dpmac_set_phymode(fdt, 5, "sgmii");
++		dpmac_set_phymode(fdt, 6, "sgmii");
++		break;
++	case 3:
++		/* 3, 4, 5, 6 = xgmii */
++		dpmac_set_phymode(fdt, 3, "xgmii");
++		dpmac_set_phymode(fdt, 4, "xgmii");
++		dpmac_set_phymode(fdt, 5, "xgmii");
++		dpmac_set_phymode(fdt, 6, "xgmii");
++		break;
++	case 4:
++		/* 3, 4, 5, 6, 7, 8, 9, 10 = sgmii */
++		dpmac_set_phymode(fdt, 3, "sgmii");
++		dpmac_set_phymode(fdt, 4, "sgmii");
++		dpmac_set_phymode(fdt, 5, "sgmii");
++		dpmac_set_phymode(fdt, 6, "sgmii");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 7, "sgmii");
++		dpmac_set_phymode(fdt, 8, "sgmii");
++		dpmac_set_phymode(fdt, 9, "sgmii");
++		dpmac_set_phymode(fdt, 10, "sgmii");
++		break;
++	case 5:
++		/* 7, 8, 9, 10 = xgmii */
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 7, "xgmii");
++		dpmac_set_phymode(fdt, 8, "xgmii");
++		dpmac_set_phymode(fdt, 9, "xgmii");
++		dpmac_set_phymode(fdt, 10, "xgmii");
++		break;
++	case 6:
++		/* 3, 4 = xgmii; 5, 6, 7, 8, 9, 10 = sgmii */
++		dpmac_set_phymode(fdt, 3, "xgmii");
++		dpmac_set_phymode(fdt, 4, "xgmii");
++		dpmac_set_phymode(fdt, 5, "sgmii");
++		dpmac_set_phymode(fdt, 6, "sgmii");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 7, "sgmii");
++		dpmac_set_phymode(fdt, 8, "sgmii");
++		dpmac_set_phymode(fdt, 9, "sgmii");
++		dpmac_set_phymode(fdt, 10, "sgmii");
++		break;
++	case 7:
++		/* 3, 4, 5, 6 = xgmii; 7, 8, 9, 10 = sgmii */
++		dpmac_set_phymode(fdt, 3, "xgmii");
++		dpmac_set_phymode(fdt, 4, "xgmii");
++		dpmac_set_phymode(fdt, 5, "xgmii");
++		dpmac_set_phymode(fdt, 6, "xgmii");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 7, "sgmii");
++		dpmac_set_phymode(fdt, 8, "sgmii");
++		dpmac_set_phymode(fdt, 9, "sgmii");
++		dpmac_set_phymode(fdt, 10, "sgmii");
++		break;
++	case 8:
++		/* 3, 4, 5, 6, 7, 8, 9, 10 = xgmii */
++		dpmac_set_phymode(fdt, 3, "xgmii");
++		dpmac_set_phymode(fdt, 4, "xgmii");
++		dpmac_set_phymode(fdt, 5, "xgmii");
++		dpmac_set_phymode(fdt, 6, "xgmii");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 7, "xgmii");
++		dpmac_set_phymode(fdt, 8, "xgmii");
++		dpmac_set_phymode(fdt, 9, "xgmii");
++		dpmac_set_phymode(fdt, 10, "xgmii");
++		break;
++	case 9:
++		/* 4, 5, 6, 8, 9, 10 = sgmii */
++		dpmac_set_phymode(fdt, 4, "sgmii");
++		dpmac_set_phymode(fdt, 5, "sgmii");
++		dpmac_set_phymode(fdt, 6, "sgmii");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 8, "sgmii");
++		dpmac_set_phymode(fdt, 9, "sgmii");
++		dpmac_set_phymode(fdt, 10, "sgmii");
++		break;
++	case 10:
++		/* 4, 5, 6, 8, 9, 10 = xgmii */
++		dpmac_set_phymode(fdt, 4, "xgmii");
++		dpmac_set_phymode(fdt, 5, "xgmii");
++		dpmac_set_phymode(fdt, 6, "xgmii");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 8, "xgmii");
++		dpmac_set_phymode(fdt, 9, "xgmii");
++		dpmac_set_phymode(fdt, 10, "xgmii");
++		break;
++	case 11:
++		/* 5, 6, 9, 10 = sgmii */
++		dpmac_set_phymode(fdt, 5, "sgmii");
++		dpmac_set_phymode(fdt, 6, "sgmii");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 9, "sgmii");
++		dpmac_set_phymode(fdt, 10, "sgmii");
++		break;
++	case 12:
++		/* 9, 10 = sgmii */
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 9, "sgmii");
++		dpmac_set_phymode(fdt, 10, "sgmii");
++		break;
++	case 13:
++		/* 1, 2 = caui4 */
++		dpmac_set_phymode(fdt, 1, "caui4");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 2, "caui4");
++		break;
++	case 14:
++		/* 1 = caui4 */
++		dpmac_set_phymode(fdt, 1, "caui4");
++		break;
++	case 15:
++		/* 1, 2 = caui2 */
++		dpmac_set_phymode(fdt, 1, "caui2");
++		dpmac_set_phymode(fdt, 2, "caui2");
++		break;
++	case 16:
++		/* 1 = caui2; 5, 6 = 25g-aui */
++		dpmac_set_phymode(fdt, 1, "caui2");
++		dpmac_set_phymode(fdt, 5, "25g-aui");
++		dpmac_set_phymode(fdt, 6, "25g-aui");
++		break;
++	case 17:
++		/* 3, 4, 5, 6 = 25g-aui */
++		dpmac_set_phymode(fdt, 3, "25g-aui");
++		dpmac_set_phymode(fdt, 4, "25g-aui");
++		dpmac_set_phymode(fdt, 5, "25g-aui");
++		dpmac_set_phymode(fdt, 6, "25g-aui");
++		break;
++	case 18:
++		/* 3, 4, 7, 8, 9, 10 = xgmii; 5, 6 = 25g-aui */
++		dpmac_set_phymode(fdt, 3, "xgmii");
++		dpmac_set_phymode(fdt, 4, "xgmii");
++		dpmac_set_phymode(fdt, 5, "25g-aui");
++		dpmac_set_phymode(fdt, 6, "25g-aui");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 7, "xgmii");
++		dpmac_set_phymode(fdt, 8, "xgmii");
++		dpmac_set_phymode(fdt, 9, "xgmii");
++		dpmac_set_phymode(fdt, 10, "xgmii");
++		break;
++	case 19:
++		/* 2 = xlaui4; 3, 4 = xgmii; 5, 6 = 25g-aui */
++		dpmac_set_phymode(fdt, 3, "xgmii");
++		dpmac_set_phymode(fdt, 4, "xgmii");
++		dpmac_set_phymode(fdt, 5, "25g-aui");
++		dpmac_set_phymode(fdt, 6, "25g-aui");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 2, "xlaui4");
++		break;
++	case 20:
++		/* 1, 2 = xlaui4 */
++		dpmac_set_phymode(fdt, 1, "xlaui4");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 2, "xlaui4");
++		break;
++	case 21:
++		/* 3, 4, 5, 6, 9, 10 = 25g-aui */
++		dpmac_set_phymode(fdt, 3, "25g-aui");
++		dpmac_set_phymode(fdt, 4, "25g-aui");
++		dpmac_set_phymode(fdt, 5, "25g-aui");
++		dpmac_set_phymode(fdt, 6, "25g-aui");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 9, "25g-aui");
++		dpmac_set_phymode(fdt, 10, "25g-aui");
++		break;
++	case 22:
++		/* 3, 4, 5, 6, 9, 10 = xgmii */
++		dpmac_set_phymode(fdt, 3, "xgmii");
++		dpmac_set_phymode(fdt, 4, "xgmii");
++		dpmac_set_phymode(fdt, 5, "xgmii");
++		dpmac_set_phymode(fdt, 6, "xgmii");
++		if (is_lx2162)
++			break;
++		dpmac_set_phymode(fdt, 9, "xgmii");
++		dpmac_set_phymode(fdt, 10, "xgmii");
++		break;
++	}
++
++	switch (srds_s2) {
++	case 0:
++	case 1:
++	case 2:
++	case 3:
++	case 4:
++	case 5:
++		break;
++	case 6:
++		/* 13, 14 = xgmii; 15, 16 = sgmii */
++		dpmac_set_phymode(fdt, 13, "xgmii");
++		dpmac_set_phymode(fdt, 14, "xgmii");
++		dpmac_set_phymode(fdt, 15, "sgmii");
++		dpmac_set_phymode(fdt, 16, "sgmii");
++		break;
++	case 7:
++		/* 12, 16, 17, 18 = sgmii; 13, 14 = xgmii */
++		dpmac_set_phymode(fdt, 12, "sgmii");
++		dpmac_set_phymode(fdt, 13, "xgmii");
++		dpmac_set_phymode(fdt, 14, "xgmii");
++		dpmac_set_phymode(fdt, 16, "sgmii");
++		dpmac_set_phymode(fdt, 17, "sgmii");
++		dpmac_set_phymode(fdt, 18, "sgmii");
++		break;
++	case 8:
++		/* 13, 14 = xgmii */
++		dpmac_set_phymode(fdt, 13, "xgmii");
++		dpmac_set_phymode(fdt, 14, "xgmii");
++		break;
++	case 9:
++		/* 11, 12, 13, 14, 15, 16, 17, 18 = sgmii */
++		dpmac_set_phymode(fdt, 11, "sgmii");
++		dpmac_set_phymode(fdt, 12, "sgmii");
++		dpmac_set_phymode(fdt, 13, "sgmii");
++		dpmac_set_phymode(fdt, 14, "sgmii");
++		dpmac_set_phymode(fdt, 15, "sgmii");
++		dpmac_set_phymode(fdt, 16, "sgmii");
++		dpmac_set_phymode(fdt, 17, "sgmii");
++		dpmac_set_phymode(fdt, 18, "sgmii");
++		break;
++	case 10:
++		/* 11, 12, 17, 18 = sgmii */
++		dpmac_set_phymode(fdt, 11, "sgmii");
++		dpmac_set_phymode(fdt, 12, "sgmii");
++		dpmac_set_phymode(fdt, 17, "sgmii");
++		dpmac_set_phymode(fdt, 18, "sgmii");
++		break;
++	case 11:
++		/* 12, 13, 14, 16, 17, 18 = sgmii */
++		dpmac_set_phymode(fdt, 12, "sgmii");
++		dpmac_set_phymode(fdt, 13, "sgmii");
++		dpmac_set_phymode(fdt, 14, "sgmii");
++		dpmac_set_phymode(fdt, 16, "sgmii");
++		dpmac_set_phymode(fdt, 17, "sgmii");
++		dpmac_set_phymode(fdt, 18, "sgmii");
++		break;
++	case 12:
++		/* 11, 12, 17, 18 = sgmii */
++		dpmac_set_phymode(fdt, 11, "sgmii");
++		dpmac_set_phymode(fdt, 12, "sgmii");
++		dpmac_set_phymode(fdt, 17, "sgmii");
++		dpmac_set_phymode(fdt, 18, "sgmii");
++		break;
++	case 13:
++		/* 13, 14 = sgmii */
++		dpmac_set_phymode(fdt, 13, "sgmii");
++		dpmac_set_phymode(fdt, 14, "sgmii");
++		break;
++	case 14:
++		/* 13, 14, 17, 18 = sgmii */
++		dpmac_set_phymode(fdt, 13, "sgmii");
++		dpmac_set_phymode(fdt, 14, "sgmii");
++		dpmac_set_phymode(fdt, 17, "sgmii");
++		dpmac_set_phymode(fdt, 18, "sgmii");
++		break;
++	}
++}
+diff --git a/board/solidrun/lx2160acex7/lx2160a.c b/board/solidrun/lx2160acex7/lx2160a.c
+index 08fa6070672..af0a071488a 100644
+--- a/board/solidrun/lx2160acex7/lx2160a.c
++++ b/board/solidrun/lx2160acex7/lx2160a.c
+@@ -65,6 +65,8 @@ int board_early_init_f(void)
+ }
+ 
+ #ifdef CONFIG_OF_BOARD_FIXUP
++void board_fix_fdt_eth(void *fdt);
++
+ int board_fix_fdt(void *fdt)
+ {
+ 	char *reg_names, *reg_name;
+@@ -78,6 +80,8 @@ int board_fix_fdt(void *fdt)
+ 	};
+ 	int off = -1, i = 0;
+ 
++	board_fix_fdt_eth(fdt);
++
+ 	if (IS_SVR_REV(get_svr(), 1, 0))
+ 		return 0;
+ 
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0009-board-solidrun-lx2160acex7-enable-reading-tlv-eeprom.patch b/board/solidrun/lx2160acex7/patches/uboot/0009-board-solidrun-lx2160acex7-enable-reading-tlv-eeprom.patch
new file mode 100644
index 000000000000..86f89a23f2d2
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0009-board-solidrun-lx2160acex7-enable-reading-tlv-eeprom.patch
@@ -0,0 +1,40 @@
+From 402f33f4a31ebfa8b4a03adee2b1940878cadc74 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 2 Nov 2024 18:30:53 +0100
+Subject: [PATCH 09/10] board: solidrun: lx2160acex7: enable reading tlv eeprom
+ mac addresses
+
+Enable tlv eeprom support in u-boot configuration to execute
+mac_read_from_eeprom and populate network interface mac addresses from
+tlv data if available.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ configs/lx2160acex7_tfa_defconfig | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configs/lx2160acex7_tfa_defconfig b/configs/lx2160acex7_tfa_defconfig
+index 8fd603cb87e..803ddb376f4 100644
+--- a/configs/lx2160acex7_tfa_defconfig
++++ b/configs/lx2160acex7_tfa_defconfig
+@@ -28,6 +28,7 @@ CONFIG_USE_BOOTARGS=y
+ CONFIG_BOOTARGS="console=ttyAMA0,115200 root=/dev/ram0 earlycon=pl011,mmio32,0x21c0000 ramdisk_size=0x2000000 default_hugepagesz=1024m hugepagesz=1024m hugepages=2 pci=pcie_bus_perf"
+ CONFIG_DEFAULT_FDT_FILE="freescale/fsl-lx2160a-clearfog-cx.dtb"
+ CONFIG_MISC_INIT_R=y
++CONFIG_CMD_TLV_EEPROM=y
+ CONFIG_CMD_GREPENV=y
+ CONFIG_CMD_EEPROM=y
+ CONFIG_SYS_EEPROM_PAGE_WRITE_BITS=3
+@@ -58,6 +59,9 @@ CONFIG_ECC_INIT_VIA_DDRCONTROLLER=y
+ CONFIG_MPC8XXX_GPIO=y
+ CONFIG_DM_I2C=y
+ CONFIG_I2C_SET_DEFAULT_BUS_NUM=y
++CONFIG_I2C_MUX=y
++CONFIG_I2C_MUX_PCA954x=y
++CONFIG_I2C_EEPROM=y
+ CONFIG_SYS_I2C_EEPROM_ADDR=0x57
+ CONFIG_SUPPORT_EMMC_RPMB=y
+ CONFIG_SUPPORT_EMMC_BOOT=y
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0010-board-solidrun-lx2160acex7-disable-second-usb-on-lx2.patch b/board/solidrun/lx2160acex7/patches/uboot/0010-board-solidrun-lx2160acex7-disable-second-usb-on-lx2.patch
new file mode 100644
index 000000000000..6d2750c51792
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0010-board-solidrun-lx2160acex7-disable-second-usb-on-lx2.patch
@@ -0,0 +1,32 @@
+From 86421a6f1f41ea90124e4de2f8b73e43049bc1d4 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Sat, 2 Nov 2024 19:52:31 +0100
+Subject: [PATCH 10/10] board: solidrun: lx2160acex7: disable second usb on
+ lx2162
+
+LX2162 only has single USB controller, disable the second one from
+board_fix_fdt.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ board/solidrun/lx2160acex7/lx2160a.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/board/solidrun/lx2160acex7/lx2160a.c b/board/solidrun/lx2160acex7/lx2160a.c
+index af0a071488a..e0a9e6c51eb 100644
+--- a/board/solidrun/lx2160acex7/lx2160a.c
++++ b/board/solidrun/lx2160acex7/lx2160a.c
+@@ -79,6 +79,10 @@ int board_fix_fdt(void *fdt)
+ 		{ "pf_ctrl", "ctrl" }
+ 	};
+ 	int off = -1, i = 0;
++	u32 is_lx2162 = get_svr() & 0x800;
++
++	if (is_lx2162)
++		do_fixup_by_path_string(fdt, "/usb3@3110000", "status", "disabled");
+ 
+ 	board_fix_fdt_eth(fdt);
+ 
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0011-board-solidrun-lx2160acex7-allocate-memory-before-pa.patch b/board/solidrun/lx2160acex7/patches/uboot/0011-board-solidrun-lx2160acex7-allocate-memory-before-pa.patch
new file mode 100644
index 000000000000..bc31c155ae84
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0011-board-solidrun-lx2160acex7-allocate-memory-before-pa.patch
@@ -0,0 +1,39 @@
+From bcabe078a2a27eecaa592e1f2ea640a5f1fc6cda Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Mon, 4 Nov 2024 15:16:27 +0100
+Subject: [PATCH 11/13] board: solidrun: lx2160acex7: allocate memory before
+ patching lx2162 fdt
+
+Update of second usb controller fdt node during board_fix_fdt fails due
+to lack of space in the fdt.
+
+Explicitly allocate some extra bytes before to repair this fixup on
+lx2162 som.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ board/solidrun/lx2160acex7/lx2160a.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/board/solidrun/lx2160acex7/lx2160a.c b/board/solidrun/lx2160acex7/lx2160a.c
+index e0a9e6c51eb..17160d13154 100644
+--- a/board/solidrun/lx2160acex7/lx2160a.c
++++ b/board/solidrun/lx2160acex7/lx2160a.c
+@@ -81,8 +81,13 @@ int board_fix_fdt(void *fdt)
+ 	int off = -1, i = 0;
+ 	u32 is_lx2162 = get_svr() & 0x800;
+ 
+-	if (is_lx2162)
++	if (is_lx2162) {
++		/* allocate space for changes */
++		fdt_increase_size(fdt, 32);
++
++		/* LX2162 does not have second USB controller, disable */
+ 		do_fixup_by_path_string(fdt, "/usb3@3110000", "status", "disabled");
++	}
+ 
+ 	board_fix_fdt_eth(fdt);
+ 
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0012-cmd-tlv_eeprom-support-specifying-tlv-eeprom-in-DT-a.patch b/board/solidrun/lx2160acex7/patches/uboot/0012-cmd-tlv_eeprom-support-specifying-tlv-eeprom-in-DT-a.patch
new file mode 100644
index 000000000000..a961cf59e85f
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0012-cmd-tlv_eeprom-support-specifying-tlv-eeprom-in-DT-a.patch
@@ -0,0 +1,58 @@
+From bc8a68d153dcfd75153d81c52531743e43f23983 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Mon, 4 Nov 2024 15:08:01 +0100
+Subject: [PATCH 12/13] cmd: tlv_eeprom: support specifying tlv eeprom in DT
+ alias tlv[0-255]
+
+Systems might have many eeproms of which only some might be used for TLV
+data.
+If present, use aliases tlv0, tlv1, ... for finding tlv eeproms.
+
+If no eeproms are found by alias, fall back to current logic if using
+first eeproms in the system.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ cmd/tlv_eeprom.c | 23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+diff --git a/cmd/tlv_eeprom.c b/cmd/tlv_eeprom.c
+index cbc11ebf421..546ede2dda2 100644
+--- a/cmd/tlv_eeprom.c
++++ b/cmd/tlv_eeprom.c
+@@ -899,9 +899,32 @@ static void show_tlv_devices(void)
+ static int find_tlv_devices(struct udevice **tlv_devices_p)
+ {
+ 	int ret;
++	char alias_name[7];
+ 	int count_dev = 0;
++	int i;
++	ofnode node;
+ 	struct udevice *dev;
+ 
++	/* find by alias */
++	for (int i = 0; i < ARRAY_SIZE(tlv_devices_p); i++) {
++		snprintf(alias_name, sizeof(alias_name), "tlv%d", i);
++		node = ofnode_get_aliases_node(alias_name);
++		if (!ofnode_valid(node))
++			continue;
++
++		ret = uclass_get_device_by_ofnode(UCLASS_I2C_EEPROM, node, &dev);
++		if (ret) {
++			debug("get device \"%s\" failed with %d\n", alias_name, ret);
++			continue;
++		}
++
++		tlv_devices_p[i] = dev;
++		count_dev++;
++	}
++	if (count_dev)
++		return 0;
++
++	/* fall-back: find among all eeproms */
+ 	for (ret = uclass_first_device_check(UCLASS_I2C_EEPROM, &dev);
+ 			dev;
+ 			ret = uclass_next_device_check(&dev)) {
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0013-board-solidrun-lx2160acex7-use-dt-alias-for-tlv-eepr.patch b/board/solidrun/lx2160acex7/patches/uboot/0013-board-solidrun-lx2160acex7-use-dt-alias-for-tlv-eepr.patch
new file mode 100644
index 000000000000..5bfa6ff0337c
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0013-board-solidrun-lx2160acex7-use-dt-alias-for-tlv-eepr.patch
@@ -0,0 +1,90 @@
+From 38e36f6ceec2ecccc97369bec7e2589933001359 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Mon, 4 Nov 2024 15:12:04 +0100
+Subject: [PATCH 13/13] board: solidrun: lx2160acex7: use dt alias for tlv
+ eeprom
+
+LX2160A CEX-7 (and LX2162A SoM) have various eeproms competing for
+tlv_eeprom command.
+
+Add tlv0 alias to u-boot dts identifying the correct eeprom.
+
+On LX2162 SoM the eeprom is directly on the bus without a mux.
+Add dt patching logic fixing the alias and eeprom nodes when running on
+lx2162 soc.
+
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi | 19 +++++++++----------
+ arch/arm/dts/fsl-lx2160a-cex7.dtsi        |  2 +-
+ board/solidrun/lx2160acex7/lx2160a.c      |  5 +++++
+ 3 files changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi b/arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi
+index 9855fcb31cc..5909af2b1b9 100644
+--- a/arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi
++++ b/arch/arm/dts/fsl-lx2160a-cex7-u-boot.dtsi
+@@ -1,6 +1,10 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ 
+ / {
++	aliases {
++		tlv0 = &com_eeprom;
++	};
++
+ 	fanctrl-override {
+ 		compatible = "solidrun,lx2160acex7-fanctrl-override";
+ 		override-gpios = <&gpio2 2 0>;
+@@ -8,15 +12,10 @@
+ };
+ 
+ &i2c0 {
+-	u-boot,dm-pre-reloc;
+-
+-	i2c-mux@77 {
+-		u-boot,dm-pre-reloc;
+-
+-		i2c@0 {
+-			eeprom@57 {
+-				u-boot,dm-pre-reloc;
+-			};
+-		};
++	/* for LX2162 SoM */
++	eeprom@57 {
++		compatible = "st,24c02", "atmel,24c02";
++		reg = <0x57>;
++		status = "disabled";
+ 	};
+ };
+diff --git a/arch/arm/dts/fsl-lx2160a-cex7.dtsi b/arch/arm/dts/fsl-lx2160a-cex7.dtsi
+index d32a52ab00a..ca87a21aaee 100644
+--- a/arch/arm/dts/fsl-lx2160a-cex7.dtsi
++++ b/arch/arm/dts/fsl-lx2160a-cex7.dtsi
+@@ -80,7 +80,7 @@
+ 				reg = <0x53>;
+ 			};
+ 
+-			eeprom@57 {
++			com_eeprom: eeprom@57 {
+ 				compatible = "atmel,24c02";
+ 				reg = <0x57>;
+ 			};
+diff --git a/board/solidrun/lx2160acex7/lx2160a.c b/board/solidrun/lx2160acex7/lx2160a.c
+index 17160d13154..dcd8d63ddf8 100644
+--- a/board/solidrun/lx2160acex7/lx2160a.c
++++ b/board/solidrun/lx2160acex7/lx2160a.c
+@@ -87,6 +87,11 @@ int board_fix_fdt(void *fdt)
+ 
+ 		/* LX2162 does not have second USB controller, disable */
+ 		do_fixup_by_path_string(fdt, "/usb3@3110000", "status", "disabled");
++
++		/* LX2162 SoM has different tlv eeprom - enable and patch alias */
++		do_fixup_by_path_string(fdt, "/aliases", "tlv0", "/i2c@2000000/eeprom@57");
++		do_fixup_by_path_string(fdt, "/i2c@2000000/eeprom@57", "status", "okay");
++		do_fixup_by_path_string(fdt, "/i2c@2000000/i2c-mux@77/i2c@0/eeprom@57", "status", "disabled");
+ 	}
+ 
+ 	board_fix_fdt_eth(fdt);
+-- 
+2.43.0
+
diff --git a/board/solidrun/lx2160acex7/patches/uboot/0014-cmd-tlv_eeprom-fix-alias-access-to-second-eeprom.patch b/board/solidrun/lx2160acex7/patches/uboot/0014-cmd-tlv_eeprom-fix-alias-access-to-second-eeprom.patch
new file mode 100644
index 000000000000..58158e98cd11
--- /dev/null
+++ b/board/solidrun/lx2160acex7/patches/uboot/0014-cmd-tlv_eeprom-fix-alias-access-to-second-eeprom.patch
@@ -0,0 +1,32 @@
+From 413ad975194c929a09199e6a67cf3d2b2f0fb337 Mon Sep 17 00:00:00 2001
+From: Josua Mayer <josua@solid-run.com>
+Date: Wed, 20 Nov 2024 13:43:02 +0100
+Subject: [PATCH] cmd: tlv_eeprom: fix alias access to second eeprom
+
+find function wrongly used ARRAY_SIZE function on a 2d pointer, always
+returning 1. Thus second eeprom can not be found.
+
+Replace with defined constant MAX_TLV_DEVICES.
+
+Fixes: "cmd: tlv_eeprom: support specifying tlv eeprom in DT alias tlv[0-255]"
+Signed-off-by: Josua Mayer <josua@solid-run.com>
+---
+ cmd/tlv_eeprom.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmd/tlv_eeprom.c b/cmd/tlv_eeprom.c
+index 546ede2dda2..881d7a8e3e6 100644
+--- a/cmd/tlv_eeprom.c
++++ b/cmd/tlv_eeprom.c
+@@ -906,7 +906,7 @@ static int find_tlv_devices(struct udevice **tlv_devices_p)
+ 	struct udevice *dev;
+ 
+ 	/* find by alias */
+-	for (int i = 0; i < ARRAY_SIZE(tlv_devices_p); i++) {
++	for (int i = 0; i < MAX_TLV_DEVICES; i++) {
+ 		snprintf(alias_name, sizeof(alias_name), "tlv%d", i);
+ 		node = ofnode_get_aliases_node(alias_name);
+ 		if (!ofnode_valid(node))
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
