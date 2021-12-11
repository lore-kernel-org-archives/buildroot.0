Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AABC433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 08:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A0194018B;
	Sat, 11 Dec 2021 08:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2uUuyBMjL0Jz; Sat, 11 Dec 2021 08:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 849F44234E;
	Sat, 11 Dec 2021 08:10:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 089901BF471
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0E098592D
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 08:10:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZwO1ckgVhIhP for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 08:10:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1B9B8592A
 for <buildroot@busybox.net>; Sat, 11 Dec 2021 08:10:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id j3so18597635wrp.1
 for <buildroot@busybox.net>; Sat, 11 Dec 2021 00:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1wyjBtbwoJdhm60PKxpTdfx0zhYCrBxyZpSZQ7i9GY=;
 b=i8/7QtnqPDUQ0fTOs3AlLOoDqy+BvEpJGz4Ry5KYm0WYem0+FZvhxp1CVXbuOBZAv6
 jpMiwAIFQjkCjPBdTedzCq52cMSkRaIoAgGWuEUT6a0/YG8EXQFEaIjuYf9cTu3ESKC2
 u/05/wUDwxQY5ZsY+SU2+AOiAuNz28+3hy8r6niN4RiYSuGggK+sVkfwfLIFNOXAWtNy
 qEBOV32Vk7yh4a2gi1rBjRpu1zwf8xqOTanCyheRcIMGxhgoLVdz0M065Hj+Z68DGgva
 mfje0PDO0CEcPO13R7GSFev3AbK2aYJs1m00D2UUagDTxH39BesN6ef0m/qand4lJkrU
 QjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o1wyjBtbwoJdhm60PKxpTdfx0zhYCrBxyZpSZQ7i9GY=;
 b=y4veKGkCSGkXOB0cvuxQWUK38W9TxhIpuPmcplNVDOJtkhPDLbkQeaZHIr/3cIfwx6
 tszqK4A+HLNlIt19+h5EnSqV8b55XadqfhzOqB6V0IGvHYzAHwDQWEBlkhSvAEkBIyo6
 2TFkd4Bd3M2R98ByK787yHzE0+1gS0Ze0X5GJVH5UbFtct3jH9HIPk5Pk0pymkzDfM7m
 DiU1ld8irE4udc1S0m75VBK9qmHXvtW4wfxOGTRbmCqrURjm+I41kgnfxuXGITO6vDFt
 DSgLGRCqshqikmWPbLOH68Jbrv7f8chXLC3pd6yPL0BxgS0vA3z4IFno2kGDlU9UT4oR
 svcw==
X-Gm-Message-State: AOAM5309nfLxOckKs/FpQ0k0HhK1Vwvj6rAWjjPTRGNCSlS9JL5lPX3D
 hGIJvd5emGfqhk2SqOE/A0rATKYHMLE=
X-Google-Smtp-Source: ABdhPJwkdXiSXDUpeXsRHJyNMlrPbnqvC3VjkkjhgSZYpKyE9rQsAHxgo21HFUaeGIDbFLXKiM2PuQ==
X-Received: by 2002:a05:6000:1813:: with SMTP id
 m19mr19312832wrh.51.1639210226645; 
 Sat, 11 Dec 2021 00:10:26 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id j134sm946699wmj.3.2021.12.11.00.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 00:10:26 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 11 Dec 2021 09:09:49 +0100
Message-Id: <20211211080949.206284-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] board/olimex/stmp1_olinuxino: add
 STMP157-OLinuXino-LIME2 board support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

kernel:
- the device tree is not yet mainline
- ITE IT66121 (HDMI) is mainline only since 5.14

u-boot:
- the device tree is not yet mainline
- this board uses AXP209 as PMIC instead of the STPMIC1,
  this use case of AXP209 is not mainline

arm-trusted-firmware:
at this time, there is no patch for this board,
so u-boot-spl is used as FSBL (basic boot chain)
---
 board/olimex/stmp1_olinuxino/genimage.cfg     |   25 +
 .../linux-dts/stm32mp1xx-olinuxino-lime.dts   |  379 ++++++
 board/olimex/stmp1_olinuxino/linux.config     |  285 +++++
 .../0001-add-driver-bridge-hdmi-it66121.patch | 1054 +++++++++++++++++
 .../linux/0002-more-display-olimex.patch      |  175 +++
 .../uboot/0001-AXP-not-only-with-sunxi.patch  |  168 +++
 .../uboot/0002-uses-AXP209-as-PMIC.patch      |  205 ++++
 .../0003-add-ethaddr-in-u-boot-env.patch      |   25 +
 board/olimex/stmp1_olinuxino/readme.txt       |   53 +
 .../boot/extlinux/extlinux.conf               |    4 +
 .../stm32mp1-olinuxino-lime-u-boot.dtsi       |  198 ++++
 .../uboot-dts/stm32mp1-olinuxino-lime.dts     |  368 ++++++
 board/olimex/stmp1_olinuxino/uboot.fragment   |   16 +
 .../olimex_stmp157_olinuxino_lime_defconfig   |   51 +
 14 files changed, 3006 insertions(+)
 create mode 100644 board/olimex/stmp1_olinuxino/genimage.cfg
 create mode 100644 board/olimex/stmp1_olinuxino/linux-dts/stm32mp1xx-olinuxino-lime.dts
 create mode 100644 board/olimex/stmp1_olinuxino/linux.config
 create mode 100644 board/olimex/stmp1_olinuxino/patches/linux/0001-add-driver-bridge-hdmi-it66121.patch
 create mode 100644 board/olimex/stmp1_olinuxino/patches/linux/0002-more-display-olimex.patch
 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/0001-AXP-not-only-with-sunxi.patch
 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/0002-uses-AXP209-as-PMIC.patch
 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/0003-add-ethaddr-in-u-boot-env.patch
 create mode 100644 board/olimex/stmp1_olinuxino/readme.txt
 create mode 100644 board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
 create mode 100644 board/olimex/stmp1_olinuxino/uboot-dts/stm32mp1-olinuxino-lime-u-boot.dtsi
 create mode 100644 board/olimex/stmp1_olinuxino/uboot-dts/stm32mp1-olinuxino-lime.dts
 create mode 100644 board/olimex/stmp1_olinuxino/uboot.fragment
 create mode 100644 configs/olimex_stmp157_olinuxino_lime_defconfig

