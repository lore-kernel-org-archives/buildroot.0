Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C4CC00140
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 15:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B4314148B;
	Fri, 12 Aug 2022 15:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B4314148B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mtxQ7FR5GtK; Fri, 12 Aug 2022 15:13:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DB20410C1;
	Fri, 12 Aug 2022 15:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DB20410C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1A961BF40A
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA6A860757
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6A860757
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WSq1bSL_wis for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 15:13:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8F1260773
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 15:13:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F1260773
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2DE32873AA; Fri, 12 Aug 2022 14:59:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 17:04:21 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2ee403d812eaf77264509db15576fcf1f107671d
X-Git-Newrev: 51a837b719c71b191909e033f9dcea2a293cb2d2
X-Patchwork-Hint: ignore
Message-Id: <20220812145932.2DE32873AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/cog: add libgbm
 as dependency when building with DRM support
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

commit: https://git.buildroot.net/buildroot/commit/?id=51a837b719c71b191909e033f9dcea2a293cb2d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

When building with the DRM support, it can happen that the libgbm library
is not yet built by the provider of this lib (specified by
BR2_PACKAGE_PROVIDES_LIBGBM).

The docs in cog `docs/platform-drm.md` specify this dep-list:
- **WPEBackend-fdo**:
- **Wayland**:
- **libdrm**:
- **libgbm**:
- **libinput**:
- **libudev**:

libgbm needs to be added.
Adding libegl as well.

Updated package/cog/Config.in to define the dependencies (for DRM)
according to libegl & libgbm.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 1d207e4c3ccc18f6d977fdded7a5f7c0874603cc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cog/Config.in | 9 ++++++---
 package/cog/cog.mk    | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/cog/Config.in b/package/cog/Config.in
index d4238750f9..484eb85c70 100644
--- a/package/cog/Config.in
+++ b/package/cog/Config.in
@@ -39,7 +39,8 @@ config BR2_PACKAGE_COG_PLATFORM_FDO
 config BR2_PACKAGE_COG_PLATFORM_DRM
 	bool "DRM backend"
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
-	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # gbm
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGBM
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT
 	help
@@ -52,7 +53,9 @@ config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
 	help
 	  Expose remote control interface on system bus
 
-comment "DRM platform needs mesa3d w/ EGL driver and GBM"
-	depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
+comment "DRM platform needs EGL and GBM"
+	depends on \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!BR2_PACKAGE_HAS_LIBGBM
 
 endif
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index f2ca0af93d..da660eb7c1 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -28,7 +28,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
-COG_DEPENDENCIES += libdrm libinput
+COG_DEPENDENCIES += libdrm libinput libgbm libegl
 else
 COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
