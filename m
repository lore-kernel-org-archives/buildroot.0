Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78475C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DDC583FB3;
	Sat, 14 May 2022 09:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JBhO7jeFsyRp; Sat, 14 May 2022 09:53:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A9383F6E;
	Sat, 14 May 2022 09:53:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDBF21BF909
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97CF060F11
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nkwMmh0vTI8X for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D36DC60F24
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 81BA383769; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 447e6f08115f646242b5f5bd8fa7e51c5e96ab5b
X-Git-Newrev: e4a762bf7f1b5753730d73ccac9b059f79c81387
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.81BA383769@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: fix build with
 libressl >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4a762bf7f1b5753730d73ccac9b059f79c81387
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
   88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
      |                                                       ^~~~~~~~
crypto/hash/hmac_ossl.c:97:9: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
   97 |         HMAC_CTX_init(new_hmac_ctx);
      |         ^~~~~~~~~~~~~
      |         HMAC_CTX_new
crypto/hash/hmac_ossl.c: In function 'srtp_hmac_dealloc':
crypto/hash/hmac_ossl.c:130:5: warning: implicit declaration of function 'HMAC_CTX_cleanup' [-Wimplicit-function-declaration]
  130 |     HMAC_CTX_cleanup(hmac_ctx);
      |     ^~~~~~~~~~~~~~~~
crypto/hash/hmac_ossl.c:133:40: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
  133 |     octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
      |                                        ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e696ead9ffffa5bb80928d75607bfbb9b263d3c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...rypto-hash-hmac_ossl.c-fix-build-with-lib.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch b/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
new file mode 100644
index 0000000000..eb717fc26d
--- /dev/null
+++ b/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
@@ -0,0 +1,59 @@
+From c8cc6f1773ff370bb14bb963e2f632eef6d6a3c2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 12 May 2022 23:22:42 +0200
+Subject: [PATCH] libs/srtp/crypto/hash/hmac_ossl.c: fix build with libressl >=
+ 3.5.0
+
+Fix the following build failure with libressl >= 3.5.0:
+
+crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
+crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
+   88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
+      |                                                       ^~~~~~~~
+crypto/hash/hmac_ossl.c:97:9: warning: implicit declaration of function 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'? [-Wimplicit-function-declaration]
+   97 |         HMAC_CTX_init(new_hmac_ctx);
+      |         ^~~~~~~~~~~~~
+      |         HMAC_CTX_new
+crypto/hash/hmac_ossl.c: In function 'srtp_hmac_dealloc':
+crypto/hash/hmac_ossl.c:130:5: warning: implicit declaration of function 'HMAC_CTX_cleanup' [-Wimplicit-function-declaration]
+  130 |     HMAC_CTX_cleanup(hmac_ctx);
+      |     ^~~~~~~~~~~~~~~~
+crypto/hash/hmac_ossl.c:133:40: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
+  133 |     octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
+      |                                        ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e696ead9ffffa5bb80928d75607bfbb9b263d3c6
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libs/srtp/crypto/hash/hmac_ossl.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libs/srtp/crypto/hash/hmac_ossl.c b/libs/srtp/crypto/hash/hmac_ossl.c
+index 8146438b05..6730cbb35c 100644
+--- a/libs/srtp/crypto/hash/hmac_ossl.c
++++ b/libs/srtp/crypto/hash/hmac_ossl.c
+@@ -79,7 +79,8 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
+ 
+ /* OpenSSL 1.1.0 made HMAC_CTX an opaque structure, which must be allocated
+    using HMAC_CTX_new.  But this function doesn't exist in OpenSSL 1.0.x. */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+     {
+         /* allocate memory for auth and HMAC_CTX structures */
+         uint8_t *pointer;
+@@ -125,7 +126,8 @@ static srtp_err_status_t srtp_hmac_dealloc(srtp_auth_t *a)
+ 
+     hmac_ctx = (HMAC_CTX *)a->state;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
+     HMAC_CTX_cleanup(hmac_ctx);
+ 
+     /* zeroize entire state*/
+-- 
+2.35.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
