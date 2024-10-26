Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F883D10BE4
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 05:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FB57408F0;
	Sat, 26 Oct 2024 05:00:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11MnBIzDeoXx; Sat, 26 Oct 2024 05:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C1740BC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17C1740BC3;
	Sat, 26 Oct 2024 05:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C81C2318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4711140BB3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aO_CCyJLhYPK for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 05:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c34; helo=mail-oo1-xc34.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1173D408F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1173D408F0
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1173D408F0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 05:00:07 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-5ebc0dbc65dso1571733eaf.1
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729918807; x=1730523607;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTxQiSDXnHlMml/RLT8C2xa5ZTxDuLfV7D3jGhrFmxw=;
 b=FIFP3OG2vg+Hp2u3F2kAW+fzsUdoD9IBON9JTcDv6M/n2YOKKK0KpNQiB3jZUv4kK0
 oUYGVC3z5YLHpfIOGER5uGxup23e7DmG9mipn+YelxnTdJVV9j/lNbPZu0nqUArx1hfa
 /0svUQ7kSd6tbiPFwZ8QVKrPpwXT2/8KNs/KLNqkkl0aLreuVyHHdZeo4RJ7PD23pSpt
 NXaW7yZ7Gr3ZXcIRKYutbLh0wS0kqHLRnFhRTtCdLagR+2tjwSu/5lIjqsFGvp4ShlBX
 U7sg6D4s3VuN4SAtVId78YGwNXcmIDkSHkYdUrO4HuZPGPfeZqBKCal6hViKWPKCwyin
 glrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcn11y5+5P+nDuEc3GIbmZl9Aure6ygDCJbha+pUMoLtsj+jfdDj3SzDHHNeJ8SKbec4ghJp4u0BQ=@buildroot.org
X-Gm-Message-State: AOJu0Yz5MtMaTbB6UNA2hfzs20pxipo6BOOuIb3Bc7+xRDZQ0GVVqmPa
 ypAXWlr/uPLAVOwHVv7foU0JP54H/jpAOTq6IP68AnbxlM7wLAeByUgBCIAs3Zt1ncvZoKVUSX4
 j
X-Google-Smtp-Source: AGHT+IGYxLIcZYQ1+Nt5u3E1gXwhQdM0IWTpBByKsXCVkhCrn+eKlCYkjHRQOZfTHRAsl8I7Uf+2qQ==
X-Received: by 2002:a05:6820:1ca2:b0:5eb:b282:5916 with SMTP id
 006d021491bc7-5ec23a8d4c4mr1031118eaf.7.1729918806794; 
 Fri, 25 Oct 2024 22:00:06 -0700 (PDT)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com.
 [209.85.161.51]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5ec186fcbb0sm578571eaf.32.2024.10.25.22.00.06
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 22:00:06 -0700 (PDT)
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-5ebc04d495aso1525190eaf.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 22:00:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW9FEii211nfgMzDuh3x1eW9ocOv+xpnLS8a1SEYL5CIY5R4sR/FLVtfu2wGKsINJaJDIOT4xJVNik=@buildroot.org
X-Received: by 2002:a05:6870:8087:b0:287:481:13aa with SMTP id
 586e51a60fabf-29051dc5dfamr1290337fac.45.1729918805857; Fri, 25 Oct 2024
 22:00:05 -0700 (PDT)
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
 <CA+h8R2p+qPYJj1j2_gpcmBtJK3e1qW8h6mzTiwiSFv_4kOf8Ww@mail.gmail.com>
In-Reply-To: <CA+h8R2p+qPYJj1j2_gpcmBtJK3e1qW8h6mzTiwiSFv_4kOf8Ww@mail.gmail.com>
Date: Fri, 25 Oct 2024 21:59:54 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pZG=KbYpGCszNNcWF+PaOW=Cp3YohWv7jfC_5H-Vy-HQ@mail.gmail.com>
Message-ID: <CA+h8R2pZG=KbYpGCszNNcWF+PaOW=Cp3YohWv7jfC_5H-Vy-HQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1729918807; x=1730523607; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTxQiSDXnHlMml/RLT8C2xa5ZTxDuLfV7D3jGhrFmxw=;
 b=oLW38ip5BVOcjUcITTlUCBdRNeTIi68K1LqTev6T7KPlWELWkLFrEzwjEfDrRWgUX8
 fitKUFx+Kkal3o93cfC3P7IhshWGYcsWGniIzmHzqgnqq3vutvyHFSbW0jiHA16zsTTG
 SwdmEt0YfDTghgM8xtbsmBHNCddgknCbCw/aV/XexguYSbelh9WzZcN9Ps8h7iwqLpJS
 cPG/jWvAs8+shvaEFoB7FLt1L25JMl7baMBFM4naaQvuFUH6cknSF2uq4M8VU+Pmdook
 o/HbqNpg8go8AR2mFcH2E1HRQDpEMc2WxH9Wl2isEVvawZaTORuTGp/dXZn/LcuPJHmD
 EExA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=oLW38ip5
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

