Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A0CC55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 13:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 597B660B62;
	Sat,  1 Aug 2026 13:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2O0KzFtAN3Ov; Sat,  1 Aug 2026 13:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F917606DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785592717;
	bh=YVqoFg/1MyOlJKMKT21Fn+NjbHZHioPAsDyPb5fES8o=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sjC269JUsJc5BMTw1xjCbj/H44sLJScdqgL1hJpa3eD9QlVHi/sHDTajfdY1aPkQu
	 7WcSWqCTSCQyUw57HsG2RZ9pZWB8FComhLHR0X/Kju1omlBYq80hRf0P/CY/xqFmWX
	 KtzN0eYnm2gtJGXz21MtR70KNCzyhIl78M0KM+cpXe1te8jGr7diz2gjTdsOBE9Qx8
	 70kMubpBdzfC0SF75+m9QFHGhD+c34mIF8/ZGFTUEqz05bmajg+hv871Oe2nkCpFX1
	 L//wterP86h3wpj5UV4Jw04cpwUudULmJfi9ryrtRt0YxcCVkDZuXMV4qKj++evGVX
	 byb7xL+6XCXGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F917606DC;
	Sat,  1 Aug 2026 13:58:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F35B23F
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 13:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7188B80DEA
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 13:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bujZFjQjiLHg for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 13:58:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=155.212.184.193;
 helo=mail.rulkc.org; envelope-from=viper@landau.one; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7A09080DE9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A09080DE9
Received: from mail.rulkc.org (mail.rulkc.org [155.212.184.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A09080DE9
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 13:58:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 398B8101060; Sat,  1 Aug 2026 16:58:22 +0300 (MSK)
From: viper@landau.one
To: buildroot@buildroot.org
Cc: Hi.,
	Konstantin Menyaev <viper@landau.one>
Date: Sat,  1 Aug 2026 16:57:26 +0300
Message-ID: <20260801135759.1374323-1-viper@landau.one>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <720f85aa2477fe660f66a45354973035@free.fr>
References: <720f85aa2477fe660f66a45354973035@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landau.one; s=dkim; 
 t=1785592705; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=/e9q/rQISLvwRjROXHyBFc99/p5Tw/kD2r7t35jT4wo=;
 b=byKivYM70U0XBYTYJ0X4KToPGY0z+vRDBHuCXglJVTohtVRHJ7E7sgI+/WMYYiGci7NVXN
 AG5kHUBLDyD12/TrIKOCRHPZ0t5XweI7dpkZMD54w0ivPA6AB7yG5a0rHcKACf47cT1VcB
 trhqkeAF79ah+v9HwSR/3IleLFal8nZQNydJOPjzb6K9wH9A8tBgxTynl/V3J1BqPj4Nxe
 hDOMNsrCIr9YaqTXFgUfWahLI1Irbr92JoALnSMjWfnwofi+dgooslbrf5teGc1gezyWmz
 aPr3WeqQA+5Qp2hP9R7DFxMamEaNbhFzZeQl8JKhIPaYMvnrQo3fMOeVtOHLMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=landau.one
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=landau.one header.i=@landau.one header.a=rsa-sha256
 header.s=dkim header.b=byKivYM7
Subject: [Buildroot] Thanks for remarks, done.
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

From 301e2cfaa1ff0fa5b80bd17273507525f087b7cb Mon Sep 17 00:00:00 2001
From: Konstantin Menyaev <viper@landau.one>
Date: Tue, 16 Jun 2026 09:54:47 +0300
Subject: [PATCH v2 1/1] package/cpp-argparse: new package

A Modern C++ header-only library
for parsing command-line arguments.

https: //github.com/p-ranav/argparse

Signed-off-by: Konstantin Menyaev <viper@landau.one>
---
 package/Config.in                      |  1 +
 package/cpp-argparse/Config.in         | 12 ++++++++++++
 package/cpp-argparse/cpp-argparse.hash |  3 +++
 package/cpp-argparse/cpp-argparse.mk   | 16 ++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/cpp-argparse/Config.in
 create mode 100644 package/cpp-argparse/cpp-argparse.hash
 create mode 100644 package/cpp-argparse/cpp-argparse.mk

diff --git a/package/Config.in b/package/Config.in
index fc1e57d30d..cdf996fe24 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -170,6 +170,7 @@ menu "Development tools"
 	source "package/bustle/Config.in"
 	source "package/check/Config.in"
 	source "package/cmake/Config.in"
+	source "package/cpp-argparse/Config.in"
 	source "package/cppunit/Config.in"
 	source "package/cukinia/Config.in"
 	source "package/cunit/Config.in"
diff --git a/package/cpp-argparse/Config.in b/package/cpp-argparse/Config.in
new file mode 100644
index 0000000000..afb0e224c1
--- /dev/null
+++ b/package/cpp-argparse/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CPP_ARGPARSE
+	bool "cpp-argparse"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
+	help
+	  Argument Parser for Modern C++. A header-only library
+	  for parsing command-line arguments.
+
+	  https://github.com/p-ranav/argparse
+
+comment "cpp-argparse needs a toolchain w/ C++, GCC >= 8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/cpp-argparse/cpp-argparse.hash b/package/cpp-argparse/cpp-argparse.hash
new file mode 100644
index 0000000000..3a46ded059
--- /dev/null
+++ b/package/cpp-argparse/cpp-argparse.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  9dcb3d8ce0a41b2a48ac8baa54b51a9f1b6a2c52dd374e28cc713bab0568ec98  cpp-argparse-3.2.tar.gz
+sha256  a3a9e0dc669644b703773777503f73abff8dffacc4e697d8535be930766fa771  LICENSE
diff --git a/package/cpp-argparse/cpp-argparse.mk b/package/cpp-argparse/cpp-argparse.mk
new file mode 100644
index 0000000000..53b1cd241b
--- /dev/null
+++ b/package/cpp-argparse/cpp-argparse.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# cpp-argparse
+#
+################################################################################
+
+CPP_ARGPARSE_VERSION = 3.2
+CPP_ARGPARSE_SITE = $(call github,p-ranav,argparse,v$(CPP_ARGPARSE_VERSION))
+CPP_ARGPARSE_LICENSE = MIT
+CPP_ARGPARSE_LICENSE_FILES = LICENSE
+CPP_ARGPARSE_INSTALL_STAGING = YES
+CPP_ARGPARSE_INSTALL_TARGET = NO
+
+CPP_ARGPARSE_CONF_OPTS = -DARGPARSE_BUILD_SAMPLES=OFF -DARGPARSE_BUILD_TESTS=OFF
+
+$(eval $(cmake-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
