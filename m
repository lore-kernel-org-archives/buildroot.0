Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF4CC87FCB
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 17:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EBF440A7E;
	Sat,  9 Aug 2025 17:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHpGGIiageI2; Sat,  9 Aug 2025 17:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86181409CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86181409CB;
	Sat,  9 Aug 2025 17:14:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F11DC1D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E340960C0F
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:14:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvTFOIwpyXB3 for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 17:14:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D96BC60C07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D96BC60C07
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D96BC60C07
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 17:14:36 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4563cfac2d2so26533435e9.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 10:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754759675; x=1755364475;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ljcwd67yesVw/KlkQqfm8IbbI3mHUAfRWleI2Sozgeg=;
 b=D5k17PEdMlIXDdohwo/qxu5euCkdLNM/m3rKXBOdSgglFATI5+LLNhw4t0Ptmoe1sD
 rbpRc9kBzK92emDqvBauYs1RNdYaHygiNvB6B0FR1p4/1w03AOLtcxsGtKfwAHsWV/5Z
 TVHx+/ZFy5NzJv9QhfYLNxpiDlGeMrHlM2+2Ck1W42YV3Vu2ujDTclaOetpCOG17w6xP
 dbGAzmFknonu5aVIoQmXoq9MNvM283Rz0y+Q6I0Xa4w5jzrFJr+G58GdCXfvmHZHO/a8
 tuhnqc0asT1k3dXvzFuY6nfTX0szjuzWt8+/dLm4rFnqCOshJoWJvM9BHaDZ1rbyYNzZ
 p6WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrIeRZBY5dFJZOm7+QmiBuM4BumfJ50YcRtRDkjSGUZ79K0a6r+nTbV6RRebln6Vm9rgEq52aSykM=@buildroot.org
X-Gm-Message-State: AOJu0YwQyXIFR9QMFcGOkLBTqxsCqSlgcq8YXG3wu18f1Rk1HRhpMwe4
 xJiLt1fO2laov6G7mWNHgxDTtKXCs2AjkmcK56WxzmVIQCgciNKPKYahVka+NKqOtSQ9eij1ITh
 o6lm5
X-Gm-Gg: ASbGncuDKjAHSJpgr3DQzdKcrkyTB8Lx8yMaJfshriJmNMWfkVGvI7IqVUAeiZd1i1X
 7/ESQDXfZLMePfMi6hlN8hS0LnZTxcXZIo7VlmAOXkrKnnALUfwhJAXwck4C+E/vT2u8Z7R02AH
 bWdAbWahAsEh3hdx+0Hl5K7VMtAejiZnAMBk9bv+JdImhy38wEsqkMXrCZnVcbEacBEkdl147vX
 Cua9uGrf6PLY3CrAotKzYW41UF3HZp0G4EGQibScfU6losoOwQKMFrHUE/0+6Ej1o3F2TKY53Db
 oKMrZciXnJGtRGNHWhTzhGIIveRf7Iing8LAoPjWdHHEKETr3kxFICU+TvPwoK4qudSOhVBVFvQ
 rvmkqm6nPBS2o8hJCHMtWXP1rbWE20TGdw0pE6hHvKkQZBahoQ9uA2UUNEEltx4Kuog/G4Z6NCE
 RcaZvwHqdShCmA2omeLtPk+XgHU9ocYzReLBqZdxBhuer3g9JbyGFj1MtpeRS3
X-Google-Smtp-Source: AGHT+IG2HJiuJkorKb2Ef6gOhh0yxYVRiXb3VjkMnMNAm1SJgmiNLtdlcyrqNN2sb1SRiEeEcoy9Pg==
X-Received: by 2002:a05:6000:420e:b0:3b7:dd87:d741 with SMTP id
 ffacd0b85a97d-3b900b78c90mr5598223f8f.42.1754759674757; 
 Sat, 09 Aug 2025 10:14:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459eff7918csm117487305e9.25.2025.08.09.10.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 10:14:34 -0700 (PDT)
Message-ID: <7eae7b05-02e6-4b55-80e9-25742a17a113@smile.fr>
Date: Sat, 9 Aug 2025 19:14:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, buildroot@buildroot.org
References: <20250724102514.2188530-1-hayashi.kunihiko@socionext.com>
Content-Language: fr, en-US
In-Reply-To: <20250724102514.2188530-1-hayashi.kunihiko@socionext.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754759675; x=1755364475; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ljcwd67yesVw/KlkQqfm8IbbI3mHUAfRWleI2Sozgeg=;
 b=r01QSuQOWHWlKFCDxwUl5eEm8DHC3CguvhbANUTVzUiZCK8a/YNJitRXH+j1a/yL5U
 YzXRvEEAgnq0O4zpEJGIqlOM/lEU6lKUP49PVYiTo3Zkv7bg7168m02z1w0yxBjuzjNT
 LDmIEF/rwdDaIhySpulsae2ACY1i3/DJS83lQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=r01QSuQO
