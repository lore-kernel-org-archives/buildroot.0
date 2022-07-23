Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABA0C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 08:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC4F484B22;
	Sat, 23 Jul 2022 08:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC4F484B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fA2fpEn0TWxa; Sat, 23 Jul 2022 08:51:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67E2584B21;
	Sat, 23 Jul 2022 08:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E2584B21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36B661BF955
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC7A340142
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC7A340142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VCC1Io9ZQ2Y for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23DB141633
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23DB141633
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A2567842C2; Sat, 23 Jul 2022 08:36:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 10:34:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6354a7a29d9c6f0d3014913df846b708dac3847f
X-Git-Newrev: 1d207e4c3ccc18f6d977fdded7a5f7c0874603cc
X-Patchwork-Hint: ignore
Message-Id: <20220723083612.A2567842C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cog: add libgbm as dependency when
 building with DRM support
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d207e4c3ccc18f6d977fdded7a5f7c0874603cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
