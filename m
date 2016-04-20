From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 20 Apr 2016 18:47:04 +0100
Subject: [Buildroot] [PATCH] uboot build and deploy added to juno board
Message-ID: <fce2649dcd6d9c232e557bfb06de3ff222fe9fa6.1461174061.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch has the goal to add to the juno board defconfig the u-boot build 
configurations. The juno board readme file was also updated with the
necessary steps to build the ARM Trusted Firmware (with u-boot in it) and
how to deploy it.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
 board/arm/juno/readme.txt  | 48 +++++++++++++++++++++++++++++++++++++++++-----
 configs/arm_juno_defconfig |  6 ++++++
 2 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/board/arm/juno/readme.txt b/board/arm/juno/readme.txt
index 52fabf9..e9c0bfe 100644
--- a/board/arm/juno/readme.txt
+++ b/board/arm/juno/readme.txt
@@ -7,8 +7,8 @@ These instructions apply to all models of the ARM Juno:
   - Juno r0 (does not support PCIe)
   - Juno r1 (supports PCIe)
 
-Buildroot will generate the kernel image, device tree blob and a
-minimal root filesystem.
+Buildroot will generate the kernel image, device tree blob, a minimal
+root filesystem and a u-boot binary.
 
 How to build it
 ===============
@@ -42,6 +42,7 @@ After building, you should obtain this tree:
     +-- juno.dtb (if Juno r0 is used)
     +-- juno-r1.dtb (if Juno r1 is used)
     +-- Image
+    +-- u-boot.bin
 
 Preparing your rootfs
 ======================
@@ -63,6 +64,42 @@ When completed make sure to unmount the device:
 
 Insert the pen drive in one of the ARM Juno' USB type A connectors.
 
+Building bootloader files bl1.bin and fip.bin
+=============================================
+First clone ARM Trusted Firmware repository
+
+   $ git clone https://github.com/ARM-software/arm-trusted-firmware.git
+
+After clonning, please configure the following environment variables:
+
+  CROSS_COMPILE=<buidlroot_path>/output/host/usr/bin/aarch64-buildroot-linux-gnu-
+  BL33=<buidlroot_path>/output/images/u-boot.bin
+  SCP_BL2=<path_to_scp_firmware>
+
+Finaly execute:
+  make PLAT=juno all fip
+
+After building, you should obtain this tree:
+
+    build/juno/release/
+    +-- bl1.bin
+    +-- bl2/
+    +-- bl2.bin
+    +-- bl2u/
+    +-- bl2u.bin
+    +-- bl31/
+    +-- bl31.bin
+    +-- fip.bin
+
+Useful tip:
+The SCP firmware (typically named scp-fw.bin) can be obtained by unpacking
+the original fip.bin:
+
+    $ fip_create ???unpack fip.bin
+
+The fip_create application is available in the ARM Trusted Firmware Package in
+tools/fip_create/.
+
 Configure *.dtb in the boot configuration for Juno r0
 =====================================================
 
@@ -89,8 +126,8 @@ NOR3LOAD: 00000000               ;Image Load Address
 NOR3ENTRY: 00000000              ;Image Entry Point
 ......
 
-Installing kernel image and DTB
-===============================
+Installing kernel image, DTB and bootloader
+===========================================
 
 1. Connect to the ARM Juno UART0 and execute USB_ON in the terminal
 2. Connect a USB cable between your PC and ARM Juno USB type B connector
@@ -98,7 +135,8 @@ Installing kernel image and DTB
 3. Open the software/ folder
 4. Copy the 'Image' file to software/
 5. Copy the 'juno-r1.dtb' (r1) or the 'juno.dtb' (r0) file to software/
-6. Press the red button in the front pannel of ARM Juno
+6. Copy the 'bl1.bin' and 'fip.bin' files to software/
+7. Press the red button in the front pannel of ARM Juno
 
 At this time, the board will erase the Flash entry for each new item and
 replace it with the lastest ones.
diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 87b6374..9ed4258 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -12,3 +12,9 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
+BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2016.03"
-- 
1.8.1.5
