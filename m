Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD4DCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2100040E68;
	Sat,  3 Oct 2026 07:09:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oBBtc17nY-e; Sat,  3 Oct 2026 07:09:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3BCE840E65
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011356;
	b=rIAthISvmeavcvV4YhFh3w+E2EypsitmqSeavzWVfjS6N3UHJQSCSSmpRaIYOm3p2eF+
	 ILruhK4GeKQ+B39X2HAMhm00Fhz/omZm5/rNChtfrwYD0P2YDEN4a7fkmdrKwfYPeGyne
	 r5Uw/uZnhlcYNBSY9EluqjyfLzSA4QsDMP1HYOLeDfLoUsZMCm8CYVhE69YjzOdH3aL3W
	 7GXt6BrWvPFduGm4bDjcs8znG7wePWebHJQSnCCmWZPaL9gYXhTxfl+V1setO2pGXk60u
	 LxV31aI30QSocCYu7QSkI/K3N4ytqyrXzjAXQxjRkh0xay2kBUUAXrt9Zh2EXHH31yg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011356;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=L7UuecryuwllkfeY6ALJxtr29JyPpffcGMW/fTbgdc8=;
	b=dcePLygEQWTacK6v++hlxe4dwj/scU1QKeelO8LjZlj6M0s/q/Op7OPMshnJFxgxaR1h
	 7iVf/Kxd4z28kare0LM6ydw2fDq5Qt0a/mnY3vMvQJr5pwCTDDC2HG9jcr6+uEb7WPVZM
	 JT+2gUDljzKnYpxOgqPZaBkVFc54k7PkzMNrK3qM2NoYc2OxF0067zk/N0KjCdScGXsSF
	 72TDzXDkUHErneo5L69ZLwJbHUZLwCX865VvJlt92Do6njA1j8n4Uy3rIxBP7CH6w8Rc3
	 QDx2u2LtO/wHKvfoGDeOuDPAvL0Vf4obAYMJTQKYSngSC6Poddy3ItT1CpdThMcLzqA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="h/7ElEoy";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011356;
	bh=L7UuecryuwllkfeY6ALJxtr29JyPpffcGMW/fTbgdc8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B2UnThFKbCCxtlT8H4WiYWp1ey3tqQ/15gc4Ma0CT5LdKeNpiGcNfbqb6E4Ay0f54
	 qGAGSzhn6SPqpPzbtAmxt6ea6u0OasbmB9k6TTLJl4vJWZ0bauJCZwn99nHeazmUe3
	 j+OE30rrp7oXFt0uJSUFXuMJWsOn5VmBwJqTMyg3k3w6AyKPVZ0k8TGXbFfdXVcM0U
	 u8o9/Erq1vi8rN4KIAb0TZEn6u9b6PvWDL+6axCuP3IjDBApAG3zenZVGoDvNcGhYX
	 2bmKnsO4TngYoqR95l42rFqvKZppGtdjdzmkfO7KXaHMK89nx8k5JT+6R1Y6J0c+pJ
	 0AwIYmXc+OQzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BCE840E65;
	Sat,  3 Oct 2026 07:09:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 953AF263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9320440E65
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNfuKhrU_Zgx for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 96CB540E64
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011354;
 b=Yghsvhy+P9eRNHqp2dbsoSsDVmRckuJxDwxEWCsM8ZmqcTlBphxRYcgcsA1uFa/jvKcg
 UFQ2zqDgt72aBHdUEDQ68xiqlt19pLJkprxVdnlfSXEcpemS18P4dzJr8MchkJvKdskNA
 ZfWn1zBqWEDOYMRU8IKAiMZ2z9vv8STKDeNQRAAVPPVfjRVsXpBpkuBE3PepGfCVB0Nwk
 J35veUP2qY2/TR5qG6VXa3OjyvluXhJlKI8FxBMgMeSGr4BMNscd9X1ok6NOsQRDYFBfs
 9PSxgXxtVlGpT3QJEBlZc3Oo8dLLpKDao5YMN97d/C7coV3zhk42iQ8jGp8vTb8TweA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011354;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=rguC0GpaOKuKOXVe2odpmGZUzi5I1mprMlw77nG+KWE=;
 b=cHJLU71A11XdnsHs3wgoH3o9vzzRoLZ3drXQUKqNt1BYF+bku+WlYzD/x6EGzM1Ywwz2
 KTSbdS4ZVbQngeMvfCKln1hq87G2884cbKjO4hB8XTEnRvD83+VC6gtoOchZ3zAYzD2La
 nid/mqSimCrgAmMIw9R2g4V/8lWjz2O3LTcWq3Ak4OubG9KeqRTgalUlI+oQsn+JYCsvy
 7wXjHIOT315H7J2cAIAcy8cFK21BnQzVoHp9aCX+V6EgIG+1PsZ7AIzi7LTKo+CELQl13
 ekjzwc6LIl2Ngfgk/leuU5aitrjFqU1ekxy/chy0FNz0eqCYS7gsCnEopyHXFaQug4A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="h/7ElEoy"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=h/7ElEoy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96CB540E64
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010928;
 bh=rguC0GpaOKuKOXVe2odpmGZUzi5I1mprMlw77nG+KWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=h/7ElEoyEsHz8hH682624eSXe40PXdpluF4ldAxPXV0/tr91SYd5wOwgW5L2sgA0W
 1sJWUpPx9bNWnnmiUbqfDyIIwNWEpoVKtnsb4iLwGThe06rFvHqt8hGnLeJAuuk5Xk
 7CZpzIVcnPFKEjy9Mo7CFQokTavc0KD2jotvhAro2HGDNuaYjmavY887wb5D8jKVIU
 PPmPoEWzjHbQfZ2tcYRCvNhD+5kg8A0prsOScOlz5GB3bUrTDF0lt8nR6h+8b3LEGl
 T+uqu/dt83462LXxxr5DPF8fdohBI6psgUJQNTVLUyuISHAxFcuER7U+SZG2KN6dZV
 6VlUWxNCrgUKg==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 WFahAmNQo9bl9jeaSLfGkBoKjbeZPzL8rLbo1HGrBf3ijnD0RweLGTu5OhtAWsB9vogzt1HFbb+
 GsfOmI3esCTbyAWYyqJ1O2vSHAJeUho/Oca8gAfExALxLzfiTFzgsaCowpWdkmxAniYbsnDwPCn
 rWOoeIiXqDmGb3BmmAoyGD3U3DLqH0WWtAYIXtymeMVly38+hBQ9cSLqKSDxphdYUKLw9HBvHEG
 wTOtrwKFNwnO8KfSTKSUD1Bjyn0eHeWpRomR+UQOfbCi/iqLJo4CUljRT8VHgnqY8BhlmxSE40A
 WF6xaDzNAi/Hl9XVY++HNlU27cFtlXEt+95kLbiwccQpQsueHpGFO60efEuZ1lNG/ypkBslQkqy
 8LYylcQ9PZo2FY7CbO8iSiJaJLHLX8MY+VZ3ve3CT9I/Nr+6c2+Hq3TDfek8vToIJLgK7wPAxEr
 C/LThbB3pTkAODhWCwrjVTKlqqJugoPdzsB74i+WHJ8HWR3KpgFPWYQHg8+gMSVgrzZU+YQjPBz
 T3QmJgB6ODhptJGcRrgszrAFgTFR+qz7/MMLyLNp0pd11nJedEiVNxRBcJxeG4x/D9NBwKvuQ1h
 C6K9xt1CfI+eKJX6ADrWr7AxnrxRzZF/rzENyUL7wP2caSebOuen1aK9yo/Eb57XUH4YT0i/T7w
 Mwz8Kiel5JhQyFyDNlbY=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8FEEFA4C542E;
 Sat,  3 Oct 2026 09:02:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkg-000000007Zo-3uMu;
 Sat, 03 Oct 2026 07:01:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:00:47 +0200
Message-ID: <20261003070128.1295458-75-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 075/114] package/python-redis: bump version to
 8.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 583cb74bfd..9df2a4f3e0 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  f7c1c7b3f4d163d2d424150d0498a35b  redis-7.4.0.tar.gz
-sha256  64a6ea7bf567ad43c964d2c30d82853f8df927c5c9017766c55a1d1ed95d18ad  redis-7.4.0.tar.gz
+md5  582678e33dbcaaabc7b0e54acd99632f  redis-8.1.0.tar.gz
+sha256  6e1a19beef9225c83efd689c7e6b7da2d5215b1f42cd13b7fc3714d0a09c7b25  redis-8.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index 21dd6f1994..6695b65f62 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 7.4.0
+PYTHON_REDIS_VERSION = 8.1.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7b/7f/3759b1d0d72b7c92f0d70ffd9dc962b7b7b5ee74e135f9d7d8ab06b8a318
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/a8/99/604f0b666d4c616d891cf77ebb9db6bb21601344c051aebf1b72b9ff915f
 PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
