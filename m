From: Mark Corbin <mark.corbin@embecosm.com>
Date: Sun, 14 Apr 2019 14:43:07 +0100
Subject: [Buildroot] [PATCH 2/2] board/sifive: add support for the HiFive
 Unleashed board
In-Reply-To: <20190414134307.24754-1-mark.corbin@embecosm.com>
References: <20190414134307.24754-1-mark.corbin@embecosm.com>
Message-ID: <20190414134307.24754-2-mark.corbin@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds support for the SiFive HiFive Unleashed board and
generates a system that attempts to closely match the output
produced by the Freedom Unleashed Software Development Kit
(sifive/freedom-u-sdk repository) release v1_0.

The kernel patch has been generated from the Linux 4.19 tree of
the sifive/riscv-linux repository (commit id
20eeb6522e3302c5f6e435c0bdba40ff57ffa41a).

Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
---
 ...es-for-SiFive-HiFive-Unleashed-board.patch | 3704 +++++++++++++++++
 .../u540-unleashed/linux.config.fragment      |  652 +++
 board/sifive/u540-unleashed/post-image.sh     |    9 +
 board/sifive/u540-unleashed/readme.txt        |   91 +
 configs/sifive_u540_unleashed_defconfig       |   29 +
 5 files changed, 4485 insertions(+)
 create mode 100644 board/sifive/patches/linux/4.20.17/0001-Add-support-files-for-SiFive-HiFive-Unleashed-board.patch
 create mode 100644 board/sifive/u540-unleashed/linux.config.fragment
 create mode 100755 board/sifive/u540-unleashed/post-image.sh
 create mode 100644 board/sifive/u540-unleashed/readme.txt
 create mode 100644 configs/sifive_u540_unleashed_defconfig

