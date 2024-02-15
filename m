Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BF4C48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 18:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18398606EA;
	Thu, 15 Feb 2024 18:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2FezLj1xFv4; Thu, 15 Feb 2024 18:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F2460FF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24F2460FF1;
	Thu, 15 Feb 2024 18:50:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFA651BF842
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 18:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA5AA60FFC
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 18:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lj8KZHSONHdl for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 18:50:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 916EB606EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 916EB606EA
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 916EB606EA
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 18:50:32 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-411de7c6b3dso9479065e9.3
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 10:50:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708023030; x=1708627830;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XNUL2gFazUYOSTHwM8nE03LbSL3cVESQUqpviSgKFis=;
 b=t2Mqd49xNlnVWmm2yL7PY7qJX7sC6L/ItavCsSewnCIcLuo6/qNMlo/Ajq6xVE4rXb
 P2UsAIx4jMaTr/ktYm2w0QnOWuq8SfGiWvAHgovp6MW5p6BW1LVfBJKoPuQun3cPzggd
 jaIpJITkOnV87IAUHuDOuuJfTA//rd4nUdlVYmJUYSsULSUGf/ONcX31P3lxrldLXJtb
 rcKjAZrmBO45RadKDcb1QdrGvaly4SOI4we0lKYw0Y3IKcZAsW50GUifghN6hQ+m2hKp
 iqqQEgxYboddcEl/Upteu3OXfn3pXh+GyU/SGGhFzIdZB9LrjvXAaWjiNnymla47HCah
 cA+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCURIzPC9FrE+Wns9L9R17AfQS4YwH5fSSnZYJLyr9UhiHZxVOlA/+y0l1jr2v0eCNwV1fD83aiwjhSTvY1zbQ0EQBjeo39ugg==
X-Gm-Message-State: AOJu0YyqamX8jb+SnXmUj3G9pBXFQ0SixBqC3k+92lEpcTfxB3IW6931
 /uPQX6x3lzRFB21TcCJthZ3MK3NYR1ev+l8aNk5tF4nycBlxUqmPvUv+Y3VEUsA=
X-Google-Smtp-Source: AGHT+IFmWwTTPsOW10nAUmlYgKz5/TUMyS98peSi2fB7HlCf7rtq3kbVghX1O1dXIFKELuWmcnbkyg==
X-Received: by 2002:a05:600c:46cf:b0:410:8071:6931 with SMTP id
 q15-20020a05600c46cf00b0041080716931mr2055108wmo.20.1708023030412; 
 Thu, 15 Feb 2024 10:50:30 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adfcd82000000b0033b79d385f6sm2530004wrj.47.2024.02.15.10.50.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 10:50:29 -0800 (PST)
