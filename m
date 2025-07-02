Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E3BC8303C
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 21:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EF18612F1;
	Wed,  2 Jul 2025 21:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdtE_lu7Dw5j; Wed,  2 Jul 2025 21:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BB93612EB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BB93612EB;
	Wed,  2 Jul 2025 21:40:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 844C9128
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75DF540A62
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdhPADv8W3kF for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 21:40:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6A5CF40A59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A5CF40A59
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A5CF40A59
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 21:40:47 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so61957805e9.0
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 14:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751492445; x=1752097245;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlWqdUQoYY35Rh74RCKJVDoq0TuP2i+Lc7EegOxSdH4=;
 b=ptPxjNDV3DMwmSkgO/ZAY75F1jxMzE+nAVOnyFiVbSIFWNU97i3qTNN35h2FLSLRWh
 I5nmeb583TPUyTZXItCP+JXCqlOu5EXiK8q8dYWWwbancWjSw/4V4sOnb+tc6bv0vsD1
 Ngc2H/pN0TPiELlJZLAnItFXDq5PZ/QBNlvf74lIFdENVRpE25y1DPHB/5m0ef8vndT8
 d6aPQcX76q2t84NwRusGOqu29LZ/+ANQ2yXhK6Dj2ioZIUDEsChHEcSnM3rFPS06Li6z
 lYtl/L7r1GcBzgWa2L0Gvllptr4IjhNfUBX+NNTdT2yGAGcJJzyHjicWlenFpvuNXFtR
 MR3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIFEZF/ib1c4dMnlXKnxK4Zr4M9tcAq3NwlfptGVzoDV0G7ekL6VlNdIRXutJAhEFBYv8yqV8cDGw=@buildroot.org
X-Gm-Message-State: AOJu0YxjjR5tVrUvPeyft4med2aX0IsBaHvS1WLhmRar2Ex4LnHha0Mq
 BofTBnZR1si+NPVKlKtZM+D5JhtVBXAH9Z83CbQoy8tzuzOScrQxhenMqedZ5txw60k=
X-Gm-Gg: ASbGncvkZmfqF9RiGzxeBYSU3wpwFn3KxRw6PksbqTvlnkGWGLh/VVYu3/VedGAReQZ
 t3ozZZdetcHb8VYN05aWutCDMDJBgbYO23QbOg107ScZMYikDXOZM710iySB/eV1sabShTmZ7XV
 xIJsMcbG3MYm+77EGyC04f9l6tmR2X3stRMdeQX844MaEXvgMogBgn7xWaFGg36t5sGZ3O3Gqm3
 dbHzb/TbX1T+cWrC9HjZ5jIo4Yr7Txfsw8kK4POzMigcK2gJ5gkn8Alm7Vq//iEVmJO/4e4/6rr
 bXyroQrXK/Yu7PLYFkxo8KYoeg1ANpi0LBZ0hKQ0bCUYy6kfuI45EPQgMEQdgp35LmuFE3igevi
 3xYdcDroH/SB8c798IvD/nJ/nPywOm/3sEBTSGkyKVJHYTuPiBi0B8Y6Mx5CAhyKGQ5CD7EwFKa
 6yjR8OLr4zQ1KYlP6ii3QPmoP4
X-Google-Smtp-Source: AGHT+IGZOG1r8+Ea78AaKR9E2oAztLZlM01eISpvkMGgQLmLKhhqjv8LaCH8aJ0VKhTdj/F0bfkfgw==
X-Received: by 2002:a05:600c:c109:b0:441:a715:664a with SMTP id
 5b1f17b1804b1-454a3a4b4c1mr29494885e9.20.1751492445223; 
 Wed, 02 Jul 2025 14:40:45 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9969f2asm8878205e9.8.2025.07.02.14.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 14:40:44 -0700 (PDT)
Message-ID: <7c6cfb4a-4caf-48fd-a327-a74dbef6e8be@smile.fr>
Date: Wed, 2 Jul 2025 23:40:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-2-alex.bennee@linaro.org>
Content-Language: fr, en-US
In-Reply-To: <20250626111642.228223-2-alex.bennee@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751492445; x=1752097245; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WlWqdUQoYY35Rh74RCKJVDoq0TuP2i+Lc7EegOxSdH4=;
 b=Nxb7fV3dMfgGHv3zhajtCaAEivypyTS8pTXhWUBAO5Zcdky4u/NsZPgHr+eob/gQGf
 VZGmg/FOdolIQjctMZqVmhWEPOuPw0xy4dG9j+dIl9iCmDXs4RxKFTpNVPU1Tjjz0QJI
 LGCsxjz0d58omb3TA7keeYgWY2PwPElT+K/2s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Nxb7fV3d
Subject: Re: [Buildroot] [RFC PATCH 1/3] package/llvm-project: use ninja to
 build llvm libs
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

