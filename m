From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 22 Apr 2017 11:09:46 -0300
Subject: [Buildroot] [PATCH] imx6q-sabresd: Add a qt5 defconfig variant
Message-ID: <1492870186-31678-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce imx6q-sabresd_qt5_defconfig that supports the opensource
Etnaviv graphical stack.

This defconfig provides a way to quickly test some graphical applications,
such as kmscube, qt5, glmark2.

Currently kernel mainline exhibits issues when running cpufreq as ondemand
governor on mx6, so add a linux fragment that disables such option for the
time being.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/imx6q-sabresd/linux.fragment       |  1 +
 board/freescale/imx6q-sabresd/readme.txt           | 23 +++++++++
 .../imx6q-sabresd/rootfs_overlay/root/sabresd.json | 15 ++++++
 configs/imx6q-sabresd_qt5_defconfig                | 59 ++++++++++++++++++++++
 4 files changed, 98 insertions(+)
 create mode 100644 board/freescale/imx6q-sabresd/linux.fragment
 create mode 100755 board/freescale/imx6q-sabresd/rootfs_overlay/root/sabresd.json
 create mode 100644 configs/imx6q-sabresd_qt5_defconfig

diff --git a/board/freescale/imx6q-sabresd/linux.fragment b/board/freescale/imx6q-sabresd/linux.fragment
new file mode 100644
index 0000000..39bec58
--- /dev/null
+++ b/board/freescale/imx6q-sabresd/linux.fragment
@@ -0,0 +1 @@
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
diff --git a/board/freescale/imx6q-sabresd/readme.txt b/board/freescale/imx6q-sabresd/readme.txt
index 10e973c..b57c4fb 100644
--- a/board/freescale/imx6q-sabresd/readme.txt
+++ b/board/freescale/imx6q-sabresd/readme.txt
@@ -54,4 +54,27 @@ To boot your newly created system:
   emulator at 115200 bps, 8n1;
 - power on the board.
 
+Testing graphics on the i.MX6Q Sabre SD board
+=============================================
+
+The imx6q-sabresd_qt5_defconfig allows to quickly test the graphics
+capabilities of i.MX6 using the opensource Etnaviv graphics stack
+and kernel mainline.
+
+In order to build it:
+
+make imx6q-sabresd_qt5_defconfig
+make
+
+Then flash the SD card as explained above.
+
+Running kmscube application:
+
+# kmscube -D /dev/dri/card1
+
+Running Qt5 Cinematic Demo:
+
+# export QT_QPA_EGLFS_KMS_CONFIG=/root/sabresd.json
+# /usr/share/Qt5/CinematicExperience/Qt5_CinematicExperience
+
 Enjoy!
diff --git a/board/freescale/imx6q-sabresd/rootfs_overlay/root/sabresd.json b/board/freescale/imx6q-sabresd/rootfs_overlay/root/sabresd.json
new file mode 100755
index 0000000..9469dc1
--- /dev/null
+++ b/board/freescale/imx6q-sabresd/rootfs_overlay/root/sabresd.json
@@ -0,0 +1,15 @@
+{
+  "device": "/dev/dri/card1",
+  "hwcursor": false,
+  "pbuffers": true,
+  "outputs": [
+    {
+      "name": "HDMI-1",
+      "mode": "off"
+    },
+    {
+      "name": "LVDS-1",
+      "mode": "1024x768"
+    }
+  ]
+}
diff --git a/configs/imx6q-sabresd_qt5_defconfig b/configs/imx6q-sabresd_qt5_defconfig
new file mode 100644
index 0000000..c438d05
--- /dev/null
+++ b/configs/imx6q-sabresd_qt5_defconfig
@@ -0,0 +1,59 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.11"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/freescale/imx6q-sabresd/linux.fragment"
+BR2_ROOTFS_OVERLAY="board/freescale/imx6q-sabresd/rootfs_overlay"
+BR2_PACKAGE_STRACE=y
+BR2_PACKAGE_BITSTREAM_VERA=y
+BR2_PACKAGE_CANTARELL=y
+BR2_PACKAGE_DEJAVU=y
+BR2_PACKAGE_FONT_AWESOME=y
+BR2_PACKAGE_GHOSTSCRIPT_FONTS=y
+BR2_PACKAGE_INCONSOLATA=y
+BR2_PACKAGE_LIBERATION=y
+BR2_PACKAGE_GLMARK2=y
+BR2_PACKAGE_KMSCUBE=y
+BR2_PACKAGE_MESA3D_DEMOS=y
+BR2_PACKAGE_QT5CINEX=y
+BR2_PACKAGE_QT5CINEX_HD=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_OPENGL_ES=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
+BR2_PACKAGE_QT5BASE_LINUXFB=y
+BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_PACKAGE_INPUT_TOOLS=y
+BR2_PACKAGE_LIBV4L=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_BLOCKS=122880
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6qsabresd"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.01"
+BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.7.4
