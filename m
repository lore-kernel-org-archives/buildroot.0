Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0EBCD98F2
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 18:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D13D60677;
	Mon, 22 Jun 2026 18:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJxMjv_6EOt3; Mon, 22 Jun 2026 18:58:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EF7660685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782154694;
	bh=PT2icTF3HzxBG2pLc8/RAprPhFxTWSYR4RbDy1cQsD0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iHJCRuXH5Oggeo2bjspIAPqTyOEBxWja8us9Uu7H0ZMX5OcXJDVxPuP/o+lumySXV
	 cyNbYwoFq+JvlbM3hgvtuXyhLZPE4/zSk/IBc2QEHey72F+h6bGW0N18OHIMpMYiG/
	 2tFWf0q0OHChDT1eI4U8517/Pbc5+gYSYWS69iWpJ9uPejDhRXeEgdTlJCXkAZFxSL
	 +C6Y1GvalbLarN1ZGlcsP7v/VFdJPd5GL2i0G51zr+q9X/t89S26DXstp2rHpeeIMO
	 sP7eQ4dSb0K1/PUsSCCGE2gQNUglg/FcvL5jbrCZ6RzCxzJHbQzbo7UP+FpQTgwXWq
	 epVW1Ksa/SXcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF7660685;
	Mon, 22 Jun 2026 18:58:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 496152F3
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 18:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FBFD60685
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 18:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DOKhqv2xSsiB for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 18:58:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA65E60677
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA65E60677
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA65E60677
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 18:58:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id bjqTwXvXlclBZbjqTwSAA3; Mon, 22 Jun 2026 20:58:10 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Jun 2026 20:56:02 +0200
Message-ID: <20260622185602.1397198-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPe+8bJHRY4iZNUY/93KbTVpPQSuiBxFUyM6yFWMRMVbR+lgh8L8LMxbjKS8TP8lLkdi5I+btDkulQtEAFtT8YhGRMIRc6YOg8c9FrQ8eN3J7r/AJmH+
 ZfmW+PqFDYvGeQDAZq6B8pipiRqKG3ZLlQQpCTIlZ6Ntux6SF/oiD87td7tBtJ5rW6cfxGVxfubBYTZ68IIPgwxhRNdT2lTYcXPlTkf6dhL/p/8tzHDk4iXR
 eynBdXmBCmdZb9OfkMCKiOhjvEGxIw3uUW5vdPu7P+E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1782154690; bh=ljwdKX49DQPgRxXc3Ui1UA8SKB0QX0PeYXpUtxRm7jY=;
 h=From:To:Subject:Date:MIME-Version;
 b=LKBrh1CPipuK+L7NvbjyOJFXuu6GV14lStcNtMyI1aJRNAMZl3n1+DzVxbGvycJCp
 Fd+y7M99xT88TMplZMSyb1l2/iZV5WgviZSMg09+iNit+6T7uFBTPXJAxoVG1Y8hqM
 5FdJjP8GGf7OYWZFQClnNLjnZ0yQfrgUMs60wqF+wV6bnBN91/lb6333Isy/YxBdA0
 H63/OcHw7Tq7rlSybBNRhnOka1cwvp97/+Kl7EoO/iFj1nPC4qSyh/WAwcsMVmWrdc
 Bze0LnlrxKvCPc7UbyD15Hl4elE9FSzV2ZmummCnSg7DyCxw/TuzwQmiKbkP2rcDJY
 os17Og5Q/vP5w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LKBrh1CP
Subject: [Buildroot] [PATCH v2] package/bind: security bump version to
 9.20.24
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

Release notes:
https://ftp.isc.org/isc/bind9/9.20.24/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.20.24/doc/arm/html/changelog.html

Fixes CVE-2026-3593.

NOTE: Libraries libcap, liburcu are now mandatory.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* rebased on latest master branch commit
---
 package/bind/Config.in | 15 ++++++++++-----
 package/bind/bind.hash |  4 ++--
 package/bind/bind.mk   |  4 ++--
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 512e948ca2..6f5f14a6bb 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,10 +1,14 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
-	depends on BR2_USE_MMU # fork(), libuv
+	depends on BR2_USE_MMU # fork(), libcap, libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv
+	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # liburcu
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -44,8 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+comment "bind needs a toolchain w/ threads, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 766540ee22..a1ff3c6101 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.50/bind-9.18.50.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d  bind-9.18.50.tar.xz
+sha256  989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08  bind-9.20.24.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 54870bfa4e..2b8156d0d0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.50
+BIND_VERSION = 9.20.24
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
@@ -32,7 +32,7 @@ BIND_CONF_OPTS = \
 	--disable-static \
 	--with-openssl=$(STAGING_DIR)/usr
 
-BIND_DEPENDENCIES = host-pkgconf libuv openssl
+BIND_DEPENDENCIES = host-pkgconf libcap liburcu libuv openssl
 
 BIND_CFLAGS = $(TARGET_CFLAGS)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
