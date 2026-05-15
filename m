Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37028CD4F46
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 19:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B0441D2E;
	Fri, 15 May 2026 19:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8XgE2tzYx25u; Fri, 15 May 2026 19:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 094DE41D35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778873137;
	bh=Btg6GM4A++Y2slBx8dJB1T0IAkPwf+xSI/Xb2KWZNDQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5Q8Iui4pCAOv7ta/B+NLHRnItvvsd3F5RCxFXCek4kZGEiCLox0dOXoNOyZ0txZb
	 y+ym0v8KqCYkYNq1Zbd0hqVrikVH7ZnoszrF8kz+YumFg9jgqK65skfLzRrvx25RN2
	 y9q9oXJpyHRm4UfCa7rxxp3vrOQ/eCrhqRAWYcfFWB2bQpD47+D86D6+6BsaCW9adS
	 wpkOvR1I+J5/ft+XiSpaTXldwbqDJWF3plzFw/GiugGT+S/oW6EbQnK/jm7cByUwG3
	 AZ0dsSIZcxX5XTkEtHIGQmc7HtUmEhWNlRK0Yh/vTTdbvhUj08SLInSa3byLPOjiEn
	 uLV+vVH8fJ3aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 094DE41D35;
	Fri, 15 May 2026 19:25:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7D1145B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE85B616E0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u68hwQI_qNEz for <buildroot@buildroot.org>;
 Fri, 15 May 2026 19:25:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC9A2616DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC9A2616DE
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC9A2616DE
 for <buildroot@buildroot.org>; Fri, 15 May 2026 19:25:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4890d945eb4so7376995e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 12:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778873133; cv=none;
 d=google.com; s=arc-20240605;
 b=g1zBBAQn7eTNJ4vbT8lLg8u0FGCbA936Hq/hRAcvHalfcKHFHT364LU9P2PA9mYi0B
 5tOl+uUNDpi589TFPjBBBmkpLYyb0BShMYOyHC6gtTR5VTfXGQ2AKuX8i7FfO9vsjzJg
 CPVks2RPOtWzf+xkhrdffjohC5K+ReZj40yHaQ8iuTRaGZXP5Qhxjk6rNluPq7aTyNmP
 nAfwUcMBGiQMllGlX1W+9ygaXDDf6lZYBC7B5EA+eTce6h+X07MYxXZTfdUjq+6iXTFa
 ohXBt8u7fSKIDpOp5KGlwcFzVa4L7ih3rQaKizHhHaCorRvUKMKhpnOBRiF3GnksG5bQ
 J7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=GaFQ8r6zoc8HotbaA2fWxTLZdCrJ+m/gMQgka1T3DBM=;
 fh=qN5u1rffstYNTOVFh0UpY42d4XMjfqJHbCz9+4IYGCk=;
 b=eTEY79KGTwkz3esgb1GKAX587e8bGif8/d6z8Fc2GtE5dkEKv4te4Nlq449QMZrlng
 JaM8grKrchoGqF8XyH0iDzFu3EP0JGrlRoSwrHR71P08bErgvxz2udTbKl3rrF5pwGjz
 L208Bhz/Ly0KrMx0rvCWCz3l/cH3DRv/QjFXcCPDgcf8bcRObzt0xmuYw4m6MWKIq1Me
 8pckse/ImKwSJZlDtSRxl88737VUNznPL6Dae7syCdIy9cdRDoyBE8G8o2SqZMAHurAF
 oWIuEUR3PriEhFuopcFiPjftSVQTx/le1ByfnPlHcNR2uwDVak9a8H9yqYOww6ZHnFFb
 ZEWg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778873133; x=1779477933;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GaFQ8r6zoc8HotbaA2fWxTLZdCrJ+m/gMQgka1T3DBM=;
 b=LhqJrIxbz+lPYgYWKLly1Zd0XhuYwDSUvsJJJEkReF+3hGkiYqSNa3KqB9Z+a7/MeC
 hMyx2eCsVin1RvW7DP3E9fyove/BQJoR+EbyKa1/OxzL7vjO9ssAy04eb+ZiMY2f3gVz
 w9S2/TUrsOY/f374RvBOrNi0BJnlProU1nt7gLbTyXnDMqle619642CVwwUzUQoHTSsf
 HW4zRJ5st9yi7290hVbWzDciqj7ujbcfLM8KBnQZmQkxHU5U3fvL1vlG8zpR9V2aOI0h
 UhvYsZAU1GYHt52vYduAB2jDYTRZMU5E3pMIUsgQBTLj2gbpJb68/NGrX75LYRAAFBqE
 DVjA==
X-Gm-Message-State: AOJu0YyYg1v3MvVmWhjNwik8VonyX373DvF193SImhVqlYx0+NGqTTKF
 MbiDjYpqwgyIphWl0gvJeLj6CNdniSpzouyma0ms415v0yB7vpgEheRFNJKF1jBBl7ZHBp5HQOB
 POgWBMGM/NKci+ChYsalfVfjDgmL3Iuk=
