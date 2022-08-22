Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4A1C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6271A84214;
	Sun, 11 Sep 2022 08:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6271A84214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xMDZikxuShdP; Sun, 11 Sep 2022 08:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A5C0841C2;
	Sun, 11 Sep 2022 08:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A5C0841C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4AB91BF368
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DAA383ECF
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DAA383ECF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XR2Ho3oK92lf for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C7C83EBF
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C7C83EBF
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 60FF1835E4; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 16:38:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6df46fb145c4211b0750b0362b6e3ca832e8231
X-Git-Newrev: 8ab036d26f5811d604433013b9fbefbf0227a5c1
X-Patchwork-Hint: ignore
Message-Id: <20220911084825.60FF1835E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl2: rework KMS/DRM video driver
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ab036d26f5811d604433013b9fbefbf0227a5c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The KMS/DRM video driver of SDL2 can currently only be enabled when
mesa3d is the OpenGL provider, as the option has a dependency on
BR2_PACKAGE_MESA3D_GBM. Now that we have a libgbm virtual package and
BR2_PACKAGE_HAS_LIBGBM, we can do better.

However, this has uncovered a number of additional related issues that
are resolved at the same time. Here are some details:

 * the 'depends on BR2_PACKAGE_LIBDRM' is changed to a select, as we
   normally do for library dependencies. Due to this, we inherit a
   BR2_TOOLCHAIN_HAS_THREADS dependency.

 * the 'depends on BR2_PACKAGE_MESA3D_GBM' is changed to 'depends on
   BR2_PACKAGE_HAS_LIBGBM', and the 'mesa3d' dependency is changed to
   'libgbm'.

 * the KMS/DRM video driver in SDL2 needs EGL (hence the additional
   'depends on BR2_PACKAGE_HAS_LIBEGL' and the libegbl dependency is
   added in the .mk file). But in turn, EGL support is only checked
   when either OpenGL or OpenGLES support is enabled in SDL2, which is
   why we add logic to select the appropriate options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr:
  - fix dependency on comment (invert the symbol dependencies)
  - split comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sdl2/Config.in | 17 +++++++++++------
 package/sdl2/sdl2.mk   |  2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/sdl2/Config.in b/package/sdl2/Config.in
index 2ad45e4d00..7c8258fe73 100644
--- a/package/sdl2/Config.in
+++ b/package/sdl2/Config.in
@@ -31,14 +31,19 @@ comment "X11 video driver needs X.org"
 
 config BR2_PACKAGE_SDL2_KMSDRM
 	bool "KMS/DRM video driver"
-	depends on BR2_PACKAGE_LIBDRM
-	depends on BR2_PACKAGE_MESA3D_GBM
+	depends on BR2_TOOLCHAIN_HAS_THREADS  # libdrm
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_SDL2_OPENGL || BR2_PACKAGE_SDL2_OPENGLES
+	select BR2_PACKAGE_LIBDRM
 
-comment "KMS/DRM video driver needs libdrm"
-	depends on !BR2_PACKAGE_LIBDRM
+comment "KMS/DRM video driver needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
 
-comment "KMS/DRM video driver needs mesa3d w/ GBM"
-	depends on !BR2_PACKAGE_MESA3D_GBM
+comment "KMS/DRM video driver needs a GBM provider, and OpenGL or OpenGLES+EGL"
+	depends on !BR2_PACKAGE_HAS_LIBGBM || \
+		!BR2_PACKAGE_HAS_LIBEGL || \
+		!(BR2_PACKAGE_SDL2_OPENGL || BR2_PACKAGE_SDL2_OPENGLES)
 
 config BR2_PACKAGE_SDL2_OPENGL
 	bool "OpenGL (GLX)"
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index dec25edf1b..58c2a04c1c 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -175,7 +175,7 @@ SDL2_CONF_OPTS += --disable-alsa
 endif
 
 ifeq ($(BR2_PACKAGE_SDL2_KMSDRM),y)
-SDL2_DEPENDENCIES += libdrm mesa3d
+SDL2_DEPENDENCIES += libdrm libgbm libegl
 SDL2_CONF_OPTS += --enable-video-kmsdrm
 else
 SDL2_CONF_OPTS += --disable-video-kmsdrm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
