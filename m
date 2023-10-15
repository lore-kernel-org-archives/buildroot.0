Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE71CCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 09:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8AB6D40C96;
	Sun, 15 Oct 2023 09:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB6D40C96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSmBIQjyXEQE; Sun, 15 Oct 2023 09:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C7DD41468;
	Sun, 15 Oct 2023 09:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C7DD41468
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E48E1BF2F1
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7760F60B6A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 09:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7760F60B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zEAl8v8_3sFV for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 983B160B2B
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 983B160B2B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 859B3851E8; Sun, 15 Oct 2023 09:03:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 10:51:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99dbbcc1d51caf8203022cef0a74472737c527f4
X-Git-Newrev: 796ebbcf34298ef56ff63fc845cd97a5acb7dc8a
X-Patchwork-Hint: ignore
Message-Id: <20231015090300.859B3851E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nmap: fix build with libressl >=
 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=796ebbcf34298ef56ff63fc845cd97a5acb7dc8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...g-Crypto.cc-fix-build-with-libressl-3.5.0.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..f2bdf5904d
--- /dev/null
+++ b/package/nmap/0002-nping-Crypto.cc-fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,39 @@
+From 4ebea5c1d1a10be0d0165da3b9c0e1fa82c3db3c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 21 May 2022 17:51:37 +0200
+Subject: [PATCH] nping/Crypto.cc: fix build with libressl >= 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+Crypto.cc: In static member function 'static int Crypto::aes128_cbc_encrypt(u8*, size_t, u8*, u8*, size_t, u8*)':
+Crypto.cc:139:26: error: aggregate 'EVP_CIPHER_CTX ctx' has incomplete type and cannot be defined
+  139 |           EVP_CIPHER_CTX ctx;
+      |                          ^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2e6eebbe2ed8305b88047bc92c19350c1ecada16
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/nmap/nmap/pull/2480
+---
+ nping/Crypto.cc | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/nping/Crypto.cc b/nping/Crypto.cc
+index 850438352..9f7c88686 100644
+--- a/nping/Crypto.cc
++++ b/nping/Crypto.cc
+@@ -70,7 +70,9 @@
+ #include <openssl/evp.h>
+ #include <openssl/err.h>
+ 
+-#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && !defined LIBRESSL_VERSION_NUMBER
++#if (OPENSSL_VERSION_NUMBER >= 0x10100000L) && \
++	((!defined LIBRESSL_VERSION_NUMBER) || \
++	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER >= 0x30500000L))
+ #define HAVE_OPAQUE_EVP_PKEY 1
+ #define FUNC_EVP_MD_CTX_init EVP_MD_CTX_reset
+ #define FUNC_EVP_MD_CTX_cleanup EVP_MD_CTX_reset
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
