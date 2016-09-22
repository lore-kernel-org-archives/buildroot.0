From: Lothar Felten <lothar.felten@gmail.com>
Date: Fri, 23 Sep 2016 00:20:48 +0200
Subject: [Buildroot] [PATCH 1/2] configs: update beaglebone_defconfig
Message-ID: <1474582849-10730-1-git-send-email-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch updates the target config for the beaglebone based on the AM335x
CPU. It also supports the beagleboneblack, the TI evm and evmsk.
Device tree blobs for am335x-evm, am335x-evmsk, am335x-bone, am335x-boneblack
will be built and a sd card image is created with a post-image script.
The kernel and driver versions match the ti-processor-sdk 02.00.00.00.
Patches allow the use of old AM335x evm revisions (1 bit sd card) and JTAG
debugging.

Kernel JTAG patch:
By default the kernel will disable the JTAG clock, access via the JTAG port
will not work after the kernel booted. The AM335x-evm has a JTAG header fitted,
this patch keeps the JTAG clock alive.

Uboot SD card patch:
Early AM335x-evm boards can only use 1 bit communication to the SD card, on
newer board revisions this might be fixed.
Forcing 1 bit communication slows down the communication but will work
regardless if the SD card is attached via 1 or 4 bits.
If the board has a working 4 bit SD card interface, this patch can be removed,
this will speed up the access.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 board/beaglebone/genimage.cfg                      |   4 +-
 board/beaglebone/linux-3.12.config                 | 251 ---------------------
 .../0001-keep-jtag-clock-alive-for-debugger.patch  |  16 ++
 ...cache-flush-management-symbols-when-MULTI.patch |  34 ---
 .../uboot/0001-mmc-force-1bit-bus-width.patch      |  35 +++
 board/beaglebone/post-image.sh                     |   3 +-
 board/beaglebone/readme.txt                        |  74 +++---
 board/beaglebone/uEnv.txt                          |   3 +-
 configs/beaglebone_defconfig                       |  46 ++--
 9 files changed, 113 insertions(+), 353 deletions(-)
 delete mode 100644 board/beaglebone/linux-3.12.config
 create mode 100644 board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
 delete mode 100644 board/beaglebone/patches/linux/linux-0001-arm-Export-cache-flush-management-symbols-when-MULTI.patch
 create mode 100644 board/beaglebone/patches/uboot/0001-mmc-force-1bit-bus-width.patch

