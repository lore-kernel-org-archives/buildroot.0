From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Nov 2018 17:38:35 +0100
Subject: [Buildroot] [git commit] configs/solidrun_macchiatobin_mainline:
 bump kernel and U-Boot
Message-ID: <20181202071557.577BC81583@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5689ca365a538f914078478c620dd18165fdc15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump U-Boot to version 2018.11. This version supports autodetection of
SD/eMMC boot source, so we can now enable environment load from SD card.
Add a U-Boot kconfig fragment that sets SD/eMMC as environment load/save
device. This avoids stale environment values from the SPI flash. That in
turn, allows to use the more convenient distro boot which is enabled in
the default environment.

Bump kernel to version 4.19.2. This version enables
CONFIG_PHY_MVEBU_CP110_COMPHY in the arm64 defconfig, so remove it from
the kernel kconfig fragment. Enable support for SFP modules detection
and configuration. Leave the PHY drivers for now to keep them built into
the kernel. The kernel defconfig builds these drivers as modules. But
that does not work as expected in the default configuration.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Tested-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/solidrun/macchiatobin/extlinux.conf          |  4 ++++
 board/solidrun/macchiatobin/linux-extras.config    |  2 +-
 board/solidrun/macchiatobin/post-build-mainline.sh |  5 +++++
 board/solidrun/macchiatobin/uboot-fragment.config  |  2 ++
 configs/solidrun_macchiatobin_mainline_defconfig   | 13 ++++++++-----
 5 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/board/solidrun/macchiatobin/extlinux.conf b/board/solidrun/macchiatobin/extlinux.conf
new file mode 100644
index 0000000000..1008af1af0
--- /dev/null
+++ b/board/solidrun/macchiatobin/extlinux.conf
@@ -0,0 +1,4 @@
+label Macchiatobin Linux
+  kernel /boot/Image
+  devicetree /boot/armada-8040-mcbin.dtb
+  append console=ttyS0,115200n8 root=/dev/mmcblk1p1 rootwait
diff --git a/board/solidrun/macchiatobin/linux-extras.config b/board/solidrun/macchiatobin/linux-extras.config
index 11267d2f80..29fd630626 100644
--- a/board/solidrun/macchiatobin/linux-extras.config
+++ b/board/solidrun/macchiatobin/linux-extras.config
@@ -1,3 +1,3 @@
 CONFIG_MARVELL_PHY=y
 CONFIG_MARVELL_10G_PHY=y
-CONFIG_PHY_MVEBU_CP110_COMPHY=y
+CONFIG_SFP=y
diff --git a/board/solidrun/macchiatobin/post-build-mainline.sh b/board/solidrun/macchiatobin/post-build-mainline.sh
new file mode 100755
index 0000000000..1f5ff6a611
--- /dev/null
+++ b/board/solidrun/macchiatobin/post-build-mainline.sh
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+BOARD_DIR="$(dirname $0)"
+
+install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/board/solidrun/macchiatobin/uboot-fragment.config b/board/solidrun/macchiatobin/uboot-fragment.config
new file mode 100644
index 0000000000..717a094247
--- /dev/null
+++ b/board/solidrun/macchiatobin/uboot-fragment.config
@@ -0,0 +1,2 @@
+CONFIG_ENV_IS_IN_MMC=y
+# CONFIG_ENV_IS_IN_SPI_FLASH is not set
diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
index d303b2f75e..8e5fbfa4e8 100644
--- a/configs/solidrun_macchiatobin_mainline_defconfig
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -1,5 +1,5 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 BR2_TARGET_GENERIC_HOSTNAME="mcbin"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
 
@@ -19,14 +19,17 @@ BR2_TARGET_MV_DDR_MARVELL=y
 
 # U-Boot
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.09"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_USE_DEFCONFIG=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mvebu_mcbin-88f8040"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/uboot-fragment.config"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.2"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
@@ -41,4 +44,4 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/solidrun/macchiatobin/genimage.cfg"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/macchiatobin/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/solidrun/macchiatobin/post-build-mainline.sh"