X-Gm-Gg: Acq92OFA6NiN0JDk18EQ1YmZAthVG9jXnpokQriw3zvTf7M/wB+bDFjaGIWZ2qpDNMC
 8W2FXM5JBEUOd919TpnWr5eIVHQwb3if27ftC8piltSfGNIFP6xJGith7GBZwaf0rqsL674Tmeb
 9za6JjlVsOECMiQXsLviIshXmDtLOnDRfiRLQhn84ckA95yZ02AScPeZWqRf7RO7F+DWwaFiWcV
 4X/nfExGk8E5ZknOgm1Yn+dOzWUhMqbm2lpv8Kkd6h4fKEKVnJHAFSWv0vEpUWRxSvYlsNcFon4
 yetT
X-Received: by 2002:a7b:c402:0:b0:485:3038:72c2 with SMTP id
 5b1f17b1804b1-48fd6464d60mr97599675e9.17.1778873132772; Fri, 15 May 2026
 12:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260219-qemu-tcg-interpreter-v1-1-d7f11b967f49@gmail.com>
 <c24af83c-1300-4961-857b-db077ac8cbc0@smile.fr>
In-Reply-To: <c24af83c-1300-4961-857b-db077ac8cbc0@smile.fr>
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri, 15 May 2026 12:24:53 -0700
X-Gm-Features: AVHnY4LENHKANMJhfUQKaTiMy9Qlr-SetniZzdRFNpLWvU8FeIq_LnhuuXG8I7U
Message-ID: <CAMWSM7iKgSR7Kp-09s7Y8T1DT6_aLGWEPieKvB7r-WOPc2ZWjg@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778873133; x=1779477933; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GaFQ8r6zoc8HotbaA2fWxTLZdCrJ+m/gMQgka1T3DBM=;
 b=oDfSYs8UqNEscnujXUUj6ikmbPNN5j+RdZMRJkCo7c9ZOJ9fi0cH2lkFe9esaTL9F2
 vBEeVXrk8dyhKpBsu9wQPFDt1x7Ur+fwClARwvOw3x0qy3f8mD/REViOaPqyTJExhug7
 QgPmcHSlkjU8zHqZqwD5+CiNSwD8MysWU59FbkFIGwvXPNS2E84bo4Hkj6ks2bwwjqfW
 wvvsd5K+py1GCzuzHpRBQcVAsjO1tC4qxHDFfenJva0Lyfb5h3SMkRUy7jGTtI5Zj01X
 qLps99QJkQAshN6pXBDvUDbEh/Mce8/ehwTmp4Dro3uoCj5MYlrex2rpOTNbHowgEbOf
 h+3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=oDfSYs8U
Subject: Re: [Buildroot] [PATCH] package/qemu: conditionally enable TCG
 interpreter
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

