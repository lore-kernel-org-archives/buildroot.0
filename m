From: Chris LaRocque <clarocq@gmail.com>
Date: Thu, 31 Dec 2015 20:10:25 -0500
Subject: [Buildroot] [PATCH 1/1] Updated the Beaglebone configuration:
Message-ID: <1451610625-20419-1-git-send-email-clarocq@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kernel from Beagleboard.org 4.1.13-ti-r36 with the beaglebone cape manager support.
uboot patches from https://github.com/eewiki/u-boot-patches/blob/master/v2015.10/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
DTC patched from https://github.com/RobertCNelson/dtc.git bb.org-4.1-dt-overlays5

Signed-off-by: Chris LaRocque <clarocq@gmail.com>
---
 board/beaglebone/linux-3.12.config                 | 251 -------
 ...cache-flush-management-symbols-when-MULTI.patch |  34 -
 .../0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch   | 754 +++++++++++++++++++++
 board/beaglebone/uEnv.txt                          |  14 +-
 configs/beaglebone_defconfig                       |  43 +-
 package/dtc/Config.in                              |   2 +-
 package/dtc/Config.in.host                         |   2 +-
 package/dtc/dtc.hash                               |   2 -
 package/dtc/dtc.mk                                 |   6 +-
 9 files changed, 804 insertions(+), 304 deletions(-)
 delete mode 100644 board/beaglebone/linux-3.12.config
 delete mode 100644 board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
 create mode 100644 board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
 delete mode 100644 package/dtc/dtc.hash

