From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Thu, 26 Nov 2020 17:58:30 +0100
Subject: [Buildroot] [PATCH] configs/arm_foundationv8: bump to Linux 5.9.11
Message-ID: <20201126165831.6341-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump to the latest kernel v5.9.11.
- Switch to PSCI for bringing up the secondary CPUs.
- Update the instruction in the readme.txt to use the latest FVP v8
  Foundation Platform 11.12 build 38, and to start 4 cores in SMP.

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
---


Hi,

Here is a first step to "modernize" the arm_foundationv8_defconfig. I think
turning on more than one core with PSCI makes sense. Let me know if this is ok
for you. Also, in the future I would like to switch to GICv3 but I am not there
yet.

Best regards,
Vincent.


 board/arm/foundation-v8/readme.txt | 8 +++++---
 configs/arm_foundationv8_defconfig | 9 +++++----
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index 1dedf68cba..359aeda1e1 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -3,17 +3,19 @@ ARM software simulator of the AArch64 architecture.
 
 First, one has to download the AArch64 software simulator from:
 
-  https://silver.arm.com/download/download.tm?pv=2663527
+  https://silver.arm.com/download/download.tm?pv=4807186
 
 Then, use the arm_foundationv8_defconfig configuration to build your
 Buildroot system.
 
 Finally, boot your system with:
 
- ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-4.7/Foundation_Platform \
+ ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-6.4/Foundation_Platform \
     --image output/images/linux-system.axf \
     --block-device output/images/rootfs.ext2 \
-    --network=nat
+    --network=nat \
+    --no-gicv3 \
+    --cores 4
 
 You can get network access from within the simulated environment
 by requesting an IP address using DHCP (run the command 'udhcpc').
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index ea19f35502..0f84103690 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,15 +1,16 @@
 BR2_aarch64=y
-# Linux headers same as kernel, a 4.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+# Linux headers same as kernel, a 5.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_9=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.9.11"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arm/foundation-v8-psci"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_BOOT_WRAPPER_AARCH64=y
 BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="arm/foundation-v8"
 BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS="root=/dev/vda consolelog=9 console=ttyAMA0 rw"
+BR2_TARGET_BOOT_WRAPPER_AARCH64_PSCI=y
-- 
2.29.2
