Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B69CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4941560865;
	Tue, 29 Sep 2026 18:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEpQVvbVYl7z; Tue, 29 Sep 2026 18:46:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8080460851
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707579;
	b=I3XXR54yTWgPurSriqu0MTMQssfsL7fw0Xfl01csr7XnOzkdnYfHpgZT1z+OYQAmn9LK
	 dZldsh2Vnw51JFf61D7a6vTQDMwz5oFrgeQoGnpo600ulTm3z7MnSzFHpR+Gu1rbpNSl3
	 xmku2J6lumfm6z9QOiZ+EErHsM1J9/60ohSSZB2Ky1BLwYZImYPgBlzizaCFYomYIJXzc
	 YstFGAhJeZClb1FgDr66BvpC0zXqAXPV8R5FD2KLK+qo6wML5ahdYB70FpnBvFRyTQETn
	 BMoTTkPJGxM9Y/uFw0+kqYP3ZcMhfoqjB8wi8ULSqoyIgKuiYNt485GE/Oj8HvxRvaA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707579;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ctBzyrSI0iBUHRbrc3J/KU8J71rjEevASONGy6XcNLM=;
	b=gPoORzk/HRvGu3Eofr7WiL9JJYmxmGv1rRRS2H3aWjRkS782RiqpzkZmNyWohMr236IM
	 WXDzG6vWDDg/I+s7nytFJxCAA4Sky5Pitb165DeIVuXM9xd8BXi0TWwOyaOvDxhBaGPgp
	 e+MHRmKql6uubPDMvuJHqkq1Devt2nJYuwDTkkGg9MGFYI4bGE5QxiACeFnVAYfVOW6Ds
	 RyA1xNWA2QxZSIDd4885J6MTU9CDZ5x9wuimP9CKzKQ2Dj8ZTKFKrtsFKZnV6knxmmuu+
	 xTdLy65Em0tc7+UC/X+oEttQznNrIPH7iEkn+EZJw9AL/DQL2PfD/shixFF0AP+AHEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707579;
	bh=ctBzyrSI0iBUHRbrc3J/KU8J71rjEevASONGy6XcNLM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VckP0DjJ8aF6b3kC0BK+HnAbBQErFrbskGPRLqCNEcro1Xx3CnIYUjq9a5PvxAAz+
	 S05uSC79dUNnebPN7O2Qq6Sim6n89+klnQuz4f8Kq+ei68St5H2w6mMq8oEeds3Yig
	 neyu1CGPdwZXF6JDvJbx4uovGQzeByavzk+9FEzlQ5lTvEfxrZZ70VPiAP+E8Te0yB
	 86+ahMi6U2a9OK6l3XVIJV4Anuqrikusjt6ax0G/Kvcmmqyp5yDFK7IJVAJwy/58fN
	 Qzdzp+4ZTWYdBArzPQ+qUchAHBpUwuatj/h1CRapqKQ5UHzzH2rD8Ek1TN/2eRG7Td
	 uW4gyf/N6M0hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8080460851;
	Tue, 29 Sep 2026 18:46:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A4D53D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 507134032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqBjuFIit0av for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:46:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6A768400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707577;
 b=ruNwkrcBGaQvC06ZB2dLfA3Z4xF9bVApHL+2s2BQ7KGNvHKpjU/UAu44AzEyfFSZWBXW
 xFORR63Kl5l1M/6M09qxFGM8t15u5rt0pbDe6jTAh1GAG+Q/Br959iXmaKbA9Qrr2ZNYX
 wHO6Z3F+R2KRGC9E0bq7woho2z/u7jwy+OMruvfMzqtcLaw+VnN1ADK2u2mF3xUbVCMLh
 kjqpF3ZLilZyu0XN6LOKt3T0R81sjb75QCxWWp5A2fKOdWlSUgOuTFdL5bo45yG8bBwSt
 eSDhRet8PNXvlJ8h8xYPrIwsKgXqLXRZDBR7f9Hgem2ch9St0vCrGyaKuygoFlaEbVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707577;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=85LscqRMOWr+/Jfu/opMjEQrtSj8aS2kWybDHp+8HFU=;
 b=qLn7dINUuJx4D3lzaGNIDmmC7DzuHrlZZfFkn8k8GezlTzEeUwhiXi1P7Ib98P3HTaFo
 ZTTyE7apJUcgNv1eQklBXA8rjXA8VgxQDsLtMKqBHLTiBY8lKtJ80v5n6NFxm+hbCpwna
 OsVlTJUYH4L0pZ7zJFAG1XiiY3LBBMNnz/evH7aGHEOxBsil5QY88BXcEdubnMbXJcspS
 pe3vnDVzKV2cJaW+brVRVmwTsr+yUsqpHYvYtddlYtAgNfoOE7eeVVecP9LxP+t5BF6JV
 yjqKOME+BoQgRuX32b9HdxxdCjyRiDNXBxVEUecf9SbOzms//KbR4EosrHjuQBpX1Yw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=emobCKwv; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=emobCKwv
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A768400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707030;
 bh=85LscqRMOWr+/Jfu/opMjEQrtSj8aS2kWybDHp+8HFU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=emobCKwvxaEluXul4Y+PgPmeYfPESA0xp06xro+rx0Qn2OUm7IdK4rNJ8obGWCt0G
 flLpchgU+tkN2gYb+9WsTm5iJBUTSmFjOsfpxmWz43IY4ihL2/KTuaQE/Pqgkejw8k
 284iDNDCbaRn8v+rnY0vmuLKuofqftmkRx0vBSaAoWgtjklh+tgGu/t8wBRKfy37dG
 HDvohhhFipNtdxrICF+aPgu1z1Zl5AK7iDNVim3WIbROrUo01FnMz37TKPTfO5Ecrj
 XaVqvoTijcdXTRuFafhBMUA8NZnFdfbPb6LM+uyWgU3oW2yglcbUdFauCqzja6c7Cl
 fs1Tgj1283zWg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 4lAZFEzVk+XWsfLF4IFMCq6bTTllxKx6qPl/syXzTDBmaUySC8//gDNxnl/J8sDzvd07H5j1RZP
 5V9aJhIZF2dYG0e9DUgrKYUZNMvqzOzUQkMmR/+iB2AQCaC3kfHj1B0qYfgdL5awxyKBejYn8dR
 WIOeknpyL1nVjvG7qwy69s+gl5XHxFosocwoCVPdsb/sFYpcxDxABQD0jZo2nM15pTC5tVMHbPy
 Og4ZWFzqAl2A4VsdTGi+Hqqcwxc3zjTmFKJRWgbcoNNGBr1CLWcuRhzLe1Tapz3Odem3jd8JW/T
 A8SKRihxPb6ZHcDRhgm7N/bN6lwdxGEUZmvBogilYExnsItqv1NXmCz15DqbDAHXupE3bAf1WWZ
 5TzAxsutWErjo9DMPn7EwMA56xeXr6i7xPgULidLiy//xmi7OqPMvj4z5CdAbIEjvgZ1p1/0s7i
 uv0SnugvFQOWBFDwtDvo7HwJRWt3jrAb5DhtleKi1zU69HvRhb8vqM/vZn9lqnnQOoHS90fOP7J
 AjYzdp5FBridm4PZ4NBTQn/Cv1VyRXiu9Pwt5jsT5zL9VacCoCf6wOkux5YO6Ci6x2lfgzzg644
 iB1AplB8VVMtZ45RAna6YFC4WHJU/+4OhtwuOd1z4wNwyAoC2o4+XA8DWrXZcQ==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4C0BFA4C51E6;
 Tue, 29 Sep 2026 20:37:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-3HSO;
 Tue, 29 Sep 2026 18:36:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Sep 2026 20:35:39 +0200
Message-ID: <20260929183607.1849293-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 40/66] package/lftp: Add support for OpenSSL
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
