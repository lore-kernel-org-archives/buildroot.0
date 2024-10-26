Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F34D10C07
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD45D80570;
	Sat, 26 Oct 2024 21:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkZX545OWJPq; Sat, 26 Oct 2024 21:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E4880A6F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E4880A6F;
	Sat, 26 Oct 2024 21:56:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B14835C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9ED48400D7
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGhHfRzHmL5Y for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F1BA4000E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F1BA4000E
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F1BA4000E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:56:18 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-4a5ad828a0fso987124137.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729979778; x=1730584578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OHhlMlMJEOLuFL7ix7eFVmimN3eDQEfIUxxBmOnzQZE=;
 b=Y/B8IECvLKqTmaicW3UYjsfbYEp816WMUhlKP39QRHVPDo5tTE3oiBnPg1wwqHRQQ0
 fnNqMFzMsNFlxfe/BALlYacFl/gTd+nKGvu8tM9yQa4c5ws6CpQaCyYZoz1Hk+FfdoHV
 xKpMOtTSl3VAt88adcIKk7VlMh4RLrWNnG0rQ1bsMeUmvry594kZ09PXfcoGPFubphak
 oC0rF70Ds+e8Oo0UrddBE+c2yxcED+Al1f9ml3W5tddWyf1y0e7b/fLFaGFYu/PNmd0d
 Iz2TziXCEmT48bPedaP6XlBq2+wS+oLcC4mSPaSkzqw2UaHayoUVFr/1yJs8hEFBfyxx
 nTug==
X-Gm-Message-State: AOJu0YyAiVzXeMsNjQr9gXGcCzAGM3hcJGpyT5KdD+N60lnzGYqzo22c
 iU8yBNVn+Dr6hsa5b0LKWuAUMCjQnQMaYMr8OhAWyTVF6hrdcMk03r6Fkp2iWe7NHAZWgfuM1vM
 V9kod25+DB0mt4MHzjE6umxcM/vvbuShx
X-Google-Smtp-Source: AGHT+IEeruQ91lA6rjAquF8mZOF1psVouf7o9uD1DyjXv4y9+/uxwM4hzHrse695sfN11OOmDqD0M+b9jjtCsFGaQ/c=
X-Received: by 2002:a05:6102:358c:b0:4a3:a137:b9b with SMTP id
 ada2fe7eead31-4a8cfb4b371mr2583997137.11.1729979777733; Sat, 26 Oct 2024
 14:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240917021332.3838579-1-james.hilliard1@gmail.com>
 <20241026174451.0b1e2c89@windsurf>
 <CADvTj4qxs4=Er411V1-baHEVmr9FrTpOWzD3s-3oqM7ppqAb-Q@mail.gmail.com>
 <20241026233101.323e096b@windsurf>
In-Reply-To: <20241026233101.323e096b@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Oct 2024 15:56:06 -0600
Message-ID: <CADvTj4rhWRF1PCtY0JSwi3aVwCFby1woWQOWjfcKJMfk8=FAYQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, 
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729979778; x=1730584578; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHhlMlMJEOLuFL7ix7eFVmimN3eDQEfIUxxBmOnzQZE=;
 b=cJ3PsgjuhECBxUq/cgsdvCRweqMvPyH+QttpgQW52vXu36oKBzIJY952NMyCxHhSG5
 rV104cJHhAJDgQM1dqyyVdBNVP/OFJIh9qOQd7QNqDCcbBGnDRWqqVjZnRR+ZJcWZmG1
 tbiev0AXoBzGX+Q74uxVOYiEyQFG2Z7A7F7C8sx+pocEyqP5iWB7u0YhQUqkGxQUepYa
 Ief7rFpxXK0KR3/B+aRLBeAeXWBCO6h7lZZf6mNqFfGfFTz6aMnCjN/IQ0WbUOzVvDgQ
 YlMAajm+Zwcn2y8Whf65bVnBBwmNUSLtpNZ+SwW+EVIy2t1IHvfiEWaGuOccb0dyvZo9
 xBhA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cJ3Psgju
