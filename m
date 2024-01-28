Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8E6C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 16:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0EBF410DF;
	Sun, 28 Jan 2024 16:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0EBF410DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WiiqDi7PiTiB; Sun, 28 Jan 2024 16:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EF59410E1;
	Sun, 28 Jan 2024 16:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF59410E1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23EB81BF2F5
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 16:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F01BC60761
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 16:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F01BC60761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qyucJQsapb0g for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 16:41:55 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93C8F60757
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 16:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93C8F60757
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F263A4C0327
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 17:41:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54630)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rU8EB-000000001Lm-0BOA
 for buildroot@buildroot.org; Sun, 28 Jan 2024 17:41:51 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Jan 2024 17:41:51 +0100
Message-Id: <20240128164151.283361-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706460111;
 bh=ozbmbiKTYLp5RmkZGNY/xNTVsg+61R7p2UV9iRO3WsI=;
 h=From:To:Subject:Date:From;
 b=p9fYADUq2WH55iT5k6hmRhPFERjhLsie/lYBEmNJ3wU4xZBcqrFdf1q8S84ncE2KL
 OCZ8Z354Gf84vUGuZp7NLS5ZQekeG7NmlJ1ChDYEPs50jpuf/rEq6nafyvM5EcuZdw
 XaJtTWsuFczJ+ZXHXfVAArXujh0pMuwd5jEzm08JpIzf6yBtmOgzIVzAZISmoqDd6C
 W4iXw+snowoJg/7u/YQFrWvtXknAWGYQelyyKhNeH1x9jcvgXn06PQKlnzJgfZwggM
 5SETeQv5ILysm5EzVx0VWt5ZOj2PRulMtufWt+LeEIaH5rQsfE30KJjm4V6h1fY1tB
 ghfQPO8rCYD7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=p9fYADUq
Subject: [Buildroot] [PATCH 1/1] package/tor: Fix build with libressl >=
 3.8.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/85c/85cde3bcd12fb5adafb94c85d5fa636e1b5b9068/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...t-define-DISABLE_ENGINES-after-OPENS.patch | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch

diff --git a/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
new file mode 100644
index 0000000000..f46acb28c8
--- /dev/null
+++ b/package/tor/0001-crypt_openssl_mgt-define-DISABLE_ENGINES-after-OPENS.patch
@@ -0,0 +1,61 @@
+From 48f8d6918977673125d53a85d19d709136106739 Mon Sep 17 00:00:00 2001
+From: orbea <orbea@riseup.net>
+Date: Thu, 31 Aug 2023 14:35:52 -0700
+Subject: [PATCH] crypt_openssl_mgt: define DISABLE_ENGINES after
+ OPENSSL_NO_ENGINE
+
+With LibreSSL-3.8.1 these engines are no long available causing a build
+failure, but LibreSSL correctly defines OPENSSL_NO_ENGINE as part of its
+opensslfeatures.h. However Tor includes crypto_openssl_mgt.h before any
+of the openssl includes which would define OPENSSL_NO_ENGINE and then
+fails to define DISABLE_ENGINES.
+
+As the define is used in only a single .c file it is best to move it
+there.
+
+Signed-off-by: orbea <orbea@riseup.net>
+
+Upstream:
+https://gitlab.torproject.org/tpo/core/tor/-/commit/48f8d6918977673125d53a85d19d709136106739
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lib/crypt_ops/crypto_openssl_mgt.c | 5 +++++
+ src/lib/crypt_ops/crypto_openssl_mgt.h | 5 -----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.c b/src/lib/crypt_ops/crypto_openssl_mgt.c
+index 6c01cb6aa8..ca12a82518 100644
+--- a/src/lib/crypt_ops/crypto_openssl_mgt.c
++++ b/src/lib/crypt_ops/crypto_openssl_mgt.c
+@@ -40,6 +40,11 @@ ENABLE_GCC_WARNING("-Wredundant-decls")
+ 
+ #include <string.h>
+ 
++#ifdef OPENSSL_NO_ENGINE
++/* Android's OpenSSL seems to have removed all of its Engine support. */
++#define DISABLE_ENGINES
++#endif
++
+ #ifndef NEW_THREAD_API
+ /** A number of preallocated mutexes for use by OpenSSL. */
+ static tor_mutex_t **openssl_mutexes_ = NULL;
+diff --git a/src/lib/crypt_ops/crypto_openssl_mgt.h b/src/lib/crypt_ops/crypto_openssl_mgt.h
+index 96a37721dd..eac0ec1977 100644
+--- a/src/lib/crypt_ops/crypto_openssl_mgt.h
++++ b/src/lib/crypt_ops/crypto_openssl_mgt.h
+@@ -49,11 +49,6 @@
+ #define OPENSSL_V_SERIES(a,b,c) \
+   OPENSSL_VER((a),(b),(c),0,0)
+ 
+-#ifdef OPENSSL_NO_ENGINE
+-/* Android's OpenSSL seems to have removed all of its Engine support. */
+-#define DISABLE_ENGINES
+-#endif
+-
+ #if OPENSSL_VERSION_NUMBER >= OPENSSL_VER(1,1,0,0,5)
+ /* OpenSSL as of 1.1.0pre4 has an "new" thread API, which doesn't require
+  * setting up various callbacks.
+-- 
+GitLab
+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
