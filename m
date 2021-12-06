Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA22C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 21:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC4A18278F;
	Mon,  6 Dec 2021 21:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qrmqhuv2CS84; Mon,  6 Dec 2021 21:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AF99827E0;
	Mon,  6 Dec 2021 21:16:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44D741BF334
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F0FF60D9D
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 21:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l74egV6FFb7k for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 21:16:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E827260791
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 21:16:41 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y13so48307948edd.13
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 13:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=2qEIZC2pET5XzcDq5nLJ/i6gFSqMPHpkhsv7sHguWfY=;
 b=Arro9Xbn3rOorevzGRZfS4w5KPpxz8+gPqTFzK4PV4MroyXVOeV0I/w0OIRrRwS6+r
 hZeWWGhHQ7pWlUopp7wOGZd02x9nh3QSYtL/2Kfj4845x+I/6F8tMSCgdvmw2FiyErrU
 NA6+YxeeMrdzH2i9pTVZSRkaiy+nS0suJnlrUpaCiXiOef9bL2nS6rRut8Fq7WptlYR7
 QNy5RruFXdA5pSuWVxyWS9/ZLCWKdVX0E+ibrl4SRhGJO+yzSOd3V10aUd5AcohYgabc
 hG7RaUmWzUp+vwcdZ4WMm+oTxNRW34K+PujWwwPPdTb4+QI6crdGL7A/7DvhzkJ7C2Pg
 Gj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=2qEIZC2pET5XzcDq5nLJ/i6gFSqMPHpkhsv7sHguWfY=;
 b=7PCZyPUny4rxHi+wUAWo6sw3m/Me8T0are/U2lP9H3VrmZsHY6JbR+MZ1X7Zg1uxKu
 SuvkWFlVyqVmnnZ1mCeEdfIZIocKkDd9ziV9RvD77EtZZRoqNhDnTd93Kr+ObDZhDleo
 41i5GoZd6Nz4uCxSjj/qZhT8gCtljxntc3v7NZz0uOVxKu6k+muLzN71/iz7kjRuBKyV
 F5LZiZD2lOLdDNOAlcTDARMqh+e9xenWg9ZELctvxoyU5xGA0WOcf25AzM8x1pGPHyNw
 Jaa2ekpjUJC4J6AtfFjtm+pEV2x4r884eyzODEJ0JxZ1MOoHnTQdi7PjwLXJC4NFul2T
 oF+A==
X-Gm-Message-State: AOAM533aLbAzal7j121j1tHpQULjGwwoLK0W9IsLpctKcX7KVzcvHmKa
 Zhg1RzInvB/TZTbvnekJLP6VrdcT5r5PEA==
X-Google-Smtp-Source: ABdhPJzqYLEyoyIaSosc83uJCUczHDTHrnudLRo1oE1i3srZHG54KDEKTjVR0raKyxnKYzB4uTUNNQ==
X-Received: by 2002:a05:6402:2693:: with SMTP id
 w19mr2412821edd.266.1638825399995; 
 Mon, 06 Dec 2021 13:16:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id x14sm7213382ejs.124.2021.12.06.13.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 13:16:39 -0800 (PST)
Message-ID: <a4f0712f-f53b-eb80-1c6a-ff45ffbc3916@mind.be>
Date: Mon, 6 Dec 2021 22:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
References: <20211125102441.5351-1-vincent.stehle@arm.com>
 <20211125182655.9365-1-vincent.stehle@arm.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211125182655.9365-1-vincent.stehle@arm.com>
