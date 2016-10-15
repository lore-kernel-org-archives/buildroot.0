From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 10:03:43 +0200
Subject: [Buildroot] [PATCH v4 3/3] configs/arm_juno: add the bootloader
	build
In-Reply-To: <1476518623-30654-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1476518623-30654-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1476518623-30654-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joao Pinto <jpinto@synopsys.com>

Thanks to the recent addition of the vexpress-firmware and
arm-trusted-firmware packages, this commit improves the ARM Juno
defconfig to also build a bootloader.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/arm/juno/readme.txt  | 21 ++++++++++++++++++---
 configs/arm_juno_defconfig | 10 ++++++++++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/board/arm/juno/readme.txt b/board/arm/juno/readme.txt
index 9314bb0..b292d96 100644
--- a/board/arm/juno/readme.txt
+++ b/board/arm/juno/readme.txt
@@ -8,8 +8,8 @@ These instructions apply to all models of the ARM Juno:
   - Juno r1 (supports PCIe)
   - Juno r2 (Big Cluster with A72)
 
-Buildroot will generate the kernel image, device tree blob and a
-minimal root filesystem.
+Buildroot will generate the kernel image, device tree blob, bootloader binaries
+and a minimal root filesystem.
 
 How to build it
 ===============
@@ -44,6 +44,20 @@ After building, you should obtain this tree:
     +-- juno-r1.dtb (if Juno r1 is used)
     +-- juno-r2.dtb (if Juno r2 is used)
     +-- Image
+    +-- bl1.bin
+    +-- bl2.bin
+    +-- bl2u.bin
+    +-- bl31.bin
+    +-- fip.bin
+    +-- scp-fw.bin
+    +-- u-boot.bin
+
+Preparing your rootfs
+======================
+
+Format your pen drive as a ext3 filesystem by executing:
+
+   $ mkfs.ext3 /dev/<your device>
 
 Preparing your rootfs
 ======================
@@ -113,7 +127,8 @@ Installing kernel image and DTB
 3. Open the software/ folder
 4. Copy the 'Image' file to software/
 5. Copy the 'juno-r1.dtb' (r1), 'juno.dtb' (r0) or juno-r2.dtb (r2) file to software/
-6. Press the red button in the front pannel of ARM Juno
+6. Copy the bootloader binaries (bl1.bin and fip.bin) to software/
+7. Press the red button in the front pannel of ARM Juno
 
 At this time, the board will erase the Flash entry for each new item and
 replace it with the lastest ones.
diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 75ed63c..8bc3a7a 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -10,3 +10,13 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1 arm/juno-r2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v1.2"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="juno"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
+BR2_TARGET_VEXPRESS_FIRMWARE=y
-- 
2.7.4
