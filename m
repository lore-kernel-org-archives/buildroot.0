Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18E2C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C81F605FD;
	Sun, 20 Sep 2026 14:11:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BtEuYsGxyS0U; Sun, 20 Sep 2026 14:11:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B77E16064C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913507;
	b=mcAhVnBtoD+N0bJTnIwztksPd+VUyEb0qwaWA4OzB7mmtruerKBCr6BrYPtoqf1gQXCM
	 dT0RmAm/lbLXdAgRTU5jJY7GPEv6QmNhZxyQKSauzniAgMjcCv64MmZhene0r14ayOcAv
	 dIIPKxu06ysBC3bONmstHRNa6Gqzqj/qY+MVbJtI8v7siZXE2bmfhtARN1uje1LBVpXoK
	 XkUUBvlE3xmKHe7Ad/3DR/ZR7JVaZ03j7f9ACIwn6091z8BBW2QOFyW0C5UNLY7qPGCEe
	 qcextaMUAUzQSbWRWOfodY0k+O/adOiUGpAn5uf9ysh/2V3xMo41ihkxen6xJ7VXV6A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	b=WnLpNCyDkRjgPPoRrng/vX4THseA9zNE7xk3h3otp35Jk8/W/FDTCmFxE4coUmelpP7V
	 WxjCArHyhljFqgcvcurXBCRrpppYFNxZrO9gto8IsoW3GltdYG6Lg6NWyKXvHROtNCRGV
	 snZ0q8wKVrgpINOGydhv3d+VB7At2TyidmLGd2Q7umeLRAaioAZncsSXyO3l1QAvSKZKi
	 WgSdksp04Q23ysGGm7S5jVt0CtqtdbYLWMcf0ydJdXMcV17xDSvDdPuWK9lSt8T6BEZ9g
	 IsPHqK4aDx2uTi5tx/6vTzGn7pMAtf2X/w/DLa1XFOfaPaoMOYILwAIjXxOO+UL4hUw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913507;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BiEvsom59wjp7oxn1tkd0aP6lQRkHm6YraDrTXDFD+yTJFvg0yVDHr5ubvnFuAhuz
	 TTe2jF2WH/VVfyeLAzZuhwUxuPOvMi8Lq+KdAQmTOWJv9NYKuvTDZNJcgGibWGSZW/
	 G0tWZMuHvgyfa1WyLMai8Slvn1oesWhtdTPmek66DJPRbCYDwdHrzKJgD8AS4BtO5C
	 D7m+rFnLvcKNAwFyMOd2F+yKYVzWZHaRaSsMuU7VF46BEu1ms0D8HzJ6JqcpA1lnlF
	 8WgPdpASTQFYzTQj3xCXS/ZmagWZ6rHsImhH239RaMkm7Qa6Icm5jvLDfcZLae6Hv6
	 OLbmetVCcv8YA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B77E16064C;
	Sun, 20 Sep 2026 14:11:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EB5D371
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DD8540DB9
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCixUsA_vuIF for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:11:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4C29040D88
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913505;
 b=UJ0PoggxCG4zobiTVTPXf7GLcSzpznDkxyHQGWjkzJidkpMOamGYQYcY8CzDHfZrtOsR
 CXunJ9EL9jV2ekS7/wLMZXyxFwMSPAVSS0iAeSMVKXPg8WYVGxECBKie+PM8WbW86Qzmz
 0xaxtFgDkZIw1qf+BJWz6Za8jNPpCIinDUPCBlk/xOMupzSQZjCyBU1o0VWoKdKHUe1+z
 p9AnYheXsnckq/twRUfZw+hj678d490AyfzspF2IfhgXo5jsIWJwPFESRohNOcPVzpXXp
 QV138CCTwdgK7ko38MsqpGaGuQGYgDcjRnjaR5ULaa5tIU5mLACnyFr59UejBW1OTRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913505;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 b=eEpHN8y8bH+GAlqpzp62eEUSHnlbq1snbe89yoANRFouol3HIqA+PvF22K9I8jC2wxaa
 eu8IONsNJ84wvsNsg4TSCAr4FD0fIZeR/VBRjG/fH8Yj1oN8TUPm/XGIk3sC5PrCHhbf+
 7nIU5G98pYtsFcySThHaYVqppiE0d3AsFizkZR9beVjN9j1kX6td6bc1McPy1h9EmxTO0
 qFwa0CLuYQTLncvmcjqqJ7gRprgIclZW0PfXUYmOiBYAD9jyBFPMNuoowcqF/JVd808lZ
 n2KhApsEX7AmIlaCMA656/9dkpiQpYKquAnc3CxbDHG6RkfDM9UW+DUKFj52FoJl2fg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DkOTWR50; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DkOTWR50
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C29040D88
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913231;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DkOTWR50FF3V0TZXrrmLIkRs/dkMmEhhnKg9ui4AfOy3ToQonhCcwA9NF+AS+rJc2
 HloInWxUDPv5LdZiJxJnu1DSqHYVhT0w3uHDKze5DhuFRi7J2osPgmRrNu7kU9K7eX
 FdDlYDfjtHjO2baYffKESdIJitNd5kWJ49dyhHdDzxSDyYzYCK+W7CL+UMEa7rjL8G
 mzcOdpN3c4fwxNtGWP0FE5cv+Vgq/YDEReAJkzk5SuNyOvDhw0Jio/EIRqZDVGLDpN
 oURXomfeqdWHb4wpBp1hXu5HUV2mhyv+yZ1ZvvgHecbgQbWUWcEvps8AfTWjkOv57z
 mW9ZRns59J5cA==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:bUfx7qrQglqyDUe5nPLtjHBYPnUQSbWP8BJOLbW90hQxpvEIaOyBGL4ARywAiX4Zk3ywk0n4qfl/mL9y6sY3J/+Td+ZIIqbtV5AU1y9m1wG4tJNnq+drRvJEJ3W//hhu111qTNvaBueGeDW71hmcinzYtBZj8+HTIg4U12rAsyVUC6GP+LGlRtDl1G+yqCdYdAWDRDevj2N4y/FFU9oOzkV7S3gs4x1SKpM1MAPtf7tF78kYRHmpSvdOxfpmv5k3vOPTjqBut+2ZdKyafiwSXeS1fXEx6EaIqDGGm/kv7MqvrGKHx/purINh5QceRlyylafTHmovhCUa7/t3URNUyb9yAId63mRnC9Lj1hfSY+jjOHuoHtpDPikk8KQSmOq77oZOWYHnh4EFtGAFgI1UusztE1fnBTGHwNXx8i+ZYfciuAao1mIIvHamlm1eKwASxzGuCl8NBn8/aCEYMtRGIUZOexGFaXU9wmSaVJrHJycRFAbqm4KTDn66rUK5043zcWfzJ9dRx61bl5eiIBFJ6zEMvrGrMLjmqGuLnsw7JtwXZ4JGOszu29lPoSDFKoMkD1t0jfeYwljqaVL7Hxkdjv1NQK1CI2olzZUuTwKSczK4/X
 GNu5ln++3Fj4dHGtijVYlW+9+v2WUOO2VRQ/1iWvnrPNX6XsjCG8tromYkDe4Vd8YYHxv+NpqYqom1hO0/yS+46Y+Hyz73/Gh2W+qSa2PKcw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 106A6A4C4867;
 Sun, 20 Sep 2026 16:07:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBG-000000002J9-2sIr;
 Sun, 20 Sep 2026 14:06:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:14 +0200
