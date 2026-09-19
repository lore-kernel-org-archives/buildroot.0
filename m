Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B693C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCBB3606CC;
	Sat, 19 Sep 2026 16:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IBYnKR1bkbgg; Sat, 19 Sep 2026 16:13:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E45C5606D0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834423;
	b=ndX8xT1IJU9CvdUV+nWod81A5JQwWyLPWqK3VoXbw9MUI5SXs8+3eP7VWP8xk3YeDqeN
	 nikpgLJxCswIUcDN+ZOuz9/mF3UjkkzuIjN3Z408goLXQkOfHQbP56un8jdm9q0cALhs5
	 2FSxcGKKrcsl9nfj04cxWWjL016vw8G77jqyMRPwPgl9PMmtfFdts9/hTDFtO820stDut
	 l1TxxH+bdHhMA0EP8kkABUQEUoiuUCVUb8MjZh3m47cqEUoTN7mc6f59Z7XGPqAo0wooc
	 qdo+kZuYMY16KBwmGmeMU6342Zy+g60O93r1jHO6RCQ3iAYjkZzuadMpOwI3kSKD34g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	b=ovwkGX2cCYp/eYU3n0CIS9Q8ir6mkmxa/WonYDrtgOI4h6MdaV59p1zrmLoEwOxeGgAy
	 eIqNtYfwPUSV7OJKltCZC3GFgDzokQCSWjIdJLDSYeojdrcAXfwTtqQSK8vNM7RJB5zRz
	 GuiDmiYV05q/OnEU3RZ0FgE7LqhL+S7taj1dpsCA7slcyUn6BczGun/7j/u1eT4neeys3
	 rfba8ahGNUJdP8vJw4LZgzXiGEJFSmPlW4ozAHCH2ZvULSD9dgV42TSdnH8SYg2kLIIHV
	 13ZfH2xU/ceNWRd16h0MYulwJm25HEUpy6DEDN92ThafKSM6nx2LA8PD3aARCVrpgGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ejtDPHeF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834423;
	bh=+YMtYojRHSFImfqYeSwrtRl5pf1BSIsi+gppB0P+/Dg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aVDOVC21/AxAl8/mSgwGeCcnpGYg8ejAsm9DUL4DBJxGY+wV3cwCtuNp5WkSqfAu6
	 AnMROVi0kcgbBkdMliqy2+pedbKqbR0757MciK+VEFKLp/tj9SDwNw11wX4Uli9iWQ
	 NULAvkLC5bGk/eL2oUqW3lR9xz/bAIh2uiSfZQs61MA63L8tiCSCgOjLNJpzSX0wNg
	 YE8gkPSkZgYe64zcN+sWyFb4J9ejf9EeNkD9YPaRZrGoQJ1iS1F8Ym3BViY8LBuILn
	 5P7zIudniQAzphodLyK2RKRI/fKKLYwKsiHv/gOB1H01uvKRYYhjX/axdggP+68FMc
	 PK890VLhBsodA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E45C5606D0;
	Sat, 19 Sep 2026 16:13:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CF14333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C4C606D0
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0lVHUW2NBNX for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:13:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1F190606CC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834421;
 b=UavzgCbKiSmGzAxuSBjdEeTKAap74xl1Q0dmX5G3QwVx8fIzfbNKvYFxH17/zMH4lNr7
 kCK3JSw9fZU8Ryw1/g6ZbkPzMtm4q42XCXifGisdeQJKzgWTpgQdqwYhQvYYkQ050Khbc
 tEqGnqylVAHYL5QGwsQz6lwXJ3OzSlgFhXk2NP4mmZMKvOTmHATIW5fkRCUmay0JgcWPT
 r+t7AGzvjXylZRP4FRm+Firq8ORKNc9ye1tLEFBKmVT2r7h0J+OMFf7PsZzaINE2pAb5e
 1jauxCLQdald1Euq8nqAvtZuaEnKURtfe9bn23Ac34P1rT+P74rbeOV1PfIG9fnD+1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834421;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 b=HrXilq/0wvIgHeOgXQKSRdF4CnWEl5oHSVs/X9u9MNQ09I74O3EweNlLlwkEeqB675qi
 hrEoazH8njwooNPqDky/OBHyea99/3O5c43J99El1GZLndHBgVwTR0gCOivU7zTErGlTi
 TXAV4EPDuYZqUwj90zYsI+dxKXMpiwiXYhvj0XEvw010CwPfCizDrHRUUghAsivYduMPN
 ubEi8N64ULBZoc6APs6lta0IpNR2YjV3er6/Z/HjYBmgEj5HXiC4sX/mT/TL9twlFP7Nu
 oJkVVL0gMuLySxlsPl1glnoAqArXZD8dDKmH8esJzeLB8uqk1SkjR/dGlf4LdINf0FA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ejtDPHeF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ejtDPHeF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F190606CC
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833557;
 bh=4KBj423w2Xc6RaF3K0QKADLAXRJUHEl+jVNFcgMSorU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ejtDPHeFuJa/bM0Le6fc5XL25MnaJIFAZVSl+/NT5SmLxy/Bz+qRQEHj4cRkJ+ADw
 oxzOPV6rqGaTeRZL8PetnwI+xFm7OJ022KcjqlgeONbSrFpt1GUozpRmqyKGxDMnxG
 iNRTRbKvMj+b4jp9RD0if6lqMgUyvfxNuaL4FBbQtmGE9OxTz0NijN7TNS0KzVIN07
 b4UMV//ABUenRUEs2RRVfYImxC1Glu96T/mX0z2yjSL8x6f8Nn1hlrgNeHdHgDPT1G
 fBmvWCfAB4VTOX90OJggoYC0nSCauxafnmer0/dvT6GbYv2T2/gYtwZjJXmjNNnRkE
 3XBvtQHHqbuSw==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:0X2vO8lTKrGK/RSXi7PZQKCNvV/djeCLYgcXIwnHnb0Cd7x00G0Fb9f0/KF6QR86ndmeHph/jKuvuLcjvSftYarbL3xRh7lmj4+FR0JS53jAQcMekNYeJYe/DaddJvgn/alpagatelHKUaXLliNKOuG9Wdh3OeOtKarPotoi0ygktLhVJ59su4FhEaNDH39Vuu0X0eJTjPf1M/9cp7g0oV8CcNtKHLX0Z9kBLkQBKGGS6w1DCOIILUJ4Tka8CJJIF0+9cuOcsDjiuClqXAuYPYxvSAw1SooCKJkPZcKjxosvcjM2p5xi300XJO7Lnm0GbZUcKDBL4vYzIdNbkSbhyGtmAbj+7V7DlLgf38AhDGDGY8PGrcVDcGVMZothByYj89PAgJAEVvOwAuWpb14UkSGKBComIsNsgxAKuehK98oF2wda436Vp87v5VAUyBAhoDvcuGptL1313aGv3mRvQekrofj+YA2Kr8ouJxEHKut3A7Y7sGJ90H6ZnbiCZ4U0dzgddBg0L/KsSOHr7arUVLfkQlazh/cmsJli7io5EAAE8UDLKJ2zLh2XSRs9HdyanJdZqZ3eURqTh8gma8DSx5F4I/K/JIHMpFtza4Lr9nn2ID
 8yapavNeUHF90fo7kfM67QtfrUWOJ/Wn0qfxF7482BeDpzhVVFs+YAbx7xl/trzbU2ye+shymoWnBVMGx0HOQPdz9XCrqleYC4Xl5s9ekV3he1
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E7B84A4C485A;
 Sat, 19 Sep 2026 17:59:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSl-000000005Jx-2wCa;
 Sat, 19 Sep 2026 15:58:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:40 +0200
