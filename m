Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51848C83F05
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 16:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B10F40793;
	Sun,  6 Jul 2025 16:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VY4K3QohfZGI; Sun,  6 Jul 2025 16:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 435C04073F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 435C04073F;
	Sun,  6 Jul 2025 16:40:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D395219C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5D15406EF
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DEv4mXcey71 for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 16:40:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B555C4073F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B555C4073F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B555C4073F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:40:13 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-451d7b50815so18165125e9.2
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 09:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751820011; x=1752424811;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8CV6/DS2fVQGhmMXdgzPsr8pSWxViqttadRv3+/YLrw=;
 b=cZDtLSEfHwd+03TOQ7wN4QNrt4CdX1nkCTvGBrCzneIvkC+ZwR2AZs8rne9DMHk4/D
 nOXc8d8MMm0sABAJt2h8Kdd5ASiXsGcF6drV+RuBJ7sVUEdLDcKuEnkDfg8/P+O1eNUp
 2LAGdyx0PnbXylVHowaZCvio97h8TFdaqAr6g5w5Dm0NUjnWbCLTQOPsQFv1lOUym0PX
 iQE+CAG0vvVJ6RmQ/7OyXqtn84DL9A20qkiZ4BLq4dH5+tTLn4K9TdE0APQzhrv4itTG
 eULfOFGQAP6nDpZxpDU3R+b2mPCZVuMBmTYx9CzEiQpkuzeJtyH4xse1U51tUJ9oKsgR
 3XLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrYHeEiUuXu2mfVtcNEpBPtspQ8AE/VeqQrFKgav9RQa0WO+F82ihKYFSazX2RBOiWoTlYWH8uw6U=@buildroot.org
X-Gm-Message-State: AOJu0Yy1q5RughkAahga1H1WaYy3E/s8fpmpGwjL13J+3r+MrFRrLqzs
 oHvGKpDX+JHZJDgHsCcDQiIAYviBHQoRNUFuqk1XnuBG0a6pl18WiqLtx1MSGrfo9Cf1LvzE3Jv
 3L7YT
X-Gm-Gg: ASbGncvxOj32sNltAVTAlFVeJbt877HF465LcLYW4/hwd1hjCAPXdGODftUwxdHkvrR
 hj3A5k0aKXxb5zLSeXO+aha5XUETlTZF7/aXhg9YcMs1BzbVHzdvXc/hd/bHuKehgfmaEYpXcyp
 twhOzNYWJt+22S2a17Huc7C55a57SguAbfFkp/M8KEJYcPJ13RcXT73YORYhGJJcFXjB/AheBcd
 KLSTwcn2rA4UyoC8wI+/rfFOUWdXiSof5NicAgpB25Jr/uQ5HvJISfHZwLr0H/RI4SHCDGj6rB6
 My7bVKdcF2rAtlDCBDzt/RKgLi0DsBpjJ19EQ+X9CrEkIVxEI5609Minv5mHlpWFexvy4b3cKy2
 vwLjRBrVX1Qumg3QKE3Xh7qK7KZLa/7Fvmq7JCNNKkwJvzKsMZgA8812ycW1PbE2l/911ijKvKq
 D554RFWtAwzTSsgLG62pe+8vbN
X-Google-Smtp-Source: AGHT+IEQaoGUpiDTR2+eqmyZGoR7DCupvImlrKo8yTX/+GRdZo8O7m6BeFw72xbRv11TxpmsygFxcQ==
X-Received: by 2002:a05:600c:1c03:b0:43c:f513:9591 with SMTP id
 5b1f17b1804b1-454b3124faemr90386105e9.14.1751820011427; 
 Sun, 06 Jul 2025 09:40:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d099esm7809463f8f.21.2025.07.06.09.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 09:40:11 -0700 (PDT)
Message-ID: <402a15d9-f995-4513-9ec7-c2061bf3f955@smile.fr>
Date: Sun, 6 Jul 2025 18:40:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>, yann.morin@orange.com
References: <20250611162152.32353-1-fl@n621.de>
Content-Language: fr
In-Reply-To: <20250611162152.32353-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751820011; x=1752424811; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8CV6/DS2fVQGhmMXdgzPsr8pSWxViqttadRv3+/YLrw=;
 b=1sX8MOH7BIFeJG+n4/GaPoH1LBz0j2mc7b9inAxf/a4v0XlVe9w+VvJQN2tvgDw++d
 lIEdZt9VCEHHPt5btprxyl2CTnz+6UPGgVkb4IQqFZc/ovEqYA8b2VOsKibBvIu1Ai2N
 FiUicMpNi3bM27irscWp8FpJOwE7bp1rWliek=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=1sX8MOH7
Subject: Re: [Buildroot] [PATCH 1/1] package/go: make pre-built compiler
 provide target support too
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

