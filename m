Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3362EC3ABDD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 21:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC54E606BF;
	Sat, 17 May 2025 21:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lG8op7UO7T-D; Sat, 17 May 2025 21:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D90E60B07
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D90E60B07;
	Sat, 17 May 2025 21:00:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 754AFE4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B64360AD6
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhrdLkNZfZ7B for <buildroot@buildroot.org>;
 Sat, 17 May 2025 21:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1F08C606BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F08C606BF
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F08C606BF
 for <buildroot@buildroot.org>; Sat, 17 May 2025 21:00:45 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-30db1bd3bebso29621321fa.2
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747515644; x=1748120444;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ws7S5wrirQo75j1S/xNX9O6vl/qotR5CU/qdR6xTZps=;
 b=UUKVTLBnBOehBSS3juSS6dytaG2mifchOPY2qHvgEwDnGDaqyJwmy6wZQ44rxHUUpT
 I20HUlLVPj4RRcljqADz0AfrEhWtqk6EyrChR88w/4+Oy1CO38sqOtEY3O4FDEY+HPmu
 CMzRwZ8wtMwofNiU+g429liwKZ2VZoV/6qZMy2f39TiJlpNmGfUnQRaVb5g0QyEdpp5B
 Xcsn1CQgqEuYDQRR78hH7QdLoSqFjAUiOQHKj4CIp6CrqHbqAcUHoZ/LuSIxa2u3rzIx
 gZOqm+ZoLdhWqmkb7dFud2D10hYpJlts/Us20RQpef+H2Z3RWxRmhMTA3PVJN85iST/G
 4vaw==
X-Gm-Message-State: AOJu0YxxnagknHfEmu5EC6zgZJW56yv4ItZlSQliMjB8UWp4ARxDVRBl
 VjC1zr2jJb3twoI+MRXeOc2dvXr/Op1hq4gj/vALp390ghAg4gh7VT9mEk/5j0sJuw2p5MxlyVU
 mQ/GO67aqPqhXwfq1kwDIFdJ3MaV3m9HQGrjD
X-Gm-Gg: ASbGnctA3ub5c4tDj09Dt6pLANb9Ji8PvVpOJ0xjXKYzCvlvOuJtqwtgWAYbx+kxuZm
 WugGFYChuv2LooSoE2nFj+9M/f9in/azEFRo28f7n2/PD97rylloijm3uuqtvnkwWeeYn1/Dw99
 intBpD3W+i4DHX/2dmWAY2U1GuD78Wx4Otxq7fpdHowdDg3vSt2oCrFcIkvY1HKwONqYE=
X-Google-Smtp-Source: AGHT+IEm9f1CChaUf850KtJ9KMO8sh7ZI6P8CLbUWybw2Z/JA2dXkgpC26FlSAUqI9zOsATSjL+Jqd6Fz+1Q7TLsNvg=
X-Received: by 2002:a05:651c:3131:b0:30c:2d44:c212 with SMTP id
 38308e7fff4ca-328096b5832mr25990401fa.9.1747515643581; Sat, 17 May 2025
 14:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250430055956.288191-1-yegorslists@googlemail.com>
 <20250517170313.74860009@windsurf>
In-Reply-To: <20250517170313.74860009@windsurf>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 17 May 2025 23:00:29 +0200
X-Gm-Features: AX0GCFtfk4TMx9vrrZ-ViPFw6zQ4MIQWN1-c4cm7J02bQHhb6K6SYR9uXWeIwOY
Message-ID: <CAGm1_ktd3Qwma-0c3fkuUX5SXMpbDfVo3CbT1eSoPq0T_Nw-4Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: yegorslists--- via buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1747515644; x=1748120444; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ws7S5wrirQo75j1S/xNX9O6vl/qotR5CU/qdR6xTZps=;
 b=ZGcvWDbZgKLpUADuaPbZU522iC5TGpqHvn6bru8NGll5Z4i1SH3JaylyeEmwXB3+eB
 GBNKyNBB14OZYsDI6HQucmvQZ8bDxtjjUwt99PMFKc+gPN/sTuGt4Wj6MmpLR8NpAqXn
 /h+tuyhwQqg14+JEWZaunkt+7FPtad2ciQyCoty4TBVMfbsNBqwwtwwzvJkvwdbJsFZU
 BHvI0ppiGvyqY0qHIuRrCMts4SJ8ozxB5BQ5En13Brgf5Zqn9DJed7TyoyfAQiGftgyi
 5YVHH6Q4YlF7d+odBNJgkcs1F6ME0X4ToPXAnRUZ98i6xCspBeov737G9DD7A697qbMp
 +3sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZGcvWDbZ
Subject: Re: [Buildroot] [PATCH v2] package/lpac: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gU2F0LCBNYXkgMTcsIDIwMjUgYXQgNTowM+KAr1BNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gWWVn
b3IsCj4KPiBPbiBXZWQsIDMwIEFwciAyMDI1IDA3OjU5OjU2ICswMjAwCj4geWVnb3JzbGlzdHMt
LS0gdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gPiBG
cm9tOiBZZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+Cj4gPgo+ID4g
U2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29t
Pgo+Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBJIGhhdmUgYXBwbGllZCwgd2l0aCBv
bmUgc21hbGwgY2hhbmdlIChzZWUKPiBiZWxvdykuCgpUaGFua3MuCgo+IEJ1dCBvdXQgb2YgY3Vy
aW9zaXR5LCBjb3VsZCB5b3UgZXhwbGFpbiB3aGF0IExQQUMgaXMgdXNlZnVsIGZvcj8gSQo+IHRy
aWVkIHRvIHJlYWQgYSBiaXQgb24gdGhlIHRvcGljLCBidXQgaXQncyBxdWl0ZSBjb25mdXNpbmcu
IEluIHdoYXQKPiBzaXR1YXRpb24gaXMgTFBBQyBuZWVkZWQsIG9uIGVtYmVkZGVkIExpbnV4IGRl
dmljZXM/CgpZb3UgbmVlZCB0aGlzIHRvb2wgdG8gbWFuYWdlIGVTSU0gcHJvZmlsZXMuIFNlZSB0
aGVzZSBibG9nIHBvc3RzIFsxXSwKWzJdIGZvciBkZXRhaWxzLgoKWzFdIGh0dHBzOi8vdGVjaHNo
aXAuY29tL2Jsb2cvaG93LXRvLXVzZS1hbi1lc2ltLWluLWxpbnV4LTcvClsyXSBodHRwczovL3Rl
Y2hzaGlwLmNvbS9ibG9nL2VzaW0tZXVpY2MtYW5kLXNncC1zdGFuZGFyZHMtZW5hYmxpbmctaW90
LWNvbm5lY3Rpdml0eS0yLwoKWWVnb3IKCj4gPiArTFBBQ19WRVJTSU9OID0gMi4yLjEKPiA+ICtM
UEFDX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGVzdGttZS1ncm91cCxscGFjLHYkKExQQUNfVkVSU0lP
TikpCj4gPiArTFBBQ19MSUNFTlNFID0gTEdQTC0yLjArIChsaWJyYXJ5KSwgQUdQTC0zLjAgKHBy
b2dyYW1zKSwgTUlUIChjanNvbikKPgo+IFRoZSBsaWJyYXJ5IGxpY2Vuc2UgaXMgTEdQTC0yLjEr
LCBzbyBJIGZpeGVkIHRoYXQgdXAuCj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21h
cyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
