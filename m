From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Aug 2016 23:32:34 +0200
Subject: [Buildroot] [PATCH v2] openblas: fix build issues on ARM
Message-ID: <1470605554-30398-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes several build issues of OpenBLAS on ARM:

 - The first one occured on ARMv5 platforms, when the ARMV5 OpenBLAS
   architecture is used. In this case, OpenBLAS build system forces
   -march=armv5, which may not be correct for certain toolchains. As an
   example, the Sourcery CodeBench toolchain has an ARMv4 and an ARMv5
   sysroot. The ARMv5 sysroot is actually an armv5te sysroot, so when
   OpenBLAS forces -march=armv5, gcc thinks it should use the ARMv4
   sysroot, causing build failures.

   To address this, a patch to completely remove the -march ARM CFLAGS
   is added to OpenBLAS.

   Fixes:

     http://autobuild.buildroot.net/results/991497b12b70f948169e5ad99eebd0fe7f6209a2/

 - The second one occured on ARMv7 platforms, when the ARMV7 OpenBLAS
   architecture is used. The OpenBLAS code expects an EABIhf build, so a
   dependency is added for EABIhf for both ARMv6 and ARMv7.

   Fixes:

     http://autobuild.buildroot.net/results/0ba0bee48a83367fcefab827e8eaa72f0c8fe90b/

 - Once the previous ARMv7 problem has been fixed, it turns out that the
   ARMv7 specific code in OpenBLAS contains VFPv3 specific
   code. Therefore, the user *must* have choosen either VFPv3 or VFPv4,
   or the code will not build. VFPv3-D16/VFPv4-D16 are not sufficient,
   as more than 16 registers are used by the OpenBLAS code.

   To address this, the ARMV7 platform of OpenBLAS is restricted to the
   proper VFPv3/VFPv4 selection, and the ARMV6 platform is restricted to
   the proper VFPv2 selection.

   This problem was not visible in the autobuilders, as it was hidden by
   the previous one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v1:
 - Only remove -march flags, keep the -mfpu and -mfloat-abi flags.
 - Make the ARMV6 and ARMV7 platform selection depend on BR2_ARM_EABIHF,
   since EABIhf is required
 - Make the ARMV6 platform selection depend on VFPv2 usage, since it is
   needed.
 - Also handle the Cortex-A9 and Cortex-A15 cases.
---
 .../0002-Makefile.arm-remove-march-flags.patch     | 73 ++++++++++++++++++++++
 package/openblas/Config.in                         | 19 ++++--
 2 files changed, 88 insertions(+), 4 deletions(-)
 create mode 100644 package/openblas/0002-Makefile.arm-remove-march-flags.patch

diff --git a/package/openblas/0002-Makefile.arm-remove-march-flags.patch b/package/openblas/0002-Makefile.arm-remove-march-flags.patch
new file mode 100644
index 0000000..39058f7
--- /dev/null
+++ b/package/openblas/0002-Makefile.arm-remove-march-flags.patch
@@ -0,0 +1,73 @@
+From 71b9e9b7f080c464777d07bd1a917a1c449d2ef8 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 7 Aug 2016 23:20:00 +0200
+Subject: [PATCH] Makefile.arm: remove -march flags
+
+The provided -march flags, especially for ARMv5 and ARMv6 may not
+necessarily match the needed ones: for ARMv5, it might be armv5,
+armv5te, armv5t, etc. If the wrong one is used, the incorrect toolchain
+sysroot can be used in a multilib toolchain.
+
+Therefore, let the user building OpenBLAS pass the appropriate -march
+flag.
+
+The other flags, such as -mfpu=vfp or -mfloat-abi=hard are kept, as they
+are actually required for the build to proceed (OpenBLAS uses VFP
+instructions, and assume an EABIhf ABI).
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.arm | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/Makefile.arm b/Makefile.arm
+index 62bf275..c0d6ab8 100644
+--- a/Makefile.arm
++++ b/Makefile.arm
+@@ -1,31 +1,31 @@
+ # ifeq logical or
+ ifeq ($(CORE), $(filter $(CORE),CORTEXA9 CORTEXA15))
+ ifeq ($(OSNAME), Android)
+-CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a
+-FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a
++CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard
++FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard
+ else
+-CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
+-FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
++CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard
++FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard
+ endif
+ endif
+ 
+ ifeq ($(CORE), ARMV7)
+ ifeq ($(OSNAME), Android)
+-CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a -Wl,--no-warn-mismatch
+-FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -march=armv7-a -Wl,--no-warn-mismatch
++CCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -Wl,--no-warn-mismatch
++FCOMMON_OPT += -marm -mfpu=neon  -mfloat-abi=hard -Wl,--no-warn-mismatch
+ else
+-CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
+-FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard -march=armv7-a
++CCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard
++FCOMMON_OPT += -marm -mfpu=vfpv3  -mfloat-abi=hard
+ endif
+ endif
+ 
+ ifeq ($(CORE), ARMV6)
+-CCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard  -march=armv6
+-FCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard  -march=armv6
++CCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard
++FCOMMON_OPT += -marm -mfpu=vfp -mfloat-abi=hard
+ endif
+ 
+ 
+ ifeq ($(CORE), ARMV5)
+-CCOMMON_OPT += -marm -march=armv5
+-FCOMMON_OPT += -marm -march=armv5
++CCOMMON_OPT += -marm
++FCOMMON_OPT += -marm
+ endif
+-- 
+2.7.4
+
diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 51afaec..785a56e 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -30,11 +30,22 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "SICORTEX"     if BR2_mips_64
 	default "I6400"        if BR2_mips_64r6
 	default "SPARC"        if BR2_sparc
-	default "CORTEXA15"    if BR2_cortex_a15
-	default "CORTEXA9"     if BR2_cortex_a9
+	# Cortex-A15 always have a VFPv4
+	default "CORTEXA15"    if (BR2_cortex_a15 && BR2_ARM_EABIHF)
+	# Cortex-A9 have an optional VFPv3, so we need to make sure it
+	# is available
+	default "CORTEXA9"     if (BR2_cortex_a9 && BR2_ARM_EABIHF && \
+				   BR2_ARM_CPU_HAS_VFPV3)
 	default "ARMV5"        if BR2_ARM_CPU_ARMV5
-	default "ARMV6"        if BR2_ARM_CPU_ARMV6
-	default "ARMV7"        if BR2_ARM_CPU_ARMV7A
+	# On ARMv6, OpenBLAS assumes that a VFP is available, and
+	# EABIhf is used
+	default "ARMV6"        if (BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF && \
+				   BR2_ARM_CPU_HAS_VFPV2)
+	# On ARMv7, OpenBLAS assumes that a full VFPv3+ is available
+	# (and not the more limited D16 variant), and that EABIhf is
+	# used.
+	default "ARMV7"        if (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF && \
+				   BR2_ARM_CPU_HAS_VFPV3)
 	default "ARMV8"        if BR2_aarch64 || BR2_aarch64_be
 	help
 	  OpenBLAS target CPU. See TargetList.txt in the source tree for
-- 
2.7.4
