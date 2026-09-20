Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A01EC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50B61605FD;
	Sun, 20 Sep 2026 14:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u35v_St1kwKg; Sun, 20 Sep 2026 14:09:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 724A060621
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913378;
	b=O2kIcyXAPj8q/IxZSZcjKwHuIS9NwzN8Kl4aDDxhjTsJLyKa94EwPjWVpgxIVo4upe4r
	 HpObnrfG0Ko39DDnKHy7xxpiOl+7h7LBl4wcA3YWWrCP958sA//i2WjCj7z1vZbTkApxQ
	 VOBeFq1bj3PvHV2v5arMe+vVmwaw42zJHZu+lP8+1v0+NLJ7Gv5J9GjDHb3zY4fA7CB/2
	 97j3D+wFUWH0zUl9u4xf+72y/CLf96eivIV1y04Y0bovJG30Bjj0jyuoE3mImxMDeVPCt
	 kf69YD1QXqoQfyuvmDS1pUkS/mLELgXa1Id+RVZyLS4/Mz+5YsRDeQkVYJYZtfPoT6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913378;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	b=CODhPAtM+0fQ+NA+FlWg6YMVT3oRTqT0wzHgqOSLFTVYd/weG7PILHELryutX3hXlu+k
	 5edV2LhPhCCniEmop0srxoFYn/nFbSxHd/wZ6ACAkvAz6WCjLL34+xpPooqrwKBYzSgkn
	 g8xw0m1Kx7m2oEflvJkV1DSU39Fowkc/J6DgkihVb1A1IB/qcOt0G0gEbDHZiEa2JBuZn
	 bHzh3MBvBloMVzbvLmA46NPFB2Gsj4jg79DbHlhBtr8Q0v2sVVeKmAqtGn8ItAbz6HcXM
	 ipsrUryi99gyzWllxZ/9fpC0nSI/sSZ1eVsgz518PrYvI6hugNjEun5367ta8O3v9jA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913378;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sziBjLNvbDZl/admD7noQBnrv+6nYeeQqyBGiyzCVthIKt/UEZzOMkbB9Qx6gobur
	 2rSVKDZLtRZkch0NDDtiRtdLy8Bplj71HpIGgbIvIvpujPYBIBpcThdCTfdbIiivsk
	 b3u/g6ynA5BDEkLyaBja/DAIQ+J8NcHq4qmUHpUWSDf+Zr3bUYJBnwP85b1Ae8q1g7
	 sJxMt3vvOkrINmQyyI5LqBHBgpajGkDGkSIa+AeLRcbUd/gEY0xJ6EtZ/xpgMUQfc7
	 Bvt1x4pqwtzRJpH6Q/Vyhx9gn7QAvlLNwbOAJDRRog2oV0+lYQRWQfeNz3GqfIR4UB
	 gLZILs/TiWW3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 724A060621;
	Sun, 20 Sep 2026 14:09:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 276483AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DEB940D7A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AXMEvIWxoZN for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:09:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 170CC40619
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913376;
 b=AbSe6mrW/ARspHMfkykYiYYyvzFetqKgFuoGxe32/lUmswejxEG4OrJe6MMo2yo3MMdu
 0GBV1HvJOJtkX722nbVoKwzhT3DMcwN6Arsvl3TR01pCI8JNOQb65gRQES82MFJ0N6CkR
 pW5FqvqlAUNBnncbcN8SAq0IHjXCyFeUteCSKzIjcgNrox5/ec9jo5ZL+bLuqTvrvZy2w
 i7abgJyRIIOneufW+dCp4aL9lD8DHhkdtfpRwotFPd2N1dC1txG+YLlxrLq8vPSQIiJBn
 xmlqnHSzxejo7ing36Fty9TGddPNyA4VMKc0iVspTY0mXYNlwMMu3GgMdqkHjMxlMiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913376;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 b=BWxZWh4HDagm1dEFezJ8MNq4Sb1M1DQpe7HDtttaKjJBppE+v+3OTH4uAF6o5j/gOt4O
 L48wOdQ8bv6Pj5m8/7owsMK5rmIkQvwO/uMj/a6UxvUhWYxhWhhePN1BWKiUQXSn3IWkd
 I4VUHzogGu8EkX8MnafQ+mGenGi2zGsCZTK1LZVxk/mDpWba9uNR525gImk2ngrmj3uKx
 mjMWg8p4RxbBpVg2pj1E7PdPVnaP8yE7ahmLJTa4vX0GuEkYWx8udKzyIxtABcDMHvwZR
 es9FwB4sEHsdO1+CQHNrpLJg6aJeESpBIwVRdX6oBDJMHM/qHEDqFJuwx6C3kGtB+NA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OqJm+kDi; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OqJm+kDi
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 170CC40619
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913225;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OqJm+kDiZDFNphjmc+zoEh0kdUGGPWm6eHUFiA0wZYvV7jTS+FLSAMhkyLAJCbxf2
 q4YHu1IgQ4T8wW3zsxxbZR2ujwuHhumRWtSVQOqrSHuvurZ5yTCvIXvV/aYWUtUQoe
 ZbU92+8TAurVgMQ19TN0Y2zpYnt8HVhcznEarXF4nyyflA+++lhquX7ehvZ0ZcyZMO
 gb8PYJdLVln1V8T33c6mS4xZazsGm1puspUZxDmNvH1mn6CSNi//7JG2ye9Np0yjop
 K7r99O/6IIl4pRIBT3Vmi9KchZ01ngdQES6d3mR6x94ramtjQcvrDhl876TIFR+KYp
 kgJsAnc03uAeg==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:EaFtZ2flNwJyGllyk3OkELfkiq7CtSo6kn1ZNRPtYy71OZgUq/wYmQd4/oYfBkGJ0NmtQgilWD3FdNMTZHXD0UGGwwzOOruIMlyKKQuNMzDLXHJLuyUiCxVdzJ3+asIoo158tWsr+xK8lS6hY5I2FBi71EIoZNAHctwx95x132B7aQpqPpJzbpuJqK34E4rRhm8jFN7fOjB3BmCgNxnpZAsOkCrZndVHUX/riuIBXXqRDUjN92GEw6uikmcMBdfBh8+AWsSWkkb3MjESfxrPTTd4iYKbzx/EaW220yJi5byNd9jDHhIGPcgjd0x9GDXR9O83Zxi3lGa8ftWKE6QkwR6m//5m/FraXo6jNC1VRD2kerVAkPTk9I2bkuVUXa+4hd9bpX6ZgmGZEUPdvAfTbQ/MbkucbF4ToWkAuRohb8AsIBejJtHMQnSaDqouzNIJtdKcjit+DQPNBJmROJh6VKjdbD4JY6f1JWHgKODHG0ogz4DPYlT8vtxp0Kw1R3iBopAAz8ED9MyH1V07Kry2GNub3YyDUXY3BCfxPbwaDyPWbdmrQG6308lFcYqcNwC5WuKEvAJeY98PhmOv4DL8sgwKPT7dWZn06U+YRTD2q1D8QN
 JT46Uhh4Wpl//syQXt60wV3VVsNSdiOVD08clIFBwfM//oonuikL5KwO9t/4eFJt8KgmH4bu0H
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CEE8DA4C485B;
 Sun, 20 Sep 2026 16:07:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBP-000000002J9-1rxB;
 Sun, 20 Sep 2026 14:06:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:06:03 +0200
