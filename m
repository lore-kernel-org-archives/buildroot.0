Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE11C4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7133740628;
	Mon, 12 Feb 2024 21:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1Bx6SL5d-qA; Mon, 12 Feb 2024 21:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A3D40218
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A3D40218;
	Mon, 12 Feb 2024 21:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CB84F1BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4D3B401EC
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:49:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CHfMm1dd7WW for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:49:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67C6940085
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67C6940085
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67C6940085
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:49:32 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-410ee8ed659so7602085e9.2
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 13:49:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707774570; x=1708379370;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9u3UTwTIsuvwFbS0Qt9T7ZgPQQdSZFkECZudvMkVnys=;
 b=u29c4WDL92WC/+VR5G7/GNsGPNG7UivW9/NHD4/bpAoQzbOYtXucw86lNugDoX5TjE
 XnEQzj+RxW/IVch+JGSXVmJ03ywsyXqc8vaAaQ+jL3X+eMgqmHuhq5rLjrChiaSAZQ0M
 Wjs5iSN2Y1TIOr25UW+3/hGSfI29q2aGrna0ZMYYBHlph6/+0q4exapZ6f/U2k3g+YHq
 E1UjDOaKJU2luUfYKPOK4C2X0n98T0Fv1BiHIxjz7OxtQ3JZRLpdZxHiqgkoLWmZj456
 hD/DG8Or0LSZfqlEQpJNMknmOJyhGB9Shsw0CN15laJKooQLvXJZFentV9/MCtYMAU7h
 DMgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjJhcdCZ+ORuDziYifQx0qCq6nOufA/E6SIBtaLIHnP7X9O1yo5jfI+Eqt71KoDfOQECDqYTpJPsbtTzRquBDQa5c/DBfR3w==
X-Gm-Message-State: AOJu0Yy13AtmrjOXrC8Xgbhk+7BSMoaL8S7yYxchVyCut28hh2bieHHS
 5m/AL+Tmr4UgbM4t6vAnx2yJf8qMFFDqBTIgw7NJCUVOArlUsrLQs7pHztK9hgg=
X-Google-Smtp-Source: AGHT+IFOlSRrbr0sXwEsIWvXfWjbmPOdAPLreqyaV5hRl2JgDBWd+4ggZQEUbptAOqY1JZO+bXxPtA==
X-Received: by 2002:a05:600c:450a:b0:411:a70e:3d20 with SMTP id
 t10-20020a05600c450a00b00411a70e3d20mr994989wmo.1.1707774570258; 
 Mon, 12 Feb 2024 13:49:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXB2Xi7eaAwecr8gzaclWRb7K//CesiquQOT10tF1C/sxJWSBBRbt2cHTFlaMPyl7Dp1KOF7D2m8XfE27ILEdTRPoIekNZCNyDq7DEHauKkaWWgsXhyUkBAGNPGTqUcGKu+HQ8AsGKPZBuU8Y3henBnpIUVwssHfGhYjzSNQ9HCriYYDrmOZMx+vNGOrPJ6BCcTJ/m4E7Sg08oj5ETtK7iZpcVntHxwCaOf3EfrnhwJgq6ds7NiA2OJeG/2GZXejKE=
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a05600c214100b00410395dc7d1sm9724751wml.7.2024.02.12.13.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 13:49:29 -0800 (PST)
Message-ID: <48843560-82c9-49c7-972f-e3032a4502b0@mind.be>
Date: Mon, 12 Feb 2024 22:49:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
 <20240115-imx93-support-v5-3-c2c950104c58@armadeus.com>
In-Reply-To: <20240115-imx93-support-v5-3-c2c950104c58@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707774570; x=1708379370; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9u3UTwTIsuvwFbS0Qt9T7ZgPQQdSZFkECZudvMkVnys=;
 b=FB6dilKMd+jv5BUlpui/Xb+kCNkLRmMBRyTxr36mSqyRIg93lQVon5fLzkN58SYrlO
 bIsv5zlf7ITc7/sTJZtCt7ZiAxJyBswYgDqULbeHHjuZ3XZXjpZTY58aBj7MdeoabEW8
 ioHw+FAK/x3n9DevIw1G/6HpmS6g1yleavCHjs2xoEPrsGS2iFFlGInmLBAl8PFhxsRJ
 1CfF5rIN+YV5+0fDPBSYcpvAkNHkPbK60d6EyvmR/Ca6tWv1pAOIrIX2P8UqApJNgPDz
 XjZP1X7uAx/lyld4WP6HuBnh3bXneFYZIQ/rGC81XkhS046DXwb963EZPxHyi07vzUhu
 3uMg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FB6dilKM
