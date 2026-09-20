Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D1BC982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62C2440659;
	Sun, 20 Sep 2026 12:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLa8Vw4woOaW; Sun, 20 Sep 2026 12:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6ADFC4065F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789908030;
	b=NR29rrzXgPKCoPJsDMoph3G1CTJT3GPyoVlpyKEN5UAK/51VbwXoW5svVKCNNYUN5v0C
	 Ct8E2Y0whSRkKjUt06t9n6yQws0Q/F6wLn2vBKu55xzWlYIWvdGDEvAAx5EW6+1DAghVz
	 OjBdK+JXX3Cp8qONAa9U9LqM98rILMsSd/+O/1H35EqeWoSB5CvIIXpUivE2WDNlebfQQ
	 lqhJO4rGgOEJAa+A73Pb/T16xiT0dcKFipPJae5/fbwE3vSSgvQH1X8bpRqQYQwNTGvl1
	 ygfshRl3upWw9PCnFZREaAi8AP2A3K8uC96wgRQoVpDRllbsn9Po3FcQX7GznaBKCsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789908030;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JkogHApyPc51nW6Td+hZjM63fSFZiNysFMQlKijB1/0=;
	b=N7ibU0WhVBRP23ULFVaIIC30BDcMlLaKF5tfm0ZrFBJhWonWlhGROREW1c/JVwspb1xu
	 e29EK/4A/88dM8urgSp/QxJ1oy3R/a02ADQ1BOX+R0DP8qmhm2EjxVInGeN1uDGD8nEZz
	 ci7HEAsu3M0JIOPmesGeGa/TKS6tbp7t13NG+2nuQweIhAdNfMUSiZ7+P5kru46CtEWMF
	 UTbbh4GZLwOcSVUJazbTr8UUFamaYaK9Wb26BO/r/2g9lJq/xRNP8mZSBIjUugXxIBgl2
	 TZldl0tPyyUufQrMTBAMEzZ9vQJ2iDDbnl0HFusxUAIJbZ/QFgkO9TVuOGDzizaHhJQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789908030;
	bh=JkogHApyPc51nW6Td+hZjM63fSFZiNysFMQlKijB1/0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kMeuW6gYPjcdhLZPWEJVVvBPoDlLrUl+gKid3tLtf4auVRT/wPtMQ1qH1ZyJsW/rf
	 sBGR5AGXmvUqSrYr2ejJRAmn88jmwPAWJnQg+RZ0v1qSMePyYSCG/bT6Eh7rdNU/vB
	 z0q0xW/fUDVCmthDMjqU4PgpdOeOpABnq67B+B5Cy27k7stHIxOt+VHYny0iNbk78e
	 kcVm8hniJbFRFJUP14EMntydR6gFZI2pDKWZO1OIgWYo5yFaWVG3sSRT46QZ+YCtE3
	 SWKAujX8ab3Wah4hv8TcwytmFpGHXdTOLRBqTFHW0mA3Vz4ygoSeTEBpCI2bc/8G0q
	 TUB9KdzPcyoww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ADFC4065F;
	Sun, 20 Sep 2026 12:40:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20B3C371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 121E080F09
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGR0doJEsBZl for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:40:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 39DFD80F04
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789908027;
 b=Qp/iJOVdlbrtZPoveMlJMjF9SBhpzR2h97S3LTNWC6ZNfkdf8lD3KSkfZjKl6vsxdCls
 pidqzBSI8+SZgBHtijfCz5ifKpZTsIxQhfEW4xXsUoMp4A7r3zqJ9ZDcrggErvhnu8KRx
 82Ne4TqmbIDRSwJVqiBYAHMjll/GY+vs2QRhocvGx6aLNE+ksNU/iSUbEizjOwTB8Nm1k
 aOm4Dgti+WLjzNpVxnpsMz9NBHYZIJcWY5u1XRHabKkO+M2qF0swYEmNSm4KEIdFfAnAm
 QOSgMOoFDcHfkut/+TskLBETIIjcyxn1kJCaFYVVsZPa9BUTDleOoA4y9EEY96s1Nsw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789908027;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2rH3zfhNwRdGvBWLG6L8BqYHGyjasladIyCn5vLSoHs=;
 b=IHSSdbAhaJBadtyKsOZ1b4kAeODDuh7JhKtZAWtVH53l9nDC7DDlO9N9U4dQzqF85e2Y
 hiitVQtBWo2R5TkfHZsLj2/JgTWn+qmEYGqhDr7nU7IvBSLsh1M5LvuV/VMN89djjrfEP
 5KU8av4gXeCwWy5JL6dc5DU+jkQ4sWFfYbSocHNcylzjD60CUHnLHcgXcUUX6JHSnzq9b
 LtP9pRYsegmO0l8hqdFLIN44AgE69nYPDcP8GLx54+IRagWCf0ma9MRhAGdsvjL94rIer
 JLw6BBykdyDpsLpfKziprRZsNnnFP2U07x5e31zMv2NcEO1S/nHM+XpzIhCLHY7IffQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39DFD80F04
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:40:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB0A28CA36; Sun, 20 Sep 2026 12:39:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:40:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32bf91daa724ca2fa2c54bec80e110d0f7305b24
X-Git-Newrev: 52f813d51c68683f1016f215698561f7dcb3bdea
X-Patchwork-Hint: ignore
Message-Id: <20260920123918.CB0A28CA36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcpprestsdk: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/52f813d51c68683f1016f215698561f7dcb3bdea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Quote from Github site https://github.com/microsoft/cpprestsdk
"This repository was archived by the owner on Jun 1, 2026. It is now
 read-only."

