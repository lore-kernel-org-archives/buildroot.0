Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634F2C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285B04081E;
	Sun, 20 Sep 2026 14:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uX6t0QPo_ji; Sun, 20 Sep 2026 14:48:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 34BEB40DA3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915702;
	b=hN1gHNKlFE52SGYzhspWz5+7GzhnTAxoZN8oird7MrXRYjwSDUMmjPWkn9sWVyNIATL9
	 SH8w60bIJPX4c/4wFaOIHUFQlN/jLWhyTKxkM1UEKn9EVLya3xS9aA4jk3EThHTWoWPtl
	 kWv42Z8U7b52UQkHdqW7/PRpaEm3bUy7xL7XwGKveNZFWY2WzVeX5p97vD5ntLiNzNpzF
	 4b9p+KG1y/1peq7pNeoEOexsoB3J/pzsMA4NMfIyzCXwIaQe8sYY/Md+ygcsVKYBElaAc
	 R+G1kZTRZjkPbL4F+5ShzQRUbFU3qSPA+p/dK/ZywuCQBKn9CoMQ6lPygLEXz1IyJyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915702;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	b=RfX10+L3McjEiLYYANaoI1KfepJw+2KS7THxmB/9ndrkVwfIL0QVKHPDeqY2vpcKSKZ4
	 WBy2TQKdF34+o8ttIJOw75pEJ/6Inai6xwDDMNe4TnAUZxlgPmpWnHEsDYSHmazfQj01S
	 igevv3SgiQNwWqPg2cPyveNnbTL2+WLJw8bPK9d13NBBAuEoF8JFkLQJfGLhu6oDNhq12
	 mqy8qSUak9IVToOlQ5jPtFBEkogReJitaWJIzs45hWKBat1Dwxh8QgeTKH38t6UEVVfg2
	 om7Gcfj6PhQpKIiloL8r3odm3NaZPGUuZfw6s8yJjRaFEsT67y/HCoADNCmtsHT2KBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915702;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wjb1wiD7amT6HbKutGjQyeS/jB9EGnxzRRcsftMzMrslMiuKLbcCfD4tdCiFXeWG9
	 WGyLEG0FFt4a2gwezZ4TZ/1yt2OeXr8ZrbtR6XdT5f1Ff33dvdO/kPykiJcVBz7rDf
	 kUcA+PliuYSp2IJk/0OUR3WJq3EWcXppBsy+XogdOFJrwrxt5tDogQjlWzzqiomh96
	 gOBcooQfcBTEUq+ky5ZOWGz5JyavlPQCp93ti1S8WlpJQ5jlUTAhvvluAWk0mWnh3y
	 BOoX5DJrWx39jOitp5CSUsb6fxZ4Hc5r6BI2jL7ijSaL46jQBISPcvNri2pcdSjeJO
	 8R9Ri9vstVVhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34BEB40DA3;
	Sun, 20 Sep 2026 14:48:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 60DD637A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46BCE4002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQNnnMqThRTh for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:48:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 398A940022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915700;
 b=i2o40JNpnsfvuvwWA+M1suF0Br3wnu7pnHe1O21onCsa2pJ0ua5PqfEoKoTjo9GHTnm1
 qfCteT63VQqD9lEK46gTRRWKfQIG4DD0Q2BUUUgwRwKET/5rmcEv+9ZVIb4FkaCpZZ+PW
 HIGl9wMK/hujrui/LCSIO0oEL4V8hne+T2Eb2gyTLTAZR6FFEnpRNYC95x6t593bCkeO2
 alYoaHiILXNaY98e99wp/apiTVI4KhDWADIgpV/HpN6pKo2fga6L8cJbCwMwrw7/2Ojcv
 qRInMa39a7aGwCZmUfG1ZEdtIPWA1QswrpSga4PfvpYUK29jH5qoPkIYbGlYxYvJC+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915700;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 b=VQ7sGMizJScAyLNKzFpUrer/RQOso8kQao0wYoluQPfKard8vXspDipTcbP1WefTzGpf
 kOT1Ek5NK0H4mnmS3jcr8GcL04Ur6v7Sh78iGWljfPq4t/Z8J2MV7RivcB0pUSqRxGxv3
 OWKWsQlLGoYvew9TzW8RVz1ncBk+q4/F7Ib7mZYjnkZXOms/O+ZNM76cr7t/Etelv4Mh3
 hafZnO00XAA/cag38HXYbS7DqUZV8nuCn1/sb+Ctb03yvzeYjMiPMNu7dx4QSgXhEtV89
 dSQFKzPpY5N/CP/T91nf33tdSAjmZKZEhaupvL82ZQMJE6xFc4crzdbLv2PeSHR/8ww==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=cckC3tw7; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=cckC3tw7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 398A940022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915502;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=cckC3tw7O3dmNmz+98duwWVbLAhtWynPgIZM9QMsrVRoFSAhY+KYLy5cb5C6VDwT7
 DpZaewPsWV9hIOJcpgVWj4aOAc6Y/YVGZ7HndwSQOhlwNR/unoQo0CSRohACKjwJed
 wCjt/NceMzVZ9RNwJy+kpioWWkVbhRaiPObM3b2De3GkEnrS/4LrEC6UvXjfapKggL
 MMxyFiBhWQcOyZnCS1FYfcAZqMhXDY4+fRGnrKsHSsILrHGjsgnUtR9fiPcquezM2u
 XZV4b4rOAd1tGvjZb8NOJmnGUVVqVoO9AA2x5LvjTUKjwfuF6N5qvTArrewhnzCVEF
 4sOI/gK6bqyqQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:47mWRmBx5gkaFLZ1umVkRjiWIscakwd0vtm+BV4xLltN7J2wkRz/7UMMHH4Na/g2/im7k1w4IBWCJD3qoovdaxbS7qbAzbi9CEy6tveOohsnP9+Qqy/ukrRQcYXFJ3+DYtz3duKusHNuOSjP4Yoo5X4u2esnG1XhhPhHFTylbfAaiB97U/Z3VxPHDYwLt8KC0qiBzheT7EaXbjHzPSmzDnxE5WphR5/6J1FuHR6h08gTBCtGPKAHOrt7Rr5ez+umDvvhIXCRMN8NNrsYhOs49H1DJxX0TC1NCdAgQZYqInlIt6ivAFV2YYRuMj6kU6Mh7VqLDG6woDywT+RyWdaLF08BpWCaJ1Jiw4E/2D8C6/js6gLE5JYxzLA1oVkyuXsRMaUmvVxyE7Pna/owbb89H+un71aWs5Norbp85iZKJeEMOanB0lrejL7f6dIV4mH9gKisA2KbgoyDJKHYCFbSJxbmdEOCuaZFfGgJmFT1GXWo/2eN91eGHRzCYQ5D8LToZXoxfYPwyw2rsyHykk/cu4A52J9OVwirYOt7yjx1DGJ/Mc7qdblPOB4TD9gKGZz3Fl+WjHiBTtz3qZlzaSdzXdD6YUOj8mk=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F28BCA4C4872
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imh-000000000hB-2e3X
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:42 +0200
Message-ID: <20260920144428.3009612-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 21/66] package/snort3: Fix build with OpenSSL
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
