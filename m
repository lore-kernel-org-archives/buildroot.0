Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E030C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 20:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6C4C8228A;
	Tue, 13 Feb 2024 20:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjhAyLELPihH; Tue, 13 Feb 2024 20:23:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E52798228B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E52798228B;
	Tue, 13 Feb 2024 20:23:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 770CF1BF2AF
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 20:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6409C409C2
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 20:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDpFE-AlAPUz for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 20:23:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24B52408C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24B52408C6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24B52408C6
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 20:23:14 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d0512f6e32so67073561fa.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 12:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707855792; x=1708460592;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s3hSCXpMozlk01wDoB6sMnrOkT2MT9KFMuX4lfdLHMc=;
 b=OS/gbLnsG/CCy4zcwzVuBOpqHfG6vQzfjWTN6Y77Z4zbQuCsjX73fUiCbSl21mXtVr
 DCCmhjnycq16VNexlVeUvXt/vGlmTOIxiuIEFEvo45UbOQqdXY35zyogTMwO68S0Snqc
 ujBerjlt4vx5d+dOQYdNBuCR/Qe9THWfr173iftGXbkYglIDzY/HWuvH0qDFqrbJIiR1
 +z9AOASyXtNDu35Dm1kEaYuIfAnS5BVPedp9zqXoyQZybKOhzotzicQzbkJNsEiOfXpV
 Pgz572wzpFrbGyunkDazlSE6fNumL/sBfxVckctHIitPT9RUPWrEcOH7M3T/+D/cdVYV
 Ngpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX1vVsD5IdvanRQv+RPf85l0Xo17QLRc2t0165BK0EvlOZIam7uNsJDx5f1jcPAqBGLtnWIjKeqb3tM4A5IeoMOR0fU9LGxg==
X-Gm-Message-State: AOJu0Yyb8jzVc8jRzdPntvFc2pcjA7z2xTWcPbYJC4sfrGxbC/20XVOI
 EimIlNNnSRTQhiBlO7I3gXtwm1Oje/pkf1DnKaLseft3IFonelUay/KzoHZZL0E=
X-Google-Smtp-Source: AGHT+IH9xE9Org9gRBH9NiIjNzHJg7Jeti62aEsKAsflEE96cUT0Kuf48YlrUl+VM4g0g1c1wdMA7w==
X-Received: by 2002:a2e:8e6e:0:b0:2d0:dfae:1551 with SMTP id
 t14-20020a2e8e6e000000b002d0dfae1551mr468057ljk.17.1707855792201; 
 Tue, 13 Feb 2024 12:23:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVTOuGE5hAH3ANnYhWPdbVlA/U/yhuoplVK/sJAqlmwn6+xI0G9h3qDJewJ0tYP9StZTDtuwGnhFxnWNXS1PK5q8PRnTmI4xw==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b004110e8d605bsm5329040wmn.44.2024.02.13.12.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 12:23:11 -0800 (PST)
Message-ID: <4f0f43f7cba1c96f5ba3ba0a4c4e7299e916c2f3.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Tue, 13 Feb 2024 21:23:10 +0100
In-Reply-To: <20240213172817.2872849-15-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-15-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707855792; x=1708460592; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s3hSCXpMozlk01wDoB6sMnrOkT2MT9KFMuX4lfdLHMc=;
 b=NPAgaB/29GcGnduzz61DXT4I0n9PB/nSWzoNsuOwq2xolycsMXR9yPjdEmWNAYGJqe
 R+zLBXt1TZuvCcUYtYsfU4KX8nX5IjnnIp8bJywAEyhBq833PoQwVNlxiOPsCCafr0Z1
 IgzPOtzFg7skIXcn4SXBHGtRlrP651jtIn5x/C7n837oPvTPOjN1z8PETwMGnJNch0/D
 UEesmYIPZ3llmzh5Z8LrKpC/rT7feprr//Lvc6BJ/Z+zkNZaH/NuPLIkM2MTMIE2GBYd
 EnAx9sAnJit8B4SHctz1mQT74y1/aaIDjblcuydFis9w/ZpePBW+ymHdyux+Ppg7AyZA
 6v3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NPAgaB/2
