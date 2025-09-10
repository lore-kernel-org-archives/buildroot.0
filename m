Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F03CA0FED
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 19:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6AF961388;
	Wed, 10 Sep 2025 19:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHiXMoLwUvml; Wed, 10 Sep 2025 19:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73D076136A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73D076136A;
	Wed, 10 Sep 2025 19:07:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F1802BB3
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 19:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90B84841B2
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 19:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kOhLn3-OSGO for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 19:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D866841B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D866841B0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D866841B0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 19:07:33 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f78e3cdf9so8771016e87.1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 12:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757531251; x=1758136051;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0lI7SUrylg30hX/6IS5YRGfDEJ6zSw+9JgQZ89hN7U=;
 b=WN5K9CbVzSL+WGOuMho3CsezX2bOiZ9hQ2mbywep9/03VqNdxAOfoXjF0/bDNveS4C
 RypCx7MzsFsMzupKQKHMFUK/I1NPb2TIBreM4zKLuMqOXWeEaCRWXmVPtwpaQ+5bMtss
 L0j+M/1/E6IY9TMPbmjyBMjgnQZaOxQz7cO8ZYTeBJh2SaVNuGC3pYqGLOZAgrZoElEp
 4gSMdewYCphDFZieDPLJahMhehwzq8ErdISbxT86kam1h12R75HJ694UUl1SxhFF1Mht
 W9QsBk9B7y8syw/tOBtcjsrqFD3MZeBcBc2mpF07Dx/McDYa0SbA+MGea84oHc+IjRZT
 EppA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIiXYX6H3m6/9C8TcG+DUOvwe/8wEd6tReSwn9XnsmSudUpVdCbdphYHVyBNrMHQTXMbKHKQHb8H0=@buildroot.org
X-Gm-Message-State: AOJu0Yx8YYagTDFzhtxAQtBxFuCeyqrpAzUAkjuDxIAwyLQE3NBhq01z
 Zci0qIL7UeEy2MzV2wG1/Zv4kH0Yctyb2zMs92V2Au5zCE+yl216QlYH6CY52AS+Bhmtlpxr5b3
 KhdfhZxRSlQ==
X-Gm-Gg: ASbGnct6lJzywqSjlfGxGuOb4SD0MjLlNtJ42kD+grG+DVg6SJzsSUnBZOFw9TnwTka
 liJp33yKnZL+Zex58Pp+1uVFxTScvvhB7/DzcI5qTHpPiuvqR+8eWxp4kpzxR9k0GkA0T1zZluG
 8oGZvedIMAKroOoGBqvL3OjP6jsrLh9npFrC9x2GWQGQwrD16ld81ZldtkvGPwZs51vzXjs0Vk8
 U09HoAGevNDuCao8lHEu2Jg1YeYbtWulR5DZ1OGdV2PGH6YGJBWb7ddYEeLrsBIVg9GvgJ4SOG1
 bs5dUwkVo0xrT3gkfFnt9Zq9Xeoa1lbCJpCa3qB47et6DNaIrQc0vJOknBuwKhltMzpVJ8ySlUN
 9PVdnIoy20aMoBQy3Nu8EowlU6qOlPcuG9OAoW3u5VZ3FxmcP0kHATQWvrXWubXj7VQ==
X-Google-Smtp-Source: AGHT+IHvtuzzMnqbwZGPNI6jhvsRCGvjlkpKF0xxEVu4lkYHQwZinNz4KtplNPzLtxgwBu1HCCU/lw==
X-Received: by 2002:a05:6512:688:b0:55f:44b8:1ed8 with SMTP id
 2adb3069b0e04-56264cf6e8cmr5106651e87.57.1757531250607; 
 Wed, 10 Sep 2025 12:07:30 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56db891158fsm37929e87.30.2025.09.10.12.07.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 12:07:30 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-336e16f4729so57023711fa.1
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 12:07:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjFk93AMNvRBTe1CtYPejXraj13RsCpvrIvdK6M1yR3hHiYCKv4XNhAGah+SKc+4ibtewmgTwGYyE=@buildroot.org
X-Received: by 2002:a05:651c:308:b0:32b:2f4a:35e4 with SMTP id
 38308e7fff4ca-33b56211eaemr36273401fa.34.1757531249484; Wed, 10 Sep 2025
 12:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751377540.git.yann.morin@orange.com>
 <d23125d705a0c24ca91071624d507392ecfe7b0d.1751377540.git.yann.morin@orange.com>
 <a8b668d1-24da-4b18-8235-e98a29732884@smile.fr> <aL/bdHOwN/ENpcOl@yd-6wlzhs3>
 <CA+h8R2rxQ6Na-hG=BLZrNvL=Wu5bwur_8YeC3wNdFkjrKfsP4Q@mail.gmail.com>
 <69b87840-6431-412e-9f27-a8acb3112a7e@smile.fr> <aMFj2gv8Icxm+IDh@yd-6wlzhs3>
