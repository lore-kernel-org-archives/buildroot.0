Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2538BC98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5FC160601;
	Sun, 27 Sep 2026 10:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqhYdk-wndSG; Sun, 27 Sep 2026 10:53:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ED5E260685
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506432;
	b=YgIhUQ2ff2NectJLLT7OWO9COy3gtWH0t2Bc8Bue3YRIaf6QncFxaXGBViDM74CE3iu9
	 5qffXuijPUT35Y/3dn931e15Ii1AteRuZimD/cKUUg1JuubiSQfdfYGg+08zD659aXeEu
	 /S7na9U54Anx41Fbs38wGVxcvkW9TjkSsXJvKO8ClSlN+NSf4E9IMHEzDu0vfjWqSNvR5
	 cCmou4TsVaEGvevAMDBq8Qe5wNjgTaRH0bde5T6qHjijDvRE1/lhIOU8DIxAvhYiyyMar
	 Yuo2bFdWkmGyDrzyzimMy2v1IFNn35qa1mZ3o78czIGUWrFKE1N43aLXrffmez7+UaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506432;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	b=hlP9R2e+uL7k1UO8U4sSjWXX3B3r1tuzpF1bA8JTK/Xv/JVOc+QfFWtNT+LwAw1ZGlJT
	 A5IPkrXzTcWymA6oE+PPiPXIrJewCAo8fGahbP9C+hyG9pB3DGMm/8I6jtDKD5Qxb18fG
	 fZ60HQY9ipEjO9N3gsfTU5Ux2GjCugAkpshMNcaSTawPe29DoJk9g6RebsM8rbGOyPZxs
	 uiQ7goaXHg3ip1lwf0pwSUYdT5yieJDBJWBfbfYLkc2hXpPZkdza2Iw4V47p8hwJjvCYS
	 mfYHYKgaTLTc0hcwneu0Q30VzZvERxwvIGfhGi1TRYA0vtQuHsNKEEmq88DRVPgXyig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506432;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qzAD8IAJPEmT/4kndXtmVRTXzAjUuLwZdaeqIq6o7+LPBf++6jdc+4J69jJDs//wb
	 6271v+nwjYlFXmI7uN416vy/tAqCpoezAweb6si4xLPbC9bJUjpQ4IpiQpoGvrPlop
	 dkKOA+K/MU26FcNd9s+hWHZrzv5B+mdYl1VvlnUTx5y7MYPiIZsjuymtLWUYNnl3JI
	 IlLQBQ3zmBWvV0zz3Cge7yJ6PErFuPJFVh2tQ3UPZ9A1yKwWu3dqtYrnGBx/v2gkd2
	 Udf+EriJMlcv5VW9YlsfQdRiOafunLqfPsUe5PSQ85v5+46I1lsitpkHy0qnV6ihrc
	 bpYpW4fYIXBqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED5E260685;
	Sun, 27 Sep 2026 10:53:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8380FD1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73AD940068
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bo4xcexybYUO for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:53:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7332440059
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506429;
 b=Dcx4EuQarOYykIzSlLcRYjtSRHrN1UmKPMKe7lI/AZKR9b7SesoGOW3CZkZTjySP8A68
 vGXge3ZtQF32ipN67bOcl8i6fS6TwPPQgW7YBsNemB49JBExZ7tDRZhGTPOVhxWh2j8Pf
 BM8ObXL5E8PHOKu7q0PfwjHZJ8eRtX5Y7dakK5+wasSs611qpLfYqkQ9vPuR8EKKJH8cG
 hT+MEVDpGWqrD5HDperQBzzQRLInyROH9Tx8h0L0Ae0QjPh0u9rIbnQq01nA4kbzfqhYV
 Ji5Z3jYGOKpgkWoqA/kYDv4E14QldaaOVxebfWOxUyhRoTh58QA3zJ/dUrn4diYyIrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506429;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 b=Lj6K2R1xlu9f/pdtcAIH6YaK3NaEEQ2JshdsAnJ0vS1sr9TJlB2NETbmeyMaYbGu3/m4
 VtyRxlGlLTCxeGntjiIDLiKH5/yaH/cJgEQJKbAqViMKUuxpB8XVhizt161u3eAlThB4O
 Fw7C8IORxCBLXQrLB8RyAfKpBoymlD5K0BOygoOgXYtE9G5FwZV8hgfupxAO7Yzy8sk5a
 BbUMpMqTB1CG7BacuzJaWbrKTlEdxJtSn2e1aNdyI49TNLXZTL5EET4Zd+9FYyuw+Yvzs
 TXDf9Ok8ESAGvBJVJU9L1lZ1lJUxpBgtTm3ZOSoY6lCcL7t2bN/GP3AYheXvJsVtZrw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gvmfvmyZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gvmfvmyZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7332440059
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505854;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gvmfvmyZPOeHvXVIjSSP8RJrYvlrPmGsKERD6Ym9znbLoQwO3XhdWPlHXQdj6nLnW
 +1Mq8j9FeoU4mVMeSWHRdw4CxYkha6ShF5X66n93FthdYjMX7Q99X51QFaszsHE/2O
 fgttlVTWUWrGuKLl0CzjMypnyjU6GEBtCJ7A5Q2cD0g8BI4Wj+jFNDfUxflZfUJnGA
 QpYUzvWrMjwxxQqAzDmhd7QqVJ8ak87TzY0rF74MYmmD3zRMq1bDnPi8whkW3D2HOl
 nckfj81BAaMBrNt1acX0EZK5YvOmc2lplz+CDo9muQzJ9F/n0AIDP/pCftM+0QXo4N
 UyE8dMXLiAy8A==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 ANfmjAtqfZPkEvNCThH2N9vlbNXcZ/bk1i7K7hJtatzzuCNe6fy/1NBxfPZ2yJl3UKU3VsCRtJZ
 FFvOQvyPu4ecO11b/xHBtkt1OXXndwqFLk7zR1A7+COw1ZUKumUGO2ZMv+9cLnFJ/WjXHoS28X9
 G0ZRSQ4kZ2nm3CcxicrVV6hQ8chVDdkHPXVvHNaHtOcMxMYw1Xb+8Cmy6hCLrE42AX1DukDmhss
 48J1gXnnPzh/ilI/ecz1E4pIUGzqD+Xx383m+/5ZVf8KbuLh5GlGULGtvfexrH7th1hbjfd+oHv
 3rv6PXimx4jxlIjAachoEdX/WH/CpXCtPvZNaN8yiG/Q/IJfeuQ3yRcOJ+MyxAdpHg0rrE0HAn/
 xDuTinu/moB5kqHf058Pc7H9mO40bwR4Jaer/b/gXTkOpuOywdHJV3drAjx6ZfVaj+2spPPiPh4
 TZEAbVWNKeXHBW/zDndvYf6aAh2qITgF1avPLRoKXX/63ij3l6XteUrrYqk6YXmnphCaL+mxf6D
 7zwTNkPDnvSxTL4Nxy7uFjZyRrc6QEufrMgtNV2AMgpJjgIDchoIkKS3ErMjE5W5rjngN90gcn+
 KpqDY1/fIDb4ZJ9Zlg89QVnOwyMeAqLfswIyorCYTCvHIzV6YEdI42TtnvV6FmbFwvsgOKgI/8N
 wHBTB5dSgK3ZBDTnIr2tH
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D04FDA4C4F81;
 Sun, 27 Sep 2026 12:44:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLZ-0000000007a-1awh;
 Sun, 27 Sep 2026 10:43:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:01 +0200
