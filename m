From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 11 Jan 2013 14:17:30 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_v2=5D_configs=3A_add_RaspberryPi_d?=
	=?utf-8?q?efconfig?=
Message-ID: <1357910250-31110-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a default configuration for the RaspberryPi, tested and functionnal.

The kernel used is the one developped by the RaspberryPi foundation as it's not
fully supported currently in mainline kernel.
The configuration used for the kernel is the default bcmrpi.

Note that the kernel generated is a zImage but to work you should :
    - Rename it to kernel.img
    - Add 'kernel=zImage' in config.txt (without quotes).

For more info, please find board/raspberrypi/README.txt

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 board/raspberrypi/README.txt |   35 +++++++++++++++++++++++++++++++++++
 configs/rpi_defconfig        |   19 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 board/raspberrypi/README.txt
 create mode 100644 configs/rpi_defconfig

diff --git a/board/raspberrypi/README.txt b/board/raspberrypi/README.txt
new file mode 100644
index 0000000..5ddc5c5
--- /dev/null
+++ b/board/raspberrypi/README.txt
@@ -0,0 +1,35 @@
+## RaspberryPi
+
+When you use the rpi_defconfig to build a rootfs for your RaspberryPi, a few
+items are created in output/images :
+
+	output/images/
+	??? rootfs.tar
+	??? rpi-firmware
+	??? ??? bootcode.bin
+	??? ??? config.txt
+	??? ??? fixup_cd.dat
+	??? ??? fixup.dat
+	??? ??? start_cd.elf
+	??? ??? start.elf
+	??? zImage
+
+In order to have a working SDCard, you should have at least two partitions :
+
+    - First partition :
+	This will be the boot partition (It must be formated in fat32 and have
+        bootable flags).
+	It should contains the *content* of output/images/rpi-firmware/.
+        It will also contain the kernel binary.
+        For the kernel to be found, you have two choices :
+	    1 - Rename zImage to kernel.img since it's the default kernel file
+                name here.
+            2 - Add 'kernel=zImage' to config.txt (without the quotes).
+
+    - Second partition :
+        This will contains the rootfs and should be formated in ext4.
+	If you chose another filesystem, you should modify the cmdline in
+        config.txt.
+        Then simply extract rootfs.tar to this partition.
+
+Finally, a good source of information is http://elinux.org/R-Pi_Hub
diff --git a/configs/rpi_defconfig b/configs/rpi_defconfig
new file mode 100644
index 0000000..8c73d0e
--- /dev/null
+++ b/configs/rpi_defconfig
@@ -0,0 +1,19 @@
+BR2_arm=y
+BR2_arm1176jzf_s=y
+
+BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_TARGET_GENERIC_GETTY_PORT="tty1"
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_USERLAND=y
+BR2_PACKAGE_LIBCOFI=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="31a951046155b27361127d9cf85a1f58719fe9b3"
+BR2_LINUX_KERNEL_USE_DEFCONFIG=y
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
+BR2_LINUX_KERNEL_ZIMAGE=y
--
1.7.10.4
