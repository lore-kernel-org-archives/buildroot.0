From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 21:40:33 +0200
Subject: [Buildroot] [git commit] orangepi_pc_defconfig: bump linux to 4.17,
 u-boot to 2018.05
Message-ID: <20180611194200.098B288285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a96100599071055e6daad1211f68b022c86a25c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

4.17 brings support for HDMI out, but sunxi_defconfig hasn't been updated to
enable the drivers - So add a kernel fragment to enable them.

Likewise, analog audio has been supported since 4.10, but the driver isn't
enabled in sunxi_defconfig, so enable it in the fragment.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/orangepi/orangepi-pc/linux.fragment |  3 +++
 configs/orangepi_pc_defconfig             | 11 ++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/board/orangepi/orangepi-pc/linux.fragment b/board/orangepi/orangepi-pc/linux.fragment
new file mode 100644
index 0000000000..cdd522452a
--- /dev/null
+++ b/board/orangepi/orangepi-pc/linux.fragment
@@ -0,0 +1,3 @@
+CONFIG_DRM_SUN8I_DW_HDMI=y
+CONFIG_SUN8I_DE2_CCU=y
+CONFIG_SND_SUN8I_CODEC_ANALOG=y
diff --git a/configs/orangepi_pc_defconfig b/configs/orangepi_pc_defconfig
index aa559e743e..05199af53b 100644
--- a/configs/orangepi_pc_defconfig
+++ b/configs/orangepi_pc_defconfig
@@ -1,14 +1,17 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC"
 BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-pc/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -17,7 +20,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
@@ -29,5 +32,3 @@ BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-pc/genimage.cfg"
