Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BA8C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1FAF60FF4;
	Mon,  4 Apr 2022 17:27:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGyXWQWggHmN; Mon,  4 Apr 2022 17:27:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFDB60FE2;
	Mon,  4 Apr 2022 17:27:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69A171BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 514D7827CE
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dBkJyBlIGy7x for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:26:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF2A081B14
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:26:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6F5328622B; Mon,  4 Apr 2022 17:17:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 19:16:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bcae68f37d2c608e9e151fb983f16c09c11f85e
X-Git-Newrev: af457e6da30b78b53bd020a09c8487185e7316dd
X-Patchwork-Hint: ignore
Message-Id: <20220404171729.6F5328622B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: bump version to 0.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=af457e6da30b78b53bd020a09c8487185e7316dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://stellarium.org/release/2022/03/27/stellarium-0.22.0.html

Added upstream patch to fix build error.

Added dependency to qt5charts following upstream commit:
https://github.com/Stellarium/stellarium/commit/5b8fece8d03c64f27f37469f0604efd88d54393d#diff-1e7de1ae2d059d21e1dd75d5812d5a34b0222cef273b7c3a2af62eb747f9d20aR487

Added configure option to disable qt5webengine support, the package is
broken: https://bugs.busybox.net/show_bug.cgi?id=14681

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...xed-building-Stellarium-without-scripting.patch | 49 ++++++++++++++++++++++
 package/stellarium/Config.in                       |  1 +
 package/stellarium/stellarium.hash                 |  4 +-
 package/stellarium/stellarium.mk                   |  4 +-
 4 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch b/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch
new file mode 100644
index 0000000000..57f15a8eff
--- /dev/null
+++ b/package/stellarium/0001-Fixed-building-Stellarium-without-scripting.patch
@@ -0,0 +1,49 @@
+From 710d1c5acd9e962260ce395474819ded2eb6ce12 Mon Sep 17 00:00:00 2001
+From: "Alexander V. Wolf" <alex.v.wolf@gmail.com>
+Date: Tue, 29 Mar 2022 18:57:06 +0700
+Subject: [PATCH] Fixed building Stellarium without scripting
+
+Downloaded from upstream commit:
+https://github.com/Stellarium/stellarium/commit/710d1c5acd9e962260ce395474819ded2eb6ce12
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ plugins/Calendars/src/Calendars.cpp | 2 ++
+ plugins/Calendars/src/Calendars.hpp | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/plugins/Calendars/src/Calendars.cpp b/plugins/Calendars/src/Calendars.cpp
+index e5d89a4c063..4df6caee42e 100644
+--- a/plugins/Calendars/src/Calendars.cpp
++++ b/plugins/Calendars/src/Calendars.cpp
+@@ -251,6 +251,7 @@ void Calendars::init()
+ 	}
+ }
+ 
++#ifdef ENABLE_SCRIPTING
+ // Add calendar as scriptable object! Some scripting functions won't work though, as they use object types unknown to the scripting engine.
+ void Calendars::makeCalendarsScriptable(StelScriptMgr *ssm)
+ {
+@@ -260,6 +261,7 @@ void Calendars::makeCalendarsScriptable(StelScriptMgr *ssm)
+ 		ssm->addObject(cal);
+ 	}
+ }
++#endif
+ 
+ void Calendars::loadSettings()
+ {
+diff --git a/plugins/Calendars/src/Calendars.hpp b/plugins/Calendars/src/Calendars.hpp
+index 461ae1bd9ba..4696183d9d2 100644
+--- a/plugins/Calendars/src/Calendars.hpp
++++ b/plugins/Calendars/src/Calendars.hpp
+@@ -145,8 +145,10 @@ class Calendars : public StelModule
+ 	//! TODO: ADD HERE: Chinese, NewHinduSolar, NewHinduLunar, ...
+ 	Calendar* getCal(QString name);
+ 
++	#ifdef ENABLE_SCRIPTING
+ 	//! to be called after program startup, when StelScriptMgr has been set up.
+ 	void makeCalendarsScriptable(StelScriptMgr *ssm);
++	#endif
+ 
+ signals:
+ 	//void jdChanged(double jd);
diff --git a/package/stellarium/Config.in b/package/stellarium/Config.in
index 5922162d44..566f8edc83 100644
--- a/package/stellarium/Config.in
+++ b/package/stellarium/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_STELLARIUM
 	select BR2_PACKAGE_QT5BASE_OPENGL
 	select BR2_PACKAGE_QT5BASE_PRINTSUPPORT
 	select BR2_PACKAGE_QT5BASE_WIDGETS
+	select BR2_PACKAGE_QT5CHARTS
 	select BR2_PACKAGE_QT5LOCATION
 	select BR2_PACKAGE_QT5MULTIMEDIA
 	select BR2_PACKAGE_ZLIB
diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index c3f2e0e8d4..2c2427bf0e 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
 # From https://github.com/Stellarium/stellarium/releases
-sha1  a3396c403050e073c592da695faeb048c1d5e19b  stellarium-0.21.3.tar.gz
-sha256  8ac6c054d12f136fe0d5c0deaaa8d7b69dd2a462be1711a187364574aef97e7f  stellarium-0.21.3.tar.gz
+sha1  c4a00fd756c66fb7df633f496dd3be4300bf1d2b  stellarium-0.22.0.tar.gz
+sha256  0b4dc23cf9054b5e76cd9bc5ad68e172eb221999e90af37e93667d04fe78c885  stellarium-0.22.0.tar.gz
 # Locally computed
 sha256  3aeeb5bb98bf7041ab82cffe15efa28ac58ee2bdf162b71301f5c192be631259  COPYING
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index ca5c07b2a7..1226b1190d 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,18 +4,20 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 0.21.3
+STELLARIUM_VERSION = 0.22.0
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
 STELLARIUM_LICENSE_FILES = COPYING
 STELLARIUM_DEPENDENCIES = \
 	qt5base \
+	qt5charts \
 	qt5location \
 	qt5multimedia \
 	zlib
 STELLARIUM_CONF_OPTS = \
 	-DENABLE_MEDIA=ON \
 	-DENABLE_NLS=OFF \
+	-DENABLE_QTWEBENGINE=OFF \
 	-DUSE_SYSTEM_ZLIB=ON
 
 ifeq ($(BR2_PACKAGE_QT5SCRIPT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
