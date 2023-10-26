Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEECC25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 18:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9418C6FAF9;
	Thu, 26 Oct 2023 18:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9418C6FAF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m69pcNtiXYvs; Thu, 26 Oct 2023 18:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D80FD6FAFA;
	Thu, 26 Oct 2023 18:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D80FD6FAFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 270231BF378
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3FCE417FB
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FCE417FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6anuNOFtwJbK for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 18:36:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2EDFD417C2
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 18:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EDFD417C2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1132385F91; Thu, 26 Oct 2023 18:36:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 20:30:47 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d19e8ca76870e02a0d4dcb33bb672a7e72ab5456
X-Git-Newrev: afd4e922385735b61e0c8a865579fbdefbb393b5
X-Patchwork-Hint: ignore
Message-Id: <20231026183627.1132385F91@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Revert
 "package/pkg-utils.mk: break hardlinks in global {TARGET,
 HOST}_DIR on per-package build"
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

commit: https://git.buildroot.net/buildroot/commit/?id=afd4e922385735b61e0c8a865579fbdefbb393b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
(cherry picked from commit 8f1487d6fa4cde5330f73e2432c264c0bd7940c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