Subject: Re: [Buildroot] [PATCH] package/qemu: add zstd support
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

SGVsbG8gS3VuaWhpa28sCgpMZSAyNC8wNy8yMDI1IMOgIDEyOjI1LCBLdW5paGlrbyBIYXlhc2hp
IGEgw6ljcml0wqA6Cj4gQWRkIG9wdGlvbmFsIHpzdGQgY29tcHJlc3Npb24gdHlwZSBzdXBwb3J0
IGZvciBRRU1VLgo+IAo+IEluIG9yZGVyIHRvIGEgZmlsZSBjb21wcmVzc2VkIHdpdGggenN0ZCBv
biBob3N0IHRvIGJlIGFwcGxpZWQgdG8KPiB0YXJnZXQgUUVNVSwgenN0ZCBvbiBib3RoIGhvc3Qg
YW5kIHRhcmdldCBzaG91bGQgYmUgZW5hYmxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLdW5paGlr
byBIYXlhc2hpIDxoYXlhc2hpLmt1bmloaWtvQHNvY2lvbmV4dC5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvcWVtdS9xZW11Lm1rIHwgMTQgKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUubWsgYi9w
YWNrYWdlL3FlbXUvcWVtdS5tawo+IGluZGV4IGZkYzg1OTFlNTQ2YS4uYTFhNGI2MDg1NWQ3IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvcWVtdS9xZW11Lm1rCj4gKysrIGIvcGFja2FnZS9xZW11L3Fl
bXUubWsKPiBAQCAtMjcxLDYgKzI3MSwxMyBAQCBlbHNlCj4gIFFFTVVfT1BUUyArPSAtLWRpc2Fi
bGUtaW5zdGFsbC1ibG9icwo+ICBlbmRpZgo+ICAKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9aU1RE
KSx5KQo+ICtRRU1VX09QVFMgKz0gLS1lbmFibGUtenN0ZAo+ICtRRU1VX0RFUEVOREVOQ0lFUyAr
PSB6c3RkCj4gK2Vsc2UKPiArUUVNVV9PUFRTICs9IC0tZGlzYWJsZS16c3RkCj4gK2VuZGlmCj4g
Kwo+ICAjIE92ZXJyaWRlIENQUCwgYXMgaXQgZXhwZWN0cyB0byBiZSBhYmxlIHRvIGNhbGwgaXQg
bGlrZSBpdCdkCj4gICMgY2FsbCB0aGUgY29tcGlsZXIuCj4gIGRlZmluZSBRRU1VX0NPTkZJR1VS
RV9DTURTCj4gQEAgLTQ2MCw2ICs0NjcsMTMgQEAgZWxzZQo+ICBIT1NUX1FFTVVfT1BUUyArPSAt
LWRpc2FibGUtbGlidXNiCj4gIGVuZGlmCj4gIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0hPU1Rf
WlNURCkseSkKPiArSE9TVF9RRU1VX09QVFMgKz0gLS1lbmFibGUtenN0ZAo+ICtIT1NUX1FFTVVf
REVQRU5ERU5DSUVTICs9IGhvc3QtenN0ZAo+ICtlbHNlCj4gK0hPU1RfUUVNVV9PUFRTICs9IC0t
ZGlzYWJsZS16c3RkCj4gK2VuZGlmCgpJJ20gd29uZGVyaW5nIGlmIGl0J3MgcmVhbGx5IG5lY2Vz
c2FyeSB0byBtYWtlIHpzdGQgc3VwcG9ydCBvcHRpb25hbCBmb3IgdGhlCmhvc3QgdmFyaWFudC4g
QnV0IHNpbmNlIEJSMl9QQUNLQUdFX0hPU1RfWlNURCBleGlzdCwgaXQncyBvayBhcyBpcy4KClJl
dmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJlc3QgcmVn
YXJkcywKUm9tYWluCgoKPiArCj4gICMgT3ZlcnJpZGUgQ1BQLCBhcyBpdCBleHBlY3RzIHRvIGJl
IGFibGUgdG8gY2FsbCBpdCBsaWtlIGl0J2QKPiAgIyBjYWxsIHRoZSBjb21waWxlci4KPiAgZGVm
aW5lIEhPU1RfUUVNVV9DT05GSUdVUkVfQ01EUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
