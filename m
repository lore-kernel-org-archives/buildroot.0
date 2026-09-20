Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EF3C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7881F81082;
	Sun, 20 Sep 2026 14:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BShjdnOZLnjC; Sun, 20 Sep 2026 14:56:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 95C298101D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916168;
	b=BmuF/gPegOSspaol7+IV3SOhAjuA++7nT5FuLhSlrIOp3Uok1+RUIYT4hrWRammz8Y6i
	 ssSze/S/pgZv+YoDM5/A43Au+xBcAqhwvmnZWwltlbzB23ahjJwAcXARGLzdonFr5VWxc
	 iOmd8K2hKRt7eu26UyGFT5kJGBzVIXoS5Kn7abl+WOBJ4TwQdVe4k5uVGzWbkMvzZlkBR
	 TJd4c8hMXeJ+PTOl3NoOdAZ53TX2aHHI8V0KEMmseioX3plTba+ZPLqKjA3H34g/exWhm
	 nAwaX7Oe3DDfCKSPRqv7jvB1yYYXAZBTmSxaV2UIAmCCPXV+GWVkHYdiWTjWTrVOAbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916168;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nLodmBzWyaseImhT9sqxjeRFfOH1smt353dHfG4f0Q0=;
	b=ltvtjWkDMbYexKRTs05olT+LgOhs1fiWRLBdn+Oe4rLpgc41QSOuJm2cm+coOzEOyYOk
	 n8hrzDSztwZVeOp8tQJ69ubWfpP6KvI/9sHPNM5Q4g8p5uEfPJOC5ZiGIO6iib11PmE5h
	 H9kOayRnCfIc9sZfg/Zav5wyH6UWlP5SBIMEGdtU3QVbMS+bnVq308GX6Ff4pJ70s8WLb
	 UnsBaouQbIGDeY2wdiYjTcKLuWlGNvf5C9cSbrtLJkM7YPOkCx0w6rB+rbx9yPhxR/S5o
	 06DzcHtiEiRy8dvPSbtoCwaQOojJNEJjlEkJIxYMtShXFv90Y0N+BVRcbOvdZxPlWqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=kpTxzNSe;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916168;
	bh=nLodmBzWyaseImhT9sqxjeRFfOH1smt353dHfG4f0Q0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jLGPKAUHI0qBbSQ4+SV1SSoRJyZYiff9IU6WQeyPpKFbHotR13wrbZa0oFWz2g1Pd
	 2u/KheRlK2Uxf43lC0MwbzSEu9l5uvgFukn+Rov0vwiEGcyDjkZuU5ZJjqS8eKgfuL
	 F9ROV376ZBS1sAuM1VZxYvLHMaSWcSVQpuEqYRIp9Xi5hyf1TCZ9SFeZ0AySOjHJrs
	 hWC4i7QROSHKEXYkhveQygwKGXCKBCOXkDVe9R92hVhW1BQWqppKfvjQVgHWIEjnKu
	 pjhYozcOA54XPOYyh+9lTwJafdK82NjEKZ+8n9g6fi9esIK7CZZWFl29uhWQZZ/Amz
	 T0ufcL3snpY7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95C298101D;
	Sun, 20 Sep 2026 14:56:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87AF137A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D6F38101D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ehd6Yhet0DIS for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:56:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6859080F9F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916166;
 b=BQ6MQRpNLmYX0TypUA7l90sDPG7rAWR8wBPnn3zOjGK1Hd0khKSZlyphlEqQDn/MGXBk
 V+6qELB/gdlVAY3PGWLMHxI0HyBDkAEmnLbUhniQGJXMr7YXOcmojk0aVuue0mG+Lqk/k
 pf5yQnNlxHN2fRHnKMX1DHOIJbXBuXDWGSNpkXbbqG4Brig75tD9mbE1rkCGL1m0VNBpY
 FnTmZJmxHDAiw8wDtBWts8+NMsveApYnPMFEWnHRxAxebxVcDwoPEj8ee9vk03k5DN1EH
 TOj+U12MJkHs9M78vh1dn7YR6IjrgPbYfKwzYKjtNxwwazfNB4CKmbTRZ48G4lN0j+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916166;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TASkiw1ospBBsSRdHzLiYsz8Jx6DnDQGaM/U7tGIge0=;
 b=ODURRxIodbmkOb6ZfkLf7D4q2Z+LTS8q1g8CXQhQCcGNxpT/ct16flfJaKWYN57IgHl+
 DXI+MjUP7EUaYNDsqMWLfZOMUvs+inwDwNfydE323GlKa/mzZ45lwGzpefuM3Qd+9lybP
 onrVXalU4n2Pue7LxHfXdzzXU6S/jioZhxatjPQm89ybuK4Ekn+ELVN9z3kAsNeN3nkLw
 joaWDgUIXCb7+9ojOpTdtL4VVOjMUdd1mMyX1uqnriBNxhrUdbZvXqsRSxOZexol5YJSo
 QNk9lrPdYuULxhwuIxYN0VPFf3RKRje5nopzVI6PFMCo/IxVtjErzw/av7rAaWDZ+xw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kpTxzNSe; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=kpTxzNSe
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6859080F9F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915505;
 bh=TASkiw1ospBBsSRdHzLiYsz8Jx6DnDQGaM/U7tGIge0=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=kpTxzNSeCetU972rmXUwXziD2mdvfJQoaL4kyr4JPlHpBOOfAfkvig/08xwsf82qL
 5YrRIKpEjpMitPfVdkQBulkozpV/GakWQug42QEZBapNHqNofolFuR99HlVbMTzbzc
 z2evWNsPNfQKoucwDqMRqZXnl2ELFsb5M8ap+h7rhX22bGzQTXnHHXQ7nuUjXftKTO
 zIuFBsbbe6ZXBHPrePZA6MFHt8r09RXsvRskpX8WgsmV/bgCF5qvri0Qr1STKSZso3
 m7cEbhpNBul3qcAa7MSqgeGDlTBeAaDjLsI1s8PTeWHHT22gw9n8W+ZftH7cixHiU7
 zRuK/tRjzRTAw==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:FmGtivPTCc3oTwLYNZ1dgVf4hbajENLWgzsprC/bsMbLn4KpebqoeRseSUgyUjdlFqCkZu6S/gDKgwii9PGe+lOOIvEPouY8zkP/lFe47TRuCJa6l7OhAAE+dLKWDKq42jbsD4L3FHY7o17m0uYriNL74G659OfKMZxLcB4IlhrY4WE/iBDR17D9l/Bu1uCCwE6d6zgh4oqwXhg4P3CBPabRE22DTD0pkcMR5v23CZ9Dz2odHw+mV+vDr4U5LW/ubXG4e3kSgziYpwsQddG/0l5R5sCV0G+dkZOKABiFn2Ww8+YyUN0ojC//oMSWt3J0OaRhpsBHFNeduyFTCrtLFKqjPm4fTmZB+YHmdADT0SYGG7fMLPnGydPR0I9A23B9ua/WEpGFSVWj2H4Nu42LFVGB6qY6WI6oY+5GSC5Dryw3Hc0E3OfDW2f78PbqrgYx4kWPHIT4WAYurEj5Rt81UyEEOFGe0mDJIXzz0Ykb7S0TCVbrdru9Ii4pqgWwt0VbSaJ9DnYvWJPaKtNZ+88HgvnL++reGZ0O1xDmdwkIs6WNgIntoxmizXyE5onkVGIEMbYFNgWH05/UNOpd5UrP3hHGaPm6WiM=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ACB7DA4C48AD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imn-000000000hB-1GQA
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:19 +0200
Message-ID: <20260920144428.3009612-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 58/66] package/systemd: Fix build with
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
