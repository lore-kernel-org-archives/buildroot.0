Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440B4D2E9FF
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 103EF80ABD;
	Mon, 11 Nov 2024 14:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eg0f-D_wYog2; Mon, 11 Nov 2024 14:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B93580B1A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B93580B1A;
	Mon, 11 Nov 2024 14:31:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82C84DB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 627EA40370
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FnAX0BvsE2wv for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:31:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com;
 envelope-from=brandon.maier@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 575E3401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 575E3401CC
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 575E3401CC
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:31:14 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2e59746062fso3638752a91.2
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 06:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731335473; x=1731940273;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oZ3e2aGaiy7hfw6fYuXCbBAGwogtGWsP6/wQI+ChC3M=;
 b=BME5/nl89hvPKwBNBTYrqGVWH3V8gimFCM9GjLYOyyyzCDpLj1e2cCaR3W/6jbIT+8
 smD15TA3Sz39ImSA5JGD1cPSkZJ/lr+ZkxPn74EzdrYQkHjZzrUgj0bipw3b7+MTnQT4
 xY6gQCCF+xcUIKAr5BjBYoVY9M9aj7up3Q9RCjnKjxikHMzsMDjyZUIOK5nvBUEtjRT/
 QFoUl86AiezZUCnQ6ugerJK+A6Mis0Iu2q7uz0TQDhfmZAXN+LWKqFHualXYAlO2iKYt
 uSNhxdbclszBWrR1WSTRJcdKs22UUV5tMpiKTMyxfrbmCzJpZh207txWIJNSi/yg1JyM
 UzNQ==
X-Gm-Message-State: AOJu0YxOn8PLpvdvUCjzdGx47Qwne3Y1NCCK/0+YLQVA3hAnGKGGB0jc
 szolHpC+UrqDXM50NEG+C1XbihFK0umNRdsBOuf3yHVujYN40GqLrrZHSk1JcCsQxX67vA7wO9c
 b/UZnYwMuD20+6pitFAttTctyVsw=
X-Google-Smtp-Source: AGHT+IFtReasZ53n9OqE44BYygoRDEungFB+/b00n8e4Qb1OrkY+NvwzpHHZm66fjK4LsJI9p+oSgVDh/oGoDpi0PNQ=
X-Received: by 2002:a17:90b:1a8d:b0:2e5:e43a:1413 with SMTP id
 98e67ed59e1d1-2e9b16955bamr17010129a91.9.1731335472879; Mon, 11 Nov 2024
 06:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20241109-genimage-partition-type-uuid-v1-0-9f23180c7195@gmail.com>
 <20241109-genimage-partition-type-uuid-v1-10-9f23180c7195@gmail.com>
 <ZzIE_UYSnV5-gPr-@ryzen>
In-Reply-To: <ZzIE_UYSnV5-gPr-@ryzen>
From: Brandon Maier <brandon.maier@gmail.com>
Date: Mon, 11 Nov 2024 08:31:01 -0600
Message-ID: <CADwxmTk_AEuPN2Kf2vPyQ0K+W8UV5K=-z2CFhQ9-pHqzOCMOhg@mail.gmail.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Niklas Cassel <cassel@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731335473; x=1731940273; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oZ3e2aGaiy7hfw6fYuXCbBAGwogtGWsP6/wQI+ChC3M=;
 b=O69Nafjwc5J5q7PoBds0CFIoQBXQDih+DAOdVD5TuuVdAx0HpPGIY2pASp+v2981IT
 +Klo8JV0IDRgMMEAFq2Kl270YS6RBmWQDHNx9kCJUSsqCcYz9oCaxpbxNfP7Mt4qsgNt
 oPFFfzkWBQWAlo+S1OHupchUBlqGk2H38jilyo7eAWIeVmV2f8sUG+SqMpEPcachEbMT
 PB9dbxszzLbzLuSKZxPZ5q+gyIfWkd0Hh8zDZ9QFcIb2Txctxk27HLMjCTV1ddnuCRuW
 FabXbvdKBbqm2dqGeHODnbsifJX1oAFMSSFUmLFrdyfF1Gc9s6RVutw1733QlyWn7Lbw
 nLJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=O69Nafjw
