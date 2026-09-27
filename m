Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D617C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1872D605E6;
	Sun, 27 Sep 2026 10:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFzm6-ErsJ3M; Sun, 27 Sep 2026 10:48:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 17914605F5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506117;
	b=a8xb3U7R2tA3/38T2BGKj9Qzmi1KwM5/Jh+t/IyLN4Fs/TBGqQHUG56784Rp2ZPLGlq9
	 9qjrrzfEuUXh8oQZADryAb7P0QhzokMjLH0n4cVieDm3IhKPSDDj2DyQ8JDqX6Mav9AiS
	 7UxVUBj7dbIjY42VFrMXIddp1RCagVYP8QRiYwXcKi5UOYb7yircY6oVvw48Qr6kh6aD4
	 5by+Enfe0hs6StCa4EIoYztJ5jJyNr8d08LqJSJcLYcR1hjjFJucqFw+Er6I14mvDJsoP
	 mskiGcfUytBUZpxLn44ghqLjuuFSDNdC2INut9+9ATsMVILawUVdfVU+S0M1ZMO/Frw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506117;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nLodmBzWyaseImhT9sqxjeRFfOH1smt353dHfG4f0Q0=;
	b=rz0r0+Fi9XWVtgqAoB4ttQsqjrGAcW4xFJkvqerDhcOa7Rbngo5SRVkGxC39MkW9e7Hb
	 GA1TRFTZTCLOA5H0iLhS+WEjDJWNAAPttsZsMGpht/eYP9HFm1iSNcYOHb4ze1hJd9vd/
	 ZACkg053tUIfFuEmt1MVxz4SXfnuAbQEfnV8Zcd++4iJOPTZw0mX9kpES5Wy9keH7CFoc
	 YTdecBsETvPNp7lBg64fqgBLngYnIW/hFUR7p4IAze1N9LDxl2KMlXVoDTHYOsAqIJvxF
	 MRZqHm9F1lZuH1aXPA+o0jBZ8uoWIK3TG59oMxvgl2p3h2fdG4ixd6lzpk+kgQGfYdQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="GGj/R8hW";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506117;
	bh=nLodmBzWyaseImhT9sqxjeRFfOH1smt353dHfG4f0Q0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JhDmw31OnbCG+NoS7rOxsw4x1u0b6syQ3hkOSBxGbmHBxzKM6FEJGqwXZHLoUcrh0
	 G/kJoJ5BRJyg0nJgCsFQaeNzHpYjtgf6d05chZP5ha0RjG40oHPKz8Tjd2AF0a2w50
	 MDkeFtgAKPBYV6m3qNjAqkNJwry8+nhApd+kBl7wgkhG8U1eLFE0vkxFVjKNbWQZ1n
	 BYz2kBfzbrMPCwHpjwd+HXYwegrpeXIF2sCbtj3cAXrHTJdTtOQA+MIrv1WDYErafr
	 ljg0ImJGVt6S8gwYrs1zrAsJS70AiSgJIxBbgpYEwhT1W9/HKVpTe8IKwG0eogeI4j
	 mSBJnhiqWibiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17914605F5;
	Sun, 27 Sep 2026 10:48:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 857CC334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82AC5605F5
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9jEgOgm_je3p for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:48:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 51FE8605E6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506114;
 b=FDoqFVaTk+vRd+Kz6zhe5c3tRlD+XJUS1XXACGHKAHDP0lkVhCX/BBjizfAvk0iwCFdU
 q7ZcBgehlDR7V6kE8jemu8ItCuMTtzgIoaxSk1GGMTpizWXMDIhRhXfzEXte0JjgJE1wr
 VW28Sd3O7Vv0ZpEfvwLF6QCsRkXCXHfdDelAhI9bNl37M0n37hlDD/md6NlPJtQVA/zeN
 YXKWleS6Y0oTQ/U0xJB/2Y+AXsHJA9U1z5FaUkLCiteSEpvacuw6z9AfKEgcwYZIHL6UR
 v4Xgyu9GhRoMOexR5Z4xC02GI/AQJNFMspymNmH9y7meXvNiSTKmlS89TB3V9X5MMEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506114;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TASkiw1ospBBsSRdHzLiYsz8Jx6DnDQGaM/U7tGIge0=;
 b=MxLnt3nwTNmdyJtVX81/9Fiso1I4WO0E/DhMCC6rDZtXxeOmr9oDEM4YUsvSXYsT8xmD
 I+5h+jKmFhMn+ZXrs8Nm/3pJ5mP1/aKtiyeAFOSPuclK6HOR0f5EL8ZYESLr1wzE81ORs
 NvPAoP4EC0CrN+6YjOfDIvQr5R9zmJeJUnxT0wJ/ZHVq0vxSZGCIxOnA1qbEyvfNq8/8X
 mVZ/oGRv8wHMcy/4HFic5TfIUm9RthU6GGe4z/aBIhfBtQO8HsgzgEyW9p5jBt6I4pCAx
 u7VsMPeVaZ+gq8PkgG8ivSa1/NjynlP78yVzBtjQ291ooLwWqnZweYlD11AGVORK5Zg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="GGj/R8hW"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=GGj/R8hW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51FE8605E6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505839;
 bh=TASkiw1ospBBsSRdHzLiYsz8Jx6DnDQGaM/U7tGIge0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GGj/R8hWOy7tjuBF5b+hmdySr0aDCPeaDe88dMiddZvKXiIEHtHMyIGkpjzchgdQ3
 acvKgAdhHy0vSNOBAvGJeL/NBlKq1rYFMLaaTKrtednH/L6h6UEW6zgZ5tz+kUvnW2
 bdFOZ6ItbAWIEXvI4RVK4X0aKsyr4lE9cLbVxGmsRECX+5cJQubZiZNVwn/2aXeENx
 Iq8UXgi0z5N9lvBWyVy2714WIWbftPEVjE/XU8nwPVgmh+ftTwp1wzDmimO0Fcwvtt
 66eLGxFttlzV1bvjdPuYpEJHd3jFo6mo7EnHo1/BBUgNCLoHmp3MKtT2pQCBIcMr8T
 TqYzxUMLt+pQA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 gsrs6qbnkJkwmfH+BHV/SKQVdMo/NrAaJeFsmu+34aRGwykNm8FAWm1BQd+1g8JwHjb9GGvibXN
 Kb48m/bemp639ZwBQs/3fhElVa1LJj7d6gqD8grSbA6WSOfnJFM9C9wDOYwW01LWFfvxXnCcY9U
 i0WStz+BrE849jWHjTMln+vBmdzYOZj0Be7shyx+MAoCYmc0aUyQxodYVR0IsE48RXLzG1MeSd2
 3yjhd/vugRQzz3RmAVe4x+RPWdBSTtFct3qY/4PQYPa9CTiWcpweIw0hY0BnF0/q/DX3F4S4Hu0
 Pe7qrPCa4gn8GBVSxIXG6KM4oeQ50a37PJUtgnf/JN8sqFSWq1C5RUVjEMt00frwvXqW+YvxlNK
 4WdAebol/QeabubepCBgwzFRKHnkRTAib+mcQ9Z2kpH/S92sfTlRdvD2GzWisOY6QvFM4J8ZUkX
 31ZVRTUURy9USIewp3IOfX+2tvKH4YFJXT+VvNc+ItI5QfYqPlnIdpDvYAIbH0Fy1dJZyoZZUsi
 K8fJFbrVb7L6E3XceHbhR3K1oS7sHXWsjo8hHbLEgZ4fLjI5QuReXlVDGbtCBteeXFnt4yk2TlY
 YjE9w6sK2WfmnFDlJUiFnDgZkAA+XCmR4CHPY2u3utbu1AVwHMsYq6BLvsxZi8198govPzbMIVh
 zOK4xrY/kI8K/aqGxTaOo
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 325EEA4C4F80;
 Sun, 27 Sep 2026 12:43:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLj-0000000007a-1633;
 Sun, 27 Sep 2026 10:43:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:52 +0200
