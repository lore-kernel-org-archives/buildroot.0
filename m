Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC301C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 23:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DAE7426A3;
	Wed,  5 Feb 2025 23:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIvqSQ2U4thd; Wed,  5 Feb 2025 23:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21691426AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21691426AE;
	Wed,  5 Feb 2025 23:45:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D871FCF
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCB33426A3
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PF6aEohQhfOB for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 23:45:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87459426A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87459426A0
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87459426A0
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 23:45:50 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4aff1c57377so198467137.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 15:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738799149; x=1739403949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wSjnd6e1iEr9txakCmga6TjvC/dHkVDArltG2QdSV54=;
 b=d/wsFOBRTUPKEUdQRrhEGBcSbn8GAVPSwSWnz+dLtIeb6C11TqjHZHOc2/uxHkp04n
 pQxPFIOEpjvvHYT4K/TuoT4og1U/XEjzTtP8klDd07Sb6Km5kggT1cpYAfLXv3O7tuYn
 upuUhbIKPJ5Fk3bGB6WqyU0K/1ApckY0o7tl/vroMRaPNjiY5P35z4YaBtnESN27G/dx
 cLcCnNaeKtLV1VoHZW9Luz+rwhNnlx3bSmoMHTTBu/PW/IH509Jyg+ipOcbQmBvdwOpJ
 1f8dURTWLuEP2rGXvsNgoJye0Iaw0Ar+RhFxMRF3s23KygsItmI9TR0UV+kIhAAsbpmG
 OEeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOPUY4Js4C5m7mplrvZodhnuoJI9FoGCxZWzp1VHy2FGt14tQtOE0dTLOFYyhSgcMl5G9h1/1v0Q4=@buildroot.org
X-Gm-Message-State: AOJu0YyULkzsORtcZLJDmME25DztE/SeeKWVfSeqp8vTP+ZGo3kwosUN
 ErS0ycjKkIKfdFveFzCCHWHgHqINdvsdKUL2YNs5BVgSAt79UQ75pEjcQ1FSE0AhLSPn7UZVaqm
 PQR4Xmp3qIafuPtM3WK8Mfxg8nANLY2HL
X-Gm-Gg: ASbGncuZSr5o6tbD11jSCqrfYYj8kMhgcVyT0qW0dTLUxH0V0cXz0Wfn2dD46zSUUr1
 f1x4A5k06G80905atz39Ih4fJd3TqExlaYsP3wVRHC86/nEH4E5nEu0dvSgtUUisA/dB9HJiQGg
 ==
X-Google-Smtp-Source: AGHT+IHj/T2dGxrWFo2nPhee1L9ftFS8Tcq1o9eHZMXofhHaF6Hi+p2wbPiwxsj1yGRPKQn7COTB6FaPoXQti0oVgCg=
X-Received: by 2002:a05:6102:40a:b0:4af:f1c6:af04 with SMTP id
 ada2fe7eead31-4ba72093e9bmr761763137.8.1738799149283; Wed, 05 Feb 2025
 15:45:49 -0800 (PST)
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
 <CADvTj4r1z1Y8cLZ45i1kJKgULiJMehBjR_OZ8oeWHw5jaj4+aA@mail.gmail.com>
 <CA+h8R2qWgHUg3qG6wn+Ox9pcn6y9NMWrbaQyYkdpgvv_FNweXw@mail.gmail.com>
 <CADvTj4pXO2rwJ8oCzzGNY+OxLuo3uJnDT2PAxbyquw0L6dhfiA@mail.gmail.com>
 <CA+h8R2q-oqPUYwbMot_kyP5e7iShw-onQ8HM19FDs989VTqh3g@mail.gmail.com>
