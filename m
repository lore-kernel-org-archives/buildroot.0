Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835C4C53200
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 15:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFCEE60674;
	Wed, 29 Jul 2026 15:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaopblkG62pO; Wed, 29 Jul 2026 15:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EF5960624
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785339415;
	bh=vvlO007hfzN2e9kkVK3F9xL5OrSB5w5n5C4aqumSyeQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MzVoqGZxgoRdCMEO2mI98FkufrlzxGh8S5T851lD9E1/7goti/kAIbVt1mpX9TUL0
	 y7lLbflb8BFM4ceGcgTo22gAnO/UFoqWekd7xlwlv9pG9eLGzs49ScD8LEnJngFMrf
	 EUln1XFJYISngrGtd/49ZD3KQdfUkkMjzvFlNqK3z/nnmUbfnvFXal5AOzElIRiZfU
	 YCNpZ4+TYY8JOnoBPvwKMev/buA03SuS1al05/7fkXYpCB1V7cOyotn3C+SHs6al7z
	 wfQgK/DM0E7BBFD8c2cOEuCu7EXVtM5u06zEcPWtDxEgvsrkN4KHCvniC+ztXMCsDp
	 s29yqE47bh++g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EF5960624;
	Wed, 29 Jul 2026 15:36:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D53142E5
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 15:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB1294014E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 15:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VhemXnv8fINg for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 15:36:51 +0000 (UTC)
X-Greylist: delayed 578 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 29 Jul 2026 15:36:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4D3164009F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D3164009F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=155.212.184.193;
 helo=mail.rulkc.org; envelope-from=viper@landau.one; receiver=<UNKNOWN> 
Received: from mail.rulkc.org (mail.rulkc.org [155.212.184.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D3164009F
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 15:36:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2129C1002E7; Wed, 29 Jul 2026 18:27:05 +0300 (MSK)
From: viper@landau.one
To: buildroot@buildroot.org
Cc: Konstantin Menyaev <viper@landau.one>
Date: Wed, 29 Jul 2026 18:26:59 +0300
Message-ID: <20260729152659.3813837-1-viper@landau.one>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landau.one; s=dkim; 
 t=1785338826; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=GSEV0QeiXasXphkW2bIQ8ppjUQtjUc0XPTThPBC/CaY=;
 b=nQf3TqedlVcq+hJmIAAzdoggFkNL1qXwB8WuKvWImGvMvPZGIbG5d/RZql4MdYEgBfFuyx
 OptKiwNKLWP+7bzyTuIRFd1b05iiDdu/Yh/C/XBnD56u4olnjGGmUrWLBq87zcwhNTRxR7
 5kmOOW7IZvI78NdD99rryyhWuQCkN0kBnvXtVDoZSk+E+8ccUje/Um2B177c2cNNzpumWR
 G1rT+vsnEhTHlq7dJQDuMFNQXPQf1hF1B3piA7ejw4ThNNE3ydiZsW/9O/TJce0xuMMQL6
 IUIsgkaBoyXcKWC2pzbEacT7HC2HXyw6T8my6dd2ptyQ8na1FFL9+1O/D8HrVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=landau.one
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=landau.one header.i=@landau.one header.a=rsa-sha256
 header.s=dkim header.b=nQf3Tqed
Subject: [Buildroot] [PATCH 1/1] package/cpp-argparse: new package
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

From: Konstantin Menyaev <viper@landau.one>

A Modern C++ header-only library
for parsing command-line arguments.

https: //github.com/p-ranav/argparse

Signed-off-by: Konstantin Menyaev <viper@landau.one>
---
 package/Config.in                    |  1 +
 package/cpp-argparse/Config.in       | 12 ++++++++++++
 package/cpp-argparse/cpp-argparse.mk | 16 ++++++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/cpp-argparse/Config.in
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
index 0000000000..7ad91f7bbc
--- /dev/null
+++ b/package/cpp-argparse/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CPP_ARGPARSE
+	bool "cpp-argparse"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	help
+	  Argument Parser for Modern C++. A header-only library
+	  for parsing command-line arguments.
+
+	  https://github.com/p-ranav/argparse
+
+comment "cpp-argparse needs a toolchain w/ C++, GCC >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/cpp-argparse/cpp-argparse.mk b/package/cpp-argparse/cpp-argparse.mk
new file mode 100644
index 0000000000..7978fd224c
--- /dev/null
+++ b/package/cpp-argparse/cpp-argparse.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# cpp-argparse
+#
+################################################################################
+
+CPP_ARGPARSE_VERSION = v3.2
+CPP_ARGPARSE_SITE = $(call github,p-ranav,argparse,$(CPP_ARGPARSE_VERSION))
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
