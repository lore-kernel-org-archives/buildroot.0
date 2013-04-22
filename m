From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Mon, 22 Apr 2013 13:37:29 +0200
Subject: [Buildroot] [PATCH 5/7] arc: Add support for ARC-specific GCC
In-Reply-To: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
References: <1366630651-6857-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1366630651-6857-6-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC support in GCC is not upstream yet...

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 support/gnuconfig/config.sub                       |    4 +-
 toolchain/Config.in                                |    3 +-
 .../gcc/4.4.7-arc/fix_branch_out_of_range.patch    |   22 ++++++++++++++++++++
 toolchain/gcc/Config.in                            |   22 ++++++++++++-------
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    4 +++
 5 files changed, 44 insertions(+), 11 deletions(-)
 create mode 100644 toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch

diff --git a/support/gnuconfig/config.sub b/support/gnuconfig/config.sub
index 8509813..b2958ad 100755
--- a/support/gnuconfig/config.sub
+++ b/support/gnuconfig/config.sub
@@ -259,7 +259,7 @@ case $basic_machine in
 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
 	| am33_2.0 \
-	| arc \
+	| arc | arceb \
 	| arm | arm[bl]e | arme[lb] | armv[2-8] | armv[3-8][lb] | armv7[arm] \
 	| avr | avr32 \
 	| be32 | be64 \
@@ -372,7 +372,7 @@ case $basic_machine in
 	| aarch64-* | aarch64_be-* \
 	| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
-	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
+	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* | arceb-* \
 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
 	| avr-* | avr32-* \
 	| be32-* | be64-* \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fa78cf4..5d1c592 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -22,7 +22,8 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
-	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa
+	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa && \
+		   !BR2_arc && !BR2_arceb
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
diff --git a/toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch b/toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch
new file mode 100644
index 0000000..f042a71
--- /dev/null
+++ b/toolchain/gcc/4.4.7-arc/fix_branch_out_of_range.patch
@@ -0,0 +1,22 @@
+diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
+index ff602c0..b3ca4c4 100644
+--- a/gcc/config/arc/arc.c
++++ b/gcc/config/arc/arc.c
+@@ -6565,7 +6565,7 @@ estimate required size increase).
+ 	      rtx *ccp = &XEXP (XVECEXP (pat, 0, 1), 0);
+ 
+ 	      offset = branch_dest (insn) - INSN_ADDRESSES (INSN_UID (insn));
+-	      if ((offset >= -140 && offset < 140)
++	      if ((offset >= -120 && offset < 120)
+ 		  && rtx_equal_p (XEXP (op, 1), const0_rtx)
+  		  && compact_register_operand (XEXP (op, 0), VOIDmode)
+ 		  && equality_comparison_operator (op, VOIDmode))
+@@ -6687,7 +6687,7 @@ estimate required size increase).
+ 
+ 		  if (op0 != cmp0)
+  		    cc_clob_rtx = gen_rtx_REG (CC_ZNmode, CC_REG);
+- 		  else if ((offset >= -140 && offset < 140)
++ 		  else if ((offset >= -120 && offset < 120)
+ 			   && rtx_equal_p (op1, const0_rtx)
+ 			   && compact_register_operand (op0, VOIDmode)
+ 			   && (GET_CODE (op) == EQ
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index d7e8715..2396e8e 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -9,44 +9,49 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
+	default BR2_GCC_VERSION_4_4_7_ARC if BR2_arc || BR2_arceb
 	default BR2_GCC_VERSION_4_7_X
 	help
 	  Select the version of gcc you wish to use.
 
+	config BR2_GCC_VERSION_4_4_7_ARC
+		depends on BR2_arc || BR2_arceb
+		bool "gcc 4.4.7-arc"
+
 	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	       depends on BR2_avr32
 	       bool "gcc 4.2.2-avr32-2.1.5"
 
 	config BR2_GCC_VERSION_4_3_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526
+		depends on !BR2_arc && !BR2_arceb && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526
 		bool "gcc 4.3.x"
 
 	config BR2_GCC_VERSION_4_4_X
-		depends on !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526
+		depends on !BR2_arc && !BR2_arceb && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526
 		bool "gcc 4.4.x"
 
 	config BR2_GCC_VERSION_4_5_X
-		depends on !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526
+		depends on !BR2_arc && !BR2_arceb && !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_arc && !BR2_arceb && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_arc && !BR2_arceb && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_arc && !BR2_arceb && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_SNAP
-		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		depends on !BR2_arc && !BR2_arceb && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc snapshot"
 endchoice
@@ -74,6 +79,7 @@ config BR2_GCC_VERSION
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
+	default "4.4.7-arc" if BR2_GCC_VERSION_4_4_7_ARC
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
@@ -119,6 +125,6 @@ config BR2_GCC_ENABLE_TLS
 
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
-	depends on !BR2_PTHREADS_NONE && !BR2_avr32
+	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc && !BR2_arceb
 	help
 	  Enable OpenMP support for the compiler
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index fc11ad4..31afd48 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -29,6 +29,8 @@ ifneq ($(GCC_SNAP_DATE),)
  GCC_SITE:=ftp://gcc.gnu.org/pub/gcc/snapshots/$(GCC_SNAP_DATE)/
 else ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
  GCC_SITE:=ftp://www.at91.com/pub/buildroot/
+else ifeq ($(findstring arc,$(GCC_VERSION)),arc)
+ GCC_SITE:=$(BR2_ARC_SITE)
 else
  GCC_SITE:=$(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 endif
@@ -63,7 +65,9 @@ endif
 
 # Determine soft-float options
 ifeq ($(BR2_SOFT_FLOAT),y)
+ifeq ($(BR2_arc)$(BR2_arceb),)
 SOFT_FLOAT_CONFIG_OPTION:=--with-float=soft
+endif
 ifeq ($(BR2_arm)$(BR2_armeb),y) # only set float-abi for arm
 TARGET_SOFT_FLOAT:=-mfloat-abi=soft
 else
-- 
1.7.0.4
