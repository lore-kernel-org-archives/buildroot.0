Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C66CA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D69A380E44;
	Tue,  6 Oct 2026 16:40:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSX7sYMTnU9A; Tue,  6 Oct 2026 16:40:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D66F980ED4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304818;
	b=Opq+QpjyLEelC0URRcpH4LgXGbLfB4tEEI62whsSBvROH3yulQGtoeXIxRBROipW2UMn
	 as9zEUuxtQcQAQgjdqfGE6BlbGeWnNDVxI3yKqtiH28rR+GIiTQqKzGNtV32wcqW4skQ1
	 JvVD1X+BfYA2oWmpOWOSx0G8pnpsn7rnI55jGRPh5SZszJozrN7cOyxbjTLQ50MSShHSh
	 ZyMecmKThAViq/A4tDxivGTBIw03Bnm7S+Z+3HbRK+JxST/jlR6yLmpALXJhf/fCfFTRQ
	 OgRDGcYORzwS7PjRVdFvzYY76qHBtzk2oGRJooj5zziT81iD8qYDVWHuDqOlX2qPhtQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304818;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r6HrCm45U6mZnxUuYEtT0RbZb/QH7X9h2Xu7tyy2tDs=;
	b=M8H3h36tvq4jKxBuRolvm1+OZANNj0ZCvvNJPv6wQcceNATujjyvvpRPEPEnEmGUhKZC
	 frxoaa8jiHPCvEn0JKnHKoj6COOGFk+xiOv9Hggm5as+JLcXdJZXOUq/vHz3V0yyJ0vBa
	 FWlFheSMQOyZh7ss6XwWVqZkVstLzQNmE7xwcvIwzG2FpNKaF1nx4SAzXZ8DREZ5ufmjP
	 IEc91AwJQg4aCd+LOu5QUZolAtpCMzyhCXR33Mcxm3YRM+jSO243JDvj4SwYVPwyjpZ/r
	 BwDaJVnH3tWU68hFJ3tgi6TjZvtG3l9fXlt2ZQPrv6umRqGV1EKPsU8wwg0wWVykz6w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304817;
	bh=r6HrCm45U6mZnxUuYEtT0RbZb/QH7X9h2Xu7tyy2tDs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIijX2gvHSBYewfg8RaS+Np7/nmxYv8zBlrV64AEsz2qOLW1W3Igq1w2nZvEPj2ex
	 jz54ERTJ68LeK/JeGj6YfliJFdGCzTGHGkfAmAx6/d+1b9ytxKrXub3CNuwV8VajmT
	 dlIi2QPdkjOSJQLj1X0pU2g9JO+zj60dCQtBLKouYAChXoeIBx3hvCahQUpkid1/BG
	 RJQk5ESDuYjNZzOEPX3NpHcsR06atA4gnvLbLoRs26+sPLuKQlSyK0Am6Fq4ENA04f
	 cqF0tzo0pfnd4K70UwDmYYYOsnXG5OxOOJDHl79DicvEULQL7vMLl3yohaS57fhtYi
	 OpKasdX6TkJbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D66F980ED4;
	Tue,  6 Oct 2026 16:40:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1549A317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE7FE608A3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgc6yOtbNFRo for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:36:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E0986608A6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304600;
 b=Q8Rhs8DvtIyQQ8cV106KWvoW4olbn9G3z24vYdsw6zvEk5xxLd+5+U37TCasa4SdGfEl
 zYgSo5eYNQw4c/36zP7XsA3+2/X3EyH+r5++V2heXgAVYti/LUEpQ4gD0EO7P7t1FHJoI
 qseRHmgnxRsqrqrg1iSsOXZfAbXSS5vQCB2gAUNfBObEWs/9BHfQpzl0jBH3JC8zu+Fzm
 nMfPUnDgqNFaznfYJX11QWBuLVDN4X1u6LUG/szsSSkP8k71MMgV8vFUSENDCuRwsNHlU
 jb+S5gsXrbB+5B/gv85ghPbBtAGIZtgp28p7SIm/74OrSTNA7aF/v2dpap2y39jYiJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304600;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dzhuWkKtrvo9chWlXmc2MPrhjzq1AzT0BRaLji5zxyw=;
 b=I2wFkc/4MbLvUXCoo0ORlhKx1amFHp+GaPestLieOJS7OSm3EA48yWlkXVtCcul86OJE
 7+eyI/XIWjGapbLNCgxPBteU1BI/T19hdxgMYlu2zjRsfy7Mid77P90mYMsy6D5MSp6kN
 h+Pq0tRxUlb1SFnPlWhPijjhm5z0oWAH16F3w4fF+zR+518KdClIyc5h4nriGrH13sGe2
 ENvUtvp/jYYzldQhw/NYCe+pMH0rE3oEpydT0JtPJNC2A4ndz9Hw4hzIsDVprh5oyaEZH
 ismc3OWWVpNnnADPiDxHmNZdUYwY9/DMmKsOH4r4ROhjM07OBLU/pkhQ9V9EEj8MOVQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bQ48QtYO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bQ48QtYO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0986608A6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303712;
 bh=dzhuWkKtrvo9chWlXmc2MPrhjzq1AzT0BRaLji5zxyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bQ48QtYOXfX/0ZujoI5uIWxzu/NYhzNTYdWwYTYderEynY5Oqz8kOwVllBAnlr7BN
 LxbJGxZt1VHg4FoRY7t+6Du7YyTGLC5jA/Nh00aYhUmV+jecKO9oxdIS3lQzndBlFF
 NncZjwYyZR21DbXNT5QqmuFutWZzihHcGmWGsLOVjmF1LiMyt8HMt7tKSeDOMYFeRl
 XwA1STU9eoU74aIIgUqAgP8MpHtjU3urvzaoqbqXzahx9Cpixzviu1xioa55uERv2P
 LrUlLs3YMitv0f7L0RkP14GtmXDdo1a+ElZ5gJ1yGGLwX9VRon5OpOlmmHCND8tCQQ
 PuMwM7Ag5nw+w==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 x510sQ0VB5GCdaI33AIMKqbEyBr4bGouLnNfygDKIES/iei/dyqylmx1LRdUZDdGkZNFmOz4m0D
 AtibUe7zIewxujUIzALajqIlfqEpK8xXACwkn6Qr9EVzpOe+omIBmNLx457yheNcWpi5kgbXqKg
 F3pn3pIgiTjUv4u5llFXK/yDvrW7My1+3U79yQEPd9Q11m9EuqQWqNyhMTKE8Yb4EnJoGcjNh28
 9wi6OGpVQzjE7EyAmIft/2/xTCF8URr+nM62SbOt2L2I039cfuLqTtxgRHKvFzO/gEc1zB/Br+t
 hmWR7LZ7PeZPK2x2V0Z2OHOHEdF1yHLJ7n4XwtCgqU5sdT/u302aNT3XGhH+iT1ak+UvUnnmLvH
 ydDObyzlA/wAlhO3BMrBOqdpdcW8tKp8pCwyy9P/CRauvRrMf/R/tRMfxD+5GjrNjJqCwuD25WO
 tX7JXcD5lPp8b1deG5pPeHN7KSBg/5RuIhJT0es6smLzcE7SsZBxJyby14HI3/ZNiwjZysVH81I
 JmOEuJdP6hZTtNgtxuxrXLr/M3P+IQWfhkBP16+DIo7jI6voI6NekMYK+mtyHxrtAUijDeqJOo3
 NCxnxr+jExGGRSvBVJp764o6Xyj+gh2VoEwTNeQg+PXF+5PK
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF8CDA4C5559;
 Tue,  6 Oct 2026 18:21:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7un-000000000ir-1hAz;
 Tue, 06 Oct 2026 16:21:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Tue,  6 Oct 2026 18:20:32 +0200
Message-ID: <20261006162106.3439373-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 51/84] package/systemd: Fix build with
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
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
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
