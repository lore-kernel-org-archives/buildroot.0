Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0029CD5BD1
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 08:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BA2884C77;
	Thu, 28 May 2026 08:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HS-LpUQ5zZRr; Thu, 28 May 2026 08:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABEB084C9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779956183;
	bh=JYK3Yy/Dw/wgvVWaJKQdjVjj/udNc1Hot9BeQUc/nBI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=f08VuksaIrTI8mU7DktM4MYgJ+/TWRQWnlcIgg/BvHxh6kD690pCyA1aoJR2Tz41p
	 kMyPMPOrCbAsIIXTe/TziuqnlwCWXZZzYusoHWw1X+aJlPYHPrX6IH8knYTiZjGhGe
	 rKVJeNzjKotpe6GnDYsk43F0pM5AiyjHx6WYXVVW4eCPmztW+a4sU/N6R/1RkvE8R3
	 ocOzO5v+MOIpJ2vR8aW5eVU05s9VsDayb9RUgf5ItcnQh1Qu+xsNKu90gknEt3qGjY
	 BDtVXhhJ1OgvJ6ImiVLNvgVlDBD3UT9GHC3n/W4PgqeJ6UPFZLd94A6UiO/trJ5O5v
	 3r+DwJ7OkHezg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABEB084C9D;
	Thu, 28 May 2026 08:16:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2F3CA21
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F2442107
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rw9VlZiWX0aJ for <buildroot@buildroot.org>;
 Thu, 28 May 2026 08:16:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A94A0420F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A94A0420F5
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A94A0420F5
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:16:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5FACD1A36FD;
 Thu, 28 May 2026 08:16:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C8CC60495;
 Thu, 28 May 2026 08:16:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0BDFB10888237; 
 Thu, 28 May 2026 10:16:13 +0200 (CEST)
Date: Thu, 28 May 2026 10:16:11 +0200
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, julien.peeters@eove.fr,
 thomas.petazzoni@bootlin.com, Gary Bisson <bisson.gary@gmail.com>, Refik
 Tuzakli <tuzakli.refik@gmail.com>
Message-ID: <20260528101611.1febaf55@kmaincent-XPS-13-7390>
In-Reply-To: <20260219103651.753932-2-kory.maincent@bootlin.com>
References: <20260219103651.753932-1-kory.maincent@bootlin.com>
 <20260219103651.753932-2-kory.maincent@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1779956176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=509WqddbKR+d6lyaU0ChsSlhnXgwAwMiELuB2soou2A=;
 b=BghxHlRKPli19+VA+KCZsODSm/Vh1ggRWoBRa8FcWnOv+FmmYTiy32PJhHpKN9SwnqEmyR
 ZjTt5ayfV57kDlJNCk61VTyCLp4JN1EO0/OJD19JdtGn+9xUH3BQvUg8u4Zf0NmNuRzhC3
 /1KWdZ8jPCjf0Ppg2LR+NdFPNPgcoLTaos00rA3IC2Q9sphSdC7uth+a+DuOASDg5o4rJ7
 2U+aAChV02d7Tw5KfVxfnthTFEBcfsB561q5ssASs7hcF8W6MD7tBCgtMCGa2dMIBV03rR
 IffBypOxIQQGH34uCE/ch8o14jjGl6f5OXYY8gdl1pZl4602K33Hrml/ukVj1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=BghxHlRK
Subject: Re: [Buildroot] [PATCH 1/2] package/freescale-imx/firmware-ele-imx:
 install with original filename
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxOSBGZWIgMjAyNiAxMTozNjo0OCArMDEwMApLb3J5IE1haW5jZW50IHZpYSBidWls
ZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gSW5zdGVhZCBvZiBjb3B5
aW5nIHRoZSBBSEFCIGNvbnRhaW5lciBpbWFnZSBhbmQgcmVuYW1pbmcgaXQgdG8KPiBhaGFiLWNv
bnRhaW5lci5pbWcsIGluc3RhbGwgaXQgcHJlc2VydmluZyBpdHMgb3JpZ2luYWwgZmlsZW5hbWUg
YW5kCj4gY3JlYXRlIGEgYWhhYi1jb250YWluZXIuaW1nIHN5bWxpbmsgcG9pbnRpbmcgdG8gaXQu
Cj4gCj4gVGhpcyBpcyByZXF1aXJlZCBmb3IgVS1ib290J3MgYmlubWFuIHRvb2wsIHdoaWNoIGxv
Y2F0ZXMgdGhlIGZpcm13YXJlCj4gYnkgaXRzIGFjdHVhbCBmaWxlbmFtZSB3aGVuIGFzc2VtYmxp
bmcgdGhlIGJvb3QgaW1hZ2UuCgpIZWxsbywgCgpBbnkgbmV3cyBvbiB0aGlzIHNlcmllcz8KClJl
Z2FyZHMsCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQga2Vy
bmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
