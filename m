Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CFACF396F
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 17:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9979E81186;
	Wed, 19 Nov 2025 17:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GfwFfuIR7Fe; Wed, 19 Nov 2025 17:02:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A310381187
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A310381187;
	Wed, 19 Nov 2025 17:02:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7923A158
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 17:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 765D440358
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 17:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCcHYNXT4CDF for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 17:02:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 90E244003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90E244003D
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 90E244003D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 17:02:25 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id
 a1e0cc1a2514c-9372634aca2so2091322241.2
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 09:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763571744; x=1764176544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vZ08oEmnzJWR4QCEohUfiRsxd99JXc+ZmDsNU2fQA70=;
 b=MdUbaZNAkJQm8vn8KM1iba1lNQ/MDGVseV4oDkasUeVh5jxCcf/9Nysvq2UfFhi4B0
 s7AlkBFiwPEYS8hNeMxgXsC5+bde7RlfqpyNiTHfGFaNLhZxCJ2jLMlzSHym8l0NDSGk
 fFB6k0TL68xDSboAop5oPFGQeOPy+mH1Mjll0cqC1D0nS/osHtvnlmidfWRpnJTPCKud
 ItAtmcYItTFbQstxBVBS2JJ0MxEPLUkZOSa65N5RNI89kTcgyo/5SP2JeFb2AffUqDY7
 Ip7CtqVxyFWHOzKqvvN0vGOh2vTWc4yaT6nwBwYvlYG9JMwcH9alMnFsHME4SkmzHNZT
 ndww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFgJfR/Ff3fItTOAw/9CYC+xV9vgKrSauoyt9XWcjzLM6LsQmuecMtXrG/dATLs4njCCoPv46UYNY=@buildroot.org
X-Gm-Message-State: AOJu0Yy0jCZPIIyeyM0igVnH1D3+7CkvQ7UO3Uwv6hLZ6HxDLGQjYOya
 VIc+2PI9/szbYdRCoWWvi0+ZXuYf80iyo/KihCFmHMtw/jUjv9LJ4SczbqV856N5CRU+T3XzuDy
 A/4ulED4rFfypcq9OEAMzN2oeGdMd3GlUki1y
X-Gm-Gg: ASbGncvSaR9y9qPMAu18/fxYH3Go7kku2yjtPnskGHrYrXb1CNtwxkpgfFk2V52EJX+
 tj+qIy47a87iyCMHTHba6qfj5GCvU3s2NDmRB2WLw2WSfWjRBFwNPNE2pAEntXLj39kqrihotmq
 sJZLYb6D8FSH91UKbLNF0px1lfL06q6yOf6DzLzkf0iPTeiipPMHRNubFB82cf/2dQUo8WPW3in
 7LHgPAwdWg6VsLz/j1KB1QfHaKjLxVJK9+0JpsQbTkBRaz7VyxsM7WMiGpeSaMa5Bwq481FwnlX
 EcvGLA==
X-Google-Smtp-Source: AGHT+IEx9JX5JN0+DW6Yie6YTr4gnqEWR9xLf+tmTKiFewYS6MFUJGPUtlzE90BWMCRdCNMAIYgsur5pc3QvQ1t6xiQ=
X-Received: by 2002:a05:6102:26d0:b0:5db:debf:6587 with SMTP id
 ada2fe7eead31-5e1bbfb1bf1mr55022137.32.1763571743731; Wed, 19 Nov 2025
 09:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <5a529d9d-6a06-42cf-a1e5-0c8f16a51967@bubu1.eu>
