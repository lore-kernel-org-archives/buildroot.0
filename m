Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C004C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B4144062C;
	Wed,  5 Feb 2025 12:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dqoW-nYJf7R; Wed,  5 Feb 2025 12:03:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00B2940653
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00B2940653;
	Wed,  5 Feb 2025 12:03:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67324CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53F42405A5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dg4oaau3_Mo4 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 572FF4022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 572FF4022B
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 572FF4022B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:03:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so45818495e9.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 04:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738757029; x=1739361829;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x19gvSDhHE6c1Ti6Y2Fo51xgk5ZvmiZ0Zt6l1M5pyNY=;
 b=d1ExAFYClnkwY2xZgybTvaVVVhc9txfhpPWexmP82BvFpHp+TDItmAphyZSnbM/xL9
 gLRTducZmkCGqPpWLJTI+mE09ek3sVMSQcchKN9DrKh+Xgmg1poP0b6H4aE1W2TzCS3l
 HNYO949cwAGoPXXFCO/h6yJVQrOO6J/nhQGq5msZJJKKVTZgLqbM1A6CIqeSdnO3ONyQ
 1B/i/WzEurYlUtb7o94TeXv7v3Lgb97RAQa7tmxR1S8cw+smWuvABZHRXYIT1ZDaky0Z
 rUmVwOUToUZfikWPgaIQzlWNd5NpuZrVnBzUEWmAz7g8ww9ieVpxoFfFxQdEqj2tbJhk
 fdDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN/SfwJVwb1YPPcAaqSggQRQMgoWrK7xH/OAA1atyIDImNJx9qc3un21XifiPz8fsuhtCv70gGn+A=@buildroot.org
X-Gm-Message-State: AOJu0YwA69ne2eJK70a5EwSfcrPxDkyXWL62UsApSzqMks2tEv6NBxEB
 6oOxLjvXwk4sJJ5uEN6fJ1m14PHDvhXenfI/qX+NdH7VTYqC7POLtEFqbh7fe2Zbyv8X6wbUpYG
 zS4s=
X-Gm-Gg: ASbGncv1pkGVIcoVtdXj9pR/6Bm8nCHlo5xofd5U+A1uIZhiKl2P6pRgp31vbtazgL3
 lhnj6pn+fzcbj1cPgA8xBuHJCXaPUKYHgVK8ZwQ3zN5xnNxuS1keIkqEb5b2sOOVvdXu0cU8p20
 umM1Y6m+ScSDUZFDHsqXkqukgMc0Nr4XmTdZ6ONADlXhX0swvrR4qPKv/hN+4qKCAf0x6sBWN1y
 Nj0lZE1GDPGo+SVOs55k6lJJ7f3F9JRIXxbPNTIRdy6YPK3gxyDRniYXVN93ramYum/kslZTS3P
 Hni7FBHOQCxn0A7w4+56HmxH3jQGLNBqBa68dzo4/bgdz7K4gU6S0j3Z
X-Google-Smtp-Source: AGHT+IG4EccgAbUABeXUzzVX7+ih5mbOpBxtcQ6OD0dEKHJwL6moRSZs6u1TAPzLNGohdT5Hb9EN/Q==
X-Received: by 2002:a05:600c:1e1c:b0:434:b9c6:68f7 with SMTP id
 5b1f17b1804b1-43910d2dc3cmr4937795e9.26.1738757029128; 
 Wed, 05 Feb 2025 04:03:49 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38db6320becsm1352785f8f.98.2025.02.05.04.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 04:03:48 -0800 (PST)
