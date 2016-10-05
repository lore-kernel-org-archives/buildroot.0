From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:12:40 +0200
Subject: [Buildroot] [git commit] board: add support for liteBoard
Message-ID: <20161005211257.9180C82255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a21ba0b921f180e1b1c5f912d733a19ade748b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Board support package includes:

 * Buildroot defconfig
 * Mainline Linux kernel v4.8 with board support patches
 * Mainline U-Boot v2016.09 with board support patches
 * genimage config to create sdcard image
 * Board readme.txt

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/grinn/liteboard/genimage.cfg                 |  48 ++
 ...ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch | 112 ++++
 ...0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch | 195 +++++++
 .../0001-ARM-imx6ul-Add-support-for-liteSOM.patch  | 311 +++++++++++
 ...board-liteboard-Add-support-for-liteBoard.patch | 621 +++++++++++++++++++++
 board/grinn/liteboard/post-image.sh                |  14 +
 board/grinn/liteboard/readme.txt                   |  45 ++
 configs/grinn_liteboard_defconfig                  |  26 +
 8 files changed, 1372 insertions(+)

diff --git a/board/grinn/liteboard/genimage.cfg b/board/grinn/liteboard/genimage.cfg
new file mode 100644
index 0000000..cbce2db
--- /dev/null
+++ b/board/grinn/liteboard/genimage.cfg
@@ -0,0 +1,48 @@
+# Minimal microSD card image for Grinn's liteBoard
+#
+# We mimic the .sdcard Freescale's image format for i.MX6UL:
+# * the microSD card must have 1 kB free space at the beginning,
+# * SPL is dumped as is,
+# * U-Boot is dumped at 69K offset, as configured in SPL
+# * a FAT partition at offset 8 MB is containing zImage and dtbs,
+# * a single root filesystem partition is required (Ext4 in this case).
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "imx6ul-liteboard.dtb",
+      "zImage"
+    }
+  }
+  size = 16M
+}
+
+image sdcard.img {
+  hdimage {
+  }
+
+  partition SPL {
+    in-partition-table = "no"
+    image = "SPL"
+    offset = 1K
+  }
+
+  partition u-boot {
+    in-partition-table = "no"
+    image = "u-boot.img"
+    offset = 69K
+  }
+
+  partition boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 8M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch b/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch
new file mode 100644
index 0000000..0f124b2
--- /dev/null
+++ b/board/grinn/liteboard/patches/linux/0001-ARM-dts-imx6ul-Add-DTS-for-liteSOM-module.patch
@@ -0,0 +1,112 @@
+From 35d7c23bde44d18205a2730df9acf75d83220c3a Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Wed, 7 Sep 2016 15:10:45 +0200
+Subject: [PATCH 1/2] ARM: dts: imx6ul: Add DTS for liteSOM module
+
+This is a SOM (System on Module), so it will be part of another boards.
+Hence, this is a "dtsi" file that will be included from another device
+tree files.
+
+Hardware specification:
+ * Freescale i.MX6UL SoC
+ * up to 512 MB RAM
+ * eMMC on uSDHC2
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+ arch/arm/boot/dts/imx6ul-litesom.dtsi | 82 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 82 insertions(+)
+ create mode 100644 arch/arm/boot/dts/imx6ul-litesom.dtsi
+
+diff --git a/arch/arm/boot/dts/imx6ul-litesom.dtsi b/arch/arm/boot/dts/imx6ul-litesom.dtsi
+new file mode 100644
+index 0000000..461292d
+--- /dev/null
++++ b/arch/arm/boot/dts/imx6ul-litesom.dtsi
+@@ -0,0 +1,82 @@
++/*
++ * Copyright 2016 Grinn
++ *
++ * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This file is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License
++ *     version 2 as published by the Free Software Foundation.
++ *
++ *     This file is distributed in the hope that it will be useful
++ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *     GNU General Public License for more details.
++ *
++ * Or, alternatively
++ *
++ *  b) Permission is hereby granted, free of charge, to any person
++ *     obtaining a copy of this software and associated documentation
++ *     files (the "Software"), to deal in the Software without
++ *     restriction, including without limitation the rights to use
++ *     copy, modify, merge, publish, distribute, sublicense, and/or
++ *     sell copies of the Software, and to permit persons to whom the
++ *     Software is furnished to do so, subject to the following
++ *     conditions:
++ *
++ *     The above copyright notice and this permission notice shall be
++ *     included in all copies or substantial portions of the Software.
++ *
++ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
++ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
++ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ *     OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++#include "imx6ul.dtsi"
++
++/ {
++	model = "Grinn i.MX6UL liteSOM";
++	compatible = "grinn,imx6ul-litesom", "fsl,imx6ul";
++
++	memory {
++		reg = <0x80000000 0x20000000>;
++	};
++};
++
++&iomuxc {
++	pinctrl_usdhc2: usdhc2grp {
++		fsl,pins = <
++			MX6UL_PAD_NAND_RE_B__USDHC2_CLK	    0x10069
++			MX6UL_PAD_NAND_WE_B__USDHC2_CMD	    0x17059
++			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0 0x17059
++			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1 0x17059
++			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2 0x17059
++			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3 0x17059
++			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4 0x17059
++			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5 0x17059
++			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6 0x17059
++			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7 0x17059
++			MX6UL_PAD_NAND_ALE__USDHC2_RESET_B  0x17059
++		>;
++	};
++};
++
++&usdhc2 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_usdhc2>;
++	no-1-8-v;
++	non-removable;
++	keep-power-in-suspend;
++	wakeup-source;
++	bus-width = <8>;
++	status = "okay";
++};
+-- 
+2.10.0
+
diff --git a/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch b/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch
new file mode 100644
index 0000000..3455cbb
--- /dev/null
+++ b/board/grinn/liteboard/patches/linux/0002-ARM-dts-imx6ul-Add-DTS-for-liteBoard.patch
@@ -0,0 +1,195 @@
+From 58669b4a74343673c6e75c5312e87b24634773fb Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Wed, 7 Sep 2016 15:10:53 +0200
+Subject: [PATCH 2/2] ARM: dts: imx6ul: Add DTS for liteBoard
+
+liteBoard is a development board which uses liteSOM as its base.
+
+Hardware specification:
+ * liteSOM (i.MX6UL, DRAM, eMMC)
+ * Ethernet PHY (id 0)
+ * USB host (usb_otg1)
+ * MicroSD slot (uSDHC1)
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+ arch/arm/boot/dts/Makefile             |   1 +
+ arch/arm/boot/dts/imx6ul-liteboard.dts | 153 +++++++++++++++++++++++++++++++++
+ 2 files changed, 154 insertions(+)
+ create mode 100644 arch/arm/boot/dts/imx6ul-liteboard.dts
+
+diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
+index faacd52..b149313 100644
+--- a/arch/arm/boot/dts/Makefile
++++ b/arch/arm/boot/dts/Makefile
+@@ -407,6 +407,7 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
+ 	imx6sx-sdb.dtb
+ dtb-$(CONFIG_SOC_IMX6UL) += \
+ 	imx6ul-14x14-evk.dtb \
++	imx6ul-liteboard.dtb \
+ 	imx6ul-pico-hobbit.dtb \
+ 	imx6ul-tx6ul-0010.dtb \
+ 	imx6ul-tx6ul-0011.dtb \
+diff --git a/arch/arm/boot/dts/imx6ul-liteboard.dts b/arch/arm/boot/dts/imx6ul-liteboard.dts
+new file mode 100644
+index 0000000..f2e04f2
+--- /dev/null
++++ b/arch/arm/boot/dts/imx6ul-liteboard.dts
+@@ -0,0 +1,153 @@
++/*
++ * Copyright 2016 Grinn
++ *
++ * Author: Marcin Niestroj <m.niestroj@grinn-global.com>
++ *
++ * This file is dual-licensed: you can use it either under the terms
++ * of the GPL or the X11 license, at your option. Note that this dual
++ * licensing only applies to this file, and not this project as a
++ * whole.
++ *
++ *  a) This file is free software; you can redistribute it and/or
++ *     modify it under the terms of the GNU General Public License
++ *     version 2 as published by the Free Software Foundation.
++ *
++ *     This file is distributed in the hope that it will be useful
++ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *     GNU General Public License for more details.
++ *
++ * Or, alternatively
++ *
++ *  b) Permission is hereby granted, free of charge, to any person
++ *     obtaining a copy of this software and associated documentation
++ *     files (the "Software"), to deal in the Software without
++ *     restriction, including without limitation the rights to use
++ *     copy, modify, merge, publish, distribute, sublicense, and/or
++ *     sell copies of the Software, and to permit persons to whom the
++ *     Software is furnished to do so, subject to the following
++ *     conditions:
++ *
++ *     The above copyright notice and this permission notice shall be
++ *     included in all copies or substantial portions of the Software.
++ *
++ *     THE SOFTWARE IS PROVIDED , WITHOUT WARRANTY OF ANY KIND
++ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
++ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
++ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY
++ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
++ *     OTHER DEALINGS IN THE SOFTWARE.
++ */
++
++/dts-v1/;
++
++#include "imx6ul-litesom.dtsi"
++
++/ {
++	model = "Grinn i.MX6UL liteBoard";
++	compatible = "grinn,imx6ul-liteboard", "grinn,imx6ul-litesom",
++		     "fsl,imx6ul";
++
++	chosen {
++		stdout-path = &uart1;
++	};
++
++	regulators {
++		compatible = "simple-bus";
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		reg_usb_otg1_vbus: usb_otg1_regulator {
++			compatible = "regulator-fixed";
++			pinctrl-names = "default";
++			pinctrl-0 = <&pinctrl_usb_otg1_vbus>;
++			regulator-name = "usb_otg1_vbus";
++			regulator-min-microvolt = <5000000>;
++			regulator-max-microvolt = <5000000>;
++			gpio = <&gpio2 8 GPIO_ACTIVE_LOW>;
++		};
++	};
++};
++
++&iomuxc {
++	pinctrl_enet1: enet1grp {
++		fsl,pins = <
++			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
++			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
++			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
++			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
++			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00 0x1b0b0
++			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01 0x1b0b0
++			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
++			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00 0x1b0b0
++			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01 0x1b0b0
++			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
++		>;
++	};
++
++	pinctrl_uart1: uart1grp {
++		fsl,pins = <
++			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
++			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
++		>;
++	};
++
++	pinctrl_usdhc1: usdhc1grp {
++		fsl,pins = <
++			MX6UL_PAD_UART1_RTS_B__GPIO1_IO19	0x17059
++			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
++			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x10071
++			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
++			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
++			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
++			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
++		>;
++	};
++
++	pinctrl_usb_otg1_vbus: usb_otg1_vbus {
++		fsl,pins = <
++			MX6UL_PAD_ENET2_RX_DATA0__GPIO2_IO08	0x79
++		>;
++	};
++};
++
++&fec1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_enet1>;
++	phy-mode = "rmii";
++	phy-handle = <&ethphy0>;
++	status = "okay";
++
++	mdio {
++		#address-cells = <1>;
++		#size-cells = <0>;
++
++		ethphy0: ethernet-phy at 0 {
++			reg = <0>;
++		};
++	};
++};
++
++&uart1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_uart1>;
++	status = "okay";
++};
++
++&usbotg1 {
++	vbus-supply = <&reg_usb_otg1_vbus>;
++	dr_mode = "host";
++	status = "okay";
++};
++
++&usdhc1 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_usdhc1>;
++	cd-gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
++	no-1-8-v;
++	keep-power-in-suspend;
++	wakeup-source;
++	status = "okay";
++};
+-- 
+2.10.0
+
diff --git a/board/grinn/liteboard/patches/uboot/0001-ARM-imx6ul-Add-support-for-liteSOM.patch b/board/grinn/liteboard/patches/uboot/0001-ARM-imx6ul-Add-support-for-liteSOM.patch
new file mode 100644
index 0000000..6810b98
--- /dev/null
+++ b/board/grinn/liteboard/patches/uboot/0001-ARM-imx6ul-Add-support-for-liteSOM.patch
@@ -0,0 +1,311 @@
+From 0f6c7b874d2cc1d0ba500190f4c3d16eabb5d711 Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Tue, 5 Jul 2016 14:59:28 +0200
+Subject: [PATCH 1/2] ARM: imx6ul: Add support for liteSOM
+
+liteSOM is a System On Module (http://grinn-global.com/litesom/). It
+can't exists on its own, but will be used as part of other boards.
+
+Hardware specification:
+ * NXP i.MX6UL processor
+ * 256M or 512M DDR3 memory
+ * optional eMMC (uSDHC2)
+
+Here we treat SOM similar to SOC, so we place it inside arch/arm/mach-*
+directory and make it possible to reuse initialization code (i.e. DDR,
+eMMC init) for all boards that use it.
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ arch/arm/Kconfig                             |   2 +
+ arch/arm/Makefile                            |   1 +
+ arch/arm/mach-litesom/Kconfig                |   6 +
+ arch/arm/mach-litesom/Makefile               |   6 +
+ arch/arm/mach-litesom/include/mach/litesom.h |  16 +++
+ arch/arm/mach-litesom/litesom.c              | 200 +++++++++++++++++++++++++++
+ 6 files changed, 231 insertions(+)
+ create mode 100644 arch/arm/mach-litesom/Kconfig
+ create mode 100644 arch/arm/mach-litesom/Makefile
+ create mode 100644 arch/arm/mach-litesom/include/mach/litesom.h
+ create mode 100644 arch/arm/mach-litesom/litesom.c
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index e63309a..bf5ac39 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -917,6 +917,8 @@ source "arch/arm/mach-keystone/Kconfig"
+ 
+ source "arch/arm/mach-kirkwood/Kconfig"
+ 
++source "arch/arm/mach-litesom/Kconfig"
++
+ source "arch/arm/mach-mvebu/Kconfig"
+ 
+ source "arch/arm/cpu/armv7/mx7/Kconfig"
+diff --git a/arch/arm/Makefile b/arch/arm/Makefile
+index 42093c2..3e804d7 100644
+--- a/arch/arm/Makefile
++++ b/arch/arm/Makefile
+@@ -58,6 +58,7 @@ machine-$(CONFIG_ARCH_HIGHBANK)		+= highbank
+ machine-$(CONFIG_ARCH_KEYSTONE)		+= keystone
+ # TODO: rename CONFIG_KIRKWOOD -> CONFIG_ARCH_KIRKWOOD
+ machine-$(CONFIG_KIRKWOOD)		+= kirkwood
++machine-$(CONFIG_LITESOM)		+= litesom
+ machine-$(CONFIG_ARCH_MESON)		+= meson
+ machine-$(CONFIG_ARCH_MVEBU)		+= mvebu
+ # TODO: rename CONFIG_TEGRA -> CONFIG_ARCH_TEGRA
+diff --git a/arch/arm/mach-litesom/Kconfig b/arch/arm/mach-litesom/Kconfig
+new file mode 100644
+index 0000000..9b7f36d
+--- /dev/null
++++ b/arch/arm/mach-litesom/Kconfig
+@@ -0,0 +1,6 @@
++config LITESOM
++	bool
++	select MX6UL
++	select DM
++	select DM_THERMAL
++	select SUPPORT_SPL
+diff --git a/arch/arm/mach-litesom/Makefile b/arch/arm/mach-litesom/Makefile
+new file mode 100644
+index 0000000..b15eb64
+--- /dev/null
++++ b/arch/arm/mach-litesom/Makefile
+@@ -0,0 +1,6 @@
++# (C) Copyright 2016 Grinn
++#
++# SPDX-License-Identifier:	GPL-2.0+
++#
++
++obj-y  := litesom.o
+diff --git a/arch/arm/mach-litesom/include/mach/litesom.h b/arch/arm/mach-litesom/include/mach/litesom.h
+new file mode 100644
+index 0000000..6833949
+--- /dev/null
++++ b/arch/arm/mach-litesom/include/mach/litesom.h
+@@ -0,0 +1,16 @@
++/*
++ * Copyright (C) 2016 Grinn
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++#ifndef __ARCH_ARM_MACH_LITESOM_SOM_H__
++#define __ARCH_ARM_MACH_LITESOM_SOM_H__
++
++int litesom_mmc_init(bd_t *bis);
++
++#ifdef CONFIG_SPL_BUILD
++void litesom_init_f(void);
++#endif
++
++#endif
+diff --git a/arch/arm/mach-litesom/litesom.c b/arch/arm/mach-litesom/litesom.c
+new file mode 100644
+index 0000000..ac2eccf
+--- /dev/null
++++ b/arch/arm/mach-litesom/litesom.c
+@@ -0,0 +1,200 @@
++/*
++ * Copyright (C) 2015-2016 Freescale Semiconductor, Inc.
++ * Copyright (C) 2016 Grinn
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++#include <asm/arch/clock.h>
++#include <asm/arch/iomux.h>
++#include <asm/arch/imx-regs.h>
++#include <asm/arch/crm_regs.h>
++#include <asm/arch/mx6ul_pins.h>
++#include <asm/arch/mx6-pins.h>
++#include <asm/arch/sys_proto.h>
++#include <asm/gpio.h>
++#include <asm/imx-common/iomux-v3.h>
++#include <asm/imx-common/boot_mode.h>
++#include <asm/io.h>
++#include <common.h>
++#include <fsl_esdhc.h>
++#include <linux/sizes.h>
++#include <mmc.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++#define USDHC_PAD_CTRL (PAD_CTL_PKE | PAD_CTL_PUE |		\
++	PAD_CTL_PUS_22K_UP  | PAD_CTL_SPEED_LOW |		\
++	PAD_CTL_DSE_80ohm   | PAD_CTL_SRE_FAST  | PAD_CTL_HYS)
++
++int dram_init(void)
++{
++	gd->ram_size = imx_ddr_size();
++
++	return 0;
++}
++
++static iomux_v3_cfg_t const emmc_pads[] = {
++	MX6_PAD_NAND_RE_B__USDHC2_CLK | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_WE_B__USDHC2_CMD | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_DATA00__USDHC2_DATA0 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_DATA01__USDHC2_DATA1 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_DATA02__USDHC2_DATA2 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_DATA03__USDHC2_DATA3 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_DATA04__USDHC2_DATA4 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_DATA05__USDHC2_DATA5 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_DATA06__USDHC2_DATA6 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_NAND_DATA07__USDHC2_DATA7 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++
++	/* RST_B */
++	MX6_PAD_NAND_ALE__GPIO4_IO10 | MUX_PAD_CTRL(NO_PAD_CTRL),
++};
++
++#ifdef CONFIG_FSL_ESDHC
++static struct fsl_esdhc_cfg emmc_cfg = {USDHC2_BASE_ADDR, 0, 8};
++
++#define EMMC_PWR_GPIO	IMX_GPIO_NR(4, 10)
++
++int litesom_mmc_init(bd_t *bis)
++{
++	int ret;
++
++	/* eMMC */
++	imx_iomux_v3_setup_multiple_pads(emmc_pads, ARRAY_SIZE(emmc_pads));
++	gpio_direction_output(EMMC_PWR_GPIO, 0);
++	udelay(500);
++	gpio_direction_output(EMMC_PWR_GPIO, 1);
++	emmc_cfg.sdhc_clk = mxc_get_clock(MXC_ESDHC2_CLK);
++
++	ret = fsl_esdhc_initialize(bis, &emmc_cfg);
++	if (ret) {
++		printf("Warning: failed to initialize mmc dev 1 (eMMC)\n");
++		return ret;
++	}
++
++	return 0;
++}
++#endif
++
++#ifdef CONFIG_SPL_BUILD
++#include <libfdt.h>
++#include <spl.h>
++#include <asm/arch/mx6-ddr.h>
++
++
++static struct mx6ul_iomux_grp_regs mx6_grp_ioregs = {
++	.grp_addds = 0x00000030,
++	.grp_ddrmode_ctl = 0x00020000,
++	.grp_b0ds = 0x00000030,
++	.grp_ctlds = 0x00000030,
++	.grp_b1ds = 0x00000030,
++	.grp_ddrpke = 0x00000000,
++	.grp_ddrmode = 0x00020000,
++	.grp_ddr_type = 0x000c0000,
++};
++
++static struct mx6ul_iomux_ddr_regs mx6_ddr_ioregs = {
++	.dram_dqm0 = 0x00000030,
++	.dram_dqm1 = 0x00000030,
++	.dram_ras = 0x00000030,
++	.dram_cas = 0x00000030,
++	.dram_odt0 = 0x00000030,
++	.dram_odt1 = 0x00000030,
++	.dram_sdba2 = 0x00000000,
++	.dram_sdclk_0 = 0x00000030,
++	.dram_sdqs0 = 0x00000030,
++	.dram_sdqs1 = 0x00000030,
++	.dram_reset = 0x00000030,
++};
++
++static struct mx6_mmdc_calibration mx6_mmcd_calib = {
++	.p0_mpwldectrl0 = 0x00000000,
++	.p0_mpdgctrl0 = 0x41570155,
++	.p0_mprddlctl = 0x4040474A,
++	.p0_mpwrdlctl = 0x40405550,
++};
++
++struct mx6_ddr_sysinfo ddr_sysinfo = {
++	.dsize = 0,
++	.cs_density = 20,
++	.ncs = 1,
++	.cs1_mirror = 0,
++	.rtt_wr = 2,
++	.rtt_nom = 1,		/* RTT_Nom = RZQ/2 */
++	.walat = 0,		/* Write additional latency */
++	.ralat = 5,		/* Read additional latency */
++	.mif3_mode = 3,		/* Command prediction working mode */
++	.bi_on = 1,		/* Bank interleaving enabled */
++	.sde_to_rst = 0x10,	/* 14 cycles, 200us (JEDEC default) */
++	.rst_to_cke = 0x23,	/* 33 cycles, 500us (JEDEC default) */
++	.ddr_type = DDR_TYPE_DDR3,
++	.refsel = 0,		/* Refresh cycles at 64KHz */
++	.refr = 1,		/* 2 refresh commands per refresh cycle */
++};
++
++static struct mx6_ddr3_cfg mem_ddr = {
++	.mem_speed = 800,
++	.density = 4,
++	.width = 16,
++	.banks = 8,
++	.rowaddr = 15,
++	.coladdr = 10,
++	.pagesz = 2,
++	.trcd = 1375,
++	.trcmin = 4875,
++	.trasmin = 3500,
++};
++
++static void ccgr_init(void)
++{
++	struct mxc_ccm_reg *ccm = (struct mxc_ccm_reg *)CCM_BASE_ADDR;
++
++	writel(0xFFFFFFFF, &ccm->CCGR0);
++	writel(0xFFFFFFFF, &ccm->CCGR1);
++	writel(0xFFFFFFFF, &ccm->CCGR2);
++	writel(0xFFFFFFFF, &ccm->CCGR3);
++	writel(0xFFFFFFFF, &ccm->CCGR4);
++	writel(0xFFFFFFFF, &ccm->CCGR5);
++	writel(0xFFFFFFFF, &ccm->CCGR6);
++	writel(0xFFFFFFFF, &ccm->CCGR7);
++}
++
++static void spl_dram_init(void)
++{
++	unsigned long ram_size;
++
++	mx6ul_dram_iocfg(mem_ddr.width, &mx6_ddr_ioregs, &mx6_grp_ioregs);
++	mx6_dram_cfg(&ddr_sysinfo, &mx6_mmcd_calib, &mem_ddr);
++
++	/*
++	 * Get actual RAM size, so we can adjust DDR row size for <512M
++	 * memories
++	 */
++	ram_size = get_ram_size((void *)CONFIG_SYS_SDRAM_BASE, SZ_512M);
++	if (ram_size < SZ_512M) {
++		mem_ddr.rowaddr = 14;
++		mx6_dram_cfg(&ddr_sysinfo, &mx6_mmcd_calib, &mem_ddr);
++	}
++}
++
++void litesom_init_f(void)
++{
++	ccgr_init();
++
++	/* setup AIPS and disable watchdog */
++	arch_cpu_init();
++
++#ifdef CONFIG_BOARD_EARLY_INIT_F
++	board_early_init_f();
++#endif
++
++	/* setup GP timer */
++	timer_init();
++
++	/* UART clocks enabled and gd valid - init serial console */
++	preloader_console_init();
++
++	/* DDR initialization */
++	spl_dram_init();
++}
++#endif
+-- 
+2.10.0
+
diff --git a/board/grinn/liteboard/patches/uboot/0002-board-liteboard-Add-support-for-liteBoard.patch b/board/grinn/liteboard/patches/uboot/0002-board-liteboard-Add-support-for-liteBoard.patch
new file mode 100644
index 0000000..85c2df8
--- /dev/null
+++ b/board/grinn/liteboard/patches/uboot/0002-board-liteboard-Add-support-for-liteBoard.patch
@@ -0,0 +1,621 @@
+From 31fcf28e63781d2de1bc0f5f2bce1e72cac4961e Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Fri, 16 Sep 2016 14:44:27 +0200
+Subject: [PATCH 2/2] board/liteboard: Add support for liteBoard
+
+liteBoard is a development board which uses liteSOM as its base.
+
+Hardware specification:
+ * liteSOM (i.MX6UL, DRAM, eMMC)
+ * Ethernet PHY (id 0)
+ * USB host (usb_otg1)
+ * MicroSD slot (uSDHC1)
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ arch/arm/cpu/armv7/mx6/Kconfig    |   5 +
+ board/grinn/liteboard/Kconfig     |  12 ++
+ board/grinn/liteboard/MAINTAINERS |   6 +
+ board/grinn/liteboard/Makefile    |   6 +
+ board/grinn/liteboard/README      |  31 +++++
+ board/grinn/liteboard/board.c     | 270 ++++++++++++++++++++++++++++++++++++++
+ configs/liteboard_defconfig       |  22 ++++
+ include/configs/liteboard.h       | 174 ++++++++++++++++++++++++
+ 8 files changed, 526 insertions(+)
+ create mode 100644 board/grinn/liteboard/Kconfig
+ create mode 100644 board/grinn/liteboard/MAINTAINERS
+ create mode 100644 board/grinn/liteboard/Makefile
+ create mode 100644 board/grinn/liteboard/README
+ create mode 100644 board/grinn/liteboard/board.c
+ create mode 100644 configs/liteboard_defconfig
+ create mode 100644 include/configs/liteboard.h
+
+diff --git a/arch/arm/cpu/armv7/mx6/Kconfig b/arch/arm/cpu/armv7/mx6/Kconfig
+index 4214ab5..e24d0a1 100644
+--- a/arch/arm/cpu/armv7/mx6/Kconfig
++++ b/arch/arm/cpu/armv7/mx6/Kconfig
+@@ -144,6 +144,10 @@ config TARGET_PICO_IMX6UL
+ 	bool "PICO-IMX6UL-EMMC"
+ 	select MX6UL
+ 
++config TARGET_LITEBOARD
++	bool "Grinn liteBoard (i.MX6UL)"
++	select LITESOM
++
+ config TARGET_PLATINUM_PICON
+ 	bool "platinum-picon"
+ 	select SUPPORT_SPL
+@@ -222,6 +226,7 @@ source "board/freescale/mx6slevk/Kconfig"
+ source "board/freescale/mx6sxsabresd/Kconfig"
+ source "board/freescale/mx6sxsabreauto/Kconfig"
+ source "board/freescale/mx6ul_14x14_evk/Kconfig"
++source "board/grinn/liteboard/Kconfig"
+ source "board/phytec/pcm058/Kconfig"
+ source "board/gateworks/gw_ventana/Kconfig"
+ source "board/kosagi/novena/Kconfig"
+diff --git a/board/grinn/liteboard/Kconfig b/board/grinn/liteboard/Kconfig
+new file mode 100644
+index 0000000..e035872
+--- /dev/null
++++ b/board/grinn/liteboard/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_LITEBOARD
++
++config SYS_BOARD
++	default "liteboard"
++
++config SYS_VENDOR
++	default "grinn"
++
++config SYS_CONFIG_NAME
++	default "liteboard"
++
++endif
+diff --git a/board/grinn/liteboard/MAINTAINERS b/board/grinn/liteboard/MAINTAINERS
+new file mode 100644
+index 0000000..b4474f1
+--- /dev/null
++++ b/board/grinn/liteboard/MAINTAINERS
+@@ -0,0 +1,6 @@
++LITEBOARD
++M:	Marcin Niestroj <m.niestroj@grinn-global.com>
++S:	Maintained
++F:	board/grinn/liteboard/
++F:	include/configs/liteboard.h
++F:	configs/liteboard_defconfig
+diff --git a/board/grinn/liteboard/Makefile b/board/grinn/liteboard/Makefile
+new file mode 100644
+index 0000000..e2492d6
+--- /dev/null
++++ b/board/grinn/liteboard/Makefile
+@@ -0,0 +1,6 @@
++# (C) Copyright 2016 Grinn
++#
++# SPDX-License-Identifier:	GPL-2.0+
++#
++
++obj-y  := board.o
+diff --git a/board/grinn/liteboard/README b/board/grinn/liteboard/README
+new file mode 100644
+index 0000000..bee0394
+--- /dev/null
++++ b/board/grinn/liteboard/README
+@@ -0,0 +1,31 @@
++How to use U-Boot on Grinn's liteBoard
++--------------------------------------
++
++- Build U-Boot for liteBoard:
++
++$ make mrproper
++$ make liteboard_defconfig
++$ make
++
++This will generate the SPL image called SPL and the u-boot.img.
++
++- Flash the SPL image into the micro SD card:
++
++sudo dd if=SPL of=/dev/mmcblk0 bs=1k seek=1; sync
++
++- Flash the u-boot.img image into the micro SD card:
++
++sudo dd if=u-boot.img of=/dev/mmcblk0 bs=1k seek=69; sync
++
++- Jumper settings:
++
++S1: 0 1 0 1 1 1
++
++where 0 means bottom position and 1 means top position (from the
++switch label numbers reference).
++
++- Insert the micro SD card in the board.
++
++- Connect USB cable between liteBoard and the PC for the power and console.
++
++- U-Boot messages should come up.
+diff --git a/board/grinn/liteboard/board.c b/board/grinn/liteboard/board.c
+new file mode 100644
+index 0000000..89d525a
+--- /dev/null
++++ b/board/grinn/liteboard/board.c
+@@ -0,0 +1,270 @@
++/*
++ * Copyright (C) 2015-2016 Freescale Semiconductor, Inc.
++ * Copyright (C) 2016 Grinn
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++#include <asm/arch/clock.h>
++#include <asm/arch/iomux.h>
++#include <asm/arch/imx-regs.h>
++#include <asm/arch/crm_regs.h>
++#include <asm/arch/mx6ul_pins.h>
++#include <asm/arch/mx6-pins.h>
++#include <asm/arch/sys_proto.h>
++#include <asm/gpio.h>
++#include <asm/imx-common/iomux-v3.h>
++#include <asm/imx-common/boot_mode.h>
++#include <asm/io.h>
++#include <common.h>
++#include <fsl_esdhc.h>
++#include <linux/sizes.h>
++#include <linux/fb.h>
++#include <mach/litesom.h>
++#include <miiphy.h>
++#include <mmc.h>
++#include <netdev.h>
++#include <usb.h>
++#include <usb/ehci-ci.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++#define UART_PAD_CTRL  (PAD_CTL_PKE | PAD_CTL_PUE |		\
++	PAD_CTL_PUS_100K_UP | PAD_CTL_SPEED_MED |		\
++	PAD_CTL_DSE_40ohm   | PAD_CTL_SRE_FAST  | PAD_CTL_HYS)
++
++#define USDHC_PAD_CTRL (PAD_CTL_PKE | PAD_CTL_PUE |		\
++	PAD_CTL_PUS_22K_UP  | PAD_CTL_SPEED_LOW |		\
++	PAD_CTL_DSE_80ohm   | PAD_CTL_SRE_FAST  | PAD_CTL_HYS)
++
++#define ENET_PAD_CTRL  (PAD_CTL_PUS_100K_UP | PAD_CTL_PUE |     \
++	PAD_CTL_SPEED_HIGH   |                                   \
++	PAD_CTL_DSE_48ohm   | PAD_CTL_SRE_FAST)
++
++#define MDIO_PAD_CTRL  (PAD_CTL_PUS_100K_UP | PAD_CTL_PUE |     \
++	PAD_CTL_DSE_48ohm   | PAD_CTL_SRE_FAST | PAD_CTL_ODE)
++
++#define ENET_CLK_PAD_CTRL  (PAD_CTL_DSE_40ohm   | PAD_CTL_SRE_FAST)
++
++static iomux_v3_cfg_t const uart1_pads[] = {
++	MX6_PAD_UART1_TX_DATA__UART1_DCE_TX | MUX_PAD_CTRL(UART_PAD_CTRL),
++	MX6_PAD_UART1_RX_DATA__UART1_DCE_RX | MUX_PAD_CTRL(UART_PAD_CTRL),
++};
++
++static iomux_v3_cfg_t const sd_pads[] = {
++	MX6_PAD_SD1_CLK__USDHC1_CLK | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD1_CMD__USDHC1_CMD | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD1_DATA0__USDHC1_DATA0 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD1_DATA1__USDHC1_DATA1 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD1_DATA2__USDHC1_DATA2 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++	MX6_PAD_SD1_DATA3__USDHC1_DATA3 | MUX_PAD_CTRL(USDHC_PAD_CTRL),
++
++	/* CD */
++	MX6_PAD_UART1_RTS_B__GPIO1_IO19 | MUX_PAD_CTRL(NO_PAD_CTRL),
++};
++
++#ifdef CONFIG_FEC_MXC
++static iomux_v3_cfg_t const fec1_pads[] = {
++	MX6_PAD_GPIO1_IO06__ENET1_MDIO | MUX_PAD_CTRL(MDIO_PAD_CTRL),
++	MX6_PAD_GPIO1_IO07__ENET1_MDC | MUX_PAD_CTRL(ENET_PAD_CTRL),
++	MX6_PAD_ENET1_TX_DATA0__ENET1_TDATA00 | MUX_PAD_CTRL(ENET_PAD_CTRL),
++	MX6_PAD_ENET1_TX_DATA1__ENET1_TDATA01 | MUX_PAD_CTRL(ENET_PAD_CTRL),
++	MX6_PAD_ENET1_TX_EN__ENET1_TX_EN | MUX_PAD_CTRL(ENET_PAD_CTRL),
++	MX6_PAD_ENET1_TX_CLK__ENET1_REF_CLK1 | MUX_PAD_CTRL(ENET_CLK_PAD_CTRL),
++	MX6_PAD_ENET1_RX_DATA0__ENET1_RDATA00 | MUX_PAD_CTRL(ENET_PAD_CTRL),
++	MX6_PAD_ENET1_RX_DATA1__ENET1_RDATA01 | MUX_PAD_CTRL(ENET_PAD_CTRL),
++	MX6_PAD_ENET1_RX_ER__ENET1_RX_ER | MUX_PAD_CTRL(ENET_PAD_CTRL),
++	MX6_PAD_ENET1_RX_EN__ENET1_RX_EN | MUX_PAD_CTRL(ENET_PAD_CTRL),
++};
++
++static void setup_iomux_fec(void)
++{
++	imx_iomux_v3_setup_multiple_pads(fec1_pads, ARRAY_SIZE(fec1_pads));
++}
++#endif
++
++static void setup_iomux_uart(void)
++{
++	imx_iomux_v3_setup_multiple_pads(uart1_pads, ARRAY_SIZE(uart1_pads));
++}
++
++#ifdef CONFIG_FSL_ESDHC
++static struct fsl_esdhc_cfg sd_cfg = {USDHC1_BASE_ADDR, 0, 4};
++
++#define SD_CD_GPIO	IMX_GPIO_NR(1, 19)
++
++static int mmc_get_env_devno(void)
++{
++	u32 soc_sbmr = readl(SRC_BASE_ADDR + 0x4);
++	int dev_no;
++	u32 bootsel;
++
++	bootsel = (soc_sbmr & 0x000000FF) >> 6;
++
++	/* If not boot from sd/mmc, use default value */
++	if (bootsel != 1)
++		return CONFIG_SYS_MMC_ENV_DEV;
++
++	/* BOOT_CFG2[3] and BOOT_CFG2[4] */
++	dev_no = (soc_sbmr & 0x00001800) >> 11;
++
++	return dev_no;
++}
++
++int board_mmc_getcd(struct mmc *mmc)
++{
++	struct fsl_esdhc_cfg *cfg = (struct fsl_esdhc_cfg *)mmc->priv;
++	int ret = 0;
++
++	switch (cfg->esdhc_base) {
++	case USDHC1_BASE_ADDR:
++		ret = !gpio_get_value(SD_CD_GPIO);
++		break;
++	case USDHC2_BASE_ADDR:
++		ret = 1;
++		break;
++	}
++
++	return ret;
++}
++
++int board_mmc_init(bd_t *bis)
++{
++	int ret;
++
++	/* SD */
++	imx_iomux_v3_setup_multiple_pads(sd_pads, ARRAY_SIZE(sd_pads));
++	gpio_direction_input(SD_CD_GPIO);
++	sd_cfg.sdhc_clk = mxc_get_clock(MXC_ESDHC_CLK);
++
++	ret = fsl_esdhc_initialize(bis, &sd_cfg);
++	if (ret) {
++		printf("Warning: failed to initialize mmc dev 0 (SD)\n");
++		return ret;
++	}
++
++	return litesom_mmc_init(bis);
++}
++
++static int check_mmc_autodetect(void)
++{
++	char *autodetect_str = getenv("mmcautodetect");
++
++	if ((autodetect_str != NULL) &&
++	    (strcmp(autodetect_str, "yes") == 0)) {
++		return 1;
++	}
++
++	return 0;
++}
++
++void board_late_mmc_init(void)
++{
++	char cmd[32];
++	char mmcblk[32];
++	u32 dev_no = mmc_get_env_devno();
++
++	if (!check_mmc_autodetect())
++		return;
++
++	setenv_ulong("mmcdev", dev_no);
++
++	/* Set mmcblk env */
++	sprintf(mmcblk, "/dev/mmcblk%dp2 rootwait rw",
++		dev_no);
++	setenv("mmcroot", mmcblk);
++
++	sprintf(cmd, "mmc dev %d", dev_no);
++	run_command(cmd, 0);
++}
++#endif
++
++#ifdef CONFIG_FEC_MXC
++int board_eth_init(bd_t *bis)
++{
++	setup_iomux_fec();
++
++	return fecmxc_initialize(bis);
++}
++
++static int setup_fec(void)
++{
++	struct iomuxc *const iomuxc_regs = (struct iomuxc *)IOMUXC_BASE_ADDR;
++	int ret;
++
++	/* Use 50M anatop loopback REF_CLK1 for ENET1, clear gpr1[13],
++	   set gpr1[17]*/
++	clrsetbits_le32(&iomuxc_regs->gpr[1], IOMUX_GPR1_FEC1_MASK,
++			IOMUX_GPR1_FEC1_CLOCK_MUX1_SEL_MASK);
++
++	ret = enable_fec_anatop_clock(0, ENET_50MHZ);
++	if (ret)
++		return ret;
++
++	enable_enet_clk(1);
++
++	return 0;
++}
++#endif
++
++#ifdef CONFIG_USB_EHCI_MX6
++int board_usb_phy_mode(int port)
++{
++	return USB_INIT_HOST;
++}
++#endif
++
++int board_early_init_f(void)
++{
++	setup_iomux_uart();
++
++	return 0;
++}
++
++int board_init(void)
++{
++	/* Address of boot parameters */
++	gd->bd->bi_boot_params = PHYS_SDRAM + 0x100;
++
++#ifdef	CONFIG_FEC_MXC
++	setup_fec();
++#endif
++
++	return 0;
++}
++
++#ifdef CONFIG_CMD_BMODE
++static const struct boot_mode board_boot_modes[] = {
++	/* 4 bit bus width */
++	{"sd",   MAKE_CFGVAL(0x42, 0x20, 0x00, 0x00)},
++	{"emmc", MAKE_CFGVAL(0x40, 0x28, 0x00, 0x00)},
++	{NULL,	 0},
++};
++#endif
++
++int board_late_init(void)
++{
++#ifdef CONFIG_CMD_BMODE
++	add_board_boot_modes(board_boot_modes);
++#endif
++
++#ifdef CONFIG_ENV_IS_IN_MMC
++	board_late_mmc_init();
++#endif
++
++	return 0;
++}
++
++int checkboard(void)
++{
++	puts("Board: Grinn liteBoard\n");
++
++	return 0;
++}
++
++#ifdef CONFIG_SPL_BUILD
++void board_init_f(ulong dummy)
++{
++	litesom_init_f();
++}
++#endif
+diff --git a/configs/liteboard_defconfig b/configs/liteboard_defconfig
+new file mode 100644
+index 0000000..f853461
+--- /dev/null
++++ b/configs/liteboard_defconfig
+@@ -0,0 +1,22 @@
++CONFIG_ARM=y
++CONFIG_ARCH_MX6=y
++CONFIG_TARGET_LITEBOARD=y
++CONFIG_SPL=y
++CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=arch/arm/imx-common/spl_sd.cfg"
++CONFIG_BOOTDELAY=1
++CONFIG_HUSH_PARSER=y
++CONFIG_CMD_BOOTZ=y
++# CONFIG_CMD_IMLS is not set
++CONFIG_CMD_MEMTEST=y
++CONFIG_CMD_MMC=y
++CONFIG_CMD_USB=y
++CONFIG_CMD_GPIO=y
++CONFIG_CMD_DHCP=y
++CONFIG_CMD_PING=y
++CONFIG_CMD_CACHE=y
++CONFIG_CMD_EXT2=y
++CONFIG_CMD_EXT4=y
++CONFIG_CMD_EXT4_WRITE=y
++CONFIG_CMD_FAT=y
++CONFIG_CMD_FS_GENERIC=y
++CONFIG_OF_LIBFDT=y
+diff --git a/include/configs/liteboard.h b/include/configs/liteboard.h
+new file mode 100644
+index 0000000..19b961f
+--- /dev/null
++++ b/include/configs/liteboard.h
+@@ -0,0 +1,174 @@
++/*
++ * Copyright (C) 2015 Freescale Semiconductor, Inc.
++ * Copyright (C) 2016 Grinn
++ *
++ * Configuration settings for the Grinn liteBoard (i.MX6UL).
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++#ifndef __LITEBOARD_CONFIG_H
++#define __LITEBOARD_CONFIG_H
++
++#include <asm/arch/imx-regs.h>
++#include <linux/sizes.h>
++#include "mx6_common.h"
++
++/* SPL options */
++#define CONFIG_SPL_LIBCOMMON_SUPPORT
++#define CONFIG_SPL_MMC_SUPPORT
++#include "imx6_spl.h"
++
++/* Size of malloc() pool */
++#define CONFIG_SYS_MALLOC_LEN		(16 * SZ_1M)
++
++#define CONFIG_BOARD_EARLY_INIT_F
++#define CONFIG_BOARD_LATE_INIT
++
++#define CONFIG_MXC_UART
++#define CONFIG_MXC_UART_BASE		UART1_BASE
++
++/* MMC Configs */
++#ifdef CONFIG_FSL_USDHC
++#define CONFIG_SYS_FSL_ESDHC_ADDR	USDHC1_BASE_ADDR
++#endif
++
++#define CONFIG_DEFAULT_FDT_FILE		"imx6ul-liteboard.dtb"
++
++#define CONFIG_SYS_MMC_IMG_LOAD_PART	1
++
++#define CONFIG_EXTRA_ENV_SETTINGS \
++	"script=boot.scr\0" \
++	"image=zImage\0" \
++	"console=ttymxc0\0" \
++	"fdt_high=0xffffffff\0" \
++	"initrd_high=0xffffffff\0" \
++	"fdt_file=" CONFIG_DEFAULT_FDT_FILE "\0" \
++	"fdt_addr=0x83000000\0" \
++	"boot_fdt=try\0" \
++	"ip_dyn=yes\0" \
++	"mmcdev="__stringify(CONFIG_SYS_MMC_ENV_DEV)"\0" \
++	"mmcpart=" __stringify(CONFIG_SYS_MMC_IMG_LOAD_PART) "\0" \
++	"mmcroot=" CONFIG_MMCROOT " rootwait rw\0" \
++	"mmcautodetect=yes\0" \
++	"mmcargs=setenv bootargs console=${console},${baudrate} " \
++		"root=${mmcroot}\0" \
++	"loadbootscript=" \
++		"fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};\0" \
++	"bootscript=echo Running bootscript from mmc ...; " \
++		"source\0" \
++	"loadimage=fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image}\0" \
++	"loadfdt=fatload mmc ${mmcdev}:${mmcpart} ${fdt_addr} ${fdt_file}\0" \
++	"mmcboot=echo Booting from mmc ...; " \
++		"run mmcargs; " \
++		"if test ${boot_fdt} = yes || test ${boot_fdt} = try; then " \
++			"if run loadfdt; then " \
++				"bootz ${loadaddr} - ${fdt_addr}; " \
++			"else " \
++				"if test ${boot_fdt} = try; then " \
++					"bootz; " \
++				"else " \
++					"echo WARN: Cannot load the DT; " \
++				"fi; " \
++			"fi; " \
++		"else " \
++			"bootz; " \
++		"fi;\0" \
++	"netargs=setenv bootargs console=${console},${baudrate} " \
++		"root=/dev/nfs " \
++	"ip=dhcp nfsroot=${serverip}:${nfsroot},v3,tcp\0" \
++	"netboot=echo Booting from net ...; " \
++		"run netargs; " \
++		"if test ${ip_dyn} = yes; then " \
++			"setenv get_cmd dhcp; " \
++		"else " \
++			"setenv get_cmd tftp; " \
++		"fi; " \
++		"${get_cmd} ${image}; " \
++		"if test ${boot_fdt} = yes || test ${boot_fdt} = try; then " \
++			"if ${get_cmd} ${fdt_addr} ${fdt_file}; then " \
++				"bootz ${loadaddr} - ${fdt_addr}; " \
++			"else " \
++				"if test ${boot_fdt} = try; then " \
++					"bootz; " \
++				"else " \
++					"echo WARN: Cannot load the DT; " \
++				"fi; " \
++			"fi; " \
++		"else " \
++			"bootz; " \
++		"fi;\0"
++
++#define CONFIG_BOOTCOMMAND \
++	   "mmc dev ${mmcdev};" \
++	   "if mmc rescan; then " \
++		   "if run loadbootscript; then " \
++			   "run bootscript; " \
++		   "else " \
++			   "if run loadimage; then " \
++				   "run mmcboot; " \
++			   "else run netboot; " \
++			   "fi; " \
++		   "fi; " \
++	   "else run netboot; fi"
++
++/* Miscellaneous configurable options */
++#define CONFIG_SYS_MEMTEST_START	0x80000000
++#define CONFIG_SYS_MEMTEST_END		(CONFIG_SYS_MEMTEST_START + SZ_128M)
++
++#define CONFIG_SYS_LOAD_ADDR		CONFIG_LOADADDR
++#define CONFIG_SYS_HZ			1000
++
++#define CONFIG_CMDLINE_EDITING
++#define CONFIG_STACKSIZE		SZ_128K
++
++/* Physical Memory Map */
++#define CONFIG_NR_DRAM_BANKS		1
++#define PHYS_SDRAM			MMDC0_ARB_BASE_ADDR
++
++#define CONFIG_SYS_SDRAM_BASE		PHYS_SDRAM
++#define CONFIG_SYS_INIT_RAM_ADDR	IRAM_BASE_ADDR
++#define CONFIG_SYS_INIT_RAM_SIZE	IRAM_SIZE
++
++#define CONFIG_SYS_INIT_SP_OFFSET \
++	(CONFIG_SYS_INIT_RAM_SIZE - GENERATED_GBL_DATA_SIZE)
++#define CONFIG_SYS_INIT_SP_ADDR \
++	(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)
++
++/* FLASH and environment organization */
++#define CONFIG_ENV_SIZE			SZ_8K
++#define CONFIG_ENV_IS_IN_MMC
++#define CONFIG_ENV_OFFSET		(8 * SZ_64K)
++#define CONFIG_SYS_MMC_ENV_DEV		0
++#define CONFIG_SYS_MMC_ENV_PART		0
++#define CONFIG_MMCROOT			"/dev/mmcblk0p2"
++
++#define CONFIG_CMD_BMODE
++
++/* USB Configs */
++#ifdef CONFIG_CMD_USB
++#define CONFIG_USB_EHCI
++#define CONFIG_USB_EHCI_MX6
++#define CONFIG_USB_STORAGE
++#define CONFIG_EHCI_HCD_INIT_AFTER_RESET
++#define CONFIG_MXC_USB_PORTSC  (PORT_PTS_UTMI | PORT_PTS_PTW)
++#define CONFIG_MXC_USB_FLAGS   0
++#define CONFIG_USB_MAX_CONTROLLER_COUNT 1
++#endif
++
++#ifdef CONFIG_CMD_NET
++#define CONFIG_FEC_MXC
++#define CONFIG_MII
++#define CONFIG_FEC_ENET_DEV		0
++
++#define IMX_FEC_BASE			ENET_BASE_ADDR
++#define CONFIG_FEC_MXC_PHYADDR		0x0
++#define CONFIG_FEC_XCV_TYPE		RMII
++#define CONFIG_ETHPRIME			"FEC"
++
++#define CONFIG_PHYLIB
++#define CONFIG_PHY_SMSC
++#endif
++
++#define CONFIG_IMX_THERMAL
++
++#endif
+-- 
+2.10.0
+
diff --git a/board/grinn/liteboard/post-image.sh b/board/grinn/liteboard/post-image.sh
new file mode 100755
index 0000000..1a076ee
--- /dev/null
+++ b/board/grinn/liteboard/post-image.sh
@@ -0,0 +1,14 @@
+#!/usr/bin/env bash
+
+BOARD_DIR="$(dirname $0)"
+GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+    --rootpath "${TARGET_DIR}" \
+    --tmppath "${GENIMAGE_TMP}" \
+    --inputpath "${BINARIES_DIR}" \
+    --outputpath "${BINARIES_DIR}" \
+    --config "${GENIMAGE_CFG}"
diff --git a/board/grinn/liteboard/readme.txt b/board/grinn/liteboard/readme.txt
new file mode 100644
index 0000000..fe1386a
--- /dev/null
+++ b/board/grinn/liteboard/readme.txt
@@ -0,0 +1,45 @@
+*********
+liteBoard
+*********
+
+Build
+=====
+
+First, configure Buildroot for your liteBoard:
+
+  make grinn_liteboard_defconfig
+
+Build image:
+
+  make
+
+After building you should get a tree like this:
+
+  output/images/
+  ????????? boot.vfat
+  ????????? imx6ul-liteboard.dtb
+  ????????? rootfs.ext2
+  ????????? rootfs.ext4
+  ????????? rootfs.tar
+  ????????? sdcard.img
+  ????????? u-boot.imx
+  ????????? zImage
+
+Create a bootable microSD card
+==============================
+
+Buildroot prepares a bootable microSD card image "sdcard.img" in output/images/
+directory, To flash SD card just run the following command:
+
+  sudo dd if=output/images/sdcard.img of=/dev/<sd_card> bs=1M
+
+where <sd_card> can be sdX or mmcblkX
+
+*** WARNING! This will destroy all contents of device you specify! ***
+
+Boot liteBoard
+==============
+
+- insert the microSD card in the microSD slot of the board;
+- plug micro USB cable to provide power and console interface
+- use terminal emulator with 115200 bps, 8n1
diff --git a/configs/grinn_liteboard_defconfig b/configs/grinn_liteboard_defconfig
new file mode 100644
index 0000000..5edb375
--- /dev/null
+++ b/configs/grinn_liteboard_defconfig
@@ -0,0 +1,26 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_GLOBAL_PATCH_DIR="board/grinn/liteboard/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/liteboard/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.8"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-liteboard"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="liteboard"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
