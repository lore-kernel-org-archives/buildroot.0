Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8365C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79B7040D81;
	Sun, 27 Sep 2026 10:59:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aEG6CrerPCj7; Sun, 27 Sep 2026 10:59:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9645A40DA7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506742;
	b=nM/5QaCGfsBsYJBT+CRo1j4Bw9WgQXAslJoiiNBQfRHcKnwHqEfb1CCXI7O57XJo7Rhp
	 wl5P4cUMivg5wM4HxF9ngRx/ZGK3mUsh2A1GyrF8SuLBBjsimMRBcpaaDJBXscNNqb9lX
	 Fo2ttTRtKbPVRqVnJgby4Axbx1lQwwkeUECigFXWGHo+yLMS8kMOMSQ1HLwxZIwWY18kc
	 lz4hDUOWDuf24mAn43OWk+oGQc4T1eUZrY0tCV2EVCGlZ5l16Nk/ZztJc8zCwoYCtmVkX
	 zJF6+MniyeegGuTSMGNmaI5tr+X9jvavvb/4ofuAzQY/sVx2nQoePkTvJtwVuG7RTCw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506742;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	b=GBr8/xb2OMTLhWgP7oN8k6dQhvkcjNriuHAOlqQDXthSQDUKZX9uf9nA7H9q4godtwTt
	 o0rP05ZPQ4LypfHshnZGKhXjj862wFETTPMHUcE4MPHxMoL81Hu6VykOkurT5QCJ8MsI9
	 PL/XjD1wqrhKl5SKTOCOtayO3AzfjrU8V6ZCklHt6Xtq7RHqpMXbxCRN1KmclckkWduZY
	 AvDQydhd1+J9p8j6g2k/mb8TQ6kRfd+UPVl/lxQo/p3m3jP903JRZaiyv+YQBrNc1beoH
	 Lx2IJu7h/qRA6DHzNywa4R5+tHVY39ghFjVZ5XOIwWrkJOAoCkxdevstgvwASViLSuQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506742;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rr9oNBYUkIph1aKfepfo/keF9nBYj7yM0c8P99fAobQ9joIFpH05FCZE53xKJqTPz
	 l20nMf5RuXRk+/du2DCoMimAdlC3le/a63nPh8nrwTFjfSKD7GjzsHKTt1aIRmcQFi
	 OkPE4PVkZ9+3BGIgAl/dscqwjjLGxwFudGzUoy7ex0TrjKEYepTrJzXwZw8lXKwPPj
	 zHdufcv8uMKWVIGc0ua+22cB4guBfIKYrMTPaQscN6gJoXV0ZWf4PMJzGcCwrr7DGR
	 Lrx2h3NIVWeoBiX2jmlMyySc17SU7Txb6BiAtaw6H6PXfEwB41MpawYRjWcEd0F57m
	 DD0Q65blazG9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9645A40DA7;
	Sun, 27 Sep 2026 10:59:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 55707335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B64840068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FLp18w4Ip_GY for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:58:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4720A40059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506739;
 b=DRjyH0ZcnKgDYYwGb915+09l5HtUtDwzBtiTurp8Di7reRSQVD8ZY+Y/4pMSF6jeL5Yt
 MImfdX/9/Q5D9o/vkjGyk28Cn/doVrEeyOwZodrtMnovbq4g32irH3jfzEhApZZKLLZJ8
 ctzy99M5nCTQUTuerzXB2wgmMurJ78Q+cPJIqhrSJzgRK7Jp/Jicu2Uc5jhG44z+O2WQQ
 UE4fRzwAlJ9RrqgnPtjG7W03O6GpFZzpoKvXImQlIEMdadikm0GiCX16zXZK6tenIZ9Na
 UdhwMruhTV1il7gqJZ7CEMIAOY1W2GUDcJIxv5W3FRfwZYIPiCaXOHZI8PuJPRw+oLw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506739;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 b=qeADIUv35TYqJz9ClPuM/V4zZ6JwMm4DY2d92pSwo76vRi9Hanz6nT6WS59ku6KatS+x
 7okf0EGCMaE+2VZnIJet0qEjDId35HSVMRnl8F+B7bqUV7pgV93RO10ElaMHaV3BnAJu9
 7upqQmCR7jDB5o6R0u6syGpA+bYo9jN/ZBjTXVqj+fjIQrRu0HTAipEBQqs0590AF+Cft
 NVJn8qiUPUkkrkQ/2kHz70Q1HeXGi7k+Q3ekPgOWsw4iZyWqTbDSy0kjGVjOvOzNZyI5a
 EazPZW7dGL0lagVOkXUtmEVUs5qAwp60WKLEFmMQiOqIHUqocpDpiJvmysX7XfSItKw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tet1Xrhs; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tet1Xrhs
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4720A40059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505868;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tet1XrhsTua4r1LPG0PsIzTOjmu1RprHbNXGI3GPPKl5PZ235n33PX/o8K7VEiajl
 tlR8j7/kZPuqE0BVI36KqmZgs/rE/WPw07HYoRohnI0+6XDsoD5SZ90R4nq24PkSke
 M5COkg8/SjfOA+ovnbPqm2mbtfkO8Z1C8ToxbqZt7spd+/cvVH/4uKoBDWK1yr0bDs
 7zDOMbw0RYDVk+9FuNa1N8LFI4eklOPZFzjK/+HKaTJeSz/14S84kRdjBvlStQIlCO
 l9rf+lDvKqclJDORt5XMB2yl9LxzGCU3CZitkPXxnbXGjrgesFwlfU25nH3e2Vf5d+
 oAoKiFS3ZArdA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 bM8za5x/4G7xMmJ1Uw6jivPQV8RA4Ur0Z8QGKXfWZ9RQiQm+jeq+J8jqCesxY6xWsE2tJeCTi2Q
 4jroViVasIsAJ2WaHpGZ+Lwp6KduhQR567n42RzJMY7Rs06Kf4Ga+MF0sa/hJcvWTksbjJweEr/
 6BByYuMf38czuUWZpqrxHYGT1SVY/GycUGWRuxk1z3aPv+uoEglXlcRY1S5uCRum+e8NSEcB/hn
 X2YX49jMdEP6p3JqzqwtR4Fd8elKqcgsz7+OzL9kgRnGQGImSwqg4mIDMFv+GQPHgbIdPFyeqAr
 uLbsGT+T20YsNhsZKL9VROjh0Bz0HL6C96sTVlbjHxV4JLBoQ10R/h173gVrfgzxQMYrEQkDc8q
 qRqvBRtPelz/xf63BSD/HS4kMkRaA/dDU45vyuOXF0H09Y9K6/2MT/eEZbnG+IqYFnHdCNYhJnt
 DEq9iLVyCkcBLAEHokw9QSKemZKoqB0NnAv5uXfJF91r1NP5ujYXsE2WEupXd1l4NuZRGfhMPju
 SWW+9a3G6ACcEbn5jICyO0bUzTkhT4xlFAWirACLLgDHg3UY/dix6RUp+EbPRkGRM3yEMyPadTE
 y9ygYFnRDNro+H84S1FXnocinSv9Mc5VtfokR2vE2qr7y1M0HV32MJd+55iLBPE0wPh+pl11/TC
 vi0I23dfcZdSF2xe1vBZk
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91B3FA4C4F72;
 Sun, 27 Sep 2026 12:44:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLd-0000000007a-3nyH;
 Sun, 27 Sep 2026 10:43:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:27 +0200
