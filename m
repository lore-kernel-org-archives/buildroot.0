From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 2 Nov 2012 21:12:23 +0100
Subject: [Buildroot] [git commit] Add default configuration for the AArch64
	Foundation V8 simulator
Message-ID: <20121102231433.66290999E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f567cb70da6f2f135d57728dabdc5d590878338
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that this configuration doesn't build entirely: the user must
manually run "make busybox-menuconfig" and disable the "Mount NFS
filesystems" option, because the toolchain does not have RPC support.

This issue will be fixed once the support for toolchain without RPC
will be integrated.

[Peter: fix readme typo]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 board/arm/foundation-v8/readme.txt |   26 ++++++++++++++++++++++++++
 configs/arm_foundationv8_defconfig |   15 +++++++++++++++
 2 files changed, 41 insertions(+), 0 deletions(-)

diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
new file mode 100644
index 0000000..3f8d4ef
--- /dev/null
+++ b/board/arm/foundation-v8/readme.txt
@@ -0,0 +1,26 @@
+This is the support for the ARM Foundation v8 machine emulated by the
+ARM software simulator of the AArch64 architecture.
+
+First, one has to download the AArch64 software simulator from:
+
+  https://silver.arm.com/download/download.tm?pv=1317469
+
+Then, use the arm_foundationv8_defconfig configuration to build your
+Buildroot system.
+
+Note that the Busybox build will fail due to the lack of rpc/rpc.h
+(the AArch64 toolchain does not have RPC support). Run 'make
+busybox-menuconfig', and in 'Linux System Utilities', disable the
+option 'Support mounting NFS file systems on Linux < 2.6.23' and
+restart the build. This problem will be fix in upcomins versions of
+Buildroot.
+
+Finally, boot your system with:
+
+ ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/Foundation_v8 \
+    --image output/images/linux-system.axf \
+    --block-device output/images/rootfs.ext2 \
+    --network=nat
+
+You can get network access from within the simulated environment
+by requesting an IP address using DHCP (run the command 'udhcpc').
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
new file mode 100644
index 0000000..7a50b1a
--- /dev/null
+++ b/configs/arm_foundationv8_defconfig
@@ -0,0 +1,15 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_BOOT_WRAPPER_AARCH64=y
+BR2_TARGET_BOOT_WRAPPER_AARCH64_DTS="vexpress-foundation-v8"
+BR2_TARGET_BOOT_WRAPPER_AARCH64_BOOTARGS="root=/dev/vda consolelog=9 console=ttyAMA0 rw"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.linaro.org/kernel/linaro-aarch64.git"
+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="7181edd0539e195f78adedbb6c3878f9f1e0c4bb"
+BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
+BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
+BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
