Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F92FC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283A840D88;
	Sun, 20 Sep 2026 17:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEr6kOW9gfjF; Sun, 20 Sep 2026 17:11:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 33BC640DEA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924267;
	b=BaJjfkwI0X8GiDBzC0mo1gnj696lmh1UdZZaU8w8knR/HKQ6RzFGc8vTzsogZWnZ+nDI
	 et4nIbALXjK3gu6YU2PYoTRcaQO+uG1UDKMWv/tZ6ZQUVIUr4l1ap8bgcdd6+OA1ZD2ep
	 lk6TE9OfeQuXsNxLcBRghWwSTvG7sG1Bw/3QSDcDVRFIAsLqv4Kxmb/9HJEDl8oQWVz1m
	 /CwUtG49I/xmMhL9Ty1oFnWbdPgQGp27+3hxD84sADHbGUXJQAZMFdxgvpn7u7APhbsJh
	 14XXkMa8E07Uxw/55XnH4KMPNB7hMIRscvdmggyQeoQ5XL1Pjf4uz18343uKl/Rm3Ow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924267;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	b=a362jq4DS7tXRTMqhH2Pt8a3mguC7/bydp54bFW0FskigJh3xPhvOIvSpiIrEF9fKGRD
	 bJoJmhH5DNHUj5uD7zJjT+8sEO5poPVUQAu48tsPF5d1S/9ynYrIbQUjCTF9rs1/iRqAu
	 Mkuza2g3/WjVrMe2ZDHyTR9y7VHc3EJnYziVjL4k+2mzkDAYqATwSjOkbUGLgklub+Ram
	 BJge/qhY8AbbtZnmhH/Iz8ABbYAOCE2/pf9ECqQZb1uYkblWdMYCfQjN7A7XVO0bhUhmr
	 iQu+W+xy+wc9CPv2kke2qBu3yxKUU8wsY0m6vyXSXBhNMUPxTLSgDmczqmZnF1svGBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924267;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=avpie06ffbsxP43R9l6hvBl5iOUNb2EQtXiH5mSQUfHj74GQl3poXTm920ykGmEbq
	 MUsoocomfI6soLTUy9iTuOORgcGU+dMN/nmuP1IRSmx17jkTB60xc/oFXyrPt9KI2q
	 WHMbcjjgyat7g5ByyDTJI1HyqKj5H34ghVyquBtsqpm8lW24hsyWJ0zPSRqLdjL09i
	 w73718B6Cxs7nmyOkWF1mALtb2NytxaY6geq0bulJZxQvVPSoOX8jvL9CuqZb8Ia8d
	 /je7dHo8gQjUu1T22cnpLRfiEM0SJpxEQt/G9+Pu5W93498ATTq60EkKn/N0Gy2Hb7
	 bojFdSB3scL4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33BC640DEA;
	Sun, 20 Sep 2026 17:11:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 668D23DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C91060702
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nG3bek_zn9xy for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:11:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 222AF606FA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924265;
 b=UGNhYoneCU8Eav/qYTXcpErBASbEoWogrjN/ouY3SABbG5xG8/ucXER3SoHzw2Ef+2+N
 hY84JA7PKaXeD3jftJ/FM4pMahI902B5qtFfT/XC0KvaUOqL5umcmwAVf1KfWohx1B4UD
 G5TLD3xcrYcy5XsMj9u1vS3bipTvYAPir0GLGCkXXCK8tkXuDTEvne99kqfGCR6vD5K1n
 fRqaDoGpvThKPROzdF+5cZjG0gCT+DUpbNN8e9pdMdpwvQDLlsNBbwBpIqY9+2hzUqRW/
 Sl2oOBWzbjL8HAlS+IihIpKWbiHBcs+/JLmbyqyKSHGSjXao3oeAKpkClkFqKil2s3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924265;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 b=dHJdpUfhRVNKqy64n6vCXs/YeTFHp8m3tRgB3whSTIh0C1gVlpXLMc5g+aT0aDW/Cxq7
 dtqF6ufHvBPPC2uBKlFA7BFYfTj/ZkQ/uKEC/xXOXKc8vZuoLU0LjIS4ti3kvhVQf+A0f
 b+WtRQFvpMTa72toAgwKWFXOVpM34iR+Z20/aLvbPP1iwU3fKpwmR6hp37T5UtwpgRU20
 IeYhvEb24BrQL1kSXV4S8Q3nNfkhzElbmDv2ftavRAyZx774O+EgmmV0KP9CmBS1d/+qk
 T2iu5e9KPvM6VHvNQ4IO99WQCViNAl9k++RlTztXOkGAJRmkuS9pedigazo9e9wx01g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WhYGg3VD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=WhYGg3VD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 222AF606FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924144;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=WhYGg3VDL9TVCFmS4C62TNbL0ERvA1esf50olIBxSJZ5TvjzBp7fFHtBjUONGxH6b
 XKpQo+/R85J3URP3z0FzmAIudQ6QYfrOF9+dsYTGUdQPDHf0UGBDl7BQJdb7KY3ozR
 7nxaCdKoQd6i5EcRMFl0wpjEo6+Rke5C3jCf2gMyOsuqmhQeZdUPEvtnvaDZa07Bx2
 5rJUik1DDfdpRDyPTG8seZarGjkSego8NZy0ZLcquR461GtDvpTH5iZJpWitVxrewx
 iexLVWSGTAxQRJhqDKF+8ynBbamjBLESc4ZaElfrJOSGC8Xxt1kC0iCO2bxE64aVb4
 7mcSOlwkWnf5w==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:QuOHeF3RA/u36/Tpdrq5bmOfNIYBX2DlwJW2054pc2yU5BzNLgPhiQakhNJFyV4yRkWYrAJh6bDJZ1taQRLsQX4gxXzt3QYGTotRdP3TqMICoWnFVQcbdfQcI2jqDqP0WJpToyY866BuYfJzNcXDQLVT+vyHfy02hv8tnPiYe47eau6KnsrLCn6c7DV9GeboM93UloSSdU1L6NXv9nkDIDBq2gbn/FywYqRGTFPxrlDt/tbIS+DYntj9v9A36dGNG3LHKBhtxype+ZDfrU/hBwhzZe6S/H1+A2J1VisA07C5zTJ9x7jj23VQYOGRB2SPQrGEHgAXCKws9xJAJQKNerdNl4uiChRQ7eBDcC41hG393n9Qk+3CD9cQhsXvYxzP0bPbcsSlMw6BcH0bVCdAVrXhDC6yDX5XjJ/hX7hOLu8L7Px33cktwE5fj1roUm3wODdOHlJ7BnlIiLs8b1ReGS3ulPycC45wrLqtXZJpR4w5dxCwHK8r7RnYlgq01mIG/nwc5oeYVa+r7d5GtgNF3I8HWeXPdjiiBR/Car+jT6du3C9Cw82E4/AliuQ98jYGh5btTAjjRVFoeUVq6X9FTh9ZQFMQOIXa64hF4UxWya6UHj
 yIlmSNXG+kK099+/aHWTeirWdE9vi8XHWcbq0oGo9xJ2dpU94uHqnPqjkH2qJeU7WJ1lg82Q0=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 99540A4C4870;
 Sun, 20 Sep 2026 19:09:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1g-000000000o7-2lrL;
 Sun, 20 Sep 2026 17:08:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:09 +0200
Message-ID: <20260920170815.240247-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 62/67] package/tpm2-openssl: Fix build with
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
