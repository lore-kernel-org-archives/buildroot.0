Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEE5C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 21:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E24B84716;
	Wed,  3 Jul 2024 21:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Caq2vVMooiHp; Wed,  3 Jul 2024 21:17:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22EF784723
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22EF784723;
	Wed,  3 Jul 2024 21:17:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D616C1BF2C3
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 21:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C09F341B8C
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 21:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0hy7A0ONYCNw for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 21:17:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BF3040111
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BF3040111
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BF3040111
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 21:17:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-424a3ccd0c0so41744775e9.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 14:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720041431; x=1720646231;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tTq0PCWyJJ0yuZ55oHbCRJF3evr46kRtF2ZwvGEF0+0=;
 b=DkBG7d2igy2uCrcGE2oV4vuQffS59sQr4EMTKRhbm4XoTfFx5DCHi/VMSQI2SHCxKf
 GVwnfo9Be/EpUQQC4YNeHuFezlDvQ/T9gCOu5L/bRNfWk8M/Grhn1uz7obLbL4OmQtQr
 ffhL6eL5Sq73zZwE7i1i/14So7juegnUKpZk1V8rxdEgC62ms61d7jkGFFbmyUDL/Bp9
 HIQ+dHbXGIGdQHKiOmZ0GncLNxaNQd4/wpn4QAJjXV5jsWpq689DXZSd4tNlTjPoHIMX
 IpJ4yq6e62nVQTnqK98emy617f5Naqo0rPL/bM2X/Be0jrKISrzkTO5/BQWokyqxceiL
 gJqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA//4fgf5yK4GGdcFoixPN0MxFWCwIWiPYP36uNWpeOBD6Bb9S2rJ7raRdBi15OARowJzg5HO1dM0FyKHigyDeuKFIAKXkZQ==
X-Gm-Message-State: AOJu0YxPNp+7FHEvWxaNVOxAhBvhQ9+NeluaY6KeRIvaD9HAQlytspKn
 Rh1jrVzkkCBOr8ff95hXawORf7OJ7CsTX7vlBNoj0oUoH6trUiNIbq1l6TD6sDY=
X-Google-Smtp-Source: AGHT+IE+PI8nyy+ungNw1ak+/IjQ2IRfpC6tgRDH2jZNV0sOpNeei+OdDIh1d+LrWdBt28J3RCtZfQ==
X-Received: by 2002:a05:600c:491d:b0:425:6d66:e432 with SMTP id
 5b1f17b1804b1-4257a03a6c8mr84377505e9.22.1720041431141; 
 Wed, 03 Jul 2024 14:17:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b064f16sm251163455e9.27.2024.07.03.14.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 14:17:10 -0700 (PDT)
