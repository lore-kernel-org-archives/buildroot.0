Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96966C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 18:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39CFA400DC;
	Wed, 28 Feb 2024 18:23:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdwWTlAtG8Dt; Wed, 28 Feb 2024 18:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1189040130
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1189040130;
	Wed, 28 Feb 2024 18:23:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29EA21BF3D5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 18:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 246DE608F6
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 18:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jt_1fq1f4nWq for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 18:23:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CF61608E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CF61608E9
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CF61608E9
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 18:23:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3f4464c48dso8563366b.3
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 10:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709144603; x=1709749403;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6rRn4Q53LG31rEDj6Cd8PXjuCx8CH2Wc4DJ3VeKrjUg=;
 b=hsaZDIDwS3YoOP+EvWpAgnA+VSnAsKNm5wzpT3w0es/AgwT16bGysqM4jkMHjT/D6N
 iXKxlZBFqXIFTMaVfaW99U34PuLHap/Vo40a+5sxhZAL9I0LdzYeM3So6Yn+UB7bNn2E
 ozOqPgBrYWVpqMtgNIhapcJWBoNUzQbFrwbuCO1/f7Gpj6QFBQzs1y+HKBl5mTraJSEd
 X4Yz4eqdtiGb/GQ5NA3wtGTh/tQvBqd5qW9XQVTQmC0qaRIU6tB5rpobs8xvqSjlwSkM
 u9Vjeo4zN0tiWAYLu2WijRVsML2DyM2eM4vexvmxdpWY3LN2TEkapp9xdxFtSA1tP/Rl
 00Yg==
X-Gm-Message-State: AOJu0Yx+L3RDA4hS5s6pURBsQtbWjB6nOIH57kktBC49NjswZcM5OLFm
 5n3m28LARbt9lZsjUu7MffI142KOsLqfwuMI7arkGD7YnRRkVfWovRu28x0sUcUTIlanESfcohD
 adwc=
X-Google-Smtp-Source: AGHT+IEaogwmRZ6Wl8oSNqJWrtc6hHxBCwxC9Ja0cpeQUs+Toh9eXPLjwd+Xz1xBmLGeHoQzpZZGoA==
X-Received: by 2002:a17:906:6811:b0:a44:24c5:c7c1 with SMTP id
 k17-20020a170906681100b00a4424c5c7c1mr312047ejr.11.1709144602944; 
 Wed, 28 Feb 2024 10:23:22 -0800 (PST)
Received: from [192.168.127.42] (ip-89-103-66-201.bb.vodafone.cz.
 [89.103.66.201]) by smtp.gmail.com with ESMTPSA id
 o24-20020a1709064f9800b00a42ec389486sm2106599eju.207.2024.02.28.10.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 10:23:22 -0800 (PST)
Message-ID: <5951f2b8-0ade-484a-97c0-0b59936e253d@sairon.cz>
Date: Wed, 28 Feb 2024 19:23:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20240228181409.3756293-1-sairon@sairon.cz>
From: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>
In-Reply-To: <20240228181409.3756293-1-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1709144603; x=1709749403; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6rRn4Q53LG31rEDj6Cd8PXjuCx8CH2Wc4DJ3VeKrjUg=;
 b=CkBNV2mCsHBAgXl/CrB3Veym8Gy24hB/UlLbRTfE4gRMjDV8kv4imzWbGvutbGr6lk
 jjN444VU0sNQN6RQiuJnTC6tG8ua8u5ItJnVDhriGtb2k09RmoJaDYrDUoEMKLG3HWSt
 Ar595z0JavT9kk8CI0G0yarwB5PYwnoU9EoSYbeYB5eYMDRYMe2Ud1zmffa7k6u7luCO
 EKLluLEeozLVlqTpsbFVD0+ihSPm/n/VsDGzfVtD/qaU+AWs6Oy2qGohD0Sk34UIhQfy
 3Khi3AL+iiFwaTnoSxi63cHoWt42+AyPSWJzPUqq78TUjL2Q80Nr7a6FLK8rcO4zZCmy
 2lSw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=CkBNV2mC
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: only install fsidd
 binary and unit file with enabled nfsd
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjguIDAyLiAyNCAxOToxNCwgSmFuIMSMZXJtw6FrIHdyb3RlOgo+IFVuaXQgZmlsZSBmb3Ig
dGhlIEZTSUQgZGFlbW9uIGRlcGVuZHMgb24gdGhlIG5mcy1zZXJ2ZXIuc2VydmljZSwgd2hpY2gg
aXMKPiByZW1vdmVkIHdpdGhvdXQgQlIyX1BBQ0tBR0VfTkZTX1VUSUxTX1JQQ19ORlNEIGVuYWJs
ZWQuIEFsc28gZG9uJ3QgaW5zdGFsbAo+IHRoZSBmc2lkZCBzZXJ2aWNlIGJpbmFyeSB3aXRob3V0
IG5mc2QgZW5hYmxlZC4KCkFsc28sIEkgKnRoaW5rKiB0aGF0IHNxbGl0ZSAoYW5kIGxpYmV2ZW50
PykgZGVwZW5kZW5jaWVzIGNvdWxkIGJlIApkcm9wcGVkIGluIHRoZSBjYXNlIHdoZW4gbmZzZCAo
b3IgbmZzZGNsZC9uZnNkY2x0cmFjaykgaXMgbm90IGluc3RhbGxlZC4gCkJ1dCB0aGVyZSBhcmUg
bm8gY29uZmlndXJlIGZsYWdzIGZvciB0aGlzIHNjZW5hcmlvIGluIHRoZSB1cHN0cmVhbSwgbmZz
ZCAKaXMgc2ltcGx5IHJlbW92ZWQgYWZ0ZXIgdGhlIGluc3RhbGwgaW4gQlIsIHNvIHRoaXMgd291
bGQgZWl0aGVyIG5lZWQgYml0IAptb3JlIGVsYWJvcmF0ZSBwYXRjaGluZyBvciB1cHN0cmVhbSBj
b29yZGluYXRpb24uIE1heWJlIEdpdWxpbyBvciBQZXRyIApjYW4gZ2l2ZSBzb21lIGluc2lnaHRz
IGhlcmUuCgpBbnl3YXksIGxldCBtZSBrbm93IHdoYXQgeW91IHRoaW5rIGFuZCBpZiBpdCdzIHdv
cnRoIHB1cnN1aW5nIHRoaXMuCgpDaGVlcnMsCkphbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
