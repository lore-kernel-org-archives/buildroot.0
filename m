Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA74C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 11:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF57540880;
	Wed, 14 Feb 2024 11:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omjbRnTVhKse; Wed, 14 Feb 2024 11:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA2B240893
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA2B240893;
	Wed, 14 Feb 2024 11:37:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E54EC1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E089B8234E
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wARietp-ga7B for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 11:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A568C8234D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A568C8234D
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A568C8234D
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 11:37:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so3740451f8f.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 03:37:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707910645; x=1708515445;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TCCgXL7FOwTJb4WZ7zqiWWh+fTJ2A2Grn18ndkX4zjY=;
 b=WNtfh8IsqeJRq3IkbXq7YWxhbrwWOsoJYgym8EdRmHrDk8CtFjRoTeKM0OGltX4dqJ
 khs5u4b65m3znKeR9tUI0XCySizCd3zDP+QxX4tL84j5Apltz4ZITYkwHFzNWMmh/ZA4
 fEaaxY1QTyfKVxk94pIEdJEdDHOg3PYF1H8YVshTl4DX5c+Nsvv+Vrgmq48m1GgMsIx4
 MQQLDio8bVhkUBf7uatY1Sif7JJVmFKrchKbdEM3rSykV3NjjX1EiGKB/MUAkyRCJFnN
 XJvdEAOr12k5IjIv8c2NshNVsNiSa2ge22aN8azywkbEwmVocLDdeJRY1OLAUg6fdJVG
 x55g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvZcbhpHZWXiITi8utxp+gCoFalF4EO0jrCkVY9K3HcvqqQb6x+ExCLukF6REytnlsfkvusFtf7L4FCNcAi2XmrbTHlPBxOg==
X-Gm-Message-State: AOJu0YyvbOUk4yaMrwRNcKpsChhKG6sXvkZuP3b1su0syK4tq6rXA/fG
 Mm6IZxZbjtgmnax26fcWs+XXBv+CbS0EFHE/5AQx4K2JQfUpvN2hcfMkw8BHrf8=
X-Google-Smtp-Source: AGHT+IG/XxRqz5dyFVaIAKexuHZq2m4rH2Wh0XU0YYYNIlvlZbnDTapuy0MYlyHoL4GhuxPiXOgGiw==
X-Received: by 2002:a5d:6ac5:0:b0:33a:e2d3:c3ec with SMTP id
 u5-20020a5d6ac5000000b0033ae2d3c3ecmr1607513wrw.60.1707910644608; 
 Wed, 14 Feb 2024 03:37:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWb8RKfkY3rgQLa3/YqUdE0YhDdDn/aqq1tAwjVklFZBKdU03gmWOxlMLG+ht/m+bLHWQVxBCZ7CH8af9PtAuZrxp2PDJs0hg==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 bs25-20020a056000071900b0033b406bc689sm12249310wrb.75.2024.02.14.03.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:37:24 -0800 (PST)
Message-ID: <c9fde48377fb4da7841d338088b675e1851ae098.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 12:37:23 +0100
In-Reply-To: <20240213172817.2872849-16-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-16-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707910645; x=1708515445; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TCCgXL7FOwTJb4WZ7zqiWWh+fTJ2A2Grn18ndkX4zjY=;
 b=j5LWnh/BAmL69aIDa74X+O/n/u0MK5NuIM8PI7brMfNCOh1RP3VTRPQaFkiM6gKjXK
 gf4tGYub6GF5LXTfBhESU2EYeeRcawWXFNLv4r6FSu3HRfld2m2Ch8pgXNw20LATjnY4
 cOmQu0Yua7caU4+xX6UDL0++9Ewly3m6QnZIauxpSKVK1CxPVCs4+AJgbhj5j4jMdxZG
 /jtr1akXccagFJ4QE8HpRJToDYpBk3gVkq9LpeTQdt9ZPUGCPdX3cQwhdt6EveVYrQgb
 sHs4v6hJHhffdOxi1nWJynTPMJYLyyNxMgCOiIu56fDYFcmT9VdwqsQ+Z6oL5c0C4KPl
 dGxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j5LWnh/B
Subject: Re: [Buildroot] [PATCH 15/21] boot/uboot: replace ti-k3-image-gen
 options by ti-k3-firmware options
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

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gdGktazMtaW1hZ2UtZ2VuIHRvb2wgaXMgZGVwcmVjYXRlZCBhbiByZXBsYWNl
ZCBieSBiaW5tYW4gWzFdLgo+IAo+IFVzZSB0aGUgbmV3bHkgaW50cm9kdWNlZCBCUjJfVEFSR0VU
X1RJX0szX0JPT1RfRklSTVdBUkVfU09DX3tBTTYyQVgsQU02Mlh9Lgo+IAo+IFsxXSBodHRwczov
L2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtdGkvY29tbWl0Lz9pZD04MzU4MTFjZjg1ODY5MjZj
Zjc4YTk2MWQwOTBmNGU2MTUwNDMyMjM1Cj4gCj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGlu
IDxhbGV4YW5kZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGJvb3QvdWJvb3QvQ29u
ZmlnLmluIHwgNiArKystLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvQ29uZmlnLmluIGIvYm9v
dC91Ym9vdC9Db25maWcuaW4KPiBpbmRleCA2MzM1OTI2NmM2Li43NTg2ZjI0YzkwIDEwMDY0NAo+
IC0tLSBhL2Jvb3QvdWJvb3QvQ29uZmlnLmluCj4gKysrIGIvYm9vdC91Ym9vdC9Db25maWcuaW4K
PiBAQCAtMjQyLDEwICsyNDIsMTAgQEAgY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfT1BU
RUVfVEVFCj4gwqAKPiDCoGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX05FRURTX1RJX0szX0RNCj4g
wqAJYm9vbCAiVS1Cb290IG5lZWRzIFRJIEszIERldmljZSBNYW5hZ2VyIChETSkiCj4gLQkjIFdl
IHVzZSB0aGUgU29DIHNlbGVjdGlvbiBkZWZpbmVkIGZvciB0aGUgdGktazMtaW1hZ2UtZ2VuCj4g
KwkjIFdlIHVzZSB0aGUgU29DIHNlbGVjdGlvbiBkZWZpbmVkIGZvciB0aGUgdGktazMtYm9vdC1m
aXJtd2FyZQo+IMKgCSMgcGFja2FnZQo+IC0JZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX0lN
QUdFX0dFTgo+IC0JZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0NfQU02
MkFYIHx8IEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQ19BTTYyWAo+ICsJZGVwZW5kcyBv
biBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkUKPiArCWRlcGVuZHMgb24gQlIyX1RBUkdF
VF9USV9LM19CT09UX0ZJUk1XQVJFX1NPQ19BTTYyQVggfHwgQlIyX1RBUkdFVF9USV9LM19CT09U
X0ZJUk1XQVJFX1NPQ19BTTYyWAo+IMKgCWhlbHAKPiDCoAnCoCBTb21lIFRJIEszIGRldmljZXMg
bmVlZCB0aGUgRGV2aWNlIE1hbmFnZXIgKERNKSBmaXJtd2FyZSB0bwo+IMKgCcKgIGJlIGF2YWls
YWJsZSBmb3IgdGhlIFUtQm9vdCBidWlsZC4KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
