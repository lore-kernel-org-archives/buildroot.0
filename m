Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ADCC43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 21:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D973A60714;
	Wed,  8 Jul 2026 21:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oVqDP2-Ys9ga; Wed,  8 Jul 2026 21:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C508160663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783546194;
	bh=IGivDs38vm0luVAZL89dHLJCDAmexlj59sYmjAIRiGQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=OB0T8nu6KJlsCSGYjpA+dPFav/uToyh0tnp9RBI9ZQTZe3ms1SFpp4AypxCQXG2RM
	 kJ/DimNDpdcyK2ETIUT0dooxb/4AqDI55WafqF2vNbzhGNTYvAPtSFxvKuIrQh6u8/
	 d3GbL1EX61YkyFm9Kuq/WPABljD0+POdO4GTc1M4CNFw7MS/R1HMLux/Qj0kwEW2cb
	 ANIFqtba/OzJaK5rTsP1ioTxFCxEtfJx2nydFY5hctyQmdlZiJws8qNEPQ5aKV50Do
	 MObKiksPF0HZO3GCPsUcVeXp2tDG7i65SJgCnj2OaSaO/Beb/+d6Xjjfz3NrszuFXg
	 0QaXz9oWr4zrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C508160663;
	Wed,  8 Jul 2026 21:29:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E48903A8
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1B7940A18
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXxD6pHWl2aS for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 21:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87F1640984
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87F1640984
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87F1640984
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 21:29:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493c55d5c7aso11942375e9.1
 for <buildroot@buildroot.org>; Wed, 08 Jul 2026 14:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783546189; x=1784150989;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Lrgyk5BeOJAtK7RbLpUvwJ7E5gzjOewRRECE0t0j8NQ=;
 b=PHGHpZkwYWRwtEdnm8yBqFGBquwcyMtOAc0oJH8VS6xmwVnxHseCwDyTBui+ryQEr2
 d4mH2QhLDwJxhQ77iDpeCR68UEUhYk3AF8Wu1jOAOmmcgSi40mGOCT1fEuQX+RgC9GZl
 y1sNJ8k4bIqdsUEx+ZJJDovj6LtlIO/Rb0SjROyndyXZtuKZGUdb1xr0vRXMmeH25YjO
 cGR6bl5VJez6XDVsJ81n90mbeiOEPiAW5HoL0iLgEYhAVN6iynIay+yqQA6+dsYhTj+e
 ZFCyhj0Nh0iD9rPIO6X+ez5KKiz9N70sgmoC9DZ16HVtah8x3FCIPpS8ElSSkLP+U8dh
 kCTg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDj0EYHHoLR3akgWDjcqKjAQU4FgGy4mwoa04v66Tf3bF69Z8W0BPRMtit+05quQpajVYZFdb8j+8=@buildroot.org
X-Gm-Message-State: AOJu0YzN7lQTx/aOuMeC19rBXjERWPk5Ly1qFA/NtTA7isbHvNtTRdho
 VcNYJiv9Mj++NhD9/fIdpM97Gnmlq9U/cW9Q4T8QUwksR5aU6es07FaqcBA+Kpr/9WA=
X-Gm-Gg: AfdE7ckdqigKlnRR/HfjDil+mlpM3FOfZMN7gpy7HRBMSZPC7iytxzfGLCpXrdFjWp2
 xQXwsga+sKFnnIHOZWVa7ETSoCAph7bXPlJ2/ZMNKBOuyyZo5rlvDcG9CngLKEQ+ZMUQl/dX1Ew
 xT8ai/HeNBnMqnqAUsxD+2NNcsQLMecQBqhwEqSHBIj7Mf+JfacVmiMlhOa+ifQrvjD81nfmAN9
 VROQCPgU2bRH33m2DU8P3cJmhv/QB60D0UxpPRXwgO1e6VpplVZWUywTVyYYhKM8XW3QskDFedG
 rGQwkNfRsOpZ8JaBZ9nEeZ+2FoTW96GisnXHemYn0WxU7ijWORTYE3F31S/MQ+R1Gg3erL05bKv
 JQMOhE/xQ+P5nZBufGepcqEXL0J5gKKqQJdUiQ2W+Zr5BteuyaH8z9FGX81YHh0jO15ajeDfZf2
 2CN6CVJd6O2o74OeD4x//TCIGf+UDXefg+vXxNlM/3Cp4cQW7bsleovaCJmKqRfiVDhROzAnB4H
 sO4KB7WVUiFCc0JrbQFtxnFGgwaBpX1i2CTDEErfj5PfdIHG0Ns74Y=
