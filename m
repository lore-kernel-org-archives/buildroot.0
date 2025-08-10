Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A15C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C11660DBB;
	Sun, 10 Aug 2025 16:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Er6gZTc7pkBv; Sun, 10 Aug 2025 16:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2AB060EB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2AB060EB5;
	Sun, 10 Aug 2025 16:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9233138
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBAA360DBB
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOoo1t1qZ4AZ for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 16:48:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BABE60F1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BABE60F1D
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BABE60F1D
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 16:48:28 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458baf449cbso35751755e9.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 09:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754844506; x=1755449306;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zKhDSgIPLoACa57mwLR26adVuJR/R7j+aZMy9tiCgUc=;
 b=Nu3qYTxclO3/fgXZK88oplPnvI8weH71zPrLkk5RR2lvnH5EaKbHgyLdMnQd/mdCPC
 vkzgfVGIalBwZkIyuO26Ew6nWiCJyMmgSEX5a0Z0pwJkcw3MAi2we0r57ag7QL9uohfQ
 XAhCL6mjaNFMJ9TS27LKb6+arth/mXqRORiNW0EHEyr9P815KEyl+FnAZLYcwmZZM9IF
 CODvTcxDh2SxlNIUomagaxywRPGtjSHtZKg5DI9BgbIkrY1F5CAc9vEo3tTXFTsdhadk
 SiMjuEq3ZmpTuPl86W0D9mXsyCtUE/mPFfjEYa01DYJ7KobadowZJACd68EEUYn+SYRJ
 ORyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5AEXT2MO6EmmxE6pPxdDZJHKXDG03G8yBaUA7ukPYZjUjLzbPKrMiIPwdtA1/GYcE10DvjoaXdMQ=@buildroot.org
X-Gm-Message-State: AOJu0Yw5wFoIJfp3PUQVBVdekmE0xJpdtSRX2Q6j9svmKuQB2V86FpnT
 JuklIKSWTEssIPIrishJjIsL1Q0VJZh7xS0Ri7uHNC54msvHWvs5uvDt9gGo5ImeSh8=
X-Gm-Gg: ASbGncuXDLesNoxI8s5aduDzPLLJEgV4wR0Lr3S/euhD/QEq0UUjCbJnr+xSjNtOynk
 ugoPv+QmjhvtyqWIb6omLpJoeK7o08/14LxWHthJiGJoyG7nQceQMiDxdeO/cinUd0Ha1/Jha+K
 aeEvIj9yrllVtDfDbwYlvLXXdIl0KpAQXa4wOmm0osowfuES0TOuonq5SMbxZFEXsqe3q6jF37F
 px3Fdhj5H9RN/qY1ZLKwpyuSErxqSYlESG3MOLCN8pUytlLRuzQLDLGfLbP4eGYrKRTOyKjh0+y
 IM41wZtT4C3ge7gUry0slT4mlPYSl4cZ4r5DPGdomybNPZa3VpMNq4Jdm3LT9fjaZ+cMeoG8PQQ
 Ehe/e+uMXRedzZR/sXZCGjePCqXADhLx9RU0VCocophdsCzpMiAryGN3+dNLJGsbDGhupt3sRn2
 G0qhk2ZfYL0kCN64xXZPFYxw06h3r9dAvcl1J9SYNvWIRQ7Fd2wKWFyhF0FEPI
X-Google-Smtp-Source: AGHT+IEmpUKdEkDnH98zTHGnbRMoP33kOX8ipR6FqoxoWnz8yLISZtjsOhinz0g/rkG35qcG9TavTA==
X-Received: by 2002:a05:600c:1c0e:b0:459:d9a2:e927 with SMTP id
 5b1f17b1804b1-459f4f3ced4mr87000705e9.5.1754844506261; 
 Sun, 10 Aug 2025 09:48:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8e0b2d2fasm27123997f8f.50.2025.08.10.09.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 09:48:25 -0700 (PDT)
