Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99550E77180
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 13:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6862781F4F;
	Wed, 11 Dec 2024 13:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hmEWOMRwUSVf; Wed, 11 Dec 2024 13:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 715E680B43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 715E680B43;
	Wed, 11 Dec 2024 13:33:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0934CED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB4D860BC5
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1K2CkrK2bnD for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 13:33:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A949760BD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A949760BD0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A949760BD0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:33:32 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-386329da1d9so2429714f8f.1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 05:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733924011; x=1734528811;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dDe00oY5UNOPrSK+vubTmTgzRYp+wq7nRFG2PMScOxY=;
 b=SPH8xAfUYZPKaB7Dyl6MxyeTq9z3i3d2QtVB6uGE9tQedUO8WnyiaR7MVYm2A+M6NG
 Wox7WPP+Ak+yMGDkOj2d/WsdD0CJT0X/h8/9ucH5wdugVTpds4erCBEmgSbLMkB4DOmM
 NlSHPi9jAzCgrb8g2XEDd8uqDMJaXp4D6YOaA0s8gNyvDCaE3alqWYhTeJCZTFGYk6nS
 9W6GkZXwbJLfY9Kn5qeWTMrDuKp/7as9tXRAg6JhXHWOKZOt4otARDJYfU7DrEHu0zf/
 xbDtZdxMZGcB3j6NCqd0VObUnM51M73m6KASLl0O2C/dgxbpC+pz8OJUB89Awejq0pHh
 rc7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1VJlVSgHIo+R2s+qQzh+TmeIz8tijBkrq61thVa4HmHE7wDM5aTXZg7dBEAjL9kQ6yKALnaf9ajk=@buildroot.org
X-Gm-Message-State: AOJu0YyNGAhHl69tMWZzyZkiOp0q1SZY9FbolF9VpVhMt3hSx3TMg91a
 DdIyo2Z2YZCdntM8H17uRW4xR5UnePJOAzBlo/9XBNl3amLlxDaY+cqJNLqSfxM6Qzg6hbEFC+r
 gX3+Tcg==
X-Gm-Gg: ASbGncupBaoWMl7ZYNdoWEIoNBCG+Pf/Z6L7FKg9Ma9qFIi2Es2w8IdsD+gOcxWHlKU
 HFabvTE+YdTiP7ocZw5UIbjqMxEh1aYpL38I4+W2f/Yy0h4WIISRrFUICT9Y+rdYXNwq0T53SEm
 bkrp0NOKJ1AymoznBR8Nvi/hju68ouFMZs8PPwrcTTEzv9X5Ate6DscsXxT/8tN3sCXVkdXAUes
 /FOUY/i2rL/gdOnfhiSwxrx4BPDB9hUPU/Vh672pct0vtqomJ7kpZijhQWthID/76QE1dMyP22A
 MoJYDiHoFuAxSY2igwZROeh60NGQWZILfSykZ3bnSg==
X-Google-Smtp-Source: AGHT+IEP/moQY+NE/zJgMAPddPhmBRpJ4+QP0GIVxvaEzGNy0+NmvLSZA/kH3Hk3iYSZ/On7F0KLNg==
X-Received: by 2002:a05:6000:4024:b0:382:49f9:74bb with SMTP id
 ffacd0b85a97d-3864ce6fcf2mr2582678f8f.35.1733924010689; 
 Wed, 11 Dec 2024 05:33:30 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38782514e54sm1312126f8f.85.2024.12.11.05.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 05:33:30 -0800 (PST)
Message-ID: <268e2e44-83a4-4833-a7aa-2494ea83f56b@smile.fr>
Date: Wed, 11 Dec 2024 14:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
References: <20241211124009.2234768-1-vincent.stehle@arm.com>
Content-Language: fr
In-Reply-To: <20241211124009.2234768-1-vincent.stehle@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733924011; x=1734528811; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dDe00oY5UNOPrSK+vubTmTgzRYp+wq7nRFG2PMScOxY=;
 b=31NvSy1Q6d5y5c/BW4dIhYJDZGZKnbMEd0A4szYNWiSne5HWFKLaDYWRlllRTjbiyv
 pitiWclDB9ZOyx5AeEY+UPYexzYleK4LNLZjZqJb3r+Teiru0sbTLp+wZCS+N3hwly7L
 DBssplrCtc1t6DNC6AI98FuhfvzgcIx2VYfXE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=31NvSy1Q
Subject: Re: [Buildroot] [PATCH] configs/aarch64_efi: bump Linux to 6.11.11
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

