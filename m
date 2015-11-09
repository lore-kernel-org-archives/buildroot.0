From: Jens Kamenik <jenskamenik@googlemail.com>
Date: Mon,  9 Nov 2015 02:20:23 +0100
Subject: [Buildroot] [PATCH] configs: new configuration for at91sam9g20ek
Message-ID: <1447032023-6229-1-git-send-email-jenskamenik@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- added NAND-based configuration configs/at91sam9g20ek_defconfig for the at91sam9g20ek eval. board
- added at91sam9g20ek option to the atmel/flasher.sh tool
- removed old configs/at91sam9g20dfc_defconfig
- added at91sam9g20ek description for configuring the board for flashing

Signed-off-by: Jens Kamenik <jenskamenik@googlemail.com>
---
 board/atmel/flasher.sh           |  5 +++++
 board/atmel/readme.txt           |  7 +++++++
 configs/at91sam9g20dfc_defconfig | 31 -------------------------------
 configs/at91sam9g20ek_defconfig  | 23 +++++++++++++++++++++++
 4 files changed, 35 insertions(+), 31 deletions(-)
 delete mode 100644 configs/at91sam9g20dfc_defconfig
 create mode 100644 configs/at91sam9g20ek_defconfig

diff --git a/board/atmel/flasher.sh b/board/atmel/flasher.sh
index bbdb199..7707c6d 100755
--- a/board/atmel/flasher.sh
+++ b/board/atmel/flasher.sh
@@ -20,6 +20,10 @@ family_at91sam9g25ek="at91sam9x5ek"
 mach_at91sam9g25ek="at91sam9g25-ek"
 dtb_at91sam9g25ek="at91sam9g25ek.dtb"
 
+family_at91sam9g20ek="at91sam9g20ek"
+mach_at91sam9g20ek="at91sam9g20-ek"
+dtb_at91sam9g20ek="at91sam9g20ek.dtb"
+
 family_at91sam9g35ek="at91sam9x5ek"
 mach_at91sam9g35ek="at91sam9g35-ek"
 dtb_at91sam9g35ek="at91sam9g35ek.dtb"
@@ -93,6 +97,7 @@ Available boards:
   at91sam9g45m10ek
   at91sam9rlek
   at91sam9g15ek
+  at91sam9g20ek
   at91sam9g25ek
   at91sam9x25ek
   at91sam9g35ek
diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index 539ef66..25682cf 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -7,6 +7,7 @@ also be found on the Linux4SAM website, in particular here:
 http://www.at91.com/linux4sam/bin/view/Linux4SAM/GettingStarted
 
 This guide covers the following configurations:
+ - at91sam9g20ek_defconfig
  - at91sam9g45m10ek_defconfig
  - at91sam9rlek_defconfig
  - at91sam9x5ek_defconfig (at91sam9g15, at91sam9g25, at91sam9x25,
@@ -33,6 +34,7 @@ Flashing the board
 ------------------
 
 Connect the board:
+ o at91sam9g20ek: DBGU: J17, USB sam-ba: J19
  o at91sam9g45m10ek: DBGU: J10, USB sam-ba: J14
  o at91sam9rlek: DBGU: J19, USB sam-ba: J21
  o at91sam9x5ek: DBGU: J11, USB sam-ba: J20
@@ -42,6 +44,11 @@ Connect the board:
  o sama5d4 Xplained: DBGU: J1, USB sam-ba: J11
 
 Start the board in RomBOOT:
+ o at91sam9g20ek:
+    1. open JP7, JP33 and JP34
+    2. start the board
+    3. close JP34
+
  o at91sam9g45m10ek:
     1. open JP8, JP10 and JP12
     2. start the board
diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
deleted file mode 100644
index 1d346c2..0000000
--- a/configs/at91sam9g20dfc_defconfig
+++ /dev/null
@@ -1,31 +0,0 @@
-# Architecture
-BR2_arm=y
-BR2_arm926t=y
-
-# Lock down headers to avoid breaking with new defaults
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.1.6"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_1=y
-
-# Host utilities
-#
-BR2_PACKAGE_HOST_SAM_BA=y
-
-# First stage bootloader
-BR2_TARGET_AT91BOOTSTRAP=y
-BR2_TARGET_AT91BOOTSTRAP_BOARD="at91sam9g20ek"
-BR2_TARGET_AT91BOOTSTRAP_DATAFLASHCARD=y
-
-# Second stage bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9g20ek_nandflash"
-
-# Kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1.6"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g20ek"
-
-# Filesystem
-BR2_TARGET_ROOTFS_TAR=y
diff --git a/configs/at91sam9g20ek_defconfig b/configs/at91sam9g20ek_defconfig
new file mode 100644
index 0000000..10125e1
--- /dev/null
+++ b/configs/at91sam9g20ek_defconfig
@@ -0,0 +1,23 @@
+BR2_arm=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="cad9c452bfeda05527fa46972c9d717b46f7b746"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g20ek"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_MAXLEBCNT=2047
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9g20eknf_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9g20ek_nandflash"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
+BR2_PACKAGE_HOST_SAM_BA=y
-- 
1.9.1
