Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF10AD10BE3
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 04:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 951D0605FF;
	Sat, 26 Oct 2024 04:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkjisP8fgn1v; Sat, 26 Oct 2024 04:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B01160AFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B01160AFA;
	Sat, 26 Oct 2024 04:58:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD9AD5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F01D60AAF
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIEHgFXUyDm5 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 04:58:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c35; helo=mail-oo1-xc35.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B29DF605FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B29DF605FF
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B29DF605FF
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 04:58:37 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5ebc4e89240so1397968eaf.1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729918716; x=1730523516;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u01G20RiPXbpVspeS0kJREJyL8TwjtNh69TtOgwv1Lg=;
 b=LGia8ZKRpaNqCNMTpt2OEszDpR41L4xach/PCE1GIGpaxvg6e+xvOoe39Prx0bc60A
 mBOuRz9/YB4iqHuiNX68GM/JEM2R9+DKDJfOa7oyAEJq1M7ije9Ix6LztLpKaHs+5GXQ
 WhGplVXQhQDSRlQ0M00k/Zoz1aVctdd2sH3VJO5Lv836A2uO1dJ83fpvfuz75bUQooJ6
 /7Z2tnmdNRvYTvV7i5vs1BleZRSErJ5fQQjYJlKT6JaOGQrqyMKGGfERvTdOJwU0oazk
 KnfoOiTY7n28j1W886AYpxbxnHa779qSOvGsAUt1+94p/RDOAHx9a2RmPsNXCNsEz26G
 jo3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2dyqqV5fdZsx/HPnCPCS/HCqBbYniNwYxbGz8+DbdyjvP4lQL6TwdhWjhBgle53QfKvyBdt8pXoI=@buildroot.org
X-Gm-Message-State: AOJu0Ywp9yhcmUJXGguLb5fk+uPr7/0+T5f1qFG3gWlMwgXbUXBxrqQf
 6b8KjEakdgxO41FK5jbfPBxeDlyJBeMEPyLW1VKzia+sem19+W+8ixGJUXfuh3DzSxc2Cy4f/Ow
 k
X-Google-Smtp-Source: AGHT+IFJLysBufiuVSSfUujfsv8ckDDQpIepJK0M4j2WyolrVqTNAWxV4ua9vM1UvoUL6cwW7Qy+ng==
X-Received: by 2002:a05:6820:1ca7:b0:5eb:6a67:6255 with SMTP id
 006d021491bc7-5ec23809e29mr1128477eaf.1.1729918716062; 
 Fri, 25 Oct 2024 21:58:36 -0700 (PDT)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com.
 [209.85.167.175]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ec1859b627sm585222eaf.18.2024.10.25.21.58.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 21:58:35 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3e5f9712991so1520562b6e.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 21:58:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW8iM2oRAjqHPmz3B6XTvARkmHvojGgR+JQta1lptze0O9jONfLT/BejCYWRnXaXdc1aLJmJp9qmRU=@buildroot.org
X-Received: by 2002:a05:6808:2f0c:b0:3e6:943:63c9 with SMTP id
 5614622812f47-3e63848d6e1mr1817013b6e.33.1729918715121; Fri, 25 Oct 2024
 21:58:35 -0700 (PDT)
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
 <CADvTj4q=7j1RrPnk3syOKz8sqR=GWCVxGx+m8vuAO1cEOyDTWg@mail.gmail.com>
 <CA+h8R2rYBGsqtu_+27LAPuOprhbRwce6ejFs7JSBOSfC-6YjiQ@mail.gmail.com>
