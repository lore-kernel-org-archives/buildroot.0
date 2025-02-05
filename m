Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F975C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 17:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A37E581233;
	Wed,  5 Feb 2025 17:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IJnqMkTtui7Y; Wed,  5 Feb 2025 17:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BE7A81136
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BE7A81136;
	Wed,  5 Feb 2025 17:56:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A2BCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 17:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA69141423
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 17:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3LCeOcHkPCOc for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 17:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD0B541499
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD0B541499
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD0B541499
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 17:56:35 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2b804e5f43cso599712fac.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 09:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738778194; x=1739382994;
 h=content-transfer-encoding:cc:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4NpIci+8wXwuNkxZzA2hI4k+YhD+eGIlkWBNOy+8Sw=;
 b=JaGLksJUu/Zdt0dbvjUiQx7sTghqcKeW8G4FgEAzKfc5YBl8A/0BGKEv+tSVv+uPDl
 TZQIUF+RtF+JTbtrIIknPE3PeN9cgvooScoXO+T5qaG35y282ILpmcv6NNOamNJ2OMFy
 VhrHWiK2tkr+ovwQQt5Kf+pQ8b+850RQVGs9PZS4MbMaVExoBkrEn4coLfcVEfVjZm0y
 +xMhACz+juO4yZ5DYCrQCyW36px3sboOWFG1jYxHw3I2aJPosPXNo5kckori3BkRKBvt
 i91cByAkkAPwPHaJHSekCZ3hcMrD/pSkVT8K082f/1cmjt6ftfo7DKMSIoNIzar/2Fj1
 mtaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0NVawku+s5ytH78xHLvVmRwI+v7VOUSziAiABSmxSyZDywKZkYnakad7yEjdIvKlvVhX7e/Dtce4=@buildroot.org
X-Gm-Message-State: AOJu0Yxvo8zAfl2bkiO2kyOUiTsulnkaLlytPOLutY+/ffVvx8J9f5HZ
 DpG0VzQVTSe12BdBui4vI1E7D+8vX6T8nsiMUaxjtqBUnmyk+9bBZqBmklxF6tmExbixJldqIJ0
 p
X-Gm-Gg: ASbGncuGLgY7nNZWYMpq33ExcygxlYU7pAu8rlUkJ4MnPQhLsNmUCXBJK99o83Ey75F
 OCuIFugXtqu/t9yCYUhwfdRoihgP/2Q+BHtxXiMgsAG6hjbG/AEVNZvcC9DCHkG/4hY2NYFZ2nz
 Zae2TXK2QE1zjE3rYTJfUZI+2BEuOaR7bqXmmgfj83K72/E7inJXCfOPBmjOE3Ge8l46pLt2Z3L
 Z6DvgXdeIiNv5e83iAzSFW76zaguul5khs0Pgh1F9s+HPvagZrvaPP3YezYCqG+M8Hnc9c1R9BM
 sUvFgOxsOa/UbSSkN/T+PN36puh1AwJobrsN2EcZ9tP+SVBDR5wjUxo=
X-Google-Smtp-Source: AGHT+IEC+tS5uN06JGjpGWSd8TkDIcb98ky7vEwjh3m+K0q6VDcKNYOweIksb0Vxi0vNdLUsuRId6g==
X-Received: by 2002:a05:6870:e243:b0:29e:68ba:7156 with SMTP id
 586e51a60fabf-2b804f6f795mr2669342fac.13.1738778194366; 
 Wed, 05 Feb 2025 09:56:34 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com.
 [209.85.160.46]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b3561a2e03sm4756257fac.12.2025.02.05.09.56.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 09:56:33 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2b804e5f43cso599699fac.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 09:56:33 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVLgWXH2eMhs9AukgN7xTcriK4OD1IZwLahVsSqksWcIFXfZS3ZM+ZovxgD0iEa5NJpx0G4v6JGAkc=@buildroot.org
