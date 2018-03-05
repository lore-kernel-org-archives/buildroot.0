From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Sun,  4 Mar 2018 20:47:00 -0600
Subject: [Buildroot] [PATCH] freescale_p1010rdb_pa_defconfig: remove board
Message-ID: <1520218020-17008-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This defconfig currently doesn't build with GCC6 (Linux 4.1).
https://gitlab.com/buildroot.org/buildroot/-/jobs/55306827

A maintainer w/board isn't available to make updates, so removing
this config.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 .gitlab-ci.yml                            |  1 -
 board/freescale/p1010rdb/linux-4.1.config | 70 -------------------------------
 board/freescale/p1010rdb/readme.txt       | 40 ------------------
 configs/freescale_p1010rdb_pa_defconfig   | 27 ------------
 4 files changed, 138 deletions(-)
 delete mode 100644 board/freescale/p1010rdb/linux-4.1.config
 delete mode 100644 board/freescale/p1010rdb/readme.txt
 delete mode 100644 configs/freescale_p1010rdb_pa_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f76e53b..a84bf63 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -123,7 +123,6 @@ freescale_imx6sxsabresd_defconfig: *defconfig
 freescale_imx6ulevk_defconfig: *defconfig
 freescale_imx7dsabresd_defconfig: *defconfig
 freescale_mpc8315erdb_defconfig: *defconfig
-freescale_p1010rdb_pa_defconfig: *defconfig
 friendlyarm_nanopi_a64_defconfig: *defconfig
 friendlyarm_nanopi_neo2_defconfig: *defconfig
 galileo_defconfig: *defconfig
diff --git a/board/freescale/p1010rdb/linux-4.1.config b/board/freescale/p1010rdb/linux-4.1.config
deleted file mode 100644
index 2de430c..0000000
--- a/board/freescale/p1010rdb/linux-4.1.config
+++ /dev/null
@@ -1,70 +0,0 @@
-CONFIG_PPC_85xx=y
-CONFIG_PHYS_64BIT=y
-CONFIG_SYSVIPC=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_LOG_BUF_SHIFT=14
-CONFIG_EXPERT=y
-CONFIG_MODULES=y
-CONFIG_P1010_RDB=y
-CONFIG_HIGHMEM=y
-CONFIG_SWIOTLB=y
-CONFIG_FORCE_MAX_ZONEORDER=12
-CONFIG_PCI=y
-CONFIG_PCI_MSI=y
-CONFIG_RAPIDIO=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_DEVTMPFS=y
-CONFIG_MTD=y
-CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_BLOCK=y
-CONFIG_FTL=y
-CONFIG_MTD_CFI=y
-CONFIG_MTD_CFI_INTELEXT=y
-CONFIG_MTD_CFI_AMDSTD=y
-CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_NAND=y
-CONFIG_MTD_NAND_FSL_ELBC=y
-CONFIG_MTD_NAND_FSL_IFC=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_ATA=y
-CONFIG_SATA_FSL=y
-CONFIG_NETDEVICES=y
-CONFIG_GIANFAR=y
-CONFIG_VITESSE_PHY=y
-CONFIG_FIXED_PHY=y
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_8250_NR_UARTS=2
-CONFIG_SERIAL_8250_RUNTIME_UARTS=2
-CONFIG_SERIAL_8250_MANY_PORTS=y
-CONFIG_SERIAL_8250_DETECT_IRQ=y
-CONFIG_SERIAL_8250_RSA=y
-CONFIG_NVRAM=y
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MPC=y
-CONFIG_SPI=y
-CONFIG_SPI_FSL_SPI=y
-CONFIG_SPI_FSL_ESPI=y
-CONFIG_USB=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_FSL=y
-CONFIG_USB_STORAGE=y
-CONFIG_MMC=y
-CONFIG_MMC_SDHCI=y
-CONFIG_MMC_SDHCI_PLTFM=y
-CONFIG_MMC_SDHCI_OF_ESDHC=y
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_CMOS=y
-CONFIG_DMADEVICES=y
-CONFIG_FSL_DMA=y
-CONFIG_EXT4_FS=y
-CONFIG_TMPFS=y
-CONFIG_JFFS2_FS=y
-CONFIG_SQUASHFS=y
-CONFIG_CRYPTO_DEV_FSL_CAAM=y
diff --git a/board/freescale/p1010rdb/readme.txt b/board/freescale/p1010rdb/readme.txt
deleted file mode 100644
index 025c97e..0000000
--- a/board/freescale/p1010rdb/readme.txt
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
-1. Program the DTB to NOR flash
-
-    => tftp $loadaddr p1010rdb-pa.dtb
-    => erase 0xee000000 +$filesize
-    => cp.b $loadaddr 0xee000000 $filesize
-
-2. Program the kernel to NOR flash
-
-    => tftp $loadaddr uImage
-    => erase 0xee080000 +$filesize
-    => cp.b $loadaddr 0xee080000 $filesize
-
-3. Program the root filesystem to NOR flash
-
-    => tftp $loadaddr rootfs.jffs2
-    => erase 0xee800000 0xeff5ffff
-    => cp.b $loadaddr 0xee800000 $filesize
-
-4. Booting your new system
-
-    => setenv norboot 'setenv bootargs root=/dev/mtdblock2 rootfstype=jffs2 console=$consoledev,$baudrate;bootm 0xee080000 - 0xee000000'
-
-    If you want to set this boot option as default:
-
-    => setenv bootcmd 'run norboot'
-    => saveenv
-
-    ...or for a single boot:
-
-    => run norboot
-
-    You can login with user "root".
diff --git a/configs/freescale_p1010rdb_pa_defconfig b/configs/freescale_p1010rdb_pa_defconfig
deleted file mode 100644
index 3497275..0000000
--- a/configs/freescale_p1010rdb_pa_defconfig
+++ /dev/null
@@ -1,27 +0,0 @@
-# Architecture
-BR2_powerpc=y
-BR2_powerpc_8548=y
-
-# Filesystem
-# BR2_TARGET_ROOTFS_TAR is not set
-BR2_TARGET_ROOTFS_JFFS2=y
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x20
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
-
-# Linux headers same as kernel, a 4.1 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.4"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-4.1.config"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb-pa"
-
-# Serial port config
-BR2_TARGET_GENERIC_GETTY=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
-- 
1.9.1
