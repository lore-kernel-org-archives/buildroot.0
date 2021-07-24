Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660ADC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:18:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6B8608FB
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B6B8608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE4D7835C8;
	Sat, 24 Jul 2021 20:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bt6ga3oNicES; Sat, 24 Jul 2021 20:18:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CBDD835B9;
	Sat, 24 Jul 2021 20:18:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 794881BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69584400CE
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XA__7zV2frcw for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:18:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29371400BE
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 20:17:59 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 2235A20003;
 Sat, 24 Jul 2021 20:17:57 +0000 (UTC)
Date: Sat, 24 Jul 2021 22:17:57 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20210724221757.68ad04fd@windsurf>
In-Reply-To: <20210724020533.2486844-1-james.hilliard1@gmail.com>
References: <20210724020533.2486844-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: fix aarch64 renderer
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Fri, 23 Jul 2021 20:05:33 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to backport an aarch64 patch to prevent a crash.
> 
> Fixes:
> ==654== Conditional jump or move depends on uninitialised value(s)
> ==654==    at 0x68CF9D0: contains (Range.h:115)
> ==654==    by 0x68CF9D0: mark (JITStubRoutineSet.h:57)
> ==654==    by 0x68CF9D0: mark (ConservativeRoots.cpp:127)
> ==654==    by 0x68CF9D0: genericAddPointer<JSC::CompositeMarkHook> (ConservativeRoots.cpp:69)
> ==654==    by 0x68CF9D0: genericAddSpan<JSC::CompositeMarkHook> (ConservativeRoots.cpp:101)
> ==654==    by 0x68CF9D0: JSC::ConservativeRoots::add(void*, void*, JSC::JITStubRoutineSet&, JSC::CodeBlockSet&) (ConservativeRoots.cpp:147)
> ==654==    by 0x68EA5BB: JSC::MachineThreads::gatherConservativeRoots(JSC::ConservativeRoots&, JSC::JITStubRoutineSet&, JSC::CodeBlockSet&, JSC::CurrentThreadState*, WTF::Thread*) (MachineStackMarker.cpp:202)
> ==654==    by 0x68D885B: _ZZN3JSC4Heap18addCoreConstraintsEvENUlRT_E0_clINS_11SlotVisitorEEEDaS2_ (Heap.cpp:2740)
> ==654==    by 0x68EFF7B: JSC::MarkingConstraint::execute(JSC::SlotVisitor&) (MarkingConstraint.cpp:58)
> ==654==    by 0x68F3D83: JSC::MarkingConstraintSolver::runExecutionThread(JSC::SlotVisitor&, JSC::MarkingConstraintSolver::SchedulerPreference, WTF::ScopedLambda<WTF::Optional<unsigned int> ()>) (MarkingConstraintSolver.cpp:237)
> ==654==    by 0x68D4413: JSC::Heap::runTaskInParallel(WTF::RefPtr<WTF::SharedTask<void (JSC::SlotVisitor&)>, WTF::RawPtrTraits<WTF::SharedTask<void (JSC::SlotVisitor&)> >, WTF::DefaultRefDerefTraits<WTF::SharedTask<void (JSC::SlotVisitor&)> > >) (Heap.cpp:3061)
> ==654==    by 0x68F3E9F: runFunctionInParallel<JSC::MarkingConstraintSolver::execute(JSC::MarkingConstraintSolver::SchedulerPreference, WTF::ScopedLambda<WTF::Optional<unsigned int>()>)::<lambda(JSC::SlotVisitor&)> > (Heap.h:397)
> ==654==    by 0x68F3E9F: JSC::MarkingConstraintSolver::execute(JSC::MarkingConstraintSolver::SchedulerPreference, WTF::ScopedLambda<WTF::Optional<unsigned int> ()>) (MarkingConstraintSolver.cpp:66)
> ==654==    by 0x68F4033: JSC::MarkingConstraintSolver::drain(WTF::BitVector&) (MarkingConstraintSolver.cpp:97)
> ==654==    by 0x68F4B2F: JSC::MarkingConstraintSet::executeConvergenceImpl(JSC::SlotVisitor&) (MarkingConstraintSet.cpp:114)
> ==654==    by 0x68F4C6B: JSC::MarkingConstraintSet::executeConvergence(JSC::SlotVisitor&) (MarkingConstraintSet.cpp:83)
> ==654==    by 0x68D9BC7: JSC::Heap::runFixpointPhase(JSC::GCConductor) (Heap.cpp:1378)
> ==654==    by 0x68D9E93: runCurrentPhase (Heap.cpp:1208)
> ==654==    by 0x68D9E93: JSC::Heap::runCurrentPhase(JSC::GCConductor, JSC::CurrentThreadState*) (Heap.cpp:1176)
> ==654==  Uninitialised value was created by a stack allocation
> ==654==    at 0x5AC3E80: JSC::ARM64Assembler::linkJump(JSC::AssemblerLabel, JSC::AssemblerLabel, JSC::ARM64Assembler::JumpType, JSC::ARM64Assembler::Condition) [clone .isra.0] (ARM64Assembler.h:2556)
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...support-for-FP-registers-plus-some-b.patch | 382 ++++++++++++++++++
>  1 file changed, 382 insertions(+)
>  create mode 100644 package/wpewebkit/0001-Add-ldp-and-stp-support-for-FP-registers-plus-some-b.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
