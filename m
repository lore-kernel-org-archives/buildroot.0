Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC01FCA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 22:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 550B841832;
	Sat, 23 Aug 2025 22:12:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zc3nZ4swcY9P; Sat, 23 Aug 2025 22:12:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE0241831
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE0241831;
	Sat, 23 Aug 2025 22:12:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32D1E19C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 22:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 246554182C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 22:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-ejZnvmv5GR for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 22:12:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDD3A4182A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDD3A4182A
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDD3A4182A
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 22:12:15 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3c7aa4ce85dso293164f8f.3
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755987134; x=1756591934;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yz15NFQtlO6RVEltUMUGDohknicXyd91TVhAEV/KsdI=;
 b=DZ/iw9WDpmjFrzIdpXRBMj18nQuidgpUErcoJ1EhJSC602LZxshTLDq0YWJuXGwmrs
 L8ejj3YfrNM8t13phr9TgX4vZThZkz98+ZSmvJK4shYrQp+gw9Jkra9mtlkAYh8p2kn+
 55qUlPPpGAh21gbHNnTnvmM9Jyuaew7RsDEJ1DO2ohZKgEQ1q6BiP2i2wiQUnXrNv0+0
 9cTGMeE+GHb7KFx3dpE60EpdMM0FgDsXO1+A74PICh8nm+lGu1VhnZVwcgL45O8iRXW+
 Xu0G2YSY8XCzHepDuUs3HcM3b6Eeo+zmG6whR7uGWMaeY2uR96Bt25SA/HvgBXl7nasl
 iIzA==
X-Gm-Message-State: AOJu0YzlYPbR2h38F1mMP+zkkGjs9/y+VornENlEYWQFBHxKFy/id/xe
 Qj8nYznGhQt8v2jumGU378JN9z3LUg18afxMeNFKNdBO29SuSMrthgGoVtpLQoV4dsAgLtLmzrB
 12xQk
X-Gm-Gg: ASbGncv9jZK2YGZQJfId++7z7L8i/ufKUv0m3wA1sKSmerCjbKurft50U+coQ/wXrh5
 B7tZFi+M/9cqHu6K981jxR0DqOapNL4Fsyt6p197pEDDOV7tRUHNCBM2wm+HTwjsR8hovjIVY/e
 IvJFgbCOcteDL+8B1ghALan6FXz9ATo+P8PLDKl0fAD+lI6I2r9OFAwCL/9jsUL88mMSdPVEfqg
 8311p56r7XpHQDNUnzvZht0RjBNxsBiCiG1cB7I/YJ/OF99PzRLYsW0tBvKjL5Q3b7AXlBQ/idf
 R8fSDIbPKzDtMkHsFoBPpMx/tsx6ranHTeusjEi5EefVAWIuN14mA8+qWiq5fEnPaMMSam/kLPs
 sE/71/AtFebMA5yo03rs/GKzRbP4pdEgVpv0waGXWVIPMpbhej+ZXp5UfKIaLkZx+6fzky6A0J+
 +1dwO11X9p6gomFBtUiXS49bCh0Rw/En/glZDp2Eg73+Okt0a4uE4T/qWT47ej
X-Google-Smtp-Source: AGHT+IFPMNq8N6Hu/Q+LVfQWaSez5q2K9HvsMekrw6g9GlVvN+HWHFbkk3UlGUB1Ajj7gb8d7krv4g==
X-Received: by 2002:a5d:6790:0:b0:3c6:df53:6972 with SMTP id
 ffacd0b85a97d-3c6df536b32mr2391638f8f.4.1755987133760; 
 Sat, 23 Aug 2025 15:12:13 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711212871sm4918360f8f.43.2025.08.23.15.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 15:12:13 -0700 (PDT)
Message-ID: <31d99b89-c5ef-47cf-b6a6-ef45945b948e@smile.fr>
Date: Sun, 24 Aug 2025 00:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrian Perez de Castro <aperez@igalia.com>,
 Henri Roosen <henri.roosen@ginzinger.com>
Cc: buildroot@buildroot.org
References: <20250818135142.1533405-1-henri.roosen@ginzinger.com>
 <20250819103957.GC1455797@igalia.com>
