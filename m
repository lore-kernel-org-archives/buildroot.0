Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4781EB64DA
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 17:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 555954042B;
	Tue,  4 Jul 2023 17:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 555954042B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X827SGVgYyiv; Tue,  4 Jul 2023 17:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7538F4011B;
	Tue,  4 Jul 2023 17:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7538F4011B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C41D1BF30D
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 17:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8731408EA
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 17:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8731408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7L2kS0daz9rD for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 17:09:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891C6408E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 891C6408E9
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 17:09:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41751A4C0946
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 19:09:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49860)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGjWi-0005Tv-30
 for buildroot@buildroot.org; Tue, 04 Jul 2023 19:09:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  4 Jul 2023 19:09:20 +0200
Message-Id: <20230704170920.768669-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688490561;
 bh=n9oa7Rmf9w3SzKzSDsyjD2n61CgioN9SqKR5j2nViME=;
 h=From:To:Subject:Date:From;
 b=mXgyyW+BVP1JdHvpZSBwBR867vY23OCLr1iOdzxfRzMmTZqnqUbOUf0V+LPJ0YKl8
 LGjVcl3N9tNZ/bl2anBruNSQ5VosmRnmqIjKfNubp0IF9urZfATGN/iugfzzduFkhS
 m7egUnACCfkont8VgBTKd5VqsqHEu/KC7vAYrew0FOcJe9lqHFt3P4V58Q+e5JoxUt
 9sZikmgiyp+nrQ8/I4L0VRU7ruING1hbDrJXHygjJ2aerzxtedv5ljRjjStb75IIfc
 IGqUKuk6qBqDCWa3/JyNH0okE0N9948NtNfKBcTzzcBlFDlMfUjYP0Uyx2ajg0mpHY
 gJfcPoURSx9sg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=mXgyyW+B
Subject: [Buildroot] [PATCH 1/1] package/libssh2: fix build with mbedtls
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
http://autobuild.buildroot.net/results/3f2/3f295deaee31266f394035924ec0192edcca4b1e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...more-size_t-to-sync-up-with-crypto-h.patch | 106 ++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 package/libssh2/0001-mbedtls-use-more-size_t-to-sync-up-with-crypto-h.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
