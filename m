Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95116ECAAD2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 20:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17F6D60B14;
	Mon, 29 Aug 2022 20:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F6D60B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNY0DOh19cqO; Mon, 29 Aug 2022 20:07:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4885460B3F;
	Mon, 29 Aug 2022 20:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4885460B3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2D81BF9A4
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19028813D4
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 20:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19028813D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baM2DFme9WeW for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 20:06:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA59813D2
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 20:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AA59813D2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 40F9387FB6; Mon, 29 Aug 2022 19:51:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 21:30:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bb6352c9eddf51f13e033ea7bba846a1bdaf3cc6
X-Git-Newrev: 4337d4b8334e08e5baab03e6d9c64edc5afa802d
X-Patchwork-Hint: ignore
Message-Id: <20220829195150.40F9387FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt6/qt6base: add
 support for dbus module
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

commit: https://git.buildroot.net/buildroot/commit/?id=4337d4b8334e08e5baab03e6d9c64edc5afa802d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  |  8 ++++++++
 package/qt6/qt6base/qt6base.mk | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 354e02280a..2d4a4df223 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -22,6 +22,14 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
 	help
 	  This options enables the Qt6Concurrent library.
 
+config BR2_PACKAGE_QT6BASE_DBUS
+	bool "DBus module"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	select BR2_PACKAGE_DBUS
+	help
+	  This option enables the D-Bus module.
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index db70386507..36176367e5 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -75,6 +75,18 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+# We need host-qt6base with D-Bus support, otherwise: "the tool
+# "Qt6::qdbuscpp2xml" was not found in the Qt6DBusTools package."
+ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON -DINPUT_dbus=linked
+QT6BASE_DEPENDENCIES += dbus
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=ON
+HOST_QT6BASE_DEPENDENCIES += host-dbus
+else
+QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_dbus=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_NETWORK),y)
 QT6BASE_CONF_OPTS += -DFEATURE_network=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
