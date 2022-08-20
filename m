Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F75C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 13:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AADD283267;
	Sat, 20 Aug 2022 13:07:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AADD283267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4iODzwp54oIb; Sat, 20 Aug 2022 13:07:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B40B831F2;
	Sat, 20 Aug 2022 13:07:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B40B831F2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9094C1BF3B8
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 13:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BD3160D79
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 13:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BD3160D79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dgbWAKzDsV7r for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 13:07:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB07660D5B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB07660D5B
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 13:07:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso5400796wmc.0
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 06:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=TlMvknnCcsp4zjpEz2WW41pAVGCK9P9DZL5gct36GU4=;
 b=DSdISABCLkdLzLMfFeMxu6cXlt5RzW9V+jYKL1PIKSPh1LZDyUYXAmwbEuLtSkgFrO
 moSNawqLYHzxK0kAULj3cUNmQkbUno1uem5u63uVPdujIo6QcCf22ayvsIbUG32EuL25
 mvP5GvfN5IxCSapsfLvnxFuAbvyu1J/Rh9TZRc7aftHJD2HnUZ62naoOH0ynrfCYlFlX
 GQtUUTKNwsr3ixK+VMqmhetOBcS684ae/yMON2N2m6sEmMB8KujVhdNtb6deJ7KuGIBi
 CFf6tp55ocekUm0nZ1BeNFBfOlYWNZv61s18HQN80KXBRNDrpvDubDY6rpWDuWgNcfE4
 QTag==
X-Gm-Message-State: ACgBeo3LvxrR0uCyq2OI4MUwAAkJEp6+QVMcKU8UXKDWTdo2ci70iy6i
 mRUFAi9r9Vy9sxnSnnD32XMSVppsf8w=
X-Google-Smtp-Source: AA6agR4Pke7rDIp21QCfM1FsiNLOp9j+m9MYVkKsEfmx6rcF237hS+vuOUXPqYBXKZs+C/ES9Uai7A==
X-Received: by 2002:a05:600c:3b9f:b0:3a6:53f:12fb with SMTP id
 n31-20020a05600c3b9f00b003a6053f12fbmr7509804wms.194.1661000829786; 
 Sat, 20 Aug 2022 06:07:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 d7-20020a5d5387000000b002235eb9d200sm7013542wrv.10.2022.08.20.06.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 06:07:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Aug 2022 15:06:51 +0200
Message-Id: <20220820130651.507543-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=TlMvknnCcsp4zjpEz2WW41pAVGCK9P9DZL5gct36GU4=;
 b=hHb8IPRtkDGWUmE+jl1dnGI5ehSqw7cvK6sjBXRsUYDfd2bwBoFO6qBcyFiE2Vr9q8
 E0VMBgazpBHDWqEhLSiUhEBQXUkVX15jYj/cnJkQ24ErxIpj5qicBFp81NjaQh+OBery
 szNM2QZGAviTJzWtsjC2y8W36achuqGg0od83jAyHOxjU+G+jmG1tlcdTpCVt7COvps8
 dBfvzikZMo5RyOh/K7JNU6ysOxDVT9WwJ3UHkXqDtullk4WKdDTk1Dc9+kXmvS/yTGtu
 0DfoReKqiQfkF66M/yCmy6Ca55AAIMKHsxUuHxH0s9ZVOCZdZ0LYqt1ngSVsWWRYbIWH
 /vdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hHb8IPRt
Subject: [Buildroot] [PATCH 1/1] package/opensc: fix build with libressl
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since the addition
of the package in commit 8aaa7ecbce1d10cbcd880c3da5e429988f96176a:

In file included from internal.h:45,
                 from card-authentic.c:32:
