From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 20:37:01 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] binutils/2.27: backport
	patch to enable CRC instructions on supported ARMv8-A CPUs
Message-ID: <20170719204801.1408680337@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94a9d40c158118f498c1bfb38d2acf8a90ed65f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d558ca17138331b1f3a9d780ced07671e0f0a185)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ly-enable-CRC-instructions-on-supported-A.patch | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch b/package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch
new file mode 100644
index 0000000..3b7fcfc
--- /dev/null
+++ b/package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch
@@ -0,0 +1,88 @@
+From 29a4659015ca7044c2d425d32a0b828e0fbb5ac1 Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <Richard.Earnshaw@arm.com>
+Date: Wed, 7 Sep 2016 17:14:54 +0100
+Subject: [PATCH] Automatically enable CRC instructions on supported ARMv8-A
+ CPUs.
+
+2016-09-07  Richard Earnshaw  <rearnsha@arm.com>
+
+	* opcode/arm.h (ARM_ARCH_V8A_CRC): New architecture.
+
+2016-09-07  Richard Earnshaw  <rearnsha@arm.com>
+
+	* config/tc-arm.c ((arm_cpus): Use ARM_ARCH_V8A_CRC for all
+	ARMv8-A CPUs except xgene1.
+
+Upstream: https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=patch;h=27e5a270962fb92c07e7d476966ba380fa3bb68e
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ gas/config/tc-arm.c  | 18 +++++++++---------
+ include/opcode/arm.h |  2 ++
+ 2 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/gas/config/tc-arm.c b/gas/config/tc-arm.c
+index 73d05316..7c86184d 100644
+--- a/gas/config/tc-arm.c
++++ b/gas/config/tc-arm.c
+@@ -25332,17 +25332,17 @@ static const struct arm_cpu_option_table arm_cpus[] =
+ 								  "Cortex-A15"),
+   ARM_CPU_OPT ("cortex-a17",	ARM_ARCH_V7VE,   FPU_ARCH_NEON_VFP_V4,
+ 								  "Cortex-A17"),
+-  ARM_CPU_OPT ("cortex-a32",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("cortex-a32",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 								  "Cortex-A32"),
+-  ARM_CPU_OPT ("cortex-a35",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("cortex-a35",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 								  "Cortex-A35"),
+-  ARM_CPU_OPT ("cortex-a53",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("cortex-a53",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 								  "Cortex-A53"),
+-  ARM_CPU_OPT ("cortex-a57",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("cortex-a57",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 								  "Cortex-A57"),
+-  ARM_CPU_OPT ("cortex-a72",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("cortex-a72",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 								  "Cortex-A72"),
+-  ARM_CPU_OPT ("cortex-a73",    ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("cortex-a73",    ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 								  "Cortex-A73"),
+   ARM_CPU_OPT ("cortex-r4",	ARM_ARCH_V7R,	 FPU_NONE,	  "Cortex-R4"),
+   ARM_CPU_OPT ("cortex-r4f",	ARM_ARCH_V7R,	 FPU_ARCH_VFP_V3D16,
+@@ -25361,10 +25361,10 @@ static const struct arm_cpu_option_table arm_cpus[] =
+   ARM_CPU_OPT ("cortex-m1",	ARM_ARCH_V6SM,	 FPU_NONE,	  "Cortex-M1"),
+   ARM_CPU_OPT ("cortex-m0",	ARM_ARCH_V6SM,	 FPU_NONE,	  "Cortex-M0"),
+   ARM_CPU_OPT ("cortex-m0plus",	ARM_ARCH_V6SM,	 FPU_NONE,	  "Cortex-M0+"),
+-  ARM_CPU_OPT ("exynos-m1",	ARM_ARCH_V8A,	 FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("exynos-m1",	ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 								  "Samsung " \
+ 								  "Exynos M1"),
+-  ARM_CPU_OPT ("qdf24xx",	ARM_ARCH_V8A,	 FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("qdf24xx",	ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 								  "Qualcomm "
+ 								  "QDF24XX"),
+ 
+@@ -25389,7 +25389,7 @@ static const struct arm_cpu_option_table arm_cpus[] =
+   /* APM X-Gene family.  */
+   ARM_CPU_OPT ("xgene1",        ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 	                                                          "APM X-Gene 1"),
+-  ARM_CPU_OPT ("xgene2",        ARM_ARCH_V8A,    FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
++  ARM_CPU_OPT ("xgene2",        ARM_ARCH_V8A_CRC, FPU_ARCH_CRYPTO_NEON_VFP_ARMV8,
+ 	                                                          "APM X-Gene 2"),
+ 
+   { NULL, 0, ARM_ARCH_NONE, ARM_ARCH_NONE, NULL }
+diff --git a/include/opcode/arm.h b/include/opcode/arm.h
+index 60715cf8..feace5cd 100644
+--- a/include/opcode/arm.h
++++ b/include/opcode/arm.h
+@@ -263,6 +263,8 @@
+ #define ARM_ARCH_V7M	ARM_FEATURE_CORE (ARM_AEXT_V7M, ARM_EXT2_V6T2_V8M)
+ #define ARM_ARCH_V7EM	ARM_FEATURE_CORE (ARM_AEXT_V7EM, ARM_EXT2_V6T2_V8M)
+ #define ARM_ARCH_V8A	ARM_FEATURE_CORE (ARM_AEXT_V8A, ARM_AEXT2_V8A)
++#define ARM_ARCH_V8A_CRC ARM_FEATURE (ARM_AEXT_V8A, ARM_AEXT2_V8A, \
++				      CRC_EXT_ARMV8)
+ #define ARM_ARCH_V8_1A	ARM_FEATURE (ARM_AEXT_V8A, ARM_AEXT2_V8_1A,	\
+ 				     CRC_EXT_ARMV8 | FPU_NEON_EXT_RDMA)
+ #define ARM_ARCH_V8_2A	ARM_FEATURE (ARM_AEXT_V8A, ARM_AEXT2_V8_2A,	\
+-- 
+2.11.0
+
