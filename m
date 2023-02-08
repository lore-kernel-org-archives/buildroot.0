Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4F1C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 10:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C710D40BCF;
	Wed,  8 Feb 2023 10:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C710D40BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiImJnzDk8ZG; Wed,  8 Feb 2023 10:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03CD340BCC;
	Wed,  8 Feb 2023 10:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03CD340BCC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 181CC1BF38B
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 389A14012D
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 10:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 389A14012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K3S6-wdQpheQ for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 10:51:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64AC240BCC
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 10:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64AC240BCC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 547DE845CE; Wed,  8 Feb 2023 10:51:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 11:51:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: beeae174f9fffe6ea9c50a717a9b45c71ed45ea9
X-Git-Newrev: 1bd9a456b2e2c818f35d22a212812087c3f28e4a
X-Patchwork-Hint: ignore
Message-Id: <20230208105136.547DE845CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add QPA backend
 selection
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

commit: https://git.buildroot.net/buildroot/commit/?id=1bd9a456b2e2c818f35d22a212812087c3f28e4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in  | 13 +++++++++++++
 package/qt6/qt6base/qt6base.mk |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 131dfadc1b..3af6fd9f72 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -67,6 +67,19 @@ config BR2_PACKAGE_QT6BASE_EGLFS
 	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
 	select BR2_PACKAGE_QT6BASE_OPENGL
 
+config BR2_PACKAGE_QT6BASE_DEFAULT_QPA
+	string "Default graphical platform"
+	help
+	  Choose the default platform abstraction to use for graphical
+	  applications (e.g xcb, linuxfb, eglfs, ...). If this is
+	  empty, the default for your architecture will be used
+	  (usually this is eglfs).
+
+	  You can get a list of supported platforms by running a Qt
+	  application with the option "-platform help" on your
+	  target. You can choose a different platform at runtime with
+	  the -platform option.
+
 config BR2_PACKAGE_QT6BASE_OPENGL
 	bool "OpenGL support"
 	depends on BR2_PACKAGE_QT6_GL_SUPPORTS
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 2540fbb59c..828fe57d0b 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -250,6 +250,9 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+QT6BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT6BASE_DEFAULT_QPA))
+QT6BASE_CONF_OPTS += $(if $(QT6BASE_DEFAULT_QPA),-DQT_QPA_DEFAULT_PLATFORM=$(QT6BASE_DEFAULT_QPA))
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
