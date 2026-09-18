Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06C0C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AC9560E56;
	Fri, 18 Sep 2026 18:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c4OBdV8Ic2nz; Fri, 18 Sep 2026 18:52:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9CF6F60E48
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757524;
	b=eI2KQGd42LEuadWFhw/u5l8frbYzDktaGNo3Q57KoPQowJ+IkQYhYm3xTx+qOXLNgojr
	 UwQ+vJx3dY0VYzl0wmfJI2bL5co8Taj7LrnhTFoPp+yNtPGrW1bHnTpLB1/83xrcBMC8X
	 ZyrElSsNytE6qBjqFP0LdT2Dj5gKGRTAdf2cO5c/xzSYWdl/lzU3uAaB1zjf7e/99Jx89
	 1uwa23ydRN3nApbmkdQKjRu6vUtdfXoxMLhsZGs8vrba6pL+aR0AwMliPZnFMIFB5mWSU
	 qmBxTUDpAAQpPvitbS90LFWYBLjMbjp0uJ+ErVTIpPl3ymGu9+ZEm3Y5Rf/xlSF7WNQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757524;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	b=E4rzCy2RdUKW9wGIZ2zk3Z49IYGVAKO580zBhjTH4lP7A7P8bHzSjIj26t4QOApat04z
	 BppCSH+g0RR7qSUyu+a2XlMZm18bz0GBwl/eoYjVEo8iNFMCatjWEM+DqFJLpmMEdNnRH
	 iZ3gvx6TWq77QAC9Zv32CpXmI7E3ETZWNhucBjUN+TJP6BKZI78gHnny+tNQBvns2OXP4
	 y6Yl5AjAgV3CvTR7FBOR1RVN1ei6epm2n3pGLF60hFBG0kpY7XHO09AlJ6ztot5QRsOE6
	 MjwD14E7rJgr2tgwj8NMg0ke7L07Ad4jBPZ8V9hsJCueEs7BW0y3iXBV+gFA5qGOFNA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=ZKQGoqak;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757524;
	bh=3FPubjymHSUzD6get+Z0rxrhderv55hBEp/mi2dXTXE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=glWBG+CnFOH7w1tpWi4NtuAUlv55wPZX08WTBsszZMtrWfqyFqdzeqvrujx9eB7dT
	 zTPEqNDVkokAA/lHbWOyQk0zOAL9+Hl0hC5WC9Qf5dQKjmRFcMrUXn/l7CmYu2kIFV
	 nSbK56zfu6pOb6nD3cyMOK8304FxFWf5U/1RJAfnUm/b2wsSQFDymqjbltTa+4VbgT
	 kEkk87Rcmj6YjKh4+X8P+eeGbtZNQOFX1oJbBP7OBWt8UhiDGspjwmSXYyAzwd5pdv
	 uKcv7qY2Bvv+gsCCAyaQzFjsDnneB7sT6uzv/NdUon9rF55QfRc6GLEBNaYYV1Gfd3
	 IJPr9WUC5GgQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CF6F60E48;
	Fri, 18 Sep 2026 18:52:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E61923B9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6FD060E48
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PA3DQaCobbLC for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:52:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DA43F60E36
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757522;
 b=SzAh3rhhUJYpwqXIgHAKx5JL0oMj4W6obvQrI22jTZ+uT5Qr7xEbdLsg18skkablUoQp
 kc7jpRR0yNOcgjzh2IZZzenK06n8QEM1TL0BqcJSYBitSFUwUPAnzOXlzUuCWhLrbRL1+
 TpiYvnxm0faDxLzzrGKV9UKaSMIDKulLZGyJfze/gGfbigBc9HB0B3yHkzYDnMEHJjztW
 SD3cxzO/QPoSnmcLC/WXaN5snQlk3S18gjxekzWN/sjcxjLxP6qGuBjSxRtXjSBGrzE/S
 lv1Tj1FUNNIB5xt4fqR3tpZz7W7Q00qxkRey5DChZM0G9F6fWYrMmm1vNqLFRkbGGMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757522;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 b=kPWjgvDJhZ1GHvixapeBRjFBj/LWlZNjnqEKRi6y8WAZv8Wk2fwPbVJoCUHp/5BUB4xE
 dWxhUTD5Gx79dAV6JVuPJ6mi3MbI2VltglFWKYLWIwkm1DI+BwLolEmGA9xG9WdnOuj6l
 sgN8bj+fGb2rf2fr0OdiqvDrhBMNFmdrr+BqhybkQh40mR/XUAazWN09TKZ0T4DEY5Xa8
 7kECbnduqv4aiR3eosCFmax5yp3tWOWNnorU9lEm7+HquSUYYZAd227Neqxk9YXB53gtZ
 tNGK7IRQk+JTdJGR8bZVS6pFP2b8cGg9IUx+vG7urISy2VkV7IyT5o5LrVEXBysVNjQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZKQGoqak; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZKQGoqak
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA43F60E36
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756937;
 bh=DWqBja6LqOlclvBbPOxQRJyRP3Ezg9Kl0ZLPlYk3eJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZKQGoqaknE2VPEj0/0lW1z9KY6f1UTikdndpSb8INtbFTUErfcUWHMrYJvl/jMrLe
 Rycl3x4YDORMXBcEJXJnkNKmm5/bpzwd+XPlsRKj2CNMf15ibtxVpR6smwov/T/9ea
 OCTE2FCsj6hxn4eq/9hbuL+nhaDbgSmsL6ZV2PGqNRrbnLtw3rSr1xeSbXMuhrkuWp
 gMP3HizteaE6QPn97KKrkkcnu2vqzEroTS6ikKigr3R9e0qRTAVWDs2RmoIJbInOVB
 Z99kLOqktcX7dF9kVgwaEfH+xSodUAdIYrGfLdZTVriaZJy7m/69iG7JEAR2M1CRkG
 fhYL1+x+/d5bQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:Co+1+sFY87yVTCUFgCaOroOEymuhvD2T/JmtXL/DoTwVBxFEiBMkZ+HR26BXRNR4SNtoWpTvzhCJAHfbAzabiMBkK0R24DKQU17CZ61hFgRR9Z8mt/BTEkRRZmQxXACnfk2iq0XMECqgdoM4I1Br4FKwVT9792hB0pcocywsvvoCEzPf8R9qanINofLpzE0BPDkHOXIde1Er0yMkmGrWV4BskbRDH6Bfp5ht7pKWnsCkG/1WJ8DzID00FdAXZP2sYkdSuHiqBjL6JtuqaOMJ8QQFm8+9aAWMihwbdJq1rWV4+5G+yDZOVA02d/EFwSv8or0tQFBR5Y6aCbeB1435odrSddz+6oy4D0s5r1Qcxn7mHpzOboF7TnqT+MFvD9MWOUAC2D8PJPGgw1fzuZQpSK2XSOR2GvUBrWJHcscve6Gm8tufke6dEXWdwpHxwi8ouJWqoFwQBRZ4nrUiIxF5WbeiTslX9qQXBvihXi/C1GchrXEwWpYcm6lpjnN2V3M5kaN40cPOckGerWpA3QHGkjYgvgOXP6Cj2TaWuN91g80PuHK7CDwmWzh3CKs8xJO+1AZ00Y3iSixEJk4lJVJeOOPcOYlp56B9IRvaVaBNc5EBp3
 u2GNNFZmAk9zmV260Xg3pba8yc79hB42ZMm/5aws3y55GhvknxqhdOeptfigro937rq898i6s=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DAD0BA4C4735;
 Fri, 18 Sep 2026 20:42:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWv-000000007cB-2Epb;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:40:59 +0200
Message-ID: <20260918184140.3631274-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH 37/77] package/ecryptfs-utils: remove OpenSSL
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
