Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DCAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57EA640341;
	Sun, 13 Feb 2022 11:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nfx2kBK20977; Sun, 13 Feb 2022 11:30:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA99402F3;
	Sun, 13 Feb 2022 11:30:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 046601BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:29:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DA3860A9C
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:29:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AXieVMoV49WF for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:29:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77C7060B56
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:29:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 681EE82287; Sun, 13 Feb 2022 11:21:33 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:24:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d06bf4a9d73e7a05e651e737e26abac86080878e
X-Git-Newrev: 3cd9bb4f2a91d3739c5da96f5e4dd37d3ae13799
X-Patchwork-Hint: ignore
Message-Id: <20220213112133.681EE82287@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglfw: bump to 3.3.6 and enable
 Wayland/libGLES support
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cd9bb4f2a91d3739c5da96f5e4dd37d3ae13799
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andre Renaud <andre@ignavus.net>
[Arnout: reorder .mk so conditional parts come after unconditional, and
use += within conditions]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libglfw/Config.in    | 19 ++++++++++---------
 package/libglfw/libglfw.hash |  2 +-
 package/libglfw/libglfw.mk   | 21 ++++++++++++++++++---
 3 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/package/libglfw/Config.in b/package/libglfw/Config.in
index 06f4376453..281b55df7b 100644
--- a/package/libglfw/Config.in
+++ b/package/libglfw/Config.in
@@ -1,17 +1,18 @@
 config BR2_PACKAGE_LIBGLFW
 	bool "libglfw"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_HAS_LIBGL
-	select BR2_PACKAGE_XLIB_LIBXCURSOR
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_XLIB_LIBXI
-	select BR2_PACKAGE_XLIB_LIBXINERAMA
-	select BR2_PACKAGE_XLIB_LIBXRANDR
+	depends on BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND
+	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_XLIB_LIBXCURSOR if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXI if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXINERAMA if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXRANDR if BR2_PACKAGE_XORG7
 	help
 	  GLFW is an Open Source, multi-platform library for creating
 	  windows with OpenGL contexts and receiving input and events.
 
 	  http://www.glfw.org
 
-comment "libglfw depends on X.org and needs an OpenGL backend"
-	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_HAS_LIBGL
+comment "libglfw depends on X.org or Wayland and an OpenGL or GLES backend"
+	depends on !(BR2_PACKAGE_XORG7 || BR2_PACKAGE_WAYLAND)
+	depends on !(BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES)
diff --git a/package/libglfw/libglfw.hash b/package/libglfw/libglfw.hash
index c21a595bbc..5bffc55d26 100644
--- a/package/libglfw/libglfw.hash
+++ b/package/libglfw/libglfw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98768e12e615fbe9f3386f5bbfeb91b5a3b45a8c4c77159cef06b1f6ff749537  libglfw-3.3.2.tar.gz
+sha256  ed07b90e334dcd39903e6288d90fa1ae0cf2d2119fec516cf743a0a404527c02  libglfw-3.3.6.tar.gz
 sha256  149704059b5d0bf551637e50042dd4de9c2cae921021f6636298911e3a5f9462  LICENSE.md
diff --git a/package/libglfw/libglfw.mk b/package/libglfw/libglfw.mk
index 63d2a88bf8..2ba31fd674 100644
--- a/package/libglfw/libglfw.mk
+++ b/package/libglfw/libglfw.mk
@@ -4,11 +4,9 @@
 #
 ################################################################################
 
-LIBGLFW_VERSION = 3.3.2
+LIBGLFW_VERSION = 3.3.6
 LIBGLFW_SITE = $(call github,glfw,glfw,$(LIBGLFW_VERSION))
 LIBGLFW_INSTALL_STAGING = YES
-LIBGLFW_DEPENDENCIES = libgl xlib_libXcursor xlib_libXext \
-	xlib_libXi xlib_libXinerama xlib_libXrandr
 LIBGLFW_LICENSE = Zlib
 LIBGLFW_LICENSE_FILES = LICENSE.md
 
@@ -17,6 +15,23 @@ LIBGLFW_CONF_OPTS += \
 	-DGLFW_BUILD_TESTS=OFF \
 	-DGLFW_BUILD_DOCS=OFF
 
+ifeq ($(BR2_PACKAGE_XORG7),y)
+LIBGLFW_DEPENDENCIES += xlib_libXcursor xlib_libXext \
+	xlib_libXi xlib_libXinerama xlib_libXrandr
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+LIBGLFW_DEPENDENCIES += libgl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+LIBGLFW_DEPENDENCIES += libgles
+endif
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+LIBGLFW_CONF_OPTS +=  -DGLFW_USE_WAYLAND=1
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBXXF86VM),y)
 LIBGLFW_DEPENDENCIES += xlib_libXxf86vm
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
