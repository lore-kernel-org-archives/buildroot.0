From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 23 Jan 2017 16:34:51 +0100
Subject: [Buildroot] [PATCH 1/2] board: add support for chiliBoard
Message-ID: <20170123153452.32063-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Marcin Niestroj <macius1990w@gmail.com>

Board support package includes:

 * Buildroot defconfig
 * Mainline Linux kernel v4.9.5
 * Mainline U-Boot v2017.01 with board support patches
 * genimage config to create sdcard image
 * Board readme.txt

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 board/grinn/chiliboard/genimage.cfg                |  31 +
 ...e-Fix-config.mk-inclusion-for-multiple-ma.patch |  31 +
 .../0002-ARM-am335x-Add-support-for-chiliSOM.patch | 294 +++++++++
 ...ard-chiliboard-Add-support-for-chiliBoard.patch | 707 +++++++++++++++++++++
 board/grinn/chiliboard/post-image.sh               |  14 +
 board/grinn/chiliboard/readme.txt                  |  46 ++
 configs/grinn_chiliboard_defconfig                 |  27 +
 7 files changed, 1150 insertions(+)
 create mode 100644 board/grinn/chiliboard/genimage.cfg
 create mode 100644 board/grinn/chiliboard/patches/uboot/0001-ARM-Makefile-Fix-config.mk-inclusion-for-multiple-ma.patch
 create mode 100644 board/grinn/chiliboard/patches/uboot/0002-ARM-am335x-Add-support-for-chiliSOM.patch
 create mode 100644 board/grinn/chiliboard/patches/uboot/0003-board-chiliboard-Add-support-for-chiliBoard.patch
 create mode 100755 board/grinn/chiliboard/post-image.sh
 create mode 100644 board/grinn/chiliboard/readme.txt
 create mode 100644 configs/grinn_chiliboard_defconfig

