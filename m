Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48758EA794E
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 00:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E595783B95;
	Thu,  5 Feb 2026 00:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGiAIPSxmymD; Thu,  5 Feb 2026 00:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9EA8283D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770252057;
	bh=1BD146ToRLOy68xFruXl7BdqFN/F95itR9vlR2qsxMs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UPG/Y+GMeWolJ0qRktI+SZdoy8u9rugBmcCrv4oV/8NuYhqat+4GR/tqxRZlPkA7w
	 t9MaagsudirkMUGdD+sjja8BzZF38hyF06xOGZAW6eriQqn/JlyeRHB0wg9gAK6V97
	 Tm5tTPHsnKk0rPgXBRWOsJ/OXPKsJC6pplt3pVoJ6vEAFCoX/e3MRH9i4RRPHe+eL+
	 qdYNHqRWWLLWmw43QxWTdxDCkzXUPKfduDSt5llCreSY674lYVnDiDa+XgnyptPJXM
	 sbdRFMgcfZG9H6LzwMTq16uYKiE391E7xuOYJHbsm5KjdMHLljMAjmS/s4XYk/2GNW
	 jWvVFag0ZGlNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9EA8283D;
	Thu,  5 Feb 2026 00:40:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86242173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FC7640264
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5AMQJK2vC4R for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 00:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 79B84401DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B84401DA
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79B84401DA
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 00:40:55 +0000 (UTC)
Received: by mail-ua1-x931.google.com with SMTP id
 a1e0cc1a2514c-948cce42537so730859241.0
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 16:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770252054; cv=none;
 d=google.com; s=arc-20240605;
 b=hJqX7vylkNObGEaNzPcLiC+ZoBy8VKmnYLjIGuwB5necT4PmY3R2ZSbqRgr/3rQC3p
 kZqOUVQGxatOmEfwjkQjwjI2Sy0NoeW5xH/2yAcgu7I/ObLh47kv0I8lVCMn1+mhFaIZ
 SQb/eotdCY1bgiSe2zMxHQIlPWpPNAFw4NgT5zpIWYdtW3rt74LL977fNalIHLYQx79M
 urcZvm/N4sDaehe7eqA1g1gPJhQtuz8a6VbZymSL3ye012NgnUp4KyhNUc+fWSSMO6R3
 gyuA5m8hdw7mg8xI24nucGyG8GoWhnYkvltpSAg6B8NL6CP0/PowXaNNWTTsL4SMN45z
 sJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6+Q30C0wq93xYi4eacgYlRX5P2FygO352Ac7m/FJ6CE=;
 fh=mb6HN0if4kJnbMnKOxiuZ+eiedP5jXFuJumNyGSkXtU=;
 b=AVhNErDWV4WkPl60CMdL9fXmWXC/N98XvMBjSOwpo04PRS3xjShxnrmWB4DVhdBHuZ
 2f3sjHHiZ2S4LayWhv17GXqvPEZh5Zu6Qnug9bgvd+ShnycZqZ5oLM34S0ldob6da5Yy
 rWmdzuq+bnqHXt7bP3tSQ9WVSw+om2C96Z540B8txrl5KItpNL8HAPU+Kc/dMqGjuKlQ
 c6DBaVFxZfOJLtx+hRIsQrv2I5lbwVq4zz3PZ0up6olaZJO8wjYCArFkA5S1qGHd/GYl
 E/SUXb/Ei7PBUwVmxuPSnEdXLEvRTE/nRWyY4cL4kmBo+HKs8dOo4Uz1MLrfep5Xm5v8
 c2Vw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770252054; x=1770856854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6+Q30C0wq93xYi4eacgYlRX5P2FygO352Ac7m/FJ6CE=;
 b=Rn8PiuN8lwaQNzL79qtf7V/nHWGhP/JeVkv/cDee9tWkIj1UU01wvPgHhyaulr+RSQ
 KH2U7Zq+g6KH1rudbPFDSujK+wPJE0eF9KgTeS084zw3nx1vH6Kwg8qJP8aO5lJo/jZt
 JxDvCdDzAO4HyIBK1A2ooyqhJRU6lg1OqICYDGmRbGdjSG1McEmDvJDhUpvxtwEPE+O6
 k/OzWPOBDWkMQXA7e9eVPzNLL/srTUIz7PLF45oz80Lk0/xQWsH8jN2fUset6TAhvIt3
 xY5+uxi+Jk6Gem2n7kWYRTLkjON/kMF3MflnDiqwyy/kVFmHjtYfdm73F/AA8aF9UUl+
 npog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXXFalhkI6FrZslctacfu9dQmQPXDxqiZVHWZgTiwpKQvPiA4FMnp3362A4X8YGvhy8HjBuggMwZw=@buildroot.org
