Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DF7C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 19:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5484B419C8;
	Fri, 10 Nov 2023 19:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5484B419C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n-5iXHpm07RC; Fri, 10 Nov 2023 19:28:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53A36419C4;
	Fri, 10 Nov 2023 19:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53A36419C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 32C2F1BF2F6
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 19:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 183D260F94
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 19:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 183D260F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fH7aQeSo6TmZ for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 19:28:11 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F05FF60BBC
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 19:28:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F05FF60BBC
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5446c9f3a77so4043066a12.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 11:28:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699644489; x=1700249289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RzHD641ZLLhfaCkUFkUZA92oEEBGg4bAuqi/mv3Xmxg=;
 b=LsIa1MBU0JLEbOsC//PUhPACDhQYdFOjfyh6gDZ9rmyaATFqfd3f0jW0Yaqk1jt266
 MxoSiisOClnTakY26rVxD6s0Wb/Sx0PPlGXsTkj+xdGasP6vw4uMnp4qz+gzmhZVNoD1
 gN7nHwCq94UZoI8FyRwxOPUTJsYFimRKJYLdG4peC9btIspiCSLJRaXSaZXYefiozfsk
 jF8W3tHLHVWf/vYb6CKbn9iDvDvlEK7fnu3EyUZYQVaR4wxDcWCBtgaVgN8zMU56GNI6
 muFrI28CaE0wTrxA/tw0egaFTdg3td4KRtSOz56ejNorVhsQ6iZp0GzQGwZpESJn4eSp
 gWWg==
X-Gm-Message-State: AOJu0YzcO71eyWv0CdxVmN4BXc1VLkSTgzAZevWsURzZjGNUCTToJ1El
 NmOXZXwzvgG5ep5Xfsyz124nl2p3v/h/q8QICgI=
X-Google-Smtp-Source: AGHT+IGXNijRDde0lE2PyJMUAg1rcB1BGVPxAkKSxMaicUot+JZzbSX5DiZLdICTGrsJAYiLK9CkqQ==
X-Received: by 2002:aa7:db4d:0:b0:543:90d4:6132 with SMTP id
 n13-20020aa7db4d000000b0054390d46132mr205258edt.16.1699644488517; 
 Fri, 10 Nov 2023 11:28:08 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a50d0c9000000b005432f45bee9sm1510029edf.19.2023.11.10.11.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 11:28:07 -0800 (PST)
Message-ID: <c394918d-edcc-4d52-9a0d-727ece0cd394@mind.be>
Date: Fri, 10 Nov 2023 20:28:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Christian Stewart <christian@aperture.us>,
 =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
References: <20231110104504.2340403-1-jonhenrik@qbee.io>
 <CA+h8R2q=+SNv+2bu2+WR1NbfZ20hD09+eCntZoETnWiDgk-xgg@mail.gmail.com>
In-Reply-To: <CA+h8R2q=+SNv+2bu2+WR1NbfZ20hD09+eCntZoETnWiDgk-xgg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699644489; x=1700249289; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RzHD641ZLLhfaCkUFkUZA92oEEBGg4bAuqi/mv3Xmxg=;
 b=CnEzuE1lJ5sm1Cj1PATry8qUFFBn/SEiQM2oEM6Jyyo0gEQ868swNnq2gph1RIQyo+
 WybxbQamkp2DurfjC7btcpd69XNPDQMOU5NEdLMZphhA1pxumsqHsyt1y71l2rYI/PV7
 mSCbwgWiyFnjerqa0HgClVnKmBrqvwxLRhNK/VGrQIkRE4WzgTQJ3KNq/Uvj6eDWnXB7
 U+J9fjCVchFdQGsnBbYCUn/hMoiACFERKqpn7Rx7dUtCoENxuUIodhTTpQKoJISfu6AT
 xzt/kzCBqInK6PHrxHG7Cgi8lw/qPMrnbY4pLCW+shYREWL0jzkiSdW71KnLi8mpro1h
 p+5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CnEzuE1l
