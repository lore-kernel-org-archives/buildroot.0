Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63997C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A09681E14;
	Mon,  5 Feb 2024 22:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A09681E14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p18o8QVI9gHe; Mon,  5 Feb 2024 22:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3D181E9A;
	Mon,  5 Feb 2024 22:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3D181E9A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0578B1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E06E360E39
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E06E360E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xv6jV_a2Q0du for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:49:26 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C933760BB7
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C933760BB7
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a380c0757c6so23765466b.1
 for <buildroot@buildroot.org>; Mon, 05 Feb 2024 14:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707173364; x=1707778164;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OCwJfQ0VjlJAS7Ivx3/dK8B3y6FZ9DQ0FJq2f6gHKHs=;
 b=noCHSvMBRCkvtDqrCHg4uMHTxZhJkZLdzirQy6JbHPtRA2+/CKMV6qZPZ2yhPJkrSr
 9uRcWx0werS135yhxh/W3l8m7qfEpQtH4fQNSPOF+XoQcxiNQ4oVNuelZBrVQoPShzGR
 2QVZlhnhqNDM/nYFB5zBfcOaJAxksjvjIj8lfKqaIqWOxLVseK+MyDL5Tcl13X2AxoGv
 t7N0sBckclmw317UKWEQWgbdquSOl4sBGmhMnlLj3fD2vpxEkFHAuWpq+1u/pWCp+IsN
 wPmLkyI1GnKPYKN+O3ZBnCJS+OSE+E1gBAirPyHMiaJYbXSxbUl+UCn9A76iw4PTPMmJ
 bxhQ==
X-Gm-Message-State: AOJu0Yzvm2fFig9kl1ztvcs2POHO/5j4AfoU+5zfZ02TvqcGvyaYcCsm
 lVJOfIqRhQg0wMQsvSmeD9mfTnVE8rNKtpOsuNWR3LV6WJ3MH93fpd3F9KYBBLQ=
X-Google-Smtp-Source: AGHT+IF01xre9s8L6qbs6uRaIHg+Ern/gl2IPbiIGwHGCYeSmakDFDbJATMSy3zwBwUjbwT+XCeuDA==
X-Received: by 2002:a17:906:fb89:b0:a36:f811:1050 with SMTP id
 lr9-20020a170906fb8900b00a36f8111050mr519143ejb.45.1707173363713; 
 Mon, 05 Feb 2024 14:49:23 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXNAvFdwPsAzb2bRjwGdld6X+oAl8c8dnOzKGywn5tAPFq2hxC2hR0Fw7T0FD0zKKF+gV09B971KAy8U1lPtwoqI437x1Kgeg==
Received: from [192.168.101.106] (87-88-191-254.abo.bbox.fr. [87.88.191.254])
 by smtp.gmail.com with ESMTPSA id
 st6-20020a170907c08600b00a3743d92caesm354099ejc.30.2024.02.05.14.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 14:49:23 -0800 (PST)
Message-ID: <28f127e3-b8f8-4ed2-8fa8-d92b50d4884a@smile.fr>
Date: Mon, 5 Feb 2024 23:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20240130064740.9A544417EA@smtp4.osuosl.org>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240130064740.9A544417EA@smtp4.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707173364; x=1707778164;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OCwJfQ0VjlJAS7Ivx3/dK8B3y6FZ9DQ0FJq2f6gHKHs=;
 b=MXu0vVZo+01EfX3BnlEWz5u1H2tjdzwQhmF5627D8CgzsqxtgG+Ve8Y2s5+8yqH8pv
 9N4NRbG+FqKx6HbEwVXBxKbkwDjP3/RHuknRthVhrc6Dqq5FptSFKL6U2IEdMfd54Njt
 i3SvU2EH7sAvOwKra3RRoSfiKDY1CKAMaqEZrPLwR3sr/F/OjuzBKH0tQCviMns4kLBt
 ByvBXlVwyNReByF1IPNtwAQW5xHrrTy4odTYwxcNuHTEni4SnhnUU9717FKdfXEvJkO7
 qP83e8AfV2Pw/WIPgfgX1ghqB8VvTmsxEQOVSv/UfLPE8MfbsqaSm92aNmoMgkzC/jzS
 Nj2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=MXu0vVZo
Subject: Re: [Buildroot] [autobuild.buildroot.net] runtime issues analyses
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

