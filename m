Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27661CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E640B60618;
	Sat,  3 Oct 2026 07:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yXuRdgtiXlnS; Sat,  3 Oct 2026 07:15:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0B3FF6062C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011741;
	b=Y/TrlQcHPsvGx0rhPCjnP3BqyP0uw3DzbzPokJwn1Cf9lKUctJaFCZpqYot0GlLvMejG
	 YyLT12moGDDnXG/QxExLI0gweSvBOZcCIQAUBF56aEHgXMXSrnbqoiDnybGhMou2bIP1/
	 Aa2PywGvdEpjmufL72haB1jwGUUv/Hd+GUj4U9nqfc5fcgsZAko7fceifJ55IeHnYjPqp
	 CnS9LYJWxutApst0ygemJXqRpJHQSzTC3jgRpzI5GNm9RE6WHTywUhCqoW0H7GPsKSpLi
	 iDddPhPfh2TI9n/DwZd/u6PfhBv75U+Npc7fP0ygDHTNrCXIFgxXcg7HSl4ETG97qfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011741;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zFzjEvC3498v92+HDh7t0enf8e1IGzOu4Be+msx0l94=;
	b=FDuN20nc5onEkq6HV+AdSQUXUfQopK6E4IzbsjPmm/7qOtqFz0N2uCqvBbYuxJpXmMWh
	 cgg8mA0lp2ourZVrAU9H99a5b9wKR5rTDGRn2XjrPCRPmdqCBkLaGpfomx6ypx13Ugo1n
	 nkxWBvHie7JUnDCPJghNxboW2QXY1RzBJI8/f5soGBfV5YSBzt2S8rmROnNJ59q+kQDMB
	 DkEJpCXpBt1JQdt0c9lK0bS5Qtgd1YEEvQnYwC9uM66TwK0jgOgmU8WhJHG7G7hATWzQN
	 DPRWyHomf9z1yPXgk5CBj3+0tzHyqNgOS4g1y45QLMv6ABeDF8weSpVb439xENQVy9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=hMgwXN0A;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011741;
	bh=zFzjEvC3498v92+HDh7t0enf8e1IGzOu4Be+msx0l94=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gr1wywkaGj8Ib9zbxsQxVYXC4PmNMCtTU10U25OIyrLajAMeiTmWjwCo3gLE0lD8F
	 YKqLZrrT5nIy/RalLQFklopc7kteU+LAgPU4IHiJwVxD82cW48LBridzmwOimjs2hf
	 CxquaJkN80Odz241+qRxtkJ1ximNI5p+aFgs2JTWsRRc2w45ic+rv2lLrfZfQkyZft
	 w1flwDEO8sEk77NgXzC92UfqvyS1O1LFQtRVLbhKuFcVY/JOl4aV9332JKpFtn2ci5
	 YNs0gTFDQIwjpJYxIE8QhA12ns6pRhoKCOUhpePDGgv0e2abHVT/nF39USD2WG79zG
	 zdDNd0Phxp4KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B3FF6062C;
	Sat,  3 Oct 2026 07:15:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 325BC34E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23C5B60686
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UZhhcNgXH2OD for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:15:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 159E160618
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011738;
 b=mlnrsLqbqKKcvt6AiD3SsQ8hMceVU6dhHTNxvkveBd87RabPizV/OZgorkQBrT29Lf/S
 9nhC7pfk5u1wUxPPnZu/w0vfLuajobeb6SgAd2sNTU32/dag0rhSqcWDfg9K37zGi+UtX
 +vzVPJPgP+BafZAo6O65onSpO2vRScRqSx8Zjq925Rqi/WleZus/qqOdgz+VihcjPgvQt
 TqgTgLnV1RC6WJVowORiPaE2kUXGCP+OFMgIhVJRSoMvLVZOYP6oLc60kmgrVO1//WOJu
 ERT8NSIDiOYUoeh6rb1eDYVNxDg7jywrjTLLqBz9fvujV5g75+Zc40HZ+km7cv33NTw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011738;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=c3eAuqlkmFw0TVNX9mddCt6jOsdTHxusNNap5W+jdO4=;
 b=pOS89AUAMTN8Q5zmHFmTVkJf3WFUX4UsX7I5LwpcGlNJr4sCKzjEVXXnp3OjhLgLA+Ar
 26Mx2tuKFSDItNSp88zqydPsx23QTy8cRJOVT2yqHyrtaQcklsHriHOjyPmFxnH4Bt0av
 wY/yv4l8MCOhO3K5wi8bCBP6u/8zrCXr4emeZ3P1HS5WmjJh2OxyeAPv8wG1bzSjiScxD
 qqfsf1xRahJvlA4NeV3qL6paM/e2iUQzUr1wzADNJiBBmUD4/0EQbWkiaQUY2yTAri7kW
 /TZKQ7Vxf7V1qnfHjLrcxdBZ8bbkei0YIcAYIMvf0bD39xegdNBrf6DfqC2nuNWTY0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hMgwXN0A; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hMgwXN0A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 159E160618
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010934;
 bh=c3eAuqlkmFw0TVNX9mddCt6jOsdTHxusNNap5W+jdO4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hMgwXN0A7yWfLxJSf7lUlxLrjAJnMxOyEswiMzrcRYlYlgpYIRXZjPUSE+vnBhz16
 HepGRIaMBF0IizES6AeB7JydViv9Kt//7Rq81ORpnc3oSovQVoZrufCvXPRzYFK3oS
 1PvSDqq+NdaPUfJ479Wq8WzhM0ug8n3cUBO40OhS44IG4oFdtM+N4BohCQmDjjISSM
 Cs9LLNT7qvkk3vA19d0vBVpOV+nCN3gR6QqX2OGdgmd11aYrfTj1zeW8D3XX6BuM/3
 r3rqUEtptepJKef8GkmMJMXncua0XuZYN8lZQbXIkXO3sMe2GaG1kqGARKoXwQ93SX
 p3h/JMvkYV6RA==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 MqThMx6zN2MldXKMOPdoT11HMq8orjDAJtXxACYNwHdLLYTnCJF+X5plDMZDiMGbFrAskUp7lUc
 l8nXnM2apCuyym+ibLeCFRMnX8T+v9Rmm5H6JciCbJo473aJQXVGETxC5jiQrowdifwEgY3KAGW
 P84AFBHuIohXnGdzm22VIsB01lQUiC1p9bpV4Jx0Kowm7aSS6i93S7w645KmayehMQmZkKGgsdl
 aHPxM1Mh9KZAVwaDKwCdjS1idmQugMWZ6i+W5c72hrxFlGrICZU9pXW+JK1FDe02PXzwDqyeH5o
 l2RB6rJcUgK2ywuuRddjPdJxH++YzYx4g6yMvAF1hNCEvtku0DplKMPVwCv9Yh/0m1ZUdLKy8li
 yNtLz/jFrBIUr6SvUDx2zDSySazC1Y8ND14CmKdYlS7DCSIvXiwIfAUjMVK74iHu8HdLfBV5sPE
 mxj/9ZCcrIA4vrlCCh86rd83+EcElIGfN8x7mMxVX+EZ+uGf3OiQ2fuHIwCqfIfso/pSSKQ5MWp
 3OUkyjiOfZXT/VA1G3iCEIx+QPubzX9ek2VOvoRNJJKOiBXkzHUCjo2GFBvxwox2mQggjDeDjd0
 MqIJ51T/pPU7vQF49w1MaZnzhPd/6yUY69EVwguAXh4aoHwgubnnkeod/J1TiFs=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8FC57A4C544C;
 Sat,  3 Oct 2026 09:02:14 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkb-000000007Zo-2maZ;
 Sat, 03 Oct 2026 07:01:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 08:59:40 +0200
