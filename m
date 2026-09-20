Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2DCC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB45402BB;
	Sun, 20 Sep 2026 14:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOBWa2GGjvnW; Sun, 20 Sep 2026 14:08:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 35B4F40607
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913289;
	b=o6B83ZIOd8cA3mDq0L3EMCwRMsot4RLH7y4Fh0VZBNh7r4Mcn03kgeBLcofAf0MfCW4g
	 wn1oZtDFGdca3Ldht4R5hI6AT/sIYEdIgsiY45luZTLslIn2kCgTMceE54UU3okJyGh8X
	 Ej9dTJl1I1bcRQ6fE1avM9X6z0wCfKuP8uWYBmi2USwss3940VIu+2Hic0QAZRjv+qXnR
	 gW0MphCJkbGls4FOOXQF9ptPNGzYYllwzg/h0eqxB6eH2qP0mdlSUd8r7dzuolMt9FVz9
	 x+EH+uiU6YBTBChPYMLDLdrkzqfOwW+ulq5jJHOoS969EDVntA5ztYXUPRsb4pTDP4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913289;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nLodmBzWyaseImhT9sqxjeRFfOH1smt353dHfG4f0Q0=;
	b=DuT10+GgPbN+BQL6eREPZUN6zap2m2Pbs3nH7TxLiSbtatmo0pJ0K+B17jdaXk1vHk5h
	 LwOEdA/GOJ/ABhRHhqeFkTKLKHOMECzYCJCXXppZk2zBbCHWSZtM+BB/g0ABjIZZVv/Cs
	 6DaYuvckNHaAB4lI6AVkO/y/BlDtAuiqAkQjyOsQLdXdM7eK3aQYtacsxVHfiEmWq7OlZ
	 pNEf2wu3jg7YPWq8bjufl0DWyUsKywYOGG+EOkyNoH9+YLdbypFJ6eULoSze3wC0vqloz
	 IiQVc9NZhAqDt4/YEUa+jc0KEWovG7c8fxal0zVg1vsgO8Dh+z5mdrQzYGttcDHT6bQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913289;
	bh=nLodmBzWyaseImhT9sqxjeRFfOH1smt353dHfG4f0Q0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lMNiA6mbRfxAnKdxmdonB2IgX/5JYCCE8XJHw1UguVRRBfBR2q+508mOBN7lJfm3j
	 c0gkJVAlqNNUChWdvPl4MDtV8Z/cn4i3v1+85E0H60w+okJzbPFjIYu69HRtU+rCPH
	 /eVWX/IRp0EfVyCnUZo6OrGjKUs4WvcAaT+QbBsdxvDWSzVNj+Nt0kcGQIlLVuBln1
	 fKX7jrLjW3WW3omnIV+wbfR1DwPl9mAWcQKHWzYg5CV+VMbmExRv/h9zBfUVq35PDK
	 +F2lVA3M7vKru5AIhU2mDwUEkgU1wvlRhCpw7rrBCyJhBy5jlsVuGGB1lRvnCZjGJ1
	 K05qV4pO72qDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B4F40607;
	Sun, 20 Sep 2026 14:08:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 09C1D392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E34E04005A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSEESZAoECBz for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:08:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C9B9E40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913287;
 b=Dna37gKFiXNMGrhMzFW1Etg7w+BcQRIlUQkcZraf1l7ERTB8wOaboc4pW6jcUTq40XXn
 TAmemdEiiK7Y4Vu/ZEv4aFzhAaCAEXMaO3rDxXObCpORx1xtipND8DggIe1yEafahgzhq
 fhdMbV59oLrfh92+ysw/gTnQDAVqzV0yDbdE1yeD51au3NS2dVMX8Oo6yjF3TWXYNfM/8
 OZ+rmK1GuXuce2VDV4Re43S3A8sECpVmmCKuGn0FAvF7TwcjmfEngxcrSZ7v/m8btzIfN
 o+2Bcci/uR8Ln1oTLJhBuRG+jl3O8jmND9q2MSd2EFzWxM8IhPY25pz9K1y5gE+GpEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913287;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TASkiw1ospBBsSRdHzLiYsz8Jx6DnDQGaM/U7tGIge0=;
 b=Bi0FTz3tx8CwgQbCzmPHd9UimrDRAiVvUCyILIi7p9YyWK57gCLisxSXDo25vNQsMVql
 8iRnMZ+f+Y4TJRaqsEds3oeB5DiTfa29dwI3e3XC6h1kMe3KiWsZVFd6DUZDVmIHwOBxI
 G0STx443hAFYxUnloe6dgx1LF0tya8euQkzgmjIwjSVevxebpiENpWyZ7hovJr74+NRXm
 DagbIB7JeZZbagiq2aBGawrydlB+YWVtSZZp2u2FNPzSiNgZeDuiIe+GonzoZhaCUwiBv
 1l8VhHFbGshNYaOGUmNtrOrCIaR6m4iyIyJ3wfGDJcJoHtk7+0fmGoI2nSyTvjfLgqg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QOIIiL3F; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QOIIiL3F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C9B9E40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913222;
 bh=TASkiw1ospBBsSRdHzLiYsz8Jx6DnDQGaM/U7tGIge0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QOIIiL3Fs4MuidEkyd4aqavQrRsUw6AiesyN3bORXgDO8y8dvwqbjdPaCY8uNgLm7
 JMDYxJH7eHbr0YSPiSKbgHRiMrn/BOpwyA/kyD8zS7cvgmSycfdZQ6BZ1UK1K2pSjc
 g8SmUvFQwhsIyUxfhIGFMu2oSyIfb0jz9aeJbZt/MQyp5J5JFYDXFjBMdAjJJBKLiq
 5gY5KSsoVQnoAZR9RujT4oP2iy2ykL600Wv+ZneBaFbBsqAoyyP2X1Kqv7RmiM+sx+
 4w75XHzPSj4HkhzQ5mQNcj2XPvB7ms/Y/pf0l/KEzvuWH4xR9RZtZHV0YRAJfmXCzv
 7xjPdHz+kbBvA==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:5KEZQX8F1SwTF62Jy3HpAy4Sx6FcQDTmbtfE/rYGgNYjfiLkRAjtTmTAK/ZZ8e4CMyqLfko2JOKSKWoxjc2KODDYRN33EAQepzFF0+B7RcX7fP8XdfJQb07H+YZkD6RuiMirZdyeyaOF/cw8ecec8DdI1HfKJg4c3jGkrVBEL/dHWcmimHn+sRKUQ/jK0Wn5a7bPgfaNFRhfYVm9Z5ead/8zxBAC/aNSkno9BwcSvyRJYCp0DSXE4ftVT/VuzuY7EpXmshZVOA6+D5kWz0OjhtEjGi+LCB7GVZ22yhnjaXnZCtiguqYg5K4XtDClXBrC1ReP5v1SJuGwAHbb4iDOPRbKSdyYPhGjKJ5/0ojuIzZ9FsRo803ifYk/7mPCxBEhHEme8sYRRpVwEgQc/CugigDQJpAGVpDvxPv92KpKJCnZNXL4h0Vix7GxFJ20yq5+lOejofsOZxzihX2b7+Nv201JkWfuwqEe9yh3tp61K4dper3LmtT/Pkf4U0lYJjPPjObddq6JK3tnqQIJTIf9l7TO984vGsIlexI88a61INKNUy4vMY3E6TX2hkUCW2z773Q5mOsaw6qhziyMNEyNt2egoiunGF9kI/tr8kfys1sINM
 n3mmI1P3IDtYI5S1b0xfdB/8QcyUHwalmFIN7gQt3Pyx1zvF9MGXPyPWxupgFq4cBS+0BNllgc
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 613B0A4C47CE;
 Sun, 20 Sep 2026 16:07:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBO-000000002J9-1ntp;
 Sun, 20 Sep 2026 14:06:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:56 +0200
Message-ID: <20260920140605.3005461-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 58/66] package/systemd: Fix build with
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
