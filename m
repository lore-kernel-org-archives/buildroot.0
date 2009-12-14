From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:04:49 +0100
Subject: [Buildroot] [PATCH 17/23] gcc: remove external sources patches
In-Reply-To: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260831891.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ebf4f67a8d5cd7b697636fb298432567b6ba2cca.1260831891.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../901-avr32-revert-broken-uclibc-stuff.patch     |   42 ------
 ...-fix-removal-of-redundant-cast-operations.patch |   16 --
 ...conditional-insn-which-clobbers-cc_status.patch |  150 --------------------
 ...use-movh-to-move-immediates-into-register.patch |   31 ----
 4 files changed, 0 insertions(+), 239 deletions(-)
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.0/.empty
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.2/.empty
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.1-avr32-2.1.3/.empty
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/.empty
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
 delete mode 100644 toolchain/gcc/ext_source/Atmel/avr32/4.2.3-avr32-2.1.5/.empty

diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.0/.empty b/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.0/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.2/.empty b/toolchain/gcc/ext_source/Atmel/avr32/4.1.2-avr32-2.2/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.2.1-avr32-2.1.3/.empty b/toolchain/gcc/ext_source/Atmel/avr32/4.2.1-avr32-2.1.3/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/.empty b/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/.empty
deleted file mode 100644
index e69de29..0000000
diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch b/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch
deleted file mode 100644
index e056be0..0000000
--- a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-1.1.3/901-avr32-revert-broken-uclibc-stuff.patch
+++ /dev/null
@@ -1,42 +0,0 @@
---- a/libstdc++-v3/acinclude.m4
-+++ b/libstdc++-v3/acinclude.m4
-@@ -125,6 +125,15 @@ AC_DEFUN([GLIBCXX_CONFIGURE], [
-   ## other macros from doing the same.  This should be automated.)  -pme
-   need_libmath=no
- 
-+  # Check for uClibc since Linux platforms use different configuration
-+  # directories depending on the C library in use.
-+  AC_EGREP_CPP([_using_uclibc], [
-+  #include <stdio.h>
-+  #if __UCLIBC__
-+    _using_uclibc
-+  #endif
-+  ], uclibc=yes, uclibc=no)
-+
-   # Find platform-specific directories containing configuration info.
-   # Also possibly modify flags used elsewhere, as needed by the platform.
-   GLIBCXX_CHECK_HOST
---- a/libstdc++-v3/config/os/gnu-linux/ctype_base.h
-+++ b/libstdc++-v3/config/os/gnu-linux/ctype_base.h
-@@ -31,8 +31,6 @@
- //
- // ISO C++ 14882: 22.1  Locales
- //
--#include <features.h>
--#include <ctype.h>
-   
- /** @file ctype_base.h
-  *  This is an internal header file, included by other library headers.
-@@ -47,11 +45,7 @@ _GLIBCXX_BEGIN_NAMESPACE(std)
-   struct ctype_base
-   {
-     // Non-standard typedefs.
--#ifdef __UCLIBC__
--    typedef const __ctype_touplow_t*   __to_type;
--#else
--    typedef const int*         __to_type;
--#endif
-+    typedef const int*		__to_type;
-  
-     // NB: Offsets into ctype<char>::_M_table force a particular size
-     // on the mask type. Because of this, we don't use an enum.
diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch b/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
deleted file mode 100644
index 59ecbff..0000000
--- a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
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
diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch b/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
deleted file mode 100644
index 539c666..0000000
--- a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
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
diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch b/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
deleted file mode 100644
index 08d972d..0000000
--- a/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
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
diff --git a/toolchain/gcc/ext_source/Atmel/avr32/4.2.3-avr32-2.1.5/.empty b/toolchain/gcc/ext_source/Atmel/avr32/4.2.3-avr32-2.1.5/.empty
deleted file mode 100644
index e69de29..0000000
-- 
1.6.3.3
