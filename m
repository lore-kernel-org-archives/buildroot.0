Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B63D7879F
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 17:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493FB612EE;
	Fri, 19 Dec 2025 17:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yemidDPEwDje; Fri, 19 Dec 2025 17:54:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48162612BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766166868;
	bh=D349z0FMsoVmDWIMQzjOP7YxUGBWaP81m+EYyyfV44s=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4PtE3DEjL8Ua3AqqsyM1uX9KvebrD6YjJ5MzfgZlwArfhcY15zsdcRkX0goiN/c2
	 kJxUkXmuxWNKySNyz0O5jA2wvihPJKhQuvOP4z8RV975Wk5pFUYFKlm+JmJLi06jzH
	 y1/A/y2ToxtR+2SjrB/7pXBnYH51ETz2CHirBqs9SugjPzRpVkumHFGFWdz3gBZ9vX
	 UwmcEe69JL6QF+DUOhKQSwqgeUuQi+5djZlCPguKrc/JOb1EIFZm1gxNgu7OV9okcF
	 /vkGphmEW4Nd+rsKFdGl/cJ+Jp/uY1JHNT8TftiozvqwjKshn9WzL8WdX+y/BwdQkC
	 o99dYqQj5PAsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48162612BB;
	Fri, 19 Dec 2025 17:54:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E98C6119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB5C5419F6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:54:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpZ88RtxkBP1 for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 17:54:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58CC64010A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58CC64010A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58CC64010A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:54:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 339F2A4C4B46;
 Fri, 19 Dec 2025 18:52:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWedq-000000002KQ-1FlN;
 Fri, 19 Dec 2025 17:51:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>, Simon Dawson <spdawson@gmail.com>,
 Jan Heylen <jan.heylen@nokia.com>
Date: Fri, 19 Dec 2025 18:51:31 +0100
Message-ID: <20251219175141.1907408-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219175141.1907408-1-bernd@kuhls.net>
References: <20251219175141.1907408-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766166722;
 bh=PK2/xCHrZketBW1JNEov13dRyCwz0YKt3SGrqLvTPIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=mx30t1LDPk842aUFTO5a9BFQEp36NYJWJ8N6A8her7ZgEZz6sUqIOJq/lICLRF8ag
 FxJaPNOfbbmCIXecSfHEk5fCWQkBtzeQwtEqEpjuHE/rsr04rcyTXPtZOQPDnj0Sjo
 QWW8ma/ZIIYU2h3s+hVfZgGxBTp1n/LT7EFpr6afjjp4VRoqguJ8jyL+xDETG0yCTI
 PPUwkkHneSOse/pd4iLmfxLoVLNqOWtl/su/0rTuT8yvd4W6vCJkue8SOuAWeG1PmH
 ewZlronI3JnXzbLzbDroLbbtV/ql8FxPXRars6hLB71JDDsQmcGL6ak3FAk3Te1cwx
 nTbNQ6K5sCO1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mx30t1LD
Subject: [Buildroot] [PATCH v4 12/20] package/opentracing-cpp: remove package
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
index 02132484f2..1e54930405 100644
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
