Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EFFC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67B4060608;
	Wed,  5 Feb 2025 21:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYQdyTVn9wom; Wed,  5 Feb 2025 21:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D4AF6060C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D4AF6060C;
	Wed,  5 Feb 2025 21:55:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EB73E1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 604C64028C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04HVugxnO2Nh for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAA3640400
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAA3640400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAA3640400
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:55:22 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-866f0d696e0so56424241.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738792521; x=1739397321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IaG+PREEdGkdcU01rbe11427VvnEFk9CWOTCGo6LdgQ=;
 b=q85A4OHpWtRP5JTTtIkpp4gJE4Mho3xeCgGRawiAPWZsSinMn8AK3SbKeYoR84QNE0
 FKCFI1+/ptkoaRJ34EFwf0kkWcN1oYdBg3yiuevCW5DdgurKqr1DKYhRrgeACd9+uxbL
 l/QrgYGzISut0PUDlnVLTYW8m4lufnG2sqgGaXpKJIyYwdrf65lJHqjCrAHHD9mz2A3N
 prCuyHNBdVDxbOqNdv0EHtkkPDTSx6G04voFdIyVZlJoQYgyVpBGwRuKZ/AcIy3jKUWb
 gt3Y+ua5DfP0pO80Z41E0ElCcLN6wGEMrIeL8vaVN7Kcmm7KHZtfa9DOOSsWDbKryztH
 zpWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVoDqq8s4W6JHPZhaVTojY09YAwpiTIDrbYFyB52vTDmxKTHHjJGdwVp1wr9nunPvD2LUrRXzNISE=@buildroot.org
X-Gm-Message-State: AOJu0YypSRmlhsE/SgySAWxovK2fSdczDH0ut4q+ATbbippJsL7SD5FR
 5OyM/XsNAojOjwjDli/jIGSkhp2YhAvmqsU3cmu21jx/XxtcrQBHle2SM/p10bAkG81gVMopyrl
 HaLRwuTNrCD88hbkjekdOuOtYrFY=
X-Gm-Gg: ASbGncs1sR32ksDlOsnil2X8iGviR3TnHnuz9/iF7yp8tB9yl+19gON7QsDw2pZ+aHs
 I604LIuXpmJ9PR0vKe65dbmbm0Fa6fy38kDRzR8fQRvGV0ARIUsX4adp/e9LaS7TGvtQg0BU27g
 ==
X-Google-Smtp-Source: AGHT+IFZXwObnbeWWVBQWMe844m9HN7BzyFCapzQRDaKatmSdwTwVVrhbhk0Mm2BgNJpES2T+2pIL4Agu0jR+kHtiGU=
X-Received: by 2002:a05:6102:1515:b0:4b6:3d72:5c28 with SMTP id
 ada2fe7eead31-4ba47a8c4e3mr3922263137.18.1738792521398; Wed, 05 Feb 2025
 13:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <CA+h8R2oJWZw_S08XXhjE--_So0UJohVLWSoj30PpR9z66x8U1A@mail.gmail.com>
 <CADvTj4r5ZAFkyqMctj4fV=vnkqDn2g+oG3g2PjTHJKSkVLQNVQ@mail.gmail.com>
 <edd5e025-798f-4e5b-9d31-baed883a65bf@mind.be>
 <CADvTj4rQsmOq_+AcZU8yQNfod_=kyKtO3HP+F4VZ_PMuYXmd6w@mail.gmail.com>
 <CA+h8R2oU_CHcTw6aCdyTXGH9F-eEd+nxwzjfcZPhb99ZJvHe0Q@mail.gmail.com>
 <CADvTj4onhc2rTzFa7F5bDFXSNQJ2CKuyU-TD-fwhpQUXNHZTcw@mail.gmail.com>
 <CA+h8R2ofCEUxWBVU5S9_vx5YtsE-Mjq95WL6DzTM5YF38A-izA@mail.gmail.com>
