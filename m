Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA154C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC6A60675;
	Sun, 27 Sep 2026 10:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0_HvJPJ5AeK; Sun, 27 Sep 2026 10:46:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 65D126064B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506004;
	b=QMG1a2Fu6uIT4vIwlYPriWus5aXOqDe2ytRcOCRY4AMGU374GazxlF7ROvImxw6jzL2Z
	 vZzPOOnI8rX9C22U/Th+6CzdLNg0E8sgFdaUHoC8BnPjR5+OHyiqRzr6LAK1wdSyB9RTK
	 mDTX9fPEnOP9EkI84MJWRhWHA8eeNwhRF1m5FiWXljPsj3KoRSkrbyCaPXELyf5UqMgba
	 VUx69IeF+SyrmvZaofwbgX3VE1S3oGf2DMcY6jMWJwNBfZqmt8+MaKjlRObD0S+GAxsk6
	 Rv4PMFJ8UOd0nG62KULYWcvXs2bBBLbbvnHFRWnmqoLDG/P2U2kLgt7fkQc8zoJruoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	b=DLBLqsybQWIbztsySXMeKoFYM5V/sEulDt77Ok1TOlakq9HBCipXPZD7ntqm6un0+ExE
	 NDUTXammzOzlm6/AiViD+wlemRAAmYgs5vi+q6bDPub8uwzFC2+Y66ciWTT7l8oKwfcSH
	 OF8BKf6gGiMhgskkhbLCNwRms6SuoukoJ96IkMmNJZntr3e6wRf4eKSP+jJVyQz7Ie+3K
	 Gg/40HcaYwTC7YsKvcRb3y0hC6xgqB6bfFzitT552nwxJ7/VHNKbjhDXEbhxbGLGnnsTh
	 UsTc3QP9IeUms7FgXCxFTtB5zMwGnheDnGKjXrlK19wFlLwH0IfpHNj3hp/6VlzzsOg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506004;
	bh=yl/BsmBIfTCmijJlLWra4akNA8EJu27gJQRpRxXHgoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I7Z0DWxy8120a+NeGUPkSeCV6CuSLi/FrP5VVrLTqEbr7LU338R+wfxMI3nxD1bKt
	 37n5C6bEiXfsOSgSuUJl9fX0a0DY747/d5LisMVMBCcCB/JlJtYXGwR3VUCDqQiksx
	 o4KxAwlxrJfG483AF5QQ+vSOaDs+IMVxnczdNAaT56vZ+xySowReq+LjKYNw+F5d2K
	 uzKxpB506AWrivFchCe6qb7y8nHE6zdiAA8mGDIFyC5qE7TpLUs5zsDkN0ePDzv52z
	 +TcGu+bm9J8A91J4NSAtxscIDcKoIg81YuWRaamogGjAOjdzqiadxrT3lHAaxn85T8
	 g6odQQRNpMb0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65D126064B;
	Sun, 27 Sep 2026 10:46:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8FB9334
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA180810AF
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLlIyEEpXaqv for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:46:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2C594810AE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506001;
 b=V2iMdk32b9zHuXJOBge+8B7vL1nLQKShf1Gp8r+fq42iAtkuGT6SL0bTkQQeGszRNIuW
 sOuNWTiZ6G7yC3AuqY8is57pb4oqYX+IjMYX0bZTYqOAhq3G+FbXcwmYP8yHfvAyf7cFY
 nFF/ORW8LVn7qrcNNh5gX3QALzxQ0p9905SO4uV3duHzZLORXSFOdPPoZCWNlJ2fBBaif
 dw9DcY1kIKsFkgrx/EN41wBAw1dlsJyKetGWQvkaelaPPAKL/RknSfhOOUsNtXnJeT/us
 rrqScABKxy2GicQIKwqd0qmmz6xCq2sKZFeS8Cb60IqqPlnTFmhWwyISlaHNN/pU5Ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506001;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 b=VP8R6bOaSxMukVbbe9nulDUOSDRi/EEqRfWPmVtfXNSfqK457FU6Ht1MKgICF2T190Bx
 Upqf/eQWHjn5uMVYK9yLpkTEMPgIzuysz1WDcWC85H4ENJb94xCL0aK9Xs57TxwOnBFPB
 GxYyZ1ARb5yHYOAqcVIMhgtQ0j8H0rdyzE/U9O8vl1XmUIMQnrxAsaQa5b6LRgDcsiTZT
 Eyk6A8hbht9K64Vq/dZ3ZeWdkpS+fay2P30HsPKYN8yFp3SziSCLqkmWdUnMQxnRTV0j2
 9d/SQ3cLR6AAoRuv2uWH9rjmQ55G+E/2w53RXkzofT8bxcWJQ4aIQ+Y46BBuAnklyRA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fa69RKkw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fa69RKkw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C594810AE
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505828;
 bh=FYLh1Jxj5MOmluE805K2hN9u7529VSpVhaKmZNZxwmA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fa69RKkweTsbnsinz6FAHb5tpGZDDBKJmL342WepAE/42HkzhrGDZRTRQpXkYbrHC
 RefIthAGAARvH1ZESvg7jWaBWDWx75TpmVQq7Lg0vw8v33saN/dHIFjLQ+BKcd0Dao
 YWtRnEHnqkce3krxhWm4C8u9J4OgcdyKdYhQGF9/DsSR40bc27DQkZcJq65x3y+lJC
 IizI3hRBLDyY4iqyCuMmza8elavABpe/sdvikM+TnaXztRROijzZDSRCeS2k1km0Vy
 syWl64Iymzosy35OrLEGb55dtxG/daNKHxLmegYmQXtuHOk1nHo+LJHEBKubvmOXYw
 H3jzKFyz1Zlzg==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 RfOy3xgQR5oTQOaQZL6kt7rH1AbLwKLIAhYT0gT77/eVFxSfGVRZ1KU1IPyMPdtpn0NtGxiNip6
 1C9JzX5++5IubpsSzXJSj2JD97nj7LlDA3GNFreLYFcI0rSAV5i5GTHwzwAmHOa3pQuu1PF/4fR
 AEiY+IKo8IGU2DwKGDpVYflRArTGpeBLxGL8Gk6J4nDOLK6IrZnOOp+ydtIIu6LbXGamPyQvm4u
 H9iS/G3chLZhHa7qyL1oSKeaP8MwG3Cx6tR92dYAq5RukP3fgIuW5+fDkPWMUPS1vrV4FZusB7x
 YHOpyFuvPQm7AU+Wa5+l5vJpDSzRjoILdP3ppotl2N+hYXRBM2la7LOGlBvnxV55ewq2tA14kwS
 cFFPSBudUOpvBpTsBSKTBymP13v5EygoqdYzoHymb2iwzGsAixJSbpLpyPzQ4vtQGZ+QkHdAN1d
 Luwj/z2DvvI+WkX1XNCRl+m2K99NSbF1xWsBdK+ofoDz9UH6zLvPmOIGjGbRuRG8Xd9rfIyRjQi
 HTFTwj5y/+hQ/mQWwnY6sHYBWNzYJ7fOuQ6JgcDR4b1LJsr+l4OXUKj844ElP3vQp8sZmvU6QNv
 1hxNku+TeS5QlgMHLHiXbWgh70cl51Ll8yXHyjcYVkDuqXvZC/7Iu8VUQfHxWhqKw1qUnDToWb6
 bN1rX+F3oNUvrG/r4cnbCukxlI+drSivzdoiFze9+3x3Wp6yDAbZ0oosle3OgDCI=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0BDEA4C4F78;
 Sun, 27 Sep 2026 12:43:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLh-0000000007a-3Y0f;
 Sun, 27 Sep 2026 10:43:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:43 +0200
Message-ID: <20260927104301.1801638-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 65/82] package/qpid-proton: Fix build with
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
