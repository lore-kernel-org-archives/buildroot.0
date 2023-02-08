Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BDAC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E907D70138;
	Tue, 21 Feb 2023 01:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E907D70138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tO5wByiOJS33; Tue, 21 Feb 2023 01:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC1C170061;
	Tue, 21 Feb 2023 01:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC1C170061
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4321BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E018F6FFF7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E018F6FFF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BH1-rMxGhl2U for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E201C6FE5C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E201C6FE5C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE12B828C8; Mon, 20 Feb 2023 20:52:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:50:37 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d27f4c311c19f5ae130ec1941e964976d3a4f2b0
X-Git-Newrev: 0c189e7462103591eb17d34a6e33430ddc636c84
X-Patchwork-Hint: ignore
Message-Id: <20230220205254.DE12B828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 support for gui module
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c189e7462103591eb17d34a6e33430ddc636c84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 31 +++++++++++++++++++++++++++++++
 package/qt6/qt6base/qt6base.mk | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e8357a675c..1810b1586d 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -30,6 +30,37 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_GUI
+	bool "gui module"
+	select BR2_PACKAGE_FREETYPE
+	# At least one graphic backend must be enabled, so enable
+	# linuxfb if nothing is enabled.
+	select BR2_PACKAGE_QT6BASE_LINUXFB if \
+	       !BR2_PACKAGE_QT6BASE_XCB
+	help
+	  This option enables the Qt6Gui library.
+
+if BR2_PACKAGE_QT6BASE_GUI
+
+config BR2_PACKAGE_QT6BASE_LINUXFB
+	bool "linuxfb support"
+
+config BR2_PACKAGE_QT6BASE_XCB
+	bool "X.org XCB support"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_IMAGE
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
+	select BR2_PACKAGE_XCB_UTIL_WM
+	select BR2_PACKAGE_LIBXKBCOMMON
+
+comment "X.org XCB backend available if X.org is enabled"
+	depends on !BR2_PACKAGE_XORG7
+
+endif
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 2f159f380b..bcf2464590 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -40,7 +40,6 @@ QT6BASE_INSTALL_STAGING = YES
 QT6BASE_CONF_OPTS = \
 	-GNinja \
 	-DQT_HOST_PATH=$(HOST_DIR) \
-	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=OFF \
 	-DFEATURE_sql=OFF \
@@ -141,6 +140,42 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_gui=ON \
+	-DFEATURE_freetype=ON \
+	-DINPUT_opengl=no \
+	-DFEATURE_vulkan=OFF
+QT6BASE_DEPENDENCIES += freetype
+
+ifeq ($(BR2_PACKAGE_QT6BASE_LINUXFB),y)
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_linuxfb=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_QT6BASE_XCB),y)
+QT6BASE_CONF_OPTS += \
+	-DFEATURE_xcb=ON \
+	-DFEATURE_xcb_xlib=ON \
+	-DFEATURE_xkbcommon=ON \
+	-DFEATURE_xkbcommon_x11=ON
+QT6BASE_DEPENDENCIES += \
+	libxcb \
+	libxkbcommon \
+	xcb-util-wm \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xlib_libX11
+else
+QT6BASE_CONF_OPTS += -DFEATURE_xcb=OFF
+endif
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
