Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8976BC004C0
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 19:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E68F40131;
	Sat, 21 Oct 2023 19:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E68F40131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTDR3sY5mVQB; Sat, 21 Oct 2023 19:24:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96234404D5;
	Sat, 21 Oct 2023 19:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96234404D5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 213C91BF3D2
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 19:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDBE84F252
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 19:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDBE84F252
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDB_nFp3xsVg for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 19:24:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63D7D4F249
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 19:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63D7D4F249
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42CAE856A9; Sat, 21 Oct 2023 19:24:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Oct 2023 21:08:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f23277c41ec05ccd13389fb806d83deafee8d22
X-Git-Newrev: 8f1487d6fa4cde5330f73e2432c264c0bd7940c6
X-Patchwork-Hint: ignore
Message-Id: <20231021192400.42CAE856A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/pkg-utils.mk: break
 hardlinks in global {TARGET, HOST}_DIR on per-package build"
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f1487d6fa4cde5330f73e2432c264c0bd7940c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 21d52e52d8de (package/pkg-utils.mk: break hardlinks in global
{TARGET, HOST}_DIR on per-package build) stopped hardlink the source and
destination when rsyncing per-package directory, on the rationale that
modifying files in-place after the rsync would also modify the original
file, and that break foo-rebuild and can cause issues with post-build
scripts.

However, what 21d52e52d8de did not envision, is that copying instead of
hard-linking has two nasty side effects:

  - the size increase for the build directory increase with the number
    of packages and with the depth of th dependency chains for those
    packages: a (relatively small) build that was previously totalling
    ~13GiB in output/, now totals north of 122GiB, an almost 10-time
    increase;

  - the build time increases, as it takes more time to read+write files
    than it takes to create a new link to a file; the same build saw an
    increase of build time from 5min 10s to 7min 30s, a 45% increase.

These regressions are both serious, so revert the change; we'll come up
with a stopgap measure in follow-up commits.

This reverts commit 21d52e52d8dee0940d28b3a38551eb183be37813.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Herve Codina <herve.codina@bootlin.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ba3da68a7b..5d5980b098 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -217,7 +217,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a \
+		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(3)$(sep))
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
