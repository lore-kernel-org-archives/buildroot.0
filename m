Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3252C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B2D440D77;
	Fri, 12 Jul 2024 20:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2doh390KtwSF; Fri, 12 Jul 2024 20:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84975409E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84975409E0;
	Fri, 12 Jul 2024 20:02:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 787B81BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5B880EE9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:02:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kAsPW4QBETRA for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:02:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5FFFF80FAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FFFF80FAE
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FFFF80FAE
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:02:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42726d6eca5so17752185e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720814562; x=1721419362;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y4I+OUGOWvhan4J7cCwFTop0S5uThnssjilUmswKIS0=;
 b=PfR7DFz2wTj4ng/VClWpF3QZLkwklXeOrE+G0SevcSFSVhhergVSBwJfu++MnSVPZm
 5MmDWwaA326tmiSpgwEam0lszpc/dWG0TlLPBbGvGnQfdl3pRHzerZV9UCo85B3JkTJT
 E4R9MCFuokoDYes0U6KJkWt8/DX3LPnj6108Ig7XsaYM1UsZEljiOOtu6yzIT91mk1TU
 3uJgO0aDFQxXZfMJjAVR7aOBsjLMkz4UoXxWuBb4QpVZROC7Z7YHM3Etj1k70E65li4B
 PD0Rd1KYA7eWAKEAUTum9CKg3lZfbnDfFrlkqExDvTc0lesHfJHZI9RV6H8X4Ly3ADNw
 PIww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNV2RRwe8YynSf01p51o4+dbxzzRdx6JfhLLjCSzFUwGMimUJYvSn/WcPZ/3JuouK2Xxw8sdCueOatgJKj6WI2IVgFwpedIg==
X-Gm-Message-State: AOJu0YzCeUkid4I4UbMWu49nhkmmTsUPRKE5E35ecHI435DKX7xK9Wjv
 GYiG0NMasWW65EnXakixApBvF/z5YKQfgEJdIOPFrA269igbYU9S0puPyTELbZ+WoYYdfMN8Ibu
 h
X-Google-Smtp-Source: AGHT+IEwjur2ISRFnI086LhGFQZyf8pHEqXg0AFUbWpQoRmQHypacwlIlyNV3N4ykj3Dm8Uq7zX0ig==
X-Received: by 2002:a05:600c:2e14:b0:426:6573:7058 with SMTP id
 5b1f17b1804b1-426707cf7damr78917505e9.11.1720814562472; 
 Fri, 12 Jul 2024 13:02:42 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f239883sm32641275e9.10.2024.07.12.13.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:02:42 -0700 (PDT)
