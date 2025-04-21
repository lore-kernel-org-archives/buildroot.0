Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9EFC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 18:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841568106A;
	Mon, 21 Apr 2025 18:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FI6RyjkN2tVH; Mon, 21 Apr 2025 18:21:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE5E481046
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE5E481046;
	Mon, 21 Apr 2025 18:21:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A37968
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 18:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A388403FA
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 18:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oph8T9tBbi5q for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 18:21:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6E51403D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6E51403D9
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6E51403D9
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 18:21:26 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e7158fdbbfcso521429276.1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 11:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745259686; x=1745864486;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HNnSupm4emEMOy6H3hoW+lSl+Ab4LBU6/2s08AIMi40=;
 b=lui0KiqLXN8h85u1vujh+feBlXJdBmdFHZm+2UNczTULf7BbahhyXm6/M51cCqZsvd
 iTvulWCeEobGIQuLsgR3+UgpJfO6bSIb3RVyb0rxTApuaBi3M7amYE2xViweZdFtoL1R
 hGtRYilwl7KGM55en7szyxm8eEhOAvPiUS5wxcNmmM3BBP3LtWTm/9n/ZHlr8iwPUH1i
 Tg4AAaWDBArQxTR1lqVaAYn0vOutrWCX1AGIdFULOi59yThlKV0tExFCtStbltqK4unf
 pqCiw6Rtj4eoxUFoDmIYY5b2aHodqOQbebc4fJI/bSQVVxOPR3Ij1ToLq42lvlxm1JPy
 5DRA==
X-Gm-Message-State: AOJu0YznjjnU0dH/o+zie31OoAhE9lg4Qws6yb0XMIBZ46WujHi89kuO
 M6vBxd5hv1ofW+z0+C7vA76JQyRkQzsLC/P5bOwJ95E2y6fTsUA0chuL6HSwlCcNqglvKeJXlef
 z+BNLaxPZXPs4WKk/r+1YA22+ODk=
X-Gm-Gg: ASbGncvbAwJecBOXxn2pHQV6HUXyjykPm8YM0nocURVk8LtMmTddZ2boOx55lTxf82s
 ZHYe1qeG9/QoOx/OEWtLEW53lCnFK60zAG2BYUcmxx+16WIQgW93i1OTZXexTqO5TJsaxhn6+8A
 lwq1gNlNXlSedX3f6IdTqy
X-Google-Smtp-Source: AGHT+IFLvU27sxyUwqSmgDGlVUT1+XhEwz/WzQurpVG2lusMrhEZlRQNP5x/rvJjZn/aobQVEm75TdONUtkWJaTUPEQ=
X-Received: by 2002:a05:6902:1685:b0:e72:8658:5848 with SMTP id
 3f1490d57ef6-e7297e88718mr8057918276.6.1745259685637; Mon, 21 Apr 2025
 11:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com>
 <dfe20dbb0429ce970599a992005b9ffa@free.fr>
 <CAPWx8vtcjfVZJLydqyUAJ_8WbOHkrfJm2DG-qS5TO+msfa4uBQ@mail.gmail.com>
 <e07d34b22ea6c85e2d50249f1b06ccd9@free.fr>
In-Reply-To: <e07d34b22ea6c85e2d50249f1b06ccd9@free.fr>
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Mon, 21 Apr 2025 21:21:14 +0300
X-Gm-Features: ATxdqUHJlDm4uJXrs7sRF_bBtoQZM9hQJyE4SvOGk4JZMn8dalLjGjr8Fy8QjCQ
Message-ID: <CAPWx8vtHtH0iCM4yUEnjA+J6oqirBGmwGYTg_VMHsex95iHOrQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745259686; x=1745864486; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HNnSupm4emEMOy6H3hoW+lSl+Ab4LBU6/2s08AIMi40=;
 b=AaQHaAp2wqI9e5xh+bmAiIXxpHDO4zdZbtJprq5yjl7dhXIf2xQcdP31FYpnB6HM26
 zuv5ByHmqELl/M1wWTZ4zTyb+D3D1sxLm3fAouh7d4pUzID60xVRIgzpzeeEMlbcuO8j
 NXMz95bNjtJCuQA93+224TPvEWEPjazFZOvbht81w+VxzNSILFH43r5yFmbLQYWlYlKO
 uAGwYf4v1ON/aQuaFXfBwmWP0WdWxDts2GhexAACJCMoRr+EU25oB83+swW6QYbrTexO
 kdRpqnySKzlU91fr3+odrTCd8CrTw83kQSX7yT5Ose6M48UNdC/RW3lGAt0KeZiRWQjp
 a+fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AaQHaAp2
Subject: Re: [Buildroot] host-m4 build on Fedora 42 fails
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