Message-ID: <2ef490d2-3b3a-4054-96e6-5337fde9495f@smile.fr>
Date: Wed, 5 Feb 2025 13:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241211233144.729270-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20241211233144.729270-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738757029; x=1739361829; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=x19gvSDhHE6c1Ti6Y2Fo51xgk5ZvmiZ0Zt6l1M5pyNY=;
 b=mG/O3HzZ1jVyP2KU7abdU3Wl/yDJz0cizBHStnyv/KeURmkMsgsbUg9C9CHW2twzQr
 ic3CZEn8oCWgocIpPGdcWrLeIZCpka33KuZuCTwdGBtTmB4+Q9L917alHnDMhMH8C/EE
 YeK8Ou/qAo6F1PIDPNnD7n0nPYWgHHhDcLkrU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=mG/O3HzZ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: fix test_atf by
 bumping atf to 2.11
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAxMi8xMi8yMDI0IMOgIDAwOjMxLCBKdWxpZW4gT2xpdmFp
biBhIMOpY3JpdMKgOgo+IFNpbmNlIGNvbW1pdCBbMV0sIHRlc3RfYXRmIGlzIGZhaWxpbmcuIFNl
ZSBbMl0uCj4gCj4gUGFzc2luZyAtbm8tcGllIHRvIGxkIGRvZXMgbm90IHByb2R1Y2UgdGhlIGJs
MzEuZWxmIGZpbGUgKGFuZCBkb2VzIG5vdAo+IGdlbmVyYXRlIGFuIGVycm9yKS4gVEYtQSAyLjEx
IHJld29ya2VkIGl0cyBtYWtlZmlsZXMgYW5kIHN3aXRjaGVkIHRvCj4gZ2NjIHRvIGxpbmsgZmls
ZXMuIFRoaXMgY29tbWl0IGZpeGVzIHRoaXMgZmFpbGluZyB0ZXN0IGJ5IHVwZGF0aW5nIHRvCj4g
dGhpcyBuZXdlciBURi1BIHZlcnNpb24uCj4gCj4gRml4ZXM6IFsyXS4KPiAKPiBbMV0gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzI0OGMyZDA0NWU3
ODBiMjNlNmVkMTlmZWMxZjI0MjQ2MGFjNDY0ZTMKPiBbMl0gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy84NjA5MzA3ODkxCgpJJ20gb2sgd2l0aCB0aGlz
IHVwZGF0ZSBidXQgaXMgdGhlIHNhbWUgaXNzdWUgd2lsbCBhcHBlYXIgYWdhaW4gd2l0aCBBVEYg
PCAyLjExCnNlbGVjdGVkIGJ5IHRoZSB1c2VyIGFzIGN1c3RvbSB2ZXJzaW9uPwoKQmVzdCByZWdh
cmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZy
ZWUuZnI+Cj4gLS0tCj4gUGF0Y2ggdGVzdGVkIGluOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xp
dmFpbi9idWlsZHJvb3QvLS9qb2JzLzg2MTgyMDc4MTAKPiAtLS0KPiAgc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL2Jvb3QvdGVzdF9hdGYucHkgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvYm9vdC90ZXN0X2F0Zi5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9ib290L3Rlc3Rf
YXRmLnB5Cj4gaW5kZXggYjBlNzY5NmU4Ni4uNjE0MmRkMzZjMSAxMDA2NDQKPiAtLS0gYS9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2F0Zi5weQo+ICsrKyBiL3N1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9ib290L3Rlc3RfYXRmLnB5Cj4gQEAgLTksNyArOSw3IEBAIGNsYXNzIFRlc3RBVEZB
bGx3aW5uZXIoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiAgICAgICAgICBCUjJfVE9PTENIQUlO
X0VYVEVSTkFMX0xJTkFST19BQVJDSDY0PXkKPiAgICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVT
VEVEX0ZJUk1XQVJFPXkKPiAgICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJF
X0NVU1RPTV9WRVJTSU9OPXkKPiAtICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi45Igo+ICsgICAgICAgIEJSMl9UQVJHRVRfQVJN
X1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjExIgo+ICAgICAgICAg
IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExBVEZPUk09InN1bjUwaV9hNjQiCj4g
ICAgICAgICAgIyBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1NTUCBpcyBub3Qgc2V0
Cj4gICAgICAgICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9CTDMxPXkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
