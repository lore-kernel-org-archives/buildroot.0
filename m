Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29008C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF9660FA5;
	Wed, 27 Apr 2022 19:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCXNczCV5VZb; Wed, 27 Apr 2022 19:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA11260C18;
	Wed, 27 Apr 2022 19:42:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 196BD1BF9B6
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A56D14010D
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9HiWuXmSVrEj for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C85CA4046A
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:41:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2059384600; Wed, 27 Apr 2022 19:30:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 21:03:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d608368e1a98dd7f41d51214669149115a8f73aa
X-Git-Newrev: 999edde7dfdf574d7a25ad6e69900b2e1f8ceb0b
X-Patchwork-Hint: ignore
Message-Id: <20220427193053.2059384600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsrtp: fix build with libressl
 >= 3.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=999edde7dfdf574d7a25ad6e69900b2e1f8ceb0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

crypto/hash/hmac_ossl.c: In function 'srtp_hmac_alloc':
crypto/hash/hmac_ossl.c:88:55: error: invalid application of 'sizeof' to incomplete type 'HMAC_CTX' {aka 'struct hmac_ctx_st'}
   88 |         pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
      |                                                       ^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c346780ed664c9fe8c7112e4c256cfe8080a7af5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch b/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
new file mode 100644
index 0000000000..68bfb085f7
--- /dev/null
+++ b/package/libsrtp/0001-Remove-compatibility-code-for-legacy-OpenSSL-to-fix-LibreSSL-build.patch
@@ -0,0 +1,86 @@
+From 16483b18a9980575bee23898b2dbfbe2a4675d84 Mon Sep 17 00:00:00 2001
+From: Klemens Nanni <kn@openbsd.org>
+Date: Sat, 15 Jan 2022 23:19:35 +0300
+Subject: [PATCH] Remove compatibility code for legacy OpenSSL to fix LibreSSL
+ build
+
+In current LibreSSL, `HMAC_CTX` aka. `struct hmac_ctx_st` is an opaque
+structure as of LibreSSL hmac.h revision 1.15 (14.01.2022) [0], thus
+`sizeof(HMAC_CTX)` fails to compile.
+
+The non-legacy code path should compile with LibreSSL versions as old
+as 2.7.0 (21.03.2018).
+
+Found while building https://github.com/desktop-app/tg_owt which bundles
+libsrtp 2.2.0 [1] on OpenBSD 7.0 -CURRENT/with latest LibreSSL.
+
+Suggestion to remove the legacy code from Theo Buehler, thanks.
+
+0: http://cvsweb.openbsd.org/cgi-bin/cvsweb/src/lib/libcrypto/hmac/hmac.h?rev=1.15&content-type=text/x-cvsweb-markup
+1: https://github.com/desktop-app/tg_owt/blob/6708e0d31a73e64fe12f54829bf4060c41b2658e/src/third_party/libsrtp/crypto/hash/hmac_ossl.c#L85
+
+[Retrieved from:
+https://github.com/cisco/libsrtp/commit/16483b18a9980575bee23898b2dbfbe2a4675d84]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ crypto/hash/hmac_ossl.c | 29 -----------------------------
+ 1 file changed, 29 deletions(-)
+
+diff --git a/crypto/hash/hmac_ossl.c b/crypto/hash/hmac_ossl.c
+index ee6b0b58..c23c7f21 100644
+--- a/crypto/hash/hmac_ossl.c
++++ b/crypto/hash/hmac_ossl.c
+@@ -78,26 +78,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
+         return srtp_err_status_bad_param;
+     }
+ 
+-/* OpenSSL 1.1.0 made HMAC_CTX an opaque structure, which must be allocated
+-   using HMAC_CTX_new.  But this function doesn't exist in OpenSSL 1.0.x. */
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
+-    {
+-        /* allocate memory for auth and HMAC_CTX structures */
+-        uint8_t *pointer;
+-        HMAC_CTX *new_hmac_ctx;
+-        pointer = (uint8_t *)srtp_crypto_alloc(sizeof(HMAC_CTX) +
+-                                               sizeof(srtp_auth_t));
+-        if (pointer == NULL) {
+-            return srtp_err_status_alloc_fail;
+-        }
+-        *a = (srtp_auth_t *)pointer;
+-        (*a)->state = pointer + sizeof(srtp_auth_t);
+-        new_hmac_ctx = (HMAC_CTX *)((*a)->state);
+-
+-        HMAC_CTX_init(new_hmac_ctx);
+-    }
+-
+-#else
+     *a = (srtp_auth_t *)srtp_crypto_alloc(sizeof(srtp_auth_t));
+     if (*a == NULL) {
+         return srtp_err_status_alloc_fail;
+@@ -109,7 +89,6 @@ static srtp_err_status_t srtp_hmac_alloc(srtp_auth_t **a,
+         *a = NULL;
+         return srtp_err_status_alloc_fail;
+     }
+-#endif
+ 
+     /* set pointers */
+     (*a)->type = &srtp_hmac;
+@@ -126,18 +105,10 @@ static srtp_err_status_t srtp_hmac_dealloc(srtp_auth_t *a)
+ 
+     hmac_ctx = (HMAC_CTX *)a->state;
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || LIBRESSL_VERSION_NUMBER
+-    HMAC_CTX_cleanup(hmac_ctx);
+-
+-    /* zeroize entire state*/
+-    octet_string_set_to_zero(a, sizeof(HMAC_CTX) + sizeof(srtp_auth_t));
+-
+-#else
+     HMAC_CTX_free(hmac_ctx);
+ 
+     /* zeroize entire state*/
+     octet_string_set_to_zero(a, sizeof(srtp_auth_t));
+-#endif
+ 
+     /* free memory */
+     srtp_crypto_free(a);
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
