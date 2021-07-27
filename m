Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 454E2C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 09:31:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED4F86137F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 09:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED4F86137F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C6882CF9;
	Tue, 27 Jul 2021 09:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VUajk1LweNIb; Tue, 27 Jul 2021 09:31:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B2D082D96;
	Tue, 27 Jul 2021 09:31:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE20B1BF37E
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 09:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD5D040315
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 09:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6Rpzc43WZMz for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 09:31:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88665402D4
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 09:31:23 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id n19so15324538ioz.0
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 02:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=72fHRZgGtGLL9es3UaqhYbC4zHpnaaFvl3TakxCbwxU=;
 b=HDR4bxmJLoDc5gkZqt5Sl/s6OynO55/suMnOjaXdpswpWJw4LtxTgOgzmjLJOXJ9lz
 xIbPQrl/khGOc47oEyDnzqSJ0Us4Eby1GHcdjyPRv3DUaIEDI4gk1OacoJZtH5IzpaHK
 /jJrEG6fbwLQmK1YHH0bF3WzJc+bgbtzz9CA3br8gCA7w+dLa4p0eWa4ngG8d90tqDVl
 gwAoW2V+rckg9SY3iyrDmvG5QSJx5n6NkAmeAuanoIdY1Yp8RKsRan5lZHqIklMHNGi9
 DFBMQFD8PWvMiUOaoN/tG8bx58Z5TnXeqQyG1w7vEFz8fuhjNEIBz14XJZQtoBnjoKXA
 yLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=72fHRZgGtGLL9es3UaqhYbC4zHpnaaFvl3TakxCbwxU=;
 b=DohfdtO1g5XMg3gY4jhbrfXJ9ieseKXkQji8jR+LEvsxrcXgXq/C8RUJGRUuE4cEgy
 dNGDev9NwNnNjmQ2keplVCLnQ1gGhajXFDtaI66bGIsmFe/8pICkVn0Rz0vmITKHYvU3
 sgmnTJxWjT5Ayhsw/64u/UuyX0MJlIxAk1BhmUzOHTn7JwIzdSigZqPDFAPDSsbKZ1i/
 BKmvSnL0wwZcJLCD4eKsRltY1Bx6rNXFmAUf1qv8ZfQKk+quWBSg/vv/GbnZsZAZddRu
 AkeY5vITp03vdrMdSGog52Matyk7PtkU6cqUJqFT/UU42NwmfYSg9ctlBo7n4gd4haVL
 T3Og==
X-Gm-Message-State: AOAM533pB342/JUvOezhN/0TLqD1Bu2yZM4RTAlUqZUove6StU5dozu5
 ME+gQagm38hl8sY8c7slkAWjcpXa2zY=
X-Google-Smtp-Source: ABdhPJwsWNiBp+jjWmJDRcILm3WFi2/oHIkUtU6ExUTHD8aSztlEAbRoathgkEqlh0y8mCrIK7QtjA==
X-Received: by 2002:a6b:e009:: with SMTP id z9mr18388748iog.56.1627378282108; 
 Tue, 27 Jul 2021 02:31:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-178-184.hlrn.qwest.net.
 [97.118.178.184])
 by smtp.gmail.com with ESMTPSA id j24sm1895955ioo.16.2021.07.27.02.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 02:31:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 03:31:17 -0600
Message-Id: <20210727093117.3247210-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: fix aarch64 renderer
 process crash
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

We need to backport an aarch64 patch to prevent a crash.

