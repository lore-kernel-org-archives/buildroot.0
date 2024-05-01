Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E71C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 18:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDF48401CB;
	Wed,  1 May 2024 18:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8qJV6rKOZP7; Wed,  1 May 2024 18:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C2DA4028F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C2DA4028F;
	Wed,  1 May 2024 18:10:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 217971BF429
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1A6F440158
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 18:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VEIIlCkyJSfd for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 18:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C665040156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C665040156
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C665040156
 for <buildroot@buildroot.org>; Wed,  1 May 2024 18:10:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4472F13F89C;
 Wed,  1 May 2024 20:10:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 01 May 2024 20:10:30 +0200
Date: Wed, 1 May 2024 20:10:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Message-ID: <ZjKFlhNML-qNmMxb@landeda>
References: <20240501092328.323236-1-dm.chestnykh@gmail.com>
 <20240501092328.323236-3-dm.chestnykh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501092328.323236-3-dm.chestnykh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714587032;
 bh=OIPwc0wk7IRu09gYZJXVI/mZ4bABJOswmgb33+xmnmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HkIRihbaAS0Q3WxyXhYRxRom0/g7j/0HXXXNzYTzrCFUsFgDwBjyvSflm1mFQTOYW
 fmnHO+dYipoizlDHlm1fVYG9MCfrOnsEkGuXY8+PVtesd3bmCA5IBAcP9lm2b6W08w
 harSN/oLQI8U0XmEuF1PBFwfiyuQVQ1kyRsyofAUh2RznrVAc51/nVxYUYij/+WPFH
 QLJoDEEjvWxL4SCQCQ+hA9DlVcsopi6ixmLg+2bDNu7Vbm+3XTU2MA55Y0TG/xD7+P
 QXPe1cEWaP1u66Y4nuTOmzVfZ8Tao4WmcDq9jt1+uW9RzkYk/r18sjimShaW1x5jCP
 R984QVU6b4wWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HkIRihba
Subject: Re: [Buildroot] [PATCH 3/3] package/gcc: Remove unneeded patch.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dmitry, All,

On 2024-05-01 12:23 +0300, Dmitry Chestnykh spake thusly:
> sparc systems work with uClibc-ng-1.0.48.

Right, but...

> Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
> ---
>  ...get-92095-internal-error-with-O1-mcp.patch | 322 ------------------
>  1 file changed, 322 deletions(-)
>  delete mode 100644 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch

gcc 8.4.0 is only ever used for PowerPC SPE:

    package/gcc/Config.in.host
    76 config BR2_GCC_VERSION
    77         string
    78         default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE

So gcc 8.4.0 can't be used for sparc, so any sparc-rleated patch there
is totally unused.

Which IMHO should be the actual reason for dropping it...

Regards,
Yann E. MORIN.

