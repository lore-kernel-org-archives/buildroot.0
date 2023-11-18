Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCA6C2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 08:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB60541F69;
	Sat, 18 Nov 2023 08:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB60541F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EpuEXWoz7D-s; Sat, 18 Nov 2023 08:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB29D41F4C;
	Sat, 18 Nov 2023 08:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB29D41F4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 205391BF228
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 08:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECE7C83BA1
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 08:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECE7C83BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KsT1v4Mmnxzo for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 08:59:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3564782925
 for <buildroot@uclibc.org>; Sat, 18 Nov 2023 08:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3564782925
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 1AB84814C6; Sat, 18 Nov 2023 08:59:16 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 18 Nov 2023 08:59:15 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.08.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ciprian.craciun@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15856-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15856] New: Using BR2_CONFIG= on a different
 file-system than O= (build outputs) fails with kconfig syncconfig error
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

https://bugs.busybox.net/show_bug.cgi?id=15856

            Bug ID: 15856
           Summary: Using BR2_CONFIG= on a different file-system than O=
                    (build outputs) fails with kconfig syncconfig error
           Product: buildroot
           Version: 2023.08.3
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: ciprian.craciun@gmail.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

If one has BuildRoot sources checked out on a file-system, but uses a build
outputs folder on a different file-system (via `make O=...`) and one also
specifies `BR2_CONFIG` on the first file-system (the one holding the sources),
the `make syncconfig` target fails with an `*** Error during update of the
configuration.` error.

`strace`-ing the `conf syncconfig` invocation leads me to the following
conclusion:

* something in the build system (perhaps `kconfig`) creates temporary files in
the parent folder of the configuration file (the one specified via
`BR2_CONFIG`);

* but then it tries to move it inside the outputs folder with a simple `rename`
syscall`;

* this fails because the rename is cross mount points;

The output of `strace` (here `/mnt/.../sources` where the sources and the
config are is a different mount point than `/mnt/.../volatile` where the
outputs are):
~~~~
rename("/mnt/.../sources/buildroot/!custom/.tmpconfig.h",
"/mnt/.../volatile/buildroot/build/build/buildroot-config/autoconf.h") = -1
EXDEV (Invalid cross-device link)
~~~~

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
