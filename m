Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A01C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 22:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33F7141823;
	Wed, 30 Aug 2023 22:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33F7141823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUxmx--3wCFh; Wed, 30 Aug 2023 22:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F0464180C;
	Wed, 30 Aug 2023 22:05:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F0464180C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4E5D1BF424
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCEF881852
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 22:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCEF881852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MK3odwhg5kFk for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 22:05:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8AE3817FD
 for <buildroot@uclibc.org>; Wed, 30 Aug 2023 22:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8AE3817FD
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id D556F81E16; Wed, 30 Aug 2023 22:05:27 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 30 Aug 2023 22:05:27 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanghao.cheng@aioi-atg.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15745-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15745] New: Adding custom user account does
 nothing when the user table text file dose not have a terminating newline
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

https://bugs.busybox.net/show_bug.cgi?id=15745

            Bug ID: 15745
           Summary: Adding custom user account does nothing when the user
                    table text file dose not have a terminating newline
           Product: buildroot
           Version: 2023.02.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: yanghao.cheng@aioi-atg.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

As title

For example, 
```text @ package/bar/users_table.txt
foo -2 foo -2 =foo /home/foo /bin/bash - Foo user
```

When configure buildroot to use this user table according to the manual, log
shows that the content is being copied to the master user table:

_________________________________________________________________________
> cat package/bar/users_table.txt >> /home/yanghao/open-source/buildroot/buildroot/output/build/buildroot-fs/full_users_table.txt
>
> /yanghao/open-source/buildroot/buildroot/support/scripts/mkusers /home/yanghao/open-source/buildroot/buildroot/output/build/buildroot-fs/full_users_table.txt /home/yanghao/open-source/buildroot/buildroot/output/build/buildroot-fs/ext2/target >> /home/yanghao/open-source/buildroot/buildroot/output/build/buildroot-fs/ext2/fakeroot
__________________________________________________________________________

However, no user is created in the resulting filesystem.

Adding a newline at the end fixes it and works as expected. 
```text
foo -2 foo -2 =foo /home/foo /bin/bash - Foo user

```

In the end, I think this is a bug because it is not mentioned in the manual
Chapter 26. Makeusers syntax documentation and 9.6. Adding custom user
accounts.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
