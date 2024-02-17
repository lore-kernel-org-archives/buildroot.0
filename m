Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE47C48260
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 03:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7E384104;
	Sat, 17 Feb 2024 03:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y3jxF7TgjcRq; Sat, 17 Feb 2024 03:13:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6EE484107
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6EE484107;
	Sat, 17 Feb 2024 03:13:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D1911BF3C0
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 03:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2733C611ED
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 03:13:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zevbuhY5rcCJ for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 03:13:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B24961160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B24961160
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B24961160
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 03:13:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-411f165ef9bso21625555e9.0
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 19:13:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708139592; x=1708744392;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1lrXduVhCogeISVLEh9jDEKxoGux6Zc5ncFMDz/qz+0=;
 b=cBpHPd1OeyltprsAQQ9UCTP3qEYFBipfsuWA592uFmXu37eBHChxqsXT83gnM0GrcZ
 dOqf4umq1kVRhZ/aS5O2W1DUtZA1l2UdjzObO6pB6RZRbIgnmgtDku2Ypzgy7UKDj3QE
 FXudfAORDmD8wAuwN0ndeMr5tLKJwj3E7NE+qx7wPoKfEmeY+955Jk92IV00Cgf6VRgY
 MxxUFz0edHKMQ0Yy6pRLrkThNJED+/83DfEnWte2Yhzf8nvndFmm4O2A+c8JorxPyDAm
 tYHh+YuNRaHirHDSTVVveQyRNknJiOZwCe5pXKZ4yUBABuDpiZOL8BL0CF62y0puMHST
 b9rg==
X-Gm-Message-State: AOJu0YzjYVsdVVoeg/oA2qpUFBhgtIRj0/XEaD0nO4PfxL2mPBNdjchE
 g36RgdrvbgemG9o+qigSAG5+uon8suzjoR3AqY5A3B70MixUioZo
X-Google-Smtp-Source: AGHT+IHWD1rtINwg2BpZO41TCuI/kc6hlZogb+gitlBUW0VUnrH858s9TRunnt8Gp5kEJ/4wt5gBvA==
X-Received: by 2002:a05:600c:5107:b0:410:78ca:f756 with SMTP id
 o7-20020a05600c510700b0041078caf756mr4602321wms.32.1708139591942; 
 Fri, 16 Feb 2024 19:13:11 -0800 (PST)
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b00412157dc70bsm3974061wmb.30.2024.02.16.19.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 19:13:11 -0800 (PST)
Message-ID: <3570b01e6a258bbafa2d6317ba8619ecb39f66ec.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Andreas Dannenberg <dannenberg@ti.com>, Romain Naour
 <romain.naour@smile.fr>
Date: Sat, 17 Feb 2024 04:13:16 +0100
In-Reply-To: <20240216222012.eaes5ktamizu6n5c@dasso>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240216201903.lhhkjevrgzcp5msz@dasso>
 <735636d6-c0f8-4226-ab8a-1576c2133189@smile.fr>
 <20240216222012.eaes5ktamizu6n5c@dasso>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708139592; x=1708744392; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1lrXduVhCogeISVLEh9jDEKxoGux6Zc5ncFMDz/qz+0=;
 b=GLN6M4QS7D6KNrhF8aIJn/09M464VWvDIoNoWNSjqZtjVDrwOxHwd0ENh4yVWhOZxw
 Gi3BYwdEYqnudDHkS8QlAdC0y5C2MR3ZAqxSeZh2L/Z02/sJEKQ+Jv4EBUd0IBLm2hsc
 WltgWfLHtZNOUWDmnlvdbj53tPTYrcltuswzczR0/Q4KzuIZfIRW/KD/HB3FoXx22bgQ
 00QcG/b9ktbQfDxY4k7bIB4YARNZg2qY4MJihImMUsDWDsnYvNT5t3/63ZWIgKYkWZBQ
 +W38A1hT+4WZbWRSENeBD9J9X2A1smTGejbFt9Z13C6JrE0qBk6EZnV/YeP2rHXXczVM
 Lq1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GLN6M4QS
