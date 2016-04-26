From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue, 26 Apr 2016 17:35:55 +0100
Subject: [Buildroot] [PATCH 1/2] uboot and arm trusted firmware build added
	to juno board
Message-ID: <eeb5c500573a8584bfbfe6d33bf160c725683a18.1461688139.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds more options to the juno's default configuration file
and more content to the readme.txt, regarding the introduction of u-boot and
arm trusted firmware build.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
 board/arm/juno/readme.txt  | 26 +++++++++++++++++++++-----
 configs/arm_juno_defconfig | 12 ++++++++++++
 2 files changed, 33 insertions(+), 5 deletions(-)

diff --git a/board/arm/juno/readme.txt b/board/arm/juno/readme.txt
index 52fabf9..507ed6d 100644
--- a/board/arm/juno/readme.txt
+++ b/board/arm/juno/readme.txt
@@ -7,8 +7,8 @@ These instructions apply to all models of the ARM Juno:
   - Juno r0 (does not support PCIe)
   - Juno r1 (supports PCIe)
 
-Buildroot will generate the kernel image, device tree blob and a
-minimal root filesystem.
+Buildroot will generate the kernel image, device tree blob, a minimal 
+root filesystem, a u-boot binary and ARM Trusted Firmware binaries.
 
 How to build it
 ===============
@@ -42,6 +42,21 @@ After building, you should obtain this tree:
     +-- juno.dtb (if Juno r0 is used)
     +-- juno-r1.dtb (if Juno r1 is used)
     +-- Image
+    +-- u-boot.bin
+    +-- bl1.bin
+    +-- bl2.bin
+    +-- bl2u.bin
+    +-- bl31.bin
+    +-- fip.bin
+
+Other ARM Trusted Firmware options
+==================================
+If you need to include the bootlader into the fip package, please
+configure BR2_TARGET_ATFIRMWARE_PAYLOAD_PATH to specify the path to the
+binary.
+
+If you need to include the SCP Firmware into the fip package please
+specify SCP_BL2=<binary_path> in BR2_TARGET_ATFIRMWARE_ADDITIONAL_VARIABLES.
 
 Preparing your rootfs
 ======================
@@ -89,8 +104,8 @@ NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 ......
 
-Installing kernel image and DTB
-===============================
+Installing kernel image, DTB and bootloader
+===========================================
 
 1. Connect to the ARM Juno UART0 and execute USB_ON in the terminal
 2. Connect a USB cable between your PC and ARM Juno USB type B connector
@@ -98,7 +113,8 @@ Installing kernel image and DTB
 3. Open the software/ folder
 4. Copy the 'Image' file to software/
 5. Copy the 'juno-r1.dtb' (r1) or the 'juno.dtb' (r0) file to software/
-6. Press the red button in the front pannel of ARM Juno
+6. Copy the 'bl1.bin' and 'fip.bin' files to software/
+7. Press the red button in the front pannel of ARM Juno
 
 At this time, the board will erase the Flash entry for each new item and
 replace it with the lastest ones.
diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 87b6374..b94d04c 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -12,3 +12,15 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
+BR2_TARGET_ATFIRMWARE=y
+BR2_TARGET_ATFIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ATFIRMWARE_VERSION="v1.2"
+BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_VERSION="v1.2"
+BR2_TARGET_ATFIRMWARE_PLATFORM="juno"
+
-- 
1.8.1.5
