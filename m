Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89620C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3454340697;
	Wed, 15 May 2024 15:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6dabbZp4-QWy; Wed, 15 May 2024 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B985F40502
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B985F40502;
	Wed, 15 May 2024 15:11:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79AB71BF841
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 745E560788
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 15:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WR7BzPBlF3-L for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 15:11:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 605C960772
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 605C960772
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 605C960772
 for <buildroot@buildroot.org>; Wed, 15 May 2024 15:11:08 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5b296194ac1so2897497eaf.2
 for <buildroot@buildroot.org>; Wed, 15 May 2024 08:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715785867; x=1716390667;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CgMJ3l7z/oTW9efsZbCvwzheLzEsJThuBDh7HA3YDw=;
 b=sNbgeqKADwjYPTimv7G6jcurszykYmPYZwzJ9QWzY6UfAEw7xJj8JuTHYzKB+wx77B
 VAMOp8QmVvta6KT8YUJFkbXkaXE2XNROcAnmJmryF15EZXlYn5DJHWkaBYogGCI+AWGU
 1neIQ22Uedk9cSi8OffK2PBVgD9E/sdcZwSl1ajdBrdKAyQpnPppgWkvmVSKnEhImaNa
 jc6Gf7n6uEmmOlFKtWH3kmxOKJRukhM+EEyrFzBAsaLsRZOOa73UE6MH9ubSqJMY9qlk
 2GDUhtCXO9YtMMvBNTSm7TwN5WCrFHXVfWuW+Rta5q0va3ZF/zrjs+6IGI4pmxsivISZ
 F8Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHZSoe8QYXmUfvTuJkPIFus03ngZ2hjng3L1i/n5Kbu5SjnPyBLMSqQOPc78cNCHVKkehg0MsQ/YHXpM6Qe7dlwWMt+8+yBQ==
X-Gm-Message-State: AOJu0Yz4xxlsro7lwZqXe4mBdRmKDmEWteG2V+i9/X97AWopKXIJ4i3O
 L37woHns/52xmtPo5xSy/avHWsgUDWdu2sPu5uqDIWCQGA2s5i0BUFURqWbg31fIFqk0zJccsfs
 /OsuTd5MvL2JUrdxz8w0Ls5wklTU=
X-Google-Smtp-Source: AGHT+IFVTdihEL0G/+lknpfGeMhJNhN3iUzF1vcVAjMil4FfV/HKrWyFIX6+ov4lElp2Z7WjTC/tmKKxAYD5U6tQuxk=
X-Received: by 2002:a05:6359:4588:b0:192:9d35:b027 with SMTP id
 e5c5f4694b2df-193bb6493e9mr1667648455d.15.1715785867063; Wed, 15 May 2024
 08:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240514154250.1453970-1-james.hilliard1@gmail.com>
 <4e9d5bc99a30a885dddb8aba6145f56d@free.fr>
 <888f8476-9bc2-409d-a35d-bb93282627d0@smile.fr>
