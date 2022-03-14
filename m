Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0684C433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BABF60F01;
	Mon, 14 Mar 2022 12:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wn28VfwDmDw0; Mon, 14 Mar 2022 12:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A12A460EF4;
	Mon, 14 Mar 2022 12:21:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9D01BF9AA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35C8F405F4
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5vAIzg_hlyW6 for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB04740169
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1706D83E3E; Mon, 14 Mar 2022 12:11:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15682493918ead960d326bf24763e9b5d8d331d9
X-Git-Newrev: c7229db872acd6db83ccb7e4bb22cb4cfd06be75
X-Patchwork-Hint: ignore
Message-Id: <20220314121153.1706D83E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efl: rework eeze handling in
 Kconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7229db872acd6db83ccb7e4bb22cb4cfd06be75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit [1] added eeze dependency using "depends on" to several efl
options (drm, libmount) instead of selecting eeze and propagate the
udev reverse dependency.

[1] e026c3bdb8f493b3fc21de7c45e3edbc47e03128

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efl/Config.in | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index eb9c7aebd9..4c78bef7c8 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -115,7 +115,8 @@ config BR2_PACKAGE_EFL_PULSEAUDIO
 config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	bool "Enable libmount support (recommended)"
 	default y
-	depends on BR2_PACKAGE_EFL_EEZE
+	depends on BR2_PACKAGE_HAS_UDEV # efl-eeze
+	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	# libblkid is part of required tools, see EFL's README.
@@ -125,8 +126,8 @@ config BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT
 	  devices etc... and disabling this will hurt support for
 	  Enlightenment and its filemanager.
 
-comment "efl's libmount support needs udev /dev management (eeze)"
-	depends on !BR2_PACKAGE_EFL_EEZE
+comment "efl's libmount support needs udev /dev management "
+	depends on !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG
 	bool
@@ -173,16 +174,16 @@ config BR2_PACKAGE_EFL_WAYLAND
 	depends on BR2_PACKAGE_WAYLAND
 	depends on BR2_TOOLCHAIN_HAS_THREADS # Evas DRM Engine -> libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # Evas DRM Engine
-	depends on BR2_PACKAGE_EFL_EEZE # efl drm
+	depends on BR2_PACKAGE_HAS_UDEV # efl drm, efl-eeze
 	depends on BR2_PACKAGE_EFL_OPENGLES # OpenGL ES with EGL support only
 	depends on BR2_ENABLE_LOCALE # efl-drm <- efl-elput <- linput
 	select BR2_PACKAGE_EFL_DRM
 	select BR2_PACKAGE_WAYLAND_PROTOCOLS
 
-comment "Wayland support needs udev /dev management (eeze), OpenGL ES w/ EGL, threads, locales"
+comment "Wayland support needs udev /dev management, OpenGL ES w/ EGL, threads, locales"
 	depends on BR2_PACKAGE_WAYLAND
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
-		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_EFL_EEZE \
+		|| !BR2_PACKAGE_EFL_OPENGLES || !BR2_PACKAGE_HAS_UDEV \
 		|| !BR2_ENABLE_LOCALE
 
 choice
@@ -215,9 +216,10 @@ endchoice # OpenGL support
 
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
-	depends on BR2_PACKAGE_EFL_EEZE
+	depends on BR2_PACKAGE_HAS_UDEV # efl-eeze
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
+	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBINPUT # For elput
 	select BR2_PACKAGE_LIBXKBCOMMON
@@ -230,9 +232,9 @@ config BR2_PACKAGE_EFL_DRM
 	  etc) to handle interfacing with libinput without having to
 	  duplicate the code in each subsystem.
 
-comment "Evas DRM Engine needs udev /dev management (eeze), mesa3d w/ EGL support, threads"
+comment "Evas DRM Engine needs udev /dev management, mesa3d w/ EGL support, threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_MESA3D_OPENGL_EGL \
-		|| !BR2_PACKAGE_EFL_EEZE
+		|| !BR2_PACKAGE_HAS_UDEV
 
 comment "libevas loaders"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
