Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5F3C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E77282AAA;
	Tue,  6 Feb 2024 17:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_sgEBTK8qmE; Tue,  6 Feb 2024 17:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 632E582CA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 632E582CA5;
	Tue,  6 Feb 2024 17:50:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 784691BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6546B82C8E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:50:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JKS_3yUHFhX2 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:50:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 151E082B2F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 151E082B2F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 151E082B2F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:50:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40f033c2e30so52919575e9.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707241813; x=1707846613;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2reNIl7hwokHh3c1Arm86+qCF46jzVnc7x6WNjy5dag=;
 b=FulN2sbqeaLvzpuIr7inL3Pdjbf7Yx6p+6xM9RRUA07uSe+4zANAgJZR9bhRozGPK7
 epta7qvom73qmh6tIwoeF5diUm6CM3KEn62BUC4VoVnhFTP/4Vwcq1Q/Zm2iz8htdyQM
 y71poPZlZkSXCInSXxJ+KUIWMoJtm1IBQ2Elg3eLT8XLg1rpV42tdVqQDl+Clf18Fiky
 L9TO/6iLl54h6PF91sKaSliDKKZdwbICGTurr/VvSGwFR87kItUAXwNr555wksvn5E1l
 KgcW0mwmYaxPtJRRKpQFnmzyQZD0AYgkezS6om4qqyVLM5EhjJv4Rgw1DVAYn03e+ZKJ
 bh4w==
X-Gm-Message-State: AOJu0Yy79Rzt5cBd6rNLBeoO1cZrSn2FsgPm2E4vnfeHCAURpr3G7j+O
 D5DGXUmFcYKbo/qF2yn5IJlk7lpiDX9HKGw96gzLC9S29BFPOxYvgZRrMmyrq0A=
X-Google-Smtp-Source: AGHT+IEB2+AxHI4+SvWdDOqBr0WiYJzdttN5GchEORY9K58BUBaaslZxaNGjaVK8kZJQr9THp7tolg==
X-Received: by 2002:a05:600c:4fcd:b0:40e:d2da:fc6b with SMTP id
 o13-20020a05600c4fcd00b0040ed2dafc6bmr2884221wmq.38.1707241813162; 
 Tue, 06 Feb 2024 09:50:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxdaeVid5/hHJDJ3a520AeMJ24dp2b3VayjArhSNAT5FRKPNfbCQLwV2e8VbDQmTcsag13dPgk9aAjiFVrfUKZEQmvs8M7S+SViUAI3xERmZnb61eggMH0AtqK5JMtb2ZcYiM2Eq0PzUyYpZJDjhxSQmQdOCvjAt6SjMKotXAPMXGwzj0LVVDUpwz1Ta5OYm5AB8P+ZQG0ph/yOVXIEeD96FHJQqR6uLX3THMTLg+5DMWMAYwcX8h1dPIiu07BgqsmCZhK/INzGjyPZ6TV0TvQ+HbQxULiN55kJNZyb8oKJGv+DBXH2iGTnX6EK9wH/pJood8=
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 fc16-20020a05600c525000b0040feb8c71a0sm1864237wmb.13.2024.02.06.09.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 09:50:12 -0800 (PST)
Message-ID: <bfe1b04f-2f7c-4e3f-b6ce-d96d84905160@smile.fr>
Date: Tue, 6 Feb 2024 18:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-3-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20231218081958.506691-3-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707241813; x=1707846613;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2reNIl7hwokHh3c1Arm86+qCF46jzVnc7x6WNjy5dag=;
 b=JpfXFLv7X9DYJ6heVZ4mj1rLja2ebpZo/IUaLZnCvSYeecr/Sqj0lo5UtjQwrrL9AT
 ijX2JUsZoqBDOW22o4DyFLOzWX6Tg274GObpYNGdhatEW3yQMbemNVDlQFKHTMq9wo3B
 I0Tmp4pWkRyfmKKMvxY14QK87xRwIqbQ8RvlazmaKLMI6JtYRaRE3OfAl+AiDQpSA76d
 JS4ybfadeFeVh/Ltb42KzBmDCbLak8pmO9qmSFtQ+8SRnbgztd0OKzCaiZDgkVmMQUP2
 qw0FXB6RtmQxJFognUENm9gTSV95aBpGl4Y6PLfaTifQ+OG5e0B9Ij8rZh3I0GeEeM4A
 vpbw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=JpfXFLv7
