Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE5FC982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C7640D0E;
	Fri, 18 Sep 2026 18:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNZsWn1-WliX; Fri, 18 Sep 2026 18:55:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 23B0540CE7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757752;
	b=mH9tPBFEiYYpj9AFi1Qd2Sfml+XmvSpiGnPBYW1ACzjgZVacoousIbEV02A4sxG0r9wT
	 4eA5K+d8/Ct8/5mpknJp29P0o/mDX3RA7JMTqUks6C4CchyquSpQVh+4h9oy4kvI+S2Yd
	 QDj1okSfyxW8RmVmDkEL5nNPIQ6QmprUzVJEj81CukaVqQyZNpppmCe99uVVSptAKyBAU
	 qhxintdPvXSAOlxnJA4W3fAEbOLedLIK+6fn10mERpRzi2oVWRiXShBPv3GT56IOO2aSO
	 CNY4P3n/oqMS18E7p8AhkT0t/54ZPOdsn/AGfdUDf/lReBpJVPJdVXEGtmyH8GaIreA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757752;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	b=srz5O2+OL5p6wEnNZ2V7c8VJ/rKe5DBfo8mf9aRoR58lwd7tv9VHzv3TxsdNSbOYEH9W
	 sD1/Wf/qFqWezTDaXaoucuO2PWaSZQ2/9FBQiIZjS+BsG8SwM5o59Wg8/k6akvSGVlBzo
	 T9UsoupgbcwDkmW7Y5TiuZHxG9SKkgRSaqNw92Rn6a9FxJ6aGM3AvWfjtz4MKzTkR3f/L
	 CqISZzpdGLrpSVxRsrpoGtcG4ZvttQtLiqPbB5BgAdV/2+Z3+8aCEAVn19XNkNkLmBmGj
	 DSS2Q+IJiJIihdsZt24sReZQMoBtA9zhEIRgUYO0mKli9tggTohcyXsiru5Ng2A9+6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757752;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WGfaWR2W63xOprqvnDgTygVMD/+Ud1zKJE7erhWDxOJriL9ZsAaeUl2DbWL/kKBUq
	 iSwv76hMEItdQVa81c4Vaa7xpCTZmY1Vn0H5uNhDnEEiiSCB9q3yGb0slGd2Lwq6VG
	 9YKiLbNgoTtl/XQ+ZWgGdg4W7Gfn6fkaWlqJprUWv/4DBpWbJawAc9vyUGEC4bNqpA
	 g3Kb3t8yJuC4UHiDRGSJpRe7zSJQzYwDeBWF8DISCw1FgwapWvPQNCd9kn6wO+bL6U
	 3Y7dXSl4wM+nJU3eDKSYehSXVHCRSbkaOACx9p2t1jBsfi9kW7dQ1f9dke3vrnOiRO
	 rHkBMOWzW7nbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23B0540CE7;
	Fri, 18 Sep 2026 18:55:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4863C42D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3997760EB3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5sxoHKRogNQ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:55:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ABF2360E97
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757749;
 b=iqyBl7JSjSRPnMEYBTNIeo2/LZKUsjj+da1rqrmmYq8YBrAP4YcO7mkm63i7HQC/pXBA
 Vveh12Vp/MgufO6+/mSP68YBOnTC71ms1m6GDzjK0l21O+biZRi+dl+gmCnLAeDjYJQoQ
 2OlxOuEpPCKNCeeAb/yuKQrsvWJ/FytCNgiMPSx2tKrWRXHo3Uiuat/5aHeJK9vnegQxZ
 JKCN8Qqj9SIrZ57aZzDcWzRH7/qN9c3P8e6ptOOSvLZTYr81uzfY/6fHLbp6NfubmuDv8
 aaQpOnbT3ppZqMm5Cq01pf/quRUQFe2Es/ZQiPvhCpxZmsUqOEzfiiHmpv1vSW/JZlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757749;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 b=k1KSpNz2Qf3KtdYXhGh+ofEBXiS+uQ7jvWRgzkcZmNlUey8P4WrRp4EEj3vBv7EQzBog
 imqi62FHMAMzvkZ/ZoVMUsspuy7WUoUdzoVAg3DMFdwrmLtR7yWogck/y6eQABEOXHaBx
 doXhr8xoaNGZCJEPrDdJaMS9cw9ZwxZrJjJzHOMV5SisRijiCN/qqykjPqAiifyA6Vh+/
 yKfFIJ5I1voEMBmHSWtG0SkXAZmZhGxfWT40iHzFQz3yg1oOUi9q6aT6ijsZ8N0PW1yEp
 JyfEN2FZek2xlv1abq3nn11G4jpohzj2f0IAuhITLTHd+5fuYbBGt/wOwb7+qvqyP8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=a56WDnRT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=a56WDnRT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABF2360E97
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756949;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=a56WDnRTdY3xtof+bEUKPEcvEaUCqB498+Tzuy3EqOtPLIEHicvxzcFdAJSmofwWQ
 UJLyTsrjst5+lDt39fq6EqdlxZj3QB4ex2N3TF/kcQBWN0s0RhRLSPgQhFrOA7kN2i
 NC9Pu3645idG1JHDI1c8pTFM0a97ZVCmB2hy9USHHcYG9VJUKhW/nhowYscDzeSV3Z
 63LnLaJT7G3vX0IaQ6XgzQSfwirqHVzqSL2vd4EE8iBDaQXM0e3Rnnt634qe2lKYrn
 UWBH4v5zM9l6i9nCoWDZqJBKTu7FqonAdnRSEB9GoP1Fj6yZtmMxjKHnGpZgSDIjad
 crexe9bxIYFKw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:JS3ZBM2+0QTFXsfL52D0yg5qe6IxHxXQgVDhutknWll/X3DwxcfYgDE+0RA6VgOeyCY2Hy2RQ0Tgsor+r803i+d1Idj2yYvOcg3ab9ird4XVOfKY8qVilO/mmlPViPh7qn4Ei/1rytqU/rX6RptI6Xn/9JlAYuztDwL5A5EsYM9Usa1RjcbuHys1v1fjUrVillKYuo/5iaOMONPU01G1umgHrtcEcd0pQj3ovJwvwTKL8GkFwWXoEBHGWYzNEZ6ti1s1Kka8sx1urvhd9zYz4Njc5g+YGCVqmhYKXgsW98ph/rWPFLEkfXFkDGzUwk/ZMirKHZdwNQFnRtcogaIbM/thaG0kwVeI6W1DwCcgFUp9KXeRUedPWoA2YD0LRU9fT5zcvsywmK5ZQh/OOjdURgO7hOqK/cY7Wn29X+FFhKnHea1rfjqPKkGonG5vAnWWc5se3wIGeJlQQZU9vGm5vwTpa0hTb90MekC4+SqcVx/+c8vAI6NY+CKM08vc8a6wOfjQZd7fYeSKRtutzYk92H/gC1E1YcTTEp7jmR3vlJWhAuSpPXC4ZODY+g6+n2tCwtJy1r5d/s3SYWnrzjGQ5kUnM5bHUBssCH7+AJK4xtW4GB
 x0ym0CYUvBQ/95Fx+C8asHDdcfYV23ZlaZHASZzaOXLOoihm9x8/n5xE9m7c1BK6AJhxdyu3kPcfLtdVdrB8rgfI41eIAAS8P3j2fAZHwqn2K6tqrd5Yc=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 00503A4C4752;
 Fri, 18 Sep 2026 20:42:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX0-000000007cB-1f1A;
 Fri, 18 Sep 2026 18:41:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:21 +0200
