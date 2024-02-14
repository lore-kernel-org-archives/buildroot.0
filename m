Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58069C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 10:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19A9260E1E;
	Wed, 14 Feb 2024 10:58:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YqBkK1zbU7C; Wed, 14 Feb 2024 10:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2478F60EBC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2478F60EBC;
	Wed, 14 Feb 2024 10:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A69C71BF5B4
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93F3F4173D
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 10:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FknK1eKxNKgJ for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 10:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 761CF4173B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 761CF4173B
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 761CF4173B
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 10:58:47 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-411fc61a0ecso381525e9.2
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 02:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707908325; x=1708513125;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3Gp6IqLTUz01jzJ+mfT/H3pX3YhZpwZSyyuTuUxaRA=;
 b=h4DTNV8e2DaMDzKtyHby3RPAMKHWuM9IYWyCm1/zbg4d+3x9VeiskA4f2io9WOnjjp
 R7xvAAJiWIdiaiHZj2yvH74WJP+vkH8tiAV/QqZDcwWOgiatVzTEXOvH7hDV0+ceKouD
 6nQCxvUUNf1M5n/79wy0t1hqZDMr3W1EY3rSwK4bIxFNnT1WFyfVa/r7a/0WGJF9UmlO
 7vrV6To9rt+C1zrcH9xdvSwvNLQsyn/kGSL6ML9EgYXoPEhsdg9tsKW4Fa9H/HeSL0qo
 QPba726F4LdMARDJPDzYME4KIMe8Ag8DEYP7Ul1fSa16DSJ74/e3zUnBqsUipIIA6Xrf
 TVfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCcSEl1OXn6+ITm8cP3QRPoX8ro3cVHIgvX6uySvCHni9bKbCWlcY8QLnkSBaFXbe32nab+KLoAvKCNrmHP4BYz8ktuIoTKw==
X-Gm-Message-State: AOJu0YxmmSzJ0EqbA0Bdtt7u/N38YxAJkyNIvBxkmW/wnPlFNXfgAbPS
 +rslSO3NJw0a5rX5lsMGVczDdiIAe8Z3XKcMwRCIUZXGX5GCg2QB
X-Google-Smtp-Source: AGHT+IF5GK0HK12tcDuOZptbenvDu6IU4dUT6SM3qmhTstWIpAo07QYjVCObRqlptqetVMLTHc9CsQ==
X-Received: by 2002:a05:600c:1c1f:b0:411:dd82:a27a with SMTP id
 j31-20020a05600c1c1f00b00411dd82a27amr1654239wms.39.1707908325597; 
 Wed, 14 Feb 2024 02:58:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXtlikF1PSWBXr4/lpRhY+mKcjyiBl25CZY5xx8OLcH5CQ86GB+l2q/gCqxn+eIS9kWPxYqCb7i0gdLa3PhBVSg2JktDmN4hQ==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056000022d00b0033b1b1da2adsm12086164wrz.99.2024.02.14.02.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 02:58:45 -0800 (PST)
Message-ID: <05c23828b1121bf48fe3af89459da706b04cd9c9.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 11:58:44 +0100
In-Reply-To: <20240213172817.2872849-12-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-12-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707908325; x=1708513125; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r3Gp6IqLTUz01jzJ+mfT/H3pX3YhZpwZSyyuTuUxaRA=;
 b=DeWDnEpc/HBMpZBL/lXkPGLAn4qLxmBtsgMsVrDNO/34jdTnjBomb7V7i3KbYu8IlT
 l/MXz3DYkwCrJUoWZZZ2mJP3QaM3lBkKFQMjVNT72n+BSWhWxzrhlheGjcZBoR3Ozh/v
 7isOFygl9eTfYfUMRQpT7gEMq7lk5d4aP3SZ5OgoHO3qFKRubxQQ7cl5EtJTYARREEiB
 XVpad9uW20X8qvY5wU5Af1ztGreaIEUqEIBxqBwSCnTHzoj4Vo49c3RQgeCrksamlqlb
 XDMCUe5ExlAJRRqioWFVLOPTZAUKrpOZ+qBdo+BwNtvXyvtC499DK9gd8vfuwBBNQbWh
 ZR4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DeWDnEpc
