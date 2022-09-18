Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 263E3C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 13:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 976DF60E3C;
	Sun, 18 Sep 2022 13:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 976DF60E3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gPUWWOnf904k; Sun, 18 Sep 2022 13:06:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C64E660D71;
	Sun, 18 Sep 2022 13:06:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C64E660D71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5E91BF426
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46E564047C
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 13:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46E564047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3HR19G2qaVX for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 13:06:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A62B40111
 for <buildroot@uclibc.org>; Sun, 18 Sep 2022 13:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A62B40111
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1854C85171; Sun, 18 Sep 2022 13:06:02 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 18 Sep 2022 13:06:01 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: thomas.petazzoni@bootlin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14796-163-SDgXeXYLLg@https.bugs.busybox.net/>
In-Reply-To: <bug-14796-163@https.bugs.busybox.net/>
References: <bug-14796-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14796] 64 bit time and seccomp conflict (OpenSSH
 server crash)
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

https://bugs.busybox.net/show_bug.cgi?id=14796

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Peter Korsgaard and I finally had a look at this today, and we think we finally
understand what is going on.

glibc does not care about the kernel headers when deciding whether to use the
clock_gettime64() syscall or not: it always use it, and if that fails at
runtime, it falls back to clock_gettime(). This is how glibc ends up using
clock_gettime64() even if your kernel does not support it.

On the other hand, the OpenSSL seccomp code relies on kernel headers to decide
whether the clock_gettime64() syscall should be in the allowed list of syscalls
or not.

So when you are in a situation where glibc is recent, but your kernel is older,
you get into precisely the problem you have: glibc tries to use
clock_gettime64, but OpenSSH seccomp configuration prevents that, which does
not allow glibc to gracefully fallback to clock_gettime.

The only solution that we see is to disable seccomp support in OpenSSH. Peter
will send a patch for this. I will keep this bug open until this patch is
posted and hopefully merged.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
