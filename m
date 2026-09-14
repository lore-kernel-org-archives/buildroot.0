Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C22C88E6F
	for <buildroot@archiver.kernel.org>; Mon, 14 Sep 2026 19:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 453406061E;
	Mon, 14 Sep 2026 19:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Fay6GOQpA7W; Mon, 14 Sep 2026 19:21:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 55F9760640
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789413679;
	b=b629iXDEI8lybqvCC0/kccaHNZUxl6yrY9+8qa8hzhfBIW+j5POIGO13pMPHSXuVM9kC
	 +oH53TgxjS3121rNk7MJl1jYRNLecjwu5Y6yZaEB3oQCBU7o1VV5zshZ8fmgZGskTG8iK
	 fobzWL11BxbHar0nQPj/UAZLcO90EV/f6RVaAX7IOWDfmwV/R740vtnPVPBHhiqjiy3dW
	 9UIcJr5HNmaPfkxtmw+GChAPeCJqiZ59r6vliQ+ovhGNIXg2+T9sS5KWjqg5lYNEWPqgf
	 YoW0+EEcPuAJx625nUbYBaYCk9PSoQhKWIKlEkDh9xt1+fJxUQkPEB4TnGV/zVTaptA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789413679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QiBrPNTsdffyDuXKSobYW4ZPgZgv4lzCr18OO63yPi4=;
	b=D4dGfJzXOQP4ieZlKDHzerUpRZTke4wYHUUGnuR74Yz4bQ6/cvMgOklLJB4NhK9LKe3I
	 CvltXK8LE3VpjpD4NYW61YWM5xHioPiIZ9PqxHUV8Q+BpIcYrhEy+Zrsd33JlBDbAuXF1
	 GcWlZha0yVcdgV+JbYS9JkfMebnpWAxVzjqPxosYlnlRUh2MyeeiRzP3i14/qSuAA946W
	 1SZ7HyLTbdQlUm1yG6jMxqDlzdzvmiumfTi0JK80rn153qIOuA+50BihNrfSWTjn/umAe
	 5dA434smN0tXb4HzxSzeC3uBr8p7g4Xk3h4QXc4eyapTM3ooS71cAW6LdSKGEbOj0Pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789413679;
	bh=QiBrPNTsdffyDuXKSobYW4ZPgZgv4lzCr18OO63yPi4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rP9DkOfnBiilUsVhouGg1/9KzKUuES7gn7IhRAAywsZDi7k20w4jSB5pbbR6lgFgo
	 lnP/2QRJkQ0dc0+aITaqmA9axo9SZB5zm5z2bpZ2linjhj8nvpBJNzzlJOzZCrdsnv
	 Ca9aiS6ealo6Rfd3ZTpIrzAnuuqbjqGWhLfZ+eCcnYVk5pHgjyuNh/NUqjh5o6U6DI
	 togW1b1YUQnrD1QsVWcFAFWMuPJEk0r0ygjuQ3srYKNkt83A4Pf2Rw6atJry/bHNKJ
	 UqUiOs3Vi8BVHwCKbB59p1LvUYDCq68ZUokQ0AEOQGA18uJwMzsOXiWO0uclV1xwsl
	 Rpe4yLhA3mzVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F9760640;
	Mon, 14 Sep 2026 19:21:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68B67EB
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5AA9780881
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adjqjEUz1idb for <buildroot@buildroot.org>;
 Mon, 14 Sep 2026 19:21:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 453FF8084C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789413677;
 b=czuu/LsqzBxfEZUMod8oHnFos49iHmSkeCDF+c9+mSlPByEdNCT2STjPskOv/A05cs8c
 +KscHo7hyXbxTig8auBbLNFwWNvTv0n7KHA6a23kJqlyzIJsX9c+pIR2dQVTsCniy3ytT
 6dqrxBW4wj9oEe/zV21RwnExvxphqgWaFU/AYQpRHLpMb0zl7NJXGtMHQmrKKkoSfe3KN
 015rGMPH0yISBwbEx8rI9QnhT+sMwN7O1WKiKjbhnSyCaoGisjwvuPdZ9mXAjWkGX5dWF
 kmk6UEdmaFzxyLhHmI9Hq/giroWSga9NFEWwRnfMf1g600Nvm7uGcyPnNFEPA5kvEHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789413677;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dCsrCiZ8hux+WHEPoytNyYV0PbMR4ty9AsDxR+Hiq90=;
 b=HkZv5XN0pJ6mILo/ukKhF4RuMYM+YeXSpZciVZGjykdqAa3LmFp8qB9cZPXcPMd9+loe
 E/8d2xlkCChtlh76w9Z5Wolj6wjbCzBMtm+Yf6n4FDFXkzTkJCkSiAWZcLWX8o/vzqa9m
 mFleuCzj6I+KO495Lv5i7YpB/LrHVzdMUuScPf7dOpe05s0o9LJB5ccdif7X6jH82vKXO
 sL0DOO5THGQSJjqqrViKZqFSnEzQSKNm7C90z8G4JAIjZ2UNiXguNYtBITtRSZqJhuya6
 mVmIZressK7qMfTQZ8Hgsb2rQhhJgX805Idqxdea/hKb4TJTMsl4kNMBa6hRxL7U1ZQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=YQTZi5Tq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=YQTZi5Tq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 453FF8084C
 for <buildroot@buildroot.org>; Mon, 14 Sep 2026 19:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789413646;
 bh=dCsrCiZ8hux+WHEPoytNyYV0PbMR4ty9AsDxR+Hiq90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YQTZi5Tq4CVBRs94jQDAPxJL5pc4fmj2QcZoALq5RTT5MSutX56GxnjQQc+HOVf2P
 9roVmzX+guB0OABc435AKtiLXht7P6Bc+KPICHWwCM6y2EiuQjzSBYaJp50BjjoZis
 X8rzhlRqA7sQlRiwSHffQRpHfmuOUxmlwCr1W1Y5I5nKbYLwH7zWJYWib1A33901l4
 NGOyaKJklw7CBv1wtjrtKoTBcvh9WBCNCeNKLVHiR3u7g5hby4wrq4kgJv0+k7xHZl
 5mNlcvdBTdWfoUBM26mH5frghKbTmPz79uIUeZtMNaA5LacMeko6+L3oQVL95AIFaN
 CMh8W6MDA2Dng==
