From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 24 Jan 2016 00:17:56 +0100
Subject: [Buildroot] [PATCH] board: Add support for Acmesystems Arietta g25
Message-ID: <1453591076-30009-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a minimal working configuration for
Acmesystems Arietta g25

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 board/acmesystems/arietta-g25/readme.txt        | 50 +++++++++++++++++++++++++
 configs/acmesystems_arietta_g25_128mb_defconfig | 23 ++++++++++++
 configs/acmesystems_arietta_g25_256mb_defconfig | 23 ++++++++++++
 3 files changed, 96 insertions(+)
 create mode 100644 board/acmesystems/arietta-g25/readme.txt
 create mode 100644 configs/acmesystems_arietta_g25_128mb_defconfig
 create mode 100644 configs/acmesystems_arietta_g25_256mb_defconfig

diff --git a/board/acmesystems/arietta-g25/readme.txt b/board/acmesystems/arietta-g25/readme.txt
new file mode 100644
index 0000000..bccdb61
--- /dev/null
+++ b/board/acmesystems/arietta-g25/readme.txt
@@ -0,0 +1,50 @@
+Build instructions
+==================
+
+As a regular user configure and then build:
+
+$ make acmesystems_arietta_g25_128mb_defconfig (128MB RAM variant)
+  or...
+$ make acmesystems_arietta_g25_256mb_defconfig (256MB RAM variant)
+
+$ make
+
+Writing to the MicroSD card
+===========================
+
+You'll need a blank MicroSD (obviously) initialized
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
diff --git a/configs/acmesystems_arietta_g25_128mb_defconfig b/configs/acmesystems_arietta_g25_128mb_defconfig
new file mode 100644
index 0000000..97813b9
--- /dev/null
+++ b/configs/acmesystems_arietta_g25_128mb_defconfig
@@ -0,0 +1,23 @@
+# Architecture
+BR2_arm=y
+
+# Toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.1.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
+BR2_LINUX_KERNEL_XZ=y
+
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="git://github.com/tanzilli/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-128m"
diff --git a/configs/acmesystems_arietta_g25_256mb_defconfig b/configs/acmesystems_arietta_g25_256mb_defconfig
new file mode 100644
index 0000000..20336c8
--- /dev/null
+++ b/configs/acmesystems_arietta_g25_256mb_defconfig
@@ -0,0 +1,23 @@
+# Architecture
+BR2_arm=y
+
+# Toolchain
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="4.1.1"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.1.1"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-ariag25"
+BR2_LINUX_KERNEL_XZ=y
+
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="git://github.com/tanzilli/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="cedbde4b36695b715f469f4872f47e5cc8115000"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="arietta-256m"
-- 
1.9.1
