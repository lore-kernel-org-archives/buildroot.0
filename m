From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 11:54:58 +0200
Subject: [Buildroot] [git commit] configs/imx7d-sdb: Add new defconfig
Message-ID: <20180718095331.DAAB1888A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=376e7f4ee782c3308b039be33bf015bdb368c31e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Introduce imx7d-sdb_defconfig that allows booting imx7d-sdb
board using U-Boot and kernel mainline instead of the
vendor provided versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
[Thomas: add DEVELOPERS entry, regenerate .gitlab-ci.yml]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml              |  1 +
 DEVELOPERS                  |  1 +
 configs/imx7d-sdb_defconfig | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e80491cdde..de2abdd4ce 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -147,6 +147,7 @@ imx6slevk_defconfig: *defconfig
 imx6sx-sdb_defconfig: *defconfig
 imx6ulevk_defconfig: *defconfig
 imx6ulpico_defconfig: *defconfig
+imx7d-sdb_defconfig: *defconfig
 imx7dpico_defconfig: *defconfig
 lego_ev3_defconfig: *defconfig
 linksprite_pcduino_defconfig: *defconfig
diff --git a/DEVELOPERS b/DEVELOPERS
index 4c2d1f291f..25c3ebe970 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -660,6 +660,7 @@ F:	configs/imx6slevk_defconfig
 F:	configs/imx6sx-sdb_defconfig
 F:	configs/imx6ulevk_defconfig
 F:	configs/imx6ulpico_defconfig
+F:	configs/imx7d-sdb_defconfig
 F:	configs/imx7dpico_defconfig
 F:	configs/mx25pdk_defconfig
 F:	configs/mx51evk_defconfig
diff --git a/configs/imx7d-sdb_defconfig b/configs/imx7d-sdb_defconfig
new file mode 100644
index 0000000000..b1cc5f8523
--- /dev/null
+++ b/configs/imx7d-sdb_defconfig
@@ -0,0 +1,36 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 4.17 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+
+# system
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17.4"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+# U-Boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx7dsabresd"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMX=y
+
+# Filesystem
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+
+# required tools to create the eMMC image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
