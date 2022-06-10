Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF89C43334
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 23:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F29198439B;
	Fri, 10 Jun 2022 23:57:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bs8vVNQWo6Tp; Fri, 10 Jun 2022 23:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 320CE84394;
	Fri, 10 Jun 2022 23:57:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCD761BF863
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 23:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A98CF41971
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 23:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4HJEK9YAUv1O for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 23:57:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA9DE4196E
 for <buildroot@uclibc.org>; Fri, 10 Jun 2022 23:57:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 659F183C72; Fri, 10 Jun 2022 23:45:56 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 10 Jun 2022 23:57:55 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2020.02.10
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bmurdock@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14841-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14841] New: support/download/git fails with
 "fatal: No such remote 'origin'" due to incorrect check for origin remote
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

https://bugs.busybox.net/show_bug.cgi?id=14841

            Bug ID: 14841
           Summary: support/download/git fails with "fatal: No such remote
                    'origin'" due to incorrect check for origin remote
           Product: buildroot
           Version: 2020.02.10
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: bmurdock@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

The git script does the following:

- initializes a git repo
- checks if the remote named origin exists
- if it exists, it call git remote set-url to set the correct url for the
origin remote

The problem is, it uses the command 'git remote | grep '^origin$'' to check if
origin exists.  This command always prints the word origin, even if the origin
remote doesn't actually exist in the repo.  It's unfortunate, but that's how
git works.  On a brand new git repo, origin does not exist, but this part of
the script believes it does exist, so it calls git remote set-url which then
fails because origin doesn't exist.

In my project I noticed two packages, flashbench and mmc_utils that use the git
download method and it fails for both of them.  The packages still succeed
because they fallback to a different download method.  I can imagine that's one
reason why this has not been noticed.

You will also not see this error if the git repo already exists with an actual
origin remote that has been configured.

The proper way to check if origin exists is to do this:

if ! git config remote.origin.url | /dev/null; then...

I have a patch for this and I will work on sending it to the mailing list.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
