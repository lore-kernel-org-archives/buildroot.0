From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 00:00:29 +0200
Subject: [Buildroot] [git commit branch/next] Simplify x86 target
	architecture variant handling
Message-ID: <20120802195303.74DCF827F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ff012b3c70ea41cc6f241426320d1b168985f79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Instead of having two separate list of choices for select the target
architecture variant for i386 and x86_64, with many CPU choices
duplicated (because all modern x86 CPUs can be both used as i386 or
x86_64), merge them into a single list. In the x86_64 case, all the
x86 CPUs that do not support the 64 bits instruction set are hidden.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch   |  113 ++++++++++++++--------------------------------
 toolchain/gcc/Config.in |    4 +-
 2 files changed, 37 insertions(+), 80 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 75c5499..342066e 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -337,44 +337,60 @@ config BR2_X86_CPU_HAS_SSSE3
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_i386
-	default BR2_x86_i586
+	depends on BR2_i386 || BR2_x86_64
+	default BR2_x86_i586 if BR2_i386
+	default BR2_x86_generic if BR2_x86_64
 	help
 	  Specific CPU variant to use
 
+config BR2_x86_generic
+	bool "generic"
 config BR2_x86_i386
 	bool "i386"
+	depends on !BR2_x86_64
 config BR2_x86_i486
 	bool "i486"
+	depends on !BR2_x86_64
 config BR2_x86_i586
 	bool "i586"
+	depends on !BR2_x86_64
 config BR2_x86_i686
 	bool "i686"
+	depends on !BR2_x86_64
 config BR2_x86_pentiumpro
 	bool "pentium pro"
+	depends on !BR2_x86_64
 config BR2_x86_pentium_mmx
 	bool "pentium MMX"
 	select BR2_X86_CPU_HAS_MMX
+	depends on !BR2_x86_64
 config BR2_x86_pentium_m
 	bool "pentium mobile"
+	select BR2_X86_CPU_HAS_MMX
+	select BR2_X86_CPU_HAS_SSE
+	depends on !BR2_x86_64
 config BR2_x86_pentium2
 	bool "pentium2"
 	select BR2_X86_CPU_HAS_MMX
+	depends on !BR2_x86_64
 config BR2_x86_pentium3
 	bool "pentium3"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	depends on !BR2_x86_64
 config BR2_x86_pentium4
 	bool "pentium4"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
+	depends on !BR2_x86_64
 config BR2_x86_prescott
 	bool "prescott"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
 	select BR2_X86_CPU_HAS_SSE2
 	select BR2_X86_CPU_HAS_SSE3
+	depends on !BR2_x86_64
 config BR2_x86_nocona
 	bool "nocona"
 	select BR2_X86_CPU_HAS_MMX
@@ -398,16 +414,20 @@ config BR2_x86_atom
 config BR2_x86_k6
 	bool "k6"
 	select BR2_X86_CPU_HAS_MMX
+	depends on !BR2_x86_64
 config BR2_x86_k6_2
 	bool "k6-2"
 	select BR2_X86_CPU_HAS_MMX
+	depends on !BR2_x86_64
 config BR2_x86_athlon
 	bool "athlon"
 	select BR2_X86_CPU_HAS_MMX
+	depends on !BR2_x86_64
 config BR2_x86_athlon_4
 	bool "athlon-4"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	depends on !BR2_x86_64
 config BR2_x86_opteron
 	bool "opteron"
 	select BR2_X86_CPU_HAS_MMX
@@ -430,68 +450,24 @@ config BR2_x86_geode
 	# Don't include MMX support because there several variant of geode
 	# processor, some with MMX support, some without.
 	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
+	depends on !BR2_x86_64
 config BR2_x86_c3
 	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
 	select BR2_X86_CPU_HAS_MMX
+	depends on !BR2_x86_64
 config BR2_x86_c32
 	bool "Via C3-2 (Nehemiah cores)"
 	select BR2_X86_CPU_HAS_MMX
 	select BR2_X86_CPU_HAS_SSE
+	depends on !BR2_x86_64
 config BR2_x86_winchip_c6
 	bool "IDT Winchip C6"
 	select BR2_X86_CPU_HAS_MMX
+	depends on !BR2_x86_64
 config BR2_x86_winchip2
 	bool "IDT Winchip 2"
 	select BR2_X86_CPU_HAS_MMX
