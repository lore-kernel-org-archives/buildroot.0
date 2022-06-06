Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0647ACCA473
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 20:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A170941C09;
	Mon,  6 Jun 2022 20:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbNLtfPqGXmG; Mon,  6 Jun 2022 20:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 534D2415D6;
	Mon,  6 Jun 2022 20:39:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 389AC1BF982
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F43160D6F
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 20:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DctcCFvYA9Zx for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E10D060BD4
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 20:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 02B0986DDE; Mon,  6 Jun 2022 20:25:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 21:44:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bd0a0da7dfd6dee5e0125e04a361fd8051a2a3cd
X-Git-Newrev: 81f2dd7b489b73985c13db91ae958833ae84cb4f
X-Patchwork-Hint: ignore
Message-Id: <20220606202540.02B0986DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-amdgpu: needs libgbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=81f2dd7b489b73985c13db91ae958833ae84cb4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The package depends on gbm:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/blob/master/configure.ac#L75

This dependency was always there. However, previously it was implicit
from the mesa3d dependencies. Since we made libgbm a virtual package, it
is possible that libgbm is selected in another way. Note that the
original dependencies would always for libgbm in mesa3d, so this was not
causing any build failures.

Also explicitly add libgbm to _DEPENDENCIES. Previously, this was
implied by the mesa3d dependency in xserver, but this is no longer true
for other gbm providers.

For details see
http://lists.busybox.net/pipermail/buildroot/2022-April/641451.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xdriver_xf86-video-amdgpu/Config.in                 | 8 +++-----
 .../x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk  | 1 +
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
index c42255f55c..fb23fc1fdf 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	bool "xf86-video-amdgpu"
 	depends on BR2_USE_MMU # libdrm
-	depends on BR2_PACKAGE_MESA3D_DRI_DRIVER
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_AMDGPU
 	select BR2_PACKAGE_LIBEPOXY
@@ -11,7 +10,6 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_AMDGPU
 	help
 	  AMD GPU video driver
 
-comment "xf86-video-amdgpu needs egl/opengl support from mesa3d"
+comment "xf86-video-amdgpu needs GBM"
 	depends on BR2_USE_MMU
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL || \
-		!BR2_PACKAGE_MESA3D_DRI_DRIVER
+	depends on !BR2_PACKAGE_HAS_LIBGBM
diff --git a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
index 23452fe417..adba21dd62 100644
--- a/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
+++ b/package/x11r7/xdriver_xf86-video-amdgpu/xdriver_xf86-video-amdgpu.mk
@@ -11,6 +11,7 @@ XDRIVER_XF86_VIDEO_AMDGPU_LICENSE = MIT
 XDRIVER_XF86_VIDEO_AMDGPU_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_AMDGPU_DEPENDENCIES = \
 	libdrm \
+	libgbm \
 	xlib_libXcomposite \
 	xorgproto \
 	xserver_xorg-server
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
