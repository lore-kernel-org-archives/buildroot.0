Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8F9C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 22:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96BE381289;
	Wed,  5 Feb 2025 22:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qt1zXXqREZVZ; Wed,  5 Feb 2025 22:05:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 845F0812E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 845F0812E7;
	Wed,  5 Feb 2025 22:05:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 877D512A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C160611A8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:05:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzYKe--No2x0 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 22:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 280DC61193
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 280DC61193
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 280DC61193
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:05:24 +0000 (UTC)
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-518954032b2so77031e0c.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 14:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738793124; x=1739397924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qR+KtPxzDBfZS5I3Icko6Ar/l5Ep9WnqITgMerLwgUQ=;
 b=Jv+gdaMKFEVh439d5ehjBDcJNAiS7m/GWrZNXwUGdG3a57AZYU1ESGuDEUERy3Q006
 bfHdOnqa9anoJrTCnWZR87xVClpzj3QFXTApa6wJPtiaNGpiDc3UOL+/YdntFp3zIsQJ
 Fiq+yhHCZMU5PyDHvVvD5Qcy7IQUYvlP9Jin6yPKN56XI0K3+3Ibcm2+Q0X0ZmfWLegz
 MwZHXpCACWS9LFcaRV1gfUoEbJZX5ddLcdtdfr/qH/oKCmJt0CztLUR6OrDLjiW8hyDX
 SzHFjTEYHDNJpenR0ya3AMPMZ44CU8bDCyrCG+JbQg/7QPX/IqfQpe7EQ0rqxgSDgQUT
 HeNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVryggU7sBAf1Y88RS7X4d7LzGJZ0tkofOHQxI74FKOsv7LlTeceBBR9LR7MoQb3X7aznRPbA/OIc=@buildroot.org
X-Gm-Message-State: AOJu0YzrQW6fsyMbf3P1fidgyvDUUi7Zj+XtzKigtml0RVMyeM5e+aXh
 oIkYmFCtv/5pMJ1NW+t5xSennXw3CxT73RUtEFnw85SiElOrWsRxO78IoplfDZQB80CMQlhnZWV
 oB1gCH3RLYXVgpUmZYdXej+EK+60=
X-Gm-Gg: ASbGncsNoi6QEnUW8AKQDhJ1hs6sEHxhkhHGsj5T7sDj6b5GpyuXWTnqv972o8ST+Fv
 ZNck9nCLCUxitF86n/2ImtPiCHGz86atj+nh2AsGZRp8KGsOVhcGvfC66xlIcOhP989zzcCa7GQ
 ==
X-Google-Smtp-Source: AGHT+IFu7WLpC2K2Vi7ISs4T5xhEXWECyLigeBwxxJvWp2IBl4ENKjtBzTBT8gRAY3ohRQ6W7tyVqjhVgNAyCieS4Iw=
X-Received: by 2002:a05:6122:da7:b0:515:daa7:ed07 with SMTP id
 71dfb90a1353d-51f0c0c2b93mr2951946e0c.0.1738793123773; Wed, 05 Feb 2025
 14:05:23 -0800 (PST)
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
 <664652f9-b64b-4e56-ab9e-a65f42b08b5e@mind.be>