Received: from fli4l.lan.fli4l (p54a1b732.dip0.t-ipconnect.de [84.161.183.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D29BEA4C424A;
 Mon, 14 Sep 2026 21:20:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49450)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x6CEQ-000000004QB-31iw;
 Mon, 14 Sep 2026 19:20:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 14 Sep 2026 21:20:40 +0200
Message-ID: <20260914192045.1648017-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914192045.1648017-1-bernd@kuhls.net>
References: <20260914192045.1648017-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 3/7] package/jwt-cpp: new package
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

Needed for domoticz >= 2025.1:
https://github.com/domoticz/domoticz/commit/b30d9e9436ad428a2cbfd1fbb273461bdbf50a82

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed for this patch:
https://gitlab.com/bkuhls/buildroot/-/commits/d1721738f6b10ea02053da6f6f6eb3dc05a2364c

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/jwt-cpp/Config.in    | 12 ++++++++++++
 package/jwt-cpp/jwt-cpp.hash |  4 ++++
 package/jwt-cpp/jwt-cpp.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/jwt-cpp/Config.in
 create mode 100644 package/jwt-cpp/jwt-cpp.hash
 create mode 100644 package/jwt-cpp/jwt-cpp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 97eb2d9cac..faec7489e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -408,6 +408,7 @@ F:	package/intel-mediasdk/
 F:	package/intel-microcode/
 F:	package/intel-vpl-gpu-rt/
 F:	package/jsoncpp/
+F:	package/jwt-cpp/
 F:	package/kodi*
 F:	package/lame/
 F:	package/lcms2/
diff --git a/package/Config.in b/package/Config.in
index aa94d44eca..262d7c4f57 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1908,6 +1908,7 @@ menu "JSON/XML"
 	source "package/json-for-modern-cpp/Config.in"
 	source "package/json-glib/Config.in"
 	source "package/jsoncpp/Config.in"
+	source "package/jwt-cpp/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
 	source "package/libroxml/Config.in"
diff --git a/package/jwt-cpp/Config.in b/package/jwt-cpp/Config.in
new file mode 100644
index 0000000000..3feadfe3ec
--- /dev/null
+++ b/package/jwt-cpp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_JWT_CPP
+	bool "jwt-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_OPENSSL
+	help
+	  A header only library for creating and validating json web
+	  tokens in c++
+
+	  https://thalhammer.github.io/jwt-cpp/
+
+comment "jwt-cpp needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/jwt-cpp/jwt-cpp.hash b/package/jwt-cpp/jwt-cpp.hash
new file mode 100644
index 0000000000..38df18ced7
--- /dev/null
+++ b/package/jwt-cpp/jwt-cpp.hash
@@ -0,0 +1,4 @@
+# From https://github.com/Thalhammer/jwt-cpp/releases/tag/v0.7.2
+sha256  7c1b4f767bdd14f727f6114d9e35b761f10d00d6a27ef7650ee8c628f08df27c  jwt-cpp-v0.7.2.tar.gz
+# Locally calculated
+sha256  35c2d7d6824a1e1ed2b266ec334b7862726ae593855c3cfa68b952bb75f082c4  LICENSE
diff --git a/package/jwt-cpp/jwt-cpp.mk b/package/jwt-cpp/jwt-cpp.mk
new file mode 100644
index 0000000000..27e7d23691
--- /dev/null
+++ b/package/jwt-cpp/jwt-cpp.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# jwt-cpp
+#
+################################################################################
+
+JWT_CPP_VERSION = 0.7.2
+JWT_CPP_SITE = https://github.com/Thalhammer/jwt-cpp/releases/download/v$(JWT_CPP_VERSION)
+JWT_CPP_SOURCE = jwt-cpp-v$(JWT_CPP_VERSION).tar.gz
+JWT_CPP_LICENSE = MIT
+JWT_CPP_LICENSE_FILES = LICENSE
+JWT_CPP_INSTALL_STAGING = YES
+JWT_CPP_DEPENDENCIES = openssl
+JWT_CPP_CONF_OPTS = \
+	-DJWT_BUILD_EXAMPLES=OFF \
+	-DJWT_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
