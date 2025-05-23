Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A77C54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 20:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3402960BD9;
	Fri, 23 May 2025 20:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r6ld7JcIGudJ; Fri, 23 May 2025 20:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5147460B4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5147460B4B;
	Fri, 23 May 2025 20:49:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 23F3968
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A09383C1C
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nsyzu0P6Tc65 for <buildroot@buildroot.org>;
 Fri, 23 May 2025 20:49:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 454B783C14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 454B783C14
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 454B783C14
 for <buildroot@buildroot.org>; Fri, 23 May 2025 20:49:12 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a3771c0f8cso207316f8f.3
 for <buildroot@buildroot.org>; Fri, 23 May 2025 13:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748033350; x=1748638150;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Br4Lb7ozAfBZ4f/08HUJSxKvXEvorZTEkIHyoIBq4Qw=;
 b=Qolb8xNhRr6izUf1SncLjvPNxqyI6V+kEcX9SyRiXEkfgWwRxQwEGdnIaEy+G9xf3G
 Mal1hdxm29KVzrmgZgiYoGKPbv+jojVxPyD4x4NK9S1dg1U/vn4QDjJXHIocMQJUWMiF
 m6CjgziWuZJ56rcmIY3OHYLLgV80t1s3jhP8gx4iBfNUrqRvBP/v7pgGAKAZ/CHGzF/4
 L/3WVSwtkwV0aHtTuqJ4gCu/OyH7/imjEOLVhfkcYdaeTvP418weDzqUQt2Cm1Hpobi6
 GjLvGDyZnqzoYnSURyExmacsR8MoK0IlRe7Ku033obeF4EZAp6f4m1ubfBILydH1LdpI
 4c0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzafcn0rUmE3O1YkxLvJRsZcTQtV3H1ipgp95M2qK2fCCTFKtgf+45XKiLdyAU+zNkUjkdON+1yzg=@buildroot.org
X-Gm-Message-State: AOJu0YxeEMw7R166TMIRmUTnxrDnK3t0T9GTbFp34dOv5yFhp1n2f8ne
 VVb/Ue+4uHShT690yQC+RpOovhYXwO8Wb0XFCEnZeZyKfzzn9UmA5K6ux8ZwdoR0J2I=
X-Gm-Gg: ASbGncvb9WeM6qn5kQDwmr4ZjHflor4QQpouIeo18ttz+d3oCwE8d4hMPNYsnO638IH
 HM5XjNt1jx2B+W0v9kqDMVbUvx7V1VykYp38uGmOvHiwcTFQ+7PrxOJkBi6hWvOl8Pe2Sabhx5o
 k1wySyWgcKAGk9DrzpYRGipYPUaHu5uHeISLhOfdTpwYWYlNceTaSYtq3MY0SMCWe1N3pczgFrQ
 GJdf6+XdytlyCIAK6+F+FLNggrIy3dIoJp/8UVJHNNThaxc1OrJNp43D580Dc+kJtWJnph6cZXN
 HbBdZyNq+srxvVQ0K/PQrqJEQa/qPl+GvnsPXxWLkTBA3G4zFAg72ckDtBRtTZFHp+2hhmKXFmo
 cGwxLvvHBaTGiX3fTtHdu0giSqcMGc8YQVRogz08WjOikIM9l9XMYngkTF6d7mWtiirgx5pGQ9G
 5v+3u9cTTT/bSfhQ==
X-Google-Smtp-Source: AGHT+IEq1RHPWgXRMq6ODh/ujvWvK5Kt/F93PMj6W7/sL7+6PMJ1n3SWhmp4KXL6Rl9dMb4c4kIRlw==
X-Received: by 2002:a05:6000:2312:b0:3a3:4b95:a8ce with SMTP id
 ffacd0b85a97d-3a4cb408fa5mr527111f8f.4.1748033350272; 
 Fri, 23 May 2025 13:49:10 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f?
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d2ddsm27419144f8f.7.2025.05.23.13.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 13:49:09 -0700 (PDT)
Message-ID: <f6c5344d-71fc-422d-bff0-905457d46459@smile.fr>
Date: Fri, 23 May 2025 22:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
 <20250523174313.7056-5-vincent.stehle@laposte.net>
Content-Language: fr, en-US
In-Reply-To: <20250523174313.7056-5-vincent.stehle@laposte.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1748033350; x=1748638150; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Br4Lb7ozAfBZ4f/08HUJSxKvXEvorZTEkIHyoIBq4Qw=;
 b=DvgzRVoZMCG+X99SzDQjMLBlWVkAUMzAqK8Js2Duqmm+EdZYi+mCUBmZ6OlaJcN8f/
 Wmw8TomrF5ZWET/CId2cAnj2fu7WeFFQk01FOTXSx/TWPUgabPz9NKkBKc1i0nVtdqsR
 SF+2PxlYJtaaDG9o+G00G4etdmgRhjVZH3mCE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=DvgzRVoZ
Subject: Re: [Buildroot] [PATCH 4/5] package/qemu: enable host-qemu hppa
 support
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

SGVsbG8gVmluY2VudCwgQWxsLAoKTGUgMjMvMDUvMjAyNSDDoCAxOTo0MywgVmluY2VudCBTdGVo
bMOpIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBBZGQgc3VwcG9ydCBpbiBob3N0LXFlbXUg
Zm9yIEhQUEEuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0
ZWhsZUBsYXBvc3RlLm5ldD4KPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwu
Y29tPgo+IC0tLQo+ICBwYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QgfCAxICsKPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9D
b25maWcuaW4uaG9zdCBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdAo+IGluZGV4IDRkYjEx
NDQ5MGEuLjJjNTJjYzA3YzMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5o
b3N0Cj4gKysrIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTMsNiArMyw3IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX1FFTVVfQVJDSF9TVVBQT1JUUwo+ICAJZGVmYXVsdCB5
IGlmIEJSMl9hcm0KPiAgCWRlZmF1bHQgeSBpZiBCUjJfYXJtZWIKPiAgCWRlZmF1bHQgeSBpZiBC
UjJfYWFyY2g2NAo+ICsJZGVmYXVsdCB5IGlmIEJSMl9ocHBhCj4gIAlkZWZhdWx0IHkgaWYgQlIy
X2kzODYKPiAgCWRlZmF1bHQgeSBpZiBCUjJfbTY4awo+ICAJZGVmYXVsdCB5IGlmIEJSMl9taWNy
b2JsYXplZWwKClRoZXJlIGlzIGEgY29tbWVudCBpbiBxZW11Lm1rICBhYm91dCBCUiBBUkNIIHZz
IHFlbXU6CgogIyAgICAgICBCUiBBUkNIICAgICAgICAgcWVtdQogIyAgICAgICAtLS0tLS0tICAg
ICAgICAgLS0tLQogIyAgICAgICBhcm0gICAgICAgICAgICAgYXJtCiAjICAgICAgIGFybWViICAg
ICAgICAgICBhcm1lYgorIyAgICAgICBocHBhICAgICAgICAgICAgaHBwYQoKSnVzdCBhZGQgaHBw
YSB0byB0aGUgbGlzdC4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
