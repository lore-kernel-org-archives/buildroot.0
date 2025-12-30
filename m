Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A90E95A79
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 11:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFFAE40816;
	Tue, 30 Dec 2025 11:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjKC4wc-vZt4; Tue, 30 Dec 2025 11:46:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E949A40821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767095186;
	bh=YvCgSCHIWiPZeuBLFZzyXxQwUdkjy3FhkgyHb1EZLlA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRci7O3JG4//wNMjZigbBI7X0plZE/otzhpWNKzE1GQA4xx2cTpxzR15603XPwV0x
	 7Mrx2eef7U4x6lyquOwWTtskUS2Pm2wSu8nhNlXsJFuJ6Ml2Mo0MsIa/F/JoCdUgL8
	 I0MgAyl4lKxvF3mI07yLZhuKKDcYYJCRMoT4j5YFhUOCb1von51gZnbPNWILop4X0x
	 snZCFZ4xUMwNCntConXqSz/ZezcptLBvi9mGoL7xOPFRQjpvm4dcscVIeIFHY7nj5g
	 UHEUPhJPYQuvIPDQFJfRf7fD+74Au2kXWnZknzi64vV4++mTJyBKLc5T38iD7ICpoY
	 ye178HyIPLwuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E949A40821;
	Tue, 30 Dec 2025 11:46:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A93D8
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0836760A66
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HCD8tAXIGem for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 11:46:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C5E59608BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5E59608BB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C5E59608BB
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 11:46:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 114EEA4C1172;
 Tue, 30 Dec 2025 12:46:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaYAy-000000003Vt-0C5O;
 Tue, 30 Dec 2025 11:46:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Jan Heylen <jan.heylen@nokia.com>
Date: Tue, 30 Dec 2025 12:45:23 +0100
Message-ID: <20251230114545.2236640-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251230114545.2236640-1-bernd@kuhls.net>
References: <20251230114545.2236640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767095177;
 bh=KSlhD2jZ0tdHNNmivK4NFex3sl+Nkp4UBMecg3YTDfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=i6ah3fsbvYjVl+duWSjHT3NCYc1k6z8xVJZlLuPIvO7qGZh2mMXT5/62OJq1XQOoy
 0lL1vrAPbzbBBBGEhbGRI+RUR9a9LUMpTHdmlBPO2uae6CnkeD1iH9h4HiFSVomv5d
 G2CcPaBTpC8qhncLoAg8hmtl3YnD6CXvNLCpmkuRbAiqi5iWcqztAt9MIBRPsX1jDq
 zKWP+22Q1Iq2sb5EJWvaCkifyYF2J54l0NUeOXSRO/4TNVgNjLERr8nneAsiYrApKQ
 xvASymHv3MsIgGClRwrYqeEv+HWGfcvmUUfBneFbZQgREd2DJC/A3FxWJobPn0dPr4
 PhxoAPr+a2CZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=i6ah3fsb
Subject: [Buildroot] [PATCH v9 02/19] package/opentracing-cpp: remove package
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

Quoting https://github.com/opentracing/opentracing-cpp
"This library is DEPRECATED!"
https://github.com/opentracing/specification/issues/163
https://github.com/opentracing/opentracing.io/pull/460

The package is broken with cmake 4 and no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Jan Heylen <jan.heylen@nokia.com>
---
 Config.in.legacy                             |  6 +++++
 DEVELOPERS                                   |  3 ---
 package/Config.in                            |  1 -
 package/opentracing-cpp/Config.in            | 18 -------------
 package/opentracing-cpp/opentracing-cpp.hash |  3 ---
 package/opentracing-cpp/opentracing-cpp.mk   | 28 --------------------
 6 files changed, 6 insertions(+), 53 deletions(-)
 delete mode 100644 package/opentracing-cpp/Config.in
 delete mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 delete mode 100644 package/opentracing-cpp/opentracing-cpp.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 8e6c4a37e8..a0dad6461d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_OPENTRACING_CPP
+	bool "opentracing-cpp has been removed"
+	select BR2_LEGACY
+	help
+	  opentracing-cpp was deprecated upstream and has been removed
+
 config BR2_PACKAGE_OPENPOWERLINK
 	bool "openpowerlink has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index e157e98f79..9775c85556 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1564,9 +1564,6 @@ N:	Jan Havran <havran.jan@email.cz>
 F:	board/pine64/pinecube/
 F:	configs/pine64_pinecube_defconfig
 
-N:	Jan Heylen <jan.heylen@nokia.com>
-F:	package/opentracing-cpp/
-
 N:	Jan Kraval <jan.kraval@gmail.com>
 F:	board/orangepi/orangepi-lite
 F:	configs/orangepi_lite_defconfig
diff --git a/package/Config.in b/package/Config.in
index 5e5d10874d..8e32818e6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1954,7 +1954,6 @@ menu "Logging"
 	source "package/log4cpp/Config.in"
 	source "package/log4cxx/Config.in"
 	source "package/log4qt/Config.in"
-	source "package/opentracing-cpp/Config.in"
 	source "package/spdlog/Config.in"
 	source "package/ulog/Config.in"
 	source "package/zlog/Config.in"
diff --git a/package/opentracing-cpp/Config.in b/package/opentracing-cpp/Config.in
deleted file mode 100644
index ff3067b7d1..0000000000
--- a/package/opentracing-cpp/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_PACKAGE_OPENTRACING_CPP
-	bool "opentracing-cpp"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
-	help
-	  OpenTracing API for C++
-
-	  http://opentracing.io
-
-comment "opentracing-cpp needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-
-comment "opentracing-cpp needs exception_ptr"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/opentracing-cpp/opentracing-cpp.hash b/package/opentracing-cpp/opentracing-cpp.hash
deleted file mode 100644
index 8cfaf5fd47..0000000000
--- a/package/opentracing-cpp/opentracing-cpp.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  5b170042da4d1c4c231df6594da120875429d5231e9baa5179822ee8d1054ac3  opentracing-cpp-1.6.0.tar.gz
-sha256  076d03156735d5ff2df2ea0f8b12351ef65e5e9222b5c8c6a35101dadb41e717  LICENSE
diff --git a/package/opentracing-cpp/opentracing-cpp.mk b/package/opentracing-cpp/opentracing-cpp.mk
deleted file mode 100644
index 12ce40fbed..0000000000
--- a/package/opentracing-cpp/opentracing-cpp.mk
+++ /dev/null
@@ -1,28 +0,0 @@
-################################################################################
-#
-# opentracing-cpp
-#
-################################################################################
-
-OPENTRACING_CPP_VERSION = 1.6.0
-OPENTRACING_CPP_SITE = \
-	$(call github,opentracing,opentracing-cpp,v$(OPENTRACING_CPP_VERSION))
-OPENTRACING_CPP_LICENSE = Apache-2.0
-OPENTRACING_CPP_LICENSE_FILES = LICENSE
-
-OPENTRACING_CPP_INSTALL_STAGING = YES
-
-# BUILD_SHARED_LIBS is handled in pkg-cmake.mk as it is a generic cmake variable
-# although BUILD_STATIC_LIBS=ON is default, make it explicit,
-# cmake and static/shared libs is confusing enough already.
-ifeq ($(BR2_STATIC_LIBS),y)
-OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-OPENTRACING_CPP_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
-endif
-
-OPENTRACING_CPP_CONF_OPTS += -DENABLE_LINTING=OFF
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
