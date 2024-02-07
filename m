Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3206C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 10:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78C8040136;
	Wed,  7 Feb 2024 10:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMTMfNZ8WOX6; Wed,  7 Feb 2024 10:41:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1725E402C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1725E402C3;
	Wed,  7 Feb 2024 10:41:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0060B1BF255
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E07F2402E6
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 10:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yIDdPWCXpgpG for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 10:41:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A586F40136
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A586F40136
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 10:41:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 933F78754B; Wed,  7 Feb 2024 10:41:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 11:41:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20ee36e0b096185853835aea848b86a7fccd238b
X-Git-Newrev: e0ef9213e4a99c7cf12aed4d21dc3b5338d81d50
X-Patchwork-Hint: ignore
Message-Id: <20240207104142.933F78754B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ivi-homescreen: fix dependencies
 for gstreamer plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0ef9213e4a99c7cf12aed4d21dc3b5338d81d50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gstreamer plugin select the EGL backend of gst1-plugins-base, but
forgot to propagate all of its dependencies, notably the _HAS_API
condition, causing unmet dependencies warnings (unfortunately, not
errors), such as;

    $ KCONFIG_SEED=0x597D22A8 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
      Depends on [n]: BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL [=y] && BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API [=n] && BR2_PACKAGE_HAS_LIBEGL [=y]
      Selected by [y]:
      - BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN [=y] && BR2_PACKAGE_IVI_HOMESCREEN [=y] && BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS [=y] && BR2_PACKAGE_HAS_LIBEGL [=y]

We can't select _HAS_API, because it is a symbol that represents a
capability provided by other features of gst1-plugins-base; it's
semantically like a virtual package: we can't select it, we can only
depend on it.

Add this dependency to fix this situation.

This however causes circular (recursive) dependencies errors:

    package/gstreamer1/gst1-plugins-base/Config.in:135:error: recursive dependency detected!
    package/gstreamer1/gst1-plugins-base/Config.in:135:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL is selected by BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
    package/ivi-homescreen/Config.in:221:   symbol BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
    package/gstreamer1/gst1-plugins-base/Config.in:149:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API is selected by BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
    package/gstreamer1/gst1-plugins-base/Config.in:152:     symbol BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL

Indeed, _HAS_API is only even set when gstreamer1, gst1-plugins-base,
and the gst1-plugins-base's lib-opengl support, are all already enabled.
As such, the dependency on _HAS_API already implies those, and there is
no need to select them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Reviewed-by: Adam Duskett <Adam.Duskett@amarulasolutions.com>
Tested-by: Adam Duskett <Adam.Duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ivi-homescreen/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index de7509320f..c24df05b6d 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -222,10 +222,8 @@ config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
 	bool "GStreamer EGL"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API # GST1_PLUGINS_BASE_LIB_OPENGL_EGL
 	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_GSTREAMER1
-	select BR2_PACKAGE_GST1_PLUGINS_BASE
-	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_EGL
 	help
 	  A GStreamer-powered alternative to Flutter's video_player that
@@ -233,9 +231,10 @@ config BR2_PACKAGE_IVI_HOMESCREEN_GSTREAMER_EGL_PLUGIN
 
 	  https://pub.dev/packages/flutter_gstreamer_player
 
-comment "GStreamer plugin needs an EGL backend"
+comment "GStreamer plugin needs gst1-plugins-base with an EGL backend"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on !BR2_PACKAGE_HAS_LIBEGL
+	depends on !BR2_PACKAGE_HAS_LIBEGL \
+		|| !BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_API
 
 config BR2_PACKAGE_IVI_HOMESCREEN_OPENGL_TEXTURE_PLUGIN
 	bool "OpenGL Texture"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