Subject: Re: [Buildroot] [PATCH v5 3/3] configs/freescale_imx93evk: new
 defconfig
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wMi8yMDI0IDEzOjU0LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBUaGlz
IHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgdGhlIE5YUCBpLk1YIDkzIDExeDExIEVWSyBib2FyZCBb
MV0uCj4gCj4gWzFdIGh0dHBzOi8vd3d3Lm54cC5jb20vZGVzaWduL2RldmVsb3BtZW50LWJvYXJk
cy9pLW14LWV2YWx1YXRpb24tYW5kLWRldmVsb3BtZW50LWJvYXJkcy9pLW14LTkzLWV2YWx1YXRp
b24ta2l0OmkuTVg5M0VWSwo+IAo+IFJldmlld2VkLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0Bm
cmVlLmZyPgo+IFRlc3RlZC1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiBbSnVs
aWVuOiB0ZXN0ZWQgb24gTlhQIGJvYXJkIGkuTVg5M0VWSywgY3B1IHJldiBBMSwgYm9hcmQgcmV2
IEJdCj4gUmV2aWV3ZWQtYnk6IEdhcnkgQmlzc29uIDxiaXNzb24uZ2FyeUBnbWFpbC5jb20+Cj4g
UmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3Rp
ZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGZvciB2NToKPiAgIC0g
Zm9sbG93IEJSIGNvZGluZyBzdHlsZSBmb3IgdGhlIGdlbmltYWdlLmNmZy50ZW1wbGF0ZV9pbXg5
IGZpbGUKPiAgICAgKEdpdWxpbyBCZW5ldHRpKQo+IAo+IENoYW5nZXMgZm9yIHY0Ogo+ICAgLSBO
b25lCj4gCj4gQ2hhbmdlcyBmb3IgdjM6Cj4gICAtIEJSMl9QQUNLQUdFX0ZJUk1XQVJFX1NFTlRJ
TkVMPXkgLT4gQlIyX1BBQ0tBR0VfRklSTVdBUkVfRUxFX0lNWD15Cj4gICAtIGFkZCBhIG5vdGUg
YWJvdXQgdGhlIGRlYnVnIFVBUlQgaW4gdGhlIHJlYWRtZS50eHQgZmlsZSAoSnVsaWVuIE9saXZh
aW4pCj4gICAtIGFkZCBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eSBhbmQKPiAgICAg
QlIyX1RBUkdFVF9VQk9PVF9ORUVEU19HTlVUTFM9eSB0byB0aGUgZGVmY29uZmlnIGZpbGUgKEp1
bGllbiBPbGl2YWluKQo+ICAgLSBidW1wIEFURiwgVS1Cb290IGFuZCBMaW51eCB0byBsYXRlc3Qg
TlhQIHJlbGVhc2UgbGYtNi4xLjU1LTIuMi4wCj4gICAgIChKdWxpZW4gT2xpdmFpbikKPiAKPiBD
aGFuZ2VzIGZvciB2MjoKPiAgIC0gbm9uZQo+IC0tLQo+ICAgLi4uL2NvbW1vbi9pbXgvZ2VuaW1h
Z2UuY2ZnLnRlbXBsYXRlX2lteDkgICAgICAgICAgfCA0MiArKysrKysrKysrKysKPiAgIC4uLi9j
b21tb24vaW14L2lteDktYm9vdGxvYWRlci1wcmVwYXJlLnNoICAgICAgICAgIHwgMzQgKysrKysr
KysrKwoKICBUaGlzIG5ldyBzY3JpcHQgaGFkIHNvbWUgc2hlbGxjaGVjayBlcnJvcnMuCgo+ICAg
Ym9hcmQvZnJlZXNjYWxlL2NvbW1vbi9pbXgvcG9zdC1pbWFnZS5zaCAgICAgICAgICAgfCAgNCAr
KwoKICBUaGlzIG9uZSBpbnRyb2R1Y2VkIHNvbWUgbmV3IHNoZWxsY2hlY2sgZXJyb3JzLgoKICBJ
IHB1c2hlZCBhbiBleHRyYSBjb21taXQgdGhhdCBmaXhlcyBhbGwgdGhlIHNoZWxsY2hlY2sgZXJy
b3JzIGJlZm9yZSB0aGlzIHBhdGNoLgoKPiAgIGJvYXJkL2ZyZWVzY2FsZS9pbXg5M2V2ay9yZWFk
bWUudHh0ICAgICAgICAgICAgICAgIHwgNzcgKysrKysrKysrKysrKysrKysrKysrKwo+ICAgY29u
Zmlncy9mcmVlc2NhbGVfaW14OTNldmtfZGVmY29uZmlnICAgICAgICAgICAgICAgfCAzOSArKysr
KysrKysrKwo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAxOTYgaW5zZXJ0aW9ucygrKQoKICBXZSBub3cg
c3VwcG9ydCBoYXNoIGZpbGVzIGZvciB0aGUgY3VzdG9tIGtlcm5lbCBldGMuIC0gdGhleSBhcmUg
b25seSB1c2VkIGlmIApCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXksIGJ1dCBpdCdz
IHN0aWxsIGdvb2QgdG8gaGF2ZSB0aGVtLiBTbyBJIGFkZGVkIAp0aG9zZS4KCgogIEFwcGxpZWQg
dG8gbWFzdGVyIHdpdGggdGhvc2UgY2hhbmdlcywgdGhhbmtzLgoKCiAgQ291bGQgeW91IHJlLXRl
c3QgdGhlIHNlcmllcyBqdXN0IHRvIGJlIHN1cmUgdGhhdCBJIGRpZG4ndCBkbyBhbnl0aGluZyBz
dHVwaWQ/CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgpbc25pcF0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
