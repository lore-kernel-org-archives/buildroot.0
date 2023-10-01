Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EB8E748E9
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 12:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5AD341504;
	Sun,  1 Oct 2023 12:57:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5AD341504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9GNhQcVKI44; Sun,  1 Oct 2023 12:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C9A140A06;
	Sun,  1 Oct 2023 12:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C9A140A06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 47C541BF298
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21E7A82241
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 12:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21E7A82241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFwKNNfys_Yr for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 12:57:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67D048207C
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 12:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67D048207C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 553C582150; Sun,  1 Oct 2023 12:57:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Oct 2023 14:55:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4111a8db7fdfa8c2f1012cad38849d3fec41b5b3
X-Git-Newrev: 21d52e52d8dee0940d28b3a38551eb183be37813
X-Patchwork-Hint: ignore
Message-Id: <20231001125702.553C582150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils.mk: break hardlinks in
 global {TARGET, HOST}_DIR on per-package build
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

commit: https://git.buildroot.net/buildroot/commit/?id=21d52e52d8dee0940d28b3a38551eb183be37813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this patch, a make <pkg>_rebuild detects overwrites. Indeed, in
target_finalize steps some modifications are done on installed files (ie
strip or TARGET_FINALIZE_HOOKS for instance).

In order to avoid these modifications seen from per-package {TARGET,HOST}_DIR
and so been analyzed as some overwrites, global {TARGET,HOST}_DIR is built
using a full copy of the involved per-package files instead of hardlinks.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 530638566c..bdbdf20c23 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -217,7 +217,7 @@ ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
 define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
-		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+		rsync -a \
 			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(3)$(sep))
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