In-Reply-To: <5a529d9d-6a06-42cf-a1e5-0c8f16a51967@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Nov 2025 10:02:11 -0700
X-Gm-Features: AWmQ_bl-Syezp7nBnElk28ujh59oVIGgtOx9Q_eR7ZEVi23J72FCJWB24O5wyqc
Message-ID: <CADvTj4pJs0husdvOLouDmaWMQ8QmpyGu2SDzsk7h0mE7vp-KrA@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org, 
 Sen Hastings <sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763571744; x=1764176544; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZ08oEmnzJWR4QCEohUfiRsxd99JXc+ZmDsNU2fQA70=;
 b=hf2w85puKfM5BLB/pUy2BW8HIMyudIk0FCNp48hSwAU1QEdft+YeMoehXl3A4jj2kN
 r472GZF+t7ORmtPYrV2La1u42ETei7C2MLiakS0mEPTcpGsBLjvrQZM8S5w+5M7uf3Yx
 dbTgcAC5KSHgT3ZYyZxTH6L565e+EL1FapnpsYPUoOrKhhMtLnd7+pk+W3Z3NsLuryTP
 hijg1XhwYQuN34s8sjkZ7eD1upBLikFTxZjCLDB0ePV/gcz10rdyEMZPB/VSmd8jbNTp
 yVvJHMUictVubdViJmyzF630QLghAazJwGhpDcl8A2BldIqGy4FHomV89iL3c/Z906IE
 gCgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hf2w85pu
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgOTo0N+KAr0FNIE1hcmN1cyBIb2ZmbWFubiB2aWEgYnVp
bGRyb290CjxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4KPiBIaSBOb3JiZXJ0LAo+
Cj4gT24gMTEvMTkvMjUgMTY6NDgsIE5vcmJlcnQgTGFuZ2Ugd3JvdGU6Cj4gPiBBbGwgdGhvc2Ug
ZmVhdHVyZXMgYXJlIG9wdGlvbmFsIGFuZCBwcmV2ZW50IGN1c3RvbWl6YXRpb24gb2YgdGhlIGtl
cm5lbC4KPgo+IEZvciB0aGUgcmVjb3JkLCB0aGUgbGlzdCBvZiBrZXJuZWwgb3B0aW9ucyByZXF1
aXJlZCBhbmQgcmVjb21tZW5kZWQgZm9yCj4gdGhlIGN1cnJlbnRseSBwYWNrYWdlZCBzeXN0ZW1k
IHZlcnNpb24gaXMgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2Js
b2IvdjI1Ny4xMC9SRUFETUUKPgo+IEFuZCBJIGFncmVlIHRoYXQgd2Ugc2hvdWxkbid0IGZvcmNl
IHRoZXNlIG9wdGlvbmFsIChldmVuIGlmIHN0cm9uZ2x5Cj4gcmVjb21tZW5kZWQpIGZlYXR1cmVz
LiBBIGxpbmsgdG8gdGhpcyByZWFkbWUgZmlsZSBzaG91bGQgcHJvYmFibHkgYmUKPiBhZGRlZCB0
byB0aGUgQ29uZmlnLmluIGhlbHAgdGV4dCBpbnN0ZWFkIG9mIHRyeWluZyB0byByZXBsaWNhdGUg
dGhlCj4gY29udGVudCB0aGVyZSBhcyB3ZWxsLgoKSSB0aGluayBpbiBnZW5lcmFsIGJ1aWxkcm9v
dCBzaG91bGQgZW5hYmxlIGF0IGEgbWluaW11bSBhbGwgcmVjb21tZW5kZWQKc3lzdGVtZCBvcHRp
b25zIGJ5IGRlZmF1bHQsIHdlIGNhbiBqdXN0IGRvICJkZWZhdWx0IHkiIGZvciBidWlsZHJvb3Qg
a2NvbmZpZwpvcHRpb25zLgoKTWF5YmUgaGF2ZSBzb21ldGhpbmcgbGlrZSB0aGlzIGluIHRoZSBz
eXN0ZW1kIGtjb25maWcgdG8gZ2F0ZQp0aGUgcmVjb21tZW5kZWQgYnV0IG5vdCByZXF1aXJlZCBv
cHRpb25zOgpjb25maWcgU1lTVEVNRF9SRUNPTU1FTkRFRF9LRVJORUxfRkVBVFVSRVMKICAgICAg
ZGVmYXVsdCB5CgpJIGhhZCBlbmFibGVkIGFsbCByZWNvbW1lbmRlZCBvcHRpb25zIGp1c3Qgc2lu
Y2UgSSBkaWRuJ3Qgc2VlIG11Y2ggb2YKYSBnb29kIHJlYXNvbiB0byBkaXNhYmxlIHRoZW0gaW4g
Z2VuZXJhbCBhcyB0aGV5IHNob3VsZCBsYXJnZWx5IGJlCmhhcm1sZXNzIGlmIGVuYWJsZWQgd2hp
bGUgdW51c2VkLgoKSSBkb24ndCB0aGluayBkaXNhYmxpbmcgdGhlbSBieSBkZWZhdWx0IGlzIGEg
Z29vZCBpZGVhIHNpbmNlIHRoZXJlJ3MgYSBoaWdoCnByb2JhYmlsaXR5IG9mIHJhbmRvbSBicmVh
a2FnZSBvdGhlcndpc2UuCgo+Cj4gVGhpcyBzdGlsbCBkb2Vzbid0IHJlbW92ZSBhbGwgb3B0aW9u
cyB0aGF0IHRoZSBhYm92ZSBkb2N1bWVudCBjbGFzc2lmaWVzCj4gYXMgb3B0aW9uYWwgdGhvdWdo
LiBBbnkgcGFydGljdWxhciByZWFzb24gdG8ga2VlcCB0aGVzZT8KPgo+IENPTkZJR19ETUlJRAo+
IENPTkZJR19ORVRfTlMKPiBDT05GSUdfVVNFUl9OUyBbMV0KPiBDT05GSUdfQVVUT0ZTX0ZTCj4g
Q09ORklHX0FVVE9GUzRfRlMKPiBDT05GSUdfVE1QRlNfUE9TSVhfQUNMCj4gQ09ORklHX1RNUEZT
X1hBVFRSCj4KPiBbMV0gVGhlcmUncyBhIG5vdGUgaGVyZTogInN5c3RlbWQtbG9jYWxlZC5zZXJ2
aWNlIGFuZCBvdGhlciBzeXN0ZW1kCj4gdW5pdHMgdXNlIFByaXZhdGVOZXR3b3JrIHNvIHRoaXMg
aXMgZWZmZWN0aXZlbHkgcmVxdWlyZWQuIiBOb3QgZXhhY3RseQo+IHN1cmUgd2hhdCB0aGF0IG1l
YW5zIGZvciBhIGJ1aWxkcm9vdCBzeXN0ZW0uCj4KPiA+IEZvcmNpbmcgSVB2NiBpcyBwYXJ0aWN1
bGFybHkgbmFzdHkuCj4gPgo+ID4gVGhpcyByZXZlcnRzIHBhcnRzIG9mICJwYWNrYWdlL3N5c3Rl
bWQ6IGJ1bXAgdG8gdmVyc2lvbiAyNTYuNCIKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0
IExhbmdlIDxub2xhbmdlNzlAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIHBhY2thZ2Uvc3lzdGVt
ZC9zeXN0ZW1kLm1rIHwgMTkgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgMTkgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9z
eXN0ZW1kLm1rIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKPiA+IGluZGV4IDEyNmNlNzcx
NmYuLjBlZTY4MGU1NWUgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5t
awo+ID4gKysrIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKPiA+IEBAIC04NjMsMzUgKzg2
MywxNiBAQCBkZWZpbmUgU1lTVEVNRF9MSU5VWF9DT05GSUdfRklYVVBTCj4gPgo+ID4gICAgICAg
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfRE1JSUQpCj4gPgo+ID4gLSAgICAgJChj
YWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQkxLX0RFVl9CU0cpCj4gPiAtCj4gPiAgICAg
ICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19ORVRfTlMpCj4gPgo+ID4gICAgICAg
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfVVNFUl9OUykKPiA+Cj4gPiAgICAgICAk
KGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfU1lTRlNfREVQUkVDQVRFRCkKPiA+Cj4g
PiAtICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19JUFY2KQo+ID4gICAgICAg
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQVVUT0ZTX0ZTKQo+Cj4gPiAgICAgICAk
KGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19BVVRPRlM0X0ZTKQo+ID4gICAgICAgJChj
YWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfVE1QRlNfUE9TSVhfQUNMKQo+ID4gICAgICAg
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfVE1QRlNfWEFUVFIpCj4gPiAtICAgICAk
KGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19TRUNDT01QKQo+ID4gLSAgICAgJChjYWxs
IEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfU0VDQ09NUF9GSUxURVIpCj4gPiAtICAgICAkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19LQ01QKQo+ID4gLSAgICAgJChjYWxsIEtDT05G
SUdfRU5BQkxFX09QVCxDT05GSUdfTkVUX1NDSEVEKQo+ID4gLSAgICAgJChjYWxsIEtDT05GSUdf
RU5BQkxFX09QVCxDT05GSUdfTkVUX1NDSF9GUV9DT0RFTCkKPiA+IC0KPiA+IC0gICAgICQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0NHUk9VUF9TQ0hFRCkKPiA+IC0gICAgICQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0ZBSVJfR1JPVVBfU0NIRUQpCj4gPiAtCj4gPiAt
ICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19DRlNfQkFORFdJRFRIKQo+ID4g
LQo+ID4gLSAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfRUZJVkFSX0ZTKQo+
ID4gLSAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfRUZJX1BBUlRJVElPTikK
PiA+IC0KPiA+IC0gICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0RNSSkKPiA+
IC0gICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0RNSV9TWVNGUykKPiA+Cj4g
PiAgICAgICAkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfUlRfR1JPVVBfU0NIRUQp
Cj4gPgo+Cj4gTWFyY3VzCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