Fixes:
==654== Conditional jump or move depends on uninitialised value(s)
==654==    at 0x68CF9D0: contains (Range.h:115)
==654==    by 0x68CF9D0: mark (JITStubRoutineSet.h:57)
==654==    by 0x68CF9D0: mark (ConservativeRoots.cpp:127)
==654==    by 0x68CF9D0: genericAddPointer<JSC::CompositeMarkHook> (ConservativeRoots.cpp:69)
==654==    by 0x68CF9D0: genericAddSpan<JSC::CompositeMarkHook> (ConservativeRoots.cpp:101)
==654==    by 0x68CF9D0: JSC::ConservativeRoots::add(void*, void*, JSC::JITStubRoutineSet&, JSC::CodeBlockSet&) (ConservativeRoots.cpp:147)
==654==    by 0x68EA5BB: JSC::MachineThreads::gatherConservativeRoots(JSC::ConservativeRoots&, JSC::JITStubRoutineSet&, JSC::CodeBlockSet&, JSC::CurrentThreadState*, WTF::Thread*) (MachineStackMarker.cpp:202)
==654==    by 0x68D885B: _ZZN3JSC4Heap18addCoreConstraintsEvENUlRT_E0_clINS_11SlotVisitorEEEDaS2_ (Heap.cpp:2740)
==654==    by 0x68EFF7B: JSC::MarkingConstraint::execute(JSC::SlotVisitor&) (MarkingConstraint.cpp:58)
==654==    by 0x68F3D83: JSC::MarkingConstraintSolver::runExecutionThread(JSC::SlotVisitor&, JSC::MarkingConstraintSolver::SchedulerPreference, WTF::ScopedLambda<WTF::Optional<unsigned int> ()>) (MarkingConstraintSolver.cpp:237)
==654==    by 0x68D4413: JSC::Heap::runTaskInParallel(WTF::RefPtr<WTF::SharedTask<void (JSC::SlotVisitor&)>, WTF::RawPtrTraits<WTF::SharedTask<void (JSC::SlotVisitor&)> >, WTF::DefaultRefDerefTraits<WTF::SharedTask<void (JSC::SlotVisitor&)> > >) (Heap.cpp:3061)
==654==    by 0x68F3E9F: runFunctionInParallel<JSC::MarkingConstraintSolver::execute(JSC::MarkingConstraintSolver::SchedulerPreference, WTF::ScopedLambda<WTF::Optional<unsigned int>()>)::<lambda(JSC::SlotVisitor&)> > (Heap.h:397)
==654==    by 0x68F3E9F: JSC::MarkingConstraintSolver::execute(JSC::MarkingConstraintSolver::SchedulerPreference, WTF::ScopedLambda<WTF::Optional<unsigned int> ()>) (MarkingConstraintSolver.cpp:66)
==654==    by 0x68F4033: JSC::MarkingConstraintSolver::drain(WTF::BitVector&) (MarkingConstraintSolver.cpp:97)
==654==    by 0x68F4B2F: JSC::MarkingConstraintSet::executeConvergenceImpl(JSC::SlotVisitor&) (MarkingConstraintSet.cpp:114)
==654==    by 0x68F4C6B: JSC::MarkingConstraintSet::executeConvergence(JSC::SlotVisitor&) (MarkingConstraintSet.cpp:83)
==654==    by 0x68D9BC7: JSC::Heap::runFixpointPhase(JSC::GCConductor) (Heap.cpp:1378)
==654==    by 0x68D9E93: runCurrentPhase (Heap.cpp:1208)
==654==    by 0x68D9E93: JSC::Heap::runCurrentPhase(JSC::GCConductor, JSC::CurrentThreadState*) (Heap.cpp:1176)
==654==  Uninitialised value was created by a stack allocation
==654==    at 0x5AC3E80: JSC::ARM64Assembler::linkJump(JSC::AssemblerLabel, JSC::AssemblerLabel, JSC::ARM64Assembler::JumpType, JSC::ARM64Assembler::Condition) [clone .isra.0] (ARM64Assembler.h:2556)

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...support-for-FP-registers-plus-some-b.patch | 382 ++++++++++++++++++
 1 file changed, 382 insertions(+)
 create mode 100644 package/webkitgtk/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch

