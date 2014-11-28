From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 23:36:29 +0100
Subject: [Buildroot] [git commit] Add a defconfig for MIPS Creator CI20
Message-ID: <20141201104839.AF56D7FC49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51a95551159461e52f204cf6153ca52954438b4d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MIPS Creator CI20 is a Linux and Android development system from
MIPS/Imagination Technologies. It incorporates an Ingenic JZ4780 SoC
which includes a 1.2GHz dual core MIPS32 processor and Imagination
PowerVR SGX540 GPU.

More information can be found at:
  http://elinux.org/MIPS_Creator_CI20

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/ci20/readme.txt  |   42 ++++++++++++++++++++++++++++++++++++++++++
 configs/ci20_defconfig |   18 ++++++++++++++++++
 2 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/board/ci20/readme.txt b/board/ci20/readme.txt
new file mode 100644
index 0000000..ca7bb52
--- /dev/null
+++ b/board/ci20/readme.txt
@@ -0,0 +1,42 @@
+*********************
+* MIPS Creator CI20 *
+*********************
+
+The 'ci20_defconfig' will create a root filesystem and a kernel image
+under the 'output/images/' directory. This document will try to explain how
+to use them in order to run Buildroot in the MIPS Creator CI20 board.
+
+Assuming you are at the U-Boot prompt of the MIPS Creator CI20, you have to
+load the generated kernel image by using the 'tftpboot' command. In
+order to do that, you will need to get the network working. Here you
+have the instructions to set the ip address, netmask and gateway:
+
+  setenv ipaddr x.x.x.x
+  setenv netmask x.x.x.x
+  setenv gatewayip x.x.x.x
+
+Now you have to set the ip for the TFTP server you are going to load the
+kernel image from, and also the name of the kernel image file (we use
+'uImage' as a filename in this example):
+
+  setenv serverip x.x.x.x
+  setenv bootfile uImage
+
+And finally load the kernel image:
+
+  tftpboot
+
+Now you have to extract the generated root filesystem into a USB drive
+or SD-Card. Here you have the instructions to boot from the two of them.
+You have to choose the one your prefer:
+
+From USB
+  setenv bootargs console=ttyS4,115200 console=tty0 mem=256M at 0x0
+mem=768M at 0x30000000 root=/dev/sda1
+
+From SD-Card
+  setenv bootargs console=ttyS4,115200 console=tty0 mem=256M at 0x0
+mem=768M at 0x30000000 root=/dev/mmcblk0p1
+
+And finally run this command to boot the board:
+  bootm
diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
new file mode 100644
index 0000000..7f1bf87
--- /dev/null
+++ b/configs/ci20_defconfig
@@ -0,0 +1,18 @@
+# architecture
+BR2_mipsel=y
+BR2_mips_32r2=y
+# BR2_MIPS_SOFT_FLOAT is not set
+
+# system
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.0.8"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
+
+# kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ba11adc7ac8792b0eb7415a1cc9c0968604a6fac"
+BR2_LINUX_KERNEL_DEFCONFIG="ci20"
