Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1525BCA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE40880E85;
	Tue,  6 Oct 2026 16:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdyigGNH1GYU; Tue,  6 Oct 2026 16:34:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BB0BC80EAC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304447;
	b=sfdnr+Ia+EEr5BA6r6qjZGblV3tGW7rISBdMEMhodnCHkHf/TWMu7bi6OtB31ZyBr3hQ
	 uN+Xo4+yMbBN8iAg+rGidfxVyT6GiB2P7VS6cOKuopXnvAyHyBEQSsSkJDdsXiCtZfyaa
	 FXHPLwt5U/eDuSPFwE1jV7jsusmPCuPbUuxwx3RxB+Dc7vM1LjokD1iW14EUWr60JPyT/
	 MUBSHgM94O8XGS4ouVENpVDuGnexEv9fsJr5gGoZlxOGgeatUkHuI5iK55kvrOoAkXjoC
	 rG5mVylvFJ5y0wGTBzyblSxBjPuS5JMTLD3y6T74pZtkee+OP7DlmE+pksJqHVYZ4Wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304447;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=x1CIWRxq3CU6g4mdjrwFF9eCcx0lT754/w23wGBf/OI=;
	b=pUrxtZns+bwR2Ha2YBVQ+9liJiZRWeR7ZX6I7UwuROSre9bJGBJZdDJ6esB9lfsQHG/S
	 ycz5xilkMORigIHSTHKT2H9J/gEeRewmRTxTlCIgqHTIoL8uCVCW0kOEfcyqJnIv1f4Vv
	 xeTCLsXaU1gURXKPBDo1mJHGKQMk/h9DjD8uSkfdmXCAuI5mfmLr31HY7HXNlxhcC9T6Q
	 ZKiZDY5pDuXhn4wl+2qeC4k9OUAvTwmFShgpbN98P94PYtUazvLVyr/TVUk6Tm2VePtsR
	 OLqlUnSwFNHYmGdvv5lSIxwv+BWpdi+4dsBlZL9g73Qls+DcFWtHwoFgvRzTy4ScAZw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304447;
	bh=x1CIWRxq3CU6g4mdjrwFF9eCcx0lT754/w23wGBf/OI=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IFAJ/F4cZyWhfc6JZm1WrMSK0QHOd5wH0Dz2xSlbRkrUhlnT3q8pIMdL4jFpEeh2y
	 JBb+n2OSU0oOBl+v31qqwhLSZR32vgkq+xmjQXkR/EGiXKBEiBJByRLDBdiRL0nl1+
	 oIewTQO6yrY8VG5oFuJw7mjU6dytqvVVq9O9sjVNvkpE5a4tWujqPWLesokK0Xll0D
	 6SBHNoyYl+CsTQOelpUdt/1kL6Vxc7Y4et4X+LfhnDbn9owqzOj6326VEpeCD60Uh5
	 f3Zd3QQNKbHvd9gFdnA7QIXDML/dErv+b62m2OTV18pvdxCY2QQ2n2sbtcxlh8SGQO
	 Bnmqm4frs2Ljw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB0BC80EAC;
	Tue,  6 Oct 2026 16:34:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0237317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5F3560855
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqOVD4r5F1Vk for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:31:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9FD5260784
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304280;
 b=UBP+J3p+3JxlSGWquDMuWJKbImNzf2dZIOpeQFEFu6SXCWaAcLAtVhy4x9lnvzXbx3Vq
 zBDR61gyqUhuEZCYNHczx9xuIx7HOMpeAW5jXkW8Mu+9LUZCkJFbeVNl4u+ZYLiF+c+gI
 SDwBQHlu2r/snBc8wLJMH6Z+LJ9nxqvhtQzASZd3lfQ0MLXW+Ix2Q8+emQga58Yo4eKBj
 DGzVdP689Qx9KknhklN+33nuNORyRzQY+MuOvZv8I/Nf5deFNSCF8pWMm4c8e/ICDdadN
 Tze0syR2yuOqe+W29KU+pgOc3dj3udP4VRLIR6RWJ3ddbiw4tigtEj7wNc+4eL0ymXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304280;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=2v+eu45AUBhi1pyRat6aQsoKtTl4n0znxJiUnpRPCoI=;
 b=seoL5LgAqAheMesqMojLGbAKAhGBm542ZXTPB0G477pwx7X26xTCB9aKrHYlY3Vgo9tH
 er9jdMnQB2hyLEZd7Klr8ucX53h7qI4bhrardVDIOWzY3otU4Jhi5Pr2WommlbRexq+zs
 0cqPjDCgdWZC0YgByQgl9P1DZeQztZGVscx0EZaaGXitG49LQpfSzqsLeguh6BSyYcMuX
 yljP8FKuLNSmRt9YJT4p9xvQA72+utJ3a3qMOf7cKm1JdclLoAlnKMWo8RA+2FBJlQD9b
 QpguAif60ObYrZzcKyTk81F0Srivs1oJjo7TT4hc+TGIMlmHkzP9FHgbo6Uqg1CggsA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Emevuk7N; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Emevuk7N
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FD5260784
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303708;
 bh=2v+eu45AUBhi1pyRat6aQsoKtTl4n0znxJiUnpRPCoI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Emevuk7Ni1mRVygPvd8O5Tml8NzuZoHlh8VNmNPubW0vuByT5BSZ2JSF25Q+3CEMI
 TIsIOFENmlwM/LgsOJ8HEVBxUT37YGesg9ku8XPR2qR/FBocRsVeIRhy4xcoYflJrm
 fJbi3V/aYGur8o9tQdXeZ9gKHVGzIIiSvMeIOI5/YxpB6qSHLfSBRh40KtArPfQz6E
 T2B+3gIZ+TbkEIBodgFJmB9NpVIdlHhlM6NK/tS08v6UiiDv75K/DBdslgdctVQzr5
 Q3Jh1glz6QXcVEnFcmcPmpvb9K505lvDgDtAPZlOsde1xWqz5DvMwK43pU/l5Yoxb9
 a9tL/JfJ0O67Q==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 WiOesYmibYkHZmTuVpeTn3vOsuIHTaIk60FYAk+y9jrTkeb4TAVYbVY8mYiiiXPKye12ZGd5jbS
 Yd2UeBrxYYRTbrOysqqyfleHcKp396g2EhDyztt0fIKJWmSBxCqOAAZI1QrkfBPA3UVL3PG26AP
 5srXGMPIwSocWurwnZKwzo7rmbS1jHeW6fTHqoY3fxYdGemsef/KVQWdpRqm2bRasrlXpZjm0xZ
 meFhJjN6tofypFob+47bjmwNpfBTRyL/DtHKsTLxLYyI+T5ugMLxNRgVTCdiMOAA2LkDCgRB+3e
 7onv96e7VBDoSyOUPGasKw0cJZrDdFY8wDpY5ThxsSm1RVNE56ySAJwKaV38fP0+PCKLe2CzdYI
 ApfwliKYCvk/vfEEkyRr8paP6tsTdvry3EGg1yiTspFtc+jBKDKFLFvXcTwyOcWj+ZE3PuM7vOO
 7yAMiiYku5duQSxnnBpTBtdRbS6BrS9OeTXZCNhf9yWfEkSfT2eSfCds7zfEfzTEjh8Ws1aIckX
 RGzcAs/2qmOdysaHR/8cljjMH/vHrX9fHUt8iPK4a0k/fSYY3np1LA3L+0YLLBaFurT2Gfu2Yh3
 syOvNINuJ4WA4f8xQ2C5pP9JiV2kVd0qQdBROgbxBVEmcdYy0PxXuv1Ug1zyfg==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A82E9A4C549E;
 Tue,  6 Oct 2026 18:21:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uj-000000000ir-1Kcp;
 Tue, 06 Oct 2026 16:21:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Oct 2026 18:20:06 +0200
Message-ID: <20261006162106.3439373-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 25/84] package/snort3: Fix build with OpenSSL
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
