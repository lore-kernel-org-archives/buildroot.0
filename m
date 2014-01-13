From: Adrien =?utf-8?Q?B=C3=A9raud?= <adrien.beraud@savoirfairelinux.com>
Date: Mon, 13 Jan 2014 12:07:00 -0500 (EST)
Subject: [Buildroot] [PATCH] arch: add support for "jaguar" AMD CPU
 optimisations.
In-Reply-To: <1818192605.238804.1389631057174.JavaMail.root@mail>
Message-ID: <1755668586.279162.1389632820523.JavaMail.root@mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new version forces the use of GCC 4.8:

Signed-off-by: Adrien Beraud <adrien.beraud@savoirfairelinux.com>
---
 arch/Config.in.x86         | 10 ++++++++++
 package/gcc/Config.in.host | 10 +++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce30605..1884251 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -120,6 +120,13 @@ config BR2_x86_barcelona
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
@@ -168,6 +175,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_opteron && BR2_i386
 	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
 	default "i686"		if BR2_x86_barcelona && BR2_i386
+	default "i686"		if BR2_x86_jaguar && BR2_i386
 	default "i686"		if BR2_x86_k6
 	default "i686"		if BR2_x86_k6_2
 	default "i686"		if BR2_x86_athlon
@@ -196,6 +204,7 @@ config BR2_GCC_TARGET_TUNE
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver2"	if BR2_x86_jaguar
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
@@ -225,6 +234,7 @@ config BR2_GCC_TARGET_ARCH
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver2"	if BR2_x86_jaguar
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 41c1213..db14564 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -18,12 +18,12 @@ choice
 		bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_x86_jaguar && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		bool "gcc 4.4.x"
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
@@ -31,19 +31,19 @@ choice
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
+		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_x86_jaguar && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
-- 
1.8.5.2



----- Mail original -----
De: "Adrien B?raud" <adrien.beraud@savoirfairelinux.com>
?: buildroot at busybox.net
Envoy?: Lundi 13 Janvier 2014 11:37:37
Objet: [Buildroot] [PATCH] arch: add support for "jaguar" AMD CPU optimisations.

AMD Jaguar ( https://en.wikipedia.org/wiki/Jaguar_%28microarchitecture%29 ) is suddenly 
a popular architecture since it is used in the PS4 and the XBox One.
Many embedded systems are also likely to use it in the next years.

This patch adds support for GCC architecture-specific optimizations and tuning for these CPUs.

Signed-off-by: Adrien Beraud <adrien.beraud@savoirfairelinux.com>
---
 arch/Config.in.x86 | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index ce30605..1884251 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -120,6 +120,13 @@ config BR2_x86_barcelona
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
@@ -168,6 +175,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_opteron && BR2_i386
 	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
 	default "i686"		if BR2_x86_barcelona && BR2_i386
+	default "i686"		if BR2_x86_jaguar && BR2_i386
 	default "i686"		if BR2_x86_k6
 	default "i686"		if BR2_x86_k6_2
 	default "i686"		if BR2_x86_athlon
@@ -196,6 +204,7 @@ config BR2_GCC_TARGET_TUNE
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver2"	if BR2_x86_jaguar
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
@@ -225,6 +234,7 @@ config BR2_GCC_TARGET_ARCH
 	default "k8"		if BR2_x86_opteron
 	default "k8-sse3"	if BR2_x86_opteron_sse3
 	default "barcelona"	if BR2_x86_barcelona
+	default "btver2"	if BR2_x86_jaguar
 	default "k6"		if BR2_x86_k6
 	default "k6-2"		if BR2_x86_k6_2
 	default "athlon"	if BR2_x86_athlon
-- 
1.8.5.2

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