Message-ID: <20261003070128.1295458-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 008/114] package/python-botocore: bump version
 to 1.43.103
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEphbWVzIEhp
bGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgpDYzogUmFwaGHDq2wgTcOpbG90dGUg
PHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgpDYzogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3Rz
QGdvb2dsZW1haWwuY29tPgotLS0KIHBhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3Rv
Y29yZS5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2Nv
cmUubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tYm90b2NvcmUvcHl0aG9uLWJv
dG9jb3JlLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUuaGFz
aAppbmRleCBmZGViOTI5MWVlLi5mZTQzOGE5ZTgwIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhv
bi1ib3RvY29yZS9weXRob24tYm90b2NvcmUuaGFzaAorKysgYi9wYWNrYWdlL3B5dGhvbi1ib3Rv
Y29yZS9weXRob24tYm90b2NvcmUuaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgbWQ1LCBzaGEyNTYg
ZnJvbSBodHRwczovL3B5cGkub3JnL3B5cGkvYm90b2NvcmUvanNvbgotbWQ1ICA2YThlNzU1MWY4
NmM4NzAxMzc3OTI4NTQxYjFhOWY0YiAgYm90b2NvcmUtMS40My4xLnRhci5negotc2hhMjU2ICAy
NzBkNjM1N2Q2NjI1NTBmZGI4NDk3M2VjMjQ3ZTAyYmVjZTBiNjI4M2Q5MGJmMzczMTljNzc1MzUx
NTMzNmU0ICBib3RvY29yZS0xLjQzLjEudGFyLmd6CittZDUgIDllN2EzMjEwY2MxNDZlNzdhZWMx
YzdjZDY2NTJlZTk0ICBib3RvY29yZS0xLjQzLjEwMy50YXIuZ3oKK3NoYTI1NiAgOGM3ZjIyMGUw
OWYzYjdlYzk5YzU5YzcxNmFhNjZjZjZmNWIyYjU3ZmQ4NzMxNTQ0MDU0ZjM3NzhhYTc0NGM2YSAg
Ym90b2NvcmUtMS40My4xMDMudGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNr
c3Vtcwogc2hhMjU2ICAwZDU0MmUwYzg4MDRlMzlhYTdmMzdlYjAwZGE1YTc2MjE0OWRjNjgyZDc4
Mjk0NTEyODdlMTFiOTM4ZTk0NTk0ICBMSUNFTlNFLnR4dAogc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYz
YmQzMWMzYzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICB0ZXN0
cy91bml0L2F1dGgvYXdzNF90ZXN0c3VpdGUvTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tYm90b2NvcmUvcHl0aG9uLWJvdG9jb3JlLm1rIGIvcGFja2FnZS9weXRob24tYm90b2Nv
cmUvcHl0aG9uLWJvdG9jb3JlLm1rCmluZGV4IGZmODkyYzYwZjguLjAyMjZlMWMyYjYgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLWJvdG9jb3JlL3B5dGhvbi1ib3RvY29yZS5taworKysgYi9w
YWNrYWdlL3B5dGhvbi1ib3RvY29yZS9weXRob24tYm90b2NvcmUubWsKQEAgLTQsOSArNCw5IEBA
CiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1QWVRIT05fQk9UT0NPUkVfVkVSU0lPTiA9
IDEuNDMuMQorUFlUSE9OX0JPVE9DT1JFX1ZFUlNJT04gPSAxLjQzLjEwMwogUFlUSE9OX0JPVE9D
T1JFX1NPVVJDRSA9IGJvdG9jb3JlLSQoUFlUSE9OX0JPVE9DT1JFX1ZFUlNJT04pLnRhci5negot
UFlUSE9OX0JPVE9DT1JFX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFj
a2FnZXMvMDMvYjcvNDE2YWU2ZjE0NjFkNmZlYzNiM2FhZmZjNDc1OTM3MTMxOWM3MWEyMWY3YWI0
YzMxMDZlZTU3NGZkYThkCitQWVRIT05fQk9UT0NPUkVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy8zYy84My9hY2JlZTZmMmUzYjFmMDJkZTkzNWZlZjBjNDhh
Mzg3NTExYmY5NzkxNDlkYzZiNDQ0NjZhYWFmYmE2YTUKIFBZVEhPTl9CT1RPQ09SRV9TRVRVUF9U
WVBFID0gc2V0dXB0b29scwogUFlUSE9OX0JPVE9DT1JFX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCiBQ
WVRIT05fQk9UT0NPUkVfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0IHRlc3RzL3VuaXQvYXV0
aC9hd3M0X3Rlc3RzdWl0ZS9MSUNFTlNFCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
