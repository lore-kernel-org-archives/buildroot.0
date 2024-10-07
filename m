Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC0BCFB43F
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 14:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72C2580DC7;
	Mon,  7 Oct 2024 14:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSHEbBahi5FB; Mon,  7 Oct 2024 14:54:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C0F80DCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82C0F80DCA;
	Mon,  7 Oct 2024 14:54:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83C331BF589
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 14:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8050380DC5
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 14:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7RN6Bt9u8Da for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 14:54:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=aduskett@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9D9CC80DC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D9CC80DC0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D9CC80DC0
 for <buildroot@busybox.net>; Mon,  7 Oct 2024 14:54:00 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2e0b93157caso3963253a91.0
 for <buildroot@busybox.net>; Mon, 07 Oct 2024 07:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728312840; x=1728917640;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4GykjlH3RoYWwje+NdDhlIdCzFP4GuNZlaQ/ej9xS2A=;
 b=kOAcxqkLitW3fTYYcvz4pvcUhopJhNfR8J3QvYwaOi6nnQqtPrzc7V5Fdh2ZTVrl8c
 zlmGKZMa2SiugHexdR3VL8FwGS0eTGsVYQNSWMjkDLUQ6uulVyAYox7CK/0TOuG+N7MD
 TnR4hRJSNBBUIMRMDJrbkGMp72KCj6GW+wQshY1PKQ2Z9z6rk71ZywN5PUn6gDqaXv8B
 6Bi81gLyWrb5wD8Porqx5CYl5JJ6WjOKqhT5qn7bKSijSZUjHvnIcRVojbruCeW0qfxs
 tRPpxpuMzLNJkxF0/7+3m1j/ofDfMzSqUzEshzFfYefjUjn5pQPrvKnUdM32JRjWLzaD
 0pPw==
X-Gm-Message-State: AOJu0YzDWXuAxlFJ+UtZVGIllExeTfmWggXv/+RGEi1LlJXwAreYSvrH
 5RsUP47I4ZqvPBDZL3Io9un71XDwXURXk+mZbbrZtcsAoRa/zXlYb8amw7xFNxfJg8LHWgQWHWM
 s3Kn4nQzs396iO4igw9icDfA5oCscz9ZeOEk=
X-Google-Smtp-Source: AGHT+IF+XQj8P7BYrsmgxQapX7f12C8KZ7FYt3xNJRkIS94Cpy3YcyH2EL8MjH8vSR0pXPXsIO6xz4w+16UZI2P8KpU=
X-Received: by 2002:a17:90a:d991:b0:2da:6e46:ad48 with SMTP id
 98e67ed59e1d1-2e1e5b3097emr19062392a91.1.1728312839762; Mon, 07 Oct 2024
 07:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240920181212.3572055-1-francois.perrad@gadz.org>
 <20240920181212.3572055-2-francois.perrad@gadz.org>
In-Reply-To: <20240920181212.3572055-2-francois.perrad@gadz.org>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 7 Oct 2024 16:53:45 +0200
Message-ID: <CAFSsvmoCpWY+RtT8K=eeO9wAfZSrG7Z0NKAFujfg9fCX1ishdg@mail.gmail.com>
To: Francois Perrad <francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728312840; x=1728917640; darn=busybox.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4GykjlH3RoYWwje+NdDhlIdCzFP4GuNZlaQ/ej9xS2A=;
 b=HqrNOjvOn0SPWcEx366CspEzrLrqF7mrQEH5VywZIVPu7lNLkYH2mCF+7tbt3agt5M
 5BrcDaDT99ucLy0BHNRsaqvVW3y5gZZLZm9ODU8gBzG3rEDyJhIb09C0Qbp+D6q+s9fl
 sXV4YSz3jzcbnxFQuuP261ClkZG3CcM1Ff8iRsmTYPCCTg1D6s/aIUREvE23A4Ta5gnk
 aQLDWk2fejL76zwjyvBrKgjfENa8MJ78YYFQht7TXSlB9YBQXykC+rJRScjxx1YK0jE9
 K9PCvjdjVckDC42Lzhp7pH27UDRGSB0U0Dpa4Cz6YU60M8Qp54WkZEbZaHB4GycHAGT+
 vCiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HqrNOjvO
Subject: Re: [Buildroot] [PATCH v2 1/2] package/busybox: handle
 LIBFOO_BUSYBOX_CONFIG_FIXUPS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dGVzdC1ieTogYWRhbSBkdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+CgpPbiBGcmksIFNlcCAy
