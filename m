From: antab at uclibc.org <antab@uclibc.org>
Date: Thu, 30 Oct 2008 18:41:31 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5
Message-ID: <20081031014131.6EBE9F8008@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-10-30 18:41:31 -0700 (Thu, 30 Oct 2008)
New Revision: 23869

Log:
2 gcc patches from Atmel's buildroot



Added:
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/904-avr32-fix-conditional-insn-which-clobbers-cc_status.patch	2008-10-31 01:41:31 UTC (rev 23869)
@@ -0,0 +1,150 @@
+Index: gcc-4.2.2/gcc/config/avr32/avr32.c
+===================================================================
+--- gcc-4.2.2.orig/gcc/config/avr32/avr32.c	2008-09-19 14:29:20.000000000 +0200
++++ gcc-4.2.2/gcc/config/avr32/avr32.c	2008-09-19 14:30:02.000000000 +0200
+@@ -1788,7 +1788,7 @@
+     {
+       if (TREE_CODE (*node) != FUNCTION_DECL)
+ 	{
+-	  warning ("`%s' attribute only applies to functions",
++	  warning (OPT_Wattributes,"`%s' attribute only applies to functions",
+ 		   IDENTIFIER_POINTER (name));
+ 	  *no_add_attrs = true;
+ 	}
+@@ -1802,7 +1802,7 @@
+ 	{
+ 	  if (avr32_isr_value (args) == AVR32_FT_UNKNOWN)
+ 	    {
+-	      warning ("`%s' attribute ignored", IDENTIFIER_POINTER (name));
++	      warning (OPT_Wattributes,"`%s' attribute ignored", IDENTIFIER_POINTER (name));
+ 	      *no_add_attrs = true;
+ 	    }
+ 	}
+@@ -1829,7 +1829,7 @@
+ 	    }
+ 	  else
+ 	    {
+-	      warning ("`%s' attribute ignored", IDENTIFIER_POINTER (name));
++	      warning (OPT_Wattributes,"`%s' attribute ignored", IDENTIFIER_POINTER (name));
+ 	    }
+ 	}
+     }
+@@ -1847,7 +1847,7 @@
+ {
+   if (TREE_CODE (*node) != FUNCTION_DECL)
+     {
+-      warning ("%qs attribute only applies to functions",
++      warning (OPT_Wattributes,"%qs attribute only applies to functions",
+ 	       IDENTIFIER_POINTER (name));
+       *no_add_attrs = true;
+     }
+@@ -1866,13 +1866,13 @@
+ {
+   if (TREE_CODE (*node) == FUNCTION_TYPE || TREE_CODE (*node) == METHOD_TYPE)
+     {
+-      warning ("`%s' attribute not yet supported...",
++      warning (OPT_Wattributes,"`%s' attribute not yet supported...",
+ 	       IDENTIFIER_POINTER (name));
+       *no_add_attrs = true;
+       return NULL_TREE;
+     }
+ 
+-  warning ("`%s' attribute only applies to functions",
++  warning (OPT_Wattributes,"`%s' attribute only applies to functions",
+ 	   IDENTIFIER_POINTER (name));
+   *no_add_attrs = true;
+   return NULL_TREE;
+@@ -4215,51 +4215,6 @@
+ 
+ 
+ void
+-avr32_asm_output_ascii (FILE * stream, char *ptr, int len)
+-{
+-  int i, i_new = 0;
+-  char *new_ptr = xmalloc (4 * len);
+-  if (new_ptr == NULL)
+-    internal_error ("Out of memory.");
+-
+-  for (i = 0; i < len; i++)
+-    {
+-      if (ptr[i] == '\n')
+-	{
+-	  new_ptr[i_new++] = '\\';
+-	  new_ptr[i_new++] = '0';
+-	  new_ptr[i_new++] = '1';
+-	  new_ptr[i_new++] = '2';
+-	}
+-      else if (ptr[i] == '\"')
+-	{
+-	  new_ptr[i_new++] = '\\';
+-	  new_ptr[i_new++] = '\"';
+-	}
+-      else if (ptr[i] == '\\')
+-	{
+-	  new_ptr[i_new++] = '\\';
+-	  new_ptr[i_new++] = '\\';
+-	}
+-      else if (ptr[i] == '\0' && i + 1 < len)
+-	{
+-	  new_ptr[i_new++] = '\\';
+-	  new_ptr[i_new++] = '0';
+-	}
+-      else
+-	{
+-	  new_ptr[i_new++] = ptr[i];
+-	}
+-    }
+-
+-  /* Terminate new_ptr. */
+-  new_ptr[i_new] = '\0';
+-  fprintf (stream, "\t.ascii\t\"%s\"\n", new_ptr);
+-  free (new_ptr);
+-}
+-
+-
+-void
+ avr32_asm_output_label (FILE * stream, const char *name)
+ {
+   name = avr32_strip_name_encoding (name);
+@@ -4444,12 +4399,15 @@
+         rtx cmp;
+         rtx cmp_op0, cmp_op1;
+         rtx cond;
++        rtx dest;
++
+         if ( GET_CODE (exp) == COND_EXEC )
+           {
+             cmp_op0 = XEXP (COND_EXEC_TEST (exp), 0);
+             cmp_op1 = XEXP (COND_EXEC_TEST (exp), 1);
+             cond = COND_EXEC_TEST (exp);
+-          } 
++            dest = SET_DEST (COND_EXEC_CODE (exp));
++          }
+         else
+           {
+             /* If then else conditional. compare operands are in operands
+@@ -4457,6 +4415,7 @@
+             cmp_op0 = recog_data.operand[4];
+             cmp_op1 = recog_data.operand[5];
+             cond = recog_data.operand[1];
++            dest = SET_DEST (exp);
+           }
+ 
+         if ( GET_CODE (cmp_op0) == AND )
+@@ -4466,7 +4425,15 @@
+                                  cmp_op0,
+                                  cmp_op1);
+         
+-	if (is_compare_redundant (cmp, cond) == NULL_RTX)
++        /* Check if the conditional insns updates a register present
++           in the comparison, if so then we must reset the cc_status. */
++        if (REG_P (dest)
++            && (reg_mentioned_p (dest, cmp_op0)
++                || reg_mentioned_p (dest, cmp_op1)))
++          {
++            CC_STATUS_INIT;
++          }
++	else if (is_compare_redundant (cmp, cond) == NULL_RTX)
+ 	  {
+ 	    /* Reset the nonstandard flag */
+ 	    CC_STATUS_INIT;

Added: trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/905-avr32-optimize-movsf2-use-movh-to-move-immediates-into-register.patch	2008-10-31 01:41:31 UTC (rev 23869)
@@ -0,0 +1,31 @@
+Index: gcc-4.2.2/gcc/config/avr32/avr32.md
+===================================================================
+--- gcc-4.2.2.orig/gcc/config/avr32/avr32.md	2008-09-19 14:23:34.000000000 +0200
++++ gcc-4.2.2/gcc/config/avr32/avr32.md	2008-09-19 14:30:18.000000000 +0200
+@@ -803,14 +803,22 @@
+ (define_insn "*movsf_internal"
+   [(set (match_operand:SF 0 "nonimmediate_operand"     "=r,r,r,r,m")
+ 	(match_operand:SF 1 "general_operand"          "r, G,F,m,r"))]
+-  "TARGET_SOFT_FLOAT
+-   && (register_operand (operands[0], SFmode)
+-       || register_operand (operands[1], SFmode))"
++  "(register_operand (operands[0], SFmode)
++    || register_operand (operands[1], SFmode))"
+   {
+     switch (which_alternative) {
+       case 0:
+       case 1: return "mov\t%0, %1";
+-      case 2: return "mov\t%0, lo(%1)\;orh\t%0, hi(%1)";
++      case 2: 
++       {
++        HOST_WIDE_INT target_float[2];
++        real_to_target (target_float, CONST_DOUBLE_REAL_VALUE (operands[1]), SFmode);
++        if ( TARGET_V2_INSNS 
++             && avr32_hi16_immediate_operand (GEN_INT (target_float[0]), VOIDmode) )
++           return "movh\t%0, hi(%1)";
++        else
++           return "mov\t%0, lo(%1)\;orh\t%0, hi(%1)";
++       }
+       case 3:
+         if ( (REG_P(XEXP(operands[1], 0))
+               && REGNO(XEXP(operands[1], 0)) == SP_REGNUM)