Building the package with boost >= 1.89 and OpenSSL >= 4.x is broken.
To not block these version bumps we remove this package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                         |  6 ++++
 package/Config.in                        |  1 -
 package/libcpprestsdk/Config.in          | 34 --------------------
 package/libcpprestsdk/libcpprestsdk.hash |  3 --
 package/libcpprestsdk/libcpprestsdk.mk   | 55 --------------------------------
 5 files changed, 6 insertions(+), 93 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index ee4d978efe..bb6257f532 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_LIBCPPRESTSDK
+	bool "libcpprestsdk has been removed"
+	select BR2_LEGACY
+	help
+	  libcpprestsdk is unmaintained and has been removed
+
 config BR2_PACKAGE_HEIRLOOM_MAILX
 	bool "heirloom-mailx has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 1772f803fd..1e4b095883 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2020,7 +2020,6 @@ menu "Networking"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
 	source "package/libcppconnman/Config.in"
-	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
 	source "package/libeXosip2/Config.in"
diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
deleted file mode 100644
index 7688021ed0..0000000000
--- a/package/libcpprestsdk/Config.in
+++ /dev/null
@@ -1,34 +0,0 @@
-config BR2_PACKAGE_LIBCPPRESTSDK
-	bool "libcpprestsdk"
-	depends on BR2_ENABLE_LOCALE
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # boost
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-atomic, boost-filesystem
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_ATOMIC
-	select BR2_PACKAGE_BOOST_CHRONO
-	select BR2_PACKAGE_BOOST_DATE_TIME
-	select BR2_PACKAGE_BOOST_FILESYSTEM
-	select BR2_PACKAGE_BOOST_RANDOM
-	select BR2_PACKAGE_BOOST_REGEX
-	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
-	select BR2_PACKAGE_OPENSSL
-	help
-	  The C++ REST SDK is a Microsoft project for cloud-based
-	  client-server communication in native code using a modern
-	  asynchronous C++ API design. This project aims to help C++
-	  developers connect to and interact with services.
-
-	  https://github.com/Microsoft/cpprestsdk
-
-comment "libcpprestsdk needs a toolchain w/ NPTL, C++, wchar, locale"
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
-
-comment "libcpprestsdk needs exception_ptr"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
deleted file mode 100644
index 8e398d0c54..0000000000
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  6bd74a637ff182144b6a4271227ea8b6b3ea92389f88b25b215e6f94fd4d41cb  libcpprestsdk-2.10.18.tar.gz
-sha256  5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97  license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
deleted file mode 100644
index 68d4cf68c1..0000000000
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ /dev/null
@@ -1,55 +0,0 @@
-################################################################################
-#
-# libcpprestsdk
-#
-################################################################################
-
-LIBCPPRESTSDK_VERSION = 2.10.18
-LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
-LIBCPPRESTSDK_LICENSE = MIT
-LIBCPPRESTSDK_LICENSE_FILES = license.txt
-LIBCPPRESTSDK_SUBDIR = Release
-LIBCPPRESTSDK_INSTALL_STAGING = YES
-LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl
-LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DBUILD_SAMPLES=OFF
-
-ifeq ($(BR2_STATIC_LIBS),y)
-LIBCPPRESTSDK_CONF_OPTS += \
-	-DBoost_USE_STATIC_LIBS=ON \
-	-DBoost_USE_STATIC_RUNTIME=ON
-endif
-
-LIBCPPRESTSDK_CXXFLAGS = $(TARGET_CXXFLAGS)
-
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
-LIBCPPRESTSDK_CXXFLAGS += -latomic
-endif
-
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-LIBCPPRESTSDK_DEPENDENCIES += zlib
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_COMPRESSION=OFF
-# brotli needs compression
-ifeq ($(BR2_PACKAGE_BROTLI),y)
-LIBCPPRESTSDK_DEPENDENCIES += brotli
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=OFF
-else
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_BROTLI=ON
-endif
-else
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_COMPRESSION=ON
-endif
-
-ifeq ($(BR2_PACKAGE_WEBSOCKETPP),y)
-LIBCPPRESTSDK_DEPENDENCIES += websocketpp
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=OFF
-else
-LIBCPPRESTSDK_CONF_OPTS += -DCPPREST_EXCLUDE_WEBSOCKETS=ON
-endif
-
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-LIBCPPRESTSDK_CXXFLAGS += -O0
-endif
-
-LIBCPPRESTSDK_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBCPPRESTSDK_CXXFLAGS)"
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
