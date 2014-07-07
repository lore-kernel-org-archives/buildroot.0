From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jul 2014 07:55:02 +0200
Subject: [Buildroot] [git commit] Add support for Congatec QMX6
Message-ID: <20140707055752.7C3C29D1B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ac8f8ce10027ac8285a7e9cec16e74aa38ee2c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the iMX6 based conga-QMX6 family of Qseven modules.

This patch is based on Linux 3.0.35 from Congatec's kernel reporitory

[Peter: slightly simplify post build script]
Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/congatec/qmx6/6q_bootscript.txt |    2 +
 board/congatec/qmx6/post-build.sh     |    7 ++++++
 board/congatec/qmx6/readme.txt        |   36 +++++++++++++++++++++++++++++++++
 configs/qmx6_defconfig                |   14 ++++++++++++
 4 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/board/congatec/qmx6/6q_bootscript.txt b/board/congatec/qmx6/6q_bootscript.txt
new file mode 100644
index 0000000..1382220
--- /dev/null
+++ b/board/congatec/qmx6/6q_bootscript.txt
@@ -0,0 +1,2 @@
+set bootargs console=ttymxc1,115200 root=/dev/mmcblk0p1 rootwait consoleblank=0
+${fs}load mmc ${disk}:1 10800000 /boot/uImage && bootm 10800000 ; echo "Error loading kernel image"
diff --git a/board/congatec/qmx6/post-build.sh b/board/congatec/qmx6/post-build.sh
new file mode 100755
index 0000000..92251a5
--- /dev/null
+++ b/board/congatec/qmx6/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+TARGET_DIR=$1
+BOARD_DIR="$(dirname $0)"
+
+mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n "boot script" \
+    -d $BOARD_DIR/6q_bootscript.txt $TARGET_DIR/6q_bootscript
diff --git a/board/congatec/qmx6/readme.txt b/board/congatec/qmx6/readme.txt
new file mode 100644
index 0000000..d2e0dca
--- /dev/null
+++ b/board/congatec/qmx6/readme.txt
@@ -0,0 +1,36 @@
+This is the minimal buildroot support for the Congatec QMX6 Qseven CoM
+
+conga-QMX6 is based on the freescale iMX6 SoC. For more information please
+have a look at http://www.congatec.com/products/qseven/conga-qmx6.html
+
+The configuration is based on the currently latest kernel release from
+Congatec's git repository which is based on 3.0.35. The bootloader u-boot
+is preconfigured on the CPU module and does not need to be replaced.
+
+To build the default configuration you only have to:
+
+	make qmx6_defconfig && make
+
+You will need a microSD card of sufficient size and the first or only
+partition configured as Linux type.
+
+To transfer the system to the card do:
+
+	$ sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
+
+You can optionally extend the filesystem size to the whole partition:
+
+	$ sudo resize2fs /dev/sdX1
+
+You can also update the card image without completely rewriting it:
+
+	$ sudo mount /dev/sdX1 /mnt
+	$ sudo tar xf output/images/rootfs.tar -C /mnt
+	$ sudo umount /mnt
+
+Connect a terminal program to the rs232 connector marked "CONSOLE"
+with baudrate set to 115200, insert the microSD card into the socket
+on the CPU module and power the board to watch the system boot.
+
+Booting from the SD card slot on the base board is currently not
+supported.
diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
new file mode 100644
index 0000000..fd88e9c
--- /dev/null
+++ b/configs/qmx6_defconfig
@@ -0,0 +1,14 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_KERNEL_HEADERS_3_0=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/congatec/qmx6/post-build.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0_QMX6_R1.1.2"
+BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_3=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
