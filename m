Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396F3D0BB41
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 21:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D324740155;
	Wed, 23 Oct 2024 21:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUduBd_Y6qlV; Wed, 23 Oct 2024 21:51:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D454011B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70D454011B;
	Wed, 23 Oct 2024 21:51:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 815B32073
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FADC608CB
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZrDuXaT42_c for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 21:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CD7E608CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD7E608CA
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CD7E608CA
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 21:51:17 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id
 ada2fe7eead31-4a47d1a62bdso79722137.0
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 14:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729720276; x=1730325076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AISlXEHbxAyBtJ0ot29EdL99J3xzac2Px1+fzs3DHFw=;
 b=Sweg/feVQiAkBnHhxXbqk4m7QOeUHHP3olj3FHbFCwtZNbhEzeym1zP8ESyU2b7Dmb
 +OvDnpzA1luvE8ds9b5EiIIvg5aLkDvl0yPZFBvzL4wo714Q+OwOe7WwxLD9iJY29Yye
 YyMzq98MoWGkJePMWak9rHJdB1fiw1JSbaRAyDcS8RlQsZvZrr6XQVXA3MgRBhQYhnOB
 j4U5A5+xBL5fmQBBfNbOoMc2Nmi99cP08RtCo2x1onRyM/0ox5YI/73h16Q+ZZOSiFLo
 qqL+h5rkZrUuLTxhwNEM2Sslo/qiUyGw/BiZDRDR0JIyJJ+T6qJ7531ypDEkyRWphfhU
 UGdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYkGg0NmNk5aWeS/FMxKzuhtbmZg8AUvl7k7f+zHU2dGgzd+Wtgp9rKPlFss7JiB/024lmlINb7gg=@buildroot.org
X-Gm-Message-State: AOJu0Ywb1yOJ/Lr6IWQmqA0MBMEh9Zt5jKHPppBIWlODZmhseIOeyEYM
 reOWJL1m6RFYI0Uav3JFcAsTVncplcvN+zTWT/ghwDjuEAxB05FGq49ZlbyNVFHmSHbBcha5m7J
 MizvRTyWIe+jDCBZeanbrlATkOXQ=
X-Google-Smtp-Source: AGHT+IFmzUzeqg0dDRibBkEVr8PXzqkdWBI6UWarkc0MAebHRPKzzfnLMeLNkeu2YbvsffIgIj+Cl9/AXVEm+oXwdBg=
X-Received: by 2002:a05:6102:dd1:b0:4a5:6f41:211d with SMTP id
 ada2fe7eead31-4a751cbed1bmr4534837137.24.1729720275745; Wed, 23 Oct 2024
 14:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <CA+h8R2oQGKFFH-vMX27WUO1uEAGyt4cz9MCwn9Cofwyujx1xDA@mail.gmail.com>
 <20240805223152.09ed915b@windsurf>
 <CADvTj4o_CnzCth+QqoxhVovBRinvYfbMf7r+SWnnY0tfVbKgbw@mail.gmail.com>
 <CA+h8R2obsR-CzMhWDpQ-A0oeEPaG-P=aCwF7BS4J-3eShmHJgg@mail.gmail.com>
 <20240806165050.234235b4@windsurf>
 <CADvTj4pOK8-2YXy0POUg1qOKa1MrjsxbnS-r1F7YMk_YXFmEAQ@mail.gmail.com>
 <CA+h8R2reErtSWPO1hGpX7tT5Xejb_SNqiuSCnXvJZKHwhzdcZg@mail.gmail.com>
 <20240806185731.372f8f3e@windsurf>
 <CA+h8R2rnNhM0nKyZm4_y6ZFrNyn7YzFa7BHeH57cLif38FSrxA@mail.gmail.com>
 <CADvTj4p2heLayPzF7uTK0TLzbbo4C_305vTg9=3W3aCQbAoQGw@mail.gmail.com>
 <CA+h8R2o--yr=J8bmo6R=rBStYLxwOW+fvEKQ3zfLuKrdZznCCA@mail.gmail.com>
 <20241023212545.28838fc1@windsurf>
 <CADvTj4p6EOBciNjy03REWUTkwA6VRYqVYRiYbeDueNC1gbSS_A@mail.gmail.com>
 <CA+h8R2r0e97u77C9QzSYr_jczF=2zC0+Hz=Y73HUpVh7NGgJUw@mail.gmail.com>
