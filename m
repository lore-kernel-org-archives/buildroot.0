Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883BFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2FCB040354;
	Sun, 30 Jan 2022 14:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1M4esMZijs7; Sun, 30 Jan 2022 14:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32CA44017C;
	Sun, 30 Jan 2022 14:55:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 383B21BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 349CE60692
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gA0tDFuRz1qp for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:55:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75F1B6058F
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:55:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BA4A482747; Sun, 30 Jan 2022 14:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:55:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3529e8c21c939d73cc0090cb41c17b02db5b1013
X-Git-Newrev: 32a0230d7028d9cbe90e25bcbf5d814dbe1b9967
X-Patchwork-Hint: ignore
Message-Id: <20220130144826.BA4A482747@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo.mk: fix debug build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32a0230d7028d9cbe90e25bcbf5d814dbe1b9967
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is no --debug mode for cargo resulting in the following build
failure in ripgrep since its conversion to cargo infrastructure in
commit 342fd3e7350479dc368541ac77a5130ebb53194c:

error: Found argument '--debug' which wasn't expected, or isn't valid in this context

Fixes:
 - http://autobuild.buildroot.org/results/772ebdd6a39950457a59419bdc1376cb0e0a3611

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index 614d46ad64..e74a8358bc 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -104,7 +104,7 @@ define $(2)_BUILD_CMDS
 		$$($(2)_CARGO_ENV) \
 		cargo build \
 			--offline \
-			$$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
+			$$(if $$(BR2_ENABLE_DEBUG),,--release) \
 			--manifest-path Cargo.toml \
 			--locked \
 			$$($(2)_CARGO_BUILD_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
