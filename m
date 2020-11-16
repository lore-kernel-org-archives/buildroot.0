From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2020 16:05:22 +0100
Subject: [Buildroot] [git commit branch/2020.08.x]
 toolchain/toolchain-external/toolchain-external-arm-arm: add dependency on
 NEON
Message-ID: <20201116145230.0CE1B821E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2ffe2b5e7cd8f22822c44ee3e74ebd55f606c28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

While testing Buildroot on a Cortex-A5 that doesn't provide NEON, we
found out that a system generated with the ARM toolchain from Arm
didn't boot. It turns out that this ARM toolchain is built with:

  --with-arch=armv7-a --with-fpu=neon --with-float=hard --with-mode=thumb

So, it uses NEON as its FPU, which means it can only work on CPU cores
that have NEON support. This commit adds the appropriate dependency to
the toolchain-external-arm-arm package, and adjusts the Config.in help
text accordingly.

While at it, it also drops the part of the Config.in help text that
says the code is tuned for Cortex-A9, as it is not the case: it was
the case for the Linaro toolchain (built with --with-tune=cortex-a9),
but not for the ARM toolchain, for which no specific --with-tune is
passed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8477c41244c1d55b6496195c3a69f261b546dc8e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-arm-arm/Config.in | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 4748ab53ae..29509635a3 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -1,12 +1,13 @@
-comment "Arm toolchains available for Cortex-A + EABIhf"
+comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on BR2_arm
-	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
+	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	bool "Arm ARM 2019.12"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
@@ -20,10 +21,10 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Arm toolchain for the ARM architecture. It uses GCC 9.2.1,
-	  GDB 8.3.0, glibc 2.30, Binutils 2.33.1. It generates code that
-	  runs on all Cortex-A profile devices, but tuned for the
-	  Cortex-A9. The code generated uses the hard floating point
-	  calling convention, and uses the VFPv3-D16 FPU instructions.
+	  GDB 8.3.0, glibc 2.30, Binutils 2.33.1. It generates code
+	  that runs on all Cortex-A profile devices. The code
+	  generated uses the hard floating point calling convention,
+	  and uses the NEON FPU instructions.
 
 	  This is the same toolchain that was previously distributed by
 	  Linaro.