Subject: Re: [Buildroot] [PATCH 1/1] package/qbee-agent: new package
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
Cc: Anisse Astier <anisse@astier.eu>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMC8xMS8yMDIzIDE4OjE0LCBDaHJpc3RpYW4gU3Rld2FydCB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEhpIGFsbCwKPiAKPiAKPiBPbiBGcmksIE5vdiAxMCwgMjAyMywgMjo0NeKAr0FNIEpv
biBIZW5yaWsgQmrDuHJuc3RhZCA8am9uaGVucmlrQHFiZWUuaW8gCj4gPG1haWx0bzpqb25oZW5y
aWtAcWJlZS5pbz4+IHdyb3RlOgo+IAo+ICAgICBUaGlzIHBhdGNoIGFkZCBxYmVlLWFnZW50LCBh
biBvcGVuIHNvdXJjZSBkZXZpY2UgbWFuYWdlbWVudCBzb2Z0d2FyZQo+ICAgICBmb3IgTGludXgg
ZGV2aWNlcy4KPiAKPiAKPiBBcmUgdGhlcmUgYW55IGJ1aWxkcm9vdCB1c2VycyB0b2RheSB3aG8g
d291bGQgd2FudCB0byBpbnN0YWxsIHRoaXMgcGFja2FnZSB3aXRoIAo+IGl0J3MgcHJvcHJpZXRh
cnkgYmFja2VuZCBpbmRlcGVuZGVudGx5IG9mIHVzaW5nIHRoZSBwcm9wcmlldGFyeSBiYWNrZW5k
Pwo+IAo+IFdobyBob2xkcyB0aGUgcHJpdmF0ZSBrZXkgZm9yIHRoYXQgcHVibGljIGtleSBhbmQg
d2hhdCBjYW4gdGhleSB0aGVuIGRvIHdpdGggbXkgCj4gZGV2aWNlIGlmIEkgY2hvc2UgdG8gaW5z
dGFsbCB0aGlzIHBhY2thZ2U/Cj4gCj4gVGhpcyBzZWVtcyBsaWtlIGEgY2FzZSB3aGVyZSwgaWYg
SSB3YXMgYWRkaW5nIHRoaXMgcGFja2FnZSBmb3IgYSBwcm9wcmlldGFyeSAKPiBzZXJ2aWNlLCBJ
IHdvdWxkIGluc3RlYWQgb3B0IHRvIHVzZSBhIEJ1aWxkcm9vdCBFeHRlcm5hbCBQYWNrYWdlIGZv
ciB0aGUgcmVhc29ucyAKPiBzdGF0ZWQgYWJvdmU6Cj4gCj4gaHR0cHM6Ly9idWlsZHJvb3Qub3Jn
L2Rvd25sb2Fkcy9tYW51YWwvY3VzdG9taXplLW91dHNpZGUtYnIudHh0IAo+IDxodHRwczovL2J1
aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9jdXN0b21pemUtb3V0c2lkZS1ici50eHQ+Cj4g
Cj4gSW5kZWVkOiB0aGVyZSBhcmUgbWFueSBjYXNlcyBsaWtlIHRoaXMgb25lIHdoZXJlIEknbGwg
bWFpbnRhaW4gYW4gZXh0ZXJuYWwgCj4gYnVpbGRyb290IGV4dGVuc2lvbnMgdHJlZSBiZWNhdXNl
IHRoZSBwYWNrYWdlcyBhcmUgbm90IGZ1bGx5IG9wZW4gc291cmNlIAo+IChiYWNrZW5kIGFuZCBm
cm9udGVuZCkgYW5kIHRoZXJlZm9yZSBwcm9iYWJseSBub3Qgb2YgaW50ZXJlc3QgdG8gdGhlIG1h
aW4gCj4gYnVpbGRyb290IHVzZXIgYmFzZS4KCiAgSSBkb24ndCB0aGluayAib3BlbiBzb3VyY2Ug
YWdlbnQgZm9yIGEgY2xvc2VkLXNvdXJjZSBiYWNrZW5kIiBtZWFucyB0aGF0IHdlIApkb24ndCB3
YW50IHRvIGNhcnJ5IGl0IGluIGJ1aWxkcm9vdC4gSW4gZmFjdCwgd2UgaGF2ZSBhdCBsZWFzdCBv
bmUgb2YgdGhvc2UgCmFscmVhZHk6IGF6dXJlLWlvdC1zZGstYy4gSSdtIHN1cmUgdGhlcmUgYXJl
IG90aGVycy4KCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEZvciBhIGNvdW50ZXIgZXhhbXBs
ZSB0byB0aGlzIHNlZSBNZW5kZXIgYW5kIEJhbGVuYSBFbmdpbmUuCj4gCj4gVGhhbmtzLAo+IENo
cmlzdGlhbiBTdGV3YXJ0Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
