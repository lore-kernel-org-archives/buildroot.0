Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A707EC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75EAC40B02;
	Sat, 19 Sep 2026 16:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fK9C_jJgppFC; Sat, 19 Sep 2026 16:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9A7FB40B96
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834123;
	b=kNiPe3GTuVxmseVuNDZ4aaud4YL3DP/9atU0ZycF41dzXXvHd6R03TX1yV2qSEYHcGsb
	 k8+LtR+jN+NfYgTxgGsdDX8bujAdC0I7uQdlN/GfpeyMKgHMNySktTvl5a2phxOcnnuFC
	 PacX5P8AGwMr/xkwybXbXsi5fCW32Jz5BCQed6/AgSz3ckRWpb5681ASG9CN4jwZo6sKX
	 iiqAwMv0rJQeIjDpkaYGWR7yoFp5NuFcRQrYJR3hSI7MIXEuwctYBYv6+U77aezn+cI5j
	 t4QrNRt4TA2OdP1Sqmrc3eAlpV/ifX2/iDdMPGpIyOpfMoyz+YWTvyj5LPN7MB+2Qog==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834123;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	b=n4rx3nVVM6i0lhfhdzMIEb+vvGJXr6rFEunh7lb2VAmRTzmLaR/+xxSOdk05I7JFHsKy
	 txUX/8tQbOIvQYkMNERHDRk03xj3sQ/wpEmTCJqZb1NKD0/fXQ5ZpXdzhvTxFjbrIjkQn
	 vaZfd6nB7sTcnDA+qYwzT83pxQJZm+Ga0gWXPtE3iOKZ+fLC8jqR0MJqYGEM8erOFxw1v
	 HhExeZ58VQzidU1KJluQ0/iB8Uy8F4a4MnRWSHJLdkFK0UrDPPOT0y+SaZ0y+BFROB98y
	 KZRoH50M9dud1mKWUn00rrCk0XDLYRsSQOWWe8o7mZonL9qMrGsUdsfT9RYWkSCPA+Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834123;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MeqTMZmGPEPq7duwcqAkr6wJWyNeeAiY6NM0Z4+25fvLxWV4wJA3Jfg0R2rPAYEky
	 SCKLqnc0lwgmWF8BhtJw1hombvrZx0orN5djRCa3dhZHeKGnWAi3E6G2TTTFRcPZ8Y
	 LOksFUWbny0D57/cW1icL+tUdQm0IsG97v+yxyy4UW+pLDKupnlMlINnJ6lk7zSAJf
	 B1cEeJJfhZk2Fhjf4Scn0sTKAs0JOe9aFGs4XE2q6wQm4w3i6By+oSU2nN7Y/mSwJA
	 1W6WRPY47uojC2j5z0hW5perrkBsVtew9G//ZPrMVLOpod3LgpCtf4wA7uyvPS3+0e
	 91iwL3g6CRb3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A7FB40B96;
	Sat, 19 Sep 2026 16:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB4A737A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD1C4606C4
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IvM02a4RSuYF for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:08:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F0FAC606D6
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834121;
 b=IFopA9JMugSNQxvl07SsY9bZ6tkLLRyx2rwLh05vuOIM5lBzueGEjUdYFbe+S4iZOull
 swjTGT3q3evePWFA1or7hhtrtd3qHCqChaakQptQRDeAKqPzw4lIeSFlqP1Wm+oiWikuu
 8N1EDlcx6ncAh1W1A95GhLsDGN3EihmFvj/cPbrL6oh7tsCR0E+GP+yoIpHLEVyXiHPQ0
 p9Rxb9VX+Q6ugfWbVw0M9pZBfV32o8e7a6igP2QtKTx85goX6s/02ibIYDdJ8yyO11qft
 NCcpWXM/hbgRazDg/KWYDnxTcjJiRhU8uffEmg2FEb29tMxs7bJNZglWQq5G3T1yRDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834121;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 b=LR8VWD1rd0dKnPQbjDvm41RLptS/Uk2XYnMaOGLpihLIvRASHtI+J8QcFs7wDvKOXJ5E
 SMUu940iJRKA8glh1zY2j5Ku4rAxYyDa981A0RSkzytyMQcgUvtt0GvGW3ghmrzZxSKVo
 soEE2RY/6E4AVeRLXDweGPyKi7B9EC3lwAQN8G0m+3PqdZOMyvDXUT8kBGnuyU1aH6c4q
 SSy15yKkajtJ7g3Cd6Wnc8wK7ck8W4WPdB0U5xCc+9B+hOvG5PYTvV691VlyKX2lx6RZx
 mMBsIYFi7qOCPHTr7GN9ZdoMdDZfMNbu9Qv36lUXuYySPW2XWTx5Y7QWT6cb1/yXnqQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Vwl6ywRw; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Vwl6ywRw
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0FAC606D6
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833551;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Vwl6ywRwol3oAR3ednIZxEvvRU0pfj9kWSDzavTrmfChEIk5nmfkBmLBOS0WrjzME
 iGhQcDs2BWfzuPknyM0tp5HodHUtiA3TUAxniU2JhAMz/FK/Eo76TAF2tEGu7dPOWQ
 a3fnBYxHq1BXeGQxrtmqLYVHD8PhecuFQxTcxy5saA55WrzrO5Jx30cm8ksPRBxw8M
 tJ4SNjFDb+fSoLIJfeMhQpEX/GPYa+6S+hPg6qniookF12H6GMnHCKG5IpoRdU9bNM
 hQuLclCOeL6MitBzEwca/TLWnYISXOg9zOb+Mz/RaCAa8oaOUU8yh8kvtAvfdo/c6T
 YX76yawB3kkGw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:X4q/pPewQsoT5Ot/QkBtRWPYxFT9IGpxGSj02ae8vIsISYAkZmjf4NEGf51UqYUvKbOPjzVicQFBb2x+7l4PcJy6OLNfUEFwKrgg2Pf5y/I1blwsBXN3rze9zotxLYyA+8NDhS9bbGvuncrgzfAqSRMpRr6VLaGyGqBQor/uVMHiGGbF6qVfAee8038FkqeHLGG+eXDY4kZ5gfycwMnZL0TozWqh5UTnjJTlzXQnk6VKIQ06KIPh8fdaaDbveKkrXXNFVvLiXSQvl3tNVudS1/RD7A3RBSJ8AkvOIxG/BrAH3+553xTlb1UUywosupbCcWheSxZl8tJFKYSFyVAyVy/s62bRixnVa9rIN89xK2+zfS0fJaeDt/NXn9HhmbNkCJUlXwkjNjbaZxFML1A36fLemDclwORsWaOWfe674S190uTpXfUd0ddNADMxplgZIH7Ny9lWdjyrf8k93dncjhtBupSQo88Z9zWd7jsBRkoRtUk9YBaG6yYI98PmRfmUPsp33ct4QrQn+ZYAeD61mRzvbYSqKHD2Vhaz0QFg//O80Kj+f4prdaO9+N3+Qc4KZk70Kvesszal+IGDSojVcYPvOwVggJ3EHIhLUBQJ1k+7Oc
 5ueRgg0ojExzZRxPxVmCD2dS2lzXwIStuvs1wXfUEVNF6Xn7/aKhrgXrjKMIozhbuMJSMy
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 423EDA4C47CE;
 Sat, 19 Sep 2026 17:59:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSq-000000005Jx-3FtW;
 Sat, 19 Sep 2026 15:58:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:09 +0200
Message-ID: <20260919155845.5776-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 44/77] package/lftp: Add support for OpenSSL
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
