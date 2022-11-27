Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA84BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66ABD60E4E;
	Sun, 27 Nov 2022 21:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66ABD60E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0LcNIzISKtMJ; Sun, 27 Nov 2022 21:42:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C41360E60;
	Sun, 27 Nov 2022 21:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C41360E60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C23641BF422
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 21:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A47CC405E5
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 21:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A47CC405E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TDk4lLj1a27C for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 21:42:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF1F1400D3
 for <buildroot@uclibc.org>; Sun, 27 Nov 2022 21:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF1F1400D3
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D9BCE847F3; Sun, 27 Nov 2022 21:42:37 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 27 Nov 2022 21:42:37 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.7
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mek101-dev.inv@slmail.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15151-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15151] New: Busybox /etc/init.d scripts are not
 executable
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

https://bugs.busybox.net/show_bug.cgi?id=15151

            Bug ID: 15151
           Summary: Busybox /etc/init.d scripts are not executable
           Product: buildroot
           Version: 2022.02.7
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: mek101-dev.inv@slmail.me
                CC: buildroot@uclibc.org
  Target Milestone: ---

I've been trying to build a compact qemu VM with buildroot (commit
d036dc6ec873f50a24e73d8dbdafecb3b4098909) with a readonly filesystem.

At boot, the following error is displayed after the kernel messages:

> can't run '/etc/init.d/rcS': Permission denied

After a small investigation, it appears that busybox's init scripts aren't
marked with the executable bit permission, and as such aren't run.

> # ls -l /etc/init.d/
> total 9
> -rw-r--r--    1 root     root          1012 Nov 24 17:24 S01syslogd
> -rw-r--r--    1 root     root          1004 Nov 24 17:24 S02klogd
> -rw-r--r--    1 root     root          2804 Nov 24 17:24 S02sysctl
> -rw-r--r--    1 root     root          1620 Nov 24 17:24 S20urandom
> -rw-r--r--    1 root     root           438 Nov 24 17:24 S40network
> -rw-r--r--    1 root     root           423 Nov 24 17:24 rcK
> -rw-r--r--    1 root     root           408 Nov 24 17:24 rcS

This is while all the symlinks in /bin and /sbin are correctly set as
executable.
Perhaps a packaging error?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
