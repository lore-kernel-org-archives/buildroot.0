Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7592CDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 17:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 38DCF6068A;
	Mon, 22 Jun 2026 17:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKjdM89lgjpW; Mon, 22 Jun 2026 17:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DF3B6062A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782150882;
	bh=A2UrnMqi2HocPvwS8u1SX3dpJTOddDDlNWSbX5FbfEw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TwRlljQEaIKYVMt+4WHXYFHfZAjnXi3Cb3gubaG8/pZFTSD7yxx2G+ArRVHie7ZAf
	 LBX9AERcmgmKSLGlQqHDk0ihBh3b8mKFUEIzeiP1yB5zWZOqC4R+WA1jnlyKKmogck
	 jVy9BQf8I5JidJy9Ste1mCREF1iKWEyAVqU+EAbQiht6Cy23tD93LGSkqK8tHdO7ug
	 G3T55cAsiPyvRSWGPXGX4QAmv6LkiSvoEh8bM/u5QfMT49p1bYlt00pJi435CLi0sD
	 UFNx6VVqEQmjqMJm4v4rJGKA4NtIBzG67pm1BF8F6qfT7VQ0Wvw8CAQEZX0Uk+jkLt
	 OhLiWb6e+ZwqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DF3B6062A;
	Mon, 22 Jun 2026 17:54:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 129B5367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 17:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0418180C6A
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 17:54:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUoq5M1TW0j6 for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 17:54:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A125F80C69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A125F80C69
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A125F80C69
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 17:54:36 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id biqvwvd5OtpTfbiqvwOyJK; Mon, 22 Jun 2026 19:54:33 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 22 Jun 2026 19:54:32 +0200
Message-ID: <20260622175432.965730-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOQvYQao6rKmm+DfBY4j9Yd/v6eOtwgeSvmfFZ0yx5iJXuDhgTktVoeQ23TrtX5WbUAOWtjdtGSRL94z8ed8XgYxhcJjnxWwBAOYGMFRV3B3HFx9i2zH
 dS+tfYGo0haXxu4hMxdIq7ufBy+x1emPqC3ka4ulwSiEyCmsVcyOYawilWtVEgZwQRgwbdnOM2uqoDG/qAiDOvKQiP8u/5x6Tc4yhmYMPRj8j+VZftnPK5R6
 hHusMggmm7lhJ02xx/qNtSfkRc1l9ojsyCTtPaYYmmE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1782150873; bh=5c1FU3dkBT/dbzEZ48GeD/qVXBUZi4LslHk6vmDaDlY=;
 h=From:To:Subject:Date:MIME-Version;
 b=LKB3R1zm+KgBmOpA7iCaG8k78LJYaIIgcjk9sU4Dar0Tsz+4A3YZt0k495i9e3M0X
 eSOrwY78QBQV5B+31t0yUXLibCVdwOzKCz2eDD1JSMA+CkzjAp+WWfBdGuB/O4wXiI
 RKsQylShPcNHaZGz3cZhDZq/uffv7uAq7ErUHyC2/wvvaBE9fStiBvFunO3hKBJ0z1
 kSYA2S5NHtrj3hlmVAck+4/Ke4Llvvw9mh3AF0rllarJ6aWIKZ3jbpV/aTV8M+tk+m
 zpp1eaCDgJKNlgKSDaIauPrvrnHQnYVKnCpyObTfdtjXwZOlT2R5W54AkdXsX3IhHV
 rx4jAbc/INrag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LKB3R1zm
Subject: [Buildroot] [PATCH] package/bind: security bump version to 9.20.24
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
index d601e87b75..a1ff3c6101 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.41/bind-9.18.41.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  6ddc1d981511c4da0b203b0513af131e5d15e5f1c261145736fe1f35dd1fe79d  bind-9.18.41.tar.xz
+sha256  989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08  bind-9.20.24.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 8b336ab781..2b8156d0d0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.41
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
