Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8AAC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 17:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B144940728;
	Tue,  9 Jul 2024 17:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnrG82IlrJ4m; Tue,  9 Jul 2024 17:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9555241351
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9555241351;
	Tue,  9 Jul 2024 17:09:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 756091BF97E
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 17:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FCF740645
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 17:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srdIO4CyDeOA for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 17:09:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 815974062A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 815974062A
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 17:09:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D47D84308; Tue,  9 Jul 2024 17:09:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 19:03:35 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2ddb885f6bcbf5e774fe6cd172352cd5a868772a
X-Git-Newrev: 47caba65a0245812e21de9c5a6de92920d3b3c1d
X-Patchwork-Hint: ignore
Message-Id: <20240709170927.6D47D84308@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libmad: update
 the patches to be applied with fuzz 0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=47caba65a0245812e21de9c5a6de92920d3b3c1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libmad fails to build with output:

    Applying mips-gcc4.4.diff using series:
    patching file fixed.h
    Hunk #1 FAILED at 297.
    1 out of 1 hunk FAILED -- saving rejects to file fixed.h.rej

The package applied the patches in two steps, first the local ones and
then the official ones downloaded from the repository. The commit fixes
the issue by reversing the order of patch application steps.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit b21184a87733f2f2ccee69cade6875c507e439dc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmad/libmad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 084a533cc0..9f3396b1a4 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -19,7 +19,7 @@ define LIBMAD_APPLY_DEBIAN_PATCHES
 	fi
 endef
 
-LIBMAD_POST_PATCH_HOOKS += LIBMAD_APPLY_DEBIAN_PATCHES
+LIBMAD_PRE_PATCH_HOOKS += LIBMAD_APPLY_DEBIAN_PATCHES
 
 # debian/patches/md_size.diff
 LIBMAD_IGNORE_CVES += CVE-2017-8372 CVE-2017-8373
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
