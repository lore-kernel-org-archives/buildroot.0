Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9C2CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C75940818;
	Sat, 10 Oct 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5jgArsCgd6z; Sat, 10 Oct 2026 10:28:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3456B4082E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791628116;
	b=tP5krjUG3cWuEClpvcHQI7kSd3PSrL5OsuXN2i0lxFHHrmvyM2nmL8ZvUFh1DGtt5VUS
	 4hWG7wr4JyrQU9lHRyy2in8kdTacj7UYGsqwUIHtQH3GTrYYI1iZdjREem3jkwi1A+WXl
	 8RtPSeyoV4B05RcsUsyWPI5FmbhAKXIwRcW/Dzh5VwozDWQq00Lg2k1trB9MKIDACIU2v
	 I+SAd/mQzmq3dUglF+agj5eh0vZHjCCPoh/+dDx8fHFpdjoX88HAFQ8mlioQrKty716gu
	 oIwmwPGLa76ZizkF16ZA0cwCRjRrcrtZ7bolzKUc5Aa/fpSK9vrnZJWy2EAGZnG/CdA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791628116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=sRU/t8rs59NmUvEr7oC3rGeQfJ1zctDp+cssBqpZKlg=;
	b=oEtWtrl2UaMsnlg/W4uxcmkMG9/B7JqdkaTqmDAefJh8q7sxXa6NmHdCyu3GTuqCQH0B
	 FaGXriGYlXjwzW9fyoFP38hHKYxB0Dyvhq2vToNEfWJEkDRARgVGW8WR4ZLeZpjjtIeYc
	 T5i/e9CC1mPOtXcC4lVoo9tG0piwvJATf0DDIj1+m5zclwp1QegHDTRjSNPli58YLaIOO
	 fI/6Dj+WeSvMconpw/MZtaouXg0JPhUOnAI8q/4idJeAUDTh6ZqHpO00i5P83wkPgRBT7
	 vy68G7oHqTKXZl2gKoCU4ZPPBKNviJeLeg+eX3jf2/krr6bp2IJ2I0l8FQ8QQQBNp+g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791628116;
	bh=sRU/t8rs59NmUvEr7oC3rGeQfJ1zctDp+cssBqpZKlg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mWcidNiIFXpvBVfBaldHx1dQGDSAbBedGRZdYnvXt9PxgxLNRI+kT8XMpDYR0Wawi
	 NUFgfta9a4nRaGje2Ll6lgo7pdr0PrZ6Z7tGVXi41NDdDFO4yjaFNNGKGrc9bmjWxf
	 Lxc/eh3YsOhW2MEGTxKjKYP4wlrk/kKeiFyehfUp0Q/MwhyNlcId85UsZ2owVuMb5j
	 8/VM5O4/b4U4m3n8+8XCKsnN/d5NICQJQyAkEa8MJp+GW3LRzSVwcbvqICoY+92Do6
	 bC/xB4lAEuiSSNYKS7ct9P4FAOGVQGUilbc4uO4d7wv+1HlMVXQY3ZnHHPVUABnJrP
	 L4l8HIhHM06pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3456B4082E;
	Sat, 10 Oct 2026 10:28:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9FBF356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:28:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAE07811B2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:28:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Esw7-pFRzI8 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:28:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D1428811A1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791628113;
 b=m6n+aVBR5fPY3QrAWH6mU3AaOeW7dRQPZyaKuWT6KumUHkBbXFgPadlFtcotKs9fVUOj
 hc+ZhXv7SDMoEW+gN4FhHNFzPoJ7TVHs+EjURNrw3/bS17KR12sxrMNN7qiJTHfZXQwtJ
 mNlaWK/pIc/fyVSKSUnspc5BRJC3f6ybSn/gx84nbOWVATJu1QVO19mSIyk+061W2iOgD
 PgaAmASgQXNkJn7sjg0dBQAIcC0AOTFkMIIpo8/A2pArZWzbJLlGnjs6JXt7ZXanoEn35
 nzvMCUAmwl6P2ZJJowo3oI88Fd6Y2GhJ26g+J/h1B4WcVlodnxLDdWwS3PN8TG4VkDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791628113;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=J9kUaMxqnUouwp/C9ih54ETGClhUJ9x21iJLTRivCv8=;
 b=pbE2P7Zzp2MIzIGKSm3Quaqw8SB4lKwWjhOiHXRQ3n0+w62iEbCW4kk/2QMue0fgbWJ0
 82aD5+1JOS5inXnqV/dIcrSi2c/KSvksovTl//Qza29IkIRErw/BiG2N+HkH/63oU6bfv
 KJoMm3rcoWt8mYSOSLlQhDdhjznh1rdFw+CbeJtIHyudo70Trs67ZKYall3lSqFgGrGwE
 8CTmbmoFgDA98Q9wB/hPa1sWXwulk32iBp2PX/fh/Kr9qobnAUBkQI0g+i3PdrCnsKEkD
 czicW6bDVyFWR6BW0bgkPPSe5FPupumuLsGbxhwRAV0TOJF3zkoy3Rc83qxJs7Ls1SQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1428811A1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:28:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E771908A1; Sat, 10 Oct 2026 10:27:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 12:25:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f0d1a2cb43fe78798c487c2a1af357b3ed2e5db
