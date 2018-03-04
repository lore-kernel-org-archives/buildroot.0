From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 23:00:39 +0100
Subject: [Buildroot] [PATCH] configs/freescale_mpc8315erdb: remove defconfig
Message-ID: <20180304220039.25832-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig currently fails to build the Linux kernel:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306826

In addition, the U-Boot build had already been removed in commit
12c01e4a05c8e4f4e0c4e8b74fac7824efdc8b41
("configs/freescale_mpc8315erdb: remove U-Boot build"), back in
October 2016, and nobody bothered fixing it.

This defconfig was originally contributed and maintained by Gustavo
Zacarias, but he is no longer active in Buildroot, and nobody
expressed interest in this defconfig, so let's get rid of it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                               |  1 -
 board/freescale/mpc8315erdb/linux-4.5.config | 70 ----------------------------
 board/freescale/mpc8315erdb/readme.txt       | 40 ----------------
 configs/freescale_mpc8315erdb_defconfig      | 28 -----------
 4 files changed, 139 deletions(-)
 delete mode 100644 board/freescale/mpc8315erdb/linux-4.5.config
 delete mode 100644 board/freescale/mpc8315erdb/readme.txt
 delete mode 100644 configs/freescale_mpc8315erdb_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f76e53b565..c8dd3d4a81 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -122,7 +122,6 @@ freescale_imx6sololiteevk_defconfig: *defconfig
 freescale_imx6sxsabresd_defconfig: *defconfig
 freescale_imx6ulevk_defconfig: *defconfig
 freescale_imx7dsabresd_defconfig: *defconfig
-freescale_mpc8315erdb_defconfig: *defconfig
 freescale_p1010rdb_pa_defconfig: *defconfig
 friendlyarm_nanopi_a64_defconfig: *defconfig
 friendlyarm_nanopi_neo2_defconfig: *defconfig
diff --git a/board/freescale/mpc8315erdb/linux-4.5.config b/board/freescale/mpc8315erdb/linux-4.5.config
deleted file mode 100644
index 8f56069309..0000000000
--- a/board/freescale/mpc8315erdb/linux-4.5.config
+++ /dev/null
@@ -1,70 +0,0 @@
-CONFIG_FSL_EMB_PERFMON=y
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_SYSCTL_SYSCALL=y
-CONFIG_EMBEDDED=y
-CONFIG_MODULES=y
-# CONFIG_PPC_CHRP is not set
-# CONFIG_PPC_PMAC is not set
-CONFIG_PPC_83xx=y
-CONFIG_MPC831x_RDB=y
-CONFIG_MCU_MPC8349EMITX=y
-CONFIG_PCI=y
-CONFIG_PCIEPORTBUS=y
-# CONFIG_PCIEASPM is not set
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_FSL_ELBC=y
-CONFIG_SCSI_MQ_DEFAULT=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_CONSTANTS=y
-CONFIG_ATA=y
-CONFIG_SATA_FSL=y
-CONFIG_NETDEVICES=y
-CONFIG_GIANFAR=y
-CONFIG_REALTEK_PHY=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MPC=y
-CONFIG_SPI=y
-CONFIG_SPI_FSL_SPI=y
-CONFIG_GPIO_SYSFS=y
-CONFIG_GPIO_MPC8XXX=y
-CONFIG_WATCHDOG=y
-CONFIG_8xxx_WDT=y
-CONFIG_USB=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_FSL=y
-CONFIG_USB_STORAGE=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_DS1307=y
-CONFIG_RTC_DRV_GENERIC=y
-CONFIG_DMADEVICES=y
-CONFIG_FSL_DMA=y
-CONFIG_ASYNC_TX_DMA=y
-CONFIG_EXT4_FS=y
-CONFIG_FANOTIFY=y
-CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
-CONFIG_SQUASHFS=y
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_CRYPTO_DEV_TALITOS=y
diff --git a/board/freescale/mpc8315erdb/readme.txt b/board/freescale/mpc8315erdb/readme.txt
deleted file mode 100644
index b4c87b4d4a..0000000000
--- a/board/freescale/mpc8315erdb/readme.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-You'll need to program the files created by buildroot into the flash.
-The fast way is to tftp transfer the files via one of the network interfaces.
-
-Alternatively you can transfer the files via serial console with an Ymodem
-file transfer from your terminal program by using a "loady" command
-from the u-boot prompt instead of the "tftp ..." commands stated below.
-Beware that serial console file transfers are quite slow!
-
-1. Program the kernel to NAND flash
-
-    => tftp $loadaddr uImage
-    => nand erase 0x100000 0x1e0000
-    => nand write $loadaddr 0x100000 0x1e0000
-
-2. Program the DTB to NAND flash
-
-    => tftp $loadaddr mpc8315erdb.dtb
-    => nand erase 0x2e0000 0x20000
-    => nand write $loadaddr 0x2e0000 0x20000
-
-3. Program the root filesystem to NAND flash
-
-    => tftp $loadaddr rootfs.jffs2
-    => nand erase 0x400000 0x1c00000
-    => nand write $loadaddr 0x400000 $filesize
-
-4. Booting your new system
-
-    => setenv nandboot 'setenv bootargs root=/dev/mtdblock3 rootfstype=jffs2 console=$consoledev,$baudrate;nand read $fdtaddr 0x2e0000 0x20000;nand read $loadaddr 0x100000 0x1e0000;bootm $loadaddr - $fdtaddr'
-
-    If you want to set this boot option as default:
-
-    => setenv bootcmd 'run nandboot'
-    => saveenv
-
-    ...or for a single boot:
-
-    => run nandboot
-
-    You can login with user "root".
diff --git a/configs/freescale_mpc8315erdb_defconfig b/configs/freescale_mpc8315erdb_defconfig
deleted file mode 100644
index de7e561352..0000000000
--- a/configs/freescale_mpc8315erdb_defconfig
+++ /dev/null
@@ -1,28 +0,0 @@
-# Architecture
-BR2_powerpc=y
-BR2_powerpc_e300c3=y
-
-# Filesystem
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x200
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x4000
-BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
-
-# Linux headers same as kernel, a 4.5 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5.3"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/mpc8315erdb/linux-4.5.config"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="mpc8315erdb"
-
-# Serial port config
-BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
2.14.3
