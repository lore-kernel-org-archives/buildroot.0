Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B38EC677C4
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 10:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B4E608AB;
	Wed, 11 Jun 2025 10:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-Th2o--MQxZ; Wed, 11 Jun 2025 10:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB52760890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB52760890;
	Wed, 11 Jun 2025 10:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D9C721F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBE2360888
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5oFNH4Bst8xa for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 10:01:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0DF16087D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0DF16087D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0DF16087D
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 10:00:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso5799027f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749636058; x=1750240858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AOlMbdGvmc3ykQ9rN88RZz68egXKBqdM7ufUTDD2qKQ=;
 b=Cz+3udW0BocFOSaiCrASluEYpiQPJaGZTd8SJyfp3Hrku3FdaG/oDmxZh14GBShyXJ
 EMPIDisra4v0fX2TrfTRQqMuiFo+2cnFEhl8QKd1F2okTUKK053STobQ+hPSZA364IXb
 wC1Ff639BmCOMUQAESenW2IeBi762omqgUuxMz0/N/NYcEfnJV01I1N+ro1LxS4cDl+C
 XnpGqqrwuSV/c+EJZ5esd6mtpa/pv/DEyR3pxZZQpcqTt22phkiCeNH92fzwuXT7aFB7
 brnvkDLESu5ka7XMhlwt1K2JIxiLpmC74alM5T0LM8ffhzdJCJgBZ4+9SX/pjhUZKNt8
 Swlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR1SwTcOku+cTjYzxa3fFvKcoxqvRhOP0Zy0XwxRQwWKCpes4MQ2TxESb+gp3Av049Ykz1CWH6CXE=@buildroot.org
X-Gm-Message-State: AOJu0YxigZDvbuCXOLybw6fYj8XxGviOnnI+nraaTDC6rXWp+aXL03WB
 UcMCjPDw8glEsZvbmZd786oPs1RxwAW5QFVmOMDlH5VYDs76pUhdhJ8fEBN6B498nzc=
X-Gm-Gg: ASbGncs9675nkdeWcaqmcb1RgBJUDio8wbAbq5k3u9x8f3AOOOdBtOvKW54u0DCiT0D
 BOeWxLI9CedrxGuVvuVXbdWPsj879LRZOJbzixhw/sSwkkRvWssyPUBt9KfcL/uIl0vcZvOPnxc
 79ntXstc0OBKh3HoK5NgqzSm1RtCNih6/9xICCbBTSuuik2pcAa8N279K1XijQNifyDjga2e1+/
 eCg7RgsoneO/foEyhYe+bwIp1WRfoOxHpHPIByP8XeS7UtTZkmddnnDCKCEJRq+lQ2KwVPEy1RU
 YVbaxX5YSiWY4jqkIFEW1NEAMThmDNe8HkPd9L0mseP7QvrBrxts9wvWnqSqbIyUDlExZDKKHWK
 3nT9oA0MJ+BDw6I/Y2MHpkZLocF+6/RONvyEyqe3eP3jcg82y1A==
X-Google-Smtp-Source: AGHT+IGP7rksreBpJjyQgBdwS7G2Gyc8ptvB/QyCzVoi2Ge+0QF6rwtyWXnOBL/IN1edaMdnV+VNCQ==
X-Received: by 2002:a05:6000:2381:b0:3a4:e60a:c409 with SMTP id
 ffacd0b85a97d-3a558aecc08mr1795488f8f.41.1749636057833; 
 Wed, 11 Jun 2025 03:00:57 -0700 (PDT)
Received: from [10.5.90.80]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45325141503sm16156275e9.7.2025.06.11.03.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:00:57 -0700 (PDT)
Message-ID: <df4877fc-af21-45ae-b265-864207a4c516@smile.fr>
Date: Wed, 11 Jun 2025 12:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Neal Frager <neal.frager@amd.com>, buildroot@buildroot.org
Cc: ibai.erkiaga-elorza@amd.com, luca.ceresoli@bootlin.com,
 brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 michal.simek@amd.com, romain.naour@gmail.com
References: <20250611075235.1039898-1-neal.frager@amd.com>
Content-Language: en-US
In-Reply-To: <20250611075235.1039898-1-neal.frager@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749636058; x=1750240858; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AOlMbdGvmc3ykQ9rN88RZz68egXKBqdM7ufUTDD2qKQ=;
 b=ZT9t32MQz1YjM+RH4VUFSdmS/gFm84JXv5dNa7K4BGvPlHFrTZKYhFD6LE/X6K2rT8
 KA+HmQs0BgorZG/Rg7O5XIytQ4PFe7/pI7Tc8ihJ2/N1Y28i6VqAPjHjXJZAOmLvzfdN
 1Imop0GuyzPlHS3hhY2BYHDQYUOJayMHDsbkw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ZT9t32MQ
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/qemu_microblaze*: move to
 external Bootlin stable toolchain
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