X-Received: by 2002:a05:6870:ea06:b0:29e:671b:6019 with SMTP id
 586e51a60fabf-2b8051557e5mt2802341fac.31.1738778193491; Wed, 05 Feb 2025
 09:56:33 -0800 (PST)
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
In-Reply-To: <CADvTj4r5ZAFkyqMctj4fV=vnkqDn2g+oG3g2PjTHJKSkVLQNVQ@mail.gmail.com>
Date: Wed, 5 Feb 2025 09:56:22 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pup4sse2R-6oMV0=uKL6WyV3o6fyerQeYopv57ZJWCVA@mail.gmail.com>
X-Gm-Features: AWEUYZl0M3TTszqRLIJDeIcsxNmqsQGlQNfOUOF0DkPk8wa658lQL0Ox9qMheuo
Message-ID: <CA+h8R2pup4sse2R-6oMV0=uKL6WyV3o6fyerQeYopv57ZJWCVA@mail.gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christian Stewart via buildroot <buildroot@buildroot.org>,
 Anisse Astier <anisse@astier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738778194; x=1739382994; darn=buildroot.org;
 h=content-transfer-encoding:cc:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4NpIci+8wXwuNkxZzA2hI4k+YhD+eGIlkWBNOy+8Sw=;
 b=yV2ml6leQKWRQhOOeIfNOhqvumhgNeFvHHVvdQQBTB6DULDDv16GuHGVGYnDaEFbsi
 BNOos8+np5/tjJQHDT9sNkq477KkWkHuTglUavyWBAl27kS6EvxmZWHegMfyBmBZ9QOd
 9983cQ5VbwbdweUpYI841mKv0TK8q6R1DCg02TVHH0KXo6s+7Sy3WL3jgsMBfnuLGtCr
 gAli95pIAND5pSWY3ouM74NSIyh81w2vwJmMMF+vM4T8KYapGPFxMq08Q6QcqlFs4hqB
 ZTIPs6ZaQ/ZTkRsQ2ZLjbSyKK5129hcuVOsfjiHYymTJzBSR/cfYyOoTKTuYqIbmL0ts
 0ahA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=yV2ml6le
Subject: [Buildroot] Fwd: [PATCH v4 1/2] package/pkg-golang.mk: allow
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

