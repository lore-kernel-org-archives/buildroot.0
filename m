Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50335CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E0F780F80;
	Tue, 29 Sep 2026 18:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6FSSLcdPObK; Tue, 29 Sep 2026 18:38:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2EC2180F7E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707122;
	b=FWWF8dC+dc+PZVBnG1WaLtNIZZ9s8hYxlKO3xFieEGUzeocUj24mzs6OPc8Ll4kgOU+1
	 JYsA2QT3nHoQ2eOU6D2ZhM62H5ZIvQvzJK9pAYzv9eCNNdlmiMAao6d+Eo7Ol96xJD8EP
	 qrQq/KUoLcprQACKwh5nxM+WtkHiergEnfuSJ/jr9jH3uQpk6AXp6ZOLCN18JMYCfP1B8
	 0S66UgXuJwPQRUN3FCDqzRMH3gONQhsmyXgbDVQ7WaZW2JmuNBJLMCBkmMV0aqudkFzy6
	 TTAAlTtaf4X9cIkb6B4acd8snX4qolh10vEw80uLEAWQEVfCbu0VUh14soM3mYcGIlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Js/ufzlwsEbq9OnS8Ki86x3ObexrxAJQdUOuNypaCps=;
	b=CIXrzugjwMFYQ9npgeFXMKyKNBZcbrzBrSgb69v+P5qF6Q9+5dmw+iVAB3IU6UjDIBOy
	 3QsH5cnf4zun/mK+ojI6rBZkuE2/WsDUo2A76E2+tIxvbsNw7SwPjnttTyICbWLG0IvUH
	 cHgC1PL1l1WvWsUcZ01o9kyWMdGDx2S1/5+5f3F07clBahHIHQiH2nximxZEFZ1+vScTy
	 rz03QkfBsQpwB5ZfGU7sSCr/dvlys1KMeYSAS2d5ltdLFJqTGx+FKL+/dpW7fid8srZ2z
	 bPsxKspkaYRivrXLKBlnyYWo/dHBIwcjNsAWb57ixSxPVD1SLiIf+Ds1vr7bxXMEM8Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707122;
	bh=Js/ufzlwsEbq9OnS8Ki86x3ObexrxAJQdUOuNypaCps=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INzVdch2CRxMWq/bCrxBDaSO/Px490syhUXgKE3GKm0s/J6Rbch1XhJS7ECu2i4pj
	 DGcPdE/XcsdtIaxDpFMSGrvk34pe6pVasaBZDFy4GRuEPC9OMht7YjvOS8uW707yHN
	 V+niBNuQrJe2nIn/JaOh94saeDZyNYDt9KW+S56QWoMzTbiyZUGfxYUX3RECrAJY6s
	 oxWiCRjayjldUT3x1KfZTKzpIm76eK2dmVLI5TtJMJzGD5U9qZ2CzHPofZDq79nH4g
	 Eh271z4Q2RG7DfJIQPsVFUG2KhMLgMLVT8mLHLq4X/GxXTIPw8pFf70lUekIzZP4z2
	 szTYC2CsUMIGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EC2180F7E;
	Tue, 29 Sep 2026 18:38:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EB7F14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00977607E9
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpSu9eudaneL for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:38:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00768607E6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707119;
 b=fhjF/p99SR9frdqsNSv6whG3eMHzjr20nmcR2WQmqJJz80gJIdOmXmH8hZBvdb2KSftU
 XfR6RWRluY1892F+GfPjCUYIgREZZL1Zjq1xeLNos85Q+wBBHV1e0Y/jNC307iTGAWOqh
 0qRBHr3jmloMb5y7jGbwlqYNOO5RF6/92SE/EjQKR0NbMWiqhfbteXlZIXdXc4cMhrmFr
 UOZrMHG4mHmOGC+bnvjBg1i0K+PzRW8N6cQscUxU5Hx2TQS5fcFsxgblH3lpeeCxE+hUo
 jNAq/elpDS7HtQLgVp5ntp5qV4/gMMy8fuHEmjchNkdBGEo3dlmcqr4N4Bk6QEIP64w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707119;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=E3U2Pn1e54jhy3d04t3D1mnFrFl0Z8oPoaupfkR1b4M=;
 b=Vb8QG4b0VE7+9j/DGeKSQfq2jA/vdp4cSg/D28cW6feucF0S3nx1eHFBfQxlKaZcMAQ+
 qEQTRNji+2ZbCIaQSVjHnCijymrIh3kDtxmeZFkFuCQlwuvas4Y5zr0bMjsiGnz2Jm8WA
 oiAoxFk5yZ9ZEE4nm4HmU/bY+AvVM2F7V/nEcyrFCPTf/Pzdt96TtzgvJT/CsQdroevoT
 6D34rXpD2MIx+V8KO5+5nJO8ETNOAFLG4EZPezpwVqFjOealNym84DcwVs1yTOkYym3VV
 aXYTHRPOvubR1VcdUuxWe873HfphlqOAf5uQy6He2wWZxfLNFkKlbmQQkfpRGXlU7Qg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bsAOYF7j; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bsAOYF7j
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00768607E6
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707021;
 bh=E3U2Pn1e54jhy3d04t3D1mnFrFl0Z8oPoaupfkR1b4M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bsAOYF7j8d7TpGOEl5xcn57pLVP2l/PpbMyTig+ipihB8byYuNg2OJNaK4hw0dVNE
 iOo3HSvf9Rq9SpPUYmbPs2ysUeLPLsIjfIGhmXHeMjz57ZzATGNt7kamsm4E6lM7xw
 c2D2wp3GpUIt8yD8vO8CfUPKcY/+md1RoybaT2+cbwOv5xXOAcZ23pRZ7HfLRIpy2v
 WUi/fzIh/vT3bCwLe80XmwfE+JbJP9gCNFejGlVptXGHi9LNUB8zxnyMS0b2G5xxR6
 0G2eUuSHY+J6dHmXqS0jV1APmGrFVMbnCX3VSCTadEmmMx1m+6Eqf4UcB5cixqvUpS
 eoqMUp1Nb+R7g==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 SVzhDozpeEBbFOoQEtkd2CicWUOuWoydCV0ooyNG/8nt6KHp0hjVQBNgnf739vxUlOIostbMmQZ
 QK/gYDaAiBki7wH2Dunm+qNAObybZGrYAHWLUzk6rINR0Ovj4m6IrM6J47zSlHN1npcntW2OTEt
 uIoSY1rrEe4rhbs+PNCPh31isqVEUNQ/QOfImsDgLZN0uIBl4tLcA7S2QzB7d/f4l/s3JWra05n
 S6coCFAX/jzajmxQOhgd38Y99VMdFwWPjoNNT8tgNlTWqb1DnuFF709dNmzWnLPHHpXVqWIHIG2
 XBii2rqModwGzeuIEdam0HtvrwbzPTCMqBTjIgvV4PybhckQk4LFdsJVeRItVuNRtLSzyPgvPh+
 IpZj6k15YyYlobyJg/mYg1YpitGLJQaR9MichpdZgpcuQFHWREZlQo1gtCF+Pz4ewGF6ER8Qdjm
 68Q+r4KKlDRCx0uqiFI3w/vE5lII5gOeg0sB9YQUUzLhpRWiTAFOpCFX40MDn4aQGXGdMabVwIm
 ueng3Kz8Y1jDx+MNr7kBEkBL41BhAdszMJzzNHM8UA/E3PoHdmgjXupl0X+VWOptGfgrGLlBULn
 Ryev8njNdUJeLPsPLtQzW72t1t9/lRafBWWO3ZhmzARN3bITMBROYcTfmrSLfA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3979A4C518E;
 Tue, 29 Sep 2026 20:37:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgn-000000006Jn-01zU;
 Tue, 29 Sep 2026 18:36:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Tue, 29 Sep 2026 20:36:00 +0200
Message-ID: <20260929183607.1849293-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 61/66] package/tpm2-openssl: Fix build with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Romain Naour <romain.naour@gmail.com>
---
 ...TRING-and-X509_NAME-access-for-OpenS.patch | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 package/tpm2-openssl/0001-Fix-ASN1_OCTET_STRING-and-X509_NAME-access-for-OpenS.patch

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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
