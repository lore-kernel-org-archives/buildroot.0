Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9296C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 20:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90C758348C;
	Wed,  5 Feb 2025 20:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oopo-6DUWF_5; Wed,  5 Feb 2025 20:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F1EE83183
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1EE83183;
	Wed,  5 Feb 2025 20:38:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD708CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9188860F36
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyE7o3BCaMZe for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 20:38:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 637FA60F25
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 637FA60F25
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 637FA60F25
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:38:54 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id
 a1e0cc1a2514c-866db7d6889so43758241.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 12:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738787932; x=1739392732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3hCzmTEWFXCb39WYZsT4vfl8x3k+nrSFwGaPA8E9Cbk=;
 b=MQo8d3Q6CQtdMBcdT4zVKu01gWnlkjeKlVBAEGWK3Xcb669VG6H/BI1oIe9RjSCzMm
 8wxd+s681dTkP3AGM07Xqt8vYHlXRMhGcwiYdQ7K8GB3CKfo0ywXdjJAeUo5+nCq3ekd
 jObrqq/2aLEK+hVq7q4ScByvPicHnQORTpC9V0RmXfgzovpjnEBAdFwidBiHNQRlgnD1
 Yjgrz0HXzR3PEw7mrwXLsueOQGt7uciSPsgbHsR8BZRoqzUDOEYuTbn9YNPSwblBO36K
 WltkoDzCEegScTPgtUIYL7qbVGLOOoADcJIsm5ErtLwENlfXrnvvtXuOiCAlX0esyrkH
 Z2Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVC74Qp8RnnrlE/DgKVwVTMNhbl1Uwm7KUrdZFyR2CTFzFVbTuwbTIcKD29r24/ALq5beXrWhGN+qg=@buildroot.org
X-Gm-Message-State: AOJu0YxVIbnCgteyWQd9fvuP13CeL2obJ9cFfzpYuk2nVCcmqy+gQM+8
 PtOsnuj5rPbHqO9bFpDwctz/XAVee/1+IAucYe7zQPbgeFTjQuulbGhBsA418K4zzVzVuR0hfB0
 KMlwJfrq1dfEX0nLg6+SvTOyFtd8=
X-Gm-Gg: ASbGncuiPLnMmd9DcebHtn5n0ux8b1e6jF6Q7aC9xcnFrZlwECIdZfuEpD6HakvOq10
 gTSynid7FSFETU8NYsmcBj4sM4BqbLGngYNkI7d+wL+bdnS5ok8sTMeRZ6O5qPwimb13USR8new
 ==
X-Google-Smtp-Source: AGHT+IExVVnCEAl+EBEJ1BYQRQvlrV5kAgKbVDwfia30QwMOpUcDUVOYrDoLuVQLnkEal+rmeeIHbf803K4KI45sKls=
X-Received: by 2002:a05:6102:2b89:b0:4af:e643:e1e5 with SMTP id
 ada2fe7eead31-4ba46dbf4cfmr3350065137.2.1738787932487; Wed, 05 Feb 2025
 12:38:52 -0800 (PST)
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
In-Reply-To: <CA+h8R2oU_CHcTw6aCdyTXGH9F-eEd+nxwzjfcZPhb99ZJvHe0Q@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 5 Feb 2025 22:38:40 +0200
X-Gm-Features: AWEUYZkdKsIvmlFdXC6FG0hBKvlcvxQ7aLNAPP7vPd7MWGw_uZID_OHE7bIZZZg
Message-ID: <CADvTj4onhc2rTzFa7F5bDFXSNQJ2CKuyU-TD-fwhpQUXNHZTcw@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738787932; x=1739392732; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hCzmTEWFXCb39WYZsT4vfl8x3k+nrSFwGaPA8E9Cbk=;
 b=FjL7bB6qi1Ry6J629FrIJsPzHuSp0P1y/46I6tOgGxATQvJOScfLSbdZUZQhj3Fkb6
 C0auLD/hw4t9VgmQXzuTKh7i1J6zpQWvlxyAfSWeTZHtblCjoG9eBmXwTMW1i0po8Efm
 TD1Pq1Tv3NYBG53mVGsM8xSdfE5NBw2Cb2FeltKVhjv225UgwmA0zL8zMBcoQL6Dd3p5
 0mNoZ/9rEsDdOz2VssC0PvxMOeRmYUl8uuWVwyIBdQZSREC49OvbhxuNjnLfX0FNkIcl
 93DYAWbnbeV4w3Ea8NGJyk/BsY3sS3EuF88B6kXRLGBtp/kekYyPi9EDmvQHaLwYUePp
 G+DA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FjL7bB6q
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

