Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC79D66B85
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 19:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FD0A610F9;
	Wed, 17 Dec 2025 19:26:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfPwO1qjfOKg; Wed, 17 Dec 2025 19:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28B0360B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765999565;
	bh=efg552cwvOLUWcjnFRhESDf+rOM0uWW2KnMJqgeUiOg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CIdySuM6S8q4daQwFMRoHAYuDvAQIhtZGKr2tqiR3R4Qyip6ZNU3OnDlJxOnVld++
	 qF+qA5s8+aohDP8Tpx0wjfWC74zo7yEsJcZVb5lTnyBswylSDKjmfRozXdCyKTkL1x
	 SuU9zHm8HXq5q8TvLvKjuOgIVWlYljU5Tiawi0MgC10aLCfM4b3yEUlwlJojJpljuo
	 Ys4BiVXCoYvyqh/6QNmgFkS20PWKerdXxaYZ9h9SWzNIX+GegrEwd2X3koYOWRz5Hf
	 KYUpdv/EuSIxMnEh1uQ2PLc48NE0yyrL9QU8b4QKB6R2p9RQe/Uvy7Ka1CKsqGGs+P
	 fx/htFgJ/PuJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B0360B89;
	Wed, 17 Dec 2025 19:26:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B82E361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D83880956
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfTgtkQedo_b for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 19:26:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3415B808FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3415B808FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3415B808FC
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:26:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F20DBA4C4745;
 Wed, 17 Dec 2025 20:23:32 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51964)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVx7U-000000000pX-15xg;
 Wed, 17 Dec 2025 19:23:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Gilles Talis <gilles.talis@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Jan Heylen <jan.heylen@nokia.com>,
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Ben Boeckel <mathstuf@gmail.com>
Date: Wed, 17 Dec 2025 20:23:23 +0100
Message-ID: <20251217192330.3769476-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251217192330.3769476-1-bernd@kuhls.net>
References: <20251217192330.3769476-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765999412;
 bh=WcBCDanZ6zLI3uPd+HLhMBHhPxbm3TKuoJY0/Q86Mik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BZasYdHK4MJCVJs2Z3CuEpsKXEaOj1Q/vJRd5LesSxKh4mNP7d/Ly/ntj2DgW97vT
 vwzd3y5hoI953X0UV8h6B3CfDJfOG2Ju2RWLaYJ7XhQtWLbfMw0C579E8lbejIUVMe
 hAFVjchEY7t4A6WpadzIi45XEG8mwCZFzvO0nQMdfG7CBx6iYXac3FYZ6QU6O4WHYr
 +ETLvumUFxRgoVN0pM4aGpoYDinEFr+6LJVxnakcObquplC5i4iuMseq7rp4A4aPiD
 QB+LWYX8gCGBRIjyN4tx7tu+pRz7iwcaVTXy0vXTWygUOCxzAFJAyHUaKlbAADotCh
 F/NxdfLkpADig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BZasYdHK
Subject: [Buildroot] [PATCH v3 12/18] package/opentracing-cpp: remove package
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
index bdaffaae75..a402f1c121 100644
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
index 9420bd4336..93ff7cea4c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1553,9 +1553,6 @@ N:	Jan Havran <havran.jan@email.cz>
 F:	board/pine64/pinecube/
 F:	configs/pine64_pinecube_defconfig
 
-N:	Jan Heylen <jan.heylen@nokia.com>
-F:	package/opentracing-cpp/
-
 N:	Jan Kraval <jan.kraval@gmail.com>
 F:	board/orangepi/orangepi-lite
 F:	configs/orangepi_lite_defconfig
diff --git a/package/Config.in b/package/Config.in
index e51a23abf3..4eaa6894e5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1951,7 +1951,6 @@ menu "Logging"
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
