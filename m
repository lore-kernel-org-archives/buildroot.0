Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E36CF394B
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 16:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 730D54096C;
	Wed, 19 Nov 2025 16:54:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qntl1yEFHpC; Wed, 19 Nov 2025 16:54:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 745CD409C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 745CD409C9;
	Wed, 19 Nov 2025 16:54:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBD3B2A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D239960823
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiNK0r5ZXNo4 for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 16:54:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e29; helo=mail-vs1-xe29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70BE760812
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70BE760812
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70BE760812
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 16:54:46 +0000 (UTC)
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-5dfd0101905so2055187137.3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 08:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763571285; x=1764176085;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PgHc2mAFuFszLZk2Etnu/OeLzBnHCnaaIpbs/BfvspU=;
 b=Lt/gzjF1wpgYb4kPqxfVWcRCjpk07Hfc5B12mGpxwO4Hp6lVQ/S8xhPCfp6z9sozOT
 vD+cDh7YQQu9Dn6XcY8pK29R3rrfyP1nzWP6+EH6N7t3JMxGRvbTRAXBZ5fAr3wZ3/yF
 cxcQqB+MQ5RAmEyYQ2sdH8JwHG2vCZr0Atoms0Yga9n5oCaVVVU77zXFFI4wRNpBOpHp
 ZQsvsHNhYK+SKJa+Ctf45XLxteBwCWu7KpoUwRyA2b2UM8GS/kbMqVL0X9+AcIcUqvMy
 Hr2oFVnusleCPnVbYzCog/FJRH2wT3H9La1pHn7DrKHYvV+TktEygfvUZQ4O96s998wM
 J/Mw==
X-Gm-Message-State: AOJu0YyM2mELIGIKpZORizpRr3NHps7rdUvo2q8XmV4dLQhC50V+DGo+
 r6yrZDWoO0IvyDdwWKwdZatwyQ+FFG7U+VTdd9NVwdvyQRn2ppTDsVbA6wfCJ0RaIvt5WhhQB1B
 djWyMYYeLkdoMj/ZzUfs0YV88d5vqETE=
X-Gm-Gg: ASbGncvMAryLntvg9mFrEnb7+QXEsonFTYbKnwDRas2JZ6D9GzcLTYyB83clncr7exm
 wKLZYcANU642Bx/oqc45F7FfCa2fSaE1YS3Hla53AeVFXFEJ9741TXeFs2vduqfu1okVvad9LzH
 yow+iuK1iDPrtatdFgYGDTP6XBxpYudtL2eB5/2gt0/HJfcqVDi0HrN25/3e/ZNoKq06NJ6Aw0W
 +la+QR9nHmyehFkfUig4Su7E7gNT+ARC/lf2QesiGg92/qmvZ0kvUYth4I3SMiIyaAns1w=
X-Google-Smtp-Source: AGHT+IHF6/5uvSOgdL0hH+OJ4DuAq9mJs2mDBVCF8P0UmZ3II9f/JynhDeM036xSBSTccDOpezWchSm+rMW4OwqrtkI=
X-Received: by 2002:a05:6102:419e:b0:5df:bcf7:3d97 with SMTP id
 ada2fe7eead31-5e1bbc69f27mr70984137.12.1763571284999; Wed, 19 Nov 2025
 08:54:44 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <CADvTj4qKBNEobk78FM1Zxj8n1irVV+LaApwWR=rDcbwf8+2mmg@mail.gmail.com>
 <CADYdroNVCmUqTZB6cZ6r3=pnvARiGrnd6V+FeY3cO4tLFFUCEQ@mail.gmail.com>
