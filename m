From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Jan 2014 10:27:01 -0300
Subject: [Buildroot] [PATCH 2/2] configs/p1010rdb: bump to the latest and
	greatest versions
In-Reply-To: <1390310821-8881-1-git-send-email-gustavo@zacarias.com.ar>
References: <1390310821-8881-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1390310821-8881-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename the defconfig to note that it's explicitly intended for the PA
kit revision since it'll likely brick a PB if the bootloader is flashed
without changing the U-Boot board name (and that it's untested in real
hardware).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../p1010rdb/{linux-3.12.config => linux-3.13.config}    | 15 ++-------------
 board/freescale/p1010rdb/readme.txt                      | 16 +++++++++++++++-
 ...1010rdb_defconfig => freescale_p1010rdb_pa_defconfig} | 10 +++++-----
 3 files changed, 22 insertions(+), 19 deletions(-)
 rename board/freescale/p1010rdb/{linux-3.12.config => linux-3.13.config} (92%)
 rename configs/{freescale_p1010rdb_defconfig => freescale_p1010rdb_pa_defconfig} (79%)

diff --git a/board/freescale/p1010rdb/linux-3.12.config b/board/freescale/p1010rdb/linux-3.13.config
similarity index 92%
rename from board/freescale/p1010rdb/linux-3.12.config
rename to board/freescale/p1010rdb/linux-3.13.config
index 5cdb413..b91d312 100644
--- a/board/freescale/p1010rdb/linux-3.12.config
+++ b/board/freescale/p1010rdb/linux-3.13.config
@@ -1,13 +1,12 @@
 CONFIG_PPC_85xx=y
 CONFIG_PHYS_64BIT=y
-CONFIG_EXPERIMENTAL=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_AUDIT=y
 CONFIG_IRQ_DOMAIN_DEBUG=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_IKCONFIG=y
 CONFIG_IKCONFIG_PROC=y
 CONFIG_LOG_BUF_SHIFT=14
@@ -45,16 +44,13 @@ CONFIG_NET_IPIP=y
 CONFIG_IP_MROUTE=y
 CONFIG_IP_PIMSM_V1=y
 CONFIG_IP_PIMSM_V2=y
-CONFIG_ARPD=y
 CONFIG_INET_ESP=y
 # CONFIG_INET_XFRM_MODE_BEET is not set
-CONFIG_INET_LRO=y
 CONFIG_IPV6=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
-CONFIG_MTD_CHAR=y
 CONFIG_MTD_BLOCK=y
 CONFIG_FTL=y
 CONFIG_MTD_CFI=y
@@ -84,7 +80,6 @@ CONFIG_DUMMY=y
 CONFIG_GIANFAR=y
 CONFIG_VITESSE_PHY=y
 CONFIG_FIXED_PHY=y
-CONFIG_SERIO_LIBPS2=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=2
@@ -92,16 +87,13 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_DETECT_IRQ=y
 CONFIG_SERIAL_8250_RSA=y
-CONFIG_SERIAL_QE=m
 CONFIG_NVRAM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_CPM=m
 CONFIG_I2C_MPC=y
 CONFIG_SPI=y
 CONFIG_SPI_FSL_SPI=y
 CONFIG_SPI_FSL_ESPI=y
-CONFIG_GPIO_MPC8XXX=y
 # CONFIG_HWMON is not set
 CONFIG_USB=y
 CONFIG_USB_MON=y
@@ -118,9 +110,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_CMOS=y
 CONFIG_DMADEVICES=y
 CONFIG_FSL_DMA=y
-# CONFIG_NET_DMA is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_USE_FOR_EXT23=y
 CONFIG_MSDOS_FS=m
 CONFIG_VFAT_FS=y
 CONFIG_PROC_KCORE=y
@@ -132,12 +122,11 @@ CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
 CONFIG_NFSD=y
 CONFIG_CRC_T10DIF=y
+CONFIG_DEBUG_INFO=y
 CONFIG_DEBUG_FS=y
 CONFIG_DETECT_HUNG_TASK=y
-CONFIG_DEBUG_INFO=y
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_SHA512=y
-CONFIG_CRYPTO_AES=y
 # CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRYPTO_DEV_FSL_CAAM=y
diff --git a/board/freescale/p1010rdb/readme.txt b/board/freescale/p1010rdb/readme.txt
index 42706fd..b73ef4d 100644
--- a/board/freescale/p1010rdb/readme.txt
+++ b/board/freescale/p1010rdb/readme.txt
@@ -6,7 +6,21 @@ It won't work for NAND or SPI and will brick those bootloaders!
 Also don't go playing around with different U-boot versions or flash targets
 unless you've got the necessary hardware and/or know-how to unbrick your kit.
 
-2013.10 is known good for NOR.
+2014.01 is known good for NOR on the P1010RDB-PA kit.
+
+Freescale released a revised version of the kit with a faster processor and
+some other hardware changes named P1010RDB-PB. U-Boot needs to be configured
+differently for this kit hence this default config WILL NOT WORK.
+This is ONLY related to U-Boot, otherwise the configuration is the same,
+you can perfectly use the generated kernel and rootfs.
+
+IF you want to build an U-Boot for the new kit just change
+BR2_TARGET_UBOOT_BOARDNAME from P1010RDB-PA_NOR to P1010RDB-PB_NOR.
+!!!!! THIS IS COMPLETELY UNTESTED BY BR DEVS SO YOU ARE ON YOUR OWN !!!!!
+If it works we'd like to know so drop an email to the mailing list. Thanks.
+
+If your kit doesn't mention PA nor PB in their shipping inventory then it's
+the old version (PA).
 ******************** WARNING ********************
 
 You'll need to program the files created by buildroot into the flash.
diff --git a/configs/freescale_p1010rdb_defconfig b/configs/freescale_p1010rdb_pa_defconfig
similarity index 79%
rename from configs/freescale_p1010rdb_defconfig
rename to configs/freescale_p1010rdb_pa_defconfig
index 0a727c4..4921cca 100644
--- a/configs/freescale_p1010rdb_defconfig
+++ b/configs/freescale_p1010rdb_pa_defconfig
@@ -11,14 +11,14 @@ BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
 
 # Lock headers version to match and avoid breakage
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.13"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.13"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/freescale/p1010rdb/linux-3.13.config"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="p1010rdb"
@@ -29,6 +29,6 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="P1010RDB_NOR"
+BR2_TARGET_UBOOT_BOARDNAME="P1010RDB-PA_NOR"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2013.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2014.01"
-- 
1.8.3.2