SGVsbG8gUm9tYWluLAoKVGhhdCBtYWtlcyBzZW5zZSwgSSBtaXNzZWQgdGhlIHdhcm5pbmcgd2hl
biB1c2luZyB0ZXN0LXBrZyB0byBmaW5kCmJ1aWxkIGZhaWx1cmVzLiBJIGNhbiBhZGp1c3QgdGhp
cyB0byBvbmx5IGVuYWJsZSB0aGUgZmxhZyB3aGVuCm5lY2Vzc2FyeS4gSSBmaWd1cmVkIHRoZSBp
bnRlcnByZXRlciB3b3VsZCBvbmx5IGJlIHVzZWQgd2hlbiBhbgphcHByb3ByaWF0ZSBjb2RlIGdl
bmVyYXRpb24gYmFja2VuZCBpc24ndCBhdmFpbGFibGUsIEkgZ3Vlc3MgdGhhdCdzCm5vdCB0aGUg
Y2FzZS4KCkknbGwgZm9sbG93IHVwLgoKQmVzdCwKSm9zZXBoCgpPbiBGcmksIE1heSAxNSwgMjAy
NiBhdCA2OjU04oCvQU0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3Rl
Ogo+Cj4gSGVsbG8gSm9zZXBoLAo+Cj4gTGUgMjAvMDIvMjAyNiDDoCAwMjo0NSwgSm9zZXBoIEtv
Z3V0IGEgw6ljcml0IDoKPiA+IFFlbXUgaGFzIHR3byBmbGFncyByZWxhdGVkIHRvIGVuYWJsaW5n
IHRoZSBUaW55IENvZGUgR2VuZXJhdG9yIChUQ0cpCj4gPiBmZWF0dXJlLiBVc2luZzoKPiA+Cj4g
PiAgIC0tZW5hYmxlLXRjZwo+ID4KPiA+IFNpbXBseSBlbmFibGVzIHRoZSBUQ0cgYmFja2VuZCBm
b3IgSklUIGNvZGUgZ2VuZXJhdGlvbi4gSG93ZXZlciwgc29tZQo+ID4gYXJjaGl0ZWN0dXJlcyBh
cmVuJ3Qgc3VwcG9ydGVkIGJ5IHRoZSBjb2RlIGdlbmVyYXRvciwgYW5kIHRoZSBidWlsZAo+ID4g
d2lsbCBmYWlsIGR1cmluZyBjb25maWd1cmF0aW9uLCBzdWNoIGFzIGluIHRoaXMgYm9vdGxpbi1t
aXBzZWwzMnI2LWdsaWJjCj4gPiBidWlsZDoKPiA+Cj4gPiAuLi9tZXNvbi5idWlsZDo5MjM6Njog
RVJST1I6IFByb2JsZW0gZW5jb3VudGVyZWQ6IFVuc3VwcG9ydGVkIENQVSAsIHRyeSAtLWVuYWJs
ZS10Y2ctaW50ZXJwcmV0ZXIKPiA+Cj4gPiBFbmFibGluZyB0aGUgVENHIGludGVycHJldGVyIFsw
XSBhbGxvd3MgZm9yIGEgc29mdHdhcmUgaW50ZXJwcmV0ZXIgdG8KPiA+IGV4ZWN1dGUgVENHIGNv
ZGUgaW4gY2FzZXMgd2hlcmUgbmF0aXZlIGNvZGUgZ2VuZXJhdGlvbiBpcyB1bnN1cHBvcnRlZCwK
PiA+IHdoaWNoIGZpeGVzIHRoZSBidWlsZC4KPiA+Cj4gPiBbMF0gaHR0cHM6Ly93aWtpLnFlbXUu
b3JnL0ZlYXR1cmVzL1RDSQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc2VwaCBLb2d1dCA8am9z
ZXBoLmtvZ3V0QGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gIHBhY2thZ2UvcWVtdS9xZW11Lm1rIHwg
MyArKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rIGIvcGFja2FnZS9xZW11
L3FlbXUubWsKPiA+IGluZGV4IDk3ZjhlMjIwOTEuLmY1MDgwNTkxN2IgMTAwNjQ0Cj4gPiAtLS0g
YS9wYWNrYWdlL3FlbXUvcWVtdS5tawo+ID4gKysrIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPiA+
IEBAIC01Niw3ICs1Niw4IEBAIFFFTVVfT1BUUyArPSAtLWRpc2FibGUta3ZtCj4gPiAgZW5kaWYK
PiA+Cj4gPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTV9UQ0cpLCB5KQo+ID4gLVFF
TVVfT1BUUyArPSAtLWVuYWJsZS10Y2cKPiA+ICtRRU1VX09QVFMgKz0gLS1lbmFibGUtdGNnIFwK
PiA+ICsgICAgICAgICAgLS1lbmFibGUtdGNnLWludGVycHJldGVyCj4KPiBVc2luZyAtLWVuYWJs
ZS10Y2ctaW50ZXJwcmV0ZXIgd2hlbiBhIG5hdGl2ZSBUQ0cgZXhlY3V0aW9uIGJhY2tlbmQgYXZh
aWxhYmxlCj4gd2lsbCB0aHJvdyBhIHdhcm5pbmcgYXQgY29uZmlndXJlIHRpbWU6Cj4KPiBodHRw
czovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9ibG9iL3YxMS4wLjAvbWVzb24uYnVp
bGQ/cmVmX3R5cGU9dGFncyNMOTIxCj4KPiAtLWVuYWJsZS10Y2ctaW50ZXJwcmV0ZXIgaXMgbmVl
ZGVkIHdoZW4gdGhlIHRhcmdldCBhcmNoaXRlY3R1cmUgaXMgbm90IGluIHRoaXMKPiBsaXN0Ogo+
Cj4gc3VwcG9ydGVkX2NwdXMgPSBbJ3BwYzY0JywgJ3MzOTB4JywgJ3Jpc2N2NjQnLCAneDg2XzY0
JywKPiAgICdhYXJjaDY0JywgJ2xvb25nYXJjaDY0JywgJ21pcHM2NCcsICdzcGFyYzY0JywgJ3dh
c202NCddCj4KPiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSBhIGZpbmUgY29udHJvbCBvZiBj
b25maWd1cmUgZmxhZ3MuCj4gQ2FuIHlvdSB1c2UgLS1lbmFibGUtdGNnLWludGVycHJldGVyIG9u
bHkgZm9yIG1pcHMzMiBhbmQgYWxsIG90aGVyIG5vbiBUR0MKPiBzdXBwb3J0ZWQgYXJjaGl0ZWN0
dXJlcz8KPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgo+Cj4gPiAgZWxzZQo+ID4gIFFFTVVf
T1BUUyArPSAtLWRpc2FibGUtdGNnCj4gPiAgZW5kaWYKPiA+Cj4gPiAtLS0KPiA+IGJhc2UtY29t
bWl0OiA2YzgzYTBiOGU1NjU4YjkwMWRkMzVhZTIzMjE3MDc1ZjAzNWFmOTk4Cj4gPiBjaGFuZ2Ut
aWQ6IDIwMjYwMjE5LXFlbXUtdGNnLWludGVycHJldGVyLWRiMzZiZjUyYjdiZQo+ID4KPiA+IEJl
c3QgcmVnYXJkcywKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