SGVsbG8gTmVhbCwgQWxsLAoKTGUgMTEvMDYvMjAyNSDDoCAwOTo1MiwgTmVhbCBGcmFnZXIgdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IFRoaXMgbW92ZXMgdGhlIHFlbXVfbWljcm9ibGF6ZSBk
ZWZjb25maWdzIHRvIHRoZSBCb290bGluIGdsaWJjIHN0YWJsZSBleHRlcm5hbAo+IHRvb2xjaGFp
biBhcyBwZXJbMV0uCj4gCj4gWzFdOiBodHRwczovL2VsaW51eC5vcmcvQnVpbGRyb290OkRldmVs
b3BlckRheXNFTENFMjAyNCNSdWxlc19mb3JfZGVmY29uZmlncwoKSSdtIHVzaW5nIFFlbXUgZGVm
Y29uZmlncyB0byB0ZXN0cyBhbnkgbmV3IHZlcnNpb24gb2YgdG9vbGNoYWluIGNvbXBvc2FudHMg
KGdjYywKYmludXRpbHMsIGdsaWJjKSwga2VybmVsIGFuZCBob3N0LXFlbXUuCgpTaW5jZSBRZW11
IGRlZmNvbmZpZ3MgYXJlIHRlc3RlZCBvbmNlIGEgd2VlayBvbiBnaXRsYWItY2ksIGl0IGFsbG93
cyB0byBkZXRlY3QKYW55IHJlZ3Jlc3Npb24gdXNpbmcgdGhlIGludGVybmFsIHRvb2xjaGFpbiBi
YWNrZW5kICh1c2luZyB0aGUgZGVmYXVsdCBjaG9pY2UpLgoKVW5saWtlIG90aGVyIGJvYXJkIGRl
ZmNvbmZpZywgSSB0aGluayB3ZSBzaG91bGQga2VlcCB1c2luZyBpbnRlcm5hbCB0b29sY2hhaW4K
YmFja2VuZCBmb3IgUWVtdSBkZWZjb25maWdzLgoKVGhvdWdodHM/CgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1ieTogTmVhbCBGcmFnZXIgPG5lYWwuZnJhZ2VyQGFtZC5j
b20+Cj4gLS0tCj4gIGNvbmZpZ3MvcWVtdV9taWNyb2JsYXplYmVfbW11X2RlZmNvbmZpZyB8IDIg
Ky0KPiAgY29uZmlncy9xZW11X21pY3JvYmxhemVlbF9tbXVfZGVmY29uZmlnIHwgMiArLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvY29uZmlncy9xZW11X21pY3JvYmxhemViZV9tbXVfZGVmY29uZmlnIGIvY29uZmln
cy9xZW11X21pY3JvYmxhemViZV9tbXVfZGVmY29uZmlnCj4gaW5kZXggOWQ2N2Q3MTkyMC4uOGFk
Mzc3OTc5ZCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfbWljcm9ibGF6ZWJlX21tdV9kZWZj
b25maWcKPiArKysgYi9jb25maWdzL3FlbXVfbWljcm9ibGF6ZWJlX21tdV9kZWZjb25maWcKPiBA
QCAtMSw1ICsxLDUgQEAKPiAgQlIyX21pY3JvYmxhemViZT15Cj4gLUJSMl9QQUNLQUdFX0hPU1Rf
TElOVVhfSEVBREVSU19DVVNUT01fNl8xMj15Cj4gK0JSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+
ICBCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvcWVtdS9wYXRjaGVzIgo+ICBCUjJfRE9XTkxP
QURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKPiAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9
InR0eVVMMCIKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X21pY3JvYmxhemVlbF9tbXVfZGVm
Y29uZmlnIGIvY29uZmlncy9xZW11X21pY3JvYmxhemVlbF9tbXVfZGVmY29uZmlnCj4gaW5kZXgg
NDZiZWZlZGQ1Ny4uYzJiZjIyMDFmNSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfbWljcm9i
bGF6ZWVsX21tdV9kZWZjb25maWcKPiArKysgYi9jb25maWdzL3FlbXVfbWljcm9ibGF6ZWVsX21t
dV9kZWZjb25maWcKPiBAQCAtMSw1ICsxLDUgQEAKPiAgQlIyX21pY3JvYmxhemVlbD15Cj4gLUJS
Ml9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8xMj15Cj4gK0JSMl9UT09MQ0hB
SU5fRVhURVJOQUw9eQo+ICBCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvcWVtdS9wYXRjaGVz
Igo+ICBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKPiAgQlIyX1RBUkdFVF9HRU5F
UklDX0dFVFRZX1BPUlQ9InR0eVVMMCIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
