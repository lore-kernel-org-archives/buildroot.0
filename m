Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB88C02191
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1F060724;
	Sat, 14 Sep 2024 11:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFj6arryT_Xr; Sat, 14 Sep 2024 11:27:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE65611A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE65611A4;
	Sat, 14 Sep 2024 11:27:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B74B1BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E2BA4034B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJ07-vz038eb for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2692040395
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2692040395
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DC158284B; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 12:36:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b9e0ec57c660554ef6c46c0cfdfdd5a6db24e27
X-Git-Newrev: aba638007f198bc12f01d7e6511baa3d3fecb2f6
X-Patchwork-Hint: ignore
Message-Id: <20240914112645.7DC158284B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/qt6/qt6base: allow
 selecting the host print support module"
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

commit: https://git.buildroot.net/buildroot/commit/?id=aba638007f198bc12f01d7e6511baa3d3fecb2f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit c8662264eb6316334d77bb189bd6057976ef5876.

Thanks to
7b9e0ec57c660554ef6c46c0cfdfdd5a6db24e27 ("package/qt6/qt6tools: allow
building linguist tools without printsupport"), this is in fact not
needed, as linguist for the host can be built without having
printsupport in host-qt6base, so let's drop the hidden options that
are now unused.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in.host |  9 ---------
 package/qt6/qt6base/qt6base.mk     | 14 ++------------
 2 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 786c8ea3a7..46fb668817 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -8,11 +8,6 @@ config BR2_PACKAGE_HOST_QT6BASE_GUI
 config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 	bool
 
-# The Qt Widgets module is required for printsupport
-config BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT
-	bool
-	select BR2_PACKAGE_HOST_QT6BASE_WIDGETS
-
 # Select this if you need host qt6 tools that require the Qt::Test module
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
@@ -22,7 +17,3 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
 # (e.g. qhelpgenerator).
 config BR2_PACKAGE_HOST_QT6BASE_SQL
 	bool
-
-config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
-	bool
-	select BR2_PACKAGE_HOST_QT6BASE_GUI
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 0617d05f5c..4c0392f92d 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -113,8 +113,10 @@ HOST_QT6BASE_CONF_OPTS += \
 	-DFEATURE_png=OFF \
 	-DFEATURE_gif=OFF \
 	-DFEATURE_jpeg=OFF \
+	-DFEATURE_printsupport=OFF \
 	-DFEATURE_kms=OFF \
 	-DFEATURE_fontconfig=OFF \
+	-DFEATURE_widgets=OFF \
 	-DFEATURE_libinput=OFF \
 	-DFEATURE_tslib=OFF \
 	-DFEATURE_eglfs=OFF
@@ -129,12 +131,6 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_HOST_QT6BASE_PRINTSUPPORT),y)
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=ON
-else
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_printsupport=OFF
-endif
-
 # We need host qt6base with Sql support for host-qt6tools to generate the
 # qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
 # available.
@@ -154,12 +150,6 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
-else
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
-endif
-
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
