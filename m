Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0853BC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A165F80B49;
	Wed,  1 May 2024 21:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQUPwBYfBQcF; Wed,  1 May 2024 21:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A16B980AFA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A16B980AFA;
	Wed,  1 May 2024 21:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 797321BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66202605A7
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7uzT35ZTd7u for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 356E3605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 356E3605A6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 356E3605A6
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:53:57 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so50241305e9.2
 for <buildroot@buildroot.org>; Wed, 01 May 2024 14:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714600436; x=1715205236;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WeV1S7EueVdQYGOESB8iy5zGQmnm8inOOAPzSKEJsg=;
 b=W0fV93dcf3velaEGo6Fi4wNQITnQEGBq1XM3wrxD+i5Qmpq2ItiFr5eVMDryIsIdVZ
 CUEevr7FB9lBXyPkayPEmNInT8u2HtdKPVM/nN5Z66nVpLXjvFfePPKY9z97e3MzTSGR
 3Is8bixDvW9gYKLnSLSwI25jpl6l6xvmbaWZODmoXFEwOxyfmfsPNZGCkZ9V02oQ9r8S
 9PiIqy9/lOcS6mCy9wwLh8NhfRhNnKm7WMTLpULO2yS8zPKTO9F/SyJpGhyDTgO8GZ+x
 Ls1rV3YWOVk8O3xInmAYFmKM/kkPXd+mZa3M095bRxPbZ1NjPs7t5oZRomjDw3Mwyw/l
 Tb4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuFi0ji4o/SGOQncL12dGuZkv+euMpsNkc3oljOP2sU8KSpAFnrFoISBRsMxwHjrzTxt5hgVVFGm6U51MfDSOos7O6AJ4FvQ==
X-Gm-Message-State: AOJu0Ywhw1t0DdF3PuS7VxnTSqaVY9272kcg0SHkQW5DlTiO7JIOUR/U
 NB2yufGUJFEJ4swcNY1xY+kGo7LnOdNmvbx7/4lwk1CLX52ewpW5CQUNyMuJK0I=
X-Google-Smtp-Source: AGHT+IGnFs3yxfUcDS6+ZNYOrflo/DlS92s/FOsm+l/kOphcTNGwpGBaVjwDnL5b2Y11jrmdnodp9A==
X-Received: by 2002:a05:600c:350c:b0:41b:f41a:c67e with SMTP id
 h12-20020a05600c350c00b0041bf41ac67emr181783wmq.33.1714600436007; 
 Wed, 01 May 2024 14:53:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a05600c224500b0041aa79f27a0sm3373610wmm.38.2024.05.01.14.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 14:53:55 -0700 (PDT)
Message-ID: <7b20fc6a-04be-449f-b304-23505c32d4d2@smile.fr>
Date: Wed, 1 May 2024 23:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Gero_Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>,
 buildroot@buildroot.org
References: <20230907003002.474334-1-patrick.oppenlander@gmail.com>
 <20240430133754.1288162-1-gero.schwaericke@grandcentrix.net>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240430133754.1288162-1-gero.schwaericke@grandcentrix.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714600436; x=1715205236;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5WeV1S7EueVdQYGOESB8iy5zGQmnm8inOOAPzSKEJsg=;
 b=Ji9oloBIvhtFjGQC//PcgY4dT7YXdnjvAz4kha8/QrskbCRgfmNdhGBKHpya4dainJ
 9HwXlV8a9OTObNjBd5VJ0dhBtsX4aoDke9cIIfI4yG+nOanEKedYyviihFzAmOLmeLt8
 JJxR/LOz36g9a+qwETqM8xo9LyPpAu84fAuqvzX1TX9a0dXYmHSlWZXFSOc+963pK60W
 hIFFM2GuaB3ArXucMkJgXL2C0SdlaaLrLDUrR9TrHcLmljd0KQMA+DHSGiA7qZZbvb4H
 x8moaUr9/BcgcAHE72sT9FPncsyXY+68qMPoHmfNFmVuFhSGQAkVl+WNsXp9ThEeBJ5k
 zBQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Ji9oloBI
