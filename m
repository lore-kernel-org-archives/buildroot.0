Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4C4D5B165
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D9E660A88;
	Sat, 13 Dec 2025 20:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRludLI9jTU7; Sat, 13 Dec 2025 20:27:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B72608AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765657653;
	bh=gr/GYqebMUnPrgNDO20/XZoYFAOkIzsyJAcE6oTisC4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EMLr5rzPyNKge6ZyxgWuFw5vGZ7o/Q+rQ9e+5nji95qLCfbajdLxTARHe9RRu+gIx
	 UXemDPO6zMdaKCWw+KtGgz93QBN7G5jo+7iZRA1BCUU83F80rhjG2Zto6Dc+hYAZv/
	 BDA6GScelonD78RhsvjGGv3HSNfytBTaBOLLh4VD75lCaEU0+8sdPD6uvy959lNYDD
	 8GmSsCCJyZUz98XZuIYqsJ1OZc0J3UmJSKbJr+eko7T5W+l0i6FextmD2qv6Wkj/Pq
	 K0PvTsJnCsP97jCH4HKxGh0f9H9MW9hXh7CXEOUrc/dF8tcERXnPksUu9YQ0hR/yxH
	 f/VQ0aQfh2Ojw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3B72608AC;
	Sat, 13 Dec 2025 20:27:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 06E6B13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1ACC40890
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuC_Na5w98kJ for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:27:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D19E1407F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D19E1407F0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D19E1407F0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:27:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 40F16A4C3DB9;
 Sat, 13 Dec 2025 21:25:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41122)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUWAr-000000003Sm-23m2;
 Sat, 13 Dec 2025 20:25:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Jan Heylen <jan.heylen@nokia.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Ben Boeckel <mathstuf@gmail.com>
Date: Sat, 13 Dec 2025 21:24:59 +0100
Message-ID: <20251213202503.1348845-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213202503.1348845-1-bernd@kuhls.net>
References: <20251213202503.1348845-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765657515;
 bh=sNrMkXpXGCJ21baR4yGx9/4wMKPMvPNShhMx00hwwqM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KldVFz7iqYWUE8V5un9rdBU4GwFNXe4vf0Uh75H7pNOlopVVoq76gQccH3+1xN8So
 QoUyhgbJtcItN3ASA5sDnsNZcHLWFLYLK3wQCdp8g6EeoLX9cEWowBwizDDniHb/PF
 TrcTvwifA/UgOIGG93It5MWpPdyYh4wAj9tdYMj5RY3MM8IKs+3z9FI/du3VSXIe2M
 Q39uMdsJLPI0939YlT5Ng//z17HG6WfuY82lqAdo7nyZaQTIFagst55ynNG1cAGHNy
 i2mnLcoHqYjPBKricbrJvxA6wmQqFuqwzGh1//26yUeSF712+SB4txKHNOZ9PNBZL9
 a1Fnt8xDksJ4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KldVFz7i
Subject: [Buildroot] [PATCH v2 13/16] package/qjson: remove package
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
index a402f1c121..9ab95c32a5 100644
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
index 93ff7cea4c..a9041890f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3527,7 +3527,6 @@ F:	package/libusb/
 F:	package/libusb-compat/
 F:	package/proj/
 F:	package/python-iniparse/
-F:	package/qjson/
 F:	package/qt6/qt6core5compat/
 F:	package/quazip/
 F:	package/shapelib/
diff --git a/package/Config.in b/package/Config.in
index 4eaa6894e5..ba4efcc8b2 100644
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