In-Reply-To: <888f8476-9bc2-409d-a35d-bb93282627d0@smile.fr>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 15 May 2024 09:10:54 -0600
Message-ID: <CADvTj4qoj-quT8q14taAspqmhA1bRL-uWkEOEmg2B50Zn25qsA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715785867; x=1716390667; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/CgMJ3l7z/oTW9efsZbCvwzheLzEsJThuBDh7HA3YDw=;
 b=DDH5Ny8yPQVigdqAjpjsHAcZAAeAszxdHmMqWr8e6Ozfm1JXBVh6po2g4ECEcs76yR
 pIyCF2v0dlzL2KqYNgtuUiOP0/QkrnGk3EvzaV/AOfEv/5JoBuOjLbqXfrd9+wEO3/kp
 0M655avrn+8bsUxY/4pWwLgsMpX7L7vX1jpw+ntXAN4LMZBJWnFUqHg0FwhRG008/ZVb
 Gwhu/0deMDd5GyqF/rJX9+inRbuH04Mjc+15n50f4kK1j/cRMADyU3dixBd40GRjKvrl
 RaMu2SZq9myPFVF/uZt6SYmHGYAFXZmQHd6STubLXR7lTJzY+to/1CZd3qiFIOBFvYok
 6Jhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DDH5Ny8y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ml-dtypes: skip
 dependency check
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
Cc: Julien Olivain <ju.o@free.fr>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBNYXkgMTUsIDIwMjQgYXQgODowMeKAr0FNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPiB3cm90ZToKPgo+IEhlbGxvIEphbWVzLCBKdWxpZW4sIEFsbCwKPgo+IExl
IDE0LzA1LzIwMjQgw6AgMTk6MjYsIEp1bGllbiBPbGl2YWluIGEgw6ljcml0IDoKPiA+IEhpIEph
bWVzLAo+ID4KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoIQo+ID4KPiA+IEkgc3VjY2Vzc2Z1bGx5
IHRlc3RlZCBpdCBvbiBicmFuY2ggbWFzdGVyIGF0IGNvbW1pdCA5NzY0MjU4IHdpdGggY29tbWFu
ZDoKPiA+Cj4gPiAgICAgc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyBcCj4gPiAgICAgICAgIC1k
IGRsIC1vIG91dHB1dF9mb2xkZXIgXAo+ID4gICAgICAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfcHl0
aG9uX21sX2R0eXBlcwo+ID4KPiA+IE9uIDE0LzA1LzIwMjQgMTc6NDIsIEphbWVzIEhpbGxpYXJk
IHdyb3RlOgo+ID4+IFRoaXMgcGFja2FnZSBwaW5zIG92ZXJseSBzdHJpY3QgbnVtcHkgZGVwZW5k
ZW5jeSB2ZXJzaW9ucyBhcHBhcmVudGx5Cj4gPj4gZm9yIGNvbXBhdGliaWxpdHkgcmVhc29ucyB0
aGF0IGRvbid0IGFwcGVhciByZWxldmFudCB0byBidWlsZHJvb3QuCj4gPj4KPiA+PiBUaGlzIHBh
Y2thZ2UgYWxzbyBhcHBlYXJzIHRvIHBpbiBhbiBvdmVybHkgc3RyaWN0IHNldHVwdG9vbHMgdmVy
c2lvbgo+ID4+IGZvciB1bmNsZWFyIHJlYXNvbnMuCj4KPiBJIGxvb2tlZCBhdCB0aGlzIGlzc3Vl
IGxhc3Qgd2VlayB3aXRoIHRoZSBzYW1lIGNvbmNsdXNpb25zLi4uCj4gSSB3YXMgYWJsZSB0byBm
aXggdGhlIHNldHVwdG9vbHMgdmVyc2lvbiBjaGVjayBidXQgaXQgd2FzIHNpbGwgZmFpbGluZyB3
aXRoCj4gbnVtcHkgY2hlY2sgKGl0IHNlZW1zIG51bXB5IGRlcGVuZGVuY3kgaXMgbmV2ZXIgZm91
bmQgd2hpbGUgY3Jvc3MtY29tcGlsaW5nKS4KPgo+ID4+Cj4gPj4gU2VlOgo+ID4+IGh0dHBzOi8v
Z2l0aHViLmNvbS9qYXgtbWwvbWxfZHR5cGVzL2Jsb2IvdjAuMy4yL3B5cHJvamVjdC50b21sI0w1
MS1MNTUKPiA+Pgo+ID4+IFRvIGZpeCB0aGlzIGxldHMganVzdCBzZXQgdGhlIC0tc2tpcC1kZXBl
bmRlbmN5LWNoZWNrIGJ1aWxkIG9wdGlvbiBhbmQKPiA+PiBpZ25vcmUgdGhlIGJ1aWxkIGRlcGVu
ZGVuY3kgdmVyc2lvbiBtaXNtYXRjaGVzIHNpbmNlIHRoZXkgZG9uJ3QgYXBwZWFyCj4gPj4gdG8g
Y2F1c2UgYW55IGJ1aWxkIGlzc3Vlcy4KPgo+IE1heWJlIHdlIHNob3VsZCBhdm9pZCB1c2luZyAt
LXNraXAtZGVwZW5kZW5jeS1jaGVjayBvcHRpb24gdG9vIGVhc2lseS4gV2UgY291bGQKPiBtaXNz
IGFueSBuZXcgZGVwZW5kZW5jeSB1c2VkIGJ5IGZ1cnRoZXIgcmVsZWFzZT8KClllYWgsIHdlIHNo
b3VsZG4ndCB1c2UgaXQgdW5sZXNzIHdlIGhhdmUgYSBnb29kIHJlYXNvbiBmb3IgaXQsIEkgdGhp
bmsgdGhpcwpxdWFsaWZpZXMuCgo+Cj4gPj4KPiA+PiBUaGlzIGVycm9yIHdhcyBpbnRyb2R1Y2Vk
IHdoZW4gd2UgbWlncmF0ZWQgc2V0dXB0b29scyB0byBwZXA1MTcgaW4KPiA+PiA4OTM3ZGI4ZGQ1
OTVlMDk4ODc1MWU1ZGJiNTY4ZTg3MGIwN2IzOWNjLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gPgo+ID4gVGVzdGVk
LWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgo+ID4KPiA+PiAtLS0KPiA+PiAgcGFj
a2FnZS9weXRob24tbWwtZHR5cGVzL3B5dGhvbi1tbC1kdHlwZXMubWsgfCAxICsKPiA+PiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9weXRob24tbWwtZHR5cGVzL3B5dGhvbi1tbC1kdHlwZXMubWsKPiA+PiBiL3BhY2thZ2UvcHl0
aG9uLW1sLWR0eXBlcy9weXRob24tbWwtZHR5cGVzLm1rCj4gPj4gaW5kZXggNjc2MTM3ZWNmMS4u
ODA5NzI2NTA3OCAxMDA2NDQKPiA+PiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1tbC1kdHlwZXMvcHl0
aG9uLW1sLWR0eXBlcy5tawo+ID4+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLW1sLWR0eXBlcy9weXRo
b24tbWwtZHR5cGVzLm1rCj4gPj4gQEAgLTEwLDYgKzEwLDcgQEAgUFlUSE9OX01MX0RUWVBFU19T
SVRFID0KPiA+PiBodHRwczovL2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvMzkvN2Qv
OGQ4NWZjYmE4Ngo+ID4+ICBQWVRIT05fTUxfRFRZUEVTX0xJQ0VOU0UgPSBBcGFjaGUtMi4wCj4g
Pj4gIFBZVEhPTl9NTF9EVFlQRVNfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiA+PiAgUFlUSE9O
X01MX0RUWVBFU19TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+Cj4gV2UgY291bGQgYWRkIGEgY29t
bWVudCBoZXJlIHRvIGV4cGxhaW4gd2h5IHdlIHNraXAtZGVwZW5kZW5jeS1jaGVjayBoZXJlLgoK
V2VsbCB3ZSBoYXZlbid0IHJlYWxseSBiZWVuIGRvaW5nIHRoYXQgb24gb3RoZXIgcGFja2FnZXMg
dXNpbmcgdGhpcyBmbGFnLCBhbmQKcGFja2FnZXMgc3BlY2lmeWluZyBvdmVybHkgc3RyaWN0L3Vu
bmVjZXNzYXJ5IGJ1aWxkIGRlcGVuZGVuY2llcyBpbiBzb21lCndheSBpcyBnZW5lcmFsbHkgYWx3
YXlzIHRoZSByZWFzb24gZm9yIHRoaXMgZmxhZyBmb3IgYW55IHBhY2thZ2VzIHVzaW5nIGl0LgoK
Pgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgo+ID4+ICtQWVRIT05fTUxfRFRZUEVTX0JVSUxE
X09QVFMgPSAtLXNraXAtZGVwZW5kZW5jeS1jaGVjawo+ID4+Cj4gPj4gIFBZVEhPTl9NTF9EVFlQ
RVNfREVQRU5ERU5DSUVTID0gXAo+ID4+ICAgICAgaG9zdC1weXRob24tbnVtcHkgXAo+ID4+IC0t
Cj4gPj4gMi4zNC4xCj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4KPiA+IEp1bGllbi4KPiA+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+ID4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