Message-ID: <4f2fdb3c732480061d815f9f898da9fea9b77387.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Thu, 15 Feb 2024 19:50:30 +0100
In-Reply-To: <7e253e56-25f4-494a-98d9-e0d908517acd@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
 <8981fdd9313957b6f0174ac03006db1063b395f7.camel@gmail.com>
 <7e253e56-25f4-494a-98d9-e0d908517acd@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708023030; x=1708627830; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XNUL2gFazUYOSTHwM8nE03LbSL3cVESQUqpviSgKFis=;
 b=IjUVTpBbsSrsf2UrSO+YHxz77DSYdVYfVxvQmtABlovM9qFkhPQ6m72aTTRYT9/3e6
 rJ9wVSi+D0DuGxNKFYVNUkcHB7qgT/h+Xa+ObwqekzM+yNK1PmmoxWbPfpljDkt3YWa5
 0COTUzQjh+pXtWawVyVFAgFaedoJNwKLHjaNIEjvQtQdZ63P+m9quLO0zcxJwlJXQj7c
 TbqcNR6V53Y+/1tnv/xuy+dl2GxURx2QPU3q2baORqFMruKpfzTIFsorSlAvD1Eq4XHj
 v8XrTsyNhXaqZFNy6+EhvlfgiY2+5c9UVFcrlrQjYb03hgiDRBz8GTyFNikW9hxhoBse
 76Ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IjUVTpBb
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVGh1LCAyMDI0LTAyLTE1IGF0IDEyOjI2ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gPiBPbiBUdWUsIDIwMjQtMDItMTMgYXQgMTg6MjggKzAxMDAsIFJvbWFpbiBO
YW91ciB3cm90ZToKPiA+ID4gLWNob2ljZQo+ID4gPiAtCXByb21wdCAiU2VjdXJpdHkgdHlwZSIK
PiA+ID4gLQloZWxwCj4gPiA+IC0JwqAgVGhlIHRhcmdldCBTb0Mgc2VjdXJpdHkgdHlwZSBvcHRp
b24gZm9yIGltYWdlIGdlbi7CoCBWYWxpZAo+ID4gPiAtCcKgIG9wdGlvbnMgYXJlICJncCIgZm9y
IEdlbmVyYWwgUHVycG9zZSBkZXZpY2VzLCAiaHMtZnMiIGZvcgo+ID4gPiAtCcKgIEhpZ2ggU2Vj
dXJpdHkgLSBGaWVsZCBTZWN1cmFibGUgZGV2aWNlcywgb3IgImhzIiBmb3IgSGlnaAo+ID4gPiAt
CcKgIFNlY3VyaXR5IC0gU2VjdXJpdHkgRW5mb3JjaW5nIGRldmljZXMuwqAgTm90ZSBmb3IgYWxs
IEhpZ2gKPiA+ID4gLQnCoCBTZWN1cml0eSBkZXZpY2UgdmFyaWFudHMgdGhlIFRJX1NFQ1VSRV9E
RVZfUEtHIGVudmlyb25tZW50YWwKPiA+ID4gLQnCoCB2YXJpYWJsZSBtdXN0IGJlIGRlZmluZWQg
YXQgYnVpbGQgdGltZSBwb2ludGluZyB0byBhIHZhbGlkCj4gPiA+IC0JwqAgY29yZS1zZWNkZXYt
azMgZm9sZGVyIGxvY2F0aW9uLCBvdGhlcndpc2UgdGhlIGJ1aWxkIHdpbGwKPiA+ID4gLQnCoCBm
YWlsLCBzZWUKPiA+ID4gLQnCoCBodHRwczovL2dpdC50aS5jb20vY2dpdC9zZWN1cml0eS1kZXZl
bG9wbWVudC10b29scy9jb3JlLXNlY2Rldi1rMwo+ID4gPiAtCj4gPiA+IC1jb25maWcgQlIyX1RB
UkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9HUAo+ID4gPiAtCWJvb2wgImdwIgo+ID4gPiAt
Cj4gPiA+IC1jb25maWcgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9IU19GUwo+
ID4gPiAtCWJvb2wgImhzLWZzIgo+ID4gPiAtCj4gPiA+IC1jb25maWcgQlIyX1RBUkdFVF9USV9L
M19JTUFHRV9HRU5fU0VDVFlQRV9IUwo+ID4gPiAtCWJvb2wgImhzIgo+ID4gPiAtCj4gPiA+IC1l
bmRjaG9pY2UKPiA+IAo+ID4gYW5vdGhlciBvYnNlcnZhdGlvbiBJIG1hZGUganVzdCBub3c6IHBy
ZXZpb3VzbHkgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9HUD15Cj4gPiB3YXMg
dGhlIGRlZmF1bHQsIHdoaWNoIGRpZG4ndCBib290IG9uIG15IEhTLUZTIFNvQy4KPiA+IAo+ID4g
WW91IHBhdGNoc2V0IHN0YXJ0ZWQgb3V0LW9mLXRoZS1ib3gsIHdoaWNoLCBJIGNvbmNsdWRlLCBt
ZWFucywgSFMtRlMgaXMgbm93IHRoZQo+ID4gZGVmYXVsdCBmb3IgQU02MnguIEknbSBub3Qgc3Vy
ZSBpZiB0aGlzIGlzIGEgcHJvYmxlbSwgdGhvdWdoLgo+ID4gCj4gCj4gSSBkb24ndCB0aGluayBz
bywgdGhlIGFtNjJ4IGRlZmNvbmZpZyBzaG91bGQgc3RpbGwgYmUgZm9yIEdQIFNvQyBieSBkZWZh
dWx0LgoKSSdtIHByZXR0eSBzdXJlIGl0J3MgSFMtRlMgYnkgZGVmYXVsdCwgYmVjYXVzZSBHUCAo
YXMgb2YgdG9kYXlzICJtYXN0ZXIiKQoKPj4+IHRpLWszLWltYWdlLWdlbiAwOC4wNi4wMC4wMDcg
RXh0cmFjdGluZwpnemlwIC1kIC1jIC9ob21lL2FsZXgvcmVtb3RlL2J1aWxkcm9vdC9kbC90aS1r
My1pbWFnZS1nZW4vazMtaW1hZ2UtZ2VuLTA4LjA2LjAwLjAwNy50YXIuZ3ogfCAvaG9tZS9hbGV4
L3JlbW90ZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL3RhciAtLXN0cmlwLWNvbXBvbmVudHM9
MSAtQwovaG9tZS9hbGV4L3JlbW90ZS9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3RpLWszLWltYWdl
LWdlbi0wOC4wNi4wMC4wMDcgICAteGYgLQo+Pj4gdGktazMtaW1hZ2UtZ2VuIDA4LjA2LjAwLjAw
NyBQYXRjaGluZwo+Pj4gdGktazMtaW1hZ2UtZ2VuIDA4LjA2LjAwLjAwNyBDb25maWd1cmluZwpj
cCAvaG9tZS9hbGV4L3JlbW90ZS9idWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy90aS1zeXNmdy90aS1m
cy1maXJtd2FyZS1hbTYyeC1ocy1mcy5iaW4gL2hvbWUvYWxleC9yZW1vdGUvYnVpbGRyb290L291
dHB1dC9idWlsZC90aS1rMy1pbWFnZS1nZW4tMDguMDYuMDAuMDA3CmNwOiBjYW5ub3Qgc3RhdCAn
L2hvbWUvYWxleC9yZW1vdGUvYnVpbGRyb290L291dHB1dC9pbWFnZXMvdGktc3lzZncvdGktZnMt
ZmlybXdhcmUtYW02MngtaHMtZnMuYmluJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQptYWtl
OiAqKiogW3BhY2thZ2UvcGtnLWdlbmVyaWMubWs6MjczOiAvaG9tZS9hbGV4L3JlbW90ZS9idWls
ZHJvb3Qvb3V0cHV0L2J1aWxkL3RpLWszLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcvLnN0YW1wX2Nv
bmZpZ3VyZWRdIEVycm9yIDEKClNvIG92ZXJhbGwsIGZvciBIUy1GUyBpdCBkb2Vzbid0IGxvb2sg
YXMgYSByZWdyZXNzaW9uIHdpdGggeW91IHBhdGNoc2V0LApidXQgcmF0aGVyIGFzIGltcHJvdmVt
ZW50LCBldmVuIHRob3VnaCBpdCBkb2Vzbid0IGJvb3QsIGJ1dCBpdCBidWlsZHMKYXQgbGVhc3Qu
Li4KCkkgY2FuIHRyeSB0byBsb29rIHdoYXQgY291bGQgYmUgdGhlIHByb2JsZW0gd2l0aCBVLUJv
b3QgZW52aXJvbm1lbnQuLi4KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
