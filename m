Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40F0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 12:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60AD240621;
	Mon, 14 Mar 2022 12:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7VQpWUA7XZi; Mon, 14 Mar 2022 12:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A1D94060E;
	Mon, 14 Mar 2022 12:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9CF81BF3A9
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6540C826EA
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 12:20:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iaC789FiqwML for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5B4A83E94
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 12:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 20B6783E3D; Mon, 14 Mar 2022 12:11:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 13:17:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7229db872acd6db83ccb7e4bb22cb4cfd06be75
X-Git-Newrev: 70ad44ffd00786cf25145445afa374cbb295f722
X-Patchwork-Hint: ignore
Message-Id: <20220314121153.20B6783E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/efl: handle input option
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

commit: https://git.buildroot.net/buildroot/commit/?id=70ad44ffd00786cf25145445afa374cbb295f722
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2d7a3e48c574c05346b66f79cdb75ecdfa7f074e forgot to manage input
option on target which was added (and enabled by default) by
https://git.enlightenment.org/core/efl.git/commit/?id=0c2cf7e1bf7ca547655d25aaea30d081101b42be
resulting in the following build failure when eeze is disabled:

../output-1/build/efl-1.26.0/src/lib/elput/meson.build:1:0: ERROR: Unknown variable "eeze".

Fixes:
 - http://autobuild.buildroot.org/results/4a840c54bad9748b5748738378a0352d02de1f7e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Romain:
  Rename BR2_PACKAGE_EFL_LIBINPUT to BR2_PACKAGE_EFL_ELPUT to match the
  upstream name.
  use BR2_PACKAGE_EFL_ELPUT for BR2_PACKAGE_EFL_DRM
  remove duplicate libxkbcommon in EFL_DEPENDENCIES]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/efl/Config.in | 19 +++++++++++++++----
 package/efl/efl.mk    | 11 ++++++++---
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 4c78bef7c8..c4f82b92e3 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -85,6 +85,19 @@ config BR2_PACKAGE_EFL_LIBFRIBIDI
 	  so you may also trigger code paths with bugs that are never
 	  normally used.
 
+config BR2_PACKAGE_EFL_ELPUT
+	bool "Enable elput support (recommended)"
+	default y
+	depends on BR2_PACKAGE_HAS_UDEV # libinput, efl-eeze
+	select BR2_PACKAGE_EFL_EEZE
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  Eplut is used to support gesture recognition.
+
+comment "elput needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_EFL_LIBSNDFILE
 	bool "Enable libsndfile support (recommended)"
 	default y
@@ -216,13 +229,11 @@ endchoice # OpenGL support
 
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
-	depends on BR2_PACKAGE_HAS_UDEV # efl-eeze
+	depends on BR2_PACKAGE_HAS_UDEV # efl-elput, efl-eeze
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
-	select BR2_PACKAGE_EFL_EEZE
+	select BR2_PACKAGE_EFL_ELPUT
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBINPUT # For elput
-	select BR2_PACKAGE_LIBXKBCOMMON
 	help
 	  This option enable building support for the Evas DRM Engine.
 
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 43a2dc4fcb..d4a16475e5 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -67,6 +67,13 @@ else
 EFL_CONF_OPTS += -Deeze=false
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
+EFL_DEPENDENCIES += libinput libxkbcommon
+EFL_CONF_OPTS += -Dinput=true
+else
+EFL_CONF_OPTS += -Dinput=false
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
 EFL_CONF_OPTS += -Dlibmount=true
@@ -192,7 +199,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_EFL_DRM),y)
 EFL_CONF_OPTS += -Ddrm=true
-EFL_DEPENDENCIES += libdrm libegl libinput mesa3d
+EFL_DEPENDENCIES += libdrm libegl mesa3d
 else
 EFL_CONF_OPTS += -Ddrm=false
 endif
@@ -204,8 +211,6 @@ else
 EFL_CONF_OPTS += -Dwl=false
 endif
 
-EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
-
 # json evas loader is disabled by default by upstream.
 # Disable libspectre (ps).
 # Keep all other evas loader enabled or handled below.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
