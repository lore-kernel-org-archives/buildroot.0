Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A11DC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 08:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F14EA605BA;
	Mon, 15 Jul 2024 08:19:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYaeiO9IO5ww; Mon, 15 Jul 2024 08:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C4A60610
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C4A60610;
	Mon, 15 Jul 2024 08:19:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0B61BF421
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 088DD40500
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 08:19:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gc4CLUuTj_dh for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 08:19:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D119E403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D119E403A7
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D119E403A7
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 08:19:33 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2eedeca1c79so21415551fa.3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 01:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721031571; x=1721636371;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IvqqwxaFpa40nnaIipaKA16hBoltyaMQex+sCYW/9zM=;
 b=m2CCadb0ZobKC4qQYmw0zoItkPR5dVcGvd4nOo7TiPbKQVVFbgak7b3shBvaxbpC0n
 U2tushL9Of/1lMVJC/euL8832D2G6OJbM3RPLsMEPk1uFlyxreS1WuPn32oSpz6o0+eK
 1halyQ97xTud0tUI70RLlYEQ6mGudCqrI+AlQ/xNSEMFXJIfNnhWngQBKj7ZNIsRr0pY
 e8HiljRxioCUwmczMi15agyfCGqud+kLm6Qww/2/nK8r7g6DbOsH/veY+vaghJ+bKNLM
 WP31eE+Vgd2XW0fe+BvHUdFYXMsu20i8RT7rdKpQDzrKeEn92F3tVurxqnR6CxpC8SCK
 8DOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk0dy9UBOScVvAqwLYa6VLRPGo8Ssi565ZyVqhlHXPFaZc8mh2ruTjrhVTR3mCvNAdCVz0yXb2Fr6/T2Mcy7pk20S9K1Sx0A==
X-Gm-Message-State: AOJu0Ywon3Z3M9JJ/W8SwwKnyI3ALuhoRv6pX7+SBolulLP/LWwYKfad
 Vix6f0xw7L87kh8Qf+1tlSCuK+oXHhJB1RAD17tSwN0dI5L5gLnNcJ8xkJNXJWsy1LTaBnINLIR
 /M78=
X-Google-Smtp-Source: AGHT+IHzS0uahJSnDVSEX2KgsWX4taBmpxCAJ0uwfVzIW3DvtYlrxgQSYUz/v/E6l69T+ulZfaNYtg==
X-Received: by 2002:a2e:7d11:0:b0:2ec:57c7:c737 with SMTP id
 38308e7fff4ca-2eeb3181c64mr123642511fa.40.1721031571337; 
 Mon, 15 Jul 2024 01:19:31 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafbb77sm5667774f8f.72.2024.07.15.01.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:19:30 -0700 (PDT)
Message-ID: <0def5f41-2ecb-4134-b5a5-952b711d30c9@mind.be>
Date: Mon, 15 Jul 2024 10:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?SmFuIMSMZXJtw6Fr?= <sairon@sairon.cz>, buildroot@buildroot.org
References: <20240426085733.2573659-1-sairon@sairon.cz>
Content-Language: en-GB
In-Reply-To: <20240426085733.2573659-1-sairon@sairon.cz>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721031571; x=1721636371; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IvqqwxaFpa40nnaIipaKA16hBoltyaMQex+sCYW/9zM=;
 b=X5TpNQiuB1ieN0KAtvRDhZOh2tLd5mLq22fooAZTLgeyyl58eGo6tZb0KZo0ayDTo5
 cV9V44PErVQCIAqt/sytKUZAdgqFufJq4j8oD4tnm8UAjlnhMeke486s8RY2A87XacO/
 cB7Ec/iahtBaH+I4TldXufB7ejO8DTxD3PgCEbaHdrIkzGmK6HyUUj3hpMmmfEKSKabb
 3Qh9qxHq+ce1kkKewqhn/s5A/AFiBEkz6s7OshyTZK26qrggn/UnMw6kl4QquBt2BIwx
 AcAhzXQ1Zm0ZXjqwcVyIH4vnzj3Y1thH3yQKYQCiC0DXjQgi2a4n2QKkCdHLYv70tTFA
 Pm3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X5TpNQiu