MCwgMjAyNCBhdCA4OjEz4oCvUE0gRnJhbmNvaXMgUGVycmFkCjxmcmFuY29pcy5wZXJyYWRAZ2Fk
ei5vcmc+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29p
cy5wZXJyYWRAZ2Fkei5vcmc+Cj4gLS0tCj4gIGRvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1n
ZW5lcmljLmFkb2MgfCA2ICsrKysrKwo+ICBwYWNrYWdlL2J1c3lib3gvYnVzeWJveC5tayAgICAg
ICAgICAgICAgIHwgMSArCj4gIHBhY2thZ2UvcGtnLWdlbmVyaWMubWsgICAgICAgICAgICAgICAg
ICAgfCAzICsrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtZ2VuZXJpYy5hZG9jIGIvZG9jcy9t
YW51YWwvYWRkaW5nLXBhY2thZ2VzLWdlbmVyaWMuYWRvYwo+IGluZGV4IDg5ZmM3MDA0NS4uZjBi
MDUwOGY1IDEwMDY0NAo+IC0tLSBhL2RvY3MvbWFudWFsL2FkZGluZy1wYWNrYWdlcy1nZW5lcmlj
LmFkb2MKPiArKysgYi9kb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtZ2VuZXJpYy5hZG9jCj4g
QEAgLTYzMSw2ICs2MzEsMTIgQEAgZGlmZmVyZW50IHN0ZXBzIG9mIHRoZSBidWlsZCBwcm9jZXNz
Lgo+ICAgIFRoaXMgaXMgc2VsZG9tIHVzZWQsIGFzIHBhY2thZ2UgdXN1YWxseSBoYXZlIG5vIHN0
cmljdCByZXF1aXJlbWVudHMgb24KPiAgICB0aGUga2VybmVsIG9wdGlvbnMuCj4KPiArKiArTElC
Rk9PX0JVU1lCT1hfQ09ORklHX0ZJWFVQUysgbGlzdHMgdGhlIEJ1c3lib3ggY29uZmlndXJhdGlv
bgo+ICsgIG9wdGlvbnMgdGhhdCBhcmUgbmVlZGVkIHRvIHVzZSB0aGlzIHBhY2thZ2UgZXNwZWNp
YWxseSBpbiBzb21lIHNjcmlwdHMsCj4gKyAgb3IgYXQgY29udHJhcmlvIHRoZSB1c2VsZXNzIG9w
dGlvbnMuIFRoaXMgc2hhbGwgYmUgYSBzZXQgb2YKPiArICBjYWxscyB0byBvbmUgb2YgdGhlIGtj
b25maWcgdHdlYWtpbmcgb3B0aW9uOiBgS0NPTkZJR19FTkFCTEVfT1BUYCwKPiArICBgS0NPTkZJ
R19ESVNBQkxFX09QVGAsIG9yIGBLQ09ORklHX1NFVF9PUFRgLgo+ICsKPiAgVGhlIHByZWZlcnJl
ZCB3YXkgdG8gZGVmaW5lIHRoZXNlIHZhcmlhYmxlcyBpczoKPgo+ICAtLS0tCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94Lm1rIGIvcGFja2FnZS9idXN5Ym94L2J1c3lib3gu
bWsKPiBpbmRleCAyMDRlYmUwMTAuLmVmNTUyMTEwNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2J1
c3lib3gvYnVzeWJveC5tawo+ICsrKyBiL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94Lm1rCj4gQEAg
LTQxMSw2ICs0MTEsNyBAQCBkZWZpbmUgQlVTWUJPWF9LQ09ORklHX0ZJWFVQX0NNRFMKPiAgICAg
ICAgICQoQlVTWUJPWF9TRVRfU0VMSU5VWCkKPiAgICAgICAgICQoQlVTWUJPWF9TRVRfTEVTU19G
TEFHUykKPiAgICAgICAgICQoQlVTWUJPWF9TRVRfSU5ESVZJRFVBTF9CSU5BUklFUykKPiArICAg
ICAgICQoUEFDS0FHRVNfQlVTWUJPWF9DT05GSUdfRklYVVBTKQo+ICBlbmRlZgo+Cj4gIGRlZmlu
ZSBCVVNZQk9YX0JVSUxEX0NNRFMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctZ2VuZXJpYy5t
ayBiL3BhY2thZ2UvcGtnLWdlbmVyaWMubWsKPiBpbmRleCAxNzExNjNkY2IuLmZlY2I2OGZjNiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCj4gKysrIGIvcGFja2FnZS9wa2ct
Z2VuZXJpYy5tawo+IEBAIC0xMjM3LDYgKzEyMzcsOSBAQCBlbmRpZgo+ICBpZm5lcSAoJCQoJCgy
KV9VU0VSUyksKQo+ICBQQUNLQUdFU19VU0VSUyArPSAkJCgkKDIpX1VTRVJTKSQkKHNlcCkKPiAg
ZW5kaWYKPiAraWZuZXEgKCQkKCQoMilfQlVTWUJPWF9DT05GSUdfRklYVVBTKSwpCj4gK1BBQ0tB
R0VTX0JVU1lCT1hfQ09ORklHX0ZJWFVQUyArPSAkJCgkKDIpX0JVU1lCT1hfQ09ORklHX0ZJWFVQ
UykkJChzZXApCj4gK2VuZGlmCj4gIGlmbmVxICgkJCgkKDIpX0xJTlVYX0NPTkZJR19GSVhVUFMp
LCkKPiAgUEFDS0FHRVNfTElOVVhfQ09ORklHX0ZJWFVQUyArPSAkJCgkKDIpX0xJTlVYX0NPTkZJ
R19GSVhVUFMpJCQoc2VwKQo+ICBlbmRpZgo+IC0tCj4gMi40My4wCj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
