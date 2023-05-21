Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6C4C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 14:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4395260C08;
	Sun, 21 May 2023 14:13:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4395260C08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F52fJAU4nsE9; Sun, 21 May 2023 14:13:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81EA760D59;
	Sun, 21 May 2023 14:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81EA760D59
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A43E01BF3D0
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 14:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A03382008
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 14:13:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A03382008
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5CU1Fk3S1-v for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 14:13:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0EDB81EA9
 for <buildroot@uclibc.org>; Sun, 21 May 2023 14:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0EDB81EA9
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 6DB5B86002; Sun, 21 May 2023 14:13:08 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sun, 21 May 2023 14:13:08 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2023.02.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yann.morin.1998@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-15576-163-z4nydnHMMK@https.bugs.busybox.net/>
In-Reply-To: <bug-15576-163@https.bugs.busybox.net/>
References: <bug-15576-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15576] Cannot skip post-image script with `make
 prepare-sdk`
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

https://bugs.busybox.net/show_bug.cgi?id=15576

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998@free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
mscdex, All,

Thanks for the report.

> It would be very useful to have an official/built-in way to bypass the
> post-image script

That's indeed pretty surprising. Could you please try this patch (not sure
if bugzilla keeps or removes TABs, so adapt if need be):

diff --git a/Makefile b/Makefile
index 3d0783242f..05b422d8d2 100644
--- a/Makefile
+++ b/Makefile
@@ -592,7 +592,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 world: target-post-image

 .PHONY: prepare-sdk
-prepare-sdk: world
+prepare-sdk: target-finalize staging-finalize host-finalize
        @$(call MESSAGE,"Rendering the SDK relocatable")
        PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath
host
        PER_PACKAGE_DIR=$(PER_PACKAGE_DIR) $(TOPDIR)/support/scripts/fix-rpath
staging


> (and possibly the other scripts) when doing `make prepare-sdk` (either
> implicitly or explicitly).

Post-fakeroot scripts are only caled when building an image, so the above patch
should also cover that case.

As for the post-build scripts, they are supposed to actually fixup the build,
and they may have to explixitly tweak host/ and staging/ for the purpose of
doing small last-minute cleanups and tweaks of various sorts, some which may
be needed to get a working SDK (I know of such a case). So I'm afraid that
is not going to be possible to cover both cases.

In such a case, I'd suggest that what you are doing, setting an environment
variable when you build the SDK and/or doing the full build, and checking that
variable in your post-build scripts, is the correct thing to do. I would
however argue that what your post-build scripts should not modify target/,
staging/, and/or host/ in a way that is incomaptible with assembling an SDK.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