diff --git a/board/grinn/chiliboard/genimage.cfg b/board/grinn/chiliboard/genimage.cfg
new file mode 100644
index 000000000..ffe027e7a
--- /dev/null
+++ b/board/grinn/chiliboard/genimage.cfg
@@ -0,0 +1,31 @@
+# Minimal microSD card image for Grinn's chiliBoard
+#
+
+image boot.vfat {
+  vfat {
+    files = {
+      "MLO",
+      "u-boot.img",
+      "am335x-chiliboard.dtb",
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
+  partition u-boot {
+    partition-type = 0xC
+    bootable = "true"
+    image = "boot.vfat"
+    offset = 1M
+  }
+
+  partition rootfs {
+    partition-type = 0x83
+    image = "rootfs.ext4"
+  }
+}
diff --git a/board/grinn/chiliboard/patches/uboot/0001-ARM-Makefile-Fix-config.mk-inclusion-for-multiple-ma.patch b/board/grinn/chiliboard/patches/uboot/0001-ARM-Makefile-Fix-config.mk-inclusion-for-multiple-ma.patch
new file mode 100644
index 000000000..e2ff78539
--- /dev/null
+++ b/board/grinn/chiliboard/patches/uboot/0001-ARM-Makefile-Fix-config.mk-inclusion-for-multiple-ma.patch
@@ -0,0 +1,31 @@
+From 396d915872c94fe63e1638c105d6df0cf8e953ca Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Mon, 23 Jan 2017 12:15:20 +0100
+Subject: [PATCH 1/3] ARM: Makefile: Fix config.mk inclusion for multiple
+ mach-* dirs
+
+If multiple mach-* directories are enabled in Kconfig then there was a
+build error:
+make[1]: *** arch/arm/mach-<directory>/: Is a directory. Stop.
+
+Allow to enable multiple mach-* directories by proper config.mk
+inclusion for each of them.
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ arch/arm/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/Makefile b/arch/arm/Makefile
+index 4b8bf80c40..43462fd844 100644
+--- a/arch/arm/Makefile
++++ b/arch/arm/Makefile
+@@ -109,4 +109,4 @@ libs-y += arch/arm/mach-mvebu/
+ endif
+ 
+ # deprecated
+--include $(machdirs)/config.mk
++-include $(patsubst %,%/config.mk,$(machdirs))
+-- 
+2.11.0
+
diff --git a/board/grinn/chiliboard/patches/uboot/0002-ARM-am335x-Add-support-for-chiliSOM.patch b/board/grinn/chiliboard/patches/uboot/0002-ARM-am335x-Add-support-for-chiliSOM.patch
new file mode 100644
index 000000000..de5c36f33
--- /dev/null
+++ b/board/grinn/chiliboard/patches/uboot/0002-ARM-am335x-Add-support-for-chiliSOM.patch
@@ -0,0 +1,294 @@
+From 89b46a0ba8eaef8d1b9869d48ae335fc54135afb Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Mon, 23 Jan 2017 13:23:08 +0100
+Subject: [PATCH 2/3] ARM: am335x: Add support for chiliSOM
+
+chiliSOM is a System On Module (http://http://grinn-global.com/chilisom/).
+It can't exists on its own, but will be used as part of other boards.
+
+Hardware specification:
+ * TI AM335x processor
+ * 128M, 256M or 512M DDR3 memory
+ * up to 256M NAND
+
+Here we treat SOM similar to SOC, so we place it inside arch/arm/mach-*
+directory and make it possible to reuse initialization code (i.e. DDR,
+NAND init) for all boards that use it. This approach is similar as for
+liteSOM module.
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ arch/arm/Kconfig                               |   2 +
+ arch/arm/Makefile                              |   1 +
+ arch/arm/mach-chilisom/Kconfig                 |   4 +
+ arch/arm/mach-chilisom/Makefile                |   6 +
+ arch/arm/mach-chilisom/chilisom.c              | 185 +++++++++++++++++++++++++
+ arch/arm/mach-chilisom/include/mach/chilisom.h |  15 ++
+ 6 files changed, 213 insertions(+)
+ create mode 100644 arch/arm/mach-chilisom/Kconfig
+ create mode 100644 arch/arm/mach-chilisom/Makefile
+ create mode 100644 arch/arm/mach-chilisom/chilisom.c
+ create mode 100644 arch/arm/mach-chilisom/include/mach/chilisom.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 0ed36cded4..716c178c90 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -923,6 +923,8 @@ source "arch/arm/mach-at91/Kconfig"
+ 
+ source "arch/arm/mach-bcm283x/Kconfig"
+ 
++source "arch/arm/mach-chilisom/Kconfig"
++
+ source "arch/arm/mach-davinci/Kconfig"
+ 
+ source "arch/arm/mach-exynos/Kconfig"
+diff --git a/arch/arm/Makefile b/arch/arm/Makefile
+index 43462fd844..61448ea27c 100644
+--- a/arch/arm/Makefile
++++ b/arch/arm/Makefile
+@@ -52,6 +52,7 @@ PLATFORM_CPPFLAGS += $(arch-y) $(tune-y)
+ # by CONFIG_* macro name.
+ machine-$(CONFIG_ARCH_AT91)		+= at91
+ machine-$(CONFIG_ARCH_BCM283X)		+= bcm283x
++machine-$(CONFIG_CHILISOM)		+= chilisom
+ machine-$(CONFIG_ARCH_DAVINCI)		+= davinci
+ machine-$(CONFIG_ARCH_EXYNOS)		+= exynos
+ machine-$(CONFIG_ARCH_HIGHBANK)		+= highbank
+diff --git a/arch/arm/mach-chilisom/Kconfig b/arch/arm/mach-chilisom/Kconfig
+new file mode 100644
+index 0000000000..6ae102b43a
+--- /dev/null
++++ b/arch/arm/mach-chilisom/Kconfig
+@@ -0,0 +1,4 @@
++config CHILISOM
++	bool
++	select DM
++	select SUPPORT_SPL
+diff --git a/arch/arm/mach-chilisom/Makefile b/arch/arm/mach-chilisom/Makefile
+new file mode 100644
+index 0000000000..1d80d05589
+--- /dev/null
++++ b/arch/arm/mach-chilisom/Makefile
+@@ -0,0 +1,6 @@
++# (C) Copyright 2017 Grinn
++#
++# SPDX-License-Identifier:	GPL-2.0+
++#
++
++obj-y  := chilisom.o
+diff --git a/arch/arm/mach-chilisom/chilisom.c b/arch/arm/mach-chilisom/chilisom.c
+new file mode 100644
+index 0000000000..a594f6cf37
+--- /dev/null
++++ b/arch/arm/mach-chilisom/chilisom.c
+@@ -0,0 +1,185 @@
++/*
++ * Copyright (C) 2011, Texas Instruments, Incorporated - http://www.ti.com/
++ * Copyright (C) 2017, Grinn - http://grinn-global.com/
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++#include <common.h>
++#include <asm/arch/clock.h>
++#include <asm/arch/clk_synthesizer.h>
++#include <asm/arch/cpu.h>
++#include <asm/arch/ddr_defs.h>
++#include <asm/arch/hardware.h>
++#include <asm/arch/omap.h>
++#include <asm/arch/mem.h>
++#include <asm/arch/mux.h>
++#include <asm/arch/sys_proto.h>
++#include <asm/emif.h>
++#include <asm/io.h>
++#include <errno.h>
++#include <i2c.h>
++#include <power/tps65217.h>
++#include <spl.h>
++
++#ifndef CONFIG_SKIP_LOWLEVEL_INIT
++
++static struct ctrl_dev *cdev = (struct ctrl_dev *)CTRL_DEVICE_BASE;
++
++static struct module_pin_mux i2c0_pin_mux[] = {
++	{OFFSET(i2c0_sda), (MODE(0) | RXACTIVE |
++			PULLUDEN | SLEWCTRL)}, /* I2C_DATA */
++	{OFFSET(i2c0_scl), (MODE(0) | RXACTIVE |
++			PULLUDEN | SLEWCTRL)}, /* I2C_SCLK */
++	{-1},
++};
++
++static struct module_pin_mux nand_pin_mux[] = {
++	{OFFSET(gpmc_ad0), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* NAND AD0 */
++	{OFFSET(gpmc_ad1), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* NAND AD1 */
++	{OFFSET(gpmc_ad2), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* NAND AD2 */
++	{OFFSET(gpmc_ad3), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* NAND AD3 */
++	{OFFSET(gpmc_ad4), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* NAND AD4 */
++	{OFFSET(gpmc_ad5), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* NAND AD5 */
++	{OFFSET(gpmc_ad6), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* NAND AD6 */
++	{OFFSET(gpmc_ad7), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* NAND AD7 */
++	{OFFSET(gpmc_wait0), (MODE(0) | RXACTIVE | PULLUP_EN)}, /* NAND WAIT */
++	{OFFSET(gpmc_wpn), (MODE(7) | PULLUP_EN | RXACTIVE)},	/* NAND_WPN */
++	{OFFSET(gpmc_csn0), (MODE(0) | PULLUDEN)},	/* NAND_CS0 */
++	{OFFSET(gpmc_advn_ale), (MODE(0) | PULLUDEN)}, /* NAND_ADV_ALE */
++	{OFFSET(gpmc_oen_ren), (MODE(0) | PULLUDEN)},	/* NAND_OE */
++	{OFFSET(gpmc_wen), (MODE(0) | PULLUDEN)},	/* NAND_WEN */
++	{OFFSET(gpmc_be0n_cle), (MODE(0) | PULLUDEN)},	/* NAND_BE_CLE */
++	{-1},
++};
++
++static void enable_i2c0_pin_mux(void)
++{
++	configure_module_pin_mux(i2c0_pin_mux);
++}
++
++void chilisom_enable_pin_mux(void)
++{
++	/* chilisom pin mux */
++	configure_module_pin_mux(nand_pin_mux);
++}
++
++static const struct ddr_data ddr3_chilisom_data = {
++	.datardsratio0 = MT41K256M16HA125E_RD_DQS,
++	.datawdsratio0 = MT41K256M16HA125E_WR_DQS,
++	.datafwsratio0 = MT41K256M16HA125E_PHY_FIFO_WE,
++	.datawrsratio0 = MT41K256M16HA125E_PHY_WR_DATA,
++};
++
++static const struct cmd_control ddr3_chilisom_cmd_ctrl_data = {
++	.cmd0csratio = MT41K256M16HA125E_RATIO,
++	.cmd0iclkout = MT41K256M16HA125E_INVERT_CLKOUT,
++
++	.cmd1csratio = MT41K256M16HA125E_RATIO,
++	.cmd1iclkout = MT41K256M16HA125E_INVERT_CLKOUT,
++
++	.cmd2csratio = MT41K256M16HA125E_RATIO,
++	.cmd2iclkout = MT41K256M16HA125E_INVERT_CLKOUT,
++};
++
++static struct emif_regs ddr3_chilisom_emif_reg_data = {
++	.sdram_config = MT41K256M16HA125E_EMIF_SDCFG,
++	.ref_ctrl = MT41K256M16HA125E_EMIF_SDREF,
++	.sdram_tim1 = MT41K256M16HA125E_EMIF_TIM1,
++	.sdram_tim2 = MT41K256M16HA125E_EMIF_TIM2,
++	.sdram_tim3 = MT41K256M16HA125E_EMIF_TIM3,
++	.ocp_config = 0x00141414,
++	.zq_config = MT41K256M16HA125E_ZQ_CFG,
++	.emif_ddr_phy_ctlr_1 = MT41K256M16HA125E_EMIF_READ_LATENCY,
++};
++
++void chilisom_spl_board_init(void)
++{
++	int mpu_vdd;
++	int usb_cur_lim;
++
++	enable_i2c0_pin_mux();
++
++	/* Get the frequency */
++	dpll_mpu_opp100.m = am335x_get_efuse_mpu_max_freq(cdev);
++
++
++	if (i2c_probe(TPS65217_CHIP_PM))
++		return;
++
++	/*
++	 * Increase USB current limit to 1300mA or 1800mA and set
++	 * the MPU voltage controller as needed.
++	 */
++	if (dpll_mpu_opp100.m == MPUPLL_M_1000) {
++		usb_cur_lim = TPS65217_USB_INPUT_CUR_LIMIT_1800MA;
++		mpu_vdd = TPS65217_DCDC_VOLT_SEL_1325MV;
++	} else {
++		usb_cur_lim = TPS65217_USB_INPUT_CUR_LIMIT_1300MA;
++		mpu_vdd = TPS65217_DCDC_VOLT_SEL_1275MV;
++	}
++
++	if (tps65217_reg_write(TPS65217_PROT_LEVEL_NONE,
++			       TPS65217_POWER_PATH,
++			       usb_cur_lim,
++			       TPS65217_USB_INPUT_CUR_LIMIT_MASK))
++		puts("tps65217_reg_write failure\n");
++
++	/* Set DCDC3 (CORE) voltage to 1.125V */
++	if (tps65217_voltage_update(TPS65217_DEFDCDC3,
++				    TPS65217_DCDC_VOLT_SEL_1125MV)) {
++		puts("tps65217_voltage_update failure\n");
++		return;
++	}
++	/* Set CORE Frequencies to OPP100 */
++	do_setup_dpll(&dpll_core_regs, &dpll_core_opp100);
++
++	/* Set DCDC2 (MPU) voltage */
++	if (tps65217_voltage_update(TPS65217_DEFDCDC2, mpu_vdd)) {
++		puts("tps65217_voltage_update failure\n");
++		return;
++	}
++
++	/* Set LDO3 to 1.8V and LDO4 to 3.3V */
++	if (tps65217_reg_write(TPS65217_PROT_LEVEL_2,
++			       TPS65217_DEFLS1,
++			       TPS65217_LDO_VOLTAGE_OUT_1_8,
++			       TPS65217_LDO_MASK))
++		puts("tps65217_reg_write failure\n");
++
++	if (tps65217_reg_write(TPS65217_PROT_LEVEL_2,
++			       TPS65217_DEFLS2,
++			       TPS65217_LDO_VOLTAGE_OUT_3_3,
++			       TPS65217_LDO_MASK))
++		puts("tps65217_reg_write failure\n");
++
++	/* Set MPU Frequency to what we detected now that voltages are set */
++	do_setup_dpll(&dpll_mpu_regs, &dpll_mpu_opp100);
++}
++
++#define OSC	(V_OSCK/1000000)
++const struct dpll_params dpll_ddr_chilisom = {
++		400, OSC-1, 1, -1, -1, -1, -1};
++
++const struct dpll_params *get_dpll_ddr_params(void)
++{
++	return &dpll_ddr_chilisom;
++}
++
++const struct ctrl_ioregs ioregs_chilisom = {
++	.cm0ioctl		= MT41K256M16HA125E_IOCTRL_VALUE,
++	.cm1ioctl		= MT41K256M16HA125E_IOCTRL_VALUE,
++	.cm2ioctl		= MT41K256M16HA125E_IOCTRL_VALUE,
++	.dt0ioctl		= MT41K256M16HA125E_IOCTRL_VALUE,
++	.dt1ioctl		= MT41K256M16HA125E_IOCTRL_VALUE,
++};
++
++void sdram_init(void)
++{
++	config_ddr(400, &ioregs_chilisom,
++		   &ddr3_chilisom_data,
++		   &ddr3_chilisom_cmd_ctrl_data,
++		   &ddr3_chilisom_emif_reg_data, 0);
++}
++
++#endif /* CONFIG_SKIP_LOWLEVEL_INIT */
+diff --git a/arch/arm/mach-chilisom/include/mach/chilisom.h b/arch/arm/mach-chilisom/include/mach/chilisom.h
+new file mode 100644
+index 0000000000..bd0016e441
+--- /dev/null
++++ b/arch/arm/mach-chilisom/include/mach/chilisom.h
+@@ -0,0 +1,15 @@
++/*
++ * Copyright (C) 2017 Grinn
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++#ifndef __ARCH_ARM_MACH_CHILISOM_SOM_H__
++#define __ARCH_ARM_MACH_CHILISOM_SOM_H__
++
++#ifndef CONFIG_SKIP_LOWLEVEL_INIT
++void chilisom_enable_pin_mux(void);
++void chilisom_spl_board_init(void);
++#endif
++
++#endif
+-- 
+2.11.0
+
diff --git a/board/grinn/chiliboard/patches/uboot/0003-board-chiliboard-Add-support-for-chiliBoard.patch b/board/grinn/chiliboard/patches/uboot/0003-board-chiliboard-Add-support-for-chiliBoard.patch
new file mode 100644
index 000000000..432d93ee3
--- /dev/null
+++ b/board/grinn/chiliboard/patches/uboot/0003-board-chiliboard-Add-support-for-chiliBoard.patch
@@ -0,0 +1,707 @@
+From bb1cf53fb0e0bfd98f0ef7e647bf4b7f79cc170d Mon Sep 17 00:00:00 2001
+From: Marcin Niestroj <m.niestroj@grinn-global.com>
+Date: Mon, 23 Jan 2017 13:23:28 +0100
+Subject: [PATCH 3/3] board/chiliboard: Add support for chiliBoard
+
+chiliBoard is a development board which uses chiliSOM as its base.
+
+Hardware specification:
+ * chiliSOM (TI AM335x, DRAM, NAND)
+ * Ethernet PHY (id 0)
+ * USB host (usb1)
+ * MicroSD slot (mmc0)
+
+Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
+---
+ arch/arm/Kconfig                   |   1 +
+ arch/arm/mach-omap2/am33xx/Kconfig |   5 +
+ board/grinn/chiliboard/Kconfig     |  15 +++
+ board/grinn/chiliboard/MAINTAINERS |   6 +
+ board/grinn/chiliboard/Makefile    |   6 +
+ board/grinn/chiliboard/README      |  31 +++++
+ board/grinn/chiliboard/board.c     | 264 +++++++++++++++++++++++++++++++++++++
+ configs/chiliboard_defconfig       |  47 +++++++
+ include/configs/chiliboard.h       | 232 ++++++++++++++++++++++++++++++++
+ 9 files changed, 607 insertions(+)
+ create mode 100644 board/grinn/chiliboard/Kconfig
+ create mode 100644 board/grinn/chiliboard/MAINTAINERS
+ create mode 100644 board/grinn/chiliboard/Makefile
+ create mode 100644 board/grinn/chiliboard/README
+ create mode 100644 board/grinn/chiliboard/board.c
+ create mode 100644 configs/chiliboard_defconfig
+ create mode 100644 include/configs/chiliboard.h
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 716c178c90..6e3aa6db82 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1030,6 +1030,7 @@ source "board/freescale/mx53loco/Kconfig"
+ source "board/freescale/mx53smd/Kconfig"
+ source "board/freescale/s32v234evb/Kconfig"
+ source "board/freescale/vf610twr/Kconfig"
++source "board/grinn/chiliboard/Kconfig"
+ source "board/gumstix/pepper/Kconfig"
+ source "board/h2200/Kconfig"
+ source "board/hisilicon/hikey/Kconfig"
+diff --git a/arch/arm/mach-omap2/am33xx/Kconfig b/arch/arm/mach-omap2/am33xx/Kconfig
+index 56c44062c4..0068ad6eb9 100644
+--- a/arch/arm/mach-omap2/am33xx/Kconfig
++++ b/arch/arm/mach-omap2/am33xx/Kconfig
+@@ -55,6 +55,11 @@ config TARGET_BAV335X
+ 
+ 	  For more information, visit: http://birdland.com/oem
+ 
++config TARGET_CHILIBOARD
++	bool "Grinn chiliBoard"
++	select CHILISOM
++	select DM_SERIAL
++
+ config TARGET_CM_T335
+ 	bool "Support cm_t335"
+ 	select DM
+diff --git a/board/grinn/chiliboard/Kconfig b/board/grinn/chiliboard/Kconfig
+new file mode 100644
+index 0000000000..20056e81a1
+--- /dev/null
++++ b/board/grinn/chiliboard/Kconfig
+@@ -0,0 +1,15 @@
++if TARGET_CHILIBOARD
++
++config SYS_BOARD
++	default "chiliboard"
++
++config SYS_VENDOR
++	default "grinn"
++
++config SYS_CONFIG_NAME
++	default "chiliboard"
++
++config SYS_SOC
++	default "am33xx"
++
++endif
+diff --git a/board/grinn/chiliboard/MAINTAINERS b/board/grinn/chiliboard/MAINTAINERS
+new file mode 100644
+index 0000000000..56b306f84c
+--- /dev/null
++++ b/board/grinn/chiliboard/MAINTAINERS
+@@ -0,0 +1,6 @@
++CHILIBOARD
++M:	Marcin Niestroj <m.niestroj@grinn-global.com>
++S:	Maintained
++F:	board/grinn/chiliboard/
++F:	include/configs/chiliboard.h
++F:	configs/chiliboard_defconfig
+diff --git a/board/grinn/chiliboard/Makefile b/board/grinn/chiliboard/Makefile
+new file mode 100644
+index 0000000000..865968d1a7
+--- /dev/null
++++ b/board/grinn/chiliboard/Makefile
+@@ -0,0 +1,6 @@
++# (C) Copyright 2017 Grinn
++#
++# SPDX-License-Identifier:	GPL-2.0+
++#
++
++obj-y  := board.o
+diff --git a/board/grinn/chiliboard/README b/board/grinn/chiliboard/README
+new file mode 100644
+index 0000000000..cea4c1d42e
+--- /dev/null
++++ b/board/grinn/chiliboard/README
+@@ -0,0 +1,31 @@
++How to use U-Boot on Grinn's chiliBoard
++--------------------------------------
++
++- Build U-Boot for chiliBoard:
++
++$ make mrproper
++$ make chiliboard_defconfig
++$ make
++
++This will generate the SPL image called MLO and the u-boot.img.
++
++- Flash the SPL image into the micro SD card:
++
++sudo dd if=MLO of=/dev/mmcblk0 bs=128k; sync
++
++- Flash the u-boot.img image into the micro SD card:
++
++sudo dd if=u-boot.img of=/dev/mmcblk0 bs=128k seek=3; sync
++
++- Jumper settings:
++
++S2: 1 1 1 0 1 0
++
++where 0 means bottom position and 1 means top position (from the
++switch label numbers reference).
++
++- Insert the micro SD card in the board.
++
++- Connect USB cable between chiliBoard and the PC for the power and console.
++
++- U-Boot messages should come up.
+diff --git a/board/grinn/chiliboard/board.c b/board/grinn/chiliboard/board.c
+new file mode 100644
+index 0000000000..7f77f241f6
+--- /dev/null
++++ b/board/grinn/chiliboard/board.c
+@@ -0,0 +1,264 @@
++/*
++ * Copyright (C) 2011, Texas Instruments, Incorporated - http://www.ti.com/
++ * Copyright (C) 2017, Grinn - http://grinn-global.com/
++ *
++ * SPDX-License-Identifier:	GPL-2.0+
++ */
++
++#include <common.h>
++#include <asm/arch/cpu.h>
++#include <asm/arch/hardware.h>
++#include <asm/arch/omap.h>
++#include <asm/arch/mem.h>
++#include <asm/arch/mmc_host_def.h>
++#include <asm/arch/mux.h>
++#include <asm/arch/sys_proto.h>
++#include <asm/emif.h>
++#include <asm/io.h>
++#include <cpsw.h>
++#include <environment.h>
++#include <errno.h>
++#include <mach/chilisom.h>
++#include <miiphy.h>
++#include <serial.h>
++#include <spl.h>
++#include <watchdog.h>
++
++DECLARE_GLOBAL_DATA_PTR;
++
++static __maybe_unused struct ctrl_dev *cdev =
++	(struct ctrl_dev *)CTRL_DEVICE_BASE;
++
++#ifndef CONFIG_SKIP_LOWLEVEL_INIT
++static struct module_pin_mux uart0_pin_mux[] = {
++	{OFFSET(uart0_rxd), (MODE(0) | PULLUP_EN | RXACTIVE)},	/* UART0_RXD */
++	{OFFSET(uart0_txd), (MODE(0) | PULLUDEN)},		/* UART0_TXD */
++	{-1},
++};
++
++static struct module_pin_mux mmc0_pin_mux[] = {
++	{OFFSET(mmc0_dat3), (MODE(0) | RXACTIVE | PULLUP_EN)},	/* MMC0_DAT3 */
++	{OFFSET(mmc0_dat2), (MODE(0) | RXACTIVE | PULLUP_EN)},	/* MMC0_DAT2 */
++	{OFFSET(mmc0_dat1), (MODE(0) | RXACTIVE | PULLUP_EN)},	/* MMC0_DAT1 */
++	{OFFSET(mmc0_dat0), (MODE(0) | RXACTIVE | PULLUP_EN)},	/* MMC0_DAT0 */
++	{OFFSET(mmc0_clk), (MODE(0) | RXACTIVE | PULLUP_EN)},	/* MMC0_CLK */
++	{OFFSET(mmc0_cmd), (MODE(0) | RXACTIVE | PULLUP_EN)},	/* MMC0_CMD */
++	{-1},
++};
++
++static struct module_pin_mux rmii1_pin_mux[] = {
++	{OFFSET(mii1_crs), MODE(1) | RXACTIVE},		/* RMII1_CRS */
++	{OFFSET(mii1_rxerr), MODE(1) | RXACTIVE},	/* RMII1_RXERR */
++	{OFFSET(mii1_txen), MODE(1)},			/* RMII1_TXEN */
++	{OFFSET(mii1_txd1), MODE(1)},			/* RMII1_TXD1 */
++	{OFFSET(mii1_txd0), MODE(1)},			/* RMII1_TXD0 */
++	{OFFSET(mii1_rxd1), MODE(1) | RXACTIVE},	/* RMII1_RXD1 */
++	{OFFSET(mii1_rxd0), MODE(1) | RXACTIVE},	/* RMII1_RXD0 */
++	{OFFSET(mdio_data), MODE(0) | RXACTIVE | PULLUP_EN}, /* MDIO_DATA */
++	{OFFSET(mdio_clk), MODE(0) | PULLUP_EN},	/* MDIO_CLK */
++	{OFFSET(rmii1_refclk), MODE(0) | RXACTIVE},	/* RMII1_REFCLK */
++	{-1},
++};
++
++static void enable_board_pin_mux(void)
++{
++	chilisom_enable_pin_mux();
++
++	/* chiliboard pinmux */
++	configure_module_pin_mux(rmii1_pin_mux);
++	configure_module_pin_mux(mmc0_pin_mux);
++}
++#endif /* CONFIG_SKIP_LOWLEVEL_INIT */
++
++#ifndef CONFIG_DM_SERIAL
++struct serial_device *default_serial_console(void)
++{
++	return &eserial1_device;
++}
++#endif
++
++#ifndef CONFIG_SKIP_LOWLEVEL_INIT
++void set_uart_mux_conf(void)
++{
++	configure_module_pin_mux(uart0_pin_mux);
++}
++
++void set_mux_conf_regs(void)
++{
++	enable_board_pin_mux();
++}
++
++void am33xx_spl_board_init(void)
++{
++	chilisom_spl_board_init();
++}
++#endif
++
++/*
++ * Basic board specific setup.  Pinmux has been handled already.
++ */
++int board_init(void)
++{
++#if defined(CONFIG_HW_WATCHDOG)
++	hw_watchdog_init();
++#endif
++
++	gd->bd->bi_boot_params = CONFIG_SYS_SDRAM_BASE + 0x100;
++	gpmc_init();
++
++	return 0;
++}
++
++#ifdef CONFIG_BOARD_LATE_INIT
++int board_late_init(void)
++{
++#if !defined(CONFIG_SPL_BUILD)
++	uint8_t mac_addr[6];
++	uint32_t mac_hi, mac_lo;
++
++	/* try reading mac address from efuse */
++	mac_lo = readl(&cdev->macid0l);
++	mac_hi = readl(&cdev->macid0h);
++	mac_addr[0] = mac_hi & 0xFF;
++	mac_addr[1] = (mac_hi & 0xFF00) >> 8;
++	mac_addr[2] = (mac_hi & 0xFF0000) >> 16;
++	mac_addr[3] = (mac_hi & 0xFF000000) >> 24;
++	mac_addr[4] = mac_lo & 0xFF;
++	mac_addr[5] = (mac_lo & 0xFF00) >> 8;
++
++	if (!getenv("ethaddr")) {
++		printf("<ethaddr> not set. Validating first E-fuse MAC\n");
++
++		if (is_valid_ethaddr(mac_addr))
++			eth_setenv_enetaddr("ethaddr", mac_addr);
++	}
++
++	mac_lo = readl(&cdev->macid1l);
++	mac_hi = readl(&cdev->macid1h);
++	mac_addr[0] = mac_hi & 0xFF;
++	mac_addr[1] = (mac_hi & 0xFF00) >> 8;
++	mac_addr[2] = (mac_hi & 0xFF0000) >> 16;
++	mac_addr[3] = (mac_hi & 0xFF000000) >> 24;
++	mac_addr[4] = mac_lo & 0xFF;
++	mac_addr[5] = (mac_lo & 0xFF00) >> 8;
++
++	if (!getenv("eth1addr")) {
++		if (is_valid_ethaddr(mac_addr))
++			eth_setenv_enetaddr("eth1addr", mac_addr);
++	}
++#endif
++
++	return 0;
++}
++#endif
++
++#ifndef CONFIG_DM_ETH
++
++#if (defined(CONFIG_DRIVER_TI_CPSW) && !defined(CONFIG_SPL_BUILD)) || \
++	(defined(CONFIG_SPL_ETH_SUPPORT) && defined(CONFIG_SPL_BUILD))
++static void cpsw_control(int enabled)
++{
++	/* VTP can be added here */
++
++	return;
++}
++
++static struct cpsw_slave_data cpsw_slaves[] = {
++	{
++		.slave_reg_ofs	= 0x208,
++		.sliver_reg_ofs	= 0xd80,
++		.phy_addr	= 0,
++	}
++};
++
++static struct cpsw_platform_data cpsw_data = {
++	.mdio_base		= CPSW_MDIO_BASE,
++	.cpsw_base		= CPSW_BASE,
++	.mdio_div		= 0xff,
++	.channels		= 8,
++	.cpdma_reg_ofs		= 0x800,
++	.slaves			= 1,
++	.slave_data		= cpsw_slaves,
++	.ale_reg_ofs		= 0xd00,
++	.ale_entries		= 1024,
++	.host_port_reg_ofs	= 0x108,
++	.hw_stats_reg_ofs	= 0x900,
++	.bd_ram_ofs		= 0x2000,
++	.mac_control		= (1 << 5),
++	.control		= cpsw_control,
++	.host_port_num		= 0,
++	.version		= CPSW_CTRL_VERSION_2,
++};
++#endif
++
++#if ((defined(CONFIG_SPL_ETH_SUPPORT) || defined(CONFIG_SPL_USBETH_SUPPORT)) &&\
++	defined(CONFIG_SPL_BUILD)) || \
++	((defined(CONFIG_DRIVER_TI_CPSW) || \
++	  defined(CONFIG_USB_ETHER) && defined(CONFIG_MUSB_GADGET)) && \
++	 !defined(CONFIG_SPL_BUILD))
++
++/*
++ * This function will:
++ * Read the eFuse for MAC addresses, and set ethaddr/eth1addr/usbnet_devaddr
++ * in the environment
++ * Perform fixups to the PHY present on certain boards.  We only need this
++ * function in:
++ * - SPL with either CPSW or USB ethernet support
++ * - Full U-Boot, with either CPSW or USB ethernet
++ * Build in only these cases to avoid warnings about unused variables
++ * when we build an SPL that has neither option but full U-Boot will.
++ */
++int board_eth_init(bd_t *bis)
++{
++	int rv, n = 0;
++#if defined(CONFIG_USB_ETHER) && \
++	(!defined(CONFIG_SPL_BUILD) || defined(CONFIG_SPL_USBETH_SUPPORT))
++	uint8_t mac_addr[6];
++	uint32_t mac_hi, mac_lo;
++
++	/*
++	 * use efuse mac address for USB ethernet as we know that
++	 * both CPSW and USB ethernet will never be active@the same time
++	 */
++	mac_lo = readl(&cdev->macid0l);
++	mac_hi = readl(&cdev->macid0h);
++	mac_addr[0] = mac_hi & 0xFF;
++	mac_addr[1] = (mac_hi & 0xFF00) >> 8;
++	mac_addr[2] = (mac_hi & 0xFF0000) >> 16;
++	mac_addr[3] = (mac_hi & 0xFF000000) >> 24;
++	mac_addr[4] = mac_lo & 0xFF;
++	mac_addr[5] = (mac_lo & 0xFF00) >> 8;
++#endif
++
++
++#if (defined(CONFIG_DRIVER_TI_CPSW) && !defined(CONFIG_SPL_BUILD)) || \
++	(defined(CONFIG_SPL_ETH_SUPPORT) && defined(CONFIG_SPL_BUILD))
++
++#ifdef CONFIG_DRIVER_TI_CPSW
++	writel(RMII_MODE_ENABLE | RMII_CHIPCKL_ENABLE, &cdev->miisel);
++	cpsw_slaves[0].phy_if = PHY_INTERFACE_MODE_RMII;
++
++	rv = cpsw_register(&cpsw_data);
++	if (rv < 0)
++		printf("Error %d registering CPSW switch\n", rv);
++	else
++		n += rv;
++#endif
++#endif
++
++#if defined(CONFIG_USB_ETHER) && \
++	(!defined(CONFIG_SPL_BUILD) || defined(CONFIG_SPL_USBETH_SUPPORT))
++	if (is_valid_ethaddr(mac_addr))
++		eth_setenv_enetaddr("usbnet_devaddr", mac_addr);
++
++	rv = usb_eth_initialize(bis);
++	if (rv < 0)
++		printf("Error %d registering USB_ETHER\n", rv);
++	else
++		n += rv;
++#endif
++	return n;
++}
++#endif
++
++#endif /* CONFIG_DM_ETH */
+diff --git a/configs/chiliboard_defconfig b/configs/chiliboard_defconfig
+new file mode 100644
+index 0000000000..0bf0b23f67
+--- /dev/null
++++ b/configs/chiliboard_defconfig
+@@ -0,0 +1,47 @@
++CONFIG_ARM=y
++CONFIG_AM33XX=y
++CONFIG_SPL_LIBCOMMON_SUPPORT=y
++CONFIG_SPL_LIBGENERIC_SUPPORT=y
++CONFIG_SPL_FAT_SUPPORT=y
++CONFIG_SPL_I2C_SUPPORT=y
++CONFIG_SPL_LIBDISK_SUPPORT=y
++CONFIG_SPL_MMC_SUPPORT=y
++CONFIG_SPL_NAND_SUPPORT=y
++CONFIG_SPL_POWER_SUPPORT=y
++CONFIG_SPL_SERIAL_SUPPORT=y
++CONFIG_TARGET_CHILIBOARD=y
++CONFIG_SPL_WATCHDOG_SUPPORT=y
++CONFIG_SPL_STACK_R_ADDR=0x82000000
++CONFIG_FIT=y
++CONFIG_BOOTDELAY=1
++CONFIG_SYS_CONSOLE_INFO_QUIET=y
++CONFIG_SPL=y
++CONFIG_SPL_STACK_R=y
++CONFIG_SPL_MUSB_NEW_SUPPORT=y
++CONFIG_HUSH_PARSER=y
++CONFIG_CMD_BOOTZ=y
++# CONFIG_CMD_IMLS is not set
++CONFIG_CMD_ASKENV=y
++# CONFIG_CMD_FLASH is not set
++CONFIG_CMD_MMC=y
++CONFIG_CMD_I2C=y
++CONFIG_CMD_USB=y
++CONFIG_CMD_GPIO=y
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_DHCP=y
++CONFIG_CMD_MII=y
++CONFIG_CMD_PING=y
++CONFIG_CMD_EXT2=y
++CONFIG_CMD_EXT4=y
++CONFIG_CMD_EXT4_WRITE=y
++CONFIG_CMD_FAT=y
++CONFIG_CMD_FS_GENERIC=y
++CONFIG_DM_GPIO=y
++CONFIG_MMC_OMAP_HS=y
++CONFIG_SPI_FLASH=y
++CONFIG_SPI_FLASH_WINBOND=y
++CONFIG_SYS_NS16550=y
++CONFIG_USB=y
++CONFIG_USB_MUSB_HOST=y
++CONFIG_USB_STORAGE=y
++CONFIG_OF_LIBFDT=y
+diff --git a/include/configs/chiliboard.h b/include/configs/chiliboard.h
+new file mode 100644
+index 0000000000..8dd7f4b1c8
+--- /dev/null
++++ b/include/configs/chiliboard.h
+@@ -0,0 +1,232 @@
++/*
++ * chiliboard.h
++ *
++ * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/
++ * Copyright (C) 2017 Grinn - http://grinn-global.com/
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License as
++ * published by the Free Software Foundation version 2.
++ *
++ * This program is distributed "as is" WITHOUT ANY WARRANTY of any
++ * kind, whether express or implied; without even the implied warranty
++ * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ */
++
++#ifndef __CONFIG_CHILIBOARD_H
++#define __CONFIG_CHILIBOARD_H
++
++#define CONFIG_NAND
++
++#include <configs/ti_am335x_common.h>
++
++#define CONFIG_CONS_INDEX		1
++
++#ifndef CONFIG_SPL_BUILD
++# define CONFIG_TIMESTAMP
++# define CONFIG_LZO
++#endif
++
++#define CONFIG_BOARD_LATE_INIT
++
++/* Clock Defines */
++#define V_OSCK				24000000  /* Clock output from T2 */
++#define V_SCLK				(V_OSCK)
++
++#define NANDARGS \
++	"mtdids=" MTDIDS_DEFAULT "\0" \
++	"mtdparts=" MTDPARTS_DEFAULT "\0" \
++	"nandargs=setenv bootargs console=${console} ${optargs} " \
++		"${mtdparts} " \
++		"root=${nandroot} " \
++		"rootfstype=${nandrootfstype}\0" \
++	"nandroot=ubi0:rootfs rw ubi.mtd=NAND.file-system\0" \
++	"nandrootfstype=ubifs rootwait=1\0" \
++	"nandboot=echo Booting from nand ...; " \
++		"run nandargs; " \
++		"nand read ${fdt_addr} NAND.u-boot-spl-os; " \
++		"nand read ${loadaddr} NAND.kernel; " \
++		"bootz ${loadaddr} - ${fdt_addr}\0"
++
++#define CONFIG_BOOTCOMMAND \
++	"run mmcboot; " \
++	"run nandboot; " \
++	"run netboot"
++
++#define CONFIG_EXTRA_ENV_SETTINGS \
++	"loadaddr=0x82000000\0" \
++	"fdt_addr=0x87800000\0" \
++	"boot_fdt=try\0" \
++	"console=ttyO0,115200n8\0" \
++	"image=zImage\0" \
++	"fdt_file=am335x-chiliboard.dtb\0" \
++	"ip_dyn=yes\0" \
++	"optargs=\0" \
++	"loadbootscript=" \
++		"load mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};\0" \
++	"bootscript=echo Running bootscript from mmc ...; " \
++		"source\0" \
++	"loadimage=load mmc ${mmcdev}:${mmcpart} ${loadaddr} " \
++		"${boot_dir}/${image}\0" \
++	"loadfdt=load mmc ${mmcdev}:${mmcpart} ${fdt_addr} " \
++		"${boot_dir}/${fdt_file}\0" \
++	"mmcdev=0\0" \
++	"mmcpart=1\0" \
++	"mmcroot=/dev/mmcblk0p2 rootwait rw\0" \
++	"mmcargs=setenv bootargs console=${console},${baudrate} ${optargs} " \
++		"${mtdparts} " \
++		"root=${mmcroot}\0" \
++	"mmcloados=run mmcargs; " \
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
++	"mmcboot=mmc dev ${mmcdev}; " \
++		"if mmc rescan; then " \
++			"echo SD/MMC found on device ${mmcdev};" \
++			"if run loadimage; then " \
++				"run mmcloados;" \
++			"fi;" \
++		"fi;\0" \
++	"netargs=setenv bootargs console=${console},${baudrate} ${optargs} " \
++		"${mtdparts} " \
++		"root=/dev/nfs " \
++		"ip=dhcp nfsroot=${serverip}:${nfsroot},v3,tcp\0" \
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
++		"fi;\0" \
++	NANDARGS
++
++/* NS16550 Configuration */
++#define CONFIG_SYS_NS16550_COM1		0x44e09000	/* UART0 */
++#define CONFIG_SYS_NS16550_COM2		0x48022000	/* UART1 */
++#define CONFIG_SYS_NS16550_COM3		0x48024000	/* UART2 */
++#define CONFIG_SYS_NS16550_COM4		0x481a6000	/* UART3 */
++#define CONFIG_SYS_NS16550_COM5		0x481a8000	/* UART4 */
++#define CONFIG_SYS_NS16550_COM6		0x481aa000	/* UART5 */
++#define CONFIG_BAUDRATE			115200
++
++/* PMIC support */
++#define CONFIG_POWER_TPS65217
++
++/* SPL */
++/* Bootcount using the RTC block */
++#define CONFIG_BOOTCOUNT_LIMIT
++#define CONFIG_BOOTCOUNT_AM33XX
++#define CONFIG_SYS_BOOTCOUNT_BE
++
++#define CONFIG_SPL_LDSCRIPT	"arch/arm/mach-omap2/am33xx/u-boot-spl.lds"
++
++/* NAND: device related configs */
++#define CONFIG_SYS_NAND_5_ADDR_CYCLE
++#define CONFIG_SYS_NAND_PAGE_COUNT	(CONFIG_SYS_NAND_BLOCK_SIZE / \
++					 CONFIG_SYS_NAND_PAGE_SIZE)
++#define CONFIG_SYS_NAND_PAGE_SIZE	2048
++#define CONFIG_SYS_NAND_OOBSIZE		64
++#define CONFIG_SYS_NAND_BLOCK_SIZE	(128*1024)
++/* NAND: driver related configs */
++#define CONFIG_NAND_OMAP_GPMC
++#define CONFIG_NAND_OMAP_GPMC_PREFETCH
++#define CONFIG_NAND_OMAP_ELM
++#define CONFIG_SYS_NAND_BAD_BLOCK_POS	NAND_LARGE_BADBLOCK_POS
++#define CONFIG_SYS_NAND_ECCPOS		{ 2, 3, 4, 5, 6, 7, 8, 9, \
++					 10, 11, 12, 13, 14, 15, 16, 17, \
++					 18, 19, 20, 21, 22, 23, 24, 25, \
++					 26, 27, 28, 29, 30, 31, 32, 33, \
++					 34, 35, 36, 37, 38, 39, 40, 41, \
++					 42, 43, 44, 45, 46, 47, 48, 49, \
++					 50, 51, 52, 53, 54, 55, 56, 57, }
++
++#define CONFIG_SYS_NAND_ECCSIZE		512
++#define CONFIG_SYS_NAND_ECCBYTES	14
++#define CONFIG_SYS_NAND_ONFI_DETECTION
++#define CONFIG_NAND_OMAP_ECCSCHEME	OMAP_ECC_BCH8_CODE_HW
++#define MTDIDS_DEFAULT			"nand0=8000000.nand"
++#define MTDPARTS_DEFAULT		"mtdparts=8000000.nand:" \
++					"128k(NAND.SPL)," \
++					"128k(NAND.SPL.backup1)," \
++					"128k(NAND.SPL.backup2)," \
++					"128k(NAND.SPL.backup3)," \
++					"256k(NAND.u-boot-spl-os)," \
++					"1m(NAND.u-boot)," \
++					"128k(NAND.u-boot-env)," \
++					"128k(NAND.u-boot-env.backup1)," \
++					"8m(NAND.kernel)," \
++					"-(NAND.file-system)"
++#define CONFIG_SYS_NAND_U_BOOT_OFFS	0x000c0000
++/* NAND: SPL related configs */
++#ifdef CONFIG_SPL_NAND_SUPPORT
++#define CONFIG_SPL_NAND_AM33XX_BCH
++#endif
++
++/* USB configuration */
++#define CONFIG_USB_MUSB_DSPS
++#define CONFIG_ARCH_MISC_INIT
++#define CONFIG_USB_MUSB_PIO_ONLY
++#define CONFIG_USB_MUSB_DISABLE_BULK_COMBINE_SPLIT
++#define CONFIG_AM335X_USB1
++#define CONFIG_AM335X_USB1_MODE MUSB_HOST
++
++/*
++ * Disable MMC DM for SPL build and can be re-enabled after adding
++ * DM support in SPL
++ */
++#ifdef CONFIG_SPL_BUILD
++#undef CONFIG_DM_MMC
++#undef CONFIG_TIMER
++#undef CONFIG_DM_USB
++#endif
++
++#if defined(CONFIG_SPL_BUILD) && defined(CONFIG_SPL_USBETH_SUPPORT)
++/* Remove other SPL modes. */
++#define CONFIG_ENV_IS_NOWHERE
++#undef CONFIG_ENV_IS_IN_NAND
++#endif
++
++#if defined(CONFIG_ENV_IS_IN_NAND)
++#define CONFIG_ENV_OFFSET		0x001c0000
++#define CONFIG_ENV_OFFSET_REDUND	0x001e0000
++#define CONFIG_ENV_SIZE			SZ_128K
++#define CONFIG_SYS_ENV_SECT_SIZE	CONFIG_SYS_NAND_BLOCK_SIZE
++#else
++#define CONFIG_ENV_IS_IN_MMC
++#define CONFIG_SYS_MMC_ENV_DEV		0
++#define CONFIG_ENV_OFFSET		SZ_128K
++#define CONFIG_ENV_OFFSET_REDUND	(CONFIG_ENV_OFFSET + CONFIG_ENV_SIZE)
++#define CONFIG_ENV_SIZE			SZ_8K
++#define CONFIG_SYS_REDUNDAND_ENVIRONMENT
++#endif
++
++/* Network. */
++#define CONFIG_PHYLIB
++#define CONFIG_PHY_SMSC
++
++#endif	/* ! __CONFIG_CHILIBOARD_H */
+-- 
+2.11.0
+
diff --git a/board/grinn/chiliboard/post-image.sh b/board/grinn/chiliboard/post-image.sh
new file mode 100755
index 000000000..1a076eecb
--- /dev/null
+++ b/board/grinn/chiliboard/post-image.sh
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
diff --git a/board/grinn/chiliboard/readme.txt b/board/grinn/chiliboard/readme.txt
new file mode 100644
index 000000000..596afca2a
--- /dev/null
+++ b/board/grinn/chiliboard/readme.txt
@@ -0,0 +1,46 @@
+**********
+chiliBoard
+**********
+
+Build
+=====
+
+First, configure Buildroot for your liteBoard:
+
+  make grinn_chiliboard_defconfig
+
+Build image:
+
+  make
+
+After building you should get a tree like this:
+
+  output/images/
+  ??? am335x-chiliboard.dtb
+  ??? boot.vfat
+  ??? MLO
+  ??? rootfs.ext2
+  ??? rootfs.ext4
+  ??? rootfs.tar
+  ??? sdcard.img
+  ??? u-boot.img
+  ??? zImage
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
+Boot chiliBoard
+===============
+
+- insert the microSD card in the microSD slot of the board;
+- plug micro USB cable to provide power and console interface
+- use terminal emulator with 115200 bps, 8n1
diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
new file mode 100644
index 000000000..ccf92ff3f
--- /dev/null
+++ b/configs/grinn_chiliboard_defconfig
@@ -0,0 +1,27 @@
+BR2_arm=y
+BR2_cortex_a8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/grinn/chiliboard/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.5"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-chiliboard"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="chiliboard"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="MLO"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.11.0