Subject: Re: [Buildroot] [PATCH v5 1/3] package/python-numpy: bump to
 version 1.26.4
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

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgMzozMeKAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBT
YXQsIDI2IE9jdCAyMDI0IDE1OjE1OjAzIC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiA+IFBsZWFzZSBkb2N1bWVudCBpbiB0aGUg
Lm1rIGZpbGUgaG93IHlvdSBjb3VsZCB0aG9zZSB2YWx1ZXMuIFlvdQo+ID4gPiBleHBsYWluZWQg
aXQgaW4gYSByZXBseSB0byB5b3VyIHY0LCBidXQgSSBiZWxpZXZlIGl0IHNob3VsZCBiZSBrZXB0
IGluCj4gPiA+IHRoZSBwYWNrYWdlIGZvciBwb3N0ZXJpdHkuIE1vcmUgY29tbWVudCBvbiB0aGlz
IGJlbG93Lgo+ID4KPiA+IE5vdCBzdXJlIHRoZSBiZXN0IHdheSB0byBkZXNjcmliZSBob3cgSSBn
b3QgdGhlc2UsIGxpa2Ugc2hvdWxkIEkgcHV0IG15Cj4gPiB0ZXN0IG91dHB1dCBzb21ld2hlcmU/
Cj4KPiBBIGNvbW1lbnQgdGhhdCBleHBsYWlucyBob3cgeW91IGdvdCBpdCwgbWF5YmUgZXZlbiB0
aGUgdGVzdCBwcm9ncmFtLCBldGMuCgpBZGRlZCBjb21tZW50IHdpdGggbGluayB0byB0ZXN0IHBy
b2dyYW0gaW4gdjY6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyNDEwMjYyMTQ3NDEuMzczNTQ5Ni0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20vCgo+Cj4KPiA+ID4gIyBTb21lIGdvb2QgY29tbWVudCBoZXJlIGFib3V0IGhvdyB0aG9zZSB2
YWx1ZXMgd2VyZSBmb3VuZAo+ID4gPiBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX05VTVBZX0xP
TkdET1VCTEVfRk9STUFUCj4gPiA+ICAgICAgICAgc3RyaW5nCj4gPiA+ICAgICAgICAgZGVmYXVs
dCAiSUVFRV9ET1VCTEVfTEUiIGlmIEJSMl8uLi4gfHwgQlIyXy4uLiB8fCBCUjJfLi4uCj4gPiA+
ICAgICAgICAgZGVmYXVsdCAiSUVFRV9ET1VCTEVfQkUiIGlmIEJSMl8uLi4gfHwgQlIyXy4uLgo+
ID4gPgo+ID4gPiBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX05VTVBZX0FSQ0hfU1VQUE9SVFMK
PiA+ID4gICAgICAgICBib29sCj4gPiA+ICAgICAgICAgZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdF
X1BZVEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCAhPSAiIgo+ID4gPgo+ID4gPiBUaGlzIHdh
eSB3ZSBjYW5ub3QgbWlzcyBhbnkgY2FzZSA6LSkKPiA+Cj4gPiBZZWFoLCBub3Qgc3VyZSB3aGF0
IHN0eWxlIGlzIGJlc3QsIEkga2luZCBvZiBqdXN0IHdlbnQgd2l0aCB0aGlzIG9uZQo+ID4gYmVj
YXVzZSB3ZSBlc3NlbnRpYWxseSBkbyB0aGUgc2FtZSBzb3J0IG9mIHRoaW5nIGZvciBtZXNvbjoK
PiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290L2Jsb2IvMjAyNC4wOC4x
L3BhY2thZ2UvcGtnLW1lc29uLm1rI0wzMi1MNjkKPgo+IFllYWgsIEkgYWdyZWUgYm90aCBvcHRp
b25zIGNhbiB3b3JrLiBXaGF0IHByb21wdGVkIG1lIHRvIHN1Z2dlc3QgdGhlCj4gQ29uZmlnLmlu
IHNvbHV0aW9uIGlzIHByZWNpc2VseSB0aGF0IHlvdSBoYWQgZm9yZ290dGVuIHNvbWUKPiBhcmNo
aXRlY3R1cmVzIGluIHRoZSAubWsgZmlsZSwgc2hvd2luZyB0aGF0IGl0IG1hZGUgc2Vuc2UgdG8g
dGllCj4gdG9nZXRoZXIgdGhlIGxpc3Qgb2YgYXJjaGl0ZWN0dXJlcyB3aXRoIHRoZSBsb25nIGRv
dWJsZSBmb3JtYXQgbGlzdC4KCk5vdCBzdXJlIHRoYXQgd291bGQgaGF2ZSBtYWRlIG11Y2ggb2Yg
YSBkaWZmZXJlbmNlLCBJIHdhcyBjb3B5aW5nIHRoZQpCUjJfYXJtZWIgbGluZSBhbmQgbXVzdCBo
YXZlIGZvcmdvdHRlbiB0byBjaGFuZ2UgdGhlIGFyY2ggdmFsdWUgYW5kCmZvcm1hdCBmb3Igc29t
ZSByZWFzb24uCgo+Cj4gPiA+IENvdWxkIHlvdSBoYXZlIGEgbG9vayBpbnRvIHRoaXM/IEkgd2Fu
dGVkIHRvIHJld29yayBteXNlbGYsIGJ1dCBzaW5jZQo+ID4gPiB0aGUgdmFsdWUgaXMgbWlzc2lu
ZyBmb3Igc29tZSBhcmNoaXRlY3R1cmVzIChpMzg2KSwgSSBjb3VsZG4ndCByZWFsbHkKPiA+ID4g
ZG8gaXQgZWFzaWx5Lgo+ID4KPiA+IE9oLCBJIGRpZCBhY3R1YWxseSBnZW5lcmF0ZSB0aGF0IHZh
bHVlIGhlcmUsIG11c3QgaGF2ZSBmb3Jnb3R0ZW4gdG8gY29weSBpdDoKPiA+IGh0dHBzOi8vZ2lz
dC5naXRodWIuY29tL2phbWVzaGlsbGlhcmQvYjA1Nzc5MWI1NWJkMzI4ODQzMDE3MzRkZjViNzgx
ZGIjZmlsZS1udW1weS1xZW11LXRlc3QtdHh0LUwxNi1MMTgKPgo+IFRoYXQncyBteSBwb2ludDog
eW91ciBsaXN0IG9mIGxvbmcgZG91YmxlIGZvcm1hdCBpbiB0aGUgLm1rIGZpbGUgd2FzCj4gbm90
IG1hdGNoaW5nIHdpdGggdGhlIGxpc3Qgb2Ygc3VwcG9ydGVkIENQVSBhcmNoaXRlY3R1cmVzIGRl
c2NyaWJlZCBpbgo+IHRoZSBDb25maWcuaW4gZmlsZS4KCkV2ZW4gaW4gdGhlIC5tayBmaWxlIEkg
aGFkbid0IGNvbXBsZXRlbHkgbWlzc2VkIGl0LCBJIGp1c3QgZ290IGhhbGZ3YXkKdGhyb3VnaCBh
ZGRpbmcgaXQoSSBoYWQgY29waWVkIHRoZSBsaW5lIGl0IHdhcyBzdXBwb3NlZCB0byBnbyBvbikg
YW5kCmZvcmdvdCB0byB1cGRhdGUgdGhlIGFyY2hpdGVjdHVyZSBhbmQgbG9uZyBkb3VibGUgZm9y
bWF0IHZhbHVlcy4KCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
