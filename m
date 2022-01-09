Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B78EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B793B404B2;
	Sun,  9 Jan 2022 11:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jCpzpFMGYb04; Sun,  9 Jan 2022 11:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3BFC4047C;
	Sun,  9 Jan 2022 11:14:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B8D01BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89B1D81779
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fTTRjMDdpIVt for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBC1E81777
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:14:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9242882B94; Sun,  9 Jan 2022 11:07:56 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 12:13:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98c7ea3ddf11d08acd11e30be36b4b56c682d239
X-Git-Newrev: 91a5a2d317a02d7fb41e706a490fe5063039d55c
X-Patchwork-Hint: ignore
Message-Id: <20220109110756.9242882B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo.mk: use
 CARGO_BUILD_TARGET instead of --target
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

commit: https://git.buildroot.net/buildroot/commit/?id=91a5a2d317a02d7fb41e706a490fe5063039d55c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will allow PKG_CARGO_ENV to be used in other contexts, such as
the upcoming python-cryptography version bump.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index c8dfc62db2..7f63595831 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -42,7 +42,8 @@ PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV) \
 	__CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
 	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
-	CARGO_TARGET_APPLIES_TO_HOST="false"
+	CARGO_TARGET_APPLIES_TO_HOST="false" \
+	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)"
 
 HOST_PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV)
@@ -102,7 +103,6 @@ define $(2)_BUILD_CMDS
 		$$($(2)_CARGO_ENV) \
 		cargo build \
 			--offline \
-			--target $$(RUSTC_TARGET_NAME) \
 			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
 			--manifest-path Cargo.toml \
 			--locked \
@@ -138,7 +138,6 @@ define $(2)_INSTALL_TARGET_CMDS
 		$$(PKG_CARGO_ENV) \
 		$$($(2)_CARGO_ENV) \
 		cargo install \
-			--target $$(RUSTC_TARGET_NAME) \
 			--offline \
 			--root $$(TARGET_DIR)/usr/ \
 			--bins \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
