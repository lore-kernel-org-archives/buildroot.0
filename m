Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC80C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7772B80F79;
	Sun, 20 Sep 2026 14:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wftd3b9hcbC3; Sun, 20 Sep 2026 14:51:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 83B7380DD3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915891;
	b=K0TMGJa/6bk8DR/fi2ypO6TXfg5zOJ+aBl08m01UgUuZkvEoNvzvZ1wVuxkcFx+LOc9k
	 E0xlFf0vkFqiA8wGVWqgsE3yh27kIvJTwqNrmPIwA1reQ7TD9mjSMN+efmMVQhbHnbD2q
	 4BnkM0veZMOx5lw9jbRyXPFCEezd3yo9yH/e3NRxvKBSzmkaVeaxEuHcwXkm5tUitAo/q
	 6lL4mc3ZKouCWfQ3prmu1hvP4lEW2F3Gv+51yULN/5SYeOu4oYDmHAVGF169WOJZDvs/y
	 ZcU+XG4LDDGDLXz+HxIht4EjWu+0i9zpsVoOcsS+U2++2nnOVqNxNgiD9ytJszosX6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915891;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	b=NnRWl7c1hus1nRK+83cvGqDF2KtFg4Tfc184ZJt0cjLdaagtLw2Kc/+sm0iYvzJQsKyP
	 kG6E/h5Z4NOGvYj7delLTcqVYmrdM8JVJj3B27vyF86olN8iMRIt5sAXbN3PqD2OSRSMe
	 zzLFUnX55OEBCoN83/P/5W7ddgmi8xgkuyK1tpA3p2azpt4eGkFurH7XhMoQquzEvjp8a
	 TfXuD1DxeNAuDioG7G2afwtgSL75V5Nu+LqxEZGMQQl0mLdWtKg959e5SWqKxbDIUvgSj
	 qQaecu0lqMY52gY3da3xJD8P6QmEOLnoUanhaPUwapazox6JekFR+nYCOi0RtigU9iQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915891;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ihtHZigGcThK7Olbcdr5Ylk7U3uB1k5689QNm6v+jrO+Z4oW58a2q3rG5yjsLABFF
	 igy7m9i7Sm3mJMaQ2IecU3hJ9dFdsEIrTz0vqZ9hjitqPgrJzz+XNdipfhtest6uLq
	 eeW6AlVsqZXrdkNc/vmRKDiZDKnYmSrOELUcRDxuXlAwqOmWqTjNIEOOiYSq2dN/5h
	 m94yfzpcxbJFYD9FVs09Bx6HZii4Qoea5op/sX+t3qjfTbj95obovGn6c2Fgi5Sj29
	 3+7cp1D12R3y3bL/Xe4yXLOXdgZEEeFFcVcem9IUAJzScabk4T12EoO9cJtGV2KE71
	 aVyeKRqT9gF/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83B7380DD3;
	Sun, 20 Sep 2026 14:51:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CFE624D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3395740A93
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQnu24pEnKJp for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:51:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 571B24081E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915889;
 b=qTRR1j/PcDAYHNfTyiBkN57I9HZSD8ejc9y3Rxf88sQZJfsxpG2mdqvZmwUg7Qd6Ja1P
 fLg7JaGLPWHZwo/OmYaj36bxshv6EBG+5L0QQzrZKa9roPEMTpYZVtbqmMt8YD7BCCMSC
 1KrQNASZ2cUfL+r2uGCcTt24HSHzyLKFuDDLMcvHiFS2QZP6VnmnctPA/AIyMGY3+NbvT
 0OieKU5H4GQNznANu9PW1ix52sDSwR3X6OjvnBENPF6RuJMrVL4dE/54Wq4e9M+6T+Z4q
 ZN23v+PH/YzKcvhYc6NJTzyvLzAKWoOs3glfbqRnclMluQow8ZtvTgh7FtFWaSEmOOw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915889;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 b=htp16ENqEt+BGz6GZpcWmC8HSWNijUj619gljXW+Uffn+k0CsJKFFVbx6riWxdkBz0tD
 3krJbQ4TLLOCGtgzE3rdAaWMylSH7W25DMcV8ey84talJcTTItVTheFJ16lyxLJZyx7nD
 XRDEdZ+k2CQhNkpgx/xf1EA3cSYPKdLl0Km2Mp82QWZJAmddcXTdBgqnXJcybmb+YLFzB
 4L3crW5u+JTO1Wzeu0BK4qjDwSYfWdhmXtIiOL4dComd0GC2uTI2aZh63TtrARiU5QyTw
 yt/37ArIgVu52dRLxmr0Qt71kY+FUqvS3MgRz2h27pNBQNBGhDkwHsPvqrq23JNQAug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="d6Mps/2q"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=d6Mps/2q
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 571B24081E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915503;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=d6Mps/2qLF1thKQVUOgImP838i8mt/6UFMricPqI7JW1JAVCLU+a7sB4pJzstutpr
 FvPo85STyrzZx2DQR/SUbADB98636jHqmKAAHepBTm3eStfcsASySILU8rWWp5lcJI
 K/bXzxamnmC4M390BfeaCXXFc3zMHUbAkbDTeF/it1XM1D24sSCPDvU2U5tfuSiSB+
 MdCwOG7ScEgnIgpHjNn1pap7lNPoeqDbJdxbuTUPn3Ezpn/AxzxJDFeexwOVbh1B5g
 SeLND5GnpdigUdWOOD3f/TYH/dBy3roHFORnpTxaMTY8rMXYLs2zCKnl+FpugZjJqd
 g8UvzKeduiOWQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:CwXWW+Tvajn0wduVVbx2Sj/kviGUaIk9LJKvVVhxBkehNAple4yqgibxOnlzd0LH3GjdeVPTT740+extd46QeYyQLE46ECIwuxsB4kusHBrF0xjcBPBIbX8KRft6L7m14zVVVB5NoxyYeIgpece0ZV21lF3yRaqUF2atOH2Q+jFLkHl+D9Yt5jDU2snF9sk1M4JiCEyOrE//gG9OL6//BykI1kSTsH8AM0mXnrKvnMTicXj5YzSyCJLQ6RnSq85iLqoz6uIfKiyb6AX4m/zXqTpz1Je7Xxk35eT/tW5DSXH8EA0bNEpct4aMFwpR9KRpdkSTZd+ZEC713ibbpd38bpYI/Pm1RdP8uLnD4wvXZe9WMPxuzrIiYqsFDP6OnwiuJUFPCfFajcRU+gVSkZWLig8EUajPmQz1RMUfcCzn01A5RQgxxn9VOVDu+NWKhpyM/wxI6fcmnOaBt9tIs57pXZQDhCBFnFZZ1Uw2eZt62ExGmxWacYGXIlFqCeutnpv2i9w++PrEQww/apt0WJ2EPgUr5tLDPRqOuFjl5ayDXVoqsZiMq6xS5vBn2ZijMZh2o8c6nCl8NTHHRerbJfw1duxqgt/tKV4=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 681B2A4C4894
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imi-000000000hB-3sPF
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:56 +0200
Message-ID: <20260920144428.3009612-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 35/66] package/lftp: Add support for OpenSSL
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
