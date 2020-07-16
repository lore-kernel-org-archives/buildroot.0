From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:20:06 +0200
Subject: [Buildroot] [git commit] configs/imx6ullevk: new defconfig
Message-ID: <20200716071707.9332881363@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76d17fca1b89eff249d6dd410f33ef5644b8eae0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for imx6ullevk_defconfig that allows booting a mainline
kernel and mainline U-Boot.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                        |  1 +
 DEVELOPERS                            |  1 +
 board/freescale/imx6ullevk/readme.txt | 10 ++++++++++
 configs/imx6ullevk_defconfig          | 37 +++++++++++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d60a50f5c5..673aa8b3e7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -208,6 +208,7 @@ imx6-sabresd_qt5_defconfig: { extends: .defconfig }
 imx6slevk_defconfig: { extends: .defconfig }
 imx6sx-sdb_defconfig: { extends: .defconfig }
 imx6ulevk_defconfig: { extends: .defconfig }
+imx6ullevk_defconfig: { extends: .defconfig }
 imx6ulpico_defconfig: { extends: .defconfig }
 imx7d-sdb_defconfig: { extends: .defconfig }
 imx7dpico_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index e9cab3c6a0..f91314a13a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -792,6 +792,7 @@ F:	configs/imx6-sabre*
 F:	configs/imx6slevk_defconfig
 F:	configs/imx6sx-sdb_defconfig
 F:	configs/imx6ulevk_defconfig
+F:	configs/imx6ullevk_defconfig
 F:	configs/imx6ulpico_defconfig
 F:	configs/imx7d-sdb_defconfig
 F:	configs/imx7dpico_defconfig
diff --git a/board/freescale/imx6ullevk/readme.txt b/board/freescale/imx6ullevk/readme.txt
index e0c0c392a8..77acec2615 100644
--- a/board/freescale/imx6ullevk/readme.txt
+++ b/board/freescale/imx6ullevk/readme.txt
@@ -9,8 +9,18 @@ Build
 
 First, configure Buildroot for your i.MX6ULL EVK board:
 
+In order to to do so there are two supported options:
+
   make freescale_imx6ullevk_defconfig
 
+if you plan to use NXP provided U-Boot and kernel.
+
+or
+
+  make imx6ullevk_defconfig
+
+if you plan to use mainline U-Boot and mainline kernel.
+
 Build all components:
 
   make
diff --git a/configs/imx6ullevk_defconfig b/configs/imx6ullevk_defconfig
new file mode 100644
index 0000000000..4a5558dd6c
--- /dev/null
+++ b/configs/imx6ullevk_defconfig
@@ -0,0 +1,37 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 5.7 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.8"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6ull_14x14_evk"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+
+# required tools to create the SD card image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# filesystem / image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
