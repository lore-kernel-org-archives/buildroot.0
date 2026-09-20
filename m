Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB2EC982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AB5D606D7;
	Sun, 20 Sep 2026 14:14:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jl_CfSZlSjHQ; Sun, 20 Sep 2026 14:14:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 436B760693
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913697;
	b=SQFqlCkDi9cQ35hvTwn63MHvKrK1SR/Lb/1Ncpzw24dMf/x5+brZiXjKujY/QPDHPTSA
	 Ev+KaPOJnBQtjzvcrNzKuG1qCUMh5TPNZ1RRZFCR9FcQO2MO3f6y3ShcvYxht0k9RqkLE
	 /5JUSoA3qA+GQX9e+V14Ij5hZL29eOXHJyV04RMXfsV521Z55enzIUKfmkY5XiSJcjPmp
	 QCRL7+unbEIrtcx1GUbU41Xm7U1HGNYme7+LHv/iMOi8cgcdTDcalqPs5dhbMU+gnyCF2
	 gAdrbgZZDjkhHaDEYaBEUfACKvKGJ0Aio/q6ZG4DPKINwvgcaHhiULvUoFBkUjtxrYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913697;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	b=O8hzPhd6zddtKVImrMP77YuPGnTCkI7gZQJa1Dt/bn7nQTdy2+ENcwsgdBkxLR88qksd
	 vBXlmuGvKgS4mAmn/P6xLcHgcCAW5ZP3s8Fm+SvKIoOAC72eeMyQlrWEHq182TRdbN/cf
	 YBvCGjbir+JL5pxN7dqAy3q5GSuQkZsJJRPxqjF0nwG//W6IkqDgZ/TGbS9EgV88bmm/F
	 vAeUBRqRVx8aywUV1dYGuk9WuPk4dKlWl0WiZ5WmJRvdKr89BysIcXQ+Hc2DUrHSPTPF6
	 3vjBzaoWw5wO9phDgpnxJeInrSIWC+nvaU0ytYPDI6meFQ0poh1gdA/ibopuyv5wpQw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913697;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nBMBiHP1wIIj9W1ZHWqyS99GRU8IKIEkWEq1he9WvVLqChvm++4t3r4MUW5fsvHbH
	 /CMoBD+I1JyPomuFnTJmdeyyFaWL2faXPb7605LoMqkOQUr7vY3oBmOaoRTfQ8QNjd
	 txbubQgkdLlWXpfrTmnEslfXkvNmFcHUKgvZ3HQUXa8v2wrf2JzIu6kVKhi2tRhjxx
	 Flh7SXsDn694FKl9zknkHc+v2d6UBU82IKNokaOGhXk2i801Z9i5mldawpVk1bLkVR
	 bp/OfRQ6bvbboAf4g6/+1CnDea1UNsHEaY7IRNNNrW77WTTqcyMaGLTGIdMH+GSvpK
	 K4c0SsGKfaO8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 436B760693;
	Sun, 20 Sep 2026 14:14:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6905371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D5C440DED
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRVrhREfOOab for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:14:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9703740DCD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913696;
 b=m0daq8xz1QWrmWCU4WO+KPT1H3fLM2OBdiCk4zVWKnBZuY4ecnHy3MvUEmwlyZ3lHspP
 2h/OGnr0Co6xVNN7ZYlUv5WJ5/RoH+2PLE/q0Fj4sSoj/8nbar26JA83tzD7ARl6PyMXy
 0tfgUwNOKMnDyvAvTxelZ7GWXSNvAClOog7vx7dCpZsRe9TQHRUcXugr0hCC84KGrxpRn
 TKPGQnSHUmTGy1p4JYHvAtju+GuQJKGqRY/HX/TlqZZ3mioX2gifaN4hA7Bqr//45kwHK
 GefdN4PDFEzUU/z1mhJbbFa/l0vLOlG6h+1xo2pnnhu5tdRvVRYktIub53FA3roMqMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913696;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 b=LOuxjCVEjEyt+qtqKVQY3cnYtVRSETAh2zqfyq/e7d5sZ9A/gD4kbLJ3DkHmNoGGEeqd
 S2FaYU8SlKY+urpFhaBc7WORJHBtYGjP4MwOR5kr+ZnOrXPWq1pgh3wYeU2roJgqEdF7Z
 c14GB/n4OkyQExy4B9wSiFE8b12z7PD4qH8S3tXkWJ5vXBFCSgiEsDeZ2UdoPgGfnmGTd
 cjmD69EEyFcZeDCdtaEfUvNXYd9zbUrd53P0NGi6YGV7koSpAihRUp8i0IMCwPt/b1wpI
 s4lxGFze+voUUZna0BM8qhYvpQTq7SSb20ElmjA5E3GP7zOPbHYqAYvNiwRrnG/LCIg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bbZs7hwZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bbZs7hwZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9703740DCD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913238;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bbZs7hwZtNBIxGW4TaUNUNv4pqJkjEqmVG/XS7HqOByE25tLL4s2Y9NZ1bT/mZKC4
 6gca7sqBD5brJdTdZA6VkAtb1N2Aij6ODjv31oYHD0frR6G79WYDWeipVmEO+Cd3qm
 D8maIGw6fjz+zDC5orGDtdWYzT3wadhB0T0iMfgPRblI4gc4bD6Y6s3CF6dZkG3QMo
 c8k1DSuNx3l++jsndnTFY7OgFwn7cVr7F49DNvBjdiiLAHC3TMpP7Ikc0k7l9kLnUQ
 SBCaBLV6dMXWhpDTx8vDoA992oniynbWjmaiUpSVEMuwrVzBfKBBZUYjzVOuZVUc1w
 RfQM8g6UYh9ng==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:qymAcyFFt0pj/6mNbdaZSKtwEnHxCwVIWE2j9U2wKCA3Q8HKUQsbTT/KWrfIrc/025v8JSS1oyKTKInfZhds7Y0bqA3ohhXOzkalAv9wGQaU/Xozp3tkbewOheHsWS5H0BL3+0eMzLmh89OvISc4RD7UJBjlHnUEPKuf/Yv6Qe+lGLt8BL6tuHYjIZOSQcT2xDIIxv19V6Wdm85j1v6N5PgZYNx00858S1wo/pHsJTEUxG0ZYSIknTqVqIX2bMD6LV0eF0xvXmqQuYSans03uF1SdTZajardjO2wZRQJ6GdcAAHgIn43gnhvbW2KR+L0knANQr1QwXZH8/QAvC26ifqFMtjGztEChWqyhGy92NDwjGzr909bO4Y3pzy/AJMn6VSM5ltdeFllLgVGUe/tcvhJGGt7+uBc0+XMm62vag9fTUpss6959rxI+bajYENv/Xnk4HUGvXpKOWpy5TsBO4y/1wy/iV5a0Y/rAbUTeFzieg+AegFGDlWZAzWsBkmm1b6KG0/sdaYXWuqLi3viZWQyjvn8Dw+EqIcvunNnBFoi4tbEvDbxngUHiEphdbCjrYsNK4vNB6J6jHNl64PsMqg/AfCI5pnP17IzGrnogZ+mWW
 iFAE134lj9uW4uyA7QVG9cwAz/z1DahkjbOrvKeCE+pcTIlcqFt4+hCr7J6uTpAHcEK9BtQrvy
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 21EF6A4C4877;
 Sun, 20 Sep 2026 16:07:18 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBI-000000002J9-3CZi;
 Sun, 20 Sep 2026 14:06:12 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:29 +0200
