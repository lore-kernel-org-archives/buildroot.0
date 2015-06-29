From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Jun 2015 13:31:36 -0300
Subject: [Buildroot] [PATCH] configs/acmesystems_aria_g25: new config
Message-ID: <1435595496-8627-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new basic configuration for ACME Systems ARIA G25 SOM.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../aria-g25/at91bootstrap_aria_g25.config         |  9 ++++
 board/acmesystems/aria-g25/readme.txt              | 48 ++++++++++++++++++++++
 configs/acmesystems_aria_g25_defconfig             | 24 +++++++++++
 3 files changed, 81 insertions(+)
 create mode 100644 board/acmesystems/aria-g25/at91bootstrap_aria_g25.config
 create mode 100644 board/acmesystems/aria-g25/readme.txt
 create mode 100644 configs/acmesystems_aria_g25_defconfig

diff --git a/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config b/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config
new file mode 100644
index 0000000..f4c12a7
--- /dev/null
+++ b/board/acmesystems/aria-g25/at91bootstrap_aria_g25.config
@@ -0,0 +1,9 @@
+CONFIG_AT91SAM9X5_ARIA=y
+CONFIG_BUS_SPEED_100MHZ=y
+CONFIG_RAM_128MB=y
+CONFIG_SDCARD=y
+CONFIG_LOAD_LINUX=y
+CONFIG_LINUX_ZIMAGE=y
+CONFIG_LINUX_KERNEL_ARG_STRING="mem=256M console=ttyS0,115200 root=/dev/mmcblk0p2 rootfstype=ext4 rootwait"
+CONFIG_DEBUG=y
+CONFIG_THUMB=y
diff --git a/board/acmesystems/aria-g25/readme.txt b/board/acmesystems/aria-g25/readme.txt
new file mode 100644
index 0000000..374cf1c
--- /dev/null
+++ b/board/acmesystems/aria-g25/readme.txt
@@ -0,0 +1,48 @@
+Build instructions
+==================
+
+As a regular user configure and then build:
+
+$ make acmesystems_aria_g25_defconfig
+$ make
+
+Writing to the MicroSD card
+===========================
+
+Assuming your Aria G25 baseboard has a MicroSD socket, for example with
+the Terra baseboard, you'll need a blank MicroSD (obviously) initialized
+in a particular way to be able to boot from it.
+
+Assuming the card is seen as /dev/sdb in your PC/laptop/other device
+you'll need to run the following commands as root or via sudo.
+
+Make sure all of the card partitions are unmounted before starting.
+
+First we'll need to create two partitions:
+
+# sfdisk -uM /dev/sdb <<EOF
+,32,6
+;
+EOF
+
+Then we'll need to create the empty filesystems:
+
+# mkdosfs -n SD_BOOT /dev/sdb1
+# mkfs.ext4 -L SD_ROOT /dev/sdb2
+
+We'll populate the first partition (boot) with the relevant files:
+
+# mount /dev/sdb1 /mnt
+# cp output/images/at91bootstrap.bin /mnt/BOOT.BIN
+# cp output/images/zImage /mnt
+# cp output/images/at91-ariag25.dtb /mnt
+# umount /mnt
+
+And the root filesystem afterwards:
+
+# mount /dev/sdb2 /mnt
+# tar -C /mnt output/images/rootfs.tar
+# umount /mnt
+
+You're done, insert the MicroSD card in the slot and enjoy.
+
diff --git a/configs/acmesystems_aria_g25_defconfig b/configs/acmesystems_aria_g25_defconfig
new file mode 100644
index 0000000..624be1e
--- /dev/null
+++ b/configs/acmesystems_aria_g25_defconfig
@@ -0,0 +1,24 @@
+# Architecture
+BR2_arm=y
+
+# Toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
+
+# Bootloader
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="git://github.com/tanzilli/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="3f957cec253abc80fd10c733e5e596f46e1aef56"
+BR2_TARGET_AT91BOOTSTRAP3_USE_CUSTOM_CONFIG=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE="board/acmesystems/aria-g25/at91bootstrap_aria_g25.config"
-- 
2.3.6
