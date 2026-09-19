Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB65C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B7DB405BD;
	Sat, 19 Sep 2026 16:03:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kk7ftvDLzb36; Sat, 19 Sep 2026 16:03:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 23A00405F9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833794;
	b=Zy4ACyMZtk2L35NKjKJ7+k5tfpI11kb01G9CZFRBjmMG432dbPBDwihAULyf888tf/NC
	 h+deyvRsxYDHTTfKlzjOEYaUMmjaNmzfOrbPDq3L1N4NzpU2a1ZFc8lGPCQnmDtPERg3X
	 KZQPYKQNCz3RdCgmMp1/J5R30lcOiCDBshNlSUQDEuCW0gVUwN3WPrpoP2UiQUraX285s
	 kZTMO0aLKc6k7w6UnCDVSgzCoYKDIQqGwDSZJBf3Dsf56NF4OnYFFo91ppjtvWOF8MgP5
	 HjF86mntCcSowPvK26Y3o01xTWE5sHfWzyo7iUFcLhIdiwQLMAGDEttKFrKGH7A1lUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833794;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	b=IjhlUG/jAOsbOpIxnHKCv2wG1wlEemjGETWDTzBUB3ChfHOkIazz8T35e73uLKN0O7/p
	 2LLD0YgAbmEkA2aFyQH9LkCbFY2/aStEBqbo7GAckCtroKnAePbqR3XxYMghdUbFCECiK
	 VFTrLqtGYioFDfR1VV6rkXxI03GNx+CCLFAESeWtFlZPvnoSF3d8lSQ1cM/iJYwTd0Om/
	 56A2E/pay3L5//QERn5Ujzb6B5+k3HlK0Oj5taXCCSryFrTJltov8ml9ybRGGQ4whzN9D
	 YjYigwjEo1eUDBwUeuG2F/r8d2n7nGKbUpDywGL71M0wrawmuI638Lt4hIFJMpFNTKg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833794;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SlM+qKcySDTi2kvBrgoOeoUCmvy7ttAMHmvehXSa8sWja4enuGlwfcJUFVhM3b3c4
	 Hv2fAwtZcBZgj2EZxt6vKazGrRpYfriFdMsb2zlqrPYA0sQX9lC3oBd++Guu7so2Qv
	 qopUJslmiDtX0TDapWlfz1X7bWOb+w3V6FuOwZWXlXNj1WRTswZ8hZ/08yOq+1WmQW
	 FRwMBNChILTzsg9arl3h2qxp1xlB7zN4xrRyHQ5j4/cACvYFg1lYDQqwMO42rXDWYc
	 HSAZhRWsKiv+62waPYWFxo7IYYuvsN845xNhJeQRR9mouHdaqpdtrx9/3qamYS7o4F
	 jNd0Ab7UTuNUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23A00405F9;
	Sat, 19 Sep 2026 16:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2444B24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A89660673
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b55M4zTODm6k for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:03:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0C1E760624
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833791;
 b=HMQNRrz1kAFJs5DEJhyMqS5rBez9WTt3RZPI1JLB9wY0EK2gG70ek+qpf14k7xkNbJMn
 pBtVPSI10+g2RvmvDnrNWkG275O/7x2XlV5PnLniqwETUUn+dtnfgOHrevwO+m7+Skri0
 bhKgfnvI84gGWyg5VyGdTamJ20OLHolQBpN1CtC/f1k1BnQxwTfmdiKhmVc9jg2AeESBG
 27YtO63ZoLOLvL+hJt0PEAkn97o1a3NqeYIzswmK88XguHrZziaEPOOsYW2FQiBhXvZwl
 489v/xaagEdBf+5d4UMOtiklp31mVl/8+WdXHaohDFhyPIrFMma1oHgSrMck/TBVIoQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833791;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 b=cQPtp+INMHy3kSqMe0iiE2TsEZOTdRWXQ78dmDd77bmQL10Gi5u0Bda37qBEYsdgufue
 elYLeJDXH7vqifaRjtTT+ruRSwZ4h9iGocgHWmTmC9pU+qnLCZ6g4MmxTuEESvINnaAqJ
 Ll2ictB40oMSakwwk09C7rqTe9jOiGvEm2P36qJ3HqfLxDrFHDo+30K3MnJE4Tg8j/vhE
 UFkOctjpgRCTO9Z3xUkoIYeGvJ/l7hfszznkBfOvB8ZBUbpfmCCglqjCMtR2tGOHZLEiC
 ycQxAu+2jWaBpbGDLBOvGFLApmqd2WL6YibvT1BHKk0ret3WMkT4uOME06b+A3BG1PA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=EMARZA3c; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=EMARZA3c
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C1E760624
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833543;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EMARZA3cQvfu+vnV7NLIIJSB5mXqPf5HC1berOXLP18N17avXoyZ+hB/8PSzLXZIl
 dnve20whtT999cRjBWBrYyK5yDs+uB6OgUUcoXr1aqHuAN5E97Rco3PuFDZx9LuC/1
 oFZF4IXC1kd/972e/bvG+uQLlroWhlZ4GURSI+ymbzEewe2/O45vsXZoCl+ddRzaiF
 iVMpw0OtyvWbIt2OwCiCSSH2iSKQpPnoImWCt81HXzB2sQ+JUeBBbLeV0L7go0x0Le
 4LVBCGy+9n88ScSSjieIj3sh5tHqJves1hyl8f24M3f74hPcAMCjZnrFlSM5jzNbZK
 t6J77RxCVSjxA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:ut650m5NXuOKlBSQAq8Id2TYOU7QxDuWaJ42S5XSkCTLoxdiaaEyGo6+3Dbq5/F0xIjnPX1DIMpXCSv+4xD1wua5aYvf3mhV72U31yLPcIJbb4qz2qO0aQfu370/zDVWQt3nRdXY2RO098pQ8Oh/9MzaKL0MGcXbmmoWEeSlLCHZsPdOAGuSOV12Ahnq9ZKZZx+qLNJnIBO2J72cfQcNXyczEiCnQ8h0FkuqCULx5Tt2Bx57AVOyHidNHrTQ9usa/PPYrymsRfTlAgSFI02wdbBy4Zqb/uudROK6Q2fuLrCfda9x52YdFRI0orKvqUlMsfcRj/WH9DkB9UI5boma002nkKKvwtUpnBDQsypBLkqxWZhhJqlAjjbcotyVDDVq3XKMmFIcJTtiK4x/rKcaXmawYiLW8d5rf1p1WfBRrZimTpWas8dHEjT5RZd7byTBpr4/BRD2dGf/mvd+2hzUS3x63clwrLlU+qGZqo/czFQRow+utFrDWku0Jqm6U/2OyMLd1hG5OeZL/tuZpombRxv6J6wuSKjcMrpUi/87/bQ3IyIyveJFxsp+i09vGxHfLOD0E1/5zjPr+aU2Prc/Wxvklc2w2gxFrGs0lIBjLfhObT
 cGgUS/ghcvkUaeo2LnLC3DyqSm/cf9Z8gFAoEPISZjqovscztrnb/PvOz/V7x2NBTwdlZ/
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 65600A4C47B5;
 Sat, 19 Sep 2026 17:59:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSw-000000005Jx-324M;
 Sat, 19 Sep 2026 15:59:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:36 +0200
Message-ID: <20260919155845.5776-72-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 71/77] package/tpm2-openssl: Fix build with
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
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