diff --git a/board/sifive/patches/linux/4.20.17/0001-Add-support-files-for-SiFive-HiFive-Unleashed-board.patch b/board/sifive/patches/linux/4.20.17/0001-Add-support-files-for-SiFive-HiFive-Unleashed-board.patch
new file mode 100644
index 0000000000..a1bf92ca79
--- /dev/null
+++ b/board/sifive/patches/linux/4.20.17/0001-Add-support-files-for-SiFive-HiFive-Unleashed-board.patch
@@ -0,0 +1,3704 @@
+From c9f6598469f75f76afde51a9577bca5482e7208d Mon Sep 17 00:00:00 2001
+From: Mark Corbin <mark.corbin@embecosm.com>
+Date: Sun, 14 Apr 2019 13:10:40 +0100
+Subject: [PATCH 1/1] Add support files for SiFive HiFive Unleashed board
+
+These changes have been added to provide support for the SiFive
+HiFive Unleashed board. These files are based on the Linux 4.19
+tree from the sifive/riscv-linux repository (commit id
+20eeb6522e3302c5f6e435c0bdba40ff57ffa41a).
+
+Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
+---
+ arch/riscv/kernel/setup.c               |    7 +
+ drivers/clk/Kconfig                     |    1 +
+ drivers/clk/Makefile                    |    1 +
+ drivers/clk/sifive/Kconfig              |    9 +
+ drivers/clk/sifive/Makefile             |    2 +
+ drivers/clk/sifive/gemgxl-mgmt.c        |  129 +++
+ drivers/clk/sifive/u54-prci.c           |  314 +++++++
+ drivers/gpio/Kconfig                    |    7 +
+ drivers/gpio/Makefile                   |    1 +
+ drivers/gpio/gpio-sifive.c              |  322 +++++++
+ drivers/mtd/spi-nor/spi-nor.c           |   46 +-
+ drivers/net/phy/mdio_bus.c              |    3 -
+ drivers/pci/controller/Kconfig          |    7 +
+ drivers/pci/controller/Makefile         |    1 +
+ drivers/pci/controller/pcie-microsemi.c |  754 ++++++++++++++++
+ drivers/pwm/Kconfig                     |   10 +
+ drivers/pwm/Makefile                    |    1 +
+ drivers/pwm/pwm-sifive.c                |  252 ++++++
+ drivers/spi/Kconfig                     |    7 +
+ drivers/spi/Makefile                    |    1 +
+ drivers/spi/spi-sifive.c                |  423 +++++++++
+ drivers/tty/serial/Kconfig              |   23 +
+ drivers/tty/serial/Makefile             |    1 +
+ drivers/tty/serial/sifive.c             | 1051 +++++++++++++++++++++++
+ include/linux/mtd/spi-nor.h             |    2 +
+ include/uapi/linux/serial_core.h        |    3 +
+ 26 files changed, 3374 insertions(+), 4 deletions(-)
+ create mode 100644 drivers/clk/sifive/Kconfig
+ create mode 100644 drivers/clk/sifive/Makefile
+ create mode 100644 drivers/clk/sifive/gemgxl-mgmt.c
+ create mode 100644 drivers/clk/sifive/u54-prci.c
+ create mode 100644 drivers/gpio/gpio-sifive.c
+ create mode 100644 drivers/pci/controller/pcie-microsemi.c
+ create mode 100644 drivers/pwm/pwm-sifive.c
+ create mode 100644 drivers/spi/spi-sifive.c
+ create mode 100644 drivers/tty/serial/sifive.c
+
+diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
+index 6d652826b5cb..5e48d9144e1d 100644
+--- a/arch/riscv/kernel/setup.c
++++ b/arch/riscv/kernel/setup.c
+@@ -39,6 +39,8 @@
+ #include <asm/tlbflush.h>
+ #include <asm/thread_info.h>
+ 
++static char default_command_line[COMMAND_LINE_SIZE] __initdata = CONFIG_CMDLINE;
++
+ #ifdef CONFIG_EARLY_PRINTK
+ static void sbi_console_write(struct console *co, const char *buf,
+ 			      unsigned int n)
+@@ -225,7 +227,12 @@ void __init setup_arch(char **cmdline_p)
+                register_console(early_console);
+        }
+ #endif
++
++#if defined(CONFIG_CMDLINE_OVERRIDE)
++	*cmdline_p = default_command_line;
++#else
+ 	*cmdline_p = boot_command_line;
++#endif
+ 
+ 	parse_early_param();
+ 
+diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
+index 81cdb4eaca07..65a60b0c76da 100644
+--- a/drivers/clk/Kconfig
++++ b/drivers/clk/Kconfig
+@@ -295,6 +295,7 @@ source "drivers/clk/mvebu/Kconfig"
+ source "drivers/clk/qcom/Kconfig"
+ source "drivers/clk/renesas/Kconfig"
+ source "drivers/clk/samsung/Kconfig"
++source "drivers/clk/sifive/Kconfig"
+ source "drivers/clk/sprd/Kconfig"
+ source "drivers/clk/sunxi-ng/Kconfig"
+ source "drivers/clk/tegra/Kconfig"
+diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
+index 72be7a38cff1..dad0ab2a50dc 100644
+--- a/drivers/clk/Makefile
++++ b/drivers/clk/Makefile
+@@ -91,6 +91,7 @@ obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
+ obj-y					+= renesas/
+ obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
+ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
++obj-y					+= sifive/
+ obj-$(CONFIG_ARCH_SIRF)			+= sirf/
+ obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
+ obj-$(CONFIG_PLAT_SPEAR)		+= spear/
+diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
+new file mode 100644
+index 000000000000..284bffb121eb
+--- /dev/null
++++ b/drivers/clk/sifive/Kconfig
+@@ -0,0 +1,9 @@
++config CLK_U54_PRCI
++	bool "PRCI driver for U54 SoCs"
++	---help---
++	  Supports Power Reset Clock interface found in U540 SoCs
++
++config CLK_GEMGXL_MGMT
++	bool "TX clock switch for GEMGXL in U540 SoCs"
++	---help---
++	  Supports clock muxing between 10/100Mbit and 1Gbit TX clock on U540 SoCs
+diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
+new file mode 100644
+index 000000000000..7784d2ee0f44
+--- /dev/null
++++ b/drivers/clk/sifive/Makefile
+@@ -0,0 +1,2 @@
++obj-$(CONFIG_CLK_U54_PRCI)	+= u54-prci.o
++obj-$(CONFIG_CLK_GEMGXL_MGMT)	+= gemgxl-mgmt.o
+diff --git a/drivers/clk/sifive/gemgxl-mgmt.c b/drivers/clk/sifive/gemgxl-mgmt.c
+new file mode 100644
+index 000000000000..00b07580fe3c
+--- /dev/null
++++ b/drivers/clk/sifive/gemgxl-mgmt.c
+@@ -0,0 +1,129 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * Copyright (C) 2018 SiFive, Inc.
++ */
++
++#include <linux/clkdev.h>
++#include <linux/clk-provider.h>
++#include <linux/err.h>
++#include <linux/of.h>
++#include <linux/platform_device.h>
++#include <linux/slab.h>
++
++struct sifive_gemgxl_mgmt {
++	void __iomem *reg;
++	unsigned long rate;
++	struct clk_hw hw;
++};
++
++#define to_sifive_gemgxl_mgmt(mgmt) container_of(mgmt, struct sifive_gemgxl_mgmt, hw)
++
++static unsigned long sifive_gemgxl_mgmt_recalc_rate(struct clk_hw *hw,
++				      unsigned long parent_rate)
++{
++	struct sifive_gemgxl_mgmt *mgmt = to_sifive_gemgxl_mgmt(hw);
++	return mgmt->rate;
++}
++
++static long sifive_gemgxl_mgmt_round_rate(struct clk_hw *hw, unsigned long rate,
++		unsigned long *parent_rate)
++{
++	if (WARN_ON(rate < 2500000)) {
++		return 2500000;
++	} else if (rate == 2500000) {
++		return 2500000;
++	} else if (WARN_ON(rate < 13750000)) {
++		return 2500000;
++	} else if (WARN_ON(rate < 25000000)) {
++		return 25000000;
++	} else if (rate == 25000000) {
++		return 25000000;
++	} else if (WARN_ON(rate < 75000000)) {
++		return 25000000;
++	} else if (WARN_ON(rate < 125000000)) {
++		return 125000000;
++	} else if (rate == 125000000) {
++		return 125000000;
++	} else {
++		WARN_ON(rate > 125000000);
++		return 125000000;
++	}
++}
++
++static int sifive_gemgxl_mgmt_set_rate(struct clk_hw *hw, unsigned long rate,
++		unsigned long parent_rate)
++{
++	struct sifive_gemgxl_mgmt *mgmt = to_sifive_gemgxl_mgmt(hw);
++	rate = sifive_gemgxl_mgmt_round_rate(hw, rate, &parent_rate);
++	iowrite32(rate != 125000000, mgmt->reg);
++	mgmt->rate = rate;
++	return 0;
++}
++
++static const struct clk_ops sifive_gemgxl_mgmt_ops = {
++	.recalc_rate = sifive_gemgxl_mgmt_recalc_rate,
++	.round_rate = sifive_gemgxl_mgmt_round_rate,
++	.set_rate = sifive_gemgxl_mgmt_set_rate,
++};
++
++static int sifive_gemgxl_mgmt_probe(struct platform_device *pdev)
++{
++	struct clk_init_data init;
++	struct sifive_gemgxl_mgmt *mgmt;
++	struct resource *res;
++	struct clk *clk;
++
++	mgmt = devm_kzalloc(&pdev->dev, sizeof(*mgmt), GFP_KERNEL);
++	if (!mgmt)
++		return -ENOMEM;
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	mgmt->reg = devm_ioremap_resource(&pdev->dev, res);
++	if (IS_ERR(mgmt->reg))
++		return PTR_ERR(mgmt->reg);
++
++	init.name = pdev->dev.of_node->name;
++	init.ops = &sifive_gemgxl_mgmt_ops;
++	init.flags = 0;
++	init.num_parents = 0;
++
++	mgmt->rate = 0;
++	mgmt->hw.init = &init;
++
++	clk = clk_register(NULL, &mgmt->hw);
++	if (IS_ERR(clk))
++		return PTR_ERR(clk);
++
++	of_clk_add_provider(pdev->dev.of_node, of_clk_src_simple_get, clk);
++
++	dev_info(&pdev->dev, "Registered clock switch '%s'\n", init.name);
++
++	return 0;
++}
++
++static const struct of_device_id sifive_gemgxl_mgmt_of_match[] = {
++	{ .compatible = "sifive,cadencegemgxlmgmt0", },
++	{}
++};
++
++static struct platform_driver sifive_gemgxl_mgmt_driver = {
++	.driver	= {
++		.name = "sifive-gemgxl-mgmt",
++		.of_match_table = sifive_gemgxl_mgmt_of_match,
++	},
++	.probe = sifive_gemgxl_mgmt_probe,
++};
++
++static int __init sifive_gemgxl_mgmt_init(void)
++{
++	return platform_driver_register(&sifive_gemgxl_mgmt_driver);
++}
++core_initcall(sifive_gemgxl_mgmt_init);
+diff --git a/drivers/clk/sifive/u54-prci.c b/drivers/clk/sifive/u54-prci.c
+new file mode 100644
+index 000000000000..edc4b7818e71
+--- /dev/null
++++ b/drivers/clk/sifive/u54-prci.c
+@@ -0,0 +1,314 @@
++/*
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * Copyright (C) 2018 SiFive, Inc.
++ */
++
++#include <linux/clkdev.h>
++#include <linux/clk-provider.h>
++#include <linux/clk.h>
++#include <linux/err.h>
++#include <linux/of.h>
++#include <linux/platform_device.h>
++#include <linux/slab.h>
++#include <linux/log2.h>
++
++#define CORE_CLOCK 0
++#define GEMTX_CLOCK 1
++#define PRCI_CLOCKS 2
++
++#define MIN_REF 7000000UL
++#define MAX_REF 200000000UL
++#define MAX_PARENT 600000000UL
++#define MAX_VCO 4800000000UL
++#define MAX_DIV 64
++#define MAX_R 64UL
++
++#define PLL_LOCK 0x80000000U
++#define NAME_LEN 40
++
++struct sifive_u54_prci_driver;
++
++struct sifive_u54_prci_pll {
++	struct clk_hw hw;
++	struct sifive_u54_prci_driver *driver;
++	char name[NAME_LEN];
++	u32 freq;
++	u32 glcm;
++};
++
++struct sifive_u54_prci_driver {
++	struct clk_onecell_data table;
++	struct clk *clks[PRCI_CLOCKS];
++	struct sifive_u54_prci_pll plls[PRCI_CLOCKS];
++	void __iomem *reg;
++};
++
++#define to_sifive_u54_prci_pll(hw) container_of(hw, struct sifive_u54_prci_pll, hw)
++
++struct sifive_u54_pll_cfg {
++	unsigned long r, f, q, a;
++};
++
++static struct sifive_u54_pll_cfg sifive_u54_pll_cfg(u32 reg)
++{
++	struct sifive_u54_pll_cfg cfg;
++	cfg.r = (reg >>  0) & 0x3f;
++	cfg.f = (reg >>  6) & 0x1ff;
++	cfg.q = (reg >> 15) & 0x7;
++	cfg.a = (reg >> 18) & 0x7;
++	return cfg;
++}
++
++static u32 sifive_u54_pll_reg(struct sifive_u54_pll_cfg cfg)
++{
++	u32 reg = 0;
++	reg |= (cfg.r & 0x3f)  << 0;
++	reg |= (cfg.f & 0x1ff) << 6;
++	reg |= (cfg.q & 0x7)   << 15;
++	reg |= (cfg.a & 0x7)   << 18;
++	reg |= 1<<25; // internal feedback
++	return reg;
++}
++
++static unsigned long sifive_u54_pll_rate(struct sifive_u54_pll_cfg cfg, unsigned long parent)
++{
++	return (parent*2*(cfg.f+1) / (cfg.r+1)) >> cfg.q;
++}
++
++static struct sifive_u54_pll_cfg sifive_u54_pll_configure(unsigned long target, unsigned long parent)
++{
++	struct sifive_u54_pll_cfg cfg;
++	unsigned long scale, ratio, best_delta, filter;
++	u32 max_r, best_r, best_f, r;
++
++	/* Confirm input frequency is within bounds */
++	if (WARN_ON(parent > MAX_PARENT)) { parent = MAX_PARENT; }
++	if (WARN_ON(parent < MIN_REF))    { parent = MIN_REF; }
++
++	/* Calculate the Q shift and target VCO */
++	scale = MAX_VCO / target;
++	if (scale <= 1) {
++		cfg.q = 1;
++		target = MAX_VCO;
++	} else if (scale > MAX_DIV) {
++		cfg.q = ilog2(MAX_DIV);
++		target = MAX_VCO/2;
++	} else {
++		cfg.q = ilog2(scale);
++		target = target << cfg.q;
++	}
++
++	/* Precalcualte the target ratio */
++	ratio = (target << 20) / parent;
++
++	/* Placeholder values */
++	best_r = 0;
++	best_f = 0;
++	best_delta = MAX_VCO;
++
++	/* Consider all values for R which land within [MIN_REF, MAX_REF]; prefer smaller R */
++	max_r = min(MAX_R, parent / MIN_REF);
++	for (r = DIV_ROUND_UP(parent, MAX_REF); r <= max_r; ++r) {
++		/* What is the best F we can pick in this case? */
++		u32 f = (ratio*r + (1<<20)) >> 21;
++		unsigned long ref = parent / r;
++		unsigned long vco = ref * f * 2;
++		unsigned long delta;
++
++		/* Ensure rounding didn't take us out of range */
++		if (vco > target) --f;
++		if (vco < MAX_VCO/2) ++f;
++		vco = ref * f * 2;
++
++		delta = abs(target - vco);
++		if (delta < best_delta) {
++			best_delta = delta;
++			best_r = r;
++			best_f = f;
++		}
++	}
++
++	cfg.r = best_r - 1;
++	cfg.f = best_f - 1;
++
++	/* Pick the best PLL jitter filter */
++	filter = parent / best_r;
++	BUG_ON(filter < 7000000);
++	if (filter < 11000000) {
++		cfg.a = 1;
++	} else if (filter < 18000000) {
++		cfg.a = 2;
++	} else if (filter < 30000000) {
++		cfg.a = 3;
++	} else if (filter < 50000000) {
++		cfg.a = 4;
++	} else if (filter < 80000000) {
++		cfg.a = 5;
++	} else if (filter < 130000000) {
++		cfg.a = 6;
++	} else {
++		BUG_ON (filter > 200000000);
++		cfg.a = 7;
++	}
++
++	return cfg;
++}
++
++static unsigned long sifive_u54_prci_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
++{
++	struct sifive_u54_prci_pll *pll = to_sifive_u54_prci_pll(hw);
++	struct sifive_u54_prci_driver *driver = pll->driver;
++
++	u32 reg = ioread32(driver->reg + pll->freq);
++	struct sifive_u54_pll_cfg cfg = sifive_u54_pll_cfg(reg);
++
++	return sifive_u54_pll_rate(cfg, parent_rate);
++}
++
++static long sifive_u54_prci_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *parent_rate)
++{
++	struct sifive_u54_pll_cfg cfg = sifive_u54_pll_configure(rate, *parent_rate);
++	return sifive_u54_pll_rate(cfg, *parent_rate);
++}
++
++static int sifive_u54_prci_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
++{
++	struct sifive_u54_prci_pll *pll = to_sifive_u54_prci_pll(hw);
++	struct sifive_u54_prci_driver *driver = pll->driver;
++
++	struct sifive_u54_pll_cfg cfg = sifive_u54_pll_configure(rate, parent_rate);
++	u32 reg = sifive_u54_pll_reg(cfg);
++
++	/* Switch to reg clock and reconfigure PLL */
++	iowrite32(1, driver->reg + pll->glcm);
++	iowrite32(reg, driver->reg + pll->freq);
++
++	/* Wait for lock and switch back to PLL */
++	while (!(ioread32(driver->reg + pll->freq) & PLL_LOCK));
++	iowrite32(0, driver->reg + pll->glcm);
++
++	return 0;
++}
++
++static const struct clk_ops sifive_u54_prci_ops_rw = {
++	.recalc_rate = sifive_u54_prci_recalc_rate,
++	.round_rate = sifive_u54_prci_round_rate,
++	.set_rate = sifive_u54_prci_set_rate,
++};
++
++static const struct clk_ops sifive_u54_prci_ops_ro = {
++	.recalc_rate = sifive_u54_prci_recalc_rate,
++};
++
++static ssize_t sifive_u54_pll_show(struct device *dev, struct device_attribute *attr, char *buf)
++{
++	struct sifive_u54_prci_driver *driver = dev_get_drvdata(dev);
++	return sprintf(buf, "%ld", clk_get_rate(driver->clks[0]));
++}
++
++static ssize_t sifive_u54_pll_rate_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
++{
++	struct sifive_u54_prci_driver *driver = dev_get_drvdata(dev);
++	unsigned long rate;
++	char *endp;
++
++	rate = simple_strtoul(buf, &endp, 0);
++	if (*endp != 0 && *endp != '\n')
++		return -EINVAL;
++
++	clk_set_rate(driver->clks[0], rate);
++	return count;
++}
++
++static DEVICE_ATTR(rate, 0644, sifive_u54_pll_show, sifive_u54_pll_rate_store);
++
++static int sifive_u54_prci_probe(struct platform_device *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct clk_init_data init;
++	struct sifive_u54_prci_driver *driver;
++	struct resource *res;
++	const char *parent;
++	int i;
++
++	parent = of_clk_get_parent_name(dev->of_node, 0);
++	if (!parent) {
++		dev_err(dev, "No OF parent clocks found\n");
++		return -EINVAL;
++	}
++
++	driver = devm_kzalloc(dev, sizeof(*driver), GFP_KERNEL);
++	if (!driver) {
++		dev_err(dev, "Out of memory\n");
++		return -ENOMEM;
++	}
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	driver->reg = devm_ioremap_resource(dev, res);
++	if (IS_ERR(driver->reg))
++		return PTR_ERR(driver->reg);
++
++	/* Link the data structure */
++	driver->table.clk_num = PRCI_CLOCKS;
++	driver->table.clks = &driver->clks[0];
++	dev_set_drvdata(dev, driver);
++
++	/* Describe the clocks */
++	snprintf(driver->plls[CORE_CLOCK].name, NAME_LEN, "%s.core", dev->of_node->name);
++	driver->plls[CORE_CLOCK].freq = 0x4;
++	driver->plls[CORE_CLOCK].glcm = 0x24;
++	snprintf(driver->plls[GEMTX_CLOCK].name, NAME_LEN, "%s.gemtx", dev->of_node->name);
++	driver->plls[GEMTX_CLOCK].freq = 0x1c;
++	driver->plls[GEMTX_CLOCK].glcm = 0; /* None; cannot be set_rate */
++
++	/* Export the clocks */
++	for (i = 0; i < PRCI_CLOCKS; ++i) {
++		init.name = &driver->plls[i].name[0];
++		init.ops = driver->plls[i].glcm ? &sifive_u54_prci_ops_rw : &sifive_u54_prci_ops_ro;
++		init.num_parents = 1;
++		init.parent_names = &parent;
++		init.flags = 0;
++
++		driver->plls[i].driver = driver;
++		driver->plls[i].hw.init = &init;
++
++		driver->clks[i] = devm_clk_register(dev, &driver->plls[i].hw);
++		if (IS_ERR(driver->clks[i])) {
++			dev_err(dev, "Failed to register clock %d, %ld\n", i, PTR_ERR(driver->clks[i]));
++			return PTR_ERR(driver->clks[i]);
++		}
++	}
++
++	of_clk_add_provider(dev->of_node, of_clk_src_onecell_get, &driver->table);
++	device_create_file(dev, &dev_attr_rate);
++	dev_info(dev, "Registered U54 core clocks\n");
++
++	return 0;
++}
++
++static const struct of_device_id sifive_u54_prci_of_match[] = {
++	{ .compatible = "sifive,aloeprci0", },
++	{}
++};
++
++static struct platform_driver sifive_u54_prci_driver = {
++	.driver	= {
++		.name = "sifive-u54-prci",
++		.of_match_table = sifive_u54_prci_of_match,
++	},
++	.probe = sifive_u54_prci_probe,
++};
++
++static int __init sifive_u54_prci_init(void)
++{
++	return platform_driver_register(&sifive_u54_prci_driver);
++}
++core_initcall(sifive_u54_prci_init);
+diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
+index 833a1b51c948..9d73efafb21b 100644
+--- a/drivers/gpio/Kconfig
++++ b/drivers/gpio/Kconfig
+@@ -429,6 +429,13 @@ config GPIO_REG
+ 	  A 32-bit single register GPIO fixed in/out implementation.  This
+ 	  can be used to represent any register as a set of GPIO signals.
+ 
++config GPIO_SIFIVE
++	bool "SiFive GPIO support"
++	depends on OF_GPIO
++	select GPIOLIB_IRQCHIP
++	help
++	  Say yes here to support the GPIO device on SiFive SoCs.
++
+ config GPIO_SIOX
+ 	tristate "SIOX GPIO support"
+ 	depends on SIOX
+diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
+index 671c4477c951..eb3c3ccc06d3 100644
+--- a/drivers/gpio/Makefile
++++ b/drivers/gpio/Makefile
+@@ -110,6 +110,7 @@ obj-$(CONFIG_GPIO_REG)		+= gpio-reg.o
+ obj-$(CONFIG_ARCH_SA1100)	+= gpio-sa1100.o
+ obj-$(CONFIG_GPIO_SCH)		+= gpio-sch.o
+ obj-$(CONFIG_GPIO_SCH311X)	+= gpio-sch311x.o
++obj-$(CONFIG_GPIO_SIFIVE)	+= gpio-sifive.o
+ obj-$(CONFIG_GPIO_SNPS_CREG)	+= gpio-creg-snps.o
+ obj-$(CONFIG_GPIO_SODAVILLE)	+= gpio-sodaville.o
+ obj-$(CONFIG_GPIO_SPEAR_SPICS)	+= gpio-spear-spics.o
+diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
+new file mode 100644
+index 000000000000..6482ebbc00ce
+--- /dev/null
++++ b/drivers/gpio/gpio-sifive.c
+@@ -0,0 +1,322 @@
++/*
++ * SiFive GPIO driver
++ *
++ * Copyright (C) 2018 SiFive, Inc.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++#include <linux/bitops.h>
++#include <linux/device.h>
++#include <linux/errno.h>
++#include <linux/of_irq.h>
++#include <linux/gpio/driver.h>
++#include <linux/irqchip/chained_irq.h>
++#include <linux/init.h>
++#include <linux/of.h>
++#include <linux/pinctrl/consumer.h>
++#include <linux/platform_device.h>
++#include <linux/pm.h>
++#include <linux/slab.h>
++#include <linux/spinlock.h>
++
++#define GPIO_INPUT_VAL	0x00
++#define GPIO_INPUT_EN	0x04
++#define GPIO_OUTPUT_EN	0x08
++#define GPIO_OUTPUT_VAL	0x0C
++#define GPIO_RISE_IE	0x18
++#define GPIO_RISE_IP	0x1C
++#define GPIO_FALL_IE	0x20
++#define GPIO_FALL_IP	0x24
++#define GPIO_HIGH_IE	0x28
++#define GPIO_HIGH_IP	0x2C
++#define GPIO_LOW_IE	0x30
++#define GPIO_LOW_IP	0x34
++#define GPIO_OUTPUT_XOR	0x40
++
++#define MAX_GPIO	32
++
++struct sifive_gpio {
++	raw_spinlock_t		lock;
++	void __iomem		*base;
++	struct gpio_chip	gc;
++	unsigned long		enabled;
++	unsigned		trigger[MAX_GPIO];
++	unsigned int		irq_parent[MAX_GPIO];
++	struct sifive_gpio	*self_ptr[MAX_GPIO];
++};
++
++static void sifive_assign_bit(void __iomem *ptr, int offset, int value)
++{
++	// It's frustrating that we are not allowed to use the device atomics
++	// which are GUARANTEED to be supported by this device on RISC-V
++	u32 bit = BIT(offset), old = ioread32(ptr);
++	if (value)
++		iowrite32(old | bit, ptr);
++	else
++		iowrite32(old & ~bit, ptr);
++}
++
++static int sifive_direction_input(struct gpio_chip *gc, unsigned offset)
++{
++	struct sifive_gpio *chip = gpiochip_get_data(gc);
++	unsigned long flags;
++
++	if (offset >= gc->ngpio)
++		return -EINVAL;
++
++	raw_spin_lock_irqsave(&chip->lock, flags);
++	sifive_assign_bit(chip->base + GPIO_OUTPUT_EN, offset, 0);
++	sifive_assign_bit(chip->base + GPIO_INPUT_EN,  offset, 1);
++	raw_spin_unlock_irqrestore(&chip->lock, flags);
++
++	return 0;
++}
++
++static int sifive_direction_output(struct gpio_chip *gc, unsigned offset, int value)
++{
++	struct sifive_gpio *chip = gpiochip_get_data(gc);
++	unsigned long flags;
++
++	if (offset >= gc->ngpio)
++		return -EINVAL;
++
++	raw_spin_lock_irqsave(&chip->lock, flags);
++	sifive_assign_bit(chip->base + GPIO_INPUT_EN,   offset, 0);
++	sifive_assign_bit(chip->base + GPIO_OUTPUT_VAL, offset, value);
++	sifive_assign_bit(chip->base + GPIO_OUTPUT_EN,  offset, 1);
++	raw_spin_unlock_irqrestore(&chip->lock, flags);
++
++	return 0;
++}
++
++static int sifive_get_direction(struct gpio_chip *gc, unsigned offset)
++{
++	struct sifive_gpio *chip = gpiochip_get_data(gc);
++
++	if (offset >= gc->ngpio)
++		return -EINVAL;
++
++	return !(ioread32(chip->base + GPIO_OUTPUT_EN) & BIT(offset));
++}
++
++static int sifive_get_value(struct gpio_chip *gc, unsigned offset)
++{
++	struct sifive_gpio *chip = gpiochip_get_data(gc);
++
++	if (offset >= gc->ngpio)
++		return -EINVAL;
++
++	return !!(ioread32(chip->base + GPIO_INPUT_VAL) & BIT(offset));
++}
++
++static void sifive_set_value(struct gpio_chip *gc, unsigned offset, int value)
++{
++	struct sifive_gpio *chip = gpiochip_get_data(gc);
++	unsigned long flags;
++
++	if (offset >= gc->ngpio)
++		return;
++
++	raw_spin_lock_irqsave(&chip->lock, flags);
++	sifive_assign_bit(chip->base + GPIO_OUTPUT_VAL, offset, value);
++	raw_spin_unlock_irqrestore(&chip->lock, flags);
++}
++
++static void sifive_set_ie(struct sifive_gpio *chip, int offset)
++{
++	unsigned long flags;
++	unsigned trigger;
++
++	raw_spin_lock_irqsave(&chip->lock, flags);
++	trigger = (chip->enabled & BIT(offset)) ? chip->trigger[offset] : 0;
++	sifive_assign_bit(chip->base + GPIO_RISE_IE, offset, trigger & IRQ_TYPE_EDGE_RISING);
++	sifive_assign_bit(chip->base + GPIO_FALL_IE, offset, trigger & IRQ_TYPE_EDGE_FALLING);
++	sifive_assign_bit(chip->base + GPIO_HIGH_IE, offset, trigger & IRQ_TYPE_LEVEL_HIGH);
++	sifive_assign_bit(chip->base + GPIO_LOW_IE,  offset, trigger & IRQ_TYPE_LEVEL_LOW);
++	raw_spin_unlock_irqrestore(&chip->lock, flags);
++}
++
++static int sifive_irq_set_type(struct irq_data *d, unsigned trigger)
++{
++	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
++	struct sifive_gpio *chip = gpiochip_get_data(gc);
++	int offset = irqd_to_hwirq(d);
++
++	if (offset < 0 || offset >= gc->ngpio)
++		return -EINVAL;
++
++	chip->trigger[offset] = trigger;
++	sifive_set_ie(chip, offset);
++	return 0;
++}
++
++/* chained_irq_{enter,exit} already mask the parent */
++static void sifive_irq_mask(struct irq_data *d) { }
++static void sifive_irq_unmask(struct irq_data *d) { }
++
++static void sifive_irq_enable(struct irq_data *d)
++{
++	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
++	struct sifive_gpio *chip = gpiochip_get_data(gc);
++	int offset = irqd_to_hwirq(d) % MAX_GPIO; // must not fail
++	u32 bit = BIT(offset);
++
++	/* Switch to input */
++	sifive_direction_input(gc, offset);
++
++	/* Clear any sticky pending interrupts */
++	iowrite32(bit, chip->base + GPIO_RISE_IP);
++	iowrite32(bit, chip->base + GPIO_FALL_IP);
++	iowrite32(bit, chip->base + GPIO_HIGH_IP);
++	iowrite32(bit, chip->base + GPIO_LOW_IP);
++
++	/* Enable interrupts */
++	assign_bit(offset, &chip->enabled, 1);
++	sifive_set_ie(chip, offset);
++}
++
++static void sifive_irq_disable(struct irq_data *d)
++{
++	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
++	struct sifive_gpio *chip = gpiochip_get_data(gc);
++	int offset = irqd_to_hwirq(d) % MAX_GPIO; // must not fail
++
++	assign_bit(offset, &chip->enabled, 0);
++	sifive_set_ie(chip, offset);
++}
++
++static struct irq_chip sifive_irqchip = {
++	.name		= "sifive-gpio",
++	.irq_set_type	= sifive_irq_set_type,
++	.irq_mask	= sifive_irq_mask,
++	.irq_unmask	= sifive_irq_unmask,
++	.irq_enable	= sifive_irq_enable,
++	.irq_disable	= sifive_irq_disable,
++};
++
++static void sifive_irq_handler(struct irq_desc *desc)
++{
++	struct irq_chip *irqchip = irq_desc_get_chip(desc);
++	struct sifive_gpio **self_ptr = irq_desc_get_handler_data(desc);
++	struct sifive_gpio *chip = *self_ptr;
++	int offset = self_ptr - &chip->self_ptr[0];
++	u32 bit = BIT(offset);
++
++	chained_irq_enter(irqchip, desc);
++
++	/* Re-arm the edge triggers so don't miss the next one */
++	iowrite32(bit, chip->base + GPIO_RISE_IP);
++	iowrite32(bit, chip->base + GPIO_FALL_IP);
++
++	generic_handle_irq(irq_find_mapping(chip->gc.irq.domain, offset));
++
++	/* Re-arm the level triggers after handling to prevent spurious refire */
++	iowrite32(bit, chip->base + GPIO_HIGH_IP);
++	iowrite32(bit, chip->base + GPIO_LOW_IP);
++
++	chained_irq_exit(irqchip, desc);
++}
++
++static int sifive_gpio_probe(struct platform_device *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct device_node *node = pdev->dev.of_node;
++	struct sifive_gpio *chip;
++	struct resource *res;
++	int gpio, irq, ret, ngpio;
++
++	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
++	if (!chip) {
++		dev_err(dev, "out of memory\n");
++		return -ENOMEM;
++	}
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	chip->base = devm_ioremap_resource(dev, res);
++	if (IS_ERR(chip->base)) {
++		dev_err(dev, "failed to allocate device memory\n");
++		return PTR_ERR(chip->base);
++	}
++
++	ngpio = of_irq_count(node);
++	if (ngpio >= MAX_GPIO) {
++		dev_err(dev, "too many interrupts\n");
++		return -EINVAL;
++	}
++
++	raw_spin_lock_init(&chip->lock);
++	chip->gc.direction_input = sifive_direction_input;
++	chip->gc.direction_output = sifive_direction_output;
++	chip->gc.get_direction = sifive_get_direction;
++	chip->gc.get = sifive_get_value;
++	chip->gc.set = sifive_set_value;
++	chip->gc.base = -1;
++	chip->gc.ngpio = ngpio;
++	chip->gc.label = dev_name(dev);
++	chip->gc.parent = dev;
++	chip->gc.owner = THIS_MODULE;
++
++	ret = gpiochip_add_data(&chip->gc, chip);
++	if (ret)
++		return ret;
++
++	/* Disable all GPIO interrupts before enabling parent interrupts */
++	iowrite32(0, chip->base + GPIO_RISE_IE);
++	iowrite32(0, chip->base + GPIO_FALL_IE);
++	iowrite32(0, chip->base + GPIO_HIGH_IE);
++	iowrite32(0, chip->base + GPIO_LOW_IE);
++	chip->enabled = 0;
++
++	ret = gpiochip_irqchip_add(&chip->gc, &sifive_irqchip, 0, handle_simple_irq, IRQ_TYPE_NONE);
++	if (ret) {
++		dev_err(dev, "could not add irqchip\n");
++		gpiochip_remove(&chip->gc);
++		return ret;
++	}
++
++	chip->gc.irq.num_parents = ngpio;
++	chip->gc.irq.parents = &chip->irq_parent[0];
++	chip->gc.irq.map = &chip->irq_parent[0];
++
++	for (gpio = 0; gpio < ngpio; ++gpio) {
++		irq = platform_get_irq(pdev, gpio);
++		if (irq < 0) {
++			dev_err(dev, "invalid IRQ\n");
++			gpiochip_remove(&chip->gc);
++			return -ENODEV;
++		}
++
++		chip->irq_parent[gpio] = irq;
++		chip->self_ptr[gpio] = chip;
++		chip->trigger[gpio] = IRQ_TYPE_LEVEL_HIGH;
++	}
++
++	for (gpio = 0; gpio < ngpio; ++gpio) {
++		irq = chip->irq_parent[gpio];
++		irq_set_chained_handler_and_data(irq, sifive_irq_handler, &chip->self_ptr[gpio]);
++		irq_set_parent(irq_find_mapping(chip->gc.irq.domain, gpio), irq);
++	}
++
++	platform_set_drvdata(pdev, chip);
++	dev_info(dev, "SiFive GPIO chip registered %d GPIOs\n", ngpio);
++
++	return 0;
++}
++
++static const struct of_device_id sifive_gpio_match[] = {
++	{
++		.compatible = "sifive,gpio0",
++	},
++	{ },
++};
++
++static struct platform_driver sifive_gpio_driver = {
++	.probe		= sifive_gpio_probe,
++	.driver = {
++		.name	= "sifive_gpio",
++		.of_match_table = of_match_ptr(sifive_gpio_match),
++	},
++};
++builtin_platform_driver(sifive_gpio_driver)
+diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
+index 1fdd2834fbcb..d793842961fe 100644
+--- a/drivers/mtd/spi-nor/spi-nor.c
++++ b/drivers/mtd/spi-nor/spi-nor.c
+@@ -1364,6 +1364,8 @@ static const struct flash_info spi_nor_ids[] = {
+ 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+ 	{ "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256,
+ 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
++	{ "is25wp256d", INFO(0x9d7019, 0, 32 * 1024, 1024,
++			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+ 
+ 	/* Macronix */
+ 	{ "mx25l512e",   INFO(0xc22010, 0, 64 * 1024,   1, SECT_4K) },
+@@ -1800,6 +1802,45 @@ static int macronix_quad_enable(struct spi_nor *nor)
+ 	return 0;
+ }
+ 
++/**
++ * issi_unlock() - clear BP[0123] write-protection.
++ * @nor:	pointer to a 'struct spi_nor'
++ *
++ * Bits [2345] of the Status Register are BP[0123].
++ * ISSI chips use a different block protection scheme than other chips.
++ * Just disable the write-protect unilaterally.
++ *
++ * Return: 0 on success, -errno otherwise.
++ */
++static int issi_unlock(struct spi_nor *nor)
++{
++	int ret, val;
++	u8 mask = SR_BP0 | SR_BP1 | SR_BP2 | SR_BP3;
++
++	val = read_sr(nor);
++	if (val < 0)
++		return val;
++	if (!(val & mask))
++		return 0;
++
++	write_enable(nor);
++
++	write_sr(nor, val & ~mask);
++
++	ret = spi_nor_wait_till_ready(nor);
++	if (ret)
++		return ret;
++
++	ret = read_sr(nor);
++	if (ret > 0 && !(ret & mask)) {
++		dev_info(nor->dev, "ISSI Block Protection Bits cleared\n");
++		return 0;
++	} else {
++		dev_err(nor->dev, "ISSI Block Protection Bits not cleared\n");
++		return -EINVAL;
++	}
++}
++
+ /*
+  * Write status Register and configuration register with 2 bytes
+  * The first byte will be written to the status register, while the
+@@ -3637,6 +3678,9 @@ static int spi_nor_init(struct spi_nor *nor)
+ 		spi_nor_wait_till_ready(nor);
+ 	}
+ 
++	if (JEDEC_MFR(nor->info) == SNOR_MFR_ISSI)
++		issi_unlock(nor);
++
+ 	if (nor->quad_enable) {
+ 		err = nor->quad_enable(nor);
+ 		if (err) {
+@@ -3830,7 +3874,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
+ 	if (ret)
+ 		return ret;
+ 
+-	if (nor->addr_width) {
++	if (nor->addr_width && JEDEC_MFR(info) != SNOR_MFR_ISSI) {
+ 		/* already configured from SFDP */
+ 	} else if (info->addr_width) {
+ 		nor->addr_width = info->addr_width;
+diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
+index 7368616286ae..d8b9a0e16055 100644
+--- a/drivers/net/phy/mdio_bus.c
++++ b/drivers/net/phy/mdio_bus.c
+@@ -63,9 +63,6 @@ static int mdiobus_register_gpiod(struct mdio_device *mdiodev)
+ 
+ 	mdiodev->reset = gpiod;
+ 
+-	/* Assert the reset signal again */
+-	mdio_device_reset(mdiodev, 1);
+-
+ 	return 0;
+ }
+ 
+diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
+index 6671946dbf66..6b2ecd74945b 100644
+--- a/drivers/pci/controller/Kconfig
++++ b/drivers/pci/controller/Kconfig
+@@ -280,5 +280,12 @@ config VMD
+ 	  To compile this driver as a module, choose M here: the
+ 	  module will be called vmd.
+ 
++config PCIE_MICROSEMI
++	bool "Microsemi AXI PCIe host bridge support"
++	depends on OF || COMPILE_TEST
++	help
++	  Say 'Y' here if you want kernel to support the Microsemi AXI PCIe
++	  Host Bridge driver.
++
+ source "drivers/pci/controller/dwc/Kconfig"
+ endmenu
+diff --git a/drivers/pci/controller/Makefile b/drivers/pci/controller/Makefile
+index d56a507495c5..c3b76ff221be 100644
+--- a/drivers/pci/controller/Makefile
++++ b/drivers/pci/controller/Makefile
+@@ -28,6 +28,7 @@ obj-$(CONFIG_PCIE_ROCKCHIP_HOST) += pcie-rockchip-host.o
+ obj-$(CONFIG_PCIE_MEDIATEK) += pcie-mediatek.o
+ obj-$(CONFIG_PCIE_MOBIVEIL) += pcie-mobiveil.o
+ obj-$(CONFIG_PCIE_TANGO_SMP8759) += pcie-tango.o
++obj-$(CONFIG_PCIE_MICROSEMI) += pcie-microsemi.o
+ obj-$(CONFIG_VMD) += vmd.o
+ # pcie-hisi.o quirks are needed even without CONFIG_PCIE_DW
+ obj-y				+= dwc/
+diff --git a/drivers/pci/controller/pcie-microsemi.c b/drivers/pci/controller/pcie-microsemi.c
+new file mode 100644
+index 000000000000..9e2abca2836f
+--- /dev/null
++++ b/drivers/pci/controller/pcie-microsemi.c
+@@ -0,0 +1,754 @@
++/*
++ * PCIe host controller driver for Microsemi AXI PCIe Bridge
++ *
++ * Copyright (c) 2018 - Microsemi.
++ * Author: Badal Nilawar <badal.nilawar@microsemi.com>
++ *
++ * Based on the Xilinx, Altera PCIe driver
++ *
++ *
++ * This program is free software: you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation, either version 2 of the License, or
++ * (at your option) any later version.
++ */
++
++#include <linux/interrupt.h>
++#include <linux/irq.h>
++#include <linux/irqdomain.h>
++#include <linux/kernel.h>
++#include <linux/init.h>
++#include <linux/msi.h>
++#include <linux/of_address.h>
++#include <linux/of_pci.h>
++#include <linux/of_platform.h>
++#include <linux/of_irq.h>
++#include <linux/pci.h>
++#include <linux/platform_device.h>
++#include "../pci.h"
++
++/* ECAM definitions */
++#define ECAM_BUS_NUM_SHIFT		20
++#define ECAM_DEV_NUM_SHIFT		12
++
++/* Number of MSI IRQs */
++#define MICROSEMI_NUM_MSI_IRQS		32
++
++/* PCIe Bridge Phy and Controller Phy offsets */
++#define PCIE0_BRIDGE_PHY_ADDR_OFFSET			0x03004000u
++#define PCIE0_CRTL_PHY_ADDR_OFFSET			0x03006000u
++
++#define PCIE0_BRIDGE_ADDR		0x03004000u
++#define PCIE0_CRTL_ADDR			0x03006000u
++
++#define PCIE1_BRIDGE_ADDR		0x00008000u
++#define PCIE1_CRTL_ADDR			0x0000A000u
++
++/* PCIe LTSSM State reg */
++#define LTSSM_STATE		0x5c
++
++/* PCIe LTSSM L0 state */
++#define LTSSM_L0_STATE		0x10
++
++/* PCIe Controller Phy Regs */
++#define SEC_ERROR_INT		0x28
++#define SEC_ERROR_INT_MASK	0x2c
++#define DED_ERROR_INT		0x30
++#define DED_ERROR_INT_MASK	0x34
++#define ECC_CONTROL		0x38
++#define PCIE_EVENT_INT		0x14c
++
++/* PCIe Bridge Phy Regs */
++#define IMASK_LOCAL		0x180
++#define ISTATUS_LOCAL		0x184
++#define IMASK_HOST		0x188
++#define ISTATUS_HOST		0x18c
++#define	ISTATUS_MSI		0x194
++#define	PCIE_PCI_IDS_DW1	0x9c
++
++/* PCIe AXI slave table init defines */
++#define ATR0_AXI4_SLV0_SRCADDR_PARAM	0x800u
++#define ATR0_AXI4_SLV0_SRC_ADDR		0x804u
++#define ATR0_AXI4_SLV0_TRSL_ADDR_LSB	0x808u
++#define ATR0_AXI4_SLV0_TRSL_ADDR_UDW	0x80cu
++#define ATR0_AXI4_SLV0_TRSL_PARAM	0x810u
++
++#define ATR1_AXI4_SLV0_SRCADDR_PARAM	0x820u
++#define ATR1_AXI4_SLV0_SRC_ADDR		0x824u
++#define ATR1_AXI4_SLV0_TRSL_ADDR_LSB	0x828u
++#define ATR1_AXI4_SLV0_TRSL_ADDR_UDW	0x82cu
++#define ATR1_AXI4_SLV0_TRSL_PARAM	0x830u
++
++/* PCIe Master table init defines */
++#define ATR0_PCIE_WIN0_SRCADDR_PARAM	0x600u
++
++/* Translated ID */
++#define  PCIE_TX_RX_INTERFACE		0x00000000u
++#define  PCIE_CONFIG_INTERFACE		0x00000001u
++
++/* PCIe Config space MSI capability structure */
++#define PCIE_ENABLE_MSI			0x10000000u
++
++/* MSI definitions */
++#define MSI_MSG_ADDR			0x190u
++#define MSI_ENABLE			(0x01u << 16)
++#define MSI_ENABLE_MULTI		(MICROSEMI_NUM_MSI_IRQS << 20)
++
++/* MSI Capability Structure  */
++#define MSI_CAP_CTRL			0xE0u
++#define MSI_MSG_ADDR_OFFSET		0xE4u
++#define MSI_MSG_UPPER_ADDR_OFFEST	0xE8u
++#define MSI_MSG_DATA			0xF0u
++
++
++
++/******************************************************************************/
++/*Enable PCIe local*/
++#define PCIE_LOCAL_INT_ENABLE		0xF000000u
++
++/******************************************************************************/
++/* Clear PCIe interrupt events */
++#define PCIE_EVENT_INT_DATA		0x00070007u
++#define PCIE_ECC_DISABLE	        0x0F000000u
++#define PCIE_SEC_ERROR_INT_CLEAR	0x0000FFFFu
++#define PCIE_DED_ERROR_INT_CLEAR	0x0000FFFFu
++#define PCIE_ISTATUS_CLEAR		0xFFFFFFFFu
++#define PCIE_CLEAR			0x00000000u
++#define PCIE_SET			0x00000001u
++
++#define ROOT_PORT_ENABLE		0x00000001u
++
++#define NULL_POINTER			0x00000000u
++
++/*****************************************************************************/
++/* PCIe Controller 0 */
++#define PF_PCIE_CTRL_0                 0u
++/* PCIe Controller 1 */
++#define PF_PCIE_CTRL_1                 1u
++
++/* It indicates that the ATR table is enabled */
++#define PF_PCIE_ATR_TABLE_ENABLE       1u
++/* It indicates that the the ATR table is disabled */
++#define PF_PCIE_ATR_TABLE_DISABLE      0u
++
++
++/**
++ * struct microsemi_pcie_port - PCIe port information
++ * @reg_base: IO Mapped Register Base
++ * @irq: Interrupt number
++ * @root_busno: Root Bus number
++ * @dev: Device pointer
++ * @msi_domain: MSI IRQ domain pointer
++ * @leg_domain: Legacy IRQ domain pointer
++ * @resources: Bus Resources
++ */
++struct microsemi_pcie_port {
++	struct platform_device	*pdev;
++	void __iomem *reg_base;
++	void __iomem *reg_base_apb;
++	void __iomem *reg_bridge_apb;
++	void __iomem *reg_ctrl_apb;
++	u32 irq;
++	u8 root_busno;
++	struct device *dev;
++	struct irq_domain *msi_domain;
++	struct irq_domain *leg_domain;
++	struct list_head resources;
++};
++
++static DECLARE_BITMAP(msi_irq_in_use, MICROSEMI_NUM_MSI_IRQS);
++
++static inline u32 pcie_read(struct microsemi_pcie_port *port, u32 reg)
++{
++	return readl(port->reg_base + reg);
++}
++
++static inline void pcie_write(struct microsemi_pcie_port *port,
++				u32 val, u32 reg)
++{
++	writel(val, port->reg_base + reg);
++}
++
++static inline bool microsemi_pcie_link_up(struct microsemi_pcie_port *port)
++{
++	return (readl(port->reg_ctrl_apb + LTSSM_STATE)
++		& LTSSM_L0_STATE) ? 1 : 0;
++}
++
++/**
++ * microsemi_pcie_valid_device - Check if a valid device is present on bus
++ * @bus: PCI Bus structure
++ * @devfn: device/function
++ *
++ * Return: 'true' on success and 'false' if invalid device is found
++ */
++static bool microsemi_pcie_valid_device(struct pci_bus *bus, unsigned int devfn)
++{
++	struct microsemi_pcie_port *port = bus->sysdata;
++
++	/* Check if link is up when trying to access downstream ports */
++	if (bus->number != port->root_busno)
++		if (!microsemi_pcie_link_up(port))
++			return false;
++
++	/* Only one device down on each root port */
++	if (bus->number == port->root_busno && devfn > 0)
++		return false;
++
++	return true;
++}
++
++/**
++ * microsemi_pcie_map_bus - Get configuration base
++ * @bus: PCI Bus structure
++ * @devfn: Device/function
++ * @where: Offset from base
++ *
++ * Return: Base address of the configuration space needed to be
++ *	   accessed.
++ */
++static void __iomem *microsemi_pcie_map_bus(struct pci_bus *bus,
++					 unsigned int devfn, int where)
++{
++	struct microsemi_pcie_port *port = bus->sysdata;
++	int relbus;
++
++
++	if (!microsemi_pcie_valid_device(bus, devfn))
++		return NULL;
++
++	relbus = (bus->number << ECAM_BUS_NUM_SHIFT) |
++		 (devfn << ECAM_DEV_NUM_SHIFT);
++
++
++	return port->reg_base + relbus + where;
++}
++
++/* PCIe operations */
++static struct pci_ops microsemi_pcie_ops = {
++	.map_bus = microsemi_pcie_map_bus,
++	.read	= pci_generic_config_read,
++	.write	= pci_generic_config_write,
++};
++
++/* MSI functions */
++
++/**
++ * microsemi_pcie_destroy_msi - Free MSI number
++ * @irq: IRQ to be freed
++ */
++static void microsemi_pcie_destroy_msi(unsigned int irq)
++{
++	struct msi_desc *msi;
++	struct microsemi_pcie_port *port;
++	struct irq_data *d = irq_get_irq_data(irq);
++	irq_hw_number_t hwirq = irqd_to_hwirq(d);
++
++	if (!test_bit(hwirq, msi_irq_in_use)) {
++		msi = irq_get_msi_desc(irq);
++		port = msi_desc_to_pci_sysdata(msi);
++		dev_err(port->dev, "Trying to free unused MSI#%d\n", irq);
++	} else {
++		clear_bit(hwirq, msi_irq_in_use);
++	}
++}
++
++/**
++ * microsemi_pcie_assign_msi - Allocate MSI number
++ *
++ * Return: A valid IRQ on success and error value on failure.
++ */
++static int microsemi_pcie_assign_msi(void)
++{
++	int pos;
++
++	pos = find_first_zero_bit(msi_irq_in_use, MICROSEMI_NUM_MSI_IRQS);
++	if (pos < MICROSEMI_NUM_MSI_IRQS)
++		set_bit(pos, msi_irq_in_use);
++	else
++		return -ENOSPC;
++
++	return pos;
++}
++
++/**
++ * microsemi_msi_teardown_irq - Destroy the MSI
++ * @chip: MSI Chip descriptor
++ * @irq: MSI IRQ to destroy
++ */
++static void microsemi_msi_teardown_irq(struct msi_controller *chip,
++				    unsigned int irq)
++{
++	microsemi_pcie_destroy_msi(irq);
++	irq_dispose_mapping(irq);
++}
++
++/**
++ * microsemi_pcie_msi_setup_irq - Setup MSI request
++ * @chip: MSI chip pointer
++ * @pdev: PCIe device pointer
++ * @desc: MSI descriptor pointer
++ *
++ * Return: '0' on success and error value on failure
++ */
++static int microsemi_pcie_msi_setup_irq(struct msi_controller *chip,
++				     struct pci_dev *pdev,
++				     struct msi_desc *desc)
++{
++	struct microsemi_pcie_port *port = pdev->bus->sysdata;
++	unsigned int irq;
++	int hwirq;
++	struct msi_msg msg;
++
++	hwirq = microsemi_pcie_assign_msi();
++	if (hwirq < 0)
++		return hwirq;
++
++	irq = irq_create_mapping(port->msi_domain, hwirq);
++	if (!irq)
++		return -EINVAL;
++
++	irq_set_msi_desc(irq, desc);
++
++	msg.address_hi = 0;
++	msg.address_lo = MSI_MSG_ADDR;
++	msg.data = hwirq;
++
++	pci_write_msi_msg(irq, &msg);
++
++	return 0;
++}
++
++/* MSI Chip Descriptor */
++static struct msi_controller microsemi_pcie_msi_chip = {
++	.setup_irq = microsemi_pcie_msi_setup_irq,
++	.teardown_irq = microsemi_msi_teardown_irq,
++};
++
++/* HW Interrupt Chip Descriptor */
++static struct irq_chip microsemi_msi_irq_chip = {
++	.name = "Microsemi PCIe MSI",
++	.irq_enable = pci_msi_unmask_irq,
++	.irq_disable = pci_msi_mask_irq,
++	.irq_mask = pci_msi_mask_irq,
++	.irq_unmask = pci_msi_unmask_irq,
++};
++
++/**
++ * microsemi_pcie_msi_map - Set the handler for the MSI and mark IRQ as valid
++ * @domain: IRQ domain
++ * @irq: Virtual IRQ number
++ * @hwirq: HW interrupt number
++ *
++ * Return: Always returns 0.
++ */
++static int microsemi_pcie_msi_map(struct irq_domain *domain, unsigned int irq,
++			       irq_hw_number_t hwirq)
++{
++	irq_set_chip_and_handler(irq,
++				&microsemi_msi_irq_chip, handle_simple_irq);
++	irq_set_chip_data(irq, domain->host_data);
++
++	return 0;
++}
++
++/* IRQ Domain operations */
++static const struct irq_domain_ops msi_domain_ops = {
++	.map = microsemi_pcie_msi_map,
++};
++
++/**
++ * microsemi_pcie_enable_msi - Enable MSI support
++ * @port: PCIe port information
++ */
++static void microsemi_pcie_enable_msi(struct microsemi_pcie_port *port)
++{
++	u32 cap_ctrl;
++
++	cap_ctrl = pcie_read(port, MSI_CAP_CTRL);
++
++	pcie_write(port, cap_ctrl | MSI_ENABLE_MULTI | MSI_ENABLE, MSI_CAP_CTRL);
++	pcie_write(port, MSI_MSG_ADDR, MSI_MSG_ADDR_OFFSET);
++}
++
++/* INTx Functions */
++
++/**
++ * microsemi_pcie_intx_map - Set the handler for the INTx and mark IRQ as valid
++ * @domain: IRQ domain
++ * @irq: Virtual IRQ number
++ * @hwirq: HW interrupt number
++ *
++ * Return: Always returns 0.
++ */
++static int microsemi_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
++				irq_hw_number_t hwirq)
++{
++	irq_set_chip_and_handler(irq, &dummy_irq_chip, handle_simple_irq);
++	irq_set_chip_data(irq, domain->host_data);
++
++	return 0;
++}
++
++/* INTx IRQ Domain operations */
++static const struct irq_domain_ops intx_domain_ops = {
++	.map = microsemi_pcie_intx_map,
++	.xlate = pci_irqd_intx_xlate,
++};
++
++/* PCIe HW Functions */
++
++/**
++ * microsemi_pcie_intr_handler - Interrupt Service Handler
++ * @irq: IRQ number
++ * @data: PCIe port information
++ *
++ * Return: IRQ_HANDLED on success and IRQ_NONE on failure
++ */
++static irqreturn_t microsemi_pcie_intr_handler(int irq, void *data)
++{
++	struct microsemi_pcie_port *port = (struct microsemi_pcie_port *)data;
++	struct device *dev = port->dev;
++	unsigned long status;
++	unsigned long msi;
++	u32 bit;
++	u32 virq;
++
++
++	status = readl(port->reg_bridge_apb + ISTATUS_LOCAL);
++
++	status = (status >> 24) & 0x0f;
++	for_each_set_bit(bit, &status, PCI_NUM_INTX) {
++		/* clear interrupts */
++		writel(1 << (bit+24),
++			port->reg_bridge_apb + ISTATUS_LOCAL);
++
++		virq = irq_find_mapping(port->leg_domain, bit);
++
++		if (virq)
++			generic_handle_irq(virq);
++		else
++			dev_err(dev, "unexpected IRQ, INT%d\n", bit);
++	}
++
++	status = readl(port->reg_bridge_apb + ISTATUS_LOCAL);
++	if ((status & 0x10000000) == 0x10000000) {
++		writel((1 << 28), port->reg_bridge_apb + ISTATUS_LOCAL);
++		msi = readl(port->reg_bridge_apb + ISTATUS_MSI);
++		for_each_set_bit(bit, &msi, MICROSEMI_NUM_MSI_IRQS) {
++		/* clear interrupts */
++			writel((1 << bit),
++				port->reg_bridge_apb + ISTATUS_MSI);
++			virq = irq_find_mapping(port->msi_domain, bit);
++			if (virq)
++				generic_handle_irq(virq);
++			else
++				dev_err(dev, "unexpected IRQ, INT%d\n", bit);
++		}
++	}
++
++	return IRQ_HANDLED;
++}
++
++/**
++ * microsemi_pcie_init_irq_domain - Initialize IRQ domain
++ * @port: PCIe port information
++ *
++ * Return: '0' on success and error value on failure
++ */
++static int microsemi_pcie_init_irq_domain(struct microsemi_pcie_port *port)
++{
++	struct device *dev = port->dev;
++	struct device_node *node = dev->of_node;
++	struct device_node *pcie_intc_node;
++
++	/* Setup INTx */
++	pcie_intc_node = of_get_next_child(node, NULL);
++	if (!pcie_intc_node) {
++		dev_err(dev, "No PCIe Intc node found\n");
++		return -ENODEV;
++	}
++	dev_info(dev, "Intc node foundi %s\n", pcie_intc_node->name);
++
++	port->leg_domain = irq_domain_add_linear(pcie_intc_node, PCI_NUM_INTX,
++						 &intx_domain_ops,
++						 port);
++	if (!port->leg_domain) {
++		dev_err(dev, "Failed to get a INTx IRQ domain\n");
++		return -ENODEV;
++	}
++
++	/* Setup MSI */
++	if (IS_ENABLED(CONFIG_PCI_MSI)) {
++		port->msi_domain = irq_domain_add_linear(node,
++						MICROSEMI_NUM_MSI_IRQS,
++						&msi_domain_ops,
++						&microsemi_pcie_msi_chip);
++		if (!port->msi_domain) {
++			dev_err(dev, "Failed to get a MSI IRQ domain\n");
++			return -ENODEV;
++		}
++		microsemi_pcie_enable_msi(port);
++	}
++	return 0;
++}
++
++/**
++ * microsemi_pcie_init_port - Parse Device tree, Initialize hardware
++ * @port: PCIe port information
++ *
++ * Return: '0' on success and error value on failure
++ */
++static int microsemi_pcie_init_port(struct microsemi_pcie_port *port)
++{
++	struct device *dev = port->dev;
++	struct device_node *node = dev->of_node;
++	struct of_pci_range_parser parser;
++	struct of_pci_range range;
++	struct resource regs;
++	struct resource regs1;
++	resource_size_t size;
++	u32 bit, pf_bridge_id = 1;
++	const char *type;
++	int err;
++
++	type = of_get_property(node, "device_type", NULL);
++	if (!type || strcmp(type, "pci")) {
++		dev_err(dev, "invalid \"device_type\" %s\n", type);
++		return -EINVAL;
++	}
++
++	err = of_address_to_resource(node, 0, &regs);
++	if (err) {
++		dev_err(dev, "missing \"reg\" property\n");
++		return err;
++	}
++
++	port->reg_base = devm_pci_remap_cfg_resource(dev, &regs);
++	if (IS_ERR(port->reg_base))
++		return PTR_ERR(port->reg_base);
++
++
++	err = of_address_to_resource(node, 1, &regs1);
++	if (err) {
++		dev_err(dev, "missing \"reg\" property\n");
++		return err;
++	}
++
++
++	port->reg_base_apb = devm_ioremap_resource(dev, &regs1);
++	if (IS_ERR(port->reg_base_apb))
++		return PTR_ERR(port->reg_base_apb);
++
++	if (pf_bridge_id == 0) {
++		port->reg_bridge_apb =  port->reg_base_apb + PCIE0_BRIDGE_ADDR;
++		port->reg_ctrl_apb = port->reg_base_apb + PCIE0_CRTL_ADDR;
++	} else {
++		port->reg_bridge_apb =  port->reg_base_apb + PCIE1_BRIDGE_ADDR;
++		port->reg_ctrl_apb = port->reg_base_apb + PCIE1_CRTL_ADDR;
++	}
++
++	port->irq = irq_of_parse_and_map(node, 0);
++
++	err = devm_request_irq(dev, port->irq, microsemi_pcie_intr_handler,
++			       IRQF_SHARED | IRQF_NO_THREAD,
++			       "microsemi-pcie", port);
++	if (err) {
++		dev_err(dev, "unable to request irq %d\n", port->irq);
++		return err;
++	}
++
++
++	/* Clear and Disable interrupts */
++
++	writel(0x0f000000, port->reg_ctrl_apb + ECC_CONTROL);
++	writel(0x00070007, port->reg_ctrl_apb + PCIE_EVENT_INT);
++	writel(0x0000ffff, port->reg_ctrl_apb + SEC_ERROR_INT);
++	writel(0x0000ffff, port->reg_ctrl_apb + SEC_ERROR_INT_MASK);
++	writel(0x0000ffff, port->reg_ctrl_apb + DED_ERROR_INT);
++	writel(0x0000ffff, port->reg_ctrl_apb + DED_ERROR_INT_MASK);
++
++	writel(0x00000000, port->reg_bridge_apb + IMASK_LOCAL);
++	writel(0xffffffff, port->reg_bridge_apb + ISTATUS_LOCAL);
++	writel(0x00000000, port->reg_bridge_apb + IMASK_HOST);
++	writel(0xffffffff, port->reg_bridge_apb + ISTATUS_HOST);
++
++	dev_info(dev, "interrupt disabled\n");
++
++	/* Configure Address Translation Table 0 for pcie config space */
++
++	writel(PCIE_CONFIG_INTERFACE,
++		port->reg_bridge_apb + ATR0_AXI4_SLV0_TRSL_PARAM);
++
++	size = resource_size(&regs);
++
++	bit = find_first_bit((const unsigned long *)&size, 64) - 1;
++
++	writel((u32)regs.start | bit << 1 | 0x01,
++		port->reg_bridge_apb + ATR0_AXI4_SLV0_SRCADDR_PARAM);
++
++//	writel((u32)(regs.start >> 32),
++//		port->reg_bridge_apb + ATR0_AXI4_SLV0_SRC_ADDR);
++
++	writel((u32)regs.start,
++		port->reg_bridge_apb + ATR0_AXI4_SLV0_TRSL_ADDR_LSB);
++
++//	writel((u32)(regs.start >> 32),
++//		port->reg_bridge_apb + ATR0_AXI4_SLV0_TRSL_ADDR_UDW);
++
++
++	if (of_pci_range_parser_init(&parser, node)) {
++		dev_err(dev, "missing \"ranges\" property\n");
++		return -EINVAL;
++	}
++
++
++	for_each_of_pci_range(&parser, &range) {
++		switch (range.flags & IORESOURCE_TYPE_BITS) {
++		case IORESOURCE_MEM:
++
++		size = range.size;
++		bit = find_first_bit((const unsigned long *)&size, 64) - 1;
++
++		/* Configure Address Translation Table 1 for pcie mem space */
++
++		writel(PCIE_TX_RX_INTERFACE,
++			port->reg_bridge_apb + ATR1_AXI4_SLV0_TRSL_PARAM);
++
++		writel((u32)range.cpu_addr | bit << 1 | 0x01,
++			port->reg_bridge_apb + ATR1_AXI4_SLV0_SRCADDR_PARAM);
++
++//		writel((u32)(range.cpu_addr >> 32),
++//			port->reg_bridge_apb + ATR1_AXI4_SLV0_SRC_ADDR);
++
++		writel((u32)range.pci_addr,
++			port->reg_bridge_apb + ATR1_AXI4_SLV0_TRSL_ADDR_LSB);
++
++//		writel((u32)(range.pci_addr >> 32),
++//			port->reg_bridge_apb + ATR1_AXI4_SLV0_TRSL_ADDR_UDW);
++
++		break;
++		}
++
++	}
++
++
++	writel(readl(port->reg_bridge_apb + ATR0_PCIE_WIN0_SRCADDR_PARAM)
++		| 0x3E,
++		port->reg_bridge_apb + ATR0_PCIE_WIN0_SRCADDR_PARAM);
++
++	writel(0, port->reg_bridge_apb + 0x604);
++
++	writel((readl(port->reg_bridge_apb + PCIE_PCI_IDS_DW1) & 0xffff)
++		| (PCI_CLASS_BRIDGE_PCI << 16),
++		port->reg_bridge_apb + PCIE_PCI_IDS_DW1);
++
++	pcie_write(port, 0x00ff0100, 0x18);
++
++	/* Enable interrupts */
++	writel(PCIE_ENABLE_MSI | PCIE_LOCAL_INT_ENABLE,
++		port->reg_bridge_apb + IMASK_LOCAL);
++
++
++	return 0;
++}
++
++/**
++ * microsemi_pcie_probe - Probe function
++ * @pdev: Platform device pointer
++ *
++ * Return: '0' on success and error value on failure
++ */
++static int microsemi_pcie_probe(struct platform_device *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct microsemi_pcie_port *port;
++	struct pci_bus *bus, *child;
++	struct pci_host_bridge *bridge;
++	int err;
++	resource_size_t iobase = 0;
++	LIST_HEAD(res);
++
++	pr_err("%s In \n", __func__);
++	if (!dev->of_node)
++		return -ENODEV;
++
++	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*port));
++	if (!bridge)
++		return -ENODEV;
++
++	port = pci_host_bridge_priv(bridge);
++
++	port->dev = dev;
++	port->pdev = pdev;
++
++	err = microsemi_pcie_init_port(port);
++	if (err) {
++		dev_err(dev, "Pcie port initialization failed\n");
++		return err;
++	}
++
++
++	err = microsemi_pcie_init_irq_domain(port);
++	if (err) {
++		dev_err(dev, "Failed creating IRQ Domain\n");
++		return err;
++	}
++
++	err = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff, &res,
++					       &iobase);
++	if (err) {
++		dev_err(dev, "Getting bridge resources failed\n");
++		return err;
++	}
++
++	err = devm_request_pci_bus_resources(dev, &res);
++	if (err)
++		goto error;
++
++
++	list_splice_init(&res, &bridge->windows);
++	bridge->dev.parent = dev;
++	bridge->sysdata = port;
++	bridge->busnr = 0;
++	bridge->ops = &microsemi_pcie_ops;
++	bridge->map_irq = of_irq_parse_and_map_pci;
++	bridge->swizzle_irq = pci_common_swizzle;
++
++#ifdef CONFIG_PCI_MSI
++	microsemi_pcie_msi_chip.dev = dev;
++	bridge->msi = &microsemi_pcie_msi_chip;
++#endif
++	err = pci_scan_root_bus_bridge(bridge);
++	dev_info(dev, "pci_scan_root_bus_bridge done\n");
++	if (err < 0)
++		goto error;
++
++	bus = bridge->bus;
++
++	pci_assign_unassigned_bus_resources(bus);
++	list_for_each_entry(child, &bus->children, node)
++		pcie_bus_configure_settings(child);
++	pci_bus_add_devices(bus);
++
++	return 0;
++
++error:
++	pci_free_resource_list(&res);
++	return err;
++}
++
++static const struct of_device_id microsemi_pcie_of_match[] = {
++	{ .compatible = "ms-pf,axi-pcie-host", },
++	{}
++};
++
++static struct platform_driver microsemi_pcie_driver = {
++	.driver = {
++		.name = "microsemi-pcie",
++		.of_match_table = microsemi_pcie_of_match,
++		.suppress_bind_attrs = true,
++	},
++	.probe = microsemi_pcie_probe,
++};
++builtin_platform_driver(microsemi_pcie_driver);
+diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
+index 27e5dd47a01f..da8555771083 100644
+--- a/drivers/pwm/Kconfig
++++ b/drivers/pwm/Kconfig
+@@ -378,6 +378,16 @@ config PWM_SAMSUNG
+ 	  To compile this driver as a module, choose M here: the module
+ 	  will be called pwm-samsung.
+ 
++config PWM_SIFIVE
++	tristate "SiFive PWM support"
++	depends on OF
++	depends on COMMON_CLK
++	help
++	  Generic PWM framework driver for SiFive SoCs.
++
++	  To compile this driver as a module, choose M here: the module
++	  will be called pwm-sifive.
++
+ config PWM_SPEAR
+ 	tristate "STMicroelectronics SPEAr PWM support"
+ 	depends on PLAT_SPEAR
+diff --git a/drivers/pwm/Makefile b/drivers/pwm/Makefile
+index 9c676a0dadf5..30089ca64571 100644
+--- a/drivers/pwm/Makefile
++++ b/drivers/pwm/Makefile
+@@ -37,6 +37,7 @@ obj-$(CONFIG_PWM_RCAR)		+= pwm-rcar.o
+ obj-$(CONFIG_PWM_RENESAS_TPU)	+= pwm-renesas-tpu.o
+ obj-$(CONFIG_PWM_ROCKCHIP)	+= pwm-rockchip.o
+ obj-$(CONFIG_PWM_SAMSUNG)	+= pwm-samsung.o
++obj-$(CONFIG_PWM_SIFIVE)	+= pwm-sifive.o
+ obj-$(CONFIG_PWM_SPEAR)		+= pwm-spear.o
+ obj-$(CONFIG_PWM_STI)		+= pwm-sti.o
+ obj-$(CONFIG_PWM_STM32)		+= pwm-stm32.o
+diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
+new file mode 100644
+index 000000000000..93bc0844d23a
+--- /dev/null
++++ b/drivers/pwm/pwm-sifive.c
+@@ -0,0 +1,252 @@
++/*
++ * Copyright (C) 2018 SiFive, Inc
++ *
++ * This program is free software; you can redistribute it and/or modify it
++ * under the terms of the GNU General Public License version 2, as published by
++ * the Free Software Foundation.
++ */
++
++#include <dt-bindings/pwm/pwm.h>
++#include <linux/module.h>
++#include <linux/platform_device.h>
++#include <linux/pwm.h>
++#include <linux/slab.h>
++#include <linux/clk.h>
++#include <linux/io.h>
++
++#define MAX_PWM			4
++
++/* Register offsets */
++#define REG_PWMCFG		0x0
++#define REG_PWMCOUNT		0x8
++#define REG_PWMS		0x10
++#define	REG_PWMCMP0		0x20
++
++/* PWMCFG fields */
++#define BIT_PWM_SCALE		0
++#define BIT_PWM_STICKY		8
++#define BIT_PWM_ZERO_ZMP	9
++#define BIT_PWM_DEGLITCH	10
++#define BIT_PWM_EN_ALWAYS	12
++#define BIT_PWM_EN_ONCE		13
++#define BIT_PWM0_CENTER		16
++#define BIT_PWM0_GANG		24
++#define BIT_PWM0_IP		28
++
++#define SIZE_PWMCMP		4
++#define MASK_PWM_SCALE		0xf
++
++struct sifive_pwm_device {
++	struct pwm_chip		chip;
++	struct notifier_block	notifier;
++	struct clk		*clk;
++	void __iomem		*regs;
++	int 			irq;
++	unsigned int		approx_period;
++	unsigned int		real_period;
++};
++
++static inline struct sifive_pwm_device *chip_to_sifive(struct pwm_chip *c)
++{
++	return container_of(c, struct sifive_pwm_device, chip);
++}
++
++static inline struct sifive_pwm_device *notifier_to_sifive(struct notifier_block *nb)
++{
++	return container_of(nb, struct sifive_pwm_device, notifier);
++}
++
++static int sifive_pwm_apply(struct pwm_chip *chip, struct pwm_device *dev, struct pwm_state *state)
++{
++	struct sifive_pwm_device *pwm = chip_to_sifive(chip);
++	unsigned int duty_cycle;
++	u32 frac;
++
++	duty_cycle = state->duty_cycle;
++	if (!state->enabled) duty_cycle = 0;
++	if (state->polarity == PWM_POLARITY_NORMAL) duty_cycle = state->period - duty_cycle;
++
++	frac = ((u64)duty_cycle << 16) / state->period;
++	frac = min(frac, 0xFFFFU);
++
++	iowrite32(frac, pwm->regs + REG_PWMCMP0 + (dev->hwpwm * SIZE_PWMCMP));
++
++	if (state->enabled) {
++		state->period = pwm->real_period;
++		state->duty_cycle = ((u64)frac * pwm->real_period) >> 16;
++		if (state->polarity == PWM_POLARITY_NORMAL)
++			state->duty_cycle = state->period - state->duty_cycle;
++	}
++
++	return 0;
++}
++
++static void sifive_pwm_get_state(struct pwm_chip *chip, struct pwm_device *dev, struct pwm_state *state)
++{
++	struct sifive_pwm_device *pwm = chip_to_sifive(chip);
++	unsigned long duty;
++
++	duty = ioread32(pwm->regs + REG_PWMCMP0 + (dev->hwpwm * SIZE_PWMCMP));
++
++	state->period     = pwm->real_period;
++	state->duty_cycle = ((u64)duty * pwm->real_period) >> 16;
++	state->polarity   = PWM_POLARITY_INVERSED;
++	state->enabled    = duty > 0;
++}
++
++static const struct pwm_ops sifive_pwm_ops = {
++	.get_state	= sifive_pwm_get_state,
++	.apply		= sifive_pwm_apply,
++	.owner		= THIS_MODULE,
++};
++
++static struct pwm_device *sifive_pwm_xlate(struct pwm_chip *chip, const struct of_phandle_args *args)
++{
++	struct sifive_pwm_device *pwm = chip_to_sifive(chip);
++	struct pwm_device *dev;
++
++	if (args->args[0] >= chip->npwm)
++		return ERR_PTR(-EINVAL);
++
++	dev = pwm_request_from_chip(chip, args->args[0], NULL);
++	if (IS_ERR(dev))
++		return dev;
++
++	/* The period cannot be changed on a per-PWM basis */
++	dev->args.period   = pwm->real_period;
++	dev->args.polarity = PWM_POLARITY_NORMAL;
++	if (args->args[1] & PWM_POLARITY_INVERTED)
++		dev->args.polarity = PWM_POLARITY_INVERSED;
++
++	return dev;
++}
++
++static void sifive_pwm_update_clock(struct sifive_pwm_device *pwm, unsigned long rate)
++{
++	/* (1 << (16+scale)) * 10^9/rate = real_period */
++	unsigned long scalePow = (pwm->approx_period * (u64)rate) / 1000000000;
++	int scale = ilog2(scalePow) - 16;
++
++	scale = clamp(scale, 0, 0xf);
++	iowrite32((1 << BIT_PWM_EN_ALWAYS) | (scale << BIT_PWM_SCALE), pwm->regs + REG_PWMCFG);
++
++	pwm->real_period = (1000000000ULL << (16 + scale)) / rate;
++}
++
++static int sifive_pwm_clock_notifier(struct notifier_block *nb, unsigned long event, void *data)
++{
++	struct clk_notifier_data *ndata = data;
++	struct sifive_pwm_device *pwm = notifier_to_sifive(nb);
++
++	if (event == POST_RATE_CHANGE)
++		sifive_pwm_update_clock(pwm, ndata->new_rate);
++
++	return NOTIFY_OK;
++}
++
++static int sifive_pwm_probe(struct platform_device *pdev)
++{
++	struct device *dev = &pdev->dev;
++	struct device_node *node = pdev->dev.of_node;
++	struct sifive_pwm_device *pwm;
++	struct pwm_chip *chip;
++	struct resource *res;
++	int ret;
++
++	pwm = devm_kzalloc(dev, sizeof(*pwm), GFP_KERNEL);
++	if (!pwm) {
++		dev_err(dev, "Out of memory\n");
++		return -ENOMEM;
++	}
++
++	chip = &pwm->chip;
++	chip->dev = dev;
++	chip->ops = &sifive_pwm_ops;
++	chip->of_xlate = sifive_pwm_xlate;
++	chip->of_pwm_n_cells = 2;
++	chip->base = -1;
++
++	ret = of_property_read_u32(node, "sifive,npwm", &chip->npwm);
++	if (ret < 0 || chip->npwm > MAX_PWM) chip->npwm = MAX_PWM;
++
++	ret = of_property_read_u32(node, "sifive,approx-period", &pwm->approx_period);
++	if (ret < 0) {
++		dev_err(dev, "Unable to read sifive,approx-period from DTS\n");
++		return -ENOENT;
++	}
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	pwm->regs = devm_ioremap_resource(dev, res);
++	if (IS_ERR(pwm->regs)) {
++		dev_err(dev, "Unable to map IO resources\n");
++		return PTR_ERR(pwm->regs);
++	}
++
++	pwm->clk = devm_clk_get(dev, NULL);
++	if (IS_ERR(pwm->clk)) {
++		dev_err(dev, "Unable to find controller clock\n");
++		return PTR_ERR(pwm->clk);
++	}
++
++	pwm->irq = platform_get_irq(pdev, 0);
++	if (pwm->irq < 0) {
++		dev_err(dev, "Unable to find interrupt\n");
++		return pwm->irq;
++	}
++
++	/* Watch for changes to underlying clock frequency */
++	pwm->notifier.notifier_call = sifive_pwm_clock_notifier;
++	clk_notifier_register(pwm->clk, &pwm->notifier);
++
++	/* Initialize PWM config */
++	sifive_pwm_update_clock(pwm, clk_get_rate(pwm->clk));
++
++	/* No interrupt handler needed yet */
++/*
++	ret = devm_request_irq(dev, pwm->irq, sifive_pwm_irq, 0, dev_name(dev), pwm);
++	if (ret) {
++		dev_err(dev, "Unable to bind interrupt\n");
++		return ret;
++	}
++*/
++
++	ret = pwmchip_add(chip);
++	if (ret < 0) {
++		dev_err(dev, "cannot register PWM: %d\n", ret);
++		clk_notifier_unregister(pwm->clk, &pwm->notifier);
++		return ret;
++	}
++
++	platform_set_drvdata(pdev, pwm);
++	dev_info(dev, "SiFive PWM chip registered %d PWMs\n", chip->npwm);
++
++	return 0;
++}
++
++static int sifive_pwm_remove(struct platform_device *dev)
++{
++	struct sifive_pwm_device *pwm = platform_get_drvdata(dev);
++	struct pwm_chip *chip = &pwm->chip;
++
++	clk_notifier_unregister(pwm->clk, &pwm->notifier);
++	return pwmchip_remove(chip);
++}
++
++static const struct of_device_id sifive_pwm_of_match[] = {
++	{ .compatible = "sifive,pwm0" },
++	{},
++};
++MODULE_DEVICE_TABLE(of, sifive_pwm_of_match);
++
++static struct platform_driver sifive_pwm_driver = {
++	.probe = sifive_pwm_probe,
++	.remove = sifive_pwm_remove,
++	.driver = {
++		.name = "pwm-sifivem",
++		.of_match_table = of_match_ptr(sifive_pwm_of_match),
++	},
++};
++module_platform_driver(sifive_pwm_driver);
++
++MODULE_DESCRIPTION("SiFive PWM driver");
++MODULE_LICENSE("GPL v2");
+diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
+index 7d3a5c94727e..e2be618a493c 100644
+--- a/drivers/spi/Kconfig
++++ b/drivers/spi/Kconfig
+@@ -615,6 +615,13 @@ config SPI_SH_HSPI
+ 	help
+ 	  SPI driver for SuperH HSPI blocks.
+ 
++config SPI_SIFIVE
++	tristate "SiFive SPI controller"
++	depends on HAS_IOMEM
++	select SPI_BITBANG
++	help
++	  This exposes the SPI controller IP from SiFive.
++
+ config SPI_SIRF
+ 	tristate "CSR SiRFprimaII SPI controller"
+ 	depends on SIRF_DMA
+diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
+index 3575205c5c27..76216f1861df 100644
+--- a/drivers/spi/Makefile
++++ b/drivers/spi/Makefile
+@@ -90,6 +90,7 @@ obj-$(CONFIG_SPI_SH)			+= spi-sh.o
+ obj-$(CONFIG_SPI_SH_HSPI)		+= spi-sh-hspi.o
+ obj-$(CONFIG_SPI_SH_MSIOF)		+= spi-sh-msiof.o
+ obj-$(CONFIG_SPI_SH_SCI)		+= spi-sh-sci.o
++obj-$(CONFIG_SPI_SIFIVE)		+= spi-sifive.o
+ obj-$(CONFIG_SPI_SIRF)		+= spi-sirf.o
+ obj-$(CONFIG_SPI_SLAVE_MT27XX)          += spi-slave-mt27xx.o
+ obj-$(CONFIG_SPI_SPRD)			+= spi-sprd.o
+diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
+new file mode 100644
+index 000000000000..208566a9888d
+--- /dev/null
++++ b/drivers/spi/spi-sifive.c
+@@ -0,0 +1,423 @@
++/*
++ * SiFive SPI controller driver (master mode only)
++ *
++ * Author: SiFive, Inc.
++ *	sifive at sifive.com
++ *
++ * 2018 (c) SiFive Software, Inc.
++
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#include <linux/clk.h>
++#include <linux/module.h>
++#include <linux/interrupt.h>
++#include <linux/of.h>
++#include <linux/platform_device.h>
++#include <linux/spi/spi.h>
++#include <linux/io.h>
++#include <linux/log2.h>
++
++#define SIFIVE_SPI_MAX_CS	32
++
++#define SIFIVE_SPI_NAME "sifive_spi"
++
++#define SIFIVE_SPI_DEFAULT_DEPTH 8
++#define SIFIVE_SPI_DEFAULT_BITS	8
++
++#define XSPI_SCDR_OFFSET	0x000	/* Serial Clock Divisor Register */
++#define XSPI_SCD_SCALE_MASK	0xFFF
++
++#define XSPI_SCMR_OFFSET        0x004   /* Serial Clock Mode Register */
++#define XSPI_SCM_CPHA		1
++#define XSPI_SCM_CPOL		2
++#define XSPI_SCM_MODE_MASK     (XSPI_SCM_CPHA | XSPI_SCM_CPOL)
++
++#define XSPI_CSIDR_OFFSET       0x010
++#define XSPI_CSDR_OFFSET        0x014
++#define XSPI_CSMR_OFFSET        0x018
++#define XSPI_CSM_MODE_AUTO      0
++#define XSPI_CSM_MODE_HOLD      2
++#define XSPI_CSM_MODE_OFF       3
++
++#define XSPI_DC0R_OFFSET        0x028
++#define XSPI_CS_TO_SCK_MASK     0xFF
++#define XSPI_SCK_TO_CS_MASK     (0xFF << 16)
++#define XSPI_DC1R_OFFSET        0x02C
++#define XSPI_MIN_CS_IATIME_MASK 0xFF
++#define XSPI_MAX_IF_DELAY_MASK  (0xFF << 16)
++
++#define XSPI_FFR_OFFSET         0x040
++#define XSPI_FF_SINGLE          0
++#define XSPI_FF_DUAL            1
++#define XSPI_FF_QUAD            2
++#define XSPI_FF_SPI_MASK        0x3
++#define XSPI_FF_LSB_FIRST       4
++#define XSPI_FF_TX_DIR          8
++#define XSPI_FF_BPF_MASK        (0xFF << 16)
++
++#define XSPI_TXDR_OFFSET	0x048	/* Data Transmit Register */
++#define XSPI_TXD_FIFO_FULL      (8U << 28)
++#define XSPI_RXDR_OFFSET	0x04C	/* Data Receive Register */
++#define XSPI_RXD_FIFO_EMPTY     (8U << 28)
++#define XSPI_DATA_MASK          0xFF
++#define XSPI_DATA_SHIFT         8
++
++#define XSPI_TXWMR_OFFSET       0x050   /* TX FIFO Watermark Register */
++#define XSPI_RXWMR_OFFSET       0x054   /* RX FIFO Watermark Register */
++
++#define XSPI_FCTRL_OFFSET	0x60
++
++#define XSPI_IPR_OFFSET		0x074	/* Interrupt Pendings Register */
++#define XSPI_IER_OFFSET		0x070	/* Interrupt Enable Register */
++#define XSPI_TXWM_INTR          0x1
++#define XSPI_RXWM_INTR          0x2
++
++struct sifive_spi {
++	void __iomem	*regs;		/* virt. address of the control registers */
++	struct clk	*clk;		/* bus clock */
++	int		irq;		/* watermark irq */
++	int 		buffer_size;	/* buffer size in words */
++	u32		cs_inactive;	/* Level of the CS pins when inactive*/
++	struct completion done;		/* Wake-up from interrupt */
++};
++
++static void sifive_spi_write(struct sifive_spi *spi, int offset, u32 value)
++{
++	iowrite32(value, spi->regs + offset);
++}
++
++static u32 sifive_spi_read(struct sifive_spi *spi, int offset)
++{
++	return ioread32(spi->regs + offset);
++}
++
++static void sifive_spi_init(struct sifive_spi *spi)
++{
++	/* Watermark interrupts are disabled by default */
++	sifive_spi_write(spi, XSPI_IER_OFFSET, 0);
++
++	/* Default watermark FIFO threshold values */
++	sifive_spi_write(spi, XSPI_TXWMR_OFFSET, 1);
++	sifive_spi_write(spi, XSPI_RXWMR_OFFSET, 0);
++
++	/* Set CS/SCK Delays and Inactive Time to defaults */
++
++	/* Exit specialized memory-mapped SPI flash mode */
++	sifive_spi_write(spi, XSPI_FCTRL_OFFSET, 0);
++}
++
++static void sifive_spi_prep_device(struct sifive_spi *spi, struct spi_device *device)
++{
++	u32 cr;
++
++	/* Update the chip select polarity */
++	if (device->mode & SPI_CS_HIGH)
++		spi->cs_inactive &= ~BIT(device->chip_select);
++	else
++		spi->cs_inactive |= BIT(device->chip_select);
++	sifive_spi_write(spi, XSPI_CSDR_OFFSET, spi->cs_inactive);
++
++	/* Select the correct device */
++	sifive_spi_write(spi, XSPI_CSIDR_OFFSET, device->chip_select);
++
++	/* Switch clock mode bits */
++	cr = sifive_spi_read(spi, XSPI_SCMR_OFFSET) & ~XSPI_SCM_MODE_MASK;
++	if (device->mode & SPI_CPHA)
++		cr |= XSPI_SCM_CPHA;
++	if (device->mode & SPI_CPOL)
++		cr |= XSPI_SCM_CPOL;
++	sifive_spi_write(spi, XSPI_SCMR_OFFSET, cr);
++}
++
++static int sifive_spi_prep_transfer(struct sifive_spi *spi, struct spi_device *device, struct spi_transfer *t)
++{
++	u32 hz, scale, cr;
++	int mode;
++
++	/* Calculate and program the clock rate */
++	hz = t->speed_hz ? t->speed_hz : device->max_speed_hz;
++	scale = (DIV_ROUND_UP(clk_get_rate(spi->clk) >> 1, hz) - 1) & XSPI_SCD_SCALE_MASK;
++	sifive_spi_write(spi, XSPI_SCDR_OFFSET, scale);
++
++	/* Modify the SPI protocol mode */
++	cr = sifive_spi_read(spi, XSPI_FFR_OFFSET);
++
++	/* LSB first? */
++	cr &= ~XSPI_FF_LSB_FIRST;
++	if (device->mode & SPI_LSB_FIRST)
++		cr |= XSPI_FF_LSB_FIRST;
++
++	/* SINGLE/DUAL/QUAD? */
++	mode = max((int)t->rx_nbits, (int)t->tx_nbits);
++	cr &= ~XSPI_FF_SPI_MASK;
++	switch (mode) {
++		case SPI_NBITS_QUAD: cr |= XSPI_FF_QUAD;   break;
++		case SPI_NBITS_DUAL: cr |= XSPI_FF_DUAL;   break;
++		default:             cr |= XSPI_FF_SINGLE; break;
++	}
++
++	/* SPI direction */
++	cr &= ~XSPI_FF_TX_DIR;
++	if (!t->rx_buf)
++		cr |= XSPI_FF_TX_DIR;
++
++	sifive_spi_write(spi, XSPI_FFR_OFFSET, cr);
++
++	/* We will want to poll if the time we need to wait is less than the context switching time.
++	 * Let's call that threshold 5us. The operation will take:
++	 *    (8/mode) * buffer_size / hz <= 5 * 10^-6
++	 *    1600000 * buffer_size <= hz * mode
++	 */
++	return 1600000 * spi->buffer_size <= hz * mode;
++}
++
++static void sifive_spi_tx(struct sifive_spi *spi, const u8* tx_ptr)
++{
++	BUG_ON((sifive_spi_read(spi, XSPI_TXDR_OFFSET) & XSPI_TXD_FIFO_FULL) != 0);
++	sifive_spi_write(spi, XSPI_TXDR_OFFSET, *tx_ptr & XSPI_DATA_MASK);
++}
++
++static void sifive_spi_rx(struct sifive_spi *spi, u8* rx_ptr)
++{
++        u32 data = sifive_spi_read(spi, XSPI_RXDR_OFFSET);
++        BUG_ON((data & XSPI_RXD_FIFO_EMPTY) != 0);
++        *rx_ptr = data & XSPI_DATA_MASK;
++}
++
++static void sifive_spi_wait(struct sifive_spi *spi, int bit, int poll)
++{
++	if (poll) {
++		u32 cr;
++		do cr = sifive_spi_read(spi, XSPI_IPR_OFFSET);
++		while (!(cr & bit));
++	} else {
++		reinit_completion(&spi->done);
++		sifive_spi_write(spi, XSPI_IER_OFFSET, bit);
++		wait_for_completion(&spi->done);
++	}
++}
++
++static void sifive_spi_execute(struct sifive_spi *spi, struct spi_transfer *t, int poll)
++{
++	int remaining_words = t->len;
++	const u8* tx_ptr = t->tx_buf;
++	u8* rx_ptr = t->rx_buf;
++
++	while (remaining_words) {
++		int n_words, tx_words, rx_words;
++		n_words = min(remaining_words, spi->buffer_size);
++
++		/* Enqueue n_words for transmission */
++		for (tx_words = 0; tx_words < n_words; ++tx_words)
++			sifive_spi_tx(spi, tx_ptr++);
++
++		if (rx_ptr) {
++			/* Wait for transmission + reception to complete */
++			sifive_spi_write(spi, XSPI_RXWMR_OFFSET, n_words-1);
++			sifive_spi_wait(spi, XSPI_RXWM_INTR, poll);
++
++			/* Read out all the data from the RX FIFO */
++			for (rx_words = 0; rx_words < n_words; ++rx_words)
++				sifive_spi_rx(spi, rx_ptr++);
++		} else {
++			/* Wait for transmission to complete */
++			sifive_spi_wait(spi, XSPI_TXWM_INTR, poll);
++		}
++
++		remaining_words -= n_words;
++	}
++}
++
++static int sifive_spi_transfer_one(struct spi_master *master, struct spi_device *device, struct spi_transfer *t)
++{
++	struct sifive_spi *spi = spi_master_get_devdata(master);
++	int poll;
++
++	sifive_spi_prep_device(spi, device);
++	poll = sifive_spi_prep_transfer(spi, device, t);
++	sifive_spi_execute(spi, t, poll);
++
++	return 0;
++}
++
++static void sifive_spi_set_cs(struct spi_device *device, bool is_high)
++{
++	struct sifive_spi *spi = spi_master_get_devdata(device->master);
++
++	/* Reverse polarity is handled by SCMR/CPOL. Not inverted CS. */
++	if (device->mode & SPI_CS_HIGH)
++		is_high = !is_high;
++
++	sifive_spi_write(spi, XSPI_CSMR_OFFSET, is_high ? XSPI_CSM_MODE_AUTO : XSPI_CSM_MODE_HOLD);
++}
++
++static irqreturn_t sifive_spi_irq(int irq, void *dev_id)
++{
++	struct sifive_spi *spi = dev_id;
++	u32 ip;
++
++	ip = sifive_spi_read(spi, XSPI_IPR_OFFSET) & (XSPI_TXWM_INTR | XSPI_RXWM_INTR);
++	if (ip != 0) {
++		/* Disable interrupts until next transfer */
++		sifive_spi_write(spi, XSPI_IER_OFFSET, 0);
++		complete(&spi->done);
++		return IRQ_HANDLED;
++	}
++
++	return IRQ_NONE;
++}
++
++static int sifive_spi_probe(struct platform_device *pdev)
++{
++	struct sifive_spi *spi;
++	struct resource *res;
++	int ret, num_cs;
++	u32 cs_bits, buffer_size, bits_per_word;
++	struct spi_master *master;
++
++	master = spi_alloc_master(&pdev->dev, sizeof(struct sifive_spi));
++	if (!master) {
++		dev_err(&pdev->dev, "out of memory\n");
++		return -ENOMEM;
++	}
++
++	spi = spi_master_get_devdata(master);
++	init_completion(&spi->done);
++	platform_set_drvdata(pdev, master);
++
++	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	spi->regs = devm_ioremap_resource(&pdev->dev, res);
++	if (IS_ERR(spi->regs)) {
++		dev_err(&pdev->dev, "Unable to map IO resources\n");
++		ret = PTR_ERR(spi->regs);
++		goto put_master;
++	}
++
++	spi->clk = devm_clk_get(&pdev->dev, NULL);
++	if (IS_ERR(spi->clk)) {
++		dev_err(&pdev->dev, "Unable to find bus clock\n");
++		ret = PTR_ERR(spi->clk);
++		goto put_master;
++	}
++
++	spi->irq = platform_get_irq(pdev, 0);
++	if (spi->irq < 0) {
++		dev_err(&pdev->dev, "Unable to find interrupt\n");
++		ret = spi->irq;
++		goto put_master;
++	}
++
++	/* Optional parameters */
++	ret = of_property_read_u32(pdev->dev.of_node, "sifive,buffer-size", &buffer_size);
++	if (ret < 0)
++		spi->buffer_size = SIFIVE_SPI_DEFAULT_DEPTH;
++	else
++		spi->buffer_size = buffer_size;
++
++	ret = of_property_read_u32(pdev->dev.of_node, "sifive,bits-per-word", &bits_per_word);
++	if (ret < 0)
++		bits_per_word = SIFIVE_SPI_DEFAULT_BITS;
++
++	/* Spin up the bus clock before hitting registers */
++	ret = clk_prepare_enable(spi->clk);
++	if (ret) {
++		dev_err(&pdev->dev, "Unable to enable bus clock\n");
++		goto put_master;
++	}
++
++	/* probe the number of CS lines */
++	spi->cs_inactive = sifive_spi_read(spi, XSPI_CSDR_OFFSET);
++	sifive_spi_write(spi, XSPI_CSDR_OFFSET, 0xffffffffU);
++	cs_bits = sifive_spi_read(spi, XSPI_CSDR_OFFSET);
++	sifive_spi_write(spi, XSPI_CSDR_OFFSET, spi->cs_inactive);
++	if (!cs_bits) {
++		dev_err(&pdev->dev, "Could not auto probe CS lines\n");
++		ret = -EINVAL;
++		goto put_master;
++	}
++
++	num_cs = ilog2(cs_bits) + 1;
++	if (num_cs > SIFIVE_SPI_MAX_CS) {
++		dev_err(&pdev->dev, "Invalid number of spi slaves\n");
++		ret = -EINVAL;
++		goto put_master;
++	}
++
++	/* Define our master */
++	master->bus_num = pdev->id;
++	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LSB_FIRST | SPI_CS_HIGH |
++	                    SPI_TX_DUAL | SPI_TX_QUAD | SPI_RX_DUAL | SPI_RX_QUAD;
++	master->flags = SPI_CONTROLLER_MUST_TX | SPI_MASTER_GPIO_SS;
++	master->dev.of_node = pdev->dev.of_node;
++	master->bits_per_word_mask = SPI_BPW_MASK(bits_per_word);
++	master->num_chipselect = num_cs;
++	master->transfer_one = sifive_spi_transfer_one;
++	master->set_cs = sifive_spi_set_cs;
++
++	/* If mmc_spi sees a dma_mask, it starts using dma mapped buffers.
++	 * Probably it should rely on the SPI core auto mapping instead.
++	 */
++	pdev->dev.dma_mask = 0;
++
++	/* Configure the SPI master hardware */
++	sifive_spi_init(spi);
++
++	/* Register for SPI Interrupt */
++	ret = devm_request_irq(&pdev->dev, spi->irq, sifive_spi_irq, 0,
++				dev_name(&pdev->dev), spi);
++	if (ret) {
++		dev_err(&pdev->dev, "Unable to bind to interrupt\n");
++		goto put_master;
++	}
++
++	dev_info(&pdev->dev, "mapped; irq=%d, cs=%d\n",
++		spi->irq, master->num_chipselect);
++
++	ret = devm_spi_register_master(&pdev->dev, master);
++	if (ret < 0) {
++		dev_err(&pdev->dev, "spi_register_master failed\n");
++		goto put_master;
++	}
++
++	return 0;
++
++put_master:
++	spi_master_put(master);
++
++	return ret;
++}
++
++static int sifive_spi_remove(struct platform_device *pdev)
++{
++	struct spi_master *master = platform_get_drvdata(pdev);
++	struct sifive_spi *spi = spi_master_get_devdata(master);
++
++	/* Disable all the interrupts just in case */
++	sifive_spi_write(spi, XSPI_IER_OFFSET, 0);
++	spi_master_put(master);
++
++	return 0;
++}
++
++static const struct of_device_id sifive_spi_of_match[] = {
++	{ .compatible = "sifive,spi0", },
++	{}
++};
++MODULE_DEVICE_TABLE(of, sifive_spi_of_match);
++
++static struct platform_driver sifive_spi_driver = {
++	.probe = sifive_spi_probe,
++	.remove = sifive_spi_remove,
++	.driver = {
++		.name = SIFIVE_SPI_NAME,
++		.of_match_table = sifive_spi_of_match,
++	},
++};
++module_platform_driver(sifive_spi_driver);
++
++MODULE_AUTHOR("SiFive, Inc. <sifive@sifive.com>");
++MODULE_DESCRIPTION("SiFive SPI driver");
++MODULE_LICENSE("GPL");
+diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
+index 32886c304641..f1b19e1a524a 100644
+--- a/drivers/tty/serial/Kconfig
++++ b/drivers/tty/serial/Kconfig
+@@ -290,6 +290,29 @@ config SERIAL_SAMSUNG_CONSOLE
+ 	  your boot loader about how to pass options to the kernel at
+ 	  boot time.)
+ 
++config SERIAL_SIFIVE
++	tristate "SiFive UART support"
++	depends on OF
++	select SERIAL_CORE
++	help
++	  If you have a SiFive Freedom U500 or similar SoC, enable this to
++	  support the SiFive UART.
++
++config SERIAL_SIFIVE_CONSOLE
++	bool "Console on SiFive UART"
++	depends on SERIAL_SIFIVE=y
++	select SERIAL_CORE_CONSOLE
++	help
++	  Select this option if you would like to use a SiFive UART as the
++	  system console.
++
++	  Even if you say Y here, the currently visible virtual console
++	  (/dev/tty0) will still be used as the system console by default, but
++	  you can alter that using a kernel command line option such as
++	  "console=ttySIx". (Try "man bootparam" or see the documentation of
++	  your boot loader about how to pass options to the kernel at
++	  boot time.)
++
+ config SERIAL_SIRFSOC
+         tristate "SiRF SoC Platform Serial port support"
+         depends on ARCH_SIRF
+diff --git a/drivers/tty/serial/Makefile b/drivers/tty/serial/Makefile
+index daac675612df..7e906d3c0455 100644
+--- a/drivers/tty/serial/Makefile
++++ b/drivers/tty/serial/Makefile
+@@ -89,6 +89,7 @@ obj-$(CONFIG_SERIAL_MVEBU_UART)	+= mvebu-uart.o
+ obj-$(CONFIG_SERIAL_PIC32)	+= pic32_uart.o
+ obj-$(CONFIG_SERIAL_MPS2_UART)	+= mps2-uart.o
+ obj-$(CONFIG_SERIAL_OWL)	+= owl-uart.o
++obj-$(CONFIG_SERIAL_SIFIVE)	+= sifive.o
+ 
+ # GPIOLIB helpers for modem control lines
+ obj-$(CONFIG_SERIAL_MCTRL_GPIO)	+= serial_mctrl_gpio.o
+diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
+new file mode 100644
+index 000000000000..1decf79ecf77
+--- /dev/null
++++ b/drivers/tty/serial/sifive.c
+@@ -0,0 +1,1051 @@
++// SPDX-License-Identifier: GPL-2.0+
++/*
++ * SiFive UART driver
++ * Copyright (C) 2018 Paul Walmsley <paul@pwsan.com>
++ *
++ * Based partially on drivers/tty/serial/pxa.c, drivers/pwm/pwm-sifive.c,
++ * and drivers/tty/serial/omap-serial.c
++ *
++ * See Chapter 19 "Universal Asynchronous Receiver/Transmitter (UART)" of
++ * SiFive FE310-G000 v2p3.
++ *
++ * The SiFive UART design is not 8250-compatible.  The following common
++ * features are not supported:
++ * - Word lengths other than 8 bits
++ * - Break handling
++ * - Parity
++ * - Flow control
++ * - Modem signals (DSR, RI, etc.)
++ * On the other hand, the design is free from the baggage of the classical 8250
++ * programming model.
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ */
++
++/* XXX Magic SYSRQ support - is it possible to implement? */
++/* XXX ignore_status_mask */
++/* XXX Ensure operations are spinlocked that need to be spinlocked */
++
++#include <linux/module.h>
++#include <linux/init.h>
++#include <linux/console.h>
++#include <linux/serial_reg.h>
++#include <linux/delay.h>
++#include <linux/slab.h>
++#include <linux/tty.h>
++#include <linux/tty_flip.h>
++#include <linux/platform_device.h>
++#include <linux/io.h>
++#include <linux/clk.h>
++#include <linux/serial_core.h>
++#include <linux/irq.h>
++#include <linux/of.h>
++#include <linux/of_irq.h>
++
++/*
++ * Register offsets
++ */
++
++/* TXDATA */
++#define SIFIVE_SERIAL_TXDATA_OFFS		0x0
++#define SIFIVE_SERIAL_TXDATA_FULL_SHIFT		31
++#define SIFIVE_SERIAL_TXDATA_FULL_MASK		(1 << SIFIVE_SERIAL_TXDATA_FULL_SHIFT)
++#define SIFIVE_SERIAL_TXDATA_DATA_SHIFT		0
++#define SIFIVE_SERIAL_TXDATA_DATA_MASK		(0xff << SIFIVE_SERIAL_TXDATA_DATA_SHIFT)
++
++/* RXDATA */
++#define SIFIVE_SERIAL_RXDATA_OFFS		0x4
++#define SIFIVE_SERIAL_RXDATA_EMPTY_SHIFT	31
++#define SIFIVE_SERIAL_RXDATA_EMPTY_MASK		(1 << SIFIVE_SERIAL_RXDATA_EMPTY_SHIFT)
++#define SIFIVE_SERIAL_RXDATA_DATA_SHIFT		0
++#define SIFIVE_SERIAL_RXDATA_DATA_MASK		(0xff << SIFIVE_SERIAL_RXDATA_DATA_SHIFT)
++
++/* TXCTRL */
++#define SIFIVE_SERIAL_TXCTRL_OFFS		0x8
++#define SIFIVE_SERIAL_TXCTRL_TXCNT_SHIFT	16
++#define SIFIVE_SERIAL_TXCTRL_TXCNT_MASK		(0x7 << SIFIVE_SERIAL_TXCTRL_TXCNT_SHIFT)
++#define SIFIVE_SERIAL_TXCTRL_NSTOP_SHIFT	1
++#define SIFIVE_SERIAL_TXCTRL_NSTOP_MASK		(1 << SIFIVE_SERIAL_TXCTRL_NSTOP_SHIFT)
++#define SIFIVE_SERIAL_TXCTRL_TXEN_SHIFT		0
++#define SIFIVE_SERIAL_TXCTRL_TXEN_MASK		(1 << SIFIVE_SERIAL_TXCTRL_TXEN_SHIFT)
++
++/* RXCTRL */
++#define SIFIVE_SERIAL_RXCTRL_OFFS		0xC
++#define SIFIVE_SERIAL_RXCTRL_RXCNT_SHIFT	16
++#define SIFIVE_SERIAL_RXCTRL_RXCNT_MASK		(0x7 << SIFIVE_SERIAL_TXCTRL_TXCNT_SHIFT)
++#define SIFIVE_SERIAL_RXCTRL_RXEN_SHIFT		0
++#define SIFIVE_SERIAL_RXCTRL_RXEN_MASK		(1 << SIFIVE_SERIAL_RXCTRL_RXEN_SHIFT)
++
++/* IE */
++#define SIFIVE_SERIAL_IE_OFFS			0x10
++#define SIFIVE_SERIAL_IE_RXWM_SHIFT		1
++#define SIFIVE_SERIAL_IE_RXWM_MASK		(1 << SIFIVE_SERIAL_IE_RXWM_SHIFT)
++#define SIFIVE_SERIAL_IE_TXWM_SHIFT		0
++#define SIFIVE_SERIAL_IE_TXWM_MASK		(1 << SIFIVE_SERIAL_IE_TXWM_SHIFT)
++
++/* IP */
++#define SIFIVE_SERIAL_IP_OFFS			0x14
++#define SIFIVE_SERIAL_IP_RXWM_SHIFT		1
++#define SIFIVE_SERIAL_IP_RXWM_MASK		(1 << SIFIVE_SERIAL_IP_RXWM_SHIFT)
++#define SIFIVE_SERIAL_IP_TXWM_SHIFT		0
++#define SIFIVE_SERIAL_IP_TXWM_MASK		(1 << SIFIVE_SERIAL_IP_TXWM_SHIFT)
++
++/* DIV */
++#define SIFIVE_SERIAL_DIV_OFFS			0x18
++#define SIFIVE_SERIAL_DIV_DIV_SHIFT		0
++#define SIFIVE_SERIAL_DIV_DIV_MASK		(0xffff << SIFIVE_SERIAL_IP_DIV_SHIFT)
++
++/*
++ * Config macros
++ */
++
++/* SIFIVE_SERIAL_MAX_PORTS: maximum number of UARTs possible on a device */
++/* XXX Move to Kconfig? */
++#define SIFIVE_SERIAL_MAX_PORTS			10
++
++/* SIFIVE_SERIAL_NAME: our driver's name that we pass to the operating system */
++#define SIFIVE_SERIAL_NAME			"sifive-serial"
++
++/* SIFIVE_TTY_PREFIX: tty name prefix for SiFive serial ports */
++#define SIFIVE_TTY_PREFIX			"ttySIF"
++
++/*
++ *
++ */
++
++/**
++ * sifive_serial_port - driver-specific data extension to struct uart_port
++ * @port: struct uart_port embedded in this struct
++ * @dev: struct device *
++ * @ier: shadowed copy of the interrupt enable register
++ * @clkin_rate: input clock to the UART IP block.
++ * @bit_rate: UART serial line rate (e.g., 115200 bps)
++ * @clk_notifier: clock rate change notifier for upstream clock changes
++ */
++struct sifive_serial_port {
++	struct uart_port	port;
++	struct device		*dev;
++	unsigned char		ier;
++	unsigned long		clkin_rate;
++	unsigned long		bit_rate;
++	struct clk		*clk;
++	struct notifier_block	clk_notifier;
++};
++
++/*
++ * Structure container-of macros
++ */
++
++#define port_to_sifive_serial_port(p) (container_of((p), \
++						    struct sifive_serial_port, \
++						    port))
++
++#define notifier_to_sifive_serial_port(nb) (container_of((nb), \
++							 struct sifive_serial_port, \
++							 clk_notifier))
++
++/*
++ * Forward declarations
++ */
++static void sifive_serial_stop_tx(struct uart_port *port);
++
++/*
++ * Internal functions
++ */
++
++/**
++ * sifive_serial_early_write() - write to a UART register (early)
++ * @port: pointer to a struct uart_port record
++ * @offs: register address offset from the IP block base address
++ * @v: value to write to the register
++ *
++ * Given a pointer @port to a struct uart_port record, write the value @v to the
++ * IP block register address offset @offs.  This function is intended for early
++ * console use.
++ */
++static void sifive_serial_early_write(struct uart_port *port, u16 offs, u32 v)
++{
++	writel(v, port->membase + offs);
++}
++
++/**
++ * sifive_serial_early_read() - read from a UART register (early)
++ * @port: pointer to a struct uart_port record
++ * @offs: register address offset from the IP block base address
++ *
++ * Given a pointer @port to a struct uart_port record, read the contents of the
++ * IP block register located at offset @offs from the IP block base and return
++ * it.  This function is intended for early console use.
++ *
++ * Returns: the register value read from the UART.
++ */
++static u32 sifive_serial_early_read(struct uart_port *port, u16 offs)
++{
++	return readl(port->membase + offs);
++}
++
++/**
++ * sifive_serial_write() - write to a UART register
++ * @ssp: pointer to a struct sifive_serial_port record
++ * @offs: register address offset from the IP block base address
++ * @v: value to write to the register
++ *
++ * Write the value @v to the IP block register located at offset @offs from the
++ * IP block base, given a pointer @ssp to a struct sifive_serial_port record.
++ */
++static void sifive_serial_write(struct sifive_serial_port *ssp, u16 offs, u32 v)
++{
++	sifive_serial_early_write(&ssp->port, offs, v);
++}
++
++/**
++ * sifive_serial_read() - read from a UART register
++ * @ssp: pointer to a struct sifive_serial_port record
++ * @offs: register address offset from the IP block base address
++ *
++ * Read the contents of the IP block register located at offset @offs from the
++ * IP block base, given a pointer @ssp to a struct sifive_serial_port record.
++ *
++ * Returns: the value of the UART register
++ */
++static u32 sifive_serial_read(struct sifive_serial_port *ssp, u16 offs)
++{
++	return sifive_serial_early_read(&ssp->port, offs);
++}
++
++/**
++ * sifive_serial_is_txfifo_full() - is the TXFIFO full?
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Read the transmit FIFO "full" bit, returning a non-zero value if the
++ * TX FIFO is full, or zero if space remains.  Intended to be used to prevent
++ * writes to the TX FIFO when it's full.
++ *
++ * Returns: SIFIVE_SERIAL_TXDATA_FULL_MASK (non-zero) if the transmit FIFO
++ * is full, or 0 if space remains.
++ */
++static int sifive_serial_is_txfifo_full(struct sifive_serial_port *ssp)
++{
++	return sifive_serial_read(ssp, SIFIVE_SERIAL_TXDATA_OFFS) &
++		SIFIVE_SERIAL_TXDATA_FULL_MASK;
++}
++
++/**
++ * sifive_serial_transmit_char() - enqueue a byte to transmit onto the TX FIFO
++ * @ssp: pointer to a struct sifive_serial_port
++ * @ch: character to transmit
++ *
++ * Enqueue a byte @ch onto the transmit FIFO, given a pointer @ssp to the
++ * struct sifive_serial_port * to transmit on.  Caller should first check to
++ * ensure that the TXFIFO has space; see sifive_serial_is_txfifo_full().
++ */
++static void sifive_serial_transmit_char(struct sifive_serial_port *ssp, int ch)
++{
++	sifive_serial_write(ssp, SIFIVE_SERIAL_TXDATA_OFFS, ch);
++}
++
++/**
++ * sifive_serial_transmit_chars() - enqueue multiple bytes onto the TX FIFO
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Transfer up to a TX FIFO size's worth of characters from the Linux serial
++ * transmit buffer to the SiFive UART TX FIFO.
++ */
++static void sifive_serial_transmit_chars(struct sifive_serial_port *ssp)
++{
++	struct circ_buf *xmit = &ssp->port.state->xmit;
++	int count;
++
++	if (ssp->port.x_char) {
++		sifive_serial_transmit_char(ssp, ssp->port.x_char);
++		ssp->port.icount.tx++;
++		ssp->port.x_char = 0;
++		return;
++	}
++	if (uart_circ_empty(xmit) || uart_tx_stopped(&ssp->port)) {
++		sifive_serial_stop_tx(&ssp->port);
++		return;
++	}
++	count = ssp->port.fifosize;
++	do {
++		sifive_serial_transmit_char(ssp, xmit->buf[xmit->tail]);
++		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
++		ssp->port.icount.tx++;
++		if (uart_circ_empty(xmit))
++			break;
++	} while (--count > 0);
++
++	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
++		uart_write_wakeup(&ssp->port);
++
++	if (uart_circ_empty(xmit))
++		sifive_serial_stop_tx(&ssp->port);
++}
++
++/**
++ * sifive_serial_enable_txwm() - enable transmit watermark interrupts
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Enable interrupt generation when the transmit FIFO watermark is reached
++ * on the UART referred to by @ssp.
++ */
++static void sifive_serial_enable_txwm(struct sifive_serial_port *ssp)
++{
++	if (ssp->ier & SIFIVE_SERIAL_IE_TXWM_MASK)
++		return;
++
++	ssp->ier |= SIFIVE_SERIAL_IE_TXWM_MASK;
++	sifive_serial_write(ssp, SIFIVE_SERIAL_IE_OFFS, ssp->ier);
++}
++
++/**
++ * sifive_serial_enable_rxwm() - enable receive watermark interrupts
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Enable interrupt generation when the receive FIFO watermark is reached
++ * on the UART referred to by @ssp.
++ */
++static void sifive_serial_enable_rxwm(struct sifive_serial_port *ssp)
++{
++	if (ssp->ier & SIFIVE_SERIAL_IE_RXWM_MASK)
++		return;
++
++	ssp->ier |= SIFIVE_SERIAL_IE_RXWM_MASK;
++	sifive_serial_write(ssp, SIFIVE_SERIAL_IE_OFFS, ssp->ier);
++}
++
++/**
++ * sifive_serial_disable_txwm() - disable transmit watermark interrupts
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Disable interrupt generation when the transmit FIFO watermark is reached
++ * on the UART referred to by @ssp.
++ */
++static void sifive_serial_disable_txwm(struct sifive_serial_port *ssp)
++{
++	if (!(ssp->ier & SIFIVE_SERIAL_IE_TXWM_MASK))
++		return;
++
++	ssp->ier &= ~SIFIVE_SERIAL_IE_TXWM_MASK;
++	sifive_serial_write(ssp, SIFIVE_SERIAL_IE_OFFS, ssp->ier);
++}
++
++/**
++ * sifive_serial_disable_rxwm() - disable receive watermark interrupts
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Disable interrupt generation when the receive FIFO watermark is reached
++ * on the UART referred to by @ssp.
++ */
++static void sifive_serial_disable_rxwm(struct sifive_serial_port *ssp)
++{
++	if (!(ssp->ier & SIFIVE_SERIAL_IE_RXWM_MASK))
++		return;
++
++	ssp->ier &= ~SIFIVE_SERIAL_IE_RXWM_MASK;
++	sifive_serial_write(ssp, SIFIVE_SERIAL_IE_OFFS, ssp->ier);
++}
++
++/**
++ * sifive_serial_receive_char() - receive a byte from the UART
++ * @ssp: pointer to a struct sifive_serial_port
++ * @is_empty: char pointer to return whether the RX FIFO is empty
++ *
++ * Try to read a byte from the SiFive UART RX FIFO, referenced by
++ * @ssp, and to return it.  Also returns the RX FIFO empty bit in
++ * the char pointed to by @ch.  The caller must pass the byte back to the
++ * Linux serial layer if needed.
++ *
++ * Returns: the byte read from the UART RX FIFO.
++ */
++static char sifive_serial_receive_char(struct sifive_serial_port *ssp,
++				       char *is_empty)
++{
++	u32 v;
++	u8 ch;
++
++	v = sifive_serial_read(ssp, SIFIVE_SERIAL_RXDATA_OFFS);
++
++	if (!is_empty)
++		WARN_ON(1);
++	else
++		*is_empty = (v & SIFIVE_SERIAL_RXDATA_EMPTY_MASK) >>
++			SIFIVE_SERIAL_RXDATA_EMPTY_SHIFT;
++
++	ch = (v & SIFIVE_SERIAL_RXDATA_DATA_MASK) >>
++		SIFIVE_SERIAL_RXDATA_DATA_SHIFT;
++
++	return ch;
++}
++
++/**
++ * sifive_serial_receive_chars() - receive multiple bytes from the UART
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Receive up to an RX FIFO's worth of bytes from the SiFive UART referred
++ * to by @ssp and pass them up to the Linux serial layer.
++ */
++static void sifive_serial_receive_chars(struct sifive_serial_port *ssp)
++{
++	unsigned char ch;
++	char is_empty;
++	int c;
++
++	for (c = ssp->port.fifosize; c > 0; --c) {
++		ch = sifive_serial_receive_char(ssp, &is_empty);
++		if (is_empty) break;
++
++		ssp->port.icount.rx++;
++		uart_insert_char(&ssp->port, 0, 0, ch, TTY_NORMAL);
++	}
++}
++
++/**
++ * sifive_serial_update_div() - calculate the divisor setting by the line rate
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Calculate the appropriate value of the clock divisor for the UART
++ * referred to by @ssp and the target line rate referred to by @bps, and
++ * return it.
++ */
++static void sifive_serial_update_div(struct sifive_serial_port *ssp)
++{
++	u16 div = DIV_ROUND_UP(ssp->clkin_rate, ssp->bit_rate) - 1;
++	/* XXX check for div out of spec */
++	sifive_serial_write(ssp, SIFIVE_SERIAL_DIV_OFFS, div);
++}
++
++/**
++ * sifive_serial_update_bit_rate() - set the UART "baud rate"
++ * @ssp: pointer to a struct sifive_serial_port
++ * @rate: new target bit rate
++ *
++ * Calculate the UART divisor value for the target bit rate @rate for the
++ * SiFive UART described by @ssp and program it into the UART.  There may
++ * be some error between the target bit rate and the actual bit rate implemented
++ * by the UART due to clock ratio granularity.
++ */
++static void sifive_serial_update_bit_rate(struct sifive_serial_port *ssp,
++					  unsigned int rate)
++{
++	if (ssp->bit_rate == rate)
++		return;
++
++	ssp->bit_rate = rate;
++	sifive_serial_update_div(ssp);
++}
++
++/**
++ * sifive_serial_set_stop_bits() - set the number of stop bits
++ * @ssp: pointer to a struct sifive_serial_port
++ * @nstop: 1 or 2 (stop bits)
++ *
++ * Program the SiFive UART referred to by @ssp to use @nstop stop bits.
++ */
++static void sifive_serial_set_stop_bits(struct sifive_serial_port *ssp,
++					char nstop)
++{
++	u32 v;
++
++	if (nstop < 1 || nstop > 2) {
++		WARN_ON(1);
++		return;
++	}
++
++	v = sifive_serial_read(ssp, SIFIVE_SERIAL_TXCTRL_OFFS);
++	v &= ~SIFIVE_SERIAL_TXCTRL_NSTOP_MASK;
++	v |= (nstop-1) << SIFIVE_SERIAL_TXCTRL_NSTOP_SHIFT;
++	sifive_serial_write(ssp, SIFIVE_SERIAL_TXCTRL_OFFS, v);
++}
++
++/**
++ * sifive_serial_wait_for_xmitr() - wait for an empty slot on the TX FIFO
++ * @ssp: pointer to a struct sifive_serial_port
++ *
++ * Delay while the UART TX FIFO referred to by @ssp is marked as full.
++ *
++ * XXX Probably should use a timeout/bailout.
++ */
++static inline void sifive_serial_wait_for_xmitr(struct sifive_serial_port *ssp)
++{
++	while (sifive_serial_is_txfifo_full(ssp))
++		udelay(1); /* XXX Should vary by bps rate */
++}
++
++/*
++ * Linux serial API functions
++ */
++
++static void sifive_serial_stop_tx(struct uart_port *port)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	sifive_serial_disable_txwm(ssp);
++}
++
++static void sifive_serial_stop_rx(struct uart_port *port)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	sifive_serial_disable_rxwm(ssp);
++}
++
++static void sifive_serial_start_tx(struct uart_port *port)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	sifive_serial_enable_txwm(ssp);
++}
++
++static irqreturn_t sifive_serial_irq(int irq, void *dev_id)
++{
++	struct sifive_serial_port *ssp = dev_id;
++	irqreturn_t r = IRQ_NONE;
++	int c = ssp->port.fifosize;
++	u32 ip;
++
++	spin_lock(&ssp->port.lock);
++
++	do {
++		ip = sifive_serial_read(ssp, SIFIVE_SERIAL_IP_OFFS);
++		if (!ip)
++			break;
++
++		r = IRQ_HANDLED;
++
++		if (ip & SIFIVE_SERIAL_IP_RXWM_MASK)
++			sifive_serial_receive_chars(ssp);
++		if (ip & SIFIVE_SERIAL_IP_TXWM_MASK)
++			sifive_serial_transmit_chars(ssp);
++	} while (c--);
++
++	spin_unlock(&ssp->port.lock);
++
++	tty_flip_buffer_push(&ssp->port.state->port);
++
++	return r;
++}
++
++static unsigned int sifive_serial_tx_empty(struct uart_port *port)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	return !sifive_serial_is_txfifo_full(ssp);
++}
++
++static unsigned int sifive_serial_get_mctrl(struct uart_port *port)
++{
++	return 0; /* XXX -EINVAL? */
++}
++
++static void sifive_serial_set_mctrl(struct uart_port *port, unsigned int mctrl)
++{
++	// dev_err(port->dev, "set_mctrl not supported\n");
++}
++
++static void sifive_serial_break_ctl(struct uart_port *port, int break_state)
++{
++	dev_err(port->dev, "sending break not supported\n");
++}
++
++static int sifive_serial_startup(struct uart_port *port)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	sifive_serial_enable_rxwm(ssp);
++
++	return 0;
++}
++
++static void sifive_serial_shutdown(struct uart_port *port)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	sifive_serial_disable_rxwm(ssp);
++	sifive_serial_disable_txwm(ssp);
++}
++
++/**
++ * sifive_serial_clk_notifier() - clock post-rate-change notifier
++ * @nb: pointer to the struct notifier_block, from the notifier code
++ * @event: event mask from the notifier code
++ * @data: pointer to the struct clk_notifier_data from the notifier code
++ *
++ * On the H5U SoC, the UART IP block is derived from the CPU clock source
++ * after a synchronous divide-by-two divider, so any CPU clock rate change
++ * requires the UART baud rate to be updated.  This presumably could corrupt any
++ * serial word currently being transmitted or received.  It would probably
++ * be better to stop receives and transmits, then complete the baud rate
++ * change, then re-enable them.
++ */
++static int sifive_serial_clk_notifier(struct notifier_block *nb,
++				      unsigned long event, void *data)
++{
++	struct clk_notifier_data *cnd = data;
++	struct sifive_serial_port *ssp = notifier_to_sifive_serial_port(nb);
++
++	if (event == POST_RATE_CHANGE && ssp->clkin_rate != cnd->new_rate) {
++		ssp->clkin_rate = cnd->new_rate;
++		sifive_serial_update_div(ssp);
++	}
++
++	return NOTIFY_OK;
++}
++
++static void sifive_serial_set_termios(struct uart_port *port,
++				      struct ktermios *termios,
++				      struct ktermios *old)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++	int rate;
++	char nstop;
++
++	if ((termios->c_cflag & CSIZE) != CS8) {
++		dev_err(ssp->port.dev, "only 8-bit words supported\n");
++		return;
++	}
++
++	/* Set number of stop bits */
++	nstop = (termios->c_cflag & CSTOPB) ? 2 : 1;
++	sifive_serial_set_stop_bits(ssp, nstop);
++
++	/* Set line rate */
++	rate = uart_get_baud_rate(port, termios, old, 0, ssp->clkin_rate / 16);
++	sifive_serial_update_bit_rate(ssp, rate);
++
++	/* XXX Enable FIFOs with watermark 1 */
++
++#if 0
++	spin_lock_irqsave(&ssp->port.lock, flags);
++#endif
++
++	/*
++	 * Update the per-port timeout.
++	 */
++	uart_update_timeout(port, termios->c_cflag, rate);
++
++	/* XXX */
++	ssp->port.read_status_mask = 0;
++	if (termios->c_iflag & INPCK) {
++		dev_err(ssp->port.dev, "INPCK flag not supported\n");
++		return;
++	}
++	if (termios->c_iflag & (BRKINT | PARMRK)) {
++		dev_err(ssp->port.dev, "BRKINT/PARMRK flag not supported\n");
++		return;
++	}
++
++#if 0
++	/*
++	 * ignore all characters if CREAD is not set
++	 */
++	if ((termios->c_cflag & CREAD) == 0)
++		ssp->port.ignore_status_mask |= UART_LSR_DR;
++#endif
++
++	/* XXX enable interrupts */
++}
++
++static void sifive_serial_release_port(struct uart_port *port)
++{
++}
++
++static int sifive_serial_request_port(struct uart_port *port)
++{
++	return 0;
++}
++
++static void sifive_serial_config_port(struct uart_port *port, int flags)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	ssp->port.type = PORT_SIFIVE_H5U;
++}
++
++static int sifive_serial_verify_port(struct uart_port *port,
++				     struct serial_struct *ser)
++{
++	return -EINVAL;
++}
++
++static const char *sifive_serial_type(struct uart_port *port)
++{
++	return port->type == PORT_SIFIVE_H5U ? SIFIVE_SERIAL_NAME : NULL;
++}
++
++/*
++ * Polling support
++ */
++
++#ifdef CONFIG_CONSOLE_POLL
++
++static void sifive_serial_poll_put_char(struct uart_port *port,
++					unsigned char ch)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	sifive_serial_wait_for_xmitr(ssp);
++	sifive_serial_write(ssp, SIFIVE_SERIAL_TXDATA_OFFS, ch);
++}
++
++static int sifive_serial_poll_get_char(struct uart_port *port)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++	char is_empty, ch;
++
++	ch = sifive_serial_receive_char(ssp, &is_empty);
++	if (is_empty)
++		return NO_POLL_CHAR;
++
++	return ch;
++}
++
++#endif /* CONFIG_CONSOLE_POLL */
++
++/*
++ * Earlyconsole support
++ */
++
++#ifdef CONFIG_SERIAL_EARLYCON
++static void early_sifive_serial_putc(struct uart_port *port, int c)
++{
++	while (sifive_serial_early_read(port, SIFIVE_SERIAL_TXDATA_OFFS) &
++	       SIFIVE_SERIAL_TXDATA_FULL_MASK)
++		cpu_relax();
++
++	sifive_serial_early_write(port, SIFIVE_SERIAL_TXDATA_OFFS, c);
++}
++
++void early_sifive_serial_write(struct console *console, const char *s,
++			       unsigned int count)
++{
++	struct earlycon_device *device = console->data;
++	struct uart_port *port = &device->port;
++
++	uart_console_write(port, s, count, early_sifive_serial_putc);
++}
++
++static int __init early_sifive_serial_setup(struct earlycon_device *device,
++					    const char *options)
++{
++	struct uart_port *port = &device->port;
++
++	if (!(port->membase || port->iobase))
++		return -ENODEV;
++
++	device->con->write = early_sifive_serial_write;
++	return 0;
++}
++
++OF_EARLYCON_DECLARE(sifive, "sifive,freedom-uart", early_sifive_serial_setup);
++#endif /* CONFIG_SERIAL_EARLYCON */
++
++/*
++ * Linux console interface
++ */
++
++#ifdef CONFIG_SERIAL_SIFIVE_CONSOLE
++
++static struct sifive_serial_port *sifive_serial_console_ports[SIFIVE_SERIAL_MAX_PORTS];
++
++static void sifive_serial_console_putchar(struct uart_port *port, int ch)
++{
++	struct sifive_serial_port *ssp = port_to_sifive_serial_port(port);
++
++	sifive_serial_wait_for_xmitr(ssp);
++	sifive_serial_transmit_char(ssp, ch);
++}
++
++static void sifive_serial_console_write(struct console *co, const char *s,
++					unsigned int count)
++{
++	struct sifive_serial_port *ssp = sifive_serial_console_ports[co->index];
++	unsigned long flags;
++	unsigned int ier;
++	int locked = 1;
++
++	if (!ssp) return;
++
++	local_irq_save(flags);
++	if (ssp->port.sysrq)
++		locked = 0;
++	else if (oops_in_progress)
++		locked = spin_trylock(&ssp->port.lock);
++	else
++		spin_lock(&ssp->port.lock);
++
++	ier = sifive_serial_read(ssp, SIFIVE_SERIAL_IE_OFFS);
++	sifive_serial_write(ssp, SIFIVE_SERIAL_IE_OFFS, 0);
++
++	uart_console_write(&ssp->port, s, count, sifive_serial_console_putchar);
++
++	sifive_serial_write(ssp, SIFIVE_SERIAL_IE_OFFS, ier);
++
++	if (locked)
++		spin_unlock(&ssp->port.lock);
++	local_irq_restore(flags);
++}
++
++static int __init sifive_serial_console_setup(struct console *co, char *options)
++{
++	struct sifive_serial_port *ssp;
++	int baud = 115200;
++	int bits = 8;
++	int parity = 'n';
++	int flow = 'n';
++
++	ssp = sifive_serial_console_ports[co->index];
++	if (!ssp)
++		return -ENODEV;
++
++	if (options)
++		uart_parse_options(options, &baud, &parity, &bits, &flow);
++
++	return uart_set_options(&ssp->port, co, baud, parity, bits, flow);
++}
++
++static struct uart_driver sifive_serial_uart_driver;
++
++static struct console sifive_serial_console = {
++	.name		= SIFIVE_TTY_PREFIX,
++	.write		= sifive_serial_console_write,
++	.device		= uart_console_device,
++	.setup		= sifive_serial_console_setup,
++	.flags		= CON_PRINTBUFFER,
++	.index		= -1,
++	.data		= &sifive_serial_uart_driver,
++};
++
++static void sifive_serial_add_console_port(struct sifive_serial_port *ssp)
++{
++	sifive_serial_console_ports[ssp->port.line] = ssp;
++}
++
++static void sifive_serial_remove_console_port(struct sifive_serial_port *ssp)
++{
++	sifive_serial_console_ports[ssp->port.line] = 0;
++}
++
++#define SIFIVE_SERIAL_CONSOLE	(&sifive_serial_console)
++
++#else
++
++#define SIFIVE_SERIAL_CONSOLE	NULL
++
++static inline void sifive_serial_add_console_port(struct sifive_serial_port *ssp)
++{}
++static void sifive_serial_remove_console_port(struct sifive_serial_port *ssp)
++{}
++
++#endif
++
++static const struct uart_ops sifive_serial_uops = {
++	.tx_empty	= sifive_serial_tx_empty,
++	.set_mctrl	= sifive_serial_set_mctrl,
++	.get_mctrl	= sifive_serial_get_mctrl,
++	.stop_tx	= sifive_serial_stop_tx,
++	.start_tx	= sifive_serial_start_tx,
++	.stop_rx	= sifive_serial_stop_rx,
++	.break_ctl	= sifive_serial_break_ctl,
++	.startup	= sifive_serial_startup,
++	.shutdown	= sifive_serial_shutdown,
++	.set_termios	= sifive_serial_set_termios,
++	.type		= sifive_serial_type,
++	.release_port	= sifive_serial_release_port,
++	.request_port	= sifive_serial_request_port,
++	.config_port	= sifive_serial_config_port,
++	.verify_port	= sifive_serial_verify_port,
++#ifdef CONFIG_CONSOLE_POLL
++	.poll_put_char  = sifive_serial_poll_put_char,
++	.poll_get_char  = sifive_serial_poll_get_char,
++#endif
++};
++
++static struct uart_driver sifive_serial_uart_driver = {
++	.owner		= THIS_MODULE,
++	.driver_name	= SIFIVE_SERIAL_NAME,
++	.dev_name	= SIFIVE_TTY_PREFIX,
++	.nr		= SIFIVE_SERIAL_MAX_PORTS,
++	.cons		= SIFIVE_SERIAL_CONSOLE,
++};
++
++static int sifive_serial_probe(struct platform_device *pdev)
++{
++	struct sifive_serial_port *ssp;
++	struct resource *mem;
++	struct clk *clk;
++	void __iomem *base;
++	int irq, id, r;
++
++	irq = platform_get_irq(pdev, 0);
++	if (irq < 0) {
++		dev_err(&pdev->dev, "could not acquire interrupt\n");
++		return -EPROBE_DEFER;
++	}
++
++	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
++	base = devm_ioremap_resource(&pdev->dev, mem);
++	if (IS_ERR(base)) {
++		dev_err(&pdev->dev, "could not acquire device memory\n");
++		return PTR_ERR(base);
++	}
++
++	clk = devm_clk_get(&pdev->dev, NULL);
++	if (IS_ERR(clk)) {
++		dev_err(&pdev->dev, "unable to find controller clock\n");
++		return PTR_ERR(clk);
++	}
++
++	id = of_alias_get_id(pdev->dev.of_node, "serial");
++	if (id < 0) {
++		dev_err(&pdev->dev, "missing aliases entry\n");
++		return id;
++	}
++
++#ifdef CONFIG_SERIAL_SIFIVE_CONSOLE
++	if (id > SIFIVE_SERIAL_MAX_PORTS) {
++		dev_err(&pdev->dev, "too many UARTs (%d)\n", id);
++		return -EINVAL;
++	}
++#endif
++
++	ssp = devm_kzalloc(&pdev->dev, sizeof(*ssp), GFP_KERNEL);
++	if (!ssp)
++		return -ENOMEM;
++
++	ssp->port.dev = &pdev->dev;
++	ssp->port.type = PORT_SIFIVE_H5U;
++	ssp->port.iotype = UPIO_MEM;
++	ssp->port.irq = irq;
++	ssp->port.fifosize = 8;
++	ssp->port.ops = &sifive_serial_uops;
++	ssp->port.line = id;
++	ssp->port.mapbase = mem->start;
++	ssp->port.membase = base;
++	ssp->dev = &pdev->dev;
++	ssp->clk = clk;
++	ssp->clk_notifier.notifier_call = sifive_serial_clk_notifier;
++
++	r = clk_notifier_register(ssp->clk, &ssp->clk_notifier);
++	if (r) {
++		dev_err(&pdev->dev, "could not register clock notifier: %d\n",
++			r);
++		goto probe_out1;
++	}
++
++	/* Setup clock divider */
++	ssp->clkin_rate = clk_get_rate(ssp->clk);
++	ssp->bit_rate = 115200;
++	sifive_serial_update_div(ssp);
++
++	platform_set_drvdata(pdev, ssp);
++
++	/* Enable transmits and set the watermark level to 1 */
++	sifive_serial_write(ssp, SIFIVE_SERIAL_TXCTRL_OFFS,
++			    (1 << SIFIVE_SERIAL_TXCTRL_TXCNT_SHIFT) |
++			    SIFIVE_SERIAL_TXCTRL_TXEN_MASK);
++
++	/* Enable receives and set the watermark level to 0 */
++	sifive_serial_write(ssp, SIFIVE_SERIAL_RXCTRL_OFFS,
++			    (0 << SIFIVE_SERIAL_RXCTRL_RXCNT_SHIFT) |
++			    SIFIVE_SERIAL_RXCTRL_RXEN_MASK);
++
++	r = request_irq(ssp->port.irq, sifive_serial_irq, ssp->port.irqflags,
++			dev_name(&pdev->dev), ssp);
++	if (r) {
++		dev_err(&pdev->dev, "could not attach interrupt: %d\n", r);
++		goto probe_out2;
++	}
++
++	r = uart_add_one_port(&sifive_serial_uart_driver, &ssp->port);
++	if (r != 0) {
++		dev_err(&pdev->dev, "could not add uart: %d\n", r);
++		goto probe_out3;
++	}
++
++	sifive_serial_add_console_port(ssp);
++
++	return 0;
++
++probe_out3:
++	free_irq(ssp->port.irq, ssp);
++probe_out2:
++	clk_notifier_unregister(ssp->clk, &ssp->clk_notifier);
++probe_out1:
++	return r;
++}
++
++static int sifive_serial_remove(struct platform_device *dev)
++{
++	struct sifive_serial_port *ssp = platform_get_drvdata(dev);
++
++	sifive_serial_remove_console_port(ssp);
++	uart_remove_one_port(&sifive_serial_uart_driver, &ssp->port);
++	free_irq(ssp->port.irq, ssp);
++	clk_notifier_unregister(ssp->clk, &ssp->clk_notifier);
++
++	return 0;
++}
++
++static const struct of_device_id sifive_serial_of_match[] = {
++	{ .compatible = "sifive,uart0" },
++	{},
++};
++MODULE_DEVICE_TABLE(of, sifive_serial_match);
++
++static struct platform_driver sifive_serial_platform_driver = {
++	.probe		= sifive_serial_probe,
++	.remove		= sifive_serial_remove,
++	.driver		= {
++		.name	= SIFIVE_SERIAL_NAME,
++		.of_match_table = of_match_ptr(sifive_serial_of_match),
++	},
++};
++
++static int __init sifive_serial_init(void)
++{
++	struct tty_driver *tty_drv;
++	int r;
++
++	r = uart_register_driver(&sifive_serial_uart_driver);
++	if (r) goto init_out1;
++
++	tty_drv = sifive_serial_uart_driver.tty_driver;
++	if (!tty_drv) goto init_out2;
++
++	/* change default terminal settings for SiFive uarts */
++	tty_drv->init_termios.c_cflag = B115200 | CS8 | CREAD | HUPCL | CLOCAL;
++	tty_drv->init_termios.c_ispeed = 115200;
++	tty_drv->init_termios.c_ospeed = 115200;
++
++	r = platform_driver_register(&sifive_serial_platform_driver);
++	if (r) goto init_out2;
++
++	return 0;
++
++init_out2:
++	uart_unregister_driver(&sifive_serial_uart_driver);
++init_out1:
++	return r;
++}
++
++static void __exit sifive_serial_exit(void)
++{
++	platform_driver_unregister(&sifive_serial_platform_driver);
++	uart_unregister_driver(&sifive_serial_uart_driver);
++}
++
++module_init(sifive_serial_init);
++module_exit(sifive_serial_exit);
++
++MODULE_DESCRIPTION("SiFive UART serial driver");
++MODULE_LICENSE("GPL");
++MODULE_AUTHOR("Paul Walmsley <paul@pwsan.com>");
+diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
+index 7f0c7303575e..d1648a12c331 100644
+--- a/include/linux/mtd/spi-nor.h
++++ b/include/linux/mtd/spi-nor.h
+@@ -23,6 +23,7 @@
+ #define SNOR_MFR_ATMEL		CFI_MFR_ATMEL
+ #define SNOR_MFR_GIGADEVICE	0xc8
+ #define SNOR_MFR_INTEL		CFI_MFR_INTEL
++#define SNOR_MFR_ISSI		0x9d
+ #define SNOR_MFR_MICRON		CFI_MFR_ST /* ST Micro <--> Micron */
+ #define SNOR_MFR_MACRONIX	CFI_MFR_MACRONIX
+ #define SNOR_MFR_SPANSION	CFI_MFR_AMD
+@@ -121,6 +122,7 @@
+ #define SR_BP0			BIT(2)	/* Block protect 0 */
+ #define SR_BP1			BIT(3)	/* Block protect 1 */
+ #define SR_BP2			BIT(4)	/* Block protect 2 */
++#define SR_BP3			BIT(5)	/* Block protect 3 (on ISSI chips) */
+ #define SR_TB			BIT(5)	/* Top/Bottom protect */
+ #define SR_SRWD			BIT(7)	/* SR write protect */
+ /* Spansion/Cypress specific status bits */
+diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
+index dce5f9dae121..86973c385414 100644
+--- a/include/uapi/linux/serial_core.h
++++ b/include/uapi/linux/serial_core.h
+@@ -281,4 +281,7 @@
+ /* MediaTek BTIF */
+ #define PORT_MTK_BTIF	117
+ 
++/* SiFive UART */
++#define PORT_SIFIVE_H5U	118
++
+ #endif /* _UAPILINUX_SERIAL_CORE_H */
+-- 
+2.19.1
+
diff --git a/board/sifive/u540-unleashed/linux.config.fragment b/board/sifive/u540-unleashed/linux.config.fragment
new file mode 100644
index 0000000000..c73a3d3cc3
--- /dev/null
+++ b/board/sifive/u540-unleashed/linux.config.fragment
@@ -0,0 +1,652 @@
+CONFIG_AFS_FS=m
+CONFIG_AF_RXRPC=m
+CONFIG_AUTOFS4_FS=m
+CONFIG_AUTOFS_FS=m
+CONFIG_BLK_DEV_NVME=y
+# CONFIG_BLK_DEV_SR is not set
+CONFIG_BLK_DEV_ZONED=y
+CONFIG_CLK_GEMGXL_MGMT=y
+CONFIG_CLK_U54_PRCI=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CONFIGFS_FS=m
+CONFIG_CRC7=y
+CONFIG_CRC_ITU_T=y
+CONFIG_CRYPTO_AEAD=y
+CONFIG_CRYPTO_DRBG=y
+CONFIG_CRYPTO_DRBG_MENU=y
+CONFIG_CRYPTO_ECHAINIV=y
+CONFIG_CRYPTO_FCRYPT=m
+CONFIG_CRYPTO_HMAC=y
+CONFIG_CRYPTO_JITTERENTROPY=y
+CONFIG_CRYPTO_MANAGER=y
+CONFIG_CRYPTO_NULL=y
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_RNG=y
+CONFIG_CRYPTO_RNG_DEFAULT=y
+CONFIG_CRYPTO_SHA256=y
+# CONFIG_CRYPTO_USER_API_HASH is not set
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_SECTION_MISMATCH=y
+CONFIG_DEFAULT_HOSTNAME="riscv"
+CONFIG_DRM_AMDGPU=y
+CONFIG_EEPROM_AT24=y
+CONFIG_EMBEDDED=y
+CONFIG_EXPORTFS_BLOCK_OPS=y
+CONFIG_EXT3_FS=y
+CONFIG_EXTRA_FIRMWARE="radeon/BTC_rlc.bin radeon/CAICOS_mc.bin radeon/CAICOS_me.bin radeon/CAICOS_pfp.bin radeon/CAICOS_smc.bin radeon/SUMO_uvd.bin"
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_RADEON=y
+CONFIG_FUSE_FS=m
+CONFIG_GPIOLIB=y
+CONFIG_GRACE_PERIOD=m
+CONFIG_HID_PID=y
+CONFIG_HOTPLUG_PCI=y
+# CONFIG_HVC_RISCV_SBI is not set
+CONFIG_HZ=100
+CONFIG_HZ_100=y
+# CONFIG_HZ_250 is not set
+CONFIG_I2C_OCORES=y
+CONFIG_I2C_STUB=m
+CONFIG_INPUT_EVBUG=m
+CONFIG_INPUT_EVDEV=y
+CONFIG_INPUT_JOYDEV=m
+CONFIG_LCD_CLASS_DEVICE=y
+CONFIG_LIBCRC32C=m
+CONFIG_LOCALVERSION="-sifive-1"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_LOCKD=m
+CONFIG_LOGO=y
+CONFIG_MMC=y
+CONFIG_MOUSE_APPLETOUCH=m
+CONFIG_MOUSE_BCM5974=m
+CONFIG_MOUSE_PS2=m
+CONFIG_MTD=y
+CONFIG_NEW_LEDS=y
+CONFIG_NFSD=m
+CONFIG_NFS_FS=m
+CONFIG_NFS_SWAP=y
+CONFIG_NFS_V2=m
+CONFIG_NFS_V3=m
+# CONFIG_NFS_V4 is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
+CONFIG_NVMEM=y
+CONFIG_NVME_FC=y
+CONFIG_OID_REGISTRY=m
+CONFIG_PARTITION_ADVANCED=y
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIE_MICROSEMI=y
+CONFIG_PCI_DEBUG=y
+CONFIG_PCI_IOV=y
+CONFIG_PCI_PASID=y
+CONFIG_PCI_PRI=y
+CONFIG_PLUGIN_HOSTCC=""
+CONFIG_PMBUS=y
+CONFIG_POWER_RESET=y
+CONFIG_PPS=y
+CONFIG_PTP_1588_CLOCK=y
+CONFIG_PWM=y
+CONFIG_RCU_TRACE=y
+CONFIG_SATA_SIL24=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_SERIAL_SIFIVE=y
+CONFIG_SOUND=y
+CONFIG_SPI=y
+CONFIG_STACKTRACE=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_SUNRPC=m
+CONFIG_SUNRPC_GSS=m
+CONFIG_USB_ACM=m
+CONFIG_USB_EHCI_ROOT_HUB_TT=y
+CONFIG_USB_GADGET=y
+CONFIG_USB_HIDDEV=y
+# CONFIG_USB_OHCI_HCD is not set
+CONFIG_USB_SERIAL=m
+CONFIG_USB_STORAGE=m
+# CONFIG_USB_UAS is not set
+CONFIG_VIRTIO_CONSOLE=y
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_AFS_DEBUG is not set
+# CONFIG_AFS_DEBUG_CURSOR is not set
+# CONFIG_AF_RXRPC_DEBUG is not set
+# CONFIG_AF_RXRPC_INJECT_LOSS is not set
+# CONFIG_AF_RXRPC_IPV6 is not set
+# CONFIG_AIX_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_BACKLIGHT_GPIO is not set
+# CONFIG_BACKLIGHT_LM3630A is not set
+# CONFIG_BACKLIGHT_LP855X is not set
+# CONFIG_BACKLIGHT_PWM is not set
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_CHARGER_BQ24257 is not set
+# CONFIG_CHARGER_BQ24735 is not set
+# CONFIG_CHARGER_BQ25890 is not set
+# CONFIG_CHARGER_GPIO is not set
+# CONFIG_CHARGER_LTC3651 is not set
+# CONFIG_CHARGER_RT9455 is not set
+CONFIG_CHASH=y
+# CONFIG_CHASH_SELFTEST is not set
+# CONFIG_CHASH_STATS is not set
+CONFIG_CMDLINE="earlyprintk console=ttySIF0"
+# CONFIG_CMDLINE_FORCE is not set
+# CONFIG_CMDLINE_PARTITION is not set
+# CONFIG_COMMON_CLK_PWM is not set
+# CONFIG_CUSE is not set
+# CONFIG_DEBUG_GPIO is not set
+CONFIG_DEBUG_INFO_DWARF4=y
+# CONFIG_DEBUG_INFO_REDUCED is not set
+CONFIG_DEBUG_INFO_SPLIT=y
+# CONFIG_DEBUG_KERNEL_DC is not set
+# CONFIG_DLM is not set
+# CONFIG_DRM_AMDGPU_CIK is not set
+# CONFIG_DRM_AMDGPU_SI is not set
+# CONFIG_DRM_AMDGPU_USERPTR is not set
+CONFIG_DRM_AMD_ACP=y
+CONFIG_DRM_AMD_DC=y
+# CONFIG_DRM_PANEL_ILITEK_IL9322 is not set
+# CONFIG_DRM_PANEL_LG_LG4573 is not set
+# CONFIG_DRM_PANEL_SAMSUNG_LD9040 is not set
+# CONFIG_DRM_PANEL_SITRONIX_ST7789V is not set
+CONFIG_DRM_SCHED=y
+# CONFIG_EEPROM_93XX46 is not set
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_ENCX24J600 is not set
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"
+# CONFIG_EZX_PCAP is not set
+CONFIG_FB_BACKLIGHT=y
+CONFIG_FB_DDC=y
+CONFIG_FB_RADEON_BACKLIGHT=y
+# CONFIG_FB_RADEON_DEBUG is not set
+CONFIG_FB_RADEON_I2C=y
+# CONFIG_FB_SSD1307 is not set
+# CONFIG_FTL is not set
+# CONFIG_GDB_SCRIPTS is not set
+CONFIG_GPIOLIB_FASTPATH_LIMIT=512
+CONFIG_GPIOLIB_IRQCHIP=y
+# CONFIG_GPIO_74X164 is not set
+# CONFIG_GPIO_74XX_MMIO is not set
+# CONFIG_GPIO_ADNP is not set
+# CONFIG_GPIO_ADP5588 is not set
+# CONFIG_GPIO_ALTERA is not set
+# CONFIG_GPIO_BT8XX is not set
+# CONFIG_GPIO_DWAPB is not set
+# CONFIG_GPIO_EXAR is not set
+# CONFIG_GPIO_FTGPIO010 is not set
+# CONFIG_GPIO_GENERIC_PLATFORM is not set
+# CONFIG_GPIO_GRGPIO is not set
+# CONFIG_GPIO_HLWD is not set
+# CONFIG_GPIO_MAX3191X is not set
+# CONFIG_GPIO_MAX7300 is not set
+# CONFIG_GPIO_MAX7301 is not set
+# CONFIG_GPIO_MAX732X is not set
+# CONFIG_GPIO_MB86S7X is not set
+# CONFIG_GPIO_MC33880 is not set
+# CONFIG_GPIO_MOCKUP is not set
+# CONFIG_GPIO_PCA953X is not set
+# CONFIG_GPIO_PCF857X is not set
+# CONFIG_GPIO_PCIE_IDIO_24 is not set
+# CONFIG_GPIO_PCI_IDIO_16 is not set
+# CONFIG_GPIO_PISOSR is not set
+# CONFIG_GPIO_RDC321X is not set
+CONFIG_GPIO_SIFIVE=y
+CONFIG_GPIO_SYSFS=y
+# CONFIG_GPIO_TPIC2810 is not set
+# CONFIG_GPIO_XILINX is not set
+# CONFIG_GPIO_XRA1403 is not set
+# CONFIG_HID_ASUS is not set
+# CONFIG_HID_BIGBEN_FF is not set
+# CONFIG_HID_CORSAIR is not set
+# CONFIG_HID_ELAN is not set
+# CONFIG_HID_GT683R is not set
+# CONFIG_HID_LED is not set
+# CONFIG_HID_PRODIKEYS is not set
+# CONFIG_HID_SONY is not set
+# CONFIG_HID_THINGM is not set
+# CONFIG_HID_WIIMOTE is not set
+CONFIG_HOTPLUG_PCI_CPCI=y
+CONFIG_HOTPLUG_PCI_PCIE=y
+CONFIG_HOTPLUG_PCI_SHPC=y
+# CONFIG_HTC_I2CPLD is not set
+# CONFIG_I2C_CBUS_GPIO is not set
+# CONFIG_I2C_GPIO is not set
+# CONFIG_INFTL is not set
+CONFIG_INPUT_LEDS=y
+# CONFIG_JFFS2_FS is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_KEYBOARD_GPIO is not set
+# CONFIG_KEYBOARD_GPIO_POLLED is not set
+# CONFIG_KEYBOARD_LM8323 is not set
+# CONFIG_KEYBOARD_MATRIX is not set
+# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
+# CONFIG_KS8851 is not set
+# CONFIG_LATTICE_ECP3_CONFIG is not set
+# CONFIG_LCD_AMS369FG06 is not set
+# CONFIG_LCD_HX8357 is not set
+# CONFIG_LCD_ILI922X is not set
+# CONFIG_LCD_ILI9320 is not set
+# CONFIG_LCD_L4F00242T03 is not set
+# CONFIG_LCD_LMS283GF05 is not set
+# CONFIG_LCD_LMS501KF03 is not set
+# CONFIG_LCD_LTV350QV is not set
+# CONFIG_LCD_OTM3225A is not set
+# CONFIG_LCD_TDO24M is not set
+# CONFIG_LCD_VGG2432A4 is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_LEDS_AN30259A is not set
+# CONFIG_LEDS_BCM6328 is not set
+# CONFIG_LEDS_BCM6358 is not set
+# CONFIG_LEDS_BD2802 is not set
+# CONFIG_LEDS_BLINKM is not set
+# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
+CONFIG_LEDS_CLASS=y
+# CONFIG_LEDS_CLASS_FLASH is not set
+# CONFIG_LEDS_CR0014114 is not set
+# CONFIG_LEDS_DAC124S085 is not set
+# CONFIG_LEDS_GPIO is not set
+# CONFIG_LEDS_IS31FL319X is not set
+# CONFIG_LEDS_IS31FL32XX is not set
+# CONFIG_LEDS_LM3530 is not set
+# CONFIG_LEDS_LM355x is not set
+# CONFIG_LEDS_LM3642 is not set
+# CONFIG_LEDS_LM3692X is not set
+# CONFIG_LEDS_LP3944 is not set
+# CONFIG_LEDS_LP3952 is not set
+# CONFIG_LEDS_LP5521 is not set
+# CONFIG_LEDS_LP5523 is not set
+# CONFIG_LEDS_LP5562 is not set
+# CONFIG_LEDS_LP8501 is not set
+# CONFIG_LEDS_LP8860 is not set
+# CONFIG_LEDS_LT3593 is not set
+# CONFIG_LEDS_MLXREG is not set
+# CONFIG_LEDS_PCA9532 is not set
+# CONFIG_LEDS_PCA955X is not set
+# CONFIG_LEDS_PCA963X is not set
+CONFIG_LEDS_PWM=y
+# CONFIG_LEDS_TCA6507 is not set
+# CONFIG_LEDS_TLC591XX is not set
+CONFIG_LEDS_TRIGGERS=y
+# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_CAMERA is not set
+# CONFIG_LEDS_TRIGGER_CPU is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+# CONFIG_LEDS_TRIGGER_DISK is not set
+# CONFIG_LEDS_TRIGGER_GPIO is not set
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+# CONFIG_LEDS_TRIGGER_MTD is not set
+# CONFIG_LEDS_TRIGGER_NETDEV is not set
+# CONFIG_LEDS_TRIGGER_ONESHOT is not set
+CONFIG_LEDS_TRIGGER_PANIC=y
+# CONFIG_LEDS_TRIGGER_PATTERN is not set
+# CONFIG_LEDS_TRIGGER_TIMER is not set
+# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
+# CONFIG_LEDS_USER is not set
+# CONFIG_LED_TRIGGER_PHY is not set
+CONFIG_LOGO_LINUX_CLUT224=y
+CONFIG_LOGO_LINUX_MONO=y
+CONFIG_LOGO_LINUX_VGA16=y
+# CONFIG_MAC_PARTITION is not set
+# CONFIG_MDIO_BUS_MUX_GPIO is not set
+# CONFIG_MFD_AAT2870_CORE is not set
+# CONFIG_MFD_ARIZONA_SPI is not set
+CONFIG_MFD_CORE=y
+# CONFIG_MFD_CPCAP is not set
+# CONFIG_MFD_DA9052_SPI is not set
+# CONFIG_MFD_MC13XXX_SPI is not set
+# CONFIG_MFD_TPS65910 is not set
+# CONFIG_MFD_TPS65912_SPI is not set
+# CONFIG_MFD_WM831X_SPI is not set
+# CONFIG_MICREL_KS8995MA is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+# CONFIG_MMC_CB710 is not set
+# CONFIG_MMC_CQHCI is not set
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_MTK is not set
+# CONFIG_MMC_SDHCI is not set
+CONFIG_MMC_SPI=y
+# CONFIG_MMC_TEST is not set
+# CONFIG_MMC_TIFM_SD is not set
+# CONFIG_MMC_TOSHIBA_PCI is not set
+# CONFIG_MMC_USDHI6ROL0 is not set
+# CONFIG_MMC_USHC is not set
+# CONFIG_MMC_VIA_SDMMC is not set
+# CONFIG_MMC_VUB300 is not set
+# CONFIG_MOUSE_GPIO is not set
+# CONFIG_MTD_ABSENT is not set
+# CONFIG_MTD_AR7_PARTS is not set
+CONFIG_MTD_BLKDEVS=y
+# CONFIG_MTD_BLOCK is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+CONFIG_MTD_BLOCK_RO=y
+# CONFIG_MTD_CFI is not set
+CONFIG_MTD_CFI_I1=y
+CONFIG_MTD_CFI_I2=y
+# CONFIG_MTD_CMDLINE_PARTS is not set
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_DOCG3 is not set
+# CONFIG_MTD_INTEL_VR_NOR is not set
+# CONFIG_MTD_JEDECPROBE is not set
+# CONFIG_MTD_LPDDR is not set
+CONFIG_MTD_M25P80=y
+CONFIG_MTD_MAP_BANK_WIDTH_1=y
+CONFIG_MTD_MAP_BANK_WIDTH_2=y
+CONFIG_MTD_MAP_BANK_WIDTH_4=y
+# CONFIG_MTD_MCHP23K256 is not set
+# CONFIG_MTD_MT81xx_NOR is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_NAND is not set
+CONFIG_MTD_OF_PARTS=y
+# CONFIG_MTD_ONENAND is not set
+# CONFIG_MTD_OOPS is not set
+# CONFIG_MTD_PARTITIONED_MASTER is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_PLATRAM is not set
+# CONFIG_MTD_PMC551 is not set
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_SPI_NAND is not set
+CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
+# CONFIG_MTD_SST25L is not set
+# CONFIG_MTD_SWAP is not set
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_UBI is not set
+CONFIG_NET_PTP_CLASSIFY=y
+CONFIG_NFSD_BLOCKLAYOUT=y
+CONFIG_NFSD_FLEXFILELAYOUT=y
+CONFIG_NFSD_PNFS=y
+CONFIG_NFSD_SCSILAYOUT=y
+CONFIG_NFSD_V2_ACL=y
+CONFIG_NFSD_V3=y
+CONFIG_NFSD_V3_ACL=y
+CONFIG_NFSD_V4=y
+CONFIG_NFS_ACL_SUPPORT=m
+# CONFIG_NFTL is not set
+# CONFIG_NTP_PPS is not set
+CONFIG_NVME_CORE=y
+CONFIG_NVME_FABRICS=y
+# CONFIG_NVME_MULTIPATH is not set
+CONFIG_NVME_TARGET=m
+# CONFIG_NVME_TARGET_FC is not set
+# CONFIG_NVME_TARGET_LOOP is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_OF_GPIO=y
+# CONFIG_OSF_PARTITION is not set
+CONFIG_PCIEAER=y
+# CONFIG_PCIEAER_INJECT is not set
+CONFIG_PCIEASPM=y
+# CONFIG_PCIEASPM_DEBUG is not set
+CONFIG_PCIEASPM_DEFAULT=y
+# CONFIG_PCIEASPM_PERFORMANCE is not set
+# CONFIG_PCIEASPM_POWERSAVE is not set
+# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
+CONFIG_PCIE_DPC=y
+CONFIG_PCIE_ECRC=y
+CONFIG_PCIE_PTM=y
+CONFIG_PCI_ATS=y
+# CONFIG_PCI_PF_STUB is not set
+CONFIG_PCI_REALLOC_ENABLE_AUTO=y
+# CONFIG_POWER_RESET_GPIO is not set
+CONFIG_POWER_RESET_GPIO_RESTART=y
+# CONFIG_POWER_RESET_LTC2952 is not set
+# CONFIG_POWER_RESET_RESTART is not set
+# CONFIG_POWER_RESET_SYSCON is not set
+# CONFIG_POWER_RESET_SYSCON_POWEROFF is not set
+# CONFIG_PPS_CLIENT_GPIO is not set
+# CONFIG_PPS_CLIENT_KTIMER is not set
+# CONFIG_PPS_CLIENT_LDISC is not set
+# CONFIG_PPS_DEBUG is not set
+# CONFIG_PWM_FSL_FTM is not set
+# CONFIG_PWM_PCA9685 is not set
+CONFIG_PWM_SIFIVE=y
+CONFIG_PWM_SYSFS=y
+CONFIG_PWRSEQ_EMMC=y
+CONFIG_PWRSEQ_SIMPLE=y
+# CONFIG_QCA7000_SPI is not set
+CONFIG_REGMAP=y
+CONFIG_REGMAP_I2C=y
+# CONFIG_RFD_FTL is not set
+CONFIG_RXKAD=y
+# CONFIG_SDIO_UART is not set
+# CONFIG_SENSORS_AD7314 is not set
+# CONFIG_SENSORS_ADCXX is not set
+# CONFIG_SENSORS_ADM1275 is not set
+# CONFIG_SENSORS_ADS7871 is not set
+# CONFIG_SENSORS_ADT7310 is not set
+# CONFIG_SENSORS_GPIO_FAN is not set
+# CONFIG_SENSORS_IBM_CFFPS is not set
+# CONFIG_SENSORS_IR35221 is not set
+# CONFIG_SENSORS_LIS3_SPI is not set
+# CONFIG_SENSORS_LM25066 is not set
+# CONFIG_SENSORS_LM70 is not set
+# CONFIG_SENSORS_LTC2978 is not set
+# CONFIG_SENSORS_LTC3815 is not set
+# CONFIG_SENSORS_MAX1111 is not set
+# CONFIG_SENSORS_MAX16064 is not set
+# CONFIG_SENSORS_MAX20751 is not set
+# CONFIG_SENSORS_MAX31722 is not set
+# CONFIG_SENSORS_MAX31785 is not set
+# CONFIG_SENSORS_MAX34440 is not set
+# CONFIG_SENSORS_MAX8688 is not set
+CONFIG_SENSORS_PMBUS=y
+# CONFIG_SENSORS_PWM_FAN is not set
+# CONFIG_SENSORS_SHT15 is not set
+# CONFIG_SENSORS_TPS40422 is not set
+# CONFIG_SENSORS_TPS53679 is not set
+# CONFIG_SENSORS_UCD9000 is not set
+# CONFIG_SENSORS_UCD9200 is not set
+# CONFIG_SENSORS_ZL6100 is not set
+# CONFIG_SERIAL_IFX6X60 is not set
+# CONFIG_SERIAL_MAX3100 is not set
+# CONFIG_SERIAL_MAX310X is not set
+CONFIG_SERIAL_SIFIVE_CONSOLE=y
+# CONFIG_SERIO_GPIO_PS2 is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_SM_FTL is not set
+CONFIG_SND=y
+# CONFIG_SND_AD1889 is not set
+# CONFIG_SND_ALOOP is not set
+# CONFIG_SND_ATIIXP is not set
+# CONFIG_SND_ATIIXP_MODEM is not set
+# CONFIG_SND_AU8810 is not set
+# CONFIG_SND_AU8820 is not set
+# CONFIG_SND_AU8830 is not set
+# CONFIG_SND_AW2 is not set
+# CONFIG_SND_BCD2000 is not set
+# CONFIG_SND_BT87X is not set
+# CONFIG_SND_CA0106 is not set
+# CONFIG_SND_CMIPCI is not set
+# CONFIG_SND_CS4281 is not set
+# CONFIG_SND_CS46XX is not set
+# CONFIG_SND_CTXFI is not set
+# CONFIG_SND_DARLA20 is not set
+# CONFIG_SND_DARLA24 is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_DRIVERS=y
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+# CONFIG_SND_ECHO3G is not set
+# CONFIG_SND_ENS1370 is not set
+# CONFIG_SND_ENS1371 is not set
+# CONFIG_SND_FM801 is not set
+# CONFIG_SND_GINA20 is not set
+# CONFIG_SND_GINA24 is not set
+# CONFIG_SND_HDA_INTEL is not set
+CONFIG_SND_HDA_PREALLOC_SIZE=64
+# CONFIG_SND_HDSP is not set
+# CONFIG_SND_HDSPM is not set
+CONFIG_SND_HWDEP=y
+# CONFIG_SND_ICE1724 is not set
+# CONFIG_SND_INDIGO is not set
+# CONFIG_SND_INDIGODJ is not set
+# CONFIG_SND_INDIGODJX is not set
+# CONFIG_SND_INDIGOIO is not set
+# CONFIG_SND_INDIGOIOX is not set
+# CONFIG_SND_INTEL8X0 is not set
+# CONFIG_SND_INTEL8X0M is not set
+# CONFIG_SND_KORG1212 is not set
+# CONFIG_SND_LAYLA20 is not set
+# CONFIG_SND_LAYLA24 is not set
+# CONFIG_SND_LOLA is not set
+# CONFIG_SND_LX6464ES is not set
+# CONFIG_SND_MIA is not set
+# CONFIG_SND_MIXART is not set
+# CONFIG_SND_MONA is not set
+# CONFIG_SND_MPU401 is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_NM256 is not set
+# CONFIG_SND_OSSEMUL is not set
+# CONFIG_SND_OXYGEN is not set
+CONFIG_SND_PCI=y
+CONFIG_SND_PCM=y
+CONFIG_SND_PCM_TIMER=y
+# CONFIG_SND_PCXHR is not set
+CONFIG_SND_PROC_FS=y
+CONFIG_SND_RAWMIDI=y
+# CONFIG_SND_RIPTIDE is not set
+# CONFIG_SND_RME32 is not set
+# CONFIG_SND_RME96 is not set
+# CONFIG_SND_RME9652 is not set
+# CONFIG_SND_SE6X is not set
+# CONFIG_SND_SEQUENCER is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_SOC is not set
+CONFIG_SND_SPI=y
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_TIMER=y
+CONFIG_SND_USB=y
+# CONFIG_SND_USB_6FIRE is not set
+CONFIG_SND_USB_AUDIO=y
+# CONFIG_SND_USB_CAIAQ is not set
+# CONFIG_SND_USB_HIFACE is not set
+# CONFIG_SND_USB_POD is not set
+# CONFIG_SND_USB_PODHD is not set
+# CONFIG_SND_USB_TONEPORT is not set
+# CONFIG_SND_USB_UA101 is not set
+# CONFIG_SND_USB_VARIAX is not set
+# CONFIG_SND_VERBOSE_PRINTK is not set
+CONFIG_SND_VERBOSE_PROCFS=y
+# CONFIG_SND_VIA82XX is not set
+# CONFIG_SND_VIA82XX_MODEM is not set
+# CONFIG_SND_VIRTUOSO is not set
+# CONFIG_SND_VX222 is not set
+# CONFIG_SND_YMFPCI is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_SPI_ALTERA is not set
+# CONFIG_SPI_AXI_SPI_ENGINE is not set
+CONFIG_SPI_BITBANG=y
+# CONFIG_SPI_CADENCE is not set
+# CONFIG_SPI_DEBUG is not set
+# CONFIG_SPI_DESIGNWARE is not set
+# CONFIG_SPI_FSL_SPI is not set
+# CONFIG_SPI_GPIO is not set
+CONFIG_SPI_LOOPBACK_TEST=m
+CONFIG_SPI_MASTER=y
+CONFIG_SPI_MEM=y
+# CONFIG_SPI_OC_TINY is not set
+# CONFIG_SPI_PXA2XX is not set
+# CONFIG_SPI_ROCKCHIP is not set
+# CONFIG_SPI_SC18IS602 is not set
+CONFIG_SPI_SIFIVE=y
+# CONFIG_SPI_SLAVE is not set
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_SPI_XCOMM is not set
+# CONFIG_SPI_XILINX is not set
+# CONFIG_SPI_ZYNQMP_GQSPI is not set
+# CONFIG_SSFDC is not set
+CONFIG_SUNRPC_SWAP=y
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+# CONFIG_TI_ST is not set
+# CONFIG_TPS65010 is not set
+CONFIG_TRACE_CLOCK=y
+CONFIG_TRACING_EVENTS_GPIO=y
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_USB_AMD5536UDC is not set
+# CONFIG_USB_BDC_UDC is not set
+# CONFIG_USB_CONFIGFS is not set
+# CONFIG_USB_DUMMY_HCD is not set
+# CONFIG_USB_EG20T is not set
+# CONFIG_USB_FOTG210_UDC is not set
+# CONFIG_USB_GADGET_DEBUG is not set
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
+CONFIG_USB_GADGET_VBUS_DRAW=2
+CONFIG_USB_GADGET_XILINX=m
+# CONFIG_USB_GOKU is not set
+# CONFIG_USB_GPIO_VBUS is not set
+# CONFIG_USB_GR_UDC is not set
+# CONFIG_USB_LEDS_TRIGGER_USBPORT is not set
+# CONFIG_USB_LED_TRIG is not set
+# CONFIG_USB_M66592 is not set
+# CONFIG_USB_MAX3421_HCD is not set
+# CONFIG_USB_MV_U3D is not set
+# CONFIG_USB_MV_UDC is not set
+# CONFIG_USB_NET2272 is not set
+# CONFIG_USB_NET2280 is not set
+# CONFIG_USB_PXA27X is not set
+# CONFIG_USB_R8A66597 is not set
+# CONFIG_USB_SERIAL_AIRCABLE is not set
+# CONFIG_USB_SERIAL_ARK3116 is not set
+# CONFIG_USB_SERIAL_BELKIN is not set
+# CONFIG_USB_SERIAL_CH341 is not set
+# CONFIG_USB_SERIAL_CP210X is not set
+# CONFIG_USB_SERIAL_CYBERJACK is not set
+# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
+# CONFIG_USB_SERIAL_DEBUG is not set
+# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
+# CONFIG_USB_SERIAL_EDGEPORT is not set
+# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
+# CONFIG_USB_SERIAL_EMPEG is not set
+# CONFIG_USB_SERIAL_F81232 is not set
+# CONFIG_USB_SERIAL_F8153X is not set
+CONFIG_USB_SERIAL_FTDI_SIO=m
+# CONFIG_USB_SERIAL_GARMIN is not set
+# CONFIG_USB_SERIAL_GENERIC is not set
+# CONFIG_USB_SERIAL_IPAQ is not set
+# CONFIG_USB_SERIAL_IPW is not set
+# CONFIG_USB_SERIAL_IR is not set
+# CONFIG_USB_SERIAL_IUU is not set
+# CONFIG_USB_SERIAL_KEYSPAN is not set
+# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
+# CONFIG_USB_SERIAL_KLSI is not set
+# CONFIG_USB_SERIAL_KOBIL_SCT is not set
+# CONFIG_USB_SERIAL_MCT_U232 is not set
+# CONFIG_USB_SERIAL_METRO is not set
+# CONFIG_USB_SERIAL_MOS7720 is not set
+# CONFIG_USB_SERIAL_MOS7840 is not set
+# CONFIG_USB_SERIAL_MXUPORT is not set
+# CONFIG_USB_SERIAL_NAVMAN is not set
+# CONFIG_USB_SERIAL_OMNINET is not set
+# CONFIG_USB_SERIAL_OPTICON is not set
+# CONFIG_USB_SERIAL_OPTION is not set
+# CONFIG_USB_SERIAL_OTI6858 is not set
+# CONFIG_USB_SERIAL_PL2303 is not set
+# CONFIG_USB_SERIAL_QCAUX is not set
+# CONFIG_USB_SERIAL_QT2 is not set
+# CONFIG_USB_SERIAL_QUALCOMM is not set
+# CONFIG_USB_SERIAL_SAFE is not set
+# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
+CONFIG_USB_SERIAL_SIMPLE=m
+# CONFIG_USB_SERIAL_SPCP8X5 is not set
+# CONFIG_USB_SERIAL_SSU100 is not set
+# CONFIG_USB_SERIAL_SYMBOL is not set
+# CONFIG_USB_SERIAL_TI is not set
+# CONFIG_USB_SERIAL_UPD78F0730 is not set
+# CONFIG_USB_SERIAL_VISOR is not set
+# CONFIG_USB_SERIAL_WHITEHEAT is not set
+# CONFIG_USB_SERIAL_WISHBONE is not set
+# CONFIG_USB_SERIAL_XIRCOM is not set
+# CONFIG_USB_SERIAL_XSENS_MT is not set
+# CONFIG_USB_SNP_UDC_PLAT is not set
diff --git a/board/sifive/u540-unleashed/post-image.sh b/board/sifive/u540-unleashed/post-image.sh
new file mode 100755
index 0000000000..c8e5682626
--- /dev/null
+++ b/board/sifive/u540-unleashed/post-image.sh
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+# When using a CPIO initramfs image as part of the kernel we
+# need to rebuild the riscv-pk (bbl) bootloader again after the
+# kernel has been rebuilt with the rootfs image.
+
+make riscv-pk-rebuild
+
+exit $?
diff --git a/board/sifive/u540-unleashed/readme.txt b/board/sifive/u540-unleashed/readme.txt
new file mode 100644
index 0000000000..3b2f42ca91
--- /dev/null
+++ b/board/sifive/u540-unleashed/readme.txt
@@ -0,0 +1,91 @@
+SiFive HiFive Unleashed
+=======================
+
+This file describes how to use the pre-defined Buildroot
+configuration for the SiFive HiFive Unleashed board.
+
+Further information about the HiFive Unleashed board can be found
+at https://www.sifive.com/boards/hifive-unleashed
+
+Introduction
+============
+
+The default board configuration (and these instructions) have
+been created to match the system produced by the Freedom Unleashed
+Software Development Kit as closely as possible. This is based on
+the freedom-u-sdk v1_0 release that can be found at
+https://github.com/sifive/freedom-u-sdk/tree/v1_0
+
+Building
+========
+
+Configure Buildroot using the default board configuration:
+
+  $ make sifive_u540_unleashed_defconfig
+
+Customise the build as necessary:
+
+  $ make menuconfig
+
+Start the build:
+
+  $ make
+
+Result of the build
+===================
+
+Once the build has finished you will have the following files:
+
+    output/images/
+    +-- bbl
+    +-- bbl.bin
+    +-- rootfs.cpio
+    +-- rootfs.cpio.gz
+    +-- rootfs.tar
+    +-- vmlinux
+    
+
+Creating a bootable SD card
+===========================
+
+At the current time the genimage utility (v10) used by Buildroot
+does not support GPT partitions which are required by the HiFive
+Unleashed FSBL. This means that a bootable SD card must be created
+manually using the instructions below.
+
+Create the partitions on the SD card:
+
+  $ sudo sgdisk --clear \
+        --new=1:2048:67583  \
+        --change-name=1:bootloader \
+        --typecode=1:2E54B353-1271-4842-806F-E436D6AF6985 \
+        --new=2:264192: \
+        --change-name=2:root \
+        --typecode=2:0FC63DAF-8483-4772-8E79-3D69D8477DE4 \
+        /dev/mmcblk0
+
+The first partition will contain the kernel and the combined rootfs
+ram disk image (bbl.bin). The second partition is just an empty
+Linux filesystem that can be used to expand or replace the initramfs
+image in the kernel.
+
+Copy the kernel and combined rootfs image to the SD card:
+
+  $ sudo dd if=output/images/bbl.bin of=/dev/mmcblk0p1 bs=4096
+
+Create an empty ext3 filesystem on the second partition:
+
+  $ sudo mkfs.ext3 /dev/mmcblk0p2
+
+Make sure that the all DIP switches are set to the off position for
+default boot mode (MSEL mode = 1111), insert the SD card and power
+up the board.
+
+Connect the USB cable and open minicom (/dev/ttyUSB1, 115200, 8N1).
+
+See the 'SiFive HiFive Unleashed Getting Started Guide' for
+more details (https://www.sifive.com/documentation).
+
+--
+
+Mark Corbin <mark.corbin@embecosm.com> April 2019
diff --git a/configs/sifive_u540_unleashed_defconfig b/configs/sifive_u540_unleashed_defconfig
new file mode 100644
index 0000000000..b56ae1b164
--- /dev/null
+++ b/configs/sifive_u540_unleashed_defconfig
@@ -0,0 +1,29 @@
+# Architecture
+BR2_riscv=y
+BR2_RISCV_64=y
+
+# Patches
+BR2_GLOBAL_PATCH_DIR="board/sifive/patches"
+
+# Linux headers same as kernel, a 4.20 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_20=y
+
+# System
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/sifive/u540-unleashed/post-image.sh"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.20.17"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/sifive/u540-unleashed/linux.config.fragment"
+BR2_LINUX_KERNEL_VMLINUX=y
+#BR2_LINUX_KERNEL_IMAGE=y
+
+# Bootloader
+BR2_TARGET_RISCV_PK=y
+
+# Filesystem
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_ROOTFS_INITRAMFS=y
-- 
2.19.1
