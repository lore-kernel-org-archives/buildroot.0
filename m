From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 14:13:17 +0200
Subject: [Buildroot] [git commit] board: Add support for Engicam i.CoreM6
	DualLite/Solo boards
Message-ID: <20170624121257.77B6580440@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6473f8e8ac0e58b81343fdfdcce79c56ef182c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add initial support for Engicam i.CoreM6 DualLite/Solo board
with below features:
- U-Boot 2017.07-rc1
- Linux 4.11.5
- Default packages from buildroot

U-Boot 2017.07-rc1 has common u-boot defconfig for All i.CoreM6
variant boards, so this patch update the same along with
buildroot defconfig that reflect the common name.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml                                                 |  2 +-
 DEVELOPERS                                                     |  2 +-
 board/engicam/genimage.cfg                                     |  3 ++-
 board/engicam/readme.txt                                       |  7 +++++--
 ...m_imx6q_icore_defconfig => engicam_imx6qdl_icore_defconfig} | 10 +++++-----
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fe2c7fe..6f03be4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -89,7 +89,7 @@ ci20_defconfig: *defconfig
 ci40_defconfig: *defconfig
 csky_gx6605s_defconfig: *defconfig
 cubieboard2_defconfig: *defconfig
-engicam_imx6q_icore_defconfig: *defconfig
+engicam_imx6qdl_icore_defconfig: *defconfig
 firefly_rk3288_defconfig: *defconfig
 firefly_rk3288_demo_defconfig: *defconfig
 freescale_imx28evk_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 41940b4..30f4c97 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -843,7 +843,7 @@ F:	package/keepalived/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/engicam/
-F:	configs/engicam_imx6q_icore_defconfig
+F:	configs/engicam_imx6qdl_icore_defconfig
 
 N:	James Knight <james.knight@rockwellcollins.com>
 F:	package/atkmm/
diff --git a/board/engicam/genimage.cfg b/board/engicam/genimage.cfg
index 43c81cf..f409a08 100644
--- a/board/engicam/genimage.cfg
+++ b/board/engicam/genimage.cfg
@@ -2,10 +2,11 @@ image boot.vfat {
 	vfat {
 		files = {
 			"uImage",
+			"imx6dl-icore.dtb",
 			"imx6q-icore.dtb"
 		}
 	}
-	size = 16M
+	size = 64M
 }
 
 image sdcard.img {
diff --git a/board/engicam/readme.txt b/board/engicam/readme.txt
index eb7503f..f1010a2 100644
--- a/board/engicam/readme.txt
+++ b/board/engicam/readme.txt
@@ -5,7 +5,7 @@ Buildroot for Engicam i.MX6 SOM platforms:
 This file documents the Buildroot support for all Engicam i.MX6 SOM
 platform boards.
 
-i.CoreM6 Quad/Dual SOM Starter kits:
+i.CoreM6 Quad/Dual/DualLite/Solo SOM Starter kits:
 https://www.engicam.com/vis-prod/101120
 
 This configuration uses U-Boot mainline and kernel mainline.
@@ -17,7 +17,7 @@ First, configure Buildroot for the Engicam i.MX SOM's:
 
 - for i.CoreM6 Quad/Dual:
 
-  make engicam_imx6q_icore_defconfig
+  make engicam_imx6qdl_icore_defconfig
 
 Build all components:
 
@@ -26,6 +26,8 @@ Build all components:
 You will find the following files in output/images/:
 - for i.CoreM6 Quad/Dual:
   - imx6q-icore.dtb
+- for i.CoreM6 DualLite/Solo:
+  - imx6dl-icore.dtb
   - rootfs.ext4
   - rootfs.tar
   - sdcard.img
@@ -46,6 +48,7 @@ directory, ready to be dumped on a SD card. Launch the following
 command as root:
 
   dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+  sync
 
 *** WARNING! This will destroy all the card content. Use with care! ***
 
diff --git a/configs/engicam_imx6q_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
similarity index 74%
rename from configs/engicam_imx6q_icore_defconfig
rename to configs/engicam_imx6qdl_icore_defconfig
index 63454ee..e0d89fa 100644
--- a/configs/engicam_imx6q_icore_defconfig
+++ b/configs/engicam_imx6qdl_icore_defconfig
@@ -14,8 +14,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.05"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6q_icore_mmc"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
@@ -25,15 +25,15 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_UIMAGE=y
 BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-icore"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-icore imx6q-icore"
 
 # Filesystem
-BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual Starter Kit"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Engicam i.CoreM6 Quad/Dual/DualLite/Solo Starter Kit"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_PACKAGE_HOST_GENIMAGE=y
