From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Nov 2016 22:01:51 +0100
Subject: [Buildroot] [git commit] configs/qmx6: remove defconfig
Message-ID: <20161107210339.80ACA802A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be8779da6b8ce7079d2b3ff33d48ba41ddfca27c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The original submitter and follow-up contributors to the qmx6
defconfig no longer have the hardware available or the time/interest
to update this defconfig, which currently fails to build with gcc
5.x. Due to this, this commit removes this defconfig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/congatec/qmx6/readme.txt | 36 ------------------------------------
 configs/qmx6_defconfig         | 33 ---------------------------------
 2 files changed, 69 deletions(-)

diff --git a/board/congatec/qmx6/readme.txt b/board/congatec/qmx6/readme.txt
deleted file mode 100644
index d2e0dca..0000000
--- a/board/congatec/qmx6/readme.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-This is the minimal buildroot support for the Congatec QMX6 Qseven CoM
-
-conga-QMX6 is based on the freescale iMX6 SoC. For more information please
-have a look at http://www.congatec.com/products/qseven/conga-qmx6.html
-
-The configuration is based on the currently latest kernel release from
-Congatec's git repository which is based on 3.0.35. The bootloader u-boot
-is preconfigured on the CPU module and does not need to be replaced.
-
-To build the default configuration you only have to:
-
-	make qmx6_defconfig && make
-
-You will need a microSD card of sufficient size and the first or only
-partition configured as Linux type.
-
-To transfer the system to the card do:
-
-	$ sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
-
-You can optionally extend the filesystem size to the whole partition:
-
-	$ sudo resize2fs /dev/sdX1
-
-You can also update the card image without completely rewriting it:
-
-	$ sudo mount /dev/sdX1 /mnt
-	$ sudo tar xf output/images/rootfs.tar -C /mnt
-	$ sudo umount /mnt
-
-Connect a terminal program to the rs232 connector marked "CONSOLE"
-with baudrate set to 115200, insert the microSD card into the socket
-on the CPU module and power the board to watch the system boot.
-
-Booting from the SD card slot on the base board is currently not
-supported.
diff --git a/configs/qmx6_defconfig b/configs/qmx6_defconfig
deleted file mode 100644
index cb80cad..0000000
--- a/configs/qmx6_defconfig
+++ /dev/null
@@ -1,33 +0,0 @@
-BR2_arm=y
-BR2_cortex_a9=y
-# Linux headers same as kernel, a 3.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-
-# Notice you need a recent version of u-boot (with DT support) to be able
-# to boot this kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://git.congatec.com/arm/imx6_kernel_3.14.git"
-# Last version of branch cgt_qmx6_3.14.28_1.0.0
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="105820d6bd251deb49c3dd3f71fa0d76adce97c7"
-BR2_LINUX_KERNEL_DEFCONFIG="qmx6"
-BR2_LINUX_KERNEL_UIMAGE=y
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-qmx6"
-BR2_LINUX_KERNEL_INSTALL_TARGET=y
-
-# Change boardname depending of your product number
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="cgt_qmx6_pn016103"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://git.congatec.com/arm/qmx6_uboot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="4d3b64e93064ed3d97ef7d91ff0f61a693a460fc"
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.pn016103.imx"
-
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_3=y
-
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
