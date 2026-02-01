Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06804E6526B
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 21:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEA2F605D1;
	Sun,  1 Feb 2026 21:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5CxDY16f8Pjg; Sun,  1 Feb 2026 21:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28F0605DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769980905;
	bh=OJiZ8eNs85Y/Ke5qLHG2Naa8Er95G+HxsGFxy/vVDi0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LZp4Ji6A7Cdn17XQnRuppRgc5+1TEowxYZbeh7H+13+aZLKO5ecVKQ9TMxj66VSek
	 r22Z3YeHOGxtQ4of+djDDEQiE98PzKG/ldOPdxRCL9shH++SUGeQrZ5gq1vZd8SUsm
	 v5MaKW+EpQq+OAud6/tqdiecaKgsmtjYahGodGrRLNDUQchTact87fpDytYFXsmOgr
	 BM8YYeTj1QFoZRwnC/X3Relk+hVLSnjewTyIUVWSPyE3JeiJ5f5+KG+402oFHCjG/Y
	 MXMUIqEe4dx/IJ1cop2K+fpLqHlVIGhtGZWSHD/Fu2Drgv+wntejzTBeyIQPGeZRuF
	 zT83dSXACs9iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C28F0605DE;
	Sun,  1 Feb 2026 21:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 238941E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06CDD82382
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:21:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVSXWbppJuJp for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 21:21:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::144; helo=mail-lf1-x144.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 931218234F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 931218234F
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 931218234F
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 21:21:42 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id
 2adb3069b0e04-59ddb31ddcaso4194520e87.2
 for <buildroot@buildroot.org>; Sun, 01 Feb 2026 13:21:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769980900; x=1770585700;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RxcmLyMup41Hgz4ewGMgV8lyGLR0lmC8crjfbJ5jnTg=;
 b=ELDnSybDlPR1XRIZaGWgWlZr5MTkofAFCiq4FC61Xf4F8wMvCv5mhZ1ufRlDKTXhBZ
 bjpvd5K1276/GMnYpxnoAgrWpOk8RWVDDuwrdOVOmW83O/VH7faEBeQwNeDka4Z+hsDz
 O+UxMcWlzmQcWmm0Gd5uOptmMXpV63ZQUZyvLIzNQwq0wsy27uT0IqIpcCUXQhh9QvzA
 b+ttCjOffHMwLtZpVHctWc+mYrmwBZEiHr+zH4RxOGlyfA+clSs60dLfPbiNxdBxtMIP
 upIfMQdLmm3i9g4DRYBDRKRxoCAsH3ChlGdepaCsCtMg2pEmPpePEd1+l2xHJKSU4sDm
 8aIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUny/hcGYsXFx5SuyhHoWuQAavrYMalgqkh8i+RrnRpFP6q7tdyoVL0Um/3H5b/53MM0vsFqMibWVs=@buildroot.org
X-Gm-Message-State: AOJu0YygEpd1j/FKP2H89Ncg8p7XjNsXAkzSavjn0fWfpV804t1bwWDB
 cUDNedJfEyfYZh3IzFZ1+rHPqbxek6zBWupxWGkEUOANHPZrG/cpAIthTu2dhuHHtbNiAuGshgM
 uWi2veTw=
X-Gm-Gg: AZuq6aJwfUBbfGV40Uo+Nvp5WybjYOvfvLVgU4JJ89K2Kc23JNJ9uyhK4AeFzPukBj9
 GUhXB/heaJ72vpgq9VoS5aNJOqcsrs9oJ/dyAvCZs1yRApZGj6c1iDlrjivl3qytGb6EK5+jsXY
 UV3ltAthM0MG6Dv48wKG6oYFphp92BOMd3MRpXCryG+WK7wE5jFSivd+jecrlqCw5pLkBSarp1N
 q6Sli6VUukktY+qLW6HXG6qAdvbgHkXo7/lSxUwfJ0UOy5dv5veXVYKwbnnc3sPUo0uCbKGQ2ZT
 M5aRFmM8GeIGpHkEISCUx5t3vvsjHxPkTjqc3nZp6+0bPOOWvTsRtDW9bOR1BQoP3Q+doumykeY
 SByUJndjhqgRc13URJIB2VfQeeqdXBWB714BLc7EhXoc9o3PP9R0JQTpTIunDYGhq6ceuB5Wn6n
 vbYYI+cOtuLVEsgH+3oI5s8a2Ga7E4oLHJQSo2W1PEHl3S