X-Gm-Message-State: AOJu0YxZIisQf7/DXmf98WUsfJXXwa03SMp+pKb87yXxLYNdoYjUaPEq
 gI5zSOQgje2Pp7v/B+cdO5MedsOS+mgSEGH+qy2eU8DTzUKLL2HuHiyY82Mo7shX5FueG144omZ
 izxe2TqL97qVCWCg+zAsLkEanrhSq3ag=
X-Gm-Gg: AZuq6aKZFiCiopYXcUu/H4zTmYHroKSQ5FCPA6c/vXivxo+DQf3m6y+NMAFTDjqLcPT
 ZwCv2jzyxDqJOzlnbiVPbn5UglZ8oZ8fYo0E2CHTE1r9t5FaB8CxBpL1ytbd2VwSPUKFebOWQN8
 gGCcRAYAMKSyOWwfajUyIAFGDYSIrZXPla0u1Xp4DDqsy3XUzKDE9xvuUV0Stq/YhtZH9caDgN6
 NDD5M2nMOslMrO346cFu3mfz2SXHbJbU1+rYKV5K0hOYHJlEUR0iXCQFxT3RdAUH+7Ce0uwIGS3
 OFj1wGSK/soP148DNC7z46x40foqzXO+PJTlDIttlFn6pLT//ofi16Dhhw==
X-Received: by 2002:a05:6102:3708:b0:5ef:233e:6b25 with SMTP id
 ada2fe7eead31-5f94d167b9dmr399927137.13.1770252053980; Wed, 04 Feb 2026
 16:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20251228213710.2591716-1-james.hilliard1@gmail.com>
 <20251228213710.2591716-2-james.hilliard1@gmail.com>
 <CA+h8R2rJFvtnP4DD7qwGx0smh7sgkDeptMUibqhJgSUuUO3Lyw@mail.gmail.com>
 <c8defb4d-4f5f-4bdf-8ff9-4adad5891fcd@mind.be>
 <CADvTj4rGb6KO0BUFyss9TRy9Ctk7oLdJ1PJLg-F3Y59e73XYbA@mail.gmail.com>
 <CA+h8R2oQ71c5rtXO-GB+Bbr2QAyYNczJhZVxAxY0OgXs0zkEUg@mail.gmail.com>
In-Reply-To: <CA+h8R2oQ71c5rtXO-GB+Bbr2QAyYNczJhZVxAxY0OgXs0zkEUg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 4 Feb 2026 17:40:42 -0700
X-Gm-Features: AZwV_QiYIFmKxNPkFyQD2CXL3OwD6xSd6k-xU9VgrEtvOgOdzc1ka8-g7RwPro4
Message-ID: <CADvTj4p7Y8MWHkRTpBek+ji_PCo0ujknOJA7Y3xeUk7_N+Uuig@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770252054; x=1770856854; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+Q30C0wq93xYi4eacgYlRX5P2FygO352Ac7m/FJ6CE=;
 b=ef/Dyw3Apw0WFw3Jrdun9wBRJoBtyzy8vAHJseAfjIDM3r5dxvABwZJDiQ0kbAZwcU
 UuMPFULOYN0Di5ZOJgqnpoHl+geEWq/lWy60aaOwbn5e7Ogkebd1FFSn45b0xd6bkEnF
 yCiFVgdPiH9xIZKILAxWg9o/NpSRaeXrJM02HYNQ+lxrh/eKFUeaPrnw608mcBlrCANs
 ZFresejE3AAv/ORQbdNKUyOzKLTHuzQKM3nTf+olFoO3zbGbiRsNpaWUUTB1W3n/TSDT
 zC37WglTP7igICsZhPFwpZtE3XUBqNf8PKlzCYvHhpSWZZyxbwIHuSAwxyhgA7HRELOr
 3IRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ef/Dyw3A