In-Reply-To: <CA+h8R2ofCEUxWBVU5S9_vx5YtsE-Mjq95WL6DzTM5YF38A-izA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Feb 2025 23:55:09 +0200
X-Gm-Features: AWEUYZmOhw5wP8GlW8vPqPv73NWXEhElmxZagLJUqoDWmG8bHCRZexTM_pAAl5M
Message-ID: <CADvTj4r1z1Y8cLZ45i1kJKgULiJMehBjR_OZ8oeWHw5jaj4+aA@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738792521; x=1739397321; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IaG+PREEdGkdcU01rbe11427VvnEFk9CWOTCGo6LdgQ=;
 b=e3L0PUxBvFM3lAnLhtswHpq9n/wstX2pd/A9P059SpAB9Mxyk0f/NFxJqNYd3tzCUn
 vDGtGPS49EccdwWHiQmbryCE5dmqHtgdIiLCvQXeihnnyebs2R4UIepF9y6lJGrBFRbg
 9yebO1SUrw5kmyxti8RIbsjbHVjzrfkQN3hFhGE4AhH2d1YtEjXO6+F1sjiaTMHoKSMn
 e7IanUFF0G1c6xtVCR8c5w71Ed6LLshxjBM5YGL2EVsA2Y1+Jje8B1kTNtdx4CeH6eVY
 5qMJbhhz6LPQBW77lYuVVSvn2GJlLp3f9JZRX8FKsygqVd7pwWMvMrAJNtaT6doFzFxA
 A5bQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=e3L0PUxB