In-Reply-To: <CADYdroNVCmUqTZB6cZ6r3=pnvARiGrnd6V+FeY3cO4tLFFUCEQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 19 Nov 2025 09:54:33 -0700
X-Gm-Features: AWmQ_bmC-nW5t71EAu_yibCmjZT7RPpIiBMCWXEpw0y9OBR0NDg506AO--mxUZU
Message-ID: <CADvTj4oCZzy=O+j5Y_xOeQAXUcNe9EzZ96oHG-MQwEuZavXLmw@mail.gmail.com>
To: Norbert Lange <nolange79@gmail.com>
Cc: buildroot@buildroot.org, Sen Hastings <sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763571285; x=1764176085; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgHc2mAFuFszLZk2Etnu/OeLzBnHCnaaIpbs/BfvspU=;
 b=Jp9S1hCtoiTuM6NfYX4ca7S86LyIBsUgHFCJCN54xIjzYb1ajjio0NT9kJSLceQMD0
 HCVR6a8ixEBTSnWakMKHiKTaA/pwGIOHztud9hw0u5i16kV/uzyTh55rKreu+3tYbxbn
 DIgI7NsJ7AWd0iAgKLXkmbzlo/cP4voa182Qw0oZyQ+MTwbJofps5dXxoDI0Dzuv7y3e
 Jo4ysRVeCo+Lvgw2dgBsbFv6brM2zEhW8ZnsiQI4GP972tpFl9iSerklYEGAf1BFYF0S
 /25P43QDdsF5uNMa8LtnfPHgIWKZJu316CG+HG76On4rDF0WSlJARVuxGm/iviJZzcO6
 xnsg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jp9S1hCt
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

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgOTozMuKAr0FNIE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3
OUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gTWkuLCAxOS4gTm92LiAyMDI1IHVtIDE3OjE2IFVo
ciBzY2hyaWViIEphbWVzIEhpbGxpYXJkCj4gPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Ogo+
ID4KPiA+IE9uIFdlZCwgTm92IDE5LCAyMDI1IGF0IDg6NTfigK9BTSBOb3JiZXJ0IExhbmdlIDxu
b2xhbmdlNzlAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gQWxsIHRob3NlIGZlYXR1cmVz
IGFyZSBvcHRpb25hbCBhbmQgcHJldmVudCBjdXN0b21pemF0aW9uIG9mIHRoZSBrZXJuZWwuCj4g
PiA+IEZvcmNpbmcgSVB2NiBpcyBwYXJ0aWN1bGFybHkgbmFzdHkuCj4gPgo+ID4gV2hhdCBpc3N1
ZSBhcmUgeW91IHNlZWluZyBmcm9tIGZvcmNpbmcgSVBWNj8KPgo+IEFkZGl0aW9uYWwgaW50ZXJm
YWNlcyBhbmQgZnVuY3Rpb25hbGl0eSBJIGRvbid0IHdhbnQgdG8gc2VlIGluIGFuCj4gZW1iZWRk
ZWQgZGV2aWNlCj4gaWYgSSBkaXNhYmxlIElQVjYgaW4gdGhlIGtlcm5lbCBjb25maWcuCj4KPiA+
Cj4gPiA+Cj4gPiA+IFRoaXMgcmV2ZXJ0cyBwYXJ0cyBvZiAicGFja2FnZS9zeXN0ZW1kOiBidW1w
IHRvIHZlcnNpb24gMjU2LjQiCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5vcmJlcnQgTGFu
Z2UgPG5vbGFuZ2U3OUBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgcGFja2FnZS9zeXN0ZW1k
L3N5c3RlbWQubWsgfCAxOSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMTkgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N5c3Rl
bWQvc3lzdGVtZC5tayBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gPiA+IGluZGV4IDEy
NmNlNzcxNmYuLjBlZTY4MGU1NWUgMTAwNjQ0Cj4gPiA+IC0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9z
eXN0ZW1kLm1rCj4gPiA+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4gPiA+IEBA
IC04NjMsMzUgKzg2MywxNiBAQCBkZWZpbmUgU1lTVEVNRF9MSU5VWF9DT05GSUdfRklYVVBTCj4g
PiA+Cj4gPiA+ICAgICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfRE1JSUQp
Cj4gPiA+Cj4gPiA+IC0gICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQkxL
X0RFVl9CU0cpCj4gPiA+IC0KPiA+Cj4gPiBUaGlzIGlzIGxpc3RlZCBhcyByZXF1aXJlZCBmb3Ig
IlN1cHBvcnQgZm9yIHNvbWUgU0NTSSBkZXZpY2VzIHNlcmlhbAo+ID4gbnVtYmVyIHJldHJpZXZh
bCI6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2Jsb2IvdjI1OC4yL1JF
QURNRSNMMTA2LUwxMDgKPgo+IEkgZG9udCBoYXZlIFNDU0kKClRoZW4gZnJvbSBteSB1bmRlcnN0
YW5kaW5nIHRoaXMgb3B0aW9uIHdpbGwgbm90IGFjdHVhbGx5IGdldCBlbmFibGVkCmluIHRoZSBh
Y3R1YWwgYnVpbGQgc2luY2UgdGhlcmUgaXMgYSBkZXBlbmRlbmN5IG9uIFNDU0kgaGVyZToKaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjYuMTcvZHJpdmVycy9zY3NpL0tj
b25maWcjTDE1OAoKPgo+ID4KPiA+ID4gICAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BU
LENPTkZJR19ORVRfTlMpCj4gPiA+Cj4gPiA+ICAgICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxF
X09QVCxDT05GSUdfVVNFUl9OUykKPiA+ID4KPiA+ID4gICAgICAgICAkKGNhbGwgS0NPTkZJR19E
SVNBQkxFX09QVCxDT05GSUdfU1lTRlNfREVQUkVDQVRFRCkKPiA+ID4KPiA+ID4gLSAgICAgICAk
KGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19JUFY2KQo+ID4gPiAgICAgICAgICQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0FVVE9GU19GUykKPiA+ID4gICAgICAgICAkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19BVVRPRlM0X0ZTKQo+ID4gPiAgICAgICAgICQo
Y2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1RNUEZTX1BPU0lYX0FDTCkKPiA+ID4gICAg
ICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19UTVBGU19YQVRUUikKPiA+ID4g
LSAgICAgICAkKGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19TRUNDT01QKQo+ID4gPiAt
ICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1NFQ0NPTVBfRklMVEVSKQo+
ID4gPiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0tDTVApCj4gPiA+
IC0gICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTkVUX1NDSEVEKQo+ID4g
PiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX05FVF9TQ0hfRlFfQ09E
RUwpCj4gPgo+ID4gVGhlc2Ugb3B0aW9ucyBhcmUgIk9wdGlvbmFsIGJ1dCBzdHJvbmdseSByZWNv
bW1lbmRlZCI6Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2Jsb2IvdjI1
OC4yL1JFQURNRSNMMTE4LUwxMjgKPgo+IFllcywgc28gbGV0IHRoZSB1c2VyIGVuYWJsZSB0aGVt
IGlmIHRoZXkgbmVlZCBpdC4gQnVpbGRyb290IGlzIG5vdCB0aGUgY29tbW9uCj4gZGVza3RvcCBz
eXN0ZW0uCgpJIHRoaW5rIGluIGdlbmVyYWwgd2Ugd2FudCB0byBlbmFibGUgcmVjb21tZW5kZWQg
c3lzdGVtZCBjb25maWcgb3B0aW9ucwpieSBkZWZhdWx0LCB3ZSBjb3VsZCBhZGQgYSBidWlsZHJv
b3Qga2NvbmZpZyBvcHRpb24gdG8gYWxsb3cgZGlzYWJsaW5nIHRoZW0KaG93ZXZlci4KCj4KPiA+
Cj4gPiA+IC0gICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQ0dST1VQX1ND
SEVEKQo+ID4gPiAtICAgICAgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0ZBSVJf
R1JPVVBfU0NIRUQpCj4gPgo+ID4gVGhlc2UgYXJlICJSZXF1aXJlZCBmb3IgQ1BVU2hhcmVzPSBp
biByZXNvdXJjZSBjb250cm9sIHVuaXQgc2V0dGluZ3MiOgo+ID4gaHR0cHM6Ly9naXRodWIuY29t
L3N5c3RlbWQvc3lzdGVtZC9ibG9iL3YyNTguMi9SRUFETUUjTDEzMC1MMTMyCj4KPiBZZXMsIGlm
IHlvdSB1c2UgdGhlbT8KClNvbWUgcGFja2FnZSB1bml0IGZpbGVzIHByZXN1bWFibHkgbWF5IHVz
ZSB0aGVtPwoKPiA+Cj4gPiA+IC0gICAgICAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05G
SUdfQ0ZTX0JBTkRXSURUSCkKPiA+Cj4gPiBUaGlzIGlzICJSZXF1aXJlZCBmb3IgQ1BVUXVvdGE9
IGluIHJlc291cmNlIGNvbnRyb2wgdW5pdCBzZXR0aW5ncyI6Cj4gPiBodHRwczovL2dpdGh1Yi5j
b20vc3lzdGVtZC9zeXN0ZW1kL2Jsb2IvdjI1OC4yL1JFQURNRSNMMTM0LUwxMzUKPgo+IFllcywg
aWYgeW91IHVzZSB0aGVtPwoKU29tZSBwYWNrYWdlIHVuaXQgZmlsZXMgcHJlc3VtYWJseSBtYXkg
dXNlIHRoZW0gYXMgd2VsbD8KCj4KPiA+Cj4gPiA+IC0KPiA+ID4gLSAgICAgICAkKGNhbGwgS0NP
TkZJR19FTkFCTEVfT1BULENPTkZJR19FRklWQVJfRlMpCj4gPiA+IC0gICAgICAgJChjYWxsIEtD
T05GSUdfRU5BQkxFX09QVCxDT05GSUdfRUZJX1BBUlRJVElPTikKPiA+Cj4gPiBUaGVzZSBhcmUg
cmVxdWlyZWQgIkZvciBVRUZJIHN5c3RlbXMiIDoKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0
ZW1kL3N5c3RlbWQvYmxvYi92MjU4LjIvUkVBRE1FI0wxNTMtTDE1NQo+Cj4gT25seSBpZiB5b3Ug
d2FudCB0byBtYW5hZ2UgdGhlIGJvb3Rsb2FkZXIgd2l0aCBzeXN0ZW1kIGFuZCBmcm9tIHdpdGhp
bgo+IHRoZSBzeXN0ZW0uIE5vdCByZWFsbHkgaW50ZXJlc3RpbmcgZm9yIGEgc2V0dXAgdGhhdCBi
YXJlbHkgd2lsbCBiZSB0dXJuZWQgb2ZmLgoKVGhhdCdzIG5vdCBlbnRpcmVseSBjbGVhciwgRUZJ
VkFSX0ZTIGlzIG9ubHkgZW5hYmxlZCBvbiBFRkkgc3lzdGVtczoKaHR0cHM6Ly9naXRodWIuY29t
L3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjYuMTcvZnMvZWZpdmFyZnMvS2NvbmZpZyNMNAoKSSB0aGlu
ayBFRklfUEFSVElUSU9OIGlzIG5lZWRlZCBmb3IgcGFydGl0aW9uIGRpc2NvdmVyeSBmZWF0dXJl
czoKaHR0cHM6Ly93d3cuZnJlZWRlc2t0b3Aub3JnL3NvZnR3YXJlL3N5c3RlbWQvbWFuL2xhdGVz
dC9zeXN0ZW1kLWdwdC1hdXRvLWdlbmVyYXRvci5odG1sCgo+ID4gPiAtCj4gPiA+IC0gICAgICAg
JChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfRE1JKQo+ID4gPiAtICAgICAgICQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0RNSV9TWVNGUykKPiA+Cj4gPiBUaGVzZSBhcmUg
IlJlcXVpcmVkIGZvciByZWFkaW5nIGNyZWRlbnRpYWxzIGZyb20gU01CSU9TIjoKPiA+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvYmxvYi92MjU4LjIvUkVBRE1FI0wxNjZDOS1M
MTY4Cj4KPiBXaGF0IHNob3VsZCBJIGRvIHdpdGggdGhvc2U/CgpUaGVyZSBzZWVtcyB0byBiZSBh
IGRlY2VudCBiaXQgb2Ygc3lzdGVtZCBmdW5jdGlvbmFsaXR5IHVzaW5nIGRtaQpzeXNmcyBpbiBn
ZW5lcmFsLgoKPgo+IEkgY2FuIHJlYWQgdGhlIFJlYWRtZSBidHcuCj4KPiBJIHVzZWQgQlIgMjAy
NC4wMiBiZWZvcmUsIHRoZSBzeXN0ZW0gZG9lcyB3aGF0IGl0IHNob3VsZCwgaXRzIG5vdCBhCj4g
dXNlciBmYWNpbmcgZGVza3RvcCBzeXN0ZW0sCj4gYW5kIEkgd291bGQgd2FudCB0aGUga2VybmVs
IGNvbXBpbGVkIGFzIEkgc3BlY2lmeSBpdC4gU2V2ZXJhbCBvZiB0aG9zZQo+IG9wdGlvbnMgY29t
cGxpY2F0ZQo+IHNldHVwIG9yIGNhbiBpbXBlZGUgcmVhbHRpbWUgY2hhcmFjdGVyaXN0aWNzLgo+
Cj4gTm93ICBCUiAyMDI1LjAyIHNpbGVudGx5IG1vZGlmaWVzIHRoZSBhdWRpdGVkIGtlcm5lbCBj
b25maWcgd2l0aCBzdHVmZiB0aGF0J3MKPgo+IC0gbm90IG5lZWRlZCB0byBzdGFydAo+IC0gbm90
IHVzZWQgYnkgdGhlIHNlcnZpY2UgZmlsZXMgc2hpcHBpbmcgd2l0aCBzeXN0ZW1kCj4gLSBjYW50
IGJlIHByZXZlbnRlZCB0byBiZSBlbmFibGVkCj4KPiBJdHMgYSB2YWxpZCBzY2hlbWUgZm9yIERl
c2t0b3Agc3lzdGVtcyB0byBlbmFibGUgZXZlcnl0aGluZywKPiBpbiBhdXRvbWF0aW9uIGl0cyBh
IGxpYWJpbGl0eS4KCk1heWJlIHRoZXNlIG9wdGlvbnMgc2hvdWxkIGJlIHNwbGl0IG91dCBpbnRv
IGJlaW5nIGtjb25maWcgY29udHJvbGxlZApieSBidWlsZHJvb3QsIHdpdGggZGVmYXVsdCBlbmFi
bGVkIGFzIHByZXN1bWFibHkgbW9zdCBwZW9wbGUgd2lsbApleHBlY3Qgc3lzdGVtZCB0byBub3Qg
aGF2ZSByYW5kb20gYnJva2VuIGZ1bmN0aW9uYWxpdHkuCgpJIGRvbid0IHRoaW5rIHRoZXkgc2hv
dWxkIGJlIHJlbW92ZWQgZW50aXJlbHkgYXMgaGF2aW5nIHJhbmRvbQpzeXN0ZW1kIGZlYXR1cmVz
IGJyb2tlbiBpcyBhIGJpdCB1bmV4cGVjdGVkIGFuZCBkaWZmaWN1bHQgdG8gZGVidWcuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
