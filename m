Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1672C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88C2240F27;
	Sun, 20 Sep 2026 17:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TuanVhwIqOf; Sun, 20 Sep 2026 17:14:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AF21E40E9C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924478;
	b=BEFSVfe5qi7mVdWu1NQfwSTJAU5yHCYiqQo8r4mbJOWm+0tHdFq0sGsQ15RdIGiNc6Fw
	 mojF6XMK9OsXOo1/mYn9sFQc896cGlddOQUvzairjpZ/MweL2bDWvff0nU1iVkuNJK9Oh
	 9rRw0llYnYrqYPCg5/SVwtBDa+QT4pifxOn1N6Z6WTsJX+V7K6GHp+ThOYCMdLOGPGS+m
	 IFrcWFqZ0ovsl8fQjNkcoRoqLdFY2xze1eppGBzxz/O6mzxRcnQZmg8fctfNQySh0ZLFP
	 wu8NlkcI+XJls1mZ7mCCD8osZEADBUVpD3Pv9+Zj09MtVWxlfarZzuKzNvS3eFlzDFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924478;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	b=E68+etKo1JcwGz4o3OaYqCqqqa9EoChXOCD2ofLegQ9v9xv8CiejW4S2Hi/xVt3Elj9D
	 oMok8OcbCl6FLoqsvIpz9Uc4NMgrUuBCFFDyAfT04N2lCPSlEyf0qXp5MSZptlw8ufk+u
	 nX6/e2tM1wt0oaJPVw2VPFLvOr8S6CGP5rv1u7e1ZiIsi/ngIeCx3UTS/epT1a0+Ih2jG
	 HalsrmOUZRYhILcns8ptrpCaE1eYCrYXMDxfeHseUQSK7C5brjO4GYeOaQJUNrvEpuwwI
	 qY3WR5/dnuo2lq5zKaANpGBP76/3jKe/G1YCO31ZuR++ntGLBiDOukxGJlW+efQhiYg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924478;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=djOkh0ebZB0xOLq5qFSjnDdMknmUQFPDO1aDufVrboz9oYKNVvFzkzQgaAs3qxCKF
	 NUYRGmpl3kT6XC1iUTMgbhZxkZsjF/P6zQWRFXXGX2cPAsgySFvp4V5SVhywyJYGUb
	 dmMQC/tWIR/lFXTr+nNcNo8ZArbmUyzcrYmDP8rjTap9zBwqBk4uCzDdOm3KcX3K43
	 VAKDFf/plazvr1rpGsWCAJDKJnYGQ5bYOwnWS+AyqEgAKInTI+LJ3IltBVEVmSYma1
	 WnwXDwdxnWGL8O4V/Mw0WaqtX5/knnmbpOIzPRaWxvFwN1vq2OpU1/1iFs0z7HHy+K
	 5c37qUTy6zr1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF21E40E9C;
	Sun, 20 Sep 2026 17:14:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A2F37A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AED8880DB4
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iespxphNZBQk for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:14:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BCE4580D29
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924477;
 b=ZcPZY1NjPxYny/srzXpEcQxgGYc7IeTfrETX91MLaYszn6hrd7+4rgG3nwbPnaW8+wM4
 F9gdwk9vWKfcYHMgDJvDeUccHzxD2fghZ+7uyrnQLoIqtVikEkesmDzkKQWJaj5TM5JUF
 8i38AwH2bztdvmkBPP6dF6u8b7UsgXMwfcJXkIIXE6QwQ3VHARMgaJ62Iyke6iHSlvnxo
 WVf+vv7TJ3ynzSB69fLY0CLAxRrifD1rW0n3Nv6xVwu8FmestiICUHBVlv6C4hbeAVxDg
 T9fbxsaMkGeNtK/xWe954yVXk+A93+s9gnt+v8ZU5la6yl+RoaC7EdiDOqSE7lqRbgw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924477;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 b=C0EF92mIX+LcOnZgWcMk7xVw6tgpCsO8X5AiU/dWrb/TBsSiqauPZ9y1txzfSYJ3HKo2
 ZumVasnuJN8WuerTaMjQAIt+wPp+V2FZXakj9NUYBo6ADiV8vXMCBMAGYsDnO2bVHg8n7
 4GbJVCxfq60VeC4Wuhn07xrdmLbrpYPc3evWWBOxtdxaBv8FFmSiCRFYZX8bwlR4I2IA/
 hB0gZyOyZbpuq2GogX1epboZwsbqqnAdKYA09rAzUoYodbTFCpT+QxTaX+TCRTeKcQ6rJ
 f3MXoL64JIY/Mzqb4MvQFGRztmKBmh5EoBC0JU5fW2p1HRI2R3ewcdDrU3DBKxJwAMA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PqZfMf+f; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PqZfMf+f
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCE4580D29
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924152;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PqZfMf+fu6xV17tDcEl8F4sI5q74BSb8cFr83E4PQXn6Du506NP5sg6ESn+Oue22F
 XHw6QjvuHpMwZNo1hYy+uTMbrVtW3DfqtFQ/FN0RyBsYkBa6M3PeGQOGINeIVOeXkA
 JMBNl+bBnsR4wwBMQusa3mXbK5cVkIWV6OcoCTttmBHuIg1nCfqj1WCRG1FGTssIeC
 nXz62yl9Pb1EeeIcrTA0wkhi6jGxky0Li6jHSVjMRgXmvvMmGtK7FRzlk3p5aFJkLH
 BC7C4y+zCZrJ6y0VwvQbCsxARqPrpAcuu/biI7lsWpN0JbeuSYJeDX8Pf1zNZv1eC6
 4aqWz6/EoaeJg==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:S5H535lfLzN5hrNLM77FiYSaAf4ZRvNBNcXPYnYPkfGBK/zPkEZx+0frbFwInsNVhIpl+wjoqYDrgA5S4QPcJ59viE9J1/chogstRUVoyvJwVuMTuRst7ayn0btX5Vzo11qwE+g+bLlzs92i0kWdca8z1YAsj6NKwyNdXoysCVvZ+IndYpvyDzqTIxBNStAPoYwTGAquJv67uGLlPIc6H2gIIg7VQ6Qgga1N4BbkI0xdd5Aux71FA14rm81a91FF1b+RfTyZ5xRqCErOmKh3GZKonrNyVdBCUM+GhHqPBFzJLiObeyCf0K7jh92Sb7drpMLMrUeZNIoJFBCXRxh/UaToAKVfRULAvXUmryjOO2WZSsZXKephiWqV85iz7JUnblJmauFyP2QKytBAvchg4ymSJRjgSmsPLV3yAZaunrfiy7yPff8Mn06GB0K19tZ6Dbow4p7jr9onUzriKHGD2UzXEb3IK4e5+Y9PerRtnyRrugBFyhR3LXIWVf8vyPahL9G4eB8AxWJUsOZuAIPfPVbtcq3XWOwGk5jJyd6Au3RLyyhDGIxGzcq/57lmUDL17Wbvd0R/tg8WqiaVBtN7h58D7r/c7GNW8s2oFuW2Nzv3sU
 LKky8EkMidtFuFHhrgjD+diVamPSuKUNJ7/9xfm2fT2fIcBdkOKwIoR/t7yyIBF1LmRyKwtg==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2D307A4C4881;
 Sun, 20 Sep 2026 19:09:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Z-000000000o7-1Djp;
 Sun, 20 Sep 2026 17:08:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:25 +0200
Message-ID: <20260920170815.240247-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 18/67] package/daq3: bump version to 3.0.27
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
