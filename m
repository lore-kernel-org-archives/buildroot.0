Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0398C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 22:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 988634090E;
	Wed,  5 Mar 2025 22:00:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wm_qzN1YBv_x; Wed,  5 Mar 2025 22:00:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42B9C40917
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42B9C40917;
	Wed,  5 Mar 2025 22:00:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD36495F
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D518441161
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N7mNTNvUezHD for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 22:00:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B6CDB41153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6CDB41153
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6CDB41153
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 22:00:41 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-390df942558so5730403f8f.2
 for <buildroot@buildroot.org>; Wed, 05 Mar 2025 14:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741212039; x=1741816839;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sXDGvGQ6YxeaY/WsFPf+Mr8vT9ROLFmzHM1ab8sqQHc=;
 b=HlNjYhzJ3XZreToyIvJRV1n+shDzxuoCbnujNZw+UeGo7HrYHKXXG7qT0BSO8RoPrs
 BXJi0Ys33SWeey8x6oSjItjbfX5N1yMdIT8yEl2cmbTG8nWILORNpeLKiMbYaBUwjowM
 hcB3zqzwOzqYt5I7znvj6SG0NaaK59g4KOMTQeBvPWCutt2C1pFbYZF9eePp6SUX/eKE
 aduUjhGmldTWPu74imr4m0wrgoGG4lJXzQAT5+Jgx/yMSRLENAX7dPm3jrnK/XxWRsmC
 zTr5sHYsJeb8Z5YX9SFWLSarOKLqmfCm1d/0Lk8mrapLSpqrumOKswS8RLfCPhTqpbu9
 EUlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEhJfSNbcZmNBii071aiREIMef+1fijisF9VHpSovCdm+ru1/ZPE+uQHtbtnJ/d0lt8uJ3oVAvL4c=@buildroot.org
X-Gm-Message-State: AOJu0YwMGx1lIkgsFWYAzzeKjJCr/trc/6GKJTElxYbVH/rao/gh+8xp
 ICWbr15P4QRHeeDLLdL6lLn9MgKl2HHvyDjMaThr1HrkdArx3dQ2KRNiuOZL5yI=
X-Gm-Gg: ASbGnctP8AbyMN0Im/Piek6aDRsDlYfYQr3lmwncmHW5GEY65uUNVXad6B0GHWyUy0g
 VdXSVXm/4CuC1dDAsfKfUbalADoafA21XiEwawFYp7IMjL40+t3WK9IqPj8rwyC1PVWF+5RRW3b
 WmhNFWwzxwBNkbn9QRvHmUrZKuzri1kWrg6QXqAi1+op/iAIwydVSPYGWFtgnwMq6ixTopZScoy
 R85+FlvtLrf9jvT09kXRRPClhmdHuQBLNojnTMGcbCzJXi/zhw7OJcLl24TY2r6KKpR/LPcJnBT
 /CPTdps4dDH55eLoHu+FQ7WtGP/DmcRi9G15N+ukPVZ8p6eFDdWh0NsywV9paohXzW9IxbllXEF
 KtJa1KR1VxOtY1E79/R7j4mtyQisM9jnxxBn69GuHNrI/ygUIZrS07VEXNPjfZwnwcmeOoUGDXo
 W4lXc3
X-Google-Smtp-Source: AGHT+IHT7pOwxKMlXZbkjN2VBKBG1zKA+6LBRWEkZPQV9nhsUrzqV8JXKr0XRnclbB1TXT4IvsQv5w==
X-Received: by 2002:a5d:588a:0:b0:38d:c627:f634 with SMTP id
 ffacd0b85a97d-3911f7bf931mr4276627f8f.50.1741212039376; 
 Wed, 05 Mar 2025 14:00:39 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd42c5880sm29388145e9.19.2025.03.05.14.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 14:00:39 -0800 (PST)
Message-ID: <9900d4d1-834c-4430-b7da-7642a6f60b02@smile.fr>
Date: Wed, 5 Mar 2025 23:00:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Spenser Gilliland <spenser@gillilanding.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250224114736.1525367-1-fiona.klute@gmx.de>
Content-Language: fr
In-Reply-To: <20250224114736.1525367-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1741212039; x=1741816839; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sXDGvGQ6YxeaY/WsFPf+Mr8vT9ROLFmzHM1ab8sqQHc=;
 b=1/+ZND3kXmq9WAYGqNMxn8E55HJ62U068fkm4nutj6/UBSAy0I0C6kzpt7TRANfkVG
 4D6LLEGeSEDEN8Q62XVaGX+SX9mZ1KrBUZWPuF/PCJQ5AZd9EJ2cG7b08EsMjIefRL5C
 pdYRxDvNn1iVV+w0pelOVYyfi1cwuNh+WtdwE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=1/+ZND3k
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mesa3d-demos: fix build
 failure on musl
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

