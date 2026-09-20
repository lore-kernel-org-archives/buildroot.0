Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC655C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74AE480F8C;
	Sun, 20 Sep 2026 14:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_sEj-6-SEda; Sun, 20 Sep 2026 14:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7362F80F44
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915816;
	b=Hv7VcVt+m+Z3ubPdAFIWNq8mhAYOwIcGKxGvP8lUhgTYrp6IcEHCf9GGbp69k/I+X0hh
	 RX4QDSROw1In2glxIus+Iy8SGQ70mpSgiLY1KeFiUS4z/4O09GNjW8Q56sQPYjdTZGAvX
	 YTmh84MECgjHS5e2Gi70Or95PTh/FSwNY5V+lJ37rjACqi2IMAikkFf0iOI6g3h/iCI6S
	 p1YqXImzimcl6+eJpMg6dQlVD+NC/du1tcZ/4AXqAkFyuTXSaNoaro9BcUVuSN14TSYsh
	 kx4RCATCq+vYuEp/iIYFemE+27uJhgfldJS53lNSfPXKQOHeghHt/U96DepVlu4GF7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915816;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	b=EnMJG9kuXY34n1qGudimLriKoKP2hHMgUduY4bQvMAuC11uqPIy1kC1/UYmGCfVOyAeN
	 xgAAmURMzdryDopgDKsZO2B1Fr3Epz56O2aD3oTl+iO6hQgdLtly8eK4eu6teesTQj/nW
	 3K+rvoBsaSFj7Nmuk04mLgiOWxAnTOatN5BeBCslcKlF9NxhmXNZNMWU2pLWohB44hASj
	 u5m5Hfsad/z8j1CBoDDDdmv3GISLr4nE95oRSLPfSBXZlxsZyR+PJOQ8oFE9W/NngBv9X
	 luIYE7YEnDBWcR65idEBF/XnTznTPzTT1NS7fNIS0qErSxSaErK3hHtQr7uHwXXMaSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915816;
	bh=WlByEpJX0QmIW0Vo0KwvEp2jQCGbxbblqsQwRwKOE2w=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fbny0RCnRirm2gJOkf9inH+oX0eiZITlbjgJOGDo8uJ/f34hW8aC2OHfbC9LlNAxc
	 DNIw+uuIM08UrGrPBWBdUoDKFw3xFU940df/N8TOaW5HFfxilEWjFZMOT3sSI3UyUL
	 oaLtOetPGuzuGiIYJG/Eh4JFvNrn4prDMsXYGrJJS9Lqhj4E/Tl9BZcNSG4fplx3H3
	 v2G9ajtst5adrVwFLEj3tabkdpOG59DqGvXI+LGNjfW45RPs4W+kJ7SE7UFlP/ILgJ
	 9yND1e6JkbAQlIbUDJy2BM1HF4Svnj625lnFyDr3XwGJ7YJjPO8Vz/zNJb+p9lAHF1
	 FvRBZFmWmNj/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7362F80F44;
	Sun, 20 Sep 2026 14:50:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67D6F24D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E24440D9B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96rHrpNRf2c5 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:50:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1AF324081E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915814;
 b=LXxUxikQsfU2Mc/WwvJi8dtiM75Z/s3FIAgr49DzcxSI9vMSgBwe3Ve9s1RoSUiT7oVS
 AjHEWJIqAqshWUsXYmlM4miaEZSvznBJB9JgRkCMSqy1tT4RCZCVnEgbP58pfoiXwtRX3
 vjwsh7tp/t3dEVTLN3GVurWXJ2LsQAJ4HDmdAb/X5MduG71XhmIOw3CFio50tkPkvDXr2
 yX9O5DGuDrzelU8rQtVBpOZAdHqPjJ9XkV8uw9cRLCEixvkvVzVqlXs9mSwyKEMaohZl2
 V30CQ3q3bSpjSJl1/WZR68k3vlBBtFeq20g9XXq+JckZlDjMIkjTvR2J7yHws95Klhg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915814;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 b=gp6IHQplqvCd8cz8SCj+gljn5bUP6dPhXuSzj8WulT62kvslvS7LONuLr23E5YCXQ4cV
 UeGsIa3j0kpVzX5YVmieDrqlCEAdsimOHqzHHDdb7ZBAev2uD9maNiUo+4Yft22XGcSUZ
 iYYqWUVSbuQeUiXF0i+hSsRiWXI/MtyhgvLbAyJvHHFe0VZTADBpT7yMD5mJGCPeYZtoU
 tGUcEyxV/CbQNkbIHmVS3ce08IYcdNJx1/NVH5f0aS/BRTePkeZ6BQhCRBRAp/JsASOW5
 3py+HljATyuAROfJo34sxaF42wukLhQ2Ix31eJKL5T0DrlOgwWyZkpUrEQq8UyA+FKQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=c97xI8s4; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=c97xI8s4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AF324081E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=4y7mS7iq9ljm4pX9QfY5BxjGN3leqUgCrqnFTHODlJM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=c97xI8s4AQSqKgRyWX4Z3FKnF/9Ca2RFaGrk/w90X7e5M87q9bwVUUlyigRWz2EZJ
 QY3jVL0pu0NASLwdep7LUv4xjJX153/qo3kAwbAvVc/qcQHYtN1eAjtDnwhdHO1qBl
 pEbesNwNVV5q0dhDx+av5o935YK6Xjyew8tsR+bidcb1dEROQAk4+NAMCZQbkhWZ1x
 kJjir5oVSp/cAZPlbBeSdacqZVNDHLZ5DtvaoOjEUoro8bcYcSZphbrH57UXEaWEar
 NA/pM9C3mUz/r52yGs7qKC0iaeCNJQbMQX0Nzks0aPWoAZuOdRFx9+Cl9eUYQvMU+n
 e0YZLmxxeBunw==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:gODLFLqxeFKQJ7kU0Jo0yKxvYQb/zvhGz36ot/lInYQiCcOzG3qTOFmBmwFjT9k7YQF9dem+SBMnwTMiC6aKCekd0ID6WwnTg9Ot+2XuLFOKL8dWsi0TqmBPd2Dr1xVG8jqBUXI+4f1Ef/NS2Gcgr8ysltVMNF2MGtmFUquKg/uHfeG2WuNZp9OVVE196R9jDUYo1mH3xO5zzh5SuAnc+qoVhhk6afxWpihqeJvlZRj0rbvUO+V0xwgITJdlNJt1rOGxeOCh4yT3THPDezrqPMMxSNbIA3alyliToNXqZocgEkI0D6jUYdBo46zlLDzoqV3+A6eFqQICyKUC/7UrN4BSFo3TCRi5q0xkHCN3jgv4NWU1lU9OPyIShR9YjOzPiJCIef9B4tMktIO9bys9/SlO4mQrCgjZuhNVHYEPcKUqF5AbCgtTc5pgd8yDnJAGCdnrK/eV7mB/QJqENL1baokL/l+i6V3fzE2XRpK4w0N/8MIeSHmZjgCzUgAlXB0jbncprqsU/ZlYsTrcVfnvs0fi8NzfTlh8eDlpe2x5AkaMz7hMO6xmgGVYSzMz/aHWwutNABW4bF0YhGCciWWrO3b2zLu9s+I=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCB87A4C4889
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-1Ces
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:50 +0200
Message-ID: <20260920144428.3009612-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 29/66] package/freeradius-server: Add support
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
