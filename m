Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891B7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 17:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77F7A405AB;
	Sun,  9 Jan 2022 17:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v_dIDMBI6rvm; Sun,  9 Jan 2022 17:41:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6523F405B0;
	Sun,  9 Jan 2022 17:41:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56F631BF475
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E21281CAF
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMAEpurAXTn2 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 17:40:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E48EE81CAD
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 17:40:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E8E2F82DEE; Sun,  9 Jan 2022 17:34:36 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 18:33:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f8fd984d89e25a2e1a2cc6d25c915ecd39c444b
X-Git-Newrev: 56d50e835441f384cc2d1b29ccbeed0b1f936728
X-Patchwork-Hint: ignore
Message-Id: <20220109173436.E8E2F82DEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo.mk: correctly call
 $(subst ...)
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

commit: https://git.buildroot.net/buildroot/commit/?id=56d50e835441f384cc2d1b29ccbeed0b1f936728
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b6378631c2609742382984f6f7b93c1d9d2cdb78 introduced a call to the
subst make function, but did it incorrectly (followed by comma instead
of space). The result is that it expands to empty.

Fix the call.

Fixes:
http://autobuild.buildroot.net/results/8ea/8eacd455e4767cc7b1e912a3f910c940110c3be0/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 77d2f66b17..067c45a920 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -44,7 +44,7 @@ PKG_CARGO_ENV = \
 	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
 	CARGO_TARGET_APPLIES_TO_HOST="false" \
 	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
-	CARGO_TARGET_$(subst,-,_,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
+	CARGO_TARGET_$(subst -,_,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
 
 HOST_PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
