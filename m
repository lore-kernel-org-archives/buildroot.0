Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B41C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45F2260EA3;
	Wed, 28 Feb 2024 16:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oC6ikgGKjURE; Wed, 28 Feb 2024 16:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DBD660EA8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBD660EA8;
	Wed, 28 Feb 2024 16:43:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06FC11BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 374EA415B0
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 16:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLrp-crJJGnm for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09A4F41665
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09A4F41665
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 16:43:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8F8E87BD7; Wed, 28 Feb 2024 16:43:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 17:20:28 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f94f04a957ae8ff247571d505741faece7ef0ae6
X-Git-Newrev: 0617a0191a515edfa72fb4aaba185bd33ea2d691
X-Patchwork-Hint: ignore
Message-Id: <20240228164337.E8F8E87BD7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/webkitgtk: allow
 both X11 and Wayland
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

commit: https://git.buildroot.net/buildroot/commit/?id=0617a0191a515edfa72fb4aaba185bd33ea2d691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Allow enabling support for both the X11 and Wayland backends.

This in turn needs reorganizing how desktop GL or OpenGL ES is chosen,
as it no longer can depend on whether Wayland support is enabled: the
BR2_PACKAGE_HAS_LIBGL and BR2_PACKAGE_HAS_LIBGLES variables are both
checked, and ENABLE_GLES2 is set only if the package providing OpenGL
claims only GLES is supported; otherwise desktop GL is preferred. This
matches the existing logic.

The existing comment indicating that only one of both windowing systems
can be enabled was wrong: the same WebKitGTK build can target both
X11 and Wayland at the same time, as long as GTK itself has been built
accordingly. Enabling both is the approach taken by most Linux
distributions, and has been supported for years.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a23251d3f738b44eab40375fc8822e0358d70517)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.mk | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 881c2df07b..4a3f9e61c1 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -78,32 +78,32 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_GAMEPAD=OFF
 endif
 
-# Only one target platform can be built, assume X11 > Wayland
+# Use GLES if available and desktop GL is not.
+ifeq ($(BR2_PACKAGE_HAS_LIBGL):$(BR2_PACKAGE_HAS_LIBGLES),:y)
+WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
+WEBKITGTK_DEPENDENCIES += libgles
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
+endif
 
-# GTK3-X11 target gives OpenGL from newer libgtk3 versions
-# Consider this better than EGL + maybe GLESv2 since both can't be built
-# 2D CANVAS acceleration requires OpenGL proper with cairo-gl
 ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_GLES2=OFF \
-	-DENABLE_X11_TARGET=ON
+WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
-else # !X11
-# GTK3-BROADWAY/WAYLAND needs at least EGL
-WEBKITGTK_DEPENDENCIES += libegl
-# GLESv2 support is optional though
-ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
-WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=ON
-WEBKITGTK_DEPENDENCIES += libgles
 else
-# Disable general OpenGL (shading) if there's no GLESv2
-WEBKITGTK_CONF_OPTS += -DENABLE_GLES2=OFF
+WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
 endif
-# We must explicitly state the wayland target
+
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
+WEBKITGTK_DEPENDENCIES += libegl
+else
+WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
 endif
+
+# If only the GTK Broadway backend is enabled, EGL is still needed.
+ifeq ($(BR2_PACKAGE_LIBGTK3_X11):$(BR2_PACKAGE_LIBGTK3_WAYLAND):$(BR2_PACKAGE_LIBGTK3_BROADWAY),::y)
+WEBKITGTK_DEPENDENCIES += libegl
 endif
 
 ifeq ($(BR2_PACKAGE_WPEBACKEND_FDO),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
