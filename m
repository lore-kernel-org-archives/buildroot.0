Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1638CA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9915605AD;
	Tue,  6 Oct 2026 16:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9lO_80qXdTU; Tue,  6 Oct 2026 16:37:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D505F6076B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304659;
	b=AZ14rbe5sMeh0UgQN70d4CYQuwV31UNuStfcwYZWTuTn/l9xs4Z1L2GM7vWDMsSYrAzW
	 YCKcnAp4ptfizWNiiQ570IsmcCK1S/xPzG22qSgkltb/SsaMk2y3rHZSdMJWyPyCCRKlF
	 AsUBMK1EO8YwT6kOsv//qQmduPl+1FE95j81ZeRJheyXEa2L4z9SjEIcUrbqAhvT4qB04
	 0HsmZy1JpJQyK+9rPCK4jQeO+TsJgsMnPKPJ0mC8eighMtH/zuKTT9K7dBL0ThiykfzKX
	 /5y8fx4LKfS6kSmYCDRvPpzf0pjxIFNPBllJRxdUw58OemY+nmiCSCwbJ0+ziyqFBGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eWGxs5Cj0sj/qkzKh+7b8JYtCQaJdan5P3ygvEv7TsA=;
	b=mOt+yRcUiEDD930X1d+saZ5wQVINLc1dT5PQAw3zu8iA2H0wW9UgRxq3F2P2Ks/UbJCd
	 ivz3zJCPrwPQE7VPVOOJQphkvGtEH/G/8zucBAfi3OB9K90j5Uvsg6sy4HjpUQJNq0wu9
	 MRMkGZOvlEoGkQsEHZFqw86J3ySFtkDcYEgF28vLJivKMP6wlg/fXO6aF7og0mWi+1mLH
	 MHhKE//T132KE+w1BjjkEYUUqBl430jQl2zcDVHmEBGLn464kWSducdHHObudfUuyG4ja
	 p0RTZzm0JMhqnfv/9oUZ853ipYUHM6nBsgbsI4OGDa2KkeZdAkQDnIpR2u+MgGOJFRg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304658;
	bh=eWGxs5Cj0sj/qkzKh+7b8JYtCQaJdan5P3ygvEv7TsA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Imf9nBQM4mzh+IYAS4U+NTWjgty8whDqQhAbQPf2WLM9hS4DCixUUMR11HjOjxXpY
	 D3YhYPe8Q7ifl8kpupO2OFvzCvXdNUzKiAiYstq5OzJtEkFZ0EGexrGc7wc9uW3opH
	 ppcCZ79WBqTfg2lwJa5AI8lki1X7MoeJHweZMNdyOhHr7e+1laHzyDEdff1GjHwELv
	 LEe7J0gX0vcLZVwFRBLfLSo93kjqia09wrABQFKJwq60TRG8LIb2/uEbC89547TXeY
	 nLVzdrdVvBCn/kSM2cZnlmdii5HiuLOgIZKjtWcI8ISdudusEpMeLNGmT7fOz38k+e
	 8ykcIhINosRMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D505F6076B;
	Tue,  6 Oct 2026 16:37:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45C5634E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C60D402D7
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FAof0rC4aEFC for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:32:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F1D58402E6
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304342;
 b=Iz5TpiZUsDvKvV5EDjLFqcm9Sb4PILAQYyZS2dCt0C9j6r3DjP5LaM2jtVRVqrkp8Kmi
 fNtVYEpVMacqoMnEoyJyAarOpAFoYMETblg89LrJ4uQYAlTZx8P3cKEOs5JLRFhdoZlFJ
 q3OYXwXOX6CyIMkfG/xmaRDEOXTWCFumPNCkf+U+tq1OcQ3QlzxbuLFBDHDPqKqkVJSw0
 0FM1A9DQlJE0sV6gd36RkxNm7pdBe76UpJJonRl8N8Ceq6GF5q8MQWAZGyDE5mwjVoiT8
 XHyF0GSMGy+0YS5jEz+0BOMoZGzPknr1t008hkty4El55UQx92hAQfbmOdnwA0Jt1cg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304342;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=/P1Njut4KbilxutXXus1gFzOLS/JBrfC54TGPMZ8YyU=;
 b=O56w2L+RLDlCZ88n0Vi/cBDLRKrHf/6LYNfBBNS9osPnm5WN5YsJDxBLks7ud0nNO1Qm
 +Gwu/OpBxZl96iskVsTceo0X+b6hs8shsPPlcmJd9wKAbJJFL6fwMju6DSFSyYEgmiBB1
 OOTnKBuw91t3BEXYHBLGH9pTzZRUShmMSDKUQhN+P3i3CDoBYd26F8Yab0znTSW0Kt0RS
 iwz425Cg/JUpQTNuuVyzElzhNqwS6Bl6aCcC5o3xYFQq6H16oe4U2K3DSh1KnjxeQxZ9h
 0ylEXOiPaxNLt8weFq7+FCtxj4MaYxvUDklqHVvLj/rOV/1sekwc7fCrRV0YIXo5qDQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=TRxZIix2; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TRxZIix2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1D58402E6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303709;
 bh=/P1Njut4KbilxutXXus1gFzOLS/JBrfC54TGPMZ8YyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TRxZIix2W13ptoACT1jcZNeM7ZaRC9hJJWvVj47Wta9U50NL8T3i6dY0PhJbDfn1H
 /OYMk364JvHS/TGYJ1jZmpfAxDxPI/7lKyzlU7az2IyL7+3hLadbZkrYt1KA3E6n9j
 GDcvgzMt0OcQRR32VurhDqnuEexuj+MnDLgERv9MdaDLMAMAGKdAu9Hwgq8lB8TbbD
 xqX4v+U4oZkQ1T+aFLhetsDXxddlNboX5ct/aU3pDXkPnAIVCSY8cO3okd9dKvtq4f
 QOdLURwrqwuNCoLZzRhTXrn7SckAekZyj7x8SlB70higtjU0rs710QxUEWRo9Vp72q
 UAGqLHGt8nOdQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 Yitb9mJiYy/07/s5NhNxTg250z+o8ac5ALjeb6STkKuPr0T2/1dvZd7JfJgLPGcpvjT6jm2LhFz
 MLeDGkg841HCfyWeDcAUgwao2LOQkbRLVKiC2FLucDlg1/qhNyeyDvkD/Ugd6ba5y8XWw3xdSbE
 TIOJJE6lcC0FttDtHjqUrM0k+0iEmDJCOId+Qy4n4DRyb3rXHQ4Tacb6IkW+72bfQ5GgpzWRi/t
 s6Sv0eZQzRZm6dHnQUL5x0SYtWOZrP2N85G4Yn2guh2Ig9qvBGHIKvcMtIJYFThaCbNDLvcN+q+
 leTazy8mK4bB1m3uVIvEcQdUTDFGCmfIT7xfwrUEW2yfgPYO21Zs5BoL8IjPdQIpq3SejyNZykY
 q8CSHoPN2kc7hIWIwvjBWMDIHPIRXjnGltv9EMYWK1Ku77c2pWyWTsFqDrGN1nPMD8rlpZMp90Z
 iG43C2vyOE7XmgIcfC3XZlJXoEoegcM/1fc4DxujJM9YMgAdQFksrCW1eqQPSuYpe8ktOuLfKT3
 8LyXCs30Wz38Xn1SIJonztU2O3YTRVtzcc86PRIRXjmDPyMnhWQpoOLI8PQK1eYliEmqbUfmDzI
 lrddK7q2sjXU8y0FdJaBA0gIqzQusrji2ISXTlhW1pqugg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6FE4EA4C54F7;
 Tue,  6 Oct 2026 18:21:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-3PNH;
 Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: David GOUARIN <dgouarin@gmail.com>
Date: Tue,  6 Oct 2026 18:20:11 +0200
Message-ID: <20261006162106.3439373-31-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 30/84] package/freeradius-server: Add support
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
