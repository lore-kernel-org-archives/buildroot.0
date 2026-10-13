Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF93CC6B10
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 08:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF7E1406A7;
	Tue, 13 Oct 2026 08:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LESKRrMeDob9; Tue, 13 Oct 2026 08:21:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2AB764069B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791879711;
	b=Rq0QNBnawa53ORw5HO41lgAEprnBrtngTXvRoiC1y9dFe1BqEMoK+zla9O40PRpnYx1c
	 +4cTECWTNPYbcsH2kSWg5haHQt4CZokOqMyJ/uYsm91SioNjSQ/5y2B5jWboSw8niUo3P
	 f+KjjhfMN9RpfxYn1BssPVekPoGezLi2WDZ+8cPC9HjVkSN3h4E2ZFHOy0GBVwaPa7X6A
	 Rt1Y9k5WFbuERufmqrw0YIUz1t85udsgWTUFkILVTpSLIxRF6lJeHeTUPzNHW09SgsLac
	 5VuQosnxLkRQtdrs+byYzGr850LAqn6SzpZkVvKYKgvV9Oi3faC4sYo5z3n6A4ts1wQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791879711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tW576AyVM7U6xfi4+fZZW8jW+JBnKrdLBw2qqxgAMNA=;
	b=VeHFryPo7Eb5Nvd30izarVB1AD4zSYcveVz0lHhP9C7NIudLZqT1WbjF3PHgS3LZNUpM
	 u9o0NT78GybBUJR1fqHDzIjROlgTUMj7bpYDeFh8SDX+X1p97ANish/1XM1x+CnvSBUCg
	 67suww/y0gOoHeY6uJn3sgCY/q8PIDKz8o/75nzL+Ig7/Hgn+CFEHHcHqUkA8OSfVFkWj
	 g1Ho5l10aQ9Z4Lmguxp087GR//DQjiFtqm30l4Ptryim2u1ZuoZiOkliJzNlWsGw2d3S3
	 6PRw1dUZ0hyNdbCOn/DFyjZIdjbsDGHYYBo6RZgZG/TBzgms0z9ruZprZsGbpyivY1g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791879711;
	bh=tW576AyVM7U6xfi4+fZZW8jW+JBnKrdLBw2qqxgAMNA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GiB3/lIxDweJ67Y1Yi4d/MJ+dBZG7bfJI4YrccKwa4lRbTezUoE0E1kqmEyyQ7Ux7
	 qQ5w1TjQDKmQxNLUyICR38pYcSWvO078C/2SJywwOWeN/4mAh6jOlZSz9Y/QdF7j7Z
	 +51bMBbSVPgj5QuxxZ1qcHgUmUeTLiYlB9uqsKri2uR+Rgdt/61I7Sa+b0XAUt2qx1
	 YVq4MjsrdOvnQa0sQxXJQT0lyVTlONAfzUvd2ggw1S+VPDWiWv2190oaoT2i4Q+HG7
	 /xLVqMsVc887aR2yJSFEGGk5KT2WFm56jpJhPQ24sVcqWxpSsTInORj/gQkAo5J5cS
	 Qh1D4VtVuWuBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB764069B;
	Tue, 13 Oct 2026 08:21:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EAFF129B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 371F86076C
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nakf68w6M0FD for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 08:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8DDC86075D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791879708;
 b=Wl/PPgLDV1l6axkSQG71+Z1+WKjrnCtiLNgeZItAWNR0i1LFG17VoLW16w804H5hNmd3
 lf3CKdPccleN7GGnNh2fW2gaT4y/PBnMw8EmpFyjzKxfQGxL4gAK2qMC6jFiuzfJIjd39
 wnBwUOgHWXFiAMdqrfaxv5f9qqdgS14uemEPKoNx69WQY1VwRGxRMXipiAf0Px1UcRcg7
 Mbik0eG4/COAQHLgwnaR6mJ5Km5d0bjsulpMgDfzwjPeKDN7SEVh95WbbwHJaiDhJhOwi
 PHvgAHnk14X3v1C4qtPLAM9WFuzgxTh1as0EUGtnzqoClsmjbuJe7FwGTl6WUSjekaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791879708;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Cdhqul/9rf4MsuH7vjodJgXG8zkIwSrzqXhjg+Xj80k=;
 b=CBY2khGF+/CMRj++Ut1I8CIAoSeBnN2UAkqSN8ZsHg0YPJ+iKWMGg5j1t/9BVVT5rKbP
 RzB0yjPFfJgvqNnreg+XSVzlWi6MLDy+rNMhRR/2zpz3MGhQXbiVMtajTEJDJOOXkU6L5
 jvtVNJBaVEQ3b69Y9rdaNpsn2djoAs9oYDmZ/uooyu8GBOCpVeItf8ABXQHFRK4wHjA8H
 gpwL58L0it/IxbgJ9f9f+jzMspGLGF1iid1P8Cu6u0FNzeXL3hrllM04dTViw7WuenhYN
 U8JttWF/AY/u0bgysFSsS4kEBJ3Cr6nAKebrAQK/tUTzrzvr4OnyfAUD6lIy48KPV2w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DDC86075D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 08:21:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE05B95494; Tue, 13 Oct 2026 08:20:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:20:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b68c9948881ad9fa3414bdf021ed1ad97d4a0128
X-Git-Newrev: f87cf2d6239d676147dec1fef088d81ee873277a
X-Patchwork-Hint: ignore
Message-Id: <20261013082028.EE05B95494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: Fix build with
 OpenSSL 4.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f87cf2d6239d676147dec1fef088d81ee873277a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0003-Add-support-for-OpenSSL-Provider-API.patch | 304 +++++++++++++++++++++
 1 file changed, 304 insertions(+)

diff --git a/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch b/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
new file mode 100644
index 0000000000..9a5071cae3
--- /dev/null
+++ b/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
@@ -0,0 +1,304 @@
+From 9f78e701fa5a4faf69119d9fe1e485e76de2fe3b Mon Sep 17 00:00:00 2001
+From: Eddie Kovsky <ewk@edkovsky.org>
+Date: Mon, 23 Feb 2026 09:43:22 -0700
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream: https://github.com/u-boot/u-boot/pull/918
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/aes/aes-encrypt.c |   4 +-
+ lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
+ 2 files changed, 100 insertions(+), 6 deletions(-)
+
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index 90e1407b4f0..4fc4ce23247 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index 0e38c9e802f..f456f3c58e6 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+ 
+ static int rsa_err(const char *msg)
+ {
+@@ -94,10 +134,11 @@ err_cert:
+  *
+  * @keydir:	Key prefix
+  * @name	Name of key
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,21 +198,24 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_pub_key() - read a public key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
+  * @name	Name of key file (will have a .crt extension)
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+ 
+@@ -207,13 +251,44 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key = NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR(1, "OSSL_PROVIDER_try_load(pkcs11)");
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++
++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp = private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+ 		return -EPROTO;
+ 	}
+ 	fclose(f);
+-
++#endif
+ 	return 0;
+ }
+ 
+@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_priv_key() - read a private key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
+  * @name	Name of key
+- * @engine	Engine to use for signing
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+ 
+@@ -325,6 +404,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+ 
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
+ 		ENGINE_free(e);
+ 	}
+ }
++#endif
+ 
+ static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding_algo,
+ 			     struct checksum_algo *checksum_algo,
+@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+ 
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 
+ 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+ 
+ 	EVP_PKEY_free(pkey);
++
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	return ret;
+ 
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+ 
+@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ 	ENGINE *e = NULL;
+ 
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -726,8 +816,10 @@ done:
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	if (ret)
+ 		return ret;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