Message-ID: <20260927104301.1801638-75-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 74/82] package/systemd: Fix build with
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
 ...compilation-with-openssl-4.0.0-beta1.patch | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch

diff --git a/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch b/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
new file mode 100644
index 0000000000..d38be8d51b
--- /dev/null
+++ b/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
@@ -0,0 +1,86 @@
+From 693ecaac7e12c120d1323478b2433d77367aa0c9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>
+Date: Tue, 14 Apr 2026 18:59:07 +0200
+Subject: [PATCH] various: fix compilation with openssl-4.0.0-beta1
+
+Various types have been made opaque, so we need to use some accessor
+functions.
+
+Upstream: https://github.com/systemd/systemd/commit/693ecaac7e12c120d1323478b2433d77367aa0c9
+
+[Bernd: rebased for 258.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/sbsign/sbsign.c      |  5 +++--
+ src/shared/pkcs11-util.c | 15 ++++++++-------
+ 2 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/src/sbsign/sbsign.c b/src/sbsign/sbsign.c
+index ee1c0f77ab..f54dacf65a 100644
+--- a/src/sbsign/sbsign.c
++++ b/src/sbsign/sbsign.c
+@@ -262,8 +262,9 @@ static int spc_indirect_data_content_new(const void *digest, size_t digestsz, ui
+                 return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to get SpcPeImageData object: %s",
+                                        ERR_error_string(ERR_get_error(), NULL));
+ 
+-        idc->data->value->value.sequence->data = TAKE_PTR(peidraw);
+-        idc->data->value->value.sequence->length = peidrawsz;
++        if (!ASN1_STRING_set(idc->data->value->value.sequence, peidraw, peidrawsz))
++                return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to set ASN1_STRING data.");
++
+         idc->messageDigest->digestAlgorithm->algorithm = OBJ_nid2obj(NID_sha256);
+         if (!idc->messageDigest->digestAlgorithm->algorithm)
+                 return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to get SHA256 object: %s",
+diff --git a/src/shared/pkcs11-util.c b/src/shared/pkcs11-util.c
+index 165fefbea1..96b25c4ac3 100644
+--- a/src/shared/pkcs11-util.c
++++ b/src/shared/pkcs11-util.c
+@@ -555,7 +555,11 @@ int pkcs11_token_read_public_key(
+                         return log_debug_errno(SYNTHETIC_ERRNO(EIO), "Failed to init an EVP_PKEY_CTX for EC.");
+ 
+                 OSSL_PARAM ec_params[8] = {
+-                        OSSL_PARAM_octet_string(OSSL_PKEY_PARAM_PUB_KEY, os->data, os->length)
++                        /* We need to drop the const from the data param, because ec_params is
++                         * modified below. But we'll not modify ec_params[0]. */
++                        OSSL_PARAM_octet_string(OSSL_PKEY_PARAM_PUB_KEY,
++                                                (unsigned char *) ASN1_STRING_get0_data(os),
++                                                ASN1_STRING_length(os)),
+                 };
+ 
+                 _cleanup_free_ void *order = NULL, *p = NULL, *a = NULL, *b = NULL, *generator = NULL;
+@@ -683,13 +687,10 @@ int pkcs11_token_read_x509_certificate(
+                 CK_OBJECT_HANDLE object,
+                 X509 **ret_cert) {
+ 
+-        _cleanup_free_ char *t = NULL;
+         CK_ATTRIBUTE attribute = {
+                 .type = CKA_VALUE
+         };
+         CK_RV rv;
+-        _cleanup_(X509_freep) X509 *x509 = NULL;
+-        X509_NAME *name = NULL;
+         int r;
+ 
+         r = dlopen_p11kit();
+@@ -713,15 +714,15 @@ int pkcs11_token_read_x509_certificate(
+                                        "Failed to read X.509 certificate data off token: %s", sym_p11_kit_strerror(rv));
+ 
+         const unsigned char *p = attribute.pValue;
+-        x509 = d2i_X509(NULL, &p, attribute.ulValueLen);
++        _cleanup_(X509_freep) X509 *x509 = d2i_X509(NULL, &p, attribute.ulValueLen);
+         if (!x509)
+                 return log_debug_errno(SYNTHETIC_ERRNO(EBADMSG), "Failed to parse X.509 certificate.");
+ 
+-        name = X509_get_subject_name(x509);
++        const X509_NAME *name = X509_get_subject_name(x509);
+         if (!name)
+                 return log_debug_errno(SYNTHETIC_ERRNO(EBADMSG), "Failed to acquire X.509 subject name.");
+ 
+-        t = X509_NAME_oneline(name, NULL, 0);
++        _cleanup_free_ char *t = X509_NAME_oneline(name, NULL, 0);
+         if (!t)
+                 return log_debug_errno(SYNTHETIC_ERRNO(EIO), "Failed to format X.509 subject name as string.");
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
