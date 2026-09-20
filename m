Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC0CC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A678F4052B;
	Sun, 20 Sep 2026 17:12:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epDjD3xlK-Am; Sun, 20 Sep 2026 17:12:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CAE93405A6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924341;
	b=M4H8IP5NzvZ5aYZ7R//l4yILjFJuUADPXAWbjxMWRhXdJpaS/gg1fpB69NanCob/rhdD
	 rznkdAF/DmbL79ypEYBLslvzLfk67puzO/fDJiUHXc8foTOe+FSnkZmqFPctw8y/rR1rG
	 Yamo3uWm+AYE380f1e2QItLH/+73WOMUgp0bPgMqLtWegPGDDvAi5g4veo1u/qgEVs9LL
	 chCkwWiI91Uwqb2GTcWRoQVdoNrMDW8ygOyE55zsQ+vA2GmbbNtq5QlrdkluvYkgfLNjh
	 SixkMSvwZRTtj8YIAd3Yru2Iwclbi68CTm4Bsottz2H5XbOOMPrlfmRIQIU4IluV+Qw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924341;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	b=K+VW6ztyQlJPClv5ZIl884SQcvmuRhh1lftkZpzAgPIIzJub+SKEAqmZzbge3e2O+cdt
	 qUH3hL8U/xQLvl6/tSPVsRiY7WAbm/r75hT5nVM74mlaqqoR0eG4Y/XTRZmJ6lJTluv0d
	 pBECb/VVLPoPOlJEWPAL/oATT+AfyvevXGhPrh01IhNvlKEXHIH1Zg583xFjjEL4Tuj8T
	 G0dS0s3vKI3fXcQRNcT1JwqH3iM7lKbkfxEednvO9ZQymzCB8FrcDatTNu4mUr+/HgGr2
	 +3IU1WonWZC0ZWOnmOOmoeaNck5GLeqCs8TPpS2EhZZPotWGHfef94YVdujAKDVRIIA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=OnC0p7tK;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924341;
	bh=1AbMIwDUPKtwoUmRqVt2P2THg84e9OMuBtECPbOdUDg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XGy9W3jWZKkwSdOHiDTUPvJ0svTEqU2IYwwrujsOwRgWc2NnGvWaX7uZmetmZpFfW
	 niuaPzBQt3hsX2xxvvZ/ujUf1XiIdoCHKjPkmqXReljgH1W0A6I7yPSpUl794di6yw
	 YTkYU5hszmyUaSw2ZdV2OMIlv2gIXD/LQv5m+JiAiO76RTrPFVKeWX0rrowJky0mLG
	 kRtGlCzR7yIG0SHVPCjX5KdXbTciRYy9nG3cVuOofmXtKgiO/F/JiS15ZF07IfBZP1
	 8OVdnNEN2jvowirR8iqi8hJOXALV8NpG+9YUcOoMGQsT54JUn5Try0XaE62/ANisV7
	 JLfN+m+nPnpZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAE93405A6;
	Sun, 20 Sep 2026 17:12:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ACF623FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAC9340518
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id clx3ezBLFj-2 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:12:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B58554052B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924340;
 b=rdVOyPuhMU3tGi8jwVcuP/JVYfP6y4cx96H7Aqxf+zZUbh3aXn9anxBcZhSRCLaVgYua
 rImQK3k7GLFuNWalfzlKdNn9Zn+XhAxBGAEYuorH1cIx8pIaK8oFf/gWD3V945J09Tu5f
 dX77dZ2Y/mkB2jMxAf21lBzmdoPNVvAeMhe3b28XEyemMXELZ7wYRckMXPbZvtbQw92lo
 M+wnaS6SntZZt99ms2vTVlLj8Q4UWELf/FPNcr3gfwT3t5TccwHA5exZ+9EC/Bv9CN346
 wQhiTjG4JH9tEo145lqHhOuD0LA0DqGjQdImHVTtQUs5gqEHhBZ8h7OujW8e3aSz1Ng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924340;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 b=Ht9oa5B8R6Apd8NRykzHTNMqvYHlEcdZJ1UYMCyEQcimGd0wyG8d5OC5xV7/Warg1TvX
 rnobGdQr9BdC9VjfHE3aQCVX5r5UepmsYNjzFr+ZBGHvtTGANB/DTPzRN8JMIgjUTK4rZ
 U2/2xHy8gXiXe04rNTDPZhhwFVfqMaMHOXLsbSJf6bQXvjHBqUYVUmazLplk1retGxEz1
 8FtpKcFrZGp6wNvRFKUoqC8HVtJBhWG88wDyOj2P5QmaEeZvuR8XOjYhEPxcQbDQEYqO2
 IvfX5BmCsjgRf4DEo4ImiQJ6v+38KdkiwktY+twWSr/lSl8bccQGLkGtbIOInY4Z+kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OnC0p7tK; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OnC0p7tK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B58554052B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924147;
 bh=ST5EVqliuc7EHnH8xG0/08E7os6UjFJcCcBDLcIknzY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OnC0p7tKDTJvdhpsvn2yex/j8UgIYw20t6nu1RhHfUmuCQ8q2+Xdyal1/wTJEyiLa
 g0WqFF3AuYNAPz3OVN1wUMVFnTGJA0qm9AlPmO976I252X6pyjr8WZZkaeRMSy24aY
 sFQpmtu3b/iWV4ArP8XMP0/KmVg/I+Eo24iCxALb2qGI/i7mdeITJvb4go1AvH/8Y5
 4gERMxqEb5L+qLNgid0aUYD1EhxfXgE6Y2GhYqKqJX2X4WvYYvOxKfxTy1LzFHIoYC
 kmMLZOwUEV+9DFOCRwoPznU4PX9J1PdK2dCoWFsob/tMxwvox+j7bmX1X0ZhdfoT6q
 IctZmzhExjppg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:4ptu+7D6PHJzA6Zd/p0CIpWCR1KWxYQwB4iKRo1HbpcH1/LwG+8YKQi+stY4SkW3RGykhoBtGm5L76oLsYGUxF8VFOQ8xaESVaT/DM0pygCu/sDKiVUeotHbVE5PIdWuNXHYVewyI+fj9P34jUlstYAWzoqrr5F83Z3YT01sb9IBSc5CqQTXKaW74FToUUKvFuVFwo9DWO8YCR78gAYJ+r6O1hHrZgSD9QwxoU9f5t/CNanA6hhWAtkP5TOgwvgKtUYsYLeSSRDrWYnDq9O0A0TXt8FPBSIiAu4O5VwUlcb/6xi7hnsGlQhlBEFjXNdVC7+16svhGSOXvsgvP3sWVLKdpWYrZARPcnZ0GOeYKPEaA615lkEsmZTGzxAkq3GjCkUQd7jOaKzb6KLhdYWRk/VjwlvKlyEFo8Co7neJkCFP4f0twayMNn9bvTU9/DN9VDG+U4ZkgIxKSQrAf0SjB3rb7g5mY7N+FE0HFaoWfAF/yK2r1NpyQVlCQi4sVUO5wgdX0mGQD6gYUfA5hPRhY3TOggr5M2hOYY2nztazROf2SXlDX/o8R4QejqYdHiDILPYx6I9RW5JOcNLdsV2aP2nUu0lixROIxc06+F6EsJPuTg
 2gVF5BsuF6zjA+jb8B/LxKqEWl4GpIBgmCuhggq8szjEUd9QfCqFuyZtrERm1dR2o0nsSXsw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6D3B9A4C4876;
 Sun, 20 Sep 2026 19:09:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1W-000000000o7-1e0k;
 Sun, 20 Sep 2026 17:08:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:15 +0200
Message-ID: <20260920170815.240247-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 08/67] package/asterisk: Fix build with
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