/nvmedata/autobuild/instance-29/output-1/host/powerpc64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509v3.h:802:10: error: expected ')' before '*' token
  802 | uint32_t X509_get_extension_flags(X509 *x);
      |          ^~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7b50ab363c174636fb27d554223287d7496676ed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...02-added-compatibility-with-LibreSSL.patch | 172 ++++++++++++++++++
 .../0003-Fix-build-with-libressl-3.5.0.patch  |  46 +++++
 2 files changed, 218 insertions(+)
 create mode 100644 package/opensc/0002-added-compatibility-with-LibreSSL.patch
 create mode 100644 package/opensc/0003-Fix-build-with-libressl-3.5.0.patch

diff --git a/package/opensc/0002-added-compatibility-with-LibreSSL.patch b/package/opensc/0002-added-compatibility-with-LibreSSL.patch
new file mode 100644
index 0000000000..1e13a070c8
--- /dev/null
+++ b/package/opensc/0002-added-compatibility-with-LibreSSL.patch
@@ -0,0 +1,172 @@
+From 302ad70471efa279b033d4d5511d979ec5d965fe Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Thu, 20 Jan 2022 17:01:46 +0100
+Subject: [PATCH] added compatibility with LibreSSL
+
+[Retrieved (and backported) from:
+https://github.com/OpenSC/OpenSC/commit/302ad70471efa279b033d4d5511d979ec5d965fe]
+---
+ src/libopensc/sc-ossl-compat.h             |  7 +++++++
+ src/tests/p11test/p11test_case_common.c    | 14 ++++++++++++++
+ src/tests/p11test/p11test_case_ec_derive.c |  4 ++++
+ src/tests/p11test/p11test_case_readonly.c  |  9 +++++++--
+ 4 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index f885f85bb9..ec694ad48d 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -105,6 +105,13 @@ extern "C" {
+ /* workaround unused value warning for a macro that does nothing */
+ #if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L
+ #define OPENSSL_malloc_init()
++#define FIPS_mode()                             (0)
++#define EVP_sha3_224()                          (NULL)
++#define EVP_sha3_256()                          (NULL)
++#define EVP_sha3_384()                          (NULL)
++#define EVP_sha3_512()                          (NULL)
++#define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
++#define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
+ #endif
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x30000000L
+diff --git a/src/tests/p11test/p11test_case_common.c b/src/tests/p11test/p11test_case_common.c
+index e432f8f4ed..f091dbcc10 100644
+--- a/src/tests/p11test/p11test_case_common.c
++++ b/src/tests/p11test/p11test_case_common.c
+@@ -164,6 +164,7 @@ add_supported_mechs(test_cert_t *o)
+ 			o->mechs[0].result_flags = 0;
+ 			o->mechs[0].usage_flags = CKF_SIGN | CKF_VERIFY;
+ 		}
++#ifdef EVP_PKEY_ED25519
+ 	} else if (o->type == EVP_PKEY_ED25519) {
+ 		if (token.num_ed_mechs > 0 ) {
+ 			o->num_mechs = token.num_ed_mechs;
+@@ -184,6 +185,8 @@ add_supported_mechs(test_cert_t *o)
+ 			o->mechs[0].result_flags = 0;
+ 			o->mechs[0].usage_flags = CKF_SIGN | CKF_VERIFY;
+ 		}
++#endif
++#ifdef EVP_PKEY_X25519
+ 	} else if (o->type == EVP_PKEY_X25519) {
+ 		if (token.num_montgomery_mechs > 0 ) {
+ 			o->num_mechs = token.num_montgomery_mechs;
+@@ -204,6 +207,7 @@ add_supported_mechs(test_cert_t *o)
+ 			o->mechs[0].result_flags = 0;
+ 			o->mechs[0].usage_flags = CKF_DERIVE;
+ 		}
++#endif
+ 	}
+ }
+ 
+@@ -601,6 +605,7 @@ int callback_public_keys(test_certs_t *objects,
+ 		a = template[6].pValue;
+ 		if (d2i_ASN1_PRINTABLESTRING(&curve, &a, (long)template[6].ulValueLen) != NULL) {
+ 			switch (o->key_type) {
++#ifdef EVP_PKEY_ED25519
+ 			case CKK_EC_EDWARDS:
+ 				if (strcmp((char *)curve->data, "edwards25519")) {
+ 					debug_print(" [WARN %s ] Unknown curve name. "
+@@ -608,6 +613,8 @@ int callback_public_keys(test_certs_t *objects,
+ 				}
+ 				evp_type = EVP_PKEY_ED25519;
+ 				break;
++#endif
++#ifdef EVP_PKEY_X25519
+ 			case CKK_EC_MONTGOMERY:
+ 				if (strcmp((char *)curve->data, "curve25519")) {
+ 					debug_print(" [WARN %s ] Unknown curve name. "
+@@ -615,16 +622,20 @@ int callback_public_keys(test_certs_t *objects,
+ 				}
+ 				evp_type = EVP_PKEY_X25519;
+ 				break;
++#endif
+ 			default:
+ 				debug_print(" [WARN %s ] Unknown key type %lu", o->id_str, o->key_type);
+ 				return -1;
+ 			}
+ 			ASN1_PRINTABLESTRING_free(curve);
+ 		} else if (d2i_ASN1_OBJECT(&obj, &a, (long)template[6].ulValueLen) != NULL) {
++#if defined(EVP_PKEY_ED25519) || defined (EVP_PKEY_X25519)
+ 			int nid = OBJ_obj2nid(obj);
++#endif
+ 			ASN1_OBJECT_free(obj);
+ 
+ 			switch (o->key_type) {
++#ifdef EVP_PKEY_ED25519
+ 			case CKK_EC_EDWARDS:
+ 				if (nid != NID_ED25519) {
+ 					debug_print(" [WARN %s ] Unknown OID. "
+@@ -632,6 +643,8 @@ int callback_public_keys(test_certs_t *objects,
+ 				}
+ 				evp_type = EVP_PKEY_ED25519;
+ 				break;
++#endif
++#ifdef EVP_PKEY_X25519
+ 			case CKK_EC_MONTGOMERY:
+ 				if (nid != NID_X25519) {
+ 					debug_print(" [WARN %s ] Unknown OID. "
+@@ -639,6 +652,7 @@ int callback_public_keys(test_certs_t *objects,
+ 				}
+ 				evp_type = EVP_PKEY_X25519;
+ 				break;
++#endif
+ 			default:
+ 				debug_print(" [WARN %s ] Unknown key type %lu", o->id_str, o->key_type);
+ 				return -1;
+diff --git a/src/tests/p11test/p11test_case_ec_derive.c b/src/tests/p11test/p11test_case_ec_derive.c
+index 9f13b3e9d6..f7a5f92f9e 100644
+--- a/src/tests/p11test/p11test_case_ec_derive.c
++++ b/src/tests/p11test/p11test_case_ec_derive.c
+@@ -89,6 +89,7 @@ pkcs11_derive(test_cert_t *o, token_info_t * info,
+ 
+ int test_derive_x25519(test_cert_t *o, token_info_t *info, test_mech_t *mech)
+ {
++#ifdef EVP_PKEY_X25519
+ 	unsigned char *secret = NULL, *pkcs11_secret = NULL;
+ 	EVP_PKEY_CTX *pctx = NULL;
+ 	EVP_PKEY *pkey = NULL; /* This is peer key */
+@@ -210,6 +211,9 @@ int test_derive_x25519(test_cert_t *o, token_info_t *info, test_mech_t *mech)
+ 	free(secret);
+ 	free(pkcs11_secret);
+ 	return 1;
++#else
++	return 0;
++#endif
+ }
+ 
+ int test_derive(test_cert_t *o, token_info_t *info, test_mech_t *mech)
+diff --git a/src/tests/p11test/p11test_case_readonly.c b/src/tests/p11test/p11test_case_readonly.c
+index 624bd6a54d..2aefdc7a70 100644
+--- a/src/tests/p11test/p11test_case_readonly.c
++++ b/src/tests/p11test/p11test_case_readonly.c
+@@ -522,6 +522,7 @@ int verify_message_openssl(test_cert_t *o, token_info_t *info, CK_BYTE *message,
+ 				rv, ERR_error_string(ERR_peek_last_error(), NULL));
+ 			return -1;
+ 		}
++#ifdef EVP_PKEY_ED25519
+ 	} else if (o->type == EVP_PKEY_ED25519) {
+ 		/* need to be created even though we do not do any MD */
+ 		EVP_MD_CTX *ctx = EVP_MD_CTX_create();
+@@ -547,7 +548,7 @@ int verify_message_openssl(test_cert_t *o, token_info_t *info, CK_BYTE *message,
+ 			EVP_MD_CTX_free(ctx);
+ 			return -1;
+ 		}
+-
++#endif
+ 	} else {
+ 		fprintf(stderr, " [ KEY %s ] Unknown type. Not verifying\n", o->id_str);
+ 	}
+@@ -641,7 +642,11 @@ int sign_verify_test(test_cert_t *o, token_info_t *info, test_mech_t *mech,
+ 		return 0;
+ 	}
+ 
+-	if (o->type != EVP_PK_EC && o->type != EVP_PK_RSA && o->type != EVP_PKEY_ED25519) {
++	if (o->type != EVP_PK_EC && o->type != EVP_PK_RSA
++#ifdef EVP_PKEY_ED25519
++			&& o->type != EVP_PKEY_ED25519
++#endif
++			) {
+ 		debug_print(" [SKIP %s ] Skip non-RSA and non-EC key", o->id_str);
+ 		return 0;
+ 	}
diff --git a/package/opensc/0003-Fix-build-with-libressl-3.5.0.patch b/package/opensc/0003-Fix-build-with-libressl-3.5.0.patch
new file mode 100644
index 0000000000..2a94a46acd
--- /dev/null
+++ b/package/opensc/0003-Fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,46 @@
+From d13059d1ec2bbb8fe7068db0d66d521daa4b71ce Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 13 Aug 2022 14:27:22 +0200
+Subject: [PATCH] Fix build with libressl >= 3.5.0
+
+libressl added back FIPS_mode since version 3.5.0 and
+https://github.com/libressl-portable/openbsd/commit/a97eabc90d7647e374c1c6da686aeec63c49ff14
+
+libressl provides X509_get_extension_flags since version 3.5.0 and
+https://github.com/libressl-portable/openbsd/commit/3180723224c1b2c7856a110b8213e4966995d7e0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OpenSC/OpenSC/pull/2593]
+---
+ src/libopensc/sc-ossl-compat.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index f0d55279..2c42794c 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -86,9 +86,11 @@ extern "C" {
+ #if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
+ #define RSA_PKCS1_OpenSSL		RSA_PKCS1_SSLeay
+ 
++#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L
+ #define X509_get_extension_flags(x)	(x->ex_flags)
+ #define X509_get_key_usage(x)		(x->ex_kusage)
+ #define X509_get_extended_key_usage(x)	(x->ex_xkusage)
++#endif
+ #if !defined(LIBRESSL_VERSION_NUMBER) || LIBRESSL_VERSION_NUMBER < 0x2050300fL
+ #define X509_up_ref(cert)		CRYPTO_add(&cert->references, 1, CRYPTO_LOCK_X509)
+ #endif
+@@ -104,7 +106,9 @@ extern "C" {
+ /* workaround unused value warning for a macro that does nothing */
+ #if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x20700000L
+ #define OPENSSL_malloc_init()
++#if LIBRESSL_VERSION_NUMBER < 0x30500000L
+ #define FIPS_mode()                             (0)
++#endif
+ #define EVP_sha3_224()                          (NULL)
+ #define EVP_sha3_256()                          (NULL)
+ #define EVP_sha3_384()                          (NULL)
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
