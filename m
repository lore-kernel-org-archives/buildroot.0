Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E9AD149EB
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 20:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810F5405C1;
	Fri, 25 Oct 2024 20:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wL1tHLuoMvR; Fri, 25 Oct 2024 20:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30EF5405E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30EF5405E9;
	Fri, 25 Oct 2024 20:11:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80287281F
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D7F940215
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 20:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2piPY-1ihp3l for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 20:11:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16873400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16873400F1
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16873400F1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 20:11:19 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-5eb73ec1e1aso1361927eaf.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 13:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729887079; x=1730491879;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C44ycqrPRuC6kQNq5wX0I70/Iw0nGFO+5LPZ/EMxKPo=;
 b=wGX07La2NZ2TvB+0nDut96hS1B5eeuREyZgQXh6WPoMsiZCCIwAuZJGJBqEsMZdm8b
 2UQH5PK8VKYdNtmk62fMG1nZg94ARKZeYCEx1vshXcav8qIU1XrhbQAvGo/CBilfoXmU
 qz9gappVetopiBVRAhQhf1VFk+IDaBH6TaJIKGt87+cWt8rxWUJ1nLscwtr7SUIr6nXl
 DHGvr3oSLrguHsBh2lqjaian+/lrMiffaIJJh/NOH6ILPxszigZEDNPAB7D6pLtyoKVo
 Yxf5wETMg2UhCm0QzN8r+glT191swfNf7eO0eu6ZKAs6Pt/KJ418WUoTjUCvj2seKJG6
 JkXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt8E/VeiRcuvnSUJIFBxoNWBwPC7nkT2Q6I/Z5Mx+feX/Vfu27M4hKuZS4vb3WLOqX7kegwo2/QKY=@buildroot.org
X-Gm-Message-State: AOJu0Yx1Jn7Drlk613aFW/gz2Qj3+14bSVXdVN3FZytH28UrOM21EWyM
 EYwDvoOqvTsn4Kl2Ufm1mEpC6x5Z5uhuvNuXbbRi8NLnXro//nBb7TdNtOvPlgzGKgbLnSud1uJ
 7
X-Google-Smtp-Source: AGHT+IEyyJFcl9yoQmOSYV4teOXP2DE1MjTSGgqaNtuwI0nOpMr8INTFDroH5qwTbXp37JJj9hbxFg==
X-Received: by 2002:a05:6820:228b:b0:5eb:b282:5351 with SMTP id
 006d021491bc7-5ec237e743fmr382371eaf.2.1729887078536; 
 Fri, 25 Oct 2024 13:11:18 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com.
 [209.85.161.49]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ec1863c646sm388635eaf.28.2024.10.25.13.11.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 13:11:18 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-5e7ae4c504fso1106039eaf.1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 13:11:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU1y6zOwXbgb1dwLQdHfojmRfvlHjosji8Voiatxp4gCa87vhGHB6DyxjzWSSiBkPN+uWmNx8TuBHs=@buildroot.org
X-Received: by 2002:a05:6870:9a21:b0:260:fbf0:d65c with SMTP id
 586e51a60fabf-29051b050f9mr707169fac.9.1729887077665; Fri, 25 Oct 2024
 13:11:17 -0700 (PDT)
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
In-Reply-To: <CADvTj4q=7j1RrPnk3syOKz8sqR=GWCVxGx+m8vuAO1cEOyDTWg@mail.gmail.com>
Date: Fri, 25 Oct 2024 13:11:06 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rYBGsqtu_+27LAPuOprhbRwce6ejFs7JSBOSfC-6YjiQ@mail.gmail.com>
Message-ID: <CA+h8R2rYBGsqtu_+27LAPuOprhbRwce6ejFs7JSBOSfC-6YjiQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729887079; x=1730491879; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C44ycqrPRuC6kQNq5wX0I70/Iw0nGFO+5LPZ/EMxKPo=;
 b=NHEmbvRky9gElr5WqhPyBaFpU/0Ic7DVKKkUXfryMxWhy7f4qvy5BVoJ8+xfEKjXu6
 PyR4avv6xPuO/J2EUB1fVZ0CDKM4vOqDd6Cn6+9gISbrZ9z8SOrsvV/nxxe7cbo8jQ+O
 CKdXh7YJERG9Lm0U/AQxS8ZCvmcHjVKTSFK9xRWkS5F5vAKVoI0ugxAGzb8F4we3xre+
 mvyLOqdPL9J5fKK7fBmEemwJBg4uj6n0VSqyQ8WC07Qo4hBFv49TOXBV2yPckx5iHxHB
 qpSQrkjK6P9mbNI8jis8hBksVUaUcZAiMJYskcfbwks9+mlCRqanhnG4BeinRs6gkhDZ
 E9iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=NHEmbvRk
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

