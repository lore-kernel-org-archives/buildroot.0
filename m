Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAF2C4707C
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 15:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8BAE421BE;
	Wed, 10 Jan 2024 15:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8BAE421BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MorAYySwxuUl; Wed, 10 Jan 2024 15:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17CF8421F2;
	Wed, 10 Jan 2024 15:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17CF8421F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B3E71BF364
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40C96421F2
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 15:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40C96421F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4fjoUp2xNcQC for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 15:55:18 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50135421BE
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 15:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50135421BE
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40e43e48a16so40134145e9.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 07:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704902116; x=1705506916;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/moVqXXC38UeIqxt2XEz0xtSjsFdkwyLIwmzBm00U7k=;
 b=aOAhPuBqLr4cVCC20Ee6oMXCTTk6/WDfCEJFVZvUM/7tKnQZko1FRUs4WKq3eTRCHe
 Qw5EFdCcLgewgU86486sSzQ4CZR82LVXDumChAdWg5ptAoeMgDafV15YjeS4I7oTmghW
 +OQ/mqMj36snqrlkbApIwKKWMA/LQ1Tabgm8fEPHWQAb72JvB5eG2PiGssehGwdBP61S
 qn8mi/gtJ8NAMg16j4QO0lAlgAurWf2wWLPFBbnux72g9zIIaSkz6EZVg22qyrVYMisQ
 GGRxbrNhIULsCaGFpesjWoo4K7QW4gY0uOYwb9PvSxHbmNCtQYxslEiL3aiFqVaMTIHy
 x/sw==
X-Gm-Message-State: AOJu0YxLnN5z75bqKP5IclmIWnJLqZqR91JoCnpvoMAuiZRqYg//Csai
 5hvFMmEk1LDQdsUc/6gl1wuA0BHxB28wgg==
X-Google-Smtp-Source: AGHT+IEm1WE0hCPPnYDjjFWgcEqbNB38ZpSb7KanFsRL4Dnzl/6++x93D6Y/70W/9q28bn1aEVLepw==
X-Received: by 2002:a05:600c:4fc8:b0:40e:353c:8a5f with SMTP id
 o8-20020a05600c4fc800b0040e353c8a5fmr616334wmq.102.1704902116148; 
 Wed, 10 Jan 2024 07:55:16 -0800 (PST)
Received: from [10.5.2.57] (176-161-53-116.abo.bbox.fr. [176.161.53.116])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a05600c310b00b0040d5f466deesm2705295wmo.38.2024.01.10.07.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 07:55:15 -0800 (PST)
Message-ID: <b8371f73-1e2f-4020-bcdf-2d96c12c5c5b@smile.fr>
Date: Wed, 10 Jan 2024 16:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 buildroot@buildroot.org
References: <20240110152246.1605712-1-flavio.tapajos@newtesc.com.br>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240110152246.1605712-1-flavio.tapajos@newtesc.com.br>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704902116; x=1705506916;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/moVqXXC38UeIqxt2XEz0xtSjsFdkwyLIwmzBm00U7k=;
 b=Vf1h/y/Y39for7wF42t01dp27quQfzbVZwiXnJ5eYjbeTAWGSs/NmcwLoEGYildUTE
 3RuaT0AEX5j5NBDVo5NEkohaHJKXU2fbMZKG4scDYs2VpYiF7rtwLPAajhUcDn97tH2T
 ciyhGh/MZHdsIjn5KzSyMu7yVlk/R3A6OsZU5HkSq4XAEd+cXc2Gaf0VqPxocpOMpSu5
 2GYpWyoejm6ZtyYUQVc225awEPNWBFbNjHii1sFaL2eSCgJx4zcQVuEV1FbaQgi7ghzy
 otgcQfD/U6Qlxr/LnLUTiVwWXmxxzlz6CTwObjIgJjTyyMduUF0RPlvERAqocugt4RyZ
 8NLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Vf1h/y/Y