SGkgSnVsaWVuLAoKVGhhbmtzLCB0aGF0IHNvbHZlZCB0aGUgcHJvYmxlbSEgSSBuZWVkZWQgdG8g
cnVuICJtYWtlIGRpc3RjbGVhbiIKYmVmb3JlIGJ1aWxkaW5nIHdpdGggdGhlIHVwZGF0ZWQgbTQu
bWsgZmlsZS4gV2hpbGUgd2Ugd2FpdCBmb3IgYSBuZXcKbTQgcmVsZWFzZSBmcm9tIHVwc3RyZWFt
LCBJ4oCZbSBzaGFyaW5nIHRoZSBwYXRjaCB0aGF0IHdvcmtlZCBmb3IgbWUgaW4KY2FzZSBhbnlv
bmUgZWxzZSBlbmNvdW50ZXJzIHRoaXMgaXNzdWUuCgotLS0gYS9wYWNrYWdlL200L200Lm1rICAg
IDIwMjUtMDQtMDMgMTM6NTk6MjcuMjI0MjU0MzM4ICswMzAwCisrKyBiL3BhY2thZ2UvbTQvbTQu
bWsgICAgMjAyNS0wNC0yMSAyMTowNDoyMi4xMDc1NDYyNjIgKzAzMDAKQEAgLTEwLDQgKzEwLDgg
QEAKIE00X0xJQ0VOU0UgPSBHUEwtMy4wKwogTTRfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcKCitI
T1NUX000X0NPTkZfRU5WID0gQ0ZMQUdTPSIkKEhPU1RfQ0ZMQUdTKSAtc3RkPWdudTE3IgorCitI
T1NUX000X0NPTkZfRU5WID0gQ0ZMQUdTPSIkKEhPU1RfQ0ZMQUdTKSAtc3RkPWdudTE3IgorCiAk
KGV2YWwgJChob3N0LWF1dG90b29scy1wYWNrYWdlKSkKCk9uIE1vbiwgQXByIDIxLCAyMDI1IGF0
IDU6MDDigK9QTSBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPiB3cm90ZToKPgo+IEhpIEpv
c2VwaCwKPgo+IE9uIDE5LzA0LzIwMjUgMTg6NTYsIEpvc2VwaCBaaWt1c29va2Egd3JvdGU6Cj4g
PiBIaSBKdWxpZW4sCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgaW5mbyBhbmQgdGhlIHdvcmthcm91
bmQgdGlwIQo+ID4KPiA+IEkgdXBkYXRlZCBteSBwYXRjaCB0byB1c2UgQ0ZMQUdTPSIkKEhPU1Rf
Q0ZMQUdTKSAtc3RkPWdudTE3IiBsaWtlIHlvdQo+ID4gc3VnZ2VzdGVkLCBidXQgdGhlIGJ1aWxk
IHN0aWxsIGZhaWxzIHdpdGggR0NDIDE1IGFuZCBtNCAxLjQuMTkgLSBzYW1lCj4gPiBlcnJvcnMg
YXMgYmVmb3JlLiBTdHJhbmdlbHksIGlmIEkgYnVpbGQgbTQgb3V0c2lkZSB0aGUgYnVpbGRyb290
Cj4gPiBlbnZpcm9ubWVudCB3aXRoIHRob3NlIGZsYWdzLCBpdCB3b3JrcyBmaW5lLgo+ID4KPiA+
IEFueSBpZGVhIHdoYXQgZWxzZSBjb3VsZCBiZSBjYXVzaW5nIHRoZSB3b3JrYXJvdW5kIHRvIGZh
aWwgaW4KPiA+IGJ1aWxkcm9vdD8gQXJlIHRoZXJlIG90aGVyIGZsYWdzIG9yIHR3ZWFrcyBJIGNv
dWxkIHRyeSBpbiBtNC5tayBbMV0KPiA+IHVudGlsIHRoZSBuZXcgbTQgcmVsZWFzZSBpcyBvdXQ/
Cj4KPiBJIGp1c3QgdHJpZWQgYWRkaW5nIHRoZSBsaW5lIEkgc3VnZ2VzdGVkIGluIHBhY2thZ2Uv
bTQvbTQubWs6Cj4gSE9TVF9NNF9DT05GX0VOViA9IENGTEFHUz0iJChIT1NUX0NGTEFHUykgLXN0
ZD1nbnUxNyIKPgo+IE9uIGEgRmVkb3JhIDQyIGhvc3Qgc3lzdGVtICh1cGRhdGVkIGFzIG9mIG5v
dyksIGl0IHNvbHZlcyB0aGUKPiBob3N0LW00IGJ1aWxkIGlzc3VlLiBZb3UgbmVlZCB0byByZXN0
YXJ0IGZyb20gYSBjbGVhbiBidWlsZCwKPiB0aG91Z2guCj4KPiBJIHRlc3RlZCB3aXRoIHRoZSBj
b21tYW5kczoKPgo+ICAgICAgbWFrZSBxZW11X2FhcmNoNjRfdmlydF9kZWZjb25maWcKPiAgICAg
IG1ha2UgY2xlYW4KPiAgICAgIG1ha2UKPgo+IENvdWxkIHlvdSBjaGVjayBvbiB5b3VyIHNpZGUs
IHBsZWFzZT8KPgo+IEJlc3QgcmVnYXJkcywKPgo+IEp1bGllbi4KCgoKLS0gCkpvc2VwaCBaaWt1
c29va2EKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
