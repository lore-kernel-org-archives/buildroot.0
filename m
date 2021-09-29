Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2EA2C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 16:14:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8999C6159A
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 16:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8999C6159A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16AF140726;
	Wed, 29 Sep 2021 16:14:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sn7tZu7eCzm; Wed, 29 Sep 2021 16:14:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3687740723;
	Wed, 29 Sep 2021 16:14:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E7FF11BF989
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 16:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7E2883A34
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 16:14:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=synopsys.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJLuiiIwpA6O for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 16:14:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7106783842
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 16:14:48 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5A34E40A06;
 Wed, 29 Sep 2021 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1632932087; bh=GzWp1pwX3GoDNPgkmQVcKH+Yr7AUS17p+kAEo4tqeKY=;
 h=From:To:Cc:Subject:Date:From;
 b=LRKSH/YaqjJrwfP1wQceP1YnT0YZ34rmuEXnEEp5BONvJOChWou6I8WZ00KoF31/B
 YHqysc9NegZNOsFu3rjGfxY1TU5/S3vmwP7zP2x+avk/lKNR7MM/RXEzUIGU3wo73K
 NcTjH67wmRfVnvXzLhZkh0LQpUG1wV+pFY4SKGT3PGrwAak6pLH6AlOguZSrxLkB8n
 Nk5SnWvC9cYRvcX4ydPnqaoOZExjOQNG+aFbm+37V1bKmPooWJN+G+kt9IQcCZoe9o
 opPAlx8vesSIe1pzH19XW/OurxCHIAoId8pmgBsgVNaKMb+m8k12XqzrdE0GfCk67h
 GjTlB0ez7xboQ==
Received: from ru20arcgnu3.internal.synopsys.com
 (ru20arcgnu3.internal.synopsys.com [10.121.9.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 413CBA005D;
 Wed, 29 Sep 2021 16:14:44 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 19:14:38 +0300
Message-Id: <20210929161438.85913-1-artemp@synopsys.com>
X-Mailer: git-send-email 2.8.3
Subject: [Buildroot] [PATCH 1/1] package/lftp: fix build with OpenSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Artem Panfilov via buildroot <buildroot@buildroot.org>
Reply-To: Artem Panfilov <Artem.Panfilov@synopsys.com>
Cc: Artem Panfilov <Artem.Panfilov@synopsys.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream patch from master(0276d5c) that fixes build with OpenSSL.

Signed-off-by: Artem Panfilov <artemp@synopsys.com>
---
 ...-with-LibreSSL-following-commit-537f37898.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch

diff --git a/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch b/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
new file mode 100644
index 0000000000..b06e9a375b
--- /dev/null
+++ b/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
@@ -0,0 +1,43 @@
+From 0276d5c239c41b3a63f738a5dc47fd56ac389cf0 Mon Sep 17 00:00:00 2001
+From: Ganael Laplanche <ganael.laplanche@martymac.org>
+Date: Thu, 20 Aug 2020 12:29:05 +0200
+Subject: [PATCH] Fix build with LibreSSL (following commit 537f37898)
+
+---
+ src/lftp_ssl.cc | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index 14a3b9d4..968d3fb2 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -34,7 +34,7 @@
+ #include "misc.h"
+ #include "network.h"
+ #include "buffer.h"
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
+ #define X509_STORE_CTX_get_by_subject X509_STORE_get_by_subject
+ #endif
+ extern "C" {
+@@ -840,7 +840,7 @@ lftp_ssl_openssl_instance::lftp_ssl_openssl_instance()
+    ssl_ctx=SSL_CTX_new();
+    X509_set_default_verify_paths(ssl_ctx->cert);
+ #else
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
+    SSLeay_add_ssl_algorithms();
+ #endif
+    ssl_ctx=SSL_CTX_new(SSLv23_client_method());
+@@ -1080,7 +1080,7 @@ void lftp_ssl_openssl::copy_sid(const lftp_ssl_openssl *o)
+ 
+ const char *lftp_ssl_openssl::strerror()
+ {
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
+    SSL_load_error_strings();
+ #endif
+    int error=ERR_get_error();
+-- 
+2.25.1
+
-- 
2.16.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
