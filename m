Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFF8EB64D7
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 02:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 357BD40C5C;
	Wed, 14 Jun 2023 02:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 357BD40C5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7pYLU41pCEQD; Wed, 14 Jun 2023 02:00:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB9854155E;
	Wed, 14 Jun 2023 02:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB9854155E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 486D91BF346
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 02:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EE9660B3D
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 02:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE9660B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPsGd0EFf7oK for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 02:00:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4564C60B36
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4564C60B36
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 02:00:27 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-970056276acso24756766b.2
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 19:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686708025; x=1689300025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Io9INiVRKd/HTL+0p752WjDAbAILbyOg0le3BNv8MFw=;
 b=RNVu5r/jsNC3n9jOKqdyQe1/1N0Xh/Xt1XKbDgnoNhqnLM8gzlb4xhSFlspeQBXHdA
 jTkre3wrnVGic+eqo2s2nKKnjEU3xkga84/urEy4wKFO/f/HqkW9cvYPKs2ITbIoqE1e
 s88dJzDZmVCsLsabCYLCD6WVqFJCIE7iCEAjLzMnPDL7kFLtbC31PjkcMIVyjRClmNwi
 TnpZ1m47CxUgYAsSWVvmqhSIf3qtU+O9ta7NmaHgGogGxib5hflM1NuvcvEdqpIEYn9y
 iznJA8Bj4YUO8WYWAmESNbcj14i7eb6W7u6k24DgJJChx+4vbnQt3v/P7HfCsJR3sBQj
 RS3Q==
X-Gm-Message-State: AC+VfDxMOPCvtBAQu2DsKobwxfmxbJVtLvtfZQpGQtVmB9OXG/50mPVm
 QmkXrKtOI11oky51s5eyH4YeyRp7XqVmGh73AlM=
X-Google-Smtp-Source: ACHHUZ5xe1leAjnPDdRarA16tEV6OzMXAvkRkh7KjbRrwD+OgToIyDSqjEgtg68nus5jz1ooCiMW7IU/2KG8JQxMVns=
X-Received: by 2002:a17:907:97d6:b0:978:6be4:7efa with SMTP id
 js22-20020a17090797d600b009786be47efamr12731426ejc.18.1686708024361; Tue, 13
 Jun 2023 19:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230613105015.739870-1-laurent@vivier.eu>
 <20230613105015.739870-4-laurent@vivier.eu>
In-Reply-To: <20230613105015.739870-4-laurent@vivier.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Jun 2023 02:00:11 +0000
Message-ID: <CACPK8XdhHuiiv6R-apE_+y7_AgNVFz+AXmTBk3sL8ofRMkJtKQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1686708025; x=1689300025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Io9INiVRKd/HTL+0p752WjDAbAILbyOg0le3BNv8MFw=;
 b=ZwcwBrdFPom08fgoIrysz6X1cQXo4CY+DYyH5tJKq27EqCEen6/iYJupjRGd38mKB8
 NimarQ+aTxquujVfyaUDH5dMxMOzQuDdQk40uL2Pjq4ouTH6fAYh/uOpmNSwJsglg/5J
 5Heg4UDt3c7+fCbM27qGvnzaMP99lZOy2F82M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au
 header.a=rsa-sha256 header.s=google header.b=ZwcwBrdF
