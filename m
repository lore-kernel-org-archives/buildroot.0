From: Dario Binacchi <dariobin@libero.it>
Date: Sun,  4 Jul 2021 16:11:04 +0200
Subject: [Buildroot] [PATCH 1/2] configs/stm32f469_disco: enable Linux DRM
 support
Message-ID: <20210704141106.1746-1-dariobin@libero.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch to be applied to the Kernel has been informally approved by
an ST maintainer as can be seen from [1] and [2].

After Linux boots, /dev/fb0 will be accessible. You can control the
brightness of the display after enabling the framebuffer by running the
following commands:

~ # echo 0 0 > /sys/class/graphics/fb0/pan
~ # echo 255 >/sys/class/backlight/40016c00.dsi.0/brightness

The brightness ranges from 0 to 255, as you can see running the
command:

~ # cat /sys/class/backlight/40016c00.dsi.0/max_brightness

[1] https://lore.kernel.org/patchwork/patch/1450524/
[2] https://lore.kernel.org/patchwork/patch/1450964/

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 .../stm32f469-disco/linux.fragment            |  7 +-
 ...-post-divisor-setup-for-I2S-SAI-PLLs.patch | 86 +++++++++++++++++++
 configs/stm32f469_disco_defconfig             |  1 +
 3 files changed, 93 insertions(+), 1 deletion(-)
 create mode 100644 board/stmicroelectronics/stm32f469-disco/patches/linux/0001-clk-stm32f4-fix-post-divisor-setup-for-I2S-SAI-PLLs.patch

diff --git a/board/stmicroelectronics/stm32f469-disco/linux.fragment b/board/stmicroelectronics/stm32f469-disco/linux.fragment
index 90f5e8a8ff..ffa4d6205f 100644
--- a/board/stmicroelectronics/stm32f469-disco/linux.fragment
+++ b/board/stmicroelectronics/stm32f469-disco/linux.fragment
@@ -1 +1,6 @@
-# CONFIG_XIP_KERNEL is not set
\ No newline at end of file
+# CONFIG_XIP_KERNEL is not set
+CONFIG_DRM=y
+CONFIG_DRM_STM=y
+CONFIG_DRM_STM_DSI=y
+CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
diff --git a/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-clk-stm32f4-fix-post-divisor-setup-for-I2S-SAI-PLLs.patch b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-clk-stm32f4-fix-post-divisor-setup-for-I2S-SAI-PLLs.patch
new file mode 100644
index 0000000000..34e398b81d
--- /dev/null
+++ b/board/stmicroelectronics/stm32f469-disco/patches/linux/0001-clk-stm32f4-fix-post-divisor-setup-for-I2S-SAI-PLLs.patch
@@ -0,0 +1,86 @@
+From 463c3a0cbf18fd1bdd2c9a3c370c484b6cab97b5 Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dariobin@libero.it>
+Date: Mon, 21 Jun 2021 23:40:47 +0200
+Subject: [PATCH v2] clk: stm32f4: fix post divisor setup for I2S/SAI PLLs
+
+Enabling the framebuffer leads to a system hang. Running, as a debug
+hack, the store_pan() function in drivers/video/fbdev/core/fbsysfs.c
+without taking the console_lock, allows to see the crash backtrace on
+the serial line.
+
+~ # echo 0 0 > /sys/class/graphics/fb0/pan
+
+[    9.719414] Unhandled exception: IPSR = 00000005 LR = fffffff1
+[    9.726937] CPU: 0 PID: 49 Comm: sh Not tainted 5.13.0-rc5 #9
+[    9.733008] Hardware name: STM32 (Device Tree Support)
+[    9.738296] PC is at clk_gate_is_enabled+0x0/0x28
+[    9.743426] LR is at stm32f4_pll_div_set_rate+0xf/0x38
+[    9.748857] pc : [<0011e4be>]    lr : [<0011f9e3>]    psr: 0100000b
+[    9.755373] sp : 00bc7be0  ip : 00000000  fp : 001f3ac4
+[    9.760812] r10: 002610d0  r9 : 01efe920  r8 : 00540560
+[    9.766269] r7 : 02e7ddb0  r6 : 0173eed8  r5 : 00000000  r4 : 004027c0
+[    9.773081] r3 : 0011e4bf  r2 : 02e7ddb0  r1 : 0173eed8  r0 : 1d3267b8
+[    9.779911] xPSR: 0100000b
+[    9.782719] CPU: 0 PID: 49 Comm: sh Not tainted 5.13.0-rc5 #9
+[    9.788791] Hardware name: STM32 (Device Tree Support)
+[    9.794120] [<0000afa1>] (unwind_backtrace) from [<0000a33f>] (show_stack+0xb/0xc)
+[    9.802421] [<0000a33f>] (show_stack) from [<0000a8df>] (__invalid_entry+0x4b/0x4c)
+
+The `pll_num' field in the post_div_data configuration contained a wrong
+value which also referenced an uninitialized hardware clock when
+clk_register_pll_div() was called.
+
+Fixes: 517633ef630e ("clk: stm32f4: Add post divisor for I2S & SAI PLLs")
+Signed-off-by: Dario Binacchi <dariobin@libero.it>
+
+---
+
+Changes in v2:
+- Change  'u8 pll_num' from 'stm32f4_pll_post_div_data' structure into
+  'int pll_idx'.
+
+ drivers/clk/clk-stm32f4.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
+index 18117ce5ff85..5c75e3d906c2 100644
+--- a/drivers/clk/clk-stm32f4.c
++++ b/drivers/clk/clk-stm32f4.c
+@@ -526,7 +526,7 @@ struct stm32f4_pll {
+ 
+ struct stm32f4_pll_post_div_data {
+ 	int idx;
+-	u8 pll_num;
++	int pll_idx;
+ 	const char *name;
+ 	const char *parent;
+ 	u8 flag;
+@@ -557,13 +557,13 @@ static const struct clk_div_table post_divr_table[] = {
+ 
+ #define MAX_POST_DIV 3
+ static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
+-	{ CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
++	{ CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
+ 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},
+ 
+-	{ CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
++	{ CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
+ 		CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },
+ 
+-	{ NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
++	{ NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
+ 		STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
+ };
+ 
+@@ -1774,7 +1774,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
+ 				post_div->width,
+ 				post_div->flag_div,
+ 				post_div->div_table,
+-				clks[post_div->pll_num],
++				clks[post_div->pll_idx],
+ 				&stm32f4_clk_lock);
+ 
+ 		if (post_div->idx != NO_IDX)
+-- 
+2.17.1
+
diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index e538a664e2..1440aefd95 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_m4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh board/stmicroelectronics/stm32f469-disco/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/stmicroelectronics/stm32f469-disco/genimage.cfg"
-- 
2.17.1
