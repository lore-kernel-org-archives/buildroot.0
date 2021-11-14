Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C39C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 20:40:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E12A6112E
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 20:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E12A6112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EAB606A8;
	Sun, 14 Nov 2021 20:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gUBoTc2N9Bbe; Sun, 14 Nov 2021 20:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C49605BF;
	Sun, 14 Nov 2021 20:40:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2ACC1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 20:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3CE380D21
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 20:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JZEHgJz0u3kY for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 20:40:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E77780CA1
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 20:40:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 177178D362; Sun, 14 Nov 2021 20:36:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 21:38:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d23bc990c2f5640f482feb1aa146fafef6749dc
X-Git-Newrev: 146787b9bfcbd8b3b1f197384ee974a15d0d4390
X-Patchwork-Hint: ignore
Message-Id: <20211114203610.177178D362@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luajit: fix LUAJIT_XCFLAGS for
 host variant
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

commit: https://git.buildroot.net/buildroot/commit/?id=146787b9bfcbd8b3b1f197384ee974a15d0d4390
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As was just done for the target variant in commit 8d23bc990c2f
(package/luajit: fix LUAJIT_XCFLAGS), also fix the host variant
which uses the same flags.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/luajit/luajit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 3367336899..d2af69d1e3 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -68,7 +68,7 @@ LUAJIT_POST_INSTALL_TARGET_HOOKS += LUAJIT_INSTALL_SYMLINK
 define HOST_LUAJIT_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) PREFIX="$(HOST_DIR)" BUILDMODE=dynamic \
 		TARGET_LDFLAGS="$(HOST_LDFLAGS)" \
-		XCFLAGS=$(LUAJIT_XCFLAGS) \
+		XCFLAGS="$(LUAJIT_XCFLAGS)" \
 		-C $(@D) amalg
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
