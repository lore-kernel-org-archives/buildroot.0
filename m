Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71D0CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68E426066C;
	Sat, 10 Oct 2026 08:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AagMcxFvv2e5; Sat, 10 Oct 2026 08:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A5C16066D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621273;
	b=BBdRiB7t6tfXxB423G27yIUXSU2dr7jqIMtFsgvlsRm/Lq19VWdurKFzMH3dd0R8Cvxj
	 V4fSKiwpU0JCpPAVIv7P9NYSt4EaVKjPIMaeN5o8IGrq2PU160hsrB9py+VQ0WiQLP1II
	 +qh89AjN3BMnBQTVbiZ+hcsMP0FYPmNJ4okBPCwgxDFQeEv/tJ2lYHv9l2ZtZMxEU2FwG
	 ltHl1To8h7q77FsfwJVM2kO+u931utNMsj8FJs1VlgqQq2RjWjKPwHtEiKgk2FS2XXV4A
	 W5uirAxwkO/vADulgbkMle1VPBZkRJrBIY/7Ehuxs0uREEf1MrHvScPAjU2rKZxKe7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621273;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9fPruOxHcu2kzBocNRJHfHT6i0+qIe8QwVEeBaqOdMY=;
	b=J/OUGd7yGXTfERzFEO4HPjoM/GSG/6HAb3zy3GUrjH3WVGg+1omXsz+Utk5u4HWXb1/i
	 H7OpRl0S0fe4TJQYHwQgMtMlEQ8hZrFRMO8czgpG3+SMu3T+CFkI0z52hUtgc+gnmHYQb
	 SBTxDg+FyY8tYqKYZDsMP2QYTqtFLzixtVqRYuodbowITSDCCgoQBEISJdvN8+HC7RywW
	 fz9AbYKgt6NxFIi+PY2fJmV3dpLt7r91vmAEJmtskPeKklA0qVhBlbANRjaF+DGh9sy9r
	 XvyzAgpsPGUhuX/HGaxAuYb/IT0eJ5Uqe6JNctjK+e6KbSzpKnbgjCelHSlll0/UYlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621273;
	bh=9fPruOxHcu2kzBocNRJHfHT6i0+qIe8QwVEeBaqOdMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RZsKcTwT3+zeLAlrfa4OGAedaezBJ6j6Ks+Xnl+xfcwOCuyGC/MTcrMDHqc+XvcqR
	 f39vy3tV580LL2jP9AHIS2gIjoLEpfd1ErIKPulvS2cKCvc2DD7W4QccifgFuWNJDQ
	 j35gOc3ttM4myY8/D5r81dtAiBFhJnZ24ZjaWKk0jOPTC/YFd5LCycODjiQ5hiPa8F
	 +nFEY4bDA+PFbG9u4a1IM4D/lFNWoSezJfa5XoXe5X6bJozzGr1ywCXnquNqfD2svi
	 sD/xdrA3LUzUmk7v0SqXMXtDdrzWShkuYSS4yKmr3rBVUUerxb3s3mLYwKs5bUdXlA
	 //6CLGUhPpGuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A5C16066D;
	Sat, 10 Oct 2026 08:34:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 70C19380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56E124006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VudrSxvhEfLO for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:34:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 87B1140004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621271;
 b=Q/cmRAxTUgq6RtADPzfqVT4QjTouR3+c7WdeZdos3Y4AjKBVht+Sk+8RC62iijVi76x5
 aMeerUGU/wNXRfcr9gFfYh10YGrjNn3Ta2IOgNtSEDSeC+UOOaXRNdwBfrtglHYPZRhFj
 +VdlTihJHfj23S98767YSFO+Z0O1iZvZNui0XVnuoLk19rPapWWJZp0Jy4Mb9XgcEApV9
 1ClxpZMXVSexT4n7/1TGyVA0TuvUKqRUqDXvUNKoDHRyWu57dZxHlVgNfBrodWO+dW804
 WviubuSulS5+1yRbuPbMRrL0Q9Xemv4b2fr4Z9wT1Y1RbNy9LY0a9lw1CdB03bwiJ2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621271;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DJ8I+XrMRGOPzBEN84z7AdSBdvDcO7NUGsijgcbhGYg=;
 b=EAe2BuRnCrmDntrQawsKu9vzR0ZDhWL7K9OpQqA4vvY/vhYN9jxc7vB1SX29BKUJxApA
 n630TVE/QyIYkf/58HhJ6vYSU+Z2tAqJeyhdqcBaM16e/DQVzFTPzSPhEGdf6Al3tHti9
 FGvIrf9R/473FbHpqE0PbwjtexRCiJsxh7z08ntp80WalFmtSSC57vr0D7YvJrx2Swqo6
 8G7e36nVInsQ+hiDwsQI7r3WdOhLRO0kRRDD45+HePCsddz+RQBL8vXbhRmHZgYCTMyIF
 U2Tv0YtMIcDhsR0qG5a2Xx5U7wICIKB3mP7j/41b5xOj9upTqhFS50K/ANmKQ3u6PvQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87B1140004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:34:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6253A8EF7C; Sat, 10 Oct 2026 08:33:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:33:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: caf363495a2b5b94fcdd3add3ffe982f49f55540
X-Git-Newrev: 27f84eb8127c12e44e24bb1a6224cd1344db9b19
X-Patchwork-Hint: ignore
Message-Id: <20261010083313.6253A8EF7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: add support for
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/27f84eb8127c12e44e24bb1a6224cd1344db9b19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: David GOUARIN <dgouarin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1_STRING-functions-for-OpenSSL-4.0-compat.patch | 80 ++++++++++++++++++++++
 1 file changed, 80 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
