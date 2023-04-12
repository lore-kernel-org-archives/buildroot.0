Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2B1C77B6E
	for <buildroot@archiver.kernel.org>; Wed, 12 Apr 2023 19:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0004F41369;
	Wed, 12 Apr 2023 19:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0004F41369
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1gzNo17GBsR; Wed, 12 Apr 2023 19:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA4041DF5;
	Wed, 12 Apr 2023 19:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA4041DF5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 72FEC1C3C69
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 19:54:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BF60818A2
 for <buildroot@lists.busybox.net>; Wed, 12 Apr 2023 19:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BF60818A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-79h-SCN5Eo for <buildroot@lists.busybox.net>;
 Wed, 12 Apr 2023 19:54:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10BF0819FC
 for <buildroot@uclibc.org>; Wed, 12 Apr 2023 19:54:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10BF0819FC
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id F14A6825A7; Wed, 12 Apr 2023 19:54:29 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 12 Apr 2023 19:54:29 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2020.02
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lgadallah@impinj.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15541-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15541] New: support/downloads/git generates
 deceptive archive of Linux repo
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

https://bugs.busybox.net/show_bug.cgi?id=15541

            Bug ID: 15541
           Summary: support/downloads/git generates deceptive archive of
                    Linux repo
           Product: buildroot
           Version: 2020.02
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: lgadallah@impinj.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

Given:
- Select a local commit ID/tag for the Linux kernel that does not exist in the
local Linux kernel repo by setting BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION in the
defconfig file
- Run a build

Expected behavior:
- Build should fail when expected commit ID/tag of the Linux kernel repo cannot
be checked out

Observed behavior:
- Build does not fail when expected commit ID/tag of the Linux kernel repo
cannot be checked out
- Build creates archive of Linux kernel repo in linux/linux-<commit
ID>-br1.tar.gz
- Adding some instrumentation to the support/downloads/git script shows that
the actual commit ID in the linux/linux-<commit ID>-br1.tar.gz file is the HEAD
of the local Linux repo, not the (non-existent) commit ID requested
- Build proceeds and succeeds with the linux/linux-<commit ID>-br1.tar.gz file,
with only a warning like this showing in the build log:

2023-03-15T11:45:24.9572834Z [7m>>> linux
0af534041cba4c33e540f6b31b73ce78f8326757 Downloading[27m
2023-03-15T11:45:25.0699794Z Reinitialized existing Git repository in
/mnt/home/dl/linux/git/.git/
2023-03-15T11:45:25.1164499Z Fetching all references
2023-03-15T11:45:26.0788251Z Warning: Permanently added
'github.com,192.30.255.112' (ECDSA) to the list of known hosts.
2023-03-15T11:45:26.0788565Z 
2023-03-15T11:46:06.2456837Z warning: refname
'0af534041cba4c33e540f6b31b73ce78f8326757' is ambiguous.
2023-03-15T11:46:06.2457533Z Git normally never creates a ref that ends with 40
hex characters
2023-03-15T11:46:06.2458253Z because it will be ignored when you just specify
40-hex. These refs
2023-03-15T11:46:06.2458834Z may be created by mistake. For example,
2023-03-15T11:46:06.2459109Z 
2023-03-15T11:46:06.2459403Z   git switch -c $br $(git rev-parse ...)
2023-03-15T11:46:06.2459683Z 
2023-03-15T11:46:06.2460022Z where "$br" is somehow empty and a 40-hex ref is
created. Please
2023-03-15T11:46:06.2461804Z examine these refs and maybe delete them. Turn
this message off by
2023-03-15T11:46:06.2462318Z running "git config advice.objectNameWarning
false"
2023-03-15T11:47:54.3146989Z [7m>>> linux
0af534041cba4c33e540f6b31b73ce78f8326757 Extracting[27m

2023-03-15T11:47:54.3157663Z gzip -d -c
/mnt/home/dl/linux/linux-0af534041cba4c33e540f6b31b73ce78f8326757-br1.tar.gz |
tar --strip-components=1 -C
/mnt/work/output/r515_octane/build/linux-0af534041cba4c33e540f6b31b73ce78f8326757
  -xf -

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