T24gV2VkLCBGZWIgNSwgMjAyNSBhdCAxMDowMeKAr1BNIENocmlzdGlhbiBTdGV3YXJ0IDxjaHJp
c3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgo+Cj4gSmFtZXMsCj4KPiBPbiBXZWQsIEZlYiA1LCAy
MDI1LCAxMDowMuKAr0FNIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PiB3cm90ZToKPgo+IEkgYWdyZWUgd2l0aCB5b3VyIGJhc2VsaW5lIGFzc2VydGlvbiB0aGF0IHRo
ZSBzZWN1cml0eSBvZiB0aGVzZSBwYWNrYWdlcyBjb21lcyBmcm9tIHRoZSBnby5zdW0gaGFzaGVz
Lgo+Cj4KPj4gVGhpcyBpcyBraW5kYSBhIG1haW50YWluYWJpbGl0eSBuaWdodG1hcmUsIGRlcGVu
ZGVuY2llcyB3aWxsIGJyZWFrIHJhbmRvbWx5IGZvcgo+PiB2YXJpb3VzIHJlYXNvbnMgd2l0aCBH
T1BST1hZPWRpcmVjdCBkdWUgdG8gdW5yZWxpYWJsZSBkZXBlbmRlbmN5IGRvd25sb2FkCj4+IGxv
Y2F0aW9ucy91cmxzLgo+Cj4KPiBEbyB5b3UgaGF2ZSBhbnkgZXhhbXBsZXMgb2YgY2FzZXMgd2hl
cmUgdGhpcyBoYXMgaGFwcGVuZWQ/CgpMb29rIGF0IG15IG5ldGJpcmQgUFIsIGxpdGVyYWxseSBh
IGNhc2Ugb2YgMiB1cmxzIGdvaW5nIGludmFsaWQgYXQgc29tZSBwb2ludC4KCj4gSWYgaXQgZG9l
cyBoYXBwZW4sIHdlIGNhbiBtaXJyb3IgdGhlIHBhY2thZ2UgLnRhci5neiBpbiB0aGUgYnVpbGRy
b290IG1pcnJvci4gSGF2ZSB3ZSBldmVyIG5lZWRlZCB0byBkbyB0aGlzIHRodXMgZmFyPwoKV2Ug
ZG9uJ3QgcmVhbGx5IGhhdmUgYSBsb3Qgb2YgZ29sYW5nIHBhY2thZ2VzIHlldCwgYnV0IGJhc2Vk
IG9uIHRoZSBicmVha2FnZQpJIHNlZSBpbiBwYWNrYWdlcyBsaWtlIG5ldGJpcmQgaXQgc2VlbXMg
bGlrZSBhbiBpbmV2aXRhYmxlIGlzc3VlIGF0IGFueQptZWFuaW5nZnVsIHNjYWxlLgoKSSB0aGlu
ayB3ZSBkb24ndCB3YW50IHRoZSBidWlsZHJvb3QgbWlycm9yIHRvIGJlIHRoZSBwcmltYXJ5IGRv
d25sb2FkIGxvY2F0aW9uCmVpdGhlci4KCj4+IEZvciBleGFtcGxlIG5ldGJpcmQgaXMgc3RpbGwg
YnJva2VuIHdpdGggR09QUk9YWT1kaXJlY3QgZHVlIHRvIHVybCBicmVha2FnZQo+PiBpc3N1ZXMg
d2hpY2ggaGF2ZSBub3QgaGFkIGZpeGVzIG1lcmdlZChzdXJwcmlzZSBzdXJwcmlzZSBtYWludGFp
bmVycyBkb24ndAo+PiBjYXJlIG9yIHRlc3Qgd2l0aCBHT1BST1hZPWRpcmVjdCBzZWVtaW5nbHkg
ZXZlciBhcyBpdCdzIG5vdCB0aGUgZGVmYXVsdCk6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9uZXRi
aXJkaW8vbmV0YmlyZC9wdWxsLzMyNDAKPgo+Cj4gSSBkb24ndCBhZ3JlZSB0aGF0IHlvdXIgMSB3
ZWVrIG9sZCBQUiBub3QgYmVpbmcgbWVyZ2VkIHlldCBpcyBhIHN1aXRhYmxlIGluZGljYXRvciB0
aGF0IG1haW50YWluZXJzIGRvbid0IGNhcmUgYWJvdXQgdGhlaXIgZGVwZW5kZW5jaWVzIG1hdGNo
aW5nIHdoYXQgaXMgaW4gR2l0LgoKV2VsbCB0aGF0IGFuZCB0aGUgZmFjdCB0aGF0IEdPUFJPWFk9
ZGlyZWN0IHdhcyBicm9rZW4gaW4gdGhlIGZpcnN0IHBsYWNlCmlzIGEgcHJldHR5IHN0cm9uZyBp
bmRpY2F0b3IgdXBzdHJlYW0gcHJvamVjdHMgZG9uJ3QgY2FyZSBhYm91dCBpdCBtdWNoLgoKPj4g
VGhpcyB3aWxsIGJlIGVzcGVjaWFsbHkgcHJvYmxlbWF0aWMgZm9yIHN0YWJsZSByZWxlYXNlcyBh
cyBnbyBwYWNrYWdlcyBvZnRlbgo+PiBoYXZlIGEgdG9uIG9mIGRlcGVuZGVuY2llcywgYW55IG9u
ZSBvZiB3aGljaCBjYW4gYnJlYWsgYSBwYWNrYWdlIGJ1aWxkCj4+IHdoZW4gbm90IHVzaW5nIHRo
ZSBjYWNoZSB0aHVzIHJlcXVpcmluZyBwYXRjaGVzIHRoYXQgYXJlIHVubGlrZWx5IHRvIGJlIGFj
Y2VwdGVkCj4+IHVwc3RyZWFtIGR1ZSB0byBwYWNrYWdlIHZlcnNpb25zIGluIHN0YWJsZSByZWxl
YXNlIG9mdGVuIG5vdCBiZWluZyBtYWludGFpbmVkCj4+IHVwc3RyZWFtIGFueW1vcmUuCj4KPgo+
IFRoZSByZW1lZHkgZm9yIGEgZGVwZW5kZW5jeSBub3QgYmVpbmcgYXZhaWxhYmxlIGFueW1vcmUg
dmlhIEdpdCBpcyB0byBtaXJyb3IgdGhlIGVudGlyZSBwYWNrYWdlIC50YXIuZ3ogaW4gdGhlIGJ1
aWxkcm9vdCBtaXJyb3IsIG5vdCB0byBzdWJtaXQgcGF0Y2hlcy4KCk9yIHdlIGNvdWxkIGNob29z
ZSB0aGUgbXVjaCBzaW1wbGVyIGFuZCBtb3JlIHJlbGlhYmxlIG9wdGlvbiBvZiBzaW1wbHkKbm90
IGRlZmF1bHRpbmcgdG8gR09QUk9YWT1kaXJlY3QuCgo+IFRoZSBzdWJtaXR0aW5nIHBhdGNoZXMg
aXMgcGFydCBvZiB0aGUgaW5pdGlhbCBwcm9jZXNzIG9mIGFkZGluZyBvciB1cGRhdGluZyBhIEdv
IHBhY2thZ2UgaW4gYnVpbGRyb290LiBDb25zaWRlciBpdCBkdWUgZGlsaWdlbmNlIHRvIG1ha2Ug
c3VyZSB0aGF0IGFueSBtaXNtYXRjaGVzIGJldHdlZW4gdGhlIHByb3h5IGFuZCB0aGUgdXBzdHJl
YW0gR2l0IHNvdXJjZSBhcmUgYWRkcmVzc2VkLgoKV2hhdCdzIHRoZSBwdXJwb3NlIG9mIHRoaXM/
IFdoYXQgYWN0dWFsIHJlYWwgd29ybGQgYmVuZWZpdHMgaGF2ZSB3ZSBnYWluZWQKZnJvbSBmaXhp
bmcgdGhlc2UgYnJva2VuIHVybC9kb3dubG9hZCBpc3N1ZXMgdXBzdHJlYW0gYXMgb3Bwb3NlZCB0
byBzaW1wbHkKbm90IHVzaW5nIEdPUFJPWFk9ZGlyZWN0IGxpa2UgdGhlIHJlc3Qgb2YgdGhlIGdv
bGFuZyBlY29zeXN0ZW0/Cgo+IEkgYWdyZWUgd2l0aCB5b3VyIGxvZ2ljIHRoYXQ6Cj4KPiAxKSBU
aGUgZGV2ZWxvcGVycyBvZiBnbyBwcm9qZWN0cyBsaWtlIERvY2tlciBvciBOZXRiaXJkIGhhdmUg
cGlubmVkIGRlcGVuZGVuY2llcyBpbiBnby5zdW0gd2hpY2ggd2UgY2FuIHJlYXNvbmFibHkgdHJ1
c3QuCj4gMikgYnVpbGRyb290IG1haW50YWluZXJzIGRvbid0IHR5cGljYWxseSBleGhhdXN0aXZl
bHkgYXVkaXQgYWxsIGRlcGVuZGVuY2llcy4KPgo+IFdoYXQgSSBkaXNhZ3JlZSB3aXRoIGlzOwo+
Cj4gMSkgSXQgaXMgaW1wb3NzaWJsZSB0byBhdm9pZCBhZGRpbmcgYSBHb29nbGUgaG9zdGVkIHNl
cnZpY2UgYXMgYSBkZXBlbmRlbmN5IGZvciBidWlsZGluZyBHbyBwYWNrYWdlcyBpbiBidWlsZHJv
b3QuCgpXaGF0IEknbSBzYXlpbmcgaXMgdGhhdCBpdCdzIGltcG9zc2libGUgdG8gYXZvaWQgdGhl
IGdvcHJveHkgY2FjaGUgd2l0aG91dApyZWx5aW5nIG9uIGJ1aWxkcm9vdCBpdHNlbGYgbWlycm9y
aW5nIHBhY2thZ2VzIHdpdGggdGhlaXIgZGVwZW5kZW5jaWVzIGluIGEKZ2VuZXJhbGl6ZWQgbWFu
bmVyIGxvbmcgdGVybS4KCkFsc28gdGhvc2Ugd2l0aCBvdXQgb2YgdHJlZSBnb2xhbmcgcGFja2Fn
ZXMgaW4gYSBCUjJfRVhURVJOQUwgb25lIGNhbgpub3QgcmVseSBvbiBidWlsZHJvb3QncyBtaXJy
b3Igd2hpY2ggaXMgYSBmdXJ0aGVyIGlzc3VlIHdoZW4gaXQgY29tZXMgdG8KcmVxdWlyaW5nIEdP
UFJPWFk9ZGlyZWN0LgoKPiAyKSBJdCBpcyBub3QgZmVhc2libGUgdG8sIGF0IHRoZSBtb21lbnQg
YSBwYWNrYWdlIGlzIG1lcmdlZCBpbnRvIGJ1aWxkcm9vdCwgZXhwZWN0IG5ldyBwYWNrYWdlcyBv
ciBwYWNrYWdlIHZlcnNpb25zIHRvIGJ1aWxkIGNsZWFubHkgd2l0aG91dCB0aGUgcHJveHkgbWVu
dGlvbmVkIGluIDEpLgoKSSBtZWFuLCBJIHN1cHBvc2UgYnVpbGRyb290IGNhbiBpbiB0aGVvcnkg
aW50cm9kdWNlIG1hbnkgYXJiaXRyYXJ5IGFuZAplbnRpcmVseSB1bm5lY2Vzc2FyeSBtZXJnZSBy
ZXF1aXJlbWVudHMgZm9yIGdvbGFuZyBwYWNrYWdlcywgd2hhdCBJJ20Kc2F5aW5nIGlzIHRoYXQg
dGhlcmUncyBubyBqdXN0aWZpY2F0aW9uIGZvciBkZWZhdWx0aW5nIHRvIG9yIHJlcXVpcmluZwpH
T1BST1hZPWRpcmVjdCBzdXBwb3J0IGZvciBtZXJnaW5nIGdvbGFuZyBwYWNrYWdlcyB3aGVuIHRo
ZSBnb2xhbmcKZWNvc3lzdGVtIGRvZXNuJ3QgcmVxdWlyZSBHT1BST1hZPWRpcmVjdCBzdXBwb3J0
IG5vcm1hbGx5LgoKPiBTaG91bGQgYSB1cHN0cmVhbSBHaXQgc291cmNlIGdvIG1pc3NpbmcsIHdl
IGNhbiBtaXJyb3IgdGhhdCBwYWNrYWdlIC50YXIuZ3ogaW4gdGhlIGJ1aWxkcm9vdCBtaXJyb3Iu
IFdlIGNhbiBlYXNpbHkgcmVwcm9kdWNlIHRoYXQgLnRhci5neiB1c2luZyB0aGUgR29vZ2xlIHBy
b3h5IGFzIG5lZWRlZCwgYnkgc2V0dGluZyBHT1BST1hZIHRvIHRoZSBHb29nbGUgcHJveHkgYW5k
IHJ1bm5pbmcgIm1ha2UgcGtnLWV4dHJhY3QiCgpZZXMgaXQgaXMgcG9zc2libGUgdG8gaW50cm9k
dWNlIGFyYml0cmFyeSByb2FkYmxvY2tzIGFuZCB0aGVuIHdvcmsgYXJvdW5kCnRoZW0gd2hlbiBv
bmUgZ2V0cyBiaXR0ZW4gZG93biB0aGUgbGluZSwgYnV0IEkgc2VlIG5vIGdvb2QgcmVhc29uIGZv
cgphY3R1YWxseSBpbnRyb2R1Y2luZyB0aGVzZSBhcmJpdHJhcnkgcm9hZGJsb2NrcyBpbiB0aGUg
Zmlyc3QgcGxhY2UuCgpUaGVyZSBhcmUgdmlydHVhbGx5IHplcm8gYmVuZWZpdHMgdG8gdXNpbmcg
R09QUk9YWT1kaXJlY3Qgb3V0c2lkZSBvZgpzb21lIGF1ZGl0aW5nIHVzZSBjYXNlcyh3aGljaCBh
cmVuJ3QgcmVhbGx5IGJ1aWxkcm9vdCBhcHBsaWNhYmxlKSBmcm9tCndoYXQgSSBjYW4gdGVsbC4g
SSdtIHN1cmUgaXQgd2lsbCBhbHNvIG1ha2UgZG93bmxvYWRzIHNsb3dlciBhcyB3ZWxsLgoKVGhl
cmUncyBvbmx5IGRvd25zaWRlcyB0byB1c2luZyBHT1BST1hZPWRpcmVjdCBpbiBidWlsZHJvb3Qg
ZnJvbQp3aGF0IEkgY2FuIHRlbGwsIEkgY2FuJ3QgZXZlbiB0aGluayBvZiBhIHNpbmdsZSByZWFs
IHdvcmxkIGJlbmVmaXQuCgo+Cj4gSG9wZWZ1bGx5IHRoaXMgY2xhcmlmaWVzIGEgYml0Lgo+Cj4g
QmVzdCByZWdhcmRzLAo+IENocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