In-Reply-To: <CA+h8R2q-oqPUYwbMot_kyP5e7iShw-onQ8HM19FDs989VTqh3g@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 6 Feb 2025 01:45:37 +0200
X-Gm-Features: AWEUYZlZfzbNWJNctO4s6J1g1fK3fZO11QqGFF6H4YQMCylws_OP12M-C-b66bo
Message-ID: <CADvTj4rnbVzL1ETn_Gum9Kq6058Q6dcE_bX=-LvTLfmibKoYUQ@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738799149; x=1739403949; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSjnd6e1iEr9txakCmga6TjvC/dHkVDArltG2QdSV54=;
 b=SlALNsZHyvYU1wAoCFrjftNoxyv4O0nZyFRrripHn0VuDq/W5hgE8btglkI5lCIs7d
 dmZpT4Hp6tpfGDy1mVGiRnucWsgA6DBL1bfLszcm7s481yz7J8vIEnp+0Cr6IRiFgQvw
 YyZZDyMdhLvVcQrhpZbw8EY6LRaJmWgJapRAxZEP4n1eIeidBvXxzfxqjjmAr0lPSglS
 R4fbXecjM70/5EV3+JWZpitMrIWCJ/OPXhFv8793eq+rY2g5giXmqe7vriQX2jYIX7/c
 oZBO/C/h6asVpr7VNdaQ3ENj2NDnzZmYZr0Yed3gNuhnBXJUNezu2ZxTgiuHeYB7/l8x
 kbzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SlALNsZH
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