Subject: Re: [Buildroot] [PATCH v4 1/2] package/pkg-golang.mk: allow
 packages to override download GOPROXY
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBGZWIgNSwgMjAyNSBhdCAxMToyM+KAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiBXZWQsIEZlYiA1
LCAyMDI1IGF0IDEyOjM44oCvUE0gSmFtZXMgSGlsbGlhcmQKPiA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gPiA+IERvIHlvdSBoYXZlIGFueSBleGFtcGxlcyBvZiBjYXNlcyB3
aGVyZSB0aGlzIGhhcyBoYXBwZW5lZD8KPiA+Cj4gPiBMb29rIGF0IG15IG5ldGJpcmQgUFIsIGxp
dGVyYWxseSBhIGNhc2Ugb2YgMiB1cmxzIGdvaW5nIGludmFsaWQgYXQgc29tZSBwb2ludC4KPiA+
Cj4gPiA+IElmIGl0IGRvZXMgaGFwcGVuLCB3ZSBjYW4gbWlycm9yIHRoZSBwYWNrYWdlIC50YXIu
Z3ogaW4gdGhlIGJ1aWxkcm9vdCBtaXJyb3IuIEhhdmUgd2UgZXZlciBuZWVkZWQgdG8gZG8gdGhp
cyB0aHVzIGZhcj8KPiA+Cj4gPiBXZSBkb24ndCByZWFsbHkgaGF2ZSBhIGxvdCBvZiBnb2xhbmcg
cGFja2FnZXMgeWV0LCBidXQgYmFzZWQgb24gdGhlIGJyZWFrYWdlCj4gPiBJIHNlZSBpbiBwYWNr
YWdlcyBsaWtlIG5ldGJpcmQgaXQgc2VlbXMgbGlrZSBhbiBpbmV2aXRhYmxlIGlzc3VlIGF0IGFu
eQo+ID4gbWVhbmluZ2Z1bCBzY2FsZS4KPiA+Cj4gPiA+PiBGb3IgZXhhbXBsZSBuZXRiaXJkIGlz
IHN0aWxsIGJyb2tlbiB3aXRoIEdPUFJPWFk9ZGlyZWN0IGR1ZSB0byB1cmwgYnJlYWthZ2UKPiA+
ID4+IGlzc3VlcyB3aGljaCBoYXZlIG5vdCBoYWQgZml4ZXMgbWVyZ2VkKHN1cnByaXNlIHN1cnBy
aXNlIG1haW50YWluZXJzIGRvbid0Cj4gPiA+PiBjYXJlIG9yIHRlc3Qgd2l0aCBHT1BST1hZPWRp
cmVjdCBzZWVtaW5nbHkgZXZlciBhcyBpdCdzIG5vdCB0aGUgZGVmYXVsdCk6Cj4gPiA+PiBodHRw
czovL2dpdGh1Yi5jb20vbmV0YmlyZGlvL25ldGJpcmQvcHVsbC8zMjQwCj4gPiA+Cj4gPiA+IEkg
ZG9uJ3QgYWdyZWUgdGhhdCB5b3VyIDEgd2VlayBvbGQgUFIgbm90IGJlaW5nIG1lcmdlZCB5ZXQg
aXMgYSBzdWl0YWJsZSBpbmRpY2F0b3IgdGhhdCBtYWludGFpbmVycyBkb24ndCBjYXJlIGFib3V0
IHRoZWlyIGRlcGVuZGVuY2llcyBtYXRjaGluZyB3aGF0IGlzIGluIEdpdC4KPiA+Cj4gPiBXZWxs
IHRoYXQgYW5kIHRoZSBmYWN0IHRoYXQgR09QUk9YWT1kaXJlY3Qgd2FzIGJyb2tlbiBpbiB0aGUg
Zmlyc3QgcGxhY2UKPiA+IGlzIGEgcHJldHR5IHN0cm9uZyBpbmRpY2F0b3IgdXBzdHJlYW0gcHJv
amVjdHMgZG9uJ3QgY2FyZSBhYm91dCBpdCBtdWNoLgo+Cj4gVGhleSBoYXZlIHJlcGxpZWQgdG8g
eW91ciBQUiByZXF1ZXN0aW5nIGFuIGFsdGVybmF0aXZlIHN0cmF0ZWd5IHRvCj4gZml4aW5nIHRo
ZSBpc3N1ZToKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9uZXRiaXJkaW8vbmV0YmlyZC9wdWxsLzMy
NDAjaXNzdWVjb21tZW50LTI2Mzc5NTY1MzcKPgo+IEhlcmUgYXJlIHRoZSBuZXcgUFJzIGltcGxl
bWVudGluZyB3aGF0IHRoZXkgcmVxdWVzdGVkOgo+Cj4gLSBodHRwczovL2dpdGh1Yi5jb20vbmV0
YmlyZGlvL25ldGJpcmQvcHVsbC8zMjg3Cj4gLSBodHRwczovL2dpdGh1Yi5jb20vbmV0YmlyZGlv
L25ldGJpcmQvcHVsbC8zMjg4Cj4KPiA+IFdoYXQncyB0aGUgcHVycG9zZSBvZiB0aGlzPyBXaGF0
IGFjdHVhbCByZWFsIHdvcmxkIGJlbmVmaXRzIGhhdmUgd2UgZ2FpbmVkCj4gPiBmcm9tIGZpeGlu
ZyB0aGVzZSBicm9rZW4gdXJsL2Rvd25sb2FkIGlzc3VlcyB1cHN0cmVhbSBhcyBvcHBvc2VkIHRv
IHNpbXBseQo+ID4gbm90IHVzaW5nIEdPUFJPWFk9ZGlyZWN0IGxpa2UgdGhlIHJlc3Qgb2YgdGhl
IGdvbGFuZyBlY29zeXN0ZW0/Cj4KPiBZb3UgbWF5IG5vdGUgdGhhdCB0aGUgZGVmYXVsdCBvZiBH
T1BST1hZIGlzOgo+Cj4gbmV0YmlyZCAlIGdvIGVudiBHT1BST1hZCj4gaHR0cHM6Ly9wcm94eS5n
b2xhbmcub3JnLGRpcmVjdAo+Cj4gTm90ZSB0aGF0ICJkaXJlY3QiIGlzIHRoZSBzZWNvbmQgaW4g
dGhlIGxpc3QsIHRoZSBmYWxsYmFjayBpZiB0aGUKPiBwcm94eSBkb2VzIG5vdCB3b3JrLgoKSSdt
IGF3YXJlIG9mIHRoZSBkZWZhdWx0IGZhbGxiYWNrLCBBRkFJVSBpdCBpcyB0eXBpY2FsbHkgb25s
eSB1c2VkIGlmCmh0dHBzOi8vcHJveHkuZ29sYW5nLm9yZyBpcyBicm9rZW4vZG93bi4gSU1PIHdl
IHNob3VsZCB1c2UgdGhlCnNhbWUgZGVmYXVsdCBmb3IgR09QUk9YWSBiZWNhdXNlIHRoZXJlIGlz
IG5vIGdvb2QgcmVhc29uCm5vdCB0byBkbyBzby4KCj4gSWYgdGhlIGRlZmF1bHQgd2VyZSB0aGUg
cHJveHkgd2l0aG91dCB0aGUgImRpcmVjdCIgcGFydCBpdCB3b3VsZCBiZQo+IHRydWUgdGhhdCAi
dGhlIHJlc3Qgb2YgdGhlIGdvbGFuZyBlY29zeXN0ZW0iIGRvZXMgbm90IHVzZQo+IEdPUFJPWFk9
ZGlyZWN0LgoKV2hlbiBJJ20gc2F5aW5nIHRoZSBlY29zeXN0ZW0gZG9lcyBub3QgdXNlIEdPUFJP
WFk9ZGlyZWN0LApJJ20gcmVmZXJyaW5nIHNwZWNpZmljYWxseSB0byBkaXNhYmxpbmcgdGhlIGNh
Y2hpbmcgcHJveHkgc3BlY2lmaWNhbGx5LgoKPgo+ID4gPiBJIGFncmVlIHdpdGggeW91ciBsb2dp
YyB0aGF0Ogo+ID4gPgo+ID4gPiAxKSBUaGUgZGV2ZWxvcGVycyBvZiBnbyBwcm9qZWN0cyBsaWtl
IERvY2tlciBvciBOZXRiaXJkIGhhdmUgcGlubmVkIGRlcGVuZGVuY2llcyBpbiBnby5zdW0gd2hp
Y2ggd2UgY2FuIHJlYXNvbmFibHkgdHJ1c3QuCj4gPiA+IDIpIGJ1aWxkcm9vdCBtYWludGFpbmVy
cyBkb24ndCB0eXBpY2FsbHkgZXhoYXVzdGl2ZWx5IGF1ZGl0IGFsbCBkZXBlbmRlbmNpZXMuCj4g
PiA+Cj4gPiA+IFdoYXQgSSBkaXNhZ3JlZSB3aXRoIGlzOwo+ID4gPgo+ID4gPiAxKSBJdCBpcyBp
bXBvc3NpYmxlIHRvIGF2b2lkIGFkZGluZyBhIEdvb2dsZSBob3N0ZWQgc2VydmljZSBhcyBhIGRl
cGVuZGVuY3kgZm9yIGJ1aWxkaW5nIEdvIHBhY2thZ2VzIGluIGJ1aWxkcm9vdC4KPiA+Cj4gPiBX
aGF0IEknbSBzYXlpbmcgaXMgdGhhdCBpdCdzIGltcG9zc2libGUgdG8gYXZvaWQgdGhlIGdvcHJv
eHkgY2FjaGUgd2l0aG91dAo+ID4gcmVseWluZyBvbiBidWlsZHJvb3QgaXRzZWxmIG1pcnJvcmlu
ZyBwYWNrYWdlcyB3aXRoIHRoZWlyIGRlcGVuZGVuY2llcyBpbiBhCj4gPiBnZW5lcmFsaXplZCBt
YW5uZXIgbG9uZyB0ZXJtLgo+Cj4gRG8geW91IGhhdmUgYW55IGV4YW1wbGVzIG9mIHRoZXNlIGJy
ZWFrYWdlcyBzbyBmYXI/IFdlIHVzZSBhIG51bWJlciBvZgo+IEdvIHBhY2thZ2VzIGluIEJ1aWxk
cm9vdCBleHRlbnNpdmVseSBhbHJlYWR5IHRvZGF5LCBsaWtlIGRvY2tlci1lbmdpbmUKPiBhbmQg
ZG9ja2VyLWNsaS4KCkkgaGF2ZW4ndCBzZWVuIGFueSBzcGVjaWZpY2FsbHksIGJ1dCBiYXNlZCBv
biB0aGUgYnVpbGQgZmFpbHVyZXMKSSd2ZSBzZWVuIHdoZW4gYXR0ZW1wdGluZyB0byB1c2UgR09Q
Uk9YWT1kaXJlY3QgaXQncyBjbGVhcmx5CmFuIGlzc3VlIHdlIHdvdWxkIGV2ZW50dWFsbHkgc3Rh
cnQgcnVubmluZyBpbnRvLgoKPgo+IEdpdmVuIHRoZSB0cmFkZW9mZnMgd2UgaGF2ZSBkaXNjdXNz
ZWQgYmV0d2VlbjoKPgo+IC0gImFsd2F5cyByZXF1aXJlIHRoZSBHb29nbGUgcHJveHkiIGFuZAo+
IC0gImZpeCBtaXNtYXRjaGVzIGF0IHBhY2thZ2UgYWRkL3VwZGF0ZSB0aW1lLCBtaXJyb3IgaWYg
ZGVwZW5kZW5jaWVzCj4gYXJlIHVuYXZhaWxhYmxlIGxvbmctdGVybSIKPgo+IFRoZXJlIGlzIGlu
c3VmZmljaWVudCBldmlkZW5jZSB0aGF0IHRoZSBtaXJyb3JpbmcgcGFydCBpcyBzdWNoIGEKPiBt
YWludGVuYW5jZSBidXJkZW4gdGhhdCB3ZSBtdXN0IGdvIHdpdGggb3B0aW9uIDEgaGVyZS4KPgo+
ID4gVGhlcmUncyBvbmx5IGRvd25zaWRlcyB0byB1c2luZyBHT1BST1hZPWRpcmVjdCBpbiBidWls
ZHJvb3QgZnJvbQo+ID4gd2hhdCBJIGNhbiB0ZWxsLCBJIGNhbid0IGV2ZW4gdGhpbmsgb2YgYSBz
aW5nbGUgcmVhbCB3b3JsZCBiZW5lZml0Lgo+Cj4gVXBzaWRlczoKPgo+IC0gTm8gZGVwZW5kZW5j
eSBvbiBhIHRoaXJkLXBhcnR5IHByb3h5IHNlcnZpY2UKCkFzIHlvdSBtZW50aW9uZWQgYWJvdmUs
IHJlbW92aW5nIHRoZSBHT1BST1hZPWRpcmVjdCBvdmVycmlkZQp3b3VsZCBub3QgbWFrZSB0aGUg
cHJveHkgc2VydmVyIGEgaGFyZCBkZXBlbmRlbmN5LCBidXQgd291bGQKc2ltcGx5IG1hZGUgZGly
ZWN0IGRvd25sb2FkcyBhIGZhbGxiYWNrLCBzbyB0aGlzIGlzbid0IGFuIHVwc2lkZQppbiB0aGUg
cmVhbCB3b3JsZC4KCk9uZSBjYW4gc3RpbGwgZml4IEdPUFJPWFk9ZGlyZWN0IGluIHVwc3RyZWFt
IHByb2plY3RzIGVpdGhlciB3YXksCmJ1dCBJIHNlZSBubyByZWFzb24gZm9yIGl0IHRvIGJlIGEg
aGFyZCByZXF1aXJlbWVudCBpbiBidWlsZHJvb3QuCgpFaXRoZXIgd2F5IHVzaW5nIHRoZSBwcm94
eSBjYWNoZSBkcmFzdGljYWxseSByZWR1Y2VzIHRoZSBudW1iZXIgb2YKc2VydmljZXMgdGhhdCBt
dXN0IGJlIGF2YWlsYWJsZSBmb3IgYSBwYWNrYWdlIHRvIGRvd25sb2FkIHN1Y2Nlc3NmdWxseS4K
CldoYXQgdXBzaWRlIGlzIHRoZXJlIHRvIGF2b2lkaW5nIHRoaXMgZGVwZW5kZW5jeSB3aGVuIHRo
ZSBhbHRlcm5hdGl2ZQppcyB3YXkgd2F5IHdvcnNlPwoKPiAtIEFiaWxpdHkgdG8gYnVpbGQgd2l0
aCBHT1BST1hZPWRpcmVjdCBmb3IgdGhvc2UgdGhhdCByZXF1aXJlIGl0Cj4gKG90aGVyd2lzZSBC
dWlsZHJvb3QgYnJlYWtzIGZvciB0aGVtIG9uIGRlZmF1bHQpCgpXaG8gYWN0dWFsbHkgcmVxdWly
ZXMgaXQ/IEkgdGhpbmsgcmVxdWlyaW5nIEdPUFJPWFk9ZGlyZWN0IGlzIGFuCmV4dHJlbWVseSBu
aWNoZSB1c2UgY2FzZSB0aGF0J3Mgbm90IHJlYWxseSBldmVuIGEgcHJhY3RpY2FsIHJlcXVpcmVt
ZW50LgoKPiAtIElmIGdvLm1vZCBzYXlzICJmb28vYmFyIGF0IHZlcnNpb24gdjEuMC4wIiB0aGVu
IHdlIGNhbiBiZSBzdXJlIHRoZQo+IEdpdCB0YWcgdjEuMC4wIG1hdGNoZXMgdGhlIGdvLnN1bS4K
CklmIHRoZSBoYXNoIG1hdGNoZXMgd2Uga25vdyB3ZSBoYXZlIHRoZSByaWdodCBkZXBlbmRlbmN5
LCB0aGF0J3MKYWxsIHRoYXQgd2UgcmVhbGx5IGNhcmUgYWJvdXQgaGVyZSBvdGhlciB0aGFuIGJl
aW5nIGFibGUgdG8gZG93bmxvYWQKdGhlIGRlcGVuZGVuY2llcyByZWxpYWJseS4KCj4gRG93bnNp
ZGVzOgo+Cj4gLSBTbG93ZXIgZmV0Y2ggKGdpdCBwdWxsIGluc3RlYWQgb2YgcHJveHkuZ29sYW5n
Lm9yZykKPiAtIFdlIG5lZWQgdG8gbWlycm9yIHBhY2thZ2VzIGlmIHRoZWlyIGRlcGVuZGVuY2ll
cyBnbyBhd2F5IChtb3N0IGFyZQo+IG9uIEdpdEh1YiwgdGhvdWdoKQo+Cj4gV2hlbiByZXF1ZXN0
aW5nIHRoYXQgdXBzdHJlYW0gcHJvamVjdHMgZml4IHRoZSBidWlsZCB3aXRoCj4gR09QUk9YWT1k
aXJlY3QgaXQgaGVscHMgdG8gbWVudGlvbiB3aHkgaW4gdGhlIFBSIGRlc2NyaXB0aW9uLgoKSSBn
dWVzcyBJIHNob3VsZCBtZW50aW9uIHNvbWV0aGluZyBsaWtlIHdlIG5lZWQgdG8gZml4IHRoaXMg
YmVjYXVzZQpidWlsZHJvb3QgdXNlcyBiYWQgR09QUk9YWSBkZWZhdWx0cyBzaW5jZSB3ZSBsaWtl
IGRvaW5nIGxvdHMgb2YKZXh0cmEgd29yayBmb3Igbm8gcHJhY3RpY2FsIHJlYXNvbj8KCj4KPiBC
ZXN0IHJlZ2FyZHMsCj4gQ2hyaXN0aWFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
