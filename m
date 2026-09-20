Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE7EC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6760540DB2;
	Sun, 20 Sep 2026 14:18:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJLz551GNNw9; Sun, 20 Sep 2026 14:18:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 81F6140E44
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913937;
	b=gXDNk0r3SKrf2xw+s3bQT/pXyWWVRtRt3Xl2TlzQNYPKedqEMn+7tSDBXJxiCqW0/wIe
	 Pxk/HMLy1iBAWFPjWGo1cfw+WVu3KrGCGHieRVD2q0sPqR58PJBUaMDFAANObqMsYkgCo
	 9oF5N3FJDyvbfyMEM06Xo/sWgX0pCKa2UBp8azTGTxbaVEE0KUDWJj+W5WZHF+QjdT+dk
	 PCxEPjFnJ3QFwvpITCYpSTmj+odXfz+PkovRI8UmfqrP7SVvFYWxKzGzhB5WX4ip1ESaW
	 s4xGrreMtAMZ7qvKXp7LjSHUKnD/zu8kUOgKQAJJf3JOgq9u+eZ0cyCDbFOMY/cYZKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913937;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	b=cSJLMfpSt+m2OCPsijKtCfwOi25Pr/UE8w7Id8Oa8W/9EzRadwYnOMaW/9frRO3IQvJm
	 7frROr0u5lQjbD9DXgzdpjACT8IZUDlNn7q4qmlO7tOdaERcbi0Jf5dPoW704i+gTGjth
	 2spoJLFYsfvs9Pz9+gpUAlQxZc2gdxBHCSSsBq0iRiSzTXoqagTsLuxSDI03ShlXHmN/q
	 H8Gk73Fj0tnrvOyPGkgueoA/WBy3qxLv6JMmVReCihyuXuH/E5hdaLLks3FaVY1NeKf+A
	 Go+ODObN98vdELGNMIUld0HXMSHFym834/4cbxpehbplmwaPJKv5fQ0EW2z+WFsBZZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913937;
	bh=9TLHPQ4ROuimtB7mO644o6aJnJzeswyG9IqO88KyurQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M91ZBHqlZVyUJnK8S75gLQkvc8j6gKUj5pGDxVHnDxLCDEQm91xKEN2srbm+LBa/y
	 kiWYlnVdevU0drvt/85BaEPVRrh5DFNvxK5rxeSz23nzWSCbOOc2BXmCNOeSAFdmpJ
	 Z+63PD7D51wrYswPfWaOVd9c3igwPwzsdP0j7nws6Kq3Mva8vR6oJTj8zxVr7UXIGD
	 uklX0KJ1FPXFpSzvS3D6HQtMzA2TJmdOICMp23ijAOg78PdsEqQHPBsBgIXUyMl9vN
	 Vi9tBNCkSBJ+s/BcBg/tmefqLqb0JB2kVRPhd6VoYpnTC4+J3wtP/rLJ62seCdS3Ev
	 RIoPSm1uwQVBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F6140E44;
	Sun, 20 Sep 2026 14:18:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53A273FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4599D400D1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jCQScsG-VB8C for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:18:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 45FCF40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913934;
 b=RZpvelixCQymqjCiNMt+2x8yrHuZobZuZiz05brQQBdUU/WHlb8+syq7qW52jEXLBpjm
 7RJofe+XW7uq+7EcdkKK0a00GkM75gV5EblHYEZqdaiSxYBZJMmM6fr+oS25s+7hd33Qy
 4xzFo0Z0yZu2lMX++r0TyZgYBfLB+z/46/OoafEKFchjfsfqNEVRuxMETRmhxYXE5YrYO
 KBpmBJrTdRlPGunILuVPkq7fLXQgv/FUCF5L05tqojtrTOmBgZ+/BkOqqNNbjY9ZmtVYY
 chY79hbrPOX1YqcG5Tw15PsVEFooqzn7EpXDE7MGZf1XumR3xPha6pB1bPRrcUMhG2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913934;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 b=kv2ra7ecyWB0tA0wopiyQkbKg4hpWD+i5MvwgK8jWNfG8TsBVPGgq//pwcPRfTgRxAb4
 B1/C5bP3oPahHFP1VbWyrya61I68wNv8t1dXM6nTB/3IGRBHTQucJXYhc/h1Lge4Jh5av
 r4meoAY73fGbCR8qO/lagqTfL0ClxJNKU0cXDiJ7zAzxI5uFmXJ1FZ8la0ieSIWqfjaEc
 rejnpr+MdIfyrCk+/2g9wJAtmZkoH+D4TjnY61CIcJ7vxg0HgtxOALDnBrtQuKaz+vbuy
 PxVjWDZnGqZJGecv3Up+5g1tquv7pfdtV/qvjgkvMx4XoubXt5Y2JQnXWWLGJ+741iw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="C/I2BiHl"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=C/I2BiHl
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45FCF40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913243;
 bh=paJHYDhT3NPHWu3JbU5vAYV7xq6YLok15BvHVQ/Yl0o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=C/I2BiHlQlQ9VYVOX2iBqRfMdsI26L6HMwqFZ/G27RHhVXABojDu6nlhDOJIYtBcQ
 RPDHwvw0v/Nu3WYFeTbHdy8mOuDQKi3+NaaxZB+39AUXBR20SK3yCRZJF8PRfkKnSh
 lykuwhDmWX//NkQwpvI9TF0CpkKPrbXqzFDN3b59vyGsOtqWTZglz2IO5abvAcj3LN
 X+MFC2jh3JBakoDjtVb9wptvv1yFyqMCgzWi4lRzdNj51HA0Ovz8pJp3j8Q4gg8wgM
 zkaK+4sN9z0Cfs5ktOqkUrgYCnyeDzDSnCV0wjtoTbH53gm+wp67B3MYLAEO4NigDj
 TWL2zOWaxdisw==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:RNg/eTIokxJrbZLTFJzLxRkBh8b3iy/JgzN070E0pdK/2qPkWmIsvcNC0ZxLC+fiZdLLKXGUE+5ITk/tLd1BnWc4qjc/9dFjsbvPZPsbwkfJJSNvYnaa/kPOdadqspZG0cXOrCYnV7nUAAEmdb/GkCGRg99vz57YptaJ50TmUzCOvGezaz8ybEJf7HtQeBlmsbwDWLSONlCGuw9+8EJ0KELsyvbUutiVMJsr9OM8v/TzexNTlDEjsv+8SOIz0Rzwh/NiYmWoeMivcnlnRVAtJmqJlssSjVyHBJik7fRjyQDKpM9bZIDoT9tX9onuAR/2lQ9A9IZJbbTnE2pieSmlSa9mq1P/eJjDF67VuF5qeL5r4TgbXp7c+rge5CYdOSVlaGf1WIInSYC6u2ijDXb8LPyOTEgk6sxIoN50WUiPcuLyxrawh4rHAS7iF04RiBf/oPXPju0cM8gpebG6JPgGMq3XEJqeNJc5dYU+hA6D/ARhCfxwGSWTJgLMpBs/Y2HZR1yjGCD99ODNz2FDNyUp+ZPI4JySK8yhE7yEWuukyU8e6KVkL50umrnqEgIOLCCBLtkizzs9MKRowVNGJPHmBUpRFqlHnuWltkeRYAvgiaLzCW
 AG4ty39zLS+BQFeQcJCKZsDIfI06WspDGgKSMVwDE3vw==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AC509A4C488B;
 Sun, 20 Sep 2026 16:07:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBN-000000002J9-1dtM;
 Sun, 20 Sep 2026 14:06:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:49 +0200
