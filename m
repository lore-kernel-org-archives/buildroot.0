Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A300FC9833F
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AC0D80AF9;
	Mon, 28 Sep 2026 11:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1eR6KjQIEAR; Mon, 28 Sep 2026 11:47:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D547D80A4A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790596059;
	b=gsQbR2/2NxfqUiWa06LNWlfk2yfbFxDEM+MznfDcmYyck/ZgP4z/ITWSlh+n6xc/OBBp
	 H2Wm3SNXDBzJo0m86KI33t7oegXqGYqgV6KZlIm4QjJhCY/leRHWxNWgmnbU9WzHgpMrt
	 DrnUbIQqky9c7VjR2wB0zTLAeypyecKvGa3AiDG7FK116yCX6kxq/ifvDhFKIX9h1Ro1Q
	 /DxnC1irEgmnPgxrwwBwt+4Y6xctlwniKX1Fv3BFYwoqjS/erPXB465DxJbUyJLPnBXH8
	 RVcnrfH/zTFz7fuqzhBe4ySD1DoEwoqXwlnNWwio82D7vdRr+Kn8780HK2NI30s8u3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790596059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NaBwC3yGQJC3/ffvJhKJVnwWTHV6uQU/j/NVdy5IpkM=;
	b=MDkhT0Pwzqjk+qibPAc5qQ63QLyuYqj7V3fE0LNiVoMyy6NsikL0EGwtEkr3ddRtLOIw
	 +ZX1B3fHBrxyQzkLajY2+J89UvizvHJ3Gj9vWlH0smu4T8U2ISpfRcmBaAoL65DVGE/IL
	 ElC0lb84qTYyyiiwzSvYPslWzDGi96AWmvWCLAhELM3fCQlIjpnkWDE3YCjNIKTu6zEwJ
	 lTk7KVMg8QHbNzO1GaFqYW25mjvVm9B5fKtLfUUEJTB2n7WdZHNL05jVA95Bf3ywYhyfu
	 uO4oeCa2rODVlD6La2+LOA9ffIFHRhR6izAs/8IaCFMTk+nRYn2yr1b18vM5wo1L1ew==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790596058;
	bh=NaBwC3yGQJC3/ffvJhKJVnwWTHV6uQU/j/NVdy5IpkM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KXvGhlMbn3Zunc0YVvTArcpuJefsvAbfQ51YHdNqo7PWHz/dtPbzlsFphBuxe6UmP
	 oqVpm4626ls3hwwGc2iTqXKvoyaUV7Nl2Nh7O9s6yEsNjhUvBJaOC0OdaLptnHacIS
	 lDmJLfYC9Qj8JzzQpnJUKCmPjOGyRMYyCU1Lod75h2qeh0b0XPzPI9Qcez2+q2oswy
	 pdBm1bHq4JfVcj9HZqU/jVpnmsQmv/SyaOtFHc1zF7O7QNX6u+c6OYkc5PVcaF4JOx
	 j58rKz8bXfGfbcqO7eJX5Xrs7pdARIs6kE9eG5IqVHDJJuBkW3jyw1M2yIgQyzvBoT
	 5UNRkAygFMVsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D547D80A4A;
	Mon, 28 Sep 2026 11:47:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F9B32F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E217605EB
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVlHkxLDE4cJ for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:47:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 61A03605ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790596056;
 b=FzoEY4z6lUvzm9nXNVHX3M8m1fgW23gBgHJPif3RKNF++Lng7RAb90jEdK+Mf6GJsah1
 oZ9lRtbz372TH9w7F4rwNbDaH8OFmCOWfFDkBUwCaK/yZ9+RIEfeFhwtUD4obP/KxhRYx
 omcSw8zFSGIrXfkYodLdoPxGr6Lzj/EJgkXdFlysX4/Z53yiZzDaHLA+yUiUmRyoIga3C
 XFDGkiuzQ6rwka0K6OqIVtTBDIp8m98bfuLnk0DVGw8SqumtTo51JX5a+9gJdbxDNcjdU
 zxnyd8qSQpNRtGE693Dr8zjes/S/sQA20snWZJbl5t7kk57dLjOReqyOWKHQp+82z8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790596056;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XLBCbePe4OhI27sM7CYZZBG8q7dwshJaKRFjhZBGalU=;
 b=CgEWbgBhQfTVPQr3kSsPNnbsik43v0SuFYssq1NCDTejdO7d9pfwquf/VCx7MWaq8+3+
 OuesJvdX0FU1WtoaAgPJou8685GJSbkGtyhCWsm6I5jKDg6P81ZCHkkVDdSlEyoG6iXUd
 jfg69ZjVeox+n3VqSS9/Ln6iwiMekg4Hx2liiwHmk609AZPKv9eJ72Y6I75z6+N99EzMR
 J/wGfym0cTcPBmfWMB5opqrlopFGmTvIlbysyixLL24hvzozXtSk53AsrFHa12W5Wncgg
 kJ2XktwWqNh1EqYu2wWQEFUopv4v8OrJEw6HOSHl6WCAz6XWNtMnrdleS4h3xgWEFkg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61A03605ED
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:47:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 278279830F; Mon, 28 Sep 2026 11:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:37:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79e1d59d274cc22b86f9951a70357a71acd1619e
X-Git-Newrev: 0edc67470bd781477d0cbf0269cc608b7feaf32f
X-Patchwork-Hint: ignore
Message-Id: <20260928114624.278279830F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opensc: add support for OpenSSL
 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0edc67470bd781477d0cbf0269cc608b7feaf32f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../opensc/0001-Changes-for-OpenSSL-4.0.0.patch    | 333 +++++++++++++++++++++
 1 file changed, 333 insertions(+)