SGVsbG8gQWxleCwgQWxsLAoKTGUgMjYvMDYvMjAyNSDDoCAxMzoxNiwgQWxleCBCZW5uw6llIGEg
w6ljcml0wqA6Cj4gVXNpbmcgbmluamEgaXMgcmVjb21tZW5kZWQgYXMgaXQgaXMgZmFzdGVyIHRo
YW4gdGhlIGRlZmF1bHQgR05VIG1ha2UKPiBidWlsZCBtZXRob2QuIE1ha2UgdGhlIHN3aXRjaC4K
Ck5pbmphIGlzIHVzdWFsbHkgZmFzdGVyIGZvciBpbmNyZW1lbnRhbCBidWlsZHMgKGZvciBsbHZt
IGRldmVsb3BlcnMgWzFdKSBidXQKc2luY2Ugd2UgdXN1YWxseSB1c2UgQnVpbGRyb290IGZvciBi
dWlsZGluZyB0YXJnZXQgaW1hZ2VzIGZyb20gc291cmNlcyBuaW5qYSBtYXkKbm90IHJlYWxseSBm
YXN0ZXIgdGhhbiBNYWtlLgoKU2luY2Ugd2UgYWRkIGhvc3QtbmluamEgaW4gdGhlIGRlcGVuZGVu
Y2llcywgaXMgcmVhbGx5IGZhc3RlciBpbiB0aGUgZW5kPwpOb3RlOiBvbiBzb21lIGJ1aWxkIG1h
Y2hpbmUgd2l0aCBhIHJlY2VudCBlbm91Z2ggY21ha2UgdG9vbCwgdGhlIGhvc3QtY21ha2UgaXMK
bm90IHVzZWQuCgpbMV0gaHR0cHM6Ly9sbHZtLm9yZy9kb2NzL0dldHRpbmdTdGFydGVkLmh0bWwK
Cj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3Jn
Pgo+IC0tLQo+ICBwYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsgfCAxMCArKysrKyst
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayBiL3BhY2th
Z2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawo+IGluZGV4IDc1NTJlMzU5MGMuLjhmZTdkMTBm
ZTAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rCj4gKysr
IGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rCj4gQEAgLTEzLDggKzEzLDEwIEBA
IExMVk1fQ1BFX0lEX1ZFTkRPUiA9IGxsdm0KPiAgTExWTV9TVVBQT1JUU19JTl9TT1VSQ0VfQlVJ
TEQgPSBOTwo+ICBMTFZNX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICAKPiAtSE9TVF9MTFZNX0RF
UEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9uMyBob3N0LWxsdm0tY21ha2UKPiAtTExWTV9ERVBFTkRF
TkNJRVMgPSBob3N0LWxsdm0KPiArSE9TVF9MTFZNX0RFUEVOREVOQ0lFUyA9IGhvc3QtcHl0aG9u
MyBob3N0LWxsdm0tY21ha2UgaG9zdC1uaW5qYQo+ICtMTFZNX0RFUEVOREVOQ0lFUyA9IGhvc3Qt
bGx2bSBob3N0LW5pbmphCj4gKwo+ICtMTFZNX0NNQUtFX0JBQ0tFTkQgPSBuaW5qYQoKV2hhdCBh
Ym91dCBvdGhlciBsbHZtLXByb2plY3QgcmVsYXRlZCBwYWNrYWdlIHN1Y2ggQ2xhbmc/CgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gIAo+ICAjIFBhdGggdG8gY21ha2UgbW9kdWxlcyBmcm9tIGhv
c3QtbGx2bS1jbWFrZQo+ICBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfTU9EVUxFX1BB
VEg9JChIT1NUX0RJUikvbGliL2NtYWtlL2xsdm0KPiBAQCAtMTY2LDggKzE2OCw4IEBAIExMVk1f
Q09ORl9PUFRTICs9IC1ETExWTV9IQVZFX1RGTElURT0iIgo+ICAjIERlZmF1bHQgaXMgRGVidWcg
YnVpbGQsIHdoaWNoIHJlcXVpcmVzIGNvbnNpZGVyYWJseSBtb3JlIGRpc2sgc3BhY2UgYW5kCj4g
ICMgYnVpbGQgdGltZS4gUmVsZWFzZSBidWlsZCBpcyBzZWxlY3RlZCBmb3IgaG9zdCBhbmQgdGFy
Z2V0IGJlY2F1c2UgdGhlIGxpbmtlcgo+ICAjIGNhbiBydW4gb3V0IG9mIG1lbW9yeSBpbiBEZWJ1
ZyBtb2RlLgo+IC1IT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxl
YXNlCj4gLUxMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlCj4gK0hP
U1RfTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgLUcgTmluamEK
PiArTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgLUcgTmluamEK
PiAgCj4gICMgQ29tcGlsZSBsbHZtIHdpdGggdGhlIEMrKzE0IChJU08gQysrIDIwMTQgc3RhbmRh
cmQpLgo+ICBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX1NUQU5EQVJEPTE0Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