Subject: Re: [Buildroot] [PATCH 10/17] board/qemu/riscv64-virt-efi: use
 partition-type-uuid "root-riscv64"
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

SGkgTmlrbGFzLAoKT24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgNzoyMuKAr0FNIE5pa2xhcyBDYXNz
ZWwgPE5pa2xhcy5DYXNzZWxAd2RjLmNvbT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE5vdiAwOSwgMjAy
NCBhdCAwNDoxNjoyNFBNIC0wNjAwLCBCcmFuZG9uIE1haWVyIHdyb3RlOgo+ID4gU2lnbmVkLW9m
Zi1ieTogQnJhbmRvbiBNYWllciA8YnJhbmRvbi5tYWllckBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICBib2FyZC9xZW11L3Jpc2N2NjQtdmlydC1lZmkvZ2VuaW1hZ2UuY2ZnIHwgMiArLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9ib2FyZC9xZW11L3Jpc2N2NjQtdmlydC1lZmkvZ2VuaW1hZ2UuY2ZnIGIvYm9hcmQv
cWVtdS9yaXNjdjY0LXZpcnQtZWZpL2dlbmltYWdlLmNmZwo+ID4gaW5kZXggNDY5NTA1OTFlMGEz
ZDRjM2ZiMTRmODFkNzFhNmMyY2NmMjQ1ZDU2NC4uYTdkNTQyMGQ3OGRjNjM3YTBjMThmZTdjZTJm
Zjg2Mzc4YjU1NzQxYSAxMDA2NDQKPiA+IC0tLSBhL2JvYXJkL3FlbXUvcmlzY3Y2NC12aXJ0LWVm
aS9nZW5pbWFnZS5jZmcKPiA+ICsrKyBiL2JvYXJkL3FlbXUvcmlzY3Y2NC12aXJ0LWVmaS9nZW5p
bWFnZS5jZmcKPiA+IEBAIC0yOCw3ICsyOCw3IEBAIGltYWdlIGRpc2suaW1nIHsKPiA+ICAgICAg
ICAgICAgICAgIyBGb3IgcGFydGl0aW9uLXR5cGUtdXVpZCB2YWx1ZSwgc2VlOgo+ID4gICAgICAg
ICAgICAgICAjIGh0dHBzOi8vdWFwaS1ncm91cC5vcmcvc3BlY2lmaWNhdGlvbnMvc3BlY3MvZGlz
Y292ZXJhYmxlX3BhcnRpdGlvbnNfc3BlY2lmaWNhdGlvbi8KPiA+ICAgICAgICAgICAgICAgIyBT
RF9HUFRfUk9PVF9SSVNDVjY0Cj4KPiBJIHdvdWxkIGtpbGwgdGhlIGNvbW1lbnQgYWJvdmUuCj4g
Tm93IHdoZW4gdXNpbmcgdGhlIHNob3J0Y3V0LCBpdCBpcyBzZWxmIGV4cGxhbmF0b3J5LgoKQWdy
ZWVkLCBJIHdpbGwgdXBkYXRlIGluIHYyCgpUaGFua3MhCkJyYW5kb24gTWFpZXIKCj4KPgo+IEtp
bmQgcmVnYXJkcywKPiBOaWtsYXMKPgo+ID4gLSAgICAgICAgICAgICBwYXJ0aXRpb24tdHlwZS11
dWlkID0gNzJlYzcwYTYtY2Y3NC00MGU2LWJkNDktNGJkYTA4ZThmMjI0Cj4gPiArICAgICAgICAg
ICAgIHBhcnRpdGlvbi10eXBlLXV1aWQgPSByb290LXJpc2N2NjQKPiA+ICAgICAgICAgICAgICAg
aW1hZ2UgPSAicm9vdGZzLmV4dDIiCj4gPiAgICAgICB9Cj4gPiAgfQo+ID4KPiA+IC0tCj4gPiAy
LjQ3LjAKPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiA+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
