Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9293C982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC5FF60E25;
	Fri, 18 Sep 2026 18:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAEHNHL74mqc; Fri, 18 Sep 2026 18:49:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B9B7D60E34
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757393;
	b=mHSfetgCvc6ljNKbVZO0INu13FYFw1FdJS7L6+R0KOf+Dor1zYdzuKzOxb/sWyHQlm/x
	 +2eHrDWpQyINdKMK2PGeR8AmputN+Ub9xoDQ1/JPxot7H4fgpT+MP5O+pYFYvGY+tmTGU
	 GziS3v0zDItosncRWayrT5HonGagbiV8BVtx+BUq+DrSiI4lPf8+R9svR+L0f8t//dlP1
	 Ln2I3YWgF9sj+wKcTlM8wiUuYZPicy2apSf2oiN4WRRs6tTYOJwMpdWKePUC0QZ6DiCXW
	 RAMys+Y5eYAuYnHIdQxwNRqEpnJlM8WDe+eXm2PhBoW8u41cIzWrYxxSjwAeBI3GZWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757393;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	b=GJNToeYhfBiyrKQhizk5QqvRs+mspRLqAOs5xqI6UWFx7zob8UZJzEey+cDShWLkKvZw
	 978+ORRy9gniYe2QVPwstL56orlx8VEYUXcFlHhioyzCJYFucEpam5K2UpTkv69fFvVQZ
	 NW1BJVvSD9MCdTx90v0pw3hC/c8Q/uPZ7WsfVDXy7/5H5PhM6a4PG9lL9XzvkvoNgp/tH
	 DmiFP92VkjLVvKklcYyJSECd+nK/ZCNjIy1DWb0ths7x0/a1Md8ebCPkjOLFi3QfwkT4V
	 zu3Qw2mI5u8DyuMNZgVhUVYAsfgJb/MVdvYmzcpomYwzxOhKZ+hjGaPkrXFJGbU63KA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757393;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VKqetIMMvptT8hE2FNERN2oUA84l0S3deeJQgZyYXuSs4S6NSlIkFTeugOKfQBTGD
	 2gHO57TKNjL0J7RXqR8L1nq/AZBideVROMU8bYCflmaD0uCFaOse0F9okx4ibUu29o
	 1ka81I81BuNrvlQhXq9Hq4PB0EeTIqcpJji2PZ4fzu+xP12baazgbhMm4ydMw87iq6
	 dsux0Dtdnx6MSnPhgk+hps5q7QLatfTZMo7/5M5iSkhjm2tMmfmhNpKwOdg1eAyly0
	 varXtnzNdTo8Xjjn/v2yDvqo2ZYcQuqVHUjepaZ0+mz/wi4UrnWCE/yx2bOChkWoTp
	 gUkuXNpRYPZIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9B7D60E34;
	Fri, 18 Sep 2026 18:49:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21B6C237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13260812FD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GpqRqSnFGG69 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:49:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3241B812FC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757391;
 b=o8DoDbPf7LYAJ74RwKYa4vo87PVKIka2kh+grUAdoDi1w9GiDO3LS3oDdf3yM79Uc95o
 kfDGIg+g3muegGM2I3U42FJMT/VAz8uwtHyUZcY6S+87G+lBJmfsuq/N/b3VusnkaYGgm
 Rn0X/N9M3vm7DNEErlAwb3V4eeJzg0CJZmJ7PxK8fgEB7F08Dft8Y5y311BMbgAbj959d
 a1qbkyg5FSSU8l7Fb1Z0JyhM9MAmuG4UHakpamV/q/bB4ydpry6lIeU6QIkHA1zcNaMfj
 tp8uutjLV6mjmKODkC1RoJFPiu+suSuRTOk5hlW7qHA+XnWK7OYJckv6nkIKogMiUwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757391;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 b=EL0ufW+dlRorxf4wJskko94IuvCKaF+Xw4nqEfsy3lKw8de6JrNgApBugbX00hHumxcI
 NppuYh5fWEqDDIw1d1ZWb+nTJ0kDLo2+0MSQU+dmnvzFrRVV2o1VtstsdS1zh4EO37IjY
 I3KvscmT547exMG1MK1E+ssyOLUgpFhDQgvn3cOrOQKChPD920ZPxweXIwpeeSz1lHJnA
 ulFQq4Q/41JVn5p9C/w/qZKKNBwzqhCyefVSI9O+q4xgmr5kRUCXTi87AHGjGoJA6P9JT
 PX5FUIofgMjyVEkxWOLvLaFHIvHnchxJOKhoIcz7nkWVMJqaSu3s8LiPD2vQ7Pv9pkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZkscxWDy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZkscxWDy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3241B812FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756931;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZkscxWDyR1GE/76SlqZhEY4WPIIm1HEaZ56jz+PDKOTqp/x4DKTWAJVPmvSt5d8L1
 h+P7nkEbu+MFXJdd/9qeSOUbfIHG9XVCr5gbg5x0qrzRo8CQa9ChAOQtK76wZgxiTk
 QK4IhN0gwNS3sLZbMcJqi+zuDxSGt5lC80LEt4UmYAtaQOCAt6fyTdK23R5IzwZWUQ
 9kSKBeuYVCT02F4ZuzWakQNhZmwEnz3Pl2TxEvpdHPufOrG4YzMs0oGnD1L4FW/jNs
 0FzwlIt7hXbtv9kEQKDKmVQlYlTBashZHKzJz4p1J9seO4eu/hRqThlD1/GnGPJttf
 /BkdmfuOTRRmg==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:tgWsTdCcPLhRQ5cPdaTFZRZozOgdn6nrShgkNMjjhrsORU3Z2jjvPosNKe2l8JAT8+M5W6EudexFpOBW0tgL2fwTkGCmK1n/80seQDjSEybo8xsxO0HpSCZ2tRgKwXZrj4KoLSWRoZlBODFV3fkUQfhKoY40ecHNMN0JAEtm//CmMc24TFlqyjOhDOwYrq4eXIfIqDW59Fm6r+bWgbf3PcDcXkQ634n6tvzsk927DlVhU96htCUv0mc0u5x6ssBDNeJAkSAPdB5HlSvokf+g7TD11YXYbNybJwMwj2yWnKTbUL5aoG033ySQk0uHfeG+j9c/4eOfkBTGRZ1JZpW1dPea44hPldrUT3IbXFwbjiV+BbSjk1H+qvONOWTDHhg2Ob5sO7wwWfYLpQEf61gp4BTVg16yXUyEH5skRq5PI1bsCZ5iZZ/ys9A1TNGmXurjYGAB49PMn6+r1c42yr4VPK+dctoBQOgrhhybLir4GRRbGejGjeeRwATE46EZG9IIfTD42q07jJTqwMI0b+T+fmH6nKwEdrQLCJscyCZ3h3l9t6/olPDYm5kd86KmmzjliwmmEghRezXgPEK+biJVTBWOFfvJbWAqoGahwfkeaFd5ch
 RfONTg8l/KUKubgCO8sAL+DhipZ5YmJ3NhK9HEahyMxDeiX7ya3tZacZoEfLtb33a52D5iRsfn
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1745AA4C471F;
 Fri, 18 Sep 2026 20:42:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWs-000000007cB-31qb;
 Fri, 18 Sep 2026 18:41:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:45 +0200
