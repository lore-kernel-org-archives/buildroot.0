From: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Date: Fri,  2 Feb 2018 18:55:06 +0300
Subject: [Buildroot] [PATCH] configs/snps_arc*_defconfig: update linux
 version
Message-ID: <20180202155506.23564-1-Evgeniy.Didin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this commit we update Linux kernel version to 4.15 and
Linux headers version to 4.15.
Also patches for arc vdk are removed because these
changes were applied in Linux 4.15.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: arc-buildroot at synopsys.com
---
 ...002-arc-vdk-Add-support-of-MMC-controller.patch | 70 ----------------------
 .../linux/0003-arc-vdk-Add-support-of-UIO.patch    | 48 ---------------
 configs/snps_arc700_axs101_defconfig               |  6 +-
 configs/snps_archs38_axs103_defconfig              |  6 +-
 configs/snps_archs38_haps_defconfig                |  6 +-
 configs/snps_archs38_vdk_defconfig                 |  7 +--
 6 files changed, 12 insertions(+), 131 deletions(-)
 delete mode 100644 board/synopsys/vdk/patches/linux/0002-arc-vdk-Add-support-of-MMC-controller.patch
 delete mode 100644 board/synopsys/vdk/patches/linux/0003-arc-vdk-Add-support-of-UIO.patch

diff --git a/board/synopsys/vdk/patches/linux/0002-arc-vdk-Add-support-of-MMC-controller.patch b/board/synopsys/vdk/patches/linux/0002-arc-vdk-Add-support-of-MMC-controller.patch
deleted file mode 100644
index bd5dedb1ff..0000000000
--- a/board/synopsys/vdk/patches/linux/0002-arc-vdk-Add-support-of-MMC-controller.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From c9d5ba0157fcfe48c0ec3448bdaecbabb8cefbca Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Tue, 31 Jan 2017 19:02:44 +0300
-Subject: [PATCH 2/3] arc: vdk: Add support of MMC controller
-
-ARC VDK virtual platform emulates host MMC controller (DW Mobile Storage)
-and moreover rootfs is situated on that virtual card.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- arch/arc/boot/dts/vdk_axs10x_mb.dtsi    | 18 ++++++++++++++++++
- arch/arc/configs/vdk_hs38_smp_defconfig |  5 ++++-
- 2 files changed, 22 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
-index 99498a4b4216..1953914b9f4f 100644
---- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
-+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
-@@ -23,6 +23,12 @@
- 				#clock-cells = <0>;
- 			};
- 
-+			mmcclk: mmcclk {
-+				compatible = "fixed-clock";
-+				clock-frequency = <50000000>;
-+				#clock-cells = <0>;
-+			};
-+
- 			pguclk: pguclk {
- 				#clock-cells = <0>;
- 				compatible = "fixed-clock";
-@@ -94,5 +100,17 @@
- 			interrupts = <5>;
- 			interrupt-names = "arc_ps2_irq";
- 		};
-+
-+		mmc at 0x15000 {
-+			compatible = "snps,dw-mshc";
-+			reg = <0x15000 0x400>;
-+			num-slots = <1>;
-+			fifo-depth = <1024>;
-+			card-detect-delay = <200>;
-+			clocks = <&apbclk>, <&mmcclk>;
-+			clock-names = "biu", "ciu";
-+			interrupts = <7>;
-+			bus-width = <4>;
-+		};
- 	};
- };
-diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
-index 00036e814dc1..85c697a7ef1c 100644
---- a/arch/arc/configs/vdk_hs38_smp_defconfig
-+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
-@@ -79,9 +79,12 @@ CONFIG_USB_OHCI_HCD=y
- CONFIG_USB_OHCI_HCD_PLATFORM=y
- CONFIG_USB_STORAGE=y
- CONFIG_USB_SERIAL=y
-+CONFIG_MMC=y
-+CONFIG_MMC_SDHCI=y
-+CONFIG_MMC_SDHCI_PLTFM=y
-+CONFIG_MMC_DW=y
- # CONFIG_IOMMU_SUPPORT is not set
- CONFIG_EXT3_FS=y
--CONFIG_EXT4_FS=y
- CONFIG_MSDOS_FS=y
- CONFIG_VFAT_FS=y
- CONFIG_NTFS_FS=y
--- 
-2.7.4
-
diff --git a/board/synopsys/vdk/patches/linux/0003-arc-vdk-Add-support-of-UIO.patch b/board/synopsys/vdk/patches/linux/0003-arc-vdk-Add-support-of-UIO.patch
deleted file mode 100644
index 2b084a93cc..0000000000
--- a/board/synopsys/vdk/patches/linux/0003-arc-vdk-Add-support-of-UIO.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From caa0dca3f4913712d1883e9b3b540f0815864ed9 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Tue, 31 Jan 2017 19:03:56 +0300
-Subject: [PATCH 3/3] arc: vdk: Add support of UIO
-
-ARC VDK for EVSS uses UIO for communication with Embedded Vision
-Subsystem.
-
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
----
- arch/arc/boot/dts/vdk_axs10x_mb.dtsi    | 8 ++++++++
- arch/arc/configs/vdk_hs38_smp_defconfig | 2 ++
- 2 files changed, 10 insertions(+)
-
-diff --git a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
-index 1953914b9f4f..f0df59b23e21 100644
---- a/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
-+++ b/arch/arc/boot/dts/vdk_axs10x_mb.dtsi
-@@ -112,5 +112,13 @@
- 			interrupts = <7>;
- 			bus-width = <4>;
- 		};
-+
-+		/* Embedded Vision subsystem UIO mappings; only relevant for EV VDK */
-+		uio_ev: uio at 0xD0000000 {
-+			compatible = "generic-uio";
-+			reg = <0xD0000000 0x2000 0xD1000000 0x2000 0x90000000 0x10000000 0xC0000000 0x10000000>;
-+			reg-names = "ev_gsa", "ev_ctrl", "ev_shared_mem", "ev_code_mem";
-+			interrupts = <23>;
-+		};
- 	};
- };
-diff --git a/arch/arc/configs/vdk_hs38_smp_defconfig b/arch/arc/configs/vdk_hs38_smp_defconfig
-index 85c697a7ef1c..ecd7f42d50c9 100644
---- a/arch/arc/configs/vdk_hs38_smp_defconfig
-+++ b/arch/arc/configs/vdk_hs38_smp_defconfig
-@@ -83,6 +83,8 @@ CONFIG_MMC=y
- CONFIG_MMC_SDHCI=y
- CONFIG_MMC_SDHCI_PLTFM=y
- CONFIG_MMC_DW=y
-+CONFIG_UIO=y
-+CONFIG_UIO_PDRV_GENIRQ=y
- # CONFIG_IOMMU_SUPPORT is not set
- CONFIG_EXT3_FS=y
- CONFIG_MSDOS_FS=y
--- 
-2.7.4
-
diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index dc1810ce2b..daa8ebb8f0 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 
 # Bootloader
diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index 9021f99ee7..42a4feaba8 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 
-# Linux headers same as kernel, a 4.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 
 # Bootloader
diff --git a/configs/snps_archs38_haps_defconfig b/configs/snps_archs38_haps_defconfig
index 4f03560ebc..6583c1ec3a 100644
--- a/configs/snps_archs38_haps_defconfig
+++ b/configs/snps_archs38_haps_defconfig
@@ -7,12 +7,12 @@ BR2_TARGET_GENERIC_HOSTNAME="zebu_hs"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the HAPS Development Platform"
 BR2_TARGET_ROOTFS_INITRAMFS=y
 
-# Linux headers same as kernel, a 4.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
index 2cca0b8920..434ed37a9e 100644
--- a/configs/snps_archs38_vdk_defconfig
+++ b/configs/snps_archs38_vdk_defconfig
@@ -8,13 +8,12 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to the HS38 VDK Software Development Platform"
 BR2_ROOTFS_OVERLAY="board/synopsys/axs10x/fs-overlay"
 BR2_TARGET_ROOTFS_EXT2=y
 
-# Linux headers same as kernel, a 4.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+# Linux headers same as kernel, a 4.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.8"
-BR2_LINUX_KERNEL_PATCH="board/synopsys/vdk/patches/linux"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
-- 
2.11.0
