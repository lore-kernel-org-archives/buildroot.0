Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974D8C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E331606BA;
	Sun, 27 Sep 2026 10:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qhn4x1kD4qPA; Sun, 27 Sep 2026 10:55:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 71354606BD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506555;
	b=UFe7f5g3FWE7/eA7IbevpG9q1utAsPqbnXOF8s64Il5n7x7z2lXd/GV8PFNt8FcmASsi
	 eJbNvtt9ZE1eTe/dMc1b9St+oEoaMQVXUZ8po5BT+owH1tr8FlK0I4QuBm9ujEMqbbUPx
	 gahUYYGxRBP9ydCIyI1ZBGKNZCUcEfFRyoIcUundWp8XuwM/3xlvS4fjFYnXNIRMYQWV/
	 M5J6ZaeypCq5UisPBx8iD9laRisT6aUJIKiiqK3I4xFrJsI6ge3F+67bBAqkWO621+KiE
	 EwnltrS+VBl/99l4CTgJWPJwudGnl5ICAtR5mtkDZ4HeMRh9ztQ5E2m5nGBG2sFlMjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506555;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	b=e6WgVL3iLNwS5Q21f12YEsPHZTXUHtxcrOCm1/OHbxrXgAZuRtns/oQlmJdIH2yHu6NQ
	 NMl3EHigIGWKvocWosP1Bb4+qUIy7k5plv42vS8BLPyPeG2bTq4xvZI6mZaBpy7Iu1tCh
	 0SehchICJXlIWgCpcN5Iitk9aT8xvPVEsUVc9Pje+jiz/LS+a+VwHBM6mQ+I7Y1X02MRg
	 F+KLb8dPzYShwXp8Ptho7fqaVlpMFC5zEQdcTkzEBIetDEPyG24B/0GAkeJxLhCbOXDNp
	 kLGGmNHMRlfO8nBpJGK2/O71qyh5Oz3HvMDv94U6CYsN+QnkQ0MZQYnhmz52MnSYYaQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=JBaCVRlH;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506555;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XSB3NyrUAHysunC2u8Kk7935MzP4H4VGX4bwtoSLRCBTDPLMZtAgufgVthJxKXQJM
	 2AJgL9bNCYun8qwBItvu1J8Hq/MOO8uVSDGSfINsxjQPrw+l8TOicM6BL50ccuPPrh
	 X1RGU7n52u2isHMCb3nZPP68YB+/uodsBry7bg0vArAVJTyNFsg0+95G2tgXiXljWh
	 bZGaaTQe8J6w7A3aIdjwu5p5mhuPcEKPxC2Oz1/mxtenGzEgRqgofjLbVmhXDqrNG0
	 QD/zMwpCyWXi3S2X3INp35SW6f0dXnJfFjzF06GCAhHwd7XU4ALWBKefmEQyhbXMeO
	 CN1ffvqvcjXQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71354606BD;
	Sun, 27 Sep 2026 10:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60125335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51FB6606BD
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3R6WcBYbpPkt for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:55:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3DEC4606BA
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506553;
 b=Ymjnelfwx8fEqxKGwUAC64r4Qhe+8VjUXpnMT3FTN91CbygKrO+X6WOtGrm2zCwEPRze
 +7pPlel1/HdOYA5h5aY3PEGy5a2yHYJ4Z7yHUyks7KSw0UqalqMgxbfHXs7c/K7fWzI4j
 Ksb7JWtvtuj/bMr9MXgxqDJOKtlMQBbznCweyZonqn6UtPsONRNOVdtZTPmWjgoGPbXO7
 lfImD+ce9Ly897y22C2ZYOt6FsM7ZdNOlRkelyc4fyR2MBOQZXJgLiZLnrOz8xCMx7lkf
 9/MKYsLKA1lKYVPbh73InSQNKbfoK1L9jgy/yHBLHJuOcenqHtKTEIuN0Zc8w4tQkpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506553;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 b=gQooHjipT6KbPQ0TTc0dWJx2EBFhsdVc5AYdVIL/3VmHHySsOlc6ux+pODtRl8Rly9bj
 xLiyVEpEENmwZobTB/ucMCcWERe9gWFxiJXcMyrLAoTHZgt3XnRT/4Pu5RAYAZJHDqlyT
 KEluZGOwXWsr6RANnfNkPN6/+GB1DgsQv2/50ZLtuKtcAD2GVNVs+gdgB6PmQQdF7MCS6
 VN0Q7/zYmRcUXgXrMyasG2I067mrsYlJxM/e+rGv/jNNE5Sa5dNeWolR4VmyYwUVfDW8X
 x2K1fG8DB6ENhZM08VsWbajV8R1EJKKnPxauM2++r9CeTFPuTijMzMpNswOd4r7pgYA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JBaCVRlH; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JBaCVRlH
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DEC4606BA
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505860;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JBaCVRlHe6Kg5wLYYmEYV0wQOTGCh2mzs1QnreEes1+w3uO9enMdXwdMPDnYn4WFx
 ZDzBSg0T24qSkkc0FK9Lm7bZKnLpbyAfbg9J4aEfwEpRQLaO/YMooxYfv5YXrqMv3O
 x8qP76ErwOFY60yDhRC/qqR26N2pyZlp2EdtCnWEJqNShGkwzxJ59m3c1R3qmm02LQ
 1Klg4GFQZ6EmV4KbdYPfFOJM3hr5Sm9z8KeJycPjHowCL4MOUL+fu5tcMq70Tx0ql2
 ZEPGIP/fMlAVLZqy/cJrNJorYendXHuV3s0Hb6QlIf4/n+dT82qloSM0cnsRMnr1ss
 m5JmaBs4uqF6Q==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 Bo+vc38VaQ2EcJhPoHLeOHU+RvZsEx9NN+wx3qKOhfamrUVbJ9mEbsqNwy8yJ0fsD8FSfrZqSWa
 AiZOiMV7bYbpxB911qMVV9Wgs4ryqez2PaZPtQb1PCcqHpwiL3f25jq7D6FTVCvzfD9TGKSlpO4
 srxt5w31uuW1rzcHg8s9e/lO2UcxVRXsAPoYcbtqqoAQ+yN8OsjfjEk5SzBBmfTV5mL3HxYTkQm
 guKCK6QruN14clDbuyuziU2FJftf9AXhyLNVXAyVcZtLoaDFzHrIVY5mwUTg9zMR64Bv2Fmuvv+
 pF50Tl7mJG8PrUokBUnxXYm21XZqONEIH3cwS0LdYiNsz4oOooDSi19wknPvzicHxuRHKNf1FTo
 FcgUrLheZZ6p64VrfrKO6XKPvzwZDAEQYtyQNkm5teLu3hw3Evt4vBAeHsll7JK0auQUOHuwcoI
 CTJnmaICZp8sz5nZDBLcHH8F7mCn80ltMl7AknB6ZMnF3TDlCPD2lVFmW/e/4In9c50iQLD1tBM
 lNO00NNotSRlHIFNMcBQhEKH65LHpRxazhmgltW7tOAWQe89VlYd7NDjP4VdnbHoPt1OpKjwawb
 +OeTR9pSdj63RHENef8Vp2SJLyzPiZ6eTHcMsuEHZ6wNOz4gIxuYOyqCnRE3anTy+co9w7ywVVo
 NEj+r2HVMHMdQkcU9s/ze
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B71EA4C5066;
 Sun, 27 Sep 2026 12:44:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLc-0000000007a-13AB;
 Sun, 27 Sep 2026 10:43:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:13 +0200
