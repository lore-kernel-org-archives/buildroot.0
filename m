Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F8EC6FA8E
	for <buildroot@archiver.kernel.org>; Sun,  5 Mar 2023 17:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B30F414C2;
	Sun,  5 Mar 2023 17:42:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B30F414C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5O3_JP04tLI7; Sun,  5 Mar 2023 17:42:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E462410E0;
	Sun,  5 Mar 2023 17:42:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E462410E0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8123A1BF488
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 491C260E1D
 for <buildroot@lists.busybox.net>; Sun,  5 Mar 2023 17:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 491C260E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UL0RZ0Fb_6sT for <buildroot@lists.busybox.net>;
 Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C5EE60E62
 for <buildroot@buildroot.org>; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C5EE60E62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19B7486328; Sun,  5 Mar 2023 17:39:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Mar 2023 18:37:29 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 1c00bbd2e7e382bd8a01209ee320d8fe765a51c0
X-Git-Newrev: b4b32468cb0477f35af782e9c195daf42accff77
X-Patchwork-Hint: ignore
Message-Id: <20230305173948.19B7486328@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/erlang: fix build
 with libressl >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4b32468cb0477f35af782e9c195daf42accff77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix the following build failure with libressl >= 3.5.0 raised since bump
to version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

api_ng.c: In function 'EVP_CIPHER_CTX_copy':
api_ng.c:392:28: error: invalid use of incomplete typedef 'EVP_CIPHER_CTX' {aka 'const struct evp_cipher_ctx_st'}
  392 |     if ((in == NULL) || (in->cipher == NULL))
      |                            ^~

Fixes:
 - http://autobuild.buildroot.org/results/90f7365d8477d35fca452b7b3f38babba086375e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26254066439596b88783b80a3a87f67570c0b0b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-crypto-Fixes-for-LibreSSL-3-5-0.patch     | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch b/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch
new file mode 100644
index 0000000000..84c75fef83
--- /dev/null
+++ b/package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch
@@ -0,0 +1,30 @@
+From 8e5170d79e387d7e898d948a78e0c70407a4030c Mon Sep 17 00:00:00 2001
+From: Hans Nilsson <hans@erlang.org>
+Date: Mon, 14 Feb 2022 15:51:35 +0100
+Subject: [PATCH] crypto: Fixes for LibreSSL 3.5.0
+
+[Retrieved (and backported) from:
+https://github.com/erlang/otp/commit/8e5170d79e387d7e898d948a78e0c70407a4030c]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/crypto/c_src/openssl_config.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/lib/crypto/c_src/openssl_config.h b/lib/crypto/c_src/openssl_config.h
+index 6fdd049fb30a..39e4b2d9d7c0 100644
+--- a/lib/crypto/c_src/openssl_config.h
++++ b/lib/crypto/c_src/openssl_config.h
+@@ -122,7 +122,14 @@
+ # endif
+ #endif
+ 
++#ifdef HAS_LIBRESSL
++# if LIBRESSL_VERSION_NUMBER >= 0x3050000fL
++#  define HAS_EVP_PKEY_CTX
++#  define HAVE_EVP_CIPHER_CTX_COPY
++# endif
++#endif
++
+ #ifndef HAS_LIBRESSL
+ # if OPENSSL_VERSION_NUMBER >= PACKED_OPENSSL_VERSION_PLAIN(1,0,0)
+ #  define HAS_EVP_PKEY_CTX
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
