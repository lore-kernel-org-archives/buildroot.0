Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A62C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3675240D89;
	Sun, 20 Sep 2026 17:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jmbsAs1-S6ta; Sun, 20 Sep 2026 17:10:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3F2C940DD0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924230;
	b=knsvOQeuu9DKlVqP53mw2q5Dn+AtuADV6Wf8T5tRYMGUUCsFCQ89matC9Yl+PisbU6Qa
	 XHRbaLiydZ98wBNzgQcaKEeS+dOblMmdrtOGECn07PT6bq79RABMCvu9KR7Buys1vN8Yv
	 FkoUCxeeTaHvC6ip8rn6Prx7MNKF1+XZMNulJ6rTsQy4j8ayYnfy4SyND/RKBvvtT+Q0s
	 FCbl7IB2PWu1KsZkv8L6TNyWEVDbPkErEmTTSUwlKg45tZo4fFVIvxI4V22cXRGCRvntd
	 bNUQq8kCQJy1URHIrXPLzhGtVxOIL+nVjovkg1g28CsEYskQjUVoszF+WMKLLiUCkFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924230;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nLodmBzWyaseImhT9sqxjeRFfOH1smt353dHfG4f0Q0=;
	b=rfs+nVR2/r+M/w5120YO8oPczZrhrqb/DQVElS8oUmcsgLdFfVVj1IKerz0WNfn+hsva
	 6vceTkV2U8VOkuE0cYI/NiebYYXAqNdrgQC+oN4cgQpl5s7bwjs/7OrwYJTW4Pbzj4nkz
	 Xjaig4RxTMWPL+6EAw136lZ46wIhfYOPbOzrHkhlYL0MkM1Uqa1wc3ljPhE+t3yB14Tw9
	 1Z567kMAR5eZ2C4NMzoMBDmWEcuGfpwD3cioDuHIxgQQu2uBzVdZOqB20Eg+iyENcwZQB
	 bE8JyMZnpK8+G756g4NCi14QpB0/fo8tdJaKD5qp7pFAuuupSIIa42RCfMs1vD15BhQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=HCxVIfMj;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924230;
	bh=nLodmBzWyaseImhT9sqxjeRFfOH1smt353dHfG4f0Q0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nk86L5W6t/yfGyeAKNda/zFI83vDHTry303wPlmGWXV+GiUg08mRBLx8FQ5uG0MhX
	 uKa9kvgFB0agO+HpyU9xmPM4FrOVoJ5GA7yU2HMurAGtbb/FMqiOaxIZHU9mscbgjs
	 hafFL6iZ+vx008z6ZL1Ym6rUTwTLmgXDui3MSAkv5aTSD031226PrtF71R4/SxVcLU
	 /sPfWBJCCIIiD3c+fDN9ZIJRJtslE9AZLNl8fDAljb7xipUClUYw/4/Lpb8aeD7HvO
	 nGF6QJfnVN7mAqtjnIMQrhfvERZgahTrU5HjQ2j5EHP+7EFog/vpjoNJoMuheOemMD
	 UAcazLRSPGXvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F2C940DD0;
	Sun, 20 Sep 2026 17:10:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EFAEB88
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F22540D7D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uVFC-pA7Z7Hr for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:10:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3380840D89
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924228;
 b=WqqnJEwVMpLkT9uZcODmP4UZY9GfVb04n/1ZIVFCGs2IKS+J3Xe+4VQ7YQgfWpkljKJG
 fdvutjuEQARq9numcGJViMk+1/DZL7Mj/To4DzPJ8vRWqX/FXplEdK0oNXWJa2WpcPD9r
 Yt+x8Y+YSNqLtZoEbihiSw0NGZ8hOO7xqiTWV7eXZgT9vW6GPQ6GdyND44Cvth7A1Sl2q
 kdn0ktRI6bqVd33wXGvF9pbv4RgMXbxb9R0NtEJkAdaMaUW5Gk9M9Dr/nfhgWW0jxoM1w
 qBqWI8y7z1wsGyuqLc3vkEpkRRW1eaRjBrQQlUOYhMWXZOmjJm/GlDfC7gSHRN1Mmjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924228;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TASkiw1ospBBsSRdHzLiYsz8Jx6DnDQGaM/U7tGIge0=;
 b=bBoy0+SMmGyvslWB5N8lyQlgIThnTidlMR/VGZzA0u575XH5HrcQ+s7hrXqhfXUvaw6t
 SbYNdK8pUvx2klKcaqXi5hXRWAok4RaEUpoUcBfIC9xXx/qVo284HI4IGZ9u5w6dT7LBC
 p+IH7cBRbmsNzkAO28bUSfKpLSiZZxduLcGo/b7fAOuROmZAODragGGRK8pzZJw698SVd
 WzbtGyjsQ5IWj29i8qLAWF0PWwGnydbBE85vjpcd7TZkk5Mt4n0I85BCTqz0IhYtqnOUo
 NqaVfImyafD/4KnYqVZU8p3SxjGzsoEgDy/puDYfRGz84MnhTSY0FPpIQzCUsfbLkjA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HCxVIfMj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HCxVIfMj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3380840D89
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924143;
 bh=TASkiw1ospBBsSRdHzLiYsz8Jx6DnDQGaM/U7tGIge0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=HCxVIfMj8SY3U3SAyZLqatT0vDmfFnTst51V0mz6w6Ofq+3CwG0UGmRkS6tzffS9R
 3YPsOjg5wstYcUDBKaFMPJPq/A+dC3KJ6Jcg0bhhV+GL8s2MnMFCCuQOLbKoOEVVl9
 AJBXI0MrFTHVA5PPXa/WT32vzdknQt56IlAKhtpKqWPRxICBgqKu03Gf6T9KZ/NRUJ
 SrsHIg6c+mr9wr/eKUZvLAbndOioOwDMbYlte/8pF+vpQfhA+9XvdYxsTMPzO7k613
 9W9BusFF9A5DuTdQBWX07KMszVH8GZ5Khhu3ItiIwDeS7skQ1t6xZCw2QEo8M9USIZ
 UctZm5AAGOxFg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:IrOXT64oZTc9FVdU9ym4sIZqlycrurxyqlrmAdysB+NAl958ZdI4wZlh5Eu8H5PDrW9gZhHiVyghOTF24aPAsI5KXRpC/IjCixmM+LqLQLW4AL0OM3JdTe2JqgXnxp/vt0YNmQ3itzbrxzFoI/EnzuWmGfl4epYNz+C4nNwE/t3Rvu/2VKQLr59jLyCdza4t1Lz5bUqg0Csyr2z7L2wHAu1VySuiA8/sz0w5IbyndTsigJ4pDoJuZfxE0bQxrZ3W++7Y+uIuU2mvtfBfkY7XYXEbn9NQ8pLGjeLSQN/ZB8ev2EQjDf4JiDAD2jI781RmLhdTz/MqtKrA6zjO0cbz8dsmVpKQSqaS4eN+KnrfmtrgNH/5FniC8l8wjqZONxIMKWyAxfcbxE7ak83Q+i6b2xndmL8O7E1K++4pjDNJnbjXlgRsTrDNv8CJ0EzonD3mFDJ0ROiZJsNxzDaMftPALfxB46kcByvuUmGqrA2YUqVEYPLlEXGnEU9YKQsJBwSwaZ6UbXjw8QQzJeimhfe5ZUAe9s1lwiu9Fd8cg3m7KF9+nXpRFVhnXjqCFEL5QAZgRPk4tfeNbLLchW0imh6Tpto455eorr3d2wYuMnaLziIifr
 gIzPU2gK469EdKryjuAk5kjJwIhWp3OOQVdDaRKai3HJjFbSbLk0VCM6ABiQXxseXDcMjxy78=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42B16A4C486D;
 Sun, 20 Sep 2026 19:09:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1g-000000000o7-10hw;
 Sun, 20 Sep 2026 17:08:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:06 +0200
Message-ID: <20260920170815.240247-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 59/67] package/systemd: Fix build with
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
