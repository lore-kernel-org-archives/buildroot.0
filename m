From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue, 11 Oct 2016 13:56:15 +0100
Subject: [Buildroot] [RESEND] [PATCH v3 3/3] configs: add u-boot and
	atfirmware options to juno
In-Reply-To: <cover.1467737979.git.jpinto@synopsys.com>
References: <cover.1467737979.git.jpinto@synopsys.com>
Message-ID: <f9038e1860e12ce20dc3f3e979d517affb773e5c.1467737979.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the necessary U-Boot and ATFirmware configurations to the
Juno's defconfig and updates the readme.txt file regarding the new output
binaries.

Signed-off-by: Joao Pinto <jpinto@synopsys.com>
---
Changes v2->v3:
- Nothing changed (just to keep up with patch set version)
Changes v1->v2:
- Changed BR2_TARGET_UBOOT_DEFCONFIG to BR2_TARGET_UBOOT_BOARDNAME
- Fixed a typo in the e-mail subject

 board/arm/juno/readme.txt  | 21 ++++++++++++++++++---
 configs/arm_juno_defconfig |  9 +++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/board/arm/juno/readme.txt b/board/arm/juno/readme.txt
index 52fabf9..2a2af55 100644
--- a/board/arm/juno/readme.txt
+++ b/board/arm/juno/readme.txt
@@ -7,8 +7,8 @@ These instructions apply to all models of the ARM Juno:
   - Juno r0 (does not support PCIe)
   - Juno r1 (supports PCIe)
 
-Buildroot will generate the kernel image, device tree blob and a
-minimal root filesystem.
+Buildroot will generate the kernel image, device tree blob, bootloader binaries
+and a minimal root filesystem.
 
 How to build it
 ===============
@@ -42,6 +42,20 @@ After building, you should obtain this tree:
     +-- juno.dtb (if Juno r0 is used)
     +-- juno-r1.dtb (if Juno r1 is used)
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
@@ -98,7 +112,8 @@ Installing kernel image and DTB
 3. Open the software/ folder
 4. Copy the 'Image' file to software/
 5. Copy the 'juno-r1.dtb' (r1) or the 'juno.dtb' (r0) file to software/
-6. Press the red button in the front pannel of ARM Juno
+6. Copy the bootloader binaries (bl1.bin and fip.bin) to software/
+7. Press the red button in the front pannel of ARM Juno
 
 At this time, the board will erase the Flash entry for each new item and
 replace it with the lastest ones.
diff --git a/configs/arm_juno_defconfig b/configs/arm_juno_defconfig
index 87b6374..778661e 100644
--- a/configs/arm_juno_defconfig
+++ b/configs/arm_juno_defconfig
@@ -12,3 +12,12 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/arm/juno/linux-juno-defconfig"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/juno arm/juno-r1"
+BR2_TARGET_ATFIRMWARE=y
+BR2_TARGET_ATFIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware.git"
+BR2_TARGET_ATFIRMWARE_CUSTOM_GIT_VERSION="v1.2"
+BR2_TARGET_ATFIRMWARE_PLATFORM="juno"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="vexpress_aemv8a_juno"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.03"
-- 
1.8.1.5
