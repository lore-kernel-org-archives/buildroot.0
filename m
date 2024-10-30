Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08EED5CCAA
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 13:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C394027F;
	Wed, 30 Oct 2024 13:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KTbJNm1LeLu; Wed, 30 Oct 2024 13:28:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F7A40491
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F7A40491;
	Wed, 30 Oct 2024 13:28:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BB7F494E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AF14608A6
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RLaVPQOtgk74 for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 13:28:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E55D66079E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E55D66079E
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E55D66079E
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:28:38 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2fb5014e2daso63839701fa.0
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 06:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730294917; x=1730899717;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aDBSuGYtWEt7faljCnmKhLAKsVA/ACz35MdhfgofvQk=;
 b=jtMajfgAW0zXFE7Tlu9zI1XI2HS2nrU9WW0aleecosKYuvqwSR1ILdmNYwcmOhSM1P
 jnPujVh0BCiOdIE9+9SYs3mvdVQyt2dzFacZwj/hkNAzAopaUbn+RTu1f6T/WAkbMdAU
 42cexcjW4F3+E6lXjMDrNos4uIlLSZ/c8pweBv+hw3Fr4tXO46+KBlDh/dsyQyo2hdkq
 DE0SMpi2yzdvyVwGOenymvessADxnd/IE4YfvM4MkDxzDvhDxAB9cYOAcePMfwVAYK6P
 PStD+8+A3WrjJcF/uW1SWLmELVnP8KeIqq6Yt63CliHuVT5kVt/icfXm2s1YOXO7OK2E
 x82Q==
X-Gm-Message-State: AOJu0YwioTb3PvrcyLMlY9h+w+YEHhx6JXMbQ81LxlleL5U1JNICcmJI
 ZkFEPZ+iZ2+q6D1WPGXFOZdEHSCCPnr7v3R4xDj0pyzl9zK+Viukl04K2GXQQX6cMIOll860J+z
 jXomXp1+bbOUdpLvVesbolehfsa0=
X-Google-Smtp-Source: AGHT+IFP6KVp7PiKwTuAd5t/cF/JinVCjhl/HM1dic4BplpV76VPmwIXBot+P2Bqf2vUbTM6UbjWzPVaWnn3EqyqFdM=
X-Received: by 2002:a05:651c:1545:b0:2fb:65c8:b4ae with SMTP id
 38308e7fff4ca-2fcbe08db35mr71179141fa.31.1730294916236; Wed, 30 Oct 2024
 06:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <20241024002847.10348-1-fancp2007@gmail.com>
 <20241029054713.786223-1-fancp2007@gmail.com>
 <20241029195016.27fc140d@windsurf>
In-Reply-To: <20241029195016.27fc140d@windsurf>
From: Scott Fan <fancp2007@gmail.com>
Date: Wed, 30 Oct 2024 21:28:24 +0800
Message-ID: <CAFkzVZZc=i02CTkxRHSXwrQb=BALPtxD0sSQudCoLtVOj+qfYg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Asaf Kahlon <asafka7@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730294917; x=1730899717; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aDBSuGYtWEt7faljCnmKhLAKsVA/ACz35MdhfgofvQk=;
 b=iCF8PDoAt+cNdOV6YF4QWc6VMGRE1j5gJoyscJ78VRIBBcrU85tGsQddo7cX7tiTCe
 J7VPvCWpKoDxGnD/wk9o3uTpG16H9i9d294bDp9ujYNgqgcpjNqLKvEvGDMogDbCqI6l
 xq3LxU9vekQ7bJ0tPpM91ADWY+hgszGR42jvLPqd6xlXkTXpkCKyFRM6RHwb/SAzpcWk
 nBAdEK8HeVxcCaauebl8VuwE+cNyXaRt8fx7YUOdV+jE3j8gBbN+vlK1UU+J6fVLcUcB
 K6KPsP83gEMzLe09pZtiSzDgymqIDnyJgbs8kEVArUsC8HvJoWS6F53pKXXAd0axNLAu
 OboA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iCF8PDoA
Subject: Re: [Buildroot] [PATCH v3] package/python-pgcopy: new package
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

SGkgVGhvbWFzLAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIFdlZCwgT2N0IDMwLCAyMDI0
IGF0IDI6NTDigK9BTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4u
Y29tPiB3cm90ZToKPgo+IEhlbGxvIFNjb3R0LAo+Cj4gVGhhbmtzIGZvciB0aGlzIG5ldyBpdGVy
YXRpb24hIFNvbWUgc21hbGwgY29tbWVudHMvcXVlc3Rpb25zIGJlbG93Lgo+Cj4gSmFtZXM6IGlm
IHlvdSBjb3VsZCByZXZpZXcsIGlmIHdvdWxkIGJlIHZlcnkgaGVscGZ1bC4gVGhhbmtzIQo+Cj4g
T24gVHVlLCAyOSBPY3QgMjAyNCAxMzo0NzoxMSArMDgwMAo+IFNjb3R0IEZhbiA8ZmFuY3AyMDA3
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiA+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ID4gIHBhY2thZ2UvcHl0aG9uLXBnY29weS9Db25maWcuaW4gICAg
ICAgICAgfCAxOCArKysrKysrKysrKysrKysrCj4gPiAgcGFja2FnZS9weXRob24tcGdjb3B5L3B5
dGhvbi1wZ2NvcHkuaGFzaCB8ICA1ICsrKysrCj4gPiAgcGFja2FnZS9weXRob24tcGdjb3B5L3B5
dGhvbi1wZ2NvcHkubWsgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDQgZmls
ZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQo+Cj4gQW4gZW50cnkgaW4gdGhlIERFVkVMT1BF
UlMgZmlsZSBzaG91bGQgYmUgYWRkZWQuCgpJJ2xsIGFkZCBvbmUgZW50cnkgZm9yIG1lIGxhdGVy
LgoKPgo+Cj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcGdjb3B5L0NvbmZpZy5pbiBi
L3BhY2thZ2UvcHl0aG9uLXBnY29weS9Db25maWcuaW4KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5iNWJkZTdjM2IwCj4gPiAtLS0gL2Rldi9udWxsCj4gPiAr
KysgYi9wYWNrYWdlL3B5dGhvbi1wZ2NvcHkvQ29uZmlnLmluCj4gPiBAQCAtMCwwICsxLDE4IEBA
Cj4gPiArY29uZmlnIEJSMl9QQUNLQUdFX1BZVEhPTl9QR0NPUFkKPiA+ICsgICAgIGJvb2wgInB5
dGhvbi1wZ2NvcHkiCj4gPiArICAgICBkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBwb3N0Z3Jl
c3FsCj4gPiArICAgICBkZXBlbmRzIG9uICFCUjJfT1BUSU1JWkVfRkFTVCAjIHBvc3RncmVzcWwK
Pgo+IFlvdSBhbHNvIG5lZWQgQlIyX1VTRV9NTVUgZnJvbSBwb3N0Z3Jlc3FsLCBhbmQgIUJSMl9T
VEFUSUNfTElCUyBmcm9tCj4gcG9zdGdyZXNxbC4KCkknbGwgZml4IGl0IGxhdGVyLiBUaGFua3Mg
Zm9yIHlvdXIgcmVtaW5kZXIuCgo+Cj4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1w
Z2NvcHkvcHl0aG9uLXBnY29weS5tayBiL3BhY2thZ2UvcHl0aG9uLXBnY29weS9weXRob24tcGdj
b3B5Lm1rCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMDlm
ZDdlYTU4NAo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS9weXRob24tcGdjb3B5
L3B5dGhvbi1wZ2NvcHkubWsKPiA+IEBAIC0wLDAgKzEsMjcgQEAKPiA+ICsjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwo+ID4gKyMKPiA+ICsjIHB5dGhvbi1wZ2NvcHkKPiA+ICsjCj4gPiArIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKPiA+ICsKPiA+ICtQWVRIT05fUEdDT1BZX1ZFUlNJT04gPSAxLjYu
MAo+ID4gK1BZVEhPTl9QR0NPUFlfU09VUkNFID0gcGdjb3B5LSQoUFlUSE9OX1BHQ09QWV9WRVJT
SU9OKS50YXIuZ3oKPiA+ICtQWVRIT05fUEdDT1BZX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvYjAvN2QvYTVjODMzZjkyMWIyMGNkYjFlODUzOGU3MmE2MDY1
YmNjNjdiYmIyNzBmYTdhMzVlOThmMmQzOTdjZTBjCj4gPiArUFlUSE9OX1BHQ09QWV9TRVRVUF9U
WVBFID0gc2V0dXB0b29scwo+ID4gK1BZVEhPTl9QR0NPUFlfTElDRU5TRSA9IE1JVAo+ID4gK1BZ
VEhPTl9QR0NPUFlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UudHh0Cj4gPiArUFlUSE9OX1BHQ09Q
WV9ERVBFTkRFTkNJRVMgPSBwb3N0Z3Jlc3FsIHB5dGhvbi1wc3ljb3BnMiBweXRob24tcHl0ego+
Cj4gQXJlIHlvdSBzdXJlIHB5dGhvbi1wc3ljb3BnMiBhbmQgcHl0aG9uLXB5dHogYXJlIGJ1aWxk
LXRpbWUKPiBkZXBlbmRlbmNpZXM/IEkuZSBhcmUgdGhleSBuZWVkZWQgZHVyaW5nIHRoZSBidWls
ZCwgb3Igb25seSBhdCBydW50aW1lPwoKSW4gcGdjb3B5J3Mgc2V0dXAucHkgZmlsZSwgaGFzIHRo
ZSBuZXh0IGxpbmU6Cmluc3RhbGxfcmVxdWlyZXM9WyJwc3ljb3BnMiIsICJweXR6Il0KClNvIEkg
dW5kZXJzdGFuZCwgdGhvc2UgYXJlIGJ1aWxkLXRpbWUgZGVwZW5kZW5jaWVzLgpNZWFud2hpbGUs
IHRoZSBwc3ljb3BnMiBtb2R1bGUgZGVwZW5kcyBvbiBwb3N0Z3Jlcy4KRG8gSSBuZWVkIHRvIHJl
bW92ZSBwb3N0Z3JlcyBkZXBlbmRlbmN5IGZyb20gdGhpcyBwYWNrYWdlPwoKPgo+ID4gK2RlZmlu
ZSBQWVRIT05fUEdDT1BZX0NMRUFOX1BZMl9TQ1JJUFQKPiA+ICsgICAgICQoUk0pICQoQEQpL3Bn
Y29weS9lcnJvcnMvcHkyLnB5Cj4gPiArZW5kZWYKPiA+ICtQWVRIT05fUEdDT1BZX1BPU1RfRVhU
UkFDVF9IT09LUyArPSBQWVRIT05fUEdDT1BZX0NMRUFOX1BZMl9TQ1JJUFQKPgo+IFdoYXQgaXMg
dGhpcyBob29rIG5lZWRlZD8gQSBzbWFsbCBjb21tZW50IHdvdWxkIGJlIHVzZWZ1bC4KClRoZSBw
eTIucHkgZmlsZSBpcyBqdXN0IGZvciBQeXRob24gMiwgaXQgd2lsbCBjYXVzZSBjb21waWxhdGlv
biBlcnJvcnMKaW4gQnVpbGRyb290OgogIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTIvc2l0ZS1w
YWNrYWdlcy9wZ2NvcHkvZXJyb3JzL3B5Mi5weSIsIGxpbmUgMTkKICAgIHJhaXNlIG5ld2V4Yywg
Tm9uZSwgc3lzLmV4Y19pbmZvKClbMl0KICAgICAgICAgICAgICAgIF4KU3ludGF4RXJyb3I6IGlu
dmFsaWQgc3ludGF4CgpJJ2xsIGFkZCBhIGNvbW1lbnQgYmVmb3JlIHRoZSBob29rIGRlZmluaXRp
b24uCgo+Cj4gPiArCj4gPiArIyBGb3JjZSBwZ2NvcHkgdG8gdXNlIHRoZSBCdWlsZHJvb3QgcHJv
dmlkZWQgcG9zdGdyZXNxbCB2ZXJzaW9uCj4gPiArIyBpbnN0ZWFkIG9mIHRoZSBvbmUgZnJvbSB0
aGUgaG9zdCBtYWNoaW5lCj4gPiArZGVmaW5lIFBZVEhPTl9QR0NPUFlfQ1JFQVRFX1NFVFVQX0NG
Rwo+ID4gKyAgICAgcHJpbnRmICJbYnVpbGRfZXh0XVxuZGVmaW5lPVxucGdfY29uZmlnPSQoU1RB
R0lOR19ESVIpL3Vzci9iaW4vcGdfY29uZmlnXG4iID4gJChARCkvc2V0dXAuY2ZnCj4gPiArZW5k
ZWYKPiA+ICtQWVRIT05fUEdDT1BZX1BSRV9DT05GSUdVUkVfSE9PS1MgKz0gUFlUSE9OX1BHQ09Q
WV9DUkVBVEVfU0VUVVBfQ0ZHCgpUaGlzIGhvb2sgd2lsbCBiZSByZW1vdmVkLCBpIGNvcGllZCBp
dCBmcm9tIHBhY2thZ2UvcHl0aG9uLXBzeWNvcGcyLApJdCBpcyByZWR1bmRhbnQuCgo+ID4gKwo+
ID4gKyQoZXZhbCAkKHB5dGhvbi1wYWNrYWdlKSkKPgo+IE90aGVyd2lzZSwgc291bmRzIHJlYXNv
bmFibGUgdG8gbWUuCgoKU2NvdHQgRmFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
