Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E66C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 122F54125A;
	Wed,  5 Feb 2025 21:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vWqTki9u2D0y; Wed,  5 Feb 2025 21:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 753EB410D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 753EB410D0;
	Wed,  5 Feb 2025 21:23:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47101E1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B217813B5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BZ5ANQWPavPg for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCAEB81353
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCAEB81353
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCAEB81353
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:23:02 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2b5acf00c5bso85860fac.0
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738790582; x=1739395382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4P8pNlVVu6EXgWmybNFOVOROYHR6JLE6IDZ+O7YdeA=;
 b=eMIZB6MPtlu9pA8yRr6MhxyLn/ArG9aJL5Dt1qQpUwkj74rSRxPLtsiRdm4Bvonlsh
 OHPbfl3qmBQHY1SBwUj4lNKEI1ZpX2+4CuXHzn4Xb1GH5hOUJYB1g3Y0kh5aqZDBpISo
 HIjgOE2h8dgdTB2LofRoWyyRumNgZOg+bm4cQuVPJirTqtNu29sV3Fhkgd2FW7QKBDiJ
 Jyy9znHBhNRFnvgPdgFzrlDV8igTNsbWTxAkQbwPfa//nt9xzR5UB05TcbLmGHdrHo3E
 MS9sx4osn7XPBrAiUk1QE5VbEzmFotJN+EhJXc1oFmU95JxLS3uiRwusJavpOIg6Zv7J
 Otiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDnSkIvnOlS6FOb0VC40VjgO0Y5PT4CHR7I/E2icSaJgy6hg9DW7yN1cBP8GtK267ord7BoRBitPM=@buildroot.org
X-Gm-Message-State: AOJu0YwplP9q1JRsLCsaOmfdzMb1lQaDx+yAwNVuM+k1YQEaU4YLhGCx
 SARcz2tb0QqAf4e4doKLRCaaIJ23OXc6wbM5hsBaJDY+a3ZvyyPJSatuTBL3FMHnoIipFt8Hrs+
 1
X-Gm-Gg: ASbGnct0mx3kZ+UjlDr1/eo6BCNzEHXZnDqczzvPaBZAxOZQDugIaypupNQlS+b1Zlg
 1FeVCIpDeRoPIEMA9qHNFSOhC64Hr/y8WQ7JgB7FAcNMHBIfhBLSEgcYHyymrqp0ffPbYUGh+jw
 2+EobnHQygXw+EFgEBqPpicVdIIBEGIpZ7z96ZVjPJA9y8T/4FSlnFcjPoOXltKKgf5/GMa0zwH
 2EiwfQiEURmwF9BXhRbkjyGC4L65fH0WTvkuxFB5EkW84g/WF3nOMhJqS92XI140O3OLjE3/8UW
 fooxUkbfEEh4CZjqN11cs8FtNbsUOiX4a4spujpx1OXyPIB/lTvzQJyD+8M=
X-Google-Smtp-Source: AGHT+IFyDXQ67iiWS6eHOIn28kt2pgSDMMEpCvTCra+qHV+NpQiTSVV8wmzODuzXUM1oEK+jlbsUUg==
X-Received: by 2002:a05:6870:9d8e:b0:29f:e018:df85 with SMTP id
 586e51a60fabf-2b804fceb14mr2709419fac.22.1738790581699; 
 Wed, 05 Feb 2025 13:23:01 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
 [209.85.167.171]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2b35619ec30sm4887701fac.14.2025.02.05.13.23.00
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 13:23:00 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id
 5614622812f47-3ebadbb14dcso110854b6e.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:23:00 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKUliGgGS0DzN6eEc4wpF4kESZqjcOGBa789JPYSiYsuI3s5bupSKTg3G5ot/vxrwbHkm39xN8w5I=@buildroot.org