SGVsbG8sCgpMZSAzMC8wMS8yMDI0IMOgIDA3OjQ3LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWls
ZHJvb3QgYSDDqWNyaXTCoDoKPiBIZWxsbywKPiAKClsuLi5dCgo+IAo+IEdpdGxhYiBDSSByZXN1
bHRzIGZvciAyMDI0LTAxLTI5Cj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAK
PiBEZXRhaWwgb2YgcnVudGltZS10ZXN0IGZhaWx1cmVzIGZvciBtYXN0ZXIKPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAKPiAgICAgICAgICAgICAgcnVudGlt
ZS10ZXN0IHwgICAgICAgICAgICAgICAgICAgICAgICBsaW5rIHRvIHRoZSBqb2IgICAgICAgICAg
ICAgICAgICAgICAgICB8IG9ycGg/Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLQoKPiAgICAgICBUZXN0Q3Bpb0RyYWN1dEdsaWJjIHwgaHR0cHM6Ly9naXRsYWIuY29t
L2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82MDQwMTYyNDYyICB8IE9SUEggCj4gLi4u
aW9EcmFjdXRHbGliY01lcmdlZFVzciB8IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2pvYnMvNjA0MDE2MjQ2MyAgfCBPUlBIIAo+ICAgICAgICBUZXN0Q3Bpb0Ry
YWN1dE11c2wgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9q
b2JzLzYwNDAxNjI0NjUgIHwgT1JQSCAKPiAuLi5waW9EcmFjdXRNdXNsTWVyZ2VkVXNyIHwgaHR0
cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82MDQwMTYyNDY4
ICB8IE9SUEggCj4gICAgICBUZXN0Q3Bpb0RyYWN1dFVjbGliYyB8IGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjA0MDE2MjQ3MCAgfCBPUlBIIAo+IC4u
Lm9EcmFjdXRVY2xpYmNNZXJnZWRVc3IgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS9qb2JzLzYwNDAxNjI0NzEgIHwgT1JQSCAKCkRyYWN1dCBpc3N1ZSB1bmRl
ciBkaXNjdXNzaW9uOgpodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQvcGlwZXJtYWlsL2J1aWxkcm9v
dC8yMDI0LUZlYnJ1YXJ5LzY4NDE0NS5odG1sCgo+ICAgICAgICAgICAgICAgVGVzdEdseGluZm8g
fCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzYwNDAx
NjI3NjEgIHwgT1JQSCAKClRoZSBkcmlzd19nbHggZHJpdmVyIGlzIGJyb2tlbiBpbiBNZXNhIDIz
LnggZHVlIHRvIGRyaTMgaGVhZGVyIGFkZGVkCnVuY29uZGl0aW9uYWxseSB3aGlsZSB0aGUgZHJp
dmVyIGNhbiBiZSBidWlsdCB3aXRob3V0IGRyaTMgWzFdCgpTdXJwcmlzaW5nbHksIHRoZSBnbHhp
bmZvIHRlc3QgbG9nIHNob3dzIHRoYXQgbWVzYSB0cmllZCB0byBsb2FkIHppbmsgZ2FsbGl1bQpk
cml2ZXIgd2hpbGUgaXQgd2FzIG5vdCBlbmFibGVkIGF0IGJ1aWxkIHRpbWUuIEluZGVlZCB0aGVy
ZSBpcyBubyBzdWNoIG9wdGlvbiBpbgpCdWlsZHJvb3QuCgogIE1FU0EtTE9BREVSOiBmYWlsZWQg
dG8gb3BlbiB6aW5rOiAvdXNyL2xpYi9kcmkvemlua19kcmkuc28KClsxXQpodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0LzE4ODczNjhkZjQxNjZhZTg1NDI0
NWMwMzA2ZDQzNjYxZWYxMjBlNDIKCj4gICAgICAgICAgVGVzdEdydWJYODY2NEVGSSB8IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjA0MDE2MjI5MiAg
fCBPUlBIIAoKRml4ZWQgYnk6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2NvbW1pdC80ZjU2NWI1MjIyNTc4NWJmYTI2OGVhMTljNGMzNDc5MTdkMzhhZGU0Cgo+
ICAgIFRlc3RQeXRob25QeTNCaXRzdHJpbmcgfCBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzYwNDAxNjMwMTQgIHwgT1JQSCAKPiAgICAgVGVzdFB5dGhv
blB5M0Nyb3NzYmFyIHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290
Ly0vam9icy82MDQwMTYzMDMxICB8IE9SUEggCgp3ZWlyZCBweXRob24gZXJyb3I6CgogIFNvcnJ5
OiBJbmRlbnRhdGlvbkVycm9yOiBleHBlY3RlZCBhbiBpbmRlbnRlZCBibG9jayBhZnRlciBmdW5j
dGlvbiBkZWZpbml0aW9uCm9uIGxpbmUgNiAocGx1Z2luX3Rlc3QucHksIGxpbmUgOCkKCj4gICAg
IFRlc3RQeXRob25QeTNEdHNjaGVtYSB8Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2pvYnMvNjA0MDE2MzA0NSAgfCBPUlBICj4gLi4uaG9uUHkzRmxhc2tFeHBl
Y3RzSnNvbiB8Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pv
YnMvNjA0MDE2MzA1MSAgfCBPUlBICgogIGVycm9yW0UwNDMyXTogdW5yZXNvbHZlZCBpbXBvcnQg
YHN0ZDo6c3luYzo6YXRvbWljOjpBdG9taWNJNjRgCgo+IC4uLlB5dGhvblB5M01hZ2ljV29ybWhv
bGUgfApodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzYw
NDAxNjMwNjkgIHwgT1JQSAoKTm90IHN1cmUgd2h5IHRoZSB0ZXN0IGZhaWxlZC4uLgoKPiAgICAg
ICAgVGVzdFB5dGhvblB5M1NjaVB5IHwgaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vam9icy82MDQwMTYzMTA5ICB8IE9SUEggCgpGaXhlZCBieToKaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0LzM5M2Y1NDk0MTg3MDcy
NTMzYTFjNjliODJhMjZjZjFmNmQyMDNhMjYKCj4gICAgICAgICAgICAgICAgICBUZXN0UnVzdCB8
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjA0MDE2
MzEzOCAgfCBPUlBIIAoKRml4ZWQgYnk6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2NvbW1pdC9jNDNmMTIyOTNkM2E2NjY4YTc5ZjVjZmVjZTQwMmQ0NmE4N2E0
NzNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
