Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA852D68BCE
	for <buildroot@archiver.kernel.org>; Fri, 15 Nov 2024 17:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8472E841BF;
	Fri, 15 Nov 2024 17:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hYkBHtOAknt; Fri, 15 Nov 2024 17:35:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 985398414E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 985398414E;
	Fri, 15 Nov 2024 17:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A99011EB8
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 17:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AAC28414E
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 17:35:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRe7T1ZC6f3k for <buildroot@buildroot.org>;
 Fri, 15 Nov 2024 17:35:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 397A7840EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 397A7840EA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 397A7840EA
 for <buildroot@buildroot.org>; Fri, 15 Nov 2024 17:35:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 561E278034E;
 Fri, 15 Nov 2024 18:35:12 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: zer0@droids-corp.org,
	robin@jarry.cc,
	Vincent Jardin <vjardin@free.fr>
Date: Fri, 15 Nov 2024 18:35:10 +0100
Message-ID: <20241115173510.31009-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731692115;
 bh=JJJ55fKMrB6JWSeuu6LSKT+fYnxG1bNMCKHNLjW9Xlc=;
 h=From:To:Cc:Subject:Date:From;
 b=rX8gMtzFd7tNpc2hdhMlG4kh1V1Ca5pNx/RN3XzOcgUNhr5iFTCOSO10CQQfeiaQT
 RNR5oD8XCn5yCP7g1ZYyl/tEP6R6TW1PndjeGxRheYGTHIjFkurwS2PGRzmZBJK2nu
 FCvmu4VmLD2ws8DEdfLt21ht41WG+Unr6RCd1PdUx27DzXkSuPWkB8Or6SumtMN64z
 hX3kTfN3JRTT5loBefGuvdyvsekRBS9Vpzakxic4lQbOSsQqY+tclfmLwnTLlCVIxn
 xePwoUthmyZNe31t6qw9zu8ZEYCVke6yBXlZY12O0pE4wX/lGw6kwajgvRdtxf+j4o
 MH46T3uJ1IjHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=rX8gMtzF
Subject: [Buildroot] [PATCH 1/1] package/libecoli: new package
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

Add a new smart library for CLI / command line.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libecoli/Config.in   |  7 +++++++
 package/libecoli/libecoli.mk | 17 +++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/libecoli/Config.in
 create mode 100644 package/libecoli/libecoli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3945803d53..a44c79e66a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3285,6 +3285,7 @@ F:	board/nvidia/bf3/
 F:	configs/nvidia_bf3_defconfig
 F:	package/bfscripts/
 F:	package/dpdk/
+F:	package/libecoli/
 
 N:	Vincent Prince <vincent.prince.fr@gmail.com>
 F:	package/nss-myhostname/
diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..278c82bb05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2337,6 +2337,7 @@ menu "Text and terminal handling"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
 	source "package/libcli/Config.in"
+	source "package/libecoli/Config.in"
 	source "package/libedit/Config.in"
 	source "package/libenca/Config.in"
 	source "package/libestr/Config.in"
diff --git a/package/libecoli/Config.in b/package/libecoli/Config.in
new file mode 100644
index 0000000000..765a8b9e5c
--- /dev/null
+++ b/package/libecoli/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBECOLI
+	bool "libecoli"
+	depends on BR2_PACKAGE_LIBEDIT
+	help
+	  libecoli is the best library to develop a CLI
+
+	  https://github.com/rjarry/libecoli/
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
new file mode 100644
index 0000000000..7ade6666ff
--- /dev/null
+++ b/package/libecoli/libecoli.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libecoli
+#
+################################################################################
+
+LIBECOLI_VERSION = 0.2.0
+LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
+LIBECOLI_INSTALL_STAGING = YES
+LIBECOLI_LICENSE = BSD-3-Clause
+LIBECOLI_LICENSE_FILES = license/bsd-3-clause.txt
+
+LIBECOLI_DEPENDENCIES = \
+	host-pkgconf \
+	libedit
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