In-Reply-To: <CA+h8R2rYBGsqtu_+27LAPuOprhbRwce6ejFs7JSBOSfC-6YjiQ@mail.gmail.com>
Date: Fri, 25 Oct 2024 21:58:24 -0700
X-Gmail-Original-Message-ID: <CA+h8R2p+qPYJj1j2_gpcmBtJK3e1qW8h6mzTiwiSFv_4kOf8Ww@mail.gmail.com>
Message-ID: <CA+h8R2p+qPYJj1j2_gpcmBtJK3e1qW8h6mzTiwiSFv_4kOf8Ww@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729918716; x=1730523516; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u01G20RiPXbpVspeS0kJREJyL8TwjtNh69TtOgwv1Lg=;
 b=twO9AZogPzktOJR9E0+ml0Pmk4insA9j1mbLbxBVxt7Ywo9etVp5WOfW4OUrs8XviT
 Q+W7tDQGtVLuLXPxeZhhDzl5ZbYiTxCbQnzhmfauhTaClwHc4D1/B0tecx2alT1PR8sD
 CmJ25KldjeNL68bk1iUPQ3md90adyVpnFUtwm08auqvilJHIUgwTfRAUcAMHB8GwYiuG
 tgS9BzVbjUAWRZJSxAQMq2nHRosFThhhp73KvHpWpJHdA+hUmR+oX0pJqU5V1sG4okLd
 Ul3i7x9VD+zp8XSB1c+Ne3yMg4xcGfukfiWKdP9VjGl7DQMhZlC50W37GgY7iD68NFtx
 +mVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=twO9AZog
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBGcmksIE9jdCAyNSwgMjAyNCBhdCAxOjEx4oCvUE0gQ2hyaXN0aWFuIFN0
ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMjMsIDIw
MjQgYXQgMjo1MeKAr1BNIEphbWVzIEhpbGxpYXJkCj4gPiBXaGljaCBpcyB0cmlja3kgaW4gdGhp
cyBjYXNlIHNpbmNlIEknbSBub3QgdXNpbmcgdGhlIGxhdGVzdCByZWxlYXNlIGR1ZSB0bwo+ID4g
aXQgcmVxdWlyaW5nIGdvbGFuZyAxLjIzLjAgd2hpbGUgd2Ugb25seSBoYXZlIDEuMjIuOC4KPgo+
IExldCdzIHVwZGF0ZSBHbyB0byAxLjIzLng/CgpJIHNlbnQgYSBwYXRjaCBmb3IgdGhpczoKCmh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDEw
MjYwNDU0MjEuNDQ4MjMtMS1jaHJpc3RpYW5AYXBlcnR1cmUudXMvCgo+ID4gPiBPciBmZWVsIGZy
ZWUgdG8gcG9zdCB0aGUgaXNzdWUgaGVyZSBhbmQgd2UgY2FuIHRyeSB0byBmaWd1cmUgb3V0IHdo
eSB0aGUgY2hlY2tzdW1zIGFyZSBmYWlsaW5nLgo+ID4KPiA+IFRoaXMgaXMgdGhlIGVycm9yOgo+
ID4gZ286IGd2aXNvci5kZXYvZ3Zpc29yQHYwLjAuMC0yMDIzMDkyNzAwNDM1MC1jYmQ4NjI4NWQy
NTk6IGludmFsaWQKPiA+IHZlcnNpb246IHVua25vd24gcmV2aXNpb24gY2JkODYyODVkMjU5Cj4K
PiBUaGF0IGluZGVlZCBsb29rcyBsaWtlIHRoYXQgY29tbWl0IHdhcyBkZWxldGVkIGZyb20gdGhl
IGd2aXNvciByZXBvc2l0b3J5Lgo+Cj4gSXNzdWU6IGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUv
Z3Zpc29yL2lzc3Vlcy8xMTA4NQoKQWNjb3JkaW5nIHRvIHRoZSBkaXNjdXNzaW9uIGluIHRoYXQg
aXNzdWUsIHRoZSBjb21taXQgd2FzIGRlbGV0ZWQgZnJvbQpndmlzb3IgYmVjYXVzZSBpdCBjb250
YWluZWQgbGFyZ2UgYmluYXJ5IGZpbGVzLiBUaGV5IHdlcmUgdHJpbW1pbmcKZG93biB0aGUgcmVw
byBzaXplLgoKSSByZWNvbW1lbmQgaW5zdGVhZCByZS1zdWJtaXR0aW5nIHlvdXIgbGF0ZXN0IG5l
dGJpcmQgcGF0Y2ggYWZ0ZXIgdGhlCkdvIDEuMjMueCBwYXRjaCBpcyBtZXJnZWQuCgpCZXN0IHJl
Z2FyZHMsCkNocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
