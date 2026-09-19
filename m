Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0E8C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D83405A2;
	Sat, 19 Sep 2026 16:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jzq6UG5P10By; Sat, 19 Sep 2026 16:03:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0C232405B9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833831;
	b=YWdZobbfrerPL+L8u0wfeLjqtPNs0HrPJBBFBkFhSrFNILs1KtlpI71I+tfjLd3d0KbA
	 2VaelBKu3utCVgj4jHfdb02TQ6M73MTERXf/5aMotyZtkvJMyzbGAvRTKzMOEdNog09WB
	 MfRckBYN3aElN7r5O9Ddx28l7rJRpHk83RSUl5VQL8u5qUA5jas6rAszd9DVl4V8I5cmX
	 zzB3K7lT4ATNXqrFP/PBspD+/p0PxDEK54itjAQ17aGuNGPHlD4lkU2PRUPXI9IlJC360
	 PGBu6X3s18OIO+rxbzONyNAsF7EIMLju8x3Mqv6UewrKBAk2MJuN886a3XKzzwN1PzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833831;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	b=TJq4lqWZ396KEHpvHyNAIaZWVgFJB4ZKJPALQLAeRAT1/ccmRugaivXfY0DCnmw3+9sk
	 u3BSg1qDLbiTaxI5j5YSN+1igO0zbFFO/zfEUjfUaf+DRV34pcW4jJizNrM7ZE+xZ7RiC
	 sSyGayNoI04mEaM7/o9mCCHR7+WNVL+RctLAc+FxfA6WBPKVvj6oEXIwKW8sJCkRMV33p
	 XAzz6w5tryeT8LNw1qjIBDWcIf7TrCE0lLoRLhTfu2Ecn8kL+bnXE5RFZyzjGNmokFdYc
	 3Hfm4DzjyFZl1tQGxM1IbDaYI0abCy/jYYlfNwMOaGJbvdiQvdTk8deng0Qlp/6Ac3g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833831;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BMFBJBpzGbEOwBsfZwIVtWeVjc7vav+Ql7gtMWODoGuuXss8T7CSOqWnGSpiTvvib
	 dIkGi1yogGHiHLFBTwdc0CubI6vkHsRZ/rShXJUf5m5Pjutztly6MGpX8rxy2b+GVn
	 uSZTTIbJJrrfm/H+ZALfMVJr7Q2H3bnARYECn2RJIyx4EBynaq96XyKCr6qNm0MqTq
	 NJ2qH8u5OsrI1XeiWu04I88YT10vUmL1V9Clz28HeH2KSiqhr/Lvi3dWmIYgz+wkVz
	 FswCQXEl+PPx+XSgJQlylE3JrmLV4UNg/k8/tE8IucwFxxSEbfXjPMNvgO36iPcvhH
	 CECAil1MyHKxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C232405B9;
	Sat, 19 Sep 2026 16:03:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F10FB37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E32066069E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8d-9FpM6F5PY for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:03:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BFC6A6066E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833829;
 b=jd2AMdT3M0mZpswrkkAZFMQ91oH7lu1LoJxaZV99PpWHCIAWT+KCZEtzFj4X1O8U4/7F
 j2AKJj+pt7EI7rsSEIzO7/vyuYEfQItn4fBTATdC7zj4JDPjDIV66s7++myw3PrO8Tg1R
 LR7+5Qa09YCuAAHj0/KeFO8ov1KAw0iOSz9JpEhtZX+UkGKi8b8Q2AmfvK5UHSy1BrTM5
 7j1eAt3kmXXSUXnD10A7xBopWwf0cme/ZlrTJqELmVlGrCn+QxcdEtcPZvcAxWZmJSw7H
 zpi43V85udEpbvp2aoVVZ18Azrx6UIhhBpIbRpjZlByZDtiv8zGBFsBG30e94DWs2xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833829;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 b=OfNkoUVY6BSWqFssVW1iBR9jx892p6+UAa6DTqTfMsBl+1ou77kHXhqI3Tkq4V16v51V
 rCFFiuuzGfgkd/xXxJiGNTffqsfC+TE11e3+JCbZSsP77//j1xKmqHT796Ach4TkqadlY
 U8Nhpt/dnZcI0tCgnkg7UTpXnWjZtD8wR4a3JMn1YTq8QGSn0Y1DC6dOXlVDOwWTtysvE
 d+jOAknpP2UKdL+GbEEi2ALRnZDJnBGVTFPSnGrG6eoLHo1kQ0+6MUyOVvshvkwq1tI4a
 TARgDMmm/grnqkZ695U/Wo/62YBVqhulgOx+1PuFtnYSOriGGQqEpqGDlb5aT4exusw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Yx7Lxx7N; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Yx7Lxx7N
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFC6A6066E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833544;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Yx7Lxx7N3jmnDM0PD4Q7VDw/ZGRndVg6K2cukRGM/dSTzVPbtQZhViaCpvNEL2Hzm
 VTAZ8sFEH3rXIR0LhfDnU9uCXoRjwf+ZyqB7E25flvroVxcGiM23ib5ow7jUwzses1
 Hdu6IEmGxp3lBPcreMGishYQpwVrfEBrpQ71PydYTumom8FOohP8e6awRGgLDIr2RJ
 mRMqNt9U6CvwGH4A8aek3HO2++mhA+25g5a0OFHYzC14lUTUMNnrcTplMf18rgIC5M
 cuUASesBBTcp4HnKUtCStislbGOxZPrkOct6pnBJYboSPC18M5iQUllCQHuzk/jkif
 bkw4cm8tpq6kA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:0AwsUi30gxGg6vb61d3PXiUCjMuYW9Sjz2B/1F8GHiAfrfYaGFLyLoD0tXzw4TrrzamxiOHkjO5xQx+R26clSyfTk6TXGrTVtP11XVKTa+TqfhW9SJxjqJR2lDRqU6PeUXgCCt6lIIB/J/gDNJHCKdyy9oaHb4N2m5vevRo88rznULEx8kXcc6MWFUQfDyjh4d32bSwxlVWZ2FdE3+yn0Wx3bfDmcMUJ894cnI2I7OS/2ueyvIDk+MGNM/furaNU2XxP0VPLljRsrwuqQy6sdlQFB7oHjtQB1nWExxFE4C0mjZpL6qrHPhkTW/qm5RFyptJN4rjdypfsmMGtwZBhlSva7shG8AVrCMySVBrfcMp9pbECknbvwdpJ4FDrbErTCEmNDOTxW2RIuinedNFlUB9tl91kh+CbzydF13HC1PuVjflSROvEagKEdEqdVQ2J46glJKlmKVAnYzaSOXB/hvi2cdR9nIuAQyg9Nkh4DeZmz3yg8hTYI/PvSnfbyIYnfZjyd1omRi8/67rplOS6jQy20Lqka3uy8q1r0GynTNtmGwczVtbV3H+uSjl98GkY7c5A1TBdaCYV+UIB9FER6I7dWiAsMMqFwR9jA4rqVpifdZ
 MTFGtHnNS6MVdbBuPzPk2Z/ByunsF9nRTqyDSzGUJkLHQoYcdEg052xu7WqSoqo0THg+QS
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83CB0A4C47B9;
 Sat, 19 Sep 2026 17:59:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSx-000000005Jx-1lcz;
 Sat, 19 Sep 2026 15:59:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:41 +0200
Message-ID: <20260919155845.5776-77-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v2 76/77] package/znc: Fix build with OpenSSL
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