Subject: Re: [Buildroot] [PATCH v3 02/11] boot/ti-k3-image-gen: manage HS
 hardware
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, michael@amarulasolutions.com,
 linux-amarula@amarulasolutions.com, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxOC8xMi8yMDIzIMOgIDA5OjE5LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFRoZSBwYXRjaCBzZXRzIHRoZSBjb25maWd1cmF0aW9ucyByZXF1aXJlZCBieSBU
SSBIUyBzeXN0ZW1zLiBTb21lIG9mIHRoZXNlCj4gY29uZmlndXJhdGlvbnMgKGkuIGUuIEhTIFNZ
U0ZXIGltYWdlIHNpZ25pbmcga2V5LCBIUyBTb2Z0d2FyZSBSZXZpc2lvbikKPiBhcmUgcHJvdmlk
ZWQgYnkgdGhlIHRpLWszLWNvcmUtc2VjZGV2IHBhY2thZ2UgaW4gdGhlIGJpbmFyaWVzIGRpcmVj
dG9yeS4KCkFGQUlLIHRoZSB0aS1rMy1pbWFnZS1nZW4gdG9vbCBpcyBkZXByZWNhdGVkIGFuZCBt
dXN0IGJlIHJlcGxhY2VkIGJ5IGJpbm1hbiB0b29sCnByb3ZpZGVkIGJ5IHVwc3RyZWFtIHUtYm9v
dC4KCklzIGFsbCBrMyBTb0MgbWlncmF0ZWQgdG8gYmlubWFuIGluIHRoZSBsYXRlc3QgdS1ib290
IHJlbGVhc2UgMjAyNC4wMT8KClNlZSB0aGUgRk9TREVNIHRhbGs6CgpodHRwczovL2Zvc2RlbS5v
cmcvMjAyNC9ldmVudHMvYXR0YWNobWVudHMvZm9zZGVtLTIwMjQtMzA2Ny1zdGFuZGFyZGl6aW5n
LXRoZS1nZW5lcmF0aW9uLWFuZC1zaWduaW5nLW9mLWJvb3QtaW1hZ2VzL3NsaWRlcy8yMTkxOS9G
T1NERU0yNF9TcGVha2VyX1NsaWRlc195N0ZzSUtNLnBkZgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KPiAtLS0KPiAgYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmlu
ICAgICAgICAgIHwgIDEgKwo+ICBib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4u
bWsgfCAxNiArKysrKysrKysrKysrKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1n
ZW4vQ29uZmlnLmluIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4gaW5kZXggZDc2
Y2VmODJlOTExLi4zOGQxNTk4ZDlmYzAgMTAwNjQ0Cj4gLS0tIGEvYm9vdC90aS1rMy1pbWFnZS1n
ZW4vQ29uZmlnLmluCj4gKysrIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4gQEAg
LTIsNiArMiw3IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTgo+ICAJYm9vbCAi
dGktazMtaW1hZ2UtZ2VuIgo+ICAJZGVwZW5kcyBvbiBCUjJfVEFSR0VUX1RJX0szX1I1X0xPQURF
Ugo+ICAJc2VsZWN0IEJSMl9UQVJHRVRfVElfSzNfQk9PVF9GSVJNV0FSRQo+ICsJc2VsZWN0IEJS
Ml9UQVJHRVRfVElfSzNfQ09SRV9TRUNERVYgaWYgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5f
U0VDVFlQRV9IU19GUyB8fCBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTCj4g
IAkjIFdlIG5lZWQgRklUIHN1cHBvcnQgaW4gdWJvb3QtdG9vbHMsIHdoaWNoIGlzIHdoeSB3ZSBz
ZWxlY3QgYQo+ICAJIyBob3N0IHBhY2thZ2UKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1VC
T09UX1RPT0xTCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdl
LWdlbi5tayBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+IGluZGV4
IDY0YmU5YTE4ZjJjNC4uOTFhZWQ2M2JhYjg0IDEwMDY0NAo+IC0tLSBhL2Jvb3QvdGktazMtaW1h
Z2UtZ2VuL3RpLWszLWltYWdlLWdlbi5tawo+ICsrKyBiL2Jvb3QvdGktazMtaW1hZ2UtZ2VuL3Rp
LWszLWltYWdlLWdlbi5tawo+IEBAIC0yOSwxMCArMjksMjEgQEAgVElfSzNfSU1BR0VfR0VOX0ZX
X1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fRldfVFlQ
RSkpCj4gIFRJX0szX0lNQUdFX0dFTl9TT0MgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9U
SV9LM19JTUFHRV9HRU5fU09DKSkKPiAgVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEUgPSAkKGNhbGwg
cXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRSkpCj4gIAo+IC1USV9L
M19JTUFHRV9HRU5fU1lTRlcgPSAkKFRJX0szX0lNQUdFX0dFTl9GV19UWVBFKS1maXJtd2FyZS0k
KFRJX0szX0lNQUdFX0dFTl9TT0MpLSQoVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEUpLmJpbgo+ICtp
ZmVxICgkKEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NFQ1RZUEVfR1ApLHkpCj4gK1RJX0sz
X0lNQUdFX0dFTl9TWVNGVyA9IFwKPiArCSQoVElfSzNfSU1BR0VfR0VOX0ZXX1RZUEUpLWZpcm13
YXJlLSQoVElfSzNfSU1BR0VfR0VOX1NPQyktJChUSV9LM19JTUFHRV9HRU5fU0VDVFlQRSkuYmlu
Cj4gK2Vsc2UKPiArVElfSzNfSU1BR0VfR0VOX0RFUEVOREVOQ0lFUyArPSB0aS1rMy1jb3JlLXNl
Y2Rldgo+ICsKPiArVElfSzNfSU1BR0VfR0VOX1NZU0ZXID0gXAo+ICsJJChUSV9LM19JTUFHRV9H
RU5fRldfVFlQRSktZmlybXdhcmUtJChUSV9LM19JTUFHRV9HRU5fU09DKS0kKFRJX0szX0lNQUdF
X0dFTl9TRUNUWVBFKS1lbmMuYmluIFwKPiArCSQoVElfSzNfSU1BR0VfR0VOX0ZXX1RZUEUpLWZp
cm13YXJlLSQoVElfSzNfSU1BR0VfR0VOX1NPQyktJChUSV9LM19JTUFHRV9HRU5fU0VDVFlQRSkt
Y2VydC5iaW4KPiArZW5kaWYKPiAgCj4gIGRlZmluZSBUSV9LM19JTUFHRV9HRU5fQ09ORklHVVJF
X0NNRFMKPiAtCWNwICQoQklOQVJJRVNfRElSKS90aS1zeXNmdy8kKFRJX0szX0lNQUdFX0dFTl9T
WVNGVykgJChARCkKPiArCSQoZm9yZWFjaCB0LCQoVElfSzNfSU1BR0VfR0VOX1NZU0ZXKSxcCj4g
KwkJY3AgJChCSU5BUklFU19ESVIpL3RpLXN5c2Z3LyQodCkgJChARCkvCj4gKwkpCj4gIGVuZGVm
Cj4gIAo+ICBkZWZpbmUgVElfSzNfSU1BR0VfR0VOX0JVSUxEX0NNRFMKPiBAQCAtNDAsNiArNTEs
NyBAQCBkZWZpbmUgVElfSzNfSU1BR0VfR0VOX0JVSUxEX0NNRFMKPiAgCSQoQlIyX01BS0UpIC1D
ICQoQEQpIFwKPiAgCQlTT0M9JChUSV9LM19JTUFHRV9HRU5fU09DKSBcCj4gIAkJU09DX1RZUEU9
JChUSV9LM19JTUFHRV9HRU5fU0VDVFlQRSkgXAo+ICsJCVRJX1NFQ1VSRV9ERVZfUEtHPSQoQklO
QVJJRVNfRElSKSBcCj4gIAkJQ09ORklHPWV2bSBcCj4gIAkJQ1JPU1NfQ09NUElMRT0kKEhPU1Rf
RElSKS9iaW4vYXJtLW5vbmUtZWFiaS0gXAo+ICAJCVNCTD0kKEJJTkFSSUVTX0RJUikvcjUtdS1i
b290LXNwbC5iaW4gXAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
