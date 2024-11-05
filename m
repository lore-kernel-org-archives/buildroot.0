Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80433D3E779
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 22:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 483DA80F1E;
	Tue,  5 Nov 2024 22:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zaDaaKPmBsK; Tue,  5 Nov 2024 22:11:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BFD281165
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFD281165;
	Tue,  5 Nov 2024 22:11:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3806B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3CE4400F8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nsxncCPsAC04 for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 22:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2d; helo=mail-vk1-xa2d.google.com;
 envelope-from=alistair23@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E733400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E733400EF
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E733400EF
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:11:54 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-50d4a6ef70aso2011287e0c.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 14:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730844713; x=1731449513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y4aG5pz5n4K+qwrpjmVG/wm2D3ZbJSjlU9boxVrH9ds=;
 b=fYQC4CZFAxOEpw8lPSuPdPajvE6uW+CKJzwZkUGvbBEwDjL6Zky8kSaVDyQl47VJno
 n4J3DqvdKAwEISkPfSG1sRR5Kxu+8uHVPzw9QI35y70wpVKJaUE6FeZTTp8hhM1TMIAN
 lmPjcD4MmyybWY2d+VxoYl79u4LPK7BOMGq+u2L+oWrM0kOMqTqjocOqdmLt8WxJRtho
 EHX/cVZpq7kE4jk4L5Ahosi7Le1dUfhNAXWbuHP56E/uZGDH7zKnR+6ZfmXp6he/HSQV
 sysYr7R1vs7gIfrkyvYX4XgTxrPmfpqXJBxFXkHYxa/XdpOV6viPgX67TV4UZAzRTN/S
 JhQA==
X-Gm-Message-State: AOJu0YzE5EtZG0xWQ4yUEFpdKdKbv/JNDNR9lSNY7IbERR35L/2lcdd8
 7rE0vFagN2l7NET+EpJBKHXoBqwk5uqpzkjnxanGQ42WF/U11war3qefbkr3uikU9sFSlI4KSrc
 GQ7Y5bdLZ8F1Jy4Qab60HXCTr6DZOTQ==
X-Google-Smtp-Source: AGHT+IEqHdM31T4sF7ikajQVTR60Qt4bxuiUlK5WmcsX+pzpJ0NGUiobUaX0ASxmLek2VbiwhkDBkbfx8bb6AJLJnSE=
X-Received: by 2002:a05:6122:2502:b0:50a:b604:2bb2 with SMTP id
 71dfb90a1353d-512275639ddmr13542962e0c.11.1730844713134; Tue, 05 Nov 2024
 14:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20241105182308.1216274-1-ju.o@free.fr>
In-Reply-To: <20241105182308.1216274-1-ju.o@free.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Nov 2024 08:11:27 +1000
Message-ID: <CAKmqyKOBGog3M-QF5+hog67TnYVGuMs=uVbfma-MbXAPSNbz-Q@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730844713; x=1731449513; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y4aG5pz5n4K+qwrpjmVG/wm2D3ZbJSjlU9boxVrH9ds=;
 b=JI9R/Z9rCugP0UU/zCnZfF1fawDeKyTdxZGd+DwjUeENEP4PHUicG6Q88rd6pa48VC
 oQJBDGwYK47H3YBVBexSjhw143aIvfmIMqIUKqUdPP0lGMRqqMSSTyO0OQobBtOpYCQO
 P2gapPCZ7/QIzkmd+pRbyWBh8k8zGXKhG1T1iIVqjJQb+xjkrIfNrIH0fbzfPRDjxkJN
 aHXvxJy8XZXvqTsvoV+pLoerZnQx3vewZTeksTvN7ojnIpmms6qAJpOs7o6BXMPJVuXy
 CnueWhOeHUY5g+xvYhP52Z8wW8oVh8L4Dmb2+dpCwlB3qdcekcarJGF7T8DHKVbTMeF6
 XG6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JI9R/Z9r
Subject: Re: [Buildroot] [PATCH 1/1] package/libspdm: fix build due to
 missing macro definition
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

