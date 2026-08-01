Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FD7C55173
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 14:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51935606F3;
	Sat,  1 Aug 2026 14:09:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CH43SX7VwBY2; Sat,  1 Aug 2026 14:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 783DC606DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785593386;
	bh=tjEK5zoSVavdwXfD8TMFlR6ROw9M/6tetPMD1C2qCeU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJ2LRCZXTXruvYSNHhprPXwAe/dkUIFZ/AKG91++8gD8BpVlqUwwB6qQ+0uUzRwCf
	 7x32u2V/u7U2QOGOWlqQ5Kj+8AP67KfKfAcYsPIqBVwEkDDtgKad2yvgYJptkIHBkO
	 uPqh6g/SMTVWgLInbgSG9c4QmqHSKADujkLTkaGOY+ljdOQppQ4QSslh2VEqAtvCXi
	 pIUBZhIN4kTXAt7lDGewxBYNjjFaEnAynskCrutlp301IrHSlsh5BMg0d9gVEtZuP7
	 /SIf3NJs4NyF/t/Hpu2zzkm6qWubcXU2z10SNJrtBwUtAesu+2dRYsh3+MLgKgPiQy
	 M/hBO2oEkabeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 783DC606DC;
	Sat,  1 Aug 2026 14:09:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8743B32E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7885F4008E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:09:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akCbn3JYyjuI for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 14:09:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=155.212.184.193;
 helo=mail.rulkc.org; envelope-from=viper@landau.one; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C7A1240015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7A1240015
Received: from mail.rulkc.org (mail.rulkc.org [155.212.184.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7A1240015
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 14:09:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2DD51100719; Sat,  1 Aug 2026 17:09:37 +0300 (MSK)
From: viper@landau.one
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Konstantin Menyaev <viper@landau.one>
Date: Sat,  1 Aug 2026 17:09:23 +0300
Message-ID: <20260801140923.1375200-1-viper@landau.one>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <720f85aa2477fe660f66a45354973035@free.fr>
References: <720f85aa2477fe660f66a45354973035@free.fr>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landau.one; s=dkim; 
 t=1785593379; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=N8e1cMyAPhImID+NFvDm2aH8TBVkcsrTHmVN9HTlDjI=;
 b=hryCUys2VnjsdUtuvzhdypQJTJPUbd8fcdUksmlDyB6AaJXNhCxxlrp2C6ktsaln9ygz8L
 T4+wsafWk47CJJI4yrSHHg3g20QnsDWv0voOoaWoNafqcFy785n7dPMxw/lKkHBkljfR4K
 aCdy8mWH4DO9qDzS1ffzGhQrCZYOgiD+tWjKobTNq48rH6Wz19hwCskAa25CMpk8wYNoHf
 +P0SjbBB7gmNqb91UfPTATv6bk98ghDDhEzb6OMl3vEaExyQQJGFQ3XjIGHXO52YCwvHYr
 9I7p+gC+aBdgCqGuhvtqj5UONHMXk2x2mZFrN/N0Q7HN7kvI0Y0Ga0q5demwbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=landau.one
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=landau.one header.i=@landau.one header.a=rsa-sha256
 header.s=dkim header.b=hryCUys2
Subject: [Buildroot] [PATCH v2 1/1] package/cpp-argparse: new package
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
