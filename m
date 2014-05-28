From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 28 May 2014 14:19:01 +0200
Subject: [Buildroot] [PATCH 1/1] Add support for Congatec QMX6 SoC
Message-ID: <1401279541-28922-1-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the iMX6 based conga-QMX6 family of Qseven modules.

This patch is based on Linux 3.0.35 from Congatec's kernel git reporitory

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
There has been a similar patch set from Lahoudere Fabien <fabien.lahoudere@openwide.fr>
last year adding a patch to the freescale kernel repository, but it seems more logical
to me to start from the manufacturer's repo (which might not have been availeable at
that time).

 board/congatec/qmx6/6q_bootscript.txt |  6 ++++++
 board/congatec/qmx6/post-build.sh     |  8 ++++++++
 board/congatec/qmx6/readme.txt        | 32 ++++++++++++++++++++++++++++++++
 configs/qmx6_defconfig                | 13 +++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 board/congatec/qmx6/6q_bootscript.txt
 create mode 100755 board/congatec/qmx6/post-build.sh
 create mode 100644 board/congatec/qmx6/readme.txt
 create mode 100644 configs/qmx6_defconfig

diff --git a/board/congatec/qmx6/6q_bootscript.txt b/board/congatec/qmx6/6q_bootscript.txt
new file mode 100644
index 0000000..0c9517d
--- /dev/null
+++ b/board/congatec/qmx6/6q_bootscript.txt
@@ -0,0 +1,6 @@
+set bootargs $bootargs console=ttymxc1,115200 vmalloc=400M root=/dev/mmcblk0p1 rootwait consoleblank=0 ;
+setenv bootargs $bootargs video=mxcfb0:dev=hdmi,1280x720M at 60,if=RGB24
+setenv bootargs $bootargs video=mxcfb1:dev=lcd,CLAA-WVGA,if=RGB666
+setenv bootargs $bootargs fbmem=28M,10M
+${fs}load mmc ${disk}:1 10800000 /boot/uImage && bootm 10800000 ; echo "Error loading kernel image"
+
diff --git a/board/congatec/qmx6/post-build.sh b/board/congatec/qmx6/post-build.sh
new file mode 100755
index 0000000..d2173a0
--- /dev/null
+++ b/board/congatec/qmx6/post-build.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+TARGET_DIR=$1
+BOARD_DIR="$(dirname $0)"
+MKIMAGE=$1/../host/usr/bin/mkimage
+
+$MKIMAGE -A arm -O linux -T script -C none -a 0 -e 0 -n "boot script" -d $BOARD_DIR/6q_bootscript.txt $TARGET_DIR/6q_bootscript
+
diff --git a/board/congatec/qmx6/readme.txt b/board/congatec/qmx6/readme.txt
new file mode 100644
index 0000000..f038fef
--- /dev/null
+++ b/board/congatec/qmx6/readme.txt
@@ -0,0 +1,32 @@
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
+To transfer the system to the card you have zwo options:
+
+1.	$ sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
+
+2. 	only once: sudo mkfs.ext3 /dev/sdX1
+	$ sudo mount /dev/sdX1 /mnt
+	$ sudo tar xf output/images/rootfs.tar -C 
+	$ sudo umount /mnt
+
+Connect a terminal program to the rs232 connector marked "CONSOLE",
+insert the microSD card into the socket on the CPU module and power
+the board to watch the system boot.
+
+Booting from the SD card slot on the base board is currently not
+supported.
+
diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
new file mode 100644
index 0000000..8cc8de3
--- /dev/null
+++ b/configs/qmx6_defconfig
@@ -0,0 +1,13 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/congatec/qmx6/post-build.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.0.35_4.1.0_QMX6_R1.1.2"
+BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.0.0.rc2