Subject: Re: [Buildroot] [PATCH v14 3/4] board/qemu/m68k-virt: Add virt-m68k
 linux config
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxMyBKdW4gMjAyMyBhdCAxMDo1MSwgTGF1cmVudCBWaXZpZXIgPGxhdXJlbnRAdml2
aWVyLmV1PiB3cm90ZToKPgo+IEJ1aWxkIGEgNS4xOSAoZmlyc3QgdmVyc2lvbiB3aXRoIHRoZSBt
NjhrIHZpcnQgbWFjaGluZSkga2VybmVsCj4gZm9yICJxZW11LXN5c3RlbS1tNjhrIC1NIHZpcnQi
IG1hY2hpbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZp
ZXIuZXU+Cj4gUmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgpS
ZXZpZXdlZC1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KCj4gLS0tCj4gIERFVkVM
T1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrCj4gIGJvYXJkL3Fl
bXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50ICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysr
Cj4gIGJvYXJkL3FlbXUvbTY4ay12aXJ0L3JlYWRtZS50eHQgICAgICAgICAgICB8ICA1ICsrKysr
Cj4gIGNvbmZpZ3MvcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZyB8IDI2ICsrKysr
KysrKysrKysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC9xZW11L202OGstdmlydC9saW51eC5mcmFnbWVudAo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9xZW11X202OGtfdmlydF9wZXRpdGJvb3RfZGVmY29u
ZmlnCj4KPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCA3YWE1
OTgwZGY3ZjMuLjgwNGE0Y2QyYzFkNiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIv
REVWRUxPUEVSUwo+IEBAIC0xODIwLDYgKzE4MjAsOCBAQCBGOiAgICAgICAgcGFja2FnZS9vcGVu
LWxsZHAvCj4KPiAgTjogICAgIExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZpdmllci5ldT4KPiAg
RjogICAgIHBhY2thZ2UvcGV0aXRib290Lwo+ICtGOiAgICAgYm9hcmQvcWVtdS9tNjhrLXZpcnQv
Cj4gK0Y6ICAgICBjb25maWdzL3FlbXVfbTY4a192aXJ0X3BldGl0Ym9vdF9kZWZjb25maWcKPgo+
ICBOOiAgICAgTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiAgRjogICAgIGJvb3Qv
YWZib290LXN0bTMyLwo+IGRpZmYgLS1naXQgYS9ib2FyZC9xZW11L202OGstdmlydC9saW51eC5m
cmFnbWVudCBiL2JvYXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50Cj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjQ5NDE2OTgyNjAxYwo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9ib2FyZC9xZW11L202OGstdmlydC9saW51eC5mcmFnbWVudAo+IEBAIC0w
LDAgKzEsMjEgQEAKPiArQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKPiArQ09ORklHX0tFWEVDPXkK
PiArQ09ORklHX0JPT1RJTkZPX1BST0M9eQo+ICtDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQo+ICtD
T05GSUdfTUQ9eQo+ICtDT05GSUdfTURfTElORUFSPXkKPiArQ09ORklHX01EX01VTFRJUEFUSD15
Cj4gK0NPTkZJR19NRF9GQVVMVFk9eQo+ICtDT05GSUdfQkxLX0RFVl9ETT15Cj4gK0NPTkZJR19E
TV9VTlNUUklQRUQ9eQo+ICtDT05GSUdfRE1fQ1JZUFQ9eQo+ICtDT05GSUdfRE1fU05BUFNIT1Q9
eQo+ICtDT05GSUdfRE1fVEhJTl9QUk9WSVNJT05JTkc9eQo+ICtDT05GSUdfRE1fQ0FDSEU9eQo+
ICtDT05GSUdfRE1fV1JJVEVDQUNIRT15Cj4gK0NPTkZJR19ETV9FQlM9eQo+ICtDT05GSUdfRE1f
RVJBPXkKPiArQ09ORklHX0RNX0NMT05FPXkKPiArQ09ORklHX0RNX01JUlJPUj15Cj4gK0NPTkZJ
R19ETV9SQUlEPXkKPiArQ09ORklHX0RNX1pFUk89eQo+IGRpZmYgLS1naXQgYS9ib2FyZC9xZW11
L202OGstdmlydC9yZWFkbWUudHh0IGIvYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dAo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi43MTRiNzRjNzBlYTEK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvYm9hcmQvcWVtdS9tNjhrLXZpcnQvcmVhZG1lLnR4dAo+
IEBAIC0wLDAgKzEsNSBAQAo+ICtSdW4gdGhlIGVtdWxhdGlvbiB3aXRoOgo+ICsKPiArIHFlbXUt
c3lzdGVtLW02OGsgLU0gdmlydCAta2VybmVsIG91dHB1dC9pbWFnZXMvdm1saW51eCAtaW5pdHJk
IG91dHB1dC9pbWFnZXMvcm9vdGZzLmNwaW8ueHogLWFwcGVuZCAiY29uc29sZT10dHlHRjAiIC0t
bm9ncmFwaGljICMgcWVtdV9tNjhrX3ZpcnRfcGV0aXRib290X2RlZmNvbmZpZwo+ICsKPiArVGhl
IHBldGlib290IG1lbnUgd2lsbCBhcHBlYXIgaW4gdGhlIHRlcm1pbmFsIHdoZXJlIFFFTVUgaGFz
IGJlZW4gc3RhcnRlZC4KPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X202OGtfdmlydF9wZXRp
dGJvb3RfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X202OGtfdmlydF9wZXRpdGJvb3RfZGVmY29u
ZmlnCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjE4ODkwYjFh
NmZjMQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9jb25maWdzL3FlbXVfbTY4a192aXJ0X3BldGl0
Ym9vdF9kZWZjb25maWcKPiBAQCAtMCwwICsxLDI2IEBACj4gK0JSMl9tNjhrPXkKPiArQlIyX1RP
T0xDSEFJTl9CVUlMRFJPT1RfV0NIQVI9eQo+ICtCUjJfQ0NBQ0hFPXkKPiArQlIyX1JFTFJPX05P
TkU9eQo+ICtCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9IldlbGNvbWUgdG8gUGV0aXRib290Igo+
ICtCUjJfUk9PVEZTX0RFVklDRV9DUkVBVElPTl9EWU5BTUlDX0VVREVWPXkKPiArQlIyX1JPT1RG
U19NRVJHRURfVVNSPXkKPiArQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvcWVt
dS9wb3N0LWltYWdlLnNoIgo+ICtCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9IiQoQlIyX0RF
RkNPTkZJRykiCj4gK0JSMl9MSU5VWF9LRVJORUw9eQo+ICtCUjJfTElOVVhfS0VSTkVMX0RFRkNP
TkZJRz0idmlydCIKPiArQlIyX0xJTlVYX0tFUk5FTF9DT05GSUdfRlJBR01FTlRfRklMRVM9ImJv
YXJkL3FlbXUvbTY4ay12aXJ0L2xpbnV4LmZyYWdtZW50Igo+ICtCUjJfTElOVVhfS0VSTkVMX1ha
PXkKPiArQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUz15Cj4gK0JSMl9QQUNLQUdFX0tF
WEVDPXkKPiArQlIyX1BBQ0tBR0VfS0VYRUNfWkxJQj15Cj4gK0JSMl9QQUNLQUdFX0VUSFRPT0w9
eQo+ICtCUjJfUEFDS0FHRV9ORVRfVE9PTFM9eQo+ICtCUjJfUEFDS0FHRV9ORVRDQVQ9eQo+ICtC
UjJfUEFDS0FHRV9SU1lOQz15Cj4gK0JSMl9QQUNLQUdFX1BFVElUQk9PVD15Cj4gK0JSMl9UQVJH
RVRfUk9PVEZTX0NQSU89eQo+ICtCUjJfVEFSR0VUX1JPT1RGU19DUElPX1haPXkKPiArIyBob3N0
LXFlbXUgZm9yIGdpdGxhYiB0ZXN0aW5nCj4gK0JSMl9QQUNLQUdFX0hPU1RfUUVNVT15Cj4gK0JS
Ml9QQUNLQUdFX0hPU1RfUUVNVV9TWVNURU1fTU9ERT15Cj4gLS0KPiAyLjQwLjEKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1h
aWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
