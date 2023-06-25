Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD96EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 15:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B59C360BFE;
	Sun, 25 Jun 2023 15:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B59C360BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cWGnCvWfcm1Y; Sun, 25 Jun 2023 15:39:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B06607EC;
	Sun, 25 Jun 2023 15:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2B06607EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E56791BF3F2
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB9BD607EC
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 15:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB9BD607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Auik7z0vchMl for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 15:39:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF74160742
 for <buildroot@uclibc.org>; Sun, 25 Jun 2023 15:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF74160742
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D9EF78275A; Sun, 25 Jun 2023 15:39:52 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 25 Jun 2023 15:39:52 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.05
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vfazio@xes-inc.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: vfazio@xes-inc.com
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: assigned_to bug_status
Message-ID: <bug-15634-163-NLzGqIvHJm@https.bugs.busybox.net/>
In-Reply-To: <bug-15634-163@https.bugs.busybox.net/>
References: <bug-15634-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15634] fluidsynths refers to missing libgomp.so.1
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

https://bugs.busybox.net/show_bug.cgi?id=15634

Vincent Fazio <vfazio@xes-inc.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Assignee|unassigned@buildroot.uclibc |vfazio@xes-inc.com
                   |.org                        |
             Status|NEW                         |ASSIGNED

--- Comment #5 from Vincent Fazio <vfazio@xes-inc.com> ---
I lied, the "easiest" option is probably to use `BR2_TOOLCHAIN_EXTRA_LIBS` to
copy in libgomp.

I've pushed a PR to bootlin to fix one of the root causes:
https://github.com/bootlin/toolchains-builder/pull/61

I'm also working on a series of patches on
https://gitlab.com/vfazio/buildroot/-/commits/vfazio-openmp-packages that will:

1: update known packages that use OpenMP to be sensitive to this issue
2. fix the flags for the bootlin toolchains
3. make our toolchain "supported libraries" check a bit more robust to catch
the reverse condition of "support available but not flagged"

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
