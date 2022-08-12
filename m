Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9181C25B0E
	for <buildroot@archiver.kernel.org>; Fri, 12 Aug 2022 15:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 753D561151;
	Fri, 12 Aug 2022 15:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 753D561151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jr8-wuQ4pNxy; Fri, 12 Aug 2022 15:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9404B60B02;
	Fri, 12 Aug 2022 15:14:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9404B60B02
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 432231C11A5
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27B644150E
 for <buildroot@lists.busybox.net>; Fri, 12 Aug 2022 15:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27B644150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gSCsLes0nIBq for <buildroot@lists.busybox.net>;
 Fri, 12 Aug 2022 15:13:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2654E4148B
 for <buildroot@buildroot.org>; Fri, 12 Aug 2022 15:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2654E4148B
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 59F11873B9; Fri, 12 Aug 2022 14:59:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Aug 2022 17:02:45 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9de6f14a26c5a51a79ee9aff6551c697da14161f
X-Git-Newrev: c25e77eec5738b31aa6093410b5745d9939844b7
X-Patchwork-Hint: ignore
Message-Id: <20220812145936.59F11873B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/cog: add libgbm
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

commit: https://git.buildroot.net/buildroot/commit/?id=c25e77eec5738b31aa6093410b5745d9939844b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

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
