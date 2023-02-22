Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEE9C636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 20:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B20934112B;
	Wed, 22 Feb 2023 20:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B20934112B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKsEXVdczbw5; Wed, 22 Feb 2023 20:04:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C01D8410DA;
	Wed, 22 Feb 2023 20:04:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C01D8410DA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F63A1BF475
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28EFB81FF4
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 20:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28EFB81FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEyE7I4I1-M1 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 20:03:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88ADE81FED
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 20:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88ADE81FED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73DF086810; Wed, 22 Feb 2023 20:03:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 20:51:33 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 703781013b150c1dae011e43935d89dc9cc69d50
X-Git-Newrev: 2c667302fd6a0f16a36925a77d0e2e6b7ec64bbc
X-Patchwork-Hint: ignore
Message-Id: <20230222200317.73DF086810@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/qt5: fix build
 failure due to libressl use
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c667302fd6a0f16a36925a77d0e2e6b7ec64bbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit a94d39d693d84f96f996a6a3decfecc60a9625bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5base/qt5base.mk   | 4 ++--
 package/qt5/qt5enginio/Config.in | 2 ++
 package/qt5/qt5webkit/Config.in  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index f880f806cc..ab6c579fdb 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -216,8 +216,8 @@ else
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
