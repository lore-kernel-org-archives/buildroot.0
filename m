From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sun, 21 Feb 2016 10:12:10 -0300
Subject: [Buildroot] [PATCH 1/2] arch/arm: add the cortex A17 variant
	supported by gcc 5.x
Message-ID: <1456060331-2239-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the Cortex A17 variant. This core is considered a replacement
of the Cortex A12 and is supported by gcc 5.

Suggested-by: Ross Green <greenfross@netscape.net>
Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 arch/Config.in.arm              | 9 +++++++++
 package/binutils/Config.in.host | 4 ++++
 package/gcc/Config.in.host      | 9 ++++++---
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2b34f42850cf..04f0369c0b97 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -159,6 +159,14 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
+config BR2_cortex_a17
+	bool "cortex-A17"
+	select BR2_ARM_CPU_HAS_ARM
+	select BR2_ARM_CPU_HAS_NEON
+	select BR2_ARM_CPU_HAS_VFPV4
+	select BR2_ARM_CPU_HAS_THUMB2
+	select BR2_ARM_CPU_ARMV7A
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_m3
 	bool "cortex-M3"
 	select BR2_ARM_CPU_HAS_THUMB
@@ -442,6 +450,7 @@ config BR2_GCC_TARGET_CPU
 	default "cortex-a9"	if BR2_cortex_a9
 	default "cortex-a12"	if BR2_cortex_a12
 	default "cortex-a15"	if BR2_cortex_a15
+	default "cortex-a17"	if BR2_cortex_a17
 	default "cortex-m3"	if BR2_cortex_m3
 	default "fa526"		if BR2_fa526
 	default "marvell-pj4"	if BR2_pj4
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index df3c385de5ad..07574e42ca8a 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,6 +12,8 @@ choice
 			   !BR2_powerpc64le && !BR2_nios2
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		# Unsupported ARM cores
+		depends on !BR2_cortex_a17
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24_X
@@ -19,6 +21,8 @@ choice
 		depends on !BR2_nios2 && !BR2_powerpc64le
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
+		# Unsupported ARM cores
+		depends on !BR2_cortex_a17
 		bool "binutils 2.24"
 
 	config BR2_BINUTILS_VERSION_2_25_X
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index cad6896b44cc..560ea5210418 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -21,7 +21,8 @@ choice
 			&& !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
-			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
+			!BR2_cortex_a15 && !BR2_cortex_a17 && \
+			!BR2_fa526 && !BR2_pj4
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_e5500 && !BR2_powerpc_e6500 && \
 			!BR2_powerpc_power8
@@ -44,7 +45,7 @@ choice
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
 			&& !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a12 && !BR2_pj4
+		depends on !BR2_cortex_a12 && !BR2_pj4 && !BR2_cortex_a17
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_e5500 && !BR2_powerpc_e6500 && \
 			!BR2_powerpc_power8
@@ -63,7 +64,7 @@ choice
 		depends on !BR2_microblaze && !BR2_arc \
 			&& !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a12
+		depends on !BR2_cortex_a12 && !BR2_cortex_a17
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_power8
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
@@ -86,6 +87,8 @@ choice
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
 		depends on !BR2_arc
+		# Broken or unsupported ARM cores
+		depends on !BR2_cortex_a17
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
-- 
2.7.0
