Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A004DC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 19:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B89410CB;
	Thu, 23 Feb 2023 19:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B89410CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VO5_nZQJpGt2; Thu, 23 Feb 2023 19:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A394161E;
	Thu, 23 Feb 2023 19:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21A394161E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 418081BF97F
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2378F4167F
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 19:11:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2378F4167F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SJl2BQwoqrSr for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 19:11:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C6E64154A
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 19:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C6E64154A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09CE58696A; Thu, 23 Feb 2023 19:11:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 20:08:38 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: f3ed1e376b5ba51c129ccd09bc56104073525037
X-Git-Newrev: 81b082a4fe581fe3729b0eb4155a2781f99be2fc
X-Patchwork-Hint: ignore
Message-Id: <20230223191106.09CE58696A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/mesa3d-headers:
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

commit: https://git.buildroot.net/buildroot/commit/?id=81b082a4fe581fe3729b0eb4155a2781f99be2fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

The configuration checks should only be done when building so that
make allyespackageconfig && make source works.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 509956da4cdba6a76214322b1ace979bbe6cd6a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3712c79db0..83830ba23b 100644
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
