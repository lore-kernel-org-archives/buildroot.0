Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE6CC369AB
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 19:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C653E810A5;
	Mon, 21 Apr 2025 19:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_S0xjQV4Nyg; Mon, 21 Apr 2025 19:02:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA70081091
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA70081091;
	Mon, 21 Apr 2025 19:02:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA0E01A0
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 19:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA30E81066
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 19:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3V4X5zpLzaDH for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 19:02:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F0C6E81064
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0C6E81064
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0C6E81064
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 19:02:30 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e7271b39a4fso517611276.3
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 12:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745262150; x=1745866950;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R6PSTjh8Nicae4cFdLm+jwsvBhDnQBfBFFhqgcMSIwg=;
 b=tczBKa3bFPnDUtJWbHrQfH5mYYYmNe6vyX0/OdFwG1pHYBJodzbbwv6cIwBgTiDCXm
 8dyfu5BJfFRHxStW09uNmk7L1yBdMykkIFpKDH89ti93c4BS7A0lJ1kI0nStpysqokC3
 JqYOMLlhxwlqxTFdpWHBO3zx/abe/Cvyd3jY4ZK9FmIUVK04lx/O/mJC3NhIGB8iZy5r
 FPmcjbbvIq5+PX/dwJ8tUj5auLW5frdjs4nZKearJ7hgM/W6DChJuFr3ZDNH2Iun7xbf
 e2SzuTKRRUeg0vdr0/XCrg3ETpEK5HnBA/RBQCxSKN26GwNl+0aH1uX4AsrHHnp8S7qo
 w4Cg==
X-Gm-Message-State: AOJu0YxRqUmNcFwUzzHM/BMwl+GqJRCeUN+izd9taqPHav+BM1arKbUA
 SziDrR71KrsrWv7w6SDhdBHc9nunBJ5ZFOVEEQdoNVWQiRJ+tDxjKsTfZVlXMAEv4xcxfLnmyTA
 m8v3Sb932CSLjhr34I80yPNFTXwSvaNlJsb4=
X-Gm-Gg: ASbGncvO6GFYNcc1rgi3oErARd32j21/1ggb9t4V8nfXLyoCnlreTdc6Srbm0p4OWf3
 kGuio1Zueg5vhD20CqlVEpNurBEDUQsGCJ/gvmcovNfYc5N5taP9/Rg1CtCgtH+vrAZMp/EWm8U
 HbNVfyYSE0/BWH0xnhtUa+
X-Google-Smtp-Source: AGHT+IFlHJUiS2tI8GJ+HGxiZE7qPqbSI6LNgKSJrWrW2ILBPBdtmGXV3lf81eC7sWqd+Y6h/RjBg0S6MpdGlAkHax8=
X-Received: by 2002:a05:6902:1209:b0:e60:9fb1:1f9f with SMTP id
 3f1490d57ef6-e7297d9e564mr7399149276.1.1745262149711; Mon, 21 Apr 2025
 12:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com>
 <dfe20dbb0429ce970599a992005b9ffa@free.fr>
 <CAPWx8vtcjfVZJLydqyUAJ_8WbOHkrfJm2DG-qS5TO+msfa4uBQ@mail.gmail.com>
 <e07d34b22ea6c85e2d50249f1b06ccd9@free.fr>
 <CAPWx8vtHtH0iCM4yUEnjA+J6oqirBGmwGYTg_VMHsex95iHOrQ@mail.gmail.com>
