Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E19C433FE
	for <buildroot@archiver.kernel.org>; Fri,  4 Nov 2022 16:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAAF56113F;
	Fri,  4 Nov 2022 16:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAAF56113F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-yCTMQ1WU7j; Fri,  4 Nov 2022 16:19:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C691E61135;
	Fri,  4 Nov 2022 16:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C691E61135
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA6CF1BF34D
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 16:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89F9941947
 for <buildroot@lists.busybox.net>; Fri,  4 Nov 2022 16:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89F9941947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yx3iikC9xtX8 for <buildroot@lists.busybox.net>;
 Fri,  4 Nov 2022 16:18:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B583441944
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B583441944
 for <buildroot@buildroot.org>; Fri,  4 Nov 2022 16:18:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id bk15so7696299wrb.13
 for <buildroot@buildroot.org>; Fri, 04 Nov 2022 09:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ei34A79U1Q/z75nJla8I+tgAKL2VHlqEdAniLFDja64=;
 b=stz+dvFOnA+k/jWkeQo/O6olVZEp3S4v4QbjNq0wnrTh9Ic5doLTxM5WR+zD1fAWsp
 sTdA1/VN6eqPiLcL+nyMMBr6ziwI+MMzLhk8Z/z1EUJ3PZuLvm2ANBvAbp/sre0sjC1h
 Xb2h9UwUnwW2i9PIT2C5uWe2uqICQ4QEUQIN9fhPT8OxF5a7y3HxBcEJ4YiXW+C+61hW
 ihVC8ItgtJHi21G7Gvb1FY/ZBK9kwLoERD5vkNowGLhSk8VAFR/Bcr44yRzbKOlwgn8q
 /5q/cOF7gpCmygWRruS3LrJ9DngzG0b5bnTlUNuXQM3SqDKffYXnNPnYfsZvi4XUOYqi
 CDoQ==
X-Gm-Message-State: ACrzQf0A3QssXhxm9THo26y+FG+v9gpupvDfZ43yFhNXgS3c0GPO3IBk
 ywdzczb7UnCMZ4d3DN0qSzIlH0eBano=
X-Google-Smtp-Source: AMsMyM6Z+DctqJZzDK/9EJRQP6H8Jm7KS7AE3inu/iiXcj5uY5C8AOA9rA2otXXt50kGXHaQgD5LPw==
X-Received: by 2002:a05:6000:993:b0:236:adbe:f54f with SMTP id
 by19-20020a056000099300b00236adbef54fmr23057169wrb.86.1667578734334; 
 Fri, 04 Nov 2022 09:18:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n17-20020a05600c4f9100b003c701c12a17sm3579981wmq.12.2022.11.04.09.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:18:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  4 Nov 2022 17:18:51 +0100
Message-Id: <20221104161851.645974-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ei34A79U1Q/z75nJla8I+tgAKL2VHlqEdAniLFDja64=;
 b=QoB1ZC90vMVFel1c9j/Pe9y9bLJKXgqtTPQLBmUy42pLmj+udBAuYhG3XHZccFk2UL
 zlV9/h4Nq37FWOFU3krZNa5uqtBX1lQ7LutMGgIGPLIkn2kbku9pP0l4EPZW3jgyAnUf
 c6GwVILosvBidX3Y8pcUb9MczbIHXHu2M89whZRYPW+KevRHrCFSHYjpT8a75xLZ7hoK
 pvVYO+q5c/xfgazOuJGDEn8loShmG9MbWWv0p/6d2Q0MsW4DctqeMo9VA+5jioMbJoH6
 r1cffi+lX644FZZ1ZX+lwdbwrMfOG3vRs2Qn1v0erIgLwOdYadnOawRNUqUG6bzYe73d
 4GuQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QoB1ZC90
Subject: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.8
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed a vulnerability related to online certificate revocation checking
that was caused because the revocation plugin used potentially untrusted
OCSP URIs and CRL distribution points in certificates. This allowed a
remote attacker to initiate IKE_SAs and send crafted certificates that
contain URIs pointing to servers under their control, which could have
lead to a denial-of-service attack. This vulnerability has been
registered as CVE-2022-40617.

