Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E97D111A8
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 07:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8918A40556;
	Sun, 30 Nov 2025 07:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LCVTtVTSxyBp; Sun, 30 Nov 2025 07:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A25D540489
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25D540489;
	Sun, 30 Nov 2025 07:36:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F36C5219
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 07:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECC614025C;
 Sun, 30 Nov 2025 07:36:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBlI9j7yWZDY; Sun, 30 Nov 2025 07:36:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65ABE40165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65ABE40165
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65ABE40165
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 07:36:17 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso18206575e9.2
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 23:36:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764488175; x=1765092975;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=shp56wjC2mtWeoZ10PZGVN4I8DwF2rpm87BD3XWL9hw=;
 b=PM/Ed9dYlQWg5jSjvkZWWiJqaPgjAd1Yq22ulormUFmxS496CpBMSgvtZbGoEBjMsY
 syKerFQSwRKHId/obIkk/vAAGZEZyuIV8W+AGyldQJndOyBs+hzZuSQecK0g42oruWB9
 y7czYhqWgQ4ppOjkdQci7vsbdFWve1fsx7tDFJ/8kvZS25MguA4o6nmNgDkJx2nr5i/h
 mevOdO+M/M5sykVYu/z0TVeBe2tGfb2NQhDPHhO8ikLlkOsMyWazIegK7ulhjMdY5hb9
 goBHAgrvf/eib68VVfwhxItv8Boh2NE44oNT6xS1cU9hMLeDz7I0V3Al3DvD5feH5zge
 hXEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVq77lAzolDU3qIH+Fbd18aQ0iYKTOP8DLArd0vaFe2GSiZb//M7f7Sb/5ZXPdz+jyOcLYUrHut58=@buildroot.org
X-Gm-Message-State: AOJu0YxGWN+jNpxPQGcqHw1cq/4TLt3HamyjlcS6WIrDn57nxZAhtjR0
 sPXx5tvAwNRTz99ydyQKwRj6LU0sG5NcHKMQbiPKh/uRWvzYceqfoFjw
X-Gm-Gg: ASbGncsOGa4w0sY5bkqjOyrPu2g5bDnSSaOg7rafz0JVnlsGMfBFHTvSAa5EosO675C
 jiLlwcOvbXaaMzmUu0msWMht6SDaVikQkJN824pRu7FmQ/oNpxqv9WvQQyKY8h6+ANMAHiEe5YW
 2Yn7zpvwqI4Ok0nnRnEsIDKtZJMLTFaE1gV3Zw43sSj7QgCDpS+BbMs3USHbkNtzcbebg/NwlHH
 gJGxOa9LbNusSQYfxgohyrwGCnqA+gEzQcL7f9WuQgxHvlLwhqHDbHpYn792N0fDqi4aYd33eS+
 ky2wDI/uhPeHLY5AMG56BxNsvVDthSbI91IXp1HqSBYVYo9qLYwvoyMvBa0w3cS5epu5y0P1bbl
 xuW5FKeBlC07aGa/D9PrNb0KmWXpAFgNZ3rxNsboWxrgnp4fyvSMzcxc8hG4+Pmxn3G78gKZk2h
 OYX1tDMsDJDfE66uwex52kgZdWVz8WLnzs
X-Google-Smtp-Source: AGHT+IE+BITvEpkbk7jaaNxidzuYFD+3LO1Oo7LAqzhHt8RHIntmdkm/xU0ptsi5t79aCHFsUVwPiw==
X-Received: by 2002:a05:600c:1f8f:b0:477:a0dd:b2af with SMTP id
 5b1f17b1804b1-477c01ea502mr302455695e9.33.1764488175128; 
 Sat, 29 Nov 2025 23:36:15 -0800 (PST)
