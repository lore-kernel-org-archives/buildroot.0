Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE390C02190
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D329606BE;
	Sat, 14 Sep 2024 11:26:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oX5mgG2wVVo6; Sat, 14 Sep 2024 11:26:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27DB660651
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27DB660651;
	Sat, 14 Sep 2024 11:26:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22FC21BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1204180D5D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vg8_D_J3o_gB for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A0EE80D50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A0EE80D50
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D00782849; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 12:07:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49258bc3b27f84dd587aee3eb25dbd0a76f38dc0
X-Git-Newrev: c8662264eb6316334d77bb189bd6057976ef5876
X-Patchwork-Hint: ignore
Message-Id: <20240914112645.3D00782849@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: allow selecting the
 host print support module
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8662264eb6316334d77bb189bd6057976ef5876
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to configure.cmake print support requires us to select the
widgets feature:

...
qt_feature("printsupport" PRIVATE
    LABEL "Qt PrintSupport"
    CONDITION QT_FEATURE_widgets
    SECTION "Module"
    PURPOSE "Provides the Qt PrintSupport module."
)
...

And further, according to configure.cmake, widgets requires us to select
the gui feature:

...
qt_feature("widgets" PRIVATE
    LABEL "Qt Widgets"
    AUTODETECT NOT TVOS AND NOT WATCHOS
    CONDITION QT_FEATURE_gui
)
...

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in.host |  9 +++++++++
 package/qt6/qt6base/qt6base.mk     | 14 ++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 46fb668817..786c8ea3a7 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -8,6 +8,11 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
 
+# The Qt Widgets module is required for printsupport
+config BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
+	bool
+	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+
 # Select this if you need host qt6 tools that require the Qt::Test module
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
@@ -17,3 +22,7 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
 # (e.g. qhelpgenerator).
 config BR2_PACKAGE_HOST_QT6BASE_SQL
 	bool
+
+config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	bool
+	select BR2_PACKAGE_HOST_QT6BASE_GUI
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 4c0392f92d..0617d05f5c 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -113,10 +113,8 @@ HOST_QT6BASE_CONF_OPTS += \
 	-DFEATURE_png=OFF \
 	-DFEATURE_gif=OFF \
 	-DFEATURE_jpeg=OFF \
-	-DFEATURE_printsupport=OFF \
 	-DFEATURE_kms=OFF \
 	-DFEATURE_fontconfig=OFF \
-	-DFEATURE_widgets=OFF \
 	-DFEATURE_libinput=OFF \
 	-DFEATURE_tslib=OFF \
 	-DFEATURE_eglfs=OFF
@@ -131,6 +129,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
+endif
+
 # We need host qt6base with Sql support for host-qt6tools to generate the
 # qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
 # available.
@@ -150,6 +154,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
