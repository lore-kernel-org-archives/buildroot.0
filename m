Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E818C636D6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF5E941506;
	Thu, 23 Feb 2023 19:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF5E941506
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UbLC4ZHvbVn; Thu, 23 Feb 2023 19:11:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABEE941685;
	Thu, 23 Feb 2023 19:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABEE941685
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27BD01BF343
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02156814BA
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02156814BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSm4BYVNsgim for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C85EF814B1
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85EF814B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B896E8694B; Thu, 23 Feb 2023 19:09:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 20:08:32 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: efd9ca6df67298ed1b60fd05d9d2d783dee1bd98
X-Git-Newrev: 3f5a9f375ecbe6adf83966e646f460f12ccac54f
X-Patchwork-Hint: ignore
Message-Id: <20230223190957.B896E8694B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mesa3d-headers:
 only check for conflicts when building
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f5a9f375ecbe6adf83966e646f460f12ccac54f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The configuration checks should only be done when building so that
make allyespackageconfig && make source works.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 509956da4cdba6a76214322b1ace979bbe6cd6a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 871cf2f495..abfa0e9b55 100644
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
