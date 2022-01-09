Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A0BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 18:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 258BC40336;
	Sun,  9 Jan 2022 18:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDdbqMD8jbvn; Sun,  9 Jan 2022 18:08:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68D2D4032C;
	Sun,  9 Jan 2022 18:08:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7271BF488
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB3CD40495
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 18:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X_iDvGynCz4m for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 18:08:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D478740166
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 18:08:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CB79282E00; Sun,  9 Jan 2022 18:02:38 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 19:08:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7178fd1ca0340d0fad34734ab5a462c7f95debd
X-Git-Newrev: ac573c55aac3cbb4257f5388c91321c81095c654
X-Patchwork-Hint: ignore
Message-Id: <20220109180238.CB79282E00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo: convert to uppercase
 RUSTC_TARGET_NAME
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac573c55aac3cbb4257f5388c91321c81095c654
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

RUSTC_TARGET_NAME's dashes are substituted with underscores, but this is
not enough to fix building, we also need to make it UPPERCASE. So let make
it like that by using UPPERCASE macro.

Fixes:
http://autobuild.buildroot.net/results/498/498b96224c8bcff91542ca3731dfd66891f4ec23/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Arnout: remove subst, implied by UPPERCASE]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 067c45a920..614d46ad64 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -44,7 +44,7 @@ PKG_CARGO_ENV = \
 	CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
 	CARGO_TARGET_APPLIES_TO_HOST="false" \
 	CARGO_BUILD_TARGET="$(RUSTC_TARGET_NAME)" \
-	CARGO_TARGET_$(subst -,_,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
+	CARGO_TARGET_$(call UPPERCASE,$(RUSTC_TARGET_NAME))_LINKER=$(notdir $(TARGET_CROSS))gcc
 
 HOST_PKG_CARGO_ENV = \
 	$(PKG_COMMON_CARGO_ENV)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
