Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C7BC3F6B0
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 20:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04D0440895;
	Wed, 24 Aug 2022 20:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04D0440895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTlkNWcT5yNj; Wed, 24 Aug 2022 20:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C245840BC6;
	Wed, 24 Aug 2022 20:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C245840BC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FEE81BF307
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68A1F60FF5
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68A1F60FF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvzPjZNf3_qA for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 20:00:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6811760B4E
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 20:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6811760B4E
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E56F387D3C; Wed, 24 Aug 2022 19:45:59 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 21:59:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fc299ad6a97f8f827ec423b00db7ac0cd73fdfa
X-Git-Newrev: 8915beede6fa0d1f4f78b2729800b45d582ab53c
X-Patchwork-Hint: ignore
Message-Id: <20220824194559.E56F387D3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: fix build with libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=8915beede6fa0d1f4f78b2729800b45d582ab53c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0002-added-compatibility-with-LibreSSL.patch   | 173 +++++++++++++++++++++
 .../0003-Fix-build-with-libressl-3.5.0.patch       |  47 ++++++
 2 files changed, 220 insertions(+)

diff --git a/package/opensc/0002-added-compatibility-with-LibreSSL.patch b/package/opensc/0002-added-compatibility-with-LibreSSL.patch
new file mode 100644
index 0000000000..86a17448f8
--- /dev/null
+++ b/package/opensc/0002-added-compatibility-with-LibreSSL.patch
@@ -0,0 +1,173 @@
+From 302ad70471efa279b033d4d5511d979ec5d965fe Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Thu, 20 Jan 2022 17:01:46 +0100
+Subject: [PATCH] added compatibility with LibreSSL
+
+[Retrieved (and backported) from:
+https://github.com/OpenSC/OpenSC/commit/302ad70471efa279b033d4d5511d979ec5d965fe]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
index 0000000000..1d262362d6
--- /dev/null
+++ b/package/opensc/0003-Fix-build-with-libressl-3.5.0.patch
@@ -0,0 +1,47 @@
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
+[Upstream status: https://github.com/OpenSC/OpenSC/pull/2593 &
+ https://github.com/OpenSC/OpenSC/pull/2595 (merged)]
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
