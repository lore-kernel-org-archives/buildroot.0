Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA51C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 16:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0D8E40579;
	Sun,  9 Jan 2022 16:47:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZAGKjj2Aq2G; Sun,  9 Jan 2022 16:47:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 787CA4059B;
	Sun,  9 Jan 2022 16:47:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE0B1BF969
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 799A940495
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 16:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UrHjrcmQ0O3k for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 16:47:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F52C400CD
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 16:47:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 49CF382DF6; Sun,  9 Jan 2022 16:41:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 17:47:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0378e2e5d9ce9d5676975dfbff501360094fdc1a
X-Git-Newrev: 3f8fd984d89e25a2e1a2cc6d25c915ecd39c444b
X-Patchwork-Hint: ignore
Message-Id: <20220109164105.49CF382DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d: make it aware of libglvnd
 and support it when present
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

commit: https://git.buildroot.net/buildroot/commit/?id=3f8fd984d89e25a2e1a2cc6d25c915ecd39c444b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libglvnd is enabled, mesa3d must be told so, so as it installs its
libraries with the vendor suffix (e.g. libEGL_mesa.so instead of
libEGL.so).

Additionally, the provider (in Buildroot parlance) is libglvnd, not mesa3d.

Signed-off-by: Jakub Skrzypnik <jskrzypnik@novomatic-tech.com>
[yann.morin.1998@free.fr:
  - don't override the _PROVIDES variable, only assign when needed
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mesa3d/Config.in | 15 +++++++++------
 package/mesa3d/mesa3d.mk | 15 +++++++++++----
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c01f12529a..34b0352056 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -423,7 +423,8 @@ comment "gbm support needs a dri driver or a gallium driver w/ EGL support."
 config BR2_PACKAGE_MESA3D_OPENGL_GLX
 	bool "OpenGL GLX"
 	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_HAS_LIBGL if !BR2_PACKAGE_LIBGLVND
+	select BR2_PACKAGE_LIBGLVND_DISPATCH_GL if BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_MESA3D_NEEDS_X11
 	help
 	  Enable GLX graphic acceleration (OpenGL + X11).
@@ -433,7 +434,8 @@ comment "OpenGL GLX support needs X11"
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
-	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBEGL if !BR2_PACKAGE_LIBGLVND
+	select BR2_PACKAGE_LIBGLVND_DISPATCH_EGL if BR2_PACKAGE_LIBGLVND
 	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
 	select BR2_PACKAGE_MESA3D_GBM
 	help
@@ -442,7 +444,8 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
 
 config BR2_PACKAGE_MESA3D_OPENGL_ES
 	bool "OpenGL ES"
-	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBGLES if !BR2_PACKAGE_LIBGLVND
+	select BR2_PACKAGE_LIBGLVND_DISPATCH_GLES if BR2_PACKAGE_LIBGLVND
 	help
 	  Use the Khronos OpenGL ES APIs. This is commonly used on
 	  embedded systems and represents a subset of the OpenGL API.
@@ -453,13 +456,13 @@ config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "mesa3d" if BR2_PACKAGE_MESA3D_GBM
 
 config BR2_PACKAGE_PROVIDES_LIBGL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_GLX
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_GLX && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_EGL && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES && !BR2_PACKAGE_LIBGLVND
 
 config BR2_PACKAGE_PROVIDES_LIBOPENCL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index cd3a33a38e..e34ed4264f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -167,9 +167,9 @@ MESA3D_CONF_OPTS += -Dopengl=true
 # we do not need libva support in mesa3d, therefore disable this option
 MESA3D_CONF_OPTS += -Dgallium-va=disabled
 
-# libGL is only provided for a full xorg stack
+# libGL is only provided for a full xorg stack, without libglvnd
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
-MESA3D_PROVIDES += libgl
+MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgl)
 else
 define MESA3D_REMOVE_OPENGL_HEADERS
 	rm -rf $(STAGING_DIR)/usr/include/GL/
@@ -207,7 +207,7 @@ MESA3D_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
-MESA3D_PROVIDES += libegl
+MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libegl)
 MESA3D_CONF_OPTS += \
 	-Degl=enabled
 else
@@ -216,7 +216,7 @@ MESA3D_CONF_OPTS += \
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
-MESA3D_PROVIDES += libgles
+MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgles)
 MESA3D_CONF_OPTS += -Dgles1=enabled -Dgles2=enabled
 else
 MESA3D_CONF_OPTS += -Dgles1=disabled -Dgles2=disabled
@@ -271,4 +271,11 @@ ifeq ($(BR2_m68k),y)
 MESA3D_CFLAGS += -mlong-jump-table-offsets
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGLVND),y)
+MESA3D_DEPENDENCIES += libglvnd
+MESA3D_CONF_OPTS += -Dglvnd=true
+else
+MESA3D_CONF_OPTS += -Dglvnd=false
+endif
+
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
