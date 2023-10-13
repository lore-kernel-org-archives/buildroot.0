Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6B8CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD16A610D6;
	Fri, 13 Oct 2023 14:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD16A610D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRjFRpMFe2DD; Fri, 13 Oct 2023 14:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E53876F5A1;
	Fri, 13 Oct 2023 14:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E53876F5A1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12ED31BF99D
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFF0281F05
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 14:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFF0281F05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMP5KhVSfbhd for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA3EA814B3
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA3EA814B3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9022847A4; Fri, 13 Oct 2023 14:46:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 16:36:00 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 18a767beca20833760f7cc7ebf179b20ea85e9e6
X-Git-Newrev: 71132ca41bc1b99374f406267d985be50aca9679
X-Patchwork-Hint: ignore
Message-Id: <20231013144605.A9022847A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/pkg-utils.mk:
 break hardlinks in global {TARGET, HOST}_DIR on per-package build
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

commit: https://git.buildroot.net/buildroot/commit/?id=71132ca41bc1b99374f406267d985be50aca9679
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Without this patch, a make <pkg>_rebuild detects overwrites. Indeed, in
target_finalize steps some modifications are done on installed files (ie
strip or TARGET_FINALIZE_HOOKS for instance).

In order to avoid these modifications seen from per-package {TARGET,HOST}_DIR
and so been analyzed as some overwrites, global {TARGET,HOST}_DIR is built
using a full copy of the involved per-package files instead of hardlinks.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 21d52e52d8dee0940d28b3a38551eb183be37813)
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
