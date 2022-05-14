Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6866C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 754D940C6B;
	Sat, 14 May 2022 09:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNHD9zATyQui; Sat, 14 May 2022 09:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E3CF40C6D;
	Sat, 14 May 2022 09:51:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7824D1BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64F7F40A62
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJUjRcOR6P_k for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A66C5400EF
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5539683769; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:37:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16d773bc4f126c63705ba303b2326ce5e794f64e
X-Git-Newrev: d4195f10b474b06592beabaca7500c2696257273
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.5539683769@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: fix build with
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4195f10b474b06592beabaca7500c2696257273
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c: In function 'dh_generate_keypair':
/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c:149:7: error: dereferencing pointer to incomplete type 'DH' {aka 'struct dh_st'}
  149 |     dh->p = BN_bin2bn(prime, keylen, NULL);
      |       ^~

Fixes:
 - http://autobuild.buildroot.org/results/49b3940b9d0432cb5fb0c5d22dfa017b18c6e233

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...to_openssl.c-fix-build-with-libressl-3.5..patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch b/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
new file mode 100644
index 0000000000..110976c4bb
--- /dev/null
+++ b/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
@@ -0,0 +1,66 @@
+From 97fbbd678b2012e64acddd523677bc55a177bc58 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 12 May 2022 20:41:50 +0200
+Subject: [PATCH] common/crypto_openssl.c: fix build with libressl >= 3.5.0
+ (#522)
+
+Fix the following build failure with libressl >= 3.5.0:
+
+/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c: In function 'dh_generate_keypair':
+/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c:149:7: error: dereferencing pointer to incomplete type 'DH' {aka 'struct dh_st'}
+  149 |     dh->p = BN_bin2bn(prime, keylen, NULL);
+      |       ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/49b3940b9d0432cb5fb0c5d22dfa017b18c6e233
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/LibVNC/libvncserver/commit/97fbbd678b2012e64acddd523677bc55a177bc58]
+---
+ common/crypto_openssl.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/common/crypto_openssl.c b/common/crypto_openssl.c
+index 60d4bd4df..51d7ec2d9 100644
+--- a/common/crypto_openssl.c
++++ b/common/crypto_openssl.c
+@@ -138,14 +138,16 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
+ {
+     int result = 0;
+     DH *dh;
+-#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L || \
++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000)
+     const BIGNUM *pub_key = NULL;
+     const BIGNUM *priv_key = NULL;
+ #endif
+ 
+     if(!(dh = DH_new()))
+ 	goto out;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
+     dh->p = BN_bin2bn(prime, keylen, NULL);
+     dh->g = BN_bin2bn(gen, gen_len, NULL);
+ #else
+@@ -154,7 +156,8 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
+ #endif
+     if(!DH_generate_key(dh))
+ 	goto out;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
+     if(BN_bn2bin(dh->priv_key, priv_out) == 0)
+ 	goto out;
+     if(BN_bn2bin(dh->pub_key, pub_out) == 0)
+@@ -181,7 +184,8 @@ int dh_compute_shared_key(uint8_t *shared_out, const uint8_t *priv, const uint8_
+ 
+     if(!(dh = DH_new()))
+ 	goto out;
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
++	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER < 0x30500000)
+     dh->p = BN_bin2bn(prime, keylen, NULL);
+     dh->priv_key = BN_bin2bn(priv, keylen, NULL);
+ #else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
