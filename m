Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E1CC48BC1
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 15:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350EE824E2;
	Wed, 14 Feb 2024 15:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUEfSD6uRvqG; Wed, 14 Feb 2024 15:24:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 387DB82662
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 387DB82662;
	Wed, 14 Feb 2024 15:24:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EDF161BF313
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 15:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77F240644
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 15:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rwFN6eH5MUc for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 15:24:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FF4040490
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FF4040490
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FF4040490
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 15:24:08 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a3d6d160529so30874466b.0
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 07:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707924246; x=1708529046;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wOAPiQTX9gFaQlA5bekvyd5DmEwTZEQEl8w9GkDwJ50=;
 b=h68SLAwxSQi3KZlupkQxEAFfMXdA9n2OrEor7YHuSDFvCJrfpUMkA+Ar45aJAhSAvm
 CxEH0M/6oLG9F+bjEbESg5Zx//WDfgfPM9MYnCSyaH0u5cnFclyR+2UMYa3Va/1S49Gf
 4fGvdQq8jfphohi0xO1/uU2qyv7jQb94MTVfkkcGzXu/WSQ8A0HqfKs+BHirbweHHeWM
 2rb8h1jJXTHkc7JyMHejXx11aF/fm24d+b31gFshwTC8gh+3KFaQsSeTGp3j0mPOHa1y
 o4OJh+GuSzzsNAikZNjyz7tVM1HZEImQ8DOJBzrjvnZbaa/b8Vg1mnZdyhnxLnCoYl6B
 H82A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtwWihEyO5M/pRXmfoY6yzkd+7nhO8mjfaaBEgO88lsZ2HDGtiE8t/6V6bnZdUtErHttJMcaWqyTksqjp5vP3MoroRyVCELg==
X-Gm-Message-State: AOJu0YzstSA+tqhlvwRrPpfBa0XFC5r+PoKDd/HN3y0E/V2M5A3WmF77
 UP1/4jXeWKvWpEAc310oWHsFmZJTwZiyGX3UtdwS3IZ+kWguwK/DXG9qp/NZF8c=
X-Google-Smtp-Source: AGHT+IFxvNeCPkEw7yiGx2o6Na9FJFHy/XRk3kfAnlvB2HyMv+rZs1t58vkdalQssOte4vYPfeyGNw==
X-Received: by 2002:a17:907:104a:b0:a3c:f044:e0a3 with SMTP id
 oy10-20020a170907104a00b00a3cf044e0a3mr2001235ejb.67.1707924246407; 
 Wed, 14 Feb 2024 07:24:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUA9qcbN0KB0KyCE/QXelFmoyNwCF9PF3u/cvjWcGyR/NroyNDpYJrK5UVrmX4+fcekfxyp1y2fwXByZA0ursho7Itn3qRG6w==
Received: from [10.5.0.34] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 fj10-20020a1709069c8a00b00a3d1458523esm1474768ejc.29.2024.02.14.07.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 07:24:06 -0800 (PST)
Message-ID: <c7cf0877-59f6-4973-bc5a-2cc59ec47774@smile.fr>
Date: Wed, 14 Feb 2024 16:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-20-romain.naour@smile.fr>
 <b2c93d998117ae26f726026e700a05f15479108a.camel@gmail.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <b2c93d998117ae26f726026e700a05f15479108a.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707924246; x=1708529046;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wOAPiQTX9gFaQlA5bekvyd5DmEwTZEQEl8w9GkDwJ50=;
 b=wQkD/XAfVYQ+3wv026bq2gNJ+KSKOtVY/Nti4iOfqJWW75EyqOhq6P+bT5/pFwe37W
 1eRdMMFkkoDPmyflWOh2K5+Ucs3hUKgJtRcQHXB6udYktUQf3UzLY4tWSiVVo1LwNMDw
 9fvp8jMRtQ74huzjJwMIWjj5BmSdgXXdYCL5w1Fhwcpc1ZdYFZjt1cW+kmfhGEr5Dkn7
 NLT+TuEJJC2co3VsqTY96oLp86hYyleI1E+QkzJ9GlpPwjLG3C2QIZADhxgDdeClPi1f
 vc4GdbZ/C/MM2tgUcrYIpdrKkOnjq+irlk1T6iLIZHdhJDn+Lw4AaBNEcllcBdxoSnI6
 hE7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=wQkD/XAf
Subject: Re: [Buildroot] [PATCH 19/21] configs/ti_am62x_sk_defconfig: update
 to uboot 2024.01 to use binman tool
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