In-Reply-To: <CA+h8R2r0e97u77C9QzSYr_jczF=2zC0+Hz=Y73HUpVh7NGgJUw@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 23 Oct 2024 15:51:04 -0600
Message-ID: <CADvTj4q=7j1RrPnk3syOKz8sqR=GWCVxGx+m8vuAO1cEOyDTWg@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729720276; x=1730325076; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AISlXEHbxAyBtJ0ot29EdL99J3xzac2Px1+fzs3DHFw=;
 b=J5NYg6fL4mqSRFcnSWmmbDS/Fn2nJdaMQ6yg75hB3ZteixKk29d5yuUacRQndtExs9
 yp5eNZCgQiPaAGJ65lx295qVjp2FcmDXdcUVgOn9wi9bJwq4g3IPuFYpTc3PAJY8RYh4
 7cfXMZVvIHg4vui6qo9NdEijDU5Qdzbfx6rzh+iH28GmIkzOhZmx3t6Wz8msCan6bjlh
 GD+Q5iasTzVJgzrwihrrK/GSmZrXSvBYFMXz8kOCWVzQTNNOx6cWfZdLK9Nom4vj4Ilm
 An0HIsSsg4VC2slFZ+6fMoa+41Obz/KlQRj7U/dxPkCQLu0DJ3WDQ92VNNPcE/s/QafT
 twRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J5NYg6fL
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

