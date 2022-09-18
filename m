Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E741C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B48660D69;
	Sun, 18 Sep 2022 08:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B48660D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZeQeLr1ksa4; Sun, 18 Sep 2022 08:31:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C43CF60AC0;
	Sun, 18 Sep 2022 08:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C43CF60AC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 697171BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B8F0401CA
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B8F0401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1o2glu7LQdsb for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:31:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B394400E2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B394400E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 385A98484A; Sun, 18 Sep 2022 08:31:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:30:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cd140ca8d40f58f3864b0f267e5e54e5756a45a
X-Git-Newrev: a7f854bce5079608af4cc6c3653b6d71db529cc7
X-Patchwork-Hint: ignore
Message-Id: <20220918083116.385A98484A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: set cpp_rtti option
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7f854bce5079608af4cc6c3653b6d71db529cc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.

Fixes:
 - http://autobuild.buildroot.net/results/e2ebc9a73ed421aa6be44fe41bb5224cc12f699d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/mesa3d.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 0630f43df1..daefd6f6d5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -48,6 +48,11 @@ ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
 MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
 MESA3D_CONF_OPTS += -Dllvm=enabled
+ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
+MESA3D_CONF_OPTS += -Dcpp_rtti=true
+else
+MESA3D_CONF_OPTS += -Dcpp_rtti=false
+endif
 else
 # Avoid automatic search of llvm-config
 MESA3D_CONF_OPTS += -Dllvm=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