Message-ID: <20260920140605.3005461-52-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 51/66] package/rauc: Fix build with OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLS0tCiAuLi5OMV9T
VFJJTkdfZ2V0MF9kYXRhLWFuZC1BU04xX1NUUklOR18ucGF0Y2ggfCA0OCArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcmF1Yy8wMDAxLXNpZ25hdHVyZS11c2UtQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
LWFuZC1BU04xX1NUUklOR18ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JhdWMvMDAwMS1z
aWduYXR1cmUtdXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNo
IGIvcGFja2FnZS9yYXVjLzAwMDEtc2lnbmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEt
YW5kLUFTTjFfU1RSSU5HXy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAw
MDAwLi5iYTgwMzJjNmU3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9yYXVjLzAwMDEtc2ln
bmF0dXJlLXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5HXy5wYXRjaApA
QCAtMCwwICsxLDQ4IEBACitGcm9tIDEwMWFhY2FmODJkMjUwYmZiOGU1ODFlMDAyYjJjMzgwODY5
MDgwZWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCcnVubyBUaG9tc2VuIDxicnVu
by50aG9tc2VuQGdtYWlsLmNvbT4KK0RhdGU6IFNhdCwgMTEgQXByIDIwMjYgMTc6MDY6MTAgKzAy
MDAKK1N1YmplY3Q6IFtQQVRDSF0gc2lnbmF0dXJlOiB1c2UgQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
IGFuZCBBU04xX1NUUklOR19sZW5ndGgKK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhi
aXQKKworVXNlIEFTTjFfU1RSSU5HX2dldDBfZGF0YSgpIGFuZCBBU04xX1NUUklOR19sZW5ndGgo
KSBmdW5jdGlvbnMKK2FsbG93IGFuIEFTTjFfU1RSSU5HIHN0cnVjdHVyZSB0byBiZSBtYW5pcHVs
YXRlZC4gQXZvaWQgZXJyb3JzCitsaWtlIHRoaXMgd2hlbiBjb21waWxpbmcgYWdhaW5zdCBPcGVu
U1NMIDQuMDoKKworZXJyb3I6IGludmFsaWQgdXNlIG9mIGluY29tcGxldGUgdHlwZWRlZiDigJhB
U04xX09DVEVUX1NUUklOR+KAmSB7YWthIOKAmHN0cnVjdCBhc24xX3N0cmluZ19zdOKAmX0KKwor
U2lnbmVkLW9mZi1ieTogQnJ1bm8gVGhvbXNlbiA8YnJ1bm8udGhvbXNlbkBnbWFpbC5jb20+CisK
K1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcmF1Yy9yYXVjL2NvbW1pdC8xMDFhYWNhZjgy
ZDI1MGJmYjhlNTgxZTAwMmIyYzM4MDg2OTA4MGVmCisKK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+CistLS0KKyBzcmMvc2lnbmF0dXJlLmMgfCA0ICsrLS0KKyAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0t
Z2l0IGEvc3JjL3NpZ25hdHVyZS5jIGIvc3JjL3NpZ25hdHVyZS5jCitpbmRleCBkMmFjYWM2Yi4u
OTFiZTdiYjcgMTAwNjQ0CistLS0gYS9zcmMvc2lnbmF0dXJlLmMKKysrKyBiL3NyYy9zaWduYXR1
cmUuYworQEAgLTEzNDQsNyArMTM0NCw3IEBAIGdib29sZWFuIGNtc19nZXRfdW52ZXJpZmllZF9t
YW5pZmVzdChHQnl0ZXMgKnNpZywgR0J5dGVzICoqbWFuaWZlc3QsIEdFcnJvciAqKmVyCisgCQkJ
CSJtaXNzaW5nIG1hbmlmZXN0IGluIGlubGluZSBzaWduYXR1cmUiKTsKKyAJCWdvdG8gb3V0Owor
IAl9CistCWlmICghKCpjb250ZW50KS0+ZGF0YSB8fCAoKCpjb250ZW50KS0+bGVuZ3RoIDw9IDAp
KSB7CisrCWlmICgoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSA9PSBOVUxMKSB8fCAo
QVNOMV9TVFJJTkdfbGVuZ3RoKCpjb250ZW50KSA8PSAwKSkgeworIAkJZ19zZXRfZXJyb3IoCisg
CQkJCWVycm9yLAorIAkJCQlSX1NJR05BVFVSRV9FUlJPUiwKK0BAIC0xMzUzLDcgKzEzNTMsNyBA
QCBnYm9vbGVhbiBjbXNfZ2V0X3VudmVyaWZpZWRfbWFuaWZlc3QoR0J5dGVzICpzaWcsIEdCeXRl
cyAqKm1hbmlmZXN0LCBHRXJyb3IgKiplcgorIAkJZ290byBvdXQ7CisgCX0KKyAKKy0JdG1wID0g
Z19ieXRlc19uZXcoKCpjb250ZW50KS0+ZGF0YSwgKCpjb250ZW50KS0+bGVuZ3RoKTsKKysJdG1w
ID0gZ19ieXRlc19uZXcoQVNOMV9TVFJJTkdfZ2V0MF9kYXRhKCpjb250ZW50KSwgQVNOMV9TVFJJ
TkdfbGVuZ3RoKCpjb250ZW50KSk7CisgCWlmICghdG1wKSB7CisgCQlnX3NldF9lcnJvcl9saXRl
cmFsKAorIAkJCQllcnJvciwKKy0tIAorMi40Ny4zCisKLS0gCjIuNDcuMwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
