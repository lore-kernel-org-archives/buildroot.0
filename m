Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9351FD10C07
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E5776075B;
	Sat, 26 Oct 2024 21:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATBo_FU-mF5V; Sat, 26 Oct 2024 21:15:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB1D60752
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB1D60752;
	Sat, 26 Oct 2024 21:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C2315C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D5058136A
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPc5Igi_kFMR for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:15:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51A1680C37
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51A1680C37
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51A1680C37
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:15:16 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id
 71dfb90a1353d-51013e05707so277332e0c.2
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729977315; x=1730582115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kicPSSr0Mfx6yYK0xXdJN6UvtjD0m7T2iZfdh7UC3P0=;
 b=b2vMuaG1dbVjl7MXduPmXMxGEqqFmEsTHJ1f5zJKDKS+9AH7G8cC9DLS8LqIx62W6b
 uTOcSJM9qq1C7JikDfBSigg4lBi+5iL3QrYAiKXChE0MAeMG6My48lAo/quaIypeZlzG
 MrStoQDd1ClJGCVGaKJEtRcT9nTK4KHJGPTvuuHEfXkoPMP0rI/EszKS1zikEY26xhEZ
 k+owQ9Yc1ppmz5L1laJplKwqZsWL3XC9QqR/AYd0fJcUy2dLtNG1J9VbLiXsFagEF4yq
 L9S8sgr5s9tVWDGvsIt2uRQwDwUqwyozi+tbCCgEECp3XG3uZeWMkuRh+Q3jclcZEuPP
 F8yw==
X-Gm-Message-State: AOJu0Yz5AiumK0jGnl9TxQmO8Q5JCkXgpAHgZxo8ayNzmRgAc1YJQnYS
 i7GH+lcGuusUTsEiWSIiqyimFEt280MNdRO9BXFoGxa4lc/j46Rr07UK9c/49UGgHcZAo4ieUfy
 4iJceQpzRhzOkdxj8U9xTjIJ5zxU=
X-Google-Smtp-Source: AGHT+IFHYFS/T7xWHrP9A958RO9U1A+tfQmBpmToz94bPeqmrnTh13sQzLlU3hVBK5ouNqBAlisi630/L+6x3DThHY4=
X-Received: by 2002:a05:6122:1d8a:b0:50d:4b8d:673c with SMTP id
 71dfb90a1353d-51014e9d0b8mr1936036e0c.0.1729977314947; Sat, 26 Oct 2024
 14:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240917021332.3838579-1-james.hilliard1@gmail.com>
 <20241026174451.0b1e2c89@windsurf>
In-Reply-To: <20241026174451.0b1e2c89@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Oct 2024 15:15:03 -0600
Message-ID: <CADvTj4qxs4=Er411V1-baHEVmr9FrTpOWzD3s-3oqM7ppqAb-Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>, 
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729977315; x=1730582115; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kicPSSr0Mfx6yYK0xXdJN6UvtjD0m7T2iZfdh7UC3P0=;
 b=BZMs+HAEAtGmlQV7q0B87Os9+BeR8NObuM7O0FdhaBmkU2D6c3opwR0UUVnX+29N/L
 7WCQ/qUJGkYwRxDR2knZ25cWz+KSaFAN5Dp0csplEOG+LYkTknSsNVp6hW6pgZLYaH6c
 sAy4syKOgNyApAQtG+MTgqKwYDU1M4gKwGmwk+4zoI/F4iIWKWM92kzSSuEEGLavcXaA
 rBGaO5yquWtJNrW6TJq6lWXQhVpEPy4EuaB/cVCVek1jTGtu/LFlHLFzXWzpxPeuUM57
 FzwQ0tbe9F3+ouQIyWLqDMV8YT6LpjOQGKYTDOsjxIdXNAbCMcGHA8DD/qzlgG8rfsS4
 U+VQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BZMs+HAE
