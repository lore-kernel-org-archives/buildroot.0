From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 4 Jul 2016 17:24:13 +0300
Subject: [Buildroot] [PATCH] configs: chromebook snow: bump to linux 4.6.3
Message-ID: <20160704142413.GA13231@vostro.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No significant changes but 4.6.3 moved parts of the device tree
into a different file, so dts patch must be updated.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 board/chromebook/snow/linux-4.3-dts-tpm.patch | 26 --------------------------
 board/chromebook/snow/linux-4.3.fragment      |  2 --
 board/chromebook/snow/linux-4.6-dts-tpm.patch | 27 +++++++++++++++++++++++++++
 board/chromebook/snow/linux-4.6.fragment      |  2 ++
 configs/chromebook_snow_defconfig             |  7 +++----
 5 files changed, 32 insertions(+), 32 deletions(-)
 delete mode 100644 board/chromebook/snow/linux-4.3-dts-tpm.patch
 delete mode 100644 board/chromebook/snow/linux-4.3.fragment
 create mode 100644 board/chromebook/snow/linux-4.6-dts-tpm.patch
 create mode 100644 board/chromebook/snow/linux-4.6.fragment

diff --git a/board/chromebook/snow/linux-4.3-dts-tpm.patch b/board/chromebook/snow/linux-4.3-dts-tpm.patch
deleted file mode 100644
index 4a9dd85..0000000
--- a/board/chromebook/snow/linux-4.3-dts-tpm.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Some versions of u-boot for this Chromebook check for tpm node
-in the device tree and fail badly (reboot) if it is not found.
-
-While not exactly correct, it is much easier to patch the mainline
-device tree to match u-boot expectations than to fix u-boot on
-this device.
-
-See https://code.google.com/p/chromium/issues/detail?id=220169
-and https://lkml.org/lkml/2013/3/4/242
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- a/arch/arm/boot/dts/exynos5250-snow.dts
-+++ b/arch/arm/boot/dts/exynos5250-snow.dts
-@@ -474,6 +474,11 @@
- 	status = "okay";
- 	samsung,i2c-sda-delay = <100>;
- 	samsung,i2c-max-bus-freq = <66000>;
-+
-+	tpm {
-+		compatible = "infineon,slb9635tt";
-+		reg = <0x20>;
-+	};
- };
- 
- &i2c_5 {
diff --git a/board/chromebook/snow/linux-4.3.fragment b/board/chromebook/snow/linux-4.3.fragment
deleted file mode 100644
index e2786da..0000000
--- a/board/chromebook/snow/linux-4.3.fragment
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_MWIFIEX=m
-CONFIG_MWIFIEX_SDIO=m
diff --git a/board/chromebook/snow/linux-4.6-dts-tpm.patch b/board/chromebook/snow/linux-4.6-dts-tpm.patch
new file mode 100644
index 0000000..c71ff1b
--- /dev/null
+++ b/board/chromebook/snow/linux-4.6-dts-tpm.patch
@@ -0,0 +1,27 @@
+Some versions of u-boot for this Chromebook check for tpm node
+in the device tree and fail badly (reboot) if it is not found.
+
+While not exactly correct, it is much easier to patch the mainline
+device tree to match u-boot expectations than to fix u-boot on
+this device.
+
+See https://code.google.com/p/chromium/issues/detail?id=220169
+and https://lkml.org/lkml/2013/3/4/242
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+
+--- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
++++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
+@@ -466,6 +466,11 @@
+ 	status = "okay";
+ 	samsung,i2c-sda-delay = <100>;
+ 	samsung,i2c-max-bus-freq = <66000>;
++
++	tpm {
++		compatible = "infineon,slb9635tt";
++		reg = <0x20>;
++	};
+ };
+ 
+ &i2c_5 {
+
diff --git a/board/chromebook/snow/linux-4.6.fragment b/board/chromebook/snow/linux-4.6.fragment
new file mode 100644
index 0000000..e2786da
--- /dev/null
+++ b/board/chromebook/snow/linux-4.6.fragment
@@ -0,0 +1,2 @@
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index b96441d..408805b 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -1,16 +1,15 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_3=y
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/snow/mksd.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.3.6"
-BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.3-dts-tpm.patch"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.6.3"
+BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.6-dts-tpm.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.3.fragment"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.6.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5250-snow"
 BR2_PACKAGE_LINUX_FIRMWARE=y
-- 
2.8.3
