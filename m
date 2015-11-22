From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 20:11:51 +0100
Subject: [Buildroot] [git commit] configs/arm_foundationv8: fix build and
	update documentation
Message-ID: <20151122191432.6317981DAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4bb1d97b1151ff7c3a8d89e98adf4b1ae3c72741
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The arm_foundationv8_defconfig currently doesn't build because it uses
an external AArch64 toolchain that has been updated (Linaro toolchain)
and is now based on gcc 5.x. Unfortunately, Linux 3.13 is too old to
be built with gcc 5.x.

As a minimal fix to make this defconfig build again, we switch to use
the internal toolchain backend. At the time this defconfig was
introduced, there was no support for AArch64 in the internal toolchain
backend, but now that it is available, there is no reason to not use
it. This makes the defconfig also more consistent with the other
defconfigs.

Obviously, the kernel headers used to build the toolchain are set to
the fixed version 3.13, so that they match the kernel being used.

While we're at it, the readme.txt file corresponding to this defconfig
is updated. Runtime testing has been performed with the latest version
of the ARM Foundation model.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/arm/foundation-v8/readme.txt |    4 ++--
 configs/arm_foundationv8_defconfig |    4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/board/arm/foundation-v8/readme.txt b/board/arm/foundation-v8/readme.txt
index f6d0698..5406ed3 100644
--- a/board/arm/foundation-v8/readme.txt
+++ b/board/arm/foundation-v8/readme.txt
@@ -3,14 +3,14 @@ ARM software simulator of the AArch64 architecture.
 
 First, one has to download the AArch64 software simulator from:
 
-  https://silver.arm.com/download/download.tm?pv=1509509
+  https://silver.arm.com/download/download.tm?pv=2482590
 
 Then, use the arm_foundationv8_defconfig configuration to build your
 Buildroot system.
 
 Finally, boot your system with:
 
- ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/Foundation_v8 \
+ ${LOCATION_OF_FOUNDATIONV8_SIMULATOR}/models/Linux64_GCC-4.1/Foundation_Platform \
     --image output/images/linux-system.axf \
     --block-device output/images/rootfs.ext2 \
     --network=nat
diff --git a/configs/arm_foundationv8_defconfig b/configs/arm_foundationv8_defconfig
index dbaf3d6..2deb333 100644
--- a/configs/arm_foundationv8_defconfig
+++ b/configs/arm_foundationv8_defconfig
@@ -1,5 +1,7 @@
 BR2_aarch64=y
-BR2_TOOLCHAIN_EXTERNAL=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.13"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
