From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 20:50:26 +0100
Subject: [Buildroot] [PATCH 3/3] configs/apf9328: bump to a modern kernel
In-Reply-To: <1415649026-30847-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1415649026-30847-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1415649026-30847-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the apf9238 support is in the mainline kernel, we can bump to
kernel 3.17.2.

The patches can be removed because:

 - linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch is no
   longer needed, since the machine number for apf9328 is now
   upstream.

 - linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch is no
   longer needed, because the MTD_CFI_INTELEXT option is selected by
   the imx_v4_v5_defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...1.1-0001-fixes_arm_mach-types_for_apf9328.patch | 26 ----------------------
 ...002-add_missing_config_option_for_apf9328.patch | 16 -------------
 configs/armadeus_apf9328_defconfig                 | 10 ++++-----
 3 files changed, 5 insertions(+), 47 deletions(-)
 delete mode 100644 board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch
 delete mode 100644 board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch

diff --git a/board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch b/board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch
deleted file mode 100644
index aa464a3..0000000
--- a/board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 053ba505eb0d40287ac5750daf454af0aed2ce75 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
-Date: Tue, 4 Oct 2011 14:19:58 +0200
-Subject: [PATCH 1/2] [ARM] mach-types: Re-add apf9328
-
-
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@armadeus.com>
----
- arch/arm/tools/mach-types |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/arch/arm/tools/mach-types b/arch/arm/tools/mach-types
-index fff68d0..07811a7 100644
---- a/arch/arm/tools/mach-types
-+++ b/arch/arm/tools/mach-types
-@@ -188,6 +188,7 @@ omap_2430sdp		MACH_OMAP_2430SDP	OMAP_2430SDP		900
- davinci_evm		MACH_DAVINCI_EVM	DAVINCI_EVM		901
- palmz72			MACH_PALMZ72		PALMZ72			904
- nxdb500			MACH_NXDB500		NXDB500			905
-+apf9328			MACH_APF9328		APF9328			906
- palmt5			MACH_PALMT5		PALMT5			917
- palmtc			MACH_PALMTC		PALMTC			918
- omap_apollon		MACH_OMAP_APOLLON	OMAP_APOLLON		919
--- 
-1.7.3.4
-
diff --git a/board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch b/board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch
deleted file mode 100644
index 312b9a0..0000000
--- a/board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-APF9328 needs CONFIG_MTD_CFI_INTELEXT to boot on its NOR FLASH.
-
-Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
-
-Index: linux-3.1.1/arch/arm/mach-imx/Kconfig
-===================================================================
---- linux-3.1.1.orig/arch/arm/mach-imx/Kconfig	2011-11-16 14:45:55.000000000 +0100
-+++ linux-3.1.1/arch/arm/mach-imx/Kconfig	2011-11-16 14:47:20.000000000 +0100
-@@ -84,6 +84,7 @@
- 	bool "APF9328"
- 	select SOC_IMX1
- 	select IMX_HAVE_PLATFORM_IMX_UART
-+	select MTD_CFI_INTELEXT
- 	help
- 	  Say Yes here if you are using the Armadeus APF9328 development board
- 
diff --git a/configs/armadeus_apf9328_defconfig b/configs/armadeus_apf9328_defconfig
index 048bd28..3600199 100644
--- a/configs/armadeus_apf9328_defconfig
+++ b/configs/armadeus_apf9328_defconfig
@@ -15,8 +15,8 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 # Lock down headers to avoid breaking with new defaults
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.1.1"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1=y
+BR2_DEFAULT_KERNEL_VERSION="3.17"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_17=y
 
 # System
 BR2_TARGET_GENERIC_HOSTNAME="apf9328"
@@ -30,6 +30,6 @@ BR2_TARGET_ROOTFS_JFFS2=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1.1"
-BR2_LINUX_KERNEL_PATCH="board/armadeus/apf9328"
-BR2_LINUX_KERNEL_DEFCONFIG="mx1"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.17.2"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v4_v5"
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x08008000"
-- 
2.0.0
