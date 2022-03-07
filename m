Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B988CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E3B660EFB;
	Mon,  7 Mar 2022 21:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkFGScj6PWMT; Mon,  7 Mar 2022 21:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92C6460EF9;
	Mon,  7 Mar 2022 21:10:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 583731BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5598260EFC
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-wnPY3t-Na4 for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF2D860EF3
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EF7DC826D4; Mon,  7 Mar 2022 21:02:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:07:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7327aeafca93c68bcc120180d0cea1cd8cf1667
X-Git-Newrev: a1ef4c1d9ad1b0fc5c94cbb7aa85347243006b64
X-Patchwork-Hint: ignore
Message-Id: <20220307210210.EF7DC826D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: allow packages to
 define download environment
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1ef4c1d9ad1b0fc5c94cbb7aa85347243006b64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the golang infrastructure forcibly sets the package _DL_ENV
variable, instead of appending to it, which prevents packages from
providing their own download environment variables.

We fix that by using an append-assignment.

Note: when introduced, that variable was explicitly not documented, and
is supposed to only be used by packages infrastructures. However, that
variable exists, and it can be (ab)used by br2-external packages (most
probably to ill effects, but heh!). We anyway leave it undocumented,
like _ROOTFS_PRE_CMD_HOOKS.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Christian Stewart <christian@paral.in>
Cc: Anisse Astier <anisse@astier.eu>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 35bcb1673b..69eae02830 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -83,7 +83,7 @@ endef
 $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 
 $(2)_DOWNLOAD_POST_PROCESS = go
-$(2)_DL_ENV = \
+$(2)_DL_ENV += \
 	$(HOST_GO_COMMON_ENV) \
 	GOPROXY=direct \
 	BR_GOMOD=$$($(2)_GOMOD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
