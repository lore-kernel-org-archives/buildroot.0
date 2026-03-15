Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B1AD58B22
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 13:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D925082503;
	Sun, 15 Mar 2026 13:16:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cUxk16OkzjZV; Sun, 15 Mar 2026 13:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 018E78258A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773580597;
	bh=AdXS5DaCpK9u4s95+YbqyjLaPR09K4c55mOgaEAGsN8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6ryYnMA8z3qxTvkbcXkX94BUHfG/EI2z/mYMdpwGmIyfeFjVt6PQEZ7IdD6BRNFi
	 Nk9BVzYfluwkcmLQA2LWf4s8EI513P7v5ApbnxCgaC+8bMsTm41xBhRvU+NOsIDvNg
	 ooOHXUM8CF9wYQE03wMKSVSdH4suaCMXLxzhNI8CCmE359LGPUF0Yxkud+Z3ieswXz
	 0KFrNEL/j4ASkKWAv8CrT5ToINUtROjKOka1YlIaLuRVxA6dUNWA3KMg7Q6DxtIhWe
	 WHdV8yAjm11qZyOd6VZXFmpgtWod1NKLCepwZ5AlWtrZJQnAcuv0VZ9kP4N/RVBJOy
	 CYxOVj1xhrwFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 018E78258A;
	Sun, 15 Mar 2026 13:16:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 627A6201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53D908258A
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:16:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BmTgLgkyfGvY for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 13:16:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4954882503
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4954882503
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4954882503
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 13:16:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5fc.dip0.t-ipconnect.de [84.161.181.252])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E5144A4C205C;
 Sun, 15 Mar 2026 14:16:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40510)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1lKN-000000007HE-0WTH;
 Sun, 15 Mar 2026 13:16:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Date: Sun, 15 Mar 2026 14:16:17 +0100
Message-ID: <20260315131619.3961450-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260315131619.3961450-1-bernd@kuhls.net>
References: <20260315131619.3961450-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773580579;
 bh=5ZJHMvIylu+4/gYXaChXLNQ8ChbBY3568O0PV/wJai8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iyN1K0MpuEHrggG/861biIL5HHSMXp3gvj9m4iO7BParx9dGPbezJFPkpokT5I4Iw
 7vtJA4ZQeMK1g3YtiQZNpJjjpNG7kNmctW3spF6j+dXEMM1t8Otang2cPrebFIiNZY
 cFBot33GnEJ0RC0CnZTZyeAfg19pU8NzNDmJPIxgIOjSL4kUArh3vJJM88Bxzet1cV
 XiCMFKxlq8st8ryFrgkdjMkaetKZt6nE22HjklNhXA5T6G7Yuf+6VvW31onkADVdp1
 K0oUF+0q7Z3fxZRaY9lyPx1NtYwIikpK3KDds1v4u3XUNSkaLnlQTmUZeX6aeWKhqr
 5+8bZPw5R5ceg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iyN1K0Mp
Subject: [Buildroot] [PATCH 2/4] package/cxxopts: new package
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

This header-only library is needed for gerbera bump to 3.2.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/cxxopts/Config.in    | 10 ++++++++++
 package/cxxopts/cxxopts.hash |  3 +++
 package/cxxopts/cxxopts.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/cxxopts/Config.in
 create mode 100644 package/cxxopts/cxxopts.hash
 create mode 100644 package/cxxopts/cxxopts.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b495e0fbe..0e83652483 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -369,6 +369,7 @@ F:	package/bcg729/
 F:	package/bento4/
 F:	package/bitcoin/
 F:	package/clamav/
+F:	package/cxxopts/
 F:	package/dav1d/
 F:	package/dht/
 F:	package/dnsmasq/
diff --git a/package/Config.in b/package/Config.in
index 49425bdbe3..7100105a07 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2136,6 +2136,7 @@ menu "Other"
 	source "package/llvm-project/compiler-rt/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
+	source "package/cxxopts/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
 	source "package/dlib/Config.in"
diff --git a/package/cxxopts/Config.in b/package/cxxopts/Config.in
new file mode 100644
index 0000000000..0e7a52c0a5
--- /dev/null
+++ b/package/cxxopts/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CXXOPTS
+	bool "cxxopts"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Lightweight C++ command line option parser
+
+	  https://github.com/jarro2783/cxxopts
+
+comment "cxxopts needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cxxopts/cxxopts.hash b/package/cxxopts/cxxopts.hash
new file mode 100644
index 0000000000..fabef5c840
--- /dev/null
+++ b/package/cxxopts/cxxopts.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  3bfc70542c521d4b55a46429d808178916a579b28d048bd8c727ee76c39e2072  cxxopts-3.3.1.tar.gz
+sha256  aa324fbe633a96546bebca975fbbab65caa175894bd00cfa13d7335e7363400c  LICENSE
diff --git a/package/cxxopts/cxxopts.mk b/package/cxxopts/cxxopts.mk
new file mode 100644
index 0000000000..1dc25c9083
--- /dev/null
+++ b/package/cxxopts/cxxopts.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# cxxopts
+#
+################################################################################
+
+CXXOPTS_VERSION = 3.3.1
+CXXOPTS_SITE = $(call github,jarro2783,cxxopts,v$(CXXOPTS_VERSION))
+CXXOPTS_LICENSE = MIT
+CXXOPTS_LICENSE_FILES = LICENSE
+
+CXXOPTS_INSTALL_STAGING = YES
+CXXOPTS_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