Message-ID: <48b46a80-aace-4720-9311-9acf8da2a5b9@smile.fr>
Date: Wed, 3 Jul 2024 23:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240703190316.970385-1-james.hilliard1@gmail.com>
Content-Language: fr, en-US
In-Reply-To: <20240703190316.970385-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720041431; x=1720646231; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tTq0PCWyJJ0yuZ55oHbCRJF3evr46kRtF2ZwvGEF0+0=;
 b=sBxMkQoklJ/CHJsiNUrXrrKmQW+BY1wDLJrdC8kbcRL9uDIjgPSi7ijOgSFJi5Can8
 frU3G9Tmy7R753yKRVl31gDtFUrNORh4jRW/8urY1DEIywbzD20RuZLiZ7aHt8XY0aXb
 ns7vbYjVfiAZcEDHhupGwAWZROWcrkLT2S2JY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=sBxMkQok
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: enable required oomd
 kernel options
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAwMy8wNy8yMDI0IMOgIDIxOjAzLCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IEluIG9yZGVyIGZvciBzeXN0ZW1kLW9vbWQgdG8gcnVuIENPTkZJR19QU0kgYW5k
IENPTkZJR19NRU1DRyBtdXN0IGJlCj4gZW5hYmxlZCBpbiB0aGUga2VybmVsIGNvbmZpZy4KCk1h
eWJlIGEgbGluayB0byB0aGUgdXBzdHJlYW0gZG9jdW1lbnRhdGlvbiB3b3VsZCBoZWxwIHRvIHJl
dmlldyB0aGlzIGNoYW5nZToKCmh0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29t
bWl0L2U3YjNmMWE2YzM1OGRkM2VhZjBiNTA1NDdiZDUyMTMwYWQ0MTI2YWUKCmh0dHBzOi8vZ2l0
aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29tbWl0L2FhMzI5Yjg5MjIzYTc5NzkzY2RlODI4OGIx
YmM2ZTkzZGIxNzQ5MzgKCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1r
IHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0
ZW1kLm1rCj4gaW5kZXggNmIzNTUzNzIzYy4uNTJmYTM0NDgwNyAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+ICsrKyBiL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1r
Cj4gQEAgLTQ4MCw2ICs0ODAsMTAgQEAgZW5kaWYKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9TWVNU
RU1EX09PTUQpLHkpCj4gIFNZU1RFTURfQ09ORl9PUFRTICs9IC1Eb29tZD10cnVlCj4gIFNZU1RF
TURfT09NRF9VU0VSID0gc3lzdGVtZC1vb20gLTEgc3lzdGVtZC1vb20gLTEgKiAtIC0gLSBzeXN0
ZW1kIFVzZXJzcGFjZSBPT00gS2lsbGVyCj4gK2RlZmluZSBTWVNURU1EX09PTURfTElOVVhfQ09O
RklHX0ZJWFVQUwoKRG9uJ3QgdXNlIF9MSU5VWF9DT05GSUdfRklYVVBTIGhlcmUgdG8gYXZvaWQg
YW55IGNvbmZ1c2lvbiB3aXRoClNZU1RFTURfTElOVVhfQ09ORklHX0ZJWFVQUy4gQWxzbyBfTElO
VVhfQ09ORklHX0ZJWFVQUyBzdWZmaXggY291bGQgYmUgaGFuZGxlZApieSB0aGUgZ2VuZXJpYyBw
YWNrYWdlIGluZnJhc3RydWN0dXJlIGlmIHN5c3RlbWQtb29tZCBwYWNrYWdlIGlzIGFkZGVkIGxh
dGVyIGJ5CnNvbWVvbmUuCgo+ICsJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfUFNJ
KQo+ICsJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTUVNQ0cpCj4gK2VuZGVmCj4g
IGVsc2UKPiAgU1lTVEVNRF9DT05GX09QVFMgKz0gLURvb21kPWZhbHNlCj4gIGVuZGlmCj4gQEAg
LTgwNCw2ICs4MDgsOCBAQCBkZWZpbmUgU1lTVEVNRF9MSU5VWF9DT05GSUdfRklYVVBTCj4gIAkk
KGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19BVVRPRlM0X0ZTKQo+ICAJJChjYWxsIEtD
T05GSUdfRU5BQkxFX09QVCxDT05GSUdfVE1QRlNfUE9TSVhfQUNMKQo+ICAJJChjYWxsIEtDT05G
SUdfRU5BQkxFX09QVCxDT05GSUdfVE1QRlNfWEFUVFIpCj4gKwoKSSdtIG5vdCBzdXJlIGFib3V0
IHRoaXMgbmV3IGxpbmUuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwkkKFNZU1RFTURfT09N
RF9MSU5VWF9DT05GSUdfRklYVVBTKQo+ICBlbmRlZgo+ICAKPiAgIyBXZSBuZWVkIGEgdmVyeSBt
aW5pbWFsIGhvc3QgdmFyaWFudCwgc28gd2UgZGlzYWJsZSBhcyBtdWNoIGFzIHBvc3NpYmxlLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
