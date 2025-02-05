Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC517C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 12:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BBAD40653;
	Wed,  5 Feb 2025 12:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuJYCu39fVcR; Wed,  5 Feb 2025 12:05:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 250BA4084A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 250BA4084A;
	Wed,  5 Feb 2025 12:05:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F1961CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:05:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECB5F605E5
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:05:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAepK0GaO3XG for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 12:05:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CBE8D60742
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE8D60742
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBE8D60742
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 12:05:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43626213fffso4485705e9.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 04:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738757153; x=1739361953;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9s7+YAJ+CrXTGYrM5AnaAxU4yZOC5xwlivVfIfE7lPA=;
 b=KUCso5f0PYzvb7P3YqR+O1SIB3fTsPl4ohFCmD/PiHOARt2/2W2Bm2fOe/W2Rs8Omg
 XZqS3QpXMqOGX6xva7R7eIcvR0+yF9UEWOWxiiuc15fr2/jORHsizpRhFpyM8ZzQ/COj
 jAm964ZUNWOQtBlKzEzUvkwo1Qr8KefY5tW+yx7KCe+47fW0nzC91Da0EAn9JNx7aOom
 E+YvnpcuNkQWNn6U0wOeqM/W4wePjeOQ6SOHjZbK9a2LhD6MXHB5InCjEC2Ku7+A5iCv
 wGXIxW8jwY57hVBXyZHXc0YgVVaVlQAqvGBgAbj8VVLgl/R20CLXdY6smSo0TRY8z2uH
 ci4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp41TVl/xjq2LWgCKk1U5U8WuKY6VTCfIIeRBMs/n83vC2b+LUlYCgJ9ePwjtRShRIn0k6jc9m9u4=@buildroot.org
X-Gm-Message-State: AOJu0YzMVgJO/2V8Gm8C7z3qZL0Xl1yYm+OKcM2cDqHFW5+/EmSXJdoh
 2yy0YbPnl9U1OLJ3pwd7HpaoOLyMoWElN4gy0XmqgcRjsGpV+23el4dBxsu09bk9ghOdesBomGE
 BD9U=
X-Gm-Gg: ASbGncu+7bPlgqvvYJMBsxAc91+N1C5wcWwAKyg2yg271iLfX7TMQJyuYA55cRIRY6v
 q2bMg+q7dGMasbdAm8BJjNZkBGIWREmbqyGPmjuTkYa2cTC7Q6B7HwWvKUmSXqsc54pQY8uxDRa
 Mxj9Yg9dNy3ovPrl+ChaJGnVq6zUYdbpuTt0NjPGDSEv+SAB9aK9CilSAvv2X07DFm0WWEZdjmh
 mic40PZ+BjMrL29RrqLu4Lv5IX3Pnxct0mFcLKf5WOM992KxUv32tI26aE4RqNqhUWX8AC72HE4
 +P+hVjver28eWRmk1zLBVNDD6T+9iFFreZTFC2hmn0hKfLIr1DjXVht2
X-Google-Smtp-Source: AGHT+IE6eAxIAy2sy+CxvEbVwzo4upFy8iPFeNSVB1S9sAHAjgV4Uq+7EDMIKqjvyaQE4VQmcIJ+FA==
X-Received: by 2002:a05:600c:4ed2:b0:436:1b77:b5aa with SMTP id
 5b1f17b1804b1-4390bf4e654mr26350625e9.8.1738757152754; 
 Wed, 05 Feb 2025 04:05:52 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf44f3sm19181025e9.29.2025.02.05.04.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 04:05:52 -0800 (PST)
Message-ID: <86f08e24-ed59-4fc6-b802-4449113418bc@smile.fr>
Date: Wed, 5 Feb 2025 13:05:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20241211233144.729270-1-ju.o@free.fr>
 <2ef490d2-3b3a-4054-96e6-5337fde9495f@smile.fr>
Content-Language: en-US
In-Reply-To: <2ef490d2-3b3a-4054-96e6-5337fde9495f@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738757153; x=1739361953; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9s7+YAJ+CrXTGYrM5AnaAxU4yZOC5xwlivVfIfE7lPA=;
 b=3rD/ID/eCkkneptc4XDEkyyGIGovkY339ptzD/0d17Qm+oib9GeumtZAu8BKNz3B48
 4rZ1BrHm50skqIYwueCk+VosHLn/ZdZlEkWN4UOFrblGRvQGZHRlC7ccxM1gotXRTib3
 oN5qPT6EEDvU0XClU8h4Sv03IuVB1Dj3rxOBQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=3rD/ID/e
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

