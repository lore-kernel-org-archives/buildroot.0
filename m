Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B87C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F6A54078C;
	Sat, 19 Sep 2026 16:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ndca63BW_zcI; Sat, 19 Sep 2026 16:08:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0DFB040B9F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834095;
	b=aLvuOUVbzY5jr3zrzk7Jn0jDhiM6HxoxdFyGWujr1gGwWPAGl8h5kW20+Z7SglsrqMJE
	 BGozhBzc1PQNskJxcphJYXVEgWZcYgrEBDMrVqtOqG9ndiAqN7ebSBr+UAIXGot7p43yv
	 JH7kqtDgb4DOQKYmKIloCM5Y7hRIvJ5RKhbDANjy9kVeKF2egvcwtuNYRGsGHeODSgnwq
	 2uJsXFKzk2aL1TqH4+Ih+W20ZsDnKJHaNY+oJZw5esyYGmXCdHDJxolZABevlTjXWL8o2
	 MQ48wQrA5ax2IO4PLVoFMHgd0n4wgPl+ZVZUZFRH35ac3Zrz0a/Lq5wQxCq/CfYBpnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834095;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	b=gNHRzhacf0VR0B6vmt7jI8T8E+ZL/J3KD7JEmXtvPEHZyWx/xDyd2yyRUX+6bw+2NKDH
	 N7RRXWUkws09M9I57Fci3W047aq2iGrqGPmxooAhfmbBWmafSxNCF0HhzB3BTtg1ZniQF
	 ZV/ia/QOc84rEPheJQvMY5OsShBFH/UaGG2pD0DG7mxhVgoU1h9VkiAbQjydLzMBk9tEG
	 jWO2EUBexH3JnCU++lvysvZWWayhhOmjAuhWgiwQBjhXpBUXGv0lBv/7F++hDrSV1nwrn
	 1YdZ3ukzn0z+OL38iuNC0h39AyDVfbBys5S+5Xuq9NBNCIJ+QwMNApowz0jei74JulQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=qwKotzr8;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834095;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=o+GBsEcIDHh+nJ2n/LtTFI1VlHDxJA3PHS/wwRsLY5r860tK5QMSpC/aUI4w6PmIF
	 4Q/BHaGnyI3D0FjEcoamtoWJSLgWK76shYJ+95F+WTMfzt9HIqZ0EgLYHNxOAmkCo2
	 vmsH3TJ6I6CBuP5NMnP46Q5Nj5JK/3Y/Z4zd0KmFaS/f2111plolu71jfO2O0All1T
	 NgQvm7Ut+U9rZO/K55sDSFZRWeZv01P4G2BIw561x2rPjIXY/VP0fydb2mhNiVMh4S
	 Dqdslk5TLTnlK1rpD40ejJnk1MW/9n2sonfCO6ZJ4jYAueNanOWo1Cm+ALOGXu3+Iq
	 dKxGtz3QzFd+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DFB040B9F;
	Sat, 19 Sep 2026 16:08:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75E1424D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C5E140B9F
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4xqpttgVrfb for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:08:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C9A94078C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834093;
 b=TADT2CD4SaiW4tFM5I/cAydg0zpg/RNNDbJ5LYvKwsJBn57Ao0xOMNy1t3pS/+f22kTI
 HRn9FMOnNkJep9A89hkbAheKEC8axhW0JRSkHRa3yuq1Dt+SLat7Ndi4cnillKPfUSYsx
 Rbogl2nCDEUegXwcCdFCZ0R0p7lHsIBctNayd8vZ9GOwFihP+wgQhnRJouWdBG5Ed6Yse
 UUg4vGW23Av2NIVgK0tt1Hf/zIjo/8LwI0ILtElYysOuSpCIsf6/MJbRg+FQrFwXeQOHd
 Dm0OBEwf/wK4sjowu3TsjREILqSDBU2npbC0Ym/PIDg3wiF4KZ1+779Cwqm4CtnSB/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834093;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 b=hlkMQmK5pCYNU7lF4v5/1Lmt9eDY1tmOW0p0Rk1d2tFvY6tuwc8E9sArpHiBhCgcQ383
 XluC3TbJRrbCDqyMf5EtkokSHEZ4VPnwi6kNQBnGMdmk/gxpEadAFHSaqTJv/Hv8xUGQg
 hk8qG9C4TnFF+KQQxChuXcPd2mgpO3Ef15SGdv0jCkAGW5e42tvowO9DjoAYb1j+fAdI0
 MjIA8FgIehijIoqDCdTxjHzKTQSUW3Co7+6knMzhJHygLAahfuSX6+xxZ1AufQWcN15dd
 xlgFyjg9WZYuv9+zlIh9tdZNq9Cbt2cny4FZ3/nz/Q8mtWlBk04Rwe7SQm4AMXmcoZg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=qwKotzr8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=qwKotzr8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C9A94078C
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833549;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qwKotzr8RYZYFxsbA/7CO95+mGu33Ci1YyPxj7Er8Zh7JUh4qoQ8KbE0i2hqlgPKj
 InZuiCUCHfvOFWjNv0r8eHMmxyU71W9WKGl7goDLQda5l5T2DuSn3wU7Bcbx3Xw6AP
 BU/Ii/+h98oS9JmopCLFIV+6XzJe7+atOWqIujqGzjulEVtbj8sGqxPNVukebXIY7a
 DN+Xe1fW0tjQaawsJdqK3qCTOoU7XBDHUFPDQwAVBLs7e/qYHVkFTlBO29Ex27XeYw
 o6IMBRnzxC/oiw7JHnIf4KF+1YrADdQFhdCYebkA3UOWj+Ck5V4ss9XevOAA+T+QP3
 LGr84h96lo3jQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:PNXlgeS7DgNSNVVero7pEz//ImdMhimMIa5x/YD2kY+w5ZQJgPWbZDavPJvxz2wY3lw2CvS1FGQLRCl37FDQlF2JvnS32XxFGmqUwKaKBDPiwGsnz26vwxQFsSbMKDQ6DLYuQO6uTb1500d4kr/QvEEHHQxG0NpvUNa0PhMsrUpBYHWtABZEBinVWRftxxRI+857dntseYnvZpxD2LhKLSbyqzlHSeZt5nK8iP57ZLT5unCMJCqGyn+mYkNYBY/eAuh0PBUNiE1LPzbSVVo2L6MoZ/zhqaslEEoNIn7UqlJjQNeD0TS58h0oaARE5pPaHjmLKYWGIDBu7nDnP4XdDaWa1tK+oYn2MFuiSBbxJOE+aYozJRvCuy90G5RMY/alfSa8fB7aD6redKhWtzzrwSbQbGs+MMlhlrKsh6vBixCsp8N6SZs5B01fOQtEsuirz4vO5Hx4Yqu5d7OK/NE35hnFtKdbeoSFdZsYMWxQkcjFY6spRD3kh6QQk30yQ3oz1jLZj07dfeNys9EJT+4nPg1b7qL51r9iIl2LgUTONCR7Ckw8UXSHyGrmWQldPFoGbXiObADUIM9ylCLmqzPre2Hhtxq5pBVmJcsgOzSO+8TCHp
 4AdUzlWy9uJ6JKckhDZWAwfCwDv2oGVom45v1dOsl9c6fHYxCk66Zn97tOY3aYAsmcq8cZ
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92699A4C47C7;
 Sat, 19 Sep 2026 17:59:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-3twp;
 Sat, 19 Sep 2026 15:58:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:03 +0200