Drop patch (already in version)

https://www.strongswan.org/blog/2022/10/03/strongswan-vulnerability-(cve-2022-40617).html
https://github.com/strongswan/strongswan/releases/tag/5.9.6
https://github.com/strongswan/strongswan/releases/tag/5.9.7
https://github.com/strongswan/strongswan/releases/tag/5.9.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...gswan-plugins-wolfssl-rename-encrypt.patch | 150 ------------------
 package/strongswan/strongswan.hash            |   6 +-
 package/strongswan/strongswan.mk              |   2 +-
 3 files changed, 4 insertions(+), 154 deletions(-)
 delete mode 100644 package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch

diff --git a/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch b/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
deleted file mode 100644
index 7b47b3278b..0000000000
--- a/package/strongswan/0001-src-libstrongswan-plugins-wolfssl-rename-encrypt.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 5900426a710eaa65a27784687775e331bcb0489b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 8 Aug 2022 09:52:19 +0200
-Subject: [PATCH] wolfssl: Rename `encrypt` methods to avoid conflicts with
- system headers
-
-Rename `encrypt` methods to avoid the following build failure when wolfSSL
-is built with --enable-opensslextra:
-
-In file included from ../../../../src/libstrongswan/utils/utils.h:59,
-                 from ../../../../src/libstrongswan/library.h:101,
-                 from wolfssl_common.h:29,
-                 from wolfssl_aead.c:23:
-wolfssl_aead.c:90:16: error: conflicting types for 'encrypt'; have '_Bool(union <anonymous>,  chunk_t,  chunk_t,  chunk_t,  chunk_t *)'
-   90 | METHOD(aead_t, encrypt, bool,
-      |                ^~~~~~~
-../../../../src/libstrongswan/utils/utils/object.h:99:20: note: in definition of macro 'METHOD'
-   99 |         static ret name(union {iface *_public; this;} \
-      |                    ^~~~
-In file included from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/wc_port.h:573,
-                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/types.h:35,
-                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/wolfcrypt/logging.h:33,
-                 from /home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/wolfssl/ssl.h:35,
-                 from wolfssl_common.h:64,
-                 from wolfssl_aead.c:23:
-/home/autobuild/autobuild/instance-5/output-1/host/powerpc64le-buildroot-linux-musl/sysroot/usr/include/unistd.h:149:6: note: previous declaration of 'encrypt' with type 'void(char *, int)'
-  149 | void encrypt(char *, int);
-      |      ^~~~~~~
-
-Closes strongswan/strongswan#1201
-[Retrieved from:
-https://github.com/strongswan/strongswan/commit/5900426a710eaa65a27784687775e331bcb0489b]
----
- src/libstrongswan/plugins/wolfssl/wolfssl_aead.c           | 4 ++--
- src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c        | 4 ++--
- src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c  | 4 ++--
- src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c  | 4 ++--
- src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c | 4 ++--
- 5 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c b/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
-index 2ea7c94cd65..44f054916cf 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_aead.c
-@@ -87,7 +87,7 @@ struct private_aead_t {
- 	encryption_algorithm_t alg;
- };
- 
--METHOD(aead_t, encrypt, bool,
-+METHOD(aead_t, encrypt_, bool,
- 	private_aead_t *this, chunk_t plain, chunk_t assoc, chunk_t iv,
- 	chunk_t *encrypted)
- {
-@@ -323,7 +323,7 @@ aead_t *wolfssl_aead_create(encryption_algorithm_t algo,
- 
- 	INIT(this,
- 		.public = {
--			.encrypt = _encrypt,
-+			.encrypt = _encrypt_,
- 			.decrypt = _decrypt,
- 			.get_block_size = _get_block_size,
- 			.get_icv_size = _get_icv_size,
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c b/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
-index cffe7ba2375..085a912404c 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_crypter.c
-@@ -230,7 +230,7 @@ METHOD(crypter_t, decrypt, bool,
- 	return success;
- }
- 
--METHOD(crypter_t, encrypt, bool,
-+METHOD(crypter_t, encrypt_, bool,
- 	private_wolfssl_crypter_t *this, chunk_t data, chunk_t iv, chunk_t *dst)
- {
- 	u_char *out;
-@@ -578,7 +578,7 @@ wolfssl_crypter_t *wolfssl_crypter_create(encryption_algorithm_t algo,
- 	INIT(this,
- 		.public = {
- 			.crypter = {
--				.encrypt = _encrypt,
-+				.encrypt = _encrypt_,
- 				.decrypt = _decrypt,
- 				.get_block_size = _get_block_size,
- 				.get_iv_size = _get_iv_size,
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
-index d8a1ededb06..110543762f2 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_ec_public_key.c
-@@ -193,7 +193,7 @@ METHOD(public_key_t, verify, bool,
- 	}
- }
- 
--METHOD(public_key_t, encrypt, bool,
-+METHOD(public_key_t, encrypt_, bool,
- 	private_wolfssl_ec_public_key_t *this, encryption_scheme_t scheme,
- 	void *params, chunk_t crypto, chunk_t *plain)
- {
-@@ -324,7 +324,7 @@ static private_wolfssl_ec_public_key_t *create_empty()
- 			.key = {
- 				.get_type = _get_type,
- 				.verify = _verify,
--				.encrypt = _encrypt,
-+				.encrypt = _encrypt_,
- 				.get_keysize = _get_keysize,
- 				.equals = public_key_equals,
- 				.get_fingerprint = _get_fingerprint,
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
-index f423d8d5691..ea0fb3dfc77 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_ed_public_key.c
-@@ -111,7 +111,7 @@ METHOD(public_key_t, verify, bool,
- 	return ret == 0 && res == 1;
- }
- 
--METHOD(public_key_t, encrypt, bool,
-+METHOD(public_key_t, encrypt_, bool,
- 	private_public_key_t *this, encryption_scheme_t scheme,
- 	void *params, chunk_t crypto, chunk_t *plain)
- {
-@@ -368,7 +368,7 @@ static private_public_key_t *create_empty(key_type_t type)
- 		.public = {
- 			.get_type = _get_type,
- 			.verify = _verify,
--			.encrypt = _encrypt,
-+			.encrypt = _encrypt_,
- 			.get_keysize = _get_keysize,
- 			.equals = public_key_equals,
- 			.get_fingerprint = _get_fingerprint,
-diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c b/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
-index 72df115fe90..da8899c2d8c 100644
---- a/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
-+++ b/src/libstrongswan/plugins/wolfssl/wolfssl_rsa_public_key.c
-@@ -216,7 +216,7 @@ METHOD(public_key_t, verify, bool,
- 	}
- }
- 
--METHOD(public_key_t, encrypt, bool,
-+METHOD(public_key_t, encrypt_, bool,
- 	private_wolfssl_rsa_public_key_t *this, encryption_scheme_t scheme,
- 	void *params, chunk_t plain, chunk_t *crypto)
- {
-@@ -440,7 +440,7 @@ static private_wolfssl_rsa_public_key_t *create_empty()
- 			.key = {
- 				.get_type = _get_type,
- 				.verify = _verify,
--				.encrypt = _encrypt,
-+				.encrypt = _encrypt_,
- 				.equals = public_key_equals,
- 				.get_keysize = _get_keysize,
- 				.get_fingerprint = _get_fingerprint,
diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index aca7ddf5cd..4822f9152f 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.5.tar.bz2.md5
-md5  53005324e3cba8592f1fb958b1c2d0e5  strongswan-5.9.5.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.8.tar.bz2.md5
+md5  f46b0d3e7aed88824650d0721c887443  strongswan-5.9.8.tar.bz2
 # Calculated based on the hash above
-sha256  983e4ef4a4c6c9d69f5fe6707c7fe0b2b9a9291943bbf4e008faab6bf91c0bdd  strongswan-5.9.5.tar.bz2
+sha256  d3303a43c0bd7b75a12b64855e8edcb53696f06190364f26d1533bde1f2e453c  strongswan-5.9.8.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 44c20f8414..cae1433e39 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.5
+STRONGSWAN_VERSION = 5.9.8
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