TGUgMDUvMDIvMjAyNSDDoCAxMzowMywgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gSGVsbG8g
SnVsaWVuLCBBbGwsCj4gCj4gTGUgMTIvMTIvMjAyNCDDoCAwMDozMSwgSnVsaWVuIE9saXZhaW4g
YSDDqWNyaXTCoDoKPj4gU2luY2UgY29tbWl0IFsxXSwgdGVzdF9hdGYgaXMgZmFpbGluZy4gU2Vl
IFsyXS4KPj4KPj4gUGFzc2luZyAtbm8tcGllIHRvIGxkIGRvZXMgbm90IHByb2R1Y2UgdGhlIGJs
MzEuZWxmIGZpbGUgKGFuZCBkb2VzIG5vdAo+PiBnZW5lcmF0ZSBhbiBlcnJvcikuIFRGLUEgMi4x
MSByZXdvcmtlZCBpdHMgbWFrZWZpbGVzIGFuZCBzd2l0Y2hlZCB0bwo+PiBnY2MgdG8gbGluayBm
aWxlcy4gVGhpcyBjb21taXQgZml4ZXMgdGhpcyBmYWlsaW5nIHRlc3QgYnkgdXBkYXRpbmcgdG8K
Pj4gdGhpcyBuZXdlciBURi1BIHZlcnNpb24uCj4+Cj4+IEZpeGVzOiBbMl0uCj4+Cj4+IFsxXSBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMjQ4YzJk
MDQ1ZTc4MGIyM2U2ZWQxOWZlYzFmMjQyNDYwYWM0NjRlMwo+PiBbMl0gaHR0cHM6Ly9naXRsYWIu
Y29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy84NjA5MzA3ODkxCj4gCj4gSSdtIG9r
IHdpdGggdGhpcyB1cGRhdGUgYnV0IGlzIHRoZSBzYW1lIGlzc3VlIHdpbGwgYXBwZWFyIGFnYWlu
IHdpdGggQVRGIDwgMi4xMQo+IHNlbGVjdGVkIGJ5IHRoZSB1c2VyIGFzIGN1c3RvbSB2ZXJzaW9u
PwoKSSBndWVzcyBJIGNhbiBhcHBseSBpdCBmb3IgdGhlIHNha2Ugb2YgdGhlIENJLgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBCZXN0IHJl
Z2FyZHMsCj4gUm9tYWluCj4gCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWlu
IDxqdS5vQGZyZWUuZnI+Cj4+IC0tLQo+PiBQYXRjaCB0ZXN0ZWQgaW46Cj4+IGh0dHBzOi8vZ2l0
bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9qb2JzLzg2MTgyMDc4MTAKPj4gLS0tCj4+ICBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2F0Zi5weSB8IDIgKy0KPj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9hdGYucHkgYi9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvYm9vdC90ZXN0X2F0Zi5weQo+PiBpbmRleCBiMGU3Njk2ZTg2Li42MTQyZGQzNmMxIDEw
MDY0NAo+PiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2F0Zi5weQo+PiAr
KysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2F0Zi5weQo+PiBAQCAtOSw3ICs5
LDcgQEAgY2xhc3MgVGVzdEFURkFsbHdpbm5lcihpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+PiAg
ICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJTkFST19BQVJDSDY0PXkKPj4gICAgICAg
ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Cj4+ICAgICAgICAgIEJSMl9UQVJH
RVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT049eQo+PiAtICAgICAgICBCUjJf
VEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi45Igo+
PiArICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSJ2Mi4xMSIKPj4gICAgICAgICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FS
RV9QTEFURk9STT0ic3VuNTBpX2E2NCIKPj4gICAgICAgICAgIyBCUjJfVEFSR0VUX0FSTV9UUlVT
VEVEX0ZJUk1XQVJFX1NTUCBpcyBub3Qgc2V0Cj4+ICAgICAgICAgIEJSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfQkwzMT15Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