X-Received: by 2002:a05:6871:360c:b0:29f:df27:8b80 with SMTP id
 586e51a60fabf-2b80511e04amr2858965fac.24.1738790580241; Wed, 05 Feb 2025
 13:23:00 -0800 (PST)
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
In-Reply-To: <CADvTj4onhc2rTzFa7F5bDFXSNQJ2CKuyU-TD-fwhpQUXNHZTcw@mail.gmail.com>
Date: Wed, 5 Feb 2025 13:22:49 -0800
X-Gmail-Original-Message-ID: <CA+h8R2ofCEUxWBVU5S9_vx5YtsE-Mjq95WL6DzTM5YF38A-izA@mail.gmail.com>
X-Gm-Features: AWEUYZmBy2BpgYU27f-p-5MZY4pTbknggoSeH2G_EKZrkwpq61zyFjMtU63ii60
Message-ID: <CA+h8R2ofCEUxWBVU5S9_vx5YtsE-Mjq95WL6DzTM5YF38A-izA@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1738790582; x=1739395382; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4P8pNlVVu6EXgWmybNFOVOROYHR6JLE6IDZ+O7YdeA=;
 b=x3Li/XM9nn/z3blzuQWqWjKYTsbWBWAq+WARr5rO6DRsg9oNXj9oZNtUbZ2nwzFMeY
 8MJzd22Yj1tQ7TCFJslEgkhOd6rQxFR8IA0pwEcNImjI7KRErDKFD2BG42W+FfMmkC6R
 7ovvjgqzWxoDap/t+g2Umu1WJrFJz4K3SISeiyeqvWh5uuAMwMr3GVU0R6Vxbg8y8L6K
 wWRsuUXpovwDUMT7wcarn3nPx9qeX+fxII6flwCzBFDeKyuvdzngFNRsxXPX0VdMczFi
 P4jTz0y6fTLdUeXS3iv41f5jp/FSACFP039zeYf11A03tYEs8w+iXqghxIszfx9E+yfk
 Z3Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=x3Li/XM9
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

