From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 May 2011 15:13:01 -0300
Subject: [Buildroot] [PATCH 1/2] toolchain: bump gcc 4.5 series to verion
	4.5.3
Message-ID: <1304359982-15984-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/gcc/4.5.2/850-arm-pr44392.patch          |   70 --------------------
 .../gcc/{4.5.2 => 4.5.3}/100-uclibc-conf.patch     |    0
 .../{4.5.2 => 4.5.3}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.5.2 => 4.5.3}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.5.2 => 4.5.3}/820-arm-unbreak-armv4t.patch  |    0
 .../gcc/{4.5.2 => 4.5.3}/830-arm-pr43440.patch     |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk                    |    2 +-
 11 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 toolchain/gcc/4.5.2/850-arm-pr44392.patch
 rename toolchain/gcc/{4.5.2 => 4.5.3}/100-uclibc-conf.patch (100%)
 rename toolchain/gcc/{4.5.2 => 4.5.3}/301-missing-execinfo_h.patch (100%)
 rename toolchain/gcc/{4.5.2 => 4.5.3}/302-c99-snprintf.patch (100%)
 rename toolchain/gcc/{4.5.2 => 4.5.3}/305-libmudflap-susv3-legacy.patch (100%)
 rename toolchain/gcc/{4.5.2 => 4.5.3}/810-arm-softfloat-libgcc.patch (100%)
 rename toolchain/gcc/{4.5.2 => 4.5.3}/820-arm-unbreak-armv4t.patch (100%)
 rename toolchain/gcc/{4.5.2 => 4.5.3}/830-arm-pr43440.patch (100%)
 rename toolchain/gcc/{4.5.2 => 4.5.3}/powerpc-link-with-math-lib.patch.conditional (100%)

diff --git a/toolchain/gcc/4.5.2/850-arm-pr44392.patch b/toolchain/gcc/4.5.2/850-arm-pr44392.patch
deleted file mode 100644
index 4ad6c44..0000000
--- a/toolchain/gcc/4.5.2/850-arm-pr44392.patch
+++ /dev/null
@@ -1,70 +0,0 @@
->From d0557763b0713a4c006bd2405eede3924569cafd Mon Sep 17 00:00:00 2001
-From: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
-Date: Mon, 5 Jul 2010 11:28:49 +0100
-Subject: [PATCH 2/2] Fix PR44392
-
----
- gcc/config/arm/arm.md |   43 +++++++++++++++++++------------------------
- 1 files changed, 19 insertions(+), 24 deletions(-)
-
-diff --git a/gcc/config/arm/arm.md b/gcc/config/arm/arm.md
-index 2096ec6..f0348f3 100644
---- a/gcc/config/arm/arm.md
-+++ b/gcc/config/arm/arm.md
-@@ -11318,34 +11318,29 @@
- (define_expand "bswapsi2"
-   [(set (match_operand:SI 0 "s_register_operand" "=r")
-   	(bswap:SI (match_operand:SI 1 "s_register_operand" "r")))]
--"TARGET_EITHER"
-+"TARGET_EITHER && (arm_arch6 || !optimize_size)"
- "
--  if (!arm_arch6)
--    {
--      if (!optimize_size)
--	{
--	  rtx op2 = gen_reg_rtx (SImode);
--	  rtx op3 = gen_reg_rtx (SImode);
-+    if (!arm_arch6)
-+      {
-+	rtx op2 = gen_reg_rtx (SImode);
-+	rtx op3 = gen_reg_rtx (SImode);
- 
--	  if (TARGET_THUMB)
--	    {
--	      rtx op4 = gen_reg_rtx (SImode);
--	      rtx op5 = gen_reg_rtx (SImode);
-+	if (TARGET_THUMB)
-+	  {
-+	    rtx op4 = gen_reg_rtx (SImode);
-+	    rtx op5 = gen_reg_rtx (SImode);
- 
--	      emit_insn (gen_thumb_legacy_rev (operands[0], operands[1],
--					       op2, op3, op4, op5));
--	    }
--	  else
--	    {
--	      emit_insn (gen_arm_legacy_rev (operands[0], operands[1],
--					     op2, op3));
--	    }
-+	    emit_insn (gen_thumb_legacy_rev (operands[0], operands[1],
-+					     op2, op3, op4, op5));
-+	  }
-+	else
-+	  {
-+	    emit_insn (gen_arm_legacy_rev (operands[0], operands[1],
-+					   op2, op3));
-+	  }
- 
--	  DONE;
--	}
--      else
--	FAIL;
--    }
-+	DONE;
-+      }
-   "
- )
- 
--- 
-1.6.2
-
diff --git a/toolchain/gcc/4.5.2/100-uclibc-conf.patch b/toolchain/gcc/4.5.3/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.5.2/100-uclibc-conf.patch
rename to toolchain/gcc/4.5.3/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.5.2/301-missing-execinfo_h.patch b/toolchain/gcc/4.5.3/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.5.2/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.5.3/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.5.2/302-c99-snprintf.patch b/toolchain/gcc/4.5.3/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.5.2/302-c99-snprintf.patch
rename to toolchain/gcc/4.5.3/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.5.2/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.5.3/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.5.2/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.5.3/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.5.2/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.5.3/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.5.2/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.5.3/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.5.2/820-arm-unbreak-armv4t.patch b/toolchain/gcc/4.5.3/820-arm-unbreak-armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.5.2/820-arm-unbreak-armv4t.patch
rename to toolchain/gcc/4.5.3/820-arm-unbreak-armv4t.patch
diff --git a/toolchain/gcc/4.5.2/830-arm-pr43440.patch b/toolchain/gcc/4.5.3/830-arm-pr43440.patch
similarity index 100%
rename from toolchain/gcc/4.5.2/830-arm-pr43440.patch
rename to toolchain/gcc/4.5.3/830-arm-pr43440.patch
diff --git a/toolchain/gcc/4.5.2/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.5.3/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.5.2/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.5.3/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 17b21b8..fcdcc19 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -57,7 +57,7 @@ config BR2_GCC_VERSION
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
 	default "4.3.5"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.6"     if BR2_GCC_VERSION_4_4_X
-	default "4.5.2"     if BR2_GCC_VERSION_4_5_X
+	default "4.5.3"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.0"     if BR2_GCC_VERSION_4_6_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index ebcca53..568aa1a 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -44,7 +44,7 @@ EXTRA_GCC_CONFIG_OPTIONS+=--with-pkgversion="Buildroot $(BR2_VERSION_FULL)" \
 endif
 
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43810
-# Workaround until it's fixed in 4.5.2 or later
+# Workaround until it's fixed in 4.5.4 or later
 ifeq ($(ARCH),powerpc)
 ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
 GCC_OPTSPACE=--disable-target-optspace
-- 
1.7.3.4
