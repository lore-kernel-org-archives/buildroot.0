From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Tue, 27 Jun 2017 21:48:40 +0530
Subject: [Buildroot] [PATCH] board: icorem6: Add Qt5 configs for 800x480
	LVDS display
Message-ID: <1498580320-12765-1-git-send-email-jteki@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

i.CoreM6 Starter Kit has 800x480 LVDS display, this patch adds
relevant qt5 configs with supports opensource Etnaviv graphical stack.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 ...6qdl-icore-Add-backlight-support-for-lvds.patch | 65 ++++++++++++++++++++++
 ...0002-arm-dts-imx6q-icore-Add-LVDS-support.patch | 53 ++++++++++++++++++
 ...-arm-dts-imx6q-icore-Add-touchscreen-node.patch | 40 +++++++++++++
 ...v7_defconfig-Select-max11801_ts-touchscre.patch | 32 +++++++++++
 ...x6qdl_icore-Add-video-details-on-bootargs.patch | 32 +++++++++++
 board/engicam/icorem6/readme.txt                   | 13 +++++
 .../icorem6/rootfs_overlay/root/icorem6.json       | 11 ++++
 configs/engicam_imx6qdl_icore_defconfig            | 40 +++++++++++++
 8 files changed, 286 insertions(+)
 create mode 100644 board/engicam/icorem6/patches/linux-0001-arm-dts-imx6qdl-icore-Add-backlight-support-for-lvds.patch
 create mode 100644 board/engicam/icorem6/patches/linux-0002-arm-dts-imx6q-icore-Add-LVDS-support.patch
 create mode 100644 board/engicam/icorem6/patches/linux-0003-arm-dts-imx6q-icore-Add-touchscreen-node.patch
 create mode 100644 board/engicam/icorem6/patches/linux-0004-arm-imx_v6_v7_defconfig-Select-max11801_ts-touchscre.patch
 create mode 100644 board/engicam/icorem6/patches/u-boot-0001-configs-imx6qdl_icore-Add-video-details-on-bootargs.patch
 create mode 100644 board/engicam/icorem6/rootfs_overlay/root/icorem6.json

