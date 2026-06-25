Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A223CDE008
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 10:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F8D260FF5;
	Thu, 25 Jun 2026 10:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l7MZXvjz4T-Z; Thu, 25 Jun 2026 10:57:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79B8360FFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782385024;
	bh=nkurmT2MERBQRIbOGjscxKOQmgOSRYK5n/WuEfog/hc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=d8uEpE+0hkhvN5d7PPjYNrW79j6DeoT/ohrwSe1msKJ5wy6mDBBur4vhJfwAKHeiK
	 KFRgZ72BCAgAPcbEk3NbOLyPJtQDYKEOKGHgUtac3madk2CWdyuwSigomMBNVIPGCu
	 mw3f4p8dOzQpcuHhRpDVhWNlRkrB3lC9q97nZ7pSufjHbUMulXqF79VjQVkWsz07cR
	 uu+oMjL1mUmU/+Rii0GJhfftcPTZNi7rMkih1tnJMlLobidLJQvBcXuB+MO+zWn8o5
	 9y6vp/w41rTsOHGy7r7rMUjWVSQYGg6cJ9gbc7P9e9jA5nB/OMG9XnqHFKfzThmK23
	 ZojzM4Bpjbh+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79B8360FFA;
	Thu, 25 Jun 2026 10:57:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B9E6A2C7
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 10:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F82960FFA
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 10:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KoJZjijGKQE for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 10:57:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71F5F60FF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F5F60FF5
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71F5F60FF5
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 10:57:02 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 42D61E00370;
 Thu, 25 Jun 2026 12:56:59 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Florian Larysch <fl@n621.de>
Date: Thu, 25 Jun 2026 12:56:26 +0200
Message-ID: <20260625105642.24181-3-fl@n621.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1782385019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6v8SF7xkLIsPSWvhHH8DSy/MkAJ3dsOEX2o+IWgPSS4=;
 b=QvGDMnA5+jm0kENoxcH05R5u42rsgmYtUNMNyRo5s+w9+x24IFoXUQvtWr5HCp9iwlyq/b
 +O7FSyEQdQGUSWM7LgsQKl/sVzDOnyQZUOz+gU2Y1wpiCLFIvw+VgSSRT4wjXocfWD6aBq
 uzXU5rM7ssYLw4h1HK8gaszgL7xIT5o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=QvGDMnA5
Subject: [Buildroot] [PATCH 1/1] package/sigsum-c: bump version to 1.1.0
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

This release now includes our local patch so we can drop it.

Changelog: https://git.glasklar.is/sigsum/core/sigsum-c/-/blob/v1.1.0/NEWS?ref_type=tags#L1-28

Signed-off-by: Florian Larysch <fl@n621.de>
---
 ...001-Make-command-line-tools-optional.patch | 71 -------------------
 package/sigsum-c/sigsum-c.hash                |  2 +-
 package/sigsum-c/sigsum-c.mk                  |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)
 delete mode 100644 package/sigsum-c/0001-Make-command-line-tools-optional.patch

diff --git a/package/sigsum-c/0001-Make-command-line-tools-optional.patch b/package/sigsum-c/0001-Make-command-line-tools-optional.patch
deleted file mode 100644
index 3ce986b8bd..0000000000
--- a/package/sigsum-c/0001-Make-command-line-tools-optional.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 5c74c6d0dd2dd1707b178083815f3a165e3e7dc3 Mon Sep 17 00:00:00 2001
-From: Florian Larysch <fl@n621.de>
-Date: Fri, 22 May 2026 14:36:02 +0200
-Subject: [PATCH] Make command line tools optional
-
-When only using the sigsum-c library in another program, the
-dedicated sigsum-c-verify tool might be redundant.
-
-Allow disabling it to save space/avoid littering /bin.
-
-Upstream: https://git.glasklar.is/sigsum/core/sigsum-c/-/commit/5c74c6d0dd2dd1707b178083815f3a165e3e7dc3
-Signed-off-by: Florian Larysch <fl@n621.de>
----
- Makefile.in  |  4 ++--
- configure.ac | 11 +++++++++++
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 0648adb..771551a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -12,7 +12,7 @@ lib:
- tools: lib
- 	cd tools && $(MAKE) all
- 
--all:	lib @IF_PARSERS@ tools
-+all:	lib @IF_TOOLS@ tools
- 
- clean distclean:
- 	cd lib && $(MAKE) $@
-@@ -34,7 +34,7 @@ install-lib: lib
- install-tools: tools
- 	cd tools && $(MAKE) install
- 
--install: install-lib @IF_PARSERS@ install-tools
-+install: install-lib @IF_TOOLS@ install-tools
- 
- # Remake configure-generated files.
- # From the autoconf manual (4.8.5 Automatic Remaking)
-diff --git a/configure.ac b/configure.ac
-index 37a18b7..8305789 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -19,6 +19,16 @@ else
-    IF_PARSERS='#'
- fi
- 
-+AC_ARG_ENABLE(tools,
-+	AS_HELP_STRING([--disable-tools], [Do not build or install command-line tools.]),,
-+	[enable_tools="$enable_parsers"])
-+
-+if test "$enable_tools" = yes ; then
-+   IF_TOOLS=''
-+else
-+   IF_TOOLS='#'
-+fi
-+
- AC_ARG_ENABLE(static,
-   AS_HELP_STRING([--disable-static], [Do not build any static library]),,
-   [enable_static=yes])
-@@ -47,6 +57,7 @@ if test -z "$PIC_CFLAGS" ; then
- fi
- 
- AC_SUBST(IF_PARSERS)
-+AC_SUBST(IF_TOOLS)
- AC_SUBST(IF_STATIC)
- AC_SUBST(IF_SHARED)
- AC_SUBST(IF_NOT_SHARED)
--- 
-2.54.0
-
diff --git a/package/sigsum-c/sigsum-c.hash b/package/sigsum-c/sigsum-c.hash
index 5941eafc5d..4abfae3b9d 100644
--- a/package/sigsum-c/sigsum-c.hash
+++ b/package/sigsum-c/sigsum-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  147ab839b22c5584aa9982c912bdb629cc717dcd978528233889789544e5fe51  sigsum-c-v1.0.0-git4.tar.gz
+sha256  f0c4d070c4ffb417c65f3b376c6f8ce0b81d148dd1d4ce9964508f1b70bc9cb0  sigsum-c-v1.1.0-git4.tar.gz
 sha256  f592312f5d5756846c43becd06fc1d826eafe05b1b45f88e95af460d59d24ad0  LICENSE
diff --git a/package/sigsum-c/sigsum-c.mk b/package/sigsum-c/sigsum-c.mk
index a6021f0587..b7c8fb2b15 100644
--- a/package/sigsum-c/sigsum-c.mk
+++ b/package/sigsum-c/sigsum-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGSUM_C_VERSION = v1.0.0
+SIGSUM_C_VERSION = v1.1.0
 SIGSUM_C_SITE = https://git.glasklar.is/sigsum/core/sigsum-c
 SIGSUM_C_SITE_METHOD = git
 SIGSUM_C_LICENSE = BSD-2-Clause
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