Message-ID: <20260919155845.5776-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 15/77] package/asterisk: bump version to
 22.11.0
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

https://community.asterisk.org/t/asterisk-release-22-11-0/114073

https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-22.11.0.html
Security Advisories Resolved: 0

Switched to tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/asterisk/asterisk.hash | 4 ++--
 package/asterisk/asterisk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
index 1bd76ef865..de4da24559 100644
--- a/package/asterisk/asterisk.hash
+++ b/package/asterisk/asterisk.hash
@@ -1,5 +1,5 @@
-# Locally computed
-sha256  373c98f4d4a1b923b42def0aee03f4e36aca9d1c244a8eeda646da8a97f89663  asterisk-22.10.1.tar.gz
+# From https://github.com/asterisk/asterisk/releases/download/22.11.0/asterisk-22.11.0.sha256
+sha256  3bd5ee040509a3d3cd9b1ba9520c18e6ec0a7e7981ca68c457dcd36ba3c54d94  asterisk-22.11.0.tar.gz
 
 # Locally computed
 sha256  04b2eb1f0f01aa0ad1945b167171843448a51aa6b7c3e806496d434f13a112b7  pjproject-2.17.tar.bz2
diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8d03f2bdde..7c5fdbaaa4 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ASTERISK_VERSION = 22.10.1
+ASTERISK_VERSION = 22.11.0
 # Use the github mirror: it's an official mirror maintained by Digium, and
 # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
-ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
+ASTERISK_SITE = https://github.com/asterisk/asterisk/releases/download/$(ASTERISK_VERSION)
 
 # compilation with the external pjsip produces a non-working asterisk, which
 # segfaults. The reason behind this is unclear.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