T24gVGh1LCBGZWIgNiwgMjAyNSBhdCAxOjMx4oCvQU0gQ2hyaXN0aWFuIFN0ZXdhcnQgPGNocmlz
dGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9uIFdlZCwgRmViIDUs
IDIwMjUgYXQgMjo1NuKAr1BNIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwu
Y29tPiB3cm90ZToKPiA+ID4gT24gV2VkLCBGZWIgNSwgMjAyNSBhdCAxOjU14oCvUE0gSmFtZXMg
SGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiBX
ZWxsIHRoYXQgYW5kIHRoZSBmYWN0IHRoYXQgR09QUk9YWT1kaXJlY3Qgd2FzIGJyb2tlbiBpbiB0
aGUgZmlyc3QgcGxhY2UKPiA+ID4gPiA+ID4gaXMgYSBwcmV0dHkgc3Ryb25nIGluZGljYXRvciB1
cHN0cmVhbSBwcm9qZWN0cyBkb24ndCBjYXJlIGFib3V0IGl0IG11Y2guCj4gPiA+ID4gPgo+ID4g
PiA+ID4gVGhleSBoYXZlIHJlcGxpZWQgdG8geW91ciBQUiByZXF1ZXN0aW5nIGFuIGFsdGVybmF0
aXZlIHN0cmF0ZWd5IHRvCj4gPiA+ID4gPiBmaXhpbmcgdGhlIGlzc3VlOgo+ID4gPiA+ID4KPiA+
ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9uZXRiaXJkaW8vbmV0YmlyZC9wdWxsLzMyNDAjaXNz
dWVjb21tZW50LTI2Mzc5NTY1MzcKPiA+ID4gPiA+Cj4gPiA+ID4gPiBIZXJlIGFyZSB0aGUgbmV3
IFBScyBpbXBsZW1lbnRpbmcgd2hhdCB0aGV5IHJlcXVlc3RlZDoKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAtIGh0dHBzOi8vZ2l0aHViLmNvbS9uZXRiaXJkaW8vbmV0YmlyZC9wdWxsLzMyODcKPiA+ID4g
PiA+IC0gaHR0cHM6Ly9naXRodWIuY29tL25ldGJpcmRpby9uZXRiaXJkL3B1bGwvMzI4OAo+ID4g
Pgo+ID4gPiBPbmUgb2YgdGhlc2UgaXMgYWxyZWFkeSBtZXJnZWQsIGFuZCB0aGUgb3RoZXIgaXMg
YmVpbmcgbG9va2VkIGF0IHJpZ2h0IG5vdy4KPiA+ID4KPiA+ID4gSXQgaXMgbm90IGFzIGhhcmQg
YXMgeW91IG1ha2UgaXQgc2VlbSB0byBmaXggdXBzdHJlYW0uCj4gPgo+ID4gU3VyZSwgbWF5YmUg
Zm9yIHNvbWVvbmUgdGhhdCByZWd1bGFybHkgZGV2ZWxvcHMgZ29sYW5nIHByb2plY3RzCj4gPiBp
dCBzaG91bGQgYmUgZWFzeSwgYnV0IEkgZG9uJ3QgcmVhbGx5IHdyaXRlIGFueSBnbyBjb2RlLCBz
byBkZWJ1Z2dpbmcKPiA+IGNvbmZ1c2luZyBHT1BST1hZPWRpcmVjdCByZWxhdGVkIGJyZWFrYWdl
IGlzIG5vdCBhbHdheXMgdGhhdCBlYXN5Lgo+Cj4gT2suIFdlIHdpbGwgdHJ1c3QgdGhhdCB1cHN0
cmVhbSBwYWNrYWdlcyAoRG9ja2VyLCBuZXRiaXJkLCBldGMpIGhhdmUKPiB0aGUgY29ycmVjdCBo
YXNoIGluIGdvLnN1bSwgYW5kIHVzZSB0aGF0IGFzIHRoZSBzb3VyY2Utb2YtdHJ1c3QgaGVyZS4K
Pgo+IFdlIHNob3VsZCBzZXQgdGhlIGRlZmF1bHQgQlIyX0dPUFJPWFkgdG8gbWF0Y2ggJChnbyBl
bnYgR09QUk9YWSksIGFzCj4gQXJub3V0IG1lbnRpb25lZC4KPgo+IEkgc3VibWl0dGVkIGEgdjQg
b2YgeW91ciBwYXRjaCwgd2l0aCBzb21lIG1pbm9yIG1vZGlmaWNhdGlvbnM6Cj4KPiBodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjUwMjA1MjMy
ODM3LjcwMzAzLTEtY2hyaXN0aWFuQGFwZXJ0dXJlLnVzLwo+Cj4gSSB3b3VsZCByZXF1ZXN0IHRo
YXQgd2Ugc3RpbGwgYXQgbGVhc3QgdGVzdCB3aXRoIEJSMl9HT1BST1hZPSJkaXJlY3QiCj4gd2hl
biBtZXJnaW5nIHBhY2thZ2VzLgo+Cj4gV2UgbWlnaHQgd2FudCB0byBtYWtlIEJSMl9HT1BST1hZ
PSJkaXJlY3QiIGJlIHRoZSBkZWZhdWx0IGlmCj4gQlIyX1BSSU1BUllfU0lURV9PTkxZIGlzIHNl
dC4KCkkgdGhpbmsgaXQgaXNuJ3QgbmVlZGVkLCBhcyBBRkFJVSBCUjJfUFJJTUFSWV9TSVRFX09O
TFkgZm9yY2VzCmEgc2luZ2xlIHNlcnZlciB0byBiZSB1c2VkIGZvciBhbGwgZG93bmxvYWRzLCBh
bmQgYW55d2F5cyBhcwpHT1BST1hZPSJkaXJlY3QiIHdvdWxkbid0IGRvd25sb2FkIGZyb20gdGhl
IHByaW1hcnkgc2l0ZSBzbwpJIGRvbid0IHRoaW5rIHRoYXQgd291bGQgYmUgY29ycmVjdC4KCklm
IGFueXRoaW5nIGEgcHJveHkgd291bGQgYmUgY2xvc2VyIHRvIHdoYXQgQlIyX1BSSU1BUllfU0lU
RV9PTkxZCmlzIGludGVuZGVkIGZvciBBRkFJVSB3aGljaCBpcyB0byByZWRpcmVjdCBhbGwgZG93
bmxvYWRzIHRvIHNheSBhIHNpbmdsZQpwYWNrYWdlIG1pcnJvciBzZXJ2ZXIuCgo+Cj4gQmVzdCBy
ZWdhcmRzLAo+IENocmlzdGlhbiBTdGV3YXJ0Cj4KPiA+IFRoZSB1cHNpZGVzIHlvdSBtZW50aW9u
IGFyZW4ndCBwcmFjdGljYWwgdXBzaWRlcyBmb3IgYnVpbGRyb290IGhvd2V2ZXIsCj4gPiB0aGV5
IG1heSBiZSBwcmFjdGljYWwgZm9yIGF1ZGl0aW5nIHByb2plY3QgZGVwZW5kZW5jaWVzLCBidXQg
d2UgZG9uJ3QKPiA+IGRvIHRoYXQgaGVyZSBhcyBwYXJ0IG9mIGJ1aWxkcm9vdCBwcm9qZWN0IGlu
IHByYWN0aWNlLCBoZW5jZSB0aGUKPiA+ICJubyBwcmFjdGljYWwgcmVhc29uIiBhcyBubyB1cHNp
ZGVzIGZvciBidWlsZHJvb3QgZXhpc3QgSU1PLgo+Cj4gT0suCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
