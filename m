From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  1 Sep 2010 11:47:07 +0200
Subject: [Buildroot] [PATCH 1/2] Remove architectures marked as deprecated
In-Reply-To: <cover.1283334416.git.thomas.petazzoni@free-electrons.com>
References: <cover.1283334416.git.thomas.petazzoni@free-electrons.com>
Message-ID: <343f480fe2647febe7fc713722d1131242ba20e3.1283334416.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Alpha, CRIS, IA64 and Sparc64 architectures have been marked as
deprecated during the previous release cycle. They are not widely used
in embedded systems and/or no longer supported by their manufacturers
and/or not properly supported in Buildroot.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |  130 +++---------------------------------------------
 1 files changed, 9 insertions(+), 121 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index ce64068..6ef4a9a 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -7,12 +7,6 @@ choice
 	help
 	  Select the target architecture family to build for.
 
-config BR2_alpha
-	bool "alpha"
-	# Alpha does not exist anymore and has never been used in
-	# embedded systems, so we'll remove support for it.
-	depends on BR2_DEPRECATED
-	depends on BROKEN # no threads, shared libs, gcc psignal compile errors
 config BR2_arm
 	bool "arm"
 config BR2_armeb
@@ -20,19 +14,6 @@ config BR2_armeb
 config BR2_avr32
 	bool "avr32"
 	select BR2_SOFT_FLOAT
-config BR2_cris
-	bool "cris"
-	# The CRIS architecture from Axis has been deprecated by the
-	# manufacturer. No units are sold after July 2010, and support
-	# will end in July 2011. Moreover, CRIS support in Buildroot
-	# has not been updated since a long time.
-	depends on BR2_DEPRECATED
-config BR2_ia64
-	bool "ia64"
-	# IA64 almost does not exist anymore and has never been used
-	# in embedded systems, so we'll remove support for it.
-	depends on BR2_DEPRECATED
-	depends on BROKEN # uclibc linker errors
 config BR2_i386
 	bool "i386"
 config BR2_m68k
@@ -50,14 +31,6 @@ config BR2_sh64
 	bool "superh64"
 config BR2_sparc
 	bool "sparc"
-config BR2_sparc64
-	# Sparc64 isn't really used in embedded systems, and in the
-	# cases where it is used, Linux doesn't seem to be common, and
-	# as of today we don't have a maintainer in Buildroot who
-	# wants to take care of the sparc support.
-	depends on BR2_DEPRECATED
-	bool "sparc64"
-	select BR2_ARCH_IS_64
 config BR2_x86_64
 	bool "x86_64"
 	select BR2_ARCH_IS_64
@@ -317,27 +290,6 @@ endchoice
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_alpha
-	default BR2_alpha_21064
-	help
-	  Specific CPU variant to use
-
-config BR2_alpha_21064
-	bool "21064"
-config BR2_alpha_21164
-	bool "21164"
-config BR2_alpha_21164a
-	bool "21164a"
-config BR2_alpha_21164pc
-	bool "21164pc"
-config BR2_alpha_21264
-	bool "21264"
-config BR2_alpha_21264a
-	bool "21264a"
-endchoice
-
-choice
-	prompt "Target Architecture Variant"
 	depends on BR2_sparc
 	default BR2_sparc_v7
 	help
@@ -381,48 +333,6 @@ endchoice
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_sparc64
-	default BR2_sparc64_v9
-	help
-	  Specific CPU variant to use
-
-config BR2_sparc64_v9
-	bool "v9"
-config BR2_sparc64_v9a
-	bool "v9a"
-config BR2_sparc64_v9b
-	bool "v9b"
-config BR2_sparc64_ultrasparc
-	bool "ultrasparc"
-config BR2_sparc64_ultrasparc3
-	bool "ultrasparc3"
-config BR2_sparc64_niagara
-	bool "niagara"
-endchoice
-
-config BR2_SPARC_TYPE
-	string
-	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701
-	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc
-	default V9	if BR2_sparc_v9 || BR2_sparc_ultrasparc || BR2_sparc_ultrasparc3 || BR2_sparc_niagara || BR2_sparc64_v9 || BR2_sparc64_ultrasparc || BR2_sparc64_ultrasparc3 || BR2_sparc64_niagara
-	default V9	if BR2_sparc_v9a || BR2_sparc64_v9a
-	default V9B	if BR2_sparc_v9b || BR2_sparc64_v9b
-
-choice
-	prompt "Target Architecture Variant"
-	depends on BR2_ia64
-	default BR2_ia64_itanium2
-	help
-	  Specific CPU variant to use
-
-config BR2_ia64_itanium1
-	bool "itanium 1"
-config BR2_ia64_itanium2
-	bool "itanium 2"
-endchoice
-
-choice
-	prompt "Target Architecture Variant"
 	depends on BR2_xtensa
 	default BR2_xtensa_dc232b
 	help
