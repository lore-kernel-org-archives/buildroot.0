Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFD7E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB24940702;
	Sun, 28 Dec 2025 07:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1qtbShUcdyi; Sun, 28 Dec 2025 07:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ACBE40704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908280;
	bh=L657u4AT02VuG/JRiUXivsWRuSh+ZLaLvnxrbABm6aA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvbzLl0uuRMarSUN9OW6A4pqAZUoXfEHCNV9J3TQkrLrdGq/cHJWGWobtHfWZweBe
	 mkko5dhNg4qnAVl2dt0Kr0FlYn7cfT1tBX2Tpm9ni6AE1vQDo+pyW33z1ohTZiaZqW
	 /0vRjHRXqClDzwvcUokQcAXYF5FcnG/EZozFt9dvenc+kR0OkH1Qh7POqIVFQdm6pj
	 69+eyN6jlIzbOFJRpWdIFnwIpGXVp92rR6mo+1IqNge3GPsku38mKdsrcKZ5LXpnDe
	 Kl2wBx4Zf/cTIY7VPxjhhuTP8CdV1NVHQRtwmFRORGz6MY428njkSwqw9lPl9cgwhz
	 NfBLhzo7mInmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ACBE40704;
	Sun, 28 Dec 2025 07:51:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34D841E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C26D40704
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrcEzjXJvt-3 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:51:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0534440702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0534440702
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0534440702
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:51:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 51EF5A4C22F9;
 Sun, 28 Dec 2025 08:48:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVq-000000004ex-0Y4R;
 Sun, 28 Dec 2025 07:48:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 28 Dec 2025 08:48:08 +0100
Message-ID: <20251228074822.3370464-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908117;
 bh=1m0uE1Ta7VRI4k37DHXZpugEZEURuGVL8LNTqL+oGHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hmiLIpqiTgccd31MJr1p87X81Cln1wR9bS4mFOe8s88DA1+Y1M/LnZBWSPRq9abGO
 T7jxSdhJHLcQZtys+1LUggZbM3LR9zjBO4ndr7vwtUyBq5p4rw1R7SgJmG8W4+dZsj
 t7qXQRIVwE2H3h0EZ1rUyioLzxbcriivoGc+ltU1smmEi9GPniAjIxCusgd4yPa4KG
 c9VuneagzAgXKLs0c3VRAYim5QHQVQtVOtZYAEp2XOA+T1mxlvk2o+1r6wTFnZqKcv
 AVfPHaETB954PuAumQz8kIGXzcFmXXpgmKfOfHhFa8YnP+/UbmOwC82vK3piwzLhfn
 Ud3n6YAlhcllQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hmiLIpqi
Subject: [Buildroot] [PATCH v6 13/26] package/qjson: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/flavio/qjson/commit/6d188cb199a5248889689bd92b757cf0c17cfa27
"This project is archived. QJson was originally created when Qt3 and Qt4
 lacked robust JSON support.

 Since Qt5, JSON support is included in the native Qt library SDK, making
 this project obsolete."

The package is broken with cmake 4 and no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 Config.in.legacy         |  6 ++++++
 DEVELOPERS               |  1 -
 package/Config.in        |  1 -
 package/qjson/Config.in  |  8 --------
 package/qjson/qjson.hash |  3 ---
 package/qjson/qjson.mk   | 14 --------------
 6 files changed, 6 insertions(+), 27 deletions(-)
 delete mode 100644 package/qjson/Config.in
 delete mode 100644 package/qjson/qjson.hash
 delete mode 100644 package/qjson/qjson.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9b58f34889..2977b80152 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_QJSON
+	bool "qjson has been removed"
+	select BR2_LEGACY
+	help
+	  qjson was deprecated upstream and has been removed
+
 config BR2_PACKAGE_OPENTRACING_CPP
 	bool "opentracing-cpp has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f6fbf7bff5..41db422a9f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3540,7 +3540,6 @@ F:	package/libusb/
 F:	package/libusb-compat/
 F:	package/proj/
 F:	package/python-iniparse/
-F:	package/qjson/
 F:	package/qt6/qt6core5compat/
 F:	package/quazip/
 F:	package/shapelib/
diff --git a/package/Config.in b/package/Config.in
index 322e233e06..a4288b740c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -381,7 +381,6 @@ comment "QT libraries and helper libraries"
 	source "package/grantlee/Config.in"
 	source "package/kf5/Config.in"
 	source "package/qextserialport/Config.in"
-	source "package/qjson/Config.in"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
 	source "package/simple-mail/Config.in"
diff --git a/package/qjson/Config.in b/package/qjson/Config.in
deleted file mode 100644
index adb06cddc0..0000000000
--- a/package/qjson/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_QJSON
-	bool "qjson"
-	depends on BR2_PACKAGE_QT5
-	help
-	  QJson is a Qt-based library that maps JSON data to
-	  QVariant objects and vice versa.
-
-	  http://qjson.sourceforge.net
diff --git a/package/qjson/qjson.hash b/package/qjson/qjson.hash
deleted file mode 100644
index ab22350e61..0000000000
--- a/package/qjson/qjson.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  e812617477f3c2bb990561767a4cd8b1d3803a52018d4878da302529552610d4  qjson-0.9.0.tar.gz
-sha256  758a0cd48d2bec59cbd04ab616737b7aa0cdceac87508adbc9468715ac90722b  COPYING.lib
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
deleted file mode 100644
index 718d6622a8..0000000000
--- a/package/qjson/qjson.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# qjson
-#
-################################################################################
-
-QJSON_VERSION = 0.9.0
-QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
-QJSON_INSTALL_STAGING = YES
-QJSON_DEPENDENCIES = qt5base
-QJSON_LICENSE = LGPL-2.1
-QJSON_LICENSE_FILES = COPYING.lib
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
