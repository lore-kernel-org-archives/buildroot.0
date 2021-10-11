Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEB9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:59:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E28BE60F3A
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 20:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E28BE60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF219608EC;
	Mon, 11 Oct 2021 20:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcU7rba9CqKT; Mon, 11 Oct 2021 20:59:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 226B7608EA;
	Mon, 11 Oct 2021 20:59:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33EE51BF279
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BA6A608B3
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TNIR5CXuZpRi for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 20:58:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F30A608DE
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 460A39541C; Mon, 11 Oct 2021 20:55:59 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 11 Oct 2021 22:57:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d799b658c94d1567d0f86e61c7be6da62b4c011d
X-Git-Newrev: ebde8da7ccb5f239823ed94a5816285a68e4f5a1
X-Patchwork-Hint: ignore
Message-Id: <20211011205559.460A39541C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lftp: fix build with OpenSSL
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ebde8da7ccb5f239823ed94a5816285a68e4f5a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream patch from master(0276d5c) that fixes build with OpenSSL.

Signed-off-by: Artem Panfilov <artemp@synopsys.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-with-LibreSSL-following-commit-537f37898.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch b/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
new file mode 100644
index 0000000000..8a40351b63
--- /dev/null
+++ b/package/lftp/0001-Fix-build-with-LibreSSL-following-commit-537f37898.patch
@@ -0,0 +1,46 @@
+From 0276d5c239c41b3a63f738a5dc47fd56ac389cf0 Mon Sep 17 00:00:00 2001
+From: Ganael Laplanche <ganael.laplanche@martymac.org>
+Date: Thu, 20 Aug 2020 12:29:05 +0200
+Subject: [PATCH] Fix build with LibreSSL (following commit 537f37898)
+
+Upstream status: https://github.com/lavv17/lftp/commit/0276d5c239c41b3a63f738a5dc47fd56ac389cf0
+Signed-off-by: Artem Panfilov <artemp@synopsys.com>
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
