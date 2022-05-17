Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9376C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 21:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B90684058;
	Tue, 17 May 2022 21:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7SkmXUKZcy-T; Tue, 17 May 2022 21:10:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 660958402D;
	Tue, 17 May 2022 21:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A802D1BF995
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A562A60AE4
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 21:10:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJJ9R-gugzJ3 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 21:10:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D451F60A93
 for <buildroot@buildroot.org>; Tue, 17 May 2022 21:10:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9963185F90; Tue, 17 May 2022 20:59:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:52:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3be5990680514634aad41a1ca8f5a6337223cf6
X-Git-Newrev: bdb247436c7309f3fb8e7d60ed5e66883ae17a45
X-Patchwork-Hint: ignore
Message-Id: <20220517205918.9963185F90@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: propagate reverse
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bdb247436c7309f3fb8e7d60ed5e66883ae17a45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It appears some pango reverse dependencies aren't propagated properly.

Fixes:
WARNING: unmet direct dependencies detected for BR2_PACKAGE_PANGO
  Depends on [n]: BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=n]
  Selected by [y]:
  - BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML [=y] && BR2_PACKAGE_GSTREAMER1 [=y] && BR2_PACKAGE_GST1_PLUGINS_BAD [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y]

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-bad/Config.in  |  7 +++++--
 package/gstreamer1/gst1-plugins-base/Config.in | 10 +++++++---
 package/weston/Config.in                       |  5 +++--
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 669360adb1..cd5a2c7b11 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -481,18 +481,21 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
 	bool "ttml"
 	depends on BR2_USE_WCHAR # pango -> glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
+	depends on BR2_USE_MMU # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PANGO
 	help
 	  Timed Text Markup Language (TTML) subtitle plugin
 
-comment "ttml needs a toolchain w/ wchar, threads, C++"
+comment "ttml needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
 	bool "mpeg2enc"
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 7ca94d7dc4..bd4ee0b994 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -291,6 +291,9 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OPUS
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
+	depends on BR2_USE_WCHAR # pango -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
+	depends on BR2_USE_MMU # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
@@ -298,10 +301,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin needs a toolchain w/ C++, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "pango plugin needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
 	bool "theora (*.ogg video)"
diff --git a/package/weston/Config.in b/package/weston/Config.in
index 6ad8241caa..3b4e932b7d 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -147,6 +147,7 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	bool "demo clients"
 	depends on BR2_USE_MMU # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango
 	depends on BR2_USE_WCHAR # pango
@@ -156,11 +157,11 @@ config BR2_PACKAGE_WESTON_DEMO_CLIENTS
 	help
 	  This enables the installation of Weston's demo clients.
 
-comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++"
+comment "demo clients needs an OpenGL ES provider, an OpenEGL-capable Wayland backend and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
-		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+		!BR2_PACKAGE_HAS_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