In-Reply-To: <aMFj2gv8Icxm+IDh@yd-6wlzhs3>
Date: Wed, 10 Sep 2025 12:07:18 -0700
X-Gmail-Original-Message-ID: <CA+h8R2prwcPxD-8QF+hYg0zAj22zT_Guo3LcXXFStpR8E82zXA@mail.gmail.com>
X-Gm-Features: Ac12FXyMuuNAaBgO3iQtML9IbeECRWWG_O2iR5rkeFxjok3oI4E0qJ3pESlL5Ek
Message-ID: <CA+h8R2prwcPxD-8QF+hYg0zAj22zT_Guo3LcXXFStpR8E82zXA@mail.gmail.com>
To: yann.morin@orange.com
Cc: Romain Naour <romain.naour@smile.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1757531251; x=1758136051; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0lI7SUrylg30hX/6IS5YRGfDEJ6zSw+9JgQZ89hN7U=;
 b=FGSNz51O+ZqZwCelqPKbFRz9Q9dkkZzTeLwulZsyMDjCZCUwstwNB218SILlA25vzY
 XV0nZoYd+qkZtbDC0Vwy/1qYpe/QOVFkmgeE68V2ODN1RlK9CwVoQrmbQBrQZARCWwR1
 wEuFVbJmWnyk5sGu00YW4D9fnX7DI2pp68YkxacGc8OVLzQuF7ZjpfcemTZjCBFyFp+J
 LcxYrUh3APgqx5ydKzwViwGN4Q/by+M8EdTHiye1Ry+4YcqrzEw/EjFb7ywuZCFZrtfU
 HHHP4yxyXbIow4/Lgq0MqlhpTVRo8Q7Aclu4bdBFjdaecnhHhgWx/uVkKdy/AOymSLsv
 0WAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=FGSNz51O
Subject: Re: [Buildroot] [PATCH 1/4 v2] package/pkg-golang: simplify
 installing multiple binaries
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCk9uIFdlZCwgU2VwIDEwLCAyMDI1IGF0IDQ6NDHigK9BTSA8eWFubi5tb3JpbkBvcmFu
Z2UuY29tPiB3cm90ZToKPgo+IFJvbWFpbiwgQWxsLAo+Cj4gT24gMjAyNS0wOS0xMCAxMzoxOSAr
MDIwMCwgUm9tYWluIE5hb3VyIHNwYWtlIHRodXNseToKPiA+IExlIDA5LzA5LzIwMjUgw6AgMTk6
NTYsIENocmlzdGlhbiBTdGV3YXJ0IGEgw6ljcml0IDoKPiA+ID4gT24gVHVlLCBTZXAgOSwgMjAy
NSwgMTI6NDfigK9BTSA8eWFubi5tb3JpbkBvcmFuZ2UuY29tCj4gPiA+IDxtYWlsdG86eWFubi5t
b3JpbkBvcmFuZ2UuY29tPj4gd3JvdGU6Cj4gPiA+ID4gV2hhdCBhYm91dCB0aGUgc3RhdHVzIG9m
IHRoaXMgc2VyaWVzPyBDaHJpc3RpYW4gaGFzIHByb3ZpZGVkIGhpcwo+ID4gPiA+IFJldmlld2Vk
LWJ5IGEgd2hpbGUgYmFjay4uLgo+ID4gPiBJdCBzdGlsbCBsb29rcyBnb29kIHRvIG1lIQo+ID4g
VGhhbmtzIGZvciB0aGUgcmVtaW5kZXIhCj4gPiBOb3cgdGhlIDIwMjUuMDggaXMgcmVsZWFzZSAo
YW5kIG5leHQgbWVyZ2VkIGluIG1hc3RlciksIHdlIGNhbiBnbyBhaGVhZC4KPiA+IEJ0dywgSSBy
ZXBsYWNlZCAyMDI1LjA4IGJ5IDIwMjUuMTEgaW4gdGhlIGxhc3QgY29tbWl0Lgo+Cj4gSSBtaWdo
dCBoYXZlIGJlZW4gYSBsaXR0bGUgdGlueSB3ZWVueSBiaXQgdG9vIG9wdGltaXN0aWMuIPCfmJwK
Pgo+ID4gQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCk5vdyB0aGF0IHRoaXMgaXMgbWVyZ2Vk
LCBob3cgZG8gSSByZW5hbWUgYSBidWlsZCBiaW5hcnkgYmVmb3JlIGluc3RhbGxpbmc/CgpIZXJl
J3MgYW4gZXhhbXBsZToKCmh0dHBzOi8vZ2l0aHViLmNvbS9za2lmZm9zL2J1aWxkcm9vdC9ibG9i
L3NraWZmL3BhY2thZ2UvZ2VudWluZXRvb2xzLWltZy9nZW51aW5ldG9vbHMtaW1nLm1rCgpUaGFu
a3MsCkNocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
