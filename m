From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:00:37 +0100
Subject: [Buildroot] [git commit] arch/arm: re-order cores choice
Message-ID: <20171201205336.E1FFE7FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52d500aa35acb8b3570dcfcc36ac71e083656e5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the logic for ordering the ARM cores in the choice is all
but obvious. ;-)

Reorder the choice by architecture generation, starting with armv4,
ending with armv8.

Add a comment before each generation, just for ease of use. Add a
separate comment for armv7a and armv7m.

Finally, order cores alphabetically inside the same generation (except
for armv7m cores, listed after all armv7a cores).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 116 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 69 insertions(+), 47 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b58be6b..66dce3a 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -68,6 +68,8 @@ choice
 	help
 	  Specific CPU variant to use
 
+comment "armv4 cores"
+	depends on !BR2_ARCH_IS_64
 config BR2_arm920t
 	bool "arm920t"
 	select BR2_ARM_CPU_HAS_ARM
@@ -82,6 +84,21 @@ config BR2_arm922t
 	select BR2_ARM_CPU_ARMV4
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	depends on !BR2_ARCH_IS_64
+config BR2_fa526
+	bool "fa526/626"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_ARMV4
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
+config BR2_strongarm
+	bool "strongarm sa110/sa1100"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_ARMV4
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
+
+comment "armv5 cores"
+	depends on !BR2_ARCH_IS_64
 config BR2_arm926t
 	bool "arm926t"
 	select BR2_ARM_CPU_HAS_ARM
@@ -90,6 +107,22 @@ config BR2_arm926t
 	select BR2_ARM_CPU_ARMV5
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	depends on !BR2_ARCH_IS_64
+config BR2_iwmmxt
+	bool "iwmmxt"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_ARMV5
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
+config BR2_xscale
+	bool "xscale"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_THUMB
+	select BR2_ARM_CPU_ARMV5
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
+
+comment "armv6 cores"
+	depends on !BR2_ARCH_IS_64
 config BR2_arm1136j_s
 	bool "arm1136j-s"
 	select BR2_ARM_CPU_HAS_ARM
@@ -128,6 +161,9 @@ config BR2_arm11mpcore
 	select BR2_ARM_CPU_ARMV6
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	depends on !BR2_ARCH_IS_64
+
+comment "armv7a cores"
+	depends on !BR2_ARCH_IS_64
 config BR2_cortex_a5
 	bool "cortex-A5"
 	select BR2_ARM_CPU_HAS_ARM
@@ -212,6 +248,28 @@ config BR2_cortex_a17_a7
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	depends on !BR2_ARCH_IS_64
+config BR2_pj4
+	bool "pj4"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_VFPV3
+	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
+	depends on !BR2_ARCH_IS_64
+
+comment "armv7m cores"
+	depends on !BR2_ARCH_IS_64
+config BR2_cortex_m3
+	bool "cortex-M3"
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7M
+	depends on !BR2_ARCH_IS_64
+config BR2_cortex_m4
+	bool "cortex-M4"
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7M
+	depends on !BR2_ARCH_IS_64
+
+comment "armv8 cores"
 config BR2_cortex_a53
 	bool "cortex-A53"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -255,48 +313,6 @@ config BR2_cortex_a72_a53
 	select BR2_ARM_CPU_ARMV8
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
-config BR2_cortex_m3
-	bool "cortex-M3"
-	select BR2_ARM_CPU_HAS_THUMB2
-	select BR2_ARM_CPU_ARMV7M
-	depends on !BR2_ARCH_IS_64
-config BR2_cortex_m4
-	bool "cortex-M4"
-	select BR2_ARM_CPU_HAS_THUMB2
-	select BR2_ARM_CPU_ARMV7M
-	depends on !BR2_ARCH_IS_64
-config BR2_fa526
-	bool "fa526/626"
-	select BR2_ARM_CPU_HAS_ARM
-	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
-config BR2_pj4
-	bool "pj4"
-	select BR2_ARM_CPU_HAS_ARM
-	select BR2_ARM_CPU_HAS_VFPV3
-	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
-config BR2_strongarm
-	bool "strongarm sa110/sa1100"
-	select BR2_ARM_CPU_HAS_ARM
-	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
-config BR2_xscale
-	bool "xscale"
-	select BR2_ARM_CPU_HAS_ARM
-	select BR2_ARM_CPU_HAS_THUMB
-	select BR2_ARM_CPU_ARMV5
-	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
-config BR2_iwmmxt
-	bool "iwmmxt"
-	select BR2_ARM_CPU_HAS_ARM
-	select BR2_ARM_CPU_ARMV5
-	select BR2_ARCH_HAS_MMU_OPTIONAL
-	depends on !BR2_ARCH_IS_64
 endchoice
 
 config BR2_ARM_ENABLE_NEON
@@ -551,15 +567,23 @@ config BR2_ENDIAN
 	default "BIG"	 if (BR2_armeb || BR2_aarch64_be)
 
 config BR2_GCC_TARGET_CPU
+	# armv4
 	default "arm920t"	if BR2_arm920t
 	default "arm922t"	if BR2_arm922t
+	default "fa526"		if BR2_fa526
+	default "strongarm"	if BR2_strongarm
+	# armv5
 	default "arm926ej-s"	if BR2_arm926t
+	default "iwmmxt"	if BR2_iwmmxt
+	default "xscale"	if BR2_xscale
+	# armv6
 	default "arm1136j-s"	if BR2_arm1136j_s
 	default "arm1136jf-s"	if BR2_arm1136jf_s
 	default "arm1176jz-s"	if BR2_arm1176jz_s
 	default "arm1176jzf-s"	if BR2_arm1176jzf_s
 	default "mpcore"	if BR2_arm11mpcore && BR2_ARM_CPU_HAS_VFPV2
 	default "mpcorenovfp"	if BR2_arm11mpcore
+	# armv7a
 	default "cortex-a5"	if BR2_cortex_a5
 	default "cortex-a7"	if BR2_cortex_a7
 	default "cortex-a8"	if BR2_cortex_a8
@@ -569,13 +593,11 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a15.cortex-a7"	if BR2_cortex_a15_a7
 	default "cortex-a17"	if BR2_cortex_a17
 	default "cortex-a17.cortex-a7"	if BR2_cortex_a17_a7
+	default "marvell-pj4"	if BR2_pj4
+	# armv7m
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
-	default "fa526"		if BR2_fa526
-	default "marvell-pj4"	if BR2_pj4
-	default "strongarm"	if BR2_strongarm
-	default "xscale"	if BR2_xscale
-	default "iwmmxt"	if BR2_iwmmxt
+	# armv8
 	default "cortex-a53"	if BR2_cortex_a53
 	default "cortex-a57"	if BR2_cortex_a57
 	default "cortex-a57.cortex-a53"	if BR2_cortex_a57_a53
