Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55D4CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 15:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA9840F60;
	Fri, 19 Sep 2025 15:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fWiaVWUqdNvV; Fri, 19 Sep 2025 15:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0F1340F57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0F1340F57;
	Fri, 19 Sep 2025 15:30:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C27AD7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 15:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 222AD40F57
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 15:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxcV3CqgL1aI for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 15:30:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 08E6040F47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08E6040F47
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08E6040F47
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 15:30:17 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso3157553a12.0
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 08:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758295816; x=1758900616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7tG3IzLu5beFwq04PWv4Pf4HPXQJNc7DlJfYBPfnQNI=;
 b=C4ya/O9G3BoYrXDph9z5jxKCn+DOL92zNNS6afbM40TX/b/8d/B2sFdvzaNf/5sNPk
 YpUzGnqRAF7SzVUrWAAkxR5K/AzoVV8lu9LOwx713nN/jUbKuaXBeEac/3o8OyejJZGz
 HL6wQ9LMWHhsy764g6U4MXTUunWklHJEo2ZJHxyjDmZmZqcoLgAMFDlzaPOKJ1CRAzbP
 3sMcQH8UM9BHzp8a4VKB0P1aHX1f7qJAH89RiGyEm2yBbegIcF6Bk9YVMYn210MW8AI8
 JNf83It97i+1eUtRZenSGGir2K9sykzNjqVRMMAZ7wHtLSB3BJGfod8tQ/D8Wmp9LDvs
 0yqg==
X-Gm-Message-State: AOJu0Yw/4s+9LWCVRJmjdHJzIb2bAUzU350PTzi6D7R9vk4AUYjo2/GZ
 prrquKmPrK2RhlnvA6XanMCEgIEtz8DWTfRnPYyTxyoMGRhjoCgyz5sZqsTZa0nrThZguCyZH/u
 Fl+vcIVCF0gucHU2SxMqnJWu4S3dLOfayt9zl
X-Gm-Gg: ASbGnctMOaINDs1ti91pLOOux4j0uIoJeUw7BENH6HeE8KMr0fLoARtHMhrIuXRMKoc
 U50wLTj9U5pFFQyi4vbV2y4C2oug7346r8Yp7AFZMuYwr/KTWZKXDUvl+JUUjW8qQ97aZ56RXg/
 4hOZRhF1B/+5MHILM75GbpRj937hPUklVId+zi0OiHNANFImGVtAzZKp+8ur545FdXZdXWvFEPJ
 vig+ndR5dOevMm8JvM=
X-Google-Smtp-Source: AGHT+IFeky0+KRGwejS73qUe2v3YAlg16nn8ZOXA5JFiV621bE8+ZGUU2cRu8uOck9472ZC/0PTAxBnnlexqIX3GofA=
X-Received: by 2002:a05:6402:44d6:b0:62d:bfd:b3af with SMTP id
 4fb4d7f45d1cf-62fc0a67411mr3032521a12.27.1758295815585; Fri, 19 Sep 2025
 08:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250919081032.1132163-1-fancp2007@gmail.com>
 <ab3a31ee-f76c-4e94-8a66-3cf00805f3a8@smile.fr>
In-Reply-To: <ab3a31ee-f76c-4e94-8a66-3cf00805f3a8@smile.fr>
From: Scott Fan <fancp2007@gmail.com>
Date: Fri, 19 Sep 2025 23:30:04 +0800
X-Gm-Features: AS18NWA8EEEBFbbEyQZrHQ6bwnnRBAlcCDm2f_uSmw1UMBNoxLvrTge3OWzfESM
Message-ID: <CAFkzVZYb2T-mJzzh3RRjGydnQx6UGVLNh8MXJOxOVX330nskuw@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758295816; x=1758900616; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7tG3IzLu5beFwq04PWv4Pf4HPXQJNc7DlJfYBPfnQNI=;
 b=YgA/9ix/mJs9qxtgWbSO3GXjWidk4V+Sa6D+qvLbB2g2HhXJCEWIsOfc/xz44QhDrP
 rxkA89+Mpmb5ULKhWC7f7Bqq8w1t2tztce/O4GiTBwWf+Qx6VPrxLHlDHa6H9k7o5y2v
 k9hSTLXFLL6383CpG4yaebEgKpHQnBreUsx5XX03v8RbfiI4bQm31VIDleL2Gfm7lkA4
 x42W35JrEtBME6DcIwJ/e1BkpZguA9Kjt7LhynM4TruQCU9watDCHXqaoz+Os8agBLGW
 AKpp+MRYOklp8CDuWNzgd7w8i479Vyye0zwdlN44fWK+5QiUe9d0iE1MGlh9PgWdtad6
 7IWw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YgA/9ix/
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 10.1.0
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