Message-ID: <27e7bfa2-542b-42ca-aa27-45dd2336c033@smile.fr>
Date: Sun, 10 Aug 2025 18:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250729-cmake4-v2-0-24fd7677de1c@bootlin.com>
 <20250729-cmake4-v2-1-24fd7677de1c@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20250729-cmake4-v2-1-24fd7677de1c@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754844506; x=1755449306; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zKhDSgIPLoACa57mwLR26adVuJR/R7j+aZMy9tiCgUc=;
 b=yeU2GghmCndpDTJD5AUrRuLJZv/G6nSDJ0JdghSex72C+s4heVJUqGWB7NqQCiHlMl
 IFWG8vmjQ5Dg3J2elykuu8Kxg6vpulAb4LTVk9YcUltXgwIAPcd3ZIvwFlUObTf6XVU4
 KY6/1P3/oxb8TZjm1mfGnlnVSw1gNdfZs/mRY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=yeU2Gghm
Subject: Re: [Buildroot] [PATCH v2 1/2] package/cjson: fix cmake 4
 compatibility
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

SGVsbG8gQmVub8OudCwgQWxsLAoKTGUgMjkvMDcvMjAyNSDDoCAxMToyMSwgQmVub8OudCBNb25p
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gQWRkIGEgcGF0Y2ggZml4aW5nIGNtYWtlIDQg
Y29tcGF0aWJpbGl0eSwgZm91bmQgaW4gdXBzdHJlYW0gcHVsbAo+IHJlcXVlc3QgIzkzNS4KCkkg
YWRkZWQgbGluayB0byBhdXRvYnVpbGRlciBmYWlsdXJlcyBpbiBjb21taXQgbG9nIHNpbmNlIHdl
IGhhdmUgYXQgbGVhc3Qgb25lCmF1dG9idWlsZGVyIHVzaW5nIGNtYWtlIDQueDoKCmh0dHBzOi8v
YXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvP3N1Ym1pdHRlcj1KYW1lcytIaWxsaWFyZCslMjhhcmNo
LXVwc3RyZWFtLWRhdGEtNzk2MHglMjkKCkkgaGF2ZW4ndCBmb3VuZCBhbnkgaXNzdWUgZm9yIGZs
YXRjYy4KCk5vdGU6IGNtYWtlIDQueCBpcyBub3QgeWV0IHVzZWQgYnkgbWFueSBMaW51eCBkaXN0
cmlidXRpb24gKG5vdCBldmVuIHRoZQp1cGNvbWluZyBGZWRvcmEgNDMpOgpodHRwczovL3JlcG9s
b2d5Lm9yZy9wcm9qZWN0L2NtYWtlL3ZlcnNpb25zCgpTZXJpZXMgYXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZW5v
w650IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+Cj4gLS0tCj4gIC4uLi8wMDAxLW1h
a2VfY29tcGF0aWJsZV93aXRoX2NtYWtlXzQuMC5wYXRjaCAgICAgIHwgMzQgKysrKysrKysrKysr
KysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2Nqc29uLzAwMDEtbWFrZV9jb21wYXRpYmxlX3dpdGhfY21ha2VfNC4w
LnBhdGNoIGIvcGFja2FnZS9janNvbi8wMDAxLW1ha2VfY29tcGF0aWJsZV93aXRoX2NtYWtlXzQu
MC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMWZlNWNkNDNlZjEwZGUzNjZjMjgxYzg4ODA1OWQ4ZTY3
NGU1M2QyYQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2Nqc29uLzAwMDEtbWFrZV9j
b21wYXRpYmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoCj4gQEAgLTAsMCArMSwzNCBAQAo+ICtGcm9t
IDU4YmM3YzgyM2MyZTM5ZjFhNjI2ZWM0ZGE4Njk1MmJjNjgxOWJkNmIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCj4gK0Zyb206IE1hcmt1cyBWaWV0aCA8bXZpZXRoQHRlY2hmYWsudW5pLWJpZWxl
ZmVsZC5kZT4KPiArRGF0ZTogU3VuLCAzMCBNYXIgMjAyNSAxMToxMjowNyArMDIwMAo+ICtTdWJq
ZWN0OiBbUEFUQ0hdIE1ha2UgY29tcGF0aWJsZSB3aXRoIENNYWtlIDQuMCBXaGVuIHRyeWluZyB0
byBidWlsZCB3aXRoCj4gKyBDTWFrZSA0LjAsIHRoZSBmb2xsb3dpbmcgZXJyb3IgaXMgc2hvd246
Cj4gKwo+ICtDTWFrZSBFcnJvciBhdCBDTWFrZUxpc3RzLnR4dDoyIChjbWFrZV9taW5pbXVtX3Jl
cXVpcmVkKToKPiArICBDb21wYXRpYmlsaXR5IHdpdGggQ01ha2UgPCAzLjUgaGFzIGJlZW4gcmVt
b3ZlZCBmcm9tIENNYWtlLgo+ICsKPiArICBVcGRhdGUgdGhlIFZFUlNJT04gYXJndW1lbnQgPG1p
bj4gdmFsdWUuICBPciwgdXNlIHRoZSA8bWluPi4uLjxtYXg+IHN5bnRheAo+ICsgIHRvIHRlbGwg
Q01ha2UgdGhhdCB0aGUgcHJvamVjdCByZXF1aXJlcyBhdCBsZWFzdCA8bWluPiBidXQgaGFzIGJl
ZW4gdXBkYXRlZAo+ICsgIHRvIHdvcmsgd2l0aCBwb2xpY2llcyBpbnRyb2R1Y2VkIGJ5IDxtYXg+
IG9yIGVhcmxpZXIuCj4gKwo+ICsgIE9yLCBhZGQgLURDTUFLRV9QT0xJQ1lfVkVSU0lPTl9NSU5J
TVVNPTMuNSB0byB0cnkgY29uZmlndXJpbmcgYW55d2F5Lgo+ICsKPiArVGhpcyBjaGFuZ2UgcmFp
c2VzIHRoZSBtaW5pbXVtIHJlcXVpcmVkIENNYWtlIHZlcnNpb24gdG8gMy41IGFuZCB0aHVzIG1h
a2VzIHRoZSBwcm9qZWN0IGNvbXBhdGlibGUgd2l0aCBDTWFrZSA0LjAKPiArCj4gK1NpZ25lZC1v
ZmYtYnk6IEJlbm/DrnQgTW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KPiArVXBzdHJl
YW06IGh0dHBzOi8vZ2l0aHViLmNvbS9EYXZlR2FtYmxlL2NKU09OL3B1bGwvOTM1Cj4gKy0tLQo+
ICsgQ01ha2VMaXN0cy50eHQgfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiArCj4gK2RpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NN
YWtlTGlzdHMudHh0Cj4gK2luZGV4IDM2YTZjYjU3Li45NDI4ZGE1OCAxMDA2NDQKPiArLS0tIGEv
Q01ha2VMaXN0cy50eHQKPiArKysrIGIvQ01ha2VMaXN0cy50eHQKPiArQEAgLTEsNSArMSw1IEBA
Cj4gKyBzZXQoQ01BS0VfTEVHQUNZX0NZR1dJTl9XSU4zMiAwKQo+ICstY21ha2VfbWluaW11bV9y
ZXF1aXJlZChWRVJTSU9OIDMuMCkKPiArK2NtYWtlX21pbmltdW1fcmVxdWlyZWQoVkVSU0lPTiAz
LjUpCj4gKyAKPiArIHByb2plY3QoY0pTT04KPiArICAgICBWRVJTSU9OIDEuNy4xOAo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
