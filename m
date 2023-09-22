Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7434CE6FE58
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 16:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F60F60B32;
	Fri, 22 Sep 2023 16:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F60F60B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8-w35kz6rMK; Fri, 22 Sep 2023 16:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AE9F60E0A;
	Fri, 22 Sep 2023 16:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AE9F60E0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6187C1BF2B0
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AEEF610E5
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 16:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AEEF610E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dUVxG36Myp8Q for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 16:01:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1674860E0A
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 16:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1674860E0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 057E587536; Fri, 22 Sep 2023 16:01:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 18:00:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ba27e682a861e304138fa2a460c10db2c83abe4
X-Git-Newrev: a23251d3f738b44eab40375fc8822e0358d70517
X-Patchwork-Hint: ignore
Message-Id: <20230922160112.057E587536@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: allow both X11 and
 Wayland
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

commit: https://git.buildroot.net/buildroot/commit/?id=a23251d3f738b44eab40375fc8822e0358d70517
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 package/webkitgtk/webkitgtk.mk | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 71599477f2..bb6df3d592 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -80,32 +80,32 @@ else
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
 
 ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND)$(BR2_PACKAGE_WPEBACKEND_FDO),yy)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