Message-ID: <20260927104301.1801638-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 35/82] package/snort3: Fix build with OpenSSL
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
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch

diff --git a/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..9f4232901a
--- /dev/null
+++ b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
@@ -0,0 +1,63 @@
+From a32587b0fc22a716b70f242f7a130de003fb3b42 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 11:45:48 +0000
+Subject: [PATCH] ssl: fix const qualifiers for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
+X509_get_issuer_name(), X509_NAME_get_entry(), and
+X509_NAME_ENTRY_get_data(). Update local variables to match.
+
+This is backward-compatible with older OpenSSL versions since
+assigning non-const to const is always valid.
+
+Fixes: https://github.com/snort3/snort3/issues/476
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Upstream: https://github.com/snort3/snort3/pull/477
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/protocols/ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/protocols/ssl.cc b/src/protocols/ssl.cc
+index 733d19adf..4afac05dd 100644
+--- a/src/protocols/ssl.cc
++++ b/src/protocols/ssl.cc
+@@ -860,8 +860,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+     while (len > 2 and !(common_name and org_unit))
+     {
+         X509* cert = nullptr;
+-        X509_NAME* cert_subject = nullptr;
+-        X509_NAME* cert_issuer = nullptr;
++        const X509_NAME* cert_subject = nullptr;
++        const X509_NAME* cert_issuer = nullptr;
+ 
+         int cert_len = ntoh3(data);
+         data += 3;
+@@ -918,8 +918,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_commonName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 int length = ASN1_STRING_length(asn1_str);
+                 
+@@ -941,8 +941,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_organizationalUnitName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 org_unit_len = ASN1_STRING_length(asn1_str);
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
