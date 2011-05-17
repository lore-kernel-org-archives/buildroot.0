From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Tue, 17 May 2011 08:55:51 +0200
Subject: [Buildroot] [PATCH] board: mini2440: Add custom patches and configs
	for 2.6.38 kernel series.
Message-ID: <1305615351-8516-1-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mini2440 board have except some patches full support in 2.6.38 kernel.
Just add custom patches and adapt default config to have possibility to
build kernel and barebox.

Barebox also need some patches but currently it't impossible to do so
just select latest v2011.05.0 where mini2440 have full support. There is
difference between 64M boards and >128MB boards.

Patches for kernel was overtaken from pengutronix OSELAS BSP for mini2440.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 ...40_mini2440_Add_support_for_new_LCD_panels.diff |   65 +
 ...i2440_Add_touchscreen_support_for_mini2440.diff |   69 +
 ...440_mini2440_Select_touchscreen_by_default.diff |   20 +
 ...e_leds-gpio_driver_for_board_leds_handling.diff |  173 +++
 ...005-Drop_exporting_s3c24xx_ts_set_platdata.diff |   29 +
 .../mini2440/0006-fix_gpio_register.diff           |   40 +
 .../mini2440/0007-speed_up_NAND_mounting.diff      |   35 +
 .../friendlyarm/mini2440/0008-make_all_const.diff  |   26 +
 ...009-PATCH_1_1_nand_Fix_S3C_NAND_clock_stop.diff |  165 +++
 .../mini2440/0010-remove_device_file.diff          |   21 +
 .../mini2440/0011-make_debug_decision_const.diff   |   65 +
 .../friendlyarm/mini2440/0012-just_a_cleanup.diff  |   67 +
 .../0013-enable_screen_without_console.diff        |   25 +
 board/friendlyarm/mini2440/0014-add_hwmon.diff     |  108 ++
 board/friendlyarm/mini2440/linux-2.6.32.2.config   | 1409 --------------------
 configs/mini2440_defconfig                         |  634 +++++++++-
 16 files changed, 1524 insertions(+), 1427 deletions(-)
 create mode 100644 board/friendlyarm/mini2440/0001-PATCH_1_4_s3c2440_mini2440_Add_support_for_new_LCD_panels.diff
 create mode 100644 board/friendlyarm/mini2440/0002-PATCH_2_4_s3c2440_mini2440_Add_touchscreen_support_for_mini2440.diff
 create mode 100644 board/friendlyarm/mini2440/0003-PATCH_3_4_s3c2440_mini2440_Select_touchscreen_by_default.diff
 create mode 100644 board/friendlyarm/mini2440/0004-PATCH_4_4_s3c2440_mini2440_Use_leds-gpio_driver_for_board_leds_handling.diff
 create mode 100644 board/friendlyarm/mini2440/0005-Drop_exporting_s3c24xx_ts_set_platdata.diff
 create mode 100644 board/friendlyarm/mini2440/0006-fix_gpio_register.diff
 create mode 100644 board/friendlyarm/mini2440/0007-speed_up_NAND_mounting.diff
 create mode 100644 board/friendlyarm/mini2440/0008-make_all_const.diff
 create mode 100644 board/friendlyarm/mini2440/0009-PATCH_1_1_nand_Fix_S3C_NAND_clock_stop.diff
 create mode 100644 board/friendlyarm/mini2440/0010-remove_device_file.diff
 create mode 100644 board/friendlyarm/mini2440/0011-make_debug_decision_const.diff
 create mode 100644 board/friendlyarm/mini2440/0012-just_a_cleanup.diff
 create mode 100644 board/friendlyarm/mini2440/0013-enable_screen_without_console.diff
 create mode 100644 board/friendlyarm/mini2440/0014-add_hwmon.diff
 delete mode 100644 board/friendlyarm/mini2440/linux-2.6.32.2.config

