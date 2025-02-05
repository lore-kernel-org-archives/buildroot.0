Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56026C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 22:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA854612DF;
	Wed,  5 Feb 2025 22:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k1pwF33P2kSE; Wed,  5 Feb 2025 22:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99C9C6178A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99C9C6178A;
	Wed,  5 Feb 2025 22:18:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38F4CE1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:18:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28BC04028C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:18:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1WwViDtnwAhk for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 22:18:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A11CE403EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A11CE403EB
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A11CE403EB
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 22:18:41 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3eb3c143727so730253b6e.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 14:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738793920; x=1739398720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ht5CYhgrjoJEg/PZPUhf+J5yEseNXB5tWanalxmdtfU=;
 b=LEruKGLWkK1CCaotyvNCBEXPHCn8aq6FX72VlFJYGr1mXQNZeACyOzTUe2H4q5guhX
 sx+/NIpKSMLLYzDJPZjjLdiFXA+FMXT16Cs1LnnG9LnGhqB4RKD8UMGXapS1MOxz9Rpl
 iPcH6ukshr8QhK5dbCFipLDjZh0w1ZpAptk7OzDk57pf+dg84xpnfoeyWKbdkYuq8vBz
 3FY1DeFwjG/XOgDCPsDPqE2KBKM94Oy8lHPEs/4h38KW9hSKkUAjx91Nx4eFhsLX2UI5
 EF6Q4nBcvo0Np9iQSETyx80uAuxOKqiKbtoVU+ivo+nqFIzqg5Tqbg/74qEXDhKO6Dap
 XGCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqyyTZXU43O3mSQpUPTQEQ2TUizr/eWpWx+75tI3OIjnzaws4hecMM48zNZB/ufQq9n/n+cyi66pI=@buildroot.org
X-Gm-Message-State: AOJu0Yy6BKSnUE1nGgZp2HXkYyknTMPWxLbEf2kNMWKNTRrdkQEeEdwf
 IMbX74fFcu4zF2XB1Y+9HL/FARdq0KK9OgXBw6I1PVAGZATW6tUWTDtT+VydJFLVnpPZo1VE4fK
 D
X-Gm-Gg: ASbGncvN5+JZVSsQ0t9d3RSTa0mYJI8pDlTf4CondeLJaCOkO4mSO1+aJg3lH+OKW4j
 V60O2HUjXNGZkQiFzArMfL9KCYcNMGDZGDb5fyCOc0IXE/ZUuVxVUclA5n6x0SehNJfXusdqQQx
 9M3ptUdQ2VUaP4QDUr6Q7u+nNDBfeZP9lRTHTeXMN/iQZ/vhE7X661P6F2tQ5dbOzLTjVFlUkX/
 4RqbccqLeHzOFw4Nz9KLtwshDMVOR50xBCboG6R155/o7yhFWeYGRvcbpPhkYO08kHRB3rDTCV5
 pNp6/i0g04mAWyVRTK9g6gmaw4z4qk/VkMwLEpa/lT0cKazQT1errsc=
X-Google-Smtp-Source: AGHT+IHh9fnZ844+AnT0Y9bGIWY/dm7NjxMhxNZj1SyIEBj6nVTa9GD1wplonxRr5uLoZfXt8bcB4w==
X-Received: by 2002:a05:6808:1511:b0:3f3:416c:4605 with SMTP id
 5614622812f47-3f386796a6amr717361b6e.8.1738793920369; 
 Wed, 05 Feb 2025 14:18:40 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
 [209.85.210.41]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3f333523f95sm3745787b6e.2.2025.02.05.14.18.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 14:18:39 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-724a5d04befso140858a34.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 14:18:39 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLrFzQNvb2j+FV4XUeyXzt3hjob8S8LmQ6LtPlzXSXJ/JAN1acmVyhUSsBnMdSe6KtMtaGHH/AJOY=@buildroot.org