X-Git-Newrev: b4648ea938b5be3c14134d051c785ed654908ce4
X-Patchwork-Hint: ignore
Message-Id: <20261010102715.9E771908A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-openssl: fix build with
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b4648ea938b5be3c14134d051c785ed654908ce4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...TET_STRING-and-X509_NAME-access-for-OpenS.patch | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch b/package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch
new file mode 100644
index 0000000000..85393734f0
--- /dev/null
+++ b/package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch
@@ -0,0 +1,87 @@
+From 6dcc3b2984e3f4dc1849c79d89c6ce736a8435b3 Mon Sep 17 00:00:00 2001
+From: Petr Gotthard <petr.gotthard@advantech.cz>
+Date: Sat, 7 Mar 2026 15:51:12 +0100
+Subject: [PATCH] Fix ASN1_OCTET_STRING and X509_NAME access for OpenSSL 4.0
+ compatibility
+
+Fixes: #166
+
+Upstream: https://github.com/tpm2-software/tpm2-openssl/commit/6dcc3b2984e3f4dc1849c79d89c6ce736a8435b3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tpm2-provider-pkey.c    |  8 ++++----
+ test/ec_genpkey_x509_csr.c  | 10 ++++++----
+ test/rsa_pki/etc/email.conf |  2 +-
+ 3 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/src/tpm2-provider-pkey.c b/src/tpm2-provider-pkey.c
+index 38f748e..80213af 100644
+--- a/src/tpm2-provider-pkey.c
++++ b/src/tpm2-provider-pkey.c
+@@ -149,13 +149,13 @@ tpm2_keydata_read(BIO *bin, TPM2_KEYDATA *keydata, TPM2_PKEY_FORMAT format)
+             strcmp(type_oid, OID_loadableKey))
+         goto error;
+ 
+-    if (Tss2_MU_TPM2B_PRIVATE_Unmarshal(tpk->privkey->data,
+-                                        tpk->privkey->length, NULL,
++    if (Tss2_MU_TPM2B_PRIVATE_Unmarshal(ASN1_STRING_get0_data(tpk->privkey),
++                                        ASN1_STRING_length(tpk->privkey), NULL,
+                                         &keydata->priv))
+         goto error;
+ 
+-    if (Tss2_MU_TPM2B_PUBLIC_Unmarshal(tpk->pubkey->data,
+-                                       tpk->pubkey->length, NULL,
++    if (Tss2_MU_TPM2B_PUBLIC_Unmarshal(ASN1_STRING_get0_data(tpk->pubkey),
++                                       ASN1_STRING_length(tpk->pubkey), NULL,
+                                        &keydata->pub))
+         goto error;
+ 
+diff --git a/test/ec_genpkey_x509_csr.c b/test/ec_genpkey_x509_csr.c
+index e3523ec..5c9790a 100644
+--- a/test/ec_genpkey_x509_csr.c
++++ b/test/ec_genpkey_x509_csr.c
+@@ -15,7 +15,7 @@ int generate_csr(const char *password, const char *filename)
+     EVP_PKEY_CTX *pctx = NULL;
+     EVP_PKEY *pkey = NULL;
+     X509_REQ *x509 = NULL;
+-    X509_NAME *name;
++    X509_NAME *name = NULL;
+     STACK_OF(X509_EXTENSION) *exts = NULL;
+     X509_EXTENSION *ex;
+     FILE *csr_file = NULL;
+@@ -40,9 +40,10 @@ int generate_csr(const char *password, const char *filename)
+             || X509_REQ_set_pubkey(x509, pkey) != 1)
+         goto error1;
+ 
+-    name = X509_REQ_get_subject_name(x509);
+-    if (!X509_NAME_add_entry_by_NID(name, NID_countryName, MBSTRING_ASC, (unsigned char *)"CZ", -1, -1, 0)
+-            || !X509_NAME_add_entry_by_NID(name, NID_commonName, MBSTRING_ASC, (const unsigned char *)"www.example.com", -1, -1, 0))
++    if (!(name = X509_NAME_new())
++            || !X509_NAME_add_entry_by_NID(name, NID_countryName, MBSTRING_ASC, (unsigned char *)"CZ", -1, -1, 0)
++            || !X509_NAME_add_entry_by_NID(name, NID_commonName, MBSTRING_ASC, (const unsigned char *)"www.example.com", -1, -1, 0)
++            || X509_REQ_set_subject_name(x509, name) != 1)
+         goto error1;
+ 
+     // set requested extensions
+@@ -75,6 +76,7 @@ error2:
+     fclose(csr_file);
+ error1:
+     sk_X509_EXTENSION_pop_free(exts, X509_EXTENSION_free);
++    X509_NAME_free(name);
+     X509_REQ_free(x509);
+     EVP_PKEY_free(pkey);
+     EVP_PKEY_CTX_free(pctx);
+diff --git a/test/rsa_pki/etc/email.conf b/test/rsa_pki/etc/email.conf
+index 7606c38..73c06d2 100644
+--- a/test/rsa_pki/etc/email.conf
++++ b/test/rsa_pki/etc/email.conf
+@@ -24,4 +24,4 @@ emailAddress            = "fred@simple.org"
+ keyUsage                = critical,digitalSignature,keyEncipherment
+ extendedKeyUsage        = emailProtection,clientAuth
+ subjectKeyIdentifier    = hash
+-subjectAltName          = email:move
++subjectAltName          = email:copy
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
