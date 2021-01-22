From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 09:21:49 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/gcc: fix gcc 8.4,
 9.3 and 10.2 for sparcv8 (ss10)
Message-ID: <20210122083927.AE05383B22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b6fd85eccf5d788b4f5b3a4a36db989331e92ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

As reported on IRC by sephthir, the qemu_sparc_ss10_defconfig doesn't
work as expected: the system generated when booted under Qemu produces
illegal instruction messages.

gcc 8.3, 9.2 are the latest working gcc version. git bisect between
gcc 8.3 and 8.4 allowed to identify the commit that introcuced the
regression.

Reverting this patch allowed to produce a working rootfs.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/786589934

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4d16e6f5324f0285f51bfbb5a3503584f3b3ad12)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...R-target-92095-internal-error-with-O1-mcp.patch | 325 +++++++++++++++++++++
 ...R-target-92095-internal-error-with-O1-mcp.patch | 322 ++++++++++++++++++++
 ...R-target-92095-internal-error-with-O1-mcp.patch | 325 +++++++++++++++++++++
 3 files changed, 972 insertions(+)

diff --git a/package/gcc/10.2.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/10.2.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
new file mode 100644
index 0000000000..6f11713c6b
--- /dev/null
+++ b/package/gcc/10.2.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
@@ -0,0 +1,325 @@
+From 472472ee0aaccb6389747d6281c34c558bcca7d8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 20 Jan 2021 23:26:29 +0100
+Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
+ -mcpu=niagara2 -fPIE)"
+
+This reverts commit 0a83f1a441d7aaadecb368c237b6ee70bd7b91d6.
+
+Building the Buildroot defconfig qemu_sparc_ss10_defconfig using
+gcc 8.4, 9.3 and 10 produce a broken rootfs that trigger illegal
+instruction messages.
+
+gcc 8.3, 9.2 are the latest working gcc version.
+git bisect between gcc 8.4 and 8.4 allowed to identify
+the commit that introcuce the regression.
+
+Reverting this patch allowed to produce a working rootfs.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Eric Botcazou <ebotcazou@gcc.gnu.org>
+---
+ gcc/config/sparc/sparc-protos.h               |   1 -
+ gcc/config/sparc/sparc.c                      | 121 +++++++-----------
+ gcc/config/sparc/sparc.md                     |   5 +-
+ .../gcc.c-torture/compile/20191108-1.c        |  14 --
+ gcc/testsuite/gcc.target/sparc/overflow-3.c   |   2 +-
+ gcc/testsuite/gcc.target/sparc/overflow-4.c   |   2 +-
+ gcc/testsuite/gcc.target/sparc/overflow-5.c   |   2 +-
+ 7 files changed, 53 insertions(+), 94 deletions(-)
+ delete mode 100644 gcc/testsuite/gcc.c-torture/compile/20191108-1.c
+
+diff --git a/gcc/config/sparc/sparc-protos.h b/gcc/config/sparc/sparc-protos.h
+index f525cd7a422..0d9f47af644 100644
+--- a/gcc/config/sparc/sparc-protos.h
++++ b/gcc/config/sparc/sparc-protos.h
+@@ -69,7 +69,6 @@ extern void sparc_split_reg_mem (rtx, rtx, machine_mode);
+ extern void sparc_split_mem_reg (rtx, rtx, machine_mode);
+ extern int sparc_split_reg_reg_legitimate (rtx, rtx);
+ extern void sparc_split_reg_reg (rtx, rtx, machine_mode);
+-extern const char *output_load_pcrel_sym (rtx *);
+ extern const char *output_ubranch (rtx, rtx_insn *);
+ extern const char *output_cbranch (rtx, rtx, int, int, int, rtx_insn *);
+ extern const char *output_return (rtx_insn *);
+diff --git a/gcc/config/sparc/sparc.c b/gcc/config/sparc/sparc.c
+index aefced85fe1..3ff6f9200f6 100644
+--- a/gcc/config/sparc/sparc.c
++++ b/gcc/config/sparc/sparc.c
+@@ -4192,6 +4192,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
+ static bool
+ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
+ {
++  /* After IRA has run in PIC mode, it is too late to put anything into the
++     constant pool if the PIC register hasn't already been initialized.  */
++  if ((lra_in_progress || reload_in_progress)
++      && flag_pic
++      && !crtl->uses_pic_offset_table)
++    return true;
++
+   switch (GET_CODE (x))
+     {
+     case CONST_INT:
+@@ -4227,11 +4234,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
+ }
+ 
+ /* Global Offset Table support.  */
+-static GTY(()) rtx got_symbol_rtx = NULL_RTX;
+-static GTY(()) rtx got_register_rtx = NULL_RTX;
+ static GTY(()) rtx got_helper_rtx = NULL_RTX;
+-
+-static GTY(()) bool got_helper_needed = false;
++static GTY(()) rtx got_register_rtx = NULL_RTX;
++static GTY(()) rtx got_symbol_rtx = NULL_RTX;
+ 
+ /* Return the SYMBOL_REF for the Global Offset Table.  */
+ 
+@@ -4244,6 +4249,27 @@ sparc_got (void)
+   return got_symbol_rtx;
+ }
+ 
++#ifdef HAVE_GAS_HIDDEN
++# define USE_HIDDEN_LINKONCE 1
++#else
++# define USE_HIDDEN_LINKONCE 0
++#endif
++
++static void
++get_pc_thunk_name (char name[32], unsigned int regno)
++{
++  const char *reg_name = reg_names[regno];
++
++  /* Skip the leading '%' as that cannot be used in a
++     symbol name.  */
++  reg_name += 1;
++
++  if (USE_HIDDEN_LINKONCE)
++    sprintf (name, "__sparc_get_pc_thunk.%s", reg_name);
++  else
++    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC", regno);
++}
++
+ /* Wrapper around the load_pcrel_sym{si,di} patterns.  */
+ 
+ static rtx
+@@ -4263,78 +4289,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
+   return insn;
+ }
+ 
+-/* Output the load_pcrel_sym{si,di} patterns.  */
+-
+-const char *
+-output_load_pcrel_sym (rtx *operands)
+-{
+-  if (flag_delayed_branch)
+-    {
+-      output_asm_insn ("sethi\t%%hi(%a1-4), %0", operands);
+-      output_asm_insn ("call\t%a2", operands);
+-      output_asm_insn (" add\t%0, %%lo(%a1+4), %0", operands);
+-    }
+-  else
+-    {
+-      output_asm_insn ("sethi\t%%hi(%a1-8), %0", operands);
+-      output_asm_insn ("add\t%0, %%lo(%a1-4), %0", operands);
+-      output_asm_insn ("call\t%a2", operands);
+-      output_asm_insn (" nop", NULL);
+-    }
+-
+-  if (operands[2] == got_helper_rtx)
+-    got_helper_needed = true;
+-
+-  return "";
+-}
+-
+-#ifdef HAVE_GAS_HIDDEN
+-# define USE_HIDDEN_LINKONCE 1
+-#else
+-# define USE_HIDDEN_LINKONCE 0
+-#endif
+-
+ /* Emit code to load the GOT register.  */
+ 
+ void
+ load_got_register (void)
+ {
+-  rtx insn;
++  if (!got_register_rtx)
++    got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
+ 
+   if (TARGET_VXWORKS_RTP)
+-    {
+-      if (!got_register_rtx)
+-	got_register_rtx = pic_offset_table_rtx;
+-
+-      insn = gen_vxworks_load_got ();
+-    }
++    emit_insn (gen_vxworks_load_got ());
+   else
+     {
+-      if (!got_register_rtx)
+-	got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
+-
+       /* The GOT symbol is subject to a PC-relative relocation so we need a
+ 	 helper function to add the PC value and thus get the final value.  */
+       if (!got_helper_rtx)
+ 	{
+ 	  char name[32];
+-
+-	  /* Skip the leading '%' as that cannot be used in a symbol name.  */
+-	  if (USE_HIDDEN_LINKONCE)
+-	    sprintf (name, "__sparc_get_pc_thunk.%s",
+-		     reg_names[REGNO (got_register_rtx)] + 1);
+-	  else
+-	    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC",
+-					 REGNO (got_register_rtx));
+-
++	  get_pc_thunk_name (name, GLOBAL_OFFSET_TABLE_REGNUM);
+ 	  got_helper_rtx = gen_rtx_SYMBOL_REF (Pmode, ggc_strdup (name));
+ 	}
+ 
+-      insn
+-	= gen_load_pcrel_sym (got_register_rtx, sparc_got (), got_helper_rtx);
++      emit_insn (gen_load_pcrel_sym (got_register_rtx, sparc_got (),
++				     got_helper_rtx));
+     }
+-
+-  emit_insn (insn);
+ }
+ 
+ /* Ensure that we are not using patterns that are not OK with PIC.  */
+@@ -5499,7 +5477,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
+     return true;
+ 
+   /* GOT register (%l7) if needed.  */
+-  if (got_register_rtx && regno == REGNO (got_register_rtx))
++  if (regno == GLOBAL_OFFSET_TABLE_REGNUM && got_register_rtx)
+     return true;
+ 
+   /* If the function accesses prior frames, the frame pointer and the return
+@@ -12542,9 +12520,10 @@ static void
+ sparc_file_end (void)
+ {
+   /* If we need to emit the special GOT helper function, do so now.  */
+-  if (got_helper_needed)
++  if (got_helper_rtx)
+     {
+       const char *name = XSTR (got_helper_rtx, 0);
++      const char *reg_name = reg_names[GLOBAL_OFFSET_TABLE_REGNUM];
+ #ifdef DWARF2_UNWIND_INFO
+       bool do_cfi;
+ #endif
+@@ -12581,22 +12560,17 @@ sparc_file_end (void)
+ #ifdef DWARF2_UNWIND_INFO
+       do_cfi = dwarf2out_do_cfi_asm ();
+       if (do_cfi)
+-	output_asm_insn (".cfi_startproc", NULL);
++	fprintf (asm_out_file, "\t.cfi_startproc\n");
+ #endif
+       if (flag_delayed_branch)
+-	{
+-	  output_asm_insn ("jmp\t%%o7+8", NULL);
+-	  output_asm_insn (" add\t%%o7, %0, %0", &got_register_rtx);
+-	}
++	fprintf (asm_out_file, "\tjmp\t%%o7+8\n\t add\t%%o7, %s, %s\n",
++		 reg_name, reg_name);
+       else
+-	{
+-	  output_asm_insn ("add\t%%o7, %0, %0", &got_register_rtx);
+-	  output_asm_insn ("jmp\t%%o7+8", NULL);
+-	  output_asm_insn (" nop", NULL);
+-	}
++	fprintf (asm_out_file, "\tadd\t%%o7, %s, %s\n\tjmp\t%%o7+8\n\t nop\n",
++		 reg_name, reg_name);
+ #ifdef DWARF2_UNWIND_INFO
+       if (do_cfi)
+-	output_asm_insn (".cfi_endproc", NULL);
++	fprintf (asm_out_file, "\t.cfi_endproc\n");
+ #endif
+     }
+ 
+@@ -13091,10 +13065,7 @@ sparc_init_pic_reg (void)
+   edge entry_edge;
+   rtx_insn *seq;
+ 
+-  /* In PIC mode, we need to always initialize the PIC register if optimization
+-     is enabled, because we are called from IRA and LRA may later force things
+-     to the constant pool for optimization purposes.  */
+-  if (!flag_pic || (!crtl->uses_pic_offset_table && !optimize))
++  if (!crtl->uses_pic_offset_table)
+     return;
+ 
+   start_sequence ();
+diff --git a/gcc/config/sparc/sparc.md b/gcc/config/sparc/sparc.md
+index 231c0d84778..899804b80ae 100644
+--- a/gcc/config/sparc/sparc.md
++++ b/gcc/config/sparc/sparc.md
+@@ -1604,7 +1604,10 @@
+    (clobber (reg:P O7_REG))]
+   "REGNO (operands[0]) == INTVAL (operands[3])"
+ {
+-  return output_load_pcrel_sym (operands);
++  if (flag_delayed_branch)
++    return "sethi\t%%hi(%a1-4), %0\n\tcall\t%a2\n\t add\t%0, %%lo(%a1+4), %0";
++  else
++    return "sethi\t%%hi(%a1-8), %0\n\tadd\t%0, %%lo(%a1-4), %0\n\tcall\t%a2\n\t nop";
+ }
+   [(set (attr "type") (const_string "multi"))
+    (set (attr "length")
+diff --git a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c b/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
+deleted file mode 100644
+index 7929751bb06..00000000000
+--- a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
++++ /dev/null
+@@ -1,14 +0,0 @@
+-/* PR target/92095 */
+-/* Testcase by Sergei Trofimovich <slyfox@inbox.ru> */
+-
+-typedef union {
+-  double a;
+-  int b[2];
+-} c;
+-
+-double d(int e)
+-{
+-  c f;
+-  (&f)->b[0] = 15728640;
+-  return e ? -(&f)->a : (&f)->a;
+-}
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-3.c b/gcc/testsuite/gcc.target/sparc/overflow-3.c
+index 52d6ab2b688..86dddfb09e6 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-3.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-3.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target lp64 } */
+-/* { dg-options "-O -fno-pie" } */
++/* { dg-options "-O" } */
+ 
+ #include <stdbool.h>
+ #include <stdint.h>
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-4.c b/gcc/testsuite/gcc.target/sparc/overflow-4.c
+index c6121b958c3..019feee335c 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-4.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-4.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target lp64 } */
+-/* { dg-options "-O -fno-pie -mno-vis3 -mno-vis4" } */
++/* { dg-options "-O -mno-vis3 -mno-vis4" } */
+ 
+ #include <stdbool.h>
+ #include <stdint.h>
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-5.c b/gcc/testsuite/gcc.target/sparc/overflow-5.c
+index f00283f6e7b..67d4ac38095 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-5.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-5.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target lp64 } */
+-/* { dg-options "-O -fno-pie -mvis3" } */
++/* { dg-options "-O -mvis3" } */
+ 
+ #include <stdbool.h>
+ #include <stdint.h>
+-- 
+2.25.4
+
diff --git a/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
new file mode 100644
index 0000000000..ec2bf8835d
--- /dev/null
+++ b/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
@@ -0,0 +1,322 @@
+From bb9b71752267444b4360442b89129bfc0ae938d3 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 20 Jan 2021 23:06:07 +0100
+Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
+ -mcpu=niagara2 -fPIE)"
+
+This reverts commit 3fcce773f0f914c0499b130c6e9efa0e45ee54a0.
+
+Building the Buildroot defconfig qemu_sparc_ss10_defconfig using
+gcc 8.4, 9.3 and 10 produce a broken rootfs that trigger illegal
+instruction messages.
+
+gcc 8.3, 9.2 are the latest working gcc version.
+git bisect between gcc 8.4 and 8.4 allowed to identify
+the commit that introcuce the regression.
+
+Reverting this patch allowed to produce a working rootfs.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Eric Botcazou <ebotcazou@gcc.gnu.org>
+---
+ gcc/config/sparc/sparc-protos.h               |   1 -
+ gcc/config/sparc/sparc.c                      | 121 +++++++-----------
+ gcc/config/sparc/sparc.md                     |   5 +-
+ .../gcc.c-torture/compile/20191108-1.c        |  14 --
+ gcc/testsuite/gcc.target/sparc/overflow-3.c   |   2 +-
+ gcc/testsuite/gcc.target/sparc/overflow-4.c   |   2 +-
+ gcc/testsuite/gcc.target/sparc/overflow-5.c   |   2 +-
+ 7 files changed, 53 insertions(+), 94 deletions(-)
+ delete mode 100644 gcc/testsuite/gcc.c-torture/compile/20191108-1.c
+
+diff --git a/gcc/config/sparc/sparc-protos.h b/gcc/config/sparc/sparc-protos.h
+index b3f73c2f2bf..71a067e871c 100644
+--- a/gcc/config/sparc/sparc-protos.h
++++ b/gcc/config/sparc/sparc-protos.h
+@@ -69,7 +69,6 @@ extern void sparc_split_reg_mem (rtx, rtx, machine_mode);
+ extern void sparc_split_mem_reg (rtx, rtx, machine_mode);
+ extern int sparc_split_reg_reg_legitimate (rtx, rtx);
+ extern void sparc_split_reg_reg (rtx, rtx, machine_mode);
+-extern const char *output_load_pcrel_sym (rtx *);
+ extern const char *output_ubranch (rtx, rtx_insn *);
+ extern const char *output_cbranch (rtx, rtx, int, int, int, rtx_insn *);
+ extern const char *output_return (rtx_insn *);
+diff --git a/gcc/config/sparc/sparc.c b/gcc/config/sparc/sparc.c
+index 73032d33596..db1b428db90 100644
+--- a/gcc/config/sparc/sparc.c
++++ b/gcc/config/sparc/sparc.c
+@@ -4200,6 +4200,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
+ static bool
+ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
+ {
++  /* After IRA has run in PIC mode, it is too late to put anything into the
++     constant pool if the PIC register hasn't already been initialized.  */
++  if ((lra_in_progress || reload_in_progress)
++      && flag_pic
++      && !crtl->uses_pic_offset_table)
++    return true;
++
+   switch (GET_CODE (x))
+     {
+     case CONST_INT:
+@@ -4235,11 +4242,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
+ }
+ 
+ /* Global Offset Table support.  */
+-static GTY(()) rtx got_symbol_rtx = NULL_RTX;
+-static GTY(()) rtx got_register_rtx = NULL_RTX;
+ static GTY(()) rtx got_helper_rtx = NULL_RTX;
+-
+-static GTY(()) bool got_helper_needed = false;
++static GTY(()) rtx got_register_rtx = NULL_RTX;
++static GTY(()) rtx got_symbol_rtx = NULL_RTX;
+ 
+ /* Return the SYMBOL_REF for the Global Offset Table.  */
+ 
+@@ -4252,6 +4257,27 @@ sparc_got (void)
+   return got_symbol_rtx;
+ }
+ 
++#ifdef HAVE_GAS_HIDDEN
++# define USE_HIDDEN_LINKONCE 1
++#else
++# define USE_HIDDEN_LINKONCE 0
++#endif
++
++static void
++get_pc_thunk_name (char name[32], unsigned int regno)
++{
++  const char *reg_name = reg_names[regno];
++
++  /* Skip the leading '%' as that cannot be used in a
++     symbol name.  */
++  reg_name += 1;
++
++  if (USE_HIDDEN_LINKONCE)
++    sprintf (name, "__sparc_get_pc_thunk.%s", reg_name);
++  else
++    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC", regno);
++}
++
+ /* Wrapper around the load_pcrel_sym{si,di} patterns.  */
+ 
+ static rtx
+@@ -4271,78 +4297,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
+   return insn;
+ }
+ 
+-/* Output the load_pcrel_sym{si,di} patterns.  */
+-
+-const char *
+-output_load_pcrel_sym (rtx *operands)
+-{
+-  if (flag_delayed_branch)
+-    {
+-      output_asm_insn ("sethi\t%%hi(%a1-4), %0", operands);
+-      output_asm_insn ("call\t%a2", operands);
+-      output_asm_insn (" add\t%0, %%lo(%a1+4), %0", operands);
+-    }
+-  else
+-    {
+-      output_asm_insn ("sethi\t%%hi(%a1-8), %0", operands);
+-      output_asm_insn ("add\t%0, %%lo(%a1-4), %0", operands);
+-      output_asm_insn ("call\t%a2", operands);
+-      output_asm_insn (" nop", NULL);
+-    }
+-
+-  if (operands[2] == got_helper_rtx)
+-    got_helper_needed = true;
+-
+-  return "";
+-}
+-
+-#ifdef HAVE_GAS_HIDDEN
+-# define USE_HIDDEN_LINKONCE 1
+-#else
+-# define USE_HIDDEN_LINKONCE 0
+-#endif
+-
+ /* Emit code to load the GOT register.  */
+ 
+ void
+ load_got_register (void)
+ {
+-  rtx insn;
++  if (!got_register_rtx)
++    got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
+ 
+   if (TARGET_VXWORKS_RTP)
+-    {
+-      if (!got_register_rtx)
+-	got_register_rtx = pic_offset_table_rtx;
+-
+-      insn = gen_vxworks_load_got ();
+-    }
++    emit_insn (gen_vxworks_load_got ());
+   else
+     {
+-      if (!got_register_rtx)
+-	got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
+-
+       /* The GOT symbol is subject to a PC-relative relocation so we need a
+ 	 helper function to add the PC value and thus get the final value.  */
+       if (!got_helper_rtx)
+ 	{
+ 	  char name[32];
+-
+-	  /* Skip the leading '%' as that cannot be used in a symbol name.  */
+-	  if (USE_HIDDEN_LINKONCE)
+-	    sprintf (name, "__sparc_get_pc_thunk.%s",
+-		     reg_names[REGNO (got_register_rtx)] + 1);
+-	  else
+-	    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC",
+-					 REGNO (got_register_rtx));
+-
++	  get_pc_thunk_name (name, GLOBAL_OFFSET_TABLE_REGNUM);
+ 	  got_helper_rtx = gen_rtx_SYMBOL_REF (Pmode, ggc_strdup (name));
+ 	}
+ 
+-      insn
+-	= gen_load_pcrel_sym (got_register_rtx, sparc_got (), got_helper_rtx);
++      emit_insn (gen_load_pcrel_sym (got_register_rtx, sparc_got (),
++				     got_helper_rtx));
+     }
+-
+-  emit_insn (insn);
+ }
+ 
+ /* Ensure that we are not using patterns that are not OK with PIC.  */
+@@ -5494,7 +5472,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
+     return true;
+ 
+   /* GOT register (%l7) if needed.  */
+-  if (got_register_rtx && regno == REGNO (got_register_rtx))
++  if (regno == GLOBAL_OFFSET_TABLE_REGNUM && got_register_rtx)
+     return true;
+ 
+   /* If the function accesses prior frames, the frame pointer and the return
+@@ -12475,9 +12453,10 @@ static void
+ sparc_file_end (void)
+ {
+   /* If we need to emit the special GOT helper function, do so now.  */
+-  if (got_helper_needed)
++  if (got_helper_rtx)
+     {
+       const char *name = XSTR (got_helper_rtx, 0);
++      const char *reg_name = reg_names[GLOBAL_OFFSET_TABLE_REGNUM];
+ #ifdef DWARF2_UNWIND_INFO
+       bool do_cfi;
+ #endif
+@@ -12514,22 +12493,17 @@ sparc_file_end (void)
+ #ifdef DWARF2_UNWIND_INFO
+       do_cfi = dwarf2out_do_cfi_asm ();
+       if (do_cfi)
+-	output_asm_insn (".cfi_startproc", NULL);
++	fprintf (asm_out_file, "\t.cfi_startproc\n");
+ #endif
+       if (flag_delayed_branch)
+-	{
+-	  output_asm_insn ("jmp\t%%o7+8", NULL);
+-	  output_asm_insn (" add\t%%o7, %0, %0", &got_register_rtx);
+-	}
++	fprintf (asm_out_file, "\tjmp\t%%o7+8\n\t add\t%%o7, %s, %s\n",
++		 reg_name, reg_name);
+       else
+-	{
+-	  output_asm_insn ("add\t%%o7, %0, %0", &got_register_rtx);
+-	  output_asm_insn ("jmp\t%%o7+8", NULL);
+-	  output_asm_insn (" nop", NULL);
+-	}
++	fprintf (asm_out_file, "\tadd\t%%o7, %s, %s\n\tjmp\t%%o7+8\n\t nop\n",
++		 reg_name, reg_name);
+ #ifdef DWARF2_UNWIND_INFO
+       if (do_cfi)
+-	output_asm_insn (".cfi_endproc", NULL);
++	fprintf (asm_out_file, "\t.cfi_endproc\n");
+ #endif
+     }
+ 
+@@ -13035,10 +13009,7 @@ sparc_init_pic_reg (void)
+   edge entry_edge;
+   rtx_insn *seq;
+ 
+-  /* In PIC mode, we need to always initialize the PIC register if optimization
+-     is enabled, because we are called from IRA and LRA may later force things
+-     to the constant pool for optimization purposes.  */
+-  if (!flag_pic || (!crtl->uses_pic_offset_table && !optimize))
++  if (!crtl->uses_pic_offset_table)
+     return;
+ 
+   start_sequence ();
+diff --git a/gcc/config/sparc/sparc.md b/gcc/config/sparc/sparc.md
+index 468e2cc5d3b..25134bd1148 100644
+--- a/gcc/config/sparc/sparc.md
++++ b/gcc/config/sparc/sparc.md
+@@ -1601,7 +1601,10 @@
+    (clobber (reg:P O7_REG))]
+   "REGNO (operands[0]) == INTVAL (operands[3])"
+ {
+-  return output_load_pcrel_sym (operands);
++  if (flag_delayed_branch)
++    return "sethi\t%%hi(%a1-4), %0\n\tcall\t%a2\n\t add\t%0, %%lo(%a1+4), %0";
++  else
++    return "sethi\t%%hi(%a1-8), %0\n\tadd\t%0, %%lo(%a1-4), %0\n\tcall\t%a2\n\t nop";
+ }
+   [(set (attr "type") (const_string "multi"))
+    (set (attr "length")
+diff --git a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c b/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
+deleted file mode 100644
+index 7929751bb06..00000000000
+--- a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
++++ /dev/null
+@@ -1,14 +0,0 @@
+-/* PR target/92095 */
+-/* Testcase by Sergei Trofimovich <slyfox@inbox.ru> */
+-
+-typedef union {
+-  double a;
+-  int b[2];
+-} c;
+-
+-double d(int e)
+-{
+-  c f;
+-  (&f)->b[0] = 15728640;
+-  return e ? -(&f)->a : (&f)->a;
+-}
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-3.c b/gcc/testsuite/gcc.target/sparc/overflow-3.c
+index 18253bb6e5e..8cb24f52f7b 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-3.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-3.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O -fno-pie" } */
++/* { dg-options "-O" } */
+ /* { dg-require-effective-target lp64 } */
+ 
+ #include <stdbool.h>
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-4.c b/gcc/testsuite/gcc.target/sparc/overflow-4.c
+index fb30877efb9..868edea2b9e 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-4.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-4.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O -fno-pie -mno-vis3" } */
++/* { dg-options "-O -mno-vis3" } */
+ /* { dg-require-effective-target lp64 } */
+ 
+ #include <stdbool.h>
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-5.c b/gcc/testsuite/gcc.target/sparc/overflow-5.c
+index 509d957715d..501ce04f7a1 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-5.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-5.c
+@@ -1,5 +1,5 @@
+ /* { dg-do compile } */
+-/* { dg-options "-O -fno-pie -mvis3" } */
++/* { dg-options "-O -mvis3" } */
+ /* { dg-require-effective-target lp64 } */
+ 
+ #include <stdbool.h>
+-- 
+2.25.4
+
diff --git a/package/gcc/9.3.0/0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/9.3.0/0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
new file mode 100644
index 0000000000..8ed281e981
--- /dev/null
+++ b/package/gcc/9.3.0/0005-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
@@ -0,0 +1,325 @@
+From 0d7fe4806d9dce76367c193d5199df6a2b98009f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Wed, 20 Jan 2021 23:22:16 +0100
+Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
+ -mcpu=niagara2 -fPIE)"
+
+This reverts commit 6bf2990842388101897b6f465524cbc295ee8cf9.
+
+Building the Buildroot defconfig qemu_sparc_ss10_defconfig using
+gcc 8.4, 9.3 and 10 produce a broken rootfs that trigger illegal
+instruction messages.
+
+gcc 8.3, 9.2 are the latest working gcc version.
+git bisect between gcc 8.4 and 8.4 allowed to identify
+the commit that introcuce the regression.
+
+Reverting this patch allowed to produce a working rootfs.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Cc: Eric Botcazou <ebotcazou@gcc.gnu.org>
+---
+ gcc/config/sparc/sparc-protos.h               |   1 -
+ gcc/config/sparc/sparc.c                      | 121 +++++++-----------
+ gcc/config/sparc/sparc.md                     |   5 +-
+ .../gcc.c-torture/compile/20191108-1.c        |  14 --
+ gcc/testsuite/gcc.target/sparc/overflow-3.c   |   2 +-
+ gcc/testsuite/gcc.target/sparc/overflow-4.c   |   2 +-
+ gcc/testsuite/gcc.target/sparc/overflow-5.c   |   2 +-
+ 7 files changed, 53 insertions(+), 94 deletions(-)
+ delete mode 100644 gcc/testsuite/gcc.c-torture/compile/20191108-1.c
+
+diff --git a/gcc/config/sparc/sparc-protos.h b/gcc/config/sparc/sparc-protos.h
+index ef1adb69ede..9bdae7b9faa 100644
+--- a/gcc/config/sparc/sparc-protos.h
++++ b/gcc/config/sparc/sparc-protos.h
+@@ -69,7 +69,6 @@ extern void sparc_split_reg_mem (rtx, rtx, machine_mode);
+ extern void sparc_split_mem_reg (rtx, rtx, machine_mode);
+ extern int sparc_split_reg_reg_legitimate (rtx, rtx);
+ extern void sparc_split_reg_reg (rtx, rtx, machine_mode);
+-extern const char *output_load_pcrel_sym (rtx *);
+ extern const char *output_ubranch (rtx, rtx_insn *);
+ extern const char *output_cbranch (rtx, rtx, int, int, int, rtx_insn *);
+ extern const char *output_return (rtx_insn *);
+diff --git a/gcc/config/sparc/sparc.c b/gcc/config/sparc/sparc.c
+index a993aab7639..2974d174e93 100644
+--- a/gcc/config/sparc/sparc.c
++++ b/gcc/config/sparc/sparc.c
+@@ -4205,6 +4205,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
+ static bool
+ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
+ {
++  /* After IRA has run in PIC mode, it is too late to put anything into the
++     constant pool if the PIC register hasn't already been initialized.  */
++  if ((lra_in_progress || reload_in_progress)
++      && flag_pic
++      && !crtl->uses_pic_offset_table)
++    return true;
++
+   switch (GET_CODE (x))
+     {
+     case CONST_INT:
+@@ -4240,11 +4247,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
+ }
+ 
+ /* Global Offset Table support.  */
+-static GTY(()) rtx got_symbol_rtx = NULL_RTX;
+-static GTY(()) rtx got_register_rtx = NULL_RTX;
+ static GTY(()) rtx got_helper_rtx = NULL_RTX;
+-
+-static GTY(()) bool got_helper_needed = false;
++static GTY(()) rtx got_register_rtx = NULL_RTX;
++static GTY(()) rtx got_symbol_rtx = NULL_RTX;
+ 
+ /* Return the SYMBOL_REF for the Global Offset Table.  */
+ 
+@@ -4257,6 +4262,27 @@ sparc_got (void)
+   return got_symbol_rtx;
+ }
+ 
++#ifdef HAVE_GAS_HIDDEN
++# define USE_HIDDEN_LINKONCE 1
++#else
++# define USE_HIDDEN_LINKONCE 0
++#endif
++
++static void
++get_pc_thunk_name (char name[32], unsigned int regno)
++{
++  const char *reg_name = reg_names[regno];
++
++  /* Skip the leading '%' as that cannot be used in a
++     symbol name.  */
++  reg_name += 1;
++
++  if (USE_HIDDEN_LINKONCE)
++    sprintf (name, "__sparc_get_pc_thunk.%s", reg_name);
++  else
++    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC", regno);
++}
++
+ /* Wrapper around the load_pcrel_sym{si,di} patterns.  */
+ 
+ static rtx
+@@ -4276,78 +4302,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
+   return insn;
+ }
+ 
+-/* Output the load_pcrel_sym{si,di} patterns.  */
+-
+-const char *
+-output_load_pcrel_sym (rtx *operands)
+-{
+-  if (flag_delayed_branch)
+-    {
+-      output_asm_insn ("sethi\t%%hi(%a1-4), %0", operands);
+-      output_asm_insn ("call\t%a2", operands);
+-      output_asm_insn (" add\t%0, %%lo(%a1+4), %0", operands);
+-    }
+-  else
+-    {
+-      output_asm_insn ("sethi\t%%hi(%a1-8), %0", operands);
+-      output_asm_insn ("add\t%0, %%lo(%a1-4), %0", operands);
+-      output_asm_insn ("call\t%a2", operands);
+-      output_asm_insn (" nop", NULL);
+-    }
+-
+-  if (operands[2] == got_helper_rtx)
+-    got_helper_needed = true;
+-
+-  return "";
+-}
+-
+-#ifdef HAVE_GAS_HIDDEN
+-# define USE_HIDDEN_LINKONCE 1
+-#else
+-# define USE_HIDDEN_LINKONCE 0
+-#endif
+-
+ /* Emit code to load the GOT register.  */
+ 
+ void
+ load_got_register (void)
+ {
+-  rtx insn;
++  if (!got_register_rtx)
++    got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
+ 
+   if (TARGET_VXWORKS_RTP)
+-    {
+-      if (!got_register_rtx)
+-	got_register_rtx = pic_offset_table_rtx;
+-
+-      insn = gen_vxworks_load_got ();
+-    }
++    emit_insn (gen_vxworks_load_got ());
+   else
+     {
+-      if (!got_register_rtx)
+-	got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
+-
+       /* The GOT symbol is subject to a PC-relative relocation so we need a
+ 	 helper function to add the PC value and thus get the final value.  */
+       if (!got_helper_rtx)
+ 	{
+ 	  char name[32];
+-
+-	  /* Skip the leading '%' as that cannot be used in a symbol name.  */
+-	  if (USE_HIDDEN_LINKONCE)
+-	    sprintf (name, "__sparc_get_pc_thunk.%s",
+-		     reg_names[REGNO (got_register_rtx)] + 1);
+-	  else
+-	    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC",
+-					 REGNO (got_register_rtx));
+-
++	  get_pc_thunk_name (name, GLOBAL_OFFSET_TABLE_REGNUM);
+ 	  got_helper_rtx = gen_rtx_SYMBOL_REF (Pmode, ggc_strdup (name));
+ 	}
+ 
+-      insn
+-	= gen_load_pcrel_sym (got_register_rtx, sparc_got (), got_helper_rtx);
++      emit_insn (gen_load_pcrel_sym (got_register_rtx, sparc_got (),
++				     got_helper_rtx));
+     }
+-
+-  emit_insn (insn);
+ }
+ 
+ /* Ensure that we are not using patterns that are not OK with PIC.  */
+@@ -5512,7 +5490,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
+     return true;
+ 
+   /* GOT register (%l7) if needed.  */
+-  if (got_register_rtx && regno == REGNO (got_register_rtx))
++  if (regno == GLOBAL_OFFSET_TABLE_REGNUM && got_register_rtx)
+     return true;
+ 
+   /* If the function accesses prior frames, the frame pointer and the return
+@@ -12555,9 +12533,10 @@ static void
+ sparc_file_end (void)
+ {
+   /* If we need to emit the special GOT helper function, do so now.  */
+-  if (got_helper_needed)
++  if (got_helper_rtx)
+     {
+       const char *name = XSTR (got_helper_rtx, 0);
++      const char *reg_name = reg_names[GLOBAL_OFFSET_TABLE_REGNUM];
+ #ifdef DWARF2_UNWIND_INFO
+       bool do_cfi;
+ #endif
+@@ -12594,22 +12573,17 @@ sparc_file_end (void)
+ #ifdef DWARF2_UNWIND_INFO
+       do_cfi = dwarf2out_do_cfi_asm ();
+       if (do_cfi)
+-	output_asm_insn (".cfi_startproc", NULL);
++	fprintf (asm_out_file, "\t.cfi_startproc\n");
+ #endif
+       if (flag_delayed_branch)
+-	{
+-	  output_asm_insn ("jmp\t%%o7+8", NULL);
+-	  output_asm_insn (" add\t%%o7, %0, %0", &got_register_rtx);
+-	}
++	fprintf (asm_out_file, "\tjmp\t%%o7+8\n\t add\t%%o7, %s, %s\n",
++		 reg_name, reg_name);
+       else
+-	{
+-	  output_asm_insn ("add\t%%o7, %0, %0", &got_register_rtx);
+-	  output_asm_insn ("jmp\t%%o7+8", NULL);
+-	  output_asm_insn (" nop", NULL);
+-	}
++	fprintf (asm_out_file, "\tadd\t%%o7, %s, %s\n\tjmp\t%%o7+8\n\t nop\n",
++		 reg_name, reg_name);
+ #ifdef DWARF2_UNWIND_INFO
+       if (do_cfi)
+-	output_asm_insn (".cfi_endproc", NULL);
++	fprintf (asm_out_file, "\t.cfi_endproc\n");
+ #endif
+     }
+ 
+@@ -13115,10 +13089,7 @@ sparc_init_pic_reg (void)
+   edge entry_edge;
+   rtx_insn *seq;
+ 
+-  /* In PIC mode, we need to always initialize the PIC register if optimization
+-     is enabled, because we are called from IRA and LRA may later force things
+-     to the constant pool for optimization purposes.  */
+-  if (!flag_pic || (!crtl->uses_pic_offset_table && !optimize))
++  if (!crtl->uses_pic_offset_table)
+     return;
+ 
+   start_sequence ();
+diff --git a/gcc/config/sparc/sparc.md b/gcc/config/sparc/sparc.md
+index 0a6e27ffa83..7af62d599b9 100644
+--- a/gcc/config/sparc/sparc.md
++++ b/gcc/config/sparc/sparc.md
+@@ -1604,7 +1604,10 @@
+    (clobber (reg:P O7_REG))]
+   "REGNO (operands[0]) == INTVAL (operands[3])"
+ {
+-  return output_load_pcrel_sym (operands);
++  if (flag_delayed_branch)
++    return "sethi\t%%hi(%a1-4), %0\n\tcall\t%a2\n\t add\t%0, %%lo(%a1+4), %0";
++  else
++    return "sethi\t%%hi(%a1-8), %0\n\tadd\t%0, %%lo(%a1-4), %0\n\tcall\t%a2\n\t nop";
+ }
+   [(set (attr "type") (const_string "multi"))
+    (set (attr "length")
+diff --git a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c b/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
+deleted file mode 100644
+index 7929751bb06..00000000000
+--- a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
++++ /dev/null
+@@ -1,14 +0,0 @@
+-/* PR target/92095 */
+-/* Testcase by Sergei Trofimovich <slyfox@inbox.ru> */
+-
+-typedef union {
+-  double a;
+-  int b[2];
+-} c;
+-
+-double d(int e)
+-{
+-  c f;
+-  (&f)->b[0] = 15728640;
+-  return e ? -(&f)->a : (&f)->a;
+-}
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-3.c b/gcc/testsuite/gcc.target/sparc/overflow-3.c
+index 52d6ab2b688..86dddfb09e6 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-3.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-3.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target lp64 } */
+-/* { dg-options "-O -fno-pie" } */
++/* { dg-options "-O" } */
+ 
+ #include <stdbool.h>
+ #include <stdint.h>
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-4.c b/gcc/testsuite/gcc.target/sparc/overflow-4.c
+index c6121b958c3..019feee335c 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-4.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-4.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target lp64 } */
+-/* { dg-options "-O -fno-pie -mno-vis3 -mno-vis4" } */
++/* { dg-options "-O -mno-vis3 -mno-vis4" } */
+ 
+ #include <stdbool.h>
+ #include <stdint.h>
+diff --git a/gcc/testsuite/gcc.target/sparc/overflow-5.c b/gcc/testsuite/gcc.target/sparc/overflow-5.c
+index f00283f6e7b..67d4ac38095 100644
+--- a/gcc/testsuite/gcc.target/sparc/overflow-5.c
++++ b/gcc/testsuite/gcc.target/sparc/overflow-5.c
+@@ -1,6 +1,6 @@
+ /* { dg-do compile } */
+ /* { dg-require-effective-target lp64 } */
+-/* { dg-options "-O -fno-pie -mvis3" } */
++/* { dg-options "-O -mvis3" } */
+ 
+ #include <stdbool.h>
+ #include <stdint.h>
+-- 
+2.25.4
+