X-Received: by 2002:a05:6512:2207:b0:59d:e353:4ba3 with SMTP id
 2adb3069b0e04-59e163f57b5mr2834612e87.8.1769980899925; 
 Sun, 01 Feb 2026 13:21:39 -0800 (PST)
Received: from [192.168.24.150] (170.127.92.92.rev.sfr.net. [92.92.127.170])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e074b701fsm3082438e87.70.2026.02.01.13.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 13:21:39 -0800 (PST)
Message-ID: <82fffd9a-dcd8-4dc6-8f33-c85e8d3f836c@smile.fr>
Date: Sun, 1 Feb 2026 22:21:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
References: <20260124131337.1022030-1-ju.o@free.fr>
 <20260124131337.1022030-3-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20260124131337.1022030-3-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1769980900; x=1770585700; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RxcmLyMup41Hgz4ewGMgV8lyGLR0lmC8crjfbJ5jnTg=;
 b=wo89g2uqVIIQ7tRrksnW7cvWwTIG52f4sKy0Oatqyqw46eD8EVxGO/f5HSK14Bl821
 YfdYjWElZZ0WbPmFwqKRNX2omOoK3dFz/e9OFgQFCnaIePN4Eubw4vCTSCMsfl/7/XYY
 FqWFdAXGXy14GcJ6NolFXV3wiYZmZnQRKIPns=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=wo89g2uq
Subject: Re: [Buildroot] [PATCH 3/3] boot/edk2: bump to version
 edk2-stable202511
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