SGkgSmFtZXMsCgpPbiBGcmksIE9jdCAyNSwgMjAyNCBhdCA5OjU44oCvUE0gQ2hyaXN0aWFuIFN0
ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IE9u
IEZyaSwgT2N0IDI1LCAyMDI0IGF0IDE6MTHigK9QTSBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0
aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPiA+IE9uIFdlZCwgT2N0IDIzLCAyMDI0IGF0IDI6NTHi
gK9QTSBKYW1lcyBIaWxsaWFyZAo+ID4gPiBXaGljaCBpcyB0cmlja3kgaW4gdGhpcyBjYXNlIHNp
bmNlIEknbSBub3QgdXNpbmcgdGhlIGxhdGVzdCByZWxlYXNlIGR1ZSB0bwo+ID4gPiBpdCByZXF1
aXJpbmcgZ29sYW5nIDEuMjMuMCB3aGlsZSB3ZSBvbmx5IGhhdmUgMS4yMi44Lgo+ID4KPiA+IExl
dCdzIHVwZGF0ZSBHbyB0byAxLjIzLng/Cj4KPiBJIHNlbnQgYSBwYXRjaCBmb3IgdGhpczoKPgo+
IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAy
NDEwMjYwNDU0MjEuNDQ4MjMtMS1jaHJpc3RpYW5AYXBlcnR1cmUudXMvCj4KPiA+ID4gPiBPciBm
ZWVsIGZyZWUgdG8gcG9zdCB0aGUgaXNzdWUgaGVyZSBhbmQgd2UgY2FuIHRyeSB0byBmaWd1cmUg
b3V0IHdoeSB0aGUgY2hlY2tzdW1zIGFyZSBmYWlsaW5nLgo+ID4gPgo+ID4gPiBUaGlzIGlzIHRo
ZSBlcnJvcjoKPiA+ID4gZ286IGd2aXNvci5kZXYvZ3Zpc29yQHYwLjAuMC0yMDIzMDkyNzAwNDM1
MC1jYmQ4NjI4NWQyNTk6IGludmFsaWQKPiA+ID4gdmVyc2lvbjogdW5rbm93biByZXZpc2lvbiBj
YmQ4NjI4NWQyNTkKPiA+Cj4gPiBUaGF0IGluZGVlZCBsb29rcyBsaWtlIHRoYXQgY29tbWl0IHdh
cyBkZWxldGVkIGZyb20gdGhlIGd2aXNvciByZXBvc2l0b3J5Lgo+ID4KPiA+IElzc3VlOiBodHRw
czovL2dpdGh1Yi5jb20vZ29vZ2xlL2d2aXNvci9pc3N1ZXMvMTEwODUKPgo+IEFjY29yZGluZyB0
byB0aGUgZGlzY3Vzc2lvbiBpbiB0aGF0IGlzc3VlLCB0aGUgY29tbWl0IHdhcyBkZWxldGVkIGZy
b20KPiBndmlzb3IgYmVjYXVzZSBpdCBjb250YWluZWQgbGFyZ2UgYmluYXJ5IGZpbGVzLiBUaGV5
IHdlcmUgdHJpbW1pbmcKPiBkb3duIHRoZSByZXBvIHNpemUuCgpodHRwczovL2dpdGh1Yi5jb20v
bmV0YmlyZGlvL25ldGJpcmQvcHVsbC8yNzg5CgpUaGVyZSBpcyBub3cgYSBQUiBhZ2FpbnN0IG5l
dGJpcmQgdG8gdXBkYXRlIGd2aXNvciBhbmQgZml4IHRoaXMuCgpUaGV5IHJlZmVycmVkIHRvIG15
IG9yaWdpbmFsIGlzc3VlIEkgZmlsZWQgYWdhaW5zdCBndmlzb3IsIHNvIHRoaXMgaXMKZ29vZCBl
dmlkZW5jZSB0aGF0IHJlcG9ydGluZyB0aGlzIHR5cGUgb2YgaXNzdWUgdG8gdXBzdHJlYW0gcmVw
b3MKYWN0dWFsbHkgZG9lcyBsZWFkIHRvIGEgcHJvbXB0IGZpeC4KClRoYW5rcyAmIGJlc3QgcmVn
YXJkcywKQ2hyaXNpdGFuIFN0ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