In-Reply-To: <CAPWx8vtHtH0iCM4yUEnjA+J6oqirBGmwGYTg_VMHsex95iHOrQ@mail.gmail.com>
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Mon, 21 Apr 2025 22:02:16 +0300
X-Gm-Features: ATxdqUGf_VYnQsyENs5MzsGYJjnz3n829VzGGV4ntM8m7FQ8L_XVZUKetKduHJU
Message-ID: <CAPWx8vvq0BgguhEfUnLt7-qm2kqTU4VCKjb7i2L+sXG9HbeOMQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745262150; x=1745866950; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R6PSTjh8Nicae4cFdLm+jwsvBhDnQBfBFFhqgcMSIwg=;
 b=JVudWIW5SRIvYtoIqmBBxMCpDxCzB3NOxp3c3dbBhwQTHUVXpVzeAmiZOTYfRQJsmg
 n7FarWhrHlS54JhQgBpyONrwiwlBdRjp2nDuqigFioNsh1h1HututhSIqVzRxQiyx7YZ
 TDDQZ8EFzVerR5IYl/KlMi4t/zpISB9jSEH3jH2bb4aIXGm8qUUNBmtylPjPUTd0jwLs
 cs7d4OejZoFg3Hkve7TKdSN9rmNp4xFXWRCRJJtgczXQQ+vUWZRDqmxx0WNalQRVauvk
 8Co9xbLw+nUFaYXQx2rfHZWp/e9LNpFwkugqrjVBAcgzH3n3gRVvMPFf+mwaa4RadxDd
 KDvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JVudWIW5
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

