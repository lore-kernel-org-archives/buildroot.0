Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06ABC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67EE44055D;
	Sun, 27 Sep 2026 10:49:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3w10FGuHPvi2; Sun, 27 Sep 2026 10:49:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5FE124084E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506167;
	b=U7KMj18kTssHNzJumVybny/jpE3SRclyyThPihICdF4VDQ0OB1esCDmDH7vq+bjI1rd7
	 cD51s6CMh7grbJVOw/9v1YNkdutzIpf7hKIHT9No9a9lbWY311u6karZW0rdl0AkuM1AN
	 K2NK6FbhYE5n7qriB1/+p0DiF0m/VJZhVkqQoulZQKppTsTskztlQ47F/eqsX+JZbZXvc
	 BcSJiJPhucY1fc4exTvSp4XfFBb4JmszcYKTy0UsD77lgIm+hO9Uiy7B2dTiqGsmiHqJm
	 Dp8ZDf6xtTYS7Kj+GlQArXmHuym6b3XI+eBEOXS87ZVhDKEBFP9rxuEwEjDCP/yVoAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	b=KdtNhCI7l9TYlg25hO6hNOQsObQRJk3ElqnDeHTuI54Yv7kAuHVFTy+1JqHkVPFii3vf
	 4lUrvE98vutiprEhhZlgHzIdIo377HgGm4xdx2T12Ml73Jj4e4JkmZooxHzxiUJcb8Pgu
	 oh99fCsVcqoi/b/ZcwbwOu9dxc0jTjD2vLfPAJUbtWa77/KFuATQKCp/NBqNhT/ZXv4Tw
	 A3nshcVojv4gdfC1kjXdp+pIu2ExrBOEBoiZblbtJ4al0xJtzpl//mSwx48g5Uw7cqKHx
	 aTxuI5FqHn2Q2Aszu8HsHaKafEpHO0yPkAIhbR27ve4qWrI0J+NfKltjjO2q2g9DsXw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506167;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nEb5JEIjxVSNq7DpCX+UkagUdpqDH+M4QJV4xwkMuU05CaiX8aFyFGEf26ui2p05u
	 QgSprZLnJ1nIuIpJljgakzANO4hFZgVHPGToLxcO73+aCmfeGMYzCUWXMmwjhi7Rnt
	 06BpAuQPUCt7SltE8guUPmT+al91/mZOTYo+/pLLDN6TqYb7xrTKlxWuH10bU2lkdj
	 b0yg20mZcP15Sx1cVXZYiUCEL9UR4XCKZ/zS2l565RCF4szB2CxANSuzC9IkeikLRk
	 hq/3M0yMQjYT9ycr/6gPECkTV+i8djy4ReE+5KlTIeV/E9QIgeb4Bbc/ekcp/l9M3F
	 RhuclYp5tDYmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FE124084E;
	Sun, 27 Sep 2026 10:49:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35EE8335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D7946062D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loY_rSiWu6vl for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:49:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 131FE6062C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506164;
 b=R3R6YVFODgQmZzb0n01HqzmTKR9Qu6DHKlz8qaZw+B3FXgDd4I9KR3gt0u4+PA9OL0GI
 zXdnr7jEXXVNOa460cwb2K5qR9X38qbPQ4K3ntPGauTAFiAK+9K5KIuVKr5YtTGf3AsZe
 fVtKsH7sAGERZgoEmMz1tcDvwVn9dYzzqYRH1JYD2sv+1Go0UYz1UAAkgT+XVvBpVlNlP
 3R2l2kpcA1b1B3URo8hd0NI45fdMBCYkb4q0vycQX++rkuZoH5W1d6Z9xYJIzTpb4jh0O
 ThXwqkPGs2xmEipXFkGC9qQ5PS3LA5Sy9nHFzpfweVvFx+BIG8cmUeCWFdncHX4+E6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506164;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 b=iY7US8wpaJ8NnhYxeolYDODoGBEb37G6ONYFs1fbU4SdEmHu6iYF7BJSucBCRLhBUx+4
 rlkeJuGPVqFpanGhJTqdsbjikHvHRMLellMuS2LAt3NxTYZaNaSRHyImBJs9Wc/hnXQZQ
 Auy1/eEu90g0yIYaEf11lsnA585ZnlH98RURnLk6shCtP7SKNXP6kjnorwALIV0eVD/ka
 07+C522FRJTe5USjIOy83c1WOClj9H091UH9xycZh1FfTYtXixlRxcwskaAPfdgM/cj7m
 NLO40t5I1zLJCBBWUI3r8R3+vDDW7qHciYQx9WFvqnyT2NzWJCQlZNXe0A0+3MuNQuw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hyWqYbfs; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hyWqYbfs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 131FE6062C
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505842;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hyWqYbfss0v4aPPhbEHPLtobOc4QErLBCMyQH4Mes3wdBY2/b4sWEh49qxmIDrdZp
 OXktSIEITlwTy4z5DMBaw5RehILHjkCH6uEUs30dZuxTgdtdXBmsZDrA/jd/5cPhsQ
 yf5oKZ0ZTC1ufTIjIbB0+C2zhzx7Fw7xvi335qYr1IUrbEkH08kX4mrs9f7FHW32/v
 Y/SPyB8tiavvDefCAcjwzK5EgdiVXT6PNZUUUqni/BApp3bKlEJhDI5tW6gIXHr/Sm
 96D0e1sc01MxtvCsZTMGJsbI03mKrqSRNhJIX+eiC9pYFkZ+6fX1hkCYRPLtJlcGQX
 rKmTAy+wfqalg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 iyXddRLp7fiSSvgMnhWv4dZZOfHKs/4HcrdadEB71E/Ya+oJA8u83Wo281cG3wHb0RN2KbZrne5
 9//4P2zmu2vNW1kZ1M1EBuqlCOZdzZIvC6GIpdpJoJbf6XGE2uxIZwYB7wKXnc9riqe6qDyFkkS
 t7/J3brG1b6dCfXipOft0g9GotQ7QxJPazAeChyudEKHADwBQhZ4EUwSOYqFDXmAiWIiypd9D9j
 QwzeHDJZoZqnMUPI1wAnzkxSBv+CE7/o5qiegHesUL9EzKA8dvQ5yppKfYRZR5cVsFLi9ejhppZ
 RR3vOpMFVaQLMtc7qA2pVWMHen1DNhfjf32An8KkB4THo0gV4X4bHnFd/DOV31NxoaG5Aw27eOH
 j1fLSK/TpToRiwQUF+1N0MSztTWzk4cCvd8uDHN9d0u/9bbuExI4dtmiz/wmCGLYd9evtg6pHCo
 6HHxJX3UtRPN5Mk1AXmvobBjO3/++JPckN3s+1na1nVyA4DiKHNWnNfCb1edc877jWCUG3LRJVB
 /MIfyT9FNZsABqBnp3bvxbE13dzpm9+G6tissyfHdvPlScFC0IqlJJ0DNzPLTQi4IDmgA+NhZmU
 1K0v53kcwIO1FDS954ooDyyPmLFvFSgtLoY1de3M2wcaGKCLNOU6w1DGgs3zQfvkc1oITM768jB
 ADhu7vONQyl/fn95d3CCJ
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9D2CA4C4F8E;
 Sun, 27 Sep 2026 12:44:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLj-0000000007a-2tzu;
 Sun, 27 Sep 2026 10:43:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:55 +0200
Message-ID: <20260927104301.1801638-78-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 77/82] package/tpm2-openssl: Fix build with
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
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