SGkgQWxleGFuZGVyLAoKTGUgMTQvMDIvMjAyNCDDoCAxMTo1OSwgQWxleGFuZGVyIFN2ZXJkbGlu
IGEgw6ljcml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IE9uIFR1ZSwgMjAyNC0wMi0xMyBhdCAxODoy
OCArMDEwMCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+PiBVcGRhdGUgdS1ib290IGZvciBhNTMgYW5k
IHI1IGNvcmUgdG8gMjAyNC4wMSBhbmQgZW5hYmxlIGJpbm1hbiBzdXBwb3J0Cj4+IGluIG9yZGVy
IHRvIHJlbW92ZSBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTi4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+Cj4gCj4gTG9va3MgZ29vZCB0
byBtZSBpbiBwcmluY2lwbGUsIHNvCj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxpbiA8
YWxleGFuZGVyLnN2ZXJkbGluQGdtYWlsLmNvbT4KPiAKPiBCdXQgbWF5YmUgeW91IGNvdWxkIGFk
ZCBhIHdvcmQgaW50byBjb21taXQgbWVzc2FnZSBhYm91dCB1cGRhdGVkIEFURgo+IGlmIHlvdSds
bCByZS1zcGluLgoKT2suCgpJJ2xsIHdhaXQgYmVmb3JlIHJlLXNwaW4gaWYgc29tZW9uZSBjYW4g
ZG8gYSBydW50aW1lIHRlc3QuCgpUaGFua3MgZm9yIHRoZSByZXZpZXchCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gCj4+IC0tLQo+PiDCoGNvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29uZmlnIHwg
MTIgKysrKysrKystLS0tCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvdGlfYW02Mnhfc2tfZGVmY29u
ZmlnIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPj4gaW5kZXggYzNhZDU1NWE4MS4u
ZjcyNTczNDU1MSAxMDA2NDQKPj4gLS0tIGEvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcK
Pj4gKysrIGIvY29uZmlncy90aV9hbTYyeF9za19kZWZjb25maWcKPj4gQEAgLTE2LDI1ICsxNiwy
OSBAQCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQo+PiDCoEJSMl9UQVJHRVRfUk9PVEZTX0VY
VDJfU0laRT0iMjU2TSIKPj4gwqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkKPj4g
wqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OPXkKPj4gLUJS
Ml9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjci
Cj4+ICtCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSJ2Mi4xMCIKPj4gwqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1BMQVRGT1JNPSJr
MyIKPj4gwqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX1RBUkdFVF9CT0FSRD0ibGl0
ZSIKPj4gwqBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzJfT1BURUU9eQo+PiDC
oEJSMl9UQVJHRVRfT1BURUVfT1M9eQo+PiDCoEJSMl9UQVJHRVRfT1BURUVfT1NfUExBVEZPUk09
ImszLWFtNjJ4Igo+PiAtQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU49eQo+PiAtQlIyX1RBUkdF
VF9USV9LM19JTUFHRV9HRU5fU09DX0FNNjJYPXkKPj4gK0JSMl9UQVJHRVRfVElfSzNfQk9PVF9G
SVJNV0FSRT15Cj4+ICtCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfU09DX0FNNjJYPXkK
Pj4gwqBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUj15Cj4+ICtCUjJfVEFSR0VUX1RJX0szX1I1
X0xPQURFUl9DVVNUT01fVkVSU0lPTj15Cj4+ICtCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9D
VVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNC4wMSIKPj4gwqBCUjJfVEFSR0VUX1RJX0szX1I1X0xP
QURFUl9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9yNSIKPj4gK0JSMl9UQVJHRVRfVElfSzNf
UjVfTE9BREVSX1VTRV9CSU5NQU49eQo+PiDCoEJSMl9UQVJHRVRfVUJPT1Q9eQo+PiDCoEJSMl9U
QVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQo+PiDCoEJSMl9UQVJHRVRfVUJPT1Rf
Q1VTVE9NX1ZFUlNJT049eQo+PiAtQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxV
RT0iMjAyMi4xMCIKPj4gK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIw
MjQuMDEiCj4+IMKgQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9ERUZDT05GSUc9ImFtNjJ4X2V2bV9h
NTMiCj4+IMKgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQo+PiDCoEJSMl9UQVJHRVRfVUJP
T1RfTkVFRFNfT1BFTlNTTD15Cj4+IMKgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19BVEZfQkwzMT15
Cj4+IMKgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETT15Cj4+ICtCUjJfVEFSR0VUX1VC
T09UX1VTRV9CSU5NQU49eQo+PiDCoCMgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQklOIGlzIG5v
dCBzZXQKPj4gwqBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQo+PiDCoEJSMl9UQVJHRVRf
VUJPT1RfU1BMPXkKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