Message-ID: <27d84206-6f08-45e9-a5ee-c0f7710fb6d4@smile.fr>
Date: Fri, 12 Jul 2024 22:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240707162149.302187-1-dario.binacchi@amarulasolutions.com>
Content-Language: fr
In-Reply-To: <20240707162149.302187-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720814562; x=1721419362; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y4I+OUGOWvhan4J7cCwFTop0S5uThnssjilUmswKIS0=;
 b=PBgY5fLcF//vwOxwEqaOO4pB6U5DHpqhNl6IDMCsH7PwpXXS6bj7F8JM5x8uzK3llU
 sFXe38myDAyxTVjFMm/YWlaJ8PMuzh91nfPauhIZvBFi5OdWSRwWXPHDFB/oXcsTqmB3
 hAMZrTN8ufPH8qiwoXSRX4PL1ypdUstIh3x7U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=PBgY5fLc
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-tdfx:
 fix patch fuzz
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
Cc: linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwNy8wNy8yMDI0IMOgIDE4OjIxLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIHhkcml2ZXJfeGY4Ni12aWRl
by10ZGZ4IGZhaWxzIHRvIGJ1aWxkIHdpdGggb3V0cHV0Ogo+IAo+ICAgICBBcHBseWluZyAwMDAx
LWNyb3NzLnBhdGNoIHVzaW5nIHBhdGNoOgo+ICAgICBwYXRjaGluZyBmaWxlIGNvbmZpZ3VyZS5h
Ywo+ICAgICBIdW5rICMxIEZBSUxFRCBhdCA2Ny4KPiAgICAgMSBvdXQgb2YgMSBodW5rIEZBSUxF
RCAtLSBzYXZpbmcgcmVqZWN0cyB0byBmaWxlIGNvbmZpZ3VyZS5hYy5yZWoKPiAKPiBUaGlzIGNv
bW1pdCByZWZyZXNoZXMgdGhlIHBhY2thZ2UgcGF0Y2ggb24gdGhlIGN1cnJlbnQgcGFja2FnZSB2
ZXJzaW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2No
aUBhbWFydWxhc29sdXRpb25zLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgcGFja2FnZS94MTFyNy94ZHJpdmVy
X3hmODYtdmlkZW8tdGRmeC8wMDAxLWNyb3NzLnBhdGNoIHwgOCArKysrKy0tLQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvLmNoZWNrcGFja2FnZWlnbm9yZSBiLy5jaGVja3BhY2thZ2VpZ25vcmUKPiBpbmRleCAwYTFk
MjYyNzQ1NWUuLmUwYzQwNmU1NjU5MiAxMDA2NDQKPiAtLS0gYS8uY2hlY2twYWNrYWdlaWdub3Jl
Cj4gKysrIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+IEBAIC0xNTYwLDcgKzE1NjAsNyBAQCBwYWNr
YWdlL3gxMXI3L3hkcml2ZXJfeGY4Ni12aWRlby1pbXgvMDAwNS14Zjg2LXZpZGVvLWlteGZiLWZp
eC1tNC1oYXJkY29kZGVkLXBhdAo+ICBwYWNrYWdlL3gxMXI3L3hkcml2ZXJfeGY4Ni12aWRlby1p
bXgvMDAwNi14c2VydmVyLTEuMTQtY29tcGF0LnBhdGNoIGxpYl9wYXRjaC5VcHN0cmVhbQo+ICBw
YWNrYWdlL3gxMXI3L3hkcml2ZXJfeGY4Ni12aWRlby1tYWNoNjQvMDAwMS1jcm9zcy1jb21waWxl
LnBhdGNoIGxpYl9wYXRjaC5Tb2IgbGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UveDExcjcv
eGRyaXZlcl94Zjg2LXZpZGVvLW5vdXZlYXUvMDAwMS1ub3V2ZWF1LWZpeHVwLWRyaXZlci1mb3It
bmV3LVgtc2VydmVyLUFCSS5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAtcGFja2FnZS94MTFy
Ny94ZHJpdmVyX3hmODYtdmlkZW8tdGRmeC8wMDAxLWNyb3NzLnBhdGNoIGxpYl9wYXRjaC5Tb2Ig
bGliX3BhdGNoLlVwc3RyZWFtCj4gK3BhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZpZGVvLXRk
ZngvMDAwMS1jcm9zcy5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS94MTFyNy94
c2VydmVyX3hvcmctc2VydmVyLzAwMDEtaW5jbHVkZS1taXNjLmgtZml4LXVDbGliYy1idWlsZC5w
YXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS94MTFyNy94c2VydmVyX3hvcmctc2Vy
dmVyL1M0MHhvcmcgU2hlbGxjaGVjayBsaWJfc3lzdi5WYXJpYWJsZXMKPiAgcGFja2FnZS94MTF2
bmMvMDAwMS1GaXgtYnVpbGQtb24tMzJiaXQtYXJjaGVzLXdpdGgtNjRiaXQtdGltZV90LnBhdGNo
IGxpYl9wYXRjaC5VcHN0cmVhbQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3gxMXI3L3hkcml2ZXJf
eGY4Ni12aWRlby10ZGZ4LzAwMDEtY3Jvc3MucGF0Y2ggYi9wYWNrYWdlL3gxMXI3L3hkcml2ZXJf
eGY4Ni12aWRlby10ZGZ4LzAwMDEtY3Jvc3MucGF0Y2gKPiBpbmRleCBlNTM1OTFiYjBiYzIuLmY5
ODgwYWZiNTQ3OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3gxMXI3L3hkcml2ZXJfeGY4Ni12aWRl
by10ZGZ4LzAwMDEtY3Jvc3MucGF0Y2gKPiArKysgYi9wYWNrYWdlL3gxMXI3L3hkcml2ZXJfeGY4
Ni12aWRlby10ZGZ4LzAwMDEtY3Jvc3MucGF0Y2gKPiBAQCAtMSw4ICsxLDEwIEBACj4gK1tEYXJp
bzogbWFrZSB0aGUgcGF0Y2ggdG8gYmUgYXBwbGllZCB3aXRoIGZ1enogZmFjdG9yIDBdCj4gK1Np
Z25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRp
b25zLmNvbT4KPiAgLS0tIHhmODYtdmlkZW8tdGRmeC0xLjMuMC9jb25maWd1cmUuYWMub3JpZwky
MDA3LTA2LTEwIDIxOjAxOjU0LjAwMDAwMDAwMCArMDIwMAo+ICArKysgeGY4Ni12aWRlby10ZGZ4
LTEuMy4wL2NvbmZpZ3VyZS5hYwkyMDA3LTA2LTEwIDIxOjAyOjA2LjAwMDAwMDAwMCArMDIwMAo+
IC1AQCAtNjcsMTMgKzY3LDIwIEBACj4gLSAjIENoZWNrcyBmb3IgaGVhZGVyIGZpbGVzLgo+IC0g
QUNfSEVBREVSX1NUREMKPiArQEAgLTc1LDEzICs3NSwyMCBAQAo+ICsgCSAgICAgIFsjaW5jbHVk
ZSAieG9yZy1zZXJ2ZXIuaCJdKQo+ICsgQ1BQRkxBR1M9IiRTQVZFX0NQUEZMQUdTIgo+ICAgCj4g
IC1pZiB0ZXN0ICIkRFJJIiAhPSBubzsgdGhlbgo+ICAraWYgdGVzdCAieCREUkkiICE9IHhubzsg
dGhlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
