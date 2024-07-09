Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F40BC2BD09
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 17:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB18D4132D;
	Tue,  9 Jul 2024 17:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfRuVzQGCTfc; Tue,  9 Jul 2024 17:10:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8FE74135C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8FE74135C;
	Tue,  9 Jul 2024 17:10:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 170291BF852
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 17:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6043E80C9A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 17:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bj1fDBRIDUIc for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 17:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95C2380CD7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95C2380CD7
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 17:10:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8483F8439E; Tue,  9 Jul 2024 17:10:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 19:03:05 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: d4c11516320f4c221afaccdb449f3fb0a992520e
X-Git-Newrev: 167680d773a2edc19defe24e50f0af9fc1e9816e
X-Patchwork-Hint: ignore
Message-Id: <20240709171037.8483F8439E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libmad: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=167680d773a2edc19defe24e50f0af9fc1e9816e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
