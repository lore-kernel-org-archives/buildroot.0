Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4FDCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D521940E6F;
	Sat,  3 Oct 2026 07:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ui8Xw2CWNcxz; Sat,  3 Oct 2026 07:14:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EA8CB40F70
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011656;
	b=IQpCwWt89rm5NPeRCkMzqQcEhGvIX0h23yiXeQOVsOPwOrRMxtQcpTw7t2Ap5T9dKwGA
	 GXC/0qhHVY6Kjx0Fk2bo+T0vNwIup37/Dw/0t02G92jHTYEs6zG9nITSgZiyKdhg38632
	 7V4dxjD7hjaeyUtIgQWzClLgs2B3o3IsToktL89mYQ4nWQlzzMNICluetveixQUNWmYKu
	 nBf0qNyO3PAcmFi8he0sVJbdTiOuctI/3hYIvDkhhweja/gaDdrCaaCcLOlUqPybu27J5
	 U7j3uKUYNac+wPmPtfJl4r637IhAJVjHX5pZKXHzXPMQilqM7WsXOR1lP6LmfLpSW7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011656;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lZsLeBtuUc+VLbNKiT8yGUrFwS1E3iYMoQKJfrDH5lI=;
	b=dmrmV3kyQe+XadLiIWsm9V08dn+mcwSy7u89za+dDHfD2Dq6kJKb75dnBxKI2qRw1tiL
	 jBfz66ll/6yIIioyfaFMGNLJCdwJtj04stTcRS+xJK+7jGEADJ6wTz9Dup3xe6u/gdea3
	 LMyVMys5XkN64J8tOjZluGdbfCY+d/ZnatToG5urkC+qRfkvSO2cvHVekF3ZcCiaPT+7N
	 yiwYgTqmgn1+byEZDdwidE5ZJVHDbKllO39yefMX9dyd/8TgEXsKVaxLUG1qn8GiiopUB
	 T9+y5t2IvArSNP+gUr8zg38lyeueSStLNIm7FEoiSimCN6VW9YA0KZSqMGtjdSDHG2g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011656;
	bh=lZsLeBtuUc+VLbNKiT8yGUrFwS1E3iYMoQKJfrDH5lI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eDrG5mvBI8KAbIhIQwnbhepB4mm7GgP4FERl7HOCTbRy73eLRD1UBuOJwFDEm66V0
	 3jYM9QrbnJEdLazPrM9GTfvqoB8QqokAUsMkAkgsiO1TiltRi8QiFL0ZJGrE5Sk88D
	 lpqexZ07kccxvzh5si7LOPvpElhYokDo2KLFlpgWc4DokNe0EGFOe6u+phnXarfggT
	 MzF/NoCJ+l3/1rJvd6wq2DRttCZvPKH44Ay5mZHVoP7jtcXxuvQrZRlnpSfLqRiIZ4
	 /MU+NnNIWf+Gk2/fdBYHEF9BzCM9s5PxYd4TS7CjxQvi3ceRpe9r68IVU/zoklzmZX
	 vPQ2UGJl2D+lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA8CB40F70;
	Sat,  3 Oct 2026 07:14:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEF0334E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A51B440059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lyBLdQaOFZwJ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:14:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9F7E140050
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011652;
 b=IHw2iHCYD/PGAp5ptgq91jcenkKqOTRTMYu/fB5cIOt5imtK28CUv8IAijXSCq3AHZjV
 goA6gPJWxPD/gTOEZTxm+xo4kPHWK6/fRjG+ofoLSMGD/ImdLy9Y6lbBVEJ/JjUTmPRCJ
 KW9aLaTlKD/4RIu9AsquJN/06aZkfVeoNwhI1I4pkI+eZcMfa6QbyoEgIx1G7EgIL1f4j
 QscbAP8vf6+WvAKxHlpTbYdUgc83PcZ/c3NDRKMI+2p+cOMLsogEOJxK9YV6DDQKfAFUh
 KRDdeI5X8Eqomy0L5nI6j1oaBNEE8YybPuZoQ+ACj83cU2lFBxZBdY+s8oZ8axgaaYg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011652;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=B7AwOONYZFX6A7Z5awnMf1Rs/9Bx362D5EY+3GgC8ac=;
 b=brzvEw4i4Z1ZxrUrYjAab/DdSpd40sMR8HtYM3GVJ5bYOL/+J06wt0+mhpXu+uHvQ9PT
 k1A4LUsRVf7klhabfVYzfvyheI+v3y2HKnjzEWY0lnRB8OuW9smOEtgwA77yAfNPzXIKp
 wyW4vqtWCcqUSWWMM0XxqlcWYM2zPD15XlOyduhkA1CBwXNfWFuzN81wyd6O1BkHoEbjX
 b66r5Q8wavcw1foP7QA3mzh7IEAv53UC9pgxLhJP5q80Lnm8gEgWVeCHIEcx0Ypf2fF2m
 D0zrZ1UfzPpb6yEXER61f8pXiz9FewWMR1Brs3o5LIXG0XAML1Y2u45DqB5bRweZy/A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jQty1h2x; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jQty1h2x
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F7E140050
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010933;
 bh=B7AwOONYZFX6A7Z5awnMf1Rs/9Bx362D5EY+3GgC8ac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jQty1h2x4gel8yGbaqCZwsEfWTlCtHLoead9OeliqfOpY/Dtev/Jw/f5mp/G5xq8c
 /W0uBRW12kCQl7HkpTPHVqtS7Ci5qglGYc4+s2F1fZhxXo/gu8uLNKHiNGaSOyF0Lq
 eo/d+ZI5LywZw2I3XDpcm6zDHsuwZDT3PNZ+AC7Ki+YIxNgTeKcyHvYU5Z5LIcffCq
 ChNPYeXMlJIEzubpzP7lgJ9P11vqui603JwhZFGBPdITlQsPb7UJ8tJi7kUXnr39Ue
 pbu0RpyvNKyNq8ETHR0n98RJp4yTeLb0isfNEYzkrTHxMbswdvs0PL45xQDEC7oIGa
 ZAarCHZdGa7og==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 pD7D8MfYQ0HEQUJkt5u3hrIF1vh+WUHeIo6aQKu+nBqeumjxODAvqZd63eUvBrECiO/7bs5lrS/
 nAWSKgf03aobfGQ904/zvX/cupt+gUeSoynro6aRvxSIEav48vfMykRrz8gLYV7Ny4QrQWW7nL0
 j0fUIUkkgF9eR2hT6HthXN16+RDAU+TGjFx4Bvral9q9TBk5W/vwM2QeCuPcZx7BoVRm1pnogrC
 7gexbmHrQ3EFx9pCcq6XnFtZNVx+85BcahO9sJFYd2HaAAnfvqXeWgJZUYlCEizozrChaddIV1L
 mAEOhEkfc1LxkXR7iUIeoiYeswSXLcl53pPrFTvKkQAYCIzjPEaCl3UYKi3cF5bp/SMhn40cH+D
 Pa3RXykjoSVXTPubldSrcH4TvryW8/xxVE2lvIf+DZSTzBBV3Kqr5xBMs8r0UgUE7lGKU+b5iFA
 6rj/Zt3Ut/uY3brvHINhsNj6HtYV91sq6n9FzOE228vIA5coHa1UnuU5IbLZD1GULg1veDoBueI
 jq/I2d7ULqk8LfostYKdG1hgoEvy0SP/axa1ULgoERKkChJdxNvCl1iOKDMS75ke7UaBINYI6Fy
 9m9z4aN3UxDTahVwlLWjt70vrjRt1xQu0JyZUUhwXMckwQcN7Gy0nADBKoVvDrtq
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 498ABA4C5448;
 Sat,  3 Oct 2026 09:02:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtki-000000007Zo-3I7x;
 Sat, 03 Oct 2026 07:01:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:11 +0200
Message-ID: <20261003070128.1295458-99-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 099/114] package/python-typeguard: bump version
 to 4.6.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index 004bbdfabc..8301b99b9b 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  c4953b5b4dc1d6a49d6cefa4f47f7465  typeguard-4.5.1.tar.gz
-sha256  f6f8ecbbc819c9bc749983cc67c02391e16a9b43b8b27f15dc70ed7c4a007274  typeguard-4.5.1.tar.gz
+md5  97f7a6d47ec36c36217889b2a57a0e0f  typeguard-4.6.0.tar.gz
+sha256  e7414f09111317de3e335de92cd397c5c0ca00b1cc1676de12e1d444a79b3f21  typeguard-4.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index cf07bf345b..8a543eee68 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 4.5.1
+PYTHON_TYPEGUARD_VERSION = 4.6.0
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/2b/e8/66e25efcc18542d58706ce4e50415710593721aae26e794ab1dec34fb66f
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/b4/de/4420db493fa8fc0856d5e5c1b159c63a323d2de2317babe36b01568928e8
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