Subject: Re: [Buildroot] [PATCH v2] ti-k3-r5-loader: support devicetree
 customization
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Patrick Oppenlander <patrick.oppenlander@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2VybywKCkxlIDMwLzA0LzIwMjQgw6AgMTU6MzcsIEdlcm8gU2Nod8Okcmlja2Ugdmlh
IGJ1aWxkcm9vdCBhIMOpY3JpdMKgOgo+IFRoaXMgaXMgZHVwbGljYXRlZCBmcm9tIHRoZSBVLUJv
b3QgbWFrZWZpbGUgJiBLY29uZmlnLgo+IAo+IFNpbWlsYXJseSB0byBVLUJvb3QgY3VzdG9tIGJv
YXJkcyBzb21ldGltZXMgbmVlZCB0byBhZGp1c3QgdGhlIFUtQm9vdAo+IGRldmljZXRyZWUuIEZv
ciBleGFtcGxlLCB0aGUgQU02NHggU0RSQU0gY29udHJvbGxlciBzdXBwb3J0cyBpbmxpbmUgRUND
Cj4gd2hpY2ggbmVlZHMgdG8gYmUgZW5hYmxlZCBpbiB0aGUgUjUgbG9hZGVyIGRldmljZXRyZWUu
Cj4gCj4gUGxlYXNlIG5vdGUgdGhhdCBzb21lIHZlcnNpb25zIG9mIFUtQm9vdCBoYXZlIGJyb2tl
biBleHRlcm5hbCBkZXZpY2V0cmVlCj4gc3VwcG9ydCBhbmQgbWF5IHJlcXVpcmUgbWFudWFsIHBh
dGNoaW5nIHRvIGJ1aWxkLiBTZWUgY29tbWl0Cj4gMzYwOWUxZGM1ZjRkNGMyMzhkY2QyM2UwNDVi
YTYyMjMzMTBmZWZmYSBpbiB0aGUgVS1Cb290IHRyZWUuCgpJIGFkZGVkIHRoZSBVUkwgdG8gZ2l0
bGFiIGluc3RlYWQ6Cmh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2NvbW1p
dC8zNjA5ZTFkYzVmNGQ0YzIzOGRjZDIzZTA0NWJhNjIyMzMxMGZlZmZhCgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFBhdHJpY2sgT3BwZW5sYW5kZXIgPHBhdHJpY2sub3BwZW5sYW5kZXJAZ21haWwuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAZ3JhbmRjZW50
cml4Lm5ldD4KPiAtLS0KPiB2MSAtPiB2MjoKPiAgIC0gbWFrZSBpdCBhcHBseSBvbiBjdXJyZW50
IG1hc3Rlcgo+ICAgLSBtb3ZlIHRoZSBjb25maWcgb3B0aW9uIGludG8gIGlmIEJSMl9UQVJHRVRf
VElfSzNfUjVfTE9BREVSCj4gICAtIGZpeCBoZWxwIHN0cmluZyBtZW50aW9uaW5nIEFSQ0ggdGhv
dWdoIGl0J3MgZml4ZWQgdG8gYXJtIGluIC5tawo+IC0tLQo+ICBib290L3RpLWszLXI1LWxvYWRl
ci9Db25maWcuaW4gICAgICAgICAgfCAxMCArKysrKysrKysrCj4gIGJvb3QvdGktazMtcjUtbG9h
ZGVyL3RpLWszLXI1LWxvYWRlci5tayB8ICA1ICsrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci9Db25m
aWcuaW4gYi9ib290L3RpLWszLXI1LWxvYWRlci9Db25maWcuaW4KPiBpbmRleCA2ZDFhZGJlYWMz
Li5kZjg4NWNjMmFmIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5p
bgo+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVyL0NvbmZpZy5pbgo+IEBAIC05NSw2ICs5NSwx
NiBAQCBjb25maWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX0NPTkZJR19GSUxF
Cj4gIAloZWxwCj4gIAkgIFBhdGggdG8gdGhlIFRJIEszIFI1IExvYWRlciBjb25maWd1cmF0aW9u
IGZpbGUuCj4gIAo+ICtjb25maWcgQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfQ1VTVE9NX0RU
U19QQVRICj4gKwlzdHJpbmcgIkRldmljZSBUcmVlIFNvdXJjZSBmaWxlIHBhdGhzIgo+ICsJaGVs
cAo+ICsJICBTcGFjZS1zZXBhcmF0ZWQgbGlzdCBvZiBwYXRocyB0byBkZXZpY2UgdHJlZSBzb3Vy
Y2UgZmlsZXMKPiArCSAgdGhhdCB3aWxsIGJlIGNvcGllZCB0byBhcmNoL2FybS9kdHMvIGJlZm9y
ZSBzdGFydGluZyB0aGUKPiArCSAgYnVpbGQuCj4gKwo+ICsJICBUbyB1c2UgdGhpcyBkZXZpY2Ug
dHJlZSBzb3VyY2UgZmlsZSwgdGhlIFUtQm9vdCBjb25maWd1cmF0aW9uCj4gKwkgIGZpbGUgbXVz
dCByZWZlciB0byBpdC4KPiArCj4gIGNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURFUl9U
SUJPT1QzX0JJTgo+ICAJc3RyaW5nICJ0aWJvb3QzLmJpbiBiaW5hcnkgbmFtZSIKPiAgCWRlZmF1
bHQgInRpYm9vdDMuYmluIgo+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLXI1LWxvYWRlci90aS1r
My1yNS1sb2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsK
PiBpbmRleCA4OTE3ODNlNDBmLi45OGE2ZDQ3M2YxIDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMt
cjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ICsrKyBiL2Jvb3QvdGktazMtcjUtbG9hZGVy
L3RpLWszLXI1LWxvYWRlci5tawo+IEBAIC04OCw3ICs4OCwxMiBAQCBkZWZpbmUgVElfSzNfUjVf
TE9BREVSX0lOU1RBTExfU1dTRldfSVRCCj4gIAlmaQo+ICBlbmRlZgo+ICAKPiArVElfSzNfUjVf
TE9BREVSX0NVU1RPTV9EVFNfUEFUSCA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1RJX0sz
X1I1X0xPQURFUl9DVVNUT01fRFRTX1BBVEgpKQo+ICsKPiAgZGVmaW5lIFRJX0szX1I1X0xPQURF
Ul9CVUlMRF9DTURTCj4gKwkkKGlmICQoVElfSzNfUjVfTE9BREVSX0NVU1RPTV9EVFNfUEFUSCks
Cj4gKwkJY3AgLWYgJChUSV9LM19SNV9MT0FERVJfQ1VTVE9NX0RUU19QQVRIKSAkKEBEKS9hcmNo
L2FybS9kdHMvCj4gKwkpCj4gIAkkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykgJChUSV9LM19SNV9M
T0FERVJfTUFLRSkgLUMgJChARCkgJChUSV9LM19SNV9MT0FERVJfTUFLRV9PUFRTKQo+ICBlbmRl
Zgo+ICAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
