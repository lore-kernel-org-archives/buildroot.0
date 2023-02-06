Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7CDC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A1806FBE2;
	Tue, 21 Feb 2023 01:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A1806FBE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zvu3GfBbj95D; Tue, 21 Feb 2023 01:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EA2870057;
	Tue, 21 Feb 2023 01:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EA2870057
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6C31BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 026A06FC19
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 026A06FC19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wexYxHZGkZfA for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FC98610D5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FC98610D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C19681979; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 23:23:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fa75c4a3054e0cd3457f9e50deb1b9c06325c242
X-Git-Newrev: a94d39d693d84f96f996a6a3decfecc60a9625bd
X-Patchwork-Hint: ignore
Message-Id: <20230220205251.0C19681979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5: fix build failure
 due to libressl use
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

commit: https://git.buildroot.net/buildroot/commit/?id=a94d39d693d84f96f996a6a3decfecc60a9625bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Qt5 only supports openssl, check [0] and [1]. So in qt5base.mk let's check
if BR2_PACKAGE_LIBOPENSSL is enabled instead of BR2_PACKAGE_OPENSSL(that
could be openssl or libressl) and for qt5enginio and qt5webkit let's select
BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL instead of only BR2_PACKAGE_OPENSSL.
This way we make sure that only openssl is selected and not libressl or
other future openssl-like implementations.

Fixes:
http://autobuild.buildroot.net/results/a956b48b782dbaa055d7146360465e2493a809d9/

[0]: https://doc.qt.io/qt-5/ssl.html#enabling-and-disabling-ssl-support
[1]: https://bugreports.qt.io/browse/QTBUG-68374

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk   | 4 ++--
 package/qt5/qt5enginio/Config.in | 2 ++
 package/qt5/qt5webkit/Config.in  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index a81892422c..efa0e16e9a 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -229,8 +229,8 @@ else
 QT5BASE_CONFIGURE_OPTS += -no-eglfs
 endif
 
-QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
-QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
+QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBOPENSSL),-openssl,-no-openssl)
+QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBOPENSSL),openssl)
 
 QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
 QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
index b738f0db7c..a1ac6f8ca0 100644
--- a/package/qt5/qt5enginio/Config.in
+++ b/package/qt5/qt5enginio/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_QT5ENGINIO
 	bool "qt5enginio"
 	select BR2_PACKAGE_OPENSSL
+	# Only openssl is supported by qt5
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_NETWORK
 	help
diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 26c3897d1d..9b84ac5f96 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -16,6 +16,8 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_LEVELDB
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_OPENSSL
+	# Only openssl is supported by qt5
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5BASE_WIDGETS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