diff --git a/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch b/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
new file mode 100644
index 0000000000..6039cc3fc0
--- /dev/null
+++ b/package/opensc/0001-Changes-for-OpenSSL-4.0.0.patch
@@ -0,0 +1,333 @@
+From 8ad96adc5fea0cef923a2a679600f3a5c4c5bfce Mon Sep 17 00:00:00 2001
+From: Doug Engert <deengert@gmail.com>
+Date: Wed, 15 Apr 2026 15:10:42 -0500
+Subject: [PATCH] Changes for OpenSSL-4.0.0
+
+Changes to get OpenSC to compile  with OpenSSl-4.0.0
+
+OpenSSL says:
+"Opaque Structures: ASN1_STRING has been made opaque, and further work has been
+done to make X509 structures more memory-efficient and const-correct."
+
+ASN1_STRING was made opaque thus requiring the use of ASN1_STRING_get0_data,
+and ASN1_STRING_length. These routines have been in OpenSSL since 1.1.1
+and are also in libressl.
+
+ASN1_STRING_get0_data returns a const pointer, so the data can not be changed.
+There  are a number of reverse() functions one of which was reversing the
+bytes in a EC pubkey.
+
+Changes not addressed:
+"Global Cleanup: libcrypto no longer uses atexit() for cleanup;
+OPENSSL_cleanup() now runs in a global destructor."
+
+ On branch OpenSSL-4.0.0
+ Changes to be committed:
+	modified:   src/libopensc/cwa-dnie.c
+	modified:   src/pkcs11/openssl.c
+	modified:   src/pkcs15init/pkcs15-oberthur-awp.c
+	modified:   src/tests/p11test/p11test_case_common.c
+	modified:   src/tools/netkey-tool.c
+	modified:   src/tools/pkcs11-tool.c
+	modified:   src/tools/pkcs15-init.c
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/8ad96adc5fea0cef923a2a679600f3a5c4c5bfce
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libopensc/cwa-dnie.c                |  2 +-
+ src/pkcs11/openssl.c                    | 14 ++++++----
+ src/pkcs15init/pkcs15-oberthur-awp.c    | 16 +++++------
+ src/tests/p11test/p11test_case_common.c | 24 ++++++++--------
+ src/tools/netkey-tool.c                 | 37 +++++++++++++++++--------
+ src/tools/pkcs11-tool.c                 | 22 +++++++--------
+ src/tools/pkcs15-init.c                 |  4 +--
+ 7 files changed, 68 insertions(+), 51 deletions(-)
+
+diff --git a/src/libopensc/cwa-dnie.c b/src/libopensc/cwa-dnie.c
+index 47f3792dad..6020921dbc 100644
+--- a/src/libopensc/cwa-dnie.c
++++ b/src/libopensc/cwa-dnie.c
+@@ -646,7 +646,7 @@ static int dnie_set_channel_data(sc_card_t * card, X509 * icc_intermediate_ca_ce
+ 	dnie_private_data_t *priv_data = GET_DNIE_PRIV_DATA(card);
+ 	LOG_FUNC_CALLED(card->ctx);
+ 
+-	X509_NAME *issuer = X509_get_issuer_name(icc_intermediate_ca_cert);
++	const X509_NAME *issuer = X509_get_issuer_name(icc_intermediate_ca_cert);
+ 	if (issuer) {
+ 		buf = X509_NAME_oneline(issuer, buf, 0);
+ 		if (!buf) {
+diff --git a/src/pkcs11/openssl.c b/src/pkcs11/openssl.c
+index 0a5d4394a2..a4027339b2 100644
+--- a/src/pkcs11/openssl.c
++++ b/src/pkcs11/openssl.c
+@@ -463,6 +463,7 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR pubkey, CK_ULONG pubkey_len
+ 	EC_POINT *P;
+ 	BIGNUM *X, *Y;
+ 	ASN1_OCTET_STRING *octet = NULL;
++	unsigned char *octet_rev = NULL;
+ 	char paramset[2] = "A";
+ 	int r = -1, ret_vrf = 0;
+ #if OPENSSL_VERSION_NUMBER < 0x30000000L
+@@ -516,13 +517,16 @@ static CK_RV gostr3410_verify_data(const CK_BYTE_PTR pubkey, CK_ULONG pubkey_len
+ 		if (group && pubkey_len <= LONG_MAX) {
+ 			const unsigned char *p = pubkey;
+ 			octet = d2i_ASN1_OCTET_STRING(NULL, &p, (long)pubkey_len);
++			if (octet)
++				octet_rev = malloc(ASN1_STRING_length(octet));
+ 		}
+-		if (group && octet) {
+-			reverse(octet->data, octet->length);
+-			Y = BN_bin2bn(octet->data, octet->length / 2, NULL);
+-			X = BN_bin2bn((const unsigned char*)octet->data +
+-					octet->length / 2, octet->length / 2, NULL);
++		if (group && octet && octet_rev) {
++			memcpy(octet_rev, ASN1_STRING_get0_data(octet), ASN1_STRING_length(octet));
++			reverse(octet_rev, ASN1_STRING_length(octet));
++			Y = BN_bin2bn(octet_rev, ASN1_STRING_length(octet) / 2, NULL);
++			X = BN_bin2bn(octet_rev + ASN1_STRING_length(octet) / 2, ASN1_STRING_length(octet) / 2, NULL);
+ 			ASN1_OCTET_STRING_free(octet);
++			free(octet_rev);
+ 			P = EC_POINT_new(group);
+ 			if (P && X && Y)
+ 				r = EC_POINT_set_affine_coordinates(group, P, X, Y, NULL);
+diff --git a/src/pkcs15init/pkcs15-oberthur-awp.c b/src/pkcs15init/pkcs15-oberthur-awp.c
+index 22c943127b..fdb06ab6b4 100644
+--- a/src/pkcs15init/pkcs15-oberthur-awp.c
++++ b/src/pkcs15init/pkcs15-oberthur-awp.c
+@@ -51,21 +51,21 @@ awp_get_commonName(X509 *x)
+    	r = X509_NAME_get_index_by_NID(X509_get_subject_name(x),
+ 		   NID_commonName, -1);
+ 	if (r >= 0)   {
+-		X509_NAME_ENTRY *ne;
+-		ASN1_STRING *a_str;
++		const X509_NAME_ENTRY *ne;
++		const ASN1_STRING *a_str;
+ 
+ 		if (!(ne = X509_NAME_get_entry(X509_get_subject_name(x), r)))
+ 			;
+ 		else if (!(a_str = X509_NAME_ENTRY_get_data(ne)))
+ 			;
+-		else if (a_str->type == 0x0C)   {
+-			ret = malloc(a_str->length + 1);
++		else if (ASN1_STRING_type(a_str) == V_ASN1_UTF8STRING) {
++			ret = malloc(ASN1_STRING_length(a_str) + 1);
+ 			if (ret)   {
+-				memcpy(ret, a_str->data, a_str->length);
+-				*(ret + a_str->length) = '\0';
++				memcpy(ret, ASN1_STRING_get0_data(a_str), ASN1_STRING_length(a_str));
++
++				*(ret + ASN1_STRING_length(a_str)) = '\0';
+ 			}
+-		}
+-		else    {
++		} else {
+ 			unsigned char *tmp = NULL;
+ 
+ 			r = ASN1_STRING_to_UTF8(&tmp, a_str);
+diff --git a/src/tests/p11test/p11test_case_common.c b/src/tests/p11test/p11test_case_common.c
+index 1dd6eaba67..f571cd1598 100644
+--- a/src/tests/p11test/p11test_case_common.c
++++ b/src/tests/p11test/p11test_case_common.c
+@@ -776,34 +776,34 @@ int callback_public_keys(test_certs_t *objects,
+ 			switch (o->key_type) {
+ #ifdef EVP_PKEY_ED25519
+ 			case CKK_EC_EDWARDS:
+-				if (strcmp((char *)curve->data, "edwards25519") == 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") == 0) {
+ 					evp_type = EVP_PKEY_ED25519;
+ 					break;
+ #ifdef EVP_PKEY_ED448
+-				} else if (strcmp((char *)curve->data, "edwards448") == 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards448") == 0) {
+ 					evp_type = EVP_PKEY_ED448;
+ 					break;
+ #endif /* EVP_PKEY_ED448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected edwards25519 or edwards448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ #ifdef EVP_PKEY_X25519
+ 			case CKK_EC_MONTGOMERY:
+-				if (strcmp((char *)curve->data, "curve25519") == 0) {
++				if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519") == 0) {
+ 					evp_type = EVP_PKEY_X25519;
+ 					break;
+ #ifdef EVP_PKEY_X448
+-				} else if (strcmp((char *)curve->data, "curve448") == 0) {
++				} else if (strcmp((char *)ASN1_STRING_get0_data(curve), "curve448") == 0) {
+ 					evp_type = EVP_PKEY_X448;
+ 					break;
+ #endif /* EVP_PKEY_X448 */
+ 				}
+ 				debug_print(" [WARN %s ] Unknown curve name. "
+ 					    " expected curve25519 or curve448, got %s",
+-						o->id_str, curve->data);
++						o->id_str, ASN1_STRING_get0_data(curve));
+ 				break;
+ #endif
+ 			default:
+@@ -893,14 +893,14 @@ int callback_public_keys(test_certs_t *objects,
+ 			break;
+ #endif
+ 		}
+-		if (os->length != exp_length) {
++		if (ASN1_STRING_length(os) != exp_length) {
+ 			debug_print(" [WARN %s ] Invalid length of EC_POINT value. Got %d, expected %d",
+-					o->id_str, os->length, exp_length);
++					o->id_str, ASN1_STRING_length(os), exp_length);
+ 			return -1;
+ 		}
+ 		key = EVP_PKEY_new_raw_public_key(evp_type, NULL,
+-			(const uint8_t *)os->data,
+-			os->length);
++				(const uint8_t *)ASN1_STRING_get0_data(os),
++				ASN1_STRING_length(os));
+ 		if (key == NULL) {
+ 			debug_print(" [WARN %s ] Out of memory", o->id_str);
+ 			ASN1_STRING_free(os);
+@@ -925,8 +925,8 @@ int callback_public_keys(test_certs_t *objects,
+ 			}
+ 
+ 			if (EVP_PKEY_get_raw_public_key(o->key, pub, &publen) != 1 ||
+-				publen != (size_t)os->length ||
+-				memcmp(pub, os->data, publen) != 0) {
++					publen != (size_t)ASN1_STRING_length(os) ||
++					memcmp(pub, ASN1_STRING_get0_data(os), publen) != 0) {
+ 				debug_print(" [WARN %s ] Got different public"
+ 					"key then from the certificate",
+ 					o->id_str);
+diff --git a/src/tools/netkey-tool.c b/src/tools/netkey-tool.c
+index 23bab2a8ec..683ac182bd 100644
+--- a/src/tools/netkey-tool.c
++++ b/src/tools/netkey-tool.c
+@@ -144,25 +144,38 @@ static void show_certs(sc_card_t *card)
+ 			if(q[4]==6 && q[5]<10 && q[q[5]+6]==0x30 && q[q[5]+7]==0x82) q+=q[5]+6;
+ 			printf(", Len=%d\n", (q[2]<<8)|q[3]);
+ 			if((c=d2i_X509(NULL,&q,f->size))){
+-				char buf2[2000];
+-				if (X509_NAME_get_text_by_NID(X509_get_subject_name(c), NID_commonName, buf2, sizeof(buf2)) < 0) {
++				int idx;
++				const X509_NAME_ENTRY *ne = NULL; /* no free */
++				const ASN1_STRING *a_str = NULL;  /* no free */
++				int out_len = 0;
++				unsigned char *tmp = NULL;
++
++				idx = X509_NAME_get_index_by_NID(X509_get_subject_name(c), NID_commonName, -1);
++				if (idx >= 0 &&
++						((ne = X509_NAME_get_entry(X509_get_subject_name(c), idx)) != NULL) &&
++						((a_str = X509_NAME_ENTRY_get_data(ne)) != NULL) &&
++						((out_len = ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Subject-CN: %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp = NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Subject-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Subject-CN: %s\n", buf2);
+-				if (X509_NAME_get_text_by_NID(X509_get_issuer_name(c), NID_commonName, buf2, sizeof(buf2)) < 0) {
++
++				idx = X509_NAME_get_index_by_NID(X509_get_issuer_name(c), NID_commonName, -1);
++				if (idx >= 0 &&
++						((ne = X509_NAME_get_entry(X509_get_issuer_name(c), idx)) != NULL) &&
++						((a_str = X509_NAME_ENTRY_get_data(ne)) != NULL) &&
++						((out_len = ASN1_STRING_to_UTF8(&tmp, a_str)) > 0)) {
++					printf("  Issuer-CN:  %s\n", tmp);
++					OPENSSL_free(tmp);
++					tmp = NULL;
++				} else {
+ 					sc_log_openssl(card->ctx);
+ 					printf("  Invalid Issuer-CN\n");
+-					X509_free(c);
+-					continue;
+ 				}
+-				printf("  Issuer-CN:  %s\n", buf2);
+ 				X509_free(c);
+-			} else {
+-				sc_log_openssl(card->ctx);
+-				printf("  Invalid Certificate-Data\n");
+ 			}
+ 		} else printf(", empty\n");
+ 	}
+diff --git a/src/tools/pkcs11-tool.c b/src/tools/pkcs11-tool.c
+index 452ac49617..cfc7486faa 100644
+--- a/src/tools/pkcs11-tool.c
++++ b/src/tools/pkcs11-tool.c
+@@ -7389,8 +7389,8 @@ static int read_object(CK_SESSION_HANDLE session)
+ #endif
+ 				point = EC_POINT_new(group);
+ 				if (os) {
+-					a = os->data;
+-					a_len = os->length;
++					a = ASN1_STRING_get0_data(os);
++					a_len = ASN1_STRING_length(os);
+ 					success = EC_POINT_oct2point(group, point, a, a_len, NULL);
+ 				}
+ 				if (!success) { /* Workaround for broken PKCS#11 modules */
+@@ -7464,9 +7464,9 @@ static int read_object(CK_SESSION_HANDLE session)
+ 
+ 					a = params;
+ 					if (d2i_ASN1_PRINTABLESTRING(&curve, &a, (long)len) != NULL) {
+-						if (strcmp((char *)curve->data, "edwards25519") &&
+-								strcmp((char *)curve->data, "curve25519")) {
+-							util_fatal("Unknown curve name \"%si\"", curve->data);
++						if (strcmp((char *)ASN1_STRING_get0_data(curve), "edwards25519") &&
++								strcmp((char *)ASN1_STRING_get0_data(curve), "curve25519")) {
++							util_fatal("Unknown curve name \"%si\"", (char *)ASN1_STRING_get0_data(curve));
+ 						}
+ 						ASN1_PRINTABLESTRING_free(curve);
+ 					} else if (d2i_ASN1_OBJECT(&obj, &a, (long)len) != NULL) {
+@@ -7526,26 +7526,26 @@ static int read_object(CK_SESSION_HANDLE session)
+ 					}
+ 				}
+ 
+-				if (type == CKK_EC_EDWARDS && os->length == BYTES4BITS(256)) /* note extra bit */
++				if (type == CKK_EC_EDWARDS && len == BYTES4BITS(256)) /* note extra bit */
+ 					raw_pk = EVP_PKEY_ED25519;
+ #ifdef EVP_PKEY_ED448
+-				else if (type == CKK_EC_EDWARDS && os->length == ED448_KEY_SIZE_BYTES)
++				else if (type == CKK_EC_EDWARDS && len == ED448_KEY_SIZE_BYTES)
+ 					raw_pk = EVP_PKEY_ED448;
+ #endif /* EVP_PKEY_ED448 */
+ #ifdef EVP_PKEY_X25519
+-				else if (type == CKK_EC_MONTGOMERY && os->length == BYTES4BITS(256)) /* note extra bit */
++				else if (type == CKK_EC_MONTGOMERY && len == BYTES4BITS(256)) /* note extra bit */
+ 					raw_pk = EVP_PKEY_X25519;
+ #endif /*EVP_PKEY_X25519 */
+ #ifdef EVP_PKEY_X448
+-				else if (type == CKK_EC_MONTGOMERY && os->length == BYTES4BITS(448))
++				else if (type == CKK_EC_MONTGOMERY && len == BYTES4BITS(448))
+ 					raw_pk = EVP_PKEY_X448;
+ #endif /* EVP_PKEY_X448 */
+ 				else
+ 					util_fatal("Invalid or not supported CKK_EC_EDWARDS or CKK_EC_MONTGOMERY public key");
+ 
+ 				key = EVP_PKEY_new_raw_public_key(raw_pk, NULL,
+-						(const uint8_t *)os->data,
+-						os->length);
++						(const uint8_t *)ASN1_STRING_get0_data(os),
++						ASN1_STRING_length(os));
+ 				ASN1_STRING_free(os);
+ 				if (key == NULL) {
+ 					util_fatal("out of memory");
+diff --git a/src/tools/pkcs15-init.c b/src/tools/pkcs15-init.c
+index e011232987..b978e0677a 100644
+--- a/src/tools/pkcs15-init.c
++++ b/src/tools/pkcs15-init.c
+@@ -2593,8 +2593,8 @@ do_read_data_object(const char *name, u8 **out, size_t *outlen, size_t expected)
+ static char *
+ cert_common_name(X509 *x509)
+ {
+-	X509_NAME_ENTRY *ne = NULL;
+-	ASN1_STRING *a_str = NULL;
++	const X509_NAME_ENTRY *ne = NULL;
++	const ASN1_STRING *a_str = NULL;
+ 	char *out = NULL;
+ 	unsigned char *tmp = NULL;
+ 	int idx, out_len = 0;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