diff --git a/board/beaglebone/genimage.cfg b/board/beaglebone/genimage.cfg
index 0c29a80..ba60297 100644
--- a/board/beaglebone/genimage.cfg
+++ b/board/beaglebone/genimage.cfg
@@ -5,8 +5,10 @@ image boot.vfat {
 			"u-boot.img",
 			"zImage",
 			"uEnv.txt",
+			"am335x-evm.dtb",
+			"am335x-evmsk.dtb",
 			"am335x-bone.dtb",
-			"am335x-boneblack.dtb"
+			"am335x-boneblack.dtb",
 		}
 	}
 	size = 16M
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
diff --git a/board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch b/board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
new file mode 100644
index 0000000..8e36d9a
--- /dev/null
+++ b/board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch
@@ -0,0 +1,16 @@
+This patch keeps the debugSS clock alive, it clocks the JTAG macro and enables
+access to the SoC via JTAG after the kernel booted.
+
+Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
+---
+diff -Naur linux-orig/arch/arm/mach-omap2/omap_hwmod_33xx_data.c linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+--- linux-orig/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2015-10-02 17:30:56.000000000 +0200
++++ linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593/arch/arm/mach-omap2/omap_hwmod_33xx_data.c	2016-08-15 11:28:55.017617612 +0200
+@@ -208,6 +208,7 @@
+ 	.name		= "debugss",
+ 	.class		= &am33xx_debugss_hwmod_class,
+ 	.clkdm_name	= "l3_aon_clkdm",
++	.flags		= (HWMOD_INIT_NO_IDLE|HWMOD_INIT_NO_RESET), /* keep debugSS clock alive for JTAG */
+ 	.main_clk	= "trace_clk_div_ck",
+ 	.prcm		= {
+ 		.omap4	= {
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
diff --git a/board/beaglebone/patches/uboot/0001-mmc-force-1bit-bus-width.patch b/board/beaglebone/patches/uboot/0001-mmc-force-1bit-bus-width.patch
new file mode 100644
index 0000000..5e7b094
--- /dev/null
+++ b/board/beaglebone/patches/uboot/0001-mmc-force-1bit-bus-width.patch
@@ -0,0 +1,35 @@
+This patch forces the MMC interface to work in 1-bit-mode.
+Early AM335x-evm boards can only use 1 bit communication to the SD card, on
+newer board revisions this might be fixed.
+
+Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
+---
+diff -Naur a/drivers/mmc/mmc.c b/drivers/mmc/mmc.c
+--- a/drivers/mmc/mmc.c	2016-05-16 16:40:32.000000000 +0200
++++ b/drivers/mmc/mmc.c	2016-07-11 13:23:13.235880737 +0200
+@@ -1351,25 +1351,6 @@
+ 	mmc->card_caps &= mmc->cfg->host_caps;
+ 
+ 	if (IS_SD(mmc)) {
+-		if (mmc->card_caps & MMC_MODE_4BIT) {
+-			cmd.cmdidx = MMC_CMD_APP_CMD;
+-			cmd.resp_type = MMC_RSP_R1;
+-			cmd.cmdarg = mmc->rca << 16;
+-
+-			err = mmc_send_cmd(mmc, &cmd, NULL);
+-			if (err)
+-				return err;
+-
+-			cmd.cmdidx = SD_CMD_APP_SET_BUS_WIDTH;
+-			cmd.resp_type = MMC_RSP_R1;
+-			cmd.cmdarg = 2;
+-			err = mmc_send_cmd(mmc, &cmd, NULL);
+-			if (err)
+-				return err;
+-
+-			mmc_set_bus_width(mmc, 4);
+-		}
+-
+ 		if (mmc->card_caps & MMC_MODE_HS)
+ 			mmc->tran_speed = 50000000;
+ 		else
diff --git a/board/beaglebone/post-image.sh b/board/beaglebone/post-image.sh
index ceeec68..f0c2bc7 100755
--- a/board/beaglebone/post-image.sh
+++ b/board/beaglebone/post-image.sh
@@ -1,6 +1,7 @@
 #!/bin/sh
-# post-image.sh for BeagleBone
+# post-image.sh for CircuitCo BeagleBone and TI am335x-evm
 # 2014, Marcin Jabrzyk <marcin.jabrzyk@gmail.com>
+# 2016, Lothar Felten <lothar.felten@gmail.com>
 
 BOARD_DIR="$(dirname $0)"
 
diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index 664bde2..d8ff91e 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -1,44 +1,52 @@
-BeagleBone
+CircuitCo BeagleBone
+Texas Instuments AM335x Evaluation Module (TMDXEVM3358)
+
+Description
+===========
+
+This configuration will build a complete image for the beaglebone and the
+TI AM335x-EVM, the board type is identified by the on-board EEPROM.
+The configuration is based on the ti-processor-sdk-02.00.00.00.
+Device tree blobs for beaglebone variants and the evm-sk are built too.
 
-Intro
-=====
-To be able to use BeagleBone board with the images generated by
-Buildroot, you have to prepare the SDCard.
 
 How to build it
 ===============
 
-  $ make beaglebone_defconfig
-
-Then you can edit the build options using
+Select the default configuration for the target:
+$ make beaglebone_defconfig
 
-  $ make menuconfig
+Optional: modify the configuration:
+$ make menuconfig
 
-Compile all and build rootfs image:
+Build:
+$ make
 
-  $ make
 
 Result of the build
--------------------
-
-After building, you should get a tree like this:
-
-  output/images/
-  ??? am335x-boneblack.dtb
-  ??? am335x-bone.dtb
-  ??? MLO
-  ??? rootfs.ext2
-  ??? sdcard.img
-  ??? u-boot.img
-  ??? uEnv.txt
-  ??? zImage
-
-How to write the microSD card
-=============================
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card with "dd":
+===================
+output/images/
+??? am335x-boneblack.dtb
+??? am335x-bone.dtb
+??? am335x-evm.dtb
+??? am335x-evmsk.dtb
+??? boot.vfat
+??? MLO
+??? rootfs.ext2
+??? rootfs.tar
+??? sdcard.img
+??? u-boot.img
+??? uEnv.txt
+??? zImage
+
+To copy the image file to the sdcard use dd:
+dd if=output/images/sdcard.img of=/dev/XXX
+
+
+Tested hardware
+===============
+am335x-evm (rev. 1.1A)
+beagleboneblack (rev. A5A)
+beaglebone (rev. A6)
 
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
+2016, Lothar Felten <lothar.felten@gmail.com>
diff --git a/board/beaglebone/uEnv.txt b/board/beaglebone/uEnv.txt
index e09fff5..70b3b72 100644
--- a/board/beaglebone/uEnv.txt
+++ b/board/beaglebone/uEnv.txt
@@ -1,3 +1,4 @@
 bootpart=0:1
 bootdir=
-uenvcmd=run loadimage;run loadramdisk;run findfdt;run loadfdt;run ramboot
+bootargs=console=ttyO0,115200n8 root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait
+uenvcmd=run loadimage;run loadfdt;printenv bootargs;bootz ${loadaddr} - ${fdtaddr};
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 6c49abf..fdf6546 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -1,44 +1,26 @@
-# architecture
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_ARM_EABIHF=y
-
-# system
-BR2_TARGET_GENERIC_HOSTNAME="beaglebone"
+BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
-# BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
-
-# filesystem
-BR2_PACKAGE_AM33X_CM3=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
+BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
 BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-# BR2_TARGET_ROOTFS_TAR is not set
-
-# Linux headers same as kernel, a 3.12 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
-
-# bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="am335x_evm"
-BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.05"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="spl/u-boot-spl.bin"
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="MLO"
-
-# host packages
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-
-# kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7f280334068b7c875ade51f8f3921ab311f0c824"
-BR2_LINUX_KERNEL_PATCH="board/beaglebone/patches/linux"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/beaglebone/linux-3.12.config"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-bone am335x-boneblack"
-- 
1.9.1
