Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31329C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F342460629;
	Fri, 18 Sep 2026 18:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g_IiVvImmcod; Fri, 18 Sep 2026 18:48:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 23C3160E14
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757294;
	b=GUtz2Ll0FEevlGRI8OYMyIgrAxd9R4P0h/hLp349HBWnUA4AW55Eiw0frMDxAu7tpGNg
	 5E8/6XvM9Ny1ExUWvFCKMIS7aJx+mdmgWNRTPsD6UG17QlUzVgbTHQzufa14NXKU56gfE
	 YTFyGmo6pUgDDEYnXyuRRqcS93ewCXr3Id9FpAXvH/0s0MKRlZj90lLj4FHW4P0+UfQG3
	 pPIYqjTAZQ/e6GIdXDsJgLzShCXR8JWxO50O84iI1WbvzZ2ceB7WwpieKY6jk1d4P8635
	 CXsOq+F15spKq0ydq4IB/N4BMQa/UaEVVtU0Td2AI17y3o4ljGX7yldw+kAqRV/VrNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757294;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	b=Rd0jM2dk/IFR6LQ5LNURTYUGZqU/mG9QUTMWn+nM1nA/TlfskudKDmxveFBHMlAeWjIC
	 kJtdcfqfDq9pKf1y5B8mMIGsiMdFS5cJVvLc7EvEA7uUsId7kHqg92QT07UKSS1CvF5Mv
	 2aJjIdWgjpc6Vnud5zgTNhWVV52aX1kYkOi/pv2+sKGVV5lncFbLtFEQgvVBXB9M6Za58
	 UrBB/2k24ztanASGtwZX0GmViGZLwcSo42bBntpzE0rre7s3707lsvBcXJZiwwO0+K8qF
	 /UtwFmlCtF6uXdDIUyKV8oU/d/ZUPKr6Hy+zsRy7Q8sP6NEDpsgp0Wv7eva2P03KOig==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757294;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nymGHm5iIjuRbzqdkaG2YQSK7ISylyj2FRfJhpCZJtwEca+GQuXv8OF7bPbtxVn9w
	 k2sHG1XzFlse4YJ4tW2yslBzRDUauHEyepfsMRrt59dW2b1QEOkxG2kTPDRnyTZvlx
	 fkPw2KyZTQ4158as8q/yd7lg17f8X2h9OXPdQ0gSZ8I+yeT6w4zBL36HKC0ZCDSKMD
	 NNQh2MV+tv8lmp2Tn4TDzVqBo29xA7yiTQw6/otSFKr9OvlC5NVj4nK2COuKpm7Qzl
	 VeJRYUcw7Sp4FuiBAbaEohnlmdEQYg3wa6BVZ5794GTcq61p4aYsRzMdFXiMwekngG
	 dabTBX+PAH24g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23C3160E14;
	Fri, 18 Sep 2026 18:48:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 326503B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3027881233
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfOE4Z8F03mt for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:48:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4D971811FF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757291;
 b=k56fpPo+S8/BvPTKAaV/CaAdvl4+pU289zbWwuR5sPX4HRMJF8PhiK+KuD1dv/Jk5HNn
 mjZ+mL4NFTxnJpR6OCX6duIQpTVNUf2E0XRgH2SKq1ZjnKmZQZ69/Kdg5Mm2bUCTvlOUn
 h7xzk706GAkmNF3CRfAwBLXn3bTrOt+IVjrOj64Jk8/4lsH4hy66/pMoijKzPJonUmMmA
 jwISRaMadsfC2g31kA5HkGYA7IIMyLA7gKOWM/xoOHqEwlkrMydJTn0EMYWW55I597tm8
 TXIIgdJirqJ5/pABtNg3BKNd8fKYiTTnUWw4f58w1wRPZan4cN+2SO4gGqlgngfhRUQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757291;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 b=Y3jsc5K5Olj9WmCpvMzOOe0G18pgR5oxWu37MUhQNcAQd1D7E1AUJM6GtDFPEf1UQ5Uw
 p19YEfxKzwRCa3lQXb9VaH3UI5hkbAAYIB9F1WKQxksRplJObxOrptm6VUf3Lf+xsVVFb
 EpZ9ooWeazGgOj6lJ63aUwfGH+uk360RJdjhVIo2Vh1Pgvzih3uisUYMbjt3+bVG9I4qe
 RUIsVPKsIcTLYh8cCSMxvLTe/KNwckXJN4J8JjjnPAmI1qqGRKombdcwXYwjq1kgFKT56
 fMXHDMvxewriYClwJpJV2iNHS+CrYuddeuZZSrSHAucKW5mbFc+x3J/4uRWRCUf1NeQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=onvaDCW9; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=onvaDCW9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D971811FF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756929;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=onvaDCW9a157yaivcP5YHnXkXHjO1lSQXKNAMnHSnT939RkBdwPb3I04sxSzNvQuq
 z8pGscgReF34NlozBwWVoZxMd5IIpizU6DnwmDKcWJz3+mFg8sf2qs6hIVeN1Y+eHG
 2+DzNoh8LxAIoQxsHUTfe6Uhwj/uNks3SoMBIyLjsNsaM1yaMhq3xAytzxdXeLc01F
 MKOjsz9CZnEfT51uHG40BAhXoae5BBCwFwXrUnjn2U1Io+n/NUlk2ZBKqGghMqgwWH
 WKm3sDaawQL93Jfh0ObzkaIvg8liP6piUF41QH9WlxUfoeFm79PQEufFxg21Pzm9ci
 sZU+8CoB3PXMA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:aTIgdpm4iQk0LD7lsZwCauHBxPUxhb4Y9w/O7n1F4xKFqyW3KEM2TUAfk5GtoQwsOGikJ00smh0N/YJQt/E4d3hX1cRHxr5j+EE085yJDB2iWV6hS18jOqMfDuMs2qq3nbQZpn07CeVWCqQYLeRzTYDZPem18dDEcDqJRhWcd80GsCHc7nfWVqI9LALcgODApVsCpleZc2pxgnaj83rii0oBX3CNx7y8SzuK4Nqvf7215Ps2X1EmvOsOOvMKLc5htpIshxu5D4gJIBlYZcCYl1FU9462w57aPkiPzuFgUh9TK9yhPqDdbvqFVTjkr+z1Q1d1/2kvTk3Va4zWF37hPXGRBoF/6Nje1Db2R2W2EJDqHYDMSqc1aGFqJhzLoC0XH92QPaGfSMYcKDTq/uGXJHNLHa/uWfbArAxDMdeVnab7+Dm0MSGFo77H6S7DDvPSybWt4qezh0u6no7cEueZG5XAn2x5z47hQydt58DvGSDpjOn9BeWO/zvCYmZd5Fcwr/D5DLT2fW7AvA3NarLumT69tAvSRwzOqiV0HaccABNT9uu3J694y5EcgzlGpsJPJhpjYdlWWonTTcWR17njT3wFOgqAeIszSezz/nFNMGus9v
 N1lZ5qP6j1r2hDtFeVtnqZxzEkEBRg8OMSg6jT+9Yf5BWunZhA5C+Jlysvr1A3Z61+kFv7yHE=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3F1E6A4C4709;
 Fri, 18 Sep 2026 20:42:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWs-000000007cB-1hNd;
 Fri, 18 Sep 2026 18:41:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:42 +0200
Message-ID: <20260918184140.3631274-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 20/77] package/daq3: bump version to 3.0.27
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

https://github.com/snort3/libdaq/blob/v3.0.27/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 524c0eb868..a81ae595b4 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  651e38a2737d179a224bcb01d8a06300667708ee614d19a8b411fdd212cc035d  daq3-3.0.25.tar.gz
+sha256  03fac3da27e3230a7d26262f2480cd65a409cee3596c6758a7f9eacb7f24601c  daq3-3.0.27.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index ec3f4ba670..43139ee065 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.25
+DAQ3_VERSION = 3.0.27
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