Content-Language: fr
In-Reply-To: <20250819103957.GC1455797@igalia.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755987134; x=1756591934; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yz15NFQtlO6RVEltUMUGDohknicXyd91TVhAEV/KsdI=;
 b=Jp3mHXyvZNHUoy2qBUHEc9SbhVzDBYjSB9pFG7kjBWvb5bUo3Q4AXXJdt+kLo0gBc6
 L2egEy4quUTZVeUX8JKBRB3Bb8beXkMsOlYeh3YleCClEUrXlbbX0n8iZYf5TCZJ2ec1
 7ZDO1QCdROTCJ0X5kVKJ+7ARQ9ljnkaTZ1MME=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Jp3mHXyv
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: needs host-cmake >=
 3.20
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSGVucmksIEFkcmlhbiwgQWxsLAoKTGUgMTkvMDgvMjAyNSDDoCAwOTozOSwgQWRyaWFu
IFBlcmV6IGRlIENhc3RybyBhIMOpY3JpdMKgOgo+IEhlbGxvIEhlbnJpLAo+IAo+IE9uIE1vbiwg
MTggQXVnIDIwMjUgMTU6NTE6NDIgKzAyMDAgSGVucmkgUm9vc2VuIDxoZW5yaS5yb29zZW5AZ2lu
emluZ2VyLmNvbT4gd3JvdGU6Cj4+IFNpbmNlIGNvbW1pdC0yODgyY2Y0YWU2NDkgKCJwYWNrYWdl
L3dwZXdlYmtpdDogc2VjdXJpdHkgYnVtcCB0byB2ZXJzaW9uCj4+IDIuNDguMyIpIHdwZXdlYmtp
dCBkZXBlbmRzIG9uIGNtYWtlIDMuMjAuCj4+IEZpeGVzIGJ1aWxkIG9uIGN1cnJlbnQgRGViaWFu
IExUUyAoYnVsbHNleWUpIHdoaWNoIGhhcyBvbmx5IDMuMTguNC4KPiAKPiBUaGlzIGlzIGEgZ29v
ZCBjYXRjaCwgdGhhbmtzIQo+IAo+Pj4+PiB3cGV3ZWJraXQgMi40OC4zIENvbmZpZ3VyaW5nCj4+
IC4uLgo+PiBDTWFrZSBFcnJvciBhdCBDTWFrZUxpc3RzLnR4dDo5IChjbWFrZV9taW5pbXVtX3Jl
cXVpcmVkKToKPj4gICBDTWFrZSAzLjIwIG9yIGhpZ2hlciBpcyByZXF1aXJlZC4gIFlvdSBhcmUg
cnVubmluZyB2ZXJzaW9uIDMuMTguNAo+PiAtLSBDb25maWd1cmluZyBpbmNvbXBsZXRlLCBlcnJv
cnMgb2NjdXJyZWQhCj4+IG1ha2U6ICoqKiBbcGFja2FnZS9wa2ctZ2VuZXJpYy5tazoyNjM6IC8u
Li9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3dwZXdlYmtpdC0yLjQ4LjMvLnN0YW1wX2NvbmZpZ3Vy
ZWRdIEVycm9yIDEKPj4KPj4gRml4ZXM6IDI4ODJjZjRhZTY0OWY3ZDVlOWNlZTcyZjg0ZTY3MjMy
OGY1NTA4NDUKPj4gU2lnbmVkLW9mZi1ieTogSGVucmkgUm9vc2VuIDxoZW5yaS5yb29zZW5AZ2lu
emluZ2VyLmNvbT4KPiAKPiBBY2tlZC1CeTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6
QGlnYWxpYS5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApS
b21haW4KCgoKPiAKPj4gLS0tCj4+ICBwYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4gfCAxICsK
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS93cGV3ZWJraXQvQ29uZmlnLmluIGIvcGFja2FnZS93cGV3ZWJraXQvQ29uZmlnLmluCj4+
IGluZGV4IDk2OTU5MDQ4MmMuLjVjYmJhNDM3OTIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uvd3Bl
d2Via2l0L0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL3dwZXdlYmtpdC9Db25maWcuaW4KPj4g
QEAgLTQxLDYgKzQxLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1dQRVdFQktJVAo+PiAgCWRlcGVu
ZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJQkdMRVMgIyBsaWJlcG94eQo+PiAgCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfSEFTX0xJQkVHTCAjIGxpYmVwb3h5Cj4+ICAJZGVwZW5kcyBvbiBCUjJfUEFD
S0FHRV9XUEVXRUJLSVRfQVJDSF9TVVBQT1JUUwo+PiArCXNlbGVjdCBCUjJfSE9TVF9DTUFLRV9B
VF9MRUFTVF8zXzIwCj4+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0NBSVJPIGlmIEJSMl9FTkRJQU4g
PSAiQklHIgo+PiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9DQUlST19QTkcgaWYgQlIyX0VORElBTiA9
ICJCSUciCj4+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0hBUkZCVVpaCj4+IC0tIAo+PiAyLjM5LjUK
Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPj4KPiAK
PiBDaGVlcnMsCj4g4oCUQWRyacOhbgo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
