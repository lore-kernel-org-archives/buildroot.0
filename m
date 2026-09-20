Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294D7C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED58B40F14;
	Sun, 20 Sep 2026 17:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yi3pgAu-PPHU; Sun, 20 Sep 2026 17:14:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0906A40EF2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924454;
	b=ayjGPcOUXu+G9Hnote/wfUvJlSltqCVzzPyIACxko8ZQeFWYruyryniKwmnKHjzWJSUY
	 AdeW9Gi8xl2PmcD3gsIhC6u+lk1giVNFEffju4dD050rNSHKmYUFs/wIgmtWlUdmKzYB1
	 1fCPU08iMec7WpKNw27wGeXn8OGfFi9CSRSYyd2vYt4pp/tBMBwa2JJj7lEwBTfLm6WqS
	 6pxTPB1FveQx9SnEILF6uiRZI8pvDrQ+quBzcEvPY42qmLqHmAUm1ZzuNzLip4EcvT15p
	 mndvpX3EtB8ramSmblIfN1g9dlIRZjmReaSLFcftmpltX/RGQBvZRGRVzFSU71bOSWw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924454;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	b=SrhC5/Is+jnVHBsIA4zTuyj2tqy7yRWWpCZl2XwgEY4H4WnH7qcyaiQJhcNdd3E+DTgd
	 AEiU+eLN0x7a0QUEoLt5xCajodUPcaELA3hL+qWYcw1GoCmEZ3LuIlvcNt3BsbdSnHko1
	 yXr32Futp6eAAbnHl+xApkLDBkI4I/NV0TF0ppH0uH/e6kq7XFbt/aUgdEzDwisRprr/h
	 G+N1OL4iAfBSefZac4a30sRqBdQlKoTvvEWQUGJuEZq0LkckwxSnFxuxMrlAmuxeaopWw
	 /A3F1vUP+YmTS7NOQ5NBviywmlneLSE+BC5zbPqPvzB4JHSJKA0m/KXz2nr1lurBNDQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hYQVe0Cq;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924454;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MFn6JCe4inrmRSC8mhIaR/wLeG8rtTyLIxz8AfhF81DxL1zplU3J0tn4M96RpCdCR
	 UTNwhuSCq9vBKZUWulgaThw22pb4T+f0HIUimdXkW4oiupdSCRJ2jOT7ZAjF66Ish8
	 4N/n+EwPy7GJxgDThfThP1sAw1CEOy4Cx/pdzUdOj1ZqXtGiRdFw6burqvl+K/mKGt
	 H/gQGxoryDM/mWqC89ZMOXPtX5ugxe7WYJRkM2MWbYBxFGkkJQU1yEiHJdc5tpbMZs
	 x/5Za6z+BiWvIIx+mYDw4SUH1L5rQ6upuJPgTLNKRGovo25Vz+aVAUfN3AR0Zlbe0C
	 1mJyMbbzqL3bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0906A40EF2;
	Sun, 20 Sep 2026 17:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A161837A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93D7040EF2
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybVipp08DD6N for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7519A40F14
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924451;
 b=O4qCHZylJ2hTvyVKVpCjAgrKgRUfIA8GONW/Y+xdy4PfaPXU8i5nx9theLe25Foy91NR
 fWqYWs/bBQ2OBVLkUmaB6nEYWLmudO61rqXdQMFxnD9j1jl6w8cMyhpMLEXCKzpE7XCCt
 iyG3OeDMsS0BAwkXyzdRedUU50yzEy6F53Y4MS5+1Rs0hCWKGR+wVmZvo51da4fGcaPW3
 ZK6R0rpaAUh6gTOGTzIb9jYPwfj/+25kEWmnzLEbbYp8T4rp1dRhe2cP2Bc+IEhLCd0LM
 6o9FAUTNCqfQBFLB1poBQHpywIjNy4T8siCspw84UUSl9WOPHmxOYM1mDcuVndDefNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924451;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 b=sTmxZccmYmHj4YH/8tIYQQ8aGNyf05YqR7B9FTPzewtQa6ASY3WOGD7DXDtRz9eihUF/
 Y/5raaedoOHEYW+ZtQTYe6XHmiHCAjCxmIiLjT1oA2yWndl4q+Ad08Ot1p16032Om189R
 QveLzayYuRpqItJXQAlNmDh0U02ERgXPqZDFK7wWK2Z2AM+Yny9bx1KTkPSbX3BeTKsIG
 iHtohQSCpokCgOVxxpqGA0mJ3lfC03syZJvUc6H921EpBkXdKpHo2iYhwXzV+u3WnjWr0
 sPSo2EWELNZSoL8uAS7x5nnzfEU1j398NW4hCdbOyZmRuZhGqm2jWRC9cHylNFQ9esA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hYQVe0Cq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hYQVe0Cq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7519A40F14
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924151;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hYQVe0CqJZcMaogGHJl8qUK1wsgfK+0uYot/AmNB7u7SHju20KMXWtcnj1kzw6stc
 kFW0U4fKBXbCZ4zY/gpnvNDCjGPLLVLOtrkNvJr8paKv0DJRMmWoEvVyVdMwdaj/Hd
 lvigcdUBf0tC+ETqzJs9IP+rfzhEkoDWy/6aXyOOlUjF1jfo8aXZUnd21XOtM9WEqM
 0itGs9dZ3QAVO62LFHkmwl/b7qzc/VWhx4wb05mLsdQClx389FJHDfcNry7eUHAE1g
 MMgixGimLXbm8iX/ushll8qyJciKwJiRxsRP83kKF+/V+xHdVkATxZ3jb5KmeXDsTz
 kj/s59GW3C9fQ==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:g6M5kEzvZiReDEZHrnUq5H49ieWXFDNg0r82Ed5DrP+UJr/q8VhohbwpsFHO2+32J/5CN6dtEFmDZ+QjYfFKMO3aq3Y4i4akK07jD8YzvzHircw2dkB762G3aCTX8lq05m88WjOA1sCmUtV2yjjUphSdK7epVBlKAnXnTJ6ZoGviuqrvhyx3CD7dgsUojh9rwsX1HB3uzKqOHyVvOaBKlLrsOLC0scVescEM1hxBmktufkqp79/cVUkluqntPtuinkI4hqCxcwN2i/8Y+2AUhlQ9+x4p3JN0y/mNTubjp3sxTjx0ykqxetW7HT2rakIAHYb4CDu08IaLsYzX2YR0/J96/dzgKQelDnmiVm4AKAiJTkD5FEnr86rnqhXowHvA3ZYqQiTwcc7Nj+d48EnGtn19liDeGLNXg2nixxmUQKchp7zstzVuvp7y6CVVB7Nsfwr/MSdGVDuGHQhxgcgkz492f68okiNu6WW0wpF3bATB0WZpc2U3vGL/r8u1J6QyPYXf8cB2XXCC3TfMKtmTiKNZcPxcv1iDh97zJrWrP9oETU6+RFpL+lxrhSrjMfGVTJned1Hd0ty8aTsA5eWMulAF/B1FpUr0dPYr11g6/K70t4
 pUO4g7zY3rW1JDnnjAO78+CGywJFLxCLiroSxWtpGAbvVvx4txs8+JJKh4C2xeSva8bIKednnL/MFA0Lu1quWrvLVj7enzEXS8A8+6b8fu
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FC45A4C487E;
 Sun, 20 Sep 2026 19:09:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Y-000000000o7-2t9h;
 Sun, 20 Sep 2026 17:08:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:23 +0200
Message-ID: <20260920170815.240247-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 16/67] package/resiprocate: security bump
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