Message-ID: <20260920140605.3005461-32-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 31/66] package/gloox: Fix build with OpenSSL
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
 .../0001-Fix-build-with-OpenSSL-4.x.patch     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch

diff --git a/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..bae3319115
--- /dev/null
+++ b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,43 @@
+From 69c49c945aa3847eb12a995f949d97a2a99642f6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 9 Sep 2026 23:27:07 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.x
+
+Upstream: dead
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tlsopensslbase.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/tlsopensslbase.cpp b/src/tlsopensslbase.cpp
+index bfa1fd9..a71ff11 100644
+--- a/src/tlsopensslbase.cpp
++++ b/src/tlsopensslbase.cpp
+@@ -224,12 +224,12 @@ namespace gloox
+   int OpenSSLBase::ASN1Time2UnixTime( ASN1_TIME* time )
+   {
+     struct tm t;
+-    const char* str = reinterpret_cast<const char*>( time->data );
++    const char* str = reinterpret_cast<const char*>( ASN1_STRING_get0_data(time) );
+     size_t i = 0;
+ 
+     memset( &t, 0, sizeof(t) );
+ 
+-    if( time->type == V_ASN1_UTCTIME ) /* two digit year */
++    if( ASN1_STRING_type(time) == V_ASN1_UTCTIME ) /* two digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 10;
+       t.tm_year += ( str[i++] - '0' );
+@@ -237,7 +237,7 @@ namespace gloox
+       if( t.tm_year < 70 )
+         t.tm_year += 100;
+     }
+-    else if( time->type == V_ASN1_GENERALIZEDTIME ) /* four digit year */
++    else if( ASN1_STRING_type(time) == V_ASN1_GENERALIZEDTIME ) /* four digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 1000;
+       t.tm_year += ( str[i++] - '0' ) * 100;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
