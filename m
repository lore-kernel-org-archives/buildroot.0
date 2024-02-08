Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DCCC48260
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 22:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49C8B8432F;
	Thu,  8 Feb 2024 22:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOduvlqlpnvo; Thu,  8 Feb 2024 22:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AB9984EBE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AB9984EBE;
	Thu,  8 Feb 2024 22:43:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA6611BF3CE
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 22:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7AE742F5F
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 22:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A_Qxdm8R2Dzj for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 22:43:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82B2842D0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82B2842D0A
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82B2842D0A
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 22:43:10 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-410489e1a63so2873515e9.3
 for <buildroot@buildroot.org>; Thu, 08 Feb 2024 14:43:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707432188; x=1708036988;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/CwlIHl9J05wB06FXnh931btIsMsmAmFzRd64FI81ew=;
 b=ed39tyPpui6McGTdm2T1dVZDjLBFEAC7mB0jM9LbI6gtoKxWrA3y3A42iXx/hQoSQy
 ru7j1tsUySzgd/5mYawZTpTQuYAEL/P2swXbPoXFoEWAYZNkuaY0Rd0ERNDjQLrrv1jl
 bxyOUNyjszHJ+c1Zwq6qNy1YFRoWmjGw94Godsu0VSQ8IS5MEZ5SdhpG+zb9QWxRtCQJ
 vEwAsmThXpXRGwwEnSrv3ZlrPfy84XsumuneEjv77POLTxRW83UC2WAbIgbRgqXm08QA
 tPRIFkw9hooHX0KmEV2sBlnfaEzn44HfkHsBLRy4AxTTnD62sHp6npsgV+k7rSuwwGpP
 CH/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwQc5jK49etoFPYT50c66i/jZvSeaExLvqKoliygEL9dIguTAM80TJAco3HC4YDxrxQca0Gw4SJmWKl1pKjPmVI45JeQifBg==
X-Gm-Message-State: AOJu0YwGi5k4tjKCTtuw7mUFldekMWAbshlXSH+nTmV1uUeFovf5OAkV
 hNZanjAFQ2l3qLvmjucUq2VWIXMvQtyaJ2LZ2nhLpY+PZS/1B2UkZA6tO63AzPE=
X-Google-Smtp-Source: AGHT+IGn7KazxbKhHXdN+JbBkx9jvusqPygrB/B13N7Eqr7cpofBtonvWNolZfv2y/XinTDXzM/DIg==
X-Received: by 2002:a05:600c:4ec7:b0:410:4782:33b6 with SMTP id
 g7-20020a05600c4ec700b00410478233b6mr545681wmq.31.1707432188369; 
 Thu, 08 Feb 2024 14:43:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZPv18lE96pacmgglSAhG2tjcIaCi4i35uouvhyLN4SrgQ58eTFETC4mqUZKph5nNWnRikVp8M1ZUq3Fuh5L/QmuXgtqiuJa9V8MbPSS6+m8WbI3hFvOxuZhhs1hbyvGZ18fyoVqwnXt2hfFFiO7e+xwqNzMPHcDhp1lsfnNcykPGfvoa91r2/tPkovyiOF0q0AFk4TkrgZw8iSe7nRYXQQrYUzlCpyG46CV9eizCSKXMn
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a05600c191400b0041031b4190csm649848wmq.18.2024.02.08.14.43.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 14:43:07 -0800 (PST)
Message-ID: <7cc235a5-b0ee-4517-a4ce-941e6f868c19@mind.be>
Date: Thu, 8 Feb 2024 23:43:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
 <20240115-imx93-support-v5-2-c2c950104c58@armadeus.com>