X-Received: by 2002:a9d:620d:0:b0:71d:efeb:7c78 with SMTP id
 46e09a7af769-726ad79ebc2mr695832a34.14.1738793919423; Wed, 05 Feb 2025
 14:18:39 -0800 (PST)
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
In-Reply-To: <CADvTj4r1z1Y8cLZ45i1kJKgULiJMehBjR_OZ8oeWHw5jaj4+aA@mail.gmail.com>
Date: Wed, 5 Feb 2025 14:18:28 -0800
X-Gmail-Original-Message-ID: <CA+h8R2qWgHUg3qG6wn+Ox9pcn6y9NMWrbaQyYkdpgvv_FNweXw@mail.gmail.com>
X-Gm-Features: AWEUYZmq1S2WYkSJDc7sumL273uam29StGEWib-VoWIs5lmgAweEKsoxfKmn4vM
Message-ID: <CA+h8R2qWgHUg3qG6wn+Ox9pcn6y9NMWrbaQyYkdpgvv_FNweXw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738793920; x=1739398720; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ht5CYhgrjoJEg/PZPUhf+J5yEseNXB5tWanalxmdtfU=;
 b=KQhooQvj4XSBSF4GUjIoruNmn36HWLpmOTHAbDbDI9R/WAm3JzQ3avJLNwu1MeWOCx
 8RvXUfadHYuyhwjO97MOMkLemvt+d/g4A4xXHdqJGIxzXzDOE5Q/dsl7eUY2HB+zCRXW
 0fdIgRhk/q5+9jfTtGUUAu4PuqlNHcoQe9RTPkodw0xa+NIHMPhkdfNwj1YsSepdk2j3
 0+x3VFBURwnswDcK9FND6kwYBAn/YWRe+P6vz0w0SgqkBhs8CBTup4W9rCBBwCnkxyNm
 jhdncqvct9aSzuyRCm9OFiu7Xx+f11B6uMk62l1fvnSyaAiZB54AwbNPkZUqgX0RnEIB
 6ekw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=KQhooQvj
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiBXZWQsIEZlYiA1LCAyMDI1IGF0IDE6NTXigK9QTSBKYW1lcyBIaWxsaWFy
ZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+IFdlbGwgdGhhdCBhbmQg
dGhlIGZhY3QgdGhhdCBHT1BST1hZPWRpcmVjdCB3YXMgYnJva2VuIGluIHRoZSBmaXJzdCBwbGFj
ZQo+ID4gPiBpcyBhIHByZXR0eSBzdHJvbmcgaW5kaWNhdG9yIHVwc3RyZWFtIHByb2plY3RzIGRv
bid0IGNhcmUgYWJvdXQgaXQgbXVjaC4KPiA+Cj4gPiBUaGV5IGhhdmUgcmVwbGllZCB0byB5b3Vy
IFBSIHJlcXVlc3RpbmcgYW4gYWx0ZXJuYXRpdmUgc3RyYXRlZ3kgdG8KPiA+IGZpeGluZyB0aGUg
aXNzdWU6Cj4gPgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL25ldGJpcmRpby9uZXRiaXJkL3B1bGwv
MzI0MCNpc3N1ZWNvbW1lbnQtMjYzNzk1NjUzNwo+ID4KPiA+IEhlcmUgYXJlIHRoZSBuZXcgUFJz
IGltcGxlbWVudGluZyB3aGF0IHRoZXkgcmVxdWVzdGVkOgo+ID4KPiA+IC0gaHR0cHM6Ly9naXRo
dWIuY29tL25ldGJpcmRpby9uZXRiaXJkL3B1bGwvMzI4Nwo+ID4gLSBodHRwczovL2dpdGh1Yi5j
b20vbmV0YmlyZGlvL25ldGJpcmQvcHVsbC8zMjg4CgpPbmUgb2YgdGhlc2UgaXMgYWxyZWFkeSBt
ZXJnZWQsIGFuZCB0aGUgb3RoZXIgaXMgYmVpbmcgbG9va2VkIGF0IHJpZ2h0IG5vdy4KCkl0IGlz
IG5vdCBhcyBoYXJkIGFzIHlvdSBtYWtlIGl0IHNlZW0gdG8gZml4IHVwc3RyZWFtLgoKPiA+IFlv
dSBtYXkgbm90ZSB0aGF0IHRoZSBkZWZhdWx0IG9mIEdPUFJPWFkgaXM6Cj4gPgo+ID4gbmV0Ymly
ZCAlIGdvIGVudiBHT1BST1hZCj4gPiBodHRwczovL3Byb3h5LmdvbGFuZy5vcmcsZGlyZWN0Cj4g
Pgo+ID4gTm90ZSB0aGF0ICJkaXJlY3QiIGlzIHRoZSBzZWNvbmQgaW4gdGhlIGxpc3QsIHRoZSBm
YWxsYmFjayBpZiB0aGUKPiA+IHByb3h5IGRvZXMgbm90IHdvcmsuCj4KPiBJJ20gYXdhcmUgb2Yg
dGhlIGRlZmF1bHQgZmFsbGJhY2ssIEFGQUlVIGl0IGlzIHR5cGljYWxseSBvbmx5IHVzZWQgaWYK
PiBodHRwczovL3Byb3h5LmdvbGFuZy5vcmcgaXMgYnJva2VuL2Rvd24uIElNTyB3ZSBzaG91bGQg
dXNlIHRoZQo+IHNhbWUgZGVmYXVsdCBmb3IgR09QUk9YWSBiZWNhdXNlIHRoZXJlIGlzIG5vIGdv
b2QgcmVhc29uCj4gbm90IHRvIGRvIHNvLgoKSSBoYXZlIGxpc3RlZCB0aGUgZ29vZCByZWFzb25z
IGVhcmxpZXIgaW4gdGhpcyB0aHJlYWQuCgpTZWUgbGF0ZXIgaW4gdGhpcyBtYWlsLi4uCgo+ID4g
SWYgdGhlIGRlZmF1bHQgd2VyZSB0aGUgcHJveHkgd2l0aG91dCB0aGUgImRpcmVjdCIgcGFydCBp
dCB3b3VsZCBiZQo+ID4gdHJ1ZSB0aGF0ICJ0aGUgcmVzdCBvZiB0aGUgZ29sYW5nIGVjb3N5c3Rl
bSIgZG9lcyBub3QgdXNlCj4gPiBHT1BST1hZPWRpcmVjdC4KPgo+IFdoZW4gSSdtIHNheWluZyB0
aGUgZWNvc3lzdGVtIGRvZXMgbm90IHVzZSBHT1BST1hZPWRpcmVjdCwKPiBJJ20gcmVmZXJyaW5n
IHNwZWNpZmljYWxseSB0byBkaXNhYmxpbmcgdGhlIGNhY2hpbmcgcHJveHkgc3BlY2lmaWNhbGx5
LgoKUGxlYXNlIHByb3ZpZGUgZXZpZGVuY2UgZm9yIHRoaXMgY2xhaW0uCgo+ID4gRG8geW91IGhh
dmUgYW55IGV4YW1wbGVzIG9mIHRoZXNlIGJyZWFrYWdlcyBzbyBmYXI/IFdlIHVzZSBhIG51bWJl
ciBvZgo+ID4gR28gcGFja2FnZXMgaW4gQnVpbGRyb290IGV4dGVuc2l2ZWx5IGFscmVhZHkgdG9k
YXksIGxpa2UgZG9ja2VyLWVuZ2luZQo+ID4gYW5kIGRvY2tlci1jbGkuCj4KPiBJIGhhdmVuJ3Qg
c2VlbiBhbnkgc3BlY2lmaWNhbGx5LCBidXQgYmFzZWQgb24gdGhlIGJ1aWxkIGZhaWx1cmVzCj4g
SSd2ZSBzZWVuIHdoZW4gYXR0ZW1wdGluZyB0byB1c2UgR09QUk9YWT1kaXJlY3QgaXQncyBjbGVh
cmx5Cj4gYW4gaXNzdWUgd2Ugd291bGQgZXZlbnR1YWxseSBzdGFydCBydW5uaW5nIGludG8uCgpJ
dCBoYXNuJ3QgaGFwcGVuZWQgYXQgYWxsIHlldCBhZnRlciBhIHBhY2thZ2Ugd2FzIG1lcmdlZCwg
dGhlbi4KCj4gPiBHaXZlbiB0aGUgdHJhZGVvZmZzIHdlIGhhdmUgZGlzY3Vzc2VkIGJldHdlZW46
Cj4gPgo+ID4gLSAiYWx3YXlzIHJlcXVpcmUgdGhlIEdvb2dsZSBwcm94eSIgYW5kCj4gPiAtICJm
aXggbWlzbWF0Y2hlcyBhdCBwYWNrYWdlIGFkZC91cGRhdGUgdGltZSwgbWlycm9yIGlmIGRlcGVu
ZGVuY2llcwo+ID4gYXJlIHVuYXZhaWxhYmxlIGxvbmctdGVybSIKPiA+Cj4gPiBUaGVyZSBpcyBp
bnN1ZmZpY2llbnQgZXZpZGVuY2UgdGhhdCB0aGUgbWlycm9yaW5nIHBhcnQgaXMgc3VjaCBhCj4g
PiBtYWludGVuYW5jZSBidXJkZW4gdGhhdCB3ZSBtdXN0IGdvIHdpdGggb3B0aW9uIDEgaGVyZS4K
PiA+Cj4gPiA+IFRoZXJlJ3Mgb25seSBkb3duc2lkZXMgdG8gdXNpbmcgR09QUk9YWT1kaXJlY3Qg
aW4gYnVpbGRyb290IGZyb20KPiA+ID4gd2hhdCBJIGNhbiB0ZWxsLCBJIGNhbid0IGV2ZW4gdGhp
bmsgb2YgYSBzaW5nbGUgcmVhbCB3b3JsZCBiZW5lZml0Lgo+ID4KPiA+IFVwc2lkZXM6Cj4gPgo+
ID4gLSBObyBkZXBlbmRlbmN5IG9uIGEgdGhpcmQtcGFydHkgcHJveHkgc2VydmljZQo+Cj4gQXMg
eW91IG1lbnRpb25lZCBhYm92ZSwgcmVtb3ZpbmcgdGhlIEdPUFJPWFk9ZGlyZWN0IG92ZXJyaWRl
Cj4gd291bGQgbm90IG1ha2UgdGhlIHByb3h5IHNlcnZlciBhIGhhcmQgZGVwZW5kZW5jeSwgYnV0
IHdvdWxkCj4gc2ltcGx5IG1hZGUgZGlyZWN0IGRvd25sb2FkcyBhIGZhbGxiYWNrLCBzbyB0aGlz
IGlzbid0IGFuIHVwc2lkZQo+IGluIHRoZSByZWFsIHdvcmxkLgoKSSBkbyBub3QgdW5kZXJzdGFu
ZCB3aGF0IHlvdSBtZWFuIGJ5IHRoaXMgc2VudGVuY2UuCgo+IE9uZSBjYW4gc3RpbGwgZml4IEdP
UFJPWFk9ZGlyZWN0IGluIHVwc3RyZWFtIHByb2plY3RzIGVpdGhlciB3YXksCj4gYnV0IEkgc2Vl
IG5vIHJlYXNvbiBmb3IgaXQgdG8gYmUgYSBoYXJkIHJlcXVpcmVtZW50IGluIGJ1aWxkcm9vdC4K
Pgo+IEVpdGhlciB3YXkgdXNpbmcgdGhlIHByb3h5IGNhY2hlIGRyYXN0aWNhbGx5IHJlZHVjZXMg
dGhlIG51bWJlciBvZgo+IHNlcnZpY2VzIHRoYXQgbXVzdCBiZSBhdmFpbGFibGUgZm9yIGEgcGFj
a2FnZSB0byBkb3dubG9hZCBzdWNjZXNzZnVsbHkuCj4KPiBXaGF0IHVwc2lkZSBpcyB0aGVyZSB0
byBhdm9pZGluZyB0aGlzIGRlcGVuZGVuY3kgd2hlbiB0aGUgYWx0ZXJuYXRpdmUKPiBpcyB3YXkg
d2F5IHdvcnNlPwoKSSB1bmRlcnN0YW5kIHlvdXIgdGhpbmtpbmcgb24gaXQgYnV0IGZpeGluZyB0
aGluZ3MgYXQgbWVyZ2UgdGltZSBzbwp0aGF0IHdlIGNhbiBidWlsZCB3aXRob3V0IHRoZSBHb29n
bGUgcHJveHkgaXMgbm90IGltcG9zc2libGUgbm9yIGFzCmRpZmZpY3VsdCBhcyB5b3UgbWFrZSBp
dCBzZWVtLgoKPiA+IC0gQWJpbGl0eSB0byBidWlsZCB3aXRoIEdPUFJPWFk9ZGlyZWN0IGZvciB0
aG9zZSB0aGF0IHJlcXVpcmUgaXQKPiA+IChvdGhlcndpc2UgQnVpbGRyb290IGJyZWFrcyBmb3Ig
dGhlbSBvbiBkZWZhdWx0KQo+Cj4gV2hvIGFjdHVhbGx5IHJlcXVpcmVzIGl0PyBJIHRoaW5rIHJl
cXVpcmluZyBHT1BST1hZPWRpcmVjdCBpcyBhbgo+IGV4dHJlbWVseSBuaWNoZSB1c2UgY2FzZSB0
aGF0J3Mgbm90IHJlYWxseSBldmVuIGEgcHJhY3RpY2FsIHJlcXVpcmVtZW50LgoKSWYgSSBzZXQg
IkdPUFJPWFk9ZGlyZWN0IiBhbmQgcnVuIGEgQnVpbGRyb290IGJ1aWxkIEkgd291bGQgZXhwZWN0
IGl0IHRvIHBhc3MuCgpLbm93aW5nbHkgbWVyZ2luZyBwYWNrYWdlcyB0aGF0IGhhdmUgbWlzbWF0
Y2hlcyBiZXR3ZWVuIEdpdCBhbmQKR09QUk9YWSBzZWVtcyBsaWtlIGEgbWlzdGFrZS4KCj4gPiAt
IElmIGdvLm1vZCBzYXlzICJmb28vYmFyIGF0IHZlcnNpb24gdjEuMC4wIiB0aGVuIHdlIGNhbiBi
ZSBzdXJlIHRoZQo+ID4gR2l0IHRhZyB2MS4wLjAgbWF0Y2hlcyB0aGUgZ28uc3VtLgo+Cj4gSWYg
dGhlIGhhc2ggbWF0Y2hlcyB3ZSBrbm93IHdlIGhhdmUgdGhlIHJpZ2h0IGRlcGVuZGVuY3ksIHRo
YXQncwo+IGFsbCB0aGF0IHdlIHJlYWxseSBjYXJlIGFib3V0IGhlcmUgb3RoZXIgdGhhbiBiZWlu
ZyBhYmxlIHRvIGRvd25sb2FkCj4gdGhlIGRlcGVuZGVuY2llcyByZWxpYWJseS4KClllcyBhbmQg
bm8uIFRoYXQgbWF5IGJlIGFsbCB5b3UgY2FyZSBhYm91dCBhcyBzb21lb25lIHdhbnRpbmcgdG8g
c2hpcCBwYWNrYWdlcy4KCj4gPiBEb3duc2lkZXM6Cj4gPgo+ID4gLSBTbG93ZXIgZmV0Y2ggKGdp
dCBwdWxsIGluc3RlYWQgb2YgcHJveHkuZ29sYW5nLm9yZykKPiA+IC0gV2UgbmVlZCB0byBtaXJy
b3IgcGFja2FnZXMgaWYgdGhlaXIgZGVwZW5kZW5jaWVzIGdvIGF3YXkgKG1vc3QgYXJlCj4gPiBv
biBHaXRIdWIsIHRob3VnaCkKPiA+Cj4gPiBXaGVuIHJlcXVlc3RpbmcgdGhhdCB1cHN0cmVhbSBw
cm9qZWN0cyBmaXggdGhlIGJ1aWxkIHdpdGgKPiA+IEdPUFJPWFk9ZGlyZWN0IGl0IGhlbHBzIHRv
IG1lbnRpb24gd2h5IGluIHRoZSBQUiBkZXNjcmlwdGlvbi4KPgo+IEkgZ3Vlc3MgSSBzaG91bGQg
bWVudGlvbiBzb21ldGhpbmcgbGlrZSB3ZSBuZWVkIHRvIGZpeCB0aGlzIGJlY2F1c2UKPiBidWls
ZHJvb3QgdXNlcyBiYWQgR09QUk9YWSBkZWZhdWx0cyBzaW5jZSB3ZSBsaWtlIGRvaW5nIGxvdHMg
b2YKPiBleHRyYSB3b3JrIGZvciBubyBwcmFjdGljYWwgcmVhc29uPwoKWW91IGtlZXAgc2F5aW5n
ICJubyBwcmFjdGljYWwgcmVhc29uIiBidXQgd2UgY2xlYXJseSBoYXZlIHVwc2lkZXMgYW5kCmRv
d25zaWRlcyBoZXJlLgoKVGhhbmtzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