SGVsbG8gRmxvcmlhbiwKCkFkZGluZyBZYW5uIGluIENjIChHbyBpbmZyYSByZWxhdGVkIHRvcGlj
KQoKTGUgMTEvMDYvMjAyNSDDoCAxODoyMSwgRmxvcmlhbiBMYXJ5c2NoIGEgw6ljcml0wqA6Cj4g
Q3VycmVudGx5LCBCUjJfUEFDS0FHRV9IT1NUX0dPX1RBUkdFVF9BUkNIX1NVUFBPUlRTIGRlcGVu
ZHMgb24KPiBCUjJfUEFDS0FHRV9IT1NUX0dPX0JPT1RTVFJBUF9TVEFHRTNfQVJDSF9TVVBQT1JU
Uywgd2hpY2ggdHJhbnNpdGl2ZWx5Cj4gZGVwZW5kcyBvbiBzdGFnZTEgYm9vdHN0cmFwcGluZyBz
dXBwb3J0LCB3aGljaCBpcyBvbmx5IHByZXNlbnQgZm9yCj4geDg2L3g4Nl82NCBhbmQgYXJtLgpP
ay4KPiAKPiBXaGVuIGJ1aWxkaW5nIG9uIGEgaG9zdCBzeXN0ZW0gd2hpY2ggZG9lc24ndCBzdXBw
b3J0IGEgZnVsbCBib290c3RyYXAKPiAobGlrZSBhYXJjaDY0KSwgd2UgY2FuIGZhbGwgYmFjayBv
biB0aGUgcHJlLWJ1aWx0IHRvb2xjaGFpbi4gSG93ZXZlciwgaW4KPiB0aGF0IGNhc2UsIHRob3Nl
IHN5bWJvbHMgYXJlIGFsbCBmYWxzZSwgbWFraW5nIHRoZSBpbnRlcm5hbCBzdGF0ZSBvZiB0aGUK
PiBidWlsZCBzeXN0ZW0gaW5jb25zaXN0ZW50LiBJbiBwYXJ0aWN1bGFyLCB0aGlzIGNhdXNlcyBu
b25lIG9mIHRoZQo+IGVudmlyb25tZW50IHZhcmlhYmxlcyBsaWtlIEdPQVJDSCB0byBiZSBzZXQg
YW5kIHRodXMgdGhlIEdvIGNvbXBpbGVyCj4gd2lsbCBwZXJmb3JtIGEgbmF0aXZlIGJ1aWxkIGlu
c3RlYWQgb2YgYSBjcm9zcyBidWlsZC4KCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGlzIHBhcnQuIFNp
bmNlIEJSMl9QQUNLQUdFX0hPU1RfR09fVEFSR0VUX0FSQ0hfU1VQUE9SVFMgaXMKbm90IHNldCBv
biBhYXJjaDY0IGJ1aWxkIG1hY2hpbmUsIHdlIGNhbid0IGVuYWJsZSBhbnkgZ28gcGFja2FnZXMg
Zm9yIHRoZQp0YXJnZXQuIFdlIGNhbiBvbmx5IGluc3RhbGwgaG9zdC1nby1iaW4gKHdoaWNoIGlz
IHVzZWxlc3MgaW4gdGhpcyBjYXNlKS4KCj4gCj4gRml4IHRoaXMgYnkgYWxzbyBhbGxvd2luZyBC
UjJfUEFDS0FHRV9IT1NUX0dPX0JJTl9IT1NUX0FSQ0hfU1VQUE9SVFMgdG8KPiBmdWxmaWxsIHRo
ZSBkZXBlbmRlbmN5LgoKVGhpcyB3b3VsZCBmaXggdGhpcyBjb21taXQgWzFdIGZyb20gQnVpbGRy
b290IDIwMjQuMTEsIHNvIGl0IHNob3VsZCBiZSBiYWNrcG9ydGVkLgoKWzFdCmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC83YjJhMTY0Yjc0NjBjMDc0
NzEwODBmZTU2NWJmNWRhNzZiMDMyZTU5CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gU2ln
bmVkLW9mZi1ieTogRmxvcmlhbiBMYXJ5c2NoIDxmbEBuNjIxLmRlPgo+IC0tLQo+ICBwYWNrYWdl
L2dvL0NvbmZpZy5pbi5ob3N0IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9Db25maWcuaW4u
aG9zdCBiL3BhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QKPiBpbmRleCA3ZTM1NGIzMjk4Li5hNDJl
MzdmOTBiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QKPiArKysgYi9w
YWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTIsNyArMiw3IEBACj4gIGNvbmZpZyBCUjJf
UEFDS0FHRV9IT1NUX0dPX1RBUkdFVF9BUkNIX1NVUFBPUlRTCj4gIAlib29sCj4gIAlkZWZhdWx0
IHkKPiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT19CT09UU1RSQVBfU1RBR0UzX0FS
Q0hfU1VQUE9SVFMKPiArCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT19CT09UU1RSQVBf
U1RBR0UzX0FSQ0hfU1VQUE9SVFMgfHwgQlIyX1BBQ0tBR0VfSE9TVF9HT19CSU5fSE9TVF9BUkNI
X1NVUFBPUlRTCj4gIAkjIFNlZSBodHRwczovL2dvLmRldi9kb2MvaW5zdGFsbC9zb3VyY2UjZW52
aXJvbm1lbnQKPiAgCSMgU2VlIHNyYy9nby9idWlsZC9zeXNsaXN0LmdvIGZvciB0aGUgbGlzdCBv
ZiBzdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcwo+ICAJZGVwZW5kcyBvbiAoQlIyX2FybSAmJiBCUjJf
VE9PTENIQUlOX1NVUFBPUlRTX1BJRSkgfHwgQlIyX2FhcmNoNjQgXAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
