From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 02 Mar 2015 22:27:21 -0000
Subject: [Buildroot] [git commit] package/gcc: do not mourn avr32 for too
	long...
Message-ID: <20150302222718.68DAA807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f8e9162fae5fdc1788dcf33f02b20ddaa5e6846
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../1001-gcc-4.2.x-inhibit-libc.patch              |   49 -------
 ...-fix-removal-of-redundant-cast-operations.patch |   16 --
 ...conditional-insn-which-clobbers-cc_status.patch |  150 --------------------
 ...use-movh-to-move-immediates-into-register.patch |   31 ----
 .../990-fix-300-libstdc++-pic.patch                |   20 ---
 package/gcc/Config.in.host                         |   26 +---
 package/gcc/gcc.mk                                 |    4 +-
 7 files changed, 8 insertions(+), 288 deletions(-)

diff --git a/package/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch b/package/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch
deleted file mode 100644
index 9a7c909..0000000
--- a/package/gcc/4.2.2-avr32-2.1.5/1001-gcc-4.2.x-inhibit-libc.patch
+++ /dev/null
@@ -1,49 +0,0 @@
---- gcc-4.2.4/gcc/unwind-sjlj.c.khem	2010-08-11 12:45:28.000000000 -0700
-+++ gcc-4.2.4/gcc/unwind-sjlj.c	2010-08-11 12:45:50.000000000 -0700
-@@ -28,6 +28,8 @@
-    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
-    02110-1301, USA.  */
- 
-+#ifndef inhibit_libc
-+
- #include "tconfig.h"
- #include "tsystem.h"
- #include "coretypes.h"
-@@ -326,3 +328,4 @@ uw_identify_context (struct _Unwind_Cont
- #include "unwind.inc"
- 
- #endif /* USING_SJLJ_EXCEPTIONS */
-+#endif
---- gcc-4.2.4/gcc/unwind-dw2.c.khem	2010-08-11 12:42:45.000000000 -0700
-+++ gcc-4.2.4/gcc/unwind-dw2.c	2010-08-11 12:43:17.000000000 -0700
-@@ -28,6 +28,8 @@
-    Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
-    02110-1301, USA.  */
- 
-+#ifndef inhibit_libc
-+
- #include "tconfig.h"
- #include "tsystem.h"
- #include "coretypes.h"
-@@ -1537,3 +1539,5 @@ alias (_Unwind_SetIP);
- #endif
- 
- #endif /* !USING_SJLJ_EXCEPTIONS */
-+#endif
-+
---- gcc-4.2.4/gcc/unwind-dw2-fde-glibc.c.khem	2010-08-11 12:44:25.000000000 -0700
-+++ gcc-4.2.4/gcc/unwind-dw2-fde-glibc.c	2010-08-11 12:44:48.000000000 -0700
-@@ -29,6 +29,8 @@
-    segment and dl_iterate_phdr to avoid register/deregister calls at
-    DSO load/unload.  */
- 
-+#ifndef inhibit_libc
-+
- #ifndef _GNU_SOURCE
- #define _GNU_SOURCE 1
- #endif
-@@ -438,3 +440,4 @@ _Unwind_Find_FDE (void *pc, struct dwarf
- #if defined (USE_GAS_SYMVER) && defined (SHARED) && defined (USE_LIBUNWIND_EXCEPTIONS)
- alias (_Unwind_Find_FDE);
- #endif
-+#endif
diff --git a/package/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch b/package/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
deleted file mode 100644
index 59ecbff..0000000
--- a/package/gcc/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: trunk/gcc/config/avr32/avr32.c
-===================================================================
---- trunk/gcc/config/avr32/avr32.c	(revision 43495)
-+++ trunk/gcc/config/avr32/avr32.c	(revision 43496)
-@@ -6499,6 +6499,11 @@
- 		    break;
- 		}
- 
-+              /* Check if we have a call and the register is used as an argument. */
-+              if (CALL_P (scan)
-+                  && find_reg_fusage (scan, USE, reg) )
-+                break;
-+
- 	      if (!reg_mentioned_p (reg, PATTERN (scan)))
- 		continue;
- 
diff --git a/package/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch b/package/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
deleted file mode 100644
index 539c666..0000000
--- a/package/gcc/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-Index: gcc-4.2.2/gcc/config/avr32/avr32.c
-===================================================================
---- gcc-4.2.2.orig/gcc/config/avr32/avr32.c	2008-09-19 14:29:20.000000000 +0200
-+++ gcc-4.2.2/gcc/config/avr32/avr32.c	2008-09-19 14:30:02.000000000 +0200
-@@ -1788,7 +1788,7 @@
-     {
-       if (TREE_CODE (*node) != FUNCTION_DECL)
- 	{
--	  warning ("`%s' attribute only applies to functions",
-+	  warning (OPT_Wattributes,"`%s' attribute only applies to functions",
- 		   IDENTIFIER_POINTER (name));
- 	  *no_add_attrs = true;
- 	}
-@@ -1802,7 +1802,7 @@
- 	{
- 	  if (avr32_isr_value (args) == AVR32_FT_UNKNOWN)
- 	    {
--	      warning ("`%s' attribute ignored", IDENTIFIER_POINTER (name));
-+	      warning (OPT_Wattributes,"`%s' attribute ignored", IDENTIFIER_POINTER (name));
- 	      *no_add_attrs = true;
- 	    }
- 	}
-@@ -1829,7 +1829,7 @@
- 	    }
- 	  else
- 	    {
--	      warning ("`%s' attribute ignored", IDENTIFIER_POINTER (name));
-+	      warning (OPT_Wattributes,"`%s' attribute ignored", IDENTIFIER_POINTER (name));
- 	    }
- 	}
-     }
-@@ -1847,7 +1847,7 @@
- {
-   if (TREE_CODE (*node) != FUNCTION_DECL)
-     {
--      warning ("%qs attribute only applies to functions",
-+      warning (OPT_Wattributes,"%qs attribute only applies to functions",
- 	       IDENTIFIER_POINTER (name));
-       *no_add_attrs = true;
-     }
-@@ -1866,13 +1866,13 @@
- {
-   if (TREE_CODE (*node) == FUNCTION_TYPE || TREE_CODE (*node) == METHOD_TYPE)
-     {
--      warning ("`%s' attribute not yet supported...",
-+      warning (OPT_Wattributes,"`%s' attribute not yet supported...",
- 	       IDENTIFIER_POINTER (name));
-       *no_add_attrs = true;
-       return NULL_TREE;
-     }
- 
--  warning ("`%s' attribute only applies to functions",
-+  warning (OPT_Wattributes,"`%s' attribute only applies to functions",
- 	   IDENTIFIER_POINTER (name));
-   *no_add_attrs = true;
-   return NULL_TREE;
-@@ -4215,51 +4215,6 @@
- 
- 
- void
--avr32_asm_output_ascii (FILE * stream, char *ptr, int len)
--{
--  int i, i_new = 0;
--  char *new_ptr = xmalloc (4 * len);
--  if (new_ptr == NULL)
--    internal_error ("Out of memory.");
--
--  for (i = 0; i < len; i++)
--    {
--      if (ptr[i] == '\n')
--	{
--	  new_ptr[i_new++] = '\\';
--	  new_ptr[i_new++] = '0';
--	  new_ptr[i_new++] = '1';
--	  new_ptr[i_new++] = '2';
--	}
--      else if (ptr[i] == '\"')
--	{
--	  new_ptr[i_new++] = '\\';
--	  new_ptr[i_new++] = '\"';
--	}
--      else if (ptr[i] == '\\')
--	{
--	  new_ptr[i_new++] = '\\';
--	  new_ptr[i_new++] = '\\';
--	}
--      else if (ptr[i] == '\0' && i + 1 < len)
--	{
--	  new_ptr[i_new++] = '\\';
--	  new_ptr[i_new++] = '0';
--	}
--      else
--	{
--	  new_ptr[i_new++] = ptr[i];
--	}
--    }
--
--  /* Terminate new_ptr. */
--  new_ptr[i_new] = '\0';
--  fprintf (stream, "\t.ascii\t\"%s\"\n", new_ptr);
--  free (new_ptr);
--}
--
--
--void
- avr32_asm_output_label (FILE * stream, const char *name)
- {
-   name = avr32_strip_name_encoding (name);
-@@ -4444,12 +4399,15 @@
-         rtx cmp;
-         rtx cmp_op0, cmp_op1;
-         rtx cond;
-+        rtx dest;
-+
-         if ( GET_CODE (exp) == COND_EXEC )
-           {
-             cmp_op0 = XEXP (COND_EXEC_TEST (exp), 0);
-             cmp_op1 = XEXP (COND_EXEC_TEST (exp), 1);
-             cond = COND_EXEC_TEST (exp);
--          } 
-+            dest = SET_DEST (COND_EXEC_CODE (exp));
-+          }
-         else
-           {
-             /* If then else conditional. compare operands are in operands
-@@ -4457,6 +4415,7 @@
-             cmp_op0 = recog_data.operand[4];
-             cmp_op1 = recog_data.operand[5];
-             cond = recog_data.operand[1];
-+            dest = SET_DEST (exp);
-           }
- 
-         if ( GET_CODE (cmp_op0) == AND )
-@@ -4466,7 +4425,15 @@
-                                  cmp_op0,
-                                  cmp_op1);
-         
--	if (is_compare_redundant (cmp, cond) == NULL_RTX)
-+        /* Check if the conditional insns updates a register present
-+           in the comparison, if so then we must reset the cc_status. */
-+        if (REG_P (dest)
-+            && (reg_mentioned_p (dest, cmp_op0)
-+                || reg_mentioned_p (dest, cmp_op1)))
-+          {
-+            CC_STATUS_INIT;
-+          }
-+	else if (is_compare_redundant (cmp, cond) == NULL_RTX)
- 	  {
- 	    /* Reset the nonstandard flag */
- 	    CC_STATUS_INIT;
diff --git a/package/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch b/package/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
deleted file mode 100644
index 08d972d..0000000
--- a/package/gcc/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Index: gcc-4.2.2/gcc/config/avr32/avr32.md
-===================================================================
---- gcc-4.2.2.orig/gcc/config/avr32/avr32.md	2008-09-19 14:23:34.000000000 +0200
-+++ gcc-4.2.2/gcc/config/avr32/avr32.md	2008-09-19 14:30:18.000000000 +0200
-@@ -803,14 +803,22 @@
- (define_insn "*movsf_internal"
-   [(set (match_operand:SF 0 "nonimmediate_operand"     "=r,r,r,r,m")
- 	(match_operand:SF 1 "general_operand"          "r, G,F,m,r"))]
--  "TARGET_SOFT_FLOAT
--   && (register_operand (operands[0], SFmode)
--       || register_operand (operands[1], SFmode))"
-+  "(register_operand (operands[0], SFmode)
-+    || register_operand (operands[1], SFmode))"
-   {
-     switch (which_alternative) {
-       case 0:
-       case 1: return "mov\t%0, %1";
--      case 2: return "mov\t%0, lo(%1)\;orh\t%0, hi(%1)";
-+      case 2: 
-+       {
-+        HOST_WIDE_INT target_float[2];
-+        real_to_target (target_float, CONST_DOUBLE_REAL_VALUE (operands[1]), SFmode);
-+        if ( TARGET_V2_INSNS 
-+             && avr32_hi16_immediate_operand (GEN_INT (target_float[0]), VOIDmode) )
-+           return "movh\t%0, hi(%1)";
-+        else
-+           return "mov\t%0, lo(%1)\;orh\t%0, hi(%1)";
-+       }
-       case 3:
-         if ( (REG_P(XEXP(operands[1], 0))
-               && REGNO(XEXP(operands[1], 0)) == SP_REGNUM)
diff --git a/package/gcc/4.2.2-avr32-2.1.5/990-fix-300-libstdc++-pic.patch b/package/gcc/4.2.2-avr32-2.1.5/990-fix-300-libstdc++-pic.patch
deleted file mode 100644
index a63b3ad..0000000
--- a/package/gcc/4.2.2-avr32-2.1.5/990-fix-300-libstdc++-pic.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-libstdc++-v3: fix the effects of pre-applied 300-libstdc++-pic.patch
-
-This version of GCC comes with a number of pre-applied patches, among which is
-300-libstdc++-pic.patch that makes a PIC version of libstdc++. The resulting
-Makefile.in incorrectly refers to object files that should be insde the library.
-
-Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
-
-diff -uNrp host-gcc-final-4.2.2-avr32-2.1.5.orig/libstdc++-v3/src/Makefile.in host-gcc-final-4.2.2-avr32-2.1.5/libstdc++-v3/src/Makefile.in
---- host-gcc-final-4.2.2-avr32-2.1.5.orig/libstdc++-v3/src/Makefile.in	2008-07-04 00:18:42.000000000 +0300
-+++ host-gcc-final-4.2.2-avr32-2.1.5/libstdc++-v3/src/Makefile.in	2013-08-08 16:15:56.201258882 +0300
-@@ -804,7 +804,7 @@ install_debug:
- 
- install-exec-local:
- ifeq ($(enable_shared),yes)
--	$(AR) cru libstdc++_pic.a *.o $(top_builddir)/libsupc++/*.o
-+	$(AR) cru libstdc++_pic.a .libs/*.o $(top_builddir)/libsupc++/*.o
- 	$(INSTALL_DATA) libstdc++_pic.a $(DESTDIR)$(toolexeclibdir)
- endif
- 
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 24004c4..567f66a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -8,7 +8,6 @@ config BR2_GCC_SUPPORTS_GRAPHITE
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
 	default BR2_GCC_VERSION_4_5_X if BR2_bfin
@@ -16,16 +15,11 @@ choice
 	help
 	  Select the version of gcc you wish to use.
 
-	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
-		bool "gcc 4.2.2-avr32-2.1.5"
-		# Only supported architecture
-		depends on BR2_avr32
-
 	config BR2_GCC_VERSION_4_5_X
 		bool "gcc 4.5.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_avr32  && !BR2_powerpc64le
+			&& !BR2_powerpc64le
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
 			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
@@ -46,7 +40,7 @@ choice
 		bool "gcc 4.7.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_avr32 && !BR2_bfin && !BR2_powerpc64le
+			&& !BR2_bfin && !BR2_powerpc64le
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12 && !BR2_pj4
 		# Broken or unsupported PPC cores
@@ -61,7 +55,7 @@ choice
 	config BR2_GCC_VERSION_4_8_X
 		bool "gcc 4.8.x"
 		# Broken or unsupported architectures
-		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 \
+		depends on !BR2_microblaze && !BR2_arc \
 			&& !BR2_bfin && !BR2_powerpc64le
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12
@@ -79,7 +73,7 @@ choice
 	config BR2_GCC_VERSION_4_9_X
 		bool "gcc 4.9.x"
 		# Broken or unsupported architectures
-		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin
+		depends on !BR2_arc && !BR2_bfin
 		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
@@ -88,11 +82,10 @@ endchoice
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
-	default y if !BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
+	default y
 
 config BR2_GCC_VERSION
 	string
-	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.4"     if BR2_GCC_VERSION_4_8_X
@@ -110,16 +103,11 @@ config BR2_EXTRA_GCC_CONFIG_OPTIONS
 config BR2_TOOLCHAIN_BUILDROOT_CXX
 	bool "Enable C++ support"
 	select BR2_INSTALL_LIBSTDCPP
-	depends on !(BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && \
-		     BR2_TOOLCHAIN_BUILDROOT_LOCALE)
 	help
 	  Enable this option if you want your toolchain to support the
 	  C++ language and you want C++ libraries to be installed on
 	  your target system.
 
-comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
-	depends on BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && BR2_TOOLCHAIN_BUILDROOT_LOCALE
-
 config BR2_GCC_ENABLE_TLS
 	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	default y
@@ -130,7 +118,7 @@ config BR2_GCC_ENABLE_TLS
 
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
-	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc && !BR2_microblaze
+	depends on !BR2_PTHREADS_NONE && !BR2_arc && !BR2_microblaze
 	help
 	  Enable OpenMP support for the compiler
 
@@ -138,7 +126,7 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 	bool "Enable libmudflap support"
 	# There are architectures, or specific configurations for
 	# which mudflap is not supported.
-	depends on !BR2_avr32 && !BR2_bfin && !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
+	depends on !BR2_bfin && !BR2_ARM_INSTRUCTIONS_THUMB && !BR2_powerpc_SPE
 	depends on !BR2_GCC_VERSION_4_9_X
 	help
 	  libmudflap is a gcc library used for the mudflap pointer
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3af8290..477f846 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -10,9 +10,7 @@
 
 GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
 
-ifeq ($(findstring avr32,$(GCC_VERSION)),avr32)
-GCC_SITE = ftp://www.at91.com/pub/buildroot
-else ifeq ($(BR2_arc),y)
+ifeq ($(BR2_arc),y)
 GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
 else