SGVsbG8gVmluY2VudCwKCkxlIDExLzEyLzIwMjQgw6AgMTM6NDAsIFZpbmNlbnQgU3RlaGzDqSBh
IMOpY3JpdMKgOgo+IEJ1bXAgTGludXgga2VybmVsIHZlcnNpb24gdG8gNi4xMS4xMSBhbmQgdXBk
YXRlIHRoZSBoYXNoIGFjY29yZGluZ2x5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3Rl
aGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogRGljayBPbHNzb24gPGhpQHNlbnpp
bGxhLmlvPgo+IC0tLQo+IAo+IEhpLAo+IAo+IFRoaXMgaGFzIGJlZW4gdGVzdGVkIG9uIHRoZSBm
b2xsb3dpbmcgc3lzdGVtczoKPiAKPiAgICAgICAgICAgIFFlbXUgRUJCUiAgRGV2aWNldHJlZQo+
ICAgICAgICAgICAgUWVtdSBTQlNBICBBQ1BJCj4gICAgICAgICAgICBSRC1OMiBGVlAgIEFDUEkK
PiAgICAgIGkuTVg4TSBQbHVzIEVWSyAgRGV2aWNldHJlZQo+ICAgIENvcnN0b25lLTEwMDAgRlZQ
ICBEZXZpY2V0cmVlCj4gICBGVlAgQmFzZSBSZXZDIEVCQlIgIERldmljZXRyZWUKCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gVmluY2VudC4KPiAKPiAgYm9hcmQvYWFyY2g2NC1lZmkvcGF0Y2hlcy9saW51eC9saW51
eC5oYXNoIHwgMiArLQo+ICBjb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZyAgICAgICAgICAg
ICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2JvYXJkL2FhcmNoNjQtZWZpL3BhdGNoZXMvbGludXgv
bGludXguaGFzaCBiL2JvYXJkL2FhcmNoNjQtZWZpL3BhdGNoZXMvbGludXgvbGludXguaGFzaAo+
IGluZGV4IDIwOTQxYTI2OWIuLjUwOTgzZWI0MmIgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvYWFyY2g2
NC1lZmkvcGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gKysrIGIvYm9hcmQvYWFyY2g2NC1lZmkv
cGF0Y2hlcy9saW51eC9saW51eC5oYXNoCj4gQEAgLTEsMiArMSwyIEBACj4gICMgRnJvbSBodHRw
czovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvdjYueC9zaGEyNTZzdW1zLmFzYwo+
IC1zaGEyNTYgIDUyNDg1ODg1MmY1ODY5YTllZjE3ZGU4YjFlNmU3ZmFmMDViY2IyYzQ2MmJjOTZi
M2MyNGRiZjgyZWRlMzczY2YgIGxpbnV4LTYuMTAuMTIudGFyLnh6Cj4gK3NoYTI1NiAgNjIxNDhl
N2UxN2Y1NGM0YTVhYjVlNzVhZDQ4ODI2ODJjNTRiZWU4MTg5NDhiZTYxYTU5NjMyMzRmYzA4NDlm
YyAgbGludXgtNi4xMS4xMS50YXIueHoKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hYXJjaDY0X2Vm
aV9kZWZjb25maWcgYi9jb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZwo+IGluZGV4IDlmMjg0
ZmY3NGIuLjNhYTY0OWNmOWMgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9hYXJjaDY0X2VmaV9kZWZj
b25maWcKPiArKysgYi9jb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZwo+IEBAIC0xLDUgKzEs
NSBAQAo+ICBCUjJfYWFyY2g2ND15Cj4gLUJSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19D
VVNUT01fNl8xMD15Cj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNl8x
MT15Cj4gIEJSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9hYXJjaDY0LWVmaS9wYXRjaGVzIgo+
ICBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKPiAgQlIyX1JPT1RGU19ERVZJQ0Vf
Q1JFQVRJT05fRFlOQU1JQ19FVURFVj15Cj4gQEAgLTcsNyArNyw3IEBAIEJSMl9ST09URlNfUE9T
VF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL2FhcmNoNjQtZWZpL3Bvc3QtaW1hZ2Uuc2ggc3VwcG9ydC9z
Y3JpcHRzL2dlCj4gIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvYWFyY2g2
NC1lZmkvZ2VuaW1hZ2UtZWZpLmNmZyIKPiAgQlIyX0xJTlVYX0tFUk5FTD15Cj4gIEJSMl9MSU5V
WF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSI2LjEwLjEyIgo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZB
TFVFPSI2LjExLjExIgo+ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklH
PXkKPiAgQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5TU0w9eQo+ICBCUjJfTElOVVhf
S0VSTkVMX05FRURTX0hPU1RfUFlUSE9OMz15CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
