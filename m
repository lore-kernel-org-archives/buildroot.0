From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 24 Sep 2012 22:51:44 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for boundarydevices
	nitrogen6x board
Message-ID: <20120925093427.C0B609970E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=913b916567231aedb34c4a616519f607eb90e616
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://boundarydevices.com/products/nitrogen6x-board-imx6-arm-cortex-a9-sbc/

And post-build hook for u-boot scripts.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/boundarydevices/nitrogen6x/6q_bootscript |  Bin 0 -> 455 bytes
 board/boundarydevices/nitrogen6x/6q_upgrade    |  Bin 0 -> 1587 bytes
 board/boundarydevices/nitrogen6x/post-build.sh |   18 ++++++++++++++++
 board/boundarydevices/nitrogen6x/readme.txt    |   16 ++++++++++++++
 configs/nitrogen6x_defconfig                   |   26 ++++++++++++++++++++++++
 5 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/6q_bootscript b/board/boundarydevices/nitrogen6x/6q_bootscript
new file mode 100644
index 0000000..e10cfeb
Binary files /dev/null and b/board/boundarydevices/nitrogen6x/6q_bootscript differ
diff --git a/board/boundarydevices/nitrogen6x/6q_upgrade b/board/boundarydevices/nitrogen6x/6q_upgrade
new file mode 100644
index 0000000..2f20efa
Binary files /dev/null and b/board/boundarydevices/nitrogen6x/6q_upgrade differ
diff --git a/board/boundarydevices/nitrogen6x/post-build.sh b/board/boundarydevices/nitrogen6x/post-build.sh
new file mode 100755
index 0000000..2f3c464
--- /dev/null
+++ b/board/boundarydevices/nitrogen6x/post-build.sh
@@ -0,0 +1,18 @@
+#!/bin/sh
+# post-build fixups
+# for furthe details, see
+# http://boundarydevices.com/u-boot-conventions-for-i-mx6-nitrogen6x-and-sabrelite/
+
+TARGET_DIR=$1
+IMAGES_DIR=$1/../images
+BOARD_DIR="$(dirname $0)"
+
+# bd u-boot looks for bootscript here
+cp $BOARD_DIR/6q_bootscript $TARGET_DIR
+
+# u-boot / update script for bd upgradeu command
+if [ -e $IMAGES_DIR/u-boot.bin ];
+then
+    cp $IMAGES_DIR/u-boot.bin $TARGET_DIR
+    cp $BOARD_DIR/6q_upgrade $TARGET_DIR
+fi
diff --git a/board/boundarydevices/nitrogen6x/readme.txt b/board/boundarydevices/nitrogen6x/readme.txt
new file mode 100644
index 0000000..6e9b95c
--- /dev/null
+++ b/board/boundarydevices/nitrogen6x/readme.txt
@@ -0,0 +1,16 @@
+Buildroot for Boundary Devices Nitrogen6X:
+
+http://boundarydevices.com/products/nitrogen6x-board-imx6-arm-cortex-a9-sbc/
+
+Notice: U-Boot as shipped on the board has a bug reading rev 0 ext2
+file systems (which is what genext2fs generates). To convert it to rev
+1, do:
+
+tune2fs -O filetype output/images/rootfs.ext2
+e2fsck -a output/images/rootfs.ext2
+
+To install, simply extract rootfs.ext2 to first partition of a uSD card:
+
+sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
+
+Where 'sdX1' is the device node of the uSD partition.
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
new file mode 100644
index 0000000..2b7daec
--- /dev/null
+++ b/configs/nitrogen6x_defconfig
@@ -0,0 +1,26 @@
+# architecture
+BR2_arm=y
+BR2_cortex_a9=y
+
+# system
+BR2_TARGET_GENERIC_GETTY=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
+
+# filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+
+# bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="mx6q_sabrelite"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_GIT_REPO_URL="git://github.com/boundarydevices/u-boot-2009-08.git"
+BR2_TARGET_UBOOT_CUSTOM_GIT_VERSION="1f7edab0ac5ebf564e9ad9797fedc2a668149b96"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/boundarydevices/linux-imx6.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="cb1a536f4583af7e1572d39cabd4ac597a8916a5"
+BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
