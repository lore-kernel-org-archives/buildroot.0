From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jan 2014 23:19:46 +0100
Subject: [Buildroot] [git commit] arch: add support for "jaguar" AMD CPU
	optimisations
Message-ID: <20140115222249.EE7499C4D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a20cb386590ac2b6dbb1dac3fdd21eb9462c05a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AMD Jaguar ( https://en.wikipedia.org/wiki/Jaguar_%28microarchitecture%29 ) is
suddenly a popular architecture since it is used in the PS4 and the XBox One.
Many embedded systems are also likely to use it in the next years.

This patch adds support for GCC architecture-specific optimisations and
tuning for these CPUs.
These optimizations are available with GCC 4.8+.

Signed-off-by: Adrien Beraud <adrien.beraud@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86                     |   10 ++++++++++
 package/gcc/Config.in.host             |   10 +++++-----
 toolchain/toolchain-external/Config.in |    3 +++
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 15d5c16..bbedfb4 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -124,6 +124,13 @@ config BR2_x86_barcelona
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+config BR2_x86_jaguar
+	bool "jaguar"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	select BR2_X86_CPU_HAS_SSE2
+	select BR2_X86_CPU_HAS_SSE3
+	select BR2_X86_CPU_HAS_SSSE3
 config BR2_x86_geode
 	bool "geode"
 	# Don't include MMX support because there several variant of geode
@@ -172,6 +179,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_opteron && BR2_i386
 	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
 	default "i686"		if BR2_x86_barcelona && BR2_i386
+	default "i686"		if BR2_x86_jaguar && BR2_i386
 	default "i686"		if BR2_x86_k6
 	default "i686"		if BR2_x86_k6_2
 	default "i686"		if BR2_x86_athlon
@@ -200,6 +208,7 @@ config BR2_GCC_TARGET_TUNE
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver2"	if BR2_x86_jaguar
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
@@ -229,6 +238,7 @@ config BR2_GCC_TARGET_ARCH
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver2"	if BR2_x86_jaguar
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 87543d9..7bd1eb3 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -19,12 +19,12 @@ choice
 		bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
@@ -32,19 +32,19 @@ choice
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e3d4bb9..f02f89b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -596,6 +596,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_x86_jaguar
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -621,6 +622,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_x86_jaguar
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
@@ -645,6 +647,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_x86_jaguar
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
