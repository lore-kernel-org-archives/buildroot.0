Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F95CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A73996059B;
	Wed, 23 Feb 2022 20:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wg5gRrhHw0rw; Wed, 23 Feb 2022 20:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E9360FC1;
	Wed, 23 Feb 2022 20:03:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2FE61BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90871408F3
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGPo0yrDFRDz for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:03:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB365403B3
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:03:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 449A383878; Wed, 23 Feb 2022 19:55:26 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 20:59:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3910057c6ae38e2cf72e8c86cd84756fffba2ac
X-Git-Newrev: 833f79fdeff1433396b7fa680fb6cbd6f1c65f36
X-Patchwork-Hint: ignore
Message-Id: <20220223195526.449A383878@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/weston: drop GBM dependency from
 DRM option
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

commit: https://git.buildroot.net/buildroot/commit/?id=833f79fdeff1433396b7fa680fb6cbd6f1c65f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

upstream advocated that DRM backend can be built without GBM:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/791
so drop dependencies on
BR2_PACKAGE_MESA3D_OPENGL_EGL || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
to allow DRM to be the default backend when fbdev will be removed in the
follow-up patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/weston/Config.in | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index d45e50baaa..073a3ae567 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -40,12 +40,8 @@ config BR2_PACKAGE_WESTON_DEFAULT_FBDEV
 
 config BR2_PACKAGE_WESTON_DEFAULT_DRM
 	bool "drm"
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	select BR2_PACKAGE_WESTON_DRM
 
-comment "drm backend needs mesa3d w/ EGL driver"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
-
 config BR2_PACKAGE_WESTON_DEFAULT_HEADLESS
 	bool "headless"
 	select BR2_PACKAGE_WESTON_HEADLESS
@@ -74,11 +70,6 @@ config BR2_PACKAGE_WESTON_DEFAULT_COMPOSITOR
 
 config BR2_PACKAGE_WESTON_DRM
 	bool "DRM compositor"
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL || BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
-
-# Uses libgbm from mesa3d
-comment "DRM compositor needs an OpenGL EGL backend provided by mesa3d"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 
 config BR2_PACKAGE_WESTON_FBDEV
 	bool "fbdev compositor (deprecated)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
