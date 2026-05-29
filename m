Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32316CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 19:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBB4C84725;
	Fri, 29 May 2026 19:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nLhihWlUBxtT; Fri, 29 May 2026 19:12:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4238681369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780081966;
	bh=D08UfxAtO/CU0gQsOLw5u10C79cMS47aTn7N2FVxj5I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pgG9AJZgZLqH9nvOb+HfEQ6Qr+g9z154kSDTId9s86vHaU8ZgurkGEghzjQqRvxON
	 pAIeYVJuo7s/Z4gxVfk+Zj6Ti3o8vT+3Z9rP1VQcjHFmbrTVicv2+R8hmOUp/vlYES
	 AWT3zVqGBQHGIag8mma8dEh979qrzDeoiG5aBeMuuCT/87NwpRUEzeCPXhwxVugI0o
	 TBsq0x4dqfR/ETeVL8pdTfDvRR1ugAZaSAY8zsdqFeGsUiovKeJq3GUSdyMx7dRpr+
	 CvxgRGuf3bvaVq5EXMrsHAvnPuWLC8BDbu6gvDKl5Gt4CI4zPn1mQjlqQbdJp4YKaf
	 HazfNzOTNp9wQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4238681369;
	Fri, 29 May 2026 19:12:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A464D3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FDA040FDE
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCnX32pPAakz for <buildroot@buildroot.org>;
 Fri, 29 May 2026 19:12:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3E8FF40F50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E8FF40F50
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E8FF40F50
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:12:42 +0000 (UTC)
Received: from charybdis.office.fixme.cloud (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id 76404E00261;
 Fri, 29 May 2026 21:12:39 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Florian Larysch <fl@n621.de>
Date: Fri, 29 May 2026 21:12:37 +0200
Message-ID: <20260529191238.17385-1-fl@n621.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1780081959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=85VYUhQ1SqDDs5JAUCUNXUmyklL/0oR9jj9rFwKgjRk=;
 b=KgJIro3WUegx6kwEo62SayxOFjQ72xJqgXmnXrj340FrxPLtRl1aqfMzS7w3TU2T/RumTT
 wAdP6WZbExMXLL0v6o60F9XSeCh66pg+2c4QxPDxGqN9p7TlEWVS8K03N7cCwbarh+nbu1
 dLiqRPtJviDCUNPjHb5+a5MaC5q1JWI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=KgJIro3W
Subject: [Buildroot] [PATCH next 1/1] package/sigsum-c: new package
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

Add the sigsum-c library, which is a more lightweight alternative to
sigsum-go when only proof verification is needed or needs to be embedded
in some other program.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...001-Make-command-line-tools-optional.patch | 71 +++++++++++++++++++
 package/sigsum-c/Config.in                    | 17 +++++
 package/sigsum-c/sigsum-c.hash                |  3 +
 package/sigsum-c/sigsum-c.mk                  | 21 ++++++
 6 files changed, 114 insertions(+)
 create mode 100644 package/sigsum-c/0001-Make-command-line-tools-optional.patch
 create mode 100644 package/sigsum-c/Config.in
 create mode 100644 package/sigsum-c/sigsum-c.hash
 create mode 100644 package/sigsum-c/sigsum-c.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index fea3311076..d76c9013f4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1141,6 +1141,7 @@ F:	package/cpulimit/
 
 N:	Florian Larysch <fl@n621.de>
 F:	package/casync-nano/
+F:	package/sigsum-c/
 F:	package/sigsum-go/
 
 N:	Floris Bos <bos@je-eigen-domein.nl>
diff --git a/package/Config.in b/package/Config.in
index 1c0f6d8a29..5660c0a006 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1658,6 +1658,7 @@ menu "Crypto"
 	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
+	source "package/sigsum-c/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/tpm2-openssl/Config.in"
 	source "package/tpm2-pkcs11/Config.in"
diff --git a/package/sigsum-c/0001-Make-command-line-tools-optional.patch b/package/sigsum-c/0001-Make-command-line-tools-optional.patch
new file mode 100644
index 0000000000..3ce986b8bd
--- /dev/null
+++ b/package/sigsum-c/0001-Make-command-line-tools-optional.patch
@@ -0,0 +1,71 @@
+From 5c74c6d0dd2dd1707b178083815f3a165e3e7dc3 Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Fri, 22 May 2026 14:36:02 +0200
+Subject: [PATCH] Make command line tools optional
+
+When only using the sigsum-c library in another program, the
+dedicated sigsum-c-verify tool might be redundant.
+
+Allow disabling it to save space/avoid littering /bin.
+
+Upstream: https://git.glasklar.is/sigsum/core/sigsum-c/-/commit/5c74c6d0dd2dd1707b178083815f3a165e3e7dc3
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ Makefile.in  |  4 ++--
+ configure.ac | 11 +++++++++++
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 0648adb..771551a 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -12,7 +12,7 @@ lib:
+ tools: lib
+ 	cd tools && $(MAKE) all
+ 
+-all:	lib @IF_PARSERS@ tools
++all:	lib @IF_TOOLS@ tools
+ 
+ clean distclean:
+ 	cd lib && $(MAKE) $@
+@@ -34,7 +34,7 @@ install-lib: lib
+ install-tools: tools
+ 	cd tools && $(MAKE) install
+ 
+-install: install-lib @IF_PARSERS@ install-tools
++install: install-lib @IF_TOOLS@ install-tools
+ 
+ # Remake configure-generated files.
+ # From the autoconf manual (4.8.5 Automatic Remaking)
+diff --git a/configure.ac b/configure.ac
+index 37a18b7..8305789 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -19,6 +19,16 @@ else
+    IF_PARSERS='#'
+ fi
+ 
++AC_ARG_ENABLE(tools,
++	AS_HELP_STRING([--disable-tools], [Do not build or install command-line tools.]),,
++	[enable_tools="$enable_parsers"])
++
++if test "$enable_tools" = yes ; then
++   IF_TOOLS=''
++else
++   IF_TOOLS='#'
++fi
++
+ AC_ARG_ENABLE(static,
+   AS_HELP_STRING([--disable-static], [Do not build any static library]),,
+   [enable_static=yes])
+@@ -47,6 +57,7 @@ if test -z "$PIC_CFLAGS" ; then
+ fi
+ 
+ AC_SUBST(IF_PARSERS)
++AC_SUBST(IF_TOOLS)
+ AC_SUBST(IF_STATIC)
+ AC_SUBST(IF_SHARED)
+ AC_SUBST(IF_NOT_SHARED)
+-- 
+2.54.0
+
diff --git a/package/sigsum-c/Config.in b/package/sigsum-c/Config.in
new file mode 100644
index 0000000000..afc5942e83
--- /dev/null
+++ b/package/sigsum-c/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SIGSUM_C
+	bool "sigsum-c"
+	select BR2_PACKAGE_NETTLE
+	help
+	  C library and command-line utility for verifying Sigsum
+	  proofs.
+
+	  https://git.glasklar.is/sigsum/core/sigsum-c/
+
+if BR2_PACKAGE_SIGSUM_C
+
+config BR2_PACKAGE_SIGSUM_C_TOOLS
+	bool "Enable tools"
+	help
+	  Build CLI tools like sigsum-c-verify.
+
+endif
diff --git a/package/sigsum-c/sigsum-c.hash b/package/sigsum-c/sigsum-c.hash
new file mode 100644
index 0000000000..5941eafc5d
--- /dev/null
+++ b/package/sigsum-c/sigsum-c.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  147ab839b22c5584aa9982c912bdb629cc717dcd978528233889789544e5fe51  sigsum-c-v1.0.0-git4.tar.gz
+sha256  f592312f5d5756846c43becd06fc1d826eafe05b1b45f88e95af460d59d24ad0  LICENSE
diff --git a/package/sigsum-c/sigsum-c.mk b/package/sigsum-c/sigsum-c.mk
new file mode 100644
index 0000000000..a6021f0587
--- /dev/null
+++ b/package/sigsum-c/sigsum-c.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# sigsum-c
+#
+################################################################################
+
+SIGSUM_C_VERSION = v1.0.0
+SIGSUM_C_SITE = https://git.glasklar.is/sigsum/core/sigsum-c
+SIGSUM_C_SITE_METHOD = git
+SIGSUM_C_LICENSE = BSD-2-Clause
+SIGSUM_C_LICENSE_FILES = LICENSE
+SIGSUM_C_INSTALL_STAGING = YES
+SIGSUM_C_DEPENDENCIES = nettle
+
+SIGSUM_C_AUTORECONF = YES
+
+ifneq ($(BR2_PACKAGE_SIGSUM_C_TOOLS),y)
+SIGSUM_C_CONF_OPTS += --disable-tools
+endif
+
+$(eval $(autotools-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
