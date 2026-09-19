Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A324C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51B640B5A;
	Sat, 19 Sep 2026 16:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7_-RIJjAWK2; Sat, 19 Sep 2026 16:05:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E0E4B405A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789833922;
	b=BTSocQ4MK0fxYdendFyKjn+l2kdWn8tsfZaGe0y2/D8epqw+Kd6o55c3tdlSwB2ICCG3
	 oTocdZDJpg9H0ssvwzGnS7+DaOU7xRE6Du5v7RR5YOKqKsnxS54WA8TQdJKgeP/ruRioF
	 jRL/TgEYL1QO5IIKBraDXP8v5jKhYbDLHwmCk7h8/DCa6ld3Sn2KLAgfhO2ffq43C3QyV
	 R9YrUWa40qo1vS6Ejv25vBgzInWNSQrV87gXrIOogQTAbXbX8M+5/xxO7C7ORwRPl9+bn
	 k//KndZqAAGHujoOYB82VVy2nJcSVtI0IgZoaanGYkd9Bw/cmr+oA2KMDekarMwOsuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789833922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	b=OBHnKkwVTuA1cRlne7vn6SQmOQOB0tUfbqBZZgO+7lMPj49YP3J3WH6hKpLHkV0Ubiuk
	 wgH4EhuHazMHbbSM3KIcyknJu0UJx+O+dM4Qvgwe3hJWw1ziHos/wtbLB/NKEvv/aE53N
	 VjsT4Uq835akYn8Kv8Uffg2iGPKXHtyL2Ctp7a2KcrV9XUWku3bTnEZvysVHZdZh/kWN7
	 lQtINQflij2MKAHUSSQuU3uEL8ZdHPakgA8kvNQtce8BD+hJaDexoZ58eVbM9+2owP8ag
	 Cyeq6zkl71U7FhUkfxPPQanhmP/6tqo+VKMijQNSBsHIMUUs69jDHABrQb5jprSfLOg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789833922;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WmlCDLN46vx0rbrNGoUqjWK0jEkK68JvyWIBv2ck7qBF5SoAyWbRuVlrHEdt3Ohp6
	 IzxKtaoD+IXqkGJAgZ7MXJfyVkK5yZPZij6P9G0GQDzXPyPPJDV5I2RlpXWnoNQxty
	 Fbo1IabWaS8ITvqcLNDq1XUEpDukli/NqXoBzNNNM8O0BlDgXIiXnxF8cLH3vGlqbi
	 ES+wMEWTDf/+LI9p4g6jLZDiQ7+8StRd6lyhx8+ztmRsFWnzB38YIqZeTi9HWVLQOy
	 dF1ty2MOONgHiupO2dIiDLEZrWNzAzCY4ErYVEVPaEb561HViwhvqOTmZ3tR/oVC5A
	 ZbUrevbub2M2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0E4B405A2;
	Sat, 19 Sep 2026 16:05:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D61F37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3479400BA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eTCxLfElOMFw for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:05:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 28D0F40026
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789833919;
 b=YAvUHDvjLqzKKTcdlm+wqsc+4ZdEJDFcGNBmu7KTC8vDf2xL2d4C/+G1SdhI8jIQGnOT
 n7EvhqAK63E+DaPWDrMOkV1+vslDMygo7s+oRb8xQd35pylSYX/F9Cv5tryxXgbr1Ff3c
 lOkh4Z73TWmG3jbAV4Rzkaim9sVe907l3cwpMp39rHxxGj4144RR8QX/soab3pO13Cijx
 ksLiCQI7dY6fCOPZPrJg7IxiDr+JscObFGFM1ZUPScXkBgfniYK/B8NOj0Nangp5oAyHv
 92F+xv+5dRf4Y1J/4yGn1tSEXTtf9hc5QVI1R8i389wf47s+5pyX9f+VigH29A9nGGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789833919;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 b=R3d/mPyM3staruJnExD3ZeA8VgKw0II8E5WwscGf1EeL0/o5Ou9jCfORWOc+BbVUeyS2
 6Cphpu4bMY6RatSzlhPZKJttD4v7lya2AGhpE3QJsQF5UAJMBpH4quTCiYqTo4/YJaFpH
 Hf7+f9ZfvjdPtk9rr+2VV3WPCxjDeLxY/2wULFxTsNVZZy0aKtMNPb9Bo85Jigbfs/bJs
 r1Y5oueT0++bO715r3cBnEtkekvshE4PxN9Hcu7K4QNILGD92bqO750r51Gm0vSfyFpgf
 d5dJqGtvA5M/D8atbw1Mp3I8N3MrsYvytQ9siG0pUN467BR/VnXXRCrEYGPZEug+nTw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=LmnO4PI+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LmnO4PI+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 28D0F40026
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833546;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=LmnO4PI+8FhucFgKPcFkCIcFXBuO47fvbriEoIh5ThpvpYlUD09CMTlarbrLZe40B
 CwEMHS30s/sRsb21qVTgQ1CZRwxVLxV7Woq6q3P+bSR0Y+hnoAoqbB91rxR0deUcUH
 GPEcXNEdFESvG+V8N0ab4v7epZTz7xYgCOlNqqJHn4UoZ0KG8vLrZFWfGtOTZ8YPIm
 LuL4Vhsc2MXqCIYAcEgMDqyY5gTqFs7EonhWTnDVgLIwAXHOYic/Vh0IzlubP7VxS5
 4831f5jWWpu4pgVWIi04ZpLRLyWfwBKRuGh64CoAtoSZ5mjNV/f+HVC81rx5LXhLaH
 C0v0MkoiZnYRQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:RcpRwchPKh5exZ3kmZ047Vytl0aHsfGe+pI0uP1JX9IRNLKzH3aLR/tkmivHqRrPuHnZGgKMnsvbyk10LWLwpflqR5NTWjCV13ALFcMwrUNNCdebX84/4D9pF6+ALO1J3q3luJRmED9ajX3nRNlL2FPGSGvRV+z9HeKzWLhRbkGPiPHk9KmlQTuw/HeVnE5VB8N9oYF4suB1RIVwdVWidoLZUvZscRhdwYVYRPEZKZmVrwAkr8vRdVK02NDCagEBB7N7yzDfZnoyyvyhIuQv06iRampBX0SVzHelKCjvFcZ40TVu48FFLA68UKtDQFxwKVJoxfv7ifYNIDSkZnbsuh5p7b9btvgcueG52D81F757LCt7NPA/+cHVbGnwNz1fmkWbaM0AroIMqNvWRDiS7ORXpydPUKDtsxEFPkjZCQrkJ/jU6FBBindaNg6alL8iI631HtON3Re7g4xfif2+CEle7QVCv12BL4q+QgN3T3diP2AMHod76HxPkNuXC1iflWfj2Ju+84D28srHWvKhrLv8bk4ZWA9CceddUyMr/GP3JDBxtOSnwsBJqmLV98ZrCtZJY7t+w2CEC6a6I6SL/gUKnrvuoiuGqkudwrCvd3S9Tr
 eIXn1M5OqL2W+z0WeyAcOVFrkotYaHdPgofQIUus6xIPCCBqNhhHRB/QMy+gFEOji6Qis=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BE2EEA4C46EC;
 Sat, 19 Sep 2026 17:59:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSo-000000005Jx-2MSb;
 Sat, 19 Sep 2026 15:58:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:57:51 +0200
Message-ID: <20260919155845.5776-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 26/77] package/daq3: bump version to 3.0.27
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
