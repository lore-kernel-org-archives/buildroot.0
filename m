Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C97CC83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 10:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E064F60AAD;
	Sun,  6 Jul 2025 10:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2a0lDfTxx-Pb; Sun,  6 Jul 2025 10:08:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19FCA60756
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19FCA60756;
	Sun,  6 Jul 2025 10:08:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41FDD19C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28B1140C09
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f1WPRERuZF7g for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 10:08:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBE9A40C6C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE9A40C6C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBE9A40C6C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 10:08:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4c9.dip0.t-ipconnect.de [79.214.196.201])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12FDEA4C38D3
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 12:07:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55904)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uYMHs-0000000071c-0Itm
 for buildroot@buildroot.org; Sun, 06 Jul 2025 10:07:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Jul 2025 12:07:55 +0200
Message-Id: <20250706100755.800002-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751796476;
 bh=wY1oE0qfb+hFy6QkN24K/ElG9rjyhq3x6rG8leEvdEY=;
 h=From:To:Subject:Date:From;
 b=KVFYSn+qrPsigLnkmX+cgPjzlHGHS0rSdN+W4NKejJnDWXjNMVxtIA0e7nlYQfpDw
 TBEF4R8qdkC1KnaRO//z4y7M1XlNHsMxSwwSIQ/CjKo8kJYKvqA8iJVKfOqJi0/EnZ
 LLBcWvoIHvi5+AvTYHkROBJNoIngWyI7+TQOCFiQEblWav/+DkhiFpbOkuv7juc0YB
 rhoE7LLMwTRhchVU147vDeyOhwymmIxgLy6bbw2rL5n7gepCh0MsTkBzb6Db8d8HIp
 VSpCJEwS4Yv8SpUGm3Bc96LWmjbG3SgZ4PcoeBVMj/Fb84BoCyrmCNGJ02jcj2AALb
 vK5bkF+sYRjDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=KVFYSn+q
Subject: [Buildroot] [PATCH] package/tor: bump version to 0.4.8.17
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
https://gitlab.torproject.org/tpo/core/tor/-/raw/release-0.4.8/ReleaseNotes
https://forum.torproject.org/t/stable-release-0-4-8-17/19681

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...t-define-DISABLE_ENGINES-after-OPENS.patch | 58 -------------------
 package/tor/tor.hash                          |  4 +-
 package/tor/tor.mk                            |  2 +-
 3 files changed, 3 insertions(+), 61 deletions(-)
 delete mode 100644 package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch

diff --git a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
deleted file mode 100644
index f8ad803203..0000000000
--- a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 48f8d6918977673125d53a85d19d709136106739 Mon Sep 17 00:00:00 2001
-From: orbea <orbea@riseup.net>
-Date: Thu, 31 Aug 2023 14:35:52 -0700
-Subject: [PATCH] crypt_openssl_mgt: define DISABLE_ENGINES after
- OPENSSL_NO_ENGINE
-
-With LibreSSL-3.8.1 these engines are no long available causing a build
-failure, but LibreSSL correctly defines OPENSSL_NO_ENGINE as part of its
-opensslfeatures.h. However Tor includes crypto_openssl_mgt.h before any
-of the openssl includes which would define OPENSSL_NO_ENGINE and then
-fails to define DISABLE_ENGINES.
-
-As the define is used in only a single .c file it is best to move it
-there.
-
-Signed-off-by: orbea <orbea@riseup.net>
-Upstream: https://gitlab.torproject.org/tpo/core/tor/-/commit/48f8d6918977673125d53a85d19d709136106739
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/lib/crypt_ops/crypto_openssl_mgt.c | 5 +++++
- src/lib/crypt_ops/crypto_openssl_mgt.h | 5 -----
- 2 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.c b/src/lib/crypt_ops/crypto_openssl_mgt.c
-index 6c01cb6aa8..ca12a82518 100644
---- a/src/lib/crypt_ops/crypto_openssl_mgt.c
-+++ b/src/lib/crypt_ops/crypto_openssl_mgt.c
-@@ -40,6 +40,11 @@ ENABLE_GCC_WARNING("-Wredundant-decls")
-
- #include <string.h>
-
-+#ifdef OPENSSL_NO_ENGINE
-+/* Android's OpenSSL seems to have removed all of its Engine support. */
-+#define DISABLE_ENGINES
-+#endif
-+
- #ifndef NEW_THREAD_API
- /** A number of preallocated mutexes for use by OpenSSL. */
- static tor_mutex_t **openssl_mutexes_ = NULL;
-diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.h b/src/lib/crypt_ops/crypto_openssl_mgt.h
-index 96a37721dd..eac0ec1977 100644
---- a/src/lib/crypt_ops/crypto_openssl_mgt.h
-+++ b/src/lib/crypt_ops/crypto_openssl_mgt.h
-@@ -49,11 +49,6 @@
- #define OPENSSL_V_SERIES(a,b,c) \
-   OPENSSL_VER((a),(b),(c),0,0)
-
--#ifdef OPENSSL_NO_ENGINE
--/* Android's OpenSSL seems to have removed all of its Engine support. */
--#define DISABLE_ENGINES
--#endif
--
- #if OPENSSL_VERSION_NUMBER >= OPENSSL_VER(1,1,0,0,5)
- /* OpenSSL as of 1.1.0pre4 has an "new" thread API, which doesn't require
-  * setting up various callbacks.
---
-GitLab
-
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 34c7c0f097..55c915ef4d 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.16.tar.gz.sha256sum
-sha256  6540dd377a120fb8e7d27530aa3b7ff72a0fa5b4f670fe1d64c987c1cfd390cb  tor-0.4.8.16.tar.gz
+# From https://dist.torproject.org/tor-0.4.8.17.tar.gz.sha256sum
+sha256  79b4725e1d4b887b9e68fd09b0d2243777d5ce3cd471e538583bcf6f9d8cdb56  tor-0.4.8.17.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 5f376d136f..399d4b481f 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.16
+TOR_VERSION = 0.4.8.17
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
