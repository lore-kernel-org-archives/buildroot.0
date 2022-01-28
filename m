Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E913C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 08:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3CE54031F;
	Fri, 28 Jan 2022 08:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AP-NGSt0oJu; Fri, 28 Jan 2022 08:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 731FB40328;
	Fri, 28 Jan 2022 08:42:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D86661BF867
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 08:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6A6B84D5F
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 08:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebxiaA6w6tV1 for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 08:42:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7495484D62
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 08:42:51 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q127so8026346ljq.2
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 00:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=9TQEUWIZPRqwgmcYXMzj/16Gx6bpn2tim9G4yHP2lYk=;
 b=IzvIIYZdy/t27hoW8BkzJ8Xqh+/k6izQBhOmFq/24xMxpYE3nsOOXBCNiE/6jq23W0
 0Tu3j3b0x50rhQdJQgbgmaUE8pkSMDmG+m9g4c4ZxIhimTPa0IAXqgx7CWm14nw2w/DE
 iHnGMNOWddjZPEUJNPnt2f8QQLE2WYrC0jhS9o2/sNVis71dESTPo3EEvoKzFeqEdN95
 0UNhRjKIsc7QK9jZ89fj1x0nxDzHOpnLz34Gn3qYFl79SiRj1qOzo9QkFBgbB9ETzcOf
 VZvSuaIQkYz8h1uS3NSZpNSvttwH2QR+3+I/eD3FJS57c7+EhWiHwv4+eBBkDc8hL2GT
 gO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=9TQEUWIZPRqwgmcYXMzj/16Gx6bpn2tim9G4yHP2lYk=;
 b=rb+/ATpTWQj+PgwUNd4cW4IKJSDxR7hwJZC4ejm1HsgzSU8eCptyCSAufgd80rR/Tt
 oaBmQUBarmSyuGGTpZKM9t7Jv/Rp/tMKepbz7C+ohZoQvtNTd9l5bPpRrAycbYdSEvB1
 0twZdIyeTRAjCNfv/ZthIFJKdOkWATxOofqjc71HiD0rVRC5HklTcNgkOZi+hm+RTHm/
 1rN8BBRybKB6H97+t+IE0yt9UFsbHTbOA9JChnAWElSMhJQcM8xVN0qqC51r73oFbAM0
 aVRDaHeiNMvgb4YXV2nrVFub+xDlht9V1iUZ5lTU+2rpxmNeV8dOMiiJBqC/C9JhyMch
 lQlA==
X-Gm-Message-State: AOAM5339AsWY5mMistVZq7FWthZMaV6J5M27TnY8dtEcSZhhhgGt3egP
 TVsfJZl7pQ5qyuO70REJyC6RRM+9oEY=
X-Google-Smtp-Source: ABdhPJyRbyrHh9Rtwse2cqv3jvEt0MQavUGzdtCn+BL/tRTW+8H2TBlESvvAk7Ox/ryalwW+4rZ8fg==
X-Received: by 2002:a2e:80d2:: with SMTP id r18mr718821ljg.474.1643359368697; 
 Fri, 28 Jan 2022 00:42:48 -0800 (PST)
