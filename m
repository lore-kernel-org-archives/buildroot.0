Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36018CAC5B9
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BC0B41531;
	Thu, 25 Sep 2025 20:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MQ7QPbZNFOvz; Thu, 25 Sep 2025 20:16:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A32841209
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A32841209;
	Thu, 25 Sep 2025 20:16:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F378012D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F130984398
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6lqOb4Wx1pb5 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:16:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD6A784396
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD6A784396
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD6A784396
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:16:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ef166e625aso1140393f8f.2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 13:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758831406; x=1759436206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VhTLaRzkAg7FAkQw0l0UNq3+TRRaF350Ksi9BfKk/iY=;
 b=jqS5dpzqyvAKzhO94GEcs0zdTggirdLUhnZGx5RXKCwaG0Hqdm4McThNRVsToE0wpO
 xDTOAOsTH9a02iKzNxp79mzPKR5VDX0wP1l9JSHQ8m0N0HWcVfOp6z67QQ1+01w/womx
 vIwRqORopomuZYCMHTRQfRaXxCBpDIf6flfdzqpmq5icgERgC1lAfTibbd1PMto8RLEc
 avqcAveYO3Nq5x+cxwAvx9yM5hUOADfhFkIGUY3YPQ2FyuZUeTkoLr0ZJsJaaMw9tbf8
 mJDrQKncZoS4Xa2gmz/HAW2qWjxJh3Ix9TkMjP62uYmsW4strd4gp+fYRf9l8mVP0kLE
 t33A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm8AEC5v0oSJSY0dylXbsvGFofAZeBAx6XWI1p3jPswHcFeutlSFHaqeDUl/brdeqqDzgjT9+B7sM=@buildroot.org
X-Gm-Message-State: AOJu0Yyst7+bXqbRxCgM0ciSJfS4D9FS5r9DoaEpWGZmysbZtotED1yW
 owBia0XSF7H+XxD+AELq5ZoSB2y/am8b1T2O+qLRB+fBXyhZ+4xJIHiXNuQ1dK3SFoAjQWqiYpi
 dgCQV2/E=
X-Gm-Gg: ASbGncuDnJSpqGZZSpAcyMQs7GWOiDO2TLckQ8bLkZkJkYuwDYXgOw9RiPAmveH4SZI
 Gu46cXEXZJbd4o/kHCu2Ze0drgPsZFz7QlbkmnVtjBCpIOguM2Lqo1ZXTefpUQjFxMTGT3hkyle
 Gdjz/bp8AVUSFrfn4/b0ao1JaowHPWsJXm2AxZpVtj6LbpSivAgAz0ljhdznlYrrK1wTQgSABFt
 PiYRviKKsvdI2pea9vQGSyiUKa7ya/E1oQaZiSsNkWD+imRPxvBLeb2ncBuYyPGGrSeULMVJfR7
 dEIvG8siaksDCuELn+ICpNyfK1GkpaZ5G5drD6d0Cqs2kRfEHDKA7TVHXCm5aNKY7JtP+8ZwsXB
 XZo6UceXbJRN66iM=
X-Google-Smtp-Source: AGHT+IFLdGxUai9thkJZpogFQIJOHRnLWASc0xOyBZxDQnr4URBKRlSCMCJoNcR3nHvYL76mpqGoJA==
X-Received: by 2002:a05:6000:1886:b0:3ee:13ba:e140 with SMTP id
 ffacd0b85a97d-40e4a8f9a93mr4053613f8f.21.1758831405795; 
 Thu, 25 Sep 2025 13:16:45 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc749b8f9sm4109781f8f.50.2025.09.25.13.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 13:16:45 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:16:44 +0200
