Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DCAEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37503610A6;
	Thu,  6 Jul 2023 08:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37503610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jP43CuxXvYZl; Thu,  6 Jul 2023 08:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 687FC610D2;
	Thu,  6 Jul 2023 08:32:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 687FC610D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87D421BF575
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FE8D610A6
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FE8D610A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gQbS0cCg_hyv for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:31:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52653610BD
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52653610BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CD9A8671C; Thu,  6 Jul 2023 08:31:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 10:31:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f059c876f76ebef26802b5476dffcf8a17799f38
X-Git-Newrev: a932fbed9c230310189f72a1f4f5c0cbe173a17e
X-Patchwork-Hint: ignore
Message-Id: <20230706083156.3CD9A8671C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libssh2: fix build with mbedtls
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

commit: https://git.buildroot.net/buildroot/commit/?id=a932fbed9c230310189f72a1f4f5c0cbe173a17e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/3f2/3f295deaee31266f394035924ec0192edcca4b1e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-use-more-size_t-to-sync-up-with-crypto-h.patch | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch b/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch
new file mode 100644
index 0000000000..3cac133864
--- /dev/null
+++ b/package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch
@@ -0,0 +1,106 @@
+From 1153ebdeba563ac657b525edd6bf6da68b1fe5e2 Mon Sep 17 00:00:00 2001
+From: Viktor Szakats <commit@vsz.me>
+Date: Tue, 30 May 2023 17:28:03 +0000
+Subject: [PATCH] mbedtls: use more `size_t` to sync up with `crypto.h`
+
+Ref: 5a96f494ee0b00282afb2db2e091246fc5e1774a #846 #879
+
+Fixes #1053
+Closes #1054
+
+Upstream: https://github.com/libssh2/libssh2/commit/1153ebdeba563ac657b525edd6bf6da68b1fe5e2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/mbedtls.c | 14 ++++++++------
+ src/mbedtls.h | 13 ++++++-------
+ 2 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/src/mbedtls.c b/src/mbedtls.c
+index e387cdb19..cd14a4bd8 100644
+--- a/src/mbedtls.c
++++ b/src/mbedtls.c
+@@ -186,7 +186,7 @@ _libssh2_mbedtls_cipher_dtor(_libssh2_cipher_ctx *ctx)
+ int
+ _libssh2_mbedtls_hash_init(mbedtls_md_context_t *ctx,
+                            mbedtls_md_type_t mdtype,
+-                           const unsigned char *key, unsigned long keylen)
++                           const unsigned char *key, size_t keylen)
+ {
+     const mbedtls_md_info_t *md_info;
+     int ret, hmac;
+@@ -221,7 +221,7 @@ _libssh2_mbedtls_hash_final(mbedtls_md_context_t *ctx, unsigned char *hash)
+ }
+ 
+ int
+-_libssh2_mbedtls_hash(const unsigned char *data, unsigned long datalen,
++_libssh2_mbedtls_hash(const unsigned char *data, size_t datalen,
+                       mbedtls_md_type_t mdtype, unsigned char *hash)
+ {
+     const mbedtls_md_info_t *md_info;
+@@ -497,8 +497,9 @@ int
+ _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
+                                  size_t hash_len,
+                                  const unsigned char *sig,
+-                                 unsigned long sig_len,
+-                                 const unsigned char *m, unsigned long m_len)
++                                 size_t sig_len,
++                                 const unsigned char *m,
++                                 size_t m_len)
+ {
+     int ret;
+     int md_type;
+@@ -548,8 +549,9 @@ _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
+ int
+ _libssh2_mbedtls_rsa_sha1_verify(libssh2_rsa_ctx * rsactx,
+                                  const unsigned char *sig,
+-                                 unsigned long sig_len,
+-                                 const unsigned char *m, unsigned long m_len)
++                                 size_t sig_len,
++                                 const unsigned char *m,
++                                 size_t m_len)
+ {
+     return _libssh2_mbedtls_rsa_sha2_verify(rsactx, SHA_DIGEST_LENGTH,
+                                             sig, sig_len, m, m_len);
+diff --git a/src/mbedtls.h b/src/mbedtls.h
+index d9592f721..03484da17 100644
+--- a/src/mbedtls.h
++++ b/src/mbedtls.h
+@@ -478,12 +478,12 @@ _libssh2_mbedtls_cipher_dtor(_libssh2_cipher_ctx *ctx);
+ int
+ _libssh2_mbedtls_hash_init(mbedtls_md_context_t *ctx,
+                            mbedtls_md_type_t mdtype,
+-                           const unsigned char *key, unsigned long keylen);
++                           const unsigned char *key, size_t keylen);
+ 
+ int
+ _libssh2_mbedtls_hash_final(mbedtls_md_context_t *ctx, unsigned char *hash);
+ int
+-_libssh2_mbedtls_hash(const unsigned char *data, unsigned long datalen,
++_libssh2_mbedtls_hash(const unsigned char *data, size_t datalen,
+                       mbedtls_md_type_t mdtype, unsigned char *hash);
+ 
+ _libssh2_bn *
+@@ -526,9 +526,8 @@ _libssh2_mbedtls_rsa_new_private_frommemory(libssh2_rsa_ctx **rsa,
+ int
+ _libssh2_mbedtls_rsa_sha1_verify(libssh2_rsa_ctx *rsa,
+                                  const unsigned char *sig,
+-                                 unsigned long sig_len,
+-                                 const unsigned char *m,
+-                                 unsigned long m_len);
++                                 size_t sig_len,
++                                 const unsigned char *m, size_t m_len);
+ int
+ _libssh2_mbedtls_rsa_sha1_sign(LIBSSH2_SESSION *session,
+                                libssh2_rsa_ctx *rsa,
+@@ -540,8 +539,8 @@ int
+ _libssh2_mbedtls_rsa_sha2_verify(libssh2_rsa_ctx * rsactx,
+                                  size_t hash_len,
+                                  const unsigned char *sig,
+-                                 unsigned long sig_len,
+-                                 const unsigned char *m, unsigned long m_len);
++                                 size_t sig_len,
++                                 const unsigned char *m, size_t m_len);
+ int
+ _libssh2_mbedtls_rsa_sha2_sign(LIBSSH2_SESSION *session,
+                                libssh2_rsa_ctx *rsa,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
