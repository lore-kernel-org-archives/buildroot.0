Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67025C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDE1140878;
	Mon,  1 Aug 2022 20:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDE1140878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBEx2xfZxeLi; Mon,  1 Aug 2022 20:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56C974025F;
	Mon,  1 Aug 2022 20:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C974025F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD9581BF9AD
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8E1660596
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E1660596
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eEZ4PcaE1eLD for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:53:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F31A5600C7
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F31A5600C7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9F5C186C4A; Mon,  1 Aug 2022 20:39:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 22:52:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe6aa1f5c91ba33d71b8d43ddfa2b485542a04ee
X-Git-Newrev: df36e51ee1a545f6fc50a237cc9ff23f099cd806
X-Patchwork-Hint: ignore
Message-Id: <20220801203914.9F5C186C4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: add udev dependency to drm
 platform support
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

commit: https://git.buildroot.net/buildroot/commit/?id=df36e51ee1a545f6fc50a237cc9ff23f099cd806
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The DRM platform support already has the 'BR2_PACKAGE_HAS_UDEV' symbol in
package/cog/Config.in

We just need to specify 'udev' as a dependency in the cog.mk file.
The udev virtual package is pulled by libinput anyway, but this makes it
more explicit.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cog/cog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index da660eb7c1..95b6220629 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
-COG_DEPENDENCIES += libdrm libinput libgbm libegl
+COG_DEPENDENCIES += libdrm libinput libgbm libegl udev
 else
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
