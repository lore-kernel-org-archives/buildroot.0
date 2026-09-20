Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D16C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14C9C40D74;
	Sun, 20 Sep 2026 14:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vnW8O7-6BLT; Sun, 20 Sep 2026 14:08:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 21B9D40B97
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913326;
	b=lf+JOnPknbECmNIS4Qmi7Af/EhtXLdY93YuoqzzJM+eiTuvQKbzH9r1XalFgeS2AJLOT
	 b1o2ygQNliL3KkUI4pDkWcx9ozfJjKRsYTdSMyMNSUkzJZgi4rtm2PFpL2z+1nLxNnhP7
	 4/P/jbessYZvbdLs32tBw8U7oRVU7eUBnHpYzD6l/3IKtsHSQ3fLE8ELImOMUIVWGFgQ2
	 m33irWR3cBCnHNliH9oLorT2EX/KqxGywVr15GGwBimEcgIn52mCjYmz7f6BB+G4mDdsI
	 MHcCwBUjolunWuHa+4FFfHGSDpX3Q21oKjx7RGJmDIUcZsGUjT2PxR9CQUvU5hEj9NQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	b=JSCe340xP6ttHuurWTwlHtcAJcLrtVwj3IfjZ73fLqP8gFxRA6S+PfISL5ZHnLseLwsm
	 QsXqpvR2Xq8YyqvGmVWhWfNVyRD6N4SBr6w4XJL6py0g82V65Y5OvW055Nt33JHPRgloJ
	 jieOXPRVakUxOHlMpuGlIar7gEoUN2yqMFOiZJNC0g+j+fDUWLZP4GnIR0hlRLHdcdVHV
	 G8MidvgTGCg4UNhm8BJLUSmE8eRAdLWdJuP3PpLT6BChN6dDTmpqBDKshzdeTVDlS92Un
	 rx+O1VRXlS1ogzp7OeNLZYNg4e54+I9PY6TiYRYSVrCXKukwx74WF/POLcTEo+BSEtQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=omxMk3G2;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913326;
	bh=VacW+NsjpajcZ94F6kFT8/ntV/SIp6bfxfhI6YFTcXI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=O3KkFehWX3TJVKI+2l2CWtit2DMp8KF9K3sOIQmR/Kmux4tGi/9Or5OtkhiwEIijF
	 g9dQXLjbjhJauLwXcH9TlDwD2iVpNwvQekIT1QSQAu50NF8sbZgwQSgdo2FbypI3si
	 5bVw9SDPv4wHHe8yDuV1kVBYogaiddPy/m5nSs+8ZlF/avp13KpGRl2SMD4EswlJzz
	 YI1qq7WIznqLHhJf7oP1W0IMdGTihiMoy5u7vhoV6HDIC5l8RmLMMFMFkp46yVT3gI
	 0gfuok3e6fWy24h3XIKOm2JSVvarQ9LkCuXpKmVHPCNrx3oB48VHY5FWndik63mI8D
	 4lopwV5bVaZ8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21B9D40B97;
	Sun, 20 Sep 2026 14:08:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7293A392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 647A540619
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1NPJ5FbgLDys for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:08:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 17A7E40D6C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913324;
 b=L7bQNEIHt5adKTffJkvuH4c6XqaKYTxm3RnX6pMQriEgRYE/mZYwxRi1yimdVgxPqj6k
 5vzjJtt4BR4QgmETV8PFcz7q3lt2I4b0TnxX3QM2rxvd3Rm7a0P4KMeM0XCLoWFslDU+l
 86T4TcQoKCoyt13X7XV2Uw6zeHd3bofPmGWwa8g+OOLakxlKWdMR60jw1dTlJcTt/lVeu
 MBcDT2Tmrnj5w5Vv8iuKpGhlGlgfv/dc+G3ehb5htX+cY4h/do8qOg+8lIJjrChoHkGs4
 v0KQUxRtkrrWjbfmrYGxDj7cSerDjM0pqxRQYOVEC+yatHFEFNgQPJjU5s7+ZcyPOMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913324;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 b=iLjoql0y5K6aW+3NBAemqY+iP6s4GvLBYVEgY66eqTnmNKr/JLtqbD6G3XOfr0zRKuuP
 iKz2CYVFc/QnuSnPwcrYU2OR9vzfpQLpqbxpad0dnXm/78CiXUOpXXBqakF82y0oHUXke
 ztlWTc27gLONP5DeXyWDAkdxOtolvmVU2vK3r5mGBzIOBgap2WDxUl5Icfwlk0RTkBN+8
 iceKBDbdAU7xzp9tlYG34nA5OmbUyqTblkon00o9t9Y+aevM3Ll0QQTyoDfynsanwtfA/
 ySk6dcZB6cfUWqDmrGWjzA2Fefg+spIiS7PoXQobwA7HJKqSjMQZ3DYg/2+HH+12pIQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=omxMk3G2; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=omxMk3G2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 17A7E40D6C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913223;
 bh=lxHPveSr1VGiGkaF1GldymXblyXn+Ao+DZUu0BTbXo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=omxMk3G2It/qd/a7kWL/8T3JZF9MtSXXQFKPj3joMex9X7sEkc6C8Kl124SC9TvD/
 QHm9s/s47yuiPDr4Pne02S/1j3CzdnTtGXZRQKMIJV8fFDrA3rPmeWdv5BPFdPmUG/
 1BxlRlNEgt9KF4j/GNEpqWZUB2dHTW/H26VH4Rv6kLlLAOvBchzshUy8ud9h0+huCJ
 YNLT8OhQlRcLqrpeJs3iyNsLQkY9x89Pzi2lRzHjg5PenQLnfS3lykSzRA0UpgT4WD
 3Z6ytJ/pp3bIpUdu2+A5idnyJdF9bkHlTTn5+3mFy5hP6X4clUst3/PIsnI9ZdEk0k
 p138tcLr1DHuw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:8zS4XSrIrOZzy3LMlPlASuWkakReAa5S9CZKT+RSFAZtFdmM4Ean4gRnpK0MB75RIuT+FRwR/Q0/mxRnVwjqaOHTsZAs9wBwEEEGslAK8KMbva4rUoDvKprX95fQzRObv3fwvX8kJF0UENyDwtzRnBMDLwuSn3kdtBcTImwdsMTb5v+4fQuqRw0PRQtPggnBlpfkqpToMJMQrEy8k4T3Qx442VySJ3Vk+tMYjCkHHa3P072gAgtwgShg7qT2KfzJr6oXbIa/5sMKe1uRjF525y57gbW6ZItM9/s+OHYkjVbL3gNR9tBDJQf70imjfOFaP/lFqgD8jj/qpcZfuSNvOAzroPc1iZUC4FHnLpPP5vBfEybzY2H/VV5dxoa9xsHbYdUW7q0ZQq7Evd4sWnysa0ZhZGRnpsD3VaOV59ewksXYuSG4e2CPRL714BvuWmtfggNMO+SMkFHCmOf17N7112rEYrexPgY/W9UFVRjGjjgVp5Pw9Dvi9u/0gbRLQ2xHO5l7HKyAjFD/UQBL7uKbIYORzr01vzIxDZpHinSb0uxPk7gCKyRa97p8zsHL6jPpwa+3AkESO06HpOor0JupxvVD+RyElDQb2NKI0fT0al5nmX
 itzujW8cJlVw+umKmOse4x4PSR3qzZWeA1Z3k4x7hxCFmhrPltsuCwdc1pOS/zjkWTapiNNwLx
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D8E79A4C4857;
 Sun, 20 Sep 2026 16:07:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBO-000000002J9-3hSa;
 Sun, 20 Sep 2026 14:06:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:59 +0200
Message-ID: <20260920140605.3005461-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 61/66] package/tpm2-openssl: Fix build with
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