Received: from ymorin.is-a-geek.org ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4791163e3cbsm176689345e9.10.2025.11.29.23.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 23:36:14 -0800 (PST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Nov 2025 08:36:13 +0100
Date: Sun, 30 Nov 2025 08:36:13 +0100
To: =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Message-ID: <aSvz7eiTAwAEzNu_@landeda>
References: <CAH+XeQYPBnXkXq4Fu0aBJ2UBR_U31ypza4z-1jf2Y78aWWiv-g@mail.gmail.com>
 <aSszM90msDWGlEaa@landeda>
 <9e510762-e34d-41d1-9ec8-11d24a60ed84@grenoble.cnrs.fr>
 <CAH+XeQY8z5i6jdpKZ40sqy_v5ehshtHHQCOLhN92SLwG5u4SgA@mail.gmail.com>
 <CAH+XeQbz7B6QcQUnbH5x+M2bE=1snLkZXW4syQdZm-3H_AfaMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH+XeQbz7B6QcQUnbH5x+M2bE=1snLkZXW4syQdZm-3H_AfaMQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764488175; x=1765092975; darn=buildroot.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=shp56wjC2mtWeoZ10PZGVN4I8DwF2rpm87BD3XWL9hw=;
 b=gScQogKd+WPyFfpaapn6gLZGr2zLM+F+gIZC3rv4dQSD+BUoJ/voLZk1qYiEYwDsW1
 SdSFMdbBRknbHE+jwxd4JgTA4O0g2VaCw0To9Kl6/b6PT8Hols4ab6IHlYCpgitwQ+3F
 0zmIFeLxax/DEJMaERvGrIuX6/rL63k/BDoCXVv6cIizIBRW9GRFBBkE89XZQ8XOKWFf
 lBxoLIDVTALiriqq7cBeUAhJARPNdo4TugtFMqvXYNJ/DfwvF2VTTE6AHmtaVmBIIfoQ
 RBxmHwGpKRtAwZh7XVMmnhpZY6Dbxj0CzRuAaFka5l6dOpdQuxm5ICXCFDUsvyN4NfUu
 /j9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gScQogKd
Subject: Re: [Buildroot] Compilation Issue with Commit
 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjUtMTEtMjkgMjI6NDYgKzAxMDAsIEpvc8OpIEx1aXMgU2FsdmFk
b3IgUnVmbyBzcGFrZSB0aHVzbHk6Cj4gRm9yIGRpc2Nsb3N1cmUsIGhlcmUgaXMgbXkgYnVpbGQg
aW5mb3JtYXRpb24gdGhhdCB0cmlnZ2VyZWQgdGhlIGVycm9yOgo+IAo+IGJ1aWxkIGxvZzoKPiBg
YGAKPiBbLi4uXQo+IHN1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQgLXQgc2tlbGV0b24gLXUg
LWIKPiAvdXNyL3NyYy9zaW1wbGVrOHMvcm9vdGZzLXNrZWxldG9uCj4gVGhlIHNrZWxldG9uIGlu
IC10IGlzIG5vdCBwcm9wZXJseSBzZXR1cDoKPiAgLSAvdXNyL2JpbiBzaG91bGQgZXhpc3QsIGJl
IGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawo+ICAtIC91c3IvbGliIHNob3VsZCBl
eGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCj4gVGhlIHNrZWxldG9u
IGluIHNrZWxldG9uIGlzIG5vdCBwcm9wZXJseSBzZXR1cDoKPiAgLSAvdXNyL2JpbiBzaG91bGQg
ZXhpc3QsIGJlIGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawo+ICAtIC91c3IvbGli
IHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCj4gVGhl
IHNrZWxldG9uIGluIC11IGlzIG5vdCBwcm9wZXJseSBzZXR1cDoKPiAgLSAvdXNyL2JpbiBzaG91
bGQgZXhpc3QsIGJlIGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawo+ICAtIC91c3Iv
bGliIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5rCj4g
VGhlIHNrZWxldG9uIGluIC1iIGlzIG5vdCBwcm9wZXJseSBzZXR1cDoKPiAgLSAvdXNyL2JpbiBz
aG91bGQgZXhpc3QsIGJlIGEgZGlyZWN0b3J5LCBhbmQgbm90IGJlIGEgc3ltbGluawo+ICAtIC91
c3IvbGliIHNob3VsZCBleGlzdCwgYmUgYSBkaXJlY3RvcnksIGFuZCBub3QgYmUgYSBzeW1saW5r
Cj4gWy4uLl0KPiBgYGAKWy0tU05JUC0tXQo+IFNvbWUgY29uZmlnczoKPiBgYGAKPiBbLi4uXQo+
IEJSMl9ST09URlNfU0tFTEVUT05fQ1VTVE9NPXkKPiBCUjJfUk9PVEZTX1NLRUxFVE9OX0NVU1RP
TV9QQVRIPSIkKENPTkZJR19ESVIpL3Jvb3Rmcy1za2VsZXRvbiIKPiBCUjJfUk9PVEZTX09WRVJM
QVk9IiQoQ09ORklHX0RJUikvcm9vdGZzLW92ZXJsYXkiCj4gWy4uLl0KPiBgYGAKCkFoLCBzbyB0
aGlzIGlzIHdoYXQgSSBtaXNzZWQ6IHVzZSBvZiBhIGN1c3RvbSBza2VsZXRvbi4gSSB0ZXN0ZWQg
YWxsCmtpbmRzIG9mIG92ZXJsYXlzLCBidXQgZm9yZ290IHRvIHRlc3QgYSBjdXN0b20gc2tlbGV0
b24uCgpTbywgaXQgZGlkIG5vdCBicmVhayBmb3Igb3ZlcmxheXMsIHdoaWxlIGl0IGJyZWFrcyBm
b3Igc2tlbGV0b24sIGJ1dAp0aGF0IGlzIG5vdCB3ZWlyZDogdGhlIGNoZWNrcyBmb3IgdGhlIHNr
ZWxldG9uIGFyZSBzdHJpY3QsIHdoaWxlIHRoZXkKYXJlIGxheCBmb3IgdGhlIG92ZXJsYXlzLiBT
bywgdGhhdCdzIHdoYXQgY2F1c2VzIHRoZSBmYWlsdXJlIGZvciB5b3UuCgpUaGlzIGlzIGltcG9y
dGFudCBpbmZvcm1hdGlvbiwgdGhhdCBzaG91bGQgaGF2ZSBiZWVuIGdpdmVuIGluIHRoZSBjb21t
aXQKbG9nIChtYXliZSBub3Qgc28gZXh0ZW5zaXZlbHksIGJ1dCBzdGlsbCksCgpUaGFuayB5b3Ug
Zm9yIHRoZSBmZWVkYmFjayEg8J+RjQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAouLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0t
LS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRl
ZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2
IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAg
ICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBB
R0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1n
ZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAg
fAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0t
LS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