Message-ID: <20260918184140.3631274-60-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 59/77] package/qpid-proton: Fix build with
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
 ...1-PROTON-2937-Add-OpenSSL-4.x-compat.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch

diff --git a/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch b/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
new file mode 100644
index 0000000000..96ae892716
--- /dev/null
+++ b/package/qpid-proton/0001-PROTON-2937-Add-OpenSSL-4.x-compat.patch
@@ -0,0 +1,80 @@
+From 7be093d8d96104caab3fa858ab9886f23d62ee04 Mon Sep 17 00:00:00 2001
+From: Thomas Goirand <zigo@debian.org>
+Date: Wed, 17 Jun 2026 15:31:31 +0200
+Subject: [PATCH] PROTON-2937: Add OpenSSL 4.x compat
+
+Fixes this Debian bug: https://bugs.debian.org/1138394
+
+It retains compatibility with OpenSSL 3
+
+Closes #447
+
+Upstream: https://github.com/apache/qpid-proton/commit/7be093d8d96104caab3fa858ab9886f23d62ee04
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ c/src/ssl/openssl.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/c/src/ssl/openssl.c b/c/src/ssl/openssl.c
+index 62d4b40a..4c3a76c5 100644
+--- a/c/src/ssl/openssl.c
++++ b/c/src/ssl/openssl.c
+@@ -339,7 +339,7 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
+       GENERAL_NAME *name = sk_GENERAL_NAME_value( sans, i );
+       if (name->type == GEN_DNS) {
+         ASN1_STRING *asn1 = name->d.dNSName;
+-        if (asn1 && asn1->data && asn1->length) {
++        if (asn1 && ASN1_STRING_get0_data(asn1) && ASN1_STRING_length(asn1) > 0){
+           unsigned char *str;
+           int len = ASN1_STRING_to_UTF8( &str, asn1 );
+           if (len >= 0) {
+@@ -354,11 +354,11 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
+   }
+ 
+   /* if no general names match, try the CommonName from the subject */
+-  X509_NAME *name = X509_get_subject_name(cert);
++  const X509_NAME *name = X509_get_subject_name(cert);
+   int i = -1;
+   while (!matched && (i = X509_NAME_get_index_by_NID(name, NID_commonName, i)) >= 0) {
+-    X509_NAME_ENTRY *ne = X509_NAME_get_entry(name, i);
+-    ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
++    const X509_NAME_ENTRY *ne = X509_NAME_get_entry(name, i);
++    const ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
+     if (name_asn1) {
+       unsigned char *str;
+       int len = ASN1_STRING_to_UTF8( &str, name_asn1);
+@@ -1558,7 +1558,7 @@ const char* pn_ssl_get_remote_subject(pn_ssl_t *ssl0)
+   if (!ssl->subject) {
+     X509 *cert = get_peer_certificate(ssl);
+     if (!cert) return NULL;
+-    X509_NAME *subject = X509_get_subject_name(cert);
++    const X509_NAME *subject = X509_get_subject_name(cert);
+     if (!subject) return NULL;
+ 
+     BIO *out = BIO_new(BIO_s_mem());
+@@ -1677,17 +1677,17 @@ const char* pn_ssl_get_remote_subject_subfield(pn_ssl_t *ssl0, pn_ssl_cert_subje
+   X509 *cert = get_peer_certificate(ssl);
+   if (!cert) return NULL;
+ 
+-  X509_NAME *subject_name = X509_get_subject_name(cert);
++  const X509_NAME *subject_name = X509_get_subject_name(cert);
+ 
+   // TODO (gmurthy) - A server side cert subject field can have more than one common name like this - Subject: CN=www.domain1.com, CN=www.domain2.com, see https://bugzilla.mozilla.org/show_bug.cgi?id=380656
+   // For now, we will only return the first common name if there is more than one common name in the cert
+   int index = X509_NAME_get_index_by_NID(subject_name, openssl_field, -1);
+ 
+   if (index > -1) {
+-    X509_NAME_ENTRY *ne = X509_NAME_get_entry(subject_name, index);
++    const X509_NAME_ENTRY *ne = X509_NAME_get_entry(subject_name, index);
+     if(ne) {
+-      ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
+-      return (char *) name_asn1->data;
++      const ASN1_STRING *name_asn1 = X509_NAME_ENTRY_get_data(ne);
++      return (const char *)ASN1_STRING_get0_data(name_asn1);
+     }
+   }
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