Subject: Re: [Buildroot] [PATCH v5 1/3] package/python-numpy: bump to
 version 1.26.4
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

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgOTo0NOKAr0FNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gSmFtZXMsCj4KPiBPbiBN
b24sIDE2IFNlcCAyMDI0IDIwOjEzOjMwIC0wNjAwCj4gSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhp
bGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBXZSBhbHNvIG5lZWQgdG8gc2V0IHRoZSBh
cmNoaXRlY3R1cmUgc3BlY2lmaWMgbG9uZ2RvdWJsZV9mb3JtYXQKPiA+IHByb3BlcnR5IGFzIG51
bXB5IGlzIHVuYWJsZSB0byBkZXRlcm1pbmUgdGhlIHZhbHVlIGZvciB0aGlzIHdpdGhvdXQKPiA+
IGJlaW5nIGFibGUgdG8gZXhlY3V0ZSB0YXJnZXQgYmluYXJpZXMuCj4KPiBQbGVhc2UgZG9jdW1l
bnQgaW4gdGhlIC5tayBmaWxlIGhvdyB5b3UgY291bGQgdGhvc2UgdmFsdWVzLiBZb3UKPiBleHBs
YWluZWQgaXQgaW4gYSByZXBseSB0byB5b3VyIHY0LCBidXQgSSBiZWxpZXZlIGl0IHNob3VsZCBi
ZSBrZXB0IGluCj4gdGhlIHBhY2thZ2UgZm9yIHBvc3Rlcml0eS4gTW9yZSBjb21tZW50IG9uIHRo
aXMgYmVsb3cuCgpOb3Qgc3VyZSB0aGUgYmVzdCB3YXkgdG8gZGVzY3JpYmUgaG93IEkgZ290IHRo
ZXNlLCBsaWtlIHNob3VsZCBJIHB1dCBteQp0ZXN0IG91dHB1dCBzb21ld2hlcmU/Cgo+Cj4gPiAr
aWZlcSAoJChCUjJfYXJjbGUpLHkpCj4gPiArUFlUSE9OX05VTVBZX0xPTkdET1VCTEVfRk9STUFU
ID0gSUVFRV9ET1VCTEVfTEUKPiA+ICtlbHNlIGlmZXEgKCQoQlIyX2FyY2ViKSx5KQo+ID4gK1BZ
VEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCA9IElFRUVfRE9VQkxFX0JFCj4gPiArZWxzZSBp
ZmVxICgkKEJSMl9hYXJjaDY0KSx5KQo+ID4gK1BZVEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1B
VCA9IElFRUVfUVVBRF9MRQo+ID4gK2Vsc2UgaWZlcSAoJChCUjJfYWFyY2g2NF9iZSkseSkKPiA+
ICtQWVRIT05fTlVNUFlfTE9OR0RPVUJMRV9GT1JNQVQgPSBJRUVFX1FVQURfQkUKPiA+ICtlbHNl
IGlmZXEgKCQoQlIyX2FybSkseSkKPiA+ICtQWVRIT05fTlVNUFlfTE9OR0RPVUJMRV9GT1JNQVQg
PSBJRUVFX0RPVUJMRV9MRQo+ID4gK2Vsc2UgaWZlcSAoJChCUjJfYXJtZWIpLHkpCj4gPiArUFlU
SE9OX05VTVBZX0xPTkdET1VCTEVfRk9STUFUID0gSUVFRV9ET1VCTEVfQkUKPiA+ICtlbHNlIGlm
ZXEgKCQoQlIyX2FybWViKSx5KQo+ID4gK1BZVEhPTl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCA9
IElFRUVfRE9VQkxFX0JFCj4KPiBZb3UgaGF2ZSBhcm1lYiB0d2ljZS4KPgo+IEJSMl9pMzg2IGlz
IG5vdCBoYW5kbGVkLgo+Cj4gPiArZWxzZSBpZmVxICgkKEJSMl9vcjFrKSx5KQo+ID4gK1BZVEhP
Tl9OVU1QWV9MT05HRE9VQkxFX0ZPUk1BVCA9IElFRUVfRE9VQkxFX0JFCj4KPiBUaGlzIG9uZSBp
cyBub3QgaW4gdGhlIGNvcnJlY3QgYWxwaGFiZXRpYyBvcmRlcmluZyAobGVzcyBpbXBvcnRhbnQp
Lgo+Cj4gU28sIG92ZXJhbGwsIEknbSB3b25kZXJpbmcgaWYgdGhpcyBzaG91bGRuJ3QgYmUgaGFu
ZGxlZCBpbiB0aGUKPiBDb25maWcuaW4gbWFjaGluZXJ5LCBhcyBmb2xsb3dzOgo+Cj4gIyBTb21l
IGdvb2QgY29tbWVudCBoZXJlIGFib3V0IGhvdyB0aG9zZSB2YWx1ZXMgd2VyZSBmb3VuZAo+IGNv
bmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fTlVNUFlfTE9OR0RPVUJMRV9GT1JNQVQKPiAgICAgICAg
IHN0cmluZwo+ICAgICAgICAgZGVmYXVsdCAiSUVFRV9ET1VCTEVfTEUiIGlmIEJSMl8uLi4gfHwg
QlIyXy4uLiB8fCBCUjJfLi4uCj4gICAgICAgICBkZWZhdWx0ICJJRUVFX0RPVUJMRV9CRSIgaWYg
QlIyXy4uLiB8fCBCUjJfLi4uCj4KPiBjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX05VTVBZX0FS
Q0hfU1VQUE9SVFMKPiAgICAgICAgIGJvb2wKPiAgICAgICAgIGRlZmF1bHQgeSBpZiBCUjJfUEFD
S0FHRV9QWVRIT05fTlVNUFlfTE9OR0RPVUJMRV9GT1JNQVQgIT0gIiIKPgo+IFRoaXMgd2F5IHdl
IGNhbm5vdCBtaXNzIGFueSBjYXNlIDotKQoKWWVhaCwgbm90IHN1cmUgd2hhdCBzdHlsZSBpcyBi
ZXN0LCBJIGtpbmQgb2YganVzdCB3ZW50IHdpdGggdGhpcyBvbmUKYmVjYXVzZSB3ZSBlc3NlbnRp
YWxseSBkbyB0aGUgc2FtZSBzb3J0IG9mIHRoaW5nIGZvciBtZXNvbjoKaHR0cHM6Ly9naXRodWIu
Y29tL2J1aWxkcm9vdC9idWlsZHJvb3QvYmxvYi8yMDI0LjA4LjEvcGFja2FnZS9wa2ctbWVzb24u
bWsjTDMyLUw2OQoKPgo+IENvdWxkIHlvdSBoYXZlIGEgbG9vayBpbnRvIHRoaXM/IEkgd2FudGVk
IHRvIHJld29yayBteXNlbGYsIGJ1dCBzaW5jZQo+IHRoZSB2YWx1ZSBpcyBtaXNzaW5nIGZvciBz
b21lIGFyY2hpdGVjdHVyZXMgKGkzODYpLCBJIGNvdWxkbid0IHJlYWxseQo+IGRvIGl0IGVhc2ls
eS4KCk9oLCBJIGRpZCBhY3R1YWxseSBnZW5lcmF0ZSB0aGF0IHZhbHVlIGhlcmUsIG11c3QgaGF2
ZSBmb3Jnb3R0ZW4gdG8gY29weSBpdDoKaHR0cHM6Ly9naXN0LmdpdGh1Yi5jb20vamFtZXNoaWxs
aWFyZC9iMDU3NzkxYjU1YmQzMjg4NDMwMTczNGRmNWI3ODFkYiNmaWxlLW51bXB5LXFlbXUtdGVz
dC10eHQtTDE2LUwxOAoKU28gaTM4NiB3b3VsZCBiZTogSU5URUxfRVhURU5ERURfMTJfQllURVNf
TEUKCj4KPiBUaGFua3MgYSBsb3QhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
