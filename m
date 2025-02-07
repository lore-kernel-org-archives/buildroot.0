Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A138C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 17:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79508428F4;
	Fri,  7 Feb 2025 17:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOeDQJwoaCGf; Fri,  7 Feb 2025 17:36:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 774F94099B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 774F94099B;
	Fri,  7 Feb 2025 17:36:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 579A9E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4708A61058
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_ay84TxxhRf for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 17:36:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16A9060F08
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16A9060F08
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com
 [IPv6:2607:f8b0:4864:20::a2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16A9060F08
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 17:36:10 +0000 (UTC)
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-51f2a8fd349so444752e0c.1
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 09:36:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738949770; x=1739554570;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ieLQ+LYOwy0w3EVJI1Y+t1G4pBBQdG0VZSKfBDRxu/I=;
 b=Q9XBoaRh2j+CN84Fb6MSJGokbHPCwGAypbBu4W2ibsivJFtITfBesoV9V8ilEbvXnH
 8K6BGsFd8OjVKsNHXwXMz/5t4TR6zOefNMMAnqJvD10BDZ7w/LiC+FX4/AD8SOVVoxq/
 3QFWnmOMthPE3RTU5Z/Tdig/iY/E0yO3bnXj3iw2RiEaxFD8qt2Ky2wY/hb0yqAbAUIm
 DjzVQg1lstBp+dF8sL77dJiJ6pSHkYWTuo1jw7h/R3+s8mpi2+PIZPxj5IQ4fSJoJsXD
 pqUsxk4idF3B7w1e5SeUm1gDxuXH7vxxCYcn85rXY6w1qXCUoTMMSWSCl+LUipvrbkkN
 VGHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2+MD5kbphCd55rtE5EeW+qStcBWbMrgirdk78gPUXCs51oh6iUzhrFa8SV1T+Rbgi/T08fzxXwDg=@buildroot.org
X-Gm-Message-State: AOJu0YxyWekb7c8VET+X/XGJjyo0+yRN9PdJvyB/pJQl8rfSzP8QOEqK
 GwIS+ZBzZr3FRSC7AbGfJ2CZHS8LwZaInBeayS1vEsGJ+3fueGveStMYG1WF7MB3Gt/NqJ7izQT
 C5drCtkAv9gYi4e1EhVhqBo7egiR08lJajuZ+Uw==
X-Gm-Gg: ASbGncuRIUOTtkNXQ9M0pX1Mw0dW66u8rZpTr/G4f7law76eIXqoL8/Q/LsuLLoz8Ez
 hELWLX7s4EpEFsxK4rMIajLGLBs2phKr1bFxEe1KJCaE8wc2RIOY4EPMeHrzKl/WRG9TJhEGiVQ
 ==
X-Google-Smtp-Source: AGHT+IH5m6ebi+9FlsGHyDL6t+/bnajjVkJ1SZk1KQJCXHn8srOSDdNyxxo+BGoDjm1eTPCwKdwRoi7pgj81RfV/an8=
X-Received: by 2002:a05:6122:3126:b0:516:157d:c5fb with SMTP id
 71dfb90a1353d-51f2e28c24fmr3417371e0c.10.1738949769602; Fri, 07 Feb 2025
 09:36:09 -0800 (PST)
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
 <CA+h8R2pup4sse2R-6oMV0=uKL6WyV3o6fyerQeYopv57ZJWCVA@mail.gmail.com>
 <9524fc48-d637-42f9-bce1-29f0df5099a4@gmx.de>
In-Reply-To: <9524fc48-d637-42f9-bce1-29f0df5099a4@gmx.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Feb 2025 19:35:58 +0200
X-Gm-Features: AWEUYZmwrWTgkwjfrkvMfnx7ioJyE4muchsuoE_5Sa5rLoVh7ul3opOTuv2_QME
Message-ID: <CADvTj4qtBka_AVPh1rgGHkib9rxSfE7kAWBUMsz2nvYSWZvEhQ@mail.gmail.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738949770; x=1739554570; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieLQ+LYOwy0w3EVJI1Y+t1G4pBBQdG0VZSKfBDRxu/I=;
 b=WEAPxajUNLkKCtbX3ISuikNOxPahxM428dxhvCHZK8yAONj5mID0XZZdnLUg9wXBES
 Rbf7u9CPysinw8+hIFZV/t5lk638Qcn+sU4vnkJw1BqSe40PeBRkzNtgTN1DGXG7lUu1
 v3nNQJJgVHxK884bx9dkW1vl5Uwhwlp+VxHksuVtih4QYOEfKxsIIwvrsbA4v8vZm+m3
 vWzzLNTyZzfWkmIZeQjlgIEp4r9Vv2fEr56DPC7iVHGDOei0yL4ox9LAMLvyNfOTlR1g
 z/T8/mpMt60tysVkZIwMAyU9IBasWUbMpaqex2u1KN5fepFl1ZJDF4UAagzsVP50cmtf
 0rmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WEAPxajU
Subject: Re: [Buildroot] Fwd: [PATCH v4 1/2] package/pkg-golang.mk: allow
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

T24gVGh1LCBGZWIgNiwgMjAyNSBhdCA5OjMx4oCvUE0gRmlvbmEgS2x1dGUgdmlhIGJ1aWxkcm9v
dAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gSGkgZXZlcnlvbmUhCj4KPiBB
bSAwNS4wMi4yNSB1bSAxODo1NiBzY2hyaWViIENocmlzdGlhbiBTdGV3YXJ0IHZpYSBidWlsZHJv
b3Q6Cj4gPiBIaSBKYW1lcywgQXJub3V0LAo+ID4KPiA+IEkgd291bGQgbGlrZSB0byBhZGQgdGhh
dCB0aGVyZSBpcyBhbiBvcGVuIGlzc3VlIHdoZXJlIHRoZSBnb2RvY3MKPiA+IHdlYnNpdGUgaXMg
ZGlzcGxheWluZyB0aGUgY2FjaGVkIHByb3h5IHZlcnNpb24gYW5kIG5vdCB0aGUgR2l0SHViCj4g
PiB2ZXJzaW9uLCB3aGljaCBpcyBjb25zaWRlcmVkIGFub3RoZXIgcG90ZW50aWFsIG1hbHdhcmUg
dmVjdG9yLgo+ID4KPiA+IE9wZW4gaXNzdWUgd2l0aCBhY3Rpdml0eSBpbiB0aGUgbGFzdCBjb3Vw
bGUgZGF5czoKPiA+Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vZ29sYW5nL2dvL2lzc3Vlcy82NjY1
MyNpc3N1ZWNvbW1lbnQtMjYzNjM1ODQwMQo+ID4KPiA+IE9uIFdlZCwgRmViIDUsIDIwMjUgYXQg
NjowMuKAr0FNIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPiB3cm90
ZToKPiA+PiBPbiBXZWQsIEZlYiA1LCAyMDI1IGF0IDI6NTHigK9QTSBDaHJpc3RpYW4gU3Rld2Fy
dCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPiA+Pj4gQmVsb3cgSSBtZW50aW9uIGEg
cG90ZW50aWFsIHNlY3VyaXR5IGlzc3VlIHdoZXJlIHNvbWVvbmUgdXBsb2FkcyBhIG1hbGljaW91
cyBwYWNrYWdlIHZlcnNpb24gdG8gdGhlIHByb3h5IGFuZCB0aGVuIGNoYW5nZXMgdGhlIGdpdCB0
YWcgdG8gcmVtb3ZlIHRoZSBtYWx3YXJlLiBJbiB0aGlzIGF0dGFjayBtb2RlIHRoZSBtYWludGFp
bmVycyBtaWdodCBjaGVjayB0aGUgZ2l0IHRhZywgc2VlIG5vIG1hbHdhcmUsIGFuZCBhZGQgYSBw
YWNrYWdlIHdpdGggdGhhdCB0YWcuCj4gPj4+Cj4gPj4+IFRoZSBwcm9ibGVtIGlzIHRoYXQgR28g
ZmV0Y2hlcyBmcm9tIEdPUFJPWFkgYW5kIHNpbGVudGx5IGlnbm9yZXMgdGhlIG1pc21hdGNoLgo+
ID4+Cj4gPj4gQXMgaXQgc2F5cyBpbiB0aGUgYXJ0aWNsZSB0aGlzIGlzIGhvdyBpdCdzIGRlc2ln
bmVkIHRvIHdvcms6Cj4gPj4KPiA+PiAiR28gbW9kdWxlcyBhcmUgaW50ZW50aW9uYWxseSBpbW11
dGFibGUgb25jZSBwdWJsaXNoZWQgYW5kIGZldGNoZWQgYnkKPiA+PiB0aGUgcHJveHkgW3NuaXBd
Cj4gPgo+ID4gQ29ycmVjdCwgYnV0IHRoaXMgY2FuIGxlYWQgdG8gYSBzZWN1cml0eSBpc3N1ZSB3
aGVuIHRoZSBjb2RlIGluIHRoZQo+ID4gcHJveHkgaXMgbWFsaWNpb3VzLgo+ID4KPiA+Pj4gVGhp
cyB3YXMgdGhlIHJlYXNvbiB3aHkgSSBoYXZlIGFsd2F5cyBsb2JiaWVkIHRvIGtlZXAgdGhlIGRl
ZmF1bHQgYXMgR09QUk9YWT1kaXJlY3QgaW4gYnVpbGRyb290LCBhcyB0aGlzIGF2b2lkcyB0aGUg
Y2FzZSB3aGVyZSB0aGUgZ2l0IHJlcG8gbWlzbWF0Y2hlcyB0aGUgcHJveHkgd2l0aG91dCB2aXNp
YmlsaXR5IGF0IHRoZSBnaXQgbGV2ZWwuCj4gPj4KPiA+PiBBcyBpdCBzYXlzIGluIHRoZSBhcnRp
Y2xlOgo+ID4+Cj4gPj4gIldoaWxlIGltbXV0YWJpbGl0eSBjYW4gYmUgYWJ1c2VkIGJ5IG1hbGlj
aW91cyBhY3RvcnMg4oCUIGFsbG93aW5nCj4gPj4gaGFybWZ1bCBjb2RlIHRvIHBlcnNpc3Qgb25j
ZSBjYWNoZWQg4oCUIGl0IHJlbWFpbnMgYSBuZXQgc2VjdXJpdHkKPiA+PiBiZW5lZml0LiBTaW5j
ZSB0aGUgR28gbW9kdWxlIHN5c3RlbSBpcyBmdW5jdGlvbmluZyBhcyBpbnRlbmRlZCwgYW5kCj4g
Pj4gdGhpcyBpcyBub3QgYSBzZWN1cml0eSB2dWxuZXJhYmlsaXR5LCB0aGVyZSBpcyBubyBwYXRj
aCBvciBzd2l0Y2ggdG8KPiA+PiB0dXJuIG9mZiBpbW11dGFiaWxpdHk7IGluc3RlYWQsIGRldmVs
b3BlcnMgbXVzdCByZWNvZ25pemUgdGhhdCBvbmNlIGEKPiA+PiBtYWxpY2lvdXMgdmVyc2lvbiBp
cyBwdWJsaXNoZWQsIGl0IHdpbGwgcmVtYWluIG1hbGljaW91cyBpbiB0aGUKPiA+PiBjYWNoZS4i
Cj4gPgo+ID4gWWVzLiBCdXQgaXQgaXMgbm90IGFjY2VwdGFibGUgZm9yIHVzIHRvIHNoaXAgbWFs
aWNpb3VzIGNvZGUuCj4gPgo+ID4gQ29kZSBpbiB0aGUgcHJveHkgbWlzbWF0Y2hpbmcgdGhlIGNv
ZGUgZG93bmxvYWRlZCB3aXRoIEdPUFJPWFk9ZGlyZWN0Cj4gPiBpcyBhIGdvb2QgaW5kaWNhdG9y
IHRoYXQgc29tZXRoaW5nIHN1c3BpY2lvdXMgaXMgZ29pbmcgb24gYW5kIHdvcnRoCj4gPiBmdXJ0
aGVyIGludmVzdGlnYXRpb24uCj4gVGhpcyBpcyB0aGUgY3JpdGljYWwgcGFydCBpbiBteSBvcGlu
aW9uOiBmYWlsaW5nIHNhZmUuIEFzIGFubm95aW5nIGFzCj4gc2VlbWluZ2x5IHJhbmRvbWx5IGZh
aWxpbmcgYnVpbGRzIGFyZSwgdGhleSdyZSBub3QgZ29pbmcgdG8gZG8gZGFtYWdlCj4gYmV5b25k
IHRpbWUgc3BlbnQgdG8gaW52ZXN0aWdhdGUgYW5kIGZpeCB3aGF0ZXZlciB0aGUgY2F1c2UgaXMs
IHdoZXRoZXIKPiBpdCdzIGEgbWlzdGFrZSBvciAocmFyZWx5KSBtYWxpY2lvdXMgYWN0aW9uLiBP
bmNlIHdlIGhhdmUgYSB0cnVzdGVkCj4gdmFsdWUgaW4gcGFja2FnZS5oYXNoIHRoZSBkb3dubG9h
ZCBzb3VyY2UgZG9lc24ndCBtYXR0ZXIgbXVjaCwgYnV0IEkKPiBhZ3JlZSB0aGF0IHJlcXVpcmlu
ZyBkb3dubG9hZHMgdG8gbWF0Y2ggd2hlbiBpbnRyb2R1Y2luZy91cGRhdGluZyBhCj4gcGFja2Fn
ZSBpcyBhIHNlY3VyaXR5IGZlYXR1cmUuCgpKdXN0IHRvIGNsYXJpZnkgdGhlcmUgYXJlIDIgZGlm
ZmVyZW50IGhhc2ggY2hlY2tzIGdvaW5nIG9uIGhlcmUgZXNzZW50aWFsbHksCnRoZXJlJ3MgdGhl
IGhhc2hlcyBpbiB0aGUgZ28uc3VtIGZpbGUgYW5kIHRoZSBwYWNrYWdlIGhhc2hlcyBpbiBidWls
ZHJvb3QuCgpXaGVuIHdlIHZlbmRvciB0aGUgZGVwZW5kZW5jaWVzIHRoZXkgYXJlIGJlaW5nIHZh
bGlkYXRlZCBhZ2FpbnN0IHRoZQpnby5zdW0gZmlsZSB0aGF0J3MgcGFydCBvZiB0aGUgcGFja2Fn
ZSBzb3VyY2UsIGFzIGxvbmcgYXMgdGhpcyB2YWxpZGF0ZXMgd2UKa25vdyB0aGUgY29ycmVjdCBk
ZXBlbmRlbmNpZXMgYXMgc3BlY2lmaWVkIGJ5IHRoZSB1cHN0cmVhbSBwYWNrYWdlCndlcmUgZG93
bmxvYWRlZCBjb3JyZWN0bHksIHRoZSBpc3N1ZSBpcyB0aGF0IEdPUFJPWFk9ZGlyZWN0IGRpc2Fi
bGVzCnRoZSBjYWNoaW5nIHByb3h5IHdoaWNoIGlzIGRlc2lnbmVkIHRvIGVuc3VyZSB0aGF0IG9u
ZSBjYW4gZG93bmxvYWQKdGhlIGRlcGVuZGVuY2llcyBtYXRjaGluZyB0aGUgaGFzaGVzIGluIHRo
ZSBnby5zdW0gZmlsZSBpbiB0aGUgZXZlbnQKdGhlIG9yaWdpbmFsIGRvd25sb2FkIHNvdXJjZSBi
cm9rZS9jaGFuZ2VkIGZvciB3aGF0ZXZlciByZWFzb24uCgpBIGRpcmVjdCBkb3dubG9hZCBmYWls
aW5nIGRvZXMgbm90IG5lY2Vzc2FyaWx5IGluZGljYXRlIGEgbWlzdGFrZSBvcgptYWxpY2lvdXMg
YWN0aW9uLCBpdCBtYXkgc2ltcGx5IGJlIHRoYXQgdGhlIGRlcGVuZGVuY3kgZG93bmxvYWQKbG9j
YXRpb24gbm8gbG9uZ2VyIGV4aXN0cy4gQXMgd2UgaGF2ZSB0aGUgY2FjaGluZyBwcm94eSB3ZSBz
aG91bGQKc2ltcGx5IGJlIHVzaW5nIHRoYXQgYnkgZGVmYXVsdCBhcyB0aGF0J3MgdGhlIGV4cGVj
dGVkIHdheSBmb3IKZ29sYW5nIHRvIGRvd25sb2FkIGRlcGVuZGVuY2llcyBhcyBpdCBwcmV2ZW50
cyBkb3dubG9hZCBmYWlsdXJlcwp0aGF0IGNhbiBoYXBwZW4gd2hlbiBhIGRpcmVjdCBkb3dubG9h
ZCBsb2NhdGlvbiBkaXNhcHBlYXJzIG9yCmNoYW5nZXMuIFVzaW5nIHRoZSBwcm94eSBpbnN0ZWFk
IG9mIGRpcmVjdCBkb3dubG9hZHMgZG9lcyBub3QKbWVhbmluZ2Z1bGx5IHJlZHVjZSBzZWN1cml0
eSBkdWUgdG8gZ28uc3VtIGJlaW5nIHZhbGlkYXRlZCBlaXRoZXIKd2F5LgoKPgo+IEJlc3QgcmVn
YXJkcywKPiBGaW9uYQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