In-Reply-To: <20240115-imx93-support-v5-2-c2c950104c58@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707432188; x=1708036988; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/CwlIHl9J05wB06FXnh931btIsMsmAmFzRd64FI81ew=;
 b=ezLYxxO21plTQhgWXxyscn2kWeFtYtxsS4UuH7vwQ+JQp+H3ZGGkyknsQ4o3p5Kypm
 E/TmWdom7KkIPQZRSaJGDTbYy1b4WqAZBHgnch2rCbRYZFy5rHz69h+VyO1QzNzUvlj5
 3WeyDOwfs2NQ/pUaNQmikh/9hkUzK8Zfvo+c98LSgGbGaaWByFhT9C4rFkhgdkfmcLz4
 bXRyjtktdh4qZ5paEGU0jBwQML54377nSi1yutAvLLIbNJkSDK2eYv7YOaN2+jyxypPR
 1t0Sc0Fk38iJpv2Jrii71JytJFfyqzm4eqBNf9DkmdfsfcDCcTY6JLRCcmB9WbFINC2E
 QmXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ezLYxxO2
Subject: Re: [Buildroot] [PATCH v5 2/3]
 package/freescale-imx/firmware-ele-imx: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wMi8yMDI0IDEzOjU0LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBUaGlz
IHBhY2thZ2UgcHJvdmlkZXMgZmlybXdhcmUgYmxvYnMgZm9yIHRoZSBFZGdlbG9jayBTZWN1cmUK
PiBFbmNsYXZlIChFTEUpIFsxXSBwcmVzZW50IG9uIGkuTVg4VUxQIGFuZCBpLk1YOSBTb2NzLgo+
IFRoaXMgdmVyc2lvbiBjb21lcyBmcm9tIHRoZSA2LjEuNTUtMi4yLjAgcmVsZWFzZS4KPiAKPiBb
MV0gaHR0cHM6Ly93d3cubnhwLmNvbS9wcm9kdWN0cy9ueHAtcHJvZHVjdC1pbmZvcm1hdGlvbi9u
eHAtcHJvZHVjdC1wcm9ncmFtcy9lZGdlbG9jay1zZWN1cmUtZW5jbGF2ZTpFREdFTE9DSy1TRUNV
UkUtRU5DTEFWRQo+IAo+IFJldmlld2VkLWJ5OiBHYXJ5IEJpc3NvbiA8Ymlzc29uLmdhcnlAZ21h
aWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGZvciB2NToKPiAgIC0gbm9u
ZQo+IAo+IENoYW5nZXMgZm9yIHY0Ogo+ICAgLSBtb3ZlIGkuTVggU2lsaWNvbiBSZXZpc2lvbiBj
aGFuZ2VzIGludG8gZmlyc3QgcGF0Y2ggKEdhcnkgQmlzc29uKQo+IAo+IENoYW5nZXMgZm9yIHYz
Ogo+ICAgLSByZW5hbWUgcGFja2FnZSBmcm9tIGZpcm13YXJlLXNlbnRpbmVsIHRvIHBhY2thZ2Ug
ZmlybXdhcmUtZWxlLWlteAo+IAo+IENoYW5nZXMgZm9yIHYyOgo+ICAgLSBub25lCj4gLS0tCj4g
ICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKPiAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L0NvbmZpZy5pbiAg
IHwgMjEgKysrKysrKysrKysrKysrKysKPiAgIC4uLi9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJl
LWVsZS1pbXguaGFzaCAgICAgICAgIHwgIDQgKysrKwo+ICAgLi4uL2Zpcm13YXJlLWVsZS1pbXgv
ZmlybXdhcmUtZWxlLWlteC5tayAgICAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysr
Cj4gICA0IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9mcmVlc2NhbGUtaW14L0NvbmZpZy5pbiBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9D
b25maWcuaW4KPiBpbmRleCBiYTE2OWVhZDE4Y2IuLmYxMmFjYzNiZDAyNCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9mcmVlc2Nh
bGUtaW14L0NvbmZpZy5pbgo+IEBAIC0xNTQsNiArMTU0LDcgQEAgc291cmNlICJwYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvaW14LXV1Yy9Db25maWcuaW4iCj4gICBzb3VyY2UgInBhY2thZ2UvZnJlZXNj
YWxlLWlteC9pbXgtdnB1L0NvbmZpZy5pbiIKPiAgIHNvdXJjZSAicGFja2FnZS9mcmVlc2NhbGUt
aW14L2lteC12cHUtaGFudHJvL0NvbmZpZy5pbiIKPiAgIHNvdXJjZSAicGFja2FnZS9mcmVlc2Nh
bGUtaW14L2lteC12cHV3cmFwL0NvbmZpZy5pbiIKPiArc291cmNlICJwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvZmlybXdhcmUtZWxlLWlteC9Db25maWcuaW4iCj4gICBzb3VyY2UgInBhY2thZ2UvZnJl
ZXNjYWxlLWlteC9maXJtd2FyZS1pbXgvQ29uZmlnLmluIgo+ICAgc291cmNlICJwYWNrYWdlL2Zy
ZWVzY2FsZS1pbXgvaW14LXNjLWZpcm13YXJlL0NvbmZpZy5pbiIKPiAgIHNvdXJjZSAicGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2lteC1zZWNvL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvQ29uZmlnLmluIGIvcGFja2FnZS9mcmVl
c2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjc4NjdjMzcxMmM5Ywo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9Db25maWcuaW4KPiBA
QCAtMCwwICsxLDIxIEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GSVJNV0FSRV9FTEVfSU1YCj4g
Kwlib29sICJmaXJtd2FyZS1lbGUtaW14Igo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9GUkVF
U0NBTEVfSU1YX1BMQVRGT1JNX0lNWDkxIHx8IFwKPiArCQlCUjJfUEFDS0FHRV9GUkVFU0NBTEVf
SU1YX1BMQVRGT1JNX0lNWDkzCj4gKwloZWxwCj4gKwkgIEZpcm13YXJlIGJsb2JzIGZvciB0aGUg
RWRnZWxvY2sgU2VjdXJlIEVuY2xhdmUgKEVMRSkKCiAgRUxFLCBub3QgRUxTRT8gV2VpcmQuLi4K
Cj4gKwkgIHByZXNlbnQgb24gaS5NWDhVTFAgYW5kIGkuTVg5IFNvQ3MuCgogIEkgZ3Vlc3Mgd2Ug
c2ltcGx5IGRvbid0IGhhdmUgc3VwcG9ydCBmb3IgaS5NWDhVTFAgeWV0IGluIEJ1aWxkcm9vdD8K
CiAgUGVyaGFwcyBpdCdzIGJldHRlciB0byBjcmVhdGUgYSBCUjJfUEFDS0FHRV9GUkVFU0NBTEVf
SU1YX0hBU19FTEUgb3B0aW9uIGluIApmcmVlc2NhbGUtaW14L0NvbmZpZy5pbgoKPiArCj4gKwkg
IFRoaXMgbGlicmFyeSBpcyBwcm92aWRlZCBieSBOWFAgYXMtaXMgYW5kIGRvZXNuJ3QgaGF2ZSBh
bgo+ICsJICB1cHN0cmVhbS4KPiArCj4gK2lmIEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0VMRV9JTVgK
PiArCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GSVJNV0FSRV9FTEVfSU1YX0FIQUJfQ09OVEFJTkVS
X0lNQUdFCj4gKwlzdHJpbmcKPiArCWRlZmF1bHQgIm14OTNhMC1haGFiLWNvbnRhaW5lci5pbWci
IGlmIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTNBMAo+ICsJZGVmYXVs
dCAibXg5M2ExLWFoYWItY29udGFpbmVyLmltZyIgaWYgXAo+ICsJCUJSMl9QQUNLQUdFX0ZSRUVT
Q0FMRV9JTVhfUExBVEZPUk1fSU1YOTFBMSB8fCBcCgogIFNvIGkuTVg5MSB1c2VzIHRoZSBteDkz
IGltYWdlPyBXZWlyZC4uLgoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gKwkJQlIyX1BBQ0tBR0Vf
RlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5M0ExCj4gKwo+ICtlbmRpZiAjIEJSMl9QQUNLQUdF
X0ZJUk1XQVJFX0VMRV9JTVgKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zp
cm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoIGIvcGFja2FnZS9mcmVlc2NhbGUt
aW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU4NTY1Y2VmNDNlOQo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJtd2Fy
ZS1lbGUtaW14Lmhhc2gKPiBAQCAtMCwwICsxLDQgQEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
PiArc2hhMjU2ICA0YTA0NDAxNjhkOGRmYjk1OTg5YTE3YmU4ZmFmYjE0OTU4OWUxMTBlN2Q0NTE4
ZTVlOGEzMzQ2M2RmYjVlNWNhICBmaXJtd2FyZS1lbGUtaW14LTAuMS4wLmJpbgo+ICtzaGEyNTYg
IDI0ZDdjYjNhN2U1MTAxMTQ2NmExNDliZDk5YWNmODkzODdiODMyYmUyZDA4OTBjZTJlMTgzZGZi
YzlkN2NiODQgIENPUFlJTkcKPiArc2hhMjU2ICBjODAwYWFjYTNhN2U5ZjQ3MGQ5OWQ3Y2RlMGE0
OGM5NTk4MmVkNjAxZDRjMzA2ZjdiOGY0M2YzNzEwMDU0ZjI4ICBTQ1IudHh0Cj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1p
bXgubWsgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1l
bGUtaW14Lm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjYw
MGI1MGM1YjQ1Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgv
ZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1lbGUtaW14Lm1rCj4gQEAgLTAsMCArMSwyNyBAQAo+
ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgZmlybXdhcmUtZWxlLWlteAo+ICsj
Cj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtGSVJNV0FSRV9FTEVfSU1YX1ZFUlNJ
T04gPSAwLjEuMAo+ICtGSVJNV0FSRV9FTEVfSU1YX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lU
RSkKPiArRklSTVdBUkVfRUxFX0lNWF9TT1VSQ0UgPSBmaXJtd2FyZS1lbGUtaW14LSQoRklSTVdB
UkVfRUxFX0lNWF9WRVJTSU9OKS5iaW4KPiArCj4gK0ZJUk1XQVJFX0VMRV9JTVhfTElDRU5TRSA9
IE5YUCBTZW1pY29uZHVjdG9yIFNvZnR3YXJlIExpY2Vuc2UgQWdyZWVtZW50Cj4gK0ZJUk1XQVJF
X0VMRV9JTVhfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgU0NSLnR4dAo+ICtGSVJNV0FSRV9FTEVf
SU1YX1JFRElTVFJJQlVURSA9IE5PCj4gKwo+ICtGSVJNV0FSRV9FTEVfSU1YX0lOU1RBTExfSU1B
R0VTID0gWUVTCj4gKwo+ICtkZWZpbmUgRklSTVdBUkVfRUxFX0lNWF9FWFRSQUNUX0NNRFMKPiAr
CSQoY2FsbCBOWFBfRVhUUkFDVF9IRUxQRVIsJChGSVJNV0FSRV9FTEVfSU1YX0RMX0RJUikvJChG
SVJNV0FSRV9FTEVfSU1YX1NPVVJDRSkpCj4gK2VuZGVmCj4gKwo+ICtGSVJNV0FSRV9FTEVfSU1Y
X0FIQUJfQ09OVEFJTkVSX0lNQUdFID0gJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0ZJUk1X
QVJFX0VMRV9JTVhfQUhBQl9DT05UQUlORVJfSU1BR0UpKQo+ICsKPiArZGVmaW5lIEZJUk1XQVJF
X0VMRV9JTVhfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ICsJY3AgJChARCkvJChGSVJNV0FSRV9FTEVf
SU1YX0FIQUJfQ09OVEFJTkVSX0lNQUdFKSAkKEJJTkFSSUVTX0RJUikvYWhhYi1jb250YWluZXIu
aW1nCj4gK2VuZGVmCj4gKwo+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+IApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