diff --git a/package/webkitgtk/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch b/package/webkitgtk/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch
new file mode 100644
index 0000000000..c8b8501bdb
--- /dev/null
+++ b/package/webkitgtk/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch
@@ -0,0 +1,382 @@
+From 05f6ba814422a392d59037ebe4412168da0e44db Mon Sep 17 00:00:00 2001
+From: Mark Lam <mark.lam@apple.com>
+Date: Tue, 15 Jun 2021 01:04:01 +0000
+Subject: [PATCH] Add ldp and stp support for FP registers, plus some bug
+ fixes. https://bugs.webkit.org/show_bug.cgi?id=226998 rdar://79313717
+
+Reviewed by Robin Morisset.
+
+This patch does the following:
+1. Add ldp and stp support for FP registers.
+   This simply entails providing wrappers that take FPRegisterID and passing true
+   for the V bit to the underlying loadStoreRegisterPairXXX encoding function.
+   V is for vector (aka floating point).  This will cause bit 26 in the instruction
+   to be set indicating that it's loading / storing floating point registers.
+
+2. Add ARM64 disassembler support ldp and stp for FP registers.
+   This includes fixing A64DOpcodeLoadStoreRegisterPair::mask to not exclude the
+   FP versions of the instructions.
+
+3. Add ARM64Assembler query methods for determining if an immediate is encodable
+   as the signed 12 bit immediate of ldp and stp instructions.
+
+4. Fix ldp and stp offset form to take an int instead of an unsigned.  The
+   immediate it takes is a 12-bit signed int, not unsigned.
+
+5. In loadStoreRegisterPairXXX encoding functions used by the forms of ldp and stp,
+   RELEASE_ASSERT that the passed in immediate is encodable.  Unlike ldur / stur,
+   there is no form of ldp / stp that takes the offset in a register that can be
+   used as a fail over.  Hence, if the immediate is not encodable, this is a
+   non-recoverable event.  The client is responsible for ensuring that the offset
+   is encodable.
+
+6. Added some testmasm tests for testing the offset form (as opposed to PreIndex
+   and PostIndex forms) of ldp and stp.  We currently only use the offset form
+   in our JITs.
+
+* assembler/ARM64Assembler.h:
+(JSC::ARM64Assembler::isValidLDPImm):
+(JSC::ARM64Assembler::isValidLDPFPImm):
+(JSC::ARM64Assembler::ldp):
+(JSC::ARM64Assembler::ldnp):
+(JSC::ARM64Assembler::isValidSTPImm):
+(JSC::ARM64Assembler::isValidSTPFPImm):
+(JSC::ARM64Assembler::stp):
+(JSC::ARM64Assembler::stnp):
+(JSC::ARM64Assembler::loadStoreRegisterPairPostIndex):
+(JSC::ARM64Assembler::loadStoreRegisterPairPreIndex):
+(JSC::ARM64Assembler::loadStoreRegisterPairOffset):
+(JSC::ARM64Assembler::loadStoreRegisterPairNonTemporal):
+* assembler/AssemblerCommon.h:
+(JSC::isValidSignedImm7):
+* assembler/MacroAssemblerARM64.h:
+(JSC::MacroAssemblerARM64::loadPair64):
+(JSC::MacroAssemblerARM64::storePair64):
+* assembler/testmasm.cpp:
+(JSC::testLoadStorePair64Int64):
+(JSC::testLoadStorePair64Double):
+* disassembler/ARM64/A64DOpcode.cpp:
+(JSC::ARM64Disassembler::A64DOpcodeLoadStoreRegisterPair::format):
+* disassembler/ARM64/A64DOpcode.h:
+
+
+
+Canonical link: https://commits.webkit.org/238801@main
+git-svn-id: https://svn.webkit.org/repository/webkit/trunk@278856 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+05f6ba814422a392d59037ebe4412168da0e44db]
+---
+ Source/JavaScriptCore/ChangeLog               |  61 +++
+ .../JavaScriptCore/assembler/ARM64Assembler.h | 104 ++++-
+ .../assembler/AssemblerCommon.h               |  11 +-
+ .../assembler/MacroAssemblerARM64.h           |  20 +
+ Source/JavaScriptCore/assembler/testmasm.cpp  | 437 ++++++++++++++++++
+ .../disassembler/ARM64/A64DOpcode.cpp         |   8 +-
+ .../disassembler/ARM64/A64DOpcode.h           |   4 +-
+ 7 files changed, 630 insertions(+), 15 deletions(-)
+
+diff --git a/Source/JavaScriptCore/assembler/ARM64Assembler.h b/Source/JavaScriptCore/assembler/ARM64Assembler.h
+index 2cc53c8ccda5..758cbe402779 100644
+--- a/Source/JavaScriptCore/assembler/ARM64Assembler.h
++++ b/Source/JavaScriptCore/assembler/ARM64Assembler.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2012-2020 Apple Inc. All rights reserved.
++ * Copyright (C) 2012-2021 Apple Inc. All rights reserved.
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+@@ -1114,6 +1114,20 @@ public:
+         insn(0x0);
+     }
+ 
++    template<int datasize>
++    ALWAYS_INLINE static bool isValidLDPImm(int immediate)
++    {
++        unsigned immedShiftAmount = memPairOffsetShift(false, MEMPAIROPSIZE_INT(datasize));
++        return isValidSignedImm7(immediate, immedShiftAmount);
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE static bool isValidLDPFPImm(int immediate)
++    {
++        unsigned immedShiftAmount = memPairOffsetShift(true, MEMPAIROPSIZE_FP(datasize));
++        return isValidSignedImm7(immediate, immedShiftAmount);
++    }
++
+     template<int datasize>
+     ALWAYS_INLINE void ldp(RegisterID rt, RegisterID rt2, RegisterID rn, PairPostIndex simm)
+     {
+@@ -1129,17 +1143,45 @@ public:
+     }
+ 
+     template<int datasize>
+-    ALWAYS_INLINE void ldp(RegisterID rt, RegisterID rt2, RegisterID rn, unsigned pimm = 0)
++    ALWAYS_INLINE void ldp(RegisterID rt, RegisterID rt2, RegisterID rn, int simm = 0)
++    {
++        CHECK_DATASIZE();
++        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_INT(datasize), false, MemOp_LOAD, simm, rn, rt, rt2));
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE void ldnp(RegisterID rt, RegisterID rt2, RegisterID rn, int simm = 0)
++    {
++        CHECK_DATASIZE();
++        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_INT(datasize), false, MemOp_LOAD, simm, rn, rt, rt2));
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE void ldp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, PairPostIndex simm)
++    {
++        CHECK_DATASIZE();
++        insn(loadStoreRegisterPairPostIndex(MEMPAIROPSIZE_FP(datasize), true, MemOp_LOAD, simm, rn, rt, rt2));
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE void ldp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, PairPreIndex simm)
++    {
++        CHECK_DATASIZE();
++        insn(loadStoreRegisterPairPreIndex(MEMPAIROPSIZE_FP(datasize), true, MemOp_LOAD, simm, rn, rt, rt2));
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE void ldp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, int simm = 0)
+     {
+         CHECK_DATASIZE();
+-        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_INT(datasize), false, MemOp_LOAD, pimm, rn, rt, rt2));
++        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_FP(datasize), true, MemOp_LOAD, simm, rn, rt, rt2));
+     }
+ 
+     template<int datasize>
+-    ALWAYS_INLINE void ldnp(RegisterID rt, RegisterID rt2, RegisterID rn, unsigned pimm = 0)
++    ALWAYS_INLINE void ldnp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, int simm = 0)
+     {
+         CHECK_DATASIZE();
+-        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_INT(datasize), false, MemOp_LOAD, pimm, rn, rt, rt2));
++        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_FP(datasize), true, MemOp_LOAD, simm, rn, rt, rt2));
+     }
+ 
+     template<int datasize>
+@@ -1743,6 +1785,18 @@ public:
+         smaddl(rd, rn, rm, ARM64Registers::zr);
+     }
+ 
++    template<int datasize>
++    ALWAYS_INLINE static bool isValidSTPImm(int immediate)
++    {
++        return isValidLDPImm<datasize>(immediate);
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE static bool isValidSTPFPImm(int immediate)
++    {
++        return isValidLDPFPImm<datasize>(immediate);
++    }
++
+     template<int datasize>
+     ALWAYS_INLINE void stp(RegisterID rt, RegisterID rt2, RegisterID rn, PairPostIndex simm)
+     {
+@@ -1758,17 +1812,45 @@ public:
+     }
+ 
+     template<int datasize>
+-    ALWAYS_INLINE void stp(RegisterID rt, RegisterID rt2, RegisterID rn, unsigned pimm = 0)
++    ALWAYS_INLINE void stp(RegisterID rt, RegisterID rt2, RegisterID rn, int simm = 0)
++    {
++        CHECK_DATASIZE();
++        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_INT(datasize), false, MemOp_STORE, simm, rn, rt, rt2));
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE void stnp(RegisterID rt, RegisterID rt2, RegisterID rn, int simm = 0)
++    {
++        CHECK_DATASIZE();
++        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_INT(datasize), false, MemOp_STORE, simm, rn, rt, rt2));
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE void stp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, PairPostIndex simm)
++    {
++        CHECK_DATASIZE();
++        insn(loadStoreRegisterPairPostIndex(MEMPAIROPSIZE_FP(datasize), true, MemOp_STORE, simm, rn, rt, rt2));
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE void stp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, PairPreIndex simm)
++    {
++        CHECK_DATASIZE();
++        insn(loadStoreRegisterPairPreIndex(MEMPAIROPSIZE_FP(datasize), true, MemOp_STORE, simm, rn, rt, rt2));
++    }
++
++    template<int datasize>
++    ALWAYS_INLINE void stp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, int simm = 0)
+     {
+         CHECK_DATASIZE();
+-        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_INT(datasize), false, MemOp_STORE, pimm, rn, rt, rt2));
++        insn(loadStoreRegisterPairOffset(MEMPAIROPSIZE_FP(datasize), true, MemOp_STORE, simm, rn, rt, rt2));
+     }
+ 
+     template<int datasize>
+-    ALWAYS_INLINE void stnp(RegisterID rt, RegisterID rt2, RegisterID rn, unsigned pimm = 0)
++    ALWAYS_INLINE void stnp(FPRegisterID rt, FPRegisterID rt2, RegisterID rn, int simm = 0)
+     {
+         CHECK_DATASIZE();
+-        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_INT(datasize), false, MemOp_STORE, pimm, rn, rt, rt2));
++        insn(loadStoreRegisterPairNonTemporal(MEMPAIROPSIZE_FP(datasize), true, MemOp_STORE, simm, rn, rt, rt2));
+     }
+ 
+     template<int datasize>
+@@ -3544,6 +3626,7 @@ protected:
+         ASSERT(opc == (opc & 1)); // Only load or store, load signed 64 is handled via size.
+         ASSERT(V || (size != MemPairOp_LoadSigned_32) || (opc == MemOp_LOAD)); // There isn't an integer store signed.
+         unsigned immedShiftAmount = memPairOffsetShift(V, size);
++        RELEASE_ASSERT(isValidSignedImm7(immediate, immedShiftAmount));
+         int imm7 = immediate >> immedShiftAmount;
+         ASSERT((imm7 << immedShiftAmount) == immediate && isInt<7>(imm7));
+         return (0x28800000 | size << 30 | V << 26 | opc << 22 | (imm7 & 0x7f) << 15 | rt2 << 10 | xOrSp(rn) << 5 | rt);
+@@ -3575,6 +3658,7 @@ protected:
+         ASSERT(opc == (opc & 1)); // Only load or store, load signed 64 is handled via size.
+         ASSERT(V || (size != MemPairOp_LoadSigned_32) || (opc == MemOp_LOAD)); // There isn't an integer store signed.
+         unsigned immedShiftAmount = memPairOffsetShift(V, size);
++        RELEASE_ASSERT(isValidSignedImm7(immediate, immedShiftAmount));
+         int imm7 = immediate >> immedShiftAmount;
+         ASSERT((imm7 << immedShiftAmount) == immediate && isInt<7>(imm7));
+         return (0x29800000 | size << 30 | V << 26 | opc << 22 | (imm7 & 0x7f) << 15 | rt2 << 10 | xOrSp(rn) << 5 | rt);
+@@ -3592,6 +3676,7 @@ protected:
+         ASSERT(opc == (opc & 1)); // Only load or store, load signed 64 is handled via size.
+         ASSERT(V || (size != MemPairOp_LoadSigned_32) || (opc == MemOp_LOAD)); // There isn't an integer store signed.
+         unsigned immedShiftAmount = memPairOffsetShift(V, size);
++        RELEASE_ASSERT(isValidSignedImm7(immediate, immedShiftAmount));
+         int imm7 = immediate >> immedShiftAmount;
+         ASSERT((imm7 << immedShiftAmount) == immediate && isInt<7>(imm7));
+         return (0x29000000 | size << 30 | V << 26 | opc << 22 | (imm7 & 0x7f) << 15 | rt2 << 10 | xOrSp(rn) << 5 | rt);
+@@ -3609,6 +3694,7 @@ protected:
+         ASSERT(opc == (opc & 1)); // Only load or store, load signed 64 is handled via size.
+         ASSERT(V || (size != MemPairOp_LoadSigned_32) || (opc == MemOp_LOAD)); // There isn't an integer store signed.
+         unsigned immedShiftAmount = memPairOffsetShift(V, size);
++        RELEASE_ASSERT(isValidSignedImm7(immediate, immedShiftAmount));
+         int imm7 = immediate >> immedShiftAmount;
+         ASSERT((imm7 << immedShiftAmount) == immediate && isInt<7>(imm7));
+         return (0x28000000 | size << 30 | V << 26 | opc << 22 | (imm7 & 0x7f) << 15 | rt2 << 10 | xOrSp(rn) << 5 | rt);
+diff --git a/Source/JavaScriptCore/assembler/AssemblerCommon.h b/Source/JavaScriptCore/assembler/AssemblerCommon.h
+index a594823d6a4d..2e50ffdbc82a 100644
+--- a/Source/JavaScriptCore/assembler/AssemblerCommon.h
++++ b/Source/JavaScriptCore/assembler/AssemblerCommon.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2012-2019 Apple Inc. All rights reserved.
++ * Copyright (C) 2012-2021 Apple Inc. All rights reserved.
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+@@ -74,6 +74,15 @@ ALWAYS_INLINE bool isValidSignedImm9(int32_t value)
+     return isInt9(value);
+ }
+ 
++ALWAYS_INLINE bool isValidSignedImm7(int32_t value, int alignmentShiftAmount)
++{
++    constexpr int32_t disallowedHighBits = 32 - 7;
++    int32_t shiftedValue = value >> alignmentShiftAmount;
++    bool fitsIn7Bits = shiftedValue == ((shiftedValue << disallowedHighBits) >> disallowedHighBits);
++    bool hasCorrectAlignment = value == (shiftedValue << alignmentShiftAmount);
++    return fitsIn7Bits && hasCorrectAlignment;
++}
++
+ class ARM64LogicalImmediate {
+ public:
+     static ARM64LogicalImmediate create32(uint32_t value)
+diff --git a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.h b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.h
+index f86aec1c5400..14e477fde3b8 100644
+--- a/Source/JavaScriptCore/assembler/MacroAssemblerARM64.h
++++ b/Source/JavaScriptCore/assembler/MacroAssemblerARM64.h
+@@ -1244,6 +1244,16 @@ public:
+         m_assembler.ldnp<64>(dest1, dest2, src, offset.m_value);
+     }
+ 
++    void loadPair64(RegisterID src, FPRegisterID dest1, FPRegisterID dest2)
++    {
++        loadPair64(src, TrustedImm32(0), dest1, dest2);
++    }
++
++    void loadPair64(RegisterID src, TrustedImm32 offset, FPRegisterID dest1, FPRegisterID dest2)
++    {
++        m_assembler.ldp<64>(dest1, dest2, src, offset.m_value);
++    }
++
+     void abortWithReason(AbortReason reason)
+     {
+         // It is safe to use dataTempRegister directly since this is a crashing JIT Assert.
+@@ -1568,6 +1578,16 @@ public:
+         m_assembler.stnp<64>(src1, src2, dest, offset.m_value);
+     }
+ 
++    void storePair64(FPRegisterID src1, FPRegisterID src2, RegisterID dest)
++    {
++        storePair64(src1, src2, dest, TrustedImm32(0));
++    }
++
++    void storePair64(FPRegisterID src1, FPRegisterID src2, RegisterID dest, TrustedImm32 offset)
++    {
++        m_assembler.stp<64>(src1, src2, dest, offset.m_value);
++    }
++
+     void store32(RegisterID src, ImplicitAddress address)
+     {
+         if (tryStoreWithOffset<32>(src, address.base, address.offset))
+diff --git a/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.cpp b/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.cpp
+index 247c79dcb428..dfe09b671470 100644
+--- a/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.cpp
++++ b/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.cpp
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2012, 2016 Apple Inc. All rights reserved.
++ * Copyright (C) 2012-2021 Apple Inc. All rights reserved.
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+@@ -72,6 +72,8 @@ static const OpcodeGroupInitializer opcodeGroupList[] = {
+     OPCODE_GROUP_ENTRY(0x0a, A64DOpcodeLogicalShiftedRegister),
+     OPCODE_GROUP_ENTRY(0x0b, A64DOpcodeAddSubtractExtendedRegister),
+     OPCODE_GROUP_ENTRY(0x0b, A64DOpcodeAddSubtractShiftedRegister),
++    OPCODE_GROUP_ENTRY(0x0c, A64DOpcodeLoadStoreRegisterPair),
++    OPCODE_GROUP_ENTRY(0x0d, A64DOpcodeLoadStoreRegisterPair),
+     OPCODE_GROUP_ENTRY(0x11, A64DOpcodeAddSubtractImmediate),
+     OPCODE_GROUP_ENTRY(0x12, A64DOpcodeMoveWide),
+     OPCODE_GROUP_ENTRY(0x12, A64DOpcodeLogicalImmediate),
+@@ -1363,9 +1365,9 @@ const char* A64DOpcodeLoadStoreRegisterPair::format()
+     appendInstructionName(thisOpName);
+     unsigned offsetShift;
+     if (vBit()) {
+-        appendFPRegisterName(rt(), size());
++        appendFPRegisterName(rt(), size() + 2);
+         appendSeparator();
+-        appendFPRegisterName(rt2(), size());
++        appendFPRegisterName(rt2(), size() + 2);
+         offsetShift = size() + 2;
+     } else {
+         if (!lBit())
+diff --git a/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.h b/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.h
+index e071babb8e01..fd9db7cae58e 100644
+--- a/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.h
++++ b/Source/JavaScriptCore/disassembler/ARM64/A64DOpcode.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2012-2019 Apple Inc. All rights reserved.
++ * Copyright (C) 2012-2021 Apple Inc. All rights reserved.
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+@@ -787,7 +787,7 @@ public:
+ 
+ class A64DOpcodeLoadStoreRegisterPair : public A64DOpcodeLoadStore {
+ public:
+-    static constexpr uint32_t mask = 0x3a000000;
++    static constexpr uint32_t mask = 0x38000000;
+     static constexpr uint32_t pattern = 0x28000000;
+ 
+     DEFINE_STATIC_FORMAT(A64DOpcodeLoadStoreRegisterPair, thisObj);
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