T24gV2VkLCBOb3YgNiwgMjAyNCBhdCA0OjIz4oCvQU0gSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJl
ZS5mcj4gd3JvdGU6Cj4KPiBDb21taXQgOTY3YmE1Mzg2ICJwYWNrYWdlL2xpYnNwZG06IGJ1bXAg
dmVyc2lvbiB0byAzLjUuMCIgWzFdCj4gaW5jb3JyZWN0bHkgcmVtb3ZlZCB0aGUgIjAiIHRvIHRo
ZSBMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX01FTF9DQVAKPiBtYWNybyBkZWZpbml0aW9uLgo+
Cj4gVGhpcyByZXN1bHRzIHRvIGxpYnNwZG0gYnVpbGQgZmFpbHVyZSB3aXRoIGVycm9ycyBsaWtl
Ogo+Cj4gICAgIEluIGZpbGUgaW5jbHVkZWQgZnJvbSAvYnVpbGQvbGlic3BkbS0zLjUuMC9pbmNs
dWRlL2ludGVybmFsL2xpYnNwZG1fY29tbW9uX2xpYi5oOjIwLAo+ICAgICAgICAgICAgICAgICAg
ICAgIGZyb20gL2J1aWxkL2xpYnNwZG0tMy41LjAvbGlicmFyeS9zcGRtX2NvbW1vbl9saWIvbGli
c3BkbV9jb21fY29udGV4dF9kYXRhLmM6NzoKPiAgICAgL2J1aWxkL2xpYnNwZG0tMy41LjAvaW5j
bHVkZS9oYWwvbGlicmFyeS9yZXNwb25kZXIvbWVhc2xpYi5oOjE1NDozODogZXJyb3I6ICNpZiB3
aXRoIG5vIGV4cHJlc3Npb24KPiAgICAgICAxNTQgfCAjaWYgTElCU1BETV9FTkFCTEVfQ0FQQUJJ
TElUWV9NRUxfQ0FQCj4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KPgo+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBpc3N1ZSBieSBhZGRpbmcgYmFjayB0
aGlzIG1pc3NpbmcgIjAiLgo+Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm9yZy9yZXN1bHRzLzg4Y2I3N2EyZTZiNDYwMjhmOWZiN2YwMzI1MzQ4YTFiMWI4ZmQ5MzEKPgo+
IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQv
OTY3YmE1Mzg2ZDRlMTUxMDJkYjg4YTlmYWFlMTg0NWIzZTY5ZGM2Zgo+Cj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KClJldmlld2VkLWJ5OiBBbGlzdGFpciBG
cmFuY2lzIDxhbGlzdGFpci5mcmFuY2lzQHdkYy5jb20+CgpBbGlzdGFpcgoKPiAtLS0KPiBQYXRj
aCB0ZXN0ZWQgKGNvbXBpbGF0aW9uIG9ubHkpIGluOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xp
dmFpbi9idWlsZHJvb3QvLS9waXBlbGluZXMvMTUyODUyMzQ3Mwo+IC0tLQo+ICBwYWNrYWdlL2xp
YnNwZG0vbGlic3BkbS5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0u
bWsgYi9wYWNrYWdlL2xpYnNwZG0vbGlic3BkbS5tawo+IGluZGV4IDA4MWJmZmI5YzEuLjAzYWM5
YTcwZjggMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJzcGRtL2xpYnNwZG0ubWsKPiArKysgYi9w
YWNrYWdlL2xpYnNwZG0vbGlic3BkbS5tawo+IEBAIC0yMCw3ICsyMCw3IEBAIExJQlNQRE1fVEFS
R0VUX0NQVV9GQU1JTFkgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfTElCU1BETV9DUFVf
RkFNSUxZKSkKPiAgTElCU1BETV9DRkxBR1MgPSBcCj4gICAgICAgICAkKFRBUkdFVF9DRkxBR1Mp
IFwKPiAgICAgICAgIC1ETElCU1BETV9FTkFCTEVfQ0FQQUJJTElUWV9FVkVOVF9DQVA9MCBcCj4g
LSAgICAgICAtRExJQlNQRE1fRU5BQkxFX0NBUEFCSUxJVFlfTUVMX0NBUD0gXAo+ICsgICAgICAg
LURMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX01FTF9DQVA9MCBcCj4gICAgICAgICAtRExJQlNQ
RE1fRU5BQkxFX0NBUEFCSUxJVFlfR0VUX0tFWV9QQUlSX0lORk9fQ0FQPTAgXAo+ICAgICAgICAg
LURMSUJTUERNX0VOQUJMRV9DQVBBQklMSVRZX1NFVF9LRVlfUEFJUl9JTkZPX0NBUD0wCj4KPiAt
LQo+IDIuNDcuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