Subject: Re: [Buildroot] [PATCH 14/21] boot/ti-k3-boot-firmware: add
 BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_J721E
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
dXIgd3JvdGU6Cj4gVGhlIGszIEo3MjFFIHN1cHBvcnQgaXMgbmVlZGVkIHRvIGJ1aWxkIGZvciBE
UkE4MjkvVERBNFZNIFNvQy4KPiAKPiBodHRwczovL3d3dy50aS5jb20vcHJvZHVjdC9UREE0Vk3C
oChTb0MpCj4gaHR0cHM6Ly93d3cudGkuY29tL3Rvb2wvUFJPQ0VTU09SLVNESy1KNzIxRcKgKFRJ
IFNESykKPiBodHRwczovL3d3dy50aS5jb20vdG9vbC9TSy1UREE0Vk3CoChUREE0Vk0gcHJvY2Vz
c29yIHN0YXJ0ZXIga2l0KQo+IGh0dHBzOi8vYmVhZ2xlYm9hcmQub3JnL2FpLTY0wqAoQmVhZ2xl
Qm9uZSBBSS02NCBTQkMpCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAc21pbGUuZnI+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFN2ZXJkbGluIDxhbGV4YW5k
ZXIuc3ZlcmRsaW5AZ21haWwuY29tPgoKPiAtLS0KPiDCoGJvb3QvdGktazMtYm9vdC1maXJtd2Fy
ZS9Db25maWcuaW4gfCA1ICsrKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtYm9vdC1maXJtd2FyZS9Db25maWcuaW4gYi9i
b290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmluCj4gaW5kZXggODM5MzY5OTk5OC4uYzlh
MDlkOGIxOSAxMDA2NDQKPiAtLS0gYS9ib290L3RpLWszLWJvb3QtZmlybXdhcmUvQ29uZmlnLmlu
Cj4gKysrIGIvYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0NvbmZpZy5pbgo+IEBAIC0yMiw2ICsy
Miw5IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfU09DX0FNNjRYCj4g
wqBjb25maWcgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX1NPQ19BTTY1WAo+IMKgCWJv
b2wgImFtNjV4Igo+IMKgCj4gK2NvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVf
U09DX0o3MjFFCj4gKwlib29sICJqNzIxZSIKPiArCj4gwqBlbmRjaG9pY2UKPiDCoAo+IMKgY29u
ZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9TT0MKPiBAQCAtMzAsMTIgKzMzLDE0
IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0JPT1RfRklSTVdBUkVfU09DCj4gwqAJZGVmYXVs
dCAiYW02MngiwqAgaWYgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX1NPQ19BTTYyWAo+
IMKgCWRlZmF1bHQgImFtNjR4IsKgIGlmIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9T
T0NfQU02NFgKPiDCoAlkZWZhdWx0ICJhbTY1eCLCoCBpZiBCUjJfVEFSR0VUX1RJX0szX0JPT1Rf
RklSTVdBUkVfU09DX0FNNjVYCj4gKwlkZWZhdWx0ICJqNzIxZSLCoCBpZiBCUjJfVEFSR0VUX1RJ
X0szX0JPT1RfRklSTVdBUkVfU09DX0o3MjFFCj4gwqAKPiDCoCMgT25seSBkZXZpY2VzIHdpdGgg
YSBzcGxpdCBmaXJtd2FyZSBib290IGZsb3cgcmVxdWlyZXMgYSBETSBmaXJtd2FyZSAoZWc6IGFt
NjIsIGo3MjFlKQo+IMKgY29uZmlnIEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRV9ETQo+
IMKgCXN0cmluZwo+IMKgCWRlZmF1bHQgImFtNjJheHgiIGlmIEJSMl9UQVJHRVRfVElfSzNfQk9P
VF9GSVJNV0FSRV9TT0NfQU02MkFYCj4gwqAJZGVmYXVsdCAiYW02Mnh4IsKgIGlmIEJSMl9UQVJH
RVRfVElfSzNfQk9PVF9GSVJNV0FSRV9TT0NfQU02MlgKPiArCWRlZmF1bHQgImo3MjFlIsKgwqAg
aWYgQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX1NPQ19KNzIxRQo+IMKgCWRlZmF1bHQg
IiIKPiDCoAo+IMKgZW5kaWYKCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
