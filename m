Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F4EC982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15BC6606DA;
	Sat, 19 Sep 2026 16:09:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GlxzXp0WMKzV; Sat, 19 Sep 2026 16:09:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 31E2C606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834147;
	b=LGP5o1KOJDTAJ1opRKdL8Gv1Ge7Syg29LUSmLXN35nxx9+/HBHdLf+GjeQ8EUsVS0U00
	 sxHpruZNWWZcl+T8fUwKbvNK4rpLcYp5ijhK2ro/EbxcMEeuz3mgDzk6HDS4tov7u0Qr1
	 CDMfbv2NeJLzHlbnpg/h1m6nUhMKEuFMrNGcD2H1b4h7Pn9P3anYRRMq0zSyyMxCwZCgP
	 W0pyDtyJp44QPf1KeX9HXLZa2HKk1kAqCyEKpgf9PMhaeG5t6Mq/7AvUIof/lcOoa8KnV
	 wHY4yPSgjqbkk3BL4ar/S0/1T4hveTFES1fx2fg4mZne1AUrdyPdeeBQkfWxhVDvTow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834147;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	b=sSkD17tE7Ndbw38PFKQsG280wvT6Xkf2AcQtaOI44c8Wjk4v7CfAeeEbDH/Df1EvDJhx
	 5nWaq7Uak5hhs3ez6GLDxl3kPHUBbQmwWQujuFfmuF9jKn5TQK4neJsNheN20l8DZbfk2
	 Qc3f161HySRE+WNR3/0TI9fgQ9CBM7/MaBQfmtz0tacxFA69TljZSYssrW/0uldW2SNQQ
	 vfjSOnz66925fMXj4r3ciVKpXkKHBbkGCduDrRhJdcgf+M2DlD4Ai3wVtLaTVF8kMOo1X
	 iLvkhf/hb/WO7RnyYkkMwlDRNcnocjjZidHGmNUkvG+oMT4KptYEQEMm3TYibdny85Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=rYRMEJIS;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834147;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AATj8WhRApxYby2oqPuwmhscuDp+8kA8DNF1fKL+THpmzJK/Qvu+K4tZwRgDv0iS4
	 jSTJNwYfwuFptaSK3YKSIti+Dgds9fdP97UXnWefEtrYRUS9aQNDf/n4ofOj92QrT+
	 Fdx8fXbS0RJeLBvzgi+A4nOQKPs5Pyv+b8fucZZZ/2IGECSrbBbiy+3y2KTCZebKbg
	 LCSqc/E8h/lDaC3hIkp0fe78pIsD7gVN3ry/AS/BPm4FOE2VyS9tYTg3lwx/AO7S6F
	 5vgCjUs0HbPc++LeRbIFsLJ3vJQlUue21EBAEMWpw3ut88kW6/zFYzBcLIh1ViqI/5
	 hkIdXA5fPuPkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E2C606C4;
	Sat, 19 Sep 2026 16:09:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AD9F37A
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CCE7606C4
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_hncqjo9eSm for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:09:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 83F0C606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834145;
 b=q00JOu3Wiq2zjWMmu6ikVq9plVFEoRlVG+dwDHiytgYV2pP6LcDepVPUpK3y/lbZrNqJ
 p3jaMNnW57KomFa0fzjV2//ufCC0fCiEkfQ2uTvc/xGNZKMifKkFWH12fWTqU5tnOjIU9
 +vJ1PfWwgbTxDAt+1XL9AA9/WTe6A3Wim9DPSqmCgl2g5KE2JCk195asYO8NhJOiPZOEk
 yLIRIzZ+ZzXBQUyd8fXo6Z5ukzufvM6xDE4K9p/ULPE3ti57yxI/Of+GoS1UL5i3RH5by
 MCk8rr3O8/BGnG9Cco1tFq0/hnDgeanyvfDL6Y54YAPFj5pfFe9s6I9usHgRvqzBwVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834145;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 b=RrwjhxxkfoNnpeNh5f1xZrvNLG3T8Lf5PHfRkuX7R51wZxjOXiFT82XKZ55LswiblWw9
 ekMhg08KQ+hDhc4e70roxUJiZBiq+3Q8zK5giNnmkdpNO00DR0fhjeCbnVHBawNmcbpZC
 UKK2nvLqssvQvGuzJZm5MG1MJH+QcrCZSIC05MXopExZlJlA2ZtXwFWqZl8ft0ok9J1ex
 vA4E59P9suR4F9mUL36lV8tgzlBfS1dkmWDTCYZnnxqdC3HYbX/yqq7C1Zbo+qJCqL/Iq
 Ab0x13XxMjWvIliYHKHfB2HXxhG604Cr936+gJQHfbo3AbPxnND39l0yDLJDH9CNykw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rYRMEJIS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rYRMEJIS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83F0C606A5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833549;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rYRMEJISXJKtbTq6wDk8QBDS1x44XvYVfbm7c96fd381O3IIbuxbixVnPIFX9Swbu
 LeB3iArShzC0BlDezyCy862CUWt28izEs1Ooe9LMrRclQV2jAS9dCljMujEz7qkcoT
 Y9q4Z8R5M6otyGRtFZmAhrNVUv34Hz1JsiZvB+t27Z2m/uuxrg8OKZp0ScectLAQ8P
 wXV+F+od0mnmATJyTGYezloTuTYj4VlqJaAGKaYB+W0HkBxWBnVJnpETA6wdMzCysk
 37lzOWI0SJ5RhibCqHWU52EM/A5uZGNjwmND5cVNzUu/vygabXSqtG4qe9q8DKJltQ
 FB4nEw5YYVywQ==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:S8+B8Cnp327f5fq7LashuP0nhMeJLqBIXORpMT+yujZ2S3TOIHdsqrW8PzhrPIQiqGCd94beRllF7jQgq1aCBJIPhL8eWIFaAyFherl+muLu+EJS6/pkkp1F5tJhCM+suHCCYcko8WQKrWbQmWzHnOMyO352XaR9Jx0mY1AXr2zN1UNqFxmXOffoVqb7uWj12m/Fi1/kj0Aj2buJw2zZlDo8kj3XB8a4GIAfXIGGhXPtmCwgvzfNESAjbFGRLul1eCq29ny3ToqI0czNShaHpca1tbU0WfyBs/NR2yoBqvuONacdTwFcVFXdQaK7u/8tWh/mjbxjHLMChbn+Qj95wN4rkNtv7llbqwO2gwmXvlGWFgb9eXaNeID9YRqivpepKgumrVxM8jbQYf5LJJ+JKL+oU2lTPaJYeTt2tpr/ZMNtUetEqS7i5x1yALUZCdrg4DdANBm1pnUPoQ+7kZmZU56ptn52btX7Sx/omIVSY9yXDSNoDp+yBleP30ZPTNmI3RUXTABWdBYjp51ZOEk4UulfoFQPTx7b6WSC9YLXKw38OqxgqQsD9fnakxbrhQWpHeuCgcHA1taejSMKkWW/NyhQ3nuUesPu3IXkYHQDIcroL8
 nqGlvWDFg1TJIPppcwGov8XduIwRpyuGHisY8HKmf8LlO8nq9LQLnSi8Nu5p+rhDdwork=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92A2FA4C47C8;
 Sat, 19 Sep 2026 17:59:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSp-000000005Jx-3YJr;
 Sat, 19 Sep 2026 15:58:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:02 +0200
Message-ID: <20260919155845.5776-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v2 37/77] package/ecryptfs-utils: remove OpenSSL
 support
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

OpenSSL 4.0 removed support for engines.

Please note that upstream considers eCryptfs deprecated:
https://lore.kernel.org/lkml/ZyKf6ZSZrETI+4%2FS@redbud/T/#u

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ecryptfs-utils/ecryptfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.mk b/package/ecryptfs-utils/ecryptfs-utils.mk
index 03e7f3e34f..aed1cae2a0 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.mk
+++ b/package/ecryptfs-utils/ecryptfs-utils.mk
@@ -32,7 +32,7 @@ else
 ECRYPTFS_UTILS_CONF_OPTS += --disable-pam
 endif
 
-ifeq ($(BR2_PACKAGE_LIBRESSL)$(BR2_PACKAGE_LIBOPENSSL_ENGINES),y)
+ifeq ($(BR2_PACKAGE_LIBRESSL),y)
 ECRYPTFS_UTILS_CONF_OPTS += --enable-openssl
 ECRYPTFS_UTILS_DEPENDENCIES += openssl
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
