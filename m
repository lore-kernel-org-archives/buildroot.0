From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 May 2014 03:39:29 +0200
Subject: [Buildroot] [git commit] arch: add support for "corei7" Intel CPU
	optimisations
Message-ID: <20140503190800.47DBE9CAD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=affb6a38535382526333517e86ee5a31df0064fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gcc support was added in version 4.6:
http://gcc.gnu.org/gcc-4.6/changes.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86         |   12 ++++++++++++
 package/gcc/Config.in.host |    6 +++---
 package/uclibc/Config.in   |    2 +-
 3 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 8f6a527..327aff0 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -83,6 +83,15 @@ config BR2_x86_core2
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
 	select BR2_X86_CPU_HAS_SSSE3
+config BR2_x86_corei7
+	bool "corei7"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
+	select BR2_X86_CPU_HAS_SSE4
+	select BR2_X86_CPU_HAS_SSE42
 config BR2_x86_atom
 	bool "atom"
 	select BR2_X86_CPU_HAS_MMX
@@ -177,6 +186,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_prescott
 	default "i686"		if BR2_x86_nocona && BR2_i386
 	default "i686"		if BR2_x86_core2 && BR2_i386
+	default "i686"		if BR2_x86_corei7 && BR2_i386
 	default "i686"		if BR2_x86_atom && BR2_i386
 	default "i686"		if BR2_x86_opteron && BR2_i386
 	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
@@ -206,6 +216,7 @@ config BR2_GCC_TARGET_TUNE
 	default "prescott"	if BR2_x86_prescott
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
+	default "corei7"	if BR2_x86_corei7
 	default "atom"		if BR2_x86_atom
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
@@ -236,6 +247,7 @@ config BR2_GCC_TARGET_ARCH
 	default "prescott"	if BR2_x86_prescott
 	default "nocona"	if BR2_x86_nocona
 	default "core2"		if BR2_x86_core2
+	default "corei7"	if BR2_x86_corei7
 	default "atom"		if BR2_x86_atom
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 34a817b..6a3b75b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -20,12 +20,12 @@ choice
 		bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
@@ -33,7 +33,7 @@ choice
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a12 && !BR2_cortex_a15 && !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 4b3b975..5021429 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -267,6 +267,6 @@ config BR2_UCLIBC_X86_TYPE
 	default PENTIUMII  if BR2_x86_pentium2
 	default PENTIUMIII if BR2_x86_pentium3
 	default PENTIUM4   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
-			      BR2_x86_nocona || BR2_x86_core2
+			      BR2_x86_nocona || BR2_x86_core2 || BR2_x86_corei7
 
 endif # BR2_TOOLCHAIN_BUILDROOT_UCLIBC
