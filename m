Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC13C05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18D3540BC8;
	Tue, 14 Feb 2023 17:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18D3540BC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73eUdNE1WLrJ; Tue, 14 Feb 2023 17:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C64B40B92;
	Tue, 14 Feb 2023 17:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C64B40B92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0221BF4DB
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 718F340673
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 718F340673
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8omb6ItjM0s2 for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B09E4071E
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B09E4071E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 712EC85E1D; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 17:59:00 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ab94614e7d5b2076433aef665bc0186e4e477df9
X-Git-Newrev: 016b0adec19704b3e28456a3f237c0a20d978fe4
X-Patchwork-Hint: ignore
Message-Id: <20230214170848.712EC85E1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/freeswitch: fix
 build with libressl >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=016b0adec19704b3e28456a3f237c0a20d978fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
(cherry picked from commit e4a762bf7f1b5753730d73ccac9b059f79c81387)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
