Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F83C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8CBF6064F;
	Fri, 18 Sep 2026 18:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwO8CYIssvWj; Fri, 18 Sep 2026 18:46:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BD41760DF5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757183;
	b=evSMN7rUR7JXaCgDVdoslWktZL8eZtr94ZBRcPJyqJyy7vZz1RZ5h0QryQLGORC/oF42
	 Yn8iSMZ7q/zQBrbXt4iwBgfrkgr6wwLEBT2PyY3/vudYm2TC6bdaIPSbrpUZDWOgBWO7q
	 Twbe8B09QlAwpOX7+L1W9YB9BHp+KJFRP4VE+l2NkYl5gnQkn4hGQMa+AeboeFzWqdHQg
	 yUk7W44lHtd2K5QsfI8XYWiqPZzvi4gAWL49nXUOVnFNqBApq3FYUzz9U2ywVeu1Q7Gd3
	 YDPvHLBYGOyYu9aXCrx/GjqIwU89q6aDzj8nd9t1E6DtK70L+jmN1bpTTKBIeGBIHeA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757183;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	b=sq4pmuo3Dk1YlUyuscKjcuqdaHgmg1sxd8IDTx8upb4O7YPF0Ib03Tos13ZN8cTEm1OW
	 QcUyZ6iaCQ/IiPqiNBoO0Eh+o1cJTbNK6T/VOisqI7H5NRlkb0CqjtEIoSRsBJwxo45Wy
	 VAC+i3xhH6ZfW/we/+nQqy8K/A4XNOdP1JBRu2rfeV3gKvOFuACKqwSraX8qUUNF8a6r9
	 5bekStdP5wBDeYxyBP0Mr7JVqkEXAqcHLTFnrZl7fE1GLl+yjOI9OKmqWKTBgCHavY99B
	 TxwWJ0qQtB8sASD8+mGoEcGmaB0tCOgzQzUP4IR7PuVh2ZukdvvIBJzdJfOG73nuMjg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757183;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Q7M7PifTAYRWfKkluy5JNgCtbz1bKyJ1FFT39O8vOtAsT5jPJwFZMGyKacxOW9zm6
	 4t+zRtySQDM3LZqWjQ8VyLWJtScUTRhJ9oyaQGoBpwDXJZ6bB34Pb0ujJxeU1fUAdj
	 z9QxIVPPlXMmr8oQfPo112Z1YuCpFirgJNJMu6H7D5Vpp2k+HjsSEXSbExB1PA3At2
	 irBH98SpQdSFfeOCJTZrdha7nUppcsTx3M1I9iSZKJZPX1Dbh1XZlcPfKBBX0lSHam
	 A4/HjHImUA4ZmfJ5RERtkjpA25+MOMMNyxCsJf6Z++cwTcZg0/gFgXKrybvTjI4ebg
	 rWjOKBGBf2pYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD41760DF5;
	Fri, 18 Sep 2026 18:46:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C67D237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF6F812FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yeFQXX03nFMk for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:46:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0B0F0812FB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757181;
 b=coX5hMT6Tcq2j8h2QxqPo6F8x9r/PG7tgfKEzH4oqZ2XhjiAtbGVy6lhBCv8u9VNXAIS
 MHw9AavL4GHKWQe/1I0pbidLnKhhDac2Khuh+qMZSWX25kv/RlO4YPETUqIufQKKeaLDr
 Yf/2qyFj38C4+FaOlFrLASS95c59z+PfogmJcBr9rKwzxXxvx5D+WllggHKKQI3LT2yd5
 RLYg5+1zgAMQWXij+XldKtQ/UCMz0hBXZ++s/d/sbknfGHbRKZdIiUbubZa512ja9UsqJ
 NG/N0SeVfCvn7KaGdZBw3YLM4qOWdkSLmozwwkmD/QMm575+dvIzYPHNtZiEH2Vw3uA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757181;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 b=UMuAT+E8teHdLkr330JwgOs0u5ymvv1kZOHKUaPLRZVXisGBfJL0XY5IOeh7p4MbVhY4
 SvOg1jn2q26cleG34xlf/VveIYe69HM+zcODl+ItjzpUSNY7sdSV3wcZPmipHG9a3pmOr
 IVXib1nfESGA0XTAsBTy9FvuxkZ9vkMlCSoIXI87Vzte4qDdMwEXQZwxEn/BcLGCtJhoZ
 +gxgeVYzprihekJpGIejDU3nRh0TATc6Z6IZZ5nw9a3auvh7CzqzoA5ek0wLZgnTcBw7X
 XAFqZzLNZuTjl4u6TEzFpHFaE07jsRktc8WncCwJDSlQ/oNVMTmXhkleWBNh0RdrS1Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="ZYuWF/p3"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZYuWF/p3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B0F0812FB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756924;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZYuWF/p3ogfcTVZjSBq6c4GtQZc+Co+sXmp9hsljcwaat0KEIY8aPKuic9lHK3Sjl
 EjhvDTNLNhlH2VD2GUlw3612DeYgcekvmTclHOwkyqnRN2C2b0htPPOVIQbUysRLXK
 blpMbEe14TqFoDnTyv2wR8iepEsCAWijeYWnHFgVWNn7AUNx17RuH9Fu34YFEmIoMd
 LrmIiIsGrUEGHbv2nBpqyfhlgw29Gr2wvcdJh+ORQOuFunbOnEtxQBZpHg0bnTcXm7
 BZpK+1yyfqV2k8/bepd4hfD+L7oilgVAPxvvziacwzjIpILatR26kd14JzgfNeKGO/
 vZjKZPT6Iiacg==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:cFp/XGXlOPWU3hLejDDr1nKGHkP9HnFm+LgKkKQnyFB1PztPZNUczX9fZaLQjgNxexW0nyUMAYwNEDkK4PeBcsJbgQ/aafjjcFynznRAb/Sb10W3CHFExaabYJPfOWo+6bNiOkRp7FusTAKlLQxMDwhOzJCz2t3vIpyFn6hBOIxqWWARwxdLUrQgIon2iUXxuBp56OUjVN1yry6PCy/fDtaDuNn9fQMKrvmFz/cM4gBvBXqGEXR1REven9n6JtxmVwR2EHa9DtyQ24jQ7YL+LgQNwol39Fzv9epgt/ZOhin0nN1OcWjuS2iQK6zUOlYAIgjuO29qD3CqJd02Ijdw1YmA8dYEhTZUoWxO/L7HL3l7AbsEUq5Ynjuzqvm3RmCSomaaR8sieewOdCYGqgaoBaTXI+Y9BjGy0Ku+NEjV2RHB0y0OzZCjODQdEvol/pc7+4kwZ2zKdj/Gh+YFpXMo95T3p3C19qzs28d+Jarf0RdUZicYRpWYmHI/+D9povYJq6NrGMJuIgR70NKq3ZsIY0cXA9ibQCajPqEPo4znGpTHnulGqF8mwEshwHIeap54TiQgMD9GJQWj7mXnA0/956+0H+a8ofYjy6979Dlob0q68m
 GGwd8N/8q6iVPFCkkJgDJn8fbJjJHz68AZHY0TNV9ROz13XfuvglOt8uOJp5b/rOG9ldLUzF1L
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C5645A4C4712;
 Fri, 18 Sep 2026 20:42:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX2-000000007cB-10p7;
 Fri, 18 Sep 2026 18:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:33 +0200
Message-ID: <20260918184140.3631274-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 71/77] package/tpm2-openssl: Fix build with
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