In-Reply-To: <664652f9-b64b-4e56-ab9e-a65f42b08b5e@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 6 Feb 2025 00:05:12 +0200
X-Gm-Features: AWEUYZn9B28KrCccNZ1iJbq5Q1__XBh35d5eklKQNche3WhFybVT2-eq0Tyh6yo
Message-ID: <CADvTj4ruHc5BKPps_R6rYE=3AR-2hFjEUnGY134gSBuzz78V0Q@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738793124; x=1739397924; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qR+KtPxzDBfZS5I3Icko6Ar/l5Ep9WnqITgMerLwgUQ=;
 b=Y3kNX1ea+o0zO9+ck5k5E7XT6UOA6Rgn8GAS4emQsEh6M3xtknocfZ+MjLll3LJSvs
 7kg6AYSvAww4RzThr872S8++QsHEquakDC/YRgpTmEERSPVSvQmvompOfHQETC2YgOO8
 aMzVx3GJAOvqRAVYIj3qL55TmcaZDN/gyS0+BIIYuiO6vlFFREYuBXqDGwUew6dJwptV
 6z1+nGU8bTgR9k33d39uMQlRq+PbZco5Cu5dyeWyDhZQo9ixtAYQDszRYHlB3XXwvd48
 R7lAmxx8kvuCc7FLadOSNzWg8GVPKtM6TYppO09oKJPRx3YU7j8DEXYtNhQJEjOjuN3d
 uktQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y3kNX1ea
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBGZWIgNSwgMjAyNSBhdCAxMTo1NOKAr1BNIEFybm91dCBWYW5kZWNhcHBlbGxlIDxh
cm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4KPiAgIEhpIENocmlzdGlhbiwKPgo+ICAgVGhhbmsgeW91
IGZvciBzdW1tYXJpemluZyB0aGUgdXBzaWRlcyBhbmQgZG93bnNpZGVzIG9mIEdPUFJPWFk9ZGly
ZWN0IQo+Cj4gICBJIGhhdmUgYSBmZXcgYWRkaXRpb25zIHRob3VnaC4KPgo+IE9uIDA1LzAyLzIw
MjUgMjI6MjIsIENocmlzdGlhbiBTdGV3YXJ0IHdyb3RlOgo+IFtzbmlwXQo+ID4gVXBzaWRlczoK
PiA+Cj4gPiAtIE5vIGRlcGVuZGVuY3kgb24gYSB0aGlyZC1wYXJ0eSBwcm94eSBzZXJ2aWNlCj4g
PiAtIEFiaWxpdHkgdG8gYnVpbGQgd2l0aCBHT1BST1hZPWRpcmVjdCBmb3IgdGhvc2UgdGhhdCBy
ZXF1aXJlIGl0Cj4gPiAob3RoZXJ3aXNlIEJ1aWxkcm9vdCBicmVha3MgZm9yIHRoZW0gb24gZGVm
YXVsdCkKPgo+ICAgRG8gd2UgYWN0dWFsbHkgaGF2ZSBleGFtcGxlcyBvZiBwYWNrYWdlcyB0aGF0
IGJyZWFrIHdpdGggdGhlIGRlZmF1bHQgcHJveHk/CgpBRkFJVSB0aGUgZGVmYXVsdCBwcm94eSB3
aWxsIG5vdCBicmVhayBwYWNrYWdlcyBkdWUgdG8gdGhlIGZhbGxiYWNrLgoKPgo+ID4gLSBJZiBn
by5tb2Qgc2F5cyAiZm9vL2JhciBhdCB2ZXJzaW9uIHYxLjAuMCIgdGhlbiB3ZSBjYW4gYmUgc3Vy
ZSB0aGUKPiA+IEdpdCB0YWcgdjEuMC4wIG1hdGNoZXMgdGhlIGdvLnN1bS4KPgo+ICAgQWRkaXRp
b25hbCB1cHNpZGU6Cj4KPiAtIE5vIHJpc2sgb2YgZmFpbHVyZXMgZHVlIHRvIEdPUFJPWFkgc2V0
dGluZyBpbiB1c2VyJ3MgZW52aXJvbm1lbnQuCj4KPiAgIEFuZCBmaW5hbCB1cHNpZGUgKGJ1dCBJ
IGRvbid0IHRoaW5rIGl0J3MgcmVhbGx5IHJlbGV2YW50IGZvciBCdWlsZHJvb3QpOgo+Cj4gLSBX
ZSBkZXRlY3QgaXNzdWVzIHdpdGggdXBzdHJlYW0gZ28ubW9kLgo+Cj4KPiA+IERvd25zaWRlczoK
PiA+Cj4gPiAtIFNsb3dlciBmZXRjaCAoZ2l0IHB1bGwgaW5zdGVhZCBvZiBwcm94eS5nb2xhbmcu
b3JnKQo+ID4gLSBXZSBuZWVkIHRvIG1pcnJvciBwYWNrYWdlcyBpZiB0aGVpciBkZXBlbmRlbmNp
ZXMgZ28gYXdheSAobW9zdCBhcmUKPiA+IG9uIEdpdEh1YiwgdGhvdWdoKQo+Cj4gICBJdCdzIG5v
dCBhY3R1YWxseSB0aGF0IHNpbXBsZSB0aG91Z2guIEl0IHNob3VsZCByYXRoZXIgYmU6Cj4KPiAt
IElmIGFueSB1cHN0cmVhbSBkaXNhcHBlYXJzLCB0aGV5IHdpbGwgbmVlZCB0byBmYWxsIGJhY2sg
b24gc291cmNlcy5idWlsZHJvb3QubmV0Lgo+IC0gSWYgYW4gdXBzdHJlYW0gaXMgYWxyZWFkeSBn
b25lIHdoZW4gYSBwYWNrYWdlIGlzIHN1Ym1pdHRlZCwgd2UgbmVlZCB0byBkbwo+IHByZS12ZW5k
b3JpbmcgcGF0Y2hpbmcgdG8gZml4IGl0LCBhbmQgd2UgZG9uJ3QgY3VycmVudGx5IGhhdmUgaW5m
cmFzdHJ1Y3R1cmUgZm9yCj4gcHJlLXZlbmRvcmluZyBwYXRjaGluZy4KPiAtIFRoZXJlIGlzIGEg
KHNtYWxsPykgY2hhbmNlIHRoYXQgaXQncyBpbXBvc3NpYmxlIHRvIGZpbmQgYmFjayBhbiB1cHN0
cmVhbSB0aGF0Cj4gY29ycmVzcG9uZHMgdG8gKGlzIGlkZW50aWNhbCB0bykgdGhlIG9yaWdpbmFs
IHZlcnNpb24gdGhhdCBkaXNhcHBlYXJlZC4KClRlY2huaWNhbGx5IHlvdSBjYW4ganVzdCB1c2Ug
dGhlIGNhY2hpbmcgcHJveHkgYnV0IEkgcmVhbGx5IHNlZSBubyByZWFzb24KdG8gbm90IGp1c3Qg
dXNlIHRoYXQgaW4gdGhlIGZpcnN0IHBsYWNlIHNpbmNlIHRoYXQncyB3aGF0IGl0IHdhcyBkZXNp
Z25lZCBmb3IuCgo+Cj4KPiAgIEknbSBzdGlsbCBvbiB0aGUgZmVuY2Ugb24gd2hhdCB0aGUgYmVz
dCBhcHByb2FjaCBpcy4uLiBXaGF0IEkgZG8gdGhpbmsgYmFzZWQKPiBvbiB0aGUgZGlzY3Vzc2lv
biBpcyB0aGF0IHdlIHNob3VsZCB1c2UgdGhlIHNhbWUgR09QUk9YWSBmb3IgZXZlcnl0aGluZyAt
IHRoZXJlCj4gcmVhbGx5IHNob3VsZCBiZSBubyByZWFzb24gdG8gZG8gaXQgZGlmZmVyZW50bHkg
Zm9yIGRpZmZlcmVudCBwYWNrYWdlcy4KCldlIHNob3VsZCB1c2UgdGhlIGdvbGFuZyBkZWZhdWx0
IG9mIEdPUFJPWFk9aHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnLGRpcmVjdApoZXJlIElNTy4KCj4K
PiAgIFJpZ2h0IG5vdywgSSdtIGFjdHVhbGx5IGxlYW5pbmcgdG93YXJkcyByZW1vdmluZyB0aGUg
R09QUk9YWT1kaXJlY3QgLSBidXQgdGhlbgo+IHdlIHNob3VsZCBzdGlsbCBzZXQgaXQgZXhwbGlj
aXRseS4gV2Ugc2hvdWxkIHByb2JhYmx5IGV2ZW4gYWxsb3cgdGhlIHByb3h5IHRvIGJlCj4gY29u
ZmlndXJlZC4gV2Ugc2hvdWxkIGRlZmluaXRlbHkgbm90IHJlbHkgb24gd2hhdGV2ZXIgdGhlIHVz
ZXIgc2V0IGluIHRoZWlyCj4gZW52aXJvbm1lbnQuCgpZZWFoLCBJIHdhcyBleHBsaWNpdGx5IHNl
dHRpbmcgdGhlIGRlZmF1bHQgR09QUk9YWSBpbiB0aGlzIHBhdGNoOgpodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjQxMDI4MTYxNTA3LjE4NjE2
MS0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20vCgo+Cj4gICBUaGUgcHJvYmxlbSB3aXRoIGRv
aW5nIGl0IHRoZSByaWdodCB3YXkgKGkuZS4ga2VlcGluZyBHT1BST1hZPWRpcmVjdCkgaXMgdGhh
dAo+IGl0IGFkZHMgYSBsb3Qgb2Ygd29yayBmb3IgdXM6CgpJIGRpc2FncmVlIHRoYXQgcmVxdWly
aW5nIEdPUFJPWFk9ZGlyZWN0IGlzIGEgbW9yZSBjb3JyZWN0IGFwcHJvYWNoLAptb3N0bHkgc2lu
Y2UgaXQncyBub3QgdGhlIGRlZmF1bHQgdGhlIGdvbGFuZyBlY29zeXN0ZW0gdXNlcy4KCj4gLSB3
aGVuIGFkZGluZyBhIHBhY2thZ2UgdGhhdCBoYXMgYSBicm9rZW4gZ28ubW9kLCB3ZSBoYXZlIHRv
IGZpeCBpdDsKPiAtIHdlIGN1cnJlbnRseSBjYW4ndCBldmVuIGZpeCBpdCB1bnRpbCB0aGUgZml4
IGlzIG1lcmdlZCB1cHN0cmVhbSBiZWNhdXNlIHdlCj4gZG9uJ3QgaGF2ZSB0aGUgcHJlLXZlbmRv
cmluZyBwYXRjaG5nIGluZnJhc3RydWN0dXJlLgoKWWVhaCwgaXQncyBzdXBlciBtZXNzeSB0byB3
b3JrYXJvdW5kIHRoZSBHT1BST1hZPWRpcmVjdCBicm9rZW5uZXNzLgoKPiAgIEEgbG90IHdpbGwg
ZGVwZW5kIG9uIGhvdyBvZnRlbiBhbmQgd2h5IHBhY2thZ2VzIGJyZWFrIHdpdGggdGhlIGRlZmF1
bHQgR09QUk9YWS4KClRoZXkgd29uJ3QgZXZlciBicmVhayBBRkFJVSBzaW5jZSB0aGVyZSdzIHN0
aWxsIGEgZmFsbGJhY2ssIHNvIEkgZG9uJ3QgdGhpbmsKdGhhdCdzIGV2ZW4gYW4gaXNzdWUgdG8g
d29ycnkgYWJvdXQuCgo+Cj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+Cj4gPiBXaGVuIHJl
cXVlc3RpbmcgdGhhdCB1cHN0cmVhbSBwcm9qZWN0cyBmaXggdGhlIGJ1aWxkIHdpdGgKPiA+IEdP
UFJPWFk9ZGlyZWN0IGl0IGhlbHBzIHRvIG1lbnRpb24gd2h5IGluIHRoZSBQUiBkZXNjcmlwdGlv
bi4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
