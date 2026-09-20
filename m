Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82716C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AE4340DB5;
	Sun, 20 Sep 2026 14:12:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86-eTrny7jiA; Sun, 20 Sep 2026 14:12:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5FC5540DC3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913570;
	b=aomFGlagpISwBVrBXEk4b8+C4UNeSVfuuXI7LRUa0+LRYQ0KBqFUYqMpWiipLg2Tjo4n
	 +1ztUlqPjNrsAJLRn3PLBbkWypCZ0q2TBiwjJ/aJS3qeGoUeiQy65ZT+HgVXjDFyRgIrY
	 flgp++8BhFv6ri84qIbpUhgFJnV9ZptQOOy4AUx7LfpGSVqu6Nk+qNwmpezsRVshY4GM9
	 FOBa1Z6UpSYUXpwAw/akAP8QrQSCgRjDHBMOTbXP29cIRe/NDB0xeW+0cLhZ2OOOyhjZC
	 x1ux6Kyev3M4S1/mMzUwe6h/3q8NdUX2IWEb+7aA4kb/KGI//eYZJGDZqyNRcuTsIGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913570;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	b=BeD6PJ00PkGOtnykIcSSD1XA4ykFd3qahGA51HFa6kcCLek78HpPeEKO+5b7BAQmu5iK
	 1McQfO35NLjtCAhCVCtBAncH9jCn00yjg9UejxeZgcbxmmtmMU2//ONPWbo1ozSdXuu2G
	 5kHDFwphyRTNweNwLgyUK1JMN2/ceOUJl6ffXfR4D5ajlj4gJ/GKtHS6W4BDAfhcNVPC9
	 SGjLZUL1bkqbo8yhsomNsGJeMVAUTpCk+l0QXvh5Mvm+bofyuFjg942yntUcMXMjflU9L
	 Tgjct32H2B1ku37EQdlvD2vq8my79Qm4dsLXOgMRVrcEzqY1hCw131fpcaRdCJ0IeyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913570;
	bh=pbgTCu2kUlB2/jVX1NUVMr/nuY/laKuMVLH45HkxeiQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WqydEl9W0EMrl2aJWY4E1yORccnrw3wosrzm8k4MRqhkduj9BjOxXY5L9LBVVqggn
	 b1FgWKNcTmD0F785EO7Nf9zPX+cE7EeAlUEKAVGIwR4+trQI2rKke/MemBbgh8lURs
	 WWESbZi6WamgfjiAJN3xrb+7AK+sVRLx3i68DKpDS9c1+dYUxtiNMBSEL22FwU4XRP
	 WeHQVuTcrNExGMOXRBgXLCdutvWr/geUBnlJbTg1dzJtLXbTFbIpLt3i1VZfmkonr2
	 LzUue6PHuzbBQXChmndSasxz2giQyzB5b+thiEA/qVfcevWqogvEAKr8uzjvpB+Vx6
	 P3+OcmRe17fyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC5540DC3;
	Sun, 20 Sep 2026 14:12:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3683AF
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D19B400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSudBxmFuNLm for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:12:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org A8E2B40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913567;
 b=LnDZm5ocUQnLilqrstQenHm5yzCshMWzX1zhgGQTGMblCzK1tXHvWrKDVRDiqEdOQ5LM
 lkDzoBnzRAcJp3/cRseXnWVT81C4JRzkZqBgyrNNhUBIGL9rK5Ofm3ZcYNgWWPCl/7LSj
 bSQg+vkhjsSzGG80EG3EtNTJHMDHrAF3JLGxinzl5iIV5H6dbr2D26uEIb51Cxuksc6Bx
 9Aj4TjYp85SmNYdeRx4xeYVTqzZXEnq2Mu0yJCNHKru5cW0R/otoG6DIvBI2/hDqXWSv5
 Iai5BaN4qw3XXusBTtaOwOlSx7XVA6Amsrw0z/pT+/KL13eutKJFr0nnOqsciLg5zrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913567;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 b=pxo5KF0Swzb9lxvFP6eeXgCdTH7Df3C2xGknDcVgSyEJiFYmadYB1nyIq0yVCnH68ZGC
 792gBm6YcpROpcov6vieR40CLgKRFWP5d97G1CWS/T14t2cwEe39xAw52YWK9OTIb+OEa
 DpozwdzvEIedCvAPbyKTTDB5fi4jZTvcYgrNnnKBggxqCQhzW5fR8MA6qXssji/HBJYfr
 88zILeNOyKN3VepnSifcoB+TomBc+sXX3CwEBPDeMI/VgHy79SeNGXDVFgxo1D7ns8If+
 eE3M8bNvqVSFjfWOe84u5tuOT2jyaX2lM7lfcXeoWmJSzJxywUr+RLY9jqtRA4PiQiQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pY3fM5vf; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pY3fM5vf
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A8E2B40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913233;
 bh=aQCsiloAFCT6ucxTXMBDv+p0Rxzh3vbuVD6KigvS79s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pY3fM5vfLp5SGncxbnE+lvhPRGvDjltzQDN+kfTjIY2S0PGai+txVKNl4PfI9JRoB
 KAeMA1+a2Z3qTdaXVIaiS3enXeERVlOpLZ70Z8ADUUII1CiaN7h3yBVNIooBiYRqP+
 pjUdJL+Nw4z6Dg+EQW4l/fqSeljShG1RvmHNBmaXWgjRGSCS7SexsRvItyfrUN9VTu
 TLruTP67TT1+vpReIqatVzRE0Bc38PbYxy26rErBOAVgXyF0sudTjVT8IUaL8LXVhQ
 dZCwoDJDN1N3iYfnlFrj8B+iWMFUJ2AlPErXTahGIjWXDWNDBqcZ9khmQxqKr5LPbE
 0g5xCfpSx6q4Q==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:JGcBXjZX1s5ze0Ogh3+rGgkc2v5UDqCNrzvpuW2mwhsok8g22whtnKqBja6OMEYSiQrXfr41pZjZUgtIW6ien76a3BSDBqcieTZ8VPgGs+UVpKKxcX/o7nNc61tuDQQcGmvJ2kkRDmh6BQqf+rhgxqDgh3f7fpCbu6NUvQZR7GV4Dn5xCivSQETuu63BVCP27X343CvCgERjD3kLOeYL6FBwGT6qAC8WWQCF4PfRiYLZ9f/lm5sYVdveq6Ngg/svj5hgC2zaHfX3B/JGk6S4snIaU5+pI8D9UfPm8kcFBHQvP7TtawoLSrnQR0L+8+TduoIU2rqown7dFCfUykXRUt7YUAGWOOcQz9J3TWd76AUp0L/JaoiRQRJuYhfcV4r/wMGE+UZZKQMw5VG69qQcZqkO9B34QEef66lWJmrpBG86HNLNKcWLiqU7pdUe+hwFB+a7E7bGGxW0jXlDks5nfCLA3wyhbVrabFA/CARDFu1NudDuUBlS2xYjQrwRjXc74vOAlcaTtQHcShTwBRdkYxVjmSrxdznK9+VeAFKDl3ewUpJxV4PxBezHD9xu4xSexkjdew4p4oJulHT/m7VpKhXtUW/z03INqe4geyvn59UXg2
 7MT50cfcu7M00bxJiYyF/eg0Z7izewrmt1CwTXJI95Q0s+NPl+x3EBbPJ5J/HWClVCCDDXyPnq
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7096FA4C486E;
 Sun, 20 Sep 2026 16:07:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBH-000000002J9-2esq;
 Sun, 20 Sep 2026 14:06:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:19 +0200
Message-ID: <20260920140605.3005461-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 21/66] package/snort3: Fix build with OpenSSL
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