X-Received: by 2002:a05:600c:3acb:b0:493:b91c:6bf with SMTP id
 5b1f17b1804b1-493e68c6d73mr40131325e9.18.1783546188751; 
 Wed, 08 Jul 2026 14:29:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e54a25cfsm100974445e9.0.2026.07.08.14.29.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 14:29:48 -0700 (PDT)
Message-ID: <77b8d847-cf94-4919-bbef-bb934e1fbc9d@smile.fr>
Date: Wed, 8 Jul 2026 23:29:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
References: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
 <akyWylX0rDN1XX6N@yd-6wlzhs3>
Content-Language: fr
In-Reply-To: <akyWylX0rDN1XX6N@yd-6wlzhs3>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1783546189; x=1784150989; darn=buildroot.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Lrgyk5BeOJAtK7RbLpUvwJ7E5gzjOewRRECE0t0j8NQ=;
 b=wVH98JL2DOEHbUIeUlzmAyI/2zYfcLnGbdiJy3z37SbL70L2ByebpljThzoif6e71a
 lLSORhiEC6GXlIz9mtfNSk4cIuUDTOpnMOVVTJA1UquUsP1fYfz+dwGuhhu+u7XYw6dz
 P1UUW1wz6zyb1OhB0WRTE7vdglGxhEVPEbjxg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=wVH98JL2
