Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25895CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E017880DC7;
	Tue,  6 Oct 2026 16:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twO0ZnPxmvA7; Tue,  6 Oct 2026 16:37:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E5B4980DC1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304666;
	b=b49Apy1jGi1wIZZ8xy20SsEzhDdTfMJmpV9lHh+BwJoasEXkugyfJ3Ls3ywsIExE8yGn
	 aymmntSUnU1yK3VC10nd4ZQl8zwvGgWm9K2qIazZh0U1vPYTqbZyT8ZW9LKp/JgG5plml
	 DttmqIDZXgOqoNc/XadAmbBEWKzFmWrsFbAKdoGv51Uxj2UhJVpsjxdn/lcwVl5K+NsRq
	 SqBHKBDxzpcI4YzJu69wI/uzG5IYlP5L1d4GWaG4ER/rs84M4tl8cWo4KE5QEmL3w4sEU
	 52CJADEbQHmblnoTNsAStjI9chDC/n3cQ2Gc4lfDuaiHtROJr6vkXgaXvgPLm2iryFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304666;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ctBzyrSI0iBUHRbrc3J/KU8J71rjEevASONGy6XcNLM=;
	b=stSuFMLdhaHQn8TP8bpHmTpeW0B7WX+TQdsqTR+DtN+nMLwtFD7dc7U2ue4WoDzqLnB5
	 O38dWr9s/TtSABBdzb4plbyZpd2Eb1MAUQhWxv1ZN3Kkh1L3WxGecBZ5UTRZZth8AF6l9
	 ShS5D/ljK7AY6aehYeQ4abHYdc5NEvYDzH5otaCRqQFA3QCeM9t4i5KfF5erTCnBTGLSW
	 GCt0EHt4m2ezTYDWQeuoYGXZFYiX03/l0RMX0HlnuA+mC4rqIfMiyk7Ji+YOGScsjbzqQ
	 lvId44wf5ZZ0YhCIwrcuM8muAuWhehAz84a9RKI8W3hhCTT0xKue8TZKYCMZqaulGcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304666;
	bh=ctBzyrSI0iBUHRbrc3J/KU8J71rjEevASONGy6XcNLM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SuU/IX/mpc/sU4wJih1StwO79OiiO52eYmwfAeTWlp/7DURmN56Y+8DvMji8tuPOL
	 doftzIt0cialyrS0Uf1qG6/Hx32jFJ6JXYvwr65O3oRMFot4ZIakLUq+DqmyElX9Ij
	 hZtDrfKXqUw7KViUuVoo+JEnQlHpT4sodBABTNGyk38b6dVJoXZHg15qU7eluYr6w/
	 JOGfcam7PEfbFR1/yHXViOC/Y1KPwvjf+9VB0g5uzd3oKzO058GMAYmhbOJ4GuIPZS
	 szPNGPx67F8DnerIvHDsZxaJmE+q03unB9CuDtlzaiwMvM97D+UwSwhg5bnk0KEoUz
	 r6V/2r1+h3qqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5B4980DC1;
	Tue,  6 Oct 2026 16:37:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 54D2734E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38CF360822
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4HUuZFq7SXK for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:33:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5002B607E5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304391;
 b=F/wVa+uEpj+IMdZx6MN7I0gMtYCbIfaWre8vTd0u9MYW6LKV1ofoN3p2rmOYcJ19dBTc
 e4+tRYodJJFGFtfVzQMPcj3i7jRWcOSLcaaQrv46kqqP+GprEp5FINgm5Jwc7qC+ndbga
 n+4/E/6rvrDy92c9/cgWloyzOp9x0LgqaVwr58v5aQlN93wn1tON79Qb7Bz/rhNzx6y4k
 WBqN7zxq58MJRQi92wjVkKAsmwYidd6kCQUPmKsWkhmWXBqbrD3uviSV3wUfOZaW9SmcO
 xE3bpUrZAf2/ceKTfRzeWEXJdFI+Wz2vVb2h0ffYUnx5H/2SxBJhUbWOibZ9QwqcElA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304391;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=85LscqRMOWr+/Jfu/opMjEQrtSj8aS2kWybDHp+8HFU=;
 b=pEfXVM0xWnMGDM/07xnOXsXqAHqrxhgggTmyIAg3BCT7xxHSk4MmQEZNS1IIPF6w/GAM
 WJi3gcUNLqwCBfpc8b34hBnq+KBqLglGoFcsERkirOPFpK0VdiZFO06VLZO5tY3p2BiXv
 wicas2c1/xiFk8ijgpos/oZRUl2YU5pPYx1/8vQ8K6RoN6IktYKj0/QMgYYSbJKyqDh38
 4ISuJ824k76OoJ9N50LcqR7CUfUIz+IK0g1fm+XiKWuSVXM71QIQ11ScfHlX/dqD2SUlw
 EoWX+ZSq9dSZFCyXjs01ZhqesR/2PTLfsYwTL+EgHcHv3S7Dpryjn+jeLbzM1Q/u1Jg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=aeNDeeDB; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=aeNDeeDB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5002B607E5
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303710;
 bh=85LscqRMOWr+/Jfu/opMjEQrtSj8aS2kWybDHp+8HFU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aeNDeeDBPBeoW3BmSs0I9klMjl+tcDkebfbWiIkIKt1Vg89/E65TiXALIQgUw2Tfa
 piwYe2DcHnOOMZ3Pu17d5e88JQbuGnpYVJPsWsvjlDnbdTfw6O9dsFrgKS67PHVtHO
 vV5cnZGcM1W5/MUVyOXoVJ/5lq+pulJIdIEv23l5GX4ec2rh6SCC59z8MdWWLxGqGl
 AYLf2PdpC6yUM92EZzYaOsCdlGtxrpg9RO0RsiBhbH5hDFjkzsGY2rN/45JqCnz0XP
 bmN2WbXjhm3n/gVMNWqaUrSzv4ly8guso7VzXKKVpHxiNG77qvdpZkcFBcZ85ROXve
 7dw6xAh1b8cdg==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 E3vLeqJo7mpAB/063MXx0Mj6+rjM4Lj54yiy+bdHx26yt/ObZr+AzO9Z/VqaNs9RyAiaUOmkHpz
 vyG7dsr54ZOhVHqL+lkwGoLLpkvm+63fCd6cpMDfW34A6qM5eRBWYZ0h+WiIFxuo+B0EGt7Oyw6
 pPaMM0FterPAZY37uDVPl7XKIeCy8hX4UP+RSN//F5I/ukNmSYeGQQl4TRrQEkOWO/fkRo0M1z0
 Ma0PmbBTm0L9bMC8sVFlfP9XVHAXqFTFKV+PYwJw8byWPvhkluAvNzjTUf+BQcdP+2+wKfoYSes
 Tho3KPIenQ/zfedWpCMSQu8CCjXYHcR+GQP7XX+A8hEmVuDOzOqNrAhvc4cMKt1/hm5dnKKxrA1
 18bPU7f05scB5ygEbZZqI5u2LdLIBGJpllvfTqfxm8Pmq0VS5eERueQtRmZYSsu1H2sn03IyyJr
 z8XkxMaOGUNbUfKsEZA2nPvIFf6cR7ik2qhGlfZVTzVDfoOsv6+0tRuPeBot3fYKqo12jC44lER
 TUu9a7jm3goCilkUcQAKcza2mx7Zz1vuSQryFyV7QCkc74kcLx96ytnr4aNVxMkpG65FinaejqM
 dTW+Ea+Z41T0w2kM6+zTKGgI9j4d4u1dx1mE8SemHd9FrmMOjtYFuUtp3SDneQ==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 10191A4C5513;
 Tue,  6 Oct 2026 18:21:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uk-000000000ir-17IH;
 Tue, 06 Oct 2026 16:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Oct 2026 18:20:15 +0200
Message-ID: <20261006162106.3439373-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 34/84] package/lftp: Add support for OpenSSL
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
