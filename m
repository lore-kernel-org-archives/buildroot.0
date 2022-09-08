Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1542BC38145
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 20:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7176140194;
	Thu,  8 Sep 2022 20:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7176140194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFx2s91VPZBi; Thu,  8 Sep 2022 20:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FCF44015F;
	Thu,  8 Sep 2022 20:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FCF44015F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 726A71BF402
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 20:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58FE24175D
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 20:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58FE24175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtRUIqtIvAI8 for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 20:54:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44E0D4175B
 for <buildroot@uclibc.org>; Thu,  8 Sep 2022 20:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E0D4175B
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 2F694825F9; Thu,  8 Sep 2022 20:54:39 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Thu, 08 Sep 2022 20:54:38 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2021.08
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael.johnson@getcruise.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-14991-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14991] New: Cannot Patch Toolchain Files Using
 BR2_GLOBAL_PATCH_DIR
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

https://bugs.busybox.net/show_bug.cgi?id=14991

            Bug ID: 14991
           Summary: Cannot Patch Toolchain Files Using
                    BR2_GLOBAL_PATCH_DIR
           Product: buildroot
           Version: 2021.08
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: michael.johnson@getcruise.com
                CC: buildroot@uclibc.org
  Target Milestone: ---

I am attempting to patch include/c++/10.2.1/variant that gets built as part of
buildroot to avoid a nvcc compiler issue my company is dealing with. In so
doing, I wrote a patch file and placed it in 

/app/br2_external/patches/toolchain-external-arm-aarch64/2020.11/0000-std-variant-nvcc-compat.patch

Supplied the BR config BR2_GLOBAL_PATCH_DIR=/app/br2_external/patches

Then when building the toolchain with `make toolchain` my patch file is failing
to find the appropriate path to variant. I dug into the final call that is
being made by patch, and found the underlying command be run was:

    cat
/app/br2_external/patches/toolchain-external-arm-aarch64/00-std-variant-nvcc-compat.patch
| patch -g0 -p1 -E --no-backup-if-mismatch -d 
/app/tmp/sources/buildroot/output/build/toolchain-external-arm-aarch64-2020.11
-t -N

The key here was the patch was attempting to run in the directory
toolchain-external-arm-aarch64-2020.11

However, when I looked at `make V=1 toolchain`, I saw during
toolchain-external-arm-aarch64 extraction phase, ALL of the src was moved from
toolchain-external-arm-aarch64 to 
/app/tmp/sources/buildroot/output/host/*

Because the extraction moves the files to a different path AND patch uses -p1
(Which essentially breaks absolute paths in patch files), I am fairly confident
there is no way to apply patches to the toolchain source files via the
BR2_GLOBAL_PATCH_DIR mechanism. It would be AMAZING if this were to be
possible! 

We are exploring forking BR as an alternative, changing the source URL of the
gcc toolchain to provide an already-patched tarball rather than having
buildroot patch at buildtime :/ 


We use BR 2021.08 today!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
