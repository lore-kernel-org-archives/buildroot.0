Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206C2CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD45981158;
	Tue, 29 Sep 2026 18:45:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frraeAkktETU; Tue, 29 Sep 2026 18:45:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DEDD981132
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707532;
	b=AKAu7R3Zcqga7o0M6qHVea/PYmNCoDS0/GYvyC6Tr9cmV7fb6rTV9ALUrKf2oIOuP8dV
	 2Tvjql2hOiEThri4FSDJJWC5gfm5XwtSOP+wVTU+FJyYpSLKUJcKLSXIoL+amjMGqJXYF
	 6aYGvQdx0PmTtlygWwYbbSMr3NfKr825O2QOv2xhLm6HtKQaMvcpGzEJkfgINRF1YPeVu
	 zESeMir3phOQH0LUeWKczyW/f3q9r8n5e/hCplgKiJXmqdej/X2ew59h+auLAKy3FqpCV
	 tfk1r/zNTp0hXihQtReIjj9Q9JM+vgHtiUPFtmBV4IjKdLY0OJVt1RYsqKXzwJ/Mk4g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707532;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eWGxs5Cj0sj/qkzKh+7b8JYtCQaJdan5P3ygvEv7TsA=;
	b=cn2WPCDG68bOpnwQO2kZsAkKm+BCR7hSFZEbIhQ+tVqiNKSqeIb2Oy1wSZQB5RyZkID8
	 Em+kO2cqKiAMdBLEhZkIkaujGzRQ6QjOlkjJcUM9gydlvsyDehiUOgipVGLNthNoZA0Hp
	 39bHtIL0Dp7iDIwYfdsKbILHLDZ/1AS8aUQFKbNqHKFs+vi3dfsJRCNnL3PZAE66QzlaN
	 MjOLBMkOmc/SBR6L794bxpTeCd2Rk6LHNaUHore9Xu3jWG8iOYtZ6lSanCfnDWja9SaXM
	 SW+d1f6XzdPSOw3Y0rDUwsHoR0ugtwsqx9AIA62PbgcP7khDhKPLrJSnXW0Cw1wfWTQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707532;
	bh=eWGxs5Cj0sj/qkzKh+7b8JYtCQaJdan5P3ygvEv7TsA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFHgyJMK3S5K83zOCpQWRrkw+kQ12kcwax59xBKB9STQVl6+EzKUl8Zadi/i7fGbl
	 MnWC32Sl5VmQ9lyAC2Ot/LUbMWgehOnaZByvMpdoG5rcMwXyQA7GlzC2r8IUkOszVr
	 pfD6/SllzwNuCRfOruqBKvJHbmlVD+s2bKrQ3U5m2Tf1DQPwc+NqNh49k8qWloa3Tt
	 OUUnTvjVAUz9RJgyZOkApDB2asP3o2cxUfrjqATpWDwCdacDctBlYuzdpSoBplb3y7
	 s9OO2qtQ/DRa/dLCowXyTjdooIGUz1G9laavg3XxiBLcbfRev69p+//l4FSIburlu/
	 3P2GLD7jqA7qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEDD981132;
	Tue, 29 Sep 2026 18:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25DD314C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 239814032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmE3IzIUZ03O for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:45:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 223A7400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707529;
 b=GAkN1EgnGEySUwT326hTFikOahc4bgYgJKE/brkp71AYT5nyzRhbeFegeVbeXk5yQcez
 h/A/nJuExAlGOO1x8CvZzUTYG5N+CR8v54SkQzFM1bJwN88kwJINv7YQXvca3JqOhMm2G
 AXPT4ri9BkZTHqAj8zsqcGSFQCymIPUyqn4Jb+4WRAL4u2ZveNg6TNbN0QBOyNv289Jmb
 wEfWT+Brn16Bp86lWBwHJRfUfZxGYMypkX5EW5gpbMmZs7UFSqppXT6Y+IX50r2Af/c7x
 fTIRRMwPWJSRM8i8pKKf8RF3K06zMA6aDGBF6eQJ6GliQgK/26COt62DCnlxnR4ZSeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707529;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/P1Njut4KbilxutXXus1gFzOLS/JBrfC54TGPMZ8YyU=;
 b=kLMNYOfOftb979AVRxaumTPsU1m0pKqBi1pHebGsmNhmcvrAVfY0+00fDs2WdTBSu+/B
 GAoJDNxR9H80YNkufVIF6Joi3dYAkt4lbnmlRABsjF8LlN2+EmadcNsYaZBcGIYm4wuj+
 FSZxS60Egew8qgp9lYVb/9yHq1uqsb4c8TFr5WpjMZ9CI6FqNyJohLOs6eBUy+PQWMDJt
 tnNKIK+vYLKNFE74Gy3ySk4Ilo73oUutptLnrhcghkHy3JfA03Zehbmde81mqLDk8cFOX
 WZ7+jQ7hmR8NgXeHZbGTIJTPgkp2P0p8XNxMta7uL54DmsC6/MU5UAtG+KuSu6wSULw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DLeu62X5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DLeu62X5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 223A7400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707029;
 bh=/P1Njut4KbilxutXXus1gFzOLS/JBrfC54TGPMZ8YyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DLeu62X5XCo8pmHKXwlR6g7f2cqVDVt5aeImaElU2HiJPT/SFgAHWWROQF9NEvzCF
 yh1Iq43svBAfAMB6lOIK3+eXxFdiATVtDSqbloQFe669sIM7XYzSbxQ3RJfsihKh47
 d/Qmcrdn/p04S30/jfsw1AbowSoXkV4c/sIfPdnvxhVVAm5QuJggjqGAYNiYa75Pql
 Py1OCft06hM9Svoax1Bs0pWsUnYKm6pGvFcPyyZC9RvF7PKI+QkIv3AYiIiDl+PMTm
 M6wSk7ADM1BlPxjdFFPRI3t2hzIgXjDbrGP81xAzkqLw1TNVda2kJnoOdDNh1a8+sU
 Osu1xtVcC7k4w==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 L4T/XBCc4AX+eQut+Iau3MLNS0J7lbTjnL2AHEGtCSGjLvvFznVpZTdMTpnBf0j/HtD00K1Cy4Z
 Z5PUztHh8yFrgAtqglB4JbxPmNChSWBzh51CUTWIhfy0JDptZf5oCPXffXxoSwfG51xbjpLgcp8
 GFN3qaU+t5xpgkyCYprsnoIiJPVcLmhFmT66ljBOjAPnEZShHxVVvIrSgUjkiG0wwg6dEscszx0
 0B1nAGWZWhB2c0vHMGkrGc+edZfFIroFjUT9hFsR/h45ZuExEPUhYhC6VxwvXyLi7wY7vpFLtZ+
 RNGU1/WZYRvIuP4RfbD6LfoJoYftrH4fLiW0A4IKnAwiyprblnLHcv5ICCVz01D9nhjv/gPGWal
 2iWBGn9iJaX4dng7mb/HX9P+8u5swzDCOthOGqtfNTCzCJskzxV41fUqU+8a5looV4owvgjjERW
 DxvWfbh/zgOHvCsSULZng1hY9A58VLJxYesi5SV/aih+K2uEVyMStcTzEtvJaXc5pVpmc6Pveen
 KwJ+gc24ArCA9I4bdvn5Fi6VZp1jQnnaFCepAWRusBOQTk8QdwVhWTKDVE8dD6N5K0IPXbSWF6F
 uSHxCACPiaf7Sw2dXvjFho+on3hFKZhZi31g9LXsQBWvwA==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 902ABA4C51E2;
 Tue, 29 Sep 2026 20:37:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-1ze6;
 Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>
Date: Tue, 29 Sep 2026 20:35:35 +0200
Message-ID: <20260929183607.1849293-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 36/66] package/freeradius-server: Add support
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
Cc: David GOUARIN <dgouarin@gmail.com>
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
