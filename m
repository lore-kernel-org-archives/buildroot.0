Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CABD5B154
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C79A4089C;
	Sat, 13 Dec 2025 14:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50hUMaX48XXN; Sat, 13 Dec 2025 14:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB58940901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765636360;
	bh=OP6TuhZ0+jKTZOBTKzjZZIwn5qD66IUh1ydqunntCrI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cW/pZ38quWHMh6bm3slsPBRbaspQVRrRANbgjEtXGyeK435cSi4+8oWZHiDpHqJvd
	 vH3wnVVZhvvCyOFc3LxbmUF/0ohrAglwgKrnFmT5DRSotRUVNeYl3+ZVAqat2iZXOz
	 Ds3StsM//amfExoZjyLpkNgCxM24chvpcBJz/5nZLNz+CVXJ/jmmcNdZkfpGcX5+21
	 vclCZmeEiqs/wwOZ3uT6zMf4NE6W4lwRTCaWqsYU9q+0qXlYSyKBVuUBek0vTRJ5po
	 +BfZilmmykUJx6sVMRH++eZxN5JRrEdYklZEwjdGnu1AI01bqfHmxN3D8mvAJsYTFb
	 0j9xF/k7EYwqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB58940901;
	Sat, 13 Dec 2025 14:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A002DE7
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 843D760B3F
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nfMMR8behhbm for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BF8C60A4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BF8C60A4D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BF8C60A4D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:32:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DDCD6A4C4087
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:30:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56096)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQdO-000000000dj-3HMF
 for buildroot@buildroot.org; Sat, 13 Dec 2025 14:30:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:30:03 +0100
Message-ID: <20251213143008.1329736-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213143008.1329736-1-bernd@kuhls.net>
References: <20251213143008.1329736-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765636216;
 bh=lg+Gs2jjRgGpwhYQViiteCYmezUdHqGfi1nRpYNetnc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dR5g4CoRiNf6d2+Hg+APNFoUbKRQU5Bz8o40U2RiQwlj4MzI7T80hhVc8WsHbqqCp
 O8nPofrtfK6+Hjiiw6lGuL1/x/zUsj4WU6TwUmx/hdBxbPyJyb5Zu8wzEdca2zfZKh
 hpbbFfr+Ze+lvUjIxDMWVSzsJ//DdLYE8J+8RVWIFdofnXpCc2NQVcuLNunXEke6In
 uKhzc8neCF1k9x3Iqim4VETSxhcDcCj/WYX8KWIiI9OcGnGV3HcfDBnh9hVA3D4U/9
 4lHn75kgiQ4f6akp6OgztJpqz1zsdvw2Q7MnWGyTxMGc43JalHTn8xY5FZ7H4Jl80j
 KI9c4ctPSpaXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=dR5g4CoR
Subject: [Buildroot] [PATCH 12/16] package/opentracing-cpp: remove package
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
index bc3b34a145..c436b9a1c0 100644
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
index 08bd29ed89..a3185c1ae0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1554,9 +1554,6 @@ N:	Jan Havran <havran.jan@email.cz>
 F:	board/pine64/pinecube/
 F:	configs/pine64_pinecube_defconfig
 
-N:	Jan Heylen <jan.heylen@nokia.com>
-F:	package/opentracing-cpp/
-
 N:	Jan Kraval <jan.kraval@gmail.com>
 F:	board/orangepi/orangepi-lite
 F:	configs/orangepi_lite_defconfig
diff --git a/package/Config.in b/package/Config.in
index 247b5181ad..7a55f052d1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1952,7 +1952,6 @@ menu "Logging"
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