Received: from wbg.labs.westermo.se (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id o8sm2452647lft.135.2022.01.28.00.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 00:42:47 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 09:42:44 +0100
Message-Id: <20220128084244.2258811-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Subject: [Buildroot] [PATCH 1/1] package/gdb: backport fix for gdbserver
 11.1 on aarch64
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backported from upstream GDB geb79b23, with ChangeLogs stripped so the
patch applies properly on Buildroot.

    https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=eb79b23

Fixes the following issue:

    # gdbserver /dev/hvc1 inadyn -n -l debug
    Process inadyn created; pid = 675
    Remote debugging using /dev/hvc1
    ../../gdbserver/regcache.cc:257: A problem internal to GDBserver has been detected.
    Unknown register tag_ctl requested

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 .../11.1/0010-gdbserver-aarch64-support.patch | 317 ++++++++++++++++++
 1 file changed, 317 insertions(+)
 create mode 100644 package/gdb/11.1/0010-gdbserver-aarch64-support.patch

diff --git a/package/gdb/11.1/0010-gdbserver-aarch64-support.patch b/package/gdb/11.1/0010-gdbserver-aarch64-support.patch
new file mode 100644
index 0000000000..c915b8fe6f
--- /dev/null
+++ b/package/gdb/11.1/0010-gdbserver-aarch64-support.patch
@@ -0,0 +1,317 @@
+From eb79b2318066cafb75ffdce310e3bbd44f7c79e3 Mon Sep 17 00:00:00 2001
+From: Luis Machado <luis.machado@linaro.org>
+Date: Fri, 29 Oct 2021 14:54:36 -0300
+Subject: [PATCH] [AArch64] Make gdbserver register set selection dynamic
+
+The current register set selection mechanism for AArch64 is static, based
+on a pre-populated array of register sets.
+
+This means that we might potentially probe register sets that are not
+available. This is OK if the kernel errors out during ptrace, but probing the
+tag_ctl register, for example, does not result in a ptrace error if the kernel
+supports the tagged address ABI but not MTE (PR 28355).
+
+Making the register set selection dynamic, based on feature checks, solves
+this and simplifies the code a bit. It allows us to list all of the register
+sets only once, and pick and choose based on HWCAP/HWCAP2 or other properties.
+
+gdb/ChangeLog:
+
+2021-11-03  Luis Machado  <luis.machado@linaro.org>
+
+	PR gdb/28355
+
+	* arch/aarch64.h (struct aarch64_features): New struct.
+
+gdbserver/ChangeLog:
+
+2021-11-03  Luis Machado  <luis.machado@linaro.org>
+
+	PR gdb/28355
+
+	* linux-aarch64-low.cc (is_sve_tdesc): Remove.
+	(aarch64_target::low_arch_setup): Rework to adjust the register sets.
+	(aarch64_regsets): Update to list all register sets.
+	(aarch64_regsets_info, regs_info_aarch64): Replace NULL with nullptr.
+	(aarch64_sve_regsets, aarch64_sve_regsets_info)
+	(regs_info_aarch64_sve): Remove.
+	(aarch64_adjust_register_sets): New.
+	(aarch64_target::get_regs_info): Remove references to removed structs.
+	(initialize_low_arch): Likewise.
+---
+ gdb/arch/aarch64.h             |   9 ++
+ gdbserver/linux-aarch64-low.cc | 186 ++++++++++++++++++---------------
+ 4 files changed, 130 insertions(+), 85 deletions(-)
+
+diff --git a/gdb/arch/aarch64.h b/gdb/arch/aarch64.h
+index 0eb702c5b5e..95edb664b55 100644
+--- a/gdb/arch/aarch64.h
++++ b/gdb/arch/aarch64.h
+@@ -22,6 +22,15 @@
+ 
+ #include "gdbsupport/tdesc.h"
+ 
++/* Holds information on what architectural features are available.  This is
++   used to select register sets.  */
++struct aarch64_features
++{
++  bool sve = false;
++  bool pauth = false;
++  bool mte = false;
++};
++
+ /* Create the aarch64 target description.  A non zero VQ value indicates both
+    the presence of SVE and the Vector Quotient - the number of 128bit chunks in
+    an SVE Z register.  HAS_PAUTH_P indicates the presence of the PAUTH
+diff --git a/gdbserver/linux-aarch64-low.cc b/gdbserver/linux-aarch64-low.cc
+index daccfef746e..9a8cb4169a7 100644
+--- a/gdbserver/linux-aarch64-low.cc
++++ b/gdbserver/linux-aarch64-low.cc
+@@ -196,16 +196,6 @@ is_64bit_tdesc (void)
+   return register_size (regcache->tdesc, 0) == 8;
+ }
+ 
+-/* Return true if the regcache contains the number of SVE registers.  */
+-
+-static bool
+-is_sve_tdesc (void)
+-{
+-  struct regcache *regcache = get_thread_regcache (current_thread, 0);
+-
+-  return tdesc_contains_feature (regcache->tdesc, "org.gnu.gdb.aarch64.sve");
+-}
+-
+ static void
+ aarch64_fill_gregset (struct regcache *regcache, void *buf)
+ {
+@@ -680,40 +670,6 @@ aarch64_target::low_new_fork (process_info *parent,
+   *child->priv->arch_private = *parent->priv->arch_private;
+ }
+ 
+-/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwcap.h.  */
+-#define AARCH64_HWCAP_PACA (1 << 30)
+-
+-/* Implementation of linux target ops method "low_arch_setup".  */
+-
+-void
+-aarch64_target::low_arch_setup ()
+-{
+-  unsigned int machine;
+-  int is_elf64;
+-  int tid;
+-
+-  tid = lwpid_of (current_thread);
+-
+-  is_elf64 = linux_pid_exe_is_elf_64_file (tid, &machine);
+-
+-  if (is_elf64)
+-    {
+-      uint64_t vq = aarch64_sve_get_vq (tid);
+-      unsigned long hwcap = linux_get_hwcap (8);
+-      unsigned long hwcap2 = linux_get_hwcap2 (8);
+-      bool pauth_p = hwcap & AARCH64_HWCAP_PACA;
+-      /* MTE is AArch64-only.  */
+-      bool mte_p = hwcap2 & HWCAP2_MTE;
+-
+-      current_process ()->tdesc
+-	= aarch64_linux_read_description (vq, pauth_p, mte_p);
+-    }
+-  else
+-    current_process ()->tdesc = aarch32_linux_read_description ();
+-
+-  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
+-}
+-
+ /* Wrapper for aarch64_sve_regs_copy_to_reg_buf.  */
+ 
+ static void
+@@ -730,21 +686,36 @@ aarch64_sve_regs_copy_from_regcache (struct regcache *regcache, void *buf)
+   return aarch64_sve_regs_copy_from_reg_buf (regcache, buf);
+ }
+ 
++/* Array containing all the possible register sets for AArch64/Linux.  During
++   architecture setup, these will be checked against the HWCAP/HWCAP2 bits for
++   validity and enabled/disabled accordingly.
++
++   Their sizes are set to 0 here, but they will be adjusted later depending
++   on whether each register set is available or not.  */
+ static struct regset_info aarch64_regsets[] =
+ {
++  /* GPR registers.  */
+   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
+-    sizeof (struct user_pt_regs), GENERAL_REGS,
++    0, GENERAL_REGS,
+     aarch64_fill_gregset, aarch64_store_gregset },
++  /* Floating Point (FPU) registers.  */
+   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_FPREGSET,
+-    sizeof (struct user_fpsimd_state), FP_REGS,
++    0, FP_REGS,
+     aarch64_fill_fpregset, aarch64_store_fpregset
+   },
++  /* Scalable Vector Extension (SVE) registers.  */
++  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
++    0, EXTENDED_REGS,
++    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regcache
++  },
++  /* PAC registers.  */
+   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
+-    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
+-    NULL, aarch64_store_pauthregset },
++    0, OPTIONAL_REGS,
++    nullptr, aarch64_store_pauthregset },
++  /* Tagged address control / MTE registers.  */
+   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
+-    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
+-    aarch64_store_mteregset },
++    0, OPTIONAL_REGS,
++    aarch64_fill_mteregset, aarch64_store_mteregset },
+   NULL_REGSET
+ };
+ 
+@@ -752,47 +723,95 @@ static struct regsets_info aarch64_regsets_info =
+   {
+     aarch64_regsets, /* regsets */
+     0, /* num_regsets */
+-    NULL, /* disabled_regsets */
++    nullptr, /* disabled_regsets */
+   };
+ 
+ static struct regs_info regs_info_aarch64 =
+   {
+-    NULL, /* regset_bitmap */
+-    NULL, /* usrregs */
++    nullptr, /* regset_bitmap */
++    nullptr, /* usrregs */
+     &aarch64_regsets_info,
+   };
+ 
+-static struct regset_info aarch64_sve_regsets[] =
++/* Given FEATURES, adjust the available register sets by setting their
++   sizes.  A size of 0 means the register set is disabled and won't be
++   used.  */
++
++static void
++aarch64_adjust_register_sets (const struct aarch64_features &features)
+ {
+-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
+-    sizeof (struct user_pt_regs), GENERAL_REGS,
+-    aarch64_fill_gregset, aarch64_store_gregset },
+-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
+-    SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE), EXTENDED_REGS,
+-    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regcache
+-  },
+-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
+-    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
+-    NULL, aarch64_store_pauthregset },
+-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
+-    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
+-    aarch64_store_mteregset },
+-  NULL_REGSET
+-};
++  struct regset_info *regset;
+ 
+-static struct regsets_info aarch64_sve_regsets_info =
+-  {
+-    aarch64_sve_regsets, /* regsets.  */
+-    0, /* num_regsets.  */
+-    NULL, /* disabled_regsets.  */
+-  };
++  for (regset = aarch64_regsets; regset->size >= 0; regset++)
++    {
++      switch (regset->nt_type)
++	{
++	case NT_PRSTATUS:
++	  /* General purpose registers are always present.  */
++	  regset->size = sizeof (struct user_pt_regs);
++	  break;
++	case NT_FPREGSET:
++	  /* This is unavailable when SVE is present.  */
++	  if (!features.sve)
++	    regset->size = sizeof (struct user_fpsimd_state);
++	  break;
++	case NT_ARM_SVE:
++	  if (features.sve)
++	    regset->size = SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE);
++	  break;
++	case NT_ARM_PAC_MASK:
++	  if (features.pauth)
++	    regset->size = AARCH64_PAUTH_REGS_SIZE;
++	  break;
++	case NT_ARM_TAGGED_ADDR_CTRL:
++	  if (features.mte)
++	    regset->size = AARCH64_LINUX_SIZEOF_MTE;
++	  break;
++	default:
++	  gdb_assert_not_reached ("Unknown register set found.");
++	}
++    }
++}
+ 
+-static struct regs_info regs_info_aarch64_sve =
+-  {
+-    NULL, /* regset_bitmap.  */
+-    NULL, /* usrregs.  */
+-    &aarch64_sve_regsets_info,
+-  };
++/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwcap.h.  */
++#define AARCH64_HWCAP_PACA (1 << 30)
++
++/* Implementation of linux target ops method "low_arch_setup".  */
++
++void
++aarch64_target::low_arch_setup ()
++{
++  unsigned int machine;
++  int is_elf64;
++  int tid;
++
++  tid = lwpid_of (current_thread);
++
++  is_elf64 = linux_pid_exe_is_elf_64_file (tid, &machine);
++
++  if (is_elf64)
++    {
++      struct aarch64_features features;
++
++      uint64_t vq = aarch64_sve_get_vq (tid);
++      features.sve = (vq > 0);
++      /* A-profile PAC is 64-bit only.  */
++      features.pauth = linux_get_hwcap (8) & AARCH64_HWCAP_PACA;
++      /* A-profile MTE is 64-bit only.  */
++      features.mte = linux_get_hwcap2 (8) & HWCAP2_MTE;
++
++      current_process ()->tdesc
++	= aarch64_linux_read_description (vq, features.pauth, features.mte);
++
++      /* Adjust the register sets we should use for this particular set of
++	 features.  */
++      aarch64_adjust_register_sets (features);
++    }
++  else
++    current_process ()->tdesc = aarch32_linux_read_description ();
++
++  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
++}
+ 
+ /* Implementation of linux target ops method "get_regs_info".  */
+ 
+@@ -802,9 +821,7 @@ aarch64_target::get_regs_info ()
+   if (!is_64bit_tdesc ())
+     return &regs_info_aarch32;
+ 
+-  if (is_sve_tdesc ())
+-    return &regs_info_aarch64_sve;
+-
++  /* AArch64 64-bit registers.  */
+   return &regs_info_aarch64;
+ }
+ 
+@@ -3294,5 +3311,4 @@ initialize_low_arch (void)
+   initialize_low_arch_aarch32 ();
+ 
+   initialize_regsets_info (&aarch64_regsets_info);
+-  initialize_regsets_info (&aarch64_sve_regsets_info);
+ }
+-- 
+2.27.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
