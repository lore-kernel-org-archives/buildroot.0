Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8C6C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F5360639;
	Sun, 20 Sep 2026 14:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r52X7ybER0hM; Sun, 20 Sep 2026 14:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5B08660693
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913660;
	b=IyqdxXc6SqZLyng516Zq5Nh/ARYisAY6/OfhG+X70Ngcm5gK+TU5Z9ajlsNQSZqbdulG
	 UkvFXOR3o3e4cD8n73Ww7bshwhxqEL6DGq4t2pnilxmvHC90Wl0Q/bqveKcytePHUqNNE
	 WBOOOU+mx4EtWn1hW77q1otf/F9pSq+p0zZBbYR5S57L32IufHn+VFyhHfk2aGeJyCFyl
	 0W+PKdKv/6st16wwW2WbbqLyxqXzYLPzYBN1H4mwi//qef205qh9dbgsBSVJxnz0eoDHD
	 tG/yg3Cte9bLBupHUp5B5am5JxufgRHZiM4J41kIXHYTSzKpM7pm0jqiPN9bKWNA8mw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913660;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	b=AfdDW6RDFDjKW6j1SLvpbA4H1gQtSopoji9nDrClow2J9mnhirVhqLexqqtxEMWoveaT
	 b+SlrCvMS3Qeup/4Zt9HMGOrPnd6Vy3az3b8IDs5ijixexMaw8kaDf67HsEHjRxeIZji3
	 nyx6DhsAt1nrKYnOITlCmKWnWzXlkQdMPsRacBHY1ENUfKF9j/6yHdAs1fQ0I2iy7NoWS
	 X/se4FHOd7oqN5NjbUWP6xdtubnR+Cyv4pDnVpAY0EO5STeSXhN5ifESz4jJGz8cs9+Nn
	 n38T9k54i7zqMpGBB+gkwtRn5Yb0hw0I4Ahih2eEtOnFMhTtHdnu/PjNLrNUPTeZkYg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913660;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yj+ibAXQiLELIRet4vMdd+jFzEpj2ZlY7WY6iEdbRLv6FjP71QuT9+4NjdlHDHvcQ
	 rr4pG4aXnHTCgQW9QRawJJAlF7wlc4DI+Gp/dsw5k3gm6MFRv/3jSD1fQ5BqnYAMW5
	 im4Uly5JVYhY6BS8QD9PnzFaEE6PLWRoVJH5lv29sUWD0OGMc3k3+EiHMIbiUiYWqE
	 YDWp2Gsg11Ph+yhH9hR7AKayGE00R+p16Dz0kGk4Is9f5Uu8HGJPjKCSGp1+KlZ47S
	 cactuwnBRNyoz/oeXkTDNPX+QaaHiAxbKEMpAMoT5rG7flbIRJ4Lks+WRnJLtLSP7A
	 ZA9nB9Ft4AmfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B08660693;
	Sun, 20 Sep 2026 14:14:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69361371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AF09400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgoijDg0PtUV for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:14:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2755340022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913658;
 b=M8e67AM7tUOnhUT0hUlLjt79BWQMUfVSURczLCJ5R3Wtg7b8qkJVUVefNOVu0JFjKYmB
 9akcrOTU/hn1vLAevIr+nm2Y/bayrJa57B6knuWyUOvUzhqBrYqGJoH6wg3sGDObeC3Ke
 MJvrHzQ+oD6YCu7C+mKQ3F9l4kjgBrAzDkv1EsGFYTZywnpk25VyzUwB/pzstqcL75Ade
 uuY4t+w6CWMvWDa4Jdxtw+wHQKwleef5dYtBTaft1HFQ2PLY2ypuNNVCCTsGRZx+kwqs7
 H51FHnwHyru635GV/7I2gDgapKGfKM1IB2auBZQeIs7fGZHIL/tIvJ1+12dniTzd0IQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913658;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 b=obXad55yCp0WvzXtlB1+juolysBvWma/cKlW8t8ZxSKD/58/FyS7s3MDBE9OlrbYabXd
 tqzMTIv3Q+kLrrO76q75/iBj0wFkDLzGrmgp+SBvRRlbvwPFSZcyd6XTK1QDloUF7fZWq
 M84oaKj2x5F3tb5nBfWaxuTwTIdIzE0eD1sL6IG6T/784/yLgoo/pvafPZrtuFn+NOhqO
 uQIX+dmFg4jGPvjCRFfhChXkTDoa2gaslYiaKOA2KxwKshdxEjtKF4gk7uSlbKI1MieBR
 C5P0AM7ayO2TC+AS+Zrxhlg+7utdA0875VOolO0gXHdVxkmXWRjMFofzQZVJIS5Sp0Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=k+g1RyXI; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=k+g1RyXI
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2755340022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913237;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=k+g1RyXIBjRsZvC6z9+upaI+2CXAqX5DyGxl8smcWBa7isJ8SNkU4W2t+9BMA5Z5r
 pvr7R80/EyZOB5/m4esyYHDzSqjmHfmkfgPDdU8ruEfY7NtaMZkmUsfDbLCZjGzac9
 ron9qF7MPx5KQjX5GsX2TNShj+plYaTPVVzjcZE49kCLVZaNxvfylrbYiiOg0GlgOY
 tn698OfdwN1pTyKj5R0pK2smsQEIyZYg4Bnvs9Q9S3zWCS3zl/aEhBETn7vjVRnZ7E
 CIJvKl+7WhhXNQ0t7pu4smshLZtz6Rc95j8MRgEb4KnvZlwXK6kcGvTyEMZ0l01hVd
 JfqK5CggL8NDA==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:sWv/8O0jG4hhe6PBbYfAjhI8ElalUIVLhElbZQRvcaa090tEPtel6wkkZAtwEtubwlIpyfTA0vujB5MrNyfqlu/ApCENJ79Xae8YRVDzAR+JFzd4S/sdlCYqENDx1ELCoN7/RfkIgBXyDUWzgqtJokRNFAhjJIrHwtWw+Nm6YV7OsGSVOyn1Cz5aDYLWvVboOOp/K2WtpPpIQL/19icX/RxgJzJBKrT2Qv6DdKu40ZYFqpKbZXk0iFGXHrpHdz7K7BvB7Lx0JC2PDz6arOGFNnLB9qMPblDjSEXJhsbfDnhWeEx4J4kex0lTJgitzb920PUXlpTnU21ofAS9Co3Q3imGAG4tVHASM/ErLUsDzp5aMUthVl7bpJKXlW1j+0n0tye2X6Yc3xtgXfTQtXPmVEhSGpFMuCuQ8FNIK4jFcBHZ90B6hQlm50pSxmEH8f615lUNSPSd8zODvx7kXBpZl2xeBtFSix5fv0WxYLvKZRR3sceauQiu012sRQ518ql/ckrERxf8oNkDq6L5Rrw4chMuYnhqaAE04x5yrBEGbk9vc4XupjpUkPC2F5FEvhVGqd1vyQZFY3xNkLiOGKubcntgXwh58EcZB93fiEu+3UixyA
 ByzKNvgKp8oDsaxg1XxNIjfNU6vK1afn/opxJ7HbmXg6TTTeXmxEmKw+AP4iPl8FVATjAeNvh5
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 42A99A4C4875;
 Sun, 20 Sep 2026 16:07:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBI-000000002J9-2Hsl;
 Sun, 20 Sep 2026 14:06:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:27 +0200
Message-ID: <20260920140605.3005461-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 29/66] package/freeradius-server: Add support
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
