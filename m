Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BB8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 21:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EFAE60EFE;
	Mon,  7 Mar 2022 21:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kNwt6Z-O3Sbm; Mon,  7 Mar 2022 21:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 563D660EF3;
	Mon,  7 Mar 2022 21:10:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 408CC1BF2C3
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DEC64171A
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 21:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqhS7CNOQglS for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97A5041710
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 21:10:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D3B19826D4; Mon,  7 Mar 2022 21:02:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 22:04:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6b348b3c74b829868347b827612a451851c7247
X-Git-Newrev: 6d508d8e45a4b4afcb7f5291181393c9a249d8cf
X-Patchwork-Hint: ignore
Message-Id: <20220307210210.D3B19826D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-cargo: allow packages to
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d508d8e45a4b4afcb7f5291181393c9a249d8cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the cargo infrastructure forcibly sets the package _DL_ENV
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
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cargo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index e74a8358bc..66bea513e0 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -69,7 +69,7 @@ define inner-cargo-package
 $(2)_DOWNLOAD_DEPENDENCIES += host-rustc
 
 $(2)_DOWNLOAD_POST_PROCESS = cargo
-$(2)_DL_ENV = CARGO_HOME=$$(HOST_DIR)/share/cargo
+$(2)_DL_ENV += CARGO_HOME=$$(HOST_DIR)/share/cargo
 
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