Message-ID: <20260919155845.5776-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 38/77] package/freeradius-server: Add support
 for OpenSSL 4.0.0
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
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
 ...ING-functions-for-OpenSSL-4.0-compat.patch | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch

diff --git a/package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch b/package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
new file mode 100644
index 0000000000..78d332ef1f
--- /dev/null
+++ b/package/freeradius-server/0009-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch
@@ -0,0 +1,80 @@
+From 6658c9e375637ce0bd14bed733270d863224431e Mon Sep 17 00:00:00 2001
+From: Antonio Torres <antorres@redhat.com>
+Date: Tue, 5 May 2026 14:42:27 +0200
+Subject: [PATCH] Use ASN1_STRING functions for OpenSSL 4.0 compat
+
+Use ASN1_STRING accessor functions instead of direct field access
+for ASN1_IA5STRING, ASN1_INTEGER, and ASN1_TIME structures.
+
+This fixes compatibility with OpenSSL 4.0.
+
+Signed-off-by: Antonio Torres <antorres@redhat.com>
+
+Upstream: https://github.com/FreeRADIUS/freeradius-server/commit/6658c9e375637ce0bd14bed733270d863224431e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/main/tls.c | 26 ++++++++++++++++----------
+ 1 file changed, 16 insertions(+), 10 deletions(-)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index 4f4cd0c28022..27b69a06229f 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -2584,7 +2584,7 @@ static int ocsp_parse_cert_url(X509 *cert, char **host_out, char **port_out,
+ 		if (OBJ_obj2nid(ad->method) != NID_ad_OCSP) continue;
+ 		if (ad->location->type != GEN_URI) continue;
+ 
+-		if (OCSP_parse_url((char *) ad->location->d.ia5->data, host_out,
++		if (OCSP_parse_url((const char *) ASN1_STRING_get0_data(ad->location->d.ia5), host_out,
+ 				   port_out, path_out, is_https)) {
+ 			ret = 1;
+ 			break;
+@@ -3066,12 +3066,14 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	 *	we're at the client or issuing certificate.
+ 	 */
+ 	if (certs &&
+-	    (lookup <= 1) && sn && ((size_t) sn->length < (sizeof(buf) / 2))) {
++	    (lookup <= 1) && sn && ((size_t) ASN1_STRING_length(sn) < (sizeof(buf) / 2))) {
+ 		char *p = buf;
+ 		int i;
++		int sn_len = ASN1_STRING_length(sn);
++		const unsigned char *sn_data = ASN1_STRING_get0_data(sn);
+ 
+-		for (i = 0; i < sn->length; i++) {
+-			sprintf(p, "%02x", (unsigned int)sn->data[i]);
++		for (i = 0; i < sn_len; i++) {
++			sprintf(p, "%02x", (unsigned int)sn_data[i]);
+ 			p += 2;
+ 		}
+ 		vp = fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_SERIAL][lookup], buf, T_OP_SET);
+@@ -3084,9 +3086,11 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	buf[0] = '\0';
+ 	asn_time = X509_get_notAfter(client_cert);
+ 	if (certs && (lookup <= 1) && asn_time &&
+-	    (asn_time->length < (int) sizeof(buf))) {
+-		memcpy(buf, (char*) asn_time->data, asn_time->length);
+-		buf[asn_time->length] = '\0';
++	    (ASN1_STRING_length(asn_time) < (int) sizeof(buf))) {
++		int time_len = ASN1_STRING_length(asn_time);
++		const unsigned char *time_data = ASN1_STRING_get0_data(asn_time);
++		memcpy(buf, time_data, time_len);
++		buf[time_len] = '\0';
+ 		vp = fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_EXPIRATION][lookup], buf, T_OP_SET);
+ 		rdebug_pair(L_DBG_LVL_2, request, vp, NULL);
+ 	}
+@@ -3097,9 +3101,11 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	buf[0] = '\0';
+ 	asn_time = X509_get_notBefore(client_cert);
+ 	if (certs && (lookup <= 1) && asn_time &&
+-	    (asn_time->length < (int) sizeof(buf))) {
+-		memcpy(buf, (char*) asn_time->data, asn_time->length);
+-		buf[asn_time->length] = '\0';
++	    (ASN1_STRING_length(asn_time) < (int) sizeof(buf))) {
++		int time_len = ASN1_STRING_length(asn_time);
++		const unsigned char *time_data = ASN1_STRING_get0_data(asn_time);
++		memcpy(buf, time_data, time_len);
++		buf[time_len] = '\0';
+ 		vp = fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_VALID_SINCE][lookup], buf, T_OP_SET);
+ 		rdebug_pair(L_DBG_LVL_2, request, vp, NULL);
+ 	}
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
