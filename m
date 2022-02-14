Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB04C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 448BC40368;
	Mon, 14 Feb 2022 20:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QbMsPHX7ZxZL; Mon, 14 Feb 2022 20:35:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DD9A401B2;
	Mon, 14 Feb 2022 20:35:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D15A81BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEB09607E3
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:35:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WpQG3NBpXlk3 for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:35:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E60760634
 for <buildroot@uclibc.org>; Mon, 14 Feb 2022 20:35:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id E425C82AD4; Mon, 14 Feb 2022 20:28:00 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Mon, 14 Feb 2022 20:35:36 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: romain.naour@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14581-163-tUG7NhAbr8@https.bugs.busybox.net/>
In-Reply-To: <bug-14581-163@https.bugs.busybox.net/>
References: <bug-14581-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14581] qemu-system-ppc -M mac99 does not boot for
 glibc system
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14581

--- Comment #1 from romain.naour@gmail.com ---
Hi Waldemar,

Thanks for the report!

I can reproduce it easily with gcc-10 and gcc-11 but not with gcc-9.

The powerpc 7400 support has been broken since the beginning of gcc-10
development.
After the commit [1] removing -many from the options passed by default to the
assembler, the build of this defconfig fail with assembler errors:

arch/powerpc/perf/bhrb.S: Assembler messages:
arch/powerpc/perf/bhrb.S:22: Error: unrecognized opcode: `cmpldi'
arch/powerpc/perf/bhrb.S:24: Error: unrecognized opcode: `ld'
arch/powerpc/perf/bhrb.S:25: Error: unrecognized opcode: `sldi'

It was fixed later by the commit [2] before the gcc-10 release but glibc
segfault at runtime since then.

The Buildroot gitlab-ci testing only test with uClibc-ng libc but I try
sometime with Glibc... but I missed this issue.

This issue should be reported to gcc.

[1]
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e154242724b084380e3221df7c08fcdbd8460674
[2]
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=66711279083121b07d909ac0fc2f3a744ac7c937

Best regards,
Romain

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