Message-ID: <20250925201645.43432-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916093105.525147-1-peter@korsgaard.com>
References: <20250916093105.525147-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758831406; x=1759436206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VhTLaRzkAg7FAkQw0l0UNq3+TRRaF350Ksi9BfKk/iY=;
 b=iFUwFHogR7IkdhKdGaeb5+FMreNZzdfvwgi+dmFcGo5uecXKAa7VK1BshNnnVdZ+1d
 CtypzVg9GHuzMFOpACdz6yWUUSjQd/kZw+gRzyWrF89GtC5TW6iLCOTfhN4xTW7j8hMV
 1BGw1F4+M+SgSPedYpZ68NchakkPtCWIAg3no/7iiOMMCDXiuG6stiGng3OHwY1KnXR9
 v2cHUeEasbQBnQA1gCzNbPS97sYCoZxZfh7I1Nt2C1FGP1ZETTeyyPrfSO6hk42nCRey
 kvgV3egxPp95X4x2HKZ2Uc4j50IW7Yj8qSKl8QY6VbTTI5w4QCyt6f0act8m8e/Vptg+
 GwFw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iFUwFHog
Subject: Re: [Buildroot] [PATCH] package/cjson: security bump to version
 1.7.19
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZToKPiAKPiBD
VkUtMjAyNS01NzA1MjogY0pTT04gMS41LjAgdGhyb3VnaCAxLjcuMTggYWxsb3dzIG91dC1vZi1i
b3VuZHMgYWNjZXNzIHZpYQo+IHRoZSBkZWNvZGVfYXJyYXlfaW5kZXhfZnJvbV9wb2ludGVyIGZ1
bmN0aW9uIGluIGNKU09OX1V0aWxzLmMsIGFsbG93aW5nCj4gcmVtb3RlIGF0dGFja2VycyB0byBi
eXBhc3MgYXJyYXkgYm91bmRzIGNoZWNraW5nIGFuZCBhY2Nlc3MgcmVzdHJpY3RlZCBkYXRhCj4g
dmlhIG1hbGZvcm1lZCBKU09OIHBvaW50ZXIgc3RyaW5ncyBjb250YWluaW5nIGFscGhhbnVtZXJp
YyBjaGFyYWN0ZXJzCj4gCj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIw
MjUtNTcwNTIKPiBodHRwczovL3gtMHIuY29tL3Bvc3RzL2NKU09OLUFycmF5LUluZGV4LVBhcnNp
bmctVnVsbmVyYWJpbGl0eQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9EYXZlR2FtYmxlL2NKU09OL2Nv
bW1pdC83NGUxZmY0OTk0YWE0MTM5MTI2OTY3ZjZkMjg5YjY3NWI0YjM2ZmVmCj4gaHR0cHM6Ly9n
aXRodWIuY29tL0RhdmVHYW1ibGUvY0pTT04vcmVsZWFzZXMvdGFnL3YxLjcuMTkKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+CgpBcHBsaWVk
IHRvIDIwMjUuMDIueCwgMjAyNS4wNS54ICYgMjAyNS4wOC54LiBUaGFua3MKCj4gLS0tCj4gIHBh
Y2thZ2UvY2pzb24vMDAwMS1tYWtlX2NvbXBhdGlibGVfd2l0aF9jbWFrZV80LjAucGF0Y2ggfCA0
ICsrKy0KPiAgcGFja2FnZS9janNvbi9janNvbi5oYXNoICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IDIgKy0KPiAgcGFja2FnZS9janNvbi9janNvbi5tayAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2pzb24vMDAwMS1t
YWtlX2NvbXBhdGlibGVfd2l0aF9jbWFrZV80LjAucGF0Y2ggYi9wYWNrYWdlL2Nqc29uLzAwMDEt
bWFrZV9jb21wYXRpYmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoCj4gaW5kZXggMWZlNWNkNDNlZi4u
Njg0NzczZTRkYSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Nqc29uLzAwMDEtbWFrZV9jb21wYXRp
YmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoCj4gKysrIGIvcGFja2FnZS9janNvbi8wMDAxLW1ha2Vf
Y29tcGF0aWJsZV93aXRoX2NtYWtlXzQuMC5wYXRjaAo+IEBAIC0xNiw2ICsxNiw4IEBAIENNYWtl
IEVycm9yIGF0IENNYWtlTGlzdHMudHh0OjIgKGNtYWtlX21pbmltdW1fcmVxdWlyZWQpOgo+ICBU
aGlzIGNoYW5nZSByYWlzZXMgdGhlIG1pbmltdW0gcmVxdWlyZWQgQ01ha2UgdmVyc2lvbiB0byAz
LjUgYW5kIHRodXMgbWFrZXMgdGhlIHByb2plY3QgY29tcGF0aWJsZSB3aXRoIENNYWtlIDQuMAo+
ICAKPiAgU2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4u
Y29tPgo+ICtTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5j
b20+Cj4gK1BldGVyOiB1cGRhdGUgZm9yIDEuNy4xOQo+ICBVcHN0cmVhbTogaHR0cHM6Ly9naXRo
dWIuY29tL0RhdmVHYW1ibGUvY0pTT04vcHVsbC85MzUKPiAgLS0tCj4gICBDTWFrZUxpc3RzLnR4
dCB8IDIgKy0KPiBAQCAtMzEsNCArMzMsNCBAQCBpbmRleCAzNmE2Y2I1Ny4uOTQyOGRhNTggMTAw
NjQ0Cj4gICtjbWFrZV9taW5pbXVtX3JlcXVpcmVkKFZFUlNJT04gMy41KQo+ICAgCj4gICBwcm9q
ZWN0KGNKU09OCj4gLSAgICAgVkVSU0lPTiAxLjcuMTgKPiArICAgICBWRVJTSU9OIDEuNy4xOQo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Nqc29uL2Nqc29uLmhhc2ggYi9wYWNrYWdlL2Nqc29uL2Nq
c29uLmhhc2gKPiBpbmRleCBlMDdhZTBmN2JmLi5hODc2ZmZhZmU4IDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvY2pzb24vY2pzb24uaGFzaAo+ICsrKyBiL3BhY2thZ2UvY2pzb24vY2pzb24uaGFzaAo+
IEBAIC0xLDMgKzEsMyBAQAo+ICAjIExvY2FsbHkgY29tcHV0ZWQ6Cj4gLXNoYTI1NiAgM2FhODA2
ODQ0YTAzNDQyYzAwNzY5YjgzZTk5OTcwYmU3MGZiZWYwMzczNWZmODk4ZjQ4MTFkZDAzYjlmNWVl
NSAgY2pzb24tMS43LjE4LnRhci5nego+ICtzaGEyNTYgIDdmYTYxNmUzMDQ2ZWRmYTdhMjhhMzJk
NWY5ZWFjZmQyM2Y5MjkwMGZlMWY4Y2NkOTg4YzE2NjJmMzA0NTQ1NjIgIGNqc29uLTEuNy4xOS50
YXIuZ3oKPiAgc2hhMjU2ICBhMzZkZGEyMDdjMzZkYjU4MTg3MjljNTRlN2FkNGU4YjBjNmZiYTg0
NzQ5MWJhNjRmMzcyYzFhMjAzN2I2ZDVjICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
Y2pzb24vY2pzb24ubWsgYi9wYWNrYWdlL2Nqc29uL2Nqc29uLm1rCj4gaW5kZXggMzUzMDRlYzYx
OC4uZTAzMjA3NzBjYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2Nqc29uL2Nqc29uLm1rCj4gKysr
IGIvcGFja2FnZS9janNvbi9janNvbi5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1DSlNPTl9WRVJTSU9OID0gMS43LjE4Cj4gK0NKU09O
X1ZFUlNJT04gPSAxLjcuMTkKPiAgQ0pTT05fU0lURSA9ICQoY2FsbCBnaXRodWIsRGF2ZUdhbWJs
ZSxjanNvbix2JChDSlNPTl9WRVJTSU9OKSkKPiAgQ0pTT05fSU5TVEFMTF9TVEFHSU5HID0gWUVT
Cj4gIENKU09OX0xJQ0VOU0UgPSBNSVQKPiAtLSAKPiAyLjM5LjUKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