Subject: Re: [Buildroot] [PATCH] package/dbus: set runstatedir to /run
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNi8wNC8yMDI0IDEwOjU3LCBKYW4gxIxlcm3DoWsgd3JvdGU6Cj4gREJ1cyAxLjE0Lngg
bm93IGhhcyB0aGUgQ29udGFpbmVyczEgaW50ZXJmYWNlIHdoaWNoIHVzZXMgcGF0aCBpbgo+IHJ1
bnN0YXRlZGlyIChieSBkZWZhdWx0IHNldCB0byAvdmFyL3J1bikgZm9yIGNyZWF0aW5nIHNvY2tl
dHMuIFdpdGggdGhlCj4gZGVmYXVsdCwgU3lzdGVtZCBjb21wbGFpbnMgYWJvdXQgaXQgYmVpbmcg
YSBsZWdhY3kgZGlyZWN0b3J5Ogo+IAo+IHN5c3RlbWQtdG1wZmlsZXNbMTAyXTogL3Vzci9saWIv
dG1wZmlsZXMuZC9kYnVzLmNvbmY6MTM6IExpbmUgcmVmZXJlbmNlcwo+IHBhdGggYmVsb3cgbGVn
YWN5IGRpcmVjdG9yeSAvdmFyL3J1bi8sIHVwZGF0aW5nIC92YXIvcnVuL2RidXMvY29udGFpbmVy
cwo+IOKGkiAvcnVuL2RidXMvY29udGFpbmVyczsgcGxlYXNlIHVwZGF0ZSB0aGUgdG1wZmlsZXMu
ZC8gZHJvcC1pbiBmaWxlCj4gYWNjb3JkaW5nbHkuCj4gCj4gU2V0IHRoZSBjb25maWd1cmUgb3B0
aW9uIHJ1bnN0YXRlZGlyIHRvIC9ydW4gdG8gdXNlIHRoZSBwcmVmZXJyZWQgcGF0aAo+IHRvIGF2
b2lkIHRoZSB3YXJuaW5nIGFuZCB1c2UgdGhlIC9ydW4gZGlyZWN0b3J5IGNvbnNpc3RlbnRseS4g
U2V0dGluZwo+IHRoZSB2YWx1ZSBvbmx5IGFmZmVjdHMgdGhlIHBhdGggb2YgdGhlc2Ugc29ja2V0
cyBhbmQgdG8gdGhlIFBJRCBmaWxlLAo+IHdoaWNoIGlzIGFscmVhZHkgZXhwbGljaXRseSBzZXQg
YnkgYW5vdGhlciBvcHRpb24uCgogIEkndmUgYWRkZWQgYSBwYXJhZ3JhcGggZXhwbGFpbmluZyB3
aHkgd2UgZG9uJ3QgZG8gdGhpcyBnbG9iYWxseSBpbiAKcGtnLWF1dG90b29scy5taywgYW5kIGFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KPiAtLS0KPiAgIHBhY2th
Z2UvZGJ1cy9kYnVzLm1rIHwgMyArKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kYnVzL2RidXMubWsg
Yi9wYWNrYWdlL2RidXMvZGJ1cy5tawo+IGluZGV4IDA5N2I4OTIwNWUuLmM2MGJmNDczY2QgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9kYnVzL2RidXMubWsKPiArKysgYi9wYWNrYWdlL2RidXMvZGJ1
cy5tawo+IEBAIC0zMyw3ICszMyw4IEBAIERCVVNfQ09ORl9PUFRTID0gXAo+ICAgCS0tZGlzYWJs
ZS14bWwtZG9jcyBcCj4gICAJLS1kaXNhYmxlLWRveHlnZW4tZG9jcyBcCj4gICAJLS13aXRoLXN5
c3RlbS1zb2NrZXQ9L3J1bi9kYnVzL3N5c3RlbV9idXNfc29ja2V0IFwKPiAtCS0td2l0aC1zeXN0
ZW0tcGlkLWZpbGU9L3J1bi9tZXNzYWdlYnVzLnBpZAo+ICsJLS13aXRoLXN5c3RlbS1waWQtZmls
ZT0vcnVuL21lc3NhZ2VidXMucGlkIFwKPiArCS0tcnVuc3RhdGVkaXI9L3J1bgo+ICAgCj4gICBp
ZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkKPiAgIERCVVNfQ09ORl9PUFRTICs9IExJQlM9Jy1w
dGhyZWFkJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