Message-ID: <20260927104301.1801638-50-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 49/82] package/lftp: Add support for OpenSSL
 4.0.0
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
 .../0002-allow-build-with-OpenSSL-4.x.patch   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/lftp/0002-allow-build-with-OpenSSL-4.x.patch

diff --git a/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch b/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..258d08fb2d
--- /dev/null
+++ b/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,56 @@
+From e5d53bcb31b1f3792c6ab321e20d566b9a4ff0a5 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 21 Mar 2026 03:56:46 +0000
+Subject: [PATCH] allow build with OpenSSL 4.x
+
+Upstream: https://github.com/lavv17/lftp/commit/e5d53bcb31b1f3792c6ab321e20d566b9a4ff0a5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lftp_ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index f53edf24..49328f74 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -1022,8 +1022,8 @@ const char *lftp_ssl_openssl::strerror()
+ int lftp_ssl_openssl::verify_crl(X509_STORE_CTX *ctx)
+ {
+     X509_OBJECT *obj=0;
+-    X509_NAME *subject=0;
+-    X509_NAME *issuer=0;
++    const X509_NAME *subject=0;
++    const X509_NAME *issuer=0;
+     X509 *xs=0;
+     X509_CRL *crl=0;
+     X509_REVOKED *revoked=0;
+@@ -1436,7 +1436,7 @@ void lftp_ssl_openssl::check_certificate()
+     unsigned char *nulstr = (unsigned char *)"";
+     unsigned char *peer_CN = nulstr;
+ 
+-    X509_NAME *name = X509_get_subject_name(server_cert) ;
++    const X509_NAME *name = X509_get_subject_name(server_cert) ;
+     if(name)
+       while((j = X509_NAME_get_index_by_NID(name, NID_commonName, i))>=0)
+         i=j;
+@@ -1446,7 +1446,7 @@ void lftp_ssl_openssl::check_certificate()
+        UTF8 etc. */
+ 
+     if(i>=0) {
+-      ASN1_STRING *tmp = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(name,i));
++      const ASN1_STRING *tmp = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(name,i));
+ 
+       /* In OpenSSL 0.9.7d and earlier, ASN1_STRING_to_UTF8 fails if the input
+          is already UTF-8 encoded. We check for this case and copy the raw
+@@ -1522,8 +1522,8 @@ int lftp_ssl_openssl::verify_callback(int ok,X509_STORE_CTX *ctx)
+    if(cert!=prev_cert)
+    {
+       int depth          = X509_STORE_CTX_get_error_depth(ctx);
+-      X509_NAME *subject = X509_get_subject_name(cert);
+-      X509_NAME *issuer  = X509_get_issuer_name(cert);
++      const X509_NAME *subject = X509_get_subject_name(cert);
++      const X509_NAME *issuer  = X509_get_issuer_name(cert);
+       char *subject_line = X509_NAME_oneline(subject, NULL, 0);
+       char *issuer_line  = X509_NAME_oneline(issuer, NULL, 0);
+       Log::global->Format(3,"Certificate depth: %d; subject: %s; issuer: %s\n",
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
