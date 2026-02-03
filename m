Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C48E8784A
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 16:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D2B640BB3;
	Tue,  3 Feb 2026 16:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MV1whjy8rHx; Tue,  3 Feb 2026 16:40:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57FD640B9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770136846;
	bh=BsrA5ccJcqmdzh4px1XGtqZbi8SbqrYxL+mfOCn8Uus=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JY4mCXn7GZaRekY8pvbwl0dlYoPSin/6f7Y7Tt3V73vXvitS/nOwpRkyDd8LnQvdp
	 J+CFKTLnss0PkuOBa96SgP32P9f2hiPuBgwoEukpMGUmKk/F29ZmP4xAcixiapSAx0
	 e0KbXI2JEXHEJDFMcGFPafAtPmHHiqBXMSfUcgEXjLa5I4vfI2hcczNWos6iMcggX/
	 2z4dnnYFdJUHFdnJ9z3sT7DYeoCnAC4RTR6vTavfd3Eu2bktUdFD0NAZRPyNcqDF4u
	 661D/gJHVqAznifuoE/bHXbW/wtbr859Cq5EZ+TCb+xSdP1j04YK9dJvFstv7lKEDk
	 TNHJDGfYgH9xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57FD640B9A;
	Tue,  3 Feb 2026 16:40:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72FD0F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FFAC400F9
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQ95i32xOcMo for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 16:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4DA9E40070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DA9E40070
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DA9E40070
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 16:40:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-435a11957f6so4591127f8f.0
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 08:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770136841; x=1770741641;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lNxY4cDhB8qWYDuRFiCIrO+XhOPdix6PbKcNaFGlzfo=;
 b=W2737o3Ei1XPc3bbHPebWBOnw5w7JKCkTneU1l4vHZowjLbtioReuiPEc3y/gDYRty
 aFNVdZyGuRYeAevLZv0tqGUxYLNBd3kYL5ddN702QAx/Ome1RvovltVJCGMaM3rJe0h5
 WUsxPNaxYpNX0OmV+xWc2CQafVIAxbjTXsOiolQUaaEvrRUtMd/aMzK/rArgPIR0dw9f
 Phh1Lv1Jhcw4RdptKOl9HbVRrZhyCQB967q4hg8Yhwt62IzuJSOhK48FDJum+zm6wKFP
 30saj1hmQJwRQvHCZQUlgKaqwcuRsFDyO9ju9NLzBoPE6enuN8xIDSWT31qsT05Uszg0
 ZdYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6W965JKm4KZOLNuChX+LoUU8f/pKovoUw47oTVvKP0B45Zo+mtC5WafHcot2sftL7GFPjQCCVb40=@buildroot.org
X-Gm-Message-State: AOJu0YyInBNVV0PG3S6CMk3uHE9abmlpoWkQasQ81Ap2xOxnH5EdW0sI
 rDBW/Rnozo4METKKLmHh71mxPeXsquuLm/Ap+NwtlgCUN8gCjfA9Pxwl
X-Gm-Gg: AZuq6aJIQ2Ou645WcSXyWdi/0Xcv663R1VRgPL8q0fvANfBN1G6OwukmuTHtxPxGer/
 P79Ov2pEsJoTYzjYSy5l7tI6h213A3aASSjPap6g0yzzuL1yJwnuCFzIv5izATIYShZR0cW+cLo
 /fNOlYuZJJtutWeuo01P3mqdAaJzjmulYFzqADExhkj4gXNYQx6aAhPU9/2Dc+tzLv4BWC7X8/G
 ZKi8JRWJpCmzlsINfQPtn4/ebxpErlH8Kzi4o4oRc9wevMsffgQhpQyIgf8g7a5PV6MakimrJBr
 AUEWzxzGo1yYpdKyrXNOB2lYGO5y4COSFL47L4/VJBz/N6jclL4WmGH7Qmdzhjx/wS3rNzg+XS8
 oCzjjSxr4Lf4EBhr+3bwW5S0Di5jPJLrQgchHcHM8U7PvwojIbL0JuwItmXFIe1vGa5/J4yJYOT
 HYnRFzHb6Vhvmpqo9PCpKS0quGaSCfCW5gus0evU+sYkDTfeSy6hulQav8sBFGCHqJ4K5Ksmn04
 ZI=