SGVsbG8gRmlvbmEsIEFsbCwKCkxlIDI0LzAyLzIwMjUgw6AgMTI6NDcsIEZpb25hIEtsdXRlIHZp
YSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBGcm9tOiAiRmlvbmEgS2x1dGUgKFdJV0EpIiA8Zmlv
bmEua2x1dGVAZ214LmRlPgo+IAo+IFBhdGNoIGhhcyBiZWVuIG9uIHVwc3RyZWFtIG1haW4gZm9y
IGNsb3NlIHRvIDIgeWVhcnMuCj4gCj4gVGhlICJ1aW50IiB1c2Ugd2FzIGludHJvZHVjZWQgd2l0
aCBbMV0gYW5kIFsyXSwgcmVsZWFzZWQgd2l0aAo+IG1lc2EzZC1kZW1vcyA5LjAuMCBmcm9tIE1h
cmNoIDIwMjMsIGFuZCBhZGRlZCB0byBCdWlsZHJvb3Qgd2l0aCBjb21taXQKPiA4MDMwNGQ5OTEx
ICJwYWNrYWdlL21lc2EzZC1kZW1vczogYnVtcCB2ZXJzaW9uIHRvIDkuMC4wIi4KPiAKPiBbMV0g
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvZGVtb3MvLS9jb21taXQvODEzZWJl
Zjc2NzFmMGU1NGQxYjU1YmU5ZTE1YWU1NTg2YjJiOWViMQo+IFsyXSBodHRwczovL2dpdGxhYi5m
cmVlZGVza3RvcC5vcmcvbWVzYS9kZW1vcy8tL2NvbW1pdC81YWFhN2ZhZWI0ZGU5NDk3NTM1NzM4
ODMwZTZlYmI4ZjEwMDcxODc3Cj4gCj4gU2lnbmVkLW9mZi1ieTogRmlvbmEgS2x1dGUgKFdJV0Ep
IDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjogQWRkIGRldGFp
bHMgb24gd2hlbiB0aGUgYnVnIHdhcyBpbnRyb2R1Y2VkIGludG8KPiBtZXNhM2QtZGVtb3MgYW5k
IEJ1aWxkcm9vdCB0byBjb21taXQgbWVzc2FnZS4KCkNhbiB5b3UgcHJvdmlkZSBhIGRlZmNvbmZp
ZyB0aGF0IHJlcHJvZHVjZSB0aGlzIGJ1aWxkIGlzc3VlPwpJdCBzZWVtcyB0aGUgYXV0b2J1aWxk
ZXJzIGFyZSBub3QgYWJsZSB0byB0cmlnZ2VyIGl0OgoKaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm9yZy8/bGliYz1tdXNsJiZyZWFzb249bWVzYTNkLWRlbW9zLTkuMC4wCgpJJ20gbm90IGFi
bGUgdG8gcmVwcm9kdWNlIGl0IHVzaW5nIGEgeDg2XzY0IG11c2wgdG9vbGNoYWluIGFuZCB2dWxr
YWluIHN1cHBvcnQKZW5hYmxlZCBpbiBtZXNhM2QgKHdheWxhbmQgZW5hYmxlZCk6CgpCUjJfVE9P
TENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fWDg2XzY0X0NPUkVfSTdfTVVTTF9TVEFCTEU9eQpCUjJf
UEFDS0FHRV9XQVlMQU5EPXkKQlIyX1BBQ0tBR0VfTUVTQTNEX0xMVk09eQpCUjJfUEFDS0FHRV9N
RVNBM0RfR0FMTElVTV9EUklWRVJfSTkxNT15CkJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJ
VkVSX1NXUkFTVD15CkJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1ZJUlRJTz15CkJS
Ml9QQUNLQUdFX01FU0EzRF9ERU1PUz15CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gIC4u
Lmthbi13c2ktdXNlLXVuc2lnbmVkLWluc3RlYWQtb2YtdWludC5wYXRjaCB8IDY4ICsrKysrKysr
KysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVzYTNkLWRlbW9zLzAwMDMtdnVsa2FuLXdzaS11c2UtdW5z
aWduZWQtaW5zdGVhZC1vZi11aW50LnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVz
YTNkLWRlbW9zLzAwMDMtdnVsa2FuLXdzaS11c2UtdW5zaWduZWQtaW5zdGVhZC1vZi11aW50LnBh
dGNoIGIvcGFja2FnZS9tZXNhM2QtZGVtb3MvMDAwMy12dWxrYW4td3NpLXVzZS11bnNpZ25lZC1p
bnN0ZWFkLW9mLXVpbnQucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAw
MDAwMDAuLjE2MGRjOTAxMGQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9tZXNhM2Qt
ZGVtb3MvMDAwMy12dWxrYW4td3NpLXVzZS11bnNpZ25lZC1pbnN0ZWFkLW9mLXVpbnQucGF0Y2gK
PiBAQCAtMCwwICsxLDY4IEBACj4gK0Zyb20gM2Y0ZDVmZjM0ZTA2MWYzZDQ3YjljZjI4YmZmMmZj
NTg4ZDhjNTMyNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogcHN5a29zZSA8YWxp
Y2VAYXlheWEuZGV2Pgo+ICtEYXRlOiBUaHUsIDIzIE1hciAyMDIzIDIxOjE4OjU2ICswMDAwCj4g
K1N1YmplY3Q6IFtQQVRDSF0gdnVsa2FuL3dzaTogdXNlIHVuc2lnbmVkIGluc3RlYWQgb2YgdWlu
dAo+ICsKPiArdWludCBpcyBub3QgYSBzdGFuZGFyZCB0eXBlIG5hbWUgYW5kIGZhaWxzIHRvIGJ1
aWxkIGFnYWluc3QgbXVzbCBsaWJjCj4gKwo+ICtSZXZpZXdlZC1ieTogRXJpayBGYXllLUx1bmQg
PGVyaWsuZmF5ZS1sdW5kQGNvbGxhYm9yYS5jb20+Cj4gK1Vwc3RyZWFtOiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvbWVzYS9kZW1vcy8tL2NvbW1pdC8zZjRkNWZmMzRlMDYxZjNkNDdi
OWNmMjhiZmYyZmM1ODhkOGM1MzI2Cj4gK1NpZ25lZC1vZmYtYnk6IEZpb25hIEtsdXRlIChXSVdB
KSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+ICstLS0KPiArIHNyYy92dWxrYW4vd3NpL3dheWxhbmQu
YyB8IDE0ICsrKysrKystLS0tLS0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3NyYy92dWxrYW4vd3NpL3dheWxh
bmQuYyBiL3NyYy92dWxrYW4vd3NpL3dheWxhbmQuYwo+ICtpbmRleCA0NDRkMmJiODEuLjU5NThk
MjgzYSAxMDA2NDQKPiArLS0tIGEvc3JjL3Z1bGthbi93c2kvd2F5bGFuZC5jCj4gKysrKyBiL3Ny
Yy92dWxrYW4vd3NpL3dheWxhbmQuYwo+ICtAQCAtMTI4LDcgKzEyOCw3IEBAIGRpc3BhdGNoX2tl
eSh4a2Jfa2V5Y29kZV90IHhrYl9rZXksIGVudW0gd2xfa2V5Ym9hcmRfa2V5X3N0YXRlIHN0YXRl
KQo+ICsgfQo+ICsgCj4gKyBzdGF0aWMgdm9pZAo+ICstaGFuZGxlX2tleSh1aW50IGtleSwgZW51
bSB3bF9rZXlib2FyZF9rZXlfc3RhdGUgc3RhdGUpCj4gKytoYW5kbGVfa2V5KHVuc2lnbmVkIGtl
eSwgZW51bSB3bF9rZXlib2FyZF9rZXlfc3RhdGUgc3RhdGUpCj4gKyB7Cj4gKyAgICB4a2Jfa2V5
Y29kZV90IHhrYl9rZXkgPSBrZXkgKyA4Owo+ICsgICAgc3RydWN0IGl0aW1lcnNwZWMgdGltZXIg
PSB7MH07Cj4gK0BAIC0xNTEsMTUgKzE1MSwxNSBAQCBoYW5kbGVfa2V5KHVpbnQga2V5LCBlbnVt
IHdsX2tleWJvYXJkX2tleV9zdGF0ZSBzdGF0ZSkKPiArIH0KPiArIAo+ICsgc3RhdGljIHZvaWQK
PiArLWtleSh2b2lkICpkYXRhLCBzdHJ1Y3Qgd2xfa2V5Ym9hcmQgKmtleWJvYXJkLCB1aW50IHNl
cmlhbCwKPiArLSAgICB1aW50IHRpbWUsIHVpbnQga2V5LCBlbnVtIHdsX2tleWJvYXJkX2tleV9z
dGF0ZSBzdGF0ZSkKPiArK2tleSh2b2lkICpkYXRhLCBzdHJ1Y3Qgd2xfa2V5Ym9hcmQgKmtleWJv
YXJkLCB1bnNpZ25lZCBzZXJpYWwsCj4gKysgICAgdW5zaWduZWQgdGltZSwgdW5zaWduZWQga2V5
LCBlbnVtIHdsX2tleWJvYXJkX2tleV9zdGF0ZSBzdGF0ZSkKPiArIHsKPiArICAgIGhhbmRsZV9r
ZXkoa2V5LCBzdGF0ZSk7Cj4gKyB9Cj4gKyAKPiArIHN0YXRpYyB2b2lkCj4gKy1tb2RpZmllcnMo
dm9pZCAqZGF0YSwgc3RydWN0IHdsX2tleWJvYXJkICprZXlib2FyZCwgdWludCBzZXJpYWwsCj4g
Ky0gICAgdWludCBtb2RzX2RlcHJlc3NlZCwgdWludCBtb2RzX2xhdGNoZWQsIHVpbnQgbW9kc19s
b2NrZWQsIHVpbnQgZ3JvdXApCj4gKyttb2RpZmllcnModm9pZCAqZGF0YSwgc3RydWN0IHdsX2tl
eWJvYXJkICprZXlib2FyZCwgdW5zaWduZWQgc2VyaWFsLAo+ICsrICAgIHVuc2lnbmVkIG1vZHNf
ZGVwcmVzc2VkLCB1bnNpZ25lZCBtb2RzX2xhdGNoZWQsIHVuc2lnbmVkIG1vZHNfbG9ja2VkLCB1
bnNpZ25lZCBncm91cCkKPiArIHsKPiArICAgIHhrYl9zdGF0ZV91cGRhdGVfbWFzayhrZXlib2Fy
ZF9kYXRhLnhrYl9zdGF0ZSwgbW9kc19kZXByZXNzZWQsIG1vZHNfbGF0Y2hlZCwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICBtb2RzX2xvY2tlZCwgMCwgMCwgZ3JvdXApOwo+ICtAQCAtMTg0
LDcgKzE4NCw3IEBAIGtleW1hcCh2b2lkICpkYXRhLCBzdHJ1Y3Qgd2xfa2V5Ym9hcmQgKmtleWJv
YXJkLAo+ICsgfQo+ICsgCj4gKyBzdGF0aWMgdm9pZAo+ICstZW50ZXIodm9pZCAqZGF0YSwgc3Ry
dWN0IHdsX2tleWJvYXJkICprZXlib2FyZCwgdWludCBzZXJpYWwsCj4gKytlbnRlcih2b2lkICpk
YXRhLCBzdHJ1Y3Qgd2xfa2V5Ym9hcmQgKmtleWJvYXJkLCB1bnNpZ25lZCBzZXJpYWwsCj4gKyAg
ICAgICBzdHJ1Y3Qgd2xfc3VyZmFjZSAqc3VyZmFjZSwgc3RydWN0IHdsX2FycmF5ICprZXlzKQo+
ICsgewo+ICsgICAgdWludDMyX3QgKmtleTsKPiArQEAgLTE5NCw3ICsxOTQsNyBAQCBlbnRlcih2
b2lkICpkYXRhLCBzdHJ1Y3Qgd2xfa2V5Ym9hcmQgKmtleWJvYXJkLCB1aW50IHNlcmlhbCwKPiAr
IH0KPiArIAo+ICsgc3RhdGljIHZvaWQKPiArLWxlYXZlKHZvaWQgKmRhdGEsIHN0cnVjdCB3bF9r
ZXlib2FyZCAqa2V5Ym9hcmQsIHVpbnQgc2VyaWFsLAo+ICsrbGVhdmUodm9pZCAqZGF0YSwgc3Ry
dWN0IHdsX2tleWJvYXJkICprZXlib2FyZCwgdW5zaWduZWQgc2VyaWFsLAo+ICsgICAgICAgc3Ry
dWN0IHdsX3N1cmZhY2UgKnN1cmZhY2UpCj4gKyB7Cj4gKyAgICBzdHJ1Y3QgaXRpbWVyc3BlYyB0
aW1lciA9IHswfTsKPiArLS0gCj4gK0dpdExhYgo+ICsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
