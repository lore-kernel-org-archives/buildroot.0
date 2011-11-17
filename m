From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Thu, 17 Nov 2011 11:21:41 +0100
Subject: [Buildroot] [PATCH] Add Armadeus systems APF9328 support.
Message-ID: <1321525301-13110-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

The APF9328 is an i.MXL+FPGA based SOM (System On Module). Here only minimal support is added: booting Linux kernel (UART, Ethernet and NOR), Buildroot toolchain and JFFS2 rootfs.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
---
 ...1.1-0001-fixes_arm_mach-types_for_apf9328.patch |   26 ++++++++++++++++++++
 ...002-add_missing_config_option_for_apf9328.patch |   16 ++++++++++++
 configs/armadeus_apf9328_defconfig                 |   25 +++++++++++++++++++
 3 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch
 create mode 100644 board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch
 create mode 100644 configs/armadeus_apf9328_defconfig

diff --git a/board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch b/board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch
new file mode 100644
index 0000000..aa464a3
--- /dev/null
+++ b/board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch
@@ -0,0 +1,26 @@
+From 053ba505eb0d40287ac5750daf454af0aed2ce75 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
+Date: Tue, 4 Oct 2011 14:19:58 +0200
+Subject: [PATCH 1/2] [ARM] mach-types: Re-add apf9328
+
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
+---
+ arch/arm/tools/mach-types |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
+index fff68d0..07811a7 100644
+--- a/arch/arm/tools/mach-types
++++ b/arch/arm/tools/mach-types
+@@ -188,6 +188,7 @@ omap_2430sdp		MACH_OMAP_2430SDP	OMAP_2430SDP		900
+ davinci_evm		MACH_DAVINCI_EVM	DAVINCI_EVM		901
+ palmz72			MACH_PALMZ72		PALMZ72			904
+ nxdb500			MACH_NXDB500		NXDB500			905
++apf9328			MACH_APF9328		APF9328			906
+ palmt5			MACH_PALMT5		PALMT5			917
+ palmtc			MACH_PALMTC		PALMTC			918
+ omap_apollon		MACH_OMAP_APOLLON	OMAP_APOLLON		919
+-- 
+1.7.3.4
+
diff --git a/board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch b/board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch
new file mode 100644
index 0000000..312b9a0
--- /dev/null
+++ b/board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch
@@ -0,0 +1,16 @@
+APF9328 needs CONFIG_MTD_CFI_INTELEXT to boot on its NOR FLASH.
+
+Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
+
+Index: linux-3.1.1/arch/arm/mach-imx/Kconfig
+===================================================================
+--- linux-3.1.1.orig/arch/arm/mach-imx/Kconfig	2011-11-16 14:45:55.000000000 +0100
++++ linux-3.1.1/arch/arm/mach-imx/Kconfig	2011-11-16 14:47:20.000000000 +0100
+@@ -84,6 +84,7 @@
+ 	bool "APF9328"
+ 	select SOC_IMX1
+ 	select IMX_HAVE_PLATFORM_IMX_UART
++	select MTD_CFI_INTELEXT
+ 	help
+ 	  Say Yes here if you are using the Armadeus APF9328 development board
+ 
diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
new file mode 100644
index 0000000..f600c94
--- /dev/null
+++ b/configs/armadeus_apf9328_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_arm920t=y
+BR2_DL_DIR="$(BASE_DIR)/../downloads"
+BR2_SOURCEFORGE_MIRROR="switch"
+BR2_JLEVEL=1
+BR2_CCACHE=y
+BR2_STRIP_sstrip=y
+BR2_GCC_VERSION_4_4_X=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_GDB_HOST=y
+BR2_ENABLE_LOCALE_PURGE=y
+BR2_TARGET_OPTIMIZATION="-Os -pipe"
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
+BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
+BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TARGET_GENERIC_HOSTNAME="apf9328"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Armadeus development platform !"
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_TARGET_ROOTFS_JFFS2=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_PATCH="board/armadeus/apf9328"
+BR2_LINUX_KERNEL_DEFCONFIG="mx1"
-- 
1.7.4.1