diff --git a/board/friendlyarm/mini2440/0001-PATCH_1_4_s3c2440_mini2440_Add_support_for_new_LCD_panels.diff b/board/friendlyarm/mini2440/0001-PATCH_1_4_s3c2440_mini2440_Add_support_for_new_LCD_panels.diff
new file mode 100644
index 0000000..fe6a62a
--- /dev/null
+++ b/board/friendlyarm/mini2440/0001-PATCH_1_4_s3c2440_mini2440_Add_support_for_new_LCD_panels.diff
@@ -0,0 +1,65 @@
+From: Marek Belisko <marek.belisko@open-nandra.com>
+Subject: [PATCH 1/4] s3c2440: mini2440: Add support for new LCD panels.
+
+This patch add support for new mini2440 board LCD's:
+3.5" TFT + TS (TD035STED4)
+5.6" TFT (Innolux AT056TN52).
+3.5" TFT + TS (SONY X35)
+
+Values overtaken from mini2440 kernel:
+git://repo.or.cz/linux-2.6/mini2440.git
+and https://github.com/a1ien/mini2440-linux-kernel
+
+Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
+---
+ arch/arm/mach-s3c2440/mach-mini2440.c |   37 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 37 insertions(+)
+
+Index: linux-2.6.38/arch/arm/mach-s3c2440/mach-mini2440.c
+===================================================================
+--- linux-2.6.38.orig/arch/arm/mach-s3c2440/mach-mini2440.c
++++ linux-2.6.38/arch/arm/mach-s3c2440/mach-mini2440.c
+@@ -185,6 +185,43 @@ static struct s3c2410fb_display mini2440
+ 		.lcdcon5	= (S3C2410_LCDCON5_FRM565 |
+ 				   S3C2410_LCDCON5_HWSWP),
+ 	},
++	[3] = {	/* mini2440 + 3.5" TFT + TS -- New model as Nov 2009 "T35" */
++		_LCD_DECLARE(
++			7,			/* The 3.5 is quite fast */
++			240, 21, 25, 6,		/* x timing */
++			320, 2, 4, 2,		/* y timing */
++			40),			/* refresh rate */
++		.lcdcon5	= (S3C2410_LCDCON5_FRM565 |
++				   S3C2410_LCDCON5_INVVLINE |
++				   S3C2410_LCDCON5_INVVFRAME |
++				   S3C2410_LCDCON5_INVVDEN |
++				   S3C2410_LCDCON5_PWREN),
++	},
++	[4] = { /* mini2440 + 5.6" TFT + touchscreen -- Innolux AT056TN52 */
++		/* be sure the "power" jumper is set accordingly ! */
++		_LCD_DECLARE(
++			10,			/* the 5.3" runs slower */
++			640, 41, 68, 22,	/* x timing */
++			480, 26, 6, 2,		/* y timing */
++			40),			/* refresh rate */
++		.lcdcon5	= (S3C2410_LCDCON5_FRM565 |
++				   S3C2410_LCDCON5_INVVLINE |
++				   S3C2410_LCDCON5_INVVFRAME |
++				   S3C2410_LCDCON5_PWREN),
++	},
++	[5] = { /* mini2440 + 3,5" TFT + touchscreen -- SONY X35 */
++		_LCD_DECLARE(
++			7,
++			240, 1, 26, 5,		/* x timing */
++			320, 1, 5, 9,		/* y timing */
++			60),			/* refresh rate */
++		.lcdcon5	= (S3C2410_LCDCON5_FRM565 |
++					S3C2410_LCDCON5_INVVDEN |
++					S3C2410_LCDCON5_INVVFRAME |
++					S3C2410_LCDCON5_INVVLINE |
++					S3C2410_LCDCON5_INVVCLK |
++					S3C2410_LCDCON5_HWSWP),
++	},
+ };
+ 
+ /* todo - put into gpio header */
diff --git a/board/friendlyarm/mini2440/0002-PATCH_2_4_s3c2440_mini2440_Add_touchscreen_support_for_mini2440.diff b/board/friendlyarm/mini2440/0002-PATCH_2_4_s3c2440_mini2440_Add_touchscreen_support_for_mini2440.diff
new file mode 100644
index 0000000..fb4311c
--- /dev/null
+++ b/board/friendlyarm/mini2440/0002-PATCH_2_4_s3c2440_mini2440_Add_touchscreen_support_for_mini2440.diff
@@ -0,0 +1,69 @@
+From: Marek Belisko <marek.belisko@open-nandra.com>
+Subject: [PATCH 2/4] s3c2440: mini2440: Add touchscreen support for mini2440.
+
+Patch add support for mini2440 touchscreen.
+Some code borrowed from:
+git://repo.or.cz/linux-2.6/mini2440.git
+
+Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
+---
+ arch/arm/mach-s3c2440/mach-mini2440.c |   18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+Index: linux-2.6.38/arch/arm/mach-s3c2440/mach-mini2440.c
+===================================================================
+--- linux-2.6.38.orig/arch/arm/mach-s3c2440/mach-mini2440.c
++++ linux-2.6.38/arch/arm/mach-s3c2440/mach-mini2440.c
+@@ -47,6 +47,7 @@
+ #include <plat/iic.h>
+ #include <plat/mci.h>
+ #include <plat/udc.h>
++#include <plat/ts.h>
+ 
+ #include <linux/mtd/mtd.h>
+ #include <linux/mtd/nand.h>
+@@ -548,6 +549,12 @@ static struct platform_device uda1340_co
+ 		.id = -1,
+ };
+ 
++static struct s3c2410_ts_mach_info mini2440_ts_cfg __initdata = {
++	.delay = 10000,
++	.presc = 0xff, /* slow as we can go */
++	.oversampling_shift = 0,
++};
++
+ static struct platform_device *mini2440_devices[] __initdata = {
+ 	&s3c_device_ohci,
+ 	&s3c_device_wdt,
+@@ -566,6 +573,7 @@ static struct platform_device *mini2440_
+ 	&uda1340_codec,
+ 	&mini2440_audio,
+ 	&samsung_asoc_dma,
++	&s3c_device_adc,
+ };
+ 
+ static void __init mini2440_map_io(void)
+@@ -649,8 +657,13 @@ static void mini2440_parse_features(
+ 			features->done |= FEATURE_BACKLIGHT;
+ 			break;
+ 		case 't':
+-			printk(KERN_INFO "MINI2440: '%c' ignored, "
+-				"touchscreen not compiled in\n", f);
++			if (features->done & FEATURE_TOUCH)
++				printk(KERN_INFO "MINI2440: '%c' ignored, "
++					"touchscreen already set\n", f);
++			else
++				features->optional[features->count++] =
++						&s3c_device_ts;
++			features->done |= FEATURE_TOUCH;
+ 			break;
+ 		case 'c':
+ 			if (features->done & FEATURE_CAMERA)
+@@ -721,6 +734,7 @@ static void __init mini2440_init(void)
+ 	s3c24xx_mci_set_platdata(&mini2440_mmc_cfg);
+ 	s3c_nand_set_platdata(&mini2440_nand_info);
+ 	s3c_i2c0_set_platdata(NULL);
++	s3c24xx_ts_set_platdata(&mini2440_ts_cfg);
+ 
+ 	i2c_register_board_info(0, mini2440_i2c_devs,
+ 				ARRAY_SIZE(mini2440_i2c_devs));
diff --git a/board/friendlyarm/mini2440/0003-PATCH_3_4_s3c2440_mini2440_Select_touchscreen_by_default.diff b/board/friendlyarm/mini2440/0003-PATCH_3_4_s3c2440_mini2440_Select_touchscreen_by_default.diff
new file mode 100644
index 0000000..f4b726a
--- /dev/null
+++ b/board/friendlyarm/mini2440/0003-PATCH_3_4_s3c2440_mini2440_Select_touchscreen_by_default.diff
@@ -0,0 +1,20 @@
+From: Marek Belisko <marek.belisko@open-nandra.com>
+Subject: [PATCH 3/4] s3c2440: mini2440: Select touchscreen by default.
+
+Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
+---
+ arch/arm/mach-s3c2440/Kconfig |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-s3c2440/Kconfig b/arch/arm/mach-s3c2440/Kconfig
+index 50825a3..e713eea 100644
+--- a/arch/arm/mach-s3c2440/Kconfig
++++ b/arch/arm/mach-s3c2440/Kconfig
+@@ -186,6 +186,7 @@ config MACH_MINI2440
+ 	select LEDS_TRIGGER_BACKLIGHT
+ 	select S3C_DEV_NAND
+ 	select S3C_DEV_USB_HOST
++	select TOUCHSCREEN_S3C2410
+ 	help
+ 	  Say Y here to select support for the MINI2440. Is a 10cm x 10cm board
+ 	  available via various sources. It can come with a 3.5" or 7" touch LCD.
diff --git a/board/friendlyarm/mini2440/0004-PATCH_4_4_s3c2440_mini2440_Use_leds-gpio_driver_for_board_leds_handling.diff b/board/friendlyarm/mini2440/0004-PATCH_4_4_s3c2440_mini2440_Use_leds-gpio_driver_for_board_leds_handling.diff
new file mode 100644
index 0000000..c475f51
--- /dev/null
+++ b/board/friendlyarm/mini2440/0004-PATCH_4_4_s3c2440_mini2440_Use_leds-gpio_driver_for_board_leds_handling.diff
@@ -0,0 +1,173 @@
+From: Marek Belisko <marek.belisko@open-nandra.com>
+Subject: [PATCH] s3c2440: mini2440: Use leds-gpio driver for board leds
+
+Intention of this patch is convert existing usage of leds-s3c24xx driver
+to use generic gpio-leds driver. Leds are separated to 2 devices.
+First device handle 4 available leds. Second device is used to drive
+LCD backlight. Backlight can be controlled via parameter b so we need
+separate device which is registered or not depending on parameter.
+
+Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
+---
+ arch/arm/mach-s3c2440/mach-mini2440.c |  122 +++++++++++++++-------------------
+ 1 file changed, 54 insertions(+), 68 deletions(-)
+
+Index: linux-2.6.38/arch/arm/mach-s3c2440/mach-mini2440.c
+===================================================================
+--- linux-2.6.38.orig/arch/arm/mach-s3c2440/mach-mini2440.c
++++ linux-2.6.38/arch/arm/mach-s3c2440/mach-mini2440.c
+@@ -39,7 +39,6 @@
+ 
+ #include <plat/regs-serial.h>
+ #include <mach/regs-gpio.h>
+-#include <mach/leds-gpio.h>
+ #include <mach/regs-mem.h>
+ #include <mach/regs-lcd.h>
+ #include <mach/irqs.h>
+@@ -437,81 +436,71 @@ static struct platform_device mini2440_b
+ };
+ 
+ /* LEDS */
+-
+-static struct s3c24xx_led_platdata mini2440_led1_pdata = {
+-	.name		= "led1",
+-	.gpio		= S3C2410_GPB(5),
+-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
+-	.def_trigger	= "heartbeat",
+-};
+-
+-static struct s3c24xx_led_platdata mini2440_led2_pdata = {
+-	.name		= "led2",
+-	.gpio		= S3C2410_GPB(6),
+-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
+-	.def_trigger	= "nand-disk",
+-};
+-
+-static struct s3c24xx_led_platdata mini2440_led3_pdata = {
+-	.name		= "led3",
+-	.gpio		= S3C2410_GPB(7),
+-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
+-	.def_trigger	= "mmc0",
+-};
+-
+-static struct s3c24xx_led_platdata mini2440_led4_pdata = {
+-	.name		= "led4",
+-	.gpio		= S3C2410_GPB(8),
+-	.flags		= S3C24XX_LEDF_ACTLOW | S3C24XX_LEDF_TRISTATE,
+-	.def_trigger	= "",
+-};
+-
+-static struct s3c24xx_led_platdata mini2440_led_backlight_pdata = {
+-	.name		= "backlight",
+-	.gpio		= S3C2410_GPG(4),
+-	.def_trigger	= "backlight",
++static struct gpio_led gpio_leds[] = {
++	{
++		.name			= "led1",
++		.gpio			= S3C2410_GPB(5),
++		.active_low		= 1,
++		.default_trigger	= "heartbeat",
++	},
++	{
++		.name			= "led2",
++		.gpio			= S3C2410_GPB(6),
++		.active_low		= 1,
++		.default_trigger	= "nand-disk",
++		.default_state		= LEDS_GPIO_DEFSTATE_OFF,
++	},
++	{
++		.name			= "led3",
++		.gpio			= S3C2410_GPB(7),
++		.active_low		= 1,
++		.default_trigger	= "mmc0",
++		.default_state		= LEDS_GPIO_DEFSTATE_OFF,
++	},
++	{
++		.name			= "led4",
++		.gpio			= S3C2410_GPB(8),
++		.active_low		= 1,
++		.default_trigger	= "none",
++		.default_state		= LEDS_GPIO_DEFSTATE_OFF,
++	}
+ };
+ 
+-static struct platform_device mini2440_led1 = {
+-	.name		= "s3c24xx_led",
+-	.id		= 1,
+-	.dev		= {
+-		.platform_data	= &mini2440_led1_pdata,
+-	},
++static struct gpio_led backlight_led[] = {
++	{
++		.name			= "backlight",
++		.gpio			= S3C2410_GPG(4),
++		.active_low		= 0,
++		.default_trigger	= "backlight",
++		.default_state		= LEDS_GPIO_DEFSTATE_ON,
++	}
+ };
+ 
+-static struct platform_device mini2440_led2 = {
+-	.name		= "s3c24xx_led",
+-	.id		= 2,
+-	.dev		= {
+-		.platform_data	= &mini2440_led2_pdata,
+-	},
++static struct gpio_led_platform_data gpio_led_info = {
++	.leds		= gpio_leds,
++	.num_leds	= ARRAY_SIZE(gpio_leds),
+ };
+ 
+-static struct platform_device mini2440_led3 = {
+-	.name		= "s3c24xx_led",
+-	.id		= 3,
+-	.dev		= {
+-		.platform_data	= &mini2440_led3_pdata,
+-	},
++static struct gpio_led_platform_data backlight_info = {
++	.leds		= backlight_led,
++	.num_leds	= ARRAY_SIZE(backlight_led),
+ };
+ 
+-static struct platform_device mini2440_led4 = {
+-	.name		= "s3c24xx_led",
+-	.id		= 4,
+-	.dev		= {
+-		.platform_data	= &mini2440_led4_pdata,
+-	},
++static struct platform_device mini2440_leds = {
++	.name	= "leds-gpio",
++	.id	= 0,
++	.dev	= {
++		.platform_data	= &gpio_led_info,
++	}
+ };
+ 
+ static struct platform_device mini2440_led_backlight = {
+-	.name		= "s3c24xx_led",
+-	.id		= 5,
+-	.dev		= {
+-		.platform_data	= &mini2440_led_backlight_pdata,
+-	},
++	.name	= "leds-gpio",
++	.id	= 1,
++	.dev	= {
++		.platform_data	= &backlight_info,
++	}
+ };
+-
+ /* AUDIO */
+ 
+ static struct s3c24xx_uda134x_platform_data mini2440_audio_pins = {
+@@ -562,10 +551,7 @@ static struct platform_device *mini2440_
+ 	&s3c_device_rtc,
+ 	&s3c_device_usbgadget,
+ 	&mini2440_device_eth,
+-	&mini2440_led1,
+-	&mini2440_led2,
+-	&mini2440_led3,
+-	&mini2440_led4,
++	&mini2440_leds,
+ 	&mini2440_button_device,
+ 	&s3c_device_nand,
+ 	&s3c_device_sdi,
diff --git a/board/friendlyarm/mini2440/0005-Drop_exporting_s3c24xx_ts_set_platdata.diff b/board/friendlyarm/mini2440/0005-Drop_exporting_s3c24xx_ts_set_platdata.diff
new file mode 100644
index 0000000..9073fba
--- /dev/null
+++ b/board/friendlyarm/mini2440/0005-Drop_exporting_s3c24xx_ts_set_platdata.diff
@@ -0,0 +1,29 @@
+From axel.lin at gmail.com Mon Feb 14 03:49:27 2011
+Subject: [PATCH] ARM: SAMSUNG: Drop exporting s3c24xx_ts_set_platdata
+
+s3c24xx_ts_set_platdata is annotated __init and not used by any module,
+thus don't export it.
+This patch fixes below warning:
+
+WARNING: arch/arm/plat-samsung/built-in.o(__ksymtab+0x90): Section mismatch in reference from the variable __ksymtab_s3c24xx_ts_set_platdata to the function .init.text:s3c24xx_ts_set_platdata()
+The symbol s3c24xx_ts_set_platdata is exported and annotated __init
+Fix this by removing the __init annotation of s3c24xx_ts_set_platdata or drop the export.
+
+Signed-off-by: Axel Lin <axel.lin@gmail.com>
+---
+ arch/arm/plat-samsung/dev-ts.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: linux-2.6.37/arch/arm/plat-samsung/dev-ts.c
+===================================================================
+--- linux-2.6.37.orig/arch/arm/plat-samsung/dev-ts.c
++++ linux-2.6.37/arch/arm/plat-samsung/dev-ts.c
+@@ -43,7 +43,7 @@ struct platform_device s3c_device_ts = {
+ 	.resource	= s3c_ts_resource,
+ };
+ 
+-void __init s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *pd)
++void __devinit s3c24xx_ts_set_platdata(struct s3c2410_ts_mach_info *pd)
+ {
+ 	struct s3c2410_ts_mach_info *npd;
+ 
diff --git a/board/friendlyarm/mini2440/0006-fix_gpio_register.diff b/board/friendlyarm/mini2440/0006-fix_gpio_register.diff
new file mode 100644
index 0000000..d7169fd
--- /dev/null
+++ b/board/friendlyarm/mini2440/0006-fix_gpio_register.diff
@@ -0,0 +1,40 @@
+From: Juergen Beisert <jbe@pengutronix.de>
+Subject: Do not register more GPIOs the Soc supports
+
+This patch avoids the following kernel message:
+
+     gpiochip_add: gpios 288..303 (GPIOK) failed to register
+     gpiochip_add: gpios 320..334 (GPIOL) failed to register
+     gpiochip_add: gpios 352..353 (GPIOM) failed to register
+
+Note: This is a hack and valid only for the mini2440.
+
+Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
+
+---
+ arch/arm/plat-s3c24xx/gpiolib.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+Index: linux-2.6.37/arch/arm/plat-s3c24xx/gpiolib.c
+===================================================================
+--- linux-2.6.37.orig/arch/arm/plat-s3c24xx/gpiolib.c
++++ linux-2.6.37/arch/arm/plat-s3c24xx/gpiolib.c
+@@ -180,7 +180,9 @@ struct s3c_gpio_chip s3c24xx_gpios[] = {
+ 			.label			= "GPIOJ",
+ 			.ngpio			= 16,
+ 		},
+-	}, {
++	},
++#ifndef CONFIG_ARCH_S3C2410
++	{
+ 		.base	= S3C2443_GPKCON,
+ 		.pm	= __gpio_pm(&s3c_gpio_pm_2bit),
+ 		.chip	= {
+@@ -208,6 +210,7 @@ struct s3c_gpio_chip s3c24xx_gpios[] = {
+ 			.ngpio			= 2,
+ 		},
+ 	},
++#endif
+ };
+ 
+ 
diff --git a/board/friendlyarm/mini2440/0007-speed_up_NAND_mounting.diff b/board/friendlyarm/mini2440/0007-speed_up_NAND_mounting.diff
new file mode 100644
index 0000000..c0d4776
--- /dev/null
+++ b/board/friendlyarm/mini2440/0007-speed_up_NAND_mounting.diff
@@ -0,0 +1,35 @@
+From: Juergen Beisert <jbe@pengutronix.de>
+Subject: Speed up detecting the NAND
+
+Remove the 'NAND_SKIP_BBTSCAN' flag to prevent the driver from reading all
+OOB data of the flash. Without this flag it only reads a few pages with the
+flash based BBT.
+
+This is valid for small and large page NANDs.
+
+Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
+---
+ drivers/mtd/nand/s3c2410.c |   10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+Index: linux-2.6.37/drivers/mtd/nand/s3c2410.c
+===================================================================
+--- linux-2.6.37.orig/drivers/mtd/nand/s3c2410.c
++++ linux-2.6.37/drivers/mtd/nand/s3c2410.c
+@@ -861,10 +861,12 @@ static void s3c2410_nand_init_chip(struc
+ 	}
+ 
+ 	/* If you use u-boot BBT creation code, specifying this flag will
+-	 * let the kernel fish out the BBT from the NAND, and also skip the
+-	 * full NAND scan that can take 1/2s or so. Little things... */
+-	if (set->flash_bbt)
+-		chip->options |= NAND_USE_FLASH_BBT | NAND_SKIP_BBTSCAN;
++	 * let the kernel fish out the BBT from the NAND
++	 */
++	if (set->flash_bbt) {
++		dev_info(info->device, "Using flash based BBT\n");
++		chip->options |= NAND_USE_FLASH_BBT;
++	}
+ }
+ 
+ /**
diff --git a/board/friendlyarm/mini2440/0008-make_all_const.diff b/board/friendlyarm/mini2440/0008-make_all_const.diff
new file mode 100644
index 0000000..22f03b1
--- /dev/null
+++ b/board/friendlyarm/mini2440/0008-make_all_const.diff
@@ -0,0 +1,26 @@
+Nobody changes these variables afterwards. Make them 'const' to show it.
+---
+ drivers/mtd/nand/s3c2410.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: linux-2.6.37/drivers/mtd/nand/s3c2410.c
+===================================================================
+--- linux-2.6.37.orig/drivers/mtd/nand/s3c2410.c
++++ linux-2.6.37/drivers/mtd/nand/s3c2410.c
+@@ -49,13 +49,13 @@
+ #include <plat/nand.h>
+ 
+ #ifdef CONFIG_MTD_NAND_S3C2410_HWECC
+-static int hardware_ecc = 1;
++static const int hardware_ecc = 1;
+ #else
+-static int hardware_ecc = 0;
++static const int hardware_ecc = 0;
+ #endif
+ 
+ #ifdef CONFIG_MTD_NAND_S3C2410_CLKSTOP
+-static int clock_stop = 1;
++static const int clock_stop = 1;
+ #else
+ static const int clock_stop = 0;
+ #endif
diff --git a/board/friendlyarm/mini2440/0009-PATCH_1_1_nand_Fix_S3C_NAND_clock_stop.diff b/board/friendlyarm/mini2440/0009-PATCH_1_1_nand_Fix_S3C_NAND_clock_stop.diff
new file mode 100644
index 0000000..47d8682
--- /dev/null
+++ b/board/friendlyarm/mini2440/0009-PATCH_1_1_nand_Fix_S3C_NAND_clock_stop.diff
@@ -0,0 +1,165 @@
+From: Jiri Pinkava <jiri.pinkava@vscht.cz>
+Subject: [PATCH] nand: Fix S3C NAND clock stop
+
+Current implementation of s3c2410_nand_select_chip call
+clk_disable every time when chip = -1 (de-select). This happend
+multiple times even if chip was already de-selected. This causes
+disabling clock even if they are already disabled and due to
+nature of clock subsytem implementation this causes nand clock
+to be disabled and newer enabled again.
+
+Signed-off-by: Jiri Pinkava <jiri.pinkava@vscht.cz>
+---
+ drivers/mtd/nand/s3c2410.c |   57 +++++++++++++++++++++++++++++++++------------
+ 1 file changed, 42 insertions(+), 15 deletions(-)
+
+Index: linux-2.6.38/drivers/mtd/nand/s3c2410.c
+===================================================================
+--- linux-2.6.38.orig/drivers/mtd/nand/s3c2410.c
++++ linux-2.6.38/drivers/mtd/nand/s3c2410.c
+@@ -96,6 +96,12 @@ enum s3c_cpu_type {
+ 	TYPE_S3C2440,
+ };
+ 
++enum s3c_nand_clk_state {
++	CLOCK_DISABLE	= 0,
++	CLOCK_ENABLE,
++	CLOCK_SUSPEND,
++};
++
+ /* overview of the s3c2410 nand state */
+ 
+ /**
+@@ -111,6 +117,7 @@ enum s3c_cpu_type {
+  * @mtd_count: The number of MTDs created from this controller.
+  * @save_sel: The contents of @sel_reg to be saved over suspend.
+  * @clk_rate: The clock rate from @clk.
++ * @clk_state: The current clock state.
+  * @cpu_type: The exact type of this controller.
+  */
+ struct s3c2410_nand_info {
+@@ -129,6 +136,7 @@ struct s3c2410_nand_info {
+ 	int				mtd_count;
+ 	unsigned long			save_sel;
+ 	unsigned long			clk_rate;
++	enum s3c_nand_clk_state		clk_state;
+ 
+ 	enum s3c_cpu_type		cpu_type;
+ 
+@@ -159,11 +167,33 @@ static struct s3c2410_platform_nand *to_
+ 	return dev->dev.platform_data;
+ }
+ 
+-static inline int allow_clk_stop(struct s3c2410_nand_info *info)
++static inline int allow_clk_suspend(struct s3c2410_nand_info *info)
+ {
+ 	return clock_stop;
+ }
+ 
++/**
++ * s3c2410_nand_clk_set_state - Enable, disable or suspend NAND clock.
++ * @info: The controller instance.
++ * @new_state: State to which clock should be set.
++ */
++static void s3c2410_nand_clk_set_state(struct s3c2410_nand_info *info,
++		enum s3c_nand_clk_state new_state)
++{
++	if (!allow_clk_suspend(info) && new_state == CLOCK_SUSPEND)
++		return;
++
++	if (info->clk_state == CLOCK_ENABLE) {
++		if (new_state != CLOCK_ENABLE)
++			clk_disable(info->clk);
++	} else {
++		if (new_state == CLOCK_ENABLE)
++			clk_enable(info->clk);
++	}
++
++	info->clk_state = new_state;
++}
++
+ /* timing calculations */
+ 
+ #define NS_IN_KHZ 1000000
+@@ -333,8 +363,8 @@ static void s3c2410_nand_select_chip(str
+ 	nmtd = this->priv;
+ 	info = nmtd->info;
+ 
+-	if (chip != -1 && allow_clk_stop(info))
+-		clk_enable(info->clk);
++	if (chip != -1)
++		s3c2410_nand_clk_set_state(info, CLOCK_ENABLE);
+ 
+ 	cur = readl(info->sel_reg);
+ 
+@@ -356,8 +386,8 @@ static void s3c2410_nand_select_chip(str
+ 
+ 	writel(cur, info->sel_reg);
+ 
+-	if (chip == -1 && allow_clk_stop(info))
+-		clk_disable(info->clk);
++	if (chip == -1)
++		s3c2410_nand_clk_set_state(info, CLOCK_SUSPEND);
+ }
+ 
+ /* s3c2410_nand_hwcontrol
+@@ -694,8 +724,7 @@ static int s3c24xx_nand_remove(struct pl
+ 	/* free the common resources */
+ 
+ 	if (info->clk != NULL && !IS_ERR(info->clk)) {
+-		if (!allow_clk_stop(info))
+-			clk_disable(info->clk);
++		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
+ 		clk_put(info->clk);
+ 	}
+ 
+@@ -949,7 +978,7 @@ static int s3c24xx_nand_probe(struct pla
+ 		goto exit_error;
+ 	}
+ 
+-	clk_enable(info->clk);
++	s3c2410_nand_clk_set_state(info, CLOCK_ENABLE);
+ 
+ 	/* allocate and map the resource */
+ 
+@@ -1028,9 +1057,9 @@ static int s3c24xx_nand_probe(struct pla
+ 		goto exit_error;
+ 	}
+ 
+-	if (allow_clk_stop(info)) {
++	if (allow_clk_suspend(info)) {
+ 		dev_info(&pdev->dev, "clock idle support enabled\n");
+-		clk_disable(info->clk);
++		s3c2410_nand_clk_set_state(info, CLOCK_SUSPEND);
+ 	}
+ 
+ 	pr_debug("initialised ok\n");
+@@ -1061,8 +1090,7 @@ static int s3c24xx_nand_suspend(struct p
+ 
+ 		writel(info->save_sel | info->sel_bit, info->sel_reg);
+ 
+-		if (!allow_clk_stop(info))
+-			clk_disable(info->clk);
++		s3c2410_nand_clk_set_state(info, CLOCK_DISABLE);
+ 	}
+ 
+ 	return 0;
+@@ -1074,7 +1102,7 @@ static int s3c24xx_nand_resume(struct pl
+ 	unsigned long sel;
+ 
+ 	if (info) {
+-		clk_enable(info->clk);
++		s3c2410_nand_clk_set_state(info, CLOCK_ENABLE);
+ 		s3c2410_nand_inithw(info);
+ 
+ 		/* Restore the state of the nFCE line. */
+@@ -1084,8 +1112,7 @@ static int s3c24xx_nand_resume(struct pl
+ 		sel |= info->save_sel & info->sel_bit;
+ 		writel(sel, info->sel_reg);
+ 
+-		if (allow_clk_stop(info))
+-			clk_disable(info->clk);
++		s3c2410_nand_clk_set_state(info, CLOCK_SUSPEND);
+ 	}
+ 
+ 	return 0;
diff --git a/board/friendlyarm/mini2440/0010-remove_device_file.diff b/board/friendlyarm/mini2440/0010-remove_device_file.diff
new file mode 100644
index 0000000..2b5871b
--- /dev/null
+++ b/board/friendlyarm/mini2440/0010-remove_device_file.diff
@@ -0,0 +1,21 @@
+From: Juergen Beisert <jbe@pengutronix.de>
+Subject: s3c2410fb: Don't forget to remove the device attribute
+
+Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
+
+---
+ drivers/video/s3c2410fb.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+Index: linux-2.6.38/drivers/video/s3c2410fb.c
+===================================================================
+--- linux-2.6.38.orig/drivers/video/s3c2410fb.c
++++ linux-2.6.38/drivers/video/s3c2410fb.c
+@@ -1046,6 +1046,7 @@ static int __devexit s3c2410fb_remove(st
+ 
+ 	release_resource(info->mem);
+ 	kfree(info->mem);
++	device_remove_file(&pdev->dev, &dev_attr_debug);
+ 
+ 	platform_set_drvdata(pdev, NULL);
+ 	framebuffer_release(fbinfo);
diff --git a/board/friendlyarm/mini2440/0011-make_debug_decision_const.diff b/board/friendlyarm/mini2440/0011-make_debug_decision_const.diff
new file mode 100644
index 0000000..4ba47b9
--- /dev/null
+++ b/board/friendlyarm/mini2440/0011-make_debug_decision_const.diff
@@ -0,0 +1,65 @@
+From: Juergen Beisert <jbe@pengutronix.de>
+Subject: Remove useless code if debug is not enabled
+
+If one do not want to debug something, why still providing the code to do so?
+
+Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
+
+---
+ drivers/video/s3c2410fb.c |    9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+Index: linux-2.6.38/drivers/video/s3c2410fb.c
+===================================================================
+--- linux-2.6.38.orig/drivers/video/s3c2410fb.c
++++ linux-2.6.38/drivers/video/s3c2410fb.c
+@@ -45,7 +45,7 @@
+ #ifdef CONFIG_FB_S3C2410_DEBUG
+ static int debug	= 1;
+ #else
+-static int debug	= 0;
++static const int debug	= 0;
+ #endif
+ 
+ #define dprintk(msg...)	if (debug) { printk(KERN_DEBUG "s3c2410fb: " msg); }
+@@ -583,6 +583,7 @@ static int s3c2410fb_blank(int blank_mod
+ 	return 0;
+ }
+ 
++#ifdef CONFIG_FB_S3C2410_DEBUG
+ static int s3c2410fb_debug_show(struct device *dev,
+ 				struct device_attribute *attr, char *buf)
+ {
+@@ -612,6 +613,7 @@ static int s3c2410fb_debug_store(struct 
+ }
+ 
+ static DEVICE_ATTR(debug, 0666, s3c2410fb_debug_show, s3c2410fb_debug_store);
++#endif
+ 
+ static struct fb_ops s3c2410fb_ops = {
+ 	.owner		= THIS_MODULE,
+@@ -974,12 +976,13 @@ static int __devinit s3c24xxfb_probe(str
+ 		goto free_cpufreq;
+ 	}
+ 
++#ifdef CONFIG_FB_S3C2410_DEBUG
+ 	/* create device files */
+ 	ret = device_create_file(&pdev->dev, &dev_attr_debug);
+ 	if (ret) {
+ 		printk(KERN_ERR "failed to add debug attribute\n");
+ 	}
+-
++#endif
+ 	printk(KERN_INFO "fb%d: %s frame buffer device\n",
+ 		fbinfo->node, fbinfo->fix.id);
+ 
+@@ -1046,7 +1049,9 @@ static int __devexit s3c2410fb_remove(st
+ 
+ 	release_resource(info->mem);
+ 	kfree(info->mem);
++#ifdef CONFIG_FB_S3C2410_DEBUG
+ 	device_remove_file(&pdev->dev, &dev_attr_debug);
++#endif
+ 
+ 	platform_set_drvdata(pdev, NULL);
+ 	framebuffer_release(fbinfo);
diff --git a/board/friendlyarm/mini2440/0012-just_a_cleanup.diff b/board/friendlyarm/mini2440/0012-just_a_cleanup.diff
new file mode 100644
index 0000000..bdb0c6d
--- /dev/null
+++ b/board/friendlyarm/mini2440/0012-just_a_cleanup.diff
@@ -0,0 +1,67 @@
+From: Juergen Beisert <jbe@pengutronix.de>
+Subject: s3c2410fb: Just clean up the file
+
+Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
+
+---
+ drivers/video/s3c2410fb.c |   13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
+
+Index: linux-2.6.38/drivers/video/s3c2410fb.c
+===================================================================
+--- linux-2.6.38.orig/drivers/video/s3c2410fb.c
++++ linux-2.6.38/drivers/video/s3c2410fb.c
+@@ -769,7 +769,6 @@ static irqreturn_t s3c2410fb_irq(int irq
+ static int s3c2410fb_cpufreq_transition(struct notifier_block *nb,
+ 					unsigned long val, void *data)
+ {
+-	struct cpufreq_freqs *freqs = data;
+ 	struct s3c2410fb_info *info;
+ 	struct fb_info *fbinfo;
+ 	long delta_f;
+@@ -922,7 +921,7 @@ static int __devinit s3c24xxfb_probe(str
+ 
+ 	info->clk = clk_get(NULL, "lcd");
+ 	if (IS_ERR(info->clk)) {
+-		printk(KERN_ERR "failed to get lcd clock source\n");
++		dev_err(&pdev->dev, "failed to get lcd clock source\n");
+ 		ret = PTR_ERR(info->clk);
+ 		goto release_irq;
+ 	}
+@@ -948,7 +947,7 @@ static int __devinit s3c24xxfb_probe(str
+ 	/* Initialize video memory */
+ 	ret = s3c2410fb_map_video_memory(fbinfo);
+ 	if (ret) {
+-		printk(KERN_ERR "Failed to allocate video RAM: %d\n", ret);
++		dev_err(&pdev->dev, "Failed to allocate video RAM: %d\n", ret);
+ 		ret = -ENOMEM;
+ 		goto release_clock;
+ 	}
+@@ -971,7 +970,7 @@ static int __devinit s3c24xxfb_probe(str
+ 
+ 	ret = register_framebuffer(fbinfo);
+ 	if (ret < 0) {
+-		printk(KERN_ERR "Failed to register framebuffer device: %d\n",
++		dev_err(&pdev->dev, "Failed to register framebuffer device: %d\n",
+ 			ret);
+ 		goto free_cpufreq;
+ 	}
+@@ -980,15 +979,15 @@ static int __devinit s3c24xxfb_probe(str
+ 	/* create device files */
+ 	ret = device_create_file(&pdev->dev, &dev_attr_debug);
+ 	if (ret) {
+-		printk(KERN_ERR "failed to add debug attribute\n");
++		dev_err(&pdev->dev, "failed to add debug attribute\n");
+ 	}
+ #endif
+-	printk(KERN_INFO "fb%d: %s frame buffer device\n",
++	pr_info("fb%d: %s frame buffer device\n",
+ 		fbinfo->node, fbinfo->fix.id);
+ 
+ 	return 0;
+ 
+- free_cpufreq:
++free_cpufreq:
+ 	s3c2410fb_cpufreq_deregister(info);
+ free_video_memory:
+ 	s3c2410fb_unmap_video_memory(fbinfo);
diff --git a/board/friendlyarm/mini2440/0013-enable_screen_without_console.diff b/board/friendlyarm/mini2440/0013-enable_screen_without_console.diff
new file mode 100644
index 0000000..9f5069c
--- /dev/null
+++ b/board/friendlyarm/mini2440/0013-enable_screen_without_console.diff
@@ -0,0 +1,25 @@
+From: Juergen Beisert <jbe@pengutronix.de>
+Subject: Enable display even without graphics console
+
+If no graphics console is enabled the LCD gets not activated otherwise.
+
+Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
+
+---
+ drivers/video/s3c2410fb.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+Index: linux-2.6.38/drivers/video/s3c2410fb.c
+===================================================================
+--- linux-2.6.38.orig/drivers/video/s3c2410fb.c
++++ linux-2.6.38/drivers/video/s3c2410fb.c
+@@ -982,6 +982,9 @@ static int __devinit s3c24xxfb_probe(str
+ 		dev_err(&pdev->dev, "failed to add debug attribute\n");
+ 	}
+ #endif
++#ifndef CONFIG_FRAMEBUFFER_CONSOLE
++	s3c2410fb_set_par(fbinfo);
++#endif
+ 	pr_info("fb%d: %s frame buffer device\n",
+ 		fbinfo->node, fbinfo->fix.id);
+ 
diff --git a/board/friendlyarm/mini2440/0014-add_hwmon.diff b/board/friendlyarm/mini2440/0014-add_hwmon.diff
new file mode 100644
index 0000000..bed3333
--- /dev/null
+++ b/board/friendlyarm/mini2440/0014-add_hwmon.diff
@@ -0,0 +1,108 @@
+From: Juergen Beisert <jbe@pengutronix.de>
+Subject: Add hwmon capabilities to mini2440
+
+This adds the internal 8 ADC channels to the sysfs. They can be reached via:
+
+ /sys/devices/platform/s3c24xx-adc/s3c-hwmon
+
+Signed-off-by: Juergen Beisert <jbe@pengutronix.de>
+
+---
+ arch/arm/mach-s3c2440/Kconfig         |    1 
+ arch/arm/mach-s3c2440/mach-mini2440.c |   50 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 51 insertions(+)
+
+Index: linux-2.6.38/arch/arm/mach-s3c2440/mach-mini2440.c
+===================================================================
+--- linux-2.6.38.orig/arch/arm/mach-s3c2440/mach-mini2440.c
++++ linux-2.6.38/arch/arm/mach-s3c2440/mach-mini2440.c
+@@ -57,6 +57,7 @@
+ #include <plat/clock.h>
+ #include <plat/devs.h>
+ #include <plat/cpu.h>
++#include <plat/hwmon.h>
+ 
+ #include <sound/s3c24xx_uda134x.h>
+ 
+@@ -544,6 +545,53 @@ static struct s3c2410_ts_mach_info mini2
+ 	.oversampling_shift = 0,
+ };
+ 
++static struct s3c_hwmon_chcfg mini2440_adc_chcfg[8] = {
++	{
++		.name = "AIN0",	/* connected to CON4/5 and W1 */
++		.mult = 3300,
++		.div = 1023,
++	}, {
++		.name = "AIN1",	/* connected to CON4/6 */
++		.mult = 3300,
++		.div = 1023,
++	}, {
++		.name = "AIN2",	/* connected to CON4/7 */
++		.mult = 3300,
++		.div = 1023,
++	}, {
++		.name = "AIN3",	/* connected to CON4/8 */
++		.mult = 3300,
++		.div = 1023,
++	}, {
++		.name = "TSYM",
++		.mult = 3300,
++		.div = 1023,
++	}, {
++		.name = "TSYP",
++		.mult = 3300,
++		.div = 1023,
++	}, {
++		.name = "TSXM",
++		.mult = 3300,
++		.div = 1023,
++	}, {
++		.name = "TSXP",
++		.mult = 3300,
++		.div = 1023,
++	},
++};
++
++static struct s3c_hwmon_pdata mini2440_adc __initdata = {
++	.in[0] = &mini2440_adc_chcfg[0],
++	.in[1] = &mini2440_adc_chcfg[1],
++	.in[2] = &mini2440_adc_chcfg[2],
++	.in[3] = &mini2440_adc_chcfg[3],
++	.in[4] = &mini2440_adc_chcfg[4],
++	.in[5] = &mini2440_adc_chcfg[5],
++	.in[6] = &mini2440_adc_chcfg[6],
++	.in[7] = &mini2440_adc_chcfg[7],
++};
++
+ static struct platform_device *mini2440_devices[] __initdata = {
+ 	&s3c_device_ohci,
+ 	&s3c_device_wdt,
+@@ -560,6 +608,7 @@ static struct platform_device *mini2440_
+ 	&mini2440_audio,
+ 	&samsung_asoc_dma,
+ 	&s3c_device_adc,
++	&s3c_device_hwmon,
+ };
+ 
+ static void __init mini2440_map_io(void)
+@@ -721,6 +770,7 @@ static void __init mini2440_init(void)
+ 	s3c_nand_set_platdata(&mini2440_nand_info);
+ 	s3c_i2c0_set_platdata(NULL);
+ 	s3c24xx_ts_set_platdata(&mini2440_ts_cfg);
++	s3c_hwmon_set_platdata(&mini2440_adc);
+ 
+ 	i2c_register_board_info(0, mini2440_i2c_devs,
+ 				ARRAY_SIZE(mini2440_i2c_devs));
+Index: linux-2.6.38/arch/arm/mach-s3c2440/Kconfig
+===================================================================
+--- linux-2.6.38.orig/arch/arm/mach-s3c2440/Kconfig
++++ linux-2.6.38/arch/arm/mach-s3c2440/Kconfig
+@@ -187,6 +187,7 @@ config MACH_MINI2440
+ 	select S3C_DEV_NAND
+ 	select S3C_DEV_USB_HOST
+ 	select TOUCHSCREEN_S3C2410
++	select S3C_DEV_HWMON
+ 	help
+ 	  Say Y here to select support for the MINI2440. Is a 10cm x 10cm board
+ 	  available via various sources. It can come with a 3.5" or 7" touch LCD.
diff --git a/board/friendlyarm/mini2440/linux-2.6.32.2.config b/board/friendlyarm/mini2440/linux-2.6.32.2.config
deleted file mode 100644
index b0c383e..0000000
--- a/board/friendlyarm/mini2440/linux-2.6.32.2.config
+++ /dev/null
@@ -1,1409 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Linux kernel version: 2.6.32.2
-# Fri Jul  2 21:15:21 2010
-#
-CONFIG_ARM=y
-CONFIG_SYS_SUPPORTS_APM_EMULATION=y
-CONFIG_GENERIC_GPIO=y
-CONFIG_NO_IOPORT=y
-CONFIG_GENERIC_HARDIRQS=y
-CONFIG_STACKTRACE_SUPPORT=y
-CONFIG_HAVE_LATENCYTOP_SUPPORT=y
-CONFIG_LOCKDEP_SUPPORT=y
-CONFIG_TRACE_IRQFLAGS_SUPPORT=y
-CONFIG_HARDIRQS_SW_RESEND=y
-CONFIG_GENERIC_IRQ_PROBE=y
-CONFIG_RWSEM_GENERIC_SPINLOCK=y
-CONFIG_ARCH_HAS_CPUFREQ=y
-CONFIG_GENERIC_HWEIGHT=y
-CONFIG_GENERIC_CALIBRATE_DELAY=y
-CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=y
-CONFIG_VECTORS_BASE=0xffff0000
-CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
-CONFIG_CONSTRUCTORS=y
-
-#
-# General setup
-#
-CONFIG_EXPERIMENTAL=y
-CONFIG_BROKEN_ON_SMP=y
-CONFIG_INIT_ENV_ARG_LIMIT=32
-CONFIG_LOCALVERSION="-FriendlyARM"
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_SWAP=y
-CONFIG_SYSVIPC=y
-CONFIG_SYSVIPC_SYSCTL=y
-# CONFIG_POSIX_MQUEUE is not set
-# CONFIG_BSD_PROCESS_ACCT is not set
-# CONFIG_TASKSTATS is not set
-# CONFIG_AUDIT is not set
-
-#
-# RCU Subsystem
-#
-CONFIG_TREE_RCU=y
-# CONFIG_TREE_PREEMPT_RCU is not set
-# CONFIG_RCU_TRACE is not set
-CONFIG_RCU_FANOUT=32
-# CONFIG_RCU_FANOUT_EXACT is not set
-# CONFIG_TREE_RCU_TRACE is not set
-# CONFIG_IKCONFIG is not set
-CONFIG_LOG_BUF_SHIFT=17
-# CONFIG_GROUP_SCHED is not set
-# CONFIG_CGROUPS is not set
-# CONFIG_SYSFS_DEPRECATED_V2 is not set
-# CONFIG_RELAY is not set
-# CONFIG_NAMESPACES is not set
-# CONFIG_BLK_DEV_INITRD is not set
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SYSCTL=y
-CONFIG_ANON_INODES=y
-CONFIG_EMBEDDED=y
-CONFIG_UID16=y
-CONFIG_SYSCTL_SYSCALL=y
-CONFIG_KALLSYMS=y
-# CONFIG_KALLSYMS_EXTRA_PASS is not set
-CONFIG_HOTPLUG=y
-CONFIG_PRINTK=y
-CONFIG_BUG=y
-CONFIG_ELF_CORE=y
-CONFIG_BASE_FULL=y
-CONFIG_FUTEX=y
-CONFIG_EPOLL=y
-CONFIG_SIGNALFD=y
-CONFIG_TIMERFD=y
-CONFIG_EVENTFD=y
-CONFIG_SHMEM=y
-CONFIG_AIO=y
-
-#
-# Kernel Performance Events And Counters
-#
-CONFIG_VM_EVENT_COUNTERS=y
-CONFIG_SLUB_DEBUG=y
-# CONFIG_COMPAT_BRK is not set
-# CONFIG_SLAB is not set
-CONFIG_SLUB=y
-# CONFIG_SLOB is not set
-# CONFIG_PROFILING is not set
-CONFIG_HAVE_OPROFILE=y
-CONFIG_HAVE_KPROBES=y
-CONFIG_HAVE_KRETPROBES=y
-CONFIG_HAVE_CLK=y
-
-#
-# GCOV-based kernel profiling
-#
-CONFIG_SLOW_WORK=y
-CONFIG_HAVE_GENERIC_DMA_COHERENT=y
-CONFIG_SLABINFO=y
-CONFIG_RT_MUTEXES=y
-CONFIG_BASE_SMALL=0
-# CONFIG_MODULES is not set
-CONFIG_BLOCK=y
-CONFIG_LBDAF=y
-CONFIG_BLK_DEV_BSG=y
-# CONFIG_BLK_DEV_INTEGRITY is not set
-
-#
-# IO Schedulers
-#
-CONFIG_IOSCHED_NOOP=y
-# CONFIG_IOSCHED_AS is not set
-# CONFIG_IOSCHED_DEADLINE is not set
-# CONFIG_IOSCHED_CFQ is not set
-# CONFIG_DEFAULT_AS is not set
-# CONFIG_DEFAULT_DEADLINE is not set
-# CONFIG_DEFAULT_CFQ is not set
-CONFIG_DEFAULT_NOOP=y
-CONFIG_DEFAULT_IOSCHED="noop"
-# CONFIG_FREEZER is not set
-
-#
-# System Type
-#
-CONFIG_MMU=y
-# CONFIG_ARCH_AAEC2000 is not set
-# CONFIG_ARCH_INTEGRATOR is not set
-# CONFIG_ARCH_REALVIEW is not set
-# CONFIG_ARCH_VERSATILE is not set
-# CONFIG_ARCH_AT91 is not set
-# CONFIG_ARCH_CLPS711X is not set
-# CONFIG_ARCH_GEMINI is not set
-# CONFIG_ARCH_EBSA110 is not set
-# CONFIG_ARCH_EP93XX is not set
-# CONFIG_ARCH_FOOTBRIDGE is not set
-# CONFIG_ARCH_MXC is not set
-# CONFIG_ARCH_STMP3XXX is not set
-# CONFIG_ARCH_NETX is not set
-# CONFIG_ARCH_H720X is not set
-# CONFIG_ARCH_NOMADIK is not set
-# CONFIG_ARCH_IOP13XX is not set
-# CONFIG_ARCH_IOP32X is not set
-# CONFIG_ARCH_IOP33X is not set
-# CONFIG_ARCH_IXP23XX is not set
-# CONFIG_ARCH_IXP2000 is not set
-# CONFIG_ARCH_IXP4XX is not set
-# CONFIG_ARCH_L7200 is not set
-# CONFIG_ARCH_KIRKWOOD is not set
-# CONFIG_ARCH_LOKI is not set
-# CONFIG_ARCH_MV78XX0 is not set
-# CONFIG_ARCH_ORION5X is not set
-# CONFIG_ARCH_MMP is not set
-# CONFIG_ARCH_KS8695 is not set
-# CONFIG_ARCH_NS9XXX is not set
-# CONFIG_ARCH_W90X900 is not set
-# CONFIG_ARCH_PNX4008 is not set
-# CONFIG_ARCH_PXA is not set
-# CONFIG_ARCH_MSM is not set
-# CONFIG_ARCH_RPC is not set
-# CONFIG_ARCH_SA1100 is not set
-CONFIG_ARCH_S3C2410=y
-# CONFIG_ARCH_S3C64XX is not set
-# CONFIG_ARCH_S5PC1XX is not set
-# CONFIG_ARCH_SHARK is not set
-# CONFIG_ARCH_LH7A40X is not set
-# CONFIG_ARCH_U300 is not set
-# CONFIG_ARCH_DAVINCI is not set
-# CONFIG_ARCH_OMAP is not set
-# CONFIG_ARCH_BCMRING is not set
-CONFIG_PLAT_S3C24XX=y
-CONFIG_S3C2410_CLOCK=y
-CONFIG_CPU_S3C244X=y
-CONFIG_S3C2440_XTAL_12000000=y
-# CONFIG_S3C24XX_PWM is not set
-CONFIG_S3C24XX_GPIO_EXTRA=0
-CONFIG_S3C2410_DMA=y
-# CONFIG_S3C2410_DMA_DEBUG is not set
-CONFIG_S3C24XX_ADC=y
-CONFIG_PLAT_S3C=y
-CONFIG_CPU_LLSERIAL_S3C2440_ONLY=y
-CONFIG_CPU_LLSERIAL_S3C2440=y
-
-#
-# Boot options
-#
-# CONFIG_S3C_BOOT_WATCHDOG is not set
-# CONFIG_S3C_BOOT_ERROR_RESET is not set
-CONFIG_S3C_BOOT_UART_FORCE_FIFO=y
-
-#
-# Power management
-#
-CONFIG_S3C_LOWLEVEL_UART_PORT=0
-CONFIG_S3C_GPIO_SPACE=0
-CONFIG_S3C_DMA=y
-CONFIG_S3C_DEV_USB_HOST=y
-CONFIG_S3C_DEV_NAND=y
-
-#
-# S3C2400 Machines
-#
-CONFIG_S3C2410_GPIO=y
-
-#
-# S3C2410 Machines
-#
-# CONFIG_ARCH_SMDK2410 is not set
-# CONFIG_ARCH_H1940 is not set
-# CONFIG_MACH_N30 is not set
-# CONFIG_ARCH_BAST is not set
-# CONFIG_MACH_OTOM is not set
-# CONFIG_MACH_AML_M5900 is not set
-# CONFIG_MACH_TCT_HAMMER is not set
-# CONFIG_MACH_VR1000 is not set
-# CONFIG_MACH_QT2410 is not set
-
-#
-# S3C2412 Machines
-#
-# CONFIG_MACH_JIVE is not set
-# CONFIG_MACH_SMDK2413 is not set
-# CONFIG_MACH_SMDK2412 is not set
-# CONFIG_MACH_VSTMS is not set
-CONFIG_CPU_S3C2440=y
-CONFIG_S3C2440_DMA=y
-
-#
-# S3C2440 Machines
-#
-# CONFIG_MACH_ANUBIS is not set
-# CONFIG_MACH_OSIRIS is not set
-# CONFIG_MACH_RX3715 is not set
-# CONFIG_ARCH_S3C2440 is not set
-# CONFIG_MACH_NEXCODER_2440 is not set
-# CONFIG_MACH_AT2440EVB is not set
-CONFIG_MACH_MINI2440=y
-
-#
-# S3C2442 Machines
-#
-# CONFIG_MACH_NEO1973_GTA02 is not set
-
-#
-# S3C2443 Machines
-#
-# CONFIG_MACH_SMDK2443 is not set
-
-#
-# Processor Type
-#
-CONFIG_CPU_32=y
-CONFIG_CPU_ARM920T=y
-CONFIG_CPU_32v4T=y
-CONFIG_CPU_ABRT_EV4T=y
-CONFIG_CPU_PABRT_LEGACY=y
-CONFIG_CPU_CACHE_V4WT=y
-CONFIG_CPU_CACHE_VIVT=y
-CONFIG_CPU_COPY_V4WB=y
-CONFIG_CPU_TLB_V4WBI=y
-CONFIG_CPU_CP15=y
-CONFIG_CPU_CP15_MMU=y
-
-#
-# Processor Features
-#
-# CONFIG_ARM_THUMB is not set
-# CONFIG_CPU_ICACHE_DISABLE is not set
-# CONFIG_CPU_DCACHE_DISABLE is not set
-# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
-CONFIG_ARM_L1_CACHE_SHIFT=5
-
-#
-# Bus support
-#
-# CONFIG_PCI_SYSCALL is not set
-# CONFIG_ARCH_SUPPORTS_MSI is not set
-# CONFIG_PCCARD is not set
-
-#
-# Kernel Features
-#
-CONFIG_VMSPLIT_3G=y
-# CONFIG_VMSPLIT_2G is not set
-# CONFIG_VMSPLIT_1G is not set
-CONFIG_PAGE_OFFSET=0xC0000000
-# CONFIG_PREEMPT_NONE is not set
-CONFIG_PREEMPT_VOLUNTARY=y
-# CONFIG_PREEMPT is not set
-CONFIG_HZ=200
-CONFIG_AEABI=y
-# CONFIG_OABI_COMPAT is not set
-# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
-# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
-# CONFIG_HIGHMEM is not set
-CONFIG_SELECT_MEMORY_MODEL=y
-CONFIG_FLATMEM_MANUAL=y
-# CONFIG_DISCONTIGMEM_MANUAL is not set
-# CONFIG_SPARSEMEM_MANUAL is not set
-CONFIG_FLATMEM=y
-CONFIG_FLAT_NODE_MEM_MAP=y
-CONFIG_PAGEFLAGS_EXTENDED=y
-CONFIG_SPLIT_PTLOCK_CPUS=4096
-# CONFIG_PHYS_ADDR_T_64BIT is not set
-CONFIG_ZONE_DMA_FLAG=0
-CONFIG_VIRT_TO_BUS=y
-CONFIG_HAVE_MLOCK=y
-CONFIG_HAVE_MLOCKED_PAGE_BIT=y
-# CONFIG_KSM is not set
-CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
-CONFIG_ALIGNMENT_TRAP=y
-# CONFIG_UACCESS_WITH_MEMCPY is not set
-
-#
-# Boot options
-#
-CONFIG_ZBOOT_ROM_TEXT=0
-CONFIG_ZBOOT_ROM_BSS=0
-CONFIG_CMDLINE=""
-# CONFIG_XIP_KERNEL is not set
-# CONFIG_KEXEC is not set
-
-#
-# CPU Power Management
-#
-# CONFIG_CPU_FREQ is not set
-# CONFIG_CPU_IDLE is not set
-
-#
-# Floating point emulation
-#
-
-#
-# At least one emulation must be selected
-#
-
-#
-# Userspace binary formats
-#
-CONFIG_BINFMT_ELF=y
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_HAVE_AOUT=y
-# CONFIG_BINFMT_AOUT is not set
-# CONFIG_BINFMT_MISC is not set
-
-#
-# Power management options
-#
-# CONFIG_PM is not set
-CONFIG_ARCH_SUSPEND_POSSIBLE=y
-CONFIG_NET=y
-
-#
-# Networking options
-#
-CONFIG_PACKET=y
-# CONFIG_PACKET_MMAP is not set
-CONFIG_UNIX=y
-CONFIG_XFRM=y
-# CONFIG_XFRM_USER is not set
-# CONFIG_XFRM_SUB_POLICY is not set
-# CONFIG_XFRM_MIGRATE is not set
-# CONFIG_XFRM_STATISTICS is not set
-CONFIG_NET_KEY=y
-# CONFIG_NET_KEY_MIGRATE is not set
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-# CONFIG_IP_ADVANCED_ROUTER is not set
-CONFIG_IP_FIB_HASH=y
-# CONFIG_IP_PNP is not set
-# CONFIG_NET_IPIP is not set
-# CONFIG_NET_IPGRE is not set
-# CONFIG_IP_MROUTE is not set
-# CONFIG_ARPD is not set
-# CONFIG_SYN_COOKIES is not set
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-# CONFIG_INET_XFRM_TUNNEL is not set
-# CONFIG_INET_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
-# CONFIG_INET_LRO is not set
-# CONFIG_INET_DIAG is not set
-# CONFIG_TCP_CONG_ADVANCED is not set
-CONFIG_TCP_CONG_CUBIC=y
-CONFIG_DEFAULT_TCP_CONG="cubic"
-# CONFIG_TCP_MD5SIG is not set
-# CONFIG_IPV6 is not set
-# CONFIG_NETWORK_SECMARK is not set
-# CONFIG_NETFILTER is not set
-# CONFIG_IP_DCCP is not set
-# CONFIG_IP_SCTP is not set
-# CONFIG_RDS is not set
-# CONFIG_TIPC is not set
-# CONFIG_ATM is not set
-# CONFIG_BRIDGE is not set
-# CONFIG_NET_DSA is not set
-# CONFIG_VLAN_8021Q is not set
-# CONFIG_DECNET is not set
-# CONFIG_LLC2 is not set
-# CONFIG_IPX is not set
-# CONFIG_ATALK is not set
-# CONFIG_X25 is not set
-# CONFIG_LAPB is not set
-# CONFIG_ECONET is not set
-# CONFIG_WAN_ROUTER is not set
-# CONFIG_PHONET is not set
-# CONFIG_IEEE802154 is not set
-# CONFIG_NET_SCHED is not set
-# CONFIG_DCB is not set
-
-#
-# Network testing
-#
-# CONFIG_NET_PKTGEN is not set
-# CONFIG_HAMRADIO is not set
-# CONFIG_CAN is not set
-# CONFIG_IRDA is not set
-# CONFIG_BT is not set
-# CONFIG_AF_RXRPC is not set
-# CONFIG_WIRELESS is not set
-# CONFIG_WIMAX is not set
-# CONFIG_RFKILL is not set
-# CONFIG_NET_9P is not set
-
-#
-# Device Drivers
-#
-
-#
-# Generic Driver Options
-#
-CONFIG_UEVENT_HELPER_PATH=""
-# CONFIG_DEVTMPFS is not set
-CONFIG_STANDALONE=y
-CONFIG_PREVENT_FIRMWARE_BUILD=y
-CONFIG_FW_LOADER=y
-# CONFIG_FIRMWARE_IN_KERNEL is not set
-CONFIG_EXTRA_FIRMWARE=""
-# CONFIG_SYS_HYPERVISOR is not set
-# CONFIG_CONNECTOR is not set
-# CONFIG_MTD is not set
-# CONFIG_PARPORT is not set
-CONFIG_BLK_DEV=y
-# CONFIG_BLK_DEV_COW_COMMON is not set
-CONFIG_BLK_DEV_LOOP=y
-# CONFIG_BLK_DEV_CRYPTOLOOP is not set
-# CONFIG_BLK_DEV_NBD is not set
-# CONFIG_BLK_DEV_UB is not set
-# CONFIG_BLK_DEV_RAM is not set
-# CONFIG_CDROM_PKTCDVD is not set
-# CONFIG_ATA_OVER_ETH is not set
-# CONFIG_MG_DISK is not set
-# CONFIG_MISC_DEVICES is not set
-CONFIG_HAVE_IDE=y
-# CONFIG_IDE is not set
-
-#
-# SCSI device support
-#
-# CONFIG_RAID_ATTRS is not set
-CONFIG_SCSI=y
-CONFIG_SCSI_DMA=y
-# CONFIG_SCSI_TGT is not set
-# CONFIG_SCSI_NETLINK is not set
-# CONFIG_SCSI_PROC_FS is not set
-
-#
-# SCSI support type (disk, tape, CD-ROM)
-#
-CONFIG_BLK_DEV_SD=y
-# CONFIG_CHR_DEV_ST is not set
-# CONFIG_CHR_DEV_OSST is not set
-# CONFIG_BLK_DEV_SR is not set
-CONFIG_CHR_DEV_SG=y
-# CONFIG_CHR_DEV_SCH is not set
-# CONFIG_SCSI_MULTI_LUN is not set
-# CONFIG_SCSI_CONSTANTS is not set
-# CONFIG_SCSI_LOGGING is not set
-# CONFIG_SCSI_SCAN_ASYNC is not set
-
-#
-# SCSI Transports
-#
-# CONFIG_SCSI_SPI_ATTRS is not set
-# CONFIG_SCSI_FC_ATTRS is not set
-# CONFIG_SCSI_ISCSI_ATTRS is not set
-# CONFIG_SCSI_SAS_ATTRS is not set
-# CONFIG_SCSI_SAS_LIBSAS is not set
-# CONFIG_SCSI_SRP_ATTRS is not set
-# CONFIG_SCSI_LOWLEVEL is not set
-# CONFIG_SCSI_DH is not set
-# CONFIG_SCSI_OSD_INITIATOR is not set
-# CONFIG_ATA is not set
-# CONFIG_MD is not set
-CONFIG_NETDEVICES=y
-# CONFIG_DUMMY is not set
-# CONFIG_BONDING is not set
-# CONFIG_MACVLAN is not set
-# CONFIG_EQUALIZER is not set
-# CONFIG_TUN is not set
-# CONFIG_VETH is not set
-# CONFIG_PHYLIB is not set
-CONFIG_NET_ETHERNET=y
-CONFIG_MII=y
-# CONFIG_AX88796 is not set
-# CONFIG_SMC91X is not set
-CONFIG_DM9000=y
-CONFIG_DM9000_DEBUGLEVEL=4
-# CONFIG_DM9000_FORCE_SIMPLE_PHY_POLL is not set
-# CONFIG_ETHOC is not set
-# CONFIG_SMC911X is not set
-# CONFIG_SMSC911X is not set
-# CONFIG_DNET is not set
-# CONFIG_IBM_NEW_EMAC_ZMII is not set
-# CONFIG_IBM_NEW_EMAC_RGMII is not set
-# CONFIG_IBM_NEW_EMAC_TAH is not set
-# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
-# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
-# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
-# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
-# CONFIG_B44 is not set
-# CONFIG_KS8842 is not set
-# CONFIG_KS8851_MLL is not set
-# CONFIG_NETDEV_1000 is not set
-# CONFIG_NETDEV_10000 is not set
-# CONFIG_WLAN is not set
-
-#
-# Enable WiMAX (Networking options) to see the WiMAX drivers
-#
-
-#
-# USB Network Adapters
-#
-# CONFIG_USB_CATC is not set
-# CONFIG_USB_KAWETH is not set
-# CONFIG_USB_PEGASUS is not set
-# CONFIG_USB_RTL8150 is not set
-# CONFIG_USB_USBNET is not set
-# CONFIG_WAN is not set
-# CONFIG_PPP is not set
-# CONFIG_SLIP is not set
-# CONFIG_NETCONSOLE is not set
-# CONFIG_NETPOLL is not set
-# CONFIG_NET_POLL_CONTROLLER is not set
-# CONFIG_ISDN is not set
-# CONFIG_PHONE is not set
-
-#
-# Input device support
-#
-CONFIG_INPUT=y
-# CONFIG_INPUT_FF_MEMLESS is not set
-# CONFIG_INPUT_POLLDEV is not set
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV=y
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
-# CONFIG_INPUT_JOYDEV is not set
-CONFIG_INPUT_EVDEV=y
-# CONFIG_INPUT_EVBUG is not set
-
-#
-# Input Device Drivers
-#
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_INPUT_JOYSTICK is not set
-# CONFIG_INPUT_TABLET is not set
-CONFIG_INPUT_TOUCHSCREEN=y
-CONFIG_TOUCHSCREEN_S3C2410=y
-# CONFIG_TOUCHSCREEN_AD7879_I2C is not set
-# CONFIG_TOUCHSCREEN_AD7879 is not set
-# CONFIG_TOUCHSCREEN_EETI is not set
-# CONFIG_TOUCHSCREEN_FUJITSU is not set
-# CONFIG_TOUCHSCREEN_GUNZE is not set
-# CONFIG_TOUCHSCREEN_ELO is not set
-# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
-# CONFIG_TOUCHSCREEN_MCS5000 is not set
-# CONFIG_TOUCHSCREEN_MTOUCH is not set
-# CONFIG_TOUCHSCREEN_INEXIO is not set
-# CONFIG_TOUCHSCREEN_MK712 is not set
-# CONFIG_TOUCHSCREEN_PENMOUNT is not set
-# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
-# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
-# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
-# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
-# CONFIG_TOUCHSCREEN_TSC2007 is not set
-# CONFIG_TOUCHSCREEN_W90X900 is not set
-# CONFIG_INPUT_MISC is not set
-
-#
-# Hardware I/O ports
-#
-# CONFIG_SERIO is not set
-# CONFIG_GAMEPORT is not set
-
-#
-# Character devices
-#
-CONFIG_VT=y
-CONFIG_CONSOLE_TRANSLATIONS=y
-CONFIG_VT_CONSOLE=y
-CONFIG_HW_CONSOLE=y
-# CONFIG_VT_HW_CONSOLE_BINDING is not set
-# CONFIG_DEVKMEM is not set
-CONFIG_MINI2440_HELLO_MODULE=y
-CONFIG_LEDS_MINI2440=y
-CONFIG_MINI2440_BUTTONS=y
-CONFIG_MINI2440_BUZZER=y
-CONFIG_MINI2440_ADC=y
-# CONFIG_SERIAL_NONSTANDARD is not set
-
-#
-# Serial drivers
-#
-# CONFIG_SERIAL_8250 is not set
-
-#
-# Non-8250 serial port support
-#
-CONFIG_SERIAL_SAMSUNG=y
-CONFIG_SERIAL_SAMSUNG_UARTS=3
-CONFIG_SERIAL_SAMSUNG_CONSOLE=y
-CONFIG_SERIAL_S3C2440=y
-CONFIG_SERIAL_CORE=y
-CONFIG_SERIAL_CORE_CONSOLE=y
-CONFIG_UNIX98_PTYS=y
-# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
-# CONFIG_LEGACY_PTYS is not set
-# CONFIG_IPMI_HANDLER is not set
-# CONFIG_HW_RANDOM is not set
-# CONFIG_R3964 is not set
-# CONFIG_RAW_DRIVER is not set
-# CONFIG_TCG_TPM is not set
-CONFIG_I2C=y
-CONFIG_I2C_BOARDINFO=y
-# CONFIG_I2C_COMPAT is not set
-CONFIG_I2C_CHARDEV=y
-# CONFIG_I2C_HELPER_AUTO is not set
-
-#
-# I2C Algorithms
-#
-# CONFIG_I2C_ALGOBIT is not set
-# CONFIG_I2C_ALGOPCF is not set
-# CONFIG_I2C_ALGOPCA is not set
-
-#
-# I2C Hardware Bus support
-#
-
-#
-# I2C system bus drivers (mostly embedded / system-on-chip)
-#
-# CONFIG_I2C_DESIGNWARE is not set
-# CONFIG_I2C_GPIO is not set
-# CONFIG_I2C_OCORES is not set
-CONFIG_I2C_S3C2410=y
-# CONFIG_I2C_SIMTEC is not set
-
-#
-# External I2C/SMBus adapter drivers
-#
-# CONFIG_I2C_PARPORT_LIGHT is not set
-# CONFIG_I2C_TAOS_EVM is not set
-# CONFIG_I2C_TINY_USB is not set
-
-#
-# Other I2C/SMBus bus drivers
-#
-# CONFIG_I2C_PCA_PLATFORM is not set
-
-#
-# Miscellaneous I2C Chip support
-#
-# CONFIG_DS1682 is not set
-# CONFIG_SENSORS_TSL2550 is not set
-# CONFIG_I2C_DEBUG_CORE is not set
-# CONFIG_I2C_DEBUG_ALGO is not set
-# CONFIG_I2C_DEBUG_BUS is not set
-# CONFIG_I2C_DEBUG_CHIP is not set
-# CONFIG_SPI is not set
-
-#
-# PPS support
-#
-# CONFIG_PPS is not set
-CONFIG_ARCH_REQUIRE_GPIOLIB=y
-CONFIG_GPIOLIB=y
-# CONFIG_GPIO_SYSFS is not set
-
-#
-# Memory mapped GPIO expanders:
-#
-
-#
-# I2C GPIO expanders:
-#
-# CONFIG_GPIO_MAX732X is not set
-# CONFIG_GPIO_PCA953X is not set
-# CONFIG_GPIO_PCF857X is not set
-
-#
-# PCI GPIO expanders:
-#
-
-#
-# SPI GPIO expanders:
-#
-
-#
-# AC97 GPIO expanders:
-#
-# CONFIG_W1 is not set
-# CONFIG_POWER_SUPPLY is not set
-# CONFIG_HWMON is not set
-# CONFIG_THERMAL is not set
-CONFIG_WATCHDOG=y
-# CONFIG_WATCHDOG_NOWAYOUT is not set
-
-#
-# Watchdog Device Drivers
-#
-# CONFIG_SOFT_WATCHDOG is not set
-CONFIG_S3C2410_WATCHDOG=y
-
-#
-# USB-based Watchdog Cards
-#
-# CONFIG_USBPCWATCHDOG is not set
-CONFIG_SSB_POSSIBLE=y
-
-#
-# Sonics Silicon Backplane
-#
-# CONFIG_SSB is not set
-
-#
-# Multifunction device drivers
-#
-# CONFIG_MFD_CORE is not set
-# CONFIG_MFD_SM501 is not set
-# CONFIG_MFD_ASIC3 is not set
-# CONFIG_HTC_EGPIO is not set
-# CONFIG_HTC_PASIC3 is not set
-# CONFIG_TPS65010 is not set
-# CONFIG_TWL4030_CORE is not set
-# CONFIG_MFD_TMIO is not set
-# CONFIG_MFD_T7L66XB is not set
-# CONFIG_MFD_TC6387XB is not set
-# CONFIG_MFD_TC6393XB is not set
-# CONFIG_PMIC_DA903X is not set
-# CONFIG_MFD_WM8400 is not set
-# CONFIG_MFD_WM831X is not set
-# CONFIG_MFD_WM8350_I2C is not set
-# CONFIG_MFD_PCF50633 is not set
-# CONFIG_AB3100_CORE is not set
-# CONFIG_REGULATOR is not set
-# CONFIG_MEDIA_SUPPORT is not set
-
-#
-# Graphics support
-#
-# CONFIG_VGASTATE is not set
-# CONFIG_VIDEO_OUTPUT_CONTROL is not set
-CONFIG_FB=y
-# CONFIG_FIRMWARE_EDID is not set
-# CONFIG_FB_DDC is not set
-# CONFIG_FB_BOOT_VESA_SUPPORT is not set
-CONFIG_FB_CFB_FILLRECT=y
-CONFIG_FB_CFB_COPYAREA=y
-CONFIG_FB_CFB_IMAGEBLIT=y
-# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
-# CONFIG_FB_SYS_FILLRECT is not set
-# CONFIG_FB_SYS_COPYAREA is not set
-# CONFIG_FB_SYS_IMAGEBLIT is not set
-# CONFIG_FB_FOREIGN_ENDIAN is not set
-# CONFIG_FB_SYS_FOPS is not set
-# CONFIG_FB_SVGALIB is not set
-# CONFIG_FB_MACMODES is not set
-# CONFIG_FB_BACKLIGHT is not set
-# CONFIG_FB_MODE_HELPERS is not set
-# CONFIG_FB_TILEBLITTING is not set
-
-#
-# Frame buffer hardware drivers
-#
-# CONFIG_FB_S1D13XXX is not set
-CONFIG_FB_S3C2410=y
-CONFIG_FB_S3C2410_DEBUG=y
-# CONFIG_FB_S3C2410_T240320 is not set
-# CONFIG_FB_S3C2410_N240320 is not set
-CONFIG_FB_S3C2410_TFT640480=y
-# CONFIG_FB_S3C2410_TFT800480 is not set
-# CONFIG_FB_S3C2410_VGA1024768 is not set
-# CONFIG_BACKLIGHT_MINI2440 is not set
-# CONFIG_FB_VIRTUAL is not set
-# CONFIG_FB_METRONOME is not set
-# CONFIG_FB_MB862XX is not set
-# CONFIG_FB_BROADSHEET is not set
-# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
-
-#
-# Display device support
-#
-# CONFIG_DISPLAY_SUPPORT is not set
-
-#
-# Console display driver support
-#
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_DUMMY_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
-# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
-CONFIG_FONTS=y
-# CONFIG_FONT_8x8 is not set
-CONFIG_FONT_8x16=y
-# CONFIG_FONT_6x11 is not set
-# CONFIG_FONT_7x14 is not set
-# CONFIG_FONT_PEARL_8x8 is not set
-# CONFIG_FONT_ACORN_8x8 is not set
-# CONFIG_FONT_MINI_4x6 is not set
-# CONFIG_FONT_SUN8x16 is not set
-# CONFIG_FONT_SUN12x22 is not set
-# CONFIG_FONT_10x18 is not set
-# CONFIG_LOGO is not set
-CONFIG_SOUND=y
-# CONFIG_SOUND_OSS_CORE is not set
-CONFIG_SND=y
-CONFIG_SND_TIMER=y
-CONFIG_SND_PCM=y
-CONFIG_SND_JACK=y
-# CONFIG_SND_SEQUENCER is not set
-# CONFIG_SND_MIXER_OSS is not set
-# CONFIG_SND_PCM_OSS is not set
-# CONFIG_SND_DYNAMIC_MINORS is not set
-# CONFIG_SND_SUPPORT_OLD_API is not set
-CONFIG_SND_VERBOSE_PROCFS=y
-# CONFIG_SND_VERBOSE_PRINTK is not set
-# CONFIG_SND_DEBUG is not set
-# CONFIG_SND_RAWMIDI_SEQ is not set
-# CONFIG_SND_OPL3_LIB_SEQ is not set
-# CONFIG_SND_OPL4_LIB_SEQ is not set
-# CONFIG_SND_SBAWE_SEQ is not set
-# CONFIG_SND_EMU10K1_SEQ is not set
-# CONFIG_SND_DRIVERS is not set
-# CONFIG_SND_ARM is not set
-# CONFIG_SND_USB is not set
-CONFIG_SND_SOC=y
-CONFIG_SND_S3C24XX_SOC=y
-CONFIG_SND_S3C24XX_SOC_I2S=y
-# CONFIG_SND_S3C24XX_SOC_LN2440SBC_ALC650 is not set
-CONFIG_SND_S3C24XX_SOC_S3C24XX_UDA134X=y
-# CONFIG_SND_S3C24XX_SOC_SIMTEC_TLV320AIC23 is not set
-# CONFIG_SND_S3C24XX_SOC_SIMTEC_HERMES is not set
-CONFIG_SND_SOC_I2C_AND_SPI=y
-# CONFIG_SND_SOC_ALL_CODECS is not set
-CONFIG_SND_SOC_L3=y
-CONFIG_SND_SOC_UDA134X=y
-# CONFIG_SOUND_PRIME is not set
-CONFIG_HID_SUPPORT=y
-CONFIG_HID=y
-# CONFIG_HIDRAW is not set
-
-#
-# USB Input Devices
-#
-CONFIG_USB_HID=y
-# CONFIG_HID_PID is not set
-# CONFIG_USB_HIDDEV is not set
-
-#
-# Special HID drivers
-#
-# CONFIG_HID_A4TECH is not set
-# CONFIG_HID_APPLE is not set
-# CONFIG_HID_BELKIN is not set
-# CONFIG_HID_CHERRY is not set
-# CONFIG_HID_CHICONY is not set
-# CONFIG_HID_CYPRESS is not set
-# CONFIG_HID_DRAGONRISE is not set
-# CONFIG_HID_EZKEY is not set
-# CONFIG_HID_KYE is not set
-# CONFIG_HID_GYRATION is not set
-# CONFIG_HID_TWINHAN is not set
-# CONFIG_HID_KENSINGTON is not set
-# CONFIG_HID_LOGITECH is not set
-# CONFIG_HID_MICROSOFT is not set
-# CONFIG_HID_MONTEREY is not set
-# CONFIG_HID_NTRIG is not set
-# CONFIG_HID_PANTHERLORD is not set
-# CONFIG_HID_PETALYNX is not set
-# CONFIG_HID_SAMSUNG is not set
-# CONFIG_HID_SONY is not set
-# CONFIG_HID_SUNPLUS is not set
-# CONFIG_HID_GREENASIA is not set
-# CONFIG_HID_SMARTJOYPLUS is not set
-# CONFIG_HID_TOPSEED is not set
-# CONFIG_HID_THRUSTMASTER is not set
-# CONFIG_HID_ZEROPLUS is not set
-CONFIG_USB_SUPPORT=y
-CONFIG_USB_ARCH_HAS_HCD=y
-CONFIG_USB_ARCH_HAS_OHCI=y
-# CONFIG_USB_ARCH_HAS_EHCI is not set
-CONFIG_USB=y
-# CONFIG_USB_DEBUG is not set
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-
-#
-# Miscellaneous USB options
-#
-# CONFIG_USB_DEVICEFS is not set
-# CONFIG_USB_DEVICE_CLASS is not set
-# CONFIG_USB_DYNAMIC_MINORS is not set
-# CONFIG_USB_OTG is not set
-# CONFIG_USB_OTG_WHITELIST is not set
-# CONFIG_USB_OTG_BLACKLIST_HUB is not set
-# CONFIG_USB_MON is not set
-# CONFIG_USB_WUSB is not set
-# CONFIG_USB_WUSB_CBAF is not set
-
-#
-# USB Host Controller Drivers
-#
-# CONFIG_USB_C67X00_HCD is not set
-# CONFIG_USB_OXU210HP_HCD is not set
-# CONFIG_USB_ISP116X_HCD is not set
-# CONFIG_USB_ISP1760_HCD is not set
-# CONFIG_USB_ISP1362_HCD is not set
-CONFIG_USB_OHCI_HCD=y
-# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
-# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
-CONFIG_USB_OHCI_LITTLE_ENDIAN=y
-# CONFIG_USB_SL811_HCD is not set
-# CONFIG_USB_R8A66597_HCD is not set
-# CONFIG_USB_HWA_HCD is not set
-# CONFIG_USB_MUSB_HDRC is not set
-
-#
-# USB Device Class drivers
-#
-# CONFIG_USB_ACM is not set
-# CONFIG_USB_PRINTER is not set
-# CONFIG_USB_WDM is not set
-# CONFIG_USB_TMC is not set
-
-#
-# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
-#
-
-#
-# also be needed; see USB_STORAGE Help for more info
-#
-CONFIG_USB_STORAGE=y
-# CONFIG_USB_STORAGE_DEBUG is not set
-# CONFIG_USB_STORAGE_DATAFAB is not set
-# CONFIG_USB_STORAGE_FREECOM is not set
-# CONFIG_USB_STORAGE_ISD200 is not set
-# CONFIG_USB_STORAGE_USBAT is not set
-CONFIG_USB_STORAGE_SDDR09=y
-CONFIG_USB_STORAGE_SDDR55=y
-# CONFIG_USB_STORAGE_JUMPSHOT is not set
-# CONFIG_USB_STORAGE_ALAUDA is not set
-# CONFIG_USB_STORAGE_ONETOUCH is not set
-# CONFIG_USB_STORAGE_KARMA is not set
-# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
-# CONFIG_USB_LIBUSUAL is not set
-
-#
-# USB Imaging devices
-#
-# CONFIG_USB_MDC800 is not set
-# CONFIG_USB_MICROTEK is not set
-
-#
-# USB port drivers
-#
-# CONFIG_USB_SERIAL is not set
-
-#
-# USB Miscellaneous drivers
-#
-# CONFIG_USB_EMI62 is not set
-# CONFIG_USB_EMI26 is not set
-# CONFIG_USB_ADUTUX is not set
-# CONFIG_USB_SEVSEG is not set
-# CONFIG_USB_RIO500 is not set
-# CONFIG_USB_LEGOTOWER is not set
-# CONFIG_USB_LCD is not set
-# CONFIG_USB_BERRY_CHARGE is not set
-# CONFIG_USB_LED is not set
-# CONFIG_USB_CYPRESS_CY7C63 is not set
-# CONFIG_USB_CYTHERM is not set
-# CONFIG_USB_IDMOUSE is not set
-# CONFIG_USB_FTDI_ELAN is not set
-# CONFIG_USB_APPLEDISPLAY is not set
-# CONFIG_USB_LD is not set
-# CONFIG_USB_TRANCEVIBRATOR is not set
-# CONFIG_USB_IOWARRIOR is not set
-# CONFIG_USB_TEST is not set
-# CONFIG_USB_ISIGHTFW is not set
-# CONFIG_USB_VST is not set
-# CONFIG_USB_GADGET is not set
-
-#
-# OTG and related infrastructure
-#
-# CONFIG_USB_GPIO_VBUS is not set
-# CONFIG_NOP_USB_XCEIV is not set
-CONFIG_MMC=y
-# CONFIG_MMC_DEBUG is not set
-# CONFIG_MMC_UNSAFE_RESUME is not set
-
-#
-# MMC/SD/SDIO Card Drivers
-#
-CONFIG_MMC_BLOCK=y
-CONFIG_MMC_BLOCK_BOUNCE=y
-# CONFIG_SDIO_UART is not set
-# CONFIG_MMC_TEST is not set
-
-#
-# MMC/SD/SDIO Host Controller Drivers
-#
-# CONFIG_MMC_SDHCI is not set
-# CONFIG_MMC_AT91 is not set
-# CONFIG_MMC_ATMELMCI is not set
-CONFIG_MMC_S3C=y
-CONFIG_MMC_S3C_HW_SDIO_IRQ=y
-CONFIG_MMC_S3C_PIO=y
-# CONFIG_MMC_S3C_DMA is not set
-# CONFIG_MMC_S3C_PIODMA is not set
-# CONFIG_MEMSTICK is not set
-# CONFIG_NEW_LEDS is not set
-# CONFIG_ACCESSIBILITY is not set
-CONFIG_RTC_LIB=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_HCTOSYS=y
-CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
-CONFIG_RTC_DEBUG=y
-
-#
-# RTC interfaces
-#
-CONFIG_RTC_INTF_SYSFS=y
-CONFIG_RTC_INTF_PROC=y
-CONFIG_RTC_INTF_DEV=y
-# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
-# CONFIG_RTC_DRV_TEST is not set
-
-#
-# I2C RTC drivers
-#
-# CONFIG_RTC_DRV_DS1307 is not set
-# CONFIG_RTC_DRV_DS1374 is not set
-# CONFIG_RTC_DRV_DS1672 is not set
-# CONFIG_RTC_DRV_MAX6900 is not set
-# CONFIG_RTC_DRV_RS5C372 is not set
-# CONFIG_RTC_DRV_ISL1208 is not set
-# CONFIG_RTC_DRV_X1205 is not set
-# CONFIG_RTC_DRV_PCF8563 is not set
-# CONFIG_RTC_DRV_PCF8583 is not set
-# CONFIG_RTC_DRV_M41T80 is not set
-# CONFIG_RTC_DRV_S35390A is not set
-# CONFIG_RTC_DRV_FM3130 is not set
-# CONFIG_RTC_DRV_RX8581 is not set
-# CONFIG_RTC_DRV_RX8025 is not set
-
-#
-# SPI RTC drivers
-#
-
-#
-# Platform RTC drivers
-#
-# CONFIG_RTC_DRV_CMOS is not set
-# CONFIG_RTC_DRV_DS1286 is not set
-# CONFIG_RTC_DRV_DS1511 is not set
-# CONFIG_RTC_DRV_DS1553 is not set
-# CONFIG_RTC_DRV_DS1742 is not set
-# CONFIG_RTC_DRV_STK17TA8 is not set
-# CONFIG_RTC_DRV_M48T86 is not set
-# CONFIG_RTC_DRV_M48T35 is not set
-# CONFIG_RTC_DRV_M48T59 is not set
-# CONFIG_RTC_DRV_BQ4802 is not set
-# CONFIG_RTC_DRV_V3020 is not set
-
-#
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_S3C=y
-# CONFIG_DMADEVICES is not set
-# CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
-
-#
-# TI VLYNQ
-#
-# CONFIG_STAGING is not set
-
-#
-# File systems
-#
-# CONFIG_EXT2_FS is not set
-# CONFIG_EXT3_FS is not set
-CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_XATTR=y
-# CONFIG_EXT4_FS_POSIX_ACL is not set
-# CONFIG_EXT4_FS_SECURITY is not set
-CONFIG_EXT4_DEBUG=y
-CONFIG_JBD2=y
-CONFIG_FS_MBCACHE=y
-# CONFIG_REISERFS_FS is not set
-# CONFIG_JFS_FS is not set
-CONFIG_FS_POSIX_ACL=y
-# CONFIG_XFS_FS is not set
-# CONFIG_GFS2_FS is not set
-# CONFIG_OCFS2_FS is not set
-# CONFIG_BTRFS_FS is not set
-# CONFIG_NILFS2_FS is not set
-CONFIG_FILE_LOCKING=y
-CONFIG_FSNOTIFY=y
-# CONFIG_DNOTIFY is not set
-# CONFIG_INOTIFY is not set
-CONFIG_INOTIFY_USER=y
-# CONFIG_QUOTA is not set
-# CONFIG_AUTOFS_FS is not set
-# CONFIG_AUTOFS4_FS is not set
-# CONFIG_FUSE_FS is not set
-CONFIG_GENERIC_ACL=y
-
-#
-# Caches
-#
-# CONFIG_FSCACHE is not set
-
-#
-# CD-ROM/DVD Filesystems
-#
-# CONFIG_ISO9660_FS is not set
-# CONFIG_UDF_FS is not set
-
-#
-# DOS/FAT/NT Filesystems
-#
-CONFIG_FAT_FS=y
-# CONFIG_MSDOS_FS is not set
-CONFIG_VFAT_FS=y
-CONFIG_FAT_DEFAULT_CODEPAGE=437
-CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
-# CONFIG_NTFS_FS is not set
-
-#
-# Pseudo filesystems
-#
-CONFIG_PROC_FS=y
-CONFIG_PROC_SYSCTL=y
-CONFIG_PROC_PAGE_MONITOR=y
-CONFIG_SYSFS=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-# CONFIG_HUGETLB_PAGE is not set
-CONFIG_CONFIGFS_FS=y
-CONFIG_MISC_FILESYSTEMS=y
-# CONFIG_ADFS_FS is not set
-# CONFIG_AFFS_FS is not set
-# CONFIG_HFS_FS is not set
-# CONFIG_HFSPLUS_FS is not set
-# CONFIG_BEFS_FS is not set
-# CONFIG_BFS_FS is not set
-# CONFIG_EFS_FS is not set
-# CONFIG_CRAMFS is not set
-# CONFIG_SQUASHFS is not set
-# CONFIG_VXFS_FS is not set
-# CONFIG_MINIX_FS is not set
-# CONFIG_OMFS_FS is not set
-# CONFIG_HPFS_FS is not set
-# CONFIG_QNX4FS_FS is not set
-# CONFIG_ROMFS_FS is not set
-# CONFIG_SYSV_FS is not set
-# CONFIG_UFS_FS is not set
-CONFIG_NETWORK_FILESYSTEMS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
-# CONFIG_NFS_V3_ACL is not set
-# CONFIG_NFS_V4 is not set
-# CONFIG_NFSD is not set
-CONFIG_LOCKD=y
-CONFIG_LOCKD_V4=y
-CONFIG_NFS_COMMON=y
-CONFIG_SUNRPC=y
-# CONFIG_RPCSEC_GSS_KRB5 is not set
-# CONFIG_RPCSEC_GSS_SPKM3 is not set
-# CONFIG_SMB_FS is not set
-CONFIG_CIFS=y
-# CONFIG_CIFS_STATS is not set
-# CONFIG_CIFS_WEAK_PW_HASH is not set
-# CONFIG_CIFS_XATTR is not set
-# CONFIG_CIFS_DEBUG2 is not set
-# CONFIG_CIFS_EXPERIMENTAL is not set
-# CONFIG_NCP_FS is not set
-# CONFIG_CODA_FS is not set
-# CONFIG_AFS_FS is not set
-
-#
-# Partition Types
-#
-# CONFIG_PARTITION_ADVANCED is not set
-CONFIG_MSDOS_PARTITION=y
-CONFIG_NLS=y
-CONFIG_NLS_DEFAULT="iso8859-1"
-CONFIG_NLS_CODEPAGE_437=y
-# CONFIG_NLS_CODEPAGE_737 is not set
-# CONFIG_NLS_CODEPAGE_775 is not set
-# CONFIG_NLS_CODEPAGE_850 is not set
-# CONFIG_NLS_CODEPAGE_852 is not set
-# CONFIG_NLS_CODEPAGE_855 is not set
-# CONFIG_NLS_CODEPAGE_857 is not set
-# CONFIG_NLS_CODEPAGE_860 is not set
-# CONFIG_NLS_CODEPAGE_861 is not set
-# CONFIG_NLS_CODEPAGE_862 is not set
-# CONFIG_NLS_CODEPAGE_863 is not set
-# CONFIG_NLS_CODEPAGE_864 is not set
-# CONFIG_NLS_CODEPAGE_865 is not set
-# CONFIG_NLS_CODEPAGE_866 is not set
-# CONFIG_NLS_CODEPAGE_869 is not set
-CONFIG_NLS_CODEPAGE_936=y
-# CONFIG_NLS_CODEPAGE_950 is not set
-# CONFIG_NLS_CODEPAGE_932 is not set
-# CONFIG_NLS_CODEPAGE_949 is not set
-# CONFIG_NLS_CODEPAGE_874 is not set
-# CONFIG_NLS_ISO8859_8 is not set
-# CONFIG_NLS_CODEPAGE_1250 is not set
-# CONFIG_NLS_CODEPAGE_1251 is not set
-# CONFIG_NLS_ASCII is not set
-CONFIG_NLS_ISO8859_1=y
-# CONFIG_NLS_ISO8859_2 is not set
-# CONFIG_NLS_ISO8859_3 is not set
-# CONFIG_NLS_ISO8859_4 is not set
-# CONFIG_NLS_ISO8859_5 is not set
-# CONFIG_NLS_ISO8859_6 is not set
-# CONFIG_NLS_ISO8859_7 is not set
-# CONFIG_NLS_ISO8859_9 is not set
-# CONFIG_NLS_ISO8859_13 is not set
-# CONFIG_NLS_ISO8859_14 is not set
-# CONFIG_NLS_ISO8859_15 is not set
-# CONFIG_NLS_KOI8_R is not set
-# CONFIG_NLS_KOI8_U is not set
-CONFIG_NLS_UTF8=y
-# CONFIG_DLM is not set
-
-#
-# Kernel hacking
-#
-# CONFIG_PRINTK_TIME is not set
-# CONFIG_ENABLE_WARN_DEPRECATED is not set
-# CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_FRAME_WARN=1024
-# CONFIG_MAGIC_SYSRQ is not set
-# CONFIG_STRIP_ASM_SYMS is not set
-# CONFIG_UNUSED_SYMBOLS is not set
-# CONFIG_DEBUG_FS is not set
-# CONFIG_HEADERS_CHECK is not set
-# CONFIG_DEBUG_KERNEL is not set
-# CONFIG_SLUB_DEBUG_ON is not set
-# CONFIG_SLUB_STATS is not set
-# CONFIG_DEBUG_BUGVERBOSE is not set
-# CONFIG_DEBUG_MEMORY_INIT is not set
-CONFIG_FRAME_POINTER=y
-# CONFIG_RCU_CPU_STALL_DETECTOR is not set
-# CONFIG_LATENCYTOP is not set
-# CONFIG_SYSCTL_SYSCALL_CHECK is not set
-CONFIG_HAVE_FUNCTION_TRACER=y
-CONFIG_TRACING_SUPPORT=y
-# CONFIG_FTRACE is not set
-# CONFIG_SAMPLES is not set
-CONFIG_HAVE_ARCH_KGDB=y
-# CONFIG_ARM_UNWIND is not set
-# CONFIG_DEBUG_USER is not set
-CONFIG_DEBUG_S3C_UART=0
-
-#
-# Security options
-#
-# CONFIG_KEYS is not set
-# CONFIG_SECURITY is not set
-# CONFIG_SECURITYFS is not set
-# CONFIG_SECURITY_FILE_CAPABILITIES is not set
-CONFIG_CRYPTO=y
-
-#
-# Crypto core or helper
-#
-CONFIG_CRYPTO_ALGAPI=y
-CONFIG_CRYPTO_ALGAPI2=y
-CONFIG_CRYPTO_AEAD2=y
-CONFIG_CRYPTO_BLKCIPHER2=y
-CONFIG_CRYPTO_HASH=y
-CONFIG_CRYPTO_HASH2=y
-CONFIG_CRYPTO_RNG2=y
-CONFIG_CRYPTO_PCOMP=y
-CONFIG_CRYPTO_MANAGER=y
-CONFIG_CRYPTO_MANAGER2=y
-# CONFIG_CRYPTO_GF128MUL is not set
-# CONFIG_CRYPTO_NULL is not set
-CONFIG_CRYPTO_WORKQUEUE=y
-# CONFIG_CRYPTO_CRYPTD is not set
-# CONFIG_CRYPTO_AUTHENC is not set
-
-#
-# Authenticated Encryption with Associated Data
-#
-# CONFIG_CRYPTO_CCM is not set
-# CONFIG_CRYPTO_GCM is not set
-# CONFIG_CRYPTO_SEQIV is not set
-
-#
-# Block modes
-#
-# CONFIG_CRYPTO_CBC is not set
-# CONFIG_CRYPTO_CTR is not set
-# CONFIG_CRYPTO_CTS is not set
-# CONFIG_CRYPTO_ECB is not set
-# CONFIG_CRYPTO_LRW is not set
-# CONFIG_CRYPTO_PCBC is not set
-# CONFIG_CRYPTO_XTS is not set
-
-#
-# Hash modes
-#
-CONFIG_CRYPTO_HMAC=y
-# CONFIG_CRYPTO_XCBC is not set
-# CONFIG_CRYPTO_VMAC is not set
-
-#
-# Digest
-#
-CONFIG_CRYPTO_CRC32C=y
-# CONFIG_CRYPTO_GHASH is not set
-# CONFIG_CRYPTO_MD4 is not set
-CONFIG_CRYPTO_MD5=y
-# CONFIG_CRYPTO_MICHAEL_MIC is not set
-# CONFIG_CRYPTO_RMD128 is not set
-# CONFIG_CRYPTO_RMD160 is not set
-# CONFIG_CRYPTO_RMD256 is not set
-# CONFIG_CRYPTO_RMD320 is not set
-CONFIG_CRYPTO_SHA1=y
-# CONFIG_CRYPTO_SHA256 is not set
-# CONFIG_CRYPTO_SHA512 is not set
-# CONFIG_CRYPTO_TGR192 is not set
-# CONFIG_CRYPTO_WP512 is not set
-
-#
-# Ciphers
-#
-# CONFIG_CRYPTO_AES is not set
-# CONFIG_CRYPTO_ANUBIS is not set
-# CONFIG_CRYPTO_ARC4 is not set
-# CONFIG_CRYPTO_BLOWFISH is not set
-# CONFIG_CRYPTO_CAMELLIA is not set
-# CONFIG_CRYPTO_CAST5 is not set
-# CONFIG_CRYPTO_CAST6 is not set
-# CONFIG_CRYPTO_DES is not set
-# CONFIG_CRYPTO_FCRYPT is not set
-# CONFIG_CRYPTO_KHAZAD is not set
-# CONFIG_CRYPTO_SALSA20 is not set
-# CONFIG_CRYPTO_SEED is not set
-# CONFIG_CRYPTO_SERPENT is not set
-# CONFIG_CRYPTO_TEA is not set
-# CONFIG_CRYPTO_TWOFISH is not set
-
-#
-# Compression
-#
-# CONFIG_CRYPTO_DEFLATE is not set
-# CONFIG_CRYPTO_ZLIB is not set
-# CONFIG_CRYPTO_LZO is not set
-
-#
-# Random Number Generation
-#
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-# CONFIG_CRYPTO_HW is not set
-# CONFIG_BINARY_PRINTF is not set
-
-#
-# Library routines
-#
-CONFIG_BITREVERSE=y
-CONFIG_GENERIC_FIND_LAST_BIT=y
-CONFIG_CRC_CCITT=y
-CONFIG_CRC16=y
-# CONFIG_CRC_T10DIF is not set
-CONFIG_CRC_ITU_T=y
-CONFIG_CRC32=y
-# CONFIG_CRC7 is not set
-CONFIG_LIBCRC32C=y
-CONFIG_HAS_IOMEM=y
-CONFIG_HAS_DMA=y
-CONFIG_NLATTR=y
diff --git a/configs/mini2440_defconfig b/configs/mini2440_defconfig
index d1be8e1..58e9f33 100644
--- a/configs/mini2440_defconfig
+++ b/configs/mini2440_defconfig
@@ -1,31 +1,629 @@
-# Architecture
+#
+# Automatically generated make config: don't edit
+# Buildroot 2011.05-git-00253-gf890deb-dirty Configuration
+# Tue May 17 08:13:19 2011
+#
+BR2_HAVE_DOT_CONFIG=y
 BR2_arm=y
+# BR2_armeb is not set
+# BR2_avr32 is not set
+# BR2_bfin is not set
+# BR2_i386 is not set
+# BR2_mips is not set
+# BR2_mipsel is not set
+# BR2_powerpc is not set
+# BR2_sh is not set
+# BR2_sh64 is not set
+# BR2_sparc is not set
+# BR2_x86_64 is not set
+# BR2_xtensa is not set
+# BR2_generic_arm is not set
+# BR2_arm7tdmi is not set
+# BR2_arm610 is not set
+# BR2_arm710 is not set
+# BR2_arm720t is not set
 BR2_arm920t=y
+# BR2_arm922t is not set
+# BR2_arm926t is not set
+# BR2_arm10t is not set
+# BR2_arm1136jf_s is not set
+# BR2_arm1176jz_s is not set
+# BR2_arm1176jzf_s is not set
+
+#
+# cortex-A8/A9 needs gcc >= 4.4.x
+#
+# BR2_cortex_a8 is not set
+# BR2_cortex_a9 is not set
+# BR2_sa110 is not set
+# BR2_sa1100 is not set
+# BR2_xscale is not set
+# BR2_iwmmxt is not set
+BR2_ARM_TYPE="ARM920T"
+BR2_ARM_EABI=y
+# BR2_ARM_OABI is not set
+BR2_ARCH="arm"
+BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_TUNE="arm920t"
+BR2_GCC_TARGET_ARCH="armv4t"
+BR2_GCC_TARGET_ABI="aapcs-linux"
+
+#
+# Build options
+#
+
+#
+# Commands
+#
+BR2_WGET="wget --passive-ftp -nd -t 3"
+BR2_SVN="svn"
+BR2_BZR="bzr"
+BR2_GIT="git"
+BR2_ZCAT="gzip -d -c"
+BR2_BZCAT="bzcat"
+BR2_TAR_OPTIONS=""
+BR2_DL_DIR="$(TOPDIR)/dl"
+BR2_HOST_DIR="$(BASE_DIR)/host"
+
+#
+# Mirrors and Download locations
+#
+BR2_PRIMARY_SITE=""
+BR2_BACKUP_SITE="http://sources.buildroot.net/"
+BR2_SOURCEFORGE_MIRROR="kent"
+BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
+BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
+BR2_DEBIAN_MIRROR="http://ftp.debian.org"
+BR2_JLEVEL=2
+# BR2_CCACHE is not set
+# BR2_DEPRECATED is not set
+# BR2_ENABLE_DEBUG is not set
+BR2_STRIP_strip=y
+# BR2_STRIP_sstrip is not set
+# BR2_STRIP_none is not set
+# BR2_OPTIMIZE_0 is not set
+# BR2_OPTIMIZE_1 is not set
+# BR2_OPTIMIZE_2 is not set
+# BR2_OPTIMIZE_3 is not set
+BR2_OPTIMIZE_S=y
+# BR2_PREFER_STATIC_LIB is not set
+# BR2_HAVE_DOCUMENTATION is not set
+# BR2_HAVE_DEVFILES is not set
+
+#
+# Toolchain
+#
+# BR2_TOOLCHAIN_BUILDROOT is not set
+BR2_TOOLCHAIN_EXTERNAL=y
+# BR2_TOOLCHAIN_CTNG is not set
+BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103=y
+# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009 is not set
+# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1 is not set
+# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q1 is not set
+# BR2_TOOLCHAIN_EXTERNAL_CUSTOM is not set
+BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
+BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-none-linux-gnueabi"
+BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
+
+#
+# Gdb Options
+#
+# BR2_PACKAGE_GDB is not set
+# BR2_PACKAGE_GDB_SERVER is not set
+BR2_LARGEFILE=y
+BR2_INET_IPV6=y
+BR2_INET_RPC=y
+BR2_USE_WCHAR=y
+BR2_ENABLE_LOCALE=y
+BR2_PROGRAM_INVOCATION=y
+BR2_INSTALL_LIBSTDCPP=y
+BR2_TOOLCHAIN_HAS_THREADS=y
+# BR2_ENABLE_LOCALE_PURGE is not set
+BR2_USE_MMU=y
+BR2_PREFER_SOFT_FLOAT=y
+BR2_SOFT_FLOAT=y
+BR2_TARGET_OPTIMIZATION="-pipe"
+
+#
+# System configuration
+#
+BR2_TARGET_GENERIC_HOSTNAME="buildroot"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot"
+BR2_ROOTFS_DEVICE_CREATION_STATIC=y
+# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS is not set
+# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV is not set
+# BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV is not set
+BR2_ROOTFS_DEVICE_TABLE="target/generic/device_table.txt target/generic/device_table_dev.txt"
+BR2_ROOTFS_SKELETON_DEFAULT=y
+# BR2_ROOTFS_SKELETON_CUSTOM is not set
+BR2_TARGET_GENERIC_GETTY_PORT="ttySAC0"
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_KEEP is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_9600 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_19200 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_38400 is not set
+# BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600 is not set
+BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
+BR2_TARGET_GENERIC_GETTY_BAUDRATE="115200"
+BR2_ROOTFS_POST_BUILD_SCRIPT=""
+
+#
+# Package Selection for the target
+#
+BR2_PACKAGE_BUSYBOX=y
+# BR2_BUSYBOX_VERSION_1_16_X is not set
+# BR2_BUSYBOX_VERSION_1_17_X is not set
+BR2_BUSYBOX_VERSION_1_18_X=y
+# BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
+BR2_BUSYBOX_VERSION="1.18.4"
+BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.18.x.config"
+# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is not set
+# BR2_PACKAGE_CUSTOMIZE is not set
+
+#
+# Audio and video libraries and applications
+#
+# BR2_PACKAGE_ALSA_LIB is not set
+# BR2_PACKAGE_ALSA_UTILS is not set
+# BR2_PACKAGE_AUMIX is not set
+# BR2_PACKAGE_FAAD2 is not set
+# BR2_PACKAGE_FLAC is not set
+# BR2_PACKAGE_FFMPEG is not set
+# BR2_PACKAGE_GSTREAMER is not set
+# BR2_PACKAGE_LAME is not set
+# BR2_PACKAGE_LIBAO is not set
+# BR2_PACKAGE_LIBCDAUDIO is not set
+# BR2_PACKAGE_LIBCUE is not set
+# BR2_PACKAGE_LIBCUEFILE is not set
+# BR2_PACKAGE_LIBDVDREAD is not set
+# BR2_PACKAGE_LIBDVDNAV is not set
+# BR2_PACKAGE_LIBID3TAG is not set
+# BR2_PACKAGE_LIBMAD is not set
+# BR2_PACKAGE_LIBMMS is not set
+# BR2_PACKAGE_LIBMPD is not set
+# BR2_PACKAGE_LIBMPEG2 is not set
+# BR2_PACKAGE_LIBOGG is not set
+# BR2_PACKAGE_LIBREPLAYGAIN is not set
+# BR2_PACKAGE_LIBSAMPLERATE is not set
+# BR2_PACKAGE_LIBSNDFILE is not set
+# BR2_PACKAGE_LIBTHEORA is not set
+# BR2_PACKAGE_LIBVORBIS is not set
+# BR2_PACKAGE_MADPLAY is not set
+# BR2_PACKAGE_MPD is not set
+# BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_MPLAYER is not set
+# BR2_PACKAGE_MUSEPACK is not set
+# BR2_PACKAGE_SPEEX is not set
+# BR2_PACKAGE_SWFDEC is not set
+# BR2_PACKAGE_TAGLIB is not set
+# BR2_PACKAGE_TREMOR is not set
+# BR2_PACKAGE_VORBIS_TOOLS is not set
+# BR2_PACKAGE_WAVPACK is not set
+
+#
+# Compressors and decompressors
+#
+# BR2_PACKAGE_BZIP2 is not set
+# BR2_PACKAGE_LZOP is not set
+# BR2_PACKAGE_XZ is not set
+
+#
+# Debugging, profiling and benchmark
+#
+# BR2_PACKAGE_BONNIE is not set
+# BR2_PACKAGE_DHRYSTONE is not set
+# BR2_PACKAGE_DMALLOC is not set
+# BR2_PACKAGE_KEXEC is not set
+# BR2_PACKAGE_LMBENCH is not set
+# BR2_PACKAGE_LSOF is not set
+# BR2_PACKAGE_LTP_TESTSUITE is not set
+# BR2_PACKAGE_LTRACE is not set
+# BR2_PACKAGE_MEMSTAT is not set
+# BR2_PACKAGE_NETPERF is not set
+# BR2_PACKAGE_STRACE is not set
+# BR2_PACKAGE_WHETSTONE is not set
 
-# Serial port
-BR2_TARGET_GENERIC_GETTY_TTYSAC0=y
+#
+# Development tools
+#
+# BR2_PACKAGE_AUTOCONF is not set
+# BR2_PACKAGE_AUTOMAKE is not set
+# BR2_PACKAGE_BISON is not set
+# BR2_PACKAGE_BSDIFF is not set
+# BR2_PACKAGE_CCACHE is not set
+# BR2_PACKAGE_CVS is not set
+# BR2_PACKAGE_DISTCC is not set
+# BR2_PACKAGE_FAKEROOT is not set
+# BR2_PACKAGE_FLEX is not set
+# BR2_PACKAGE_GMP is not set
+# BR2_PACKAGE_GPERF is not set
+# BR2_PACKAGE_MAKE is not set
+# BR2_PACKAGE_MPC is not set
+# BR2_PACKAGE_MPFR is not set
+# BR2_PACKAGE_LIBTOOL is not set
+# BR2_PACKAGE_M4 is not set
+# BR2_PACKAGE_PKG_CONFIG is not set
+# BR2_PACKAGE_SSTRIP is not set
 
+#
+# Games
+#
+# BR2_PACKAGE_GNUCHESS is not set
+# BR2_PACKAGE_PRBOOM is not set
+
+#
+# Graphic libraries and applications (graphic/text)
+#
+
+#
+# Graphic applications
+#
+# BR2_PACKAGE_RRDTOOL is not set
+
+#
+# graphic libraries
+#
+# BR2_PACKAGE_DIRECTFB is not set
+# BR2_PACKAGE_FBDUMP is not set
+# BR2_PACKAGE_FBGRAB is not set
+# BR2_PACKAGE_FBV is not set
+# BR2_PACKAGE_IMAGEMAGICK is not set
+# BR2_PACKAGE_LINUX_FUSION is not set
+# BR2_PACKAGE_SDL is not set
+
+#
+# other GUIs
+#
+# BR2_PACKAGE_QT is not set
+# BR2_PACKAGE_XORG7 is not set
+
+#
+# X libraries and helper libraries
+#
+# BR2_PACKAGE_LIBERATION is not set
+
+#
+# X Window managers
+#
+
+#
+# X applications
+#
+# BR2_PACKAGE_GOB2 is not set
+
+#
+# midori requires C++, WCHAR in toolchain and libgtk2
+#
+
+#
+# Hardware handling
+#
+# BR2_PACKAGE_CDRKIT is not set
+# BR2_PACKAGE_CRAMFS is not set
+
+#
+# dbus not available (need expat or libxml2)
+#
+# BR2_PACKAGE_DMRAID is not set
+# BR2_PACKAGE_DOSFSTOOLS is not set
+# BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_EEPROG is not set
+# BR2_PACKAGE_FCONFIG is not set
+# BR2_PACKAGE_FIS is not set
+# BR2_PACKAGE_GADGETFS_TEST is not set
+# BR2_PACKAGE_GDISK is not set
+# BR2_PACKAGE_GENEXT2FS is not set
+# BR2_PACKAGE_GENROMFS is not set
+# BR2_PACKAGE_GPSD is not set
+# BR2_PACKAGE_GVFS is not set
+# BR2_PACKAGE_HAL is not set
+# BR2_PACKAGE_HWDATA is not set
+# BR2_PACKAGE_I2C_TOOLS is not set
+# BR2_PACKAGE_INPUT_EVENT_DAEMON is not set
+# BR2_PACKAGE_INPUT_TOOLS is not set
+# BR2_PACKAGE_IOSTAT is not set
+# BR2_PACKAGE_IRDA_UTILS is not set
+# BR2_PACKAGE_KBD is not set
+# BR2_PACKAGE_LIBV4L is not set
+# BR2_PACKAGE_LM_SENSORS is not set
+# BR2_PACKAGE_LSUIO is not set
+# BR2_PACKAGE_LVM2 is not set
+# BR2_PACKAGE_MAKEDEVS is not set
+# BR2_PACKAGE_MDADM is not set
+# BR2_PACKAGE_MEMTESTER is not set
+# BR2_PACKAGE_MTD is not set
+# BR2_PACKAGE_NTFS_3G is not set
+# BR2_PACKAGE_NTFSPROGS is not set
+# BR2_PACKAGE_PCIUTILS is not set
+# BR2_PACKAGE_RNG_TOOLS is not set
+# BR2_PACKAGE_SDPARM is not set
+# BR2_PACKAGE_SETSERIAL is not set
+# BR2_PACKAGE_SMARTMONTOOLS is not set
+# BR2_PACKAGE_SQUASHFS is not set
+# BR2_PACKAGE_SSHFS is not set
+# BR2_PACKAGE_SYSSTAT is not set
+# BR2_PACKAGE_UDEV is not set
+# BR2_PACKAGE_USB_MODESWITCH is not set
+# BR2_PACKAGE_USBMOUNT is not set
+# BR2_PACKAGE_USBUTILS is not set
+# BR2_PACKAGE_WIPE is not set
+# BR2_PACKAGE_XFSPROGS is not set
+
+#
+# Interpreter languages and scripting
+#
+# BR2_PACKAGE_HASERL is not set
+# BR2_PACKAGE_LUA is not set
+# BR2_PACKAGE_MICROPERL is not set
+# BR2_PACKAGE_PHP is not set
+# BR2_PACKAGE_PYTHON is not set
+# BR2_PACKAGE_RUBY is not set
+# BR2_PACKAGE_TCL is not set
+
+#
+# Libraries
+#
+
+#
+# Compression and decompression
+#
+# BR2_PACKAGE_LIBARCHIVE is not set
+# BR2_PACKAGE_LZO is not set
+# BR2_PACKAGE_ZLIB is not set
+
+#
+# Crypto
+#
+# BR2_PACKAGE_BEECRYPT is not set
+# BR2_PACKAGE_LIBGCRYPT is not set
+# BR2_PACKAGE_LIBGPG_ERROR is not set
+# BR2_PACKAGE_OPENSSL is not set
+
+#
+# Database
+#
+# BR2_PACKAGE_BERKELEYDB is not set
+# BR2_PACKAGE_MYSQL_CLIENT is not set
+# BR2_PACKAGE_SQLITE is not set
+
+#
 # Filesystem
-BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
-BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
-BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
-BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
-BR2_TARGET_ROOTFS_JFFS2_LE=y
+#
+# BR2_PACKAGE_GAMIN is not set
+# BR2_PACKAGE_LIBCONFIG is not set
+# BR2_PACKAGE_LIBCONFUSE is not set
+# BR2_PACKAGE_LIBFUSE is not set
+# BR2_PACKAGE_LIBLOCKFILE is not set
+# BR2_PACKAGE_LIBSYSFS is not set
+
+#
+# Graphics
+#
+# BR2_PACKAGE_ATK is not set
+# BR2_PACKAGE_CAIRO is not set
+# BR2_PACKAGE_FONTCONFIG is not set
+# BR2_PACKAGE_FREETYPE is not set
+# BR2_PACKAGE_JPEG is not set
+# BR2_PACKAGE_LIBART is not set
+# BR2_PACKAGE_LIBEXIF is not set
+# BR2_PACKAGE_GDK_PIXBUF is not set
+# BR2_PACKAGE_LIBPNG is not set
+# BR2_PACKAGE_LIBRAW is not set
+# BR2_PACKAGE_LIBSVGTINY is not set
+# BR2_PACKAGE_LIBUNGIF is not set
+# BR2_PACKAGE_PANGO is not set
+# BR2_PACKAGE_PIXMAN is not set
+# BR2_PACKAGE_TIFF is not set
+
+#
+# webkit requires C++, WCHAR in toolchain and libgtk2
+#
+
+#
+# Hardware handling
+#
+# BR2_PACKAGE_LIBAIO is not set
+# BR2_PACKAGE_LIBRAW1394 is not set
+# BR2_PACKAGE_TSLIB is not set
+# BR2_PACKAGE_LIBHID is not set
+# BR2_PACKAGE_LIBUSB is not set
+
+#
+# Networking
+#
+# BR2_PACKAGE_LIBCGI is not set
+# BR2_PACKAGE_LIBCGICC is not set
+# BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
+# BR2_PACKAGE_LIBEXOSIP2 is not set
+# BR2_PACKAGE_LIBIDN is not set
+# BR2_PACKAGE_LIBMICROHTTPD is not set
+# BR2_PACKAGE_NEON is not set
+# BR2_PACKAGE_LIBNL is not set
+# BR2_PACKAGE_LIBPCAP is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
+# BR2_PACKAGE_LIBRSYNC is not set
+# BR2_PACKAGE_LIBSOUP is not set
+# BR2_PACKAGE_LIBUPNP is not set
+
+#
+# Other
+#
+# BR2_PACKAGE_ARGP_STANDALONE is not set
+# BR2_PACKAGE_LIBATOMIC_OPS is not set
+# BR2_PACKAGE_LIBCAP is not set
+# BR2_PACKAGE_LIBDAEMON is not set
+# BR2_PACKAGE_LIBELF is not set
+# BR2_PACKAGE_LIBEVENT is not set
+# BR2_PACKAGE_LIBFFI is not set
+# BR2_PACKAGE_LIBGLIB2 is not set
+# BR2_PACKAGE_LIBOIL is not set
+# BR2_PACKAGE_LIBSIGC is not set
+
+#
+# Text and terminal handling
+#
+# BR2_PACKAGE_ENCHANT is not set
+# BR2_PACKAGE_ICU is not set
+# BR2_PACKAGE_NCURSES is not set
+# BR2_PACKAGE_NEWT is not set
+# BR2_PACKAGE_PCRE is not set
+# BR2_PACKAGE_POPT is not set
+# BR2_PACKAGE_READLINE is not set
+# BR2_PACKAGE_SLANG is not set
+
+#
+# XML
+#
+# BR2_PACKAGE_EXPAT is not set
+# BR2_PACKAGE_EZXML is not set
+# BR2_PACKAGE_LIBXML2 is not set
+# BR2_PACKAGE_LIBXSLT is not set
+# BR2_PACKAGE_XERCES is not set
+
+#
+# Miscellaneous
+#
+# BR2_PACKAGE_SHARED_MIME_INFO is not set
+
+#
+# Networking applications
+#
+# BR2_PACKAGE_ARGUS is not set
+# BR2_PACKAGE_AVAHI is not set
+# BR2_PACKAGE_AXEL is not set
+# BR2_PACKAGE_BIND is not set
+# BR2_PACKAGE_BMON is not set
+# BR2_PACKAGE_BRIDGE is not set
+# BR2_PACKAGE_BWM_NG is not set
+# BR2_PACKAGE_CAN_UTILS is not set
+# BR2_PACKAGE_CTORRENT is not set
+# BR2_PACKAGE_CUPS is not set
+# BR2_PACKAGE_DNSMASQ is not set
+# BR2_PACKAGE_DROPBEAR is not set
+# BR2_PACKAGE_ETHTOOL is not set
+# BR2_PACKAGE_HOSTAPD is not set
+# BR2_PACKAGE_IFPLUGD is not set
+# BR2_PACKAGE_IPERF is not set
+# BR2_PACKAGE_IPROUTE2 is not set
+# BR2_PACKAGE_IPSEC_TOOLS is not set
+# BR2_PACKAGE_IPTABLES is not set
+# BR2_PACKAGE_IW is not set
+# BR2_PACKAGE_KISMET is not set
+# BR2_PACKAGE_XL2TP is not set
+# BR2_PACKAGE_LINKS is not set
+# BR2_PACKAGE_LRZSZ is not set
+# BR2_PACKAGE_MII_DIAG is not set
+# BR2_PACKAGE_MROUTED is not set
+# BR2_PACKAGE_MUTT is not set
+# BR2_PACKAGE_NBD is not set
+# BR2_PACKAGE_NCFTP is not set
+# BR2_PACKAGE_NETPLUG is not set
+# BR2_PACKAGE_NETSNMP is not set
+# BR2_PACKAGE_NETSTAT_NAT is not set
+# BR2_PACKAGE_NFS_UTILS is not set
+# BR2_PACKAGE_NGIRCD is not set
+# BR2_PACKAGE_NTP is not set
+# BR2_PACKAGE_NUTTCP is not set
+# BR2_PACKAGE_OLSR is not set
+# BR2_PACKAGE_OPENNTPD is not set
+# BR2_PACKAGE_OPENSSH is not set
+# BR2_PACKAGE_OPENVPN is not set
+# BR2_PACKAGE_PORTMAP is not set
+# BR2_PACKAGE_PPPD is not set
+# BR2_PACKAGE_RADVD is not set
+# BR2_PACKAGE_PPTP_LINUX is not set
+# BR2_PACKAGE_PROFTPD is not set
+# BR2_PACKAGE_QUAGGA is not set
+# BR2_PACKAGE_RSH_REDONE is not set
+# BR2_PACKAGE_RSYNC is not set
+# BR2_PACKAGE_SAMBA is not set
+# BR2_PACKAGE_SER2NET is not set
+# BR2_PACKAGE_SOCAT is not set
+# BR2_PACKAGE_SPAWN_FCGI is not set
+# BR2_PACKAGE_SQUID is not set
+# BR2_PACKAGE_TCPDUMP is not set
+# BR2_PACKAGE_DHCPDUMP is not set
+# BR2_PACKAGE_TCPREPLAY is not set
+# BR2_PACKAGE_TN5250 is not set
+# BR2_PACKAGE_TTCP is not set
+# BR2_PACKAGE_UDPCAST is not set
+# BR2_PACKAGE_VPNC is not set
+# BR2_PACKAGE_VSFTPD is not set
+# BR2_PACKAGE_VTUN is not set
+# BR2_PACKAGE_WIRELESS_TOOLS is not set
+# BR2_PACKAGE_WPA_SUPPLICANT is not set
+
+#
+# Package managers
+#
+# BR2_PACKAGE_IPKG is not set
+
+#
+# Shell and utilities
+#
+# BR2_PACKAGE_AT is not set
+# BR2_PACKAGE_DIALOG is not set
+# BR2_PACKAGE_FILE is not set
+# BR2_PACKAGE_LOCKFILE_PROGS is not set
+# BR2_PACKAGE_LOGROTATE is not set
+# BR2_PACKAGE_SCREEN is not set
+# BR2_PACKAGE_SUDO is not set
+# BR2_PACKAGE_WHICH is not set
+# BR2_PACKAGE_XMLSTARLET is not set
+
+#
+# System tools
+#
+# BR2_PACKAGE_HTOP is not set
+
+#
+# Text editors and viewers
+#
+# BR2_PACKAGE_ED is not set
+# BR2_PACKAGE_NANO is not set
+# BR2_PACKAGE_UEMACS is not set
+
+#
+# Filesystem images
+#
+# BR2_TARGET_ROOTFS_CRAMFS is not set
+# BR2_TARGET_ROOTFS_CLOOP is not set
+# BR2_TARGET_ROOTFS_EXT2 is not set
+# BR2_TARGET_ROOTFS_JFFS2 is not set
+# BR2_TARGET_ROOTFS_UBIFS is not set
+# BR2_TARGET_ROOTFS_SQUASHFS is not set
 BR2_TARGET_ROOTFS_TAR=y
+BR2_TARGET_ROOTFS_TAR_NONE=y
+# BR2_TARGET_ROOTFS_TAR_GZIP is not set
+# BR2_TARGET_ROOTFS_TAR_BZIP2 is not set
+# BR2_TARGET_ROOTFS_TAR_LZMA is not set
+BR2_TARGET_ROOTFS_TAR_OPTIONS=""
+# BR2_TARGET_ROOTFS_CPIO is not set
+# BR2_TARGET_ROOTFS_INITRAMFS is not set
+# BR2_TARGET_ROOTFS_ROMFS is not set
 
-# Bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mini2440"
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://repo.or.cz/w/u-boot-openmoko/mini2440.git/snapshot/dev-mini2440-stable.tar.gz"
+#
+# Bootloaders
+#
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="mini2440"
+# BR2_TARGET_BAREBOX_BAREBOXENV is not set
+# BR2_TARGET_UBOOT is not set
+# BR2_TARGET_AT91BOOTSTRAP is not set
+# BR2_TARGET_DATAFLASHBOOT is not set
 
 #
 # Kernel
 #
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="http://www.pauljones.id.au/temp/linux-2.6.32.2-mini2440_20100113.tgz"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/friendlyarm/mini2440/linux-2.6.32.2.config"
+BR2_LINUX_KERNEL_2_6_38=y
+# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
+# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
+BR2_LINUX_KERNEL_VERSION="2.6.38.6"
+BR2_LINUX_KERNEL_PATCH="board/friendlyarm/mini2440/*"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+# BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG is not set
+BR2_LINUX_KERNEL_DEFCONFIG="mini2440"
 BR2_LINUX_KERNEL_UIMAGE=y
+# BR2_LINUX_KERNEL_ZIMAGE is not set
+# BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM is not set
-- 
1.7.4.1
