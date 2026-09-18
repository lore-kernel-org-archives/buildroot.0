Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6653DC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CAAE605CB;
	Fri, 18 Sep 2026 18:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klupX5WsGI2o; Fri, 18 Sep 2026 18:52:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5932060DDF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757537;
	b=dLoAfRtu5HHa5HmjerQhdG2MUOHEcemL4ZcYb3H4/T0B5eBuEG2AMb5DEuoHIMA1Ckvl
	 BjUleh7K6SwIsH4oT9LtpRx99p1OepGeNQPc1d/DzDiPiS1nfigHHpNc4UgiRuB0AVr26
	 YeF0tEl2p9CBQtv404vHewEcdtBjdaP9995YxIw7UtXU2i3NAVv/Jk2QnTeA53KFZyrSx
	 Q8HLXnJRpzp07BlimnEyLdhjZanGYHcvVy3KwLud/L9LbZwkgyV/Zd3LWPjfWYVkXtjzq
	 Yd9TrFb0Jjy/dc93J06BWLhYCErgBipstuzJhOvjrZZLSrk1apak74vxSCgXxHXeTNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757537;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	b=S6Eqv1MeTNFL5SiaA8YJQDuebjJ4TYjEijt2OoU0JSZwKAGIgdP/0gb64bSBUj+LikAm
	 gj8DKAUBLZpIzg+kqQFnBJLwQ6/R+LyayCiY7S+IdyzQMpRmV2pUarQLBbPW2+SUZ8sbE
	 fYZLOFo3YfZt19Iy60s7OnwBFM1dpAUDSyycB18Ytl+iqzEAmtK2Qhsank7iJLIe42tfG
	 93JzKG6IQFZJvJ9XJWYOTIGGwNneut3l74PELi5IFLgyhosjjjP8fxADw8OWcj3DTMubm
	 9/s1mBxhDqc5dBFPbKLKuJ4/ys33/lZ3fD1A/1zhaQ+8R0xI2txwM9lOWGECLcQ2NDw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=bB7jKo5p;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757537;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NyvLW8RVBP+Yaa0TzNizpzyq9quXHiUHVOig4/ZpEr8xMh7pT6/wDMM2hrticfZjp
	 n8JCkf6Q/1D0aiQuqc+YTogcUxdTj1tz55GrWS59XIzy+PBh3Wi0BgNlkv7l62WTz9
	 w4ujJFK7Hw315Q4+iGQPCL8MluQzGOQcH/WYD6Y7llj7R2AXeTsSuOpMf/u5Hz49ql
	 gAVJi4yNfl8kgJA5sIN055zcDsYKZk/RzUrEYW0L5Ts5pSRsqRozkaqBVrmhmSbN/c
	 Hi3lLkSHo50xuENOXd7oNlkIKDauwVGetS4itbi5YnFSz3hQ4O0xwpc7LE+++IQZ6L
	 F2STZf3n/iZtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5932060DDF;
	Fri, 18 Sep 2026 18:52:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC70D237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B285C60E48
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dJFfsIlW1KJ for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:52:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 598FF60E36
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757534;
 b=jG0Tj80G5tdwz2FTMKHBTaZcs8pAw2sVY5SeJ12xJ/w2fZ/l1VHINAhszbk5sig0MjO7
 eOChzSxsCreJCNydnR/v5xgV52zHx2VkGq7sIHxznqors/eZ0RIV3ilvZd6+8EZsjP77Z
 PJ/rrJg91+yDE0GVLZUuNvPsf8Q4a2TJMGh9qPUF9o7h14OsJgyGPCost5IZCs/k5NkAM
 LW/Iz+K2mPW6Cc8W8Jnd6n/Gx5LEBc+i+2u4aChZkoll8sfCbm6nsZ5Plp4EEQa3djoDb
 kLB/XTFtFbP9eQYhU27C0j94f92ZgNW5cLl5x3nJjjyh7QA7k1V3+sWY6kd0jGd2qgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757534;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 b=Y/I6AGUk4+Yav5xaLg3tWHnjO+muwFIpE1z3wUm2gYdbiEwPWiHCJs64oVLzWsMV9bU9
 m3FQes43tf4Yx9wF1Yz21jIfFBlVA9zFIx73PJc38Lnw0e+DSP+JHoD5D/1tC8NO6fB3z
 EUoAOLicKsDc3l0W44f/f3NKvKJmFeKGt944F5bOdDKTiTu3NN4ykYFGBGLijk+QLqgK3
 aaoO3VldsROMPl3C1BK8GF7utXVJ4AeSayQocx1kAZwWMtw43n7USFp4nKRf2aAFYs6sm
 V70nQL1oINVdiZzPbiC0l0+JYaI+aWU9/XhLEPZf9g5fz/8rYu//qQw8GoY3OS9kasQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bB7jKo5p; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bB7jKo5p
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 598FF60E36
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756938;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bB7jKo5p1zDMWamiUSsXc4WKTUGxUWAHNNYwUrWb/FohfOlZM+BKSzn0CNtl8XrCb
 vvvVFqj8yQevd21aNT5mqgYqFJwFLMFjQrmdwM82MG3QsA1SZctZras0tlUxiNvySQ
 /0AkiYWPJWwdQZIFHKcstePXWbkSWNi3Kp9Ng8x610l0MIiV37FZWOk9/qRSejLUIL
 xhU41lz879cchLpwuTtHwSUVatWKUiD3A90UPZS0TH9vkZ9tFZPEg7ReAcJa7eC3Gb
 G1be2CefV+ZaChHm7YNspwwQs9LJAowwPWXwkOu1wjGIUrO6xOKrmQR/jcDZsQ18e6
 YaXgqi/rSfSWA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:Y+AVS5F2f6GAGdiwUOb30MVj27ySmGBKE0ycFw+N9G8U6TduVgw7QJnFi+Kbj/of9wBJ96/1xiZZ77fikMe3DQIek3WzcENoxJ7YbUh1I3AJ0yCm0xCnSWuqKlMNDfmvrI8493vA87Jz9k6CwZ6HhtCvccSdPHk5Dw/IxphpsKIQyKoRN1wgnccL9sBcqW1fgbOoCDcatBtK8oHQOzKLex+kUieonzweXomIvuVvegu2oCTJRjvYsLHdBrYjWXKQQQbP+SwrepQxeawbBlXFT3CMdyJpCLwvjok/+p0IH4NhlcSxevlUr6BpcKBSXUlT1lwcFjAnzUdD4KBKLhBbDgzdn5iGVwyJOcP10q1EzYemwCdzYZ4J0kHEnJG1K0czOKTghn7PLFIGY0BHiN01zUPbi5LO7jHZ/TF0DdrV4M7Ya3Zhi0eL9qZGLzGF5OIkgPLbS5n/1Ow2kvL/MpSSvBoVcv2CWZXCzyxSTQS784dLJRdkOcyAOXFdjL88bULdTESDPE9QWvgP7/iJOYn79R7Cp5kXs/2i3pYbD7Bz57o7Lk1/9V8veafCJVrY40tLKT3fQ4MNCHGsVhIU06z2qA4x2+ZzP4KoFPRGT1L3aQ88Xu
 Yy9Hc54jpbc7qgI6BCJsN6jlUrN+5Vh4wb6FMYni4jFxC3Lk4H2y33SuS5tSrbf63sEVgN+Huh
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5D009A4C4736;
 Fri, 18 Sep 2026 20:42:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWv-000000007cB-2bcI;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:00 +0200
Message-ID: <20260918184140.3631274-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 38/77] package/freeradius-server: Add support
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