Subject: Re: [Buildroot] [PATCH v6 2/3] package/pkg-golang.mk: make GOPROXY
 configurable
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

T24gVHVlLCBGZWIgMywgMjAyNiBhdCAxMDoxMOKAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+Cj4gT24gVHVlLCBGZWIgMywg
MjAyNiBhdCA5OjEy4oCvQU0gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+IHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMywgMjAyNiBhdCAyOjI44oCvQU0gVGl0b3VhbiBD
aHJpc3RvcGhlCj4KPiA+ID4gPj4KPiA+ID4gPj4gK2NvbmZpZyBCUjJfR09QUk9YWQo+ID4gPiA+
PiArICAgICAgIHN0cmluZyAiR28gbW9kdWxlIHByb3h5Igo+ID4gPiA+PiArICAgICAgIGRlZmF1
bHQgImh0dHBzOi8vcHJveHkuZ29sYW5nLm9yZyxkaXJlY3QiCj4gPiA+IEluIG15IG9waW5pb24g
KHdpdGggbXkgTFRTIHN0ZXdhcmQgaGF0KSwgd2Ugc2hvdWxkbid0IGNoYW5nZSB0aGUgZGVmYXVs
dAo+ID4gPiBpbiBCdWlsZHJvb3QgdG8gZ28gdGhyb3VnaCB0aGUgcHJveHkgZmlyc3QsIGFzIGl0
IG1heSBpbnRyb2R1Y2UKPiA+ID4gc3VwcGx5LWNoYWluIHJlbGF0ZWQgdnVsbmVyYWJpbGl0aWVz
Lgo+Cj4gRm9yIHRoZSBMVFMgYnJhbmNoZXMsIGxlYXZlIGl0IGFzLWlzLCBmb3IgdGhlIGxhdGVz
dCBicmFuY2gsIGNoYW5nZSBpdD8KPgo+IFRoaXMgd29uJ3QgaW50cm9kdWNlIHN1cHBseS1jaGFp
biB2dWxuZXJhYmlsaXRpZXMgLSBhcyBKYW1lcyBzYWlkLAo+IHByb2plY3RzIHNoaXAgZ28uc3Vt
IHdoaWNoIGNoZWNrc3VtcyBkZXBlbmRlbmNpZXMgYW5kIGVuc3VyZXMgdGhlcmUgaXMKPiBubyB0
YW1wZXJpbmcuCj4KPiA+IEl0IGRvZXNuJ3QgYmVjYXVzZSBhbGwgZGVwZW5kZW5jaWVzIGFyZSBo
YXNoZWQgYW55d2F5IGluIGdvLnN1bSwKPiA+IEkgZG9uJ3Qgc2VlIHdoeSBidWlsZHJvb3QgZGVm
YXVsdHMgc2hvdWxkIGRpZmZlciBmcm9tIG5vcm1hbCBnb2xhbmcKPiA+IGRlZmF1bHRzIGhlcmUs
IGVzcGVjaWFsbHkgd2hlbiBnb2xhbmcgaGFzaGVzIGFsbCBkZXBlbmRlbmNpZXMuCj4gPgo+ID4g
Q3VycmVudGx5IHdlIGhhdmUgZ29sYW5nIHBhY2thZ2VzIHdpdGgga25vd24gdnVsbmVyYWJpbGl0
aWVzIGR1ZQo+ID4gdG8gdXMgYmVpbmcgdW5hYmxlIHRvIHVwZ3JhZGUgdGhvc2UgcGFja2FnZXMg
YXQgYWxsIGR1ZSB0byB0aGVtCj4gPiBub3QgYmVpbmcgYWJsZSB0byBidWlsZCB3aXRoIHRoZSBu
b24tc3RhbmRhcmQgR09QUk9YWT1kaXJlY3QKPiA+IHNldHRpbmcuCj4KPiBJZiB0aGV5IGhhdmUg
a25vd24gdnVsbmVyYWJpbGl0aWVzLCBvbiB0aGUgb3RoZXIgaGFuZCwgZGlkIHdlIGZpbGUKPiB1
cHN0cmVhbSBpc3N1ZXMgYWJvdXQgdGhlIEdPUFJPWFk9ZGlyZWN0IG5vdCB3b3JraW5nPwoKSSB0
aGluayB0YWlsc2NhbGUgaGFzIHNvbWUga25vd24gdnVsbmVyYWJpbGl0aWVzLCB1bnN1cmUgaWYg
YW55IGFyZQppbiBwcmFjdGljZSBleHBsb2l0YWJsZS4KCkkgaGF2ZW4ndCByZWFsbHkgYm90aGVy
ZWQgd2l0aCByZXBvcnRpbmcgR09QUk9YWT1kaXJlY3QgaXNzdWVzCnVwc3RyZWFtIHJlY2VudGx5
IGFzIGl0J3Mgc3VjaCBhbiB1bmNvbW1vbiBpc3N1ZSBmb3IgYW55b25lIHRvCmVuY291bnRlciBh
bmQgSSBmZWVsIGl0J3MgbW9zdGx5IGp1c3QgZ2VuZXJhdGluZyB1bndhbnRlZCBub2lzZSBmb3IK
dXBzdHJlYW0gcHJvamVjdHMuCgo+ID4gPiBXb3VsZCB5b3UgY29uc2lkZXIgc2V0dGluZyB0aGUg
ZGVmYXVsdCB0byBgZGlyZWN0YCAoYXMgaXQgaXMgY3VycmVudGx5KSwKPiA+ID4gYW5kIHRoZW4g
aW4gdGhlIGhlbHAgdGV4dCBiZWxvdyAob3IgdGhlIEJ1aWxkcm9vdCB1c2VyIG1hbnVhbCksIGlu
ZGljYXRlCj4gPiA+IHRoYXQgc29tZSBwYWNrYWdlcyBtYXkgYWN0dWFsbHkgcmVxdWlyZSB0byB1
c2UKPiA+ID4gImh0dHBzOi8vcHJveHkuZ29sYW5nLm9yZyxkaXJlY3QiLCBhdCB0aGUgdXNlcidz
IG93biByaXNrID8KPgo+IEkgdGhpbmsgY2hhbmdpbmcgaXQgcGVyLXBhY2thZ2UgaXMgYWN0dWFs
bHkgbWVzc2llciB0aGFuIGp1c3QgY2hhbmdpbmcKPiB0aGUgZGVmYXVsdC4KPgo+ID4gRm9yIGF1
dG9idWlsZGVycyB0byBmdW5jdGlvbiB0aGUgZGVmYXVsdCBHT1BST1hZIG11c3QgYWxzbyBiZQo+
ID4gZnVuY3Rpb25hbCBmb3IgcGFja2FnZXMsIGluIHRoZSBnb2xhbmcgZWNvc3lzdGVtIGl0J3Mg
ZXNzZW50aWFsbHkKPiA+IGFsd2F5cyBhc3N1bWVkIGRlcGVuZGVuY2llcyBhcmUgZG93bmxvYWRl
ZCB2aWEgdGhlIHByb3h5LCBhcwo+ID4gZXNzZW50aWFsbHkgbm9ib2R5IHRlc3RzIGlmIEdPUFJP
WFk9ZGlyZWN0IHdvcmtzLgo+Cj4gQmVzdCByZWdhcmRzLAo+IENocmlzdGlhbiBTdGV3YXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