Subject: Re: [Buildroot] [PATCH 1/2] boot/uboot: bump to 2024.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAxMC8wMS8yMDI0IMOgIDE2OjIyLCBGbMOhdmlvIFRhcGFqw7NzIGEgw6ljcml0
wqA6Cj4gQWxsIGluLXRyZWUgY29uZmlncyB3aXRoIHRoZSB1Ym9vdCBib290bG9hZGVyIHVzZSBh
IGN1c3RvbSB2ZXJzaW9uLAo+IHNvIHRoaXMgcGF0Y2ggaXMgbW9zdGx5IGZvciB0aGUgbWVudWNv
bmZpZyBkZWZhdWx0IHVib290IHZlcnNpb24KPiAKCk5vdGljZSB3ZSBoYXZlIGEgdWJvb3QtdG9v
bHMgcGFja2FnZSB0aGF0IHdhcyBub3QgdXBkYXRlZCBzaW5jZSBhIHdoaWxlOgoKaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi9tYXN0ZXIvcGFja2FnZS91
Ym9vdC10b29scy91Ym9vdC10b29scy5taz9yZWZfdHlwZT1oZWFkcyNMNwoKSXQgd291bGQgYmUg
Z3JlYXQgaWYgeW91IGNhbiB1cGRhdGUgaXQgdG9vLgoKVGhhbmtzIQoKQmVzdCByZWdhcmRzLApS
b21haW4KCgo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9z
QG5ld3Rlc2MuY29tLmJyPgo+IC0tLQo+ICBib290L3Vib290L0NvbmZpZy5pbiAgfCA0ICsrLS0K
PiAgYm9vdC91Ym9vdC91Ym9vdC5oYXNoIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC91Ym9vdC9D
b25maWcuaW4gYi9ib290L3Vib290L0NvbmZpZy5pbgo+IGluZGV4IDIxZjE5ZGI4OTAuLmJlYWZi
Mzg5MzAgMTAwNjQ0Cj4gLS0tIGEvYm9vdC91Ym9vdC9Db25maWcuaW4KPiArKysgYi9ib290L3Vi
b290L0NvbmZpZy5pbgo+IEBAIC00MSw3ICs0MSw3IEBAIGNob2ljZQo+ICAJICBTZWxlY3QgdGhl
IHNwZWNpZmljIFUtQm9vdCB2ZXJzaW9uIHlvdSB3YW50IHRvIHVzZQo+ICAKPiAgY29uZmlnIEJS
Ml9UQVJHRVRfVUJPT1RfTEFURVNUX1ZFUlNJT04KPiAtCWJvb2wgIjIwMjIuMDQiCj4gKwlib29s
ICIyMDI0LjAxIgo+ICAKPiAgY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT04K
PiAgCWJvb2wgIkN1c3RvbSB2ZXJzaW9uIgo+IEBAIC04NSw3ICs4NSw3IEBAIGVuZGlmCj4gIAo+
ICBjb25maWcgQlIyX1RBUkdFVF9VQk9PVF9WRVJTSU9OCj4gIAlzdHJpbmcKPiAtCWRlZmF1bHQg
IjIwMjIuMDQiCWlmIEJSMl9UQVJHRVRfVUJPT1RfTEFURVNUX1ZFUlNJT04KPiArCWRlZmF1bHQg
IjIwMjQuMDEiCWlmIEJSMl9UQVJHRVRfVUJPT1RfTEFURVNUX1ZFUlNJT04KPiAgCWRlZmF1bHQg
QlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRSBcCj4gIAkJaWYgQlIyX1RBUkdF
VF9VQk9PVF9DVVNUT01fVkVSU0lPTgo+ICAJZGVmYXVsdCAiY3VzdG9tIglpZiBCUjJfVEFSR0VU
X1VCT09UX0NVU1RPTV9UQVJCQUxMCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3QuaGFz
aCBiL2Jvb3QvdWJvb3QvdWJvb3QuaGFzaAo+IGluZGV4IGE4YmQ4MTc5MDAuLmZiZTVkMjE1NDAg
MTAwNjQ0Cj4gLS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5oYXNoCj4gKysrIGIvYm9vdC91Ym9vdC91
Ym9vdC5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4gICMgTG9jYWxseSBjb21wdXRlZDoKPiAtc2hh
MjU2ICA2OGUwNjU0MTM5MjY3NzhlMjc2ZWMzYWJkMjhiYjMyZmE4MmFiYWE0YTY4OThkNTcwYzFm
NDhmYmRiMDhiY2QwICB1LWJvb3QtMjAyMi4wNC50YXIuYnoyCj4gK3NoYTI1NiAgYjk5NjExZjFl
ZDIzN2JmMzU0MWJkYzg0MzRiNjhjOTZhNmUwNTk2NzA2MWY5OTI0NDNjYjMwYWFiZWJlZjViMyAg
dS1ib290LTIwMjQuMDEudGFyLmJ6Mgo+ICBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYx
ODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIExpY2Vuc2VzL2dwbC0y
LjAudHh0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
