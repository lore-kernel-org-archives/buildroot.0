Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B927C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 17:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CFE640A3C;
	Sun,  6 Jul 2025 17:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvUKUhJ-uR8U; Sun,  6 Jul 2025 17:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 771B4409F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 771B4409F3;
	Sun,  6 Jul 2025 17:25:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 179EA15F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB8F60B4C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8vQqrz0_5qg for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 17:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 699BB607D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 699BB607D7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 699BB607D7
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:25:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so11441155e9.3
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 10:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751822734; x=1752427534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kKInBQQhGXjYOXS8gjfRBnl/2lWSFKOm7MzuUqoUCik=;
 b=m0j9XKrBFcnDOm3ufCMnv5nDvsViA9oPQoTkPy7mus9qw0m1Vh4kPcj0xuS10dz/mH
 cBvL4W0Uyk2va3NFn9b7QfntzNZQE2ykiRNzi9IGfviWqZmjCCIZAZcHwdAmp1onSe83
 rkRC1tX479velHHxAnlnS7Vhkt6781I3cyB3ZOsDjMAJoGrN+o2r6a3ZjF5LqelFyHXh
 ZRuO9Z/Aswtk/LJugW20XP7tUX6glqsJRiM1wOuBJBw4SYwv7k6Kaw2eo2kkHYl7yKUG
 4JHcOEfcz/AegspQtW8lKvCgLj6sMiLVPdRgmhnStvz5PwJwDQIFaVRI3eWYYZxUJGk5
 DKgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrGLtqaJe95L3nfIHFj4m+dFy4a2hkVo3TpNFlL++uulOnrwnh5qxDt0u8JoEUuQSWbSaM0GavWco=@buildroot.org
X-Gm-Message-State: AOJu0YxLYoQ6SnBXJcOC1mqvPtn5UQjmGguTnkL/HNtpScJ+jKN4JYAd
 m1tZihIFqUV698Ha1TQvqB0eS3PC1z9fmqQ4zl6nJDvbre15T/hXvBydmPxjEC7cBe6DY3df6Gn
 m0GyZ
X-Gm-Gg: ASbGncugvZ3J/ueTLTGKAc3MHbCsAkcD36eiLU8eoKPr2RyNRIUzi/kvFVUKJdUSpPg
 C4nBRSvnc/mZhRa98GzkK8G/f9Iea92C88fZXH9BJOopPDK22scundCmGBWhBHIDFy24kABbDwO
 BzGZLs6y+pTTteT/TCLKKfaDEGmfInL6QDye4ORz4dsXiW4E3OvFBjXpxtd9FOwfuBctfkD1RWo
 OpXE0gkj8KoSXZr1Nmn92J3GVolQ/WrK3ab+wf1rFO3DIcU6YsuuT4zgm0mJgog842SWk56Q/iu
 e0K2qaehQ/6lFchGRBPKZKn5vOuFcl9hE1OxjWtnNOPQYqkEuHSvGq4bCZSvYKq953dFhWZX1Oe
 cwFEsAaCN9H6i9+IjfjCst1Rnk5NLlnRggMfBaOtPcRmNEdbPaQ+F+qeoUFhZKQ2hVWuucEozEc
 XYSrfrmhFb0o4qZM/mYdqAHWKZ
X-Google-Smtp-Source: AGHT+IG5h6hfpo7x3opJe5FUFYBTGdIirNBSYPxdT/2TttQZ1gmWpWX633Ux8DP1UYXQdZhCxwJa1Q==
X-Received: by 2002:a05:600c:1c06:b0:450:d3b9:4ba4 with SMTP id
 5b1f17b1804b1-454b4e682ebmr90938665e9.2.1751822734024; 
 Sun, 06 Jul 2025 10:25:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b168673asm87636585e9.26.2025.07.06.10.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 10:25:33 -0700 (PDT)
