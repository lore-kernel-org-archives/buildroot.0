Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A8DC5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C386B60A6A;
	Thu, 30 Jul 2026 21:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3L4Feu2VacmL; Thu, 30 Jul 2026 21:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C2D60ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785446437;
	bh=t0S0qkWxIKv1Vgr0pytAdXSgzflBEjotHb3zGLO4QFM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rXqzQavKE9tK10QGRXv3B0sybNXollavqbh0kd8KM2W1sjRvAVFYd/KudQ/gnrKCO
	 eEX91h+1/c8OtJ9XQkwIR0km2xNC2clAmuMlV9GlBHMiqvcalgVVh3HmKvao+yvxx8
	 ZUbSJd2VyA8+fB2ZuE7iLDtgoawvfJ5pbmKOoHXFKBvKFv0RIdst4ZVY5u8Kx8a1dT
	 w8PPTB/IS8aZYcv+qWYFvRV9CXTgWuXTSMCz5CQu0hDslqHRcVUL1hdv45e1VyP6qS
	 zxfwpr3L7/J9obB/P7v38dPr8zSYBM/lN+iXk/rH7z6UxwA87FxjpJA6uIQHGxcW4s
	 tNobcLAwCND1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2C2D60ABE;
	Thu, 30 Jul 2026 21:20:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BBB669
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714B4811E6
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6mABWjXdyce for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:20:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E3588115E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3588115E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E3588115E
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:20:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4CA43B0053D;
 Thu, 30 Jul 2026 23:20:28 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 30 Jul 2026 23:20:27 +0200
MIME-Version: 1.0
Date: Thu, 30 Jul 2026 23:20:27 +0200
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org, Gary Bisson <bisson.gary@gmail.com>, Erik
 Larsson <karl.erik.larsson@gmail.com>, Refik Tuzakli
 <tuzakli.refik@gmail.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-1-548f3fc77a59@armadeus.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
 <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-1-548f3fc77a59@armadeus.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <a7621d0ac33074a6e07512563f06d5a6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785446432;
 bh=jzPnXUVVxTRuiChyoxPI77IOkqJlbOADQa4gazJibgs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=b0R8QzbaeT+S1MEEonK4bJHKqOUY02jowiQZPMoAE799MvPQ9ylmBmjZjn6HF+jSJ
 UZETj5gXgoUafNBEdagc4Xo+18/3Nj4Txa60BgACEJaZp+gu+m/NH+sEPI9pIi6kBJ
 QaTGacH26XwrY2kroLF4Wik81vtNbOpgc0JQYBlWTej7DswIWM2n7Y/DkFsAolWYDy
 wc08M4UU15H4oraGl219C8tnCmZJqtlChMNajPxGiEivHoiS//jeTOSVu425dxdFnH
 zC5OL7GESe5iMRqlHqj5+xpvo0bAW8g+2+RqMRqZzyntzZAbmdGwSFP5izV2fxbtFI
 QNKBDvbg6Yedg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b0R8Qzba
Subject: Re: [Buildroot] [PATCH 1/9] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDMvMDIvMjAyNiAxNTozOCwgU8OpYmFzdGllbiBTenltYW5za2kgd3JvdGU6Cj4gVGhpcyB2
ZXJzaW9uIGlzIGFsaWduZWQgd2l0aCBOWFAgTGludXggQlNQIHZlcnNpb24gIkxGNi4xMi40OV8y
LjIuMCIuCj4gCj4gTGljZW5zZSBoYXNoZXMgY2hhbmdlZCBiZWNhdXNlIHRoZSBMQV9PUFRfTlhQ
X1NvZnR3YXJlX0xpY2Vuc2UgY2hhbmdlZAo+IGZyb20gInY1OCBOb3ZlbWJlciAyMDI0IiB0byAi
djYzIE1heSAyMDI1Ii4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpTZXJpZXMgYXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