SGVsbG8gUm9tYWluLAoKT25seSBxZW11X2xvb25nYXJjaDY0X3ZpcnRfZWZpX2RlZmNvbmZpZyBh
bmQKcWVtdV9yaXNjdjY0X3ZpcnRfZWZpX2RlZmNvbmZpZyB3ZXJlIHRlc3RlZCBvbiBteSBsYXB0
b3AuCgpIb3dldmVyLCBJIGZvcmdvdCB0byBjaGVjayB0aGUgaGFzaGVzIG9mIHRoZSBDT1BZSU5H
IGFuZCBDT1BZSU5HLkxJQiBmaWxlcy4KClNjb3R0IEZhbgoKT24gRnJpLCBTZXAgMTksIDIwMjUg
YXQgNjozN+KAr1BNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToK
Pgo+IEhlbGxvIFNjb3R0LCBBbGwsCj4KPiBMZSAxOS8wOS8yMDI1IMOgIDEwOjEwLCBTY290dCBG
YW4gYSDDqWNyaXQgOgo+ID4gQ2hhbmdlcyBsb2c6Cj4gPiBodHRwczovL3dpa2kucWVtdS5vcmcv
Q2hhbmdlTG9nLzEwLjEKPgo+IFRoYW5rcyBmb3IgdGhpcyBwYXRjaCEKPgo+IEhvdyBkaWQgeW91
IHRlc3QgaXQ/Cj4KPiBRZW11IGlzIHVzZWQgYnkgb3VyIEdpdGxhYi1DSSB0ZXN0aW5nIGZvciBh
bG1vc3QgYWxsIGFyY2hpdGVjdHVyZXMgc3VwcG9ydGVkIGJ5Cj4gQnVpbGRyb290LiBTbyBhbnkg
dmVyc2lvbiBidW1wIGNhbiBjYXVzZSBzb21lIGlzc3VlLgo+Cj4gSWYgcG9zc2libGUgY2FuIHlv
dSB0ZXN0cyBhdCBsZWFzdCBlYWNoIHFlbXUgZGVmY29uZmlncyAoc2VlIHByZXZpb3VzIHZlcnNp
b24gYnVtcCk6Cj4KPiAgICAgUWVtdSBkZWZjb25maWdzIHdlcmUgcnVudGltZSB0ZXN0ZWQgb24g
R2l0bGFiLUNJOgo+ICAgICBodHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL3Bp
cGVsaW5lcy8xODA1NjcyNjg1Cj4KPiAgICAgcWVtdV9zMzkweF9kZWZjb25maWcsIHFlbXVfYXJt
X3ZleHByZXNzX3R6X2RlZmNvbmZpZywKPiAgICAgcWVtdV9hYXJjaDY0X2ViYnJfZGVmY29uZmln
IHdlcmUgdGVzdGVkIGxvY2FsbHkuCj4KPiAgICAgUnVudGltZSB0ZXN0cyB1c2luZyBob3N0LXFl
bXUgd2VyZSBsb2NhbGx5IHRlc3RlZDoKPiAgICAgVGVzdFh2aXNvciwgVGVzdEZ3dHMsIFRlc3RF
ZGsyLCBUZXN0R3J1YkFBcmNoNjRFRkkuCj4KPiBJJ20gZmluZSBpZiB5b3UgdGVzdGVkIGlmIG9u
bHkgb24gb25lIHRlc3QgY2FzZS4KPiBJbiB0aGlzIGNhc2UsIHdlIHdpbGwgbmVlZCB0byBwZXJm
b3JtIGFkZGl0aW9uYWwgdGVzdGluZyBiZWZvcmUgbWVyZ2luZyB0aGUKPiB2ZXJzaW9uIGJ1bXAu
Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFNj
b3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvcWVtdS9x
ZW11Lmhhc2ggfCAyICstCj4gPiAgcGFja2FnZS9xZW11L3FlbXUubWsgICB8IDIgKy0KPiA+ICAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUuaGFzaCBiL3BhY2thZ2UvcWVtdS9xZW11Lmhh
c2gKPiA+IGluZGV4IGE4YjdkNjg4ZTguLjg3NmQzNGE2MzggMTAwNjQ0Cj4gPiAtLS0gYS9wYWNr
YWdlL3FlbXUvcWVtdS5oYXNoCj4gPiArKysgYi9wYWNrYWdlL3FlbXUvcWVtdS5oYXNoCj4gPiBA
QCAtMSw0ICsxLDQgQEAKPiA+ICAjIExvY2FsbHkgY29tcHV0ZWQsIHRhcmJhbGwgdmVyaWZpZWQg
d2l0aCBHUEcgc2lnbmF0dXJlCj4gPiAtc2hhMjU2ICAyMmMwNzU2MDFmZGNmOGM3YjI2NzFhODM5
ZWJkY2VmMWQ0ZjI5NzNlYjY3MzUyNTRmZDJlMWJkMGYzMGIzODk2ICBxZW11LTEwLjAuMC50YXIu
eHoKPiA+ICtzaGEyNTYgIGUwNTE3MzQ5YjUwY2E3M2ViZWMyZmE4NWIwNjA1MGQ1YzQ2M2NhNjVj
NzM4ODMzYmQ4ZmMxZjE1ZjE4MGJlNTEgIHFlbXUtMTAuMS4wLnRhci54ego+ID4gIHNoYTI1NiAg
NmYwNGFlODM2NGQwMDc5YTE5MmIxNDYzNWY0YjFkYTI5NGNlMTg3MjRjMDM0YzM5YTZhNDFkMWIw
OWRmNjEwMCAgQ09QWUlORwo+ID4gIHNoYTI1NiAgZGM2MjY1MjBkY2Q1M2EyMmY3MjdhZjNlZTQy
Yzc3MGU1NmM5N2E2NGZlM2FkYjA2Mzc5OWQ4YWIwMzJmZTU1MSAgQ09QWUlORy5MSUIKPiA+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVtdS5tayBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4g
PiBpbmRleCBmZGM4NTkxZTU0Li4wZDFkMTU0MzcxIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9x
ZW11L3FlbXUubWsKPiA+ICsrKyBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gPiBAQCAtNiw3ICs2
LDcgQEAKPiA+Cj4gPiAgIyBXaGVuIHVwZGF0aW5nIHRoZSB2ZXJzaW9uLCBjaGVjayB3aGV0aGVy
IHRoZSBsaXN0IG9mIHN1cHBvcnRlZCB0YXJnZXRzCj4gPiAgIyBuZWVkcyB0byBiZSB1cGRhdGVk
Lgo+ID4gLVFFTVVfVkVSU0lPTiA9IDEwLjAuMAo+ID4gK1FFTVVfVkVSU0lPTiA9IDEwLjEuMAo+
ID4gIFFFTVVfU09VUkNFID0gcWVtdS0kKFFFTVVfVkVSU0lPTikudGFyLnh6Cj4gPiAgUUVNVV9T
SVRFID0gaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZwo+ID4gIFFFTVVfU0VMSU5VWF9NT0RVTEVT
ID0gcWVtdSB2aXJ0Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
