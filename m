Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EA5C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD361600C7;
	Wed,  7 Aug 2024 20:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q86m_3q6Zs3n; Wed,  7 Aug 2024 20:53:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 182E660805
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 182E660805;
	Wed,  7 Aug 2024 20:53:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EED81BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 620968146F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EEeZFFV3io4I for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C485581492
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C485581492
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:53:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 729ED84692; Wed,  7 Aug 2024 20:53:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 22:52:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c4f3014ef9128a1d743e96452d388a3343c1150
X-Git-Newrev: 698c9f12c48463c6c39a747109e8b39d5a4fa660
X-Patchwork-Hint: ignore
Message-Id: <20240807205312.729ED84692@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grantlee: enable building for Qt6
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

commit: https://git.buildroot.net/buildroot/commit/?id=698c9f12c48463c6c39a747109e8b39d5a4fa660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grantlee/Config.in   | 8 +++++---
 package/grantlee/grantlee.mk | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 779306bc2e..7849cfd9f2 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_GRANTLEE
 	bool "grantlee"
-	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5SCRIPT
-	select BR2_PACKAGE_QT5BASE_GUI
+	depends on (BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5) || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5SCRIPT if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_GUI if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_GUI if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6DECLARATIVE if BR2_PACKAGE_QT6
 	help
 	  Qt implementation of the Django template framework
 
diff --git a/package/grantlee/grantlee.mk b/package/grantlee/grantlee.mk
index 7e36334902..9e78664559 100644
--- a/package/grantlee/grantlee.mk
+++ b/package/grantlee/grantlee.mk
@@ -9,6 +9,12 @@ GRANTLEE_SITE = $(call github,steveire,grantlee,v$(GRANTLEE_VERSION))
 GRANTLEE_INSTALL_STAGING = YES
 GRANTLEE_LICENSE = LGPL-2.1+
 GRANTLEE_LICENSE_FILES = COPYING.LIB
-GRANTLEE_DEPENDENCIES = qt5base qt5script
+
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+GRANTLEE_DEPENDENCIES += qt5base qt5script
+else ifeq ($(BR2_PACKAGE_QT6BASE),y)
+GRANTLEE_DEPENDENCIES += qt6base qt6declarative
+GRANTLEE_CONF_OPTS += -DGRANTLEE_BUILD_WITH_QT6=ON
+endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
