From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Wed, 13 Sep 2017 17:12:07 +0530
Subject: [Buildroot] [PATCH v3 2/6] board: icorem6: Add Qt5 configs for
	800x480 LVDS display
In-Reply-To: <1505302931-17387-1-git-send-email-jteki@openedev.com>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
Message-ID: <1505302931-17387-3-git-send-email-jteki@openedev.com>
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
Changes for v3:
- none
Changes for v2:
- Remove pathes, since there are in Mainline
- Add separate defconfig file qt5
- Update .gitlab-ci.yml
- Update DEVELOPERS
- Drop unneeded configs

 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  1 +
 board/engicam/icorem6/linux_qt5.fragment           |  4 ++
 board/engicam/icorem6/readme.txt                   | 14 ++++
 .../icorem6/rootfs_overlay/root/imx6qdl-icore.json | 11 +++
 configs/engicam_imx6qdl_icore_qt5_defconfig        | 81 ++++++++++++++++++++++
 6 files changed, 112 insertions(+)
 create mode 100644 board/engicam/icorem6/linux_qt5.fragment
 create mode 100644 board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
 create mode 100644 configs/engicam_imx6qdl_icore_qt5_defconfig

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b44c935..045441d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -97,6 +97,7 @@ ci40_defconfig: *defconfig
 csky_gx6605s_defconfig: *defconfig
 cubieboard2_defconfig: *defconfig
 engicam_imx6qdl_icore_defconfig: *defconfig
+engicam_imx6qdl_icore_qt5_defconfig: *defconfig
 engicam_imx6qdl_icore_rqs_defconfig: *defconfig
 engicam_imx6ul_geam_defconfig: *defconfig
 engicam_imx6ul_isiot_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 79e7202..9d5bf30 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -868,6 +868,7 @@ F:	package/keepalived/
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
 F:	configs/engicam_imx6qdl_icore_defconfig
+F:	configs/engicam_imx6qdl_icore_qt5_defconfig
 F:	configs/engicam_imx6qdl_icore_rqs_defconfig
 F:	configs/engicam_imx6ul_geam_defconfig
 F:	configs/engicam_imx6ul_isiot_defconfig
diff --git a/board/engicam/icorem6/linux_qt5.fragment b/board/engicam/icorem6/linux_qt5.fragment
new file mode 100644
index 0000000..5c0505e
--- /dev/null
+++ b/board/engicam/icorem6/linux_qt5.fragment
@@ -0,0 +1,4 @@
+# Currently kernel mainline exhibits issues when running cpufreq as ondemand
+# governor on mx6.
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
diff --git a/board/engicam/icorem6/readme.txt b/board/engicam/icorem6/readme.txt
index 0ad60bf..9a9ecf0 100644
--- a/board/engicam/icorem6/readme.txt
+++ b/board/engicam/icorem6/readme.txt
@@ -66,4 +66,18 @@ To boot your newly created system:
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
+- for i.CoreM6 Starter Kit
+# export QT_QPA_EGLFS_KMS_CONFIG=/root/imx6qdl-icore.json
+# CinematicExperience-demo
+
 Enjoy!
diff --git a/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
new file mode 100644
index 0000000..ac139a3
--- /dev/null
+++ b/board/engicam/icorem6/rootfs_overlay/root/imx6qdl-icore.json
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
diff --git a/configs/engicam_imx6qdl_icore_qt5_defconfig b/configs/engicam_imx6qdl_icore_qt5_defconfig
new file mode 100644
index 0000000..cf4439f
--- /dev/null
+++ b/configs/engicam_imx6qdl_icore_qt5_defconfig
@@ -0,0 +1,81 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
+
+# Linux headers same as kernel, a 4.13 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
+
+# System
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_UIMAGE=y
+BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/engicam/icorem6/linux_qt5.fragment"
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/engicam/icorem6/genimage.cfg"
+BR2_ROOTFS_OVERLAY="board/engicam/icorem6/rootfs_overlay"
+
+# qt5 dependencies
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+# qt5
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
+BR2_PACKAGE_QT5BASE_LINUXFB=y
+BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
+
+# mesa3d
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV=y
+BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
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
