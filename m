Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6E2C88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 512CF4047C;
	Mon, 14 Sep 2026 19:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnmTbujKoJ3o; Mon, 14 Sep 2026 19:20:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A87484041A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789413655;
	b=naQU3GtU6p1UlWhzSobcfNPQQelbHXFpCHq6X6/JkQxmGjHDYoIC768RUlLh/RpWDVU7
	 9B81APfA4FOoFy4788sxkul5tEW+ElFrX+J0/ieLCVcdVwaOd5zQZYQW1ihiJpNvrKv7G
	 WFQpvHwSES0NDKqxL/RqB1VkkInEQLWFlA80/d6Vf4uySHLoKKqAKRtuKBTPG7O1fWyQt
	 Emx8VFcJVQYx4CmMhP6N1zh6duAZ39psiCEA5CtYrnBrbyUG0SaGAwXJrxYVBdd8OGjgE
	 GmKNwFr1+B42w9Vezx1Pplgxpuz4kaRpzAcdAiDOfWqVNwgFiJp7Ip/kJ+aduD63uEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789413655;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=HIPh0a1sCcfpL6yr5ltL1/ptEYq/Y+RxPF5WQ5hW698=;
	b=WuMPZlrJ1Y+d3+BWPCYzY++AX0TcsvMb9Gj996caEGNd66O06+Y/zTR2tw7pV0aBDnHa
	 MM3xGMbjdUx/9juNWVooVxHjIu3XEi2UcuRaKoPfs7WOzeRIVnSqbgW8V5DdtzgWJYPOx
	 dk4x6giKdzRWPxKieWwpYNEXA9mi0Bu36r+1Ncw5ARBoQBM7DeVEfMi74Ha2MkZu8KAoL
	 yQuVEvBr1DXsaFTgdP7jcIoGgZMvQiJjbk/95Dli2VJy1NqOrI7cg6GqFJPrBPUAz6AhL
	 RlF3gnPjl/YPoUUFOe6oTJY7OpRePaJBgk7sq9QDdXF0Du8pnmWDDBM0njb2U+gV50Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789413655;
	bh=HIPh0a1sCcfpL6yr5ltL1/ptEYq/Y+RxPF5WQ5hW698=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=L0AISlgYgBW+nBwYmGfdG5Mr8D20gl+0bjChAFZBTlYsw7tPeu6gh06ktfLAzybHR
	 zexyPZ447iGl/aE1kKOBvfFgxtRhXr1Ccv5Biwrq+Uh31pm6yLpk7p25lRH1ho4THe
	 NYktPtBZ70ltlwFSKQgbOxbzlWrguXShhKALUEkxNeq7+0/Uap8BVyxX6a//Ef/4MN
	 lty9Eu4/syJ4jBDMm+KtXNUe3Q/v/REJqVSlEppdSx1YmI2R3L88BeBb3SillOPEul
	 hH5WwQWVlehnKWtsjgxzhIG8J3OeMSm4FWtUTeUBPgYOA1DEVwB8pDcnsKXYTHeWUd
	 oZ/jjUcC8AIgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A87484041A;
	Mon, 14 Sep 2026 19:20:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FDE1EB
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C3EC80881
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 25fgPRjT6T1N for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:20:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B67CE8084C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789413652;
 b=Ij/mkDang0ZZNpDq7et1gycWKJ4oa/K+kXqOW1HLSos/1RhxtXXYIGFcE0N9huIDLhmF
 yn3B2ZvNwHVe+hcRjlbep2Xrciac8yIm8SSpnTVqBVyZWAllZzarBq7BtrVaovy4dC2QI
 qU7WGd0aokJjia/YEFkFK9aUrug61EhkBsdRfkAt0DfTKinZpbjnPs7cA72aFcAKuuHbR
 cbbC4F34GjsmAtK9/IQs/h2EQB58gTz+FXU4GqqVFAjL6e50tyftawIv/pZKXcQiGCYWh
 FUQ5z9WJ+HYaM3u5wwyqzdXWmsmnZYYCDUWeBB+K8mTn82axiM2ZSMQFf7c6OIBKvJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789413652;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=B6wHrAVy7tf3r8RR8WiqRaeZtokdsd5yu6M7AyBe35A=;
 b=l7GPcIcZZLszNGAxXKpBtZ2B4nL4u98FsvBRm2/GkX2uI8ztqRmIf4njbehLa2zXWuAz
 7L5yH25b3ASt8rf7LaDhJjm+3cSc8sP23GACH4Oi6TqL+E7UVoKy5fhnyCHSdpKQD7DB0
 4L0SJmw1LZe5IFf5KnSntMKHkq5m/N/IeGlBcKkZgvsOD7nqRT9ByyQwO/8VbGm3n7z7n
 /tvYziDda3Cckt7jjTkODfWOe/fJHATkNDm3FXacJASiYF8AUioM6YXahuwXbzd6fpAf/
 mgTl/KXof4QUOFf0/nF/CjcX3IaOLsWsHE2PGzcJmaHVF6QTwJoDsYXZnC68yW+/kuQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SfepViGf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SfepViGf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B67CE8084C
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789413646;
 bh=B6wHrAVy7tf3r8RR8WiqRaeZtokdsd5yu6M7AyBe35A=;
 h=From:To:Cc:Subject:Date:From;
 b=SfepViGfpFwjyu1xo/UrCnVyGvDnmZvN3QbjXOLWMcPVMKf/39FXGd1+ioE9uoUxF
 3/SnvBZujZDwzd9nTKsQi74VaxMgWgPQi69BBgrza9aKp7OKCnzKr0xyNVvzn1ahEB
 qgISBMQkdmMrxBsAdFIXAfenpP/ElzE1tHx15nl+t6/mJ3vFSvNUt2+ylKKGFnJvGs
 b2MZ7GVm5dbWX7BywjcvygP5BzkGRpDps+OPjB+ylGCb7Kj4OcJwshjovzrEsE8ERD
 RcwL8AuJ4GSGEYU9z1NC0KV9M07TBf6TtdCeXWzqpyNKTkf6u1XL2/O22WZAfMZvRH
 I7xkjOEZtKE1w==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36D2BA4C0F97;
 Mon, 14 Sep 2026 21:20:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49450)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6CEP-000000004QB-42a3;
 Mon, 14 Sep 2026 19:20:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 21:20:38 +0200
Message-ID: <20260914192045.1648017-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/7] package/libcpprestsdk: remove package
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
Cc: Marcin Bis <marcin@bis.org.pl>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Quote from Github site https://github.com/microsoft/cpprestsdk
"This repository was archived by the owner on Jun 1, 2026. It is now
 read-only."

Building the package with boost >= 1.89 and OpenSSL >= 4.x is broken.
To not block these version bumps we remove this package.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                         |  6 +++
 package/Config.in                        |  1 -
 package/libcpprestsdk/Config.in          | 34 ---------------
 package/libcpprestsdk/libcpprestsdk.hash |  3 --
 package/libcpprestsdk/libcpprestsdk.mk   | 55 ------------------------
 5 files changed, 6 insertions(+), 93 deletions(-)
 delete mode 100644 package/libcpprestsdk/Config.in
 delete mode 100644 package/libcpprestsdk/libcpprestsdk.hash
 delete mode 100644 package/libcpprestsdk/libcpprestsdk.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 6c222c0e57..4f5c91c0ec 100644
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
 config BR2_BINUTILS_VERSION_2_44_X
 	bool "binutils 2.44 has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 243b390d1c..aa94d44eca 100644
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