Subject: Re: [Buildroot] [PATCH 11/21] boot/ti-k3-r5-loader: install
 tiboot3.bin and sysfw.itb to BINARIES_DIR
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gVS1ib290IGZvciBrMyByNSBjb3JlICh0aS1rMy1yNS1sb2FkZXIpIGNhbiBp
bnN0YWxsIGRpZmZlcmVudCB0YXJnZXQKPiBpbWFnZSAodGlib290MyouYmluKSBkZXBlbmRpbmcg
b24gdGhlIGszIFNvQyB2YXJpYW50IHVzaW5nIGRpZmZlcmVudAo+IGJvb3QgZmxvdyBbMV06Cj4g
Cj4gLSBTcGxpdCBiaW5hcnkgd2l0aCBhIGNvbWJpbmVkIGZpcm13YXJlOiAoZWc6IEFNNjUpCj4g
LSBDb21iaW5lZCBiaW5hcnkgd2l0aCBhIGNvbWJpbmVkIGZpcm13YXJlOiAoZWc6IEFNNjQpCj4g
LSBTcGxpdCBiaW5hcnkgd2l0aCBhIHNwbGl0IGZpcm13YXJlOiAoZWc6IEo3MjFFKQo+IC0gQ29t
YmluZWQgYmluYXJ5IHdpdGggYSBzcGxpdCBmaXJtd2FyZTogKGVnOiBBTTYyKQo+IAo+IEszIFNv
QyB1c2luZyBTcGxpdCBCaW5hcnkgQm9vdCBGbG93IGFsc28gcmVxdWlyZXMgc3lzZnctKi5pdGIg
ZmlsZQo+IHRvIGJvb3QgKGVnOiBhbTY1LCBqNzIxZSkuIE9ubHkgdGlib290MyouYmluIGlzIG5l
ZWRlZCBmb3Igb3RoZXIKPiBib290IGZsb3cuCj4gCj4gRnJvbSBbMV06Cj4gIkl0J3MgaW1wb3J0
YW50IHRvIHJlbmFtZSB0aGUgZ2VuZXJhdGVkIHRpYm9vdDMuYmluIGFuZCBzeXNmdy5pdGIKPiB0
byBtYXRjaCBleGFjdGx5IHRpYm9vdDMuYmluIGFuZCBzeXNmdy5pdGIgYXMgUk9NIGFuZCB0aGUg
d2FrZXVwCj4gVUJvb3QgU1BMIHdpbGwgb25seSBsb29rIGZvciBhbmQgbG9hZCB0aGUgZmlsZXMg
d2l0aCB0aGVzZSBuYW1lcy4iCj4gCj4gU28gYm9hcmRzIHVzaW5nIEhTIChIaWdoIFNlY3VyZSkg
SzMgU29DIHZhcmlhbnQgbXVzdCB1cGRhdGUgdGhlCj4gdGlib290My5iaW4gKGFuZCBzeXNmdy5p
dGIpIGluIHRoZWlyIHBvc3QtYnVpbGQgc2NyaXB0Lgo+IAo+IHRpLWszLXI1LWxvYWRlciBtdXN0
IGluc3RhbGwgYW55IHRpYm9vdDMqLmJpbiAoYW5kIHN5c2Z3Ki5pdGIpCj4gdG8gQklOQVJJRVNf
RElSIGxldCB0aGUgdXNlciB3aGljaCBvbmUgc2hvdWxkIGJlIHVzZWQgaW4gYQo+IHBvc3QtYnVp
bGQgc2NyaXB0Lgo+IAo+IFNlZSB0aGUgbGlzdCBvZiBhbGwgdGlib290MyouYmluIGFuZCBzeXNm
dyouaXRiIGZpbGUgdmFyaWFudCBmb3VuZCBpbiBtZXRhLXRpOgoKCltdCgo+IFsxXSBodHRwczov
L3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9ibG9iL3YyMDI0LjAxL2RvYy9ib2FyZC90
aS9rMy5yc3QKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBz
bWlsZS5mcj4KClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVy
ZGxpbkBnbWFpbC5jb20+Cgo+IC0tLQo+IMKgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUt
bG9hZGVyLm1rIHwgOSArKysrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVy
Lm1rIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4gaW5kZXggOGY4
NmUwZmIwNy4uYjNjNzU2ZGM0NyAxMDA2NDQKPiAtLS0gYS9ib290L3RpLWszLXI1LWxvYWRlci90
aS1rMy1yNS1sb2FkZXIubWsKPiArKysgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1s
b2FkZXIubWsKPiBAQCAtNzgsOCArNzgsMTcgQEAgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9CVUlM
RF9DTURTCj4gwqAJJChUQVJHRVRfQ09ORklHVVJFX09QVFMpICQoVElfSzNfUjVfTE9BREVSX01B
S0UpIC1DICQoQEQpICQoVElfSzNfUjVfTE9BREVSX01BS0VfT1BUUykKPiDCoGVuZGVmCj4gwqAK
PiArIyBzeXNmdyouaXRiIGFyZSBvbmx5IGdlbmVyYXRlZCBmb3IgU3BsaXQgYmluYXJ5IGJhc2Vk
IEJvb3QgRmxvdyAoZWc6IGFtNjUsIGo3MjFlKQo+IMKgZGVmaW5lIFRJX0szX1I1X0xPQURFUl9J
TlNUQUxMX0lNQUdFU19DTURTCj4gwqAJY3AgJChARCkvc3BsL3UtYm9vdC1zcGwuYmluICQoQklO
QVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbgo+ICsJZm9yIGYgaW4gJChARCkvdGlib290Myou
YmluIDsgZG8gXAo+ICsJCSQoSU5TVEFMTCkgLUQgLW0gMDY0NCAkJGYgJChCSU5BUklFU19ESVIp
L2BiYXNlbmFtZSAkJGZgIHx8IGV4aXQgMTsgXAo+ICsJZG9uZQo+ICsJZm9yIGYgaW4gJChARCkv
c3lzZncqLml0YiA7IGRvIFwKPiArCQlpZiB0ZXN0IC1lICQkZiA7IHRoZW4gXAo+ICsJCQkkKElO
U1RBTEwpIC1EIC1tIDA2NDQgJCRmICQoQklOQVJJRVNfRElSKS9gYmFzZW5hbWUgJCRmYCB8fCBl
eGl0IDE7IFwKPiArCQlmaSA7IFwKPiArCWRvbmUKPiDCoGVuZGVmCj4gwqAKPiDCoCQoZXZhbCAk
KGtjb25maWctcGFja2FnZSkpCgotLSAKQWxleGFuZGVyIFN2ZXJkbGluLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