Message-ID: <20260927104301.1801638-24-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 23/82] package/asterisk: Fix build with
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
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
 ...of-bundled-libpjsip-with-OpenSSL-4.x.patch | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch

diff --git a/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..28f9d4f281
--- /dev/null
+++ b/package/asterisk/0006-Fix-build-of-bundled-libpjsip-with-OpenSSL-4.x.patch
@@ -0,0 +1,63 @@
+From 520061e78d1ec24d0d4b97555e11de01f4db8c2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 13:08:28 +0200
+Subject: [PATCH] Fix build of bundled libpjsip with OpenSSL 4.x
+
+Source of the patch:
+https://github.com/pjsip/pjproject/commit/3923fad2e4f6f3403c3d6f1176b113c1c1b91066
+
+Upstream: https://github.com/asterisk/asterisk/pull/2162
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../pjproject/patches/0030-openssl4.patch     | 38 +++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+ create mode 100644 third-party/pjproject/patches/0030-openssl4.patch
+
+diff --git a/third-party/pjproject/patches/0030-openssl4.patch b/third-party/pjproject/patches/0030-openssl4.patch
+new file mode 100644
+index 0000000000..bfeefa2677
+--- /dev/null
++++ b/third-party/pjproject/patches/0030-openssl4.patch
+@@ -0,0 +1,38 @@
++From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
++From: Ravi Kant Sharma <rks1986@gmail.com>
++Date: Wed, 24 Jun 2026 11:30:40 +0200
++Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
++
++---
++ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
++ 1 file changed, 4 insertions(+), 7 deletions(-)
++
++diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
++index 000aabad61..93fcf10f14 100644
++--- a/pjlib/src/pj/ssl_sock_ossl.c
+++++ b/pjlib/src/pj/ssl_sock_ossl.c
++@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *ssock)
++                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) == NULL)
++                         break;
++ 
++-                    if ((xn = X509_get_subject_name(x)) == NULL)
++-                        break;
++-
++-                    if ((xn = X509_NAME_dup(xn)) == NULL )
+++                    if ((xn = X509_NAME_dup(X509_get_subject_name(x))) == NULL )
++                         break;
++ 
++ #if !USING_BORINGSSL
++@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *tv, pj_bool_t *gmt,
++     pj_parsed_time pt;
++     int i;
++ 
++-    utc = tm->type == V_ASN1_UTCTIME;
++-    p = (char*)tm->data;
++-    len = tm->length;
+++    utc = ASN1_STRING_type(tm) == V_ASN1_UTCTIME;
+++    p = (char*)M_ASN1_STRING_data(tm);
+++    len = M_ASN1_STRING_length(tm);
++     end = p + len - 1;
++ 
++     /* GMT */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