Message-ID: <20260920140605.3005461-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v3 16/66] package/resiprocate: security bump
 version to 1.14.0
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

https://github.com/resiprocate/resiprocate/releases/tag/resiprocate-1.14.0

Fixes the following security problems:

Use CSPRNG for security-sensitive SIP/STUN/TURN tokens (CWE-338)
    Use crypto RNG when generating certificates and nonce
    Use crypto RNG to generate various IDs that are supposed to be unique
    Improve transaction ID uniqueness
Authenticate STUN Binding responses (CWE-345)
Add Digest Authentication Support for SHA256 and SHA512/256 algorithms
Add new DigestStream class, capable of MD5, SHA1, SHA256, SHA512 and SHA512/256 hash algorithms
TLS handshake fixes
    Avoid using undefined client verification mode in TLS connection
    Disable TLS compression by default
    Correct TLS logging
Allow applications to get TLS connection/handshake errors
Propagate SSL Certificate Validation errors to ConnectionTerminated event/message
Cleanup SecurityAttributes
WinSecurity: expand constructors to allow setting of defaultPrivateKeyPassPhrase and DHParamsFilename
WinSecurity: perform normal preload process so that domain certificates can be loaded

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/resiprocate/resiprocate.hash | 2 +-
 package/resiprocate/resiprocate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
index 93a7131141..be09ac4624 100644
--- a/package/resiprocate/resiprocate.hash
+++ b/package/resiprocate/resiprocate.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  059fda8f63c456fd61130d468a67655cfeafb5ba8ff5c1d0a55dc383f83e4fba  resiprocate-1.13.2.tar.gz
+sha256  f132e4d0fcae0c155f91e5dad608a9985e199e4e3c09b6029a70b1b3b6d0b156  resiprocate-1.14.0.tar.gz
 sha256  8c93f7d6085486e9d24b7c6f9c662d92e0b65571003ad15d0827bb99fd924261  LICENSE.md
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index ab8299302a..4af7bb7e76 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESIPROCATE_VERSION = 1.13.2
+RESIPROCATE_VERSION = 1.14.0
 RESIPROCATE_SITE = $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
 RESIPROCATE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