-endchoice
-
-choice
-	prompt "Target Architecture Variant"
-	depends on BR2_x86_64
-	default BR2_x86_64_generic
-	help
-	  Specific CPU variant to use
-
-config BR2_x86_64_generic
-	bool "generic"
-config BR2_x86_64_barcelona
-	bool "barcelona"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_3DNOW
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-config BR2_x86_64_opteron_sse3
-	bool "opteron w/ sse3"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-config BR2_x86_64_opteron
-	bool "opteron"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-config BR2_x86_64_nocona
-	bool "nocona"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-config BR2_x86_64_core2
-	bool "core2"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-	select BR2_X86_CPU_HAS_SSSE3
-config BR2_x86_64_atom
-	bool "atom"
-	select BR2_X86_CPU_HAS_MMX
-	select BR2_X86_CPU_HAS_SSE
-	select BR2_X86_CPU_HAS_SSE2
-	select BR2_X86_CPU_HAS_SSE3
-	select BR2_X86_CPU_HAS_SSSE3
+	depends on !BR2_x86_64
 endchoice
 
 choice
@@ -676,16 +652,17 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_pentium_m
 	default "i686"		if BR2_x86_pentiumpro
 	default "i686"		if BR2_x86_prescott
-	default "i686"		if BR2_x86_nocona
-	default "i686"		if BR2_x86_core2
-	default "i686"		if BR2_x86_atom
-	default "i686"		if BR2_x86_opteron
-	default "i686"		if BR2_x86_opteron_sse3
-	default "i686"		if BR2_x86_barcelona
+	default "i686"		if BR2_x86_nocona && BR2_i386
+	default "i686"		if BR2_x86_core2 && BR2_i386
+	default "i686"		if BR2_x86_atom && BR2_i386
+	default "i686"		if BR2_x86_opteron && BR2_i386
+	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
+	default "i686"		if BR2_x86_barcelona && BR2_i386
 	default "i686"		if BR2_x86_k6
 	default "i686"		if BR2_x86_k6_2
 	default "i686"		if BR2_x86_athlon
 	default "i686"		if BR2_x86_athlon_4
+	default "x86_64"	if BR2_x86_64
 	default "m68k"		if BR2_m68k
 	default "microblaze"	if BR2_microblaze
 	default "mips"		if BR2_mips
@@ -701,14 +678,6 @@ config BR2_ARCH
 	default "sh4aeb"	if BR2_sh4aeb
 	default "sh64"		if BR2_sh64
 	default "sparc"		if BR2_sparc
-	default "x86_64"	if BR2_x86_64
-	default "x86_64"	if BR2_x86_64_generic
-	default "x86_64"	if BR2_x86_64_nocona
-	default "x86_64"	if BR2_x86_64_core2
-	default "x86_64"	if BR2_x86_64_atom
-	default "x86_64"	if BR2_x86_64_opteron
-	default "x86_64"	if BR2_x86_64_opteron_sse3
-	default "x86_64"	if BR2_x86_64_barcelona
 	default "xtensa"	if BR2_xtensa
 
 
@@ -750,13 +719,7 @@ config BR2_GCC_TARGET_TUNE
 	default c3		if BR2_x86_c3
 	default c3-2		if BR2_x86_c32
 	default geode		if BR2_x86_geode
-	default generic		if BR2_x86_64_generic
-	default nocona		if BR2_x86_64_nocona
-	default core2		if BR2_x86_64_core2
-	default atom		if BR2_x86_64_atom
-	default k8		if BR2_x86_64_opteron
-	default k8-sse3		if BR2_x86_64_opteron_sse3
-	default barcelona	if BR2_x86_64_barcelona
+	default generic		if BR2_x86_generic
 	default arm600		if BR2_arm600
 	default arm610		if BR2_arm610
 	default arm620		if BR2_arm620
@@ -864,12 +827,6 @@ config BR2_GCC_TARGET_ARCH
 	default athlon-4	if BR2_x86_athlon_4
 	default winchip-c6	if BR2_x86_winchip_c6
 	default winchip2	if BR2_x86_winchip2
-	default nocona		if BR2_x86_64_nocona
-	default core2		if BR2_x86_64_core2
-	default atom		if BR2_x86_64_atom
-	default k8		if BR2_x86_64_opteron
-	default k8-sse3		if BR2_x86_64_opteron_sse3
-	default barcelona	if BR2_x86_64_barcelona
 	default c3		if BR2_x86_c3
 	default c3-2		if BR2_x86_c32
 	default geode		if BR2_x86_geode
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index fa526bb..d08efbc 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -15,11 +15,11 @@ choice
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_x86_atom && !BR2_x86_64_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc
+		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_avr32 && !BR2_x86_atom && !BR2_x86_64_atom
+		depends on !BR2_avr32 && !BR2_x86_atom
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