> diff --git a/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch b/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
> deleted file mode 100644
> index ec2bf8835d..0000000000
> --- a/package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch
> +++ /dev/null
> @@ -1,322 +0,0 @@
> -From bb9b71752267444b4360442b89129bfc0ae938d3 Mon Sep 17 00:00:00 2001
> -From: Romain Naour <romain.naour@gmail.com>
> -Date: Wed, 20 Jan 2021 23:06:07 +0100
> -Subject: [PATCH] Revert "re PR target/92095 (internal error with -O1
> - -mcpu=niagara2 -fPIE)"
> -
> -This reverts commit 3fcce773f0f914c0499b130c6e9efa0e45ee54a0.
> -
> -Building the Buildroot defconfig qemu_sparc_ss10_defconfig using
> -gcc 8.4, 9.3 and 10 produce a broken rootfs that trigger illegal
> -instruction messages.
> -
> -gcc 8.3, 9.2 are the latest working gcc version.
> -git bisect between gcc 8.4 and 8.4 allowed to identify
> -the commit that introcuce the regression.
> -
> -Reverting this patch allowed to produce a working rootfs.
> -
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> -Cc: Eric Botcazou <ebotcazou@gcc.gnu.org>
> ----
> - gcc/config/sparc/sparc-protos.h               |   1 -
> - gcc/config/sparc/sparc.c                      | 121 +++++++-----------
> - gcc/config/sparc/sparc.md                     |   5 +-
> - .../gcc.c-torture/compile/20191108-1.c        |  14 --
> - gcc/testsuite/gcc.target/sparc/overflow-3.c   |   2 +-
> - gcc/testsuite/gcc.target/sparc/overflow-4.c   |   2 +-
> - gcc/testsuite/gcc.target/sparc/overflow-5.c   |   2 +-
> - 7 files changed, 53 insertions(+), 94 deletions(-)
> - delete mode 100644 gcc/testsuite/gcc.c-torture/compile/20191108-1.c
> -
> -diff --git a/gcc/config/sparc/sparc-protos.h b/gcc/config/sparc/sparc-protos.h
> -index b3f73c2f2bf..71a067e871c 100644
> ---- a/gcc/config/sparc/sparc-protos.h
> -+++ b/gcc/config/sparc/sparc-protos.h
> -@@ -69,7 +69,6 @@ extern void sparc_split_reg_mem (rtx, rtx, machine_mode);
> - extern void sparc_split_mem_reg (rtx, rtx, machine_mode);
> - extern int sparc_split_reg_reg_legitimate (rtx, rtx);
> - extern void sparc_split_reg_reg (rtx, rtx, machine_mode);
> --extern const char *output_load_pcrel_sym (rtx *);
> - extern const char *output_ubranch (rtx, rtx_insn *);
> - extern const char *output_cbranch (rtx, rtx, int, int, int, rtx_insn *);
> - extern const char *output_return (rtx_insn *);
> -diff --git a/gcc/config/sparc/sparc.c b/gcc/config/sparc/sparc.c
> -index 73032d33596..db1b428db90 100644
> ---- a/gcc/config/sparc/sparc.c
> -+++ b/gcc/config/sparc/sparc.c
> -@@ -4200,6 +4200,13 @@ eligible_for_sibcall_delay (rtx_insn *trial)
> - static bool
> - sparc_cannot_force_const_mem (machine_mode mode, rtx x)
> - {
> -+  /* After IRA has run in PIC mode, it is too late to put anything into the
> -+     constant pool if the PIC register hasn't already been initialized.  */
> -+  if ((lra_in_progress || reload_in_progress)
> -+      && flag_pic
> -+      && !crtl->uses_pic_offset_table)
> -+    return true;
> -+
> -   switch (GET_CODE (x))
> -     {
> -     case CONST_INT:
> -@@ -4235,11 +4242,9 @@ sparc_cannot_force_const_mem (machine_mode mode, rtx x)
> - }
> - 
> - /* Global Offset Table support.  */
> --static GTY(()) rtx got_symbol_rtx = NULL_RTX;
> --static GTY(()) rtx got_register_rtx = NULL_RTX;
> - static GTY(()) rtx got_helper_rtx = NULL_RTX;
> --
> --static GTY(()) bool got_helper_needed = false;
> -+static GTY(()) rtx got_register_rtx = NULL_RTX;
> -+static GTY(()) rtx got_symbol_rtx = NULL_RTX;
> - 
> - /* Return the SYMBOL_REF for the Global Offset Table.  */
> - 
> -@@ -4252,6 +4257,27 @@ sparc_got (void)
> -   return got_symbol_rtx;
> - }
> - 
> -+#ifdef HAVE_GAS_HIDDEN
> -+# define USE_HIDDEN_LINKONCE 1
> -+#else
> -+# define USE_HIDDEN_LINKONCE 0
> -+#endif
> -+
> -+static void
> -+get_pc_thunk_name (char name[32], unsigned int regno)
> -+{
> -+  const char *reg_name = reg_names[regno];
> -+
> -+  /* Skip the leading '%' as that cannot be used in a
> -+     symbol name.  */
> -+  reg_name += 1;
> -+
> -+  if (USE_HIDDEN_LINKONCE)
> -+    sprintf (name, "__sparc_get_pc_thunk.%s", reg_name);
> -+  else
> -+    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC", regno);
> -+}
> -+
> - /* Wrapper around the load_pcrel_sym{si,di} patterns.  */
> - 
> - static rtx
> -@@ -4271,78 +4297,30 @@ gen_load_pcrel_sym (rtx op0, rtx op1, rtx op2)
> -   return insn;
> - }
> - 
> --/* Output the load_pcrel_sym{si,di} patterns.  */
> --
> --const char *
> --output_load_pcrel_sym (rtx *operands)
> --{
> --  if (flag_delayed_branch)
> --    {
> --      output_asm_insn ("sethi\t%%hi(%a1-4), %0", operands);
> --      output_asm_insn ("call\t%a2", operands);
> --      output_asm_insn (" add\t%0, %%lo(%a1+4), %0", operands);
> --    }
> --  else
> --    {
> --      output_asm_insn ("sethi\t%%hi(%a1-8), %0", operands);
> --      output_asm_insn ("add\t%0, %%lo(%a1-4), %0", operands);
> --      output_asm_insn ("call\t%a2", operands);
> --      output_asm_insn (" nop", NULL);
> --    }
> --
> --  if (operands[2] == got_helper_rtx)
> --    got_helper_needed = true;
> --
> --  return "";
> --}
> --
> --#ifdef HAVE_GAS_HIDDEN
> --# define USE_HIDDEN_LINKONCE 1
> --#else
> --# define USE_HIDDEN_LINKONCE 0
> --#endif
> --
> - /* Emit code to load the GOT register.  */
> - 
> - void
> - load_got_register (void)
> - {
> --  rtx insn;
> -+  if (!got_register_rtx)
> -+    got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
> - 
> -   if (TARGET_VXWORKS_RTP)
> --    {
> --      if (!got_register_rtx)
> --	got_register_rtx = pic_offset_table_rtx;
> --
> --      insn = gen_vxworks_load_got ();
> --    }
> -+    emit_insn (gen_vxworks_load_got ());
> -   else
> -     {
> --      if (!got_register_rtx)
> --	got_register_rtx = gen_rtx_REG (Pmode, GLOBAL_OFFSET_TABLE_REGNUM);
> --
> -       /* The GOT symbol is subject to a PC-relative relocation so we need a
> - 	 helper function to add the PC value and thus get the final value.  */
> -       if (!got_helper_rtx)
> - 	{
> - 	  char name[32];
> --
> --	  /* Skip the leading '%' as that cannot be used in a symbol name.  */
> --	  if (USE_HIDDEN_LINKONCE)
> --	    sprintf (name, "__sparc_get_pc_thunk.%s",
> --		     reg_names[REGNO (got_register_rtx)] + 1);
> --	  else
> --	    ASM_GENERATE_INTERNAL_LABEL (name, "LADDPC",
> --					 REGNO (got_register_rtx));
> --
> -+	  get_pc_thunk_name (name, GLOBAL_OFFSET_TABLE_REGNUM);
> - 	  got_helper_rtx = gen_rtx_SYMBOL_REF (Pmode, ggc_strdup (name));
> - 	}
> - 
> --      insn
> --	= gen_load_pcrel_sym (got_register_rtx, sparc_got (), got_helper_rtx);
> -+      emit_insn (gen_load_pcrel_sym (got_register_rtx, sparc_got (),
> -+				     got_helper_rtx));
> -     }
> --
> --  emit_insn (insn);
> - }
> - 
> - /* Ensure that we are not using patterns that are not OK with PIC.  */
> -@@ -5494,7 +5472,7 @@ save_local_or_in_reg_p (unsigned int regno, int leaf_function)
> -     return true;
> - 
> -   /* GOT register (%l7) if needed.  */
> --  if (got_register_rtx && regno == REGNO (got_register_rtx))
> -+  if (regno == GLOBAL_OFFSET_TABLE_REGNUM && got_register_rtx)
> -     return true;
> - 
> -   /* If the function accesses prior frames, the frame pointer and the return
> -@@ -12475,9 +12453,10 @@ static void
> - sparc_file_end (void)
> - {
> -   /* If we need to emit the special GOT helper function, do so now.  */
> --  if (got_helper_needed)
> -+  if (got_helper_rtx)
> -     {
> -       const char *name = XSTR (got_helper_rtx, 0);
> -+      const char *reg_name = reg_names[GLOBAL_OFFSET_TABLE_REGNUM];
> - #ifdef DWARF2_UNWIND_INFO
> -       bool do_cfi;
> - #endif
> -@@ -12514,22 +12493,17 @@ sparc_file_end (void)
> - #ifdef DWARF2_UNWIND_INFO
> -       do_cfi = dwarf2out_do_cfi_asm ();
> -       if (do_cfi)
> --	output_asm_insn (".cfi_startproc", NULL);
> -+	fprintf (asm_out_file, "\t.cfi_startproc\n");
> - #endif
> -       if (flag_delayed_branch)
> --	{
> --	  output_asm_insn ("jmp\t%%o7+8", NULL);
> --	  output_asm_insn (" add\t%%o7, %0, %0", &got_register_rtx);
> --	}
> -+	fprintf (asm_out_file, "\tjmp\t%%o7+8\n\t add\t%%o7, %s, %s\n",
> -+		 reg_name, reg_name);
> -       else
> --	{
> --	  output_asm_insn ("add\t%%o7, %0, %0", &got_register_rtx);
> --	  output_asm_insn ("jmp\t%%o7+8", NULL);
> --	  output_asm_insn (" nop", NULL);
> --	}
> -+	fprintf (asm_out_file, "\tadd\t%%o7, %s, %s\n\tjmp\t%%o7+8\n\t nop\n",
> -+		 reg_name, reg_name);
> - #ifdef DWARF2_UNWIND_INFO
> -       if (do_cfi)
> --	output_asm_insn (".cfi_endproc", NULL);
> -+	fprintf (asm_out_file, "\t.cfi_endproc\n");
> - #endif
> -     }
> - 
> -@@ -13035,10 +13009,7 @@ sparc_init_pic_reg (void)
> -   edge entry_edge;
> -   rtx_insn *seq;
> - 
> --  /* In PIC mode, we need to always initialize the PIC register if optimization
> --     is enabled, because we are called from IRA and LRA may later force things
> --     to the constant pool for optimization purposes.  */
> --  if (!flag_pic || (!crtl->uses_pic_offset_table && !optimize))
> -+  if (!crtl->uses_pic_offset_table)
> -     return;
> - 
> -   start_sequence ();
> -diff --git a/gcc/config/sparc/sparc.md b/gcc/config/sparc/sparc.md
> -index 468e2cc5d3b..25134bd1148 100644
> ---- a/gcc/config/sparc/sparc.md
> -+++ b/gcc/config/sparc/sparc.md
> -@@ -1601,7 +1601,10 @@
> -    (clobber (reg:P O7_REG))]
> -   "REGNO (operands[0]) == INTVAL (operands[3])"
> - {
> --  return output_load_pcrel_sym (operands);
> -+  if (flag_delayed_branch)
> -+    return "sethi\t%%hi(%a1-4), %0\n\tcall\t%a2\n\t add\t%0, %%lo(%a1+4), %0";
> -+  else
> -+    return "sethi\t%%hi(%a1-8), %0\n\tadd\t%0, %%lo(%a1-4), %0\n\tcall\t%a2\n\t nop";
> - }
> -   [(set (attr "type") (const_string "multi"))
> -    (set (attr "length")
> -diff --git a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c b/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
> -deleted file mode 100644
> -index 7929751bb06..00000000000
> ---- a/gcc/testsuite/gcc.c-torture/compile/20191108-1.c
> -+++ /dev/null
> -@@ -1,14 +0,0 @@
> --/* PR target/92095 */
> --/* Testcase by Sergei Trofimovich <slyfox@inbox.ru> */
> --
> --typedef union {
> --  double a;
> --  int b[2];
> --} c;
> --
> --double d(int e)
> --{
> --  c f;
> --  (&f)->b[0] = 15728640;
> --  return e ? -(&f)->a : (&f)->a;
> --}
> -diff --git a/gcc/testsuite/gcc.target/sparc/overflow-3.c b/gcc/testsuite/gcc.target/sparc/overflow-3.c
> -index 18253bb6e5e..8cb24f52f7b 100644
> ---- a/gcc/testsuite/gcc.target/sparc/overflow-3.c
> -+++ b/gcc/testsuite/gcc.target/sparc/overflow-3.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-O -fno-pie" } */
> -+/* { dg-options "-O" } */
> - /* { dg-require-effective-target lp64 } */
> - 
> - #include <stdbool.h>
> -diff --git a/gcc/testsuite/gcc.target/sparc/overflow-4.c b/gcc/testsuite/gcc.target/sparc/overflow-4.c
> -index fb30877efb9..868edea2b9e 100644
> ---- a/gcc/testsuite/gcc.target/sparc/overflow-4.c
> -+++ b/gcc/testsuite/gcc.target/sparc/overflow-4.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-O -fno-pie -mno-vis3" } */
> -+/* { dg-options "-O -mno-vis3" } */
> - /* { dg-require-effective-target lp64 } */
> - 
> - #include <stdbool.h>
> -diff --git a/gcc/testsuite/gcc.target/sparc/overflow-5.c b/gcc/testsuite/gcc.target/sparc/overflow-5.c
> -index 509d957715d..501ce04f7a1 100644
> ---- a/gcc/testsuite/gcc.target/sparc/overflow-5.c
> -+++ b/gcc/testsuite/gcc.target/sparc/overflow-5.c
> -@@ -1,5 +1,5 @@
> - /* { dg-do compile } */
> --/* { dg-options "-O -fno-pie -mvis3" } */
> -+/* { dg-options "-O -mvis3" } */
> - /* { dg-require-effective-target lp64 } */
> - 
> - #include <stdbool.h>
> --- 
> -2.25.4
> -
> -- 
> 2.44.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