Subject: Re: [Buildroot] [PATCH 00/21] Add ti_j721e_sk_defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywKCk9uIEZyaSwgMjAyNC0wMi0xNiBhdCAxNjoyMCAtMDYwMCwgQW5kcmVh
cyBEYW5uZW5iZXJnIHdyb3RlOgo+IE9uIEZyaSwgRmViIDE2LCAyMDI0IGF0IDEwOjUyOjIxUE0g
KzAxMDAsIFJvbWFpbiBOYW91ciB3cm90ZToKPiA+IEhlbGxvIEFuZHJlYXMsCj4gPiAKPiA+IExl
IDE2LzAyLzIwMjQgw6AgMjE6MTksIEFuZHJlYXMgRGFubmVuYmVyZyBhIMOpY3JpdMKgOgo+ID4g
PiBPbiBUdWUsIEZlYiAxMywgMjAyNCBhdCAwNjoyNzo1NlBNICswMTAwLCBSb21haW4gTmFvdXIg
d3JvdGU6Cj4gPiA+ID4gVGhpcyBzZXJpZXMgYWltIHRvIGFkZCB0aGUgU0stVERBNFZNIGJvYXJk
IHN1cHBvcnQgYmFzZWQgb24gVEkgSzMgajcyMWUgU29DLgo+ID4gPiA+IAo+ID4gPiA+IFRoaXMg
c2VyaWVzIHN0YXJ0IGJ5IGFkZGluZyBVLWJvb3QgYmlubWFuIHN1cHBvcnQgYWxyZWFkeSBzdWJt
aXR0ZWQgaW4gdGhlCj4gPiA+ID4gcHJldmlldyBzZXJpZXMgIkFkZCBzdXBwb3J0IGZvciBBTTYy
eC1TSyBIUy1GUyBkZXZpY2VzIiBmcm9tIERhcmlvIEJpbmFjY2hpCj4gPiA+ID4gWzFdLCB3aXRo
IHNtYWxsIGltcHJvdmVtZW50cy4KPiA+ID4gPiBTZWUgdGhlIEZPU0RFTSAyMDI0IHRhbGsgIlN0
YW5kYXJkaXppbmcgdGhlIGdlbmVyYXRpb24gYW5kIHNpZ25pbmcgb2YgYm9vdCBpbWFnZXMiIFsy
XQo+ID4gPiAKPiA+ID4gVGhhbmtzIFJvbWFpbiBhbmQgRGFyaW8gZm9yIGFsbCB0aGUgd29yayBv
biB0aGlzLCBhbmQgc3VibWl0dGluZyB0aGlzLgo+ID4gPiBXaWxsIGJlIHNwZW5kaW5nIHNvbWUg
dGltZSBvdmVyIHRoZSBuZXh0IGZldyBkYXlzIHRvIHNlZSBob3cgSSBjYW4gaGVscAo+ID4gPiBv
dXQgd2l0aCB0aGlzIGVmZm9ydC4gSSBjYW4gYWxyZWFkeSBzZWUgbWFueSBncmVhdCBpbXByb3Zl
bWVudHMgc2luY2UKPiA+ID4gdGhlIGxhc3QgdGltZSBJIHdvcmtlZCBvbiBBTTYyeC9BTTY0eCBz
dXBwb3J0IGxhc3QgeWVhci4KPiA+IAo+ID4gWW91ciBmZWVkIGJhY2sgb24gSFMtRlMgZGV2aWNl
cyBpcyByZWFsbHkgaGVscGZ1bC4gQWxleGFuZGVyIFN2ZXJkbGluIGFsc28KPiA+IGhlbHBlZCBv
biBBTTYyeC4KPiA+IAo+ID4gTWF5YmUgaWYgeW91IGNhbiBhbHNvIHRlc3Qgb24gQU02NHgganVz
dCB0byBiZSBzdXJlIHRoZSBkZWZjb25maWcgaXMgd29ya2luZy4KPiAKPiBJJ20gcGxhbm5pbmcg
b24gdGVzdGluZyB0aGUgZW50aXJlIHNlcmllcyBoZXJlIHByZXR0eSBzb29uIGFuZCB3aWxsCj4g
cHJvdmlkZSBmZWVkYmFjayAoSSBoYXZlIGFjY2VzcyB0byBhbnkgYW5kIGFsbCBib2FyZHM6KQo+
IAo+IE9uZSBvZiB0aGUgdGhpbmdzIEknbSB0cnlpbmcgdG8gYXNzZXNzIGlzIHdoYXQncyBzdGls
bCBtaXNzaW5nIHZzLiB0aGUKPiBwcmV2aW91cyBhdHRlbXB0IEkgbWFkZSB1cHN0cmVhbWluZyB0
aGlzLiBGb3IgZXhhbXBsZSwgQU02MnggZ3JhcGhpY3MKPiBpc24ndCB0aGVyZSB5ZXQgKHRpLXJv
Z3VlLWttIC8gdGktcm9ndWUtdW0pLgoKbWF5YmUgeW91IGNvdWxkIHNoZWQgc29tZSBsaWdodCBv
bnRvIHRoZSBBTTYyeCBzaXR1YXRpb24uIE15IGNvbmNsdXNpb24KaXMgdGhhdCBzaW5jZSB5b3Vy
IGluaXRpYWwgYnVpbGRyb290IEJTUCBVLUJvb3QgaGFzIGJlZW4gc3dpdGNoZWQKdG8gc3RhbmRh
cmQgYm9vdCAoQ09ORklHX0JPT1RTVEQpLCByZWZlciB0byAoVS1Cb290IHJlcG8pOgoKY29tbWl0
IDM1NWMwYWZjZDRiN2M4YzQ0MmM0ZDAzZTA3NjQ5YzI0MTk0YjhlMDYKQXV0aG9yOiBOaXNoYW50
aCBNZW5vbiA8bm1AdGkuY29tPgpEYXRlOiAgIEZyaSBBdWcgMjUgMTM6MDI6NTIgMjAyMyAtMDUw
MAoKICAgIGNvbmZpZ3M6IGFtNjJ4X2V2bV9hNTNfZGVmY29uZmlnOiBTd2l0Y2ggdG8gYm9vdHN0
ZAoKYW5kCgpjb21taXQgYWI1NGQ5YjI4ZDg1NzhjYzQzYjIxNGQzOTAwOWU3YjFkZWY3OTdlNApB
dXRob3I6IFJvZ2VyIFF1YWRyb3MgPHJvZ2VycUBrZXJuZWwub3JnPgpEYXRlOiAgIFRodSBPY3Qg
NSAxNjowNjo0MSAyMDIzICswMzAwCgogICAgYm9hcmQ6IHRpOiBhbTYyeDogYW02MnguZW52OiBG
aXggYm9vdF90YXJnZXRzCiAgICAKICAgIHRpX21tYyBpcyBub3QgYSB2YWxpZCBib290X3Rhcmdl
dCBmb3Igc3RhbmRhcmQgYm9vdCBmbG93IHNvCgpJIHN1cHBvc2UgVEkncyBCU1Agc3RpbGwgdXNl
cyBvbGRlciBVLUJvb3QgYW5kIGlzIHN0aWxsIG5vdCBhZmZlY3RlZC4KRG8gd2UgbmVlZCB1RW52
LnR4dCBub3c/IERvIHlvdSBoYXZlIGFuIGlkZWEgd2hpY2ggZGlzdHJvIE5pc2hhbnRoIG1heQpo
YXZlIHRlc3RlZCB3aXRoIEJPT1RTVEQgY2hhbmdlPwoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
