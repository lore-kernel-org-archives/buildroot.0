Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E540C636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 13:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F4BF60F66;
	Tue,  7 Feb 2023 13:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F4BF60F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m33tMzfwvGnE; Tue,  7 Feb 2023 13:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6394660F58;
	Tue,  7 Feb 2023 13:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6394660F58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 038CF1BF95C
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D002281DF0
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 13:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D002281DF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7dF4qt55CJW for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 13:52:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9AE681DA3
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 13:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AE681DA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C34CC841B6; Tue,  7 Feb 2023 13:52:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 14:52:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e06975b38047fe1ef47650248f154ecf88fe09b5
X-Git-Newrev: 509956da4cdba6a76214322b1ace979bbe6cd6a8
X-Patchwork-Hint: ignore
Message-Id: <20230207135235.C34CC841B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-headers: only check for
 conflicts when building
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

commit: https://git.buildroot.net/buildroot/commit/?id=509956da4cdba6a76214322b1ace979bbe6cd6a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configuration checks should only be done when building so that
make allyespackageconfig && make source works.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 03bf635816..9177adceda 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -6,7 +6,7 @@
 
 # mesa3d-headers is inherently incompatible with mesa3d, so error out
 # if both are enabled.
-ifeq ($(BR2_PACKAGE_MESA3D)$(BR2_PACKAGE_MESA3D_HEADERS),yy)
+ifeq ($(BR_BUILDING)$(BR2_PACKAGE_MESA3D)$(BR2_PACKAGE_MESA3D_HEADERS),yyy)
 $(error mesa3d-headers enabled, but mesa3d enabled too)
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