SGkgSmFtZXMsIEFybm91dCwKCkkgd291bGQgbGlrZSB0byBhZGQgdGhhdCB0aGVyZSBpcyBhbiBv
cGVuIGlzc3VlIHdoZXJlIHRoZSBnb2RvY3MKd2Vic2l0ZSBpcyBkaXNwbGF5aW5nIHRoZSBjYWNo
ZWQgcHJveHkgdmVyc2lvbiBhbmQgbm90IHRoZSBHaXRIdWIKdmVyc2lvbiwgd2hpY2ggaXMgY29u
c2lkZXJlZCBhbm90aGVyIHBvdGVudGlhbCBtYWx3YXJlIHZlY3Rvci4KCk9wZW4gaXNzdWUgd2l0
aCBhY3Rpdml0eSBpbiB0aGUgbGFzdCBjb3VwbGUgZGF5czoKCmh0dHBzOi8vZ2l0aHViLmNvbS9n
b2xhbmcvZ28vaXNzdWVzLzY2NjUzI2lzc3VlY29tbWVudC0yNjM2MzU4NDAxCgpPbiBXZWQsIEZl
YiA1LCAyMDI1IGF0IDY6MDLigK9BTSBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4gd3JvdGU6Cj4gT24gV2VkLCBGZWIgNSwgMjAyNSBhdCAyOjUx4oCvUE0gQ2hyaXN0
aWFuIFN0ZXdhcnQgPGNocmlzdGlhbkBhcGVydHVyZS51cz4gd3JvdGU6Cj4gPiBCZWxvdyBJIG1l
bnRpb24gYSBwb3RlbnRpYWwgc2VjdXJpdHkgaXNzdWUgd2hlcmUgc29tZW9uZSB1cGxvYWRzIGEg
bWFsaWNpb3VzIHBhY2thZ2UgdmVyc2lvbiB0byB0aGUgcHJveHkgYW5kIHRoZW4gY2hhbmdlcyB0
aGUgZ2l0IHRhZyB0byByZW1vdmUgdGhlIG1hbHdhcmUuIEluIHRoaXMgYXR0YWNrIG1vZGUgdGhl
IG1haW50YWluZXJzIG1pZ2h0IGNoZWNrIHRoZSBnaXQgdGFnLCBzZWUgbm8gbWFsd2FyZSwgYW5k
IGFkZCBhIHBhY2thZ2Ugd2l0aCB0aGF0IHRhZy4KPiA+Cj4gPiBUaGUgcHJvYmxlbSBpcyB0aGF0
IEdvIGZldGNoZXMgZnJvbSBHT1BST1hZIGFuZCBzaWxlbnRseSBpZ25vcmVzIHRoZSBtaXNtYXRj
aC4KPgo+IEFzIGl0IHNheXMgaW4gdGhlIGFydGljbGUgdGhpcyBpcyBob3cgaXQncyBkZXNpZ25l
ZCB0byB3b3JrOgo+Cj4gIkdvIG1vZHVsZXMgYXJlIGludGVudGlvbmFsbHkgaW1tdXRhYmxlIG9u
Y2UgcHVibGlzaGVkIGFuZCBmZXRjaGVkIGJ5Cj4gdGhlIHByb3h5IFtzbmlwXQoKQ29ycmVjdCwg
YnV0IHRoaXMgY2FuIGxlYWQgdG8gYSBzZWN1cml0eSBpc3N1ZSB3aGVuIHRoZSBjb2RlIGluIHRo
ZQpwcm94eSBpcyBtYWxpY2lvdXMuCgo+ID4gVGhpcyB3YXMgdGhlIHJlYXNvbiB3aHkgSSBoYXZl
IGFsd2F5cyBsb2JiaWVkIHRvIGtlZXAgdGhlIGRlZmF1bHQgYXMgR09QUk9YWT1kaXJlY3QgaW4g
YnVpbGRyb290LCBhcyB0aGlzIGF2b2lkcyB0aGUgY2FzZSB3aGVyZSB0aGUgZ2l0IHJlcG8gbWlz
bWF0Y2hlcyB0aGUgcHJveHkgd2l0aG91dCB2aXNpYmlsaXR5IGF0IHRoZSBnaXQgbGV2ZWwuCj4K
PiBBcyBpdCBzYXlzIGluIHRoZSBhcnRpY2xlOgo+Cj4gIldoaWxlIGltbXV0YWJpbGl0eSBjYW4g
YmUgYWJ1c2VkIGJ5IG1hbGljaW91cyBhY3RvcnMg4oCUIGFsbG93aW5nCj4gaGFybWZ1bCBjb2Rl
IHRvIHBlcnNpc3Qgb25jZSBjYWNoZWQg4oCUIGl0IHJlbWFpbnMgYSBuZXQgc2VjdXJpdHkKPiBi
ZW5lZml0LiBTaW5jZSB0aGUgR28gbW9kdWxlIHN5c3RlbSBpcyBmdW5jdGlvbmluZyBhcyBpbnRl
bmRlZCwgYW5kCj4gdGhpcyBpcyBub3QgYSBzZWN1cml0eSB2dWxuZXJhYmlsaXR5LCB0aGVyZSBp
cyBubyBwYXRjaCBvciBzd2l0Y2ggdG8KPiB0dXJuIG9mZiBpbW11dGFiaWxpdHk7IGluc3RlYWQs
IGRldmVsb3BlcnMgbXVzdCByZWNvZ25pemUgdGhhdCBvbmNlIGEKPiBtYWxpY2lvdXMgdmVyc2lv
biBpcyBwdWJsaXNoZWQsIGl0IHdpbGwgcmVtYWluIG1hbGljaW91cyBpbiB0aGUKPiBjYWNoZS4i
CgpZZXMuIEJ1dCBpdCBpcyBub3QgYWNjZXB0YWJsZSBmb3IgdXMgdG8gc2hpcCBtYWxpY2lvdXMg
Y29kZS4KCkNvZGUgaW4gdGhlIHByb3h5IG1pc21hdGNoaW5nIHRoZSBjb2RlIGRvd25sb2FkZWQg
d2l0aCBHT1BST1hZPWRpcmVjdAppcyBhIGdvb2QgaW5kaWNhdG9yIHRoYXQgc29tZXRoaW5nIHN1
c3BpY2lvdXMgaXMgZ29pbmcgb24gYW5kIHdvcnRoCmZ1cnRoZXIgaW52ZXN0aWdhdGlvbi4KCj4g
U28gaXQncyBlZmZlY3RpdmVseSBleHBlY3RlZCB0aGF0IGdvIHBhY2thZ2VzIHVzZSB0aGUgY2Fj
aGUgYXMKPiBHT1BST1hZPWRpcmVjdCBpcyBhbiB1bnVzdWFsIG5vbi1kZWZhdWx0IGNvbmZpZ3Vy
YXRpb24gdGhhdCBzaW1wbHkKPiBicmVha3MgYnVpbGRzIGZvciBtYW55IG5vbi1tYWxpY2lvdXMg
cmVhc29ucyhkZWFkIHVybHMgZm9yIGV4YW1wbGUpLgoKVGhlIHByb3h5IGlzIGFuIG9wdGltaXph
dGlvbiwgbm90IGEgc291cmNlIG9mIHRydXRoLgoKPiBEaXN0cmlidXRpb25zIGxpa2UgYnVpbGRy
b290IGFyZSBub3QgdHlwaWNhbGx5IGF1ZGl0aW5nIHBhY2thZ2UKPiBkZXBlbmRlbmNpZXMgaW4g
YSB3YXkgdGhhdCB3b3VsZCBjYXRjaCB0aGVzZSBzb3J0IG9mIGF0dGFja3MgZWl0aGVyCj4gd2F5
LCBhdWRpdGluZyBkZXBlbmRlbmNpZXMgd291bGQgcG90ZW50aWFsbHkgYmUgc29tZXRoaW5nIHRo
YXQKPiB1cHN0cmVhbSBwYWNrYWdlIG1haW50YWluZXJzIHdvdWxkIHdhbnQgdG8gZG8KCklmIHRo
ZSBjb2RlIG1pc21hdGNoZXMgdGhlIEdpdEh1YiB0YWcgdGhlcmUgaXMgYSBnb29kIHNpZ24gc29t
ZXRoaW5nIGlzIG9mZi4KCj4gSWYgd2UgaGF2ZSBhIGdvIHBhY2thZ2UgaW4gYnVpbGRyb290IHRo
YXQgd2Uga25vdyB3b24ndCBidWlsZAo+IHdpdGggR09QUk9YWT1kaXJlY3QgdGhlbiBJIGRvbid0
IHNlZSBob3cgd2UgY2FuIHBvc3NpYmx5IGRlZmF1bHQgdG8KPiB1c2luZyBHT1BST1hZPWRpcmVj
dCBhcyB0aGF0IHdvdWxkIG9idmlvdXNseSByZXN1bHQgaW4gZmFpbGVkIGJ1aWxkcy4KCklmIGl0
IGRvZXNuJ3QgYnVpbGQgd2l0aCBHT1BST1hZPWRpcmVjdCB3ZSBkbyBub3Qgc2hpcCB0aGF0IHZl
cnNpb24uCgpJbnN0ZWFkIHdlIGNhbiBmaWxlIGEgR2l0SHViIGlzc3VlIHdpdGggdGhlIHVwc3Ry
ZWFtIGFza2luZyB3aHkgdGhlcmUKaXMgYSBtaXNtYXRjaC4KCldlIGRpZCB0aGlzIHdpdGggdGFp
bHNjYWxlIGFuZCBhIGZldyBvdGhlciBwYWNrYWdlcyBzdWNjZXNzZnVsbHkgYWxyZWFkeS4KCk92
ZXJhbGwgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGZldGNoIGRpcmVjdGx5IGZyb20gR2l0IGFu
ZCBieXBhc3MgR09QUk9YWS4KCkFzIEFybm91dCBtZW50aW9uZWQsIGlmIHRoaXMgYmVjb21lcyBh
IG1ham9yIGlzc3VlIGluIHRoZSBmdXR1cmUsIHdlCmNvdWxkIGFkZCBhIHBhdGNoaW5nIG1lY2hh
bmlzbS4KCkJ1dCBJIGRvbid0IHNlZSB0aGlzIGFzIGJlaW5nIHRoZSBjYXNlLiBXZSB2ZXJ5IHJh
cmVseSBnZXQgaGFzaAptaXNtYXRjaGVzIGFuZCB3aGVuIHdlIGhhdmUgaXQgd2FzIGZpeGVkIGJ5
IHVwc3RyZWFtLgoKU28gZmFyIHRoZSBvbmx5IHRpbWUgdGhpcyBoYXMgYWN0dWFsbHkgYmVlbiBh
biBpc3N1ZSB3YXMgd2hlbiBvbmUKcHJvamVjdCBoYWQgR2l0IExGUyB0ZXN0IGZpbGVzIGluIHRo
ZSByZXBvLgoKT25lIGFkZGl0aW9uYWwgYWx0ZXJuYXRpdmUgaXMgdG8gc2hpcCBhIGNvbW1pdC1o
YXNoIHZlcnNpb24KdGVtcG9yYXJpbHkgdW50aWwgYSBuZXcgR2l0IHRhZyBpcyBjcmVhdGVkLgoK
QmVzdCByZWdhcmRzLApDaHJpc3RpYW4gU3Rld2FydApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