X-Received: by 2002:a5d:64e9:0:b0:435:afa5:c27 with SMTP id
 ffacd0b85a97d-435f3aafcbfmr25290433f8f.52.1770136840692; 
 Tue, 03 Feb 2026 08:40:40 -0800 (PST)
Received: from ?IPV6:2a02:2f00:400:cf00:cc34:24a8:c7e:8f5c?
 ([2a02:2f00:400:cf00:cc34:24a8:c7e:8f5c])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e483asm51557406f8f.3.2026.02.03.08.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 08:40:40 -0800 (PST)
Message-ID: <fa075240-a629-4f07-87d5-717c8dcca539@gmail.com>
Date: Tue, 3 Feb 2026 18:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>
References: <20260203153617.80012-1-laurentiumihalcea111@gmail.com>
 <981f9938-a716-40fe-9e02-af9fd84ac8f3@armadeus.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <981f9938-a716-40fe-9e02-af9fd84ac8f3@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770136841; x=1770741641; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lNxY4cDhB8qWYDuRFiCIrO+XhOPdix6PbKcNaFGlzfo=;
 b=BcJVioUwJ58aVET/DPX75awQofr1pAatHO040a60m/ZmtH9BDoJxInI1ixQahmmfoa
 m3B5meli+r/5fc2x/ovHYA5AFOK0uHxh0Jev2kk/RNbiDmWdKk6L2u+3M57VdKJFYpxs
 2Jopk8J2qVNFTqT6KPcbML47K+cEg8xocyuTVprsdP46ZQMHOygA0Wp1iOlWEP/fR1Bp
 1JwEhqEd3MHw26y0psKnWDEbl87F5QnVtLrMMWe830ZODPT3FWOfoTePKVdq3KDLUall
 BcLHeDTHPtatxliGfR2oBDcOJzpsic/WD66ndMY+rdaqpghypjooqEeAzWZpYrKD531f
 OG3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BcJVioUw
Subject: Re: [Buildroot] [PATCH 00/10] Add support for IMX95-15x15-FRDM board
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

