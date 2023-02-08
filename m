Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0F4C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E3066FFFF;
	Tue, 21 Feb 2023 01:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E3066FFFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jt5EPC8gcz0S; Tue, 21 Feb 2023 01:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8B6C7013E;
	Tue, 21 Feb 2023 01:47:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8B6C7013E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D3F4E1BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EB416FE5C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB416FE5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEHOfS6tQLu5 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26B14610E2
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26B14610E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 243F181979; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:51:20 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 889f451caf22f5b36ff8430d7927e8cb3a56681e
X-Git-Newrev: beeae174f9fffe6ea9c50a717a9b45c71ed45ea9
X-Patchwork-Hint: ignore
Message-Id: <20230220205255.243F181979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 opengl support
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

commit: https://git.buildroot.net/buildroot/commit/?id=beeae174f9fffe6ea9c50a717a9b45c71ed45ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in          |  5 +++++
 package/qt6/qt6base/Config.in  | 42 +++++++++++++++++++++++++++++++++++++++++-
 package/qt6/qt6base/qt6base.mk | 18 +++++++++++++++++-
 3 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index 4b2b9a1174..831ae72c3c 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -12,6 +12,11 @@ config BR2_PACKAGE_QT6_ARCH_SUPPORTS
 	default y if BR2_sparc64
 	depends on BR2_USE_MMU
 
+config BR2_PACKAGE_QT6_GL_SUPPORTS
+	bool
+	default y
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+
 comment "qt6 needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, host gcc >= 8"
 	depends on !BR2_PACKAGE_QT5
 	depends on BR2_PACKAGE_QT6_ARCH_SUPPORTS
diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 973fb2f11c..131dfadc1b 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -36,7 +36,8 @@ config BR2_PACKAGE_QT6BASE_GUI
 	# At least one graphic backend must be enabled, so enable
 	# linuxfb if nothing is enabled.
 	select BR2_PACKAGE_QT6BASE_LINUXFB if \
-	       !BR2_PACKAGE_QT6BASE_XCB
+	       !BR2_PACKAGE_QT6BASE_XCB && \
+	       !BR2_PACKAGE_QT6BASE_EGLFS
 	help
 	  This option enables the Qt6Gui library.
 
@@ -59,6 +60,45 @@ config BR2_PACKAGE_QT6BASE_XCB
 comment "X.org XCB backend available if X.org is enabled"
 	depends on !BR2_PACKAGE_XORG7
 
+config BR2_PACKAGE_QT6BASE_EGLFS
+	bool "eglfs support"
+	depends on BR2_PACKAGE_HAS_LIBEGL
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	select BR2_PACKAGE_QT6BASE_OPENGL
+
+config BR2_PACKAGE_QT6BASE_OPENGL
+	bool "OpenGL support"
+	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
+	help
+	  This option enables OpenGL support.
+
+comment "OpenGL support needs an OpenGL-capable backend"
+	depends on !BR2_PACKAGE_QT6_GL_SUPPORTS
+
+if BR2_PACKAGE_QT6BASE_OPENGL
+
+choice
+	prompt "OpenGL API"
+	help
+	  Select OpenGL API.
+
+config BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP
+	bool "Desktop OpenGL"
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Use desktop OpenGL.
+
+config BR2_PACKAGE_QT6BASE_OPENGL_ES2
+	bool "OpenGL ES 2.0+"
+	depends on BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Use OpenGL ES 2.0 and later versions.
+
+endchoice
+
+endif
+
 config BR2_PACKAGE_QT6BASE_FONTCONFIG
 	bool "fontconfig support"
 	select BR2_PACKAGE_FONTCONFIG
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 911375aa6d..2540fbb59c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -144,7 +144,6 @@ ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
 QT6BASE_CONF_OPTS += \
 	-DFEATURE_gui=ON \
 	-DFEATURE_freetype=ON \
-	-DINPUT_opengl=no \
 	-DFEATURE_vulkan=OFF
 QT6BASE_DEPENDENCIES += freetype
 
@@ -230,6 +229,23 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_EGLFS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_egl=ON -DFEATURE_eglfs=ON
+QT6BASE_DEPENDENCIES += libegl libgbm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_eglfs=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_DESKTOP),y)
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengl_desktop=ON
+QT6BASE_DEPENDENCIES += libgl
+else ifeq ($(BR2_PACKAGE_QT6BASE_OPENGL_ES2),y)
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=ON -DFEATURE_opengles2=ON
+QT6BASE_DEPENDENCIES += libgles
+else
+QT6BASE_CONF_OPTS += -DFEATURE_opengl=OFF -DINPUT_opengl=no
+endif
+
 else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