Subject: Re: [Buildroot] [PATCH] support/docker: make the image reproducible
 again
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Dowan Gullient <dowan.gullient@smile.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDcvMDcvMjAyNiDDoCAwODowMywgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gSGVsbG8gQWxsIQo+IAo+IE9uIDIwMjYtMDYtMDMgMDk6NTEg
KzAyMDAsIHlhbm4ubW9yaW5Ab3JhbmdlLmNvbSBzcGFrZSB0aHVzbHk6Cj4+IEZyb206ICJZYW5u
IEUuIE1PUklOIiA8eWFubi5tb3JpbkBvcmFuZ2UuY29tPgo+Pgo+PiBUaGUgRGViaWFuIDEyIEJv
b2t3b3JtIHNuYXBzaG90IHdlIHVzZSwgMjAyNTAyMDMsIHVzZXMgdGhlIG5ldyBkZWI4MjIKPj4g
Zm9ybWF0IFswXSBmb3Igc291cmNlIGxpc3QgZmlsZXM7IGl0IGNhcnJpZXMgYSBzb3VyY2UgbGlz
dCBmaWxlIHRoYXQKPj4gcG9pbnRzIHRvIHRoZSBjdXJyZW50IHJlcG9zaXRvcnksIG5vdCB0byB0
aGUgc25hcHNob3QuCj4+Cj4+IEV2ZW4gdGhvdWdoIHdlIGRvIGluamVjdCBhbiBvbGQtc3R5bGUg
c291cmNlIGxpc3QgdGhhdCBwb2ludHMgdG8gdGhlCj4+IHNuYXBob3QgcmVwb3NpdG9yeSwgdGhl
IHBhY2thZ2VzIGluIHRoZSBjdXJyZW50IHJlcG9zaXRvcnkgYXJlIG1vcmUKPiAKPiAqc25hcHNo
b3QKPiAKPiBPdGhlcndpc2UsIGFueSBmZWVkYmFjayBvbiB0aGlzIG9uZT8KCkkgc3RhcnRlZCBh
IGxvY2FsIGJ1aWxkIGhlcmUuCgpXZSB3YW50IHRvIHVwZGF0ZSB0aGUgRG9ja2VyIGltYWdlIHRv
IERlYmlhbiAxMyAoY3VycmVudCBzdGFibGUpIHNvb24sIGRvIHlvdQp0aGluayBpdCB3b3J0aCB0
byByZWJ1aWx0IGl0IG5vdz8KCkkgd291bGQgbGlrZSB0byB1c2UgdGhpcyBvcHBvcnRpbml0eSB0
byBhZGQgYSBuZXcgR2l0bGFiLUNJIGpvYiB0byBidWlsZCB0aGlzCmRvY2tlciBpbWFnZSBhbmQg
cHVzaCBpdCBkaXJlY3RseSBpbnRvIHRoZSBHaXRsYWIgY29udGFpbmVyIHJlZ2lzdHJ5LiBBcm5v
dXQKc3VnZ2VzdGVkIHRoaXMgYSB3aGlsZSBhZ28gOy0pCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoK
PiAKPiBSZWdhcmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCj4+IHJlY2VudCB0aGFuIHRoZSBvbmUg
aW4gdGhlIHNuYXBzaG90LCBzbyB3aGVuIHdlIGluc3RhbGwgb3VyIHBhY2thZ2VzLAo+PiB0aGV5
IGdldCByZXRyaWV2ZWQgbW9zdGx5IGZyb20gdGhlIGN1cnJlbnQgcmVwb3NpdG9yeSByYXRoZXIg
dGhhbiBmcm9tCj4+IHRoZSBzbmFwc2hvdC4gVGhlIGltYWdlIGlzIG5vdCByZXByb2R1Y2libGUu
Cj4+Cj4+IFN3aXRjaCB0byB1c2luZyB0aGUgbmV3IGRlYjgyMi1zdHlsZSBzb3VyY2UgbGlzdCBm
aWxlLgo+Pgo+PiBOb3RlOiB3ZSBkbyBub3QgbmVlZCB0byBjYXJyeSB0aGUgIkxhdGVzdCBqdXN0
IGJlZm9yZSIgdHJpY2s6IHRoZQo+PiBzbmFwc2hvdCByZXBvc2l0b3J5IHdpbGwgdXNlIHRoZSBt
b3N0IHJlY2VudCBhY3R1YWwgc25hcHNob3QgYmVmb3JlIHRoZQo+PiByZXF1ZXN0ZWQgZGF0ZWQs
IHNvIHdlIGNhbiBqdXN0IHVzZSB0aGUgZGF0ZSBvZiB0aGUgaW1hZ2Ugd2UgdXNlIChzdHVjawo+
PiBhdCBtaWRuaWdodCBiZWNhdXNlIHdlIGRvbid0IGhhdmUgYmV0dGVyKS4KPj4KPj4gU2luY2Ug
dGhlIHNuYXBzaG90IHJlcG9zaXRvcnkgY2FuIGJlIHJlYWxseSBzbG93LCB3aGlsZSBhdCB0aGUg
c2FtZSB0aW1lCj4+IHRoZSByZW1vdGUgaHR0cCBzZXJ2ZXIgbm90IGRyb3BwaW5nIGNvbm5lY3Rp
b25zLCBpdCBjYW4gdGFrZSBhIHZlcnkgbG9uZwo+PiB3aGlsZSB0byBidWlsZCB0aGUgaW1hZ2U7
IGFkZCBhIHRpbWVvdXQgc28gdGhhdCBzdGFsZSBjb25uZWN0aW9ucyBhcmUKPj4gZGV0ZWN0ZWQg
YW5kIHJlLWF0dGVtcGVkIGVhcmx5LWlzaCAodGhlIHRpbWVvdXQgYXBwbGllcyB0byBib3RoIHRo
ZQo+PiBjb25uZWN0IGFuZCB0aGUgYWN0dWFsIGRvd25sb2FkLCBzbyBpdCBzaG91bGQgYmUgbGFy
Z2UgZW5vdWdoIHRvCj4+IGFjY29tb2RhdGUgc2xvd2lzaCBuZXR3b3JrIGNvbm5lY3Rpb25zKS4K
Pj4KPj4gRml4ZXM6IGM5NWQ1YjhlMWViOSAoc3VwcG9ydC9kb2NrZXI6IG1vdmUgdG8gY3VycmVu
dCBib29rd29ybSAoRGViaWFuCj4+IDEyKSBzbmFwc2hvdCkKPj4KPj4gWzBdIGh0dHBzOi8vbWFu
cGFnZXMuZGViaWFuLm9yZy90cml4aWUvYXB0L3NvdXJjZXMubGlzdC41LmVuLmh0bWwjREVCODIy
LVNUWUxFX0ZPUk1BVAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1v
cmluQG9yYW5nZS5jb20+Cj4+IENjOiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5j
b20+Cj4+IENjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4gLS0tCj4+
ICBzdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlICAgICAgIHwgMTEgKysrKysrKy0tLS0KPj4gIHN1
cHBvcnQvZG9ja2VyL2FwdC1zb3VyY2VzLmxpc3QgfCAgNCAtLS0tCj4+ICBzdXBwb3J0L2RvY2tl
ci9kZWJpYW4uc291cmNlcyAgIHwgMTMgKysrKysrKysrKysrKwo+PiAgMyBmaWxlcyBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+PiAgZGVsZXRlIG1vZGUgMTAwNjQ0
IHN1cHBvcnQvZG9ja2VyL2FwdC1zb3VyY2VzLmxpc3QKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBz
dXBwb3J0L2RvY2tlci9kZWJpYW4uc291cmNlcwo+Pgo+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9k
b2NrZXIvRG9ja2VyZmlsZSBiL3N1cHBvcnQvZG9ja2VyL0RvY2tlcmZpbGUKPj4gaW5kZXggZTc2
NzdhYzZhOS4uNjg3ZWVlODExMCAxMDA2NDQKPj4gLS0tIGEvc3VwcG9ydC9kb2NrZXIvRG9ja2Vy
ZmlsZQo+PiArKysgYi9zdXBwb3J0L2RvY2tlci9Eb2NrZXJmaWxlCj4+IEBAIC0yNCw3ICsyNCw3
IEBAIEFSRyBUQVJfVkVSU0lPTj0iMS4zNSIKPj4gIEVOViBERUJJQU5fRlJPTlRFTkQ9bm9uaW50
ZXJhY3RpdmUKPj4gIAo+PiAgIyBUaGlzIHJlcG9zaXRvcnkgY2FuIGJlIGEgYml0IHNsb3cgYXQg
dGltZXMuIERvbid0IHBhbmljLi4uCj4+IC1DT1BZIGFwdC1zb3VyY2VzLmxpc3QgL2V0Yy9hcHQv
c291cmNlcy5saXN0Cj4+ICtDT1BZIGRlYmlhbi5zb3VyY2VzIC9ldGMvYXB0L3NvdXJjZXMubGlz
dC5kL2RlYmlhbi5zb3VyY2VzCj4+ICAKPj4gICMgSW5zdGFsbCAzMmJpdCB2YXJpYW50IG9uIHg4
Nl82NCBpbWFnZS4KPj4gIFJVTiBpZiBbICIkVEFSR0VUUExBVEZPUk0iID0gImxpbnV4L2FtZDY0
IiBdOyB0aGVuIFwKPj4gQEAgLTMyLDE1ICszMiwxOCBAQCBSVU4gaWYgWyAiJFRBUkdFVFBMQVRG
T1JNIiA9ICJsaW51eC9hbWQ2NCIgXTsgdGhlbiBcCj4+ICBmaQo+PiAgCj4+ICAjIFRoZSBjb250
YWluZXIgaGFzIG5vIHBhY2thZ2UgbGlzdHMsIHNvIG5lZWQgdG8gdXBkYXRlIGZpcnN0Cj4+IC1S
VU4gYXB0LWdldCAtbyBBUFQ6OlJldHJpZXM9MyB1cGRhdGUgLXkKPj4gK1JVTiBhcHQtZ2V0IC1v
IEFQVDo6UmV0cmllcz0zIC1vIEFQVDo6QWNxdWlyZTo6aHR0cDo6VGltZW91dD02MCBcCj4+ICsg
ICAgICAgIHVwZGF0ZSAteQo+PiAgCj4+ICBSVU4gaWYgWyAiJFRBUkdFVFBMQVRGT1JNIiA9ICJs
aW51eC9hbWQ2NCIgXTsgdGhlbiBcCj4+IC0gICAgYXB0LWdldCAtbyBBUFQ6OlJldHJpZXM9MyBp
bnN0YWxsIC15IC0tbm8taW5zdGFsbC1yZWNvbW1lbmRzIFwKPj4gKyAgICBhcHQtZ2V0IC1vIEFQ
VDo6UmV0cmllcz0zIC1vIEFQVDo6QWNxdWlyZTo6aHR0cDo6VGltZW91dD02MCBcCj4+ICsgICAg
ICAgIGluc3RhbGwgLXkgLS1uby1pbnN0YWxsLXJlY29tbWVuZHMgXAo+PiAgICAgICAgICBnKyst
bXVsdGlsaWIgXAo+PiAgICAgICAgICBsaWJjNjppMzg2OyBcCj4+ICBmaQo+PiAgCj4+IC1SVU4g
YXB0LWdldCAtbyBBUFQ6OlJldHJpZXM9MyBpbnN0YWxsIC15IC0tbm8taW5zdGFsbC1yZWNvbW1l
bmRzIFwKPj4gK1JVTiBhcHQtZ2V0IC1vIEFQVDo6UmV0cmllcz0zIC1vIEFQVDo6QWNxdWlyZTo6
aHR0cDo6VGltZW91dD02MCBcCj4+ICsgICAgICAgIGluc3RhbGwgLXkgLS1uby1pbnN0YWxsLXJl
Y29tbWVuZHMgXAo+PiAgICAgICAgICBiYyBcCj4+ICAgICAgICAgIGJ1aWxkLWVzc2VudGlhbCBc
Cj4+ICAgICAgICAgIGJ6ciBcCj4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2RvY2tlci9hcHQtc291
cmNlcy5saXN0IGIvc3VwcG9ydC9kb2NrZXIvYXB0LXNvdXJjZXMubGlzdAo+PiBkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggZDZmYmY4NTI3MC4uMDAwMDAwMDAwMAo+PiAtLS0gYS9z
dXBwb3J0L2RvY2tlci9hcHQtc291cmNlcy5saXN0Cj4+ICsrKyAvZGV2L251bGwKPj4gQEAgLTEs
NCArMCwwIEBACj4+IC0jIExhdGVzdCBqdXN0IGJlZm9yZSAyMDI1MDIxODIxMTAwMFo6Cj4+IC1k
ZWIgW2NoZWNrLXZhbGlkLXVudGlsPW5vXSBodHRwOi8vc25hcHNob3QuZGViaWFuLm9yZy9hcmNo
aXZlL2RlYmlhbi8yMDI1MDIxOFQxNDQ5MzhaLyBib29rd29ybSBtYWluCj4+IC1kZWIgW2NoZWNr
LXZhbGlkLXVudGlsPW5vXSBodHRwOi8vc25hcHNob3QuZGViaWFuLm9yZy9hcmNoaXZlL2RlYmlh
bi1zZWN1cml0eS8yMDI1MDIxOFQxNDQ5MzhaLyBib29rd29ybS1zZWN1cml0eSBtYWluCj4+IC1k
ZWIgW2NoZWNrLXZhbGlkLXVudGlsPW5vXSBodHRwOi8vc25hcHNob3QuZGViaWFuLm9yZy9hcmNo
aXZlL2RlYmlhbi8yMDI1MDIxOFQxNDQ5MzhaLyBib29rd29ybS11cGRhdGVzIG1haW4KPj4gZGlm
ZiAtLWdpdCBhL3N1cHBvcnQvZG9ja2VyL2RlYmlhbi5zb3VyY2VzIGIvc3VwcG9ydC9kb2NrZXIv
ZGViaWFuLnNvdXJjZXMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAw
MC4uMzZlMWVlYjNlNwo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3N1cHBvcnQvZG9ja2VyL2Rl
Ymlhbi5zb3VyY2VzCj4+IEBAIC0wLDAgKzEsMTMgQEAKPj4gK1R5cGVzOiBkZWIKPj4gK1VSSXM6
IGh0dHA6Ly9zbmFwc2hvdC5kZWJpYW4ub3JnL2FyY2hpdmUvZGViaWFuLzIwMjUwMjAzVDAwMDAw
MFoKPj4gK1N1aXRlczogYm9va3dvcm0gYm9va3dvcm0tdXBkYXRlcwo+PiArQ29tcG9uZW50czog
bWFpbgo+PiArU2lnbmVkLUJ5OiAvdXNyL3NoYXJlL2tleXJpbmdzL2RlYmlhbi1hcmNoaXZlLWtl
eXJpbmcuZ3BnCj4+ICtDaGVjay1WYWxpZC1VbnRpbDogbm8KPj4gKwo+PiArVHlwZXM6IGRlYgo+
PiArVVJJczogaHR0cDovL3NuYXBzaG90LmRlYmlhbi5vcmcvYXJjaGl2ZS9kZWJpYW4tc2VjdXJp
dHkvMjAyNTAyMDNUMDAwMDAwWgo+PiArU3VpdGVzOiBib29rd29ybS1zZWN1cml0eQo+PiArQ29t
cG9uZW50czogbWFpbgo+PiArU2lnbmVkLUJ5OiAvdXNyL3NoYXJlL2tleXJpbmdzL2RlYmlhbi1h
cmNoaXZlLWtleXJpbmcuZ3BnCj4+ICtDaGVjay1WYWxpZC1VbnRpbDogbm8KPj4gLS0gCj4+IDIu
MzQuMQo+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