SGVsbG8gSnVsaWVuLAoKTGUgMjQvMDEvMjAyNiDDoCAxNDoxMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBGb3IgcmVsZWFzZSBub3RlcyBzaW5jZSBlZGsyLXN0YWJsZTIwMjUwOCwgc2Vl
Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRrMi1z
dGFibGUyMDI1MTEKPiAKPiBUaGlzIGNvbW1pdCBhbHNvIHVwZGF0ZXMgdGhlIGVkazItcGxhdGZv
cm1zIHBhY2thZ2VzIHdpdGggdGhlIGxhc3QKPiBjb21taXQgbWVyZ2VkIGF0IHRoZSBlZGsyIHJl
bGVhc2UgZGF0ZSAoMjAyNS0xMS0xOSksIHdoaWNoIGNvcnJlc3BvbmRzCj4gdG8gY29tbWl0IFsx
XS4KPiBUaGUgZWRrMi1ub24tb3NpIHBhY2thZ2UgaXMgYWxzbyB1cGRhdGVkIHRoZSBzYW1lIHdh
eSwgd2hpY2gKPiBjb3JyZXNwb25kcyB0byBjb21taXQgWzJdLgo+IAo+IFRoaXMgY29tbWl0IGFs
c28gYWRkcyBhbiBlZGsyLXBsYXRmb3JtcyBwYWNrYWdlIHBhdGNoIHRvIGZpeCBhIE1hcnZlbGwK
PiBidWlsZCBmYWlsdXJlIHNlZW4gd2l0aCB0aGUgU29saWRSdW4gTWFjY2hpYXRvQmluIHBsYXRm
b3JtLgo+IAo+IFRoaXMgY29tbWl0IGhhcyBiZWVuIHJ1bnRpbWUgdGVzdGVkIHdpdGggdGVzdHMg
dXNpbmcgRURLMiBwYWNrYWdlLAo+IHdpdGggY29tbWFuZHM6Cj4gCj4gICAgIHN1cHBvcnQvdGVz
dGluZy9ydW4tdGVzdHMgXAo+ICAgICAgICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCj4gICAg
ICAgICAgICAgdGVzdHMuYm9vdC50ZXN0X2VkazIgXAo+ICAgICAgICAgICAgIHRlc3RzLmJvb3Qu
dGVzdF9ncnViLlRlc3RHcnViQUFyY2g2NEVGSSBcCj4gICAgICAgICAgICAgdGVzdHMuYm9vdC50
ZXN0X2dydWIuVGVzdEdydWJSaXNjVjY0RUZJIFwKPiAgICAgICAgICAgICB0ZXN0cy5ib290LnRl
c3RfZ3J1Yi5UZXN0R3J1Ylg4NjY0RUZJIFwKPiAgICAgICAgICAgICB0ZXN0cy5wYWNrYWdlLnRl
c3RfZnd0cwo+IAo+IEl0IGhhcyBhbHNvIGJlZW4gcnVudGltZSB0ZXN0ZWQgKGJ5IGJvb3Rpbmcg
aW4gcWVtdSkgd2l0aCBkZWZjb25maWdzCj4gdXNpbmcgRURLMiBwYWNrYWdlOgo+IHFlbXVfYWFy
Y2g2NF9zYnNhX2RlZmNvbmZpZwo+IHFlbXVfbG9vbmdhcmNoNjRfdmlydF9lZmlfZGVmY29uZmln
Cj4gcWVtdV9yaXNjdjY0X3ZpcnRfZWZpX2RlZmNvbmZpZwo+IHFlbXVfeDg2XzY0X2VmaV9kZWZj
b25maWcKPiAKPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLXBsYXRmb3Jt
cy9jb21taXQvMWU2NGMxMTA5YWUyYWMwMTg1MzUxZThkMGMxOTczMjk3MGQ0ZmVjZgo+IFsyXSBo
dHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazItbm9uLW9zaS9jb21taXQvOTRkMDQ4OTgx
MTE2ZTJlM2VkYTUyZGFkMWE4OTk1OGVlNDA0MDk4ZAo+IAo+IENjOiBEaWNrIE9sc3NvbiA8aGlA
c2VuemlsbGEuaW8+Cj4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgo+
IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0KPiBUaGUgZWRrMi1wbGF0
Zm9ybXMgcGF0Y2ggY29udGFpbnMgQ1ItTEYgbGluZSBlbmRpbmdzLCB3aGljaCBtaWdodCBiZSBj
aGFuZ2VkCj4gYnkgdGhlIG1haWxpbmcgbGlzdCB0byBMRi4gVGhpcyBjYW4gbWFrZSB0aGUgcGF0
Y2ggbm90IGFwcGx5IGNsZWFubHkuIEZvcgo+IGNvbnZlbmllbmNlLCBJIGFsc28gcHVibGlzaGVk
IHRob3NlIHBhdGNoZXMgYXQ6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2pvbGl2YWluL2J1aWxkcm9v
dC8tL2NvbW1pdHMvYnVtcF9lZGsyLXN0YWJsZTIwMjUxMQo+IC0tLQo+ICBDb25maWcuaW4ubGVn
YWN5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKwo+ICBib290L2VkazIvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMiArLS0KPiAgYm9vdC9lZGsyL2Vk
azIuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgYm9vdC9lZGsyL2Vk
azIubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTUgKy0tLQo+ICBwYWNrYWdlL2Vk
azItbm9uLW9zaS9lZGsyLW5vbi1vc2kuaGFzaCAgICAgICAgfCAgMiArLQo+ICBwYWNrYWdlL2Vk
azItbm9uLW9zaS9lZGsyLW5vbi1vc2kubWsgICAgICAgICAgfCAgMiArLQo+ICAuLi5NYXJ2ZWxs
LWZpeC1TTUJJT1MtdHlwZS03LXN0cnVjdHVyZXMucGF0Y2ggfCA4MCArKysrKysrKysrKysrKysr
KysrCj4gIHBhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9ybXMuaGFzaCAgICB8ICAy
ICstCj4gIHBhY2thZ2UvZWRrMi1wbGF0Zm9ybXMvZWRrMi1wbGF0Zm9ybXMubWsgICAgICB8ICAy
ICstCj4gIDkgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0p
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2VkazItcGxhdGZvcm1zLzAwMDEtU2lsaWNv
bi1NYXJ2ZWxsLWZpeC1TTUJJT1MtdHlwZS03LXN0cnVjdHVyZXMucGF0Y2gKPiAKCi4uLgoKPiBk
aWZmIC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIubWsgYi9ib290L2VkazIvZWRrMi5tawo+IGluZGV4
IDJjMDg5YWVmY2EuLmRiYTRhZWQ1MTMgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9lZGsyL2VkazIubWsK
PiArKysgYi9ib290L2VkazIvZWRrMi5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1FREsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjUw
OAo+ICtFREsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjUxMQo+ICBFREsyX1NJVEUgPSBodHRw
czovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIKPiAgRURLMl9TSVRFX01FVEhPRCA9IGdpdAo+
ICBFREsyX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UtUGF0ZW50Cj4gQEAgLTU2LDE0ICs1Niw3IEBA
IEVESzJfR0lUX1NVQk1PRFVMRVMgPSBZRVMKPiAgRURLMl9CVUlMRF9QQUNLQUdFUyA9ICQoQEQp
L0J1aWxkL0J1aWxkcm9vdAo+ICBFREsyX1BBQ0tBR0VTX1BBVEhTID0gJChARCkgJChFREsyX0JV
SUxEX1BBQ0tBR0VTKSAkKFNUQUdJTkdfRElSKS91c3Ivc2hhcmUvZWRrMi1wbGF0Zm9ybXMKPiAg
Cj4gLWlmZXEgKCQoQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX09WTUZfSTM4NikseSkKPiAtRURL
Ml9BUkNIID0gSUEzMgo+IC1FREsyX0RFUEVOREVOQ0lFUyArPSBob3N0LW5hc20KPiAtRURLMl9Q
QUNLQUdFX05BTUUgPSBPdm1mUGtnCj4gLUVESzJfUExBVEZPUk1fTkFNRSA9IE92bWZQa2dJYTMy
Cj4gLUVESzJfQlVJTERfRElSID0gT3ZtZklhMzIKPiAtCj4gLWVsc2UgaWZlcSAoJChCUjJfVEFS
R0VUX0VESzJfUExBVEZPUk1fT1ZNRl9YNjQpLHkpCj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9FREsy
X1BMQVRGT1JNX09WTUZfWDY0KSx5KQo+ICBFREsyX0FSQ0ggPSBYNjQKPiAgRURLMl9ERVBFTkRF
TkNJRVMgKz0gaG9zdC1uYXNtCj4gIEVESzJfUEFDS0FHRV9OQU1FID0gT3ZtZlBrZwo+IEBAIC03
NCwxMyArNjcsMTMgQEAgZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1f
VklSVF9RRU1VKSx5KQo+ICBFREsyX0FSQ0ggPSBBQVJDSDY0Cj4gIEVESzJfUEFDS0FHRV9OQU1F
ID0gQXJtVmlydFBrZwo+ICBFREsyX1BMQVRGT1JNX05BTUUgPSBBcm1WaXJ0UWVtdQo+IC1FREsy
X0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9STV9OQU1FKS0kKEVESzJfQVJDSCkKPiArRURLMl9C
VUlMRF9ESVIgPSAkKEVESzJfUExBVEZPUk1fTkFNRSktQUFyY2g2NAo+ICAKPiAgZWxzZSBpZmVx
ICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1fVklSVF9RRU1VX0tFUk5FTCkseSkKPiAg
RURLMl9BUkNIID0gQUFSQ0g2NAo+ICBFREsyX1BBQ0tBR0VfTkFNRSA9IEFybVZpcnRQa2cKPiAg
RURLMl9QTEFURk9STV9OQU1FID0gQXJtVmlydFFlbXVLZXJuZWwKPiAtRURLMl9CVUlMRF9ESVIg
PSAkKEVESzJfUExBVEZPUk1fTkFNRSktJChFREsyX0FSQ0gpCj4gK0VESzJfQlVJTERfRElSID0g
JChFREsyX1BMQVRGT1JNX05BTUUpLUFBcmNoNjQKCkl0IHNlZW1zIHRoZSBjb21taXQgbG9nIGRv
ZXNuJ3QgZXhwbGFpbiB0aGlzIGNoYW5nZS4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