diff --git a/board/beaglebone/linux-3.12.config b/board/beaglebone/linux-3.12.config
deleted file mode 100644
index 0be5722..0000000
--- a/board/beaglebone/linux-3.12.config
+++ /dev/null
@@ -1,251 +0,0 @@
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_BSD_PROCESS_ACCT=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=16
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_EXPERT=y
-CONFIG_SLAB=y
-CONFIG_PROFILING=y
-CONFIG_KPROBES=y
-CONFIG_MODULES=y
-CONFIG_MODULE_FORCE_LOAD=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_FORCE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_MODULE_SRCVERSION_ALL=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_ARCH_OMAP2PLUS=y
-CONFIG_OMAP_RESET_CLOCKS=y
-CONFIG_OMAP_MUX_DEBUG=y
-CONFIG_ARCH_OMAP3=y
-CONFIG_ARCH_OMAP4=y
-CONFIG_SOC_AM43XX=y
-# CONFIG_ARCH_OMAP2PLUS_TYPICAL is not set
-# CONFIG_SOC_TI81XX is not set
-# CONFIG_MACH_OMAP3_BEAGLE is not set
-# CONFIG_MACH_DEVKIT8000 is not set
-# CONFIG_MACH_OMAP_LDP is not set
-# CONFIG_MACH_OMAP3530_LV_SOM is not set
-# CONFIG_MACH_OMAP3_TORPEDO is not set
-# CONFIG_MACH_OVERO is not set
-# CONFIG_MACH_OMAP3EVM is not set
-# CONFIG_MACH_OMAP3_PANDORA is not set
-# CONFIG_MACH_TOUCHBOOK is not set
-# CONFIG_MACH_OMAP_3430SDP is not set
-# CONFIG_MACH_NOKIA_RM680 is not set
-# CONFIG_MACH_NOKIA_RX51 is not set
-# CONFIG_MACH_OMAP_ZOOM2 is not set
-# CONFIG_MACH_OMAP_ZOOM3 is not set
-# CONFIG_MACH_CM_T35 is not set
-# CONFIG_MACH_CM_T3517 is not set
-# CONFIG_MACH_IGEP0020 is not set
-# CONFIG_MACH_IGEP0030 is not set
-# CONFIG_MACH_SBC3530 is not set
-# CONFIG_MACH_OMAP_3630SDP is not set
-CONFIG_ARM_THUMBEE=y
-CONFIG_HAVE_ARM_ARCH_TIMER=y
-CONFIG_PREEMPT=y
-CONFIG_AEABI=y
-CONFIG_HIGHMEM=y
-CONFIG_ZBOOT_ROM_TEXT=0x0
-CONFIG_ZBOOT_ROM_BSS=0x0
-CONFIG_CMDLINE="root=/dev/mmcblk0p2 rootwait console=ttyO2,115200"
-CONFIG_KEXEC=y
-CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_STAT_DETAILS=y
-CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
-CONFIG_CPU_FREQ_GOV_POWERSAVE=y
-CONFIG_CPU_FREQ_GOV_USERSPACE=y
-CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
-CONFIG_GENERIC_CPUFREQ_CPU0=y
-# CONFIG_ARM_OMAP2PLUS_CPUFREQ is not set
-CONFIG_FPE_NWFPE=y
-CONFIG_VFP=y
-CONFIG_NEON=y
-CONFIG_BINFMT_MISC=y
-CONFIG_PM_RUNTIME=y
-CONFIG_PM_DEBUG=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=y
-CONFIG_NET_KEY=y
-CONFIG_NET_KEY_MIGRATE=y
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-CONFIG_IP_PNP_BOOTP=y
-CONFIG_IP_PNP_RARP=y
-# CONFIG_INET_LRO is not set
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_OMAP_OCP2SCP=y
-CONFIG_CONNECTOR=y
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=16384
-CONFIG_CROSSBAR=y
-CONFIG_EEPROM_93CX6=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_MULTI_LUN=y
-CONFIG_SCSI_SCAN_ASYNC=y
-CONFIG_MD=y
-CONFIG_NETDEVICES=y
-# CONFIG_NET_VENDOR_ARC is not set
-# CONFIG_NET_CADENCE is not set
-# CONFIG_NET_VENDOR_BROADCOM is not set
-# CONFIG_NET_VENDOR_CIRRUS is not set
-# CONFIG_NET_VENDOR_FARADAY is not set
-# CONFIG_NET_VENDOR_INTEL is not set
-# CONFIG_NET_VENDOR_MARVELL is not set
-# CONFIG_NET_VENDOR_MICREL is not set
-# CONFIG_NET_VENDOR_NATSEMI is not set
-# CONFIG_NET_VENDOR_SEEQ is not set
-# CONFIG_NET_VENDOR_SMSC is not set
-# CONFIG_NET_VENDOR_STMICRO is not set
-CONFIG_TI_CPSW=y
-CONFIG_TI_CPTS=y
-# CONFIG_NET_VENDOR_VIA is not set
-# CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_AT803X_PHY=y
-CONFIG_SMSC_PHY=y
-# CONFIG_WLAN is not set
-# CONFIG_INPUT_MOUSEDEV is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-CONFIG_SERIO_LIBPS2=y
-# CONFIG_LEGACY_PTYS is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=32
-CONFIG_SERIAL_8250_EXTENDED=y
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_SHARE_IRQ=y
-CONFIG_SERIAL_8250_DETECT_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_OMAP=y
-CONFIG_SERIAL_OMAP_CONSOLE=y
-CONFIG_HW_RANDOM=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_OMAP=y
-CONFIG_SPI=y
-CONFIG_SPI_OMAP24XX=y
-CONFIG_SPI_TI_QSPI=y
-CONFIG_PINCTRL_SINGLE=y
-CONFIG_DEBUG_GPIO=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_W1=y
-CONFIG_POWER_SUPPLY=y
-CONFIG_THERMAL=y
-CONFIG_THERMAL_GOV_FAIR_SHARE=y
-CONFIG_THERMAL_GOV_USER_SPACE=y
-CONFIG_CPU_THERMAL=y
-CONFIG_TI_SOC_THERMAL=y
-CONFIG_TI_THERMAL=y
-CONFIG_WATCHDOG=y
-CONFIG_OMAP_WATCHDOG=y
-CONFIG_MFD_SYSCON=y
-CONFIG_MFD_TPS65217=y
-CONFIG_REGULATOR=y
-CONFIG_REGULATOR_FIXED_VOLTAGE=y
-CONFIG_REGULATOR_PBIAS=y
-CONFIG_REGULATOR_TPS65023=y
-CONFIG_REGULATOR_TPS6507X=y
-CONFIG_REGULATOR_TPS65217=y
-CONFIG_REGULATOR_TIAVSCLASS0=y
-CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_DA8XX=y
-CONFIG_FB_DA8XX_TDA998X=y
-CONFIG_OMAP2_DSS=y
-CONFIG_OMAP2_DSS_SDI=y
-CONFIG_OMAP2_DSS_DSI=y
-CONFIG_FB_OMAP2=y
-CONFIG_DISPLAY_CONNECTOR_HDMI=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_USB=y
-CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
-CONFIG_USB_MON=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_MUSB_HDRC=m
-CONFIG_USB_MUSB_OMAP2PLUS=m
-CONFIG_USB_MUSB_DSPS=m
-CONFIG_USB_TI_CPPI41_DMA=y
-CONFIG_USB_STORAGE=y
-CONFIG_AM335X_PHY_USB=y
-CONFIG_USB_GADGET=y
-CONFIG_USB_GADGET_DEBUG=y
-CONFIG_USB_GADGET_DEBUG_FS=y
-CONFIG_USB_ZERO=m
-CONFIG_USB_ETH=m
-CONFIG_USB_ETH_EEM=y
-CONFIG_USB_MASS_STORAGE=m
-CONFIG_USB_G_MULTI=m
-CONFIG_USB_G_MULTI_CDC=y
-CONFIG_MMC=y
-CONFIG_MMC_UNSAFE_RESUME=y
-CONFIG_SDIO_UART=y
-CONFIG_MMC_OMAP=y
-CONFIG_MMC_OMAP_HS=y
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=y
-CONFIG_LEDS_GPIO=y
-CONFIG_LEDS_TRIGGERS=y
-CONFIG_LEDS_TRIGGER_TIMER=y
-CONFIG_LEDS_TRIGGER_ONESHOT=y
-CONFIG_LEDS_TRIGGER_HEARTBEAT=y
-CONFIG_LEDS_TRIGGER_BACKLIGHT=y
-CONFIG_LEDS_TRIGGER_CPU=y
-CONFIG_LEDS_TRIGGER_GPIO=y
-CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_OMAP=y
-CONFIG_DMADEVICES=y
-CONFIG_TI_EDMA=y
-CONFIG_DMA_OMAP=y
-CONFIG_TI_CPPI41=y
-CONFIG_COMMON_CLK_DEBUG=y
-CONFIG_OMAP_USB2=y
-CONFIG_OMAP_PIPE3=y
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=y
-CONFIG_QUOTA=y
-CONFIG_QFMT_V2=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_INFO=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_SCHEDSTATS=y
-CONFIG_TIMER_STATS=y
-CONFIG_PROVE_LOCKING=y
-# CONFIG_DEBUG_BUGVERBOSE is not set
-CONFIG_CRYPTO_MANAGER=m
-CONFIG_CRYPTO_SHA256=m
-CONFIG_CRYPTO_DEFLATE=y
-CONFIG_CRYPTO_LZO=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
-# CONFIG_CRYPTO_HW is not set
-CONFIG_CRC_CCITT=y
-CONFIG_CRC_T10DIF=y
-CONFIG_CRC_ITU_T=y
-CONFIG_CRC7=y
-CONFIG_LIBCRC32C=y
-CONFIG_AVERAGE=y
diff --git a/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch b/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
deleted file mode 100644
index 1ca1e70..0000000
--- a/board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 29885f2f3d700341d322274db6ad085e601c0994 Mon Sep 17 00:00:00 2001
-From: Pantelis Antoniou <panto@antoniou-consulting.com>
-Date: Fri, 4 Jan 2013 00:32:33 +0200
-Subject: [PATCH 3/3] arm: Export cache flush management symbols when
- !MULTI_CACHE
-
-When compiling a kernel without CONFIG_MULTI_CACHE enabled the
-dma access functions end up not being exported. Fix it.
-
-Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
----
- arch/arm/kernel/setup.c |    9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
-index da1d1aa..dcb678c 100644
---- a/arch/arm/kernel/setup.c
-+++ b/arch/arm/kernel/setup.c
-@@ -923,3 +923,12 @@ const struct seq_operations cpuinfo_op = {
- 	.stop	= c_stop,
- 	.show	= c_show
- };
-+
-+/* export the cache management functions */
-+#ifndef MULTI_CACHE
-+
-+EXPORT_SYMBOL(__glue(_CACHE,_dma_map_area));
-+EXPORT_SYMBOL(__glue(_CACHE,_dma_unmap_area));
-+EXPORT_SYMBOL(__glue(_CACHE,_dma_flush_range));
-+
-+#endif
--- 
-1.7.10.4
-
diff --git a/board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch b/board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
new file mode 100644
index 0000000..eb2400d
--- /dev/null
+++ b/board/beaglebone/patches/uboot/0001-am335x_evm-uEnv.txt-bootz-n-fixes.patch
@@ -0,0 +1,754 @@
+From ef73464d93f58a2e6cb36059e7901741ea7828ef Mon Sep 17 00:00:00 2001
+From: Robert Nelson <robertcnelson@gmail.com>
+Date: Fri, 6 Nov 2015 14:04:43 -0600
+Subject: [PATCH] am335x_evm: uEnv.txt, bootz, n fixes
+
+Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
+---
+ arch/arm/cpu/armv7/am33xx/board.c |  36 ++++--
+ arch/arm/include/asm/omap_gpio.h  |   7 +-
+ board/ti/am335x/board.c           |  29 ++++-
+ board/ti/am335x/mux.c             |   2 -
+ common/image.c                    |   9 --
+ configs/am335x_evm_defconfig      |   1 -
+ drivers/gpio/omap_gpio.c          | 107 ++++++++--------
+ include/configs/am335x_evm.h      |  58 ++++++---
+ include/configs/ti_armv7_common.h | 249 +++++++++++++++++++++++++++++++++++++-
+ 9 files changed, 395 insertions(+), 103 deletions(-)
+
+diff --git a/arch/arm/cpu/armv7/am33xx/board.c b/arch/arm/cpu/armv7/am33xx/board.c
+index bd14326..5b1eb18 100644
+--- a/arch/arm/cpu/armv7/am33xx/board.c
++++ b/arch/arm/cpu/armv7/am33xx/board.c
+@@ -70,16 +70,38 @@ U_BOOT_DEVICES(am33xx_uarts) = {
+ };
+ #endif
+ 
++#ifdef CONFIG_DM_GPIO
++static const struct omap_gpio_platdata am33xx_gpio[] = {
++	{ 0, AM33XX_GPIO0_BASE, METHOD_GPIO_24XX },
++	{ 1, AM33XX_GPIO1_BASE, METHOD_GPIO_24XX },
++	{ 2, AM33XX_GPIO2_BASE, METHOD_GPIO_24XX },
++	{ 3, AM33XX_GPIO3_BASE, METHOD_GPIO_24XX },
++#ifdef CONFIG_AM43XX
++	{ 4, AM33XX_GPIO4_BASE, METHOD_GPIO_24XX },
++	{ 5, AM33XX_GPIO5_BASE, METHOD_GPIO_24XX },
++#endif
++};
++
++U_BOOT_DEVICES(am33xx_gpios) = {
++	{ "gpio_omap", &am33xx_gpio[0] },
++	{ "gpio_omap", &am33xx_gpio[1] },
++	{ "gpio_omap", &am33xx_gpio[2] },
++	{ "gpio_omap", &am33xx_gpio[3] },
++#ifdef CONFIG_AM43XX
++	{ "gpio_omap", &am33xx_gpio[4] },
++	{ "gpio_omap", &am33xx_gpio[5] },
++#endif
++};
+ 
+-#ifndef CONFIG_DM_GPIO
++#else
+ static const struct gpio_bank gpio_bank_am33xx[] = {
+-	{ (void *)AM33XX_GPIO0_BASE },
+-	{ (void *)AM33XX_GPIO1_BASE },
+-	{ (void *)AM33XX_GPIO2_BASE },
+-	{ (void *)AM33XX_GPIO3_BASE },
++	{ (void *)AM33XX_GPIO0_BASE, METHOD_GPIO_24XX },
++	{ (void *)AM33XX_GPIO1_BASE, METHOD_GPIO_24XX },
++	{ (void *)AM33XX_GPIO2_BASE, METHOD_GPIO_24XX },
++	{ (void *)AM33XX_GPIO3_BASE, METHOD_GPIO_24XX },
+ #ifdef CONFIG_AM43XX
+-	{ (void *)AM33XX_GPIO4_BASE },
+-	{ (void *)AM33XX_GPIO5_BASE },
++	{ (void *)AM33XX_GPIO4_BASE, METHOD_GPIO_24XX },
++	{ (void *)AM33XX_GPIO5_BASE, METHOD_GPIO_24XX },
+ #endif
+ };
+ 
+diff --git a/arch/arm/include/asm/omap_gpio.h b/arch/arm/include/asm/omap_gpio.h
+index ef38b63..839af54 100644
+--- a/arch/arm/include/asm/omap_gpio.h
++++ b/arch/arm/include/asm/omap_gpio.h
+@@ -23,19 +23,24 @@
+ 
+ #include <asm/arch/cpu.h>
+ 
++enum gpio_method {
++	METHOD_GPIO_24XX	= 4,
++};
++
+ #ifdef CONFIG_DM_GPIO
+ 
+ /* Information about a GPIO bank */
+ struct omap_gpio_platdata {
+ 	int bank_index;
+ 	ulong base;	/* address of registers in physical memory */
+-	const char *port_name;
++	enum gpio_method method;
+ };
+ 
+ #else
+ 
+ struct gpio_bank {
+ 	void *base;
++	int method;
+ };
+ 
+ extern const struct gpio_bank *const omap_gpio_bank;
+diff --git a/board/ti/am335x/board.c b/board/ti/am335x/board.c
+index 1dc2ed0..e6c5ed6 100644
+--- a/board/ti/am335x/board.c
++++ b/board/ti/am335x/board.c
+@@ -478,6 +478,24 @@ void sdram_init(void)
+  */
+ int board_init(void)
+ {
++	u32 sys_reboot;
++
++	sys_reboot = readl(PRM_RSTST);
++	if (sys_reboot & (1 << 9))
++		puts("Reset Source: IcePick reset has occurred.\n");
++
++	if (sys_reboot & (1 << 5))
++		puts("Reset Source: Global external warm reset has occurred.\n");
++
++	if (sys_reboot & (1 << 4))
++		puts("Reset Source: watchdog reset has occurred.\n");
++
++	if (sys_reboot & (1 << 1))
++		puts("Reset Source: Global warm SW reset has occurred.\n");
++
++	if (sys_reboot & (1 << 0))
++		puts("Reset Source: Power-on reset has occurred.\n");
++
+ #if defined(CONFIG_HW_WATCHDOG)
+ 	hw_watchdog_init();
+ #endif
+@@ -504,9 +522,14 @@ int board_late_init(void)
+ 	safe_string[sizeof(header.name)] = 0;
+ 	setenv("board_name", safe_string);
+ 
+-	strncpy(safe_string, (char *)header.version, sizeof(header.version));
+-	safe_string[sizeof(header.version)] = 0;
+-	setenv("board_rev", safe_string);
++	/* BeagleBone Green has 0x1a@[0], they are free to increment 'a' */
++	if ( (header.version[0] != 0x30) && (header.version[0] & (1 << 4)) ) {
++		setenv("board_rev", "BBG1");
++	} else {
++		strncpy(safe_string, (char *)header.version, sizeof(header.version));
++		safe_string[sizeof(header.version)] = 0;
++		setenv("board_rev", safe_string);
++	}
+ #endif
+ 
+ 	return 0;
+diff --git a/board/ti/am335x/mux.c b/board/ti/am335x/mux.c
+index 680f656..fd3da58 100644
+--- a/board/ti/am335x/mux.c
++++ b/board/ti/am335x/mux.c
+@@ -317,7 +317,6 @@ void enable_board_pin_mux(struct am335x_baseboard_id *header)
+ 	/* Do board-specific muxes. */
+ 	if (board_is_bone(header)) {
+ 		/* Beaglebone pinmux */
+-		configure_module_pin_mux(i2c1_pin_mux);
+ 		configure_module_pin_mux(mii1_pin_mux);
+ 		configure_module_pin_mux(mmc0_pin_mux);
+ #if defined(CONFIG_NAND)
+@@ -356,7 +355,6 @@ void enable_board_pin_mux(struct am335x_baseboard_id *header)
+ 		configure_module_pin_mux(mmc0_pin_mux_sk_evm);
+ 	} else if (board_is_bone_lt(header)) {
+ 		/* Beaglebone LT pinmux */
+-		configure_module_pin_mux(i2c1_pin_mux);
+ 		configure_module_pin_mux(mii1_pin_mux);
+ 		configure_module_pin_mux(mmc0_pin_mux);
+ #if defined(CONFIG_NAND) && defined(CONFIG_EMMC_BOOT)
+diff --git a/common/image.c b/common/image.c
+index e607109..c33749d 100644
+--- a/common/image.c
++++ b/common/image.c
+@@ -908,15 +908,6 @@ int boot_get_ramdisk(int argc, char * const argv[], bootm_headers_t *images,
+ 	*rd_start = 0;
+ 	*rd_end = 0;
+ 
+-#ifdef CONFIG_ANDROID_BOOT_IMAGE
+-	/*
+-	 * Look for an Android boot image.
+-	 */
+-	buf = map_sysmem(images->os.start, 0);
+-	if (genimg_get_format(buf) == IMAGE_FORMAT_ANDROID)
+-		select = argv[0];
+-#endif
+-
+ 	if (argc >= 2)
+ 		select = argv[1];
+ 
+diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
+index 96599c6..9e8c010 100644
+--- a/configs/am335x_evm_defconfig
++++ b/configs/am335x_evm_defconfig
+@@ -3,7 +3,6 @@ CONFIG_TARGET_AM335X_EVM=y
+ CONFIG_SPL=y
+ CONFIG_SPL_STACK_R=y
+ CONFIG_SPL_STACK_R_ADDR=0x82000000
+-CONFIG_SYS_EXTRA_OPTIONS="NAND"
+ # CONFIG_CMD_IMLS is not set
+ # CONFIG_CMD_FLASH is not set
+ # CONFIG_CMD_SETEXPR is not set
+diff --git a/drivers/gpio/omap_gpio.c b/drivers/gpio/omap_gpio.c
+index cd960dc..0a1e124 100644
+--- a/drivers/gpio/omap_gpio.c
++++ b/drivers/gpio/omap_gpio.c
+@@ -20,13 +20,9 @@
+  */
+ #include <common.h>
+ #include <dm.h>
+-#include <fdtdec.h>
+ #include <asm/gpio.h>
+ #include <asm/io.h>
+ #include <asm/errno.h>
+-#include <malloc.h>
+-
+-DECLARE_GLOBAL_DATA_PTR;
+ 
+ #define OMAP_GPIO_DIR_OUT	0
+ #define OMAP_GPIO_DIR_IN	1
+@@ -38,6 +34,7 @@ DECLARE_GLOBAL_DATA_PTR;
+ struct gpio_bank {
+ 	/* TODO(sjg at chromium.org): Can we use a struct here? */
+ 	void *base;	/* address of registers in physical memory */
++	enum gpio_method method;
+ };
+ 
+ #endif
+@@ -58,8 +55,13 @@ static void _set_gpio_direction(const struct gpio_bank *bank, int gpio,
+ 	void *reg = bank->base;
+ 	u32 l;
+ 
+-	reg += OMAP_GPIO_OE;
+-
++	switch (bank->method) {
++	case METHOD_GPIO_24XX:
++		reg += OMAP_GPIO_OE;
++		break;
++	default:
++		return;
++	}
+ 	l = __raw_readl(reg);
+ 	if (is_input)
+ 		l |= 1 << gpio;
+@@ -77,7 +79,13 @@ static int _get_gpio_direction(const struct gpio_bank *bank, int gpio)
+ 	void *reg = bank->base;
+ 	u32 v;
+ 
+-	reg += OMAP_GPIO_OE;
++	switch (bank->method) {
++	case METHOD_GPIO_24XX:
++		reg += OMAP_GPIO_OE;
++		break;
++	default:
++		return -1;
++	}
+ 
+ 	v = __raw_readl(reg);
+ 
+@@ -93,12 +101,19 @@ static void _set_gpio_dataout(const struct gpio_bank *bank, int gpio,
+ 	void *reg = bank->base;
+ 	u32 l = 0;
+ 
+-	if (enable)
+-		reg += OMAP_GPIO_SETDATAOUT;
+-	else
+-		reg += OMAP_GPIO_CLEARDATAOUT;
+-
+-	l = 1 << gpio;
++	switch (bank->method) {
++	case METHOD_GPIO_24XX:
++		if (enable)
++			reg += OMAP_GPIO_SETDATAOUT;
++		else
++			reg += OMAP_GPIO_CLEARDATAOUT;
++		l = 1 << gpio;
++		break;
++	default:
++		printf("omap3-gpio unknown bank method %s %d\n",
++		       __FILE__, __LINE__);
++		return;
++	}
+ 	__raw_writel(l, reg);
+ }
+ 
+@@ -107,13 +122,19 @@ static int _get_gpio_value(const struct gpio_bank *bank, int gpio)
+ 	void *reg = bank->base;
+ 	int input;
+ 
+-	input = _get_gpio_direction(bank, gpio);
+-	switch (input) {
+-	case OMAP_GPIO_DIR_IN:
+-		reg += OMAP_GPIO_DATAIN;
+-		break;
+-	case OMAP_GPIO_DIR_OUT:
+-		reg += OMAP_GPIO_DATAOUT;
++	switch (bank->method) {
++	case METHOD_GPIO_24XX:
++		input = _get_gpio_direction(bank, gpio);
++		switch (input) {
++		case OMAP_GPIO_DIR_IN:
++			reg += OMAP_GPIO_DATAIN;
++			break;
++		case OMAP_GPIO_DIR_OUT:
++			reg += OMAP_GPIO_DATAOUT;
++			break;
++		default:
++			return -1;
++		}
+ 		break;
+ 	default:
+ 		return -1;
+@@ -289,56 +310,24 @@ static int omap_gpio_probe(struct udevice *dev)
+ 	struct gpio_bank *bank = dev_get_priv(dev);
+ 	struct omap_gpio_platdata *plat = dev_get_platdata(dev);
+ 	struct gpio_dev_priv *uc_priv = dev_get_uclass_priv(dev);
++	char name[18], *str;
+ 
+-	uc_priv->bank_name = plat->port_name;
++	sprintf(name, "GPIO%d_", plat->bank_index);
++	str = strdup(name);
++	if (!str)
++		return -ENOMEM;
++	uc_priv->bank_name = str;
+ 	uc_priv->gpio_count = GPIO_PER_BANK;
+ 	bank->base = (void *)plat->base;
++	bank->method = plat->method;
+ 
+ 	return 0;
+ }
+ 
+-static int omap_gpio_bind(struct udevice *dev)
+-{
+-	struct omap_gpio_platdata *plat = dev->platdata;
+-	fdt_addr_t base_addr;
+-
+-	if (plat)
+-		return 0;
+-
+-	base_addr = dev_get_addr(dev);
+-	if (base_addr == FDT_ADDR_T_NONE)
+-		return -ENODEV;
+-
+-	/*
+-	* TODO:
+-	* When every board is converted to driver model and DT is
+-	* supported, this can be done by auto-alloc feature, but
+-	* not using calloc to alloc memory for platdata.
+-	*/
+-	plat = calloc(1, sizeof(*plat));
+-	if (!plat)
+-		return -ENOMEM;
+-
+-	plat->base = base_addr;
+-	plat->port_name = fdt_get_name(gd->fdt_blob, dev->of_offset, NULL);
+-	dev->platdata = plat;
+-
+-	return 0;
+-}
+-
+-static const struct udevice_id omap_gpio_ids[] = {
+-	{ .compatible = "ti,omap3-gpio" },
+-	{ .compatible = "ti,omap4-gpio" },
+-	{ .compatible = "ti,am4372-gpio" },
+-	{ }
+-};
+-
+ U_BOOT_DRIVER(gpio_omap) = {
+ 	.name	= "gpio_omap",
+ 	.id	= UCLASS_GPIO,
+ 	.ops	= &gpio_omap_ops,
+-	.of_match = omap_gpio_ids,
+-	.bind	= omap_gpio_bind,
+ 	.probe	= omap_gpio_probe,
+ 	.priv_auto_alloc_size = sizeof(struct gpio_bank),
+ };
+diff --git a/include/configs/am335x_evm.h b/include/configs/am335x_evm.h
+index 3cf768e..d3f8a23 100644
+--- a/include/configs/am335x_evm.h
++++ b/include/configs/am335x_evm.h
+@@ -17,6 +17,7 @@
+ #define __CONFIG_AM335X_EVM_H
+ 
+ #include <configs/ti_am335x_common.h>
++#define CONFIG_ENV_IS_NOWHERE
+ 
+ #ifndef CONFIG_SPL_BUILD
+ #ifndef CONFIG_FIT
+@@ -93,19 +94,24 @@
+ 		"root=${spiroot} " \
+ 		"rootfstype=${spirootfstype}\0" \
+ 	"bootenv=uEnv.txt\0" \
+-	"loadbootscript=load mmc ${mmcdev} ${loadaddr} boot.scr\0" \
+-	"bootscript=echo Running bootscript from mmc${mmcdev} ...; " \
++	"script=boot.scr\0" \
++	"scriptfile=${script}\0" \
++	"loadbootscript=load ${interface} ${bootpart} ${loadaddr} ${scriptfile};\0" \
++	"bootscript=echo Running bootscript from mmc${bootpart} ...; " \
+ 		"source ${loadaddr}\0" \
+-	"loadbootenv=load mmc ${mmcdev} ${loadaddr} ${bootenv}\0" \
+-	"importbootenv=echo Importing environment from mmc ...; " \
++	"loadbootenv=load ${interface} ${bootpart} ${loadaddr} ${bootenv}\0" \
++	"importbootenv=echo Importing environment from ${interface} ...; " \
+ 		"env import -t -r $loadaddr $filesize\0" \
+ 	"ramargs=setenv bootargs console=${console} " \
+ 		"${optargs} " \
+ 		"root=${ramroot} " \
+ 		"rootfstype=${ramrootfstype}\0" \
+-	"loadramdisk=load mmc ${mmcdev} ${rdaddr} ramdisk.gz\0" \
+-	"loadimage=load mmc ${bootpart} ${loadaddr} ${bootdir}/${bootfile}\0" \
+-	"loadfdt=load mmc ${bootpart} ${fdtaddr} ${bootdir}/${fdtfile}\0" \
++	"loadramdisk=load ${interface} ${mmcdev} ${rdaddr} ramdisk.gz\0" \
++	"loadimage=load ${interface} ${bootpart} ${loadaddr} ${bootdir}/${bootfile}\0" \
++	"loadrd=load ${interface} ${bootpart} ${rdaddr} ${bootdir}/${rdfile}; setenv rdsize ${filesize}\0" \
++	"loadfdt=echo loading ${fdtdir}/${fdtfile} ...; load ${interface} ${bootpart} ${fdtaddr} ${fdtdir}/${fdtfile}\0" \
++	"failumsboot=echo; echo FAILSAFE: U-Boot UMS (USB Mass Storage) enabled, media now available over the usb slave port ...; " \
++		"ums 0 ${interface} 1;\0" \
+ 	"mmcloados=run args_mmc; " \
+ 		"if test ${boot_fdt} = yes || test ${boot_fdt} = try; then " \
+ 			"if run loadfdt; then " \
+@@ -120,8 +126,8 @@
+ 		"else " \
+ 			"bootz; " \
+ 		"fi;\0" \
+-	"mmcboot=mmc dev ${mmcdev}; " \
+-		"if mmc rescan; then " \
++	"mmcboot=${interface} dev ${mmcdev}; " \
++		"if ${interface} rescan; then " \
+ 			"echo SD/MMC found on device ${mmcdev};" \
+ 			"if run loadbootscript; then " \
+ 				"run bootscript;" \
+@@ -149,27 +155,44 @@
+ 		"bootz ${loadaddr} ${rdaddr} ${fdtaddr}\0" \
+ 	"findfdt="\
+ 		"if test $board_name = A335BONE; then " \
+-			"setenv fdtfile am335x-bone.dtb; fi; " \
++			"setenv fdtfile am335x-bone.dtb; setenv fdtbase am335x-bone; fi; " \
+ 		"if test $board_name = A335BNLT; then " \
+-			"setenv fdtfile am335x-boneblack.dtb; fi; " \
++			"if test $board_rev = BBG1; then " \
++				"setenv fdtfile am335x-bonegreen.dtb; setenv fdtbase am335x-bonegreen; " \
++			"elif test $board_rev = AIA0; then " \
++				"setenv fdtfile am335x-abbbi.dtb; setenv fdtbase am335x-abbbi; " \
++			"else " \
++				"setenv fdtfile am335x-boneblack.dtb; setenv fdtbase am335x-boneblack; " \
++			"fi; " \
++		"fi; " \
+ 		"if test $board_name = A33515BB; then " \
+ 			"setenv fdtfile am335x-evm.dtb; fi; " \
+ 		"if test $board_name = A335X_SK; then " \
+ 			"setenv fdtfile am335x-evmsk.dtb; fi; " \
+ 		"if test $fdtfile = undefined; then " \
+ 			"echo WARNING: Could not determine device tree to use; fi; \0" \
++	EEWIKI_NFS \
++	EEWIKI_BOOT \
++	EEWIKI_UNAME_BOOT \
+ 	NANDARGS \
+ 	NETARGS \
+ 	DFUARGS
+ #endif
+ 
+ #define CONFIG_BOOTCOMMAND \
++	"gpio set 53; " \
+ 	"run findfdt; " \
+-	"run mmcboot;" \
++	"setenv interface mmc; " \
++	"setenv mmcdev 0; " \
++	"setenv bootpart 0:1; " \
++	"run boot;" \
++	"gpio clear 56; " \
++	"gpio clear 55; " \
++	"gpio clear 54; " \
+ 	"setenv mmcdev 1; " \
+-	"setenv bootpart 1:2; " \
+-	"run mmcboot;" \
+-	"run nandboot;"
++	"setenv bootpart 1:1; " \
++	"run boot;" \
++	"run failumsboot;"
+ 
+ /* NS16550 Configuration */
+ #define CONFIG_SYS_NS16550_COM1		0x44e09000	/* Base EVM has UART0 */
+@@ -309,9 +332,8 @@
+ #endif
+ 
+ #ifdef CONFIG_USB_MUSB_GADGET
+-#define CONFIG_USB_ETHER
+-#define CONFIG_USB_ETH_RNDIS
+-#define CONFIG_USBNET_HOST_ADDR	"de:ad:be:af:00:00"
++#define CONFIG_CMD_USB_MASS_STORAGE
++#define CONFIG_USB_FUNCTION_MASS_STORAGE
+ 
+ /* USB TI's IDs */
+ #define CONFIG_G_DNL_VENDOR_NUM 0x0451
+diff --git a/include/configs/ti_armv7_common.h b/include/configs/ti_armv7_common.h
+index 6dc6515..8bf975b 100644
+--- a/include/configs/ti_armv7_common.h
++++ b/include/configs/ti_armv7_common.h
+@@ -61,11 +61,254 @@
+ #define DEFAULT_MMC_TI_ARGS \
+ 	"mmcdev=0\0" \
+ 	"mmcrootfstype=ext4 rootwait\0" \
+-	"finduuid=part uuid mmc 0:2 uuid\0" \
++	"finduuid=part uuid ${interface} ${bootpart} uuid\0" \
+ 	"args_mmc=run finduuid;setenv bootargs console=${console} " \
+ 		"${optargs} " \
+-		"root=PARTUUID=${uuid} rw " \
+-		"rootfstype=${mmcrootfstype}\0"
++		"${cape_disable} " \
++		"${cape_enable} " \
++		"root=PARTUUID=${uuid} ro " \
++		"rootfstype=${mmcrootfstype} " \
++		"${cmdline}\0" \
++	"args_mmc_old=setenv bootargs console=${console} " \
++		"${optargs} " \
++		"${cape_disable} " \
++		"${cape_enable} " \
++		"root=${oldroot} ro " \
++		"rootfstype=${mmcrootfstype} " \
++		"${cmdline}\0" \
++	"args_mmc_uuid=setenv bootargs console=${console} " \
++		"${optargs} " \
++		"${cape_disable} " \
++		"${cape_enable} " \
++		"root=UUID=${uuid} ro " \
++		"rootfstype=${mmcrootfstype} " \
++		"${cmdline}\0" \
++	"args_uenv_root=setenv bootargs console=${console} " \
++		"${optargs} " \
++		"${cape_disable} " \
++		"${cape_enable} " \
++		"root=${uenv_root} ro " \
++		"rootfstype=${mmcrootfstype} " \
++		"${cmdline}\0" \
++	"args_netinstall=setenv bootargs ${netinstall_bootargs} " \
++		"${optargs} " \
++		"${cape_disable} " \
++		"${cape_enable} " \
++		"root=/dev/ram rw " \
++		"${cmdline}\0"
++
++#define EEWIKI_NFS \
++	"server_ip=192.168.1.100\0" \
++	"gw_ip=192.168.1.1\0" \
++	"netmask=255.255.255.0\0" \
++	"hostname=\0" \
++	"device=eth0\0" \
++	"autoconf=off\0" \
++	"root_dir=/home/userid/targetNFS\0" \
++	"tftp_dir=\0" \
++	"nfs_options=,vers=3\0" \
++	"nfsrootfstype=ext4 rootwait fixrtc\0" \
++	"nfsargs=setenv bootargs console=${console} " \
++		"${optargs} " \
++		"${cape_disable} " \
++		"${cape_enable} " \
++		"root=/dev/nfs rw " \
++		"rootfstype=${nfsrootfstype} " \
++		"nfsroot=${nfsroot} " \
++		"ip=${ip} " \
++		"${cmdline}\0" \
++	"nfsboot=echo Booting from ${server_ip} ...; " \
++		"setenv nfsroot ${server_ip}:${root_dir}${nfs_options}; " \
++		"setenv ip ${client_ip}:${server_ip}:${gw_ip}:${netmask}:${hostname}:${device}:${autoconf}; " \
++		"setenv autoload no; " \
++		"setenv serverip ${server_ip}; " \
++		"setenv ipaddr ${client_ip}; " \
++		"tftp ${loadaddr} ${tftp_dir}${bootfile}; " \
++		"tftp ${fdtaddr} ${tftp_dir}dtbs/${fdtfile}; " \
++		"run nfsargs; " \
++		"bootz ${loadaddr} - ${fdtaddr}\0" \
++	"nfsboot_uname_r=echo Booting from ${server_ip} ...; " \
++		"setenv nfsroot ${server_ip}:${root_dir}${nfs_options}; " \
++		"setenv ip ${client_ip}:${server_ip}:${gw_ip}:${netmask}:${hostname}:${device}:${autoconf}; " \
++		"setenv autoload no; " \
++		"setenv serverip ${server_ip}; " \
++		"setenv ipaddr ${client_ip}; " \
++		"tftp ${loadaddr} ${tftp_dir}vmlinuz-${uname_r}; " \
++		"tftp ${fdtaddr} ${tftp_dir}dtbs/${uname_r}/${fdtfile}; " \
++		"run nfsargs; " \
++		"bootz ${loadaddr} - ${fdtaddr}\0" \
++
++#define EEWIKI_BOOT \
++	"boot=${interface} dev ${mmcdev}; " \
++		"if ${interface} rescan; then " \
++			"gpio set 54;" \
++			"setenv bootpart ${mmcdev}:1; " \
++			"if test -e ${interface} ${bootpart} /etc/fstab; then " \
++				"setenv mmcpart 1;" \
++			"fi; " \
++			"echo Checking for: /uEnv.txt ...;" \
++			"if test -e ${interface} ${bootpart} /uEnv.txt; then " \
++				"if run loadbootenv; then " \
++					"gpio set 55;" \
++					"echo Loaded environment from ${bootenv};" \
++					"run importbootenv;" \
++				"fi;" \
++				"if test -n ${cape}; then " \
++					"if test -e ${interface} ${bootpart} ${fdtdir}/${fdtbase}-${cape}.dtb; then " \
++						"setenv fdtfile ${fdtbase}-${cape}.dtb; " \
++					"fi; " \
++					"echo using: $fdtfile...; " \
++				"fi; " \
++				"echo Checking if uenvcmd is set ...;" \
++				"if test -n ${uenvcmd}; then " \
++					"gpio set 56; " \
++					"echo Running uenvcmd ...;" \
++					"run uenvcmd;" \
++				"fi;" \
++				"echo Checking if client_ip is set ...;" \
++				"if test -n ${client_ip}; then " \
++					"if test -n ${dtb}; then " \
++						"setenv fdtfile ${dtb};" \
++						"echo using ${fdtfile} ...;" \
++					"fi;" \
++					"gpio set 56; " \
++					"if test -n ${uname_r}; then " \
++						"echo Running nfsboot_uname_r ...;" \
++						"run nfsboot_uname_r;" \
++					"fi;" \
++					"echo Running nfsboot ...;" \
++					"run nfsboot;" \
++				"fi;" \
++			"fi; " \
++			"echo Checking for: /${script} ...;" \
++			"if test -e ${interface} ${bootpart} /${script}; then " \
++				"gpio set 55;" \
++				"setenv scriptfile ${script};" \
++				"run loadbootscript;" \
++				"echo Loaded script from ${scriptfile};" \
++				"gpio set 56; " \
++				"run bootscript;" \
++			"fi; " \
++			"echo Checking for: /boot/${script} ...;" \
++			"if test -e ${interface} ${bootpart} /boot/${script}; then " \
++				"gpio set 55;" \
++				"setenv scriptfile /boot/${script};" \
++				"run loadbootscript;" \
++				"echo Loaded script from ${scriptfile};" \
++				"gpio set 56; " \
++				"run bootscript;" \
++			"fi; " \
++			"echo Checking for: /boot/uEnv.txt ...;" \
++			"for i in 1 2 3 4 5 6 7 ; do " \
++				"setenv mmcpart ${i};" \
++				"setenv bootpart ${mmcdev}:${mmcpart};" \
++				"if test -e ${interface} ${bootpart} /boot/uEnv.txt; then " \
++					"gpio set 55;" \
++					"load ${interface} ${bootpart} ${loadaddr} /boot/uEnv.txt;" \
++					"env import -t ${loadaddr} ${filesize};" \
++					"echo Loaded environment from /boot/uEnv.txt;" \
++					"if test -n ${dtb}; then " \
++						"setenv fdtfile ${dtb};" \
++						"echo Using: dtb=${fdtfile} ...;" \
++					"fi;" \
++					"echo Checking if uname_r is set in /boot/uEnv.txt...;" \
++					"if test -n ${uname_r}; then " \
++						"gpio set 56; " \
++						"setenv oldroot /dev/mmcblk${mmcdev}p${mmcpart};" \
++						"echo Running uname_boot ...;" \
++						"run uname_boot;" \
++					"fi;" \
++				"fi;" \
++			"done;" \
++		"fi;\0" \
++
++#define EEWIKI_UNAME_BOOT \
++	"uname_boot="\
++		"setenv bootdir /boot; " \
++		"setenv bootfile vmlinuz-${uname_r}; " \
++		"if test -e ${interface} ${bootpart} ${bootdir}/${bootfile}; then " \
++			"echo loading ${bootdir}/${bootfile} ...; "\
++			"run loadimage;" \
++			"setenv fdtdir /boot/dtbs/${uname_r}; " \
++			"if test -e ${interface} ${bootpart} ${fdtdir}/${fdtfile}; then " \
++				"run loadfdt;" \
++			"else " \
++				"setenv fdtdir /usr/lib/linux-image-${uname_r}; " \
++				"if test -e ${interface} ${bootpart} ${fdtdir}/${fdtfile}; then " \
++					"run loadfdt;" \
++				"else " \
++					"setenv fdtdir /lib/firmware/${uname_r}/device-tree; " \
++					"if test -e ${interface} ${bootpart} ${fdtdir}/${fdtfile}; then " \
++						"run loadfdt;" \
++					"else " \
++						"setenv fdtdir /boot/dtb-${uname_r}; " \
++						"if test -e ${interface} ${bootpart} ${fdtdir}/${fdtfile}; then " \
++							"run loadfdt;" \
++						"else " \
++							"setenv fdtdir /boot/dtbs; " \
++							"if test -e ${interface} ${bootpart} ${fdtdir}/${fdtfile}; then " \
++								"run loadfdt;" \
++							"else " \
++								"setenv fdtdir /boot/dtb; " \
++								"if test -e ${interface} ${bootpart} ${fdtdir}/${fdtfile}; then " \
++									"run loadfdt;" \
++								"else " \
++									"setenv fdtdir /boot; " \
++									"if test -e ${interface} ${bootpart} ${fdtdir}/${fdtfile}; then " \
++										"run loadfdt;" \
++									"else " \
++										"if test -e ${interface} ${bootpart} ${fdtfile}; then " \
++											"run loadfdt;" \
++										"else " \
++											"echo; echo unable to find [dtb=${fdtfile}] did you name it correctly? ...; " \
++											"run failumsboot;" \
++										"fi;" \
++									"fi;" \
++								"fi;" \
++							"fi;" \
++						"fi;" \
++					"fi;" \
++				"fi;" \
++			"fi; " \
++			"setenv rdfile initrd.img-${uname_r}; " \
++			"if test -e ${interface} ${bootpart} ${bootdir}/${rdfile}; then " \
++				"echo loading ${bootdir}/${rdfile} ...; "\
++				"run loadrd;" \
++				"if test -n ${netinstall_enable}; then " \
++					"run args_netinstall; run message;" \
++					"echo debug: [${bootargs}] ... ;" \
++					"echo debug: [bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}] ... ;" \
++					"bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}; " \
++				"fi;" \
++				"if test -n ${uenv_root}; then " \
++					"run args_uenv_root;" \
++					"echo debug: [${bootargs}] ... ;" \
++					"echo debug: [bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}] ... ;" \
++					"bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}; " \
++				"fi;" \
++				"if test -n ${uuid}; then " \
++					"run args_mmc_uuid;" \
++					"echo debug: [${bootargs}] ... ;" \
++					"echo debug: [bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}] ... ;" \
++					"bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}; " \
++				"fi;" \
++				"run args_mmc_old;" \
++				"echo debug: [${bootargs}] ... ;" \
++				"echo debug: [bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}] ... ;" \
++				"bootz ${loadaddr} ${rdaddr}:${rdsize} ${fdtaddr}; " \
++			"else " \
++				"if test -n ${uenv_root}; then " \
++					"run args_uenv_root;" \
++					"echo debug: [${bootargs}] ... ;" \
++					"echo debug: [bootz ${loadaddr} - ${fdtaddr}] ... ;" \
++					"bootz ${loadaddr} - ${fdtaddr}; " \
++				"fi;" \
++				"run args_mmc_old;" \
++				"echo debug: [${bootargs}] ... ;" \
++				"echo debug: [bootz ${loadaddr} - ${fdtaddr}] ... ;" \
++				"bootz ${loadaddr} - ${fdtaddr}; " \
++			"fi;" \
++		"fi;\0" \
+ 
+ /*
+  * Default to a quick boot delay.
+-- 
+2.6.2
+
diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
index e09fff5..b6de9ff 100644
--- a/board/beaglebone/uEnv.txt
+++ b/board/beaglebone/uEnv.txt
@@ -1,3 +1,13 @@
-bootpart=0:1
 bootdir=
-uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
+bootfile=zImage
+fdtfile=am335x-boneblack.dtb
+loadaddr=0x80007fc0
+fdtaddr=0x80F80000
+loadfdt=fatload mmc 0:1 ${fdtaddr} ${fdtfile}
+loaduimage=fatload mmc 0:1 ${loadaddr} ${bootfile}
+console=ttyO0,115200n8
+mmcroot=/dev/mmcblk0p2
+mmcrootfstype=ext2
+uenvcmd=mmc rescan; run loaduimage; run loadfdt; run fdtboot
+fdtboot=run mmc_args; run mmcargs; bootz ${loadaddr} - ${fdtaddr}
+mmc_args=setenv bootargs console=${console} ${optargs} root=${mmcroot} rw rootfstype=${mmcrootfstype} rootwait
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index ddb583c..dea34d9 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,14 +1,33 @@
 # architecture
+BR2_ARCH_HAS_MMU_OPTIONAL=y
 BR2_arm=y
+BR2_ARCH="arm"
+BR2_ENDIAN="LITTLE"
+BR2_GCC_TARGET_ABI="aapcs-linux"
+BR2_GCC_TARGET_CPU="cortex-a8"
+BR2_GCC_TARGET_FPU="neon"
+BR2_GCC_TARGET_FLOAT_ABI="hard"
+BR2_GCC_TARGET_MODE="arm"
+BR2_ARCH_HAS_ATOMICS=y
+BR2_BINFMT_SUPPORTS_SHARED=y
+BR2_BINFMT_ELF=y
+BR2_ARM_CPU_HAS_NEON=y
+BR2_ARM_CPU_HAS_VFPV2=y
+BR2_ARM_CPU_HAS_VFPV3=y
+BR2_ARM_CPU_HAS_ARM=y
+BR2_ARM_CPU_HAS_THUMB2=y
+BR2_ARM_CPU_ARMV7A=y
 BR2_cortex_a8=y
 BR2_ARM_EABIHF=y
+BR2_ARM_FPU_NEON=y
+BR2_ARM_INSTRUCTIONS_ARM=y
 
 # system
 BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/measbone/post-image.sh"
 
 # filesystem
 BR2_PACKAGE_AM33X_CM3=y
@@ -17,14 +36,17 @@ BR2_TARGET_ROOTFS_EXT2=y
 
 # lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.10"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
+BR2_DEFAULT_KERNEL_VERSION="4.1.13"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+BR2_DEFAULT_KERNEL_HEADERS="4.1.13"
 
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
+BR2_TARGET_UBOOT_LATEST_VERSION=y
+BR2_TARGET_UBOOT_VERSION="2015.10"
+BR2_TARGET_UBOOT_PATCH="$(TOPDIR)/board/beaglebone/patches/uboot/"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
@@ -32,11 +54,12 @@ BR2_TARGET_UBOOT_SPL_NAME="MLO"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"
-BR2_LINUX_KERNEL_PATCH="board/beaglebone/patches/linux/"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/beagleboard/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.1.13-ti-r36"
+BR2_LINUX_KERNEL_PATCH="board/measbone/patches/linux/"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/output/build/linux-4.1.13-ti-r36/arch/arm/configs/bb.org_defconfig"
 BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_USE_INTREE_DTS=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
diff --git a/package/dtc/Config.in b/package/dtc/Config.in
index 39223f7..ec44cfc 100644
--- a/package/dtc/Config.in
+++ b/package/dtc/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_DTC
 	  Note that only the library is installed.
 	  If you want the programs, say 'y' here, and to "dtc programs", below.
 
-	  https://git.kernel.org/cgit/utils/dtc/dtc.git
+	  https://github.com/RobertCNelson/dtc
 
 if BR2_PACKAGE_DTC
 
diff --git a/package/dtc/Config.in.host b/package/dtc/Config.in.host
index cbabf0a..196b702 100644
--- a/package/dtc/Config.in.host
+++ b/package/dtc/Config.in.host
@@ -6,4 +6,4 @@ config BR2_PACKAGE_HOST_DTC
 
 	  Install host tools: dtc, convert-dtsv0, fdtdump, fdtget and fdtput.
 
-	  https://git.kernel.org/cgit/utils/dtc/dtc.git
+	  https://github.com/RobertCNelson/dtc
diff --git a/package/dtc/dtc.hash b/package/dtc/dtc.hash
deleted file mode 100644
index 8b3af33..0000000
--- a/package/dtc/dtc.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# from https://www.kernel.org/pub/software/utils/dtc/sha256sums.asc
-sha256 77992ad8eac7b68f553d0ba58e5b51604ac803d126196c99e3ae38aaae28bb94  dtc-1.4.1.tar.xz
diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index f3b6f3b..dede664 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DTC_VERSION = 1.4.1
-DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
-DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
+DTC_VERSION = bb.org-4.1-dt-overlays5
+DTC_SITE = https://github.com/RobertCNelson/dtc
+DTC_SITE_METHOD = git
 DTC_LICENSE = GPLv2+/BSD-2c
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
-- 
1.8.1.4
