Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B05CC6B2D
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 20:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C95DB80F70;
	Wed, 14 Oct 2026 20:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4t_GSUPbsOv; Wed, 14 Oct 2026 20:46:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B0EBD8104C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792010810;
	b=P2LkObm5VXtjRvSu2eKisVYRvNHZbjHJYoMexIRwSlA7RVi+I54aGjdjYS4kIuFsY3qD
	 gQXqPX5ZzMuBvtq/IRGdT3kWVquhuWCSYfsQeBdPgINF33vI6yEroA5JcXGIC0oZPSE7m
	 g0w2uOZNxrq8iY3QGyL9OlRx/3u1P5BRzWbmgOTWWkaOSXqAxabPle1V2Fq7NX/wka+md
	 NB2ImrmAaDr/zxjVO3RdrYEPFn+LNSRd4/d6cjvQWII8aYZ5jb5XH44Vtganxba7jd/fR
	 buXegbhlmzbKXl5GspMy/CVu0A6UJ9BwTQ1lrjCb1Ms2wkBROxWazMFuBk8YeQ0WeRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792010810;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=netnBPf/cHfv/EEABu1dBbfFgond7Z4cug2qVsuVt2Q=;
	b=myFFTcskVbnGSrY38NTyzJwFq8ojlZbwpaao507e+/1tF7H4CVycl00TvxooiEr3uEMA
	 m4YfT+7MnhvWOMCKMZIhuvOXvdasZ/gWHqgUkmUBglSzhdk/CY/gbkcKK/JR/6DWZBbOw
	 VzJ7DeJP8EpJrHkzj5Uxi4MbIcGimsOnAmGfWInJiDPwFEdo/9aZiwCUtTPytSq1LbCzJ
	 NeFMqpmAElhZ0l6mAJi2IcsyXNf7mqezgDp8MnZDhAJOJLFO+u8rAYSBFHYaEMprIL459
	 ak1f4R5mbSWTHDfMSX5VDKfcFYRocKZ7O4LLVjUFpny1mFOrJo08XrzwRoFPenYF9HA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792010810;
	bh=netnBPf/cHfv/EEABu1dBbfFgond7Z4cug2qVsuVt2Q=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZBnSOlrSaPtWSQPAle4VCUi2Sp/OKIPiLokJWG5SQye3pra+peuzBO60CzKAMdcb/
	 KLlHhcFJqo4bJe/KWPNE7EvzWuYNQANKidakVKSfkVmO/7QSDEBVfLBd+PUnK2tyZs
	 4ci51SMOe5ek5alBUM7xt/OaLywJFE1BwVn4NtcynDhonKQsTSc8+h0yVLp/hux43N
	 KKjbFwNpBOsHOgD7bG3CcqplNJPzQfqIZ/i0jhID5IFCHG1MVkVRakytvmuuAFpnaw
	 cNLGhh3avGnLmtv3nUoxuy6iIoxeR21fqqTSCSEe5UPFizvduv8s/ckuB5hlpb/Wyi
	 FamW9bBsGWwJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EBD8104C;
	Wed, 14 Oct 2026 20:46:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8C78769
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C875E8104C
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mlqjJfU27dwu for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 20:46:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DDC6380F70
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792010807;
 b=PmkpSpaUnmoHwdxII6rymcMkbFp6nwY2RaK7cIZANaULry/iMUp1LdiQTUtyApKVaaFH
 tYqcRX6YIrMrkHvzn8z4HMXmW5ASFiShcTe1Qp834lOac7grBytFRXpxHazNJA8dX1CPt
 zK2aw/w34OoDKfiu/8fJ3quKdnw1l+8lRdUiLhcwiJcE9w1fzk05UuP/EUjFJ+DEGbXpy
 zpQbHaobp7j8dxfbki3MkYtsMyRqWSX0PObzeX1Wh7jxu0vqSbKVSO0j60ax2his0g/qj
 tCbUbdfB9vzQWo5gwaVaOwehZNXQRcj0NveazI22zWUPSlVg76KxIeWeP0Qp03W2xrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792010807;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1P/XOp9HsEA3G1c1VChCpZUA5NiIj3nkWsJYxgYqAZU=;
 b=AbwyQzBM+vvMKbfHAhMRfckz5ZelUDF2MV4TbCd4ZuwHhLyewo+A8QldBI94TEDjaWWU
 KFQPvtCBtPwDVkDC3LMCSByoQ/SRutTU6jRR4MwtjrqQQrBS2PRu4jMJHEiHsCvcSYTcE
 518ALFEVFOrAeh5IGqL5j3uzmys71DgBGUOSlR1pYYQVD7vs0zr0Mt6WoHr4ZAY829SKi
 IGU1jXxqqNzSG/L+3RzWnWtvzyLQgXh7hBZ3REyG3vpFp/y2p8OHnq4uItJLiaedWnFhB
 qBeqnGHFGjdq5jW7lVP7Bm+/3g9SU2JanKyAWGelQdGPHht1SYmHUyoy39Wa2MR2i7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDC6380F70
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:46:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C0BB95C65; Wed, 14 Oct 2026 20:45:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Oct 2026 22:29:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57f40e5f6e9838d1da8882d0f18996e83ac856e9
X-Git-Newrev: 0e61ae3b5afa6c10179761bb8874379a41ea0b06
X-Patchwork-Hint: ignore
Message-Id: <20261014204527.8C0BB95C65@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: add microblaze frame
 unwinding fix to v14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0e61ae3b5afa6c10179761bb8874379a41ea0b06
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add microblaze signal-frame unwinding fix back port to gcc 14.4.0.

Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-add-Linux-signal-frame-unwinding-support.patch | 196 +++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch b/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
new file mode 100644
index 0000000000..762a1e09bb
--- /dev/null
+++ b/package/gcc/14.4.0/0003-microblaze-add-Linux-signal-frame-unwinding-support.patch
@@ -0,0 +1,196 @@
+From 4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f Mon Sep 17 00:00:00 2001
+From: Ramin Moussavi <lordrasmus@gmail.com>
+Date: Wed, 3 Jun 2026 00:00:00 +0200
+Subject: [PATCH] microblaze: add Linux signal frame unwinding support
+
+libgcc has no MD_FALLBACK_FRAME_STATE_FOR for microblaze*-linux*, so the
+DWARF unwinder cannot step through signal frames at all.  Anything that
+unwinds out of a signal handler -- most prominently NPTL asynchronous
+pthread cancellation (SIGCANCEL) -- either stops early with
+_URC_END_OF_STACK (cleanup handlers below the signal frame never run) or
+misinterprets the on-stack signal trampoline and crashes with SIGSEGV.
+
+Add the standard fallback: recognize the two-instruction trampoline the
+kernel writes into struct rt_sigframe on the stack
+
+	addik r12, r0, __NR_rt_sigreturn
+	brki  r14, 0x8
+
+and rebuild the frame state from the sigcontext's pt_regs.  The ucontext
+is anchored relative to the trampoline (its last member) rather than to
+the CFA, so the layout of the frame head does not matter.
+
+The interrupted PC is recorded in DWARF column 36, one past the hard
+registers, because column 15 must keep the interrupted r15 (unrelated to
+the resume address of a signal frame).  Declaring it as
+DWARF_ALT_FRAME_RETURN_COLUMN makes init_dwarf_reg_size_table size the
+column; without that _Unwind_GetGR reads a zero size and aborts.
+
+Tested with a microblazeel-linux-uclibc cross compiler against uClibc-ng
+git, running its NPTL test suite under qemu-system-microblazeel -M
+petalogix-s3adsp1800.  Without the fix 17 tests fail (tst-cancel{1..5,7,
+9,16,20,x4,x7}, tst-cleanup{1..3}, tst-cond{16,17}) by SIGSEGV or by
+hanging in the unwinder; with it all 17 pass and the rest of the suite
+is unchanged.  The implementation follows the mips/aarch64
+linux-unwind.h pattern.
+
+gcc/ChangeLog:
+
+	* config/microblaze/microblaze.h (DWARF_ALT_FRAME_RETURN_COLUMN):
+	Define.
+
+libgcc/ChangeLog:
+
+	* config.host (microblaze*-linux*): Set md_unwind_header.
+	* config/microblaze/linux-unwind.h: New file.
+
+Upstream: https://gcc.gnu.org/cgit/gcc/commit/?id=4ef64ad1aa9bbbe9471610e2de6ef0c8afed8b1f
+
+Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
+Signed-off-by: Neal Frager <neal.frager@amd.com>
+---
+ gcc/config/microblaze/microblaze.h      |   8 ++
+ libgcc/config.host                      |   1 +
+ libgcc/config/microblaze/linux-unwind.h | 102 ++++++++++++++++++++++++
+ 3 files changed, 111 insertions(+)
+ create mode 100644 libgcc/config/microblaze/linux-unwind.h
+
+diff --git a/gcc/config/microblaze/microblaze.h b/gcc/config/microblaze/microblaze.h
+index 2b5bd52040f7f..fc8c4b8717545 100644
+--- a/gcc/config/microblaze/microblaze.h
++++ b/gcc/config/microblaze/microblaze.h
+@@ -176,6 +176,14 @@ extern enum pipeline_type microblaze_pipe;
+ #define DWARF_FRAME_RETURN_COLUMN \
+ 	(GP_REG_FIRST + MB_ABI_SUB_RETURN_ADDR_REGNUM)
+ 
++/* Signal frames (config/microblaze/linux-unwind.h) record the
++   interrupted PC in DWARF column 36, one past the hard registers,
++   because column 15 must keep the interrupted r15.  Declaring it as
++   the alternate return column makes init_dwarf_reg_size_table size
++   it; otherwise _Unwind_GetGR aborts when unwinding through a signal
++   frame, such as during pthread cancellation.  */
++#define DWARF_ALT_FRAME_RETURN_COLUMN 36
++
+ /* Initial state of return address on entry to func = R15.
+    Actually, the RA is at R15+8, but gcc doesn't know how 
+    to generate this. 
+diff --git a/libgcc/config.host b/libgcc/config.host
+index 046156fa5e786..a685d5da7a107 100644
+--- a/libgcc/config.host
++++ b/libgcc/config.host
+@@ -1050,6 +1050,7 @@ mcore-*-elf)
+ 	;;
+ microblaze*-linux*)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit t-slibgcc-libgcc"
++	md_unwind_header=microblaze/linux-unwind.h
+ 	;;
+ microblaze*-*-elf)
+ 	tmake_file="${tmake_file} microblaze/t-microblaze t-fdpbit"
+diff --git a/libgcc/config/microblaze/linux-unwind.h b/libgcc/config/microblaze/linux-unwind.h
+new file mode 100644
+index 0000000000000..b54704a065198
+--- /dev/null
++++ b/libgcc/config/microblaze/linux-unwind.h
+@@ -0,0 +1,102 @@
++/* DWARF2 EH unwinding support for MicroBlaze Linux.
++   Copyright (C) 2026 Free Software Foundation, Inc.
++
++   This file is part of GCC.
++
++   GCC is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; either version 3, or (at your option)
++   any later version.
++
++   GCC is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   Under Section 7 of GPL version 3, you are granted additional
++   permissions described in the GCC Runtime Library Exception, version
++   3.1, as published by the Free Software Foundation.
++
++   You should have received a copy of the GNU General Public License and
++   a copy of the GCC Runtime Library Exception along with this program;
++   see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#ifndef inhibit_libc
++
++/* Do code reading to identify a signal frame, and set the frame state
++   data appropriately.  See unwind-dw2.c for the structs.  */
++
++#include <signal.h>
++#include <sys/ucontext.h>
++#include <asm/unistd.h>
++
++#define MD_FALLBACK_FRAME_STATE_FOR microblaze_fallback_frame_state
++
++static _Unwind_Reason_Code
++microblaze_fallback_frame_state (struct _Unwind_Context *context,
++				 _Unwind_FrameState *fs)
++{
++  const unsigned int *pc = (const unsigned int *) context->ra;
++  struct sigcontext *sc;
++  _Unwind_Ptr new_cfa;
++  int i;
++
++  /* The outermost frame of a thread may leave a null or near-null
++     return address; do not dereference it looking for the
++     trampoline.  */
++  if ((unsigned long) pc < 4096)
++    return _URC_END_OF_STACK;
++
++  /* The kernel writes the signal trampoline onto the stack
++     (struct rt_sigframe.tramp):
++
++	addik r12, r0, __NR_rt_sigreturn
++	brki  r14, 0x8
++
++     and sets the saved r15 to the trampoline address minus 8 (the
++     handler returns with "rtsd r15, 8"), so the unwound return
++     address points 8 bytes before the trampoline.  */
++  if (pc[0] == (0x31800000 | __NR_rt_sigreturn) && pc[1] == 0xb9cc0008)
++    ;
++  else if (pc[2] == (0x31800000 | __NR_rt_sigreturn) && pc[3] == 0xb9cc0008)
++    pc += 2;
++  else
++    return _URC_END_OF_STACK;
++
++  /* The trampoline is the last member of the kernel's rt_sigframe and
++     the ucontext sits directly in front of it.  Anchor there rather
++     than at the CFA so the layout of the frame head does not matter
++     (the kernel may insert an ABI argument-home gap at the front).
++     uClibc's ucontext_t matches the kernel's struct ucontext.  */
++  ucontext_t *uc = (ucontext_t *) ((_Unwind_Ptr) pc - sizeof (ucontext_t));
++
++  sc = (struct sigcontext *) &uc->uc_mcontext;
++
++  new_cfa = sc->regs.r1;
++  fs->regs.cfa_how = CFA_REG_OFFSET;
++  fs->regs.cfa_reg = 1;		/* r1, the stack pointer.  */
++  fs->regs.cfa_offset = new_cfa - (_Unwind_Ptr) context->cfa;
++
++  /* pt_regs holds r0..r31 consecutively.  */
++  for (i = 0; i < 32; i++)
++    {
++      fs->regs.how[i] = REG_SAVED_OFFSET;
++      fs->regs.reg[i].loc.offset
++	= (_Unwind_Ptr) &sc->regs.r0 + i * sizeof (unsigned long) - new_cfa;
++    }
++
++  /* The interrupted PC goes into the alternate return column
++     (DWARF_ALT_FRAME_RETURN_COLUMN, defined as 36 in
++     gcc/config/microblaze/microblaze.h), one past the hard registers;
++     column 15 above keeps the interrupted r15.  */
++  fs->regs.how[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__] = REG_SAVED_OFFSET;
++  fs->regs.reg[__LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__].loc.offset
++    = (_Unwind_Ptr) &sc->regs.pc - new_cfa;
++  fs->retaddr_column = __LIBGCC_DWARF_ALT_FRAME_RETURN_COLUMN__;
++  fs->signal_frame = 1;
++
++  return _URC_NO_REASON;
++}
++
++#endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