SSB0aGluayBJIHJ1c2hlZCB0aGUgcHJldmlvdXMgcGF0Y2ggLSBoZXJl4oCZcyB0aGUgY29ycmVj
dGVkIHZlcnNpb24uCgoKLS0tIGEvcGFja2FnZS9tNC9tNC5tayAgICAyMDI1LTA0LTAzIDEzOjU5
OjI3LjIyNDI1NDMzOCArMDMwMAorKysgYi9wYWNrYWdlL200L200Lm1rICAgICAyMDI1LTA0LTIx
IDIxOjQxOjQ1LjU4OTcxNzMwMiArMDMwMApAQCAtMTAsNCArMTAsNiBAQAogTTRfTElDRU5TRSA9
IEdQTC0zLjArCiBNNF9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwoKK0hPU1RfTTRfQ09ORl9FTlYg
PSBDRkxBR1M9IiQoSE9TVF9DRkxBR1MpIC1zdGQ9Z251MTciCisKICQoZXZhbCAkKGhvc3QtYXV0
b3Rvb2xzLXBhY2thZ2UpKQoKT24gTW9uLCBBcHIgMjEsIDIwMjUgYXQgOToyMeKAr1BNIEpvc2Vw
aCBaaWt1c29va2EgPGpvc2VwaHppa0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgSnVsaWVuLAo+
Cj4gVGhhbmtzLCB0aGF0IHNvbHZlZCB0aGUgcHJvYmxlbSEgSSBuZWVkZWQgdG8gcnVuICJtYWtl
IGRpc3RjbGVhbiIKPiBiZWZvcmUgYnVpbGRpbmcgd2l0aCB0aGUgdXBkYXRlZCBtNC5tayBmaWxl
LiBXaGlsZSB3ZSB3YWl0IGZvciBhIG5ldwo+IG00IHJlbGVhc2UgZnJvbSB1cHN0cmVhbSwgSeKA
mW0gc2hhcmluZyB0aGUgcGF0Y2ggdGhhdCB3b3JrZWQgZm9yIG1lIGluCj4gY2FzZSBhbnlvbmUg
ZWxzZSBlbmNvdW50ZXJzIHRoaXMgaXNzdWUuCj4KPiAtLS0gYS9wYWNrYWdlL200L200Lm1rICAg
IDIwMjUtMDQtMDMgMTM6NTk6MjcuMjI0MjU0MzM4ICswMzAwCj4gKysrIGIvcGFja2FnZS9tNC9t
NC5tayAgICAyMDI1LTA0LTIxIDIxOjA0OjIyLjEwNzU0NjI2MiArMDMwMAo+IEBAIC0xMCw0ICsx
MCw4IEBACj4gIE00X0xJQ0VOU0UgPSBHUEwtMy4wKwo+ICBNNF9MSUNFTlNFX0ZJTEVTID0gQ09Q
WUlORwo+Cj4gK0hPU1RfTTRfQ09ORl9FTlYgPSBDRkxBR1M9IiQoSE9TVF9DRkxBR1MpIC1zdGQ9
Z251MTciCj4gKwo+ICtIT1NUX000X0NPTkZfRU5WID0gQ0ZMQUdTPSIkKEhPU1RfQ0ZMQUdTKSAt
c3RkPWdudTE3Igo+ICsKPiAgJChldmFsICQoaG9zdC1hdXRvdG9vbHMtcGFja2FnZSkpCj4KPiBP
biBNb24sIEFwciAyMSwgMjAyNSBhdCA1OjAw4oCvUE0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4gd3JvdGU6Cj4gPgo+ID4gSGkgSm9zZXBoLAo+ID4KPiA+IE9uIDE5LzA0LzIwMjUgMTg6
NTYsIEpvc2VwaCBaaWt1c29va2Egd3JvdGU6Cj4gPiA+IEhpIEp1bGllbiwKPiA+ID4KPiA+ID4g
VGhhbmtzIGZvciB0aGUgaW5mbyBhbmQgdGhlIHdvcmthcm91bmQgdGlwIQo+ID4gPgo+ID4gPiBJ
IHVwZGF0ZWQgbXkgcGF0Y2ggdG8gdXNlIENGTEFHUz0iJChIT1NUX0NGTEFHUykgLXN0ZD1nbnUx
NyIgbGlrZSB5b3UKPiA+ID4gc3VnZ2VzdGVkLCBidXQgdGhlIGJ1aWxkIHN0aWxsIGZhaWxzIHdp
dGggR0NDIDE1IGFuZCBtNCAxLjQuMTkgLSBzYW1lCj4gPiA+IGVycm9ycyBhcyBiZWZvcmUuIFN0
cmFuZ2VseSwgaWYgSSBidWlsZCBtNCBvdXRzaWRlIHRoZSBidWlsZHJvb3QKPiA+ID4gZW52aXJv
bm1lbnQgd2l0aCB0aG9zZSBmbGFncywgaXQgd29ya3MgZmluZS4KPiA+ID4KPiA+ID4gQW55IGlk
ZWEgd2hhdCBlbHNlIGNvdWxkIGJlIGNhdXNpbmcgdGhlIHdvcmthcm91bmQgdG8gZmFpbCBpbgo+
ID4gPiBidWlsZHJvb3Q/IEFyZSB0aGVyZSBvdGhlciBmbGFncyBvciB0d2Vha3MgSSBjb3VsZCB0
cnkgaW4gbTQubWsgWzFdCj4gPiA+IHVudGlsIHRoZSBuZXcgbTQgcmVsZWFzZSBpcyBvdXQ/Cj4g
Pgo+ID4gSSBqdXN0IHRyaWVkIGFkZGluZyB0aGUgbGluZSBJIHN1Z2dlc3RlZCBpbiBwYWNrYWdl
L200L200Lm1rOgo+ID4gSE9TVF9NNF9DT05GX0VOViA9IENGTEFHUz0iJChIT1NUX0NGTEFHUykg
LXN0ZD1nbnUxNyIKPiA+Cj4gPiBPbiBhIEZlZG9yYSA0MiBob3N0IHN5c3RlbSAodXBkYXRlZCBh
cyBvZiBub3cpLCBpdCBzb2x2ZXMgdGhlCj4gPiBob3N0LW00IGJ1aWxkIGlzc3VlLiBZb3UgbmVl
ZCB0byByZXN0YXJ0IGZyb20gYSBjbGVhbiBidWlsZCwKPiA+IHRob3VnaC4KPiA+Cj4gPiBJIHRl
c3RlZCB3aXRoIHRoZSBjb21tYW5kczoKPiA+Cj4gPiAgICAgIG1ha2UgcWVtdV9hYXJjaDY0X3Zp
cnRfZGVmY29uZmlnCj4gPiAgICAgIG1ha2UgY2xlYW4KPiA+ICAgICAgbWFrZQo+ID4KPiA+IENv
dWxkIHlvdSBjaGVjayBvbiB5b3VyIHNpZGUsIHBsZWFzZT8KPiA+Cj4gPiBCZXN0IHJlZ2FyZHMs
Cj4gPgo+ID4gSnVsaWVuLgo+Cj4KPgo+IC0tCj4gSm9zZXBoIFppa3Vzb29rYQoKCgotLSAKSm9z
ZXBoIFppa3Vzb29rYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
