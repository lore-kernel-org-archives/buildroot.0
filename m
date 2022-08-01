Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39785C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 20:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5EAC4012D;
	Mon,  1 Aug 2022 20:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5EAC4012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kmo8582ON769; Mon,  1 Aug 2022 20:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31A1140126;
	Mon,  1 Aug 2022 20:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A1140126
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3D56A1BF25B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9109605A0
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 20:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9109605A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uZcliY0YRC6r for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 20:53:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A43A60590
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 20:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A43A60590
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AA6A486C4B; Mon,  1 Aug 2022 20:39:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 22:52:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df36e51ee1a545f6fc50a237cc9ff23f099cd806
X-Git-Newrev: 8bbf5cb7cf0769e4ffb83de29d406a37623edee2
X-Patchwork-Hint: ignore
Message-Id: <20220801203914.AA6A486C4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: add dep on libgbm's dmabuf &
 plane-count-modifier features
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bbf5cb7cf0769e4ffb83de29d406a37623edee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cog uses the dmabuf and plane-count-modifier features from libgbm.
These are provided by mesa3d, but may not be provided by other libgbm
providers.

So, make this a dependency.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cog/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index 484eb85c70..d2a910f9b8 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -41,6 +41,8 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	depends on BR2_PACKAGE_HAS_LIBEGL
 	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	help
@@ -56,6 +58,8 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
 comment "DRM platform needs EGL and GBM"
 	depends on \
 		!BR2_PACKAGE_HAS_LIBEGL || \
-		!BR2_PACKAGE_HAS_LIBGBM
+		!BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF || \
+		!BR2_PACKAGE_LIBGBM_HAS_FEATURE_FORMAT_MODIFIER_PLANE_COUNT
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
