Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE8DC77B7C
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 19:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 139C260FD3;
	Sun, 21 May 2023 19:51:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 139C260FD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0I8ddABAwOF; Sun, 21 May 2023 19:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B95B60FC8;
	Sun, 21 May 2023 19:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B95B60FC8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5531BF3C1
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 19:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F59F82038
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 19:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F59F82038
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Azt4aGY-hERf for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 19:51:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BA8982022
 for <buildroot@uclibc.org>; Sun, 21 May 2023 19:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BA8982022
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 350DE83984; Sun, 21 May 2023 19:51:16 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 21 May 2023 19:51:15 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jbglaw@lug-owl.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15581-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15581] New: qemu_ppc_mpc8544ds_defconfig: Fails
 due to non-working patch
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

https://bugs.busybox.net/show_bug.cgi?id=15581

            Bug ID: 15581
           Summary: qemu_ppc_mpc8544ds_defconfig: Fails due to non-working
                    patch
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: jbglaw@lug-owl.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi!

I saw that the qemu_ppc_mpc8544ds_defconfig configuration doesn't work right
now because an existing patch for the Linux kernel does no longer apply:

[build 2023-05-21 19:04:41] for p in board/qemu/ppc-mpc8544ds/patches/linux ;
do if test -d $p ; then
PATH=/var/lib/laminar/run/buildroot-qemu_ppc_mpc8544ds_defconfig/4/buildroot/output/host/bin:$PATH
support/scripts/apply-patches.sh 
/var/lib/laminar/run/buildroot-qemu_ppc_mpc8544ds_defconfig/4/buildroot/output/build/linux-headers-6.1.26
$p \*.patch || exit 1 ; else
PATH=/var/lib/laminar/run/buildroot-qemu_ppc_mpc8544ds_defconfig/4/buildroot/output/host/bin:$PATH
support/scripts/apply-patches.sh 
/var/lib/laminar/run/buildroot-qemu_ppc_mpc8544ds_defconfig/4/buildroot/output/build/linux-headers-6.1.26
`dirname $p` `basename $p` || exit 1; fi done
[build 2023-05-21 19:04:41] 
[build 2023-05-21 19:04:41] Applying
0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch using patch: 
[build 2023-05-21 19:04:41] patching file arch/powerpc/Makefile
[build 2023-05-21 19:04:41] Hunk #1 succeeded at 10 (offset -2 lines).
[build 2023-05-21 19:04:41] Hunk #2 FAILED at 164.
[build 2023-05-21 19:04:41] Hunk #3 succeeded at 174 with fuzz 2 (offset -1
lines).
[build 2023-05-21 19:04:41] 1 out of 3 hunks FAILED -- saving rejects to file
arch/powerpc/Makefile.rej
[build 2023-05-21 19:04:41] make: *** [package/pkg-generic.mk:252:
/var/lib/laminar/run/buildroot-qemu_ppc_mpc8544ds_defconfig/4/buildroot/output/build/linux-headers-6.1.26/.stamp_patched]
Error 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