@@ -524,11 +434,9 @@ endchoice
 
 config BR2_ARCH
 	string
-	default "alpha"		if BR2_alpha
 	default "arm"		if BR2_arm
 	default "armeb"		if BR2_armeb
 	default "avr32"		if BR2_avr32
-	default "cris"		if BR2_cris
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
@@ -542,7 +450,6 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_pentiumpro
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
-	default "ia64"		if BR2_ia64
 	default "m68k"		if BR2_m68k
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
@@ -555,7 +462,6 @@ config BR2_ARCH
 	default "sh4eb"		if BR2_sh4eb
 	default "sh64"		if BR2_sh64
 	default "sparc"		if BR2_sparc
-	default "sparc64"	if BR2_sparc64
 	default "x86_64"	if BR2_x86_64
 	default "x86_64"	if BR2_x86_64_generic
 	default "x86_64"	if BR2_x86_64_nocona
@@ -568,11 +474,11 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	string
-	default "LITTLE" if BR2_arm || BR2_cris || BR2_i386 || BR2_mipsel || \
+	default "LITTLE" if BR2_arm || BR2_i386 || BR2_mipsel || \
 			    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_sh64
-	default "BIG"    if BR2_alpha || BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
+	default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
 			    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
-			    BR2_sh3eb || BR2_sh4eb || BR2_sparc || BR2_sparc64
+			    BR2_sh3eb || BR2_sh4eb || BR2_sparc
 
 config BR2_GCC_TARGET_TUNE
 	string
@@ -625,19 +531,6 @@ config BR2_GCC_TARGET_TUNE
 	default strongarm1100	if BR2_sa1100
 	default xscale		if BR2_xscale
 	default iwmmxt		if BR2_iwmmxt
-	default v0		if BR2_cris_unknown
-	default v10		if BR2_cris_generic
-	default v3		if BR2_cris_etrax_4
-	default v8		if BR2_cris_etrax_100
-	default v10		if BR2_cris_etrax_100lx
-	default ev4		if BR2_alpha_21064
-	default ev5		if BR2_alpha_21164
-	default ev56		if BR2_alpha_21164a
-	default pca56		if BR2_alpha_21164pc
-	default ev6		if BR2_alpha_21264
-	default ev67		if BR2_alpha_21264a
-#	default itanium		if BR2_ia64_itanium1
-#	default itanium2	if BR2_ia64_itanium2
 	default 68000		if BR2_m68k_68000
 	default 68010		if BR2_m68k_68010
 	default 68020		if BR2_m68k_68020
@@ -692,12 +585,12 @@ config BR2_GCC_TARGET_TUNE
 	default sparclite86x	if BR2_sparc_sparclite86x
 	default sparclet	if BR2_sparc_sparclet
 	default tsc701		if BR2_sparc_tsc701
-	default v9		if BR2_sparc_v9 || BR2_sparc64_v9
-	default v9		if BR2_sparc_v9a || BR2_sparc64_v9a
-	default v9		if BR2_sparc_v9b || BR2_sparc64_v9b
-	default ultrasparc	if BR2_sparc_ultrasparc || BR2_sparc64_ultrasparc
-	default ultrasparc3	if BR2_sparc_ultrasparc3 || BR2_sparc64_ultrasparc3
-	default niagara		if BR2_sparc_niagara || BR2_sparc64_niagara
+	default v9		if BR2_sparc_v9
+	default v9		if BR2_sparc_v9a
+	default v9		if BR2_sparc_v9b
+	default ultrasparc	if BR2_sparc_ultrasparc
+	default ultrasparc3	if BR2_sparc_ultrasparc3
+	default niagara		if BR2_sparc_niagara
 
 config BR2_GCC_TARGET_ARCH
 	string
@@ -741,11 +634,6 @@ config BR2_GCC_TARGET_ARCH
 	default armv4		if BR2_sa1100
 	default armv5te		if BR2_xscale
 	default iwmmxt		if BR2_iwmmxt
-	default v0		if BR2_cris_unknown
-	default v10		if BR2_cris_generic
-	default v3		if BR2_cris_etrax_4
-	default v8		if BR2_cris_etrax_100
-	default v10		if BR2_cris_etrax_100lx
 	default 68000		if BR2_m68k_68000
 	default 68010		if BR2_m68k_68010
 	default 68020		if BR2_m68k_68020
-- 
1.7.0.4