Message-ID: <114724a9-5fc0-44c5-853e-4e28ce993b85@smile.fr>
Date: Sun, 6 Jul 2025 19:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Matt Silva <dev@matt-silva.com>, buildroot@buildroot.org
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
References: <20250706171350.1385564-1-dev@matt-silva.com>
Content-Language: fr, en-US
In-Reply-To: <20250706171350.1385564-1-dev@matt-silva.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751822734; x=1752427534; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kKInBQQhGXjYOXS8gjfRBnl/2lWSFKOm7MzuUqoUCik=;
 b=rVo+RicAl+cpKgHfeTge35ha8rXXtvcxqk9/M1YUk01/wVpJsYIYRh07QE0OIxeJh2
 UsNHdTEECVLrIn3xu/qZwTaN24u//VQmw8k80bCqfrq09ZWwqxTqE1+9iXXRcwQDV8ck
 Ioi40qzmKAHzG3scV/ZKnXhAmpfQAS/ULIBbg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=rVo+RicA
Subject: Re: [Buildroot] [PATCH 1/1] package/nilfs-utils: install to staging
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

SGVsbG8gTWF0dCwgQWxsLAoKTGUgMDYvMDcvMjAyNSDDoCAxOToxMywgTWF0dCBTaWx2YSBhIMOp
Y3JpdMKgOgo+IG5pbGZzLXV0aWxzIHByb3ZpZGVzIGFuICJuaWxmcy5oIiBoZWFkZXIgZmlsZSB0
aGF0IG90aGVyIHBhY2thZ2VzIHdoaWNoCj4gZGVwZW5kIHVwb24gaXQgbWF5IHJlcXVpcmUgaW4g
b3JkZXIgdG8gYnVpbGQuCgpuaWxmcy11dGlscyBhbHNvIGluc3RhbGwgYSBsaWJyYXJ5IGZpbGUg
KGxpYm5pbGZzLnNvKSBzbyBldmVuIHdpdGhvdXQgYSBwYWNrYWdlCmxpbmtpbmcgd2l0aCBpdCwg
TklMRlNfVVRJTFNfSU5TVEFMTF9TVEFHSU5HIHdhcyBkZWZpbml0aXZlbHkgbWlzc2luZy4KCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXR0IFNpbHZhIDxkZXZAbWF0dC1zaWx2YS5jb20+Cj4gLS0tCj4gQ3VycmVu
dGx5LCBubyBvdGhlciBwYWNrYWdlcyBkZXBlbmQgdXBvbiBuaWxmcy11dGlscy4gSG93ZXZlciwg
SSBhbSBpbgo+IHRoZSBwcm9jZXNzIG9mIGFkZGluZyBhIHBhY2thZ2UgZm9yIHBhcnRjbG9uZQo+
IChnaXRodWIuY29tL1Rob21hcy1Uc2FpL3BhcnRjbG9uZSkgdGhhdCBkZXBlbmRzIHVwb24gdGhp
cyBmaXguCj4gCj4gIHBhY2thZ2UvbmlsZnMtdXRpbHMvbmlsZnMtdXRpbHMubWsgfCAxICsKPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bmlsZnMtdXRpbHMvbmlsZnMtdXRpbHMubWsgYi9wYWNrYWdlL25pbGZzLXV0aWxzL25pbGZzLXV0
aWxzLm1rCj4gaW5kZXggMWM4YjdlMjQ1Yy4uYTZhZDI5NTNlMCAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL25pbGZzLXV0aWxzL25pbGZzLXV0aWxzLm1rCj4gKysrIGIvcGFja2FnZS9uaWxmcy11dGls
cy9uaWxmcy11dGlscy5tawo+IEBAIC05LDYgKzksNyBAQCBOSUxGU19VVElMU19TT1VSQ0UgPSBu
aWxmcy11dGlscy0kKE5JTEZTX1VUSUxTX1ZFUlNJT04pLnRhci5iejIKPiAgTklMRlNfVVRJTFNf
U0lURSA9IGh0dHBzOi8vbmlsZnMuc291cmNlZm9yZ2UuaW8vZG93bmxvYWQKPiAgTklMRlNfVVRJ
TFNfTElDRU5TRSA9IEdQTC0yLjArIChwcm9ncmFtcyksIExHUEwtMi4xKyAobGlicmFyaWVzKQo+
ICBOSUxGU19VVElMU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICtOSUxGU19VVElMU19JTlNU
QUxMX1NUQUdJTkcgPSBZRVMKPiAgCj4gICMgbmVlZCBsaWJ1dWlkLCBsaWJibGtpZCwgbGlibW91
bnQKPiAgTklMRlNfVVRJTFNfREVQRU5ERU5DSUVTID0gdXRpbC1saW51eAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