Message-ID: <20260918184140.3631274-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 23/77] package/snort3: Fix build with OpenSSL
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
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch

diff --git a/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..9f4232901a
--- /dev/null
+++ b/package/snort3/0002-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
@@ -0,0 +1,63 @@
+From a32587b0fc22a716b70f242f7a130de003fb3b42 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 27 Aug 2026 11:45:48 +0000
+Subject: [PATCH] ssl: fix const qualifiers for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
+X509_get_issuer_name(), X509_NAME_get_entry(), and
+X509_NAME_ENTRY_get_data(). Update local variables to match.
+
+This is backward-compatible with older OpenSSL versions since
+assigning non-const to const is always valid.
+
+Fixes: https://github.com/snort3/snort3/issues/476
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Upstream: https://github.com/snort3/snort3/pull/477
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/protocols/ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/protocols/ssl.cc b/src/protocols/ssl.cc
+index 733d19adf..4afac05dd 100644
+--- a/src/protocols/ssl.cc
++++ b/src/protocols/ssl.cc
+@@ -860,8 +860,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+     while (len > 2 and !(common_name and org_unit))
+     {
+         X509* cert = nullptr;
+-        X509_NAME* cert_subject = nullptr;
+-        X509_NAME* cert_issuer = nullptr;
++        const X509_NAME* cert_subject = nullptr;
++        const X509_NAME* cert_issuer = nullptr;
+ 
+         int cert_len = ntoh3(data);
+         data += 3;
+@@ -918,8 +918,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_commonName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 int length = ASN1_STRING_length(asn1_str);
+                 
+@@ -941,8 +941,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertData* server_cert_data)
+             lastpos = X509_NAME_get_index_by_NID(cert_subject, NID_organizationalUnitName, lastpos);
+             if (lastpos != -1)
+             {
+-                X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
+-                ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e = X509_NAME_get_entry(cert_subject, lastpos);
++                const ASN1_STRING* asn1_str = X509_NAME_ENTRY_get_data(e);
+                 const unsigned char* str_data = ASN1_STRING_get0_data(asn1_str);
+                 org_unit_len = ASN1_STRING_length(asn1_str);
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