diff --git a/board/engicam/icorem6/patches/linux-0001-arm-dts-imx6qdl-icore-Add-backlight-support-for-lvds.patch b/board/engicam/icorem6/patches/linux-0001-arm-dts-imx6qdl-icore-Add-backlight-support-for-lvds.patch
new file mode 100644
index 0000000..d322f9f
--- /dev/null
+++ b/board/engicam/icorem6/patches/linux-0001-arm-dts-imx6qdl-icore-Add-backlight-support-for-lvds.patch
@@ -0,0 +1,65 @@
+From 78d35e6729ae55ef17b134ab9135ef9a5f6d219d Mon Sep 17 00:00:00 2001
+From: Jagan Teki <jagan@amarulasolutions.com>
+Date: Fri, 17 Feb 2017 10:34:24 +0530
+Subject: [PATCH] arm: dts: imx6qdl-icore: Add backlight support for lvds
+
+This patch add support for lvds backlight on i.CoreM6 QDL
+variant boards.
+
+Cc: Domenico Acri <domenico.acri@engicam.com>
+Cc: Matteo Lisi <matteo.lisi@engicam.com>
+Cc: Michael Trimarchi <michael@amarulasolutions.com>
+Cc: Shawn Guo <shawnguo@kernel.org>
+Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
+---
+ arch/arm/boot/dts/imx6qdl-icore.dtsi | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/arch/arm/boot/dts/imx6qdl-icore.dtsi b/arch/arm/boot/dts/imx6qdl-icore.dtsi
+index 55bebfc..7dda608 100644
+--- a/arch/arm/boot/dts/imx6qdl-icore.dtsi
++++ b/arch/arm/boot/dts/imx6qdl-icore.dtsi
+@@ -48,6 +48,14 @@
+ 		reg = <0x10000000 0x80000000>;
+ 	};
+ 
++	backlight {
++		compatible = "pwm-backlight";
++		pwms = <&pwm3 0 100000>;
++		brightness-levels = <0 4 8 16 32 64 128 255>;
++		default-brightness-level = <7>;
++		status = "okay";
++	};
++
+ 	reg_3p3v: regulator-3p3v {
+ 		compatible = "regulator-fixed";
+ 		regulator-name = "3P3V";
+@@ -136,6 +144,12 @@
+ 	status = "okay";
+ };
+ 
++&pwm3 {
++	pinctrl-names = "default";
++	pinctrl-0 = <&pinctrl_pwm3>;
++	status = "okay";
++};
++
+ &uart4 {
+ 	pinctrl-names = "default";
+ 	pinctrl-0 = <&pinctrl_uart4>;
+@@ -246,6 +260,12 @@
+ 		>;
+ 	};
+ 
++	pinctrl_pwm3: pwm3grp-1 {
++		fsl,pins = <
++			MX6QDL_PAD_SD4_DAT1__PWM3_OUT 0x1b0b1
++		>;
++	};
++
+ 	pinctrl_usbotg: usbotggrp {
+ 		fsl,pins = <
+ 			MX6QDL_PAD_GPIO_1__USB_OTG_ID 0x17059
+-- 
+1.9.1
+
diff --git a/board/engicam/icorem6/patches/linux-0002-arm-dts-imx6q-icore-Add-LVDS-support.patch b/board/engicam/icorem6/patches/linux-0002-arm-dts-imx6q-icore-Add-LVDS-support.patch
new file mode 100644
index 0000000..f3a0a0f
--- /dev/null
+++ b/board/engicam/icorem6/patches/linux-0002-arm-dts-imx6q-icore-Add-LVDS-support.patch
@@ -0,0 +1,53 @@
+From 834e40467e3840f8363566ae070f71965881e341 Mon Sep 17 00:00:00 2001
+From: Jagan Teki <jagan@amarulasolutions.com>
+Date: Mon, 20 Feb 2017 19:55:39 +0000
+Subject: [PATCH] arm: dts: imx6q-icore: Add LVDS support
+
+Add LVDS display support for OpenFrame Capacitive touch 7 inc
+display which is supported by Engicam i.CoreM6 QDL Starter Kit.
+
+Cc: Domenico Acri <domenico.acri@engicam.com>
+Cc: Matteo Lisi <matteo.lisi@engicam.com>
+Cc: Michael Trimarchi <michael@amarulasolutions.com>
+Cc: Shawn Guo <shawnguo@kernel.org>
+Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
+---
+ arch/arm/boot/dts/imx6q-icore.dts | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/arch/arm/boot/dts/imx6q-icore.dts b/arch/arm/boot/dts/imx6q-icore.dts
+index 59eb7ad..41d5a31 100644
+--- a/arch/arm/boot/dts/imx6q-icore.dts
++++ b/arch/arm/boot/dts/imx6q-icore.dts
+@@ -57,3 +57,28 @@
+ &can2 {
+ 	status = "okay";
+ };
++
++&ldb {
++	status = "okay";
++
++	lvds-channel at 0 {
++		fsl,data-mapping = "spwg";
++		fsl,data-width = <18>;
++		status = "okay";
++
++		display-timings {
++                        native-mode = <&timing0>;
++                        timing0: timing0 {
++                                clock-frequency = <60000000>;
++                                hactive = <800>;
++                                vactive = <480>;
++                                hback-porch = <30>;
++                                hfront-porch = <30>;
++                                vback-porch = <5>;
++                                vfront-porch = <5>;
++                                hsync-len = <64>;
++                                vsync-len = <20>;
++                        };
++                };
++	};
++};
+-- 
+1.9.1
+
diff --git a/board/engicam/icorem6/patches/linux-0003-arm-dts-imx6q-icore-Add-touchscreen-node.patch b/board/engicam/icorem6/patches/linux-0003-arm-dts-imx6q-icore-Add-touchscreen-node.patch
new file mode 100644
index 0000000..7cbb34d
--- /dev/null
+++ b/board/engicam/icorem6/patches/linux-0003-arm-dts-imx6q-icore-Add-touchscreen-node.patch
@@ -0,0 +1,40 @@
+From e692662c789581295c1e7c7e92a2ceb1e212e6d2 Mon Sep 17 00:00:00 2001
+From: Jagan Teki <jagan@amarulasolutions.com>
+Date: Tue, 7 Mar 2017 07:08:57 +0000
+Subject: [PATCH] arm: dts: imx6q-icore: Add touchscreen node
+
+max11801 touchscreen on Engicam iCoreM6 Quad module is
+connected via i2c1, so add tc: max11801 at 48 on i2c1.
+
+Cc: Domenico Acri <domenico.acri@engicam.com>
+Cc: Matteo Lisi <matteo.lisi@engicam.com>
+Cc: Michael Trimarchi <michael@amarulasolutions.com>
+Cc: Shawn Guo <shawnguo@kernel.org>
+Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
+---
+ arch/arm/boot/dts/imx6q-icore.dts | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/arch/arm/boot/dts/imx6q-icore.dts b/arch/arm/boot/dts/imx6q-icore.dts
+index 41d5a31..c190e5c 100644
+--- a/arch/arm/boot/dts/imx6q-icore.dts
++++ b/arch/arm/boot/dts/imx6q-icore.dts
+@@ -58,6 +58,15 @@
+ 	status = "okay";
+ };
+ 
++&i2c1 {
++	ts: max11801 at 48 {
++		compatible = "max11801";
++		reg = <0x48>;
++		interrupt-parent = <&gpio3>;
++		interrupts = <31 2>;
++	};
++};
++
+ &ldb {
+ 	status = "okay";
+ 
+-- 
+1.9.1
+
diff --git a/board/engicam/icorem6/patches/linux-0004-arm-imx_v6_v7_defconfig-Select-max11801_ts-touchscre.patch b/board/engicam/icorem6/patches/linux-0004-arm-imx_v6_v7_defconfig-Select-max11801_ts-touchscre.patch
new file mode 100644
index 0000000..ffe5df5
--- /dev/null
+++ b/board/engicam/icorem6/patches/linux-0004-arm-imx_v6_v7_defconfig-Select-max11801_ts-touchscre.patch
@@ -0,0 +1,32 @@
+From 30de58cac4b8305d6eefd15f07a534ab36bd072f Mon Sep 17 00:00:00 2001
+From: Jagan Teki <jagan@amarulasolutions.com>
+Date: Tue, 7 Mar 2017 08:17:35 +0000
+Subject: [PATCH] arm: imx_v6_v7_defconfig: Select max11801_ts touchscreen
+ driver
+
+Select CONFIG_TOUCHSCREEN_MAX11801 so that we can have touchscreen
+funtionality by default on Engicam i.CoreM6 Quad boards.
+
+Cc: Matteo Lisi <matteo.lisi@engicam.com>
+Cc: Michael Trimarchi <michael@amarulasolutions.com>
+Cc: Shawn Guo <shawnguo@kernel.org>
+Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
+---
+ arch/arm/configs/imx_v6_v7_defconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
+index eaba3b1..842168f 100644
+--- a/arch/arm/configs/imx_v6_v7_defconfig
++++ b/arch/arm/configs/imx_v6_v7_defconfig
+@@ -165,6 +165,7 @@ CONFIG_TOUCHSCREEN_ADS7846=y
+ CONFIG_TOUCHSCREEN_EGALAX=y
+ CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
+ CONFIG_TOUCHSCREEN_EDT_FT5X06=y
++CONFIG_TOUCHSCREEN_MAX11801=y
+ CONFIG_TOUCHSCREEN_MC13783=y
+ CONFIG_TOUCHSCREEN_TSC2004=y
+ CONFIG_TOUCHSCREEN_TSC2007=y
+-- 
+1.9.1
+
diff --git a/board/engicam/icorem6/patches/u-boot-0001-configs-imx6qdl_icore-Add-video-details-on-bootargs.patch b/board/engicam/icorem6/patches/u-boot-0001-configs-imx6qdl_icore-Add-video-details-on-bootargs.patch
new file mode 100644
index 0000000..7ca9538
--- /dev/null
+++ b/board/engicam/icorem6/patches/u-boot-0001-configs-imx6qdl_icore-Add-video-details-on-bootargs.patch
@@ -0,0 +1,32 @@
+From 873ac676c5125173b8a32fb8814e6b9b09bf21d8 Mon Sep 17 00:00:00 2001
+From: Jagan Teki <jagan@amarulasolutions.com>
+Date: Tue, 27 Jun 2017 15:29:01 +0530
+Subject: [PATCH] configs: imx6qdl_icore: Add video details on bootargs
+
+Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
+---
+ include/configs/imx6qdl_icore.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/include/configs/imx6qdl_icore.h b/include/configs/imx6qdl_icore.h
+index 13fc48f..f0fe666 100644
+--- a/include/configs/imx6qdl_icore.h
++++ b/include/configs/imx6qdl_icore.h
+@@ -45,10 +45,13 @@
+ 	"fdt_addr=0x18000000\0" \
+ 	"boot_fdt=try\0" \
+ 	"mmcpart=1\0" \
++	"panel_type=LVDS-1\0" \
++	"resolution=800x480\0" \
++	"sync=60\0" \
+ 	"nandroot=ubi0:rootfs rootfstype=ubifs\0" \
+ 	"mmcautodetect=yes\0" \
+ 	"mmcargs=setenv bootargs console=${console},${baudrate} " \
+-		"root=${mmcroot}\0" \
++		"root=${mmcroot} video=${panel_type}:${resolution}@${sync}\0" \
+ 	"ubiargs=setenv bootargs console=${console},${baudrate} " \
+ 		"ubi.mtd=5 root=${nandroot} ${mtdparts}\0" \
+ 	"loadbootscript=" \
+-- 
+2.7.4
+
diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
index 0ad60bf..f63330a 100644
--- a/board/engicam/icorem6/readme.txt
+++ b/board/engicam/icorem6/readme.txt
@@ -66,4 +66,17 @@ To boot your newly created system:
 - close JM3 for sd boot.
 - power on the board.
 
+Testing graphics on i.CoreM6 Starter Kit:
+========================================
+
+Running kmscube
+# kmscube -D /dev/dri/card1
+
+Running glmark2-es2-drm
+# glmark2-es2-drm
+
+Running Qt5 Cinematic Demo:
+# export QT_QPA_EGLFS_KMS_CONFIG=/root/icorem6.json
+# CinematicExperience-demo
+
 Enjoy!
diff --git a/board/engicam/icorem6/rootfs_overlay/root/icorem6.json b/board/engicam/icorem6/rootfs_overlay/root/icorem6.json
new file mode 100644
index 0000000..ac139a3
--- /dev/null
+++ b/board/engicam/icorem6/rootfs_overlay/root/icorem6.json
@@ -0,0 +1,11 @@
+{
+  "device": "/dev/dri/card1",
+  "hwcursor": false,
+  "pbuffers": true,
+  "outputs": [
+    {
+      "name": "LVDS-1",
+      "mode": "800x480"
+    }
+  ]
+}
diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
index 466d60c..4a875b9 100644
--- a/configs/engicam_imx6qdl_icore_defconfig
+++ b/configs/engicam_imx6qdl_icore_defconfig
@@ -21,11 +21,13 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
+BR2_TARGET_UBOOT_PATCH="board/engicam/icorem6/patches/u-boot-*.patch"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
+BR2_LINUX_KERNEL_PATCH="board/engicam/icorem6/patches/linux-*.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
@@ -36,8 +38,46 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo Starter Kit"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=122880
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
+BR2_ROOTFS_OVERLAY="board/engicam/icorem6/rootfs_overlay"
+
+# qt5 dependencies
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_USES_GLIBC=y
+
+# qt5
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_GUI=y
+BR2_PACKAGE_QT5BASE_OPENGL=y
+BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
+
+# mesa3d
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_OPENGL_ES=y
+
+# qt5 demo packages
+BR2_PACKAGE_GLMARK2=y
+BR2_PACKAGE_MESA3D_DEMOS=y
+BR2_PACKAGE_KMSCUBE=y
+BR2_PACKAGE_QT5CINEX=y
+BR2_PACKAGE_QT5CINEX_HD=y
+
+# fonts
+BR2_PACKAGE_BITSTREAM_VERA=y
+BR2_PACKAGE_CANTARELL=y
+BR2_PACKAGE_DEJAVU=y
+BR2_PACKAGE_FONT_AWESOME=y
+BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
+BR2_PACKAGE_INCONSOLATA=y
+BR2_PACKAGE_LIBERATION=y
-- 
2.7.4
