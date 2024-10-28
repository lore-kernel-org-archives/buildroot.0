Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAC3D3E2BA
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 19:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE9954064F;
	Mon, 28 Oct 2024 19:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0IY86DPLR8i; Mon, 28 Oct 2024 19:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F22E40648
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F22E40648;
	Mon, 28 Oct 2024 19:19:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E63D9112A
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4EA260854
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kFB0Sp1euoyB for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 19:19:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a36; helo=mail-vk1-xa36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B680F607D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B680F607D0
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B680F607D0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 19:19:30 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-50d4a333a87so1181196e0c.1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 12:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730143169; x=1730747969;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KRRg8lgOU53v5p6kBy3L0Gcoz/U8DwpwmEtqxClYhck=;
 b=Vm/VtkBZQNfeMd/lf0PvgXIj0GvoXU2vPAH0jGKKmTo8Xu8DMUPFJR8fRUEiGVwlOg
 hr9aEATj1Zi6B0jccVWjSFM2wavNFqLRq7URXg0n4ONF/VY06jGr+ad/JQ2N+79/smJM
 PxUtWgZjmYzXsLr52l+78YuRCAX7241jAdkLKgJQWCoy+5Cd7VNI2C9PcFJz2XQToqwC
 N2Eb8X2DMdqrCBwUzBDRQtyqwyThbjkWJtofXeyozUUzO3yFTRT9CG0pJbHZ+zHsXUnk
 uoXfiCnYzo+rU35LYUynnddb+4/FR6qWSJ/cmXccqX1kOYE3EUxaLwHcG24Nz/YpGR9O
 3grg==
X-Gm-Message-State: AOJu0YwOA7sKcxAImWmBmdXqO+QqIiTYZ+uylYLc8hZ0euuC/H07aB3i
 ORwX57hqJcQFA258HWWwKDiXcBA8Xy+91g1SrNyUe8dlI/vzkuOMR/d6ukvlPKanbe/qXrnqFXp
 /iKlzN3/LxT/iSiK3owI+hNlSNT0=
X-Google-Smtp-Source: AGHT+IEhrXK0eiiPAmriuHiyvAERoel7hD5hkUThSZGu/aaGHRjWE2ALQnphFpNaCuxIJcquA9MDSSYT+yqwjjV++rI=
X-Received: by 2002:a05:6122:3090:b0:50d:2769:d757 with SMTP id
 71dfb90a1353d-5101511c27dmr6668100e0c.11.1730143169313; Mon, 28 Oct 2024
 12:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241028161507.186161-1-james.hilliard1@gmail.com>
 <CA+h8R2qYNcoSOe7-ZwcR3m9A7n+kPGHtFUVWaYCDRyy=WvMvzQ@mail.gmail.com>
In-Reply-To: <CA+h8R2qYNcoSOe7-ZwcR3m9A7n+kPGHtFUVWaYCDRyy=WvMvzQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 28 Oct 2024 13:19:18 -0600
Message-ID: <CADvTj4o_e=z+Y5LF_RtF7t36qRjom2OjGLMnmvm=CgGYJQ0hTQ@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
Cc: Buildroot Mailing List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730143169; x=1730747969; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KRRg8lgOU53v5p6kBy3L0Gcoz/U8DwpwmEtqxClYhck=;
 b=jcigd3YRV4+Ex/t2CNJ3h+Sdi0MjUyvloaSPyV3p0jVfo1e7jJovacau480hDER0FU
 HBxAO8cjkdeo+DPK7kuTkXkJjItK8wQD9jn3OidEMzZnhcEeF9lUS040JuSSy7VHqhuS
 BqL3E1sRT8leqb5wtfxYSpgaJwx7Jl0sxfVvf9qcm5LOj1ORtIq/CUr9oBYg2W2HLp6C
 W8rfY5o/D6VK0dcNGkzfY+u5/HWjqpfOhHaixAkj5RDN0YbXeogzcpQgYP3LBCTEqyfQ
 /7LWNZXhae0PPYNEVBgcWMBx+FyW9ht3j1kJzMv7rWWLkaegVv+uNk9JPWmbw1UHpCSB
 cVYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jcigd3YR
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pkg-golang.mk: make GOPROXY
 configurable
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

