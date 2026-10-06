Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB905CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 968366083A;
	Tue,  6 Oct 2026 16:37:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoxbEQEF_W1x; Tue,  6 Oct 2026 16:37:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A41E0607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304664;
	b=VidyHVirXH1k9z6lCNCwJFZKMQv7csNeW4SP/nM/vumnlKF9TnyJvKPaXuAXm7ABkl2T
	 VaRqUp0aPDbQAj90eu+f3dh9RhmR0h2j/cqcy5CFnwCEX12I/4Bc/d9n/lxvjjnOVLKFa
	 6w4M/K9c06rl7HsAsJqT932Am4WqWe70cS44G4x+4pAZWd0RVez+nPf+pmLA4t3FpWlIN
	 aevwvqXu53TUG9Za0xJSaWkRtxOI+CHvY12RTbeURJbOHUCP+KAhkFL/+G9bjiUsPT7+C
	 Pg6KMKyZ3lIqQGKBqu7JJNidkAgakE5aRSB1U7Xa4x5ktScNcPKiJKWjw2UcMh7gPIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304664;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	b=Kf+Ag55LhPaX7MiguXXkRxl2ctMBatKIdjoEiTcgVmxZISgCm+CggObvw7Sj7tMS+Aar
	 4AulOpvbwktHrrau7pOKZ5nwydmfwUV5cRKq6IJ7xQHqQ8wZugp141bKzo6PGkK9yhY/e
	 s3kXzgi33OG5N51Msbp7BtVDR5UERe1XWoB3jBsO91KfdDpkLbjtK329u/8kn2GR8aYkc
	 OMmw1TAXPOrnKIchsVaFCYLsg0LEug2H7Gr3fbfc8QHX0tQu7BFvFrN3H0V/W6rjuxOdJ
	 ni98ZEU+VAkcaamBoQV+Ii/OeAS8cTPrkUqp9zHB64xXn5QhrpSxcYojCSjK1L9uTlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304664;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ealv8KoXuo4gPeFZxIAn5xOUgez3cV1jXx6D5vB3eKqBurKEKJSAr8UiJSTKCJvxh
	 HrhWqaA5x3P4QyYMS+l33HXS1klXKwnikebe4DUqWdu4eFSfeHiPLDP2z4iHpWFHg8
	 XujFsqPeijRVb8YXXeyDSlBJcgdLxzs6KlbdJQSVoLOkuhF7vd10uO+pODCL+ViF4d
	 PeP3h5ast2YfV5RsOm4WOzoIOTBC5OugGbHukGfeGCYeX4Rt9GeCppS8u1Kp/ZFEKu
	 VXnDQE2OwZDh5w6MBNP+KAGMcVXin6JMhOG/ooNrQRKehgQ7nl73wPv3Zf3OF+FcOK
	 JHr4dofm2Lfow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A41E0607FF;
	Tue,  6 Oct 2026 16:37:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E339B317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9B5C80D96
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQEfPrO9bbDP for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:32:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EA63A808C8
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304379;
 b=shFDhv0QH3bUpSmBgFfHr8rdZeBTzFcsTHPGqjg59rFjxuABWX03rwE1nCsWDdCA/J3U
 MrV9yeYk+MM+J03WodPeDz3/DxQo4ZrnL46QKVPkJP6BwadfrV7piDoBcrGEe6LeHp8be
 DJ6etRnez2F1hos81xdFkYAy8uG3nvcesKPYUeHrD7e34wrBCxQ+U6GUP5kehGrtIEOB5
 3YRrayTxlB4eVNg/t1c5od/xcB2WAlJfWvUk3AAOejzCCEzWpoZtUKkS9qiiZm/NgymjO
 Dh92fcBRfm/+JSrzCfyHNwnQEvO4FzoOfMhv9RhybvXlC2OIzh56a/c2Z5BR80MHHNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304379;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 b=TtQmwfmo9Q/NXS/Q2O5uGkcNmorBPclHMM4H7YDJe1kxKyak484Od56s4JnR/lPK+1o8
 wXK1mJ6BCqdCQ1I+jTkCQ/HZaDSkrRh/7lV3KG5OxWWWaYOxhHLzR1u+kNQiEcB4Ni1BW
 DSD0Zs/54lfailxBXNEB4KALXUIzOcPyjFuADzney6BW9jfEaM8NfMHKeAYrsgccJ7KkL
 oPjrDUL1UAD92EGWCTY8zGei+Scf+ref7KO9bfn+7SgmsYhB/NQov+Yod4GoDPII0T6OI
 oMLP/iFXd6bfHSm/fG7sjrMjtSWJIAjPHP/mEJLqOXHW3BlcnLpATDiHGxic1P2pu9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=boNfzPue; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=boNfzPue
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA63A808C8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303709;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=boNfzPueGku+0nyUdxSNjzsABR+kZIThYiC+mHDUlwhSyBR07d/XvRzZCjmntFV3J
 kfCxV8SeOzXg6E6ig4hPEQ8d8f8L6cJiQi/JXw3g125MJfGwjnkQM7vvSWOkgfAwnF
 mX4SfcRc6j9UcdsJlohHiK00Q600p6hC0z7PaKUjq9Y566aewZitG/BSHuKtNOQvyC
 5JZWIG8lOnqDOXRbQLfNt9Y3BXR4rOsN67eeP0qKk5+Ln9pZ2k80LlGtre8ymX/nUz
 AloEGrEzYG7wqgV1rJvNxNgxLChhBnTe/xAJpOqpjztaJeacDRr4gpviSQtnkdiOkA
 FaL5U4CNFho5w==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 FkjjPZVLwPm/7rnyRb5jY93rBsbDNnX0MRgRlfolaDc0GndCqURtmZ+FP3d1GLRsTL0ju/8B1b9
 sLaBPrj+OhaBgEXk3+kZgDF/MXEmz0TLr59VN6zWAmkJXnBb8/7ZbSwuRTc/HKlyN1Sjmg2bfnj
 SJPhZq0IBb+Vmn+zwjikQbpav+7zP5VDTVw9ZMO62c3/KPYeJwAZSzUAd+M/7/MNmSdsDMSBmh1
 qakIFimkh/9TnfHUl8S4AeXaw1+F5iIaMN0bvgLhHZJbqjeIAeE99IJbJ/ORgts8hjDlljf/D9i
 b3oWJh8x0x9HwC7aLF3t2QlefqzCHPFTMnE+kVEktfd15F+13rKOMKgPKGqLIyEArWAmC2MQcXO
 0AwEKNMp2krSpSBlgPTB7Y/QY1KuGzeKHoiMs24+4YhpOwXGx0br7nlfcOpnhtQYls4jQ+MCoTz
 KmrYZ7185aPrLG7+6e+Pmgi6OcksZHgM2vawVNLRmFIAgKLF52Gkp4XZhvtN60b2FNDrUesfr6S
 npr+jGYNbqMPGG0r0DwV0qNJhKHVayX7yyxYdiCUOK5PBk+283vKkq41Q4AerW+PKhYBhApArH9
 IG3hWcU=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DAC52A4C5510
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uk-000000000ir-0k9k
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:14 +0200
Message-ID: <20261006162106.3439373-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 33/84] package/ibrdtnd: Fix build with
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ateManager.cpp-fix-build-with-OpenSS.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch

diff --git a/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
new file mode 100644
index 0000000000..4755409747
--- /dev/null
+++ b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
@@ -0,0 +1,41 @@
+From 7dce31ed85b2e2299e63e7704ae2ffa7ce08d1c5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 1 Sep 2026 22:44:06 +0200
+Subject: [PATCH] SecurityCertificateManager.cpp: fix build with OpenSSL 4.0.0
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/ibrdtn/ibrdtn/pull/287
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/security/SecurityCertificateManager.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/security/SecurityCertificateManager.cpp b/src/security/SecurityCertificateManager.cpp
+index f2bbb017..0093d418 100644
+--- a/src/security/SecurityCertificateManager.cpp
++++ b/src/security/SecurityCertificateManager.cpp
+@@ -146,8 +146,8 @@ namespace dtn
+ 				throw SecurityCertificateException("certificate or common-name is empty");
+ 			}
+ 
+-			X509_NAME *cert_name;
+-			X509_NAME_ENTRY *name_entry;
++			const X509_NAME *cert_name;
++			const X509_NAME_ENTRY *name_entry;
+ 			ASN1_STRING *eid_string;
+ 			int lastpos = -1;
+ 			unsigned char *utf8_eid;
+@@ -188,7 +188,7 @@ namespace dtn
+ 				}
+ 
+ 				/* retrieve the string */
+-				ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
++				const ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
+ 				if(!asn1){
+ 					IBRCOMMON_LOGGER_TAG(SecurityCertificateManager::TAG, error) << "X509_NAME_ENTRY_get_data returned NULL unexpectedly." << IBRCOMMON_LOGGER_ENDL;
+ 					continue;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
