Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBFCC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4272D40E3C;
	Sun, 20 Sep 2026 17:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGIMRwxl6wnk; Sun, 20 Sep 2026 17:11:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 544CA40E0E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924318;
	b=BS1hlzM2FkNpbJoLWPqps2pszApAeWV6nr1YRgKma7t38prNIhq73zeL8/OvGu9za7GX
	 ogbqawPldFTebSgNjoiOvxAQyrrp6chHK+R4/mwxcqXEDxLLeD77a2UkAcB2X6WBeVOQ3
	 /L3NLZ+QqBHT8LXFREghttUxSJWo5uETEB0VqtZbs4WQIFMNjJTDc3DyjOWoimQ41fQdv
	 l6MnIxiatQOZTz1gRR/uA5ffgPEN3BRNw+qPerFhZTcaQ2iXTYrcTOFuKwhIn20r7EQBp
	 ykXeMRdfcAv8I/inMNeheaSuXNQq4cLELhu37W+pMIWlp2pLvsCDFyeNE5jfFxvlHfQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924318;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	b=L65gBHLLydyMWf8PNqPlTPxEqkIxNyfiJBwFFvh2nNIZIOpjc9w74D7bdYEYXJwgcstU
	 jF5THTQ9SjuyM+c/trjqhH+t44vTRMwauipw0GdBr8SzZAjKB7whY5A82U4KYV8ScVs3r
	 fCEaJGgcy6kbv/jyJ5T1xubzOUotp4sTh2gctcbJ69YUTVJQBiewofjqyTTNxB2g6Zw/R
	 qvUFDRclhdeFzSO+Q+srm5eYUzLqCMkpE+6lqm7UjGoG6UGUdmKUScxDSEs1AyXwtXgOV
	 HRU71oJmA0hiXYw3TIHzjn5n5NvSG0jVZIe1UndtAjuJFliSvJ5nC40yijbb4CV1miA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=O4ORJgNQ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924318;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R+Lil1q8jlGf997mANroXoWHrDid9Nr6rLrSSRWbp/M5Oeunc4UNmWSiG3Yyj5cGH
	 FVOEtQKk/ms/lHdHgRwUhgNtpKnWlj3TIWwGVNNhPCvHURq/wPHMh79nTnu3VObtI0
	 fD3qCrekojneqqaWnaeds1l+82pPgNyP8AoS3FLj2yGTtvd9BkqikIyQSB6xeQ2YWb
	 X983HLxqYC2ojoj0S9gouadetUIy2IoAwRI6QONucdKNkyh6OWeq1fRi9jK8cVnaUm
	 SAjlpooswDKeeKr5ZtJCh4xwWU1VDlSMu/Cq+gmK3V8k6NtMa6poEzdK9SvKbh7nuk
	 sr5O3rYaBVPRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544CA40E0E;
	Sun, 20 Sep 2026 17:11:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E23A83FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D409E40E0E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PxGPcbWOMa4N for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:11:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D6F1B40DE9
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924315;
 b=EakKB5+ttLE2/bq2uFOi5HgMcCwSMf+8zPi+u0GteSoiGGvBFzU3bgu0KfJEjo+hYzHT
 jLU0pDHHs1VlJtZw+vjhvgEnViUDatrRL8CCOGU2h+oqwJVwfnzcXHiTnKNxaRGcFlvqf
 j2b/9FnWdgT3iP2++O2l6U5ME6tsoNsqAfanGB9onCFQ1V5ENc1jGT4OTNeuVY/Y8cyaJ
 z5sfxnNIJWzQa75bWVtPMz/fOc+96w55Vfevfkft8FdZAQTIzWHnYVHLYGxxIAGm5T10C
 NASPEgsL/+2DwBsWsF1gZ9oxaSIi7ClxASRw9YPz+3keAieHE7YjhVKH/dsb6QuBj3A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924315;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 b=DXEC42BgGtbIXgBWuOVzVeMZslj1Rx/USJzNICKvJSJV3SXKEbHITVjCwnknAtNWZVy1
 TEC2Ex0xRe/4Z9k0f+TsbMpbxmT2WaT7Y568l8MeudDuX5qjcSzObx0CEwSL5fWao+yjZ
 UsJ0ZZoHLPa99oJeYumYkig68P4bZdn1T4CgDeS0c8JGO5JN72End4zcU4GkZnhsJVi5K
 Lx99sSDkrIIoMRM7fXb9Q8wAmFEZLAPe0t8UZG0CP+/UZg39IZlrFSEAECLQ/Z9vD9Vdb
 5j7QATcOKcEZ9y5IuviQOSgCWsv4jM0Hevso3PhwKoP5mCSmp01SCU2fmmSYqsT2NTg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=O4ORJgNQ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=O4ORJgNQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6F1B40DE9
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924146;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=O4ORJgNQIe//SHic1D6XsdQ0VZ/uM1lPuOhrliGKBbk9IDoo3MhAvGqi2NYJBTkaY
 nUf4+CyJkVtZ6XNxJWguQFNOuSuRJw/4Dao1ai2Wo3vYMxJZJ2u6/iSaXkaioDLtvT
 HgBr2FMiSiu5Tsy1cjCpzGlzch3Ms7mRkbixO2242mfGkR9CTY5pO+XjMqRmOMZInO
 8frWGPnk8jVpr0emh46cQfI4XGwbPKhMhAnKy8B5ODq7tMAWEtVctvPjaq/QU6wxrm
 MYaLgyZoXGNE1aN4SCSPYzaf/od10q0dxdeOZq4w2N+5giTPw0eTdVw5rDsPyQ5T0P
 yjOzB4P4z0vPA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:fwHdCzfskWDo7VnPsJuCR2R0mioeFObPxSZy6XmnL5y3g5L5fiCw2jupwSRP244rjmx6RV4+gD6udAdGPTBV8YE3dLLpwoQeRRggIePASzAHfN8qhmWD/WFjeh/IG9wxqFE7/xeKmeWUJqeyTSMS2HCyGpF0w8iOn7nFXnBSjTj/uO3A1tnVK8C62uO5enVn4ReJjyw9B4myb8yUrJP2RVzWrMXCTkVd/1IzKIjZWTWBaW1kXokro7b6qqQh+hEZYwZoZPge7P5cANFlW48W9Hao/s0JqfPKxykL21/A92pDqy0QxCIVDw125qqvWjZjJQSqKgx+vReZ8zoarOHOj4asSO+EJOAq20W37HyXrAny6SLi6jvCpHmqV121ujzHdSWCp7AJvJBnRu2/Dtwwzxn2U4iItnKDZzs1/WW4/3e34Bg0WAOZR54hzQYgC5nD0s9w9W7gD9+MAeA27RBm/NrMUb3dYXZewByNEKvcrSXkoNaZmj/4G0biqDnoMT+tjMmHjrQGxI0AJmpfK6Vzk42zNDa6BI7DhG9BWMFS3jOF6y4FA9k37A+mA0KvtWLObacorWel1fKqe9ccpZnZbf8preh9Rw+QvuTeKkUR4jzatZ
 HlnoJnbT/fG4MNkmiubKoa3Q7SVuKf7s41vgI7H/z+a5UaavEPzTmmmlwk0oDjzJh6ZEavG2E=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6ECC2A4C4874;
 Sun, 20 Sep 2026 19:09:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1h-000000000o7-0m8k;
 Sun, 20 Sep 2026 17:08:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:13 +0200
Message-ID: <20260920170815.240247-67-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 66/67] package/znc: Fix build with OpenSSL
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
