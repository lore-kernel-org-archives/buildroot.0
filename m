Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A84C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F387940604;
	Sat, 19 Sep 2026 16:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEAKXjAPc_To; Sat, 19 Sep 2026 16:07:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2C489406FB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834058;
	b=lNGeCRzrK6Jxj/SWC+YW7NYebvWpoH8emE8PPsZGA44eGDbq32/Y6ay1lxXTaDtrkpKH
	 USDW2xvrUl7z86Bke9+6bwK3TDOrsvHb56aFbfqaRgMd1dyubGPrQaWTPSJVe4re+yWa5
	 4INKrLx5/bS7misYWSLW4uFeCOtb3Ga0ffnzkn6mwFK1omFSQGCn7J1TCRM23y1jgPXWJ
	 smq4tT4jlWMXDjtpCfnLfV2A0PfGr8ohpD0pbmPzQrf/cLm7BuR/J8f42bSimOhJGVgL5
	 456zd7p7hOKLNyxdP9Ny3EeGiWAzmT6fPE2uDdefF4SrDrhmm1m/nbjcPBOZ/XJ1JbA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	b=jLFMZ1B66M2mNR3Txz8v50sDYvhcxS0ru29UJ5Tp+Ops0OQtMiPKNjCbJrciXv2E8QUG
	 CsRvoLWZ1j2i9io/PDK7pYn0e10KxgrM6LRamA2CDB+BCrgYyT8KBqZiUgaGB+b0hZAdf
	 AzJ3x9tRZpzP9CY7cRzQSrMzzpKmJeAPc//F93IoRFGZmhEt9qIjuMTeKpXZt/v4pM6gZ
	 3PoGgKlysgHupyxSzBlP71D6cSNSWhJsX2RHy8EvIkGt01OYxxO8YNsebkhU3abKnbrqe
	 piIHNzjRdsJgasfU0kNjObwoUUEaRkcIvJ6BENt8QT3EaLdeJZs00dzkux4ZcVrT29g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834058;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g2jpLjBVqMJHCszeMsHAG1cnV4t8dyclma2rpNDuzvSuwdQqRuis5mP8WcFvkexX5
	 EwNZIOcXrzub3rjImT1WOTWfnpyFmCaV2BST+YvVws4DnEi7S9e04yT/Cc02LRQ05o
	 rfKg0JCyXTQLfkO9klrVWLmpMqKd/HVu84MADR9wdxRxC+xqB4WKmwDK7fiosYSTLV
	 MGfFIR7OASbyydKWzxAfJNUELgSBYlhuwN+Qr8JQGt4+8O86jWqpfUHqifo+b5fJKQ
	 1fL4kf3f6+de+AhyaLnfz0IHnZEVttQFURqA0K+zE3NKWgBWUWbyGW+6rYRyThE58d
	 ZeS27FOyOgjcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C489406FB;
	Sat, 19 Sep 2026 16:07:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3333A24D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1898E606A5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eXvI1f--iM9N for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:07:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 381AC6066E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834056;
 b=LYvX/bXcsOgQ3o6vRaL7y+DreZkqs32b1CuPZcDlpDJ6m/wqEA0SIZRPe0X2sp7N0NL2
 hMMpCYLRigcnQ73vhzRjLkaTaXtrNc5/wSqP4BYMh/g34ejyo9Yayy5KfQueByGxaCqo0
 GHhMrcO3UJuQug/UR305d3v0ggjU/Zlc5sjnTuJU3VIDBYjEFgoEJlYq4f+oYTe4DVMby
 6eQoYf7CUrbq6RZd97hWwmQkN5unbefeY5Oa03nSs7P4/yQaWhnbfpNK5uOPnhsLO+DDo
 g/Q15/70VHmJiHEEKVtxk17ZjMQBIqyKL50Mm1hdJGM/tcBeJmJIRHSfDt/J+VpZOsA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834056;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 b=ijdOW3miGxTG07xL3OS6Oaj8SWz8vNSf/cu5MC5Eq3NGPxe7cOeoJjLtgKWnosax8peI
 SOL60N55Zm2uq5NmWh6uhsu7rxu0O6fC40IgW1QcKADShC7YDIGS7hPb6ZXn598S4Hx4K
 birE9ia/lujZj4obSU93iMjd+uzWZ5MkSWbEKDeRk40ii5IIgXxS6gB2f8tNppxKITEt8
 k9Z4eiHxxSC07HhrUGq+N7JIg441jxXUM3Sq31K0I5SG5VD6xPlNNwVQMdKTEkcKSg1sV
 arBfy7Kik/yol0776XXnncXumHOWd1urYf2imBRV2kqtHSBgkAUXM+rMJROdG39pP0g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jE1U33S5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jE1U33S5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 381AC6066E
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833550;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jE1U33S5bmFFWKCVI3f9bgNSOFVHH2plmc24gZ2tI1JiGgEwuCRtzEtsFCX+ECrGa
 y0sk8tYbGhkKDWGwwL6y7d5Z+RPC4EUxUhLu9U2r3PGhwhrXP1lqsnp4nekCJSud16
 jBDSNDoIq+J9PUEbiSFgtmXWf8y3C1aUbe0VfOYAD951kjc5h3bVqMxhtqkSDcakPe
 tyTYtPbGMQJ8pn7osC7N4YVBkocX+DgnmUscekHMD9a6I78pyDo7kLJ6m7z6iAUauH
 0c0oReOK1ZeDwMhK9LgMSCl5qdBtsshLnl1prCZbgvE+RvWK1E3kgVTQgUHdDOVQKN
 S2gnBVCwh8LoA==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:Ymwz5sRg8IXkbt/f8WXLNajcUKliIVI4VDJyJYj6mdR7JOK9dfdlfKOvpqmbHVKnM4e2feAYVl9yI1Er5CcU0nKueiy4c/6CsemwTXBPeTizb5hHt/OVap79swFRuT7I/bFM+qH65hgupBSW9AI/Sg7zlsdLHovxpSN75odaCfCezJ05y4dcuibzqhHxll6J38HzJo2wP+4yutWHWcEjndBmmke3/f+Jhs6H3mSZjWE2pZJiDGyYDIXBxV8NkTqouqgN6u5EiU1xAQUykTcnb0CxkKE7vyD4nfcIlY2/5pR7i01orvO62XMMlzXFNJJcwYxXHRtRSDigNlPxohvtIKHtqScYvtho/uilBEKBcOiZMyguBHC6UmXLRbEwWv71iAIgcDYPy5PKuSYvYVBmSiV6k9OCl26ga8u40TX6buK0oZlIlTH2c7xzhSkYan7qCQkyCvZk4dMa2GfB4XkdwNFAnJ9+xVBrFvYZq2RNNQpH0MkJBvEIqjCNHJuFkKiiG9hD4i2MGggGlnlkyTeJVsEhkFH0ilcZhWSYlz99NC1y9Hq/f6iStsenFPVLiZxAWT/GMo732Bp7arQzbhJM+3OyAV418GWvlZfa52pDZ7MW4V
 Ja5P8W994jWyWgIwWiygKSjjt8h8SG/pR3t+fPsDBua1AWzT+n6oF4bltQMFjHx33Qxotb
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2534DA4C47CB;
 Sat, 19 Sep 2026 17:59:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSq-000000005Jx-0fVQ;
 Sat, 19 Sep 2026 15:58:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:05 +0200
Message-ID: <20260919155845.5776-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 40/77] package/gloox: Fix build with OpenSSL
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
