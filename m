From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 13 Oct 2020 23:16:20 +0300
Subject: [Buildroot] [PATCH v2 2/3] board/udoo/mx6qdl: disable usb host in
 device tree
In-Reply-To: <20201013201621.910051-1-geomatsi@gmail.com>
References: <20201013201621.910051-1-geomatsi@gmail.com>
Message-ID: <20201013201621.910051-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After BSP update Udoo Quad/Dual board once again hangs on boot. On a
new kernel disabling CONFIG_USB option is not enough to work around
the troublesome usb host on Udoo Quad/Dual board. So in order to be
future-proof it makes sense to disable usbh1 block in device tree
rather than fine-tune kernel configuration after BSP updates.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 board/udoo/mx6qdl/linux.fragment              |  1 -
 .../linux/0000-udoo-disable-usbh1.patch       | 26 +++++++++++++++++++
 configs/mx6udoo_defconfig                     |  2 +-
 3 files changed, 27 insertions(+), 2 deletions(-)
 delete mode 100644 board/udoo/mx6qdl/linux.fragment
 create mode 100644 board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch

diff --git a/board/udoo/mx6qdl/linux.fragment b/board/udoo/mx6qdl/linux.fragment
deleted file mode 100644
index 1d2509982b..0000000000
--- a/board/udoo/mx6qdl/linux.fragment
+++ /dev/null
@@ -1 +0,0 @@
-# CONFIG_USB is not set
diff --git a/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch b/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
new file mode 100644
index 0000000000..d151a40d6e
--- /dev/null
+++ b/board/udoo/mx6qdl/patches/linux/0000-udoo-disable-usbh1.patch
@@ -0,0 +1,26 @@
+[PATCH] ARM: dts: imx6qdl-udoo: Disable usbh1 to avoid kernel hang
+
+Currently the kernel hangs when USB Host1 is enabled due to the lack of
+support for controlling the USB hub clock and GPIO reset line.
+
+Peter Chen has made several attempts to fix this problem, but his series
+has not been applied yet, so better disable USB host1 for now to avoid
+the kernel hang.
+
+Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
+---
+
+diff --git a/arch/arm/boot/dts/imx6qdl-udoo.dtsi b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
+index 828dd20cd27d..c9e122865312 100644
+--- a/arch/arm/boot/dts/imx6qdl-udoo.dtsi
++++ b/arch/arm/boot/dts/imx6qdl-udoo.dtsi
+@@ -292,7 +292,8 @@ &usbh1 {
+ 	pinctrl-0 = <&pinctrl_usbh>;
+ 	vbus-supply = <&reg_usb_h1_vbus>;
+ 	clocks = <&clks IMX6QDL_CLK_CKO>;
+-	status = "okay";
++	/* currently USB support causes a kernel hang. Disable it for now */
++	status = "disabled";
+ };
+ 
+ &usbotg {
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index d208f5846e..be56f3014e 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -3,6 +3,7 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
+BR2_GLOBAL_PATCH_DIR="board/udoo/mx6qdl/patches"
 # Linux headers same as kernel, a 5.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
@@ -20,7 +21,6 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
-BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/udoo/mx6qdl/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
 # required tools to create the SD card image
-- 
2.28.0
