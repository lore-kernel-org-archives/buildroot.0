Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A32C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4312940B32;
	Sat, 19 Sep 2026 16:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tluvVG3QYBIt; Sat, 19 Sep 2026 16:13:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6012040B4A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834399;
	b=QSmp6vlfsbbdQ7arsxY/Eu2r6R6AytoiUL7Ylw3L/1v/dgPaWX70QYhHr8anBDds6Tba
	 +X4g74+cq4b3CD66SRgA6YNueeKm1+DnNMilIQxpgQCL+cDvd3YkBShIaTD2uBX2bgGct
	 AAa25sDj3k7TtaKc+9KaueX/26RnbFg133xyCYpCfPQLwWW23KQUIh9bHEVkNmnpw0BE0
	 WZ/j/94RUIDbwcKphcX+Lgef5zSIZzkW2aC+mm5jdvwCqXvY4HYXuP1U06UYBI6U6lczl
	 zm1wRvDbKCo5DCzMr5ZkvQx1aNdjnYHDPx/vKIcYdkfPwEN9dg0CoXtfXDMDFJWAB0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834399;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	b=Zkd8+YcS8u72/ii7Zoeu790A2kBJZbp4Kp8LIH29M3mXbXQmpI/XbN2EHlEx7yxn+MqR
	 NhhKeOzljRZrVtdYBWGnwHtm4xN33nYtdzTTrjzICJpjd2v1nDefrVmzkh1nqrjZ0Fe00
	 bUDPBsgUepXNWOCgXC41siOVkSgdMHgU/XGtmTvFY9yAolKlp1uFWsk/AgpKfzs549zMu
	 s8YENWT7vOyeqXEkgjQSy1RwEC9rdtVl/EwPGJyl8TPoDT3plpOaA2ikCKNBCroNrQ3NV
	 5yWKXWkWaDI3BA6S7Yrq2uyFEJ+hDgP6Sci3hjIvLU/Btr2fMcKlgS9K3xGNPJT9XwQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834399;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f1QkgnBYR0JZBjxFC1ykw02CDSE6tHWdMWAm6JtBnfklOhOuFYfPXOLrqpLF8vnRC
	 ExbQHNBQ2GWaAeQaXlvuxvpKg5IhBP5pfOFwY2sqTOuYVPberIf8BG2J+m2SwC6sZa
	 yjnbM+nFz1DdJ+f7oimJBUHoPc1CUr6pzAALJiR6c69JyY5WFwOIBYcNy0BIn0Hh7T
	 1mbXge36LCBDrGoEBi0hc3+L41/RCzl9lqxOVcJHMWHBDHNKnBeeqeTd/TJ+mu+DS+
	 RDSW7Ise3tSKVBIYNi1nEjntn6z7aEJEnkE63umZHblzaXXM4QB+bIRnBqte9yncs1
	 omnebfn70e0MQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6012040B4A;
	Sat, 19 Sep 2026 16:13:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 72C2724D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59617606F4
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNHS50pKIaw5 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:13:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 524B7606CC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834396;
 b=K/QIPV/j/LdF/LhcGOkwt0ClbOfl5dJAXkcVVm7olJ7dUr8PRgH8HoB6rDLDgoYSIizN
 ul1lqGdPW1RTrk+0b4FhGVuaBhj38LZ61Rgq5/SwZ5yHX4ihRSu4D894X2v7T//67rmbS
 6/gJ/zLWB0iZXgADs/xgOtDRfTVdkIo8e+wzTxDkdfFcA5FvJFkJdzUj/jfZzCR943W+Z
 zgwQ6gNsdspRprVZ/ToQxJDXbGNZAwtrZsXJkOHKcvVx2ub2d7nBR11g3k+S+pygjK5OD
 ExYd5RxI2zFBzhe0QeAavxPSvnmeOL6qvQDxL1lfBEXt3lt7nvwZ9RhzTSr1RWU6YkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834396;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 b=a8bCOXvjN60sMP2TpeasuBFRoR1iL+OGdbLDN5tdNx0uTHriVAM4mTA6py5IlBK9Fgri
 Yf7AclZcBP1YXRHvNj53YmwETRXGQ52M4Z2m6jmHDKtjrS7T+G2d0TYl1TIOTWcCi4dJu
 HD+GSNw3oi2N7dWHDxKqyWjAUjLn2W+gEfwJUycpGbqN+eKXWFnWbyZuKlXTAsNbNdFsG
 VTZJnYxvSB+X+WkE7ghL1OeSsjlrqcqdltPNOOT1f43/UauhMwiLmATuvBSE0aGSo3tbs
 dNslhrwVTaeN6hthENgfLTYa+UXNTCbMW/FzMr5kCVrgcqXFR6PahAB6/PV7UKSoa5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="tFcXQx/V"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tFcXQx/V
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 524B7606CC
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833556;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tFcXQx/Vn37OrdumN+D4kOvWRs9br56REqeT9oOCSX3axI8JHxZYkpNriFMw4kddv
 DXC3SkeracU486jCfPJ5A2pc+v4ixfJHc6QuW4XhzoohjHZ8m7V5kymAMXL92pXAZb
 D2OnOb/buqYm16QQwh+Nd58fDukd72q7SSIbSZosq38YY2itCW0FFqMO++IVZkIqAe
 AsBbLFBXJwftmeRVLXBALN2zGk79uahW7Z2XxB48IgQRVDI6fE9a9cwGY335OLZ6r/
 x4FtfspS361edMTAYsa1rFHr+omtRaTqzt+Zd2uErJHPHlfN5ALmX6i4Mf+2VSqR8g
 6tCTvdxkUFh4A==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:gLp1U+LbdA8wekOT6Hh9Ry0Iwafe+NKMXgOJDVfQG7jVmtc7fWbr14vQBo+REF8KZZeBhrwno+0T3mhLJzKcvCgE7kuBDKmY4WZvi8xoKVe7DFlfXca/0PfTCVwkmcVeWTnFc1whwxY9yDbwOJUfQN6KPuhUD2hvMpDwuKlJl4Kpe8bkzBIkFqF7h/gUjTfJ0HOjscwfl9bxTF6t3ZqjAXZXq2R1GlUfo0QvLAjuogyrlsMjG8lnbRxsFOkose2VruJfeGK90gWWKMaemINE8vBMNb2t0rahkw+O8C2b3qZhbM8sdAwj19LMDJyHlFCj4bPlBk/uIKLjtnrM+t9bZFBkTjCiUkD3/UywX5ZgWpty0Ph5kN7uTH0PneMrp3KrRyphYHoCV0hckzsDSbBjY8klRBrMRA9pv9aKzQRjd0/TcbU3hLw4w95ID3QNUHTzEouc0bOTRUYREqCOXm0t/XmLZgT1pUPTdmQssOb5T0wEpZHwkmNXDnOJzfm7q2wrM+5A6iJRNzBLcrcGfeiD9PtUWFTVD7+Nyo2+2vAOwehynwLG9Lw4/+IB+6c7iPdbWJBK15HfmXWurjuhyczdZIYnwRQrc0wXUQ4BpY1El+o8UT
 qulQ8vKRQ44Q4AdoICQLsHuexVXGgyjVNIWHEmmNueXrNkpcbeg6S1tgRAWBpVse9UHcKksYQ8sBjxgPCIsFrjpPcDgSGUXJ0HG1C5em0dNKxc
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CC649A4C4857;
 Sat, 19 Sep 2026 17:59:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSv-000000005Jx-1zAw;
 Sat, 19 Sep 2026 15:59:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:28 +0200
Message-ID: <20260919155845.5776-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 63/77] package/socat: Add support for OpenSSL
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
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..6c53500d02
--- /dev/null
+++ b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Downloaded from https://github.com/openembedded/openembedded-core/commit/aa435ebaaf7446ec07a88586f2de4109e02a2d38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data = pName->d.iPAddress->data;
+-			size_t len = pName->d.iPAddress->length;
++			const unsigned char *data = ASN1_STRING_get0_data(pName->d.iPAddress);
++			size_t len = ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