Message-ID: <20260920140605.3005461-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 65/66] package/znc: Fix build with OpenSSL
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
 ...-Fix-build-error-with-OpenSSL-4-2024.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch

diff --git a/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch b/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
new file mode 100644
index 0000000000..1dc7eb28fb
--- /dev/null
+++ b/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
@@ -0,0 +1,57 @@
+From 94bcf919e1163564e637df8d437585bc7b55e7aa Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <rks1986@gmail.com>
+Date: Mon, 29 Jun 2026 20:03:27 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4 (#2024)
+
+More details here https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138356
+
+Upstream: https://github.com/znc/znc/commit/94bcf919e1163564e637df8d437585bc7b55e7aa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/SSLVerifyHost.cpp | 4 ++--
+ src/Utils.cpp         | 5 ++++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/SSLVerifyHost.cpp b/src/SSLVerifyHost.cpp
+index ccc20898..99b215bc 100644
+--- a/src/SSLVerifyHost.cpp
++++ b/src/SSLVerifyHost.cpp
+@@ -306,8 +306,8 @@ typedef enum {
+ static HostnameValidationResult matches_common_name(const char* hostname,
+                                                     const X509* server_cert) {
+     int common_name_loc = -1;
+-    X509_NAME_ENTRY* common_name_entry = nullptr;
+-    ASN1_STRING* common_name_asn1 = nullptr;
++    const X509_NAME_ENTRY* common_name_entry = nullptr;
++    const ASN1_STRING* common_name_asn1 = nullptr;
+     CONST_ASN1_STRING_DATA char* common_name_str = nullptr;
+ 
+     // Find the position of the CN field in the Subject field of the certificate
+diff --git a/src/Utils.cpp b/src/Utils.cpp
+index ed2c9c83..744f61d1 100644
+--- a/src/Utils.cpp
++++ b/src/Utils.cpp
+@@ -129,7 +129,8 @@ void CUtils::GenerateCert(FILE* pOut) {
+     sEmailAddr += "@";
+     sEmailAddr += sHostName;
+ 
+-    X509_NAME* pName = X509_get_subject_name(pCert.get());
++    X509_NAME* pName = X509_NAME_new();
++    if (!pName) return;
+     X509_NAME_add_entry_by_txt(pName, "OU", MBSTRING_ASC,
+                                (unsigned char*)pLogName, -1, -1, 0);
+     X509_NAME_add_entry_by_txt(pName, "CN", MBSTRING_ASC,
+@@ -137,7 +138,9 @@ void CUtils::GenerateCert(FILE* pOut) {
+     X509_NAME_add_entry_by_txt(pName, "emailAddress", MBSTRING_ASC,
+                                (unsigned char*)sEmailAddr.c_str(), -1, -1, 0);
+ 
++    X509_set_subject_name(pCert.get(), pName);
+     X509_set_issuer_name(pCert.get(), pName);
++    X509_NAME_free(pName);
+ 
+     if (!X509_sign(pCert.get(), pKey.get(), EVP_sha256())) return;
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