SGkgSmFtZXMsCgpPbiBXZWQsIE9jdCAyMywgMjAyNCBhdCAyOjUx4oCvUE0gSmFtZXMgSGlsbGlh
cmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+IFdoaWNoIG1ha2VzIGhvdyB3
ZSBnZXQgdGhlIGRlcGVuZGVuY2llcyBsYXJnZWx5IHVuaW1wb3J0YW50IGFzIGxvbmcKPiBhcyB0
aGV5IHBhc3MgdGhlIGludGVncml0eSBjaGVja3MgQUZBSVUuCj4KPiBJdCBzZWVtcyBhbm90aGVy
IGFkdmFudGFnZSB0byB1c2luZyBodHRwczovL3Byb3h5LmdvbGFuZy5vcmcgaXMgdGhhdCBpdAo+
IHNpZ25pZmljYW50bHkgc3BlZWRzIHVwIGRvd25sb2Fkcy4KClJpZ2h0LCB0aGlzIHdhcyB3aHkg
SSB3YXMgcHJvcG9zaW5nIGFsbG93aW5nIHNldHRpbmcgR09QUk9YWSBnbG9iYWxseQp3aXRoIGEg
Y29uZmlndXJhdGlvbiBvcHRpb24uCgpJZiBwZW9wbGUgd2FudCB0byB1c2UgaXQgKHNob3VsZCBi
ZSB0aGUgZGVmYXVsdCwgZXZlbikgdGhlbgpCUjJfUEFDS0FHRV9HT19HT1BST1hZIGlzIHNldCB0
byBodHRwczovL3Byb3h5LmdvbGFuZy5vcmcuCgo+IFdoaWNoIGlzIHRyaWNreSBpbiB0aGlzIGNh
c2Ugc2luY2UgSSdtIG5vdCB1c2luZyB0aGUgbGF0ZXN0IHJlbGVhc2UgZHVlIHRvCj4gaXQgcmVx
dWlyaW5nIGdvbGFuZyAxLjIzLjAgd2hpbGUgd2Ugb25seSBoYXZlIDEuMjIuOC4KCkxldCdzIHVw
ZGF0ZSBHbyB0byAxLjIzLng/Cgo+ID4gT3IgZmVlbCBmcmVlIHRvIHBvc3QgdGhlIGlzc3VlIGhl
cmUgYW5kIHdlIGNhbiB0cnkgdG8gZmlndXJlIG91dCB3aHkgdGhlIGNoZWNrc3VtcyBhcmUgZmFp
bGluZy4KPgo+IFRoaXMgaXMgdGhlIGVycm9yOgo+IGdvOiBndmlzb3IuZGV2L2d2aXNvckB2MC4w
LjAtMjAyMzA5MjcwMDQzNTAtY2JkODYyODVkMjU5OiBpbnZhbGlkCj4gdmVyc2lvbjogdW5rbm93
biByZXZpc2lvbiBjYmQ4NjI4NWQyNTkKClRoYXQgaW5kZWVkIGxvb2tzIGxpa2UgdGhhdCBjb21t
aXQgd2FzIGRlbGV0ZWQgZnJvbSB0aGUgZ3Zpc29yIHJlcG9zaXRvcnkuCgpJc3N1ZTogaHR0cHM6
Ly9naXRodWIuY29tL2dvb2dsZS9ndmlzb3IvaXNzdWVzLzExMDg1CgpSZXByb2R1Y2U6CgpnaXQg
Y2xvbmUgLWIgdjAuMjkuMSBodHRwczovL2dpdGh1Yi5jb20vbmV0YmlyZGlvL25ldGJpcmQKY2Qg
bmV0YmlyZApleHBvcnQgR09QUk9YWT1kaXJlY3QKZ28gbW9kIHRpZHkKCkkgZ2V0IHRoZSBzYW1l
IGVycm9yIGFzIHlvdS4KCj4gPj4gQWxzbyB0aGVuIHdoYXQgZG8gd2UgZG8gd2hlbiBhIHBhY2th
Z2UgZGVwZW5kZW5jeSBpbmV2aXRhYmx5Cj4gPj4gYnJlYWtzIGFnYWluIGR1ZSB0byB0aGUgZG93
bmxvYWQgbG9jYXRpb24gYmVjb21pbmcgYnJva2VuLCBkbwo+ID4+IHdlIGp1c3Qga2VlcCBwYXRj
aGluZyB0aGUgcGFja2FnZSBvdmVyIGFuZCBvdmVyIGFnYWluIGV2ZXJ5IHRpbWUKPiA+PiBvbmUg
b2YgaXRzIGRlcGVuZGVuY2llcyBicmVha3M/Cj4gPgo+ID4KPiA+IFdoeSBpcyB0aGUgbG9jYXRp
b24gYnJlYWtpbmcgYXQgYWxsPy4uLgo+ID4KPiA+IEZvciB0aGlzIHB1cnBvc2Ugd2UgbWlycm9y
IHRvIHRoZSBidWlsZHJvb3QgbWlycm9yIHdpdGggYWxsIHRoZSBkZXBlbmRlbmNpZXMgdmVuZG9y
ZWQuCj4KPiBZZXMuLi5ob3dldmVyIHdlIHRyeSBub3QgdG8gcmVseSBvbiB0aGF0IGFzIGEgZmFp
bGluZyBkb3dubG9hZCBjb3VsZAo+IEFGQUlVIHRyaWdnZXIgYXV0b2J1aWxkZXIgZmFpbHVyZXMu
CgpUaGlzIHNob3VsZCBub3QgaGFwcGVuIGFzc3VtaW5nIHRoZSBjb21taXQgdGhhdCB3YXMgcmVm
ZXJlbmNlZCBpbiB0aGUKdmVyc2lvbiBzdHJpbmcgd2FzIGVpdGhlciBpbmNsdWRlZCBpbiBvbmUg
b2YgdGhlIGJyYW5jaGVzIG9mIHRoZQpyZXBvc2l0b3J5IG9yIGluIHRoZSBoaXN0b3J5IG9mIG9u
ZSBvZiB0aGUgZ2l0IHRhZ3MuCgpJIGd1ZXNzIHRoZSBjb21taXQgdGhleSByZWZlcmVuY2VkIGlu
IG5ldGJpcmQgd2FzIG5vdCBvbiBhbnkgb2YgdGhlIGJyYW5jaGVzCgpJdCdzIG9kZCBiZWNhdXNl
IEkgZG8gZmluZCB0aGUgY29tbWl0IG9uIEdpdEh1YjoKCmh0dHBzOi8vZ2l0aHViLmNvbS9nb29n
bGUvZ3Zpc29yL2NvbW1pdC9jYmQ4NjI4NWQyNTkyYTFkMWQzOTE1Yjc1YTE0ZDU0ZDNiMjQxYmIx
CgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
