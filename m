Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1168E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C3460A66;
	Tue, 30 Dec 2025 11:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YtYvH93dAD1; Tue, 30 Dec 2025 11:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA33F60A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095199;
	bh=EoLi3JG4Uz6JbB5n/q8UNG7dsLfXKX4HI+4IlFhsx/s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQSml9DRdZDrQUlvGBP9bzm9G2SBVMqfy59dwwc/dLkLVy2Z7nakZHM0jVDgfKd08
	 Z9QTHxcKkoy3qPUtOSOicuBsbTMwENgSzcriM75FJOtHbysl2hTlwXAi0nKh/YN5ZV
	 CzbDzUttA6sz6A/ZpI4CrGzapU0ZjEsmcZpfKqSdJIEdFcDh0DZ+zPeDfbP616MPTy
	 uohqPHaQ5hOjktxNy3dEiUcpdgHz2hKi6XSn/SQOV703bxiXQqkEJjBwAKgNZLT689
	 J6DliXSdaRgGgc8xM8GHrpLlszgrK+wSjrUvR9XV+LuqI4BJK5pBzuracN3u8rnnVx
	 YabyhRFoRBpzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA33F60A9D;
	Tue, 30 Dec 2025 11:46:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9ABED8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC16D402EA
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPg-tq4HqvkR for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:46:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4B12400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4B12400A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4B12400A1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 975DFA4C293D;
 Tue, 30 Dec 2025 12:46:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYB6-000000003Vt-25b8;
 Tue, 30 Dec 2025 11:46:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 30 Dec 2025 12:45:24 +0100
Message-ID: <20251230114545.2236640-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095186;
 bh=0NdUMHfYAY+zyU7HuEol5yrlFiBWV8/vknAgAZjcFk0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fiO8K2tHPMK7K1JDnRkHkxn9as83pVAoVqGUlPnPv9SWl4Q7RBjwkUqlYgniPnm3s
 P/H0k+4kM5rUtkzwUx2wCeZINMvP/zT7TbRnLW37J62ovUJuH22STD/sud+KXM/itA
 ZwgunVB+LuxrLfPPh1AadaehAB8ffwMwTVTSu7dj/ZpdLXmVifrcYTeQ3Q5KpAVSgw
 ezjMArMR1xCdp9b2JuDFpVWXEtyH8aYtUH9lCXTneOm1aL+0eTRFYh9Nwsir4OZZKw
 7TrqZITKMWTUowgu/O8XBz2eKZDnUpQnesbbST4k9/WfhImASrlmJmbvNgqUNOrugW
 PGwjOH1huAGjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fiO8K2tH
Subject: [Buildroot] [PATCH v9 03/19] package/qjson: remove package
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
index a0dad6461d..3e402e3161 100644
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
index 9775c85556..f71fdc7a3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3550,7 +3550,6 @@ F:	package/libusb/
 F:	package/libusb-compat/
 F:	package/proj/
 F:	package/python-iniparse/
-F:	package/qjson/
 F:	package/qt6/qt6core5compat/
 F:	package/quazip/
 F:	package/shapelib/
diff --git a/package/Config.in b/package/Config.in
index 8e32818e6a..960b166ae6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -383,7 +383,6 @@ comment "QT libraries and helper libraries"
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