Ck9uIDIvMy8yMDI2IDU6NTIgUE0sIFPDqWJhc3RpZW4gU3p5bWFuc2tpIHdyb3RlOgo+IEhlbGxv
IExhdXJlbnRpdSwgYWxsLAo+Cj4gT24gMi8zLzI2IDQ6MzYgUE0sIExhdXJlbnRpdSBNaWhhbGNl
YSB3cm90ZToKPj4gRnJvbTogTGF1cmVudGl1IE1paGFsY2VhIDxsYXVyZW50aXUubWloYWxjZWFA
bnhwLmNvbT4KPj4KPj4gSGkgZm9sa3MsCj4+Cj4+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgc3Vw
cG9ydCBmb3IgTlhQJ3MgSU1YOTUtMTV4MTUtRlJETSBib2FyZC4KPgo+IE5pY2UhIEkgd2FzIHdv
cmtpbmcgb24gYWRkaW5nIGkuTVg5NSB0b28gYW5kIGp1c3Qgc2F3IHlvdXIgcGF0Y2hlcyEgSSB3
aWxsIHRyeSB5b3UgcGF0Y2hlcyB0aGVuIQoKClRoYW5rcywgbGV0IG1lIGtub3cgaWYgeW91IGhh
dmUgYW55IGZlZWRiYWNrIDopCgoKPgo+Pgo+PiBTbywgYSBsaXR0bGUgYml0IGFib3V0IHRoZSBi
b2FyZDogYXMgb2YgdG9kYXksIHRoZSBib2FyZCBoYXNuJ3QgYmVlbgo+PiBvZmZpY2lhbGx5IGxh
dW5jaGVkLCBidXQsIGFzIGZhciBhcyBJIHdhcyB0b2xkLCB0aGlzIHNob3VsZCBoYXBwZW4gaW4g
dGhpcwo+PiBxdWFydGVyLiBCZWNhdXNlIG9mIHRoaXMsIHdlIHN0aWxsIGhhdmUgc29tZSBnYXBz
IHRvIGZpbGwgaW4gdGhlCj4+IGRvY3VtZW50YXRpb24gKHNlZSBtaXNzaW5nIGxpbmtzIGZyb20g
dGhlIGJvYXJkJ3MgcmVhZG1lLnR4dCkuCj4+Cj4+IFNvbWUgaGFyZHdhcmUtcmVsYXRlZCBpbmZv
cm1hdGlvbiBmb3IgdGhlIGJvYXJkIChub3QgZXhoYXVzdGl2ZSk6Cj4+Cj4+IMKgwqAgMSkgQmFz
ZWQgb24gTVg5NSAxNXgxNSBCMCBzaWxpY29uLgo+PiDCoMKgIDIpIDhHQiBMUEREUjRYIERSQU0K
Pj4gwqDCoCAzKSAzMkdCIGVNTUMKPj4gwqDCoCA0KSAyIHggRU5FVCAxR0JzCj4+Cj4+IFNvbWUg
Y29tbWVudHMgcmVnYXJkaW5nIHRoZSBjaGFuZ2VzIGludHJvZHVjZWQgYnkgdGhpcyBzZXJpZXM6
Cj4+Cj4+IMKgwqAgMSkgaW14LW1raW1hZ2UgdmVyc2lvbiBidW1wIHdhcyBkb25lIGJlY2F1c2Ug
dGhlIGJvYXJkIGRpZG4ndCBzZWVtCj4+IMKgwqAgdG8gYmUgYWJsZSB0byBib290IHVzaW5nIHRo
ZSBwcmV2aW91cyB2ZXJzaW9uLgo+Pgo+PiDCoMKgIDIpIGZpcm13YXJlLWVsZS1pbXggdmVyc2lv
biBidW1wIHdhcyBkb25lIGJlY2F1c2UgcHJldmlvdXMgdmVyc2lvbgo+PiDCoMKgIGRpZG4ndCBp
bmNsdWRlIHRoZSBmaXJtd2FyZSBmb3IgQjAgcmV2aXNpb24gKGl0IG9ubHkgc2VlbWVkIHRvIGlu
Y2x1ZGUKPj4gwqDCoCB0aGUgb25lIGZvciBBMCkuCj4KPiBJIGhhdmUgc2VudCBwYXRjaGVzIHRv
IGJ1bXAgc2V2ZXJhbCBpLk1YIHBhY2thZ2VzOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YnVpbGRyb290LzIwMjYwMjAzLWJ1bXAtaW14LXBhY2thZ2VzLWxmLTYtMTItNDktMi0yLTAtdjEt
MS01NDhmM2ZjNzdhNTlAYXJtYWRldXMuY29tLwo+Cj4gUmVnYXJkcyzCoAoKCkFoLCB2ZXJ5IHNv
cnJ5IGZvciB0aGUgZHVwbGljYXRpb24uIFlvdXIgcGF0Y2hlcyBzaG91bGQgYmUgYWxsIHRoZSBi
dW1wcyB3ZSBuZWVkLgoKV2lsbCBkcm9wIHRoZSB1cGRhdGVzIGZyb20gdGhpcyBzZXJpZXMgb25j
ZSB5b3VycyBsYW5kcy4KCgpUaGFua3MsCgpMYXVyZW50aXUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
