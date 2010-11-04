From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] gcc 4.5.x arm: fix v4, pr#43440,
	pr#44392 and pr#45070
Message-ID: <20101104230331.9D0EF8DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1b3b9919439a3599881b3e7e589726a8e8440d7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/4.5.1/820-arm-unbreak-armv4t.patch |   14 +
 toolchain/gcc/4.5.1/830-arm-pr43440.patch        |  345 ++++++++++++++++++++++
 toolchain/gcc/4.5.1/840-arm-pr45070.patch        |  184 ++++++++++++
 toolchain/gcc/4.5.1/850-arm-pr44392.patch        |   70 +++++
 4 files changed, 613 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/gcc/4.5.1/820-arm-unbreak-armv4t.patch
 create mode 100644 toolchain/gcc/4.5.1/830-arm-pr43440.patch
 create mode 100644 toolchain/gcc/4.5.1/840-arm-pr45070.patch
 create mode 100644 toolchain/gcc/4.5.1/850-arm-pr44392.patch

diff --git a/toolchain/gcc/4.5.1/820-arm-unbreak-armv4t.patch b/toolchain/gcc/4.5.1/820-arm-unbreak-armv4t.patch
new file mode 100644
index 0000000..8651afc
--- /dev/null
+++ b/toolchain/gcc/4.5.1/820-arm-unbreak-armv4t.patch
@@ -0,0 +1,14 @@
+http://sourceware.org/ml/crossgcc/2008-05/msg00009.html
+
+diff -Nura gcc-4.5.1.orig/gcc/config/arm/linux-eabi.h gcc-4.5.1/gcc/config/arm/linux-eabi.h
+--- gcc-4.5.1.orig/gcc/config/arm/linux-eabi.h	2009-10-30 17:03:09.000000000 -0300
++++ gcc-4.5.1/gcc/config/arm/linux-eabi.h	2010-11-02 15:38:25.792208500 -0300
+@@ -44,7 +44,7 @@
+    The ARM10TDMI core is the default for armv5t, so set
+    SUBTARGET_CPU_DEFAULT to achieve this.  */
+ #undef  SUBTARGET_CPU_DEFAULT
+-#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
++#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi
+ 
+ /* TARGET_BIG_ENDIAN_DEFAULT is set in
+    config.gcc for big endian configurations.  */
diff --git a/toolchain/gcc/4.5.1/830-arm-pr43440.patch b/toolchain/gcc/4.5.1/830-arm-pr43440.patch
new file mode 100644
index 0000000..811d1f2
--- /dev/null
+++ b/toolchain/gcc/4.5.1/830-arm-pr43440.patch
@@ -0,0 +1,345 @@
+http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43440
+
+--- gcc-4.4.4.orig/gcc/config/arm/aout.h
++++ gcc-4.4.4/gcc/config/arm/aout.h
+@@ -163,34 +163,49 @@
+   {"mvdx12", 39},				\
+   {"mvdx13", 40},				\
+   {"mvdx14", 41},				\
+-  {"mvdx15", 42},				\
+-  {"d0", 63}, {"q0", 63},			\
+-  {"d1", 65},					\
+-  {"d2", 67}, {"q1", 67},			\
+-  {"d3", 69},					\
+-  {"d4", 71}, {"q2", 71},			\
+-  {"d5", 73},					\
+-  {"d6", 75}, {"q3", 75},			\
+-  {"d7", 77},					\
+-  {"d8", 79}, {"q4", 79},			\
+-  {"d9", 81},					\
+-  {"d10", 83}, {"q5", 83},			\
+-  {"d11", 85},					\
+-  {"d12", 87}, {"q6", 87},			\
+-  {"d13", 89},					\
+-  {"d14", 91}, {"q7", 91},			\
+-  {"d15", 93},					\
+-  {"q8", 95},					\
+-  {"q9", 99},					\
+-  {"q10", 103},					\
+-  {"q11", 107},					\
+-  {"q12", 111},					\
+-  {"q13", 115},					\
+-  {"q14", 119},					\
+-  {"q15", 123}					\
++  {"mvdx15", 42}				\
+ }
+ #endif
+ 
++#ifndef OVERLAPPING_REGISTER_NAMES
++#define OVERLAPPING_REGISTER_NAMES       \
++{					 \
++  {"d0", 63, 2},			 \
++  {"d1", 65, 2},			 \
++  {"d2", 67, 2},			 \
++  {"d3", 69, 2},			 \
++  {"d4", 71, 2},			 \
++  {"d5", 73, 2},			 \
++  {"d6", 75, 2},			 \
++  {"d7", 77, 2},			 \
++  {"d8", 79, 2},			 \
++  {"d9", 81, 2},			 \
++  {"d10", 83, 2},			 \
++  {"d11", 85, 2},			 \
++  {"d12", 87, 2},			 \
++  {"d13", 89, 2},			 \
++  {"d14", 91, 2},			 \
++  {"d15", 93, 2},			 \
++  {"q0", 63, 4},			 \
++  {"q1", 67, 4},			 \
++  {"q2", 71, 4},			 \
++  {"q3", 75, 4},			 \
++  {"q4", 79, 4},			 \
++  {"q5", 83, 4},			 \
++  {"q6", 87, 4},			 \
++  {"q7", 91, 4},			 \
++  {"q8", 95, 4},			 \
++  {"q9", 99, 4},			 \
++  {"q10", 103, 4},			 \
++  {"q11", 107, 4},			 \
++  {"q12", 111, 4},			 \
++  {"q13", 115, 4},			 \
++  {"q14", 119, 4},			 \
++  {"q15", 123, 4}			 \
++}
++#endif
++
++
+ #ifndef NO_DOLLAR_IN_LABEL
+ #define NO_DOLLAR_IN_LABEL 1
+ #endif
+--- gcc-4.4.4.orig/gcc/output.h
++++ gcc-4.4.4/gcc/output.h
+@@ -169,6 +169,11 @@
+    Prefixes such as % are optional.  */
+ extern int decode_reg_name (const char *);
+ 
++/* Similar to decode_reg_name, but takes an extra parameter that is a
++   pointer to the number of (internal) registers described by the
++   external name.  */
++extern int decode_reg_name_and_count (const char *, int *);
++
+ extern void assemble_alias (tree, tree);
+ 
+ extern void default_assemble_visibility (tree, int);
+--- gcc-4.4.4.orig/gcc/reginfo.c
++++ gcc-4.4.4/gcc/reginfo.c
+@@ -800,39 +800,44 @@
+ fix_register (const char *name, int fixed, int call_used)
+ {
+   int i;
++  int reg, nregs;
+ 
+   /* Decode the name and update the primary form of
+      the register info.  */
+-
+-  if ((i = decode_reg_name (name)) >= 0)
++  if ((reg = decode_reg_name_and_count (name, &nregs)) >= 0)
+     {
+-      if ((i == STACK_POINTER_REGNUM
++      gcc_assert (nregs >= 1);
++      for (i = reg; i < reg + nregs; i++)
++      {
++        if ((i == STACK_POINTER_REGNUM
+ #ifdef HARD_FRAME_POINTER_REGNUM
+-	   || i == HARD_FRAME_POINTER_REGNUM
++             || i == HARD_FRAME_POINTER_REGNUM
+ #else
+-	   || i == FRAME_POINTER_REGNUM
++             || i == FRAME_POINTER_REGNUM
+ #endif
+-	   )
+-	  && (fixed == 0 || call_used == 0))
+-	{
+-	  static const char * const what_option[2][2] = {
+-	    { "call-saved", "call-used" },
+-	    { "no-such-option", "fixed" }};
++             )
++            && (fixed == 0 || call_used == 0))
++          {
++            static const char * const what_option[2][2] = {
++              { "call-saved", "call-used" },
++              { "no-such-option", "fixed" }};
+ 
+-	  error ("can't use '%s' as a %s register", name,
+-		 what_option[fixed][call_used]);
+-	}
+-      else
+-	{
+-	  fixed_regs[i] = fixed;
+-	  call_used_regs[i] = call_used;
++            error ("can't use '%s' as a %s register", name,
++                   what_option[fixed][call_used]);
++          }
++        else
++          {
++            fixed_regs[i] = fixed;
++            call_used_regs[i] = call_used;
+ #ifdef CALL_REALLY_USED_REGISTERS
+-	  if (fixed == 0)
+-	    call_really_used_regs[i] = call_used;
++             if (fixed == 0)
++               call_really_used_regs[i] = call_used;
+ #endif
+-	}
+-    }
+-  else
++           }
++        }
++      }
++    else
++
+     {
+       warning (0, "unknown register name: %s", name);
+     }
+--- gcc-4.4.4.orig/gcc/stmt.c
++++ gcc-4.4.4/gcc/stmt.c
+@@ -681,13 +681,14 @@
+   for (tail = clobbers; tail; tail = TREE_CHAIN (tail))
+     {
+       const char *regname;
++      int nregs;
+ 
+       if (TREE_VALUE (tail) == error_mark_node)
+ 	return;
+       regname = TREE_STRING_POINTER (TREE_VALUE (tail));
+ 
+-      i = decode_reg_name (regname);
+-      if (i >= 0 || i == -4)
++      i = decode_reg_name_and_count (regname, &nregs);
++      if (i == -4)
+ 	++nclobbers;
+       else if (i == -2)
+ 	error ("unknown register name %qs in %<asm%>", regname);
+@@ -695,14 +696,21 @@
+       /* Mark clobbered registers.  */
+       if (i >= 0)
+         {
+-	  /* Clobbering the PIC register is an error.  */
+-	  if (i == (int) PIC_OFFSET_TABLE_REGNUM)
+-	    {
+-	      error ("PIC register %qs clobbered in %<asm%>", regname);
+-	      return;
+-	    }
++        int reg;
+ 
+-	  SET_HARD_REG_BIT (clobbered_regs, i);
++        for (reg = i; reg < i + nregs; reg++)
++          {
++            ++nclobbers;
++
++            /* Clobbering the PIC register is an error.  */
++            if (reg == (int) PIC_OFFSET_TABLE_REGNUM)
++              {
++                error ("PIC register clobbered by %qs in %<asm%>", regname);
++                return;
++              }
++
++            SET_HARD_REG_BIT (clobbered_regs, reg);
++          }
+ 	}
+     }
+ 
+@@ -1012,8 +1020,9 @@
+       for (tail = clobbers; tail; tail = TREE_CHAIN (tail))
+ 	{
+ 	  const char *regname = TREE_STRING_POINTER (TREE_VALUE (tail));
+-	  int j = decode_reg_name (regname);
+-	  rtx clobbered_reg;
++	  int reg, nregs;
++          int j = decode_reg_name_and_count (regname, &nregs);
++          rtx clobbered_reg;
+ 
+ 	  if (j < 0)
+ 	    {
+@@ -1033,31 +1042,40 @@
+ 	      /* Ignore unknown register, error already signaled.  */
+ 	      continue;
+ 	    }
+-
+-	  /* Use QImode since that's guaranteed to clobber just one reg.  */
+-	  clobbered_reg = gen_rtx_REG (QImode, j);
+-
+-	  /* Do sanity check for overlap between clobbers and respectively
+-	     input and outputs that hasn't been handled.  Such overlap
+-	     should have been detected and reported above.  */
+-	  if (!clobber_conflict_found)
+-	    {
+-	      int opno;
+-
+-	      /* We test the old body (obody) contents to avoid tripping
+-		 over the under-construction body.  */
+-	      for (opno = 0; opno < noutputs; opno++)
+-		if (reg_overlap_mentioned_p (clobbered_reg, output_rtx[opno]))
+-		  internal_error ("asm clobber conflict with output operand");
+-
+-	      for (opno = 0; opno < ninputs - ninout; opno++)
+-		if (reg_overlap_mentioned_p (clobbered_reg,
+-					     ASM_OPERANDS_INPUT (obody, opno)))
+-		  internal_error ("asm clobber conflict with input operand");
++        
++          for (reg = j; reg < j + nregs; reg++)
++            {
++              /* Use QImode since that's guaranteed to clobber just
++               * one reg.  */
++              clobbered_reg = gen_rtx_REG (QImode, reg);
++
++              /* Do sanity check for overlap between clobbers and
++                 respectively input and outputs that hasn't been
++                 handled.  Such overlap should have been detected and
++                 reported above.  */
++              if (!clobber_conflict_found)
++                {
++                  int opno;
++
++                  /* We test the old body (obody) contents to avoid
++                     tripping over the under-construction body.  */
++                  for (opno = 0; opno < noutputs; opno++)
++                    if (reg_overlap_mentioned_p (clobbered_reg,
++                                                 output_rtx[opno]))
++                      internal_error
++                        ("asm clobber conflict with output operand");
++
++                  for (opno = 0; opno < ninputs - ninout; opno++)
++                    if (reg_overlap_mentioned_p (clobbered_reg,
++                                                 ASM_OPERANDS_INPUT (obody,
++                                                                     opno)))
++                      internal_error
++                        ("asm clobber conflict with input operand");
++                }
++  
++              XVECEXP (body, 0, i++)
++                = gen_rtx_CLOBBER (VOIDmode, clobbered_reg);
+ 	    }
+-
+-	  XVECEXP (body, 0, i++)
+-	    = gen_rtx_CLOBBER (VOIDmode, clobbered_reg);
+ 	}
+ 
+       emit_insn (body);
+--- gcc-4.4.4.orig/gcc/varasm.c
++++ gcc-4.4.4/gcc/varasm.c
+@@ -1031,8 +1031,11 @@
+    Prefixes such as % are optional.  */
+ 
+ int
+-decode_reg_name (const char *asmspec)
++decode_reg_name_and_count (const char *asmspec, int *pnregs)
+ {
++  /* Presume just one register is clobbered.  */
++   *pnregs = 1;
++
+   if (asmspec != 0)
+     {
+       int i;
+@@ -1058,6 +1061,25 @@
+ 	    && ! strcmp (asmspec, strip_reg_name (reg_names[i])))
+ 	  return i;
+ 
++#ifdef OVERLAPPING_REGISTER_NAMES
++      {
++      static const struct
++      {
++        const char *const name;
++        const int number;
++        const int nregs;
++      } table[] = OVERLAPPING_REGISTER_NAMES;
++
++      for (i = 0; i < (int) ARRAY_SIZE (table); i++)
++        if (table[i].name[0]
++            && ! strcmp (asmspec, table[i].name))
++          {
++            *pnregs = table[i].nregs;
++            return table[i].number;
++          }
++      }
++#endif /* OVERLAPPING_REGISTER_NAMES */
++
+ #ifdef ADDITIONAL_REGISTER_NAMES
+       {
+ 	static const struct { const char *const name; const int number; } table[]
+@@ -1081,6 +1103,15 @@
+ 
+   return -1;
+ }
++
++int
++decode_reg_name (const char *name)
++{
++   int count;
++   return decode_reg_name_and_count (name, &count);
++}
++
++
+ 
+ /* Return true if DECL's initializer is suitable for a BSS section.  */
+ 
diff --git a/toolchain/gcc/4.5.1/840-arm-pr45070.patch b/toolchain/gcc/4.5.1/840-arm-pr45070.patch
new file mode 100644
index 0000000..80a5733
--- /dev/null
+++ b/toolchain/gcc/4.5.1/840-arm-pr45070.patch
@@ -0,0 +1,184 @@
+Miscompiled c++ class with packed attribute on ARM with -Os optimizations
+
+http://gcc.gnu.org/PR45070
+https://bugs.gentoo.org/331641
+
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -3036,7 +3036,7 @@ tree-switch-conversion.o : tree-switch-conversion.c $(CONFIG_H) $(SYSTEM_H) \
+     $(TREE_H) $(TM_P_H) $(TREE_FLOW_H) $(DIAGNOSTIC_H) $(TREE_INLINE_H) \
+     $(TIMEVAR_H) $(TM_H) coretypes.h $(TREE_DUMP_H) $(GIMPLE_H) \
+     $(TREE_PASS_H) $(FLAGS_H) $(EXPR_H) $(BASIC_BLOCK_H) output.h \
+-    $(GGC_H) $(OBSTACK_H) $(PARAMS_H) $(CPPLIB_H) $(PARAMS_H)
++    $(GGC_H) $(OBSTACK_H) $(PARAMS_H) $(CPPLIB_H) $(PARAMS_H) langhooks.h
+ tree-complex.o : tree-complex.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TREE_H) \
+     $(TM_H) $(RTL_H) $(REAL_H) $(FLAGS_H) $(TREE_FLOW_H) $(GIMPLE_H) \
+     tree-iterator.h $(TREE_PASS_H) tree-ssa-propagate.h $(DIAGNOSTIC_H)
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -13705,7 +13705,8 @@ arm_output_epilogue (rtx sibling)
+ 		  && !crtl->tail_call_emit)
+ 		{
+ 		  unsigned long mask;
+-		  mask = (1 << (arm_size_return_regs() / 4)) - 1;
++                  /* Preserve return values, of any size.  */
++		  mask = (1 << ((arm_size_return_regs() + 3) / 4)) - 1;
+ 		  mask ^= 0xf;
+ 		  mask &= ~saved_regs_mask;
+ 		  reg = 0;
+--- a/gcc/config/arm/linux-atomic.c
++++ b/gcc/config/arm/linux-atomic.c
+@@ -56,7 +56,7 @@ typedef void (__kernel_dmb_t) (void);
+ 									\
+     do {								\
+       tmp = *ptr;							\
+-      failure = __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
++      failure = __kernel_cmpxchg (tmp, PFX_OP (tmp INF_OP val), ptr);	\
+     } while (failure != 0);						\
+ 									\
+     return tmp;								\
+@@ -88,8 +88,8 @@ FETCH_AND_OP_WORD (nand, ~, &)
+ 									\
+     do {								\
+       oldval = *wordptr;						\
+-      newval = ((PFX_OP ((oldval & mask) >> shift)			\
+-                 INF_OP (unsigned int) val) << shift) & mask;		\
++      newval = ((PFX_OP (((oldval & mask) >> shift)			\
++			 INF_OP (unsigned int) val)) << shift) & mask;	\
+       newval |= oldval & ~mask;						\
+       failure = __kernel_cmpxchg (oldval, newval, wordptr);		\
+     } while (failure != 0);						\
+@@ -97,19 +97,19 @@ FETCH_AND_OP_WORD (nand, ~, &)
+     return (RETURN & mask) >> shift;					\
+   }
+ 
+-SUBWORD_SYNC_OP (add,   , +, short, 2, oldval)
+-SUBWORD_SYNC_OP (sub,   , -, short, 2, oldval)
+-SUBWORD_SYNC_OP (or,    , |, short, 2, oldval)
+-SUBWORD_SYNC_OP (and,   , &, short, 2, oldval)
+-SUBWORD_SYNC_OP (xor,   , ^, short, 2, oldval)
+-SUBWORD_SYNC_OP (nand, ~, &, short, 2, oldval)
++SUBWORD_SYNC_OP (add,   , +, unsigned short, 2, oldval)
++SUBWORD_SYNC_OP (sub,   , -, unsigned short, 2, oldval)
++SUBWORD_SYNC_OP (or,    , |, unsigned short, 2, oldval)
++SUBWORD_SYNC_OP (and,   , &, unsigned short, 2, oldval)
++SUBWORD_SYNC_OP (xor,   , ^, unsigned short, 2, oldval)
++SUBWORD_SYNC_OP (nand, ~, &, unsigned short, 2, oldval)
+ 
+-SUBWORD_SYNC_OP (add,   , +, char, 1, oldval)
+-SUBWORD_SYNC_OP (sub,   , -, char, 1, oldval)
+-SUBWORD_SYNC_OP (or,    , |, char, 1, oldval)
+-SUBWORD_SYNC_OP (and,   , &, char, 1, oldval)
+-SUBWORD_SYNC_OP (xor,   , ^, char, 1, oldval)
+-SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
++SUBWORD_SYNC_OP (add,   , +, unsigned char, 1, oldval)
++SUBWORD_SYNC_OP (sub,   , -, unsigned char, 1, oldval)
++SUBWORD_SYNC_OP (or,    , |, unsigned char, 1, oldval)
++SUBWORD_SYNC_OP (and,   , &, unsigned char, 1, oldval)
++SUBWORD_SYNC_OP (xor,   , ^, unsigned char, 1, oldval)
++SUBWORD_SYNC_OP (nand, ~, &, unsigned char, 1, oldval)
+ 
+ #define OP_AND_FETCH_WORD(OP, PFX_OP, INF_OP)				\
+   int HIDDEN								\
+@@ -119,10 +119,10 @@ SUBWORD_SYNC_OP (nand, ~, &, char, 1, oldval)
+ 									\
+     do {								\
+       tmp = *ptr;							\
+-      failure = __kernel_cmpxchg (tmp, PFX_OP tmp INF_OP val, ptr);	\
++      failure = __kernel_cmpxchg (tmp, PFX_OP (tmp INF_OP val), ptr);	\
+     } while (failure != 0);						\
+ 									\
+-    return PFX_OP tmp INF_OP val;					\
++    return PFX_OP (tmp INF_OP val);					\
+   }
+ 
+ OP_AND_FETCH_WORD (add,   , +)
+@@ -132,19 +132,19 @@ OP_AND_FETCH_WORD (and,   , &)
+ OP_AND_FETCH_WORD (xor,   , ^)
+ OP_AND_FETCH_WORD (nand, ~, &)
+ 
+-SUBWORD_SYNC_OP (add,   , +, short, 2, newval)
+-SUBWORD_SYNC_OP (sub,   , -, short, 2, newval)
+-SUBWORD_SYNC_OP (or,    , |, short, 2, newval)
+-SUBWORD_SYNC_OP (and,   , &, short, 2, newval)
+-SUBWORD_SYNC_OP (xor,   , ^, short, 2, newval)
+-SUBWORD_SYNC_OP (nand, ~, &, short, 2, newval)
++SUBWORD_SYNC_OP (add,   , +, unsigned short, 2, newval)
++SUBWORD_SYNC_OP (sub,   , -, unsigned short, 2, newval)
++SUBWORD_SYNC_OP (or,    , |, unsigned short, 2, newval)
++SUBWORD_SYNC_OP (and,   , &, unsigned short, 2, newval)
++SUBWORD_SYNC_OP (xor,   , ^, unsigned short, 2, newval)
++SUBWORD_SYNC_OP (nand, ~, &, unsigned short, 2, newval)
+ 
+-SUBWORD_SYNC_OP (add,   , +, char, 1, newval)
+-SUBWORD_SYNC_OP (sub,   , -, char, 1, newval)
+-SUBWORD_SYNC_OP (or,    , |, char, 1, newval)
+-SUBWORD_SYNC_OP (and,   , &, char, 1, newval)
+-SUBWORD_SYNC_OP (xor,   , ^, char, 1, newval)
+-SUBWORD_SYNC_OP (nand, ~, &, char, 1, newval)
++SUBWORD_SYNC_OP (add,   , +, unsigned char, 1, newval)
++SUBWORD_SYNC_OP (sub,   , -, unsigned char, 1, newval)
++SUBWORD_SYNC_OP (or,    , |, unsigned char, 1, newval)
++SUBWORD_SYNC_OP (and,   , &, unsigned char, 1, newval)
++SUBWORD_SYNC_OP (xor,   , ^, unsigned char, 1, newval)
++SUBWORD_SYNC_OP (nand, ~, &, unsigned char, 1, newval)
+ 
+ int HIDDEN
+ __sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
+@@ -194,8 +194,8 @@ __sync_val_compare_and_swap_4 (int *ptr, int oldval, int newval)
+       }									\
+   }
+ 
+-SUBWORD_VAL_CAS (short, 2)
+-SUBWORD_VAL_CAS (char,  1)
++SUBWORD_VAL_CAS (unsigned short, 2)
++SUBWORD_VAL_CAS (unsigned char,  1)
+ 
+ typedef unsigned char bool;
+ 
+@@ -216,8 +216,8 @@ __sync_bool_compare_and_swap_4 (int *ptr, int oldval, int newval)
+     return (oldval == actual_oldval);					\
+   }
+ 
+-SUBWORD_BOOL_CAS (short, 2)
+-SUBWORD_BOOL_CAS (char,  1)
++SUBWORD_BOOL_CAS (unsigned short, 2)
++SUBWORD_BOOL_CAS (unsigned char,  1)
+ 
+ void HIDDEN
+ __sync_synchronize (void)
+@@ -259,8 +259,8 @@ __sync_lock_test_and_set_4 (int *ptr, int val)
+     return (oldval & mask) >> shift;					\
+   }
+ 
+-SUBWORD_TEST_AND_SET (short, 2)
+-SUBWORD_TEST_AND_SET (char,  1)
++SUBWORD_TEST_AND_SET (unsigned short, 2)
++SUBWORD_TEST_AND_SET (unsigned char,  1)
+ 
+ #define SYNC_LOCK_RELEASE(TYPE, WIDTH)					\
+   void HIDDEN								\
+--- a/gcc/tree-switch-conversion.c
++++ b/gcc/tree-switch-conversion.c
+@@ -96,6 +96,7 @@ eight) times the number of the actual switch branches. */
+ #include "diagnostic.h"
+ #include "tree-dump.h"
+ #include "timevar.h"
++#include "langhooks.h"
+ 
+ /* The main structure of the pass.  */
+ struct switch_conv_info
+@@ -693,9 +694,11 @@ gen_inbound_check (gimple swtch)
+ 
+   /* Make sure we do not generate arithmetics in a subrange.  */
+   if (TREE_TYPE (TREE_TYPE (info.index_expr)))
+-    utype = unsigned_type_for (TREE_TYPE (TREE_TYPE (info.index_expr)));
++    utype = lang_hooks.types.type_for_mode
++      (TYPE_MODE (TREE_TYPE (TREE_TYPE (info.index_expr))), 1);
+   else
+-    utype = unsigned_type_for (TREE_TYPE (info.index_expr));
++    utype = lang_hooks.types.type_for_mode
++      (TYPE_MODE (TREE_TYPE (info.index_expr)), 1);
+ 
+   /* (end of) block 0 */
+   gsi = gsi_for_stmt (info.arr_ref_first);
diff --git a/toolchain/gcc/4.5.1/850-arm-pr44392.patch b/toolchain/gcc/4.5.1/850-arm-pr44392.patch
new file mode 100644
index 0000000..4ad6c44
--- /dev/null
+++ b/toolchain/gcc/4.5.1/850-arm-pr44392.patch
@@ -0,0 +1,70 @@
+>From d0557763b0713a4c006bd2405eede3924569cafd Mon Sep 17 00:00:00 2001
+From: Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>
+Date: Mon, 5 Jul 2010 11:28:49 +0100
+Subject: [PATCH 2/2] Fix PR44392
+
+---
+ gcc/config/arm/arm.md |   43 +++++++++++++++++++------------------------
+ 1 files changed, 19 insertions(+), 24 deletions(-)
+
+diff --git a/gcc/config/arm/arm.md b/gcc/config/arm/arm.md
+index 2096ec6..f0348f3 100644
+--- a/gcc/config/arm/arm.md
++++ b/gcc/config/arm/arm.md
+@@ -11318,34 +11318,29 @@
+ (define_expand "bswapsi2"
+   [(set (match_operand:SI 0 "s_register_operand" "=r")
+   	(bswap:SI (match_operand:SI 1 "s_register_operand" "r")))]
+-"TARGET_EITHER"
++"TARGET_EITHER && (arm_arch6 || !optimize_size)"
+ "
+-  if (!arm_arch6)
+-    {
+-      if (!optimize_size)
+-	{
+-	  rtx op2 = gen_reg_rtx (SImode);
+-	  rtx op3 = gen_reg_rtx (SImode);
++    if (!arm_arch6)
++      {
++	rtx op2 = gen_reg_rtx (SImode);
++	rtx op3 = gen_reg_rtx (SImode);
+ 
+-	  if (TARGET_THUMB)
+-	    {
+-	      rtx op4 = gen_reg_rtx (SImode);
+-	      rtx op5 = gen_reg_rtx (SImode);
++	if (TARGET_THUMB)
++	  {
++	    rtx op4 = gen_reg_rtx (SImode);
++	    rtx op5 = gen_reg_rtx (SImode);
+ 
+-	      emit_insn (gen_thumb_legacy_rev (operands[0], operands[1],
+-					       op2, op3, op4, op5));
+-	    }
+-	  else
+-	    {
+-	      emit_insn (gen_arm_legacy_rev (operands[0], operands[1],
+-					     op2, op3));
+-	    }
++	    emit_insn (gen_thumb_legacy_rev (operands[0], operands[1],
++					     op2, op3, op4, op5));
++	  }
++	else
++	  {
++	    emit_insn (gen_arm_legacy_rev (operands[0], operands[1],
++					   op2, op3));
++	  }
+ 
+-	  DONE;
+-	}
+-      else
+-	FAIL;
+-    }
++	DONE;
++      }
+   "
+ )
+ 
+-- 
+1.6.2
+
-- 
1.7.1
