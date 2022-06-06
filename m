Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA4CC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0E8415D6;
	Mon,  6 Jun 2022 20:37:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kSGtZ4oLNFrC; Mon,  6 Jun 2022 20:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9636415C9;
	Mon,  6 Jun 2022 20:37:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03F7C1BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E69F34108A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlMDiMV3CFao for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9E9F4014C
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0C7C086DDB; Mon,  6 Jun 2022 20:25:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 21:44:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 81f2dd7b489b73985c13db91ae958833ae84cb4f
X-Git-Newrev: 82fb054745f8b3fa126be6b5b5506fca0ea999ea
X-Patchwork-Hint: ignore
Message-Id: <20220606202540.0C7C086DDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-ati: switch dependency from mesa3d to
 libgbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=82fb054745f8b3fa126be6b5b5506fca0ea999ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The package depends on gbm and not mesa3d:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati/-/blob/master/configure.ac#L155

Remove the dependency to BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON in order
to prevent a circular dependency here. This option will be removed in
a follow-patch anyway because Mesa3D will drop DRI drivers in version
22.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in                 | 7 +++----
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 1 +
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index 1246014dca..81255d5a4c 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -1,15 +1,14 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	bool "xf86-video-ati"
 	depends on BR2_i386 || BR2_x86_64 # DRI radeon r100 driver
-	depends on BR2_PACKAGE_MESA3D
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_RADEON
-	select BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XORGPROTO
 	help
 	  ATI video driver
 
-comment "xf86-video-ati needs mesa3d"
+comment "xf86-video-ati needs GBM"
 	depends on BR2_i386 || BR2_x86_64
-	depends on !BR2_PACKAGE_MESA3D
+	depends on !BR2_PACKAGE_HAS_LIBGBM
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index edb8b11add..e7f5852811 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -11,6 +11,7 @@ XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	libdrm \
+	libgbm \
 	xlib_libXcomposite \
 	xorgproto \
 	xserver_xorg-server
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