SGkgSmFtZXMsCgpPbiBXZWQsIEZlYiA1LCAyMDI1IGF0IDEyOjM44oCvUE0gSmFtZXMgSGlsbGlh
cmQKPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gRG8geW91IGhhdmUgYW55
IGV4YW1wbGVzIG9mIGNhc2VzIHdoZXJlIHRoaXMgaGFzIGhhcHBlbmVkPwo+Cj4gTG9vayBhdCBt
eSBuZXRiaXJkIFBSLCBsaXRlcmFsbHkgYSBjYXNlIG9mIDIgdXJscyBnb2luZyBpbnZhbGlkIGF0
IHNvbWUgcG9pbnQuCj4KPiA+IElmIGl0IGRvZXMgaGFwcGVuLCB3ZSBjYW4gbWlycm9yIHRoZSBw
YWNrYWdlIC50YXIuZ3ogaW4gdGhlIGJ1aWxkcm9vdCBtaXJyb3IuIEhhdmUgd2UgZXZlciBuZWVk
ZWQgdG8gZG8gdGhpcyB0aHVzIGZhcj8KPgo+IFdlIGRvbid0IHJlYWxseSBoYXZlIGEgbG90IG9m
IGdvbGFuZyBwYWNrYWdlcyB5ZXQsIGJ1dCBiYXNlZCBvbiB0aGUgYnJlYWthZ2UKPiBJIHNlZSBp
biBwYWNrYWdlcyBsaWtlIG5ldGJpcmQgaXQgc2VlbXMgbGlrZSBhbiBpbmV2aXRhYmxlIGlzc3Vl
IGF0IGFueQo+IG1lYW5pbmdmdWwgc2NhbGUuCj4KPiA+PiBGb3IgZXhhbXBsZSBuZXRiaXJkIGlz
IHN0aWxsIGJyb2tlbiB3aXRoIEdPUFJPWFk9ZGlyZWN0IGR1ZSB0byB1cmwgYnJlYWthZ2UKPiA+
PiBpc3N1ZXMgd2hpY2ggaGF2ZSBub3QgaGFkIGZpeGVzIG1lcmdlZChzdXJwcmlzZSBzdXJwcmlz
ZSBtYWludGFpbmVycyBkb24ndAo+ID4+IGNhcmUgb3IgdGVzdCB3aXRoIEdPUFJPWFk9ZGlyZWN0
IHNlZW1pbmdseSBldmVyIGFzIGl0J3Mgbm90IHRoZSBkZWZhdWx0KToKPiA+PiBodHRwczovL2dp
dGh1Yi5jb20vbmV0YmlyZGlvL25ldGJpcmQvcHVsbC8zMjQwCj4gPgo+ID4gSSBkb24ndCBhZ3Jl
ZSB0aGF0IHlvdXIgMSB3ZWVrIG9sZCBQUiBub3QgYmVpbmcgbWVyZ2VkIHlldCBpcyBhIHN1aXRh
YmxlIGluZGljYXRvciB0aGF0IG1haW50YWluZXJzIGRvbid0IGNhcmUgYWJvdXQgdGhlaXIgZGVw
ZW5kZW5jaWVzIG1hdGNoaW5nIHdoYXQgaXMgaW4gR2l0Lgo+Cj4gV2VsbCB0aGF0IGFuZCB0aGUg
ZmFjdCB0aGF0IEdPUFJPWFk9ZGlyZWN0IHdhcyBicm9rZW4gaW4gdGhlIGZpcnN0IHBsYWNlCj4g
aXMgYSBwcmV0dHkgc3Ryb25nIGluZGljYXRvciB1cHN0cmVhbSBwcm9qZWN0cyBkb24ndCBjYXJl
IGFib3V0IGl0IG11Y2guCgpUaGV5IGhhdmUgcmVwbGllZCB0byB5b3VyIFBSIHJlcXVlc3Rpbmcg
YW4gYWx0ZXJuYXRpdmUgc3RyYXRlZ3kgdG8KZml4aW5nIHRoZSBpc3N1ZToKCmh0dHBzOi8vZ2l0
aHViLmNvbS9uZXRiaXJkaW8vbmV0YmlyZC9wdWxsLzMyNDAjaXNzdWVjb21tZW50LTI2Mzc5NTY1
MzcKCkhlcmUgYXJlIHRoZSBuZXcgUFJzIGltcGxlbWVudGluZyB3aGF0IHRoZXkgcmVxdWVzdGVk
OgoKLSBodHRwczovL2dpdGh1Yi5jb20vbmV0YmlyZGlvL25ldGJpcmQvcHVsbC8zMjg3Ci0gaHR0
cHM6Ly9naXRodWIuY29tL25ldGJpcmRpby9uZXRiaXJkL3B1bGwvMzI4OAoKPiBXaGF0J3MgdGhl
IHB1cnBvc2Ugb2YgdGhpcz8gV2hhdCBhY3R1YWwgcmVhbCB3b3JsZCBiZW5lZml0cyBoYXZlIHdl
IGdhaW5lZAo+IGZyb20gZml4aW5nIHRoZXNlIGJyb2tlbiB1cmwvZG93bmxvYWQgaXNzdWVzIHVw
c3RyZWFtIGFzIG9wcG9zZWQgdG8gc2ltcGx5Cj4gbm90IHVzaW5nIEdPUFJPWFk9ZGlyZWN0IGxp
a2UgdGhlIHJlc3Qgb2YgdGhlIGdvbGFuZyBlY29zeXN0ZW0/CgpZb3UgbWF5IG5vdGUgdGhhdCB0
aGUgZGVmYXVsdCBvZiBHT1BST1hZIGlzOgoKbmV0YmlyZCAlIGdvIGVudiBHT1BST1hZCmh0dHBz
Oi8vcHJveHkuZ29sYW5nLm9yZyxkaXJlY3QKCk5vdGUgdGhhdCAiZGlyZWN0IiBpcyB0aGUgc2Vj
b25kIGluIHRoZSBsaXN0LCB0aGUgZmFsbGJhY2sgaWYgdGhlCnByb3h5IGRvZXMgbm90IHdvcmsu
CgpJZiB0aGUgZGVmYXVsdCB3ZXJlIHRoZSBwcm94eSB3aXRob3V0IHRoZSAiZGlyZWN0IiBwYXJ0
IGl0IHdvdWxkIGJlCnRydWUgdGhhdCAidGhlIHJlc3Qgb2YgdGhlIGdvbGFuZyBlY29zeXN0ZW0i
IGRvZXMgbm90IHVzZQpHT1BST1hZPWRpcmVjdC4KCj4gPiBJIGFncmVlIHdpdGggeW91ciBsb2dp
YyB0aGF0Ogo+ID4KPiA+IDEpIFRoZSBkZXZlbG9wZXJzIG9mIGdvIHByb2plY3RzIGxpa2UgRG9j
a2VyIG9yIE5ldGJpcmQgaGF2ZSBwaW5uZWQgZGVwZW5kZW5jaWVzIGluIGdvLnN1bSB3aGljaCB3
ZSBjYW4gcmVhc29uYWJseSB0cnVzdC4KPiA+IDIpIGJ1aWxkcm9vdCBtYWludGFpbmVycyBkb24n
dCB0eXBpY2FsbHkgZXhoYXVzdGl2ZWx5IGF1ZGl0IGFsbCBkZXBlbmRlbmNpZXMuCj4gPgo+ID4g
V2hhdCBJIGRpc2FncmVlIHdpdGggaXM7Cj4gPgo+ID4gMSkgSXQgaXMgaW1wb3NzaWJsZSB0byBh
dm9pZCBhZGRpbmcgYSBHb29nbGUgaG9zdGVkIHNlcnZpY2UgYXMgYSBkZXBlbmRlbmN5IGZvciBi
dWlsZGluZyBHbyBwYWNrYWdlcyBpbiBidWlsZHJvb3QuCj4KPiBXaGF0IEknbSBzYXlpbmcgaXMg
dGhhdCBpdCdzIGltcG9zc2libGUgdG8gYXZvaWQgdGhlIGdvcHJveHkgY2FjaGUgd2l0aG91dAo+
IHJlbHlpbmcgb24gYnVpbGRyb290IGl0c2VsZiBtaXJyb3JpbmcgcGFja2FnZXMgd2l0aCB0aGVp
ciBkZXBlbmRlbmNpZXMgaW4gYQo+IGdlbmVyYWxpemVkIG1hbm5lciBsb25nIHRlcm0uCgpEbyB5
b3UgaGF2ZSBhbnkgZXhhbXBsZXMgb2YgdGhlc2UgYnJlYWthZ2VzIHNvIGZhcj8gV2UgdXNlIGEg
bnVtYmVyIG9mCkdvIHBhY2thZ2VzIGluIEJ1aWxkcm9vdCBleHRlbnNpdmVseSBhbHJlYWR5IHRv
ZGF5LCBsaWtlIGRvY2tlci1lbmdpbmUKYW5kIGRvY2tlci1jbGkuCgpHaXZlbiB0aGUgdHJhZGVv
ZmZzIHdlIGhhdmUgZGlzY3Vzc2VkIGJldHdlZW46CgotICJhbHdheXMgcmVxdWlyZSB0aGUgR29v
Z2xlIHByb3h5IiBhbmQKLSAiZml4IG1pc21hdGNoZXMgYXQgcGFja2FnZSBhZGQvdXBkYXRlIHRp
bWUsIG1pcnJvciBpZiBkZXBlbmRlbmNpZXMKYXJlIHVuYXZhaWxhYmxlIGxvbmctdGVybSIKClRo
ZXJlIGlzIGluc3VmZmljaWVudCBldmlkZW5jZSB0aGF0IHRoZSBtaXJyb3JpbmcgcGFydCBpcyBz
dWNoIGEKbWFpbnRlbmFuY2UgYnVyZGVuIHRoYXQgd2UgbXVzdCBnbyB3aXRoIG9wdGlvbiAxIGhl
cmUuCgo+IFRoZXJlJ3Mgb25seSBkb3duc2lkZXMgdG8gdXNpbmcgR09QUk9YWT1kaXJlY3QgaW4g
YnVpbGRyb290IGZyb20KPiB3aGF0IEkgY2FuIHRlbGwsIEkgY2FuJ3QgZXZlbiB0aGluayBvZiBh
IHNpbmdsZSByZWFsIHdvcmxkIGJlbmVmaXQuCgpVcHNpZGVzOgoKLSBObyBkZXBlbmRlbmN5IG9u
IGEgdGhpcmQtcGFydHkgcHJveHkgc2VydmljZQotIEFiaWxpdHkgdG8gYnVpbGQgd2l0aCBHT1BS
T1hZPWRpcmVjdCBmb3IgdGhvc2UgdGhhdCByZXF1aXJlIGl0CihvdGhlcndpc2UgQnVpbGRyb290
IGJyZWFrcyBmb3IgdGhlbSBvbiBkZWZhdWx0KQotIElmIGdvLm1vZCBzYXlzICJmb28vYmFyIGF0
IHZlcnNpb24gdjEuMC4wIiB0aGVuIHdlIGNhbiBiZSBzdXJlIHRoZQpHaXQgdGFnIHYxLjAuMCBt
YXRjaGVzIHRoZSBnby5zdW0uCgpEb3duc2lkZXM6CgotIFNsb3dlciBmZXRjaCAoZ2l0IHB1bGwg
aW5zdGVhZCBvZiBwcm94eS5nb2xhbmcub3JnKQotIFdlIG5lZWQgdG8gbWlycm9yIHBhY2thZ2Vz
IGlmIHRoZWlyIGRlcGVuZGVuY2llcyBnbyBhd2F5IChtb3N0IGFyZQpvbiBHaXRIdWIsIHRob3Vn
aCkKCldoZW4gcmVxdWVzdGluZyB0aGF0IHVwc3RyZWFtIHByb2plY3RzIGZpeCB0aGUgYnVpbGQg
d2l0aApHT1BST1hZPWRpcmVjdCBpdCBoZWxwcyB0byBtZW50aW9uIHdoeSBpbiB0aGUgUFIgZGVz
Y3JpcHRpb24uCgpCZXN0IHJlZ2FyZHMsCkNocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
