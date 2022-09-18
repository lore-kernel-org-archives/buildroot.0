Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4400C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 786FD4243A;
	Sun, 18 Sep 2022 08:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 786FD4243A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pf1WHi_3ozMV; Sun, 18 Sep 2022 08:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4369C42433;
	Sun, 18 Sep 2022 08:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4369C42433
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E398A1BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF7D160E2F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF7D160E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R-hXZeWM7j5s for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6265860B2A
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6265860B2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C2F0848D2; Sun, 18 Sep 2022 08:56:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 10:46:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7f854bce5079608af4cc6c3653b6d71db529cc7
X-Git-Newrev: 7793f4d72735bbdf7daf706056737796296b618a
X-Patchwork-Hint: ignore
Message-Id: <20220918085611.4C2F0848D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: order conditional
 blocks alphabetically
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

commit: https://git.buildroot.net/buildroot/commit/?id=7793f4d72735bbdf7daf706056737796296b618a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit changes qt6base.mk to order conditional blocks
alphabetically based on the BR2_PACKAGE_* option they test.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index e8bb8e7e47..44092ffc82 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -77,6 +77,15 @@ define HOST_QT6BASE_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(BR2_CMAKE) --install $(HOST_QT6BASE_BUILDDIR)
 endef
 
+# Conditional blocks below are ordered by alphabetic ordering of the
+# BR2_PACKAGE_* option.
+
+ifeq ($(BR2_PACKAGE_QT6BASE_CONCURRENT),y)
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+endif
+
 # We need host-qt6base with D-Bus support, otherwise: "the tool
 # "Qt6::qdbuscpp2xml" was not found in the Qt6DBusTools package."
 ifeq ($(BR2_PACKAGE_QT6BASE_DBUS),y)
@@ -95,10 +104,10 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT6BASE_CONCURRENT),y)
-QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
 else
-QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_QT6BASE_TEST),y)
@@ -113,11 +122,5 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_xml=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_QT6BASE_SYSLOG),y)
-QT6BASE_CONF_OPTS += -DFEATURE_syslog=ON
-else
-QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
-endif
-
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
