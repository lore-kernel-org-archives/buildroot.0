Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA3FC3601B
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 08:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E76461136;
	Thu,  3 Apr 2025 08:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nog-ohoNbzKN; Thu,  3 Apr 2025 08:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF356114D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF356114D;
	Thu,  3 Apr 2025 08:02:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 545F2119
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 08:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A77261136
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 08:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWvFRRGy-LhR for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 08:02:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A2FE6114D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2FE6114D
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2FE6114D
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 08:02:27 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30bef9b04adso5197511fa.1
 for <buildroot@buildroot.org>; Thu, 03 Apr 2025 01:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743667345; x=1744272145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RICXDAW9A7oOWNSpQNLjMWV8lfG7CA2gjIXetfE9f0w=;
 b=lAMqCdtU5blKzkKY2dROcO4xAfNP/8lQAN9lJDeLAdND+Wuthhw6R9NIzBru6FhAZO
 Ln85TXyVFng/67sa58c8v11Zcz4YM0BrB7f3V1/dn+DJX8S6dleuT/CQk5/qOWzttFD0
 KxT+tYiQAFwXNgYk01ui+GReUcMb75pvYALC13r6Zu8wYfzaJHwiV6X39rw7bC/EuB/D
 hm3GFH0ZR5Iyk9kzDYniky5MU2OpfJORTua7USHuR8bQZJhSiHUb45vwJfzbxTT9b6D6
 ZuMrzQRmtE+wZUjvCBEXEtBehFUCytQZY4sLUkRHeRRgZXOLn0ms2Yd4AFqZpFaANkbQ
 DTqQ==
X-Gm-Message-State: AOJu0YyflPUhrSpTo9ReZg32Sax0PNt9RSBR2mI/LJcKn5p/S/F7bZtj
 R2VS9ps04z8WC7umgGybbS5ZkgKqL+zqygIUbFIksuLlacW89rmhbPXJGWr2sg8Ern47b/kZUMo
 +mV1w1YtcFCkFxCoY2rsF0dIBOLY=
X-Gm-Gg: ASbGncvi5Ql8KjtzzVP7sUZ4YTfK+LLulpkVB0Qkk7ZW/V4NCfhU2Cx/jdffDS1ZUs/
 FbWZSBqjdXczHG1VGGQR9SZrLMcmujlyChFWjV0PItlFIbwt4MH+UCO4fYfULbNHhBHiyD9NiLY
 6UsdjBGfA24KZj64QqVWeTmSs/FoVyaA77j3PekQ==
X-Google-Smtp-Source: AGHT+IGfYAcxSoe9ZQqOaRbIdB5M7nOpAb56PPwcUt+X+SQNcpEkDdEMLRKoTHpyOr+lrTGVYsZlP4Dc+NBpTdetLjM=
X-Received: by 2002:a2e:bc1b:0:b0:309:26e8:cb1a with SMTP id
 38308e7fff4ca-30ef91b0d85mr20204941fa.30.1743667344934; Thu, 03 Apr 2025
 01:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250326080506.3467586-1-yegorslists@googlemail.com>
 <20250403094430.08d9b2f1@windsurf>
 <CAGm1_ksE6xFtRustant2MyiSpa3moyv1L_HL0W17UNv6peZ2tQ@mail.gmail.com>
 <20250403100003.2cd45709@windsurf>
In-Reply-To: <20250403100003.2cd45709@windsurf>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 3 Apr 2025 10:03:50 +0200
X-Gm-Features: ATxdqUHsTyVmb0vwyOUGld4YSDmvLhriRf-AXKvid6hmyZOxAq-a7qo6qGx-x1g
Message-ID: <CAGm1_kv6b=7z9WGvWQx1_pf9wV_XF6pj0+68FZ8NVagnS9Ykaw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1743667345; x=1744272145; darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RICXDAW9A7oOWNSpQNLjMWV8lfG7CA2gjIXetfE9f0w=;
 b=UrtEdZuLWtkkAN4d8UGrQ19Z0G9+X2gqkdRgIyZqg1vxxC1xbRbsmPEgHPaSMdAbJl
 W9fnhWoEFOtKbAUGhKkUJ1g2baOQDA6t1PAPr7nvcjV9Ku/1DJN4KcApsr7Tz7LtH6X7
 BlQXdyMJ7r7ES6UQa8sQRWt0281VlbcVEDQTzBOuYKi1UCXwNWBsK2icwaT08smKR+Rs
 1mfu9e+1xX3y/ej8CrCkK+7hkhfi8KMGXww13LdsEr3pKUrG6x0IDJ/Z0As2zD/HbD96
 z7f2cT4HWJdIuaPJwYzKyYxDA1gKkjXjEShfw/yMKHsOpMcD3QX2Js9d7U05PivNGiio
 Ci/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UrtEdZuL
Subject: Re: [Buildroot] [PATCH] package/ncftp: bump to version 3.2.9
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

T24gVGh1LCBBcHIgMywgMjAyNSBhdCAxMDowMOKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAzIEFwciAyMDI1IDA5
OjUzOjUyICswMjAwCj4gWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29t
PiB3cm90ZToKPgo+ID4gSSBoYXZlIGFsc28gbm90aWNlZCB0aGlzIGNoYW5nZSBhbmQgYWxyZWFk
eSByZXBvcnRlZCB0byB0aGUgbmNmdHAKPiA+IG1haW50YWluZXIuIEhlIGhhcyBqdXN0IGludHJv
ZHVjZWQgYSBzbWFsbCBjaGFuZ2Ugd2l0aG91dCBidW1waW5nIHRoZQo+ID4gdmVyc2lvbi4KPiA+
Cj4gPiBUaGVyZSBpcyBhbHNvIGFub3RoZXIgaXNzdWUgd2l0aCB0aGUgbmNmdHBib29rbWFya3Mg
YmluYXJ5IHRoYXQgcmVsaWVzCj4gPiBvbiBjdXJzZXMgaW5zdGVhZCBvZiBuY3Vyc2VzLiBJIGhh
dmUgYWxzbyByZXBvcnRlZCB0aGlzLiBMZXQncyB3YWl0Cj4gPiB0aWxsIE1vbi9UdWUgYW5kIGlm
IEkgZG9uJ3QgZ2V0IGFuIGFuc3dlciBmcm9tIGhpbSwgSSdsbCBzZW5kIGEgcGF0Y2gKPiA+IGZp
eGluZyBjaGVja3N1bSBhbmQgZGlzYWJsaW5nIG5jZnRwYm9va21hcmtzIGJpbmFyeS4KPgo+IEZp
eGluZyB0aGUgaGFzaCB3aWxsIG5vdCB3b3JrLCBhcyB3ZSBoYXZlIGFscmVhZHkgY2FjaGVkIHRo
ZSBwcmV2aW91cwo+IHRhcmJhbGwgd2l0aCB0aGUgb2xkIGhhc2guIEFsbCB3aGF0IGNhbiBiZSBk
b25lIG5vdyBpcyBmb3IgdXBzdHJlYW0gdG8KPiByZWxlYXNlIGEgbmV3IHZlcnNpb24sIGFuZCB1
cyB0byB1cGRhdGUgdG8gdGhpcyB2ZXJzaW9uLgoKT0suIEkgc2VlLiBUaGVuLCBJJ20gd2FpdGlu
ZyBmb3IgdGhlIG1haW50YWluZXIncyByZXNwb25zZS4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
