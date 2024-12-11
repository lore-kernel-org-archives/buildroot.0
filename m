Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E61E77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 13:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 566CD4091A;
	Wed, 11 Dec 2024 13:43:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MrigqUK4KQqm; Wed, 11 Dec 2024 13:43:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 089C24130D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 089C24130D;
	Wed, 11 Dec 2024 13:43:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 675C4ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5CE1A4133C
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyNROIXxHMuK for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 13:43:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56E2741341
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E2741341
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56E2741341
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:43:11 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-434f30ba149so24538325e9.0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 05:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733924589; x=1734529389;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6yrvbOyfzCx5vOSQ/PfU416oyCflQJmelW8oyHY4aUw=;
 b=dQ7h1vcPAydcjFwroK/KI/LL96pCx6A4mGwza6Q6hl1H622E59Mo+Ua5Cn0kxipTxM
 tFsEkRFevWkfBasbUQPJnW5oFvft2Sy6pm3kaC+g5ZC3BuE39MHKNe2PlBj3ozXlmAON
 Xsm6xIx/0LYeZ0iOc2vcSs5qepweCixokwlyF0D6YvVCfm9ewi/Ijen9lmC73kInWmtF
 GgAUQLCir/hBPDM1ZqnnDij+5djmCeOrmVzImJ6rcxMdzzITLW4qRa7DDg72I2eI44KN
 vqs3OqcCc+N1IM9+2HULq24rivurkSOmdxNu9txkE4IWfYIAb7P7gghCMJhtHaoVyOGb
 e9jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZMFXZ/Ns9AW5o6OGu5yV1aQ2tWBdE01QLYW3sCClUEKSVDZsjmXvk5pw40323StQt0Mj4icSdNVY=@buildroot.org
X-Gm-Message-State: AOJu0YzkdfY8SJVIJwRtCINRs8r3mS2gzQ5y9QG1LrYjOx+ii31zBEXu
 vH1ndQm8gmi4jmfl1QA3hVYFPKXZ0K6lmAOGYMRmU8Tupliwszk4mvKH5F+I6yraL78RWcU7lkw
 g03xQYA==
X-Gm-Gg: ASbGncsoTedo2RJ3SzrylDe03mVCi1M72k4Pm7yKdpTRl2EyRzr1+RAiS/u1hkD38BG
 XQdy4q9u/n3XzKapykifWGRhwT8CCS8H+j2ZbOb/SoJQcHpHbBx4yXrchypt46CD6ts+WU9/oM8
 dm4ozSfRmpcrLg26TDIf5o/+SbABRraGs3dTm6bEfIWQmjzvQ+23V/dcz/563RT/ytyh4zBdNzE
 IiDfEyjqXTdOwURmvX1pk3/IiZvBkNfkhmVp9BW3Cg2Kce9cpg8V24dEkNV03NIvAcORV94qU88
 NVMPHDgQ0T/YmFfALicwBq+MDLphs48HqYsAzAKLTg==
X-Google-Smtp-Source: AGHT+IEmT0/PzYsmKHw47vxTkaSRrrutYm5nboftI9MLiS4dyhcEYRHHlWU8VyPep6RgpZfaS6/RkA==
X-Received: by 2002:a05:600c:3b09:b0:434:f270:a4f0 with SMTP id
 5b1f17b1804b1-4361c3efb35mr20495045e9.21.1733924589251; 
 Wed, 11 Dec 2024 05:43:09 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4361f6d878asm13496605e9.2.2024.12.11.05.43.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 05:43:08 -0800 (PST)
Message-ID: <675c239b-5d11-4f07-be59-86f6f046da1d@smile.fr>
Date: Wed, 11 Dec 2024 14:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
References: <20241208214748.524923-1-geomatsi@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20241208214748.524923-1-geomatsi@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733924589; x=1734529389; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6yrvbOyfzCx5vOSQ/PfU416oyCflQJmelW8oyHY4aUw=;
 b=CWsi7WgPNCMvn8ZCll9hjsuun9MtJgsd1MtL129IM5spLYfIAL84H4ySBVb+jfN01V
 pW12Y/cgnalCGUjYSia08qcXrkgmJqc9WY4Hmo8IuKL4cHFdpIcsmvxFPsU+S73OepVf
 dnS21Pnr1AD/7qGR5P5xKdbBIN3r0Pfy8nkmU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=CWsi7WgP
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
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

SGVsbG8gU2VyZ2V5LAoKTGUgMDgvMTIvMjAyNCDDoCAyMjo0NiwgU2VyZ2V5IE1hdHl1a2V2aWNo
IGEgw6ljcml0wqA6Cj4gSGkgVGhvbWFzLCBCZXJuZCwgYW5kIGFsbAo+IAo+IEkgaGF2ZSBiZWVu
IHdhaXRpbmcgZm9yIHRoZSBuZXcgTFRTIExpbnV4IHY2LjEyIGluIEJ1aWxkcm9vdCB0byBzdGFy
dAo+IHNlbmRpbmcgQ2hyaXN0bWFzIHVwZGF0ZXMgZm9yIHNvbWUgb2YgbXkgT3JhbmdlUGkgYm9h
cmRzLiBOb3cgdjYuMTIuMwo+IGlzIGFscmVhZHkgYXZhaWxhYmxlLCBidXQgdGhlIGxhdGVzdCBr
ZXJuZWwgaXMgc3RpbGwgaGF2ZSA2LjExLnguCj4gU28gSSBkZWNpZGVkIHRvIHVuZGVydGFrZSBh
IGNvcHktcGFzdGUgZXhlcmNpc2UgdXNpbmcgdGhlIGxhdGVzdCBrZXJuZWwKPiBhbmQgaGVhZGVy
cyB1cGRhdGUgc2VyaWVzIGJ5IEJlcm5kLiBIb3BlIEkgZGlkbid0IG1pc3MgYSB0aGluZyB0YWtp
bmcKPiBpbnRvIGFjY291bnQgdGhhdCB0aGlzIGlzIGEgbmV3IExUUy4KCkV2ZXJ5dGhpbmcgc2Vl
bXMgZ29vZCBzbyBmYXIgOikKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKCj4gCj4gUmVnYXJkcywKPiBTZXJnZXkKPiAKPiBTZXJnZXkgTWF0eXVrZXZp
Y2ggKDMpOgo+ICAge3Rvb2xjaGFpbiwgbGludXgtaGVhZGVyc306IGFkZCBzdXBwb3J0IGZvciA2
LjEyIGhlYWRlcnMKPiAgIGxpbnV4OiBidW1wIGxhdGVzdCB2ZXJzaW9uIHRvIDYuMTIKPiAgIHBh
Y2thZ2UvbGludXgtaGVhZGVyczogZHJvcCA2LjExLnggb3B0aW9uCj4gCj4gIENvbmZpZy5pbi5s
ZWdhY3kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKysKPiAgbGlu
dXgvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0t
Cj4gIGxpbnV4L2xpbnV4Lmhhc2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAy
ICstCj4gIHBhY2thZ2UvbGludXgtaGVhZGVycy9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICB8
IDE2ICsrKysrKysrKystLS0tLS0KPiAgdG9vbGNoYWluL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDUgKysrKysKPiAgLi4uL3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0
b20vQ29uZmlnLmluLm9wdGlvbnMgIHwgIDYgKysrKystCj4gIDYgZmlsZXMgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