T24gTW9uLCBPY3QgMjgsIDIwMjQgYXQgMTI6NTTigK9QTSBDaHJpc3RpYW4gU3Rld2FydAo8Y2hy
aXN0aWFuQGFwZXJ0dXJlLnVzPiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gT24gTW9uLCBPY3Qg
MjgsIDIwMjQsIDk6MTXigK9BTSBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4gd3JvdGU6Cj4+Cj4+IFNvbWUgcGFja2FnZXMgbGlrZSB0aGUgdXBjb21pbmcgbmV0Ymly
ZCBwYWNrYWdlIGRvbid0IHdvcmsKPj4gY29ycmVjdGx5IHdpdGggR09QUk9YWT1kaXJlY3Qgd2hp
Y2ggaXMgbm90IHRoZSBkZWZhdWx0IHNldHRpbmcKPj4gZm9yIHRoZSBnbyB0b29sY2hhaW4uCj4K
Pgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9uZXRiaXJkaW8vbmV0YmlyZC9wdWxsLzI3ODkKPgo+IFdo
aWxlIGl0IGlzIGEgZ29vZCBpZGVhIHRvIGFkZCB0aGlzIG9wdGlvbiwgSSBkb24ndCB0aGluayBt
ZW50aW9uaW5nIG5ldGJpcmQgaXMgbmVjZXNzYXJ5IHNpbmNlIHRoZSBpbnRlbnQgb2YgdGhpcyBv
cHRpb24gaXMgbm90IHRvIG1ha2UgcGFja2FnZXMgdGhhdCB3b24ndCB3b3JrIHdpdGggR09QUk9Y
WSBkaXJlY3Qgd29yay4gSXQncyBqdXN0IGZvciB0aGUgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnQu
CgpJTU8gbWFraW5nIHRoZSBidWlsZCB3b3JrIHdoZW4gZGlyZWN0IGRvZXNuJ3QgaXMgb25lIG9m
IHRoZSB1c2UgY2FzZXMsCm1vc3RseSBkdWUgdG8gdGhlIHBvdGVudGlhbCBmb3IgZGlyZWN0IGRv
d25sb2FkcyBicmVha2luZyByYW5kb21seS4KCkFzIEdPUFJPWFk9Imh0dHBzOi8vcHJveHkuZ29s
YW5nLm9yZyxkaXJlY3QiIGlzIHRoZSBnb2xhbmcgZGVmYXVsdCBpdCdzCndoYXQgb25lIHNob3Vs
ZCBleHBlY3QgdXBzdHJlYW0gcHJvamVjdHMgdG8gYmUgdGVzdGluZyB3aXRoIGFuZCB0aGUKbW9z
dCBpbXBvcnRhbnQgY29uZmlndXJhdGlvbiB0byBoYXZlIGZ1bmN0aW9uYWwuIEJ1aWxkaW5nIHdp
dGggb25seSBkaXJlY3QKaXMgSU1PIGEgbm9uLXN0YW5kYXJkIGNvbmZpZ3VyYXRpb24gdGhhdCB3
aGlsZSBuaWNlIHRvIGhhdmUgd29ya2luZwpzaG91bGRuJ3QgYmxvY2sgdXBkYXRpbmcgcGFja2Fn
ZXMgYnkgaXRzZWxmLgoKPgo+IFdoZW4gbWVyZ2luZyBwYWNrYWdlcyBJJ2Qgc3RpbGwgZXhwZWN0
IHVzIHRvIHRlc3QgaXQgd2l0aCBHT1BST1hZIGRpcmVjdCBhcyB3ZWxsLgoKUG9zc2libHksIGhv
d2V2ZXIgYXMgR09QUk9YWT1kaXJlY3QgaXMgYSBub24tZGVmYXVsdCBjb25maWd1cmF0aW9uCkkg
dGhpbmsgaXQncyBsZXNzIGltcG9ydGFudCBmb3IgYnVpbGRyb290IGl0c2VsZi4KCj4KPj4gTGV0
cyBtYWtlIHRoZSBHT1BST1hZIHNldHRpbmcgY29uZmlndXJhYmxlIGFuZCB1c2UgdGhlIGRlZmF1
bHQKPj4gdG9vbGNoYWluIHNldHRpbmcgd2hpY2ggaXMgbW9zdCBsaWtlbHkgdG8gYmUgd2hhdCBw
YWNrYWdlcyBlbmQKPj4gdXAgdHlwaWNhbGx5IGJlaW5nIHRlc3RlZCBhZ2FpbnN0Lgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4K
Pj4gLS0tCj4+ICBDb25maWcuaW4gICAgICAgICAgICAgfCAxMSArKysrKysrKysrKwo+PiAgcGFj
a2FnZS9wa2ctZ29sYW5nLm1rIHwgIDIgKy0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvQ29uZmlnLmluIGIvQ29u
ZmlnLmluCj4+IGluZGV4IGRmNDNkYjdlZmYuLmFkNmFjMzg2NTYgMTAwNjQ0Cj4+IC0tLSBhL0Nv
bmZpZy5pbgo+PiArKysgYi9Db25maWcuaW4KPj4gQEAgLTI1OCw2ICsyNTgsMTcgQEAgY29uZmln
IEJSMl9QUklNQVJZX1NJVEVfT05MWQo+PiAgICAgICAgICAgdGhlIHByb2plY3QgY2FuIGJlIGJ1
aWx0IGV2ZW4gaWYgdGhlIHVwc3RyZWFtIHRhcmJhbGwKPj4gICAgICAgICAgIGxvY2F0aW9ucyBk
aXNhcHBlYXIuCj4+Cj4+ICtjb25maWcgQlIyX0dPUFJPWFlfTElTVAo+PiArICAgICAgIHN0cmlu
ZyAiR09QUk9YWSBsaXN0Igo+PiArICAgICAgIGRlZmF1bHQgImh0dHBzOi8vcHJveHkuZ29sYW5n
Lm9yZyxkaXJlY3QiCj4+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX0dPX1RB
UkdFVF9BUkNIX1NVUFBPUlRTCj4+ICsgICAgICAgaGVscAo+PiArICAgICAgICAgTGlzdCBvZiBt
b2R1bGUgcHJveHkgVVJMcy4gVGhlIGdvIGNvbW1hbmQgd2lsbCBhdHRlbXB0IHRvCj4+ICsgICAg
ICAgICBkb3dubG9hZCBtb2R1bGVzIGZyb20gZWFjaCBzZXJ2ZXIgaW4gc2VxdWVuY2UuIFRoZSBr
ZXl3b3JkCj4+ICsgICAgICAgICBkaXJlY3QgaW5zdHJ1Y3RzIHRoZSBnbyBjb21tYW5kIHRvIGRv
d25sb2FkIG1vZHVsZXMgZnJvbQo+PiArICAgICAgICAgdmVyc2lvbiBjb250cm9sIHJlcG9zaXRv
cmllcyB3aGVyZSB0aGV54oCZcmUgZGV2ZWxvcGVkIGluc3RlYWQKPj4gKyAgICAgICAgIG9mIHVz
aW5nIGEgcHJveHkuCj4KPgo+IFdoeSBkbyB3ZSBwdXQgdGhpcyBoZXJlIGFzIG9wcG9zZWQgdG8K
Pgo+IEJSMl9QQUNLQUdFX0dPX0dPUFJPWFkKPgo+IEknbSBub3QgYWdhaW5zdCBpdCwgYnV0IGl0
J3MgYSBxdWVzdGlvbiB0aGF0IGNvbWVzIHRvIG1pbmQuCj4KPiBBbHNvLCB3aHkgR09QUk9YWV9M
SVNUIGluc3RlYWQgb2YganVzdCBHT1BST1hZPwoKSSBmaWd1cmVkIGl0IHdhcyBhIGJpdCBtb3Jl
IGRlc2NyaXB0aXZlIHNpbmNlIHRoZSB2YXJpYWJsZSBpcyBhIGxpc3Qgb2YKZ29wcm94aWVzIGVz
c2VudGlhbGx5LCBkb2Vzbid0IG1hdHRlciBtdWNoIHRvIG1lLgoKPgo+IE90aGVyd2lzZSBsb29r
cyBnb29kLgo+Cj4gQmVzdCByZWdhcmRzLAo+IENocmlzdGlhbiBTdGV3YXJ0Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