Subject: Re: [Buildroot] [PATCH next v2] configs/aarch64_efi: bump kernel
 version
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNS8xMS8yMDIxIDE5OjI2LCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gQnVtcCBMaW51
eCBrZXJuZWwgdmVyc2lvbiB0byA1LjE1LjQuCj4gCj4gV2UgZW5sYXJnZSB0aGUgYm9vdCBwYXJ0
aXRpb24gdG8gZm9sbG93IHRoZSBrZXJuZWwgaW1hZ2Ugc2l6ZSBpbmNyZWFzZSBhbmQKPiB1cGRh
dGUgdGhlIGRvY3VtZW50YXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOp
IDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBEaWNrIE9sc3NvbiA8aGlA
c2VuemlsbGEuaW8+Cj4gQ2M6IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFpbC5jb20+Cgog
IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+
IAo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBVcGRhdGUgY29tbWl0IG1lc3NhZ2UKPiAKPiAgIGJv
YXJkL2FhcmNoNjQtZWZpL2dlbmltYWdlLWVmaS5jZmcgfCAyICstCj4gICBib2FyZC9hYXJjaDY0
LWVmaS9yZWFkbWUudHh0ICAgICAgIHwgMiArLQo+ICAgY29uZmlncy9hYXJjaDY0X2VmaV9kZWZj
b25maWcgICAgICB8IDYgKysrLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9hcmQvYWFyY2g2NC1lZmkvZ2Vu
aW1hZ2UtZWZpLmNmZyBiL2JvYXJkL2FhcmNoNjQtZWZpL2dlbmltYWdlLWVmaS5jZmcKPiBpbmRl
eCA4ZWMxZjEwZmQ4Mi4uMTNkNjllNWU0MjUgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvYWFyY2g2NC1l
ZmkvZ2VuaW1hZ2UtZWZpLmNmZwo+ICsrKyBiL2JvYXJkL2FhcmNoNjQtZWZpL2dlbmltYWdlLWVm
aS5jZmcKPiBAQCAtOCw3ICs4LDcgQEAgaW1hZ2UgZWZpLXBhcnQudmZhdCB7Cj4gICAJCX0KPiAg
IAl9Cj4gICAKPiAtCXNpemUgPSAzMk0KPiArCXNpemUgPSA2NE0KPiAgIH0KPiAgIAo+ICAgaW1h
Z2UgZGlzay5pbWcgewo+IGRpZmYgLS1naXQgYS9ib2FyZC9hYXJjaDY0LWVmaS9yZWFkbWUudHh0
IGIvYm9hcmQvYWFyY2g2NC1lZmkvcmVhZG1lLnR4dAo+IGluZGV4IDE2NDk5M2VlYTQ5Li4wZTdl
YTBiNWRkNyAxMDA2NDQKPiAtLS0gYS9ib2FyZC9hYXJjaDY0LWVmaS9yZWFkbWUudHh0Cj4gKysr
IGIvYm9hcmQvYWFyY2g2NC1lZmkvcmVhZG1lLnR4dAo+IEBAIC00NSw3ICs0NSw3IEBAIHRoZSBp
bnN0cnVjdGlvbnMgaW4gWzNdLCB3aXRoIHFlbXVfYXJtNjRfZGVmY29uZmlnLgo+ICAgCj4gICBU
aGlzIHNob3VsZCBnaXZlIHlvdSBhIG5vcl9mbGFzaC5iaW4sIHdoaWNoIHlvdSBjYW4gdXNlIHdp
dGggcWVtdSBhcyBhbgo+ICAgYWx0ZXJuYXRpdmUgdG8gUUVNVV9FRkkuZmQuIFlvdSB3aWxsIGFs
c28gbmVlZCB0byBjaGFuZ2UgdGhlIG1hY2hpbmUKPiAtc3BlY2lmaWNhdGlvbiB0byAiLU0gdmly
dCxzZWN1cmUiIG9uIHFlbXUgY29tbWFuZCBsaW5lLCB0byBlbmFibGUgVHJ1c3Rab25lCj4gK3Nw
ZWNpZmljYXRpb24gdG8gIi1NIHZpcnQsc2VjdXJlPW9uIiBvbiBxZW11IGNvbW1hbmQgbGluZSwg
dG8gZW5hYmxlIFRydXN0Wm9uZQo+ICAgc3VwcG9ydCwgYW5kIHlvdSB3aWxsIG5lZWQgdG8gaW5j
cmVhc2UgdGhlIG1lbW9yeSB3aXRoICItbSAxMDI0Ii4KPiAgIAo+ICAgWzFdOiBodHRwczovL2dp
dGh1Yi5jb20vQVJNLXNvZnR3YXJlL2ViYnIKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9hYXJjaDY0
X2VmaV9kZWZjb25maWcgYi9jb25maWdzL2FhcmNoNjRfZWZpX2RlZmNvbmZpZwo+IGluZGV4IDZj
YjhkMWZhYzIxLi4xYmQwNmM1MWYzNyAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2FhcmNoNjRfZWZp
X2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvYWFyY2g2NF9lZmlfZGVmY29uZmlnCj4gQEAgLTIy
LDEzICsyMiwxMyBAQCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJWkU9IjIwME0iCj4gICBCUjJf
Uk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9hYXJjaDY0LWVmaS9wb3N0LWltYWdlLnNo
IHN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKPiAgIEJSMl9ST09URlNfUE9TVF9TQ1JJUFRf
QVJHUz0iLWMgYm9hcmQvYWFyY2g2NC1lZmkvZ2VuaW1hZ2UtZWZpLmNmZyIKPiAgIAo+IC0jIExp
bnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNS4xMSBzZXJpZXMKPiAtQlIyX1BBQ0tBR0Vf
SE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzExPXkKPiArIyBMaW51eCBoZWFkZXJzIHNhbWUg
YXMga2VybmVsLCBhIDUuMTUgc2VyaWVzCj4gK0JSMl9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVS
U19DVVNUT01fNV8xNT15Cj4gICAKPiAgICMgS2VybmVsCj4gICBCUjJfTElOVVhfS0VSTkVMPXkK
PiAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC1CUjJfTElOVVhfS0VSTkVM
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjExLjE2Igo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjQiCj4gICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RF
RkFVTFRfQ09ORklHPXkKPiAgIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NMPXkK
PiAgIAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