T24gV2VkLCBPY3QgMjMsIDIwMjQgYXQgMjozN+KAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSmFtZXMsCj4KPiBPbiBXZWQsIE9jdCAyMywg
MjAyNCwgMTI6NDnigK9QTSBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IE9uIFdlZCwgT2N0IDIzLCAyMDI0IGF0IDE6MjXigK9QTSBUaG9tYXMg
UGV0YXp6b25pCj4+IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPj4gPgo+
PiA+IEhlbGxvLAo+PiA+Cj4+ID4gT24gV2VkLCAyMyBPY3QgMjAyNCAwOTozNToxNiAtMDcwMAo+
PiA+IENocmlzdGlhbiBTdGV3YXJ0IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnPiB3cm90ZToKPj4gPgo+PiA+ID4gSXQgaXMgYSBwcm94eSwgbm90IGEgZG93bmxvYWQgVVJM
LiBUaGUgaW50ZW50IG9mIHRoZSBlbnRpcmUgR28gbW9kdWxlCj4+ID4gPiBzeXN0ZW0gaXMgdG8g
YmUgYmFzZWQgb24gc291cmNlIGNvbnRyb2wgdW5kZXIgdGhlIGhvb2QuIFdlIHNob3VsZCBiZSBh
YmxlCj4+ID4gPiB0byBjaGVjayBvdXQgdGhlIGdpdCByZXBvc2l0b3JpZXMgb2YgdGhlIHVuZGVy
bHlpbmcgc291cmNlIHdpdGhvdXQgaGF2aW5nCj4+ID4gPiB0byB1c2UgdGhlIEdvb2dsZSBwcm94
eS4KPj4gPiA+Cj4+ID4gPiBJZiB3ZSBtYWtlIGEgaGFiaXQgb2YgaWdub3JpbmcgdGhlc2UgaGFz
aCBtaXNtYXRjaGVzIGl0IHdpbGwgYmVjb21lIHZlcnkKPj4gPiA+IGVhc3kgZm9yIHBlb3BsZSB0
byBzdHVmZiBjb2RlIGludG8gYSByZWxlYXNlIG9uIEdpdEh1YiBhbmQgdGhlbiBjaGFuZ2UgdGhl
Cj4+ID4gPiB0YWcgdG8gc29tZXRoaW5nIGVsc2UgbGF0ZXIsIGxlYXZpbmcgYmVoaW5kIHRoZSBv
bGQgcmVjb3JkIGluIEdPUFJPWFkgYW5kCj4+ID4gPiB0cmlja2luZyBtYWludGFpbmVycyBpbnRv
IHJldmlld2luZyB0aGUgd3JvbmcgY29kZSBvbiB0aGUgbW9kaWZpZWQgR2l0SHViCj4+ID4gPiB0
YWcuCj4+ID4gPgo+PiA+ID4gVGhlcmUgbXVzdCBiZSBzb21lIHJlYXNvbiB3aHkgeW91ciBwYWNr
YWdlIGlzIGhhdmluZyB0aGlzIGlzc3VlLiBXaXRoCj4+ID4gPiBhbmNob3JlIHF1aWxsIHBhY2th
Z2Ugd2UgZm91bmQgdGhhdCBpdCB3YXMgZ2l0IGxmcyB3aXRoIHRlc3QgZmlsZXMgY2F1c2luZwo+
PiA+ID4gdGhlIHByb2JsZW0uCj4+ID4KPj4gPiBJIGNvbnRpbnVlIHRvIGFncmVlIHdpdGggQ2hy
aXN0aWFuLiBJZiB1c2luZyBjYWNoaW5nIHByb3hpZXMgaXMgbmVlZGVkCj4+ID4gdG8gYXZvaWQg
ZG93bmxvYWRpbmcgdGhlICJyZWFsIiB1cHN0cmVhbSBiZWNhdXNlIHRoZSByZWFsIHVwc3RyZWFt
IGhhcwo+PiA+IGNoYW5nZWQvaXMgYnJva2VuLCB0aGluZ3MgYXJlIHNldmVyZWx5IHdyb25nLgo+
Pgo+PiBUaGlzIGlzIG9ubHkgZm9yIGRlcGVuZGVuY2llcyBvZiB0aGUgcHJvamVjdCwgdGhlIGlz
c3VlIGlzIHRoZXkgY2FuIG9mdGVuCj4+IHBvaW50IHRvIHVuc3RhYmxlIGRlcGVuZGVuY3kgcmVw
b3NpdG9yaWVzIEFGQUlVIGFuZCB1cHN0cmVhbXMganVzdAo+PiB0ZW5kIHRvIHJlbHkgb24gdGhp
cyBjYWNoaW5nIHByb3h5Lgo+Cj4KPiBUaGF0IHJlYWxseSBkb2Vzbid0IG1ha2UgYW55IHNlbnNl
IGJlY2F1c2UgR28gbW9kdWxlcyB2ZXJzaW9ucyBhbmQgZ28uc3VtIHBvaW50IHRvIG5vdCBvbmx5
IGEgc3BlY2lmaWMgcmVsZWFzZSB0YWcsIGJ1dCBhIHNwZWNpZmljIGhhc2ggb2YgdGhhdCB0YWcs
IGFzIHdlbGwgYXMgKGlmIG5vdCB1c2luZyBhIHJlbGVhc2UpIGEgY29tbWl0IGhhc2ggYW5kIGRh
dGUuCj4KPiBUaGF0IHN5c3RlbSBpcyBkZXNpZ25lZCB0byBlbnN1cmUgaW50ZWdyaXR5LgoKV2hp
Y2ggbWFrZXMgaG93IHdlIGdldCB0aGUgZGVwZW5kZW5jaWVzIGxhcmdlbHkgdW5pbXBvcnRhbnQg
YXMgbG9uZwphcyB0aGV5IHBhc3MgdGhlIGludGVncml0eSBjaGVja3MgQUZBSVUuCgpJdCBzZWVt
cyBhbm90aGVyIGFkdmFudGFnZSB0byB1c2luZyBodHRwczovL3Byb3h5LmdvbGFuZy5vcmcgaXMg
dGhhdCBpdApzaWduaWZpY2FudGx5IHNwZWVkcyB1cCBkb3dubG9hZHMuCgo+Cj4gVGhlIHJlcG9z
aXRvcnkgYmVpbmcgInVuc3RhYmxlIGRlcGVuZGVuY2llcyIgZG9lc24ndCBnaXZlIGFueSBleHBs
YW5hdGlvbiBmb3Igd2h5IHRoZSBjaGVja3N1bXMgYXJlIGZhaWxpbmcuCj4KPgo+PiA+Cj4+ID4g
SW5zdGVhZCwgSSB3b3VsZCByZWNvbW1lbmQgdG8gcGF0Y2ggbmV0YmlyZCB0byByZXNvbHZlIHRo
aXMgaXNzdWUuIEkKPj4gPiBrbm93IHRoaXMgcmVxdWlyZXMgcGF0Y2hlcyB0byBiZSBhcHBsaWVk
ICpiZWZvcmUqIHRoZSB2ZW5kb3Jpbmcgc3RlcCwKPj4gPiBidXQgdGhhdCBpdCBzb21ldGhpbmcg
dGhhdCBhbnl3YXkgd291bGQgYmUgdXNlZnVsIHRvIGhhdmUuIFNvIEkgd291bGQKPj4gPiBzdWdn
ZXN0IHRvIGZpbmQgYSB3YXkgdG8gZG8gdGhhdC4gUGVyaGFwcyBzb21lIHNwZWNpYWwgcGF0Y2gg
ZXh0ZW5zaW9uLAo+PiA+IGxpa2UgcGFja2FnZS88Zm9vPi8qLnZlbmRvcmluZy1wYXRjaCBvciBz
b21lIG90aGVyIGJldHRlciBuYW1lLCB0aGF0Cj4+ID4gd291bGQgYmUgYXBwbGllZCBiZWZvcmUg
dGhlIHZlbmRvcmluZyBzdGVwIHRha2VzIHBsYWNlPwo+Pgo+PiBJJ20gbm90IGFjdHVhbGx5IHRy
eWluZyB0byBtb2RpZnkgdGhlIGRlcGVuZGVuY2llcyBzcGVjaWZpZWQgYXQgYWxsLCBpZgo+PiB0
aGUgb25seSBkb3dubG9hZCBsb2NhdGlvbiBmb3IgYSBzcGVjaWZpZWQgZGVwZW5kZW5jeSBJIG5l
ZWQgaXMgb24KPj4gaHR0cHM6Ly9wcm94eS5nb2xhbmcub3JnIHRoZW4gSSdtIG5vdCBzdXJlIGhv
dyBJIHdvdWxkIHBhdGNoIHRoZQo+PiBwYWNrYWdlIHRvIHVzZSB0aGF0IGluc3RlYWQuCj4KPgo+
IFlvdSBzaG91bGQgcmVwb3J0IHRoZSBpc3N1ZSB0byB0aGUgdXBzdHJlYW0gcmVwb3NpdG9yeSBs
aWtlIEkgZGlkIHdpdGggdGFpbHNjYWxlLCB0aGV5IHdpbGwgdXBkYXRlIHRoZSBkZXBlbmRlbmN5
IHRvIGEgbmV3ZXIgdmVyc2lvbiB0aGF0IGRvZXNuJ3QgaGF2ZSB0aGUgY2hlY2tzdW1zIG1pc21h
dGNoCgpXaGljaCBpcyB0cmlja3kgaW4gdGhpcyBjYXNlIHNpbmNlIEknbSBub3QgdXNpbmcgdGhl
IGxhdGVzdCByZWxlYXNlIGR1ZSB0bwppdCByZXF1aXJpbmcgZ29sYW5nIDEuMjMuMCB3aGlsZSB3
ZSBvbmx5IGhhdmUgMS4yMi44LgoKPgo+IE9yIGZlZWwgZnJlZSB0byBwb3N0IHRoZSBpc3N1ZSBo
ZXJlIGFuZCB3ZSBjYW4gdHJ5IHRvIGZpZ3VyZSBvdXQgd2h5IHRoZSBjaGVja3N1bXMgYXJlIGZh
aWxpbmcuCgpUaGlzIGlzIHRoZSBlcnJvcjoKZ286IGd2aXNvci5kZXYvZ3Zpc29yQHYwLjAuMC0y
MDIzMDkyNzAwNDM1MC1jYmQ4NjI4NWQyNTk6IGludmFsaWQKdmVyc2lvbjogdW5rbm93biByZXZp
c2lvbiBjYmQ4NjI4NWQyNTkKCj4KPgo+PiBBbHNvIHRoZW4gd2hhdCBkbyB3ZSBkbyB3aGVuIGEg
cGFja2FnZSBkZXBlbmRlbmN5IGluZXZpdGFibHkKPj4gYnJlYWtzIGFnYWluIGR1ZSB0byB0aGUg
ZG93bmxvYWQgbG9jYXRpb24gYmVjb21pbmcgYnJva2VuLCBkbwo+PiB3ZSBqdXN0IGtlZXAgcGF0
Y2hpbmcgdGhlIHBhY2thZ2Ugb3ZlciBhbmQgb3ZlciBhZ2FpbiBldmVyeSB0aW1lCj4+IG9uZSBv
ZiBpdHMgZGVwZW5kZW5jaWVzIGJyZWFrcz8KPgo+Cj4gV2h5IGlzIHRoZSBsb2NhdGlvbiBicmVh
a2luZyBhdCBhbGw/Li4uCj4KPiBGb3IgdGhpcyBwdXJwb3NlIHdlIG1pcnJvciB0byB0aGUgYnVp
bGRyb290IG1pcnJvciB3aXRoIGFsbCB0aGUgZGVwZW5kZW5jaWVzIHZlbmRvcmVkLgoKWWVzLi4u
aG93ZXZlciB3ZSB0cnkgbm90IHRvIHJlbHkgb24gdGhhdCBhcyBhIGZhaWxpbmcgZG93bmxvYWQg
Y291bGQKQUZBSVUgdHJpZ2dlciBhdXRvYnVpbGRlciBmYWlsdXJlcy4KCj4KPiBCZXN0IHJlZ2Fy
ZHMsCj4gQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
