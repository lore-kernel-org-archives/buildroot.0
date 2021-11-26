Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6949EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 26 Nov 2021 15:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E175B403EE;
	Fri, 26 Nov 2021 15:14:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qXVD7OWcCfl; Fri, 26 Nov 2021 15:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 429A540357;
	Fri, 26 Nov 2021 15:14:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDC2C1BF34A
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 15:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABB2B400CF
 for <buildroot@lists.busybox.net>; Fri, 26 Nov 2021 15:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f_aK_yX4xru3 for <buildroot@lists.busybox.net>;
 Fri, 26 Nov 2021 15:13:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 858E340239
 for <buildroot@uclibc.org>; Fri, 26 Nov 2021 15:13:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 7F0EE88D0D; Fri, 26 Nov 2021 15:09:25 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Fri, 26 Nov 2021 15:13:58 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.08.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: okitain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14396-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14396] New: GIthub schema is broken
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

https://bugs.busybox.net/show_bug.cgi?id=14396

            Bug ID: 14396
           Summary: GIthub schema is broken
           Product: buildroot
           Version: 2021.08.2
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: okitain@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Github seems to have adopted a new schema for releases: instead of:

https://github.com/<user>/<project>/archive/<version>/<project>-<version>.tar.gz

it's now:

https://github.com/<user>/<project>/archive/refs/tags/<version>.tar.gz

which is then redirected to a location containing <project>-<version>.tar.gz.
This effectively breaks at least jsmn and gtest, but probably all github
packages.

Steps to reproduce:

1. Download a fresh Buildroot, e.g. the master branch.
2. make menuconfig and select gtest
3. In menuconfig: disable BR2_BACKUP_SITE
3. make source

This results in GTest download failing with error 404:

wget --passive-ftp -nd -t 3 -O
'/home/user/projects/buildroot/output/build/.gtest-1.11.0.tar.gz.FcavV0/output'
'https://github.com/google/googletest/archive/release-1.11.0/gtest-1.11.0.tar.gz' 
--2021-11-26 18:12:27-- 
https://github.com/google/googletest/archive/release-1.11.0/gtest-1.11.0.tar.gz
Location:
https://codeload.github.com/google/googletest/tar.gz/release-1.11.0/gtest-1.11.0
[following]
--2021-11-26 18:12:27-- 
https://codeload.github.com/google/googletest/tar.gz/release-1.11.0/gtest-1.11.0
Connecting to proxy.elvees.com (proxy.elvees.com)|192.168.1.15|:3128...
connected.
Proxy request sent, awaiting response... 404 Not Found
2021-11-26 18:12:28 ERROR 404: Not Found.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