diff --git a/board/olimex/stmp1_olinuxino/genimage.cfg b/board/olimex/stmp1_olinuxino/genimage.cfg
new file mode 100644
index 000000000..2f00ee979
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/genimage.cfg
@@ -0,0 +1,25 @@
+image sdcard.img {
+	hdimage {
+		gpt = "true"
+	}
+
+	partition fsbl1 {
+		image = "u-boot-spl.stm32"
+		size = 256K
+	}
+
+	partition fsbl2 {
+		image = "u-boot-spl.stm32"
+		size = 256K
+	}
+
+	partition ssbl {
+		image = "u-boot.img"
+		size = 2M
+	}
+
+	partition rootfs {
+		image = "rootfs.ext4"
+		bootable = "yes"
+	}
+}
diff --git a/board/olimex/stmp1_olinuxino/linux-dts/stm32mp1xx-olinuxino-lime.dts b/board/olimex/stmp1_olinuxino/linux-dts/stm32mp1xx-olinuxino-lime.dts
new file mode 100644
index 000000000..aa6029272
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/linux-dts/stm32mp1xx-olinuxino-lime.dts
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
+ * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
+ */
+/dts-v1/;
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+
+/ {
+	model = "STM32MP1XX OLinuXino";
+	compatible = "olimex,stm32mp1xx-olinuxino-lime" , "st,stm32mp153";
+	aliases {
+		ethernet0 = &ethernet0;
+		serial0 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xC0000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		gpu_reserved: gpu@e8000000 {
+			reg = <0xe8000000 0x8000000>;
+			no-map;
+		};
+	};
+
+	vdd_sd3v3: regulator_vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+
+	hdmi_3v3: regulator_hdmi {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-hdmi";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+
+	hdmi_1v8: regulator_hdmi1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-hdmi1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+
+	hdmi_1v2: regulator_hdmi1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-hdmi1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+
+	vbus_otg: regulator_otg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-otg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpios = <&gpioa 15 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+
+	vdd: vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+
+	vdd_usb: vdd-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-usb";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+
+	panel {
+		compatible = "olimex,lcd-olinuxino-10";
+		status = "disabled";
+
+		enable-gpios = <&gpiof 13 GPIO_ACTIVE_HIGH>;
+		//backlight = <&backlight>;
+
+		port {
+			panel_in_tcon0: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+	};
+};
+
+&dts {
+	status = "okay";
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_b>;
+	pinctrl-1 = <&ltdc_sleep_pins_b>;
+	status = "okay";
+
+	port {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ltdc_ep0_out: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&it66121_in>;
+		};
+	};
+};
+
+&ethernet0 {
+	status = "okay";
+	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy>;
+
+	mdio0 {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		ethphy: ethernet-phy@1 {
+			reg = <1>;
+			reset-gpios = <&gpiod 10 GPIO_ACTIVE_LOW>; /* ETH_RST# */
+			reset-assert-us = <10000>;
+			reset-deassert-us = <300>;
+			micrel,force-master;
+		};
+	};
+};
+
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_a>;
+	pinctrl-1 = <&m_can1_sleep_pins_a>;
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	it66121hdmitx: it66121hdmitx@4d {
+		compatible = "ite,it66121";
+		interrupts = <8 2>;
+		interrupt-parent = <&gpioi>;
+		vcn33-supply = <&hdmi_3v3>;
+		vcn18-supply = <&hdmi_1v8>;
+		vrf12-supply = <&hdmi_1v2>;
+		reset-gpios = <&gpiof 3  GPIO_ACTIVE_LOW >;
+		reg = <0x4d>;
+		pclk-dual-edge;
+
+		port {
+			it66121_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "disabled";
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&vdd_sd3v3>;
+	vqmmc-supply = <&vdd_sd3v3>;
+	status = "okay";
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&vdd_sd3v3>;
+	vqmmc-supply = <&vdd_sd3v3>;
+	status = "okay";
+};
+
+&qspi {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
+	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	flash0: w25q128@0 {
+		compatible = "jedec,spi-nor", "winbond,w25q128";
+		reg = <0>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <108000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&timers6 {
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	timer@5 {
+		status = "okay";
+	};
+};
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+	status = "okay";
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>, <&usbphyc_port1 1>;
+	phy-names = "usb", "usb";
+	status = "okay";
+};
+
+&usbh_ohci {
+	phys = <&usbphyc_port0>, <&usbphyc_port1 1>;
+	phy-names = "usb", "usb";
+	status = "okay";
+};
+
+&usbotg_hs {
+	compatible = "st,stm32mp15-fsotg", "snps,dwc2";			/* Use full-speed integrated PHY */
+	pinctrl-names = "default";
+	pinctrl-0 = <&usbotg_hs_pins_a &usbotg_fs_dp_dm_pins_a>;	/* configure OTG ID and full-speed data pins */
+	vbus-supply = <&vbus_otg>;					/* voltage regulator to supply Vbus */
+	status = "okay";
+};
diff --git a/board/olimex/stmp1_olinuxino/linux.config b/board/olimex/stmp1_olinuxino/linux.config
new file mode 100644
index 000000000..96c316b2c
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/linux.config
@@ -0,0 +1,285 @@
+
+#
+# General setup
+#
+CONFIG_SYSVIPC=y
+CONFIG_PREEMPT=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_NAMESPACES=y
+CONFIG_EMBEDDED=y
+
+#
+# System Type
+#
+CONFIG_ARCH_STM32=y
+CONFIG_ARM_THUMBEE=y
+
+#
+# Kernel Features
+#
+CONFIG_SMP=y
+CONFIG_HIGHMEM=y
+
+#
+# Floating point emulation
+#
+CONFIG_VFP=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+
+#
+# Cryptographic API
+#
+CONFIG_ARM_CRYPTO=y
+
+#
+# General architecture-dependent options
+#
+CONFIG_MODULES=y
+CONFIG_MODULE_FORCE_LOAD=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODVERSIONS=y
+
+#
+# Networking options
+#
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+
+#
+# CAN Device Drivers
+#
+CONFIG_CAN=m
+CONFIG_CAN_M_CAN=m
+CONFIG_CAN_M_CAN_PLATFORM=m
+
+# CONFIG_WIRELESS is not set
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+
+#
+# Device Tree and Open Firmware support
+#
+CONFIG_OF_OVERLAY=y
+
+#
+# Block devices
+#
+CONFIG_BLK_DEV_LOOP=y
+CONFIG_BLK_DEV_RAM=y
+CONFIG_BLK_DEV_RAM_COUNT=4
+
+#
+# Network device support
+#
+CONFIG_NETDEVICES=y
+CONFIG_STMMAC_ETH=y
+CONFIG_MICREL_PHY=y
+
+# CONFIG_WLAN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT_MOUSEDEV=m
+CONFIG_INPUT_EVDEV=m
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_AXP20X_PEK=m
+
+#
+# Character devices
+#
+CONFIG_SERIAL_STM32=y
+CONFIG_SERIAL_STM32_CONSOLE=y
+CONFIG_NULL_TTY=m
+CONFIG_SERIAL_DEV_BUS=m
+CONFIG_HW_RANDOM=y
+
+#
+# I2C support
+#
+CONFIG_I2C_CHARDEV=y
+CONFIG_I2C_MUX=y
+CONFIG_I2C_STM32F7=y
+
+#
+# SPI support
+#
+CONFIG_SPI=y
+CONFIG_SPI_MEM=y
+CONFIG_SPI_STM32=m
+CONFIG_SPI_STM32_QSPI=m
+
+#
+# Pin controllers
+#
+CONFIG_PINCTRL_AXP209=m
+
+#
+# Board level reset or power off
+#
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
+
+#
+# Thermal drivers
+#
+CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE=y
+CONFIG_CPU_THERMAL=y
+
+#
+# Watchdog Timer Support
+#
+CONFIG_WATCHDOG=y
+
+#
+# Multifunction device drivers
+#
+CONFIG_MFD_AXP20X_I2C=y
+CONFIG_MFD_STM32_LPTIMER=y
+
+#
+# Voltage and Current Regulator Support
+#
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_AXP20X=y
+CONFIG_REGULATOR_STM32_VREFBUF=y
+CONFIG_REGULATOR_STM32_PWR=y
+
+#
+# Graphics support
+#
+CONFIG_DRM=y
+CONFIG_DRM_STM=m
+CONFIG_DRM_STM_DSI=m
+CONFIG_DRM_PANEL_LVDS=m
+CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=m
+CONFIG_DRM_ITE_IT66121=m
+CONFIG_DRM_ETNAVIV=m
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
+CONFIG_BACKLIGHT_PWM=m
+CONFIG_BACKLIGHT_GPIO=m
+CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_LOGO=y
+
+#
+# USB support
+#
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_OHCI_HCD=y
+
+#
+# MMC/SD/SDIO card support
+#
+CONFIG_MMC=y
+CONFIG_MMC_ARMMMCI=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+
+#
+# LED drivers
+#
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+
+#
+# Real Time Clock
+#
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_STM32=y
+
+#
+# DMA Devices
+#
+CONFIG_DMADEVICES=y
+CONFIG_STM32_DMA=y
+CONFIG_STM32_DMAMUX=y
+CONFIG_STM32_MDMA=y
+
+#
+# Userspace I/O drivers
+#
+CONFIG_UIO=m
+CONFIG_UIO_PDRV_GENIRQ=m
+CONFIG_UIO_DMEM_GENIRQ=m
+
+#
+# Hardware Spinlock drivers
+#
+CONFIG_HWSPINLOCK=y
+CONFIG_HWSPINLOCK_STM32=y
+
+#
+# Clock Source driver
+#
+CONFIG_CLKSRC_STM32_LP=y
+
+#
+# Mailbox Hardware Support
+#
+CONFIG_STM32_IPCC=y
+
+#
+# Remoteproc drivers
+#
+CONFIG_REMOTEPROC=y
+CONFIG_STM32_RPROC=y
+
+#
+# Industrial I/O support
+#
+CONFIG_IIO=y
+CONFIG_IIO_SW_TRIGGER=y
+CONFIG_SD_ADC_MODULATOR=y
+CONFIG_STM32_ADC_CORE=y
+CONFIG_STM32_ADC=y
+CONFIG_STM32_DFSDM_ADC=y
+CONFIG_STM32_DAC=y
+CONFIG_IIO_HRTIMER_TRIGGER=y
+CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
+
+#
+# PWM Support
+#
+CONFIG_PWM=y
+CONFIG_PWM_STM32=m
+CONFIG_PWM_STM32_LP=m
+
+#
+# PHY Subsystem
+#
+CONFIG_PHY_STM32_USBPHYC=y
+
+#
+# NVMEM Support
+#
+CONFIG_NVMEM_STM32_ROMEM=y
+
+#
+# File systems
+#
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
+CONFIG_VFAT_FS=y
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NLS_UTF8=y
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=y
diff --git a/board/olimex/stmp1_olinuxino/patches/linux/0001-add-driver-bridge-hdmi-it66121.patch b/board/olimex/stmp1_olinuxino/patches/linux/0001-add-driver-bridge-hdmi-it66121.patch
new file mode 100644
index 000000000..c2540f40e
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/linux/0001-add-driver-bridge-hdmi-it66121.patch
@@ -0,0 +1,1054 @@
+From 6ed027bda27b01ea2b53f4a8eb0c14d2223b7f13 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Thu, 28 Oct 2021 20:32:11 +0200
+Subject: [PATCH] add driver bridge hdmi it66121
+
+fetched from https://github.com/OLIMEX/linux-olimex
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ drivers/gpu/drm/bridge/Kconfig       |   8 +
+ drivers/gpu/drm/bridge/Makefile      |   1 +
+ drivers/gpu/drm/bridge/ite-it66121.c | 999 +++++++++++++++++++++++++++
+ 3 files changed, 1008 insertions(+)
+ create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c
+
+diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
+index 4e82647a6..2e332e303 100644
+--- a/drivers/gpu/drm/bridge/Kconfig
++++ b/drivers/gpu/drm/bridge/Kconfig
+@@ -71,6 +71,14 @@ config DRM_LVDS_CODEC
+ 	  Support for transparent LVDS encoders and decoders that don't
+ 	  require any configuration.
+ 
++config DRM_ITE_IT66121
++       tristate "ITE IT66121 HDMI bridge"
++       depends on OF
++       select DRM_KMS_HELPER
++       select REGMAP_I2C
++       help
++         Support for ITE IT66121 HDMI bridge.
++
+ config DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW
+ 	tristate "MegaChips stdp4028-ge-b850v3-fw and stdp2690-ge-b850v3-fw"
+ 	depends on OF
+diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
+index 2b3aff104..98dff3d2d 100644
+--- a/drivers/gpu/drm/bridge/Makefile
++++ b/drivers/gpu/drm/bridge/Makefile
+@@ -3,6 +3,7 @@ obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
+ obj-$(CONFIG_DRM_CHRONTEL_CH7033) += chrontel-ch7033.o
+ obj-$(CONFIG_DRM_DISPLAY_CONNECTOR) += display-connector.o
+ obj-$(CONFIG_DRM_LONTIUM_LT9611) += lontium-lt9611.o
++obj-$(CONFIG_DRM_ITE_IT66121) += ite-it66121.o
+ obj-$(CONFIG_DRM_LVDS_CODEC) += lvds-codec.o
+ obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
+ obj-$(CONFIG_DRM_NXP_PTN3460) += nxp-ptn3460.o
+diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
+new file mode 100644
+index 000000000..863c95240
+--- /dev/null
++++ b/drivers/gpu/drm/bridge/ite-it66121.c
+@@ -0,0 +1,999 @@
++// SPDX-License-Identifier: GPL-2.0-only
++/*
++ * Copyright (C) 2020 Dimitar Gamishev <hehopmajieh@debian.bg>
++ * Copyright (C) 2020 BayLibre, SAS
++ * Author: Phong LE <ple@baylibre.com>
++ * Copyright (C) 2018-2019, Artem Mygaiev
++ * Copyright (C) 2017, Fresco Logic, Incorporated.
++ *
++ */
++
++#include <linux/device.h>
++#include <linux/i2c.h>
++#include <linux/interrupt.h>
++#include <linux/module.h>
++#include <linux/of.h>
++#include <linux/of_device.h>
++#include <linux/of_gpio.h>
++#include <linux/pinctrl/consumer.h>
++#include <linux/regmap.h>
++#include <linux/regulator/consumer.h>
++
++#include <drm/drm_atomic_helper.h>
++#include <drm/drm_bridge.h>
++#include <drm/drm_crtc_helper.h>
++#include <drm/drm_edid.h>
++#include <drm/drm_modes.h>
++#include <drm/drm_print.h>
++#include <drm/drm_probe_helper.h>
++
++#define IT66121_MASTER_SEL_REG			0x10
++#define IT66121_MASTER_SEL_HOST			BIT(0)
++
++#define IT66121_AFE_DRV_REG			0x61
++#define IT66121_AFE_DRV_RST			BIT(4)
++#define IT66121_AFE_DRV_PWD			BIT(5)
++
++#define IT66121_INPUT_MODE_REG			0x70
++#define IT66121_INPUT_MODE_RGB			(0 << 6)
++#define IT66121_INPUT_MODE_YUV422		BIT(6)
++#define IT66121_INPUT_MODE_YUV444		(2 << 6)
++#define IT66121_INPUT_MODE_CCIR656		BIT(4)
++#define IT66121_INPUT_MODE_SYNCEMB		BIT(3)
++#define IT66121_INPUT_MODE_DDR			BIT(2)
++
++#define IT66121_INPUT_CSC_REG			0x72
++#define IT66121_INPUT_CSC_ENDITHER		BIT(7)
++#define IT66121_INPUT_CSC_ENUDFILTER		BIT(6)
++#define IT66121_INPUT_CSC_DNFREE_GO		BIT(5)
++#define IT66121_INPUT_CSC_RGB_TO_YUV		0x02
++#define IT66121_INPUT_CSC_YUV_TO_RGB		0x03
++#define IT66121_INPUT_CSC_NO_CONV		0x00
++
++#define IT66121_AFE_XP_REG			0x62
++#define IT66121_AFE_XP_GAINBIT			BIT(7)
++#define IT66121_AFE_XP_PWDPLL			BIT(6)
++#define IT66121_AFE_XP_ENI			BIT(5)
++#define IT66121_AFE_XP_ENO			BIT(4)
++#define IT66121_AFE_XP_RESETB			BIT(3)
++#define IT66121_AFE_XP_PWDI			BIT(2)
++
++#define IT66121_AFE_IP_REG			0x64
++#define IT66121_AFE_IP_GAINBIT			BIT(7)
++#define IT66121_AFE_IP_PWDPLL			BIT(6)
++#define IT66121_AFE_IP_CKSEL_05			(0 << 4)
++#define IT66121_AFE_IP_CKSEL_1			BIT(4)
++#define IT66121_AFE_IP_CKSEL_2			(2 << 4)
++#define IT66121_AFE_IP_CKSEL_2OR4		(3 << 4)
++#define IT66121_AFE_IP_ER0			BIT(3)
++#define IT66121_AFE_IP_RESETB			BIT(2)
++#define IT66121_AFE_IP_ENC			BIT(1)
++#define IT66121_AFE_IP_EC1			BIT(0)
++
++#define IT66121_AFE_XP_EC1_REG			0x68
++#define IT66121_AFE_XP_EC1_LOWCLK		BIT(4)
++
++#define IT66121_SW_RST_REG			0x04
++#define IT66121_SW_RST_REF			BIT(5)
++#define IT66121_SW_RST_AREF			BIT(4)
++#define IT66121_SW_RST_VID			BIT(3)
++#define IT66121_SW_RST_AUD			BIT(2)
++#define IT66121_SW_RST_HDCP			BIT(0)
++
++#define IT66121_DDC_COMMAND_REG			0x15
++#define IT66121_DDC_COMMAND_BURST_READ		0x0
++#define IT66121_DDC_COMMAND_EDID_READ		0x3
++#define IT66121_DDC_COMMAND_FIFO_CLR		0x9
++#define IT66121_DDC_COMMAND_SCL_PULSE		0xA
++#define IT66121_DDC_COMMAND_ABORT		0xF
++
++#define IT66121_HDCP_REG			0x20
++#define IT66121_HDCP_CPDESIRED			BIT(0)
++#define IT66121_HDCP_EN1P1FEAT			BIT(1)
++
++#define IT66121_INT_STATUS1_REG			0x06
++#define IT66121_INT_STATUS1_AUD_OVF		BIT(7)
++#define IT66121_INT_STATUS1_DDC_NOACK		BIT(5)
++#define IT66121_INT_STATUS1_DDC_FIFOERR		BIT(4)
++#define IT66121_INT_STATUS1_DDC_BUSHANG		BIT(2)
++#define IT66121_INT_STATUS1_RX_SENS_STATUS	BIT(1)
++#define IT66121_INT_STATUS1_HPD_STATUS		BIT(0)
++
++#define IT66121_DDC_HEADER_REG			0x11
++#define IT66121_DDC_HEADER_HDCP			0x74
++#define IT66121_DDC_HEADER_EDID			0xA0
++
++#define IT66121_DDC_OFFSET_REG			0x12
++#define IT66121_DDC_BYTE_REG			0x13
++#define IT66121_DDC_SEGMENT_REG			0x14
++#define IT66121_DDC_RD_FIFO_REG			0x17
++
++#define IT66121_CLK_BANK_REG			0x0F
++#define IT66121_CLK_BANK_PWROFF_RCLK		BIT(6)
++#define IT66121_CLK_BANK_PWROFF_ACLK		BIT(5)
++#define IT66121_CLK_BANK_PWROFF_TXCLK		BIT(4)
++#define IT66121_CLK_BANK_PWROFF_CRCLK		BIT(3)
++#define IT66121_CLK_BANK_0			0
++#define IT66121_CLK_BANK_1			1
++
++#define IT66121_INT_REG				0x05
++#define IT66121_INT_ACTIVE_HIGH			BIT(7)
++#define IT66121_INT_OPEN_DRAIN			BIT(6)
++#define IT66121_INT_TX_CLK_OFF			BIT(0)
++
++#define IT66121_INT_MASK1_REG			0x09
++#define IT66121_INT_MASK1_AUD_OVF		BIT(7)
++#define IT66121_INT_MASK1_DDC_NOACK		BIT(5)
++#define IT66121_INT_MASK1_DDC_FIFOERR		BIT(4)
++#define IT66121_INT_MASK1_DDC_BUSHANG		BIT(2)
++#define IT66121_INT_MASK1_RX_SENS		BIT(1)
++#define IT66121_INT_MASK1_HPD			BIT(0)
++
++#define IT66121_INT_CLR1_REG			0x0C
++#define IT66121_INT_CLR1_PKTACP			BIT(7)
++#define IT66121_INT_CLR1_PKTNULL		BIT(6)
++#define IT66121_INT_CLR1_PKTGEN			BIT(5)
++#define IT66121_INT_CLR1_KSVLISTCHK		BIT(4)
++#define IT66121_INT_CLR1_AUTHDONE		BIT(3)
++#define IT66121_INT_CLR1_AUTHFAIL		BIT(2)
++#define IT66121_INT_CLR1_RX_SENS		BIT(1)
++#define IT66121_INT_CLR1_HPD			BIT(0)
++
++#define IT66121_AV_MUTE_REG			0xC1
++#define IT66121_AV_MUTE_ON			BIT(0)
++#define IT66121_AV_MUTE_BLUESCR			BIT(1)
++
++#define IT66121_PKT_GEN_CTRL_REG		0xC6
++#define IT66121_PKT_GEN_CTRL_ON			BIT(0)
++#define IT66121_PKT_GEN_CTRL_RPT		BIT(1)
++
++#define IT66121_AVIINFO_DB1_REG			0x158
++#define IT66121_AVIINFO_DB2_REG			0x159
++#define IT66121_AVIINFO_DB3_REG			0x15A
++#define IT66121_AVIINFO_DB4_REG			0x15B
++#define IT66121_AVIINFO_DB5_REG			0x15C
++#define IT66121_AVIINFO_CSUM_REG		0x15D
++#define IT66121_AVIINFO_DB6_REG			0x15E
++#define IT66121_AVIINFO_DB7_REG			0x15F
++#define IT66121_AVIINFO_DB8_REG			0x160
++#define IT66121_AVIINFO_DB9_REG			0x161
++#define IT66121_AVIINFO_DB10_REG		0x162
++#define IT66121_AVIINFO_DB11_REG		0x163
++#define IT66121_AVIINFO_DB12_REG		0x164
++#define IT66121_AVIINFO_DB13_REG		0x165
++
++#define IT66121_AVI_INFO_PKT_REG		0xCD
++#define IT66121_AVI_INFO_PKT_ON			BIT(0)
++#define IT66121_AVI_INFO_PKT_RPT		BIT(1)
++
++#define IT66121_HDMI_MODE_REG			0xC0
++#define IT66121_HDMI_MODE_HDMI			BIT(0)
++
++#define IT66121_SYS_STATUS_REG			0x0E
++#define IT66121_SYS_STATUS_ACTIVE_IRQ		BIT(7)
++#define IT66121_SYS_STATUS_HPDETECT		BIT(6)
++#define IT66121_SYS_STATUS_SENDECTECT		BIT(5)
++#define IT66121_SYS_STATUS_VID_STABLE		BIT(4)
++#define IT66121_SYS_STATUS_AUD_CTS_CLR		BIT(1)
++#define IT66121_SYS_STATUS_CLEAR_IRQ		BIT(0)
++
++#define IT66121_DDC_STATUS_REG			0x16
++#define IT66121_DDC_STATUS_TX_DONE		BIT(7)
++#define IT66121_DDC_STATUS_ACTIVE		BIT(6)
++#define IT66121_DDC_STATUS_NOACK		BIT(5)
++#define IT66121_DDC_STATUS_WAIT_BUS		BIT(4)
++#define IT66121_DDC_STATUS_ARBI_LOSE		BIT(3)
++#define IT66121_DDC_STATUS_FIFO_FULL		BIT(2)
++#define IT66121_DDC_STATUS_FIFO_EMPTY		BIT(1)
++#define IT66121_DDC_STATUS_FIFO_VALID		BIT(0)
++
++#define IT66121_VENDOR_ID0			0x54
++#define IT66121_VENDOR_ID1			0x49
++#define IT66121_DEVICE_ID0			0x12
++#define IT66121_DEVICE_ID1			0x06
++#define IT66121_DEVICE_MASK			0x0F
++#define IT66121_EDID_SLEEP			20000
++#define IT66121_EDID_TIMEOUT			200000
++#define IT66121_EDID_FIFO_SIZE			32
++#define IT66121_AFE_CLK_HIGH			80000
++
++struct it66121_conf {
++	unsigned int input_mode_reg;
++	unsigned int input_conversion_reg;
++};
++
++struct it66121_ctx {
++	struct regmap *regmap;
++	struct drm_bridge bridge;
++	struct drm_connector connector;
++	struct device *dev;
++	struct gpio_desc *gpio_reset;
++	struct i2c_client *client;
++	struct regulator_bulk_data supplies[3];
++	bool dual_edge;
++	const struct it66121_conf *conf;
++	struct mutex lock; /* Protects fields below and device registers */
++	struct edid *edid;
++	struct hdmi_avi_infoframe hdmi_avi_infoframe;
++};
++
++static const struct regmap_range_cfg it66121_regmap_banks[] = {
++	{
++		.name = "it66121",
++		.range_min = 0x00,
++		.range_max = 0x1FF,
++		.selector_reg = IT66121_CLK_BANK_REG,
++		.selector_mask = 0x1,
++		.selector_shift = 0,
++		.window_start = 0x00,
++		.window_len = 0x130,
++	},
++};
++
++static const struct regmap_config it66121_regmap_config = {
++	.val_bits = 8,
++	.reg_bits = 8,
++	.max_register = 0x1FF,
++	.ranges = it66121_regmap_banks,
++	.num_ranges = ARRAY_SIZE(it66121_regmap_banks),
++};
++
++static const struct it66121_conf it66121_conf_simple = {
++//	.input_mode_reg = IT66121_INPUT_MODE_RGB | IT66121_INPUT_MODE_DDR,
++	.input_mode_reg = IT66121_INPUT_MODE_RGB,
++	.input_conversion_reg = IT66121_INPUT_CSC_NO_CONV,
++};
++
++static void it66121_hw_reset(struct it66121_ctx *ctx)
++{
++	gpiod_set_value(ctx->gpio_reset, 1);
++	msleep(20);
++	gpiod_set_value(ctx->gpio_reset, 0);
++}
++
++static int ite66121_power_on(struct it66121_ctx *ctx)
++{
++	return regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
++}
++
++static int ite66121_power_off(struct it66121_ctx *ctx)
++{
++	return regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
++}
++
++static int it66121_preamble_ddc(struct it66121_ctx *ctx)
++{
++	return regmap_write(ctx->regmap, IT66121_MASTER_SEL_REG,
++				IT66121_MASTER_SEL_HOST);
++}
++
++static int it66121_fire_afe(struct it66121_ctx *ctx)
++{
++	return regmap_write(ctx->regmap, IT66121_AFE_DRV_REG, 0);
++}
++
++static int it66121_configure_input(struct it66121_ctx *ctx)
++{
++	int ret;
++
++	ret = regmap_write(ctx->regmap, IT66121_INPUT_MODE_REG,
++			   ctx->conf->input_mode_reg);
++	if (ret)
++		return ret;
++
++	return regmap_write(ctx->regmap, IT66121_INPUT_CSC_REG,
++			    ctx->conf->input_conversion_reg);
++}
++
++/**
++ * it66121_configure_afe() - Configure the analog front end
++ * @ctx: it66121_ctx object
++ *
++ * RETURNS:
++ * zero if success, a negative error code otherwise.
++ */
++static int it66121_configure_afe(struct it66121_ctx *ctx,
++				 const struct drm_display_mode *mode)
++{
++	int ret;
++
++	ret = regmap_write(ctx->regmap, IT66121_AFE_DRV_REG,
++			   IT66121_AFE_DRV_RST);
++	if (ret)
++		return ret;
++
++	if (mode->clock > IT66121_AFE_CLK_HIGH) {
++		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
++					IT66121_AFE_XP_GAINBIT |
++					IT66121_AFE_XP_ENO,
++					IT66121_AFE_XP_GAINBIT);
++		if (ret)
++			return ret;
++
++		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
++					IT66121_AFE_IP_GAINBIT |
++					IT66121_AFE_IP_ER0 |
++					IT66121_AFE_IP_EC1,
++					IT66121_AFE_IP_GAINBIT);
++		if (ret)
++			return ret;
++
++		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_EC1_REG,
++					IT66121_AFE_XP_EC1_LOWCLK, 0x80);
++		if (ret)
++			return ret;
++	} else {
++		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
++					IT66121_AFE_XP_GAINBIT |
++					IT66121_AFE_XP_ENO,
++					IT66121_AFE_XP_ENO);
++		if (ret)
++			return ret;
++
++		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
++					IT66121_AFE_IP_GAINBIT |
++					IT66121_AFE_IP_ER0 |
++					IT66121_AFE_IP_EC1, IT66121_AFE_IP_ER0 |
++					IT66121_AFE_IP_EC1);
++		if (ret)
++			return ret;
++
++		ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_EC1_REG,
++					IT66121_AFE_XP_EC1_LOWCLK,
++					IT66121_AFE_XP_EC1_LOWCLK);
++		if (ret)
++			return ret;
++	}
++
++	/* Clear reset flags */
++	ret = regmap_write_bits(ctx->regmap, IT66121_SW_RST_REG,
++				IT66121_SW_RST_REF | IT66121_SW_RST_VID,
++				~(IT66121_SW_RST_REF | IT66121_SW_RST_VID) &
++				0xFF);
++	if (ret)
++		return ret;
++
++	return it66121_fire_afe(ctx);
++}
++
++static inline int it66121_wait_ddc_ready(struct it66121_ctx *ctx)
++{
++	int ret, val;
++
++	ret = regmap_read_poll_timeout(ctx->regmap, IT66121_DDC_STATUS_REG,
++				       val, true,
++				       IT66121_EDID_SLEEP,
++				       IT66121_EDID_TIMEOUT);
++	if (ret)
++		return ret;
++
++	if (val & (IT66121_DDC_STATUS_NOACK | IT66121_DDC_STATUS_WAIT_BUS |
++	    IT66121_DDC_STATUS_ARBI_LOSE))
++		return -EAGAIN;
++
++	return 0;
++}
++
++static int it66121_clear_ddc_fifo(struct it66121_ctx *ctx)
++{
++	int ret;
++
++	ret = it66121_preamble_ddc(ctx);
++	if (ret)
++		return ret;
++
++	return regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
++			    IT66121_DDC_COMMAND_FIFO_CLR);
++}
++
++static int it66121_abort_ddc_ops(struct it66121_ctx *ctx)
++{
++	int ret;
++	unsigned int swreset, cpdesire;
++
++	ret = regmap_read(ctx->regmap, IT66121_SW_RST_REG, &swreset);
++	if (ret)
++		return ret;
++
++	ret = regmap_read(ctx->regmap, IT66121_HDCP_REG, &cpdesire);
++	if (ret)
++		return ret;
++
++	ret = regmap_write(ctx->regmap, IT66121_HDCP_REG,
++			   cpdesire & (~IT66121_HDCP_CPDESIRED & 0xFF));
++	if (ret)
++		return ret;
++
++	ret = regmap_write(ctx->regmap, IT66121_SW_RST_REG,
++			   swreset | IT66121_SW_RST_HDCP);
++	if (ret)
++		return ret;
++
++	ret = it66121_preamble_ddc(ctx);
++	if (ret)
++		return ret;
++
++	ret = regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
++			   IT66121_DDC_COMMAND_ABORT);
++	if (ret)
++		return ret;
++
++	return it66121_wait_ddc_ready(ctx);
++}
++
++static int it66121_get_edid_block(void *context, u8 *buf,
++				  unsigned int block, size_t len)
++{
++	struct it66121_ctx *ctx = context;
++	unsigned int val;
++	int remain = len;
++	int offset = 0;
++	int ret, cnt;
++
++	offset = (block % 2) * len;
++	block = block / 2;
++
++	ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
++	if (ret)
++		return ret;
++
++	if (val & IT66121_INT_STATUS1_DDC_BUSHANG) {
++		ret = it66121_abort_ddc_ops(ctx);
++		if (ret)
++			return ret;
++	}
++
++	ret = it66121_clear_ddc_fifo(ctx);
++	if (ret)
++		return ret;
++
++	while (remain > 0) {
++		cnt = (remain > IT66121_EDID_FIFO_SIZE) ?
++				IT66121_EDID_FIFO_SIZE : remain;
++		ret = it66121_preamble_ddc(ctx);
++		if (ret)
++			return ret;
++
++		ret = regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
++				   IT66121_DDC_COMMAND_FIFO_CLR);
++		if (ret)
++			return ret;
++
++		ret = it66121_wait_ddc_ready(ctx);
++		if (ret)
++			return ret;
++
++		ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
++		if (ret)
++			return ret;
++
++		if (val & IT66121_INT_STATUS1_DDC_BUSHANG) {
++			ret = it66121_abort_ddc_ops(ctx);
++			if (ret)
++				return ret;
++		}
++
++		ret = it66121_preamble_ddc(ctx);
++		if (ret)
++			return ret;
++
++		ret = regmap_write(ctx->regmap, IT66121_DDC_HEADER_REG,
++				   IT66121_DDC_HEADER_EDID);
++		if (ret)
++			return ret;
++
++		ret = regmap_write(ctx->regmap, IT66121_DDC_OFFSET_REG, offset);
++		if (ret)
++			return ret;
++
++		ret = regmap_write(ctx->regmap, IT66121_DDC_BYTE_REG, cnt);
++		if (ret)
++			return ret;
++
++		ret = regmap_write(ctx->regmap, IT66121_DDC_SEGMENT_REG, block);
++		if (ret)
++			return ret;
++
++		ret = regmap_write(ctx->regmap, IT66121_DDC_COMMAND_REG,
++				   IT66121_DDC_COMMAND_EDID_READ);
++		if (ret)
++			return ret;
++
++		offset += cnt;
++		remain -= cnt;
++		msleep(20);
++
++		ret = it66121_wait_ddc_ready(ctx);
++		if (ret)
++			return ret;
++
++		do {
++			ret = regmap_read(ctx->regmap,
++					  IT66121_DDC_RD_FIFO_REG, &val);
++			if (ret)
++				return ret;
++			*(buf++) = val;
++			cnt--;
++		} while (cnt > 0);
++	}
++
++	return 0;
++}
++
++static int it66121_connector_get_modes(struct drm_connector *connector)
++{
++	int ret, num_modes = 0;
++	struct it66121_ctx *ctx = container_of(connector, struct it66121_ctx,
++			connector);
++
++	if (ctx->edid)
++		return drm_add_edid_modes(connector, ctx->edid);
++
++	mutex_lock(&ctx->lock);
++
++	ctx->edid = drm_do_get_edid(connector, it66121_get_edid_block, ctx);
++	if (!ctx->edid) {
++		DRM_ERROR("Failed to read EDID\n");
++		goto unlock;
++	}
++
++	ret = drm_connector_update_edid_property(connector,
++						 ctx->edid);
++	if (ret) {
++		DRM_ERROR("Failed to update EDID property: %d\n", ret);
++		goto unlock;
++	}
++
++	num_modes = drm_add_edid_modes(connector, ctx->edid);
++
++unlock:
++	mutex_unlock(&ctx->lock);
++
++	return num_modes;
++}
++
++static bool it66121_is_hpd_detect(struct it66121_ctx *ctx)
++{
++	int val;
++
++	if (regmap_read(ctx->regmap, IT66121_SYS_STATUS_REG, &val))
++		return false;
++
++	return (val & IT66121_SYS_STATUS_HPDETECT);
++}
++
++static int it66121_connector_detect_ctx(struct drm_connector *connector,
++					struct drm_modeset_acquire_ctx *c,
++					bool force)
++{
++	struct it66121_ctx *ctx = container_of(connector, struct it66121_ctx,
++			connector);
++
++	return (it66121_is_hpd_detect(ctx)) ?
++		connector_status_connected : connector_status_disconnected;
++}
++
++static enum drm_mode_status
++it66121_connector_mode_valid(struct drm_connector *connector,
++			     struct drm_display_mode *mode)
++{
++	unsigned long max_clock;
++	struct it66121_ctx *ctx = container_of(connector, struct it66121_ctx,
++			connector);
++
++	max_clock = ctx->dual_edge ? 74250 : 148500;
++
++	if (mode->clock > max_clock)
++		return MODE_CLOCK_HIGH;
++
++	if (mode->clock < 25000)
++		return MODE_CLOCK_LOW;
++
++	return MODE_OK;
++}
++
++static struct drm_connector_helper_funcs it66121_connector_helper_funcs = {
++	.get_modes = it66121_connector_get_modes,
++	.detect_ctx = it66121_connector_detect_ctx,
++	.mode_valid = it66121_connector_mode_valid,
++};
++
++static const struct drm_connector_funcs it66121_connector_funcs = {
++	.reset = drm_atomic_helper_connector_reset,
++	.fill_modes = drm_helper_probe_single_connector_modes,
++	.destroy = drm_connector_cleanup,
++	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
++	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
++};
++
++static int it66121_bridge_attach(struct drm_bridge *bridge,
++				 enum drm_bridge_attach_flags flags)
++{
++	int ret;
++	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx,
++			bridge);
++#if 0
++	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
++		DRM_ERROR("Fix bridge driver to make connector optional!");
++		return -EINVAL;
++	}
++#endif
++	if (!bridge->encoder) {
++		DRM_ERROR("Parent encoder object not found");
++		return -ENODEV;
++	}
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
++				IT66121_CLK_BANK_PWROFF_RCLK, 0);
++	if (ret)
++		return ret;
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_INT_REG,
++				IT66121_INT_TX_CLK_OFF, 0);
++	if (ret)
++		return ret;
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_DRV_REG,
++				IT66121_AFE_DRV_PWD, 0);
++	if (ret)
++		return ret;
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
++				IT66121_AFE_XP_PWDI | IT66121_AFE_XP_PWDPLL, 0);
++	if (ret)
++		return ret;
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
++				IT66121_AFE_IP_PWDPLL, 0);
++	if (ret)
++		return ret;
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_DRV_REG,
++				IT66121_AFE_DRV_RST, 0);
++	if (ret)
++		return ret;
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_XP_REG,
++				IT66121_AFE_XP_RESETB, IT66121_AFE_XP_RESETB);
++	if (ret)
++		return ret;
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_AFE_IP_REG,
++				IT66121_AFE_IP_RESETB, IT66121_AFE_IP_RESETB);
++	if (ret)
++		return ret;
++
++	ret = regmap_write_bits(ctx->regmap, IT66121_SW_RST_REG,
++				IT66121_SW_RST_REF,
++				IT66121_SW_RST_REF);
++	if (ret)
++		return ret;
++
++	msleep(50);
++
++	ret = drm_connector_init(bridge->dev, &ctx->connector,
++				 &it66121_connector_funcs,
++				 DRM_MODE_CONNECTOR_HDMIA);
++	if (ret)
++		return ret;
++
++	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
++	drm_connector_helper_add(&ctx->connector,
++				 &it66121_connector_helper_funcs);
++
++	ret = drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
++	if (ret)
++		return ret;
++
++	ret = drm_connector_register(&ctx->connector);
++	if (ret)
++		return ret;
++
++	/* Start interrupts */
++	return regmap_write_bits(ctx->regmap, IT66121_INT_MASK1_REG,
++				 IT66121_INT_MASK1_DDC_NOACK |
++				 IT66121_INT_MASK1_HPD |
++				 IT66121_INT_MASK1_DDC_FIFOERR |
++				 IT66121_INT_MASK1_DDC_BUSHANG,
++				 ~(IT66121_INT_MASK1_DDC_NOACK |
++				 IT66121_INT_MASK1_HPD |
++				 IT66121_INT_MASK1_DDC_FIFOERR |
++				 IT66121_INT_MASK1_DDC_BUSHANG) & 0xFF);
++}
++
++static int it66121_set_mute(struct it66121_ctx *ctx, bool mute)
++{
++	int ret;
++	unsigned int val;
++
++	val = mute ? IT66121_AV_MUTE_ON : (~IT66121_AV_MUTE_ON & 0xFF);
++	ret = regmap_write_bits(ctx->regmap, IT66121_AV_MUTE_REG,
++				IT66121_AV_MUTE_ON, val);
++	if (ret)
++		return ret;
++
++	return regmap_write(ctx->regmap, IT66121_PKT_GEN_CTRL_REG,
++			    IT66121_PKT_GEN_CTRL_ON |
++			    IT66121_PKT_GEN_CTRL_RPT);
++}
++
++static void it66121_bridge_enable(struct drm_bridge *bridge)
++{
++	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx,
++			bridge);
++
++	it66121_set_mute(ctx, false);
++}
++
++static void it66121_bridge_disable(struct drm_bridge *bridge)
++{
++	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx,
++			bridge);
++
++	it66121_set_mute(ctx, true);
++}
++
++static
++void it66121_bridge_mode_set(struct drm_bridge *bridge,
++			     const struct drm_display_mode *mode,
++			     const struct drm_display_mode *adjusted_mode)
++{
++	int ret, i;
++	u8 buf[HDMI_INFOFRAME_SIZE(AVI)];
++	struct it66121_ctx *ctx = container_of(bridge, struct it66121_ctx,
++			bridge);
++	const u16 aviinfo_reg[HDMI_AVI_INFOFRAME_SIZE] = {
++		IT66121_AVIINFO_DB1_REG,
++		IT66121_AVIINFO_DB2_REG,
++		IT66121_AVIINFO_DB3_REG,
++		IT66121_AVIINFO_DB4_REG,
++		IT66121_AVIINFO_DB5_REG,
++		IT66121_AVIINFO_DB6_REG,
++		IT66121_AVIINFO_DB7_REG,
++		IT66121_AVIINFO_DB8_REG,
++		IT66121_AVIINFO_DB9_REG,
++		IT66121_AVIINFO_DB10_REG,
++		IT66121_AVIINFO_DB11_REG,
++		IT66121_AVIINFO_DB12_REG,
++		IT66121_AVIINFO_DB13_REG
++	};
++
++	mutex_lock(&ctx->lock);
++
++	hdmi_avi_infoframe_init(&ctx->hdmi_avi_infoframe);
++
++	ret = drm_hdmi_avi_infoframe_from_display_mode(&ctx->hdmi_avi_infoframe,
++						       &ctx->connector,
++						       adjusted_mode);
++	if (ret) {
++		DRM_ERROR("Failed to setup AVI infoframe: %d\n", ret);
++		goto unlock;
++	}
++
++	ret = hdmi_avi_infoframe_pack(&ctx->hdmi_avi_infoframe, buf,
++				      sizeof(buf));
++	if (ret < 0) {
++		DRM_ERROR("Failed to pack infoframe: %d\n", ret);
++		goto unlock;
++	}
++
++	/* Write new AVI infoframe packet */
++	for (i = 0; i < HDMI_AVI_INFOFRAME_SIZE; i++) {
++		if (regmap_write(ctx->regmap, aviinfo_reg[i],
++				 buf[i + HDMI_INFOFRAME_HEADER_SIZE]))
++			goto unlock;
++	}
++	if (regmap_write(ctx->regmap, IT66121_AVIINFO_CSUM_REG, buf[3]))
++		goto unlock;
++
++	/* Enable AVI infoframe */
++	if (regmap_write(ctx->regmap, IT66121_AVI_INFO_PKT_REG,
++			 IT66121_AVI_INFO_PKT_ON |
++			 IT66121_AVI_INFO_PKT_RPT))
++		goto unlock;
++
++	/* Set TX mode to HDMI */
++	if (regmap_write(ctx->regmap, IT66121_HDMI_MODE_REG,
++			 IT66121_HDMI_MODE_HDMI))
++		goto unlock;
++
++	if (regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
++			      IT66121_CLK_BANK_PWROFF_TXCLK,
++			      IT66121_CLK_BANK_PWROFF_TXCLK))
++		goto unlock;
++
++	if (it66121_configure_input(ctx))
++		goto unlock;
++
++	if (it66121_configure_afe(ctx, adjusted_mode))
++		goto unlock;
++
++	regmap_write_bits(ctx->regmap, IT66121_CLK_BANK_REG,
++			  IT66121_CLK_BANK_PWROFF_TXCLK,
++			  ~IT66121_CLK_BANK_PWROFF_TXCLK & 0xFF);
++
++unlock:
++	mutex_unlock(&ctx->lock);
++}
++
++static const struct drm_bridge_funcs it66121_bridge_funcs = {
++	.attach = it66121_bridge_attach,
++	.enable = it66121_bridge_enable,
++	.disable = it66121_bridge_disable,
++	.mode_set = it66121_bridge_mode_set,
++};
++
++static irqreturn_t it66121_irq_threaded_handler(int irq, void *dev_id)
++{
++	int ret;
++	unsigned int val;
++	struct it66121_ctx *ctx = dev_id;
++	struct device *dev = ctx->dev;
++	bool event = false;
++
++	mutex_lock(&ctx->lock);
++
++	ret = regmap_read(ctx->regmap, IT66121_SYS_STATUS_REG, &val);
++	if (ret)
++		goto unlock;
++
++	if (val & IT66121_SYS_STATUS_ACTIVE_IRQ) {
++		ret = regmap_read(ctx->regmap, IT66121_INT_STATUS1_REG, &val);
++		if (ret) {
++			dev_err(dev, "Cannot read STATUS1_REG %d\n", ret);
++		} else {
++			if (val & IT66121_INT_STATUS1_DDC_FIFOERR)
++				it66121_clear_ddc_fifo(ctx);
++			if (val & (IT66121_INT_STATUS1_DDC_BUSHANG |
++					IT66121_INT_STATUS1_DDC_NOACK))
++				it66121_abort_ddc_ops(ctx);
++			if (val & IT66121_INT_STATUS1_HPD_STATUS) {
++				regmap_write_bits(ctx->regmap,
++						  IT66121_INT_CLR1_REG,
++						  IT66121_INT_CLR1_HPD,
++						  IT66121_INT_CLR1_HPD);
++
++				if (!it66121_is_hpd_detect(ctx)) {
++					kfree(ctx->edid);
++					ctx->edid = NULL;
++				}
++				event = true;
++			}
++		}
++
++		regmap_write_bits(ctx->regmap, IT66121_SYS_STATUS_REG,
++				  IT66121_SYS_STATUS_CLEAR_IRQ,
++				  IT66121_SYS_STATUS_CLEAR_IRQ);
++	}
++
++unlock:
++	mutex_unlock(&ctx->lock);
++
++	if (event)
++		drm_helper_hpd_irq_event(ctx->bridge.dev);
++
++	return IRQ_HANDLED;
++}
++
++static int it66121_probe(struct i2c_client *client,
++			 const struct i2c_device_id *id)
++{
++	u8 ids[4];
++	int i, ret;
++	struct it66121_ctx *ctx;
++	struct device *dev = &client->dev;
++
++	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
++		dev_err(dev, "I2C check functionality failed.\n");
++		return -ENXIO;
++	}
++
++	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
++	if (!ctx)
++		return -ENOMEM;
++
++	ctx->dev = dev;
++	ctx->client = client;
++	i2c_set_clientdata(client, ctx);
++	mutex_init(&ctx->lock);
++	ctx->conf = (struct it66121_conf *)of_device_get_match_data(dev);
++	if (!ctx->conf)
++		return -ENODEV;
++
++	ctx->supplies[0].supply = "vcn33";
++	ctx->supplies[1].supply = "vcn18";
++	ctx->supplies[2].supply = "vrf12";
++	ret = devm_regulator_bulk_get(ctx->dev, 3, ctx->supplies);
++	if (ret) {
++		dev_err(ctx->dev, "regulator_bulk failed\n");
++		return ret;
++	}
++
++	ctx->dual_edge = of_property_read_bool(dev->of_node, "pclk-dual-edge");
++
++	ret = ite66121_power_on(ctx);
++	if (ret)
++		return ret;
++
++	it66121_hw_reset(ctx);
++
++	ctx->regmap = devm_regmap_init_i2c(client, &it66121_regmap_config);
++	if (IS_ERR(ctx->regmap)) {
++		ite66121_power_off(ctx);
++		return PTR_ERR(ctx);
++	}
++
++	for (i = 0; i < 4; i++) {
++		regmap_read(ctx->regmap, i, &ret);
++		ids[i] = ret;
++	}
++
++	if (ids[0] != IT66121_VENDOR_ID0 ||
++	    ids[1] != IT66121_VENDOR_ID1 ||
++	    ids[2] != IT66121_DEVICE_ID0 ||
++	    ((ids[3] & IT66121_DEVICE_MASK) != IT66121_DEVICE_ID1)) {
++		ite66121_power_off(ctx);
++		return -ENODEV;
++	}
++
++	ctx->bridge.funcs = &it66121_bridge_funcs;
++	ctx->bridge.of_node = dev->of_node;
++
++	ret = devm_request_threaded_irq(dev, client->irq, NULL,
++					it66121_irq_threaded_handler,
++					IRQF_SHARED | IRQF_TRIGGER_LOW |
++					IRQF_ONESHOT,
++					dev_name(dev),
++					ctx);
++	if (ret < 0) {
++		dev_err(dev, "Failed to request irq %d:%d\n", client->irq, ret);
++		ite66121_power_off(ctx);
++		return ret;
++	}
++
++	drm_bridge_add(&ctx->bridge);
++
++	return 0;
++}
++
++static int it66121_remove(struct i2c_client *client)
++{
++	struct it66121_ctx *ctx = i2c_get_clientdata(client);
++
++	ite66121_power_off(ctx);
++	drm_bridge_remove(&ctx->bridge);
++	kfree(ctx->edid);
++	mutex_destroy(&ctx->lock);
++
++	return 0;
++}
++
++static const struct of_device_id it66121_dt_match[] = {
++	{ .compatible = "ite,it66121",
++	  .data = &it66121_conf_simple,
++	},
++	{ },
++};
++MODULE_DEVICE_TABLE(of, it66121_dt_match);
++
++static const struct i2c_device_id it66121_id[] = {
++	{ "it66121", 0 },
++	{ },
++};
++MODULE_DEVICE_TABLE(i2c, it66121_id);
++
++static struct i2c_driver it66121_driver = {
++	.driver = {
++		.name	= "it66121",
++		.of_match_table = it66121_dt_match,
++	},
++	.probe = it66121_probe,
++	.remove = it66121_remove,
++	.id_table = it66121_id,
++};
++
++module_i2c_driver(it66121_driver);
++
++MODULE_AUTHOR("Phong LE");
++MODULE_DESCRIPTION("IT66121 HDMI transmitter driver");
++MODULE_LICENSE("GPL v2");
+-- 
+2.25.1
+
diff --git a/board/olimex/stmp1_olinuxino/patches/linux/0002-more-display-olimex.patch b/board/olimex/stmp1_olinuxino/patches/linux/0002-more-display-olimex.patch
new file mode 100644
index 000000000..6353451e2
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/linux/0002-more-display-olimex.patch
@@ -0,0 +1,175 @@
+From 54b934145102dc89c49d88761450e36cc9a1399d Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Thu, 28 Oct 2021 20:32:51 +0200
+Subject: [PATCH] more display olimex
+
+fetched from https://github.com/OLIMEX/linux-olimex
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ drivers/gpu/drm/panel/panel-simple.c | 131 ++++++++++++++++++++++++---
+ 1 file changed, 118 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
+index 204674fcc..2bec63ad0 100644
+--- a/drivers/gpu/drm/panel/panel-simple.c
++++ b/drivers/gpu/drm/panel/panel-simple.c
+@@ -2983,20 +2983,45 @@ static const struct panel_desc okaya_rs800480t_7x0gp = {
+ 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+ };
+ 
+-static const struct drm_display_mode olimex_lcd_olinuxino_43ts_mode = {
+-	.clock = 9000,
++static const struct drm_display_mode olimex_vga_olinuxino_800_mode = {
++	.clock = 40000,
++	.hdisplay = 800,
++	.hsync_start = 800 + 40,
++	.hsync_end = 800 + 40 + 128,
++	.htotal = 800 + 40 + 128 + 88,
++	.vdisplay = 600,
++	.vsync_start = 600 + 5,
++	.vsync_end = 600 + 5 + 4,
++	.vtotal = 600 + 5 + 4 + 19,
++};
++
++static const struct drm_display_mode olimex_vga_olinuxino_1024_mode = {
++	.clock = 45000,
++	.hdisplay = 1024,
++	.hsync_start = 1024 + 16,
++	.hsync_end = 1024 + 16 + 10,
++	.htotal = 1024 + 16 + 10 + 150,
++	.vdisplay = 600,
++	.vsync_start = 600 + 2,
++	.vsync_end = 600 + 2 + 21,
++	.vtotal = 600 + 2 + 21 + 2,
++};
++
++
++static const struct drm_display_mode olimex_lcd_olinuxino_43_mode = {
++	.clock = 9530,
+ 	.hdisplay = 480,
+-	.hsync_start = 480 + 5,
+-	.hsync_end = 480 + 5 + 30,
+-	.htotal = 480 + 5 + 30 + 10,
++	.hsync_start = 480 + 8,
++	.hsync_end = 480 + 8 + 20,
++	.htotal = 480 + 8 + 20 + 23,
+ 	.vdisplay = 272,
+-	.vsync_start = 272 + 8,
+-	.vsync_end = 272 + 8 + 5,
+-	.vtotal = 272 + 8 + 5 + 3,
++	.vsync_start = 272 + 4,
++	.vsync_end = 272 + 4 + 10,
++	.vtotal = 272 + 4 + 10 + 13,
+ };
+ 
+-static const struct panel_desc olimex_lcd_olinuxino_43ts = {
+-	.modes = &olimex_lcd_olinuxino_43ts_mode,
++static const struct panel_desc olimex_lcd_olinuxino_43 = {
++	.modes = &olimex_lcd_olinuxino_43_mode,
+ 	.num_modes = 1,
+ 	.size = {
+ 		.width = 95,
+@@ -3005,6 +3030,71 @@ static const struct panel_desc olimex_lcd_olinuxino_43ts = {
+ 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
+ };
+ 
++static const struct drm_display_mode olimex_lcd_olinuxino_5_mode = {
++	.clock = 33300,
++	.hdisplay = 800,
++	.hsync_start = 800 + 210,
++	.hsync_end = 800 + 210 + 20,
++	.htotal = 800 + 210 + 20 + 26,
++	.vdisplay = 480,
++	.vsync_start = 480 + 22,
++	.vsync_end = 480 + 22 + 10,
++	.vtotal = 480 + 22 + 10 + 13,
++};
++
++static const struct panel_desc olimex_lcd_olinuxino_5 = {
++	.modes = &olimex_lcd_olinuxino_5_mode,
++	.num_modes = 1,
++	.size = {
++		.width = 154,
++		.height = 86,
++	},
++	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
++};
++static const struct drm_display_mode olimex_lcd_olinuxino_7_mode = {
++	.clock = 33300,
++	.hdisplay = 800,
++	.hsync_start = 800 + 210,
++	.hsync_end = 800 + 210 + 20,
++	.htotal = 800 + 210 + 20 + 26,
++	.vdisplay = 480,
++	.vsync_start = 480 + 22,
++	.vsync_end = 480 + 22 + 10,
++	.vtotal = 480 + 22 + 10 + 13,
++};
++
++static const struct panel_desc olimex_lcd_olinuxino_7 = {
++	.modes = &olimex_lcd_olinuxino_7_mode,
++	.num_modes = 1,
++	.size = {
++		.width = 154,
++		.height = 86,
++	},
++	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
++};
++
++static const struct drm_display_mode olimex_lcd_olinuxino_10_mode = {
++	.clock = 45000,
++	.hdisplay = 1024,
++	.hsync_start = 1024 + 16,
++	.hsync_end = 1024 + 16 + 1,
++	.htotal = 1024 + 10 + 6 + 160,
++	.vdisplay = 600,
++	.vsync_start = 600 + 1,
++	.vsync_end = 600 + 1 + 1,
++	.vtotal = 600 + 1 + 1 + 22,
++};
++
++static const struct panel_desc olimex_lcd_olinuxino_10 = {
++	.modes = &olimex_lcd_olinuxino_10_mode,
++	.num_modes = 1,
++	.size = {
++		.width = 222,
++		.height = 143,
++	},
++	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
++};
++
+ /*
+  * 800x480 CVT. The panel appears to be quite accepting, at least as far as
+  * pixel clocks, but this is the timing that was being used in the Adafruit
+@@ -4177,9 +4267,24 @@ static const struct of_device_id platform_of_match[] = {
+ 	}, {
+ 		.compatible = "okaya,rs800480t-7x0gp",
+ 		.data = &okaya_rs800480t_7x0gp,
+-	}, {
+-		.compatible = "olimex,lcd-olinuxino-43-ts",
+-		.data = &olimex_lcd_olinuxino_43ts,
++	},{
++		.compatible = "olimex,olinuxino-vga-800x600",
++		.data = &olimex_vga_olinuxino_800_mode,
++	},{
++		.compatible = "olimex,olinuxino-vga-1024x768",
++		.data = &olimex_vga_olinuxino_1024_mode,
++	},{
++		.compatible = "olimex,lcd-olinuxino-4.3",
++		.data = &olimex_lcd_olinuxino_43,
++	}, {
++		.compatible = "olimex,lcd-olinuxino-5",
++		.data = &olimex_lcd_olinuxino_5,
++	}, {
++		.compatible = "olimex,lcd-olinuxino-7",
++		.data = &olimex_lcd_olinuxino_7,
++	}, {
++		.compatible = "olimex,lcd-olinuxino-10",
++		.data = &olimex_lcd_olinuxino_10,
+ 	}, {
+ 		.compatible = "ontat,yx700wv03",
+ 		.data = &ontat_yx700wv03,
+-- 
+2.25.1
+
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/0001-AXP-not-only-with-sunxi.patch b/board/olimex/stmp1_olinuxino/patches/uboot/0001-AXP-not-only-with-sunxi.patch
new file mode 100644
index 000000000..49251215a
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/0001-AXP-not-only-with-sunxi.patch
@@ -0,0 +1,168 @@
+From 240af8affb9037b25f41749542d7cf6598760934 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sun, 10 Oct 2021 16:32:39 +0200
+Subject: [PATCH 1/2] AXP not only with sunxi
+
+just move declarations from specific arch/mach sunxi to power
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ arch/arm/mach-sunxi/Kconfig                                 | 6 ------
+ arch/arm/mach-sunxi/pmic_bus.c                              | 2 +-
+ drivers/gpio/axp_gpio.c                                     | 2 +-
+ drivers/power/Kconfig                                       | 6 ++++++
+ drivers/power/axp152.c                                      | 2 +-
+ drivers/power/axp209.c                                      | 2 +-
+ drivers/power/axp221.c                                      | 2 +-
+ drivers/power/axp305.c                                      | 2 +-
+ drivers/power/axp809.c                                      | 2 +-
+ drivers/power/axp818.c                                      | 2 +-
+ .../arm/include/asm/arch-sunxi => include/power}/pmic_bus.h | 0
+ 11 files changed, 14 insertions(+), 14 deletions(-)
+ rename {arch/arm/include/asm/arch-sunxi => include/power}/pmic_bus.h (100%)
+
+diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
+index 49f94f095c..a4f71469f8 100644
+--- a/arch/arm/mach-sunxi/Kconfig
++++ b/arch/arm/mach-sunxi/Kconfig
+@@ -105,12 +105,6 @@ config SUN6I_PRCM
+ 	  Support for the PRCM (Power/Reset/Clock Management) unit available
+ 	  in A31 SoC.
+ 
+-config AXP_PMIC_BUS
+-	bool "Sunxi AXP PMIC bus access helpers"
+-	help
+-	  Select this PMIC bus access helpers for Sunxi platform PRCM or other
+-	  AXP family PMIC devices.
+-
+ config SUN8I_RSB
+ 	bool "Allwinner sunXi Reduced Serial Bus Driver"
+ 	help
+diff --git a/arch/arm/mach-sunxi/pmic_bus.c b/arch/arm/mach-sunxi/pmic_bus.c
+index 0394ce8564..c8ebbf5ee8 100644
+--- a/arch/arm/mach-sunxi/pmic_bus.c
++++ b/arch/arm/mach-sunxi/pmic_bus.c
+@@ -12,7 +12,7 @@
+ #include <asm/arch/p2wi.h>
+ #include <asm/arch/rsb.h>
+ #include <i2c.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ 
+ #define AXP152_I2C_ADDR			0x30
+ 
+diff --git a/drivers/gpio/axp_gpio.c b/drivers/gpio/axp_gpio.c
+index 73058cf40b..90bf4b84ff 100644
+--- a/drivers/gpio/axp_gpio.c
++++ b/drivers/gpio/axp_gpio.c
+@@ -7,7 +7,7 @@
+ 
+ #include <common.h>
+ #include <asm/arch/gpio.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <asm/gpio.h>
+ #include <axp_pmic.h>
+ #include <dm.h>
+diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
+index c5fbf1f832..431e522771 100644
+--- a/drivers/power/Kconfig
++++ b/drivers/power/Kconfig
+@@ -8,6 +8,12 @@ source "drivers/power/pmic/Kconfig"
+ 
+ source "drivers/power/regulator/Kconfig"
+ 
++config AXP_PMIC_BUS
++	bool "Sunxi AXP PMIC bus access helpers"
++	help
++	  Select this PMIC bus access helpers for Sunxi platform PRCM or other
++	  AXP family PMIC devices.
++
+ choice
+ 	prompt "Select Sunxi PMIC Variant"
+ 	depends on ARCH_SUNXI
+diff --git a/drivers/power/axp152.c b/drivers/power/axp152.c
+index d6e36125c1..3eb60ce4ec 100644
+--- a/drivers/power/axp152.c
++++ b/drivers/power/axp152.c
+@@ -5,7 +5,7 @@
+  */
+ #include <common.h>
+ #include <command.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ static u8 axp152_mvolt_to_target(int mvolt, int min, int max, int div)
+diff --git a/drivers/power/axp209.c b/drivers/power/axp209.c
+index ade531940b..6ab7aa5bf8 100644
+--- a/drivers/power/axp209.c
++++ b/drivers/power/axp209.c
+@@ -6,7 +6,7 @@
+ 
+ #include <common.h>
+ #include <command.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ #include <linux/delay.h>
+ 
+diff --git a/drivers/power/axp221.c b/drivers/power/axp221.c
+index 3446fe7365..e35a876578 100644
+--- a/drivers/power/axp221.c
++++ b/drivers/power/axp221.c
+@@ -12,7 +12,7 @@
+ #include <common.h>
+ #include <command.h>
+ #include <errno.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ static u8 axp221_mvolt_to_cfg(int mvolt, int min, int max, int div)
+diff --git a/drivers/power/axp305.c b/drivers/power/axp305.c
+index 0191e4d427..bfadea6e00 100644
+--- a/drivers/power/axp305.c
++++ b/drivers/power/axp305.c
+@@ -12,7 +12,7 @@
+ #include <common.h>
+ #include <command.h>
+ #include <errno.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ #define AXP305_DCDC4_1600MV_OFFSET 46
+diff --git a/drivers/power/axp809.c b/drivers/power/axp809.c
+index 6323492b66..e438a13509 100644
+--- a/drivers/power/axp809.c
++++ b/drivers/power/axp809.c
+@@ -14,7 +14,7 @@
+ #include <command.h>
+ #include <errno.h>
+ #include <asm/arch/gpio.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ static u8 axp809_mvolt_to_cfg(int mvolt, int min, int max, int div)
+diff --git a/drivers/power/axp818.c b/drivers/power/axp818.c
+index 0531707c8a..df69927c84 100644
+--- a/drivers/power/axp818.c
++++ b/drivers/power/axp818.c
+@@ -14,7 +14,7 @@
+ #include <command.h>
+ #include <errno.h>
+ #include <asm/arch/gpio.h>
+-#include <asm/arch/pmic_bus.h>
++#include <power/pmic_bus.h>
+ #include <axp_pmic.h>
+ 
+ static u8 axp818_mvolt_to_cfg(int mvolt, int min, int max, int div)
+diff --git a/arch/arm/include/asm/arch-sunxi/pmic_bus.h b/include/power/pmic_bus.h
+similarity index 100%
+rename from arch/arm/include/asm/arch-sunxi/pmic_bus.h
+rename to include/power/pmic_bus.h
+-- 
+2.30.2
+
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/0002-uses-AXP209-as-PMIC.patch b/board/olimex/stmp1_olinuxino/patches/uboot/0002-uses-AXP209-as-PMIC.patch
new file mode 100644
index 000000000..ca0dbc6b2
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/0002-uses-AXP209-as-PMIC.patch
@@ -0,0 +1,205 @@
+From 76ea4a75aaea0640cf916d97df981d12b85772e5 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Tue, 12 Oct 2021 21:07:55 +0200
+Subject: [PATCH 2/2] uses AXP209 as PMIC
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ arch/arm/mach-stm32mp/Makefile        |  1 +
+ arch/arm/mach-stm32mp/pmic_bus.c      | 83 +++++++++++++++++++++++++++
+ arch/arm/mach-stm32mp/pwr_regulator.c |  3 +-
+ board/st/stm32mp1/spl.c               |  7 +++
+ drivers/phy/phy-stm32-usbphyc.c       |  2 +
+ drivers/power/Kconfig                 |  4 +-
+ 6 files changed, 97 insertions(+), 3 deletions(-)
+ create mode 100644 arch/arm/mach-stm32mp/pmic_bus.c
+
+diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
+index 391b47cf13..c582591b7c 100644
+--- a/arch/arm/mach-stm32mp/Makefile
++++ b/arch/arm/mach-stm32mp/Makefile
+@@ -21,3 +21,4 @@ endif
+ 
+ obj-$(CONFIG_$(SPL_)DM_REGULATOR) += pwr_regulator.o
+ obj-$(CONFIG_OF_SYSTEM_SETUP) += fdt.o
++obj-$(CONFIG_AXP_PMIC_BUS) += pmic_bus.o
+diff --git a/arch/arm/mach-stm32mp/pmic_bus.c b/arch/arm/mach-stm32mp/pmic_bus.c
+new file mode 100644
+index 0000000000..f52d619af3
+--- /dev/null
++++ b/arch/arm/mach-stm32mp/pmic_bus.c
+@@ -0,0 +1,83 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * (C) Copyright 2015 Hans de Goede <hdegoede@redhat.com>
++ *
++ * Sunxi PMIC bus access helpers
++ *
++ * The axp152 & axp209 use an i2c bus, the axp221 uses the p2wi bus and the
++ * axp223 uses the rsb bus, these functions abstract this.
++ */
++
++#include <common.h>
++#include <command.h>
++#include <i2c.h>
++#include <dm.h>
++#include <power/pmic_bus.h>
++
++#define AXP209_I2C_ADDR			0x34
++
++	struct udevice *dev;
++
++int pmic_bus_init(void)
++{
++	/* This cannot be 0 because it is used in SPL before BSS is ready */
++	static int needs_init = 1;
++	__maybe_unused int ret;
++	struct udevice *bus;
++
++	if (!needs_init)
++		return 0;
++
++	ret = uclass_get_device_by_seq(UCLASS_I2C, 0, &bus);
++	if (ret)
++		return ret;
++
++	ret = dm_i2c_probe(bus, AXP209_I2C_ADDR, 0, &dev);
++	if (ret)
++		return ret;
++
++	needs_init = 0;
++	return 0;
++}
++
++int pmic_bus_read(u8 reg, u8 *data)
++{
++	return dm_i2c_read(dev, reg, data, 1);
++}
++
++int pmic_bus_write(u8 reg, u8 data)
++{
++	return dm_i2c_write(dev,reg, &data,1);
++}
++
++int pmic_bus_setbits(u8 reg, u8 bits)
++{
++	int ret;
++	u8 val;
++
++	ret = pmic_bus_read(reg, &val);
++	if (ret)
++		return ret;
++
++	if ((val & bits) == bits)
++		return 0;
++
++	val |= bits;
++	return pmic_bus_write(reg, val);
++}
++
++int pmic_bus_clrbits(u8 reg, u8 bits)
++{
++	int ret;
++	u8 val;
++
++	ret = pmic_bus_read(reg, &val);
++	if (ret)
++		return ret;
++
++	if (!(val & bits))
++		return 0;
++
++	val &= ~bits;
++	return pmic_bus_write(reg, val);
++}
+diff --git a/arch/arm/mach-stm32mp/pwr_regulator.c b/arch/arm/mach-stm32mp/pwr_regulator.c
+index 846637ab16..71b2776a92 100644
+--- a/arch/arm/mach-stm32mp/pwr_regulator.c
++++ b/arch/arm/mach-stm32mp/pwr_regulator.c
+@@ -81,12 +81,13 @@ static const struct pmic_child_info pwr_children_info[] = {
+ 
+ static int stm32mp_pwr_bind(struct udevice *dev)
+ {
++#if defined(CONFIG_PMIC_STPMIC1)
+ 	int children;
+ 
+ 	children = pmic_bind_children(dev, dev_ofnode(dev), pwr_children_info);
+ 	if (!children)
+ 		dev_dbg(dev, "no child found\n");
+-
++#endif
+ 	return 0;
+ }
+ 
+diff --git a/board/st/stm32mp1/spl.c b/board/st/stm32mp1/spl.c
+index 8e4549a1b3..5fe09bf048 100644
+--- a/board/st/stm32mp1/spl.c
++++ b/board/st/stm32mp1/spl.c
+@@ -10,6 +10,7 @@
+ #include <asm/arch/sys_proto.h>
+ #include <linux/bitops.h>
+ #include <linux/delay.h>
++#include <axp_pmic.h>
+ #include "../common/stpmic1.h"
+ 
+ /* board early initialisation in board_f: need to use global variable */
+@@ -23,8 +24,14 @@ void board_vddcore_init(u32 voltage_mv)
+ 
+ int board_early_init_f(void)
+ {
++#if defined(CONFIG_AXP209_POWER)
++	axp_init();
++	axp_set_aldo3(1200);
++	axp_set_aldo2(3300);
++#else
+ 	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER))
+ 		stpmic1_init(opp_voltage_mv);
++#endif
+ 
+ 	return 0;
+ }
+diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
+index 02d859a039..15e6e1dd2b 100644
+--- a/drivers/phy/phy-stm32-usbphyc.c
++++ b/drivers/phy/phy-stm32-usbphyc.c
+@@ -364,6 +364,7 @@ static int stm32_usbphyc_probe(struct udevice *dev)
+ 	}
+ 
+ 	/* get usbphyc regulator */
++#if defined(CONFIG_PMIC_STPMIC1)
+ 	ret = device_get_supply_regulator(dev, "vdda1v1-supply",
+ 					  &usbphyc->vdda1v1);
+ 	if (ret) {
+@@ -377,6 +378,7 @@ static int stm32_usbphyc_probe(struct udevice *dev)
+ 		dev_err(dev, "Can't get vdda1v8-supply regulator\n");
+ 		return ret;
+ 	}
++#endif
+ 
+ 	/*
+ 	 * parse all PHY subnodes in order to populate regulator associated
+diff --git a/drivers/power/Kconfig b/drivers/power/Kconfig
+index 431e522771..85f5bdb7aa 100644
+--- a/drivers/power/Kconfig
++++ b/drivers/power/Kconfig
+@@ -16,7 +16,7 @@ config AXP_PMIC_BUS
+ 
+ choice
+ 	prompt "Select Sunxi PMIC Variant"
+-	depends on ARCH_SUNXI
++	depends on ARCH_SUNXI || ARCH_STM32MP
+ 	default AXP209_POWER if MACH_SUN4I || MACH_SUN5I || MACH_SUN7I
+ 	default AXP221_POWER if MACH_SUN6I || MACH_SUN8I_A23 || MACH_SUN8I_A33 || MACH_SUN8I_R40
+ 	default AXP305_POWER if MACH_SUN50I_H616
+@@ -39,7 +39,7 @@ config AXP152_POWER
+ 
+ config AXP209_POWER
+ 	bool "axp209 pmic support"
+-	depends on MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUN8I_V3S
++	depends on MACH_SUN4I || MACH_SUN5I || MACH_SUN7I || MACH_SUN8I_V3S || TARGET_ST_STM32MP15x
+ 	select AXP_PMIC_BUS
+ 	select CMD_POWEROFF
+ 	---help---
+-- 
+2.30.2
+
diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/0003-add-ethaddr-in-u-boot-env.patch b/board/olimex/stmp1_olinuxino/patches/uboot/0003-add-ethaddr-in-u-boot-env.patch
new file mode 100644
index 000000000..a7bdc8644
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/patches/uboot/0003-add-ethaddr-in-u-boot-env.patch
@@ -0,0 +1,25 @@
+From f48ca38e84dc18dd3427c6cf10ec13adcbd25a9d Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 13 Oct 2021 17:00:33 +0200
+Subject: [PATCH] add ethaddr in u-boot-env
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ include/configs/stm32mp1.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/configs/stm32mp1.h b/include/configs/stm32mp1.h
+index b372838be8..fc6d39dec2 100644
+--- a/include/configs/stm32mp1.h
++++ b/include/configs/stm32mp1.h
+@@ -159,6 +159,7 @@
+  * and the ramdisk at the end.
+  */
+ #define CONFIG_EXTRA_ENV_SETTINGS \
++	"ethaddr=00:12:34:56:00:00\0" \
+ 	"kernel_addr_r=0xc2000000\0" \
+ 	"fdt_addr_r=0xc4000000\0" \
+ 	"scriptaddr=0xc4100000\0" \
+-- 
+2.30.2
+
diff --git a/board/olimex/stmp1_olinuxino/readme.txt b/board/olimex/stmp1_olinuxino/readme.txt
new file mode 100644
index 000000000..8c641c6c8
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/readme.txt
@@ -0,0 +1,53 @@
+STMP157-OLinuXino-LIME2
+
+Intro
+=====
+
+These are open hardware boards, all based on the STmicro STMP157 SoC.
+
+for more details about the board see the following pages:
+ - https://www.olimex.com/Products/OLinuXino/open-source-hardware
+ - https://www.olimex.com/Products/OLinuXino/STMP1/STMP157-OLinuXino-LIME2/
+
+The following defconfigs are available:
+ - olimex_stmp157_olinuxino_lime_defconfig
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make <board>_defconfig
+
+Compile everything and build the rootfs image:
+
+    $ make
+
+Result of the build
+-------------------
+
+After building, you should get a tree like this:
+
+    output/images/
+    +-- rootfs.ext2
+    +-- rootfs.ext4 -> rootfs.ext2
+    +-- sdcard.img
+    +-- stm32mp1xx-olinuxino-lime.dtb
+    +-- u-boot-spl.stm32
+    +-- u-boot.img
+    `-- zImage
+
+
+How to write the SD card
+========================
+
+The sdcard.img file is a complete bootable image ready to be written
+on the boot medium. To install it, simply copy the image to a uSD
+card:
+
+    # dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the uSD.
+
+Eject the SD card, insert it in the STMP1-OLinuXino board, and power it up.
+
diff --git a/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000..edb601c7c
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label stmp1-olinuxino-buildroot
+  kernel /boot/zImage
+  devicetree /boot/stm32mp1xx-olinuxino-lime.dtb
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/board/olimex/stmp1_olinuxino/uboot-dts/stm32mp1-olinuxino-lime-u-boot.dtsi b/board/olimex/stmp1_olinuxino/uboot-dts/stm32mp1-olinuxino-lime-u-boot.dtsi
new file mode 100644
index 000000000..909530774
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/uboot-dts/stm32mp1-olinuxino-lime-u-boot.dtsi
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright : STMicroelectronics 2018
+ */
+
+#include <dt-bindings/clock/stm32mp1-clksrc.h>
+#include "stm32mp15-u-boot.dtsi"
+#include "stm32mp15-ddr3-2x4Gb-1066-binG.dtsi"
+
+/ {
+	aliases {
+		mmc0 = &sdmmc1;
+		usb0 = &usbotg_hs;
+	};
+	config {
+	};
+};
+
+&clk_hse {
+	st,digbypass;
+};
+
+&i2c4 {
+	u-boot,dm-pre-reloc;
+};
+
+&i2c4_pins_a {
+	u-boot,dm-pre-reloc;
+	pins {
+		u-boot,dm-pre-reloc;
+	};
+};
+
+/*
+&pmic {
+	u-boot,dm-pre-reloc;
+};
+*/
+
+&rcc {
+	st,clksrc = <
+		CLK_MPU_PLL1P
+		CLK_AXI_PLL2P
+		CLK_MCU_PLL3P
+		CLK_PLL12_HSE
+		CLK_PLL3_HSE
+		CLK_PLL4_HSE
+		CLK_RTC_LSE
+		CLK_MCO1_DISABLED
+		CLK_MCO2_DISABLED
+	>;
+
+	st,clkdiv = <
+		1 /*MPU*/
+		0 /*AXI*/
+		0 /*MCU*/
+		1 /*APB1*/
+		1 /*APB2*/
+		1 /*APB3*/
+		1 /*APB4*/
+		2 /*APB5*/
+		23 /*RTC*/
+		0 /*MCO1*/
+		0 /*MCO2*/
+	>;
+
+	st,pkcs = <
+		CLK_CKPER_HSE
+		CLK_FMC_ACLK
+		CLK_QSPI_ACLK
+		CLK_ETH_PLL4P
+		CLK_SDMMC12_PLL4P
+		CLK_DSI_DSIPLL
+		CLK_STGEN_HSE
+		CLK_USBPHY_HSE
+		CLK_SPI2S1_PLL3Q
+		CLK_SPI2S23_PLL3Q
+		CLK_SPI45_HSI
+		CLK_SPI6_HSI
+		CLK_I2C46_HSI
+		CLK_SDMMC3_PLL4P
+		CLK_USBO_USBPHY
+		CLK_ADC_CKPER
+		CLK_CEC_LSE
+		CLK_I2C12_HSI
+		CLK_I2C35_HSI
+		CLK_UART1_HSI
+		CLK_UART24_HSI
+		CLK_UART35_HSI
+		CLK_UART6_HSI
+		CLK_UART78_HSI
+		CLK_SPDIF_PLL4P
+		CLK_FDCAN_PLL4R
+		CLK_SAI1_PLL3Q
+		CLK_SAI2_PLL3Q
+		CLK_SAI3_PLL3Q
+		CLK_SAI4_PLL3Q
+		CLK_RNG1_LSI
+		CLK_RNG2_LSI
+		CLK_LPTIM1_PCLK1
+		CLK_LPTIM23_PCLK3
+		CLK_LPTIM45_LSE
+	>;
+
+	/* VCO = 1300.0 MHz => P = 650 (CPU) */
+	pll1: st,pll@0 {
+		compatible = "st,stm32mp1-pll";
+		reg = <0>;
+		cfg = < 2 80 0 0 0 PQR(1,0,0) >;
+		frac = < 0x800 >;
+		u-boot,dm-pre-reloc;
+	};
+
+	/* VCO = 1066.0 MHz => P = 266 (AXI), Q = 533 (GPU), R = 533 (DDR) */
+	pll2: st,pll@1 {
+		compatible = "st,stm32mp1-pll";
+		reg = <1>;
+		cfg = < 2 65 1 0 0 PQR(1,1,1) >;
+		frac = < 0x1400 >;
+		u-boot,dm-pre-reloc;
+	};
+
+	/* VCO = 417.8 MHz => P = 209, Q = 24, R = 11 */
+	pll3: st,pll@2 {
+		compatible = "st,stm32mp1-pll";
+		reg = <2>;
+		cfg = < 1 33 1 16 36 PQR(1,1,1) >;
+		frac = < 0x1a04 >;
+		u-boot,dm-pre-reloc;
+	};
+
+	/* VCO = 594.0 MHz => P = 99, Q = 74, R = 74 */
+	pll4: st,pll@3 {
+		compatible = "st,stm32mp1-pll";
+		reg = <3>;
+		cfg = < 3 98 5 7 7 PQR(1,1,1) >;
+		u-boot,dm-pre-reloc;
+	};
+};
+
+&sdmmc1 {
+	u-boot,dm-spl;
+};
+
+&sdmmc1_b4_pins_a {
+	u-boot,dm-spl;
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
+		u-boot,dm-spl;
+	};
+};
+
+&sdmmc1_dir_pins_a {
+	u-boot,dm-spl;
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
+		u-boot,dm-spl;
+	};
+};
+
+&sdmmc2 {
+	u-boot,dm-spl;
+};
+
+&sdmmc2_b4_pins_a {
+	u-boot,dm-spl;
+	pins1 {
+		u-boot,dm-spl;
+	};
+	pins2 {
+		u-boot,dm-spl;
+	};
+};
+
+&sdmmc2_d47_pins_a {
+	u-boot,dm-spl;
+	pins {
+		u-boot,dm-spl;
+	};
+};
+
+&uart4 {
+	u-boot,dm-pre-reloc;
+};
+
+&uart4_pins_a {
+	u-boot,dm-pre-reloc;
+	pins1 {
+		u-boot,dm-pre-reloc;
+	};
+	pins2 {
+		u-boot,dm-pre-reloc;
+	};
+};
diff --git a/board/olimex/stmp1_olinuxino/uboot-dts/stm32mp1-olinuxino-lime.dts b/board/olimex/stmp1_olinuxino/uboot-dts/stm32mp1-olinuxino-lime.dts
new file mode 100644
index 000000000..fbac5d94f
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/uboot-dts/stm32mp1-olinuxino-lime.dts
@@ -0,0 +1,368 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
+ * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
+ */
+/dts-v1/;
+
+#include "stm32mp157.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15-pinctrl.dtsi"
+#include "stm32mp15xxaa-pinctrl.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/mfd/st,stpmic1.h>
+
+/ {
+	model = "STM32MP1 OLinuXino-LIME";
+	compatible = "olimex,stm32mp1xx-olinuxino-lime", "st,stm32mp157";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@c0000000 {
+		device_type = "memory";
+		reg = <0xC0000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mcuram2: mcuram2@10000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10000000 0x40000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@10040000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10040000 0x1000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@10041000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10041000 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@10042000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10042000 0x4000>;
+			no-map;
+		};
+
+		mcuram: mcuram@30000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x30000000 0x40000>;
+			no-map;
+		};
+
+		retram: retram@38000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x38000000 0x10000>;
+			no-map;
+		};
+
+		gpu_reserved: gpu@e8000000 {
+			reg = <0xe8000000 0x8000000>;
+			no-map;
+		};
+	};
+
+	aliases {
+		serial0 = &uart4;
+		ethernet0 = &ethernet0;
+	};
+
+	vdd_sd3v3: regulator_vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+	vbus_otg: regulator_otg {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-otg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+	vdd: vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+	vdd_usb: vdd-usb {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-usb";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+	vdd11: vdd11 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd11";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+	vdd18: vdd18 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		regulator-always-on;
+		regulator-initial-mode = <0>;
+		//regulator-over-current-protection;
+	};
+	reg_usb0_vbus: usb0-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb0-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&gpioc 6 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+	reg_usb1_vbus: usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&gpiof 15 GPIO_ACTIVE_HIGH>;
+		status = "disabled";
+	};
+};
+
+&dac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&dac_ch1_pins_a &dac_ch2_pins_a>;
+	status = "disabled";
+};
+
+&dts {
+	status = "okay";
+};
+
+&gpu {
+	contiguous-area = <&gpu_reserved>;
+	status = "okay";
+};
+
+&reg_usb0_vbus {
+	status="okay";
+};
+
+&reg_usb1_vbus {
+	status="okay";
+};
+
+&i2c4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c4_pins_a>;
+//	i2c-scl-rising-time-ns = <185>;
+//	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	pmic: stpmic@33 {
+		compatible = "st,stpmic1";
+		reg = <0x33>;
+		interrupts-extended = <&gpioa 0 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		status = "disabled";
+	};
+};
+
+&ipcc {
+	status = "okay";
+};
+
+&iwdg2 {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&m4_rproc {
+	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
+			<&vdev0vring1>, <&vdev0buffer>;
+	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
+	mbox-names = "vq0", "vq1", "shutdown";
+	interrupt-parent = <&exti>;
+	interrupts = <68 1>;
+	status = "okay";
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&rng1 {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a &sdmmc1_dir_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a &sdmmc1_dir_sleep_pins_a>;
+	broken-cd;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&vdd_sd3v3>;
+	/*vqmmc-supply = <&sd_switch>;*/
+	status = "okay";
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_a>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_a>;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+	bus-width = <8>;
+	vmmc-supply = <&vdd_sd3v3>;
+	vqmmc-supply = <&vdd_sd3v3>;
+	mmc-ddr-3_3v;
+	status = "okay";
+};
+
+&timers6 {
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	timer@5 {
+		status = "okay";
+	};
+};
+
+&ethernet0 {
+	status = "okay";
+	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	phy-mode = "rgmii-id";
+	phy-handle = <&phy1>;
+	st,eth_ref_clk_sel;
+	phy-reset-gpios = <&gpiod 10 GPIO_ACTIVE_LOW>;
+
+	mdio0 {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_a>;
+	pinctrl-1 = <&m_can1_sleep_pins_a>;
+	status = "okay";
+};
+
+&qspi {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&qspi_clk_pins_a &qspi_bk1_pins_a &qspi_bk2_pins_a>;
+	pinctrl-1 = <&qspi_clk_sleep_pins_a &qspi_bk1_sleep_pins_a &qspi_bk2_sleep_pins_a>;
+	reg = <0x58003000 0x1000>, <0x70000000 0x4000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	flash0: mx66l51235l@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-rx-bus-width = <4>;
+		spi-max-frequency = <108000000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&spi1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins_a>;
+	status = "disabled";
+};
+
+
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+	status = "okay";
+};
+
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	phy-names = "usb";
+	status = "okay";
+};
+
+
+&usbotg_hs {
+	dr_mode = "peripheral";
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+	vbus-supply = <&vbus_otg>;
+	status = "okay";
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+		vdda1v1-supply = <&vdd11>;
+	vdda1v8-supply = <&vdd18>;
+
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+	vdda1v1-supply = <&vdd11>;
+	vdda1v8-supply = <&vdd18>;
+
+};
diff --git a/board/olimex/stmp1_olinuxino/uboot.fragment b/board/olimex/stmp1_olinuxino/uboot.fragment
new file mode 100644
index 000000000..2a97e6d9b
--- /dev/null
+++ b/board/olimex/stmp1_olinuxino/uboot.fragment
@@ -0,0 +1,16 @@
+
+# CONFIG_PMIC_STPMIC1 is not set
+# CONFIG_DM_REGULATOR_STPMIC1 is not set
+# CONFIG_SYSRESET_CMD_POWEROFF is not set
+CONFIG_AXP_PMIC_BUS=y
+CONFIG_AXP209_POWER=y
+
+# CONFIG_TYPEC_STUSB160X is not set
+
+# CONFIG_PHY_REALTEK is not set
+CONFIG_DM_MDIO=y
+CONFIG_PHY_MICREL=y
+CONFIG_PHY_MICREL_KSZ90X1=y
+
+# CONFIG_VIDEO_LCD_ORISETECH_OTM8009A is not set
+# CONFIG_VIDEO_LCD_RAYDIUM_RM68200 is not set
diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs/olimex_stmp157_olinuxino_lime_defconfig
new file mode 100644
index 000000000..3f1a3249e
--- /dev/null
+++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
@@ -0,0 +1,51 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+
+# Build options
+BR2_GLOBAL_PATCH_DIR="board/olimex/stmp1_olinuxino/patches"
+
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+# System configuration
+BR2_TARGET_GENERIC_HOSTNAME="stmp1-olinuxino"
+BR2_TARGET_GENERIC_ISSUE="Welcome to OLinuXino!"
+BR2_ROOTFS_OVERLAY="board/olimex/stmp1_olinuxino/rootfs_overlay"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/stmp1_olinuxino/genimage.cfg"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.70"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/olimex/stmp1_olinuxino/linux.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp1xx-olinuxino-lime"
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/olimex/stmp1_olinuxino/linux-dts/*"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloaders
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_basic"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/olimex/stmp1_olinuxino/uboot.fragment"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_STM32=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.stm32"
+BR2_TARGET_UBOOT_CUSTOM_DTS_PATH="board/olimex/stmp1_olinuxino/uboot-dts/*"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="dtb-y=stm32mp1-olinuxino-lime.dtb DEVICE_TREE=stm32mp1-olinuxino-lime"
+
+# Additional tools
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
