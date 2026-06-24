Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A0FCDB479
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:45:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F0AA607DE;
	Wed, 24 Jun 2026 14:45:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8zPVnLMY4ZXF; Wed, 24 Jun 2026 14:45:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C1FB60810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782312351;
	bh=/e764iIRsUkxvhO/GFlwY2z90Tim4M2PoZpC+5ksww8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MIeavRG/ZIrGZDNkXDiNUYHZe96UFeNIgZlyQHP/TgDeBbNllomICij5tI6VxtnAU
	 /Kt1KFrBM7qj8hVdMNOoN79c/BYMNajOb0AE7VCFssmuobMezLiGTlz1JgEwqAj1xw
	 J1NzL+LUndVBgjP16j+s6CvweO3W8XZruLprKddhZZ0ddJ6b7WHB1JUUn9KI0jGoEH
	 qCsWT0L0TG4LujsBAKlkpKbanddqhv4w/k/OEYb1cyoOwj3sjX9QhniZ3WBnsw5lJw
	 NreUFP9vSP5iMLvggccb56UiqBgnIv3ZrSYE3oWZRqkk7m9BoiAE6v73cU14LEOgd7
	 a00E4Me43at6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C1FB60810;
	Wed, 24 Jun 2026 14:45:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62170256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AF83401DE
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22g3kDqbOTd4 for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:45:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA39E401D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA39E401D0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA39E401D0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:45:47 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-697cd68d7adso1825481a12.1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782312345; x=1782917145;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CFt4lcX1gSvNh9Q6AcXVuPNHtlQIC3f3q3E5wsFxHns=;
 b=qTPfkQD8xtFqweD+sAdXxRGI7NnzpN6MAn36pTY8ZniAUxYhQNVaW3DumDUKH5Mkps
 C5ZLpuDptlKdC62PpRL5u6DLhKxJaA4oc+rxMM4f6qqrI4GfxpabKm/xnz++R1GUz7Y5
 8C7FXvSayMgt7WcJED87yCfGCIaUvT4FkyNwJQTaXv1uYdC+/nnrsIqQh61X1TDKDVeG
 E3x+zIwAKeNUV0IgaWVoOTuKk1LlxFTCrwJQtjWaOJKVoRaNCKcnOVF5TTF2xIwQ+MfT
 YYPA1odpZw/40SqVjS/20RDc9YTNjVa7eLYEDXN6/sbjpKZiPnvxBNA0qGUzkMMfFktM
 U44A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpc7n+Z47ix2ogf0Yvl/cNb6Xq32uwj/nj/nsiUpdpkgcmL9R3Rrv4rrdO76M4ibPSouYVSAtBUO8E=@buildroot.org
X-Gm-Message-State: AOJu0Yw6VW56h0V95xhUkH7v5Lu5OOHVAN/z2yb90hHzqeHEU51lyrAS
 bxgBY7IYkLKsl0HiaNjq4Bat4THF3AJjFm6U2ZDjsloUviHUjb5jvL4uuIV3wPjHTpo=
X-Gm-Gg: AfdE7cm46dDdcNQoQ1/JTwNq15014tsGe317lw78ZEchbcL0tZvSYsQQfcHhQnN56cB
 9yyqhk4rpoE3cSylp6/67IvwUn0azLC1ZmacbKk3XXbl9tfNM+SRLrj1jCS9KfqgAy+cBKuzI1W
 /d5oADZT4xT1bpC7qR+XlbQ7S0lFUe8DogAPCVFX3wyYguhCgH1W2Ic5hi4/BMNLQIooDD0Gz/v
 hhLxyGCsA5eWWn1i5bSAjCw2okCMF95tfGqb7rsQuyBFLRNhMeugXIBqcaE3BrfrVgysthqbIq+
 bQTZjobgl0VT5DY30Um3PdR0CLn26/V/nruv7qTgeUY1rf25XLOTcchOV2CycI12Yxo1Ljjci4V
 5Se7IPIpc8dU7xAU+KeN2xfUn6RbvzXTnXvZ9lmr1wX4cnZFLiCKQZy26J9JVKFRyabywTNsgV6
 I9vpRz0mfwatam3hpYxDBxQFREqQNcc7JX/zXL/fgzeNi2bZopNkqBINaxdEd+w8v9Wgs9wdxN0
 cp7
X-Received: by 2002:a05:6402:541a:b0:697:ad88:9d28 with SMTP id
 4fb4d7f45d1cf-697dbaf05a7mr3666477a12.25.1782312345472; 
 Wed, 24 Jun 2026 07:45:45 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-697f46e15besm1295597a12.15.2026.06.24.07.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 07:45:44 -0700 (PDT)
Message-ID: <20bfb43a-815e-4d72-ae98-68e51549ea89@smile.fr>
Date: Wed, 24 Jun 2026 16:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20260624140645.185318-1-thomas.perale@mind.be>
 <20260624140645.185318-12-thomas.perale@mind.be>
Content-Language: fr
In-Reply-To: <20260624140645.185318-12-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782312345; x=1782917145; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CFt4lcX1gSvNh9Q6AcXVuPNHtlQIC3f3q3E5wsFxHns=;
 b=MV/gWzadKCcxBmdiiWc1nBNR9HFfsKMgoAs7oStMuwwljLDhKm6emrsbnFvPH4CqoS
 so6KwenfwzuOglCrXsXN1CnGhJ13U3ztFVA/coLmg4EmMmO7oEYnekj2MoINhMPH6jV3
 9+9nIjvjyOuh/k9dMXPN3AkVLSelLczn3VkXg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=MV/gWzad
Subject: Re: [Buildroot] [RFC PATCH 11/14] package/glibc: add vulnerability
 details
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyNC8wNi8yMDI2IMOgIDE2OjA2LCBUaG9tYXMgUGVyYWxl
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaG9zZSB2dWxuZXJhYmlsaXRpZXMgaGFzIGFs
cmVhZHkgYmVlbiBhZGRyZXNzZWQgdXBzdHJlYW0gYnV0IG5vIG5ldwo+IHBhY2thZ2UgdmVyc2lv
biBoYXZlIGJlZW4gcmVsZWFzZWQgd2l0aCB0aG9zZSBmaXhlcy4KPiAKPiBUaGUgQ1ZFLTIwMTAt
NDc1NiBpcyBub3QgY29uc2lkZXJlZCBhcyBhIHNlY3VyaXR5IGlzc3VlIGJ5IHRoZSB1cHN0cmVh
bQo+IHByb2plY3QgYW5kIGlzIHRoZW4gbWFya2VkIGFzIGZpeGVkLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4KPiAtLS0KPiAgcGFja2Fn
ZS9nbGliYy9nbGliYy5tayB8IDMyICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9nbGliYy9nbGliYy5tayBiL3BhY2thZ2UvZ2xpYmMvZ2xpYmMu
bWsKPiBpbmRleCA0YTZiYzk0NjM0Li45ZWRhYjVlNGQyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Z2xpYmMvZ2xpYmMubWsKPiArKysgYi9wYWNrYWdlL2dsaWJjL2dsaWJjLm1rCj4gQEAgLTE5LDM3
ICsxOSw0NSBAQCBHTElCQ19DUEVfSURfVkVORE9SID0gZ251Cj4gICMgYWxsb3cgcHJvcGVyIG1h
dGNoaW5nIHdpdGggdGhlIENQRSBkYXRhYmFzZS4KPiAgR0xJQkNfQ1BFX0lEX1ZFUlNJT04gPSAk
KHdvcmQgMSwgJChzdWJzdCAtLCQoc3BhY2UpLCQoR0xJQkNfVkVSU0lPTikpKQo+ICAKPiAtIyBG
aXhlZCBieSBnbGliYy0yLjQxLTY0LWcxZTE2ZDAwOTZkODBhNmUxMmQ1YmZhOGUwYWFmZGQxM2M0
N2VmZDY1Cj4gIEdMSUJDX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTgwNTgKPiArR0xJQkNfQ1ZF
LTIwMjYtODA1OF9TVEFUVVMgPSBmaXhlZAo+ICtHTElCQ19DVkUtMjAyNi04MDU4X0RFVEFJTCA9
IGdsaWJjLTIuNDEtNjQtZzFlMTZkMDA5NmQ4MGE2ZTEyZDViZmE4ZTBhYWZkZDEzYzQ3ZWZkNjUK
CldoaWxlIHVwZGF0aW5nIG15IG1haWxib3gsIEkgbm90aWNlZCB0aGlzIHR5cG86IENWRS0yMDI1
LTgwNTggdnMgQ1ZFLTIwMjYtODA1OAoKTWF5YmUgY2hlY2twYWNrYWdlIGNvdWxkIGNoZWNrIGZv
ciB0aGlzPwoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gIAo+IC0jIEZpeGVkIGJ5IGdsaWJjLTIu
NDItNDktZ2IwZWM4ZmI2ODlkZjg2MjE3MWYwZjc4OTk0YTNiZGViNTEzMTM1NDUKPiAgR0xJQkNf
SUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYtMDg2MQo+ICtHTElCQ19DVkUtMjAyNi0wODYxX1NUQVRV
UyA9IGZpeGVkCj4gK0dMSUJDX0NWRS0yMDI2LTA4NjFfREVUQUlMID0gZ2xpYmMtMi40Mi00OS1n
YjBlYzhmYjY4OWRmODYyMTcxZjBmNzg5OTRhM2JkZWI1MTMxMzU0NQo+ICAKPiAtIyBGaXhlZCBi
eSBnbGliYy0yLjQyLTUwLWc0NTNlNmI4ZGJhYjkzNTI1N2ViMDgwMmIwYzk3YmNhNmI2N2JhMzBl
Cj4gIEdMSUJDX0lHTk9SRV9DVkVTICs9IENWRS0yMDI2LTA5MTUKPiArR0xJQkNfQ1ZFLTIwMjYt
MDkxNV9TVEFUVVMgPSBmaXhlZAo+ICtHTElCQ19DVkUtMjAyNi0wOTE1X0RFVEFJTCA9IGdsaWJj
LTIuNDItNTAtZzQ1M2U2YjhkYmFiOTM1MjU3ZWIwODAyYjBjOTdiY2E2YjY3YmEzMGUKPiAgCj4g
LSMgRml4ZWQgYnkgZ2xpYmMtMi40Mi01MS1nY2JmMzljMjZiMjU4MDFlOWJjODg0OTliNGZkMzYx
YWMxNzJkNDEyNQo+ICBHTElCQ19JR05PUkVfQ1ZFUyArPSBDVkUtMjAyNS0xNTI4MQo+ICtHTElC
Q19DVkUtMjAyNS0xNTI4MV9TVEFUVVMgPSBmaXhlZAo+ICtHTElCQ19DVkUtMjAyNS0xNTI4MV9E
RVRBSUwgPSBnbGliYy0yLjQyLTUxLWdjYmYzOWMyNmIyNTgwMWU5YmM4ODQ5OWI0ZmQzNjFhYzE3
MmQ0MTI1Cj4gIAo+IC0jIEZpeGVkIGJ5IGdsaWJjLTIuNDMtMTYtZzVjNmZjYTBjNjJjZTViZDZl
NjhlMjU5ZjEzODA5Nzc1NmNiYWZkNGQKPiAgR0xJQkNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYt
NDQzNwo+ICtHTElCQ19DVkUtMjAyNi00NDM3X1NUQVRVUyA9IGZpeGVkCj4gK0dMSUJDX0NWRS0y
MDI2LTQ0MzdfREVUQUlMID0gZ2xpYmMtMi40My0xNi1nNWM2ZmNhMGM2MmNlNWJkNmU2OGUyNTlm
MTM4MDk3NzU2Y2JhZmQ0ZAo+ICAKPiAtIyBGaXhlZCBieSBnbGliYy0yLjQzLTE3LWdkZDk5NDVj
MGJhNDBkMmRiYzllYjdjOTkyOTFiYTZiNjliZDY2NzE4Cj4gIEdMSUJDX0lHTk9SRV9DVkVTICs9
IENWRS0yMDI2LTQ0MzgKPiArR0xJQkNfQ1ZFLTIwMjYtNDQzOF9TVEFUVVMgPSBmaXhlZAo+ICtH
TElCQ19DVkUtMjAyNi00NDM4X0RFVEFJTCA9IGdsaWJjLTIuNDMtMTctZ2RkOTk0NWMwYmE0MGQy
ZGJjOWViN2M5OTI5MWJhNmI2OWJkNjY3MTgKPiAgCj4gLSMgRml4ZWQgYnkgZ2xpYmMtMi40My0y
Mi1nODM2MmU4Y2UxMGIyNDA2OGJhY2MxOTU1MmMxMjhkZDEwZTA4MmZkOQo+ICBHTElCQ19JR05P
UkVfQ1ZFUyArPSBDVkUtMjAyNi00MDQ2Cj4gK0dMSUJDX0NWRS0yMDI2LTQwNDZfU1RBVFVTID0g
Zml4ZWQKPiArR0xJQkNfQ1ZFLTIwMjYtNDA0Nl9ERVRBSUwgPSBnbGliYy0yLjQzLTIyLWc4MzYy
ZThjZTEwYjI0MDY4YmFjYzE5NTUyYzEyOGRkMTBlMDgyZmQ5Cj4gIAo+IC0jIEZpeGVkIGJ5IGds
aWJjLTIuNDMtMjYtZzI4OTBiMzVjZDM2MWRmMjUxNzUyNWJmMmM1ZjhjNjNmNmYwZDRhMjAKPiAg
R0xJQkNfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIwMjYtNTkyOAo+ICtHTElCQ19DVkUtMjAyNi01OTI4
X1NUQVRVUyA9IGZpeGVkCj4gK0dMSUJDX0NWRS0yMDI2LTU5MjhfREVUQUlMID0gZ2xpYmMtMi40
My0yNi1nMjg5MGIzNWNkMzYxZGYyNTE3NTI1YmYyYzVmOGM2M2Y2ZjBkNGEyMAo+ICAKPiAtIyBG
aXhlZCBieSBnbGliYy0yLjQzLTI3LWc0MDcwZDgwOGJlYTFjMDc3ZWI3ZTdkNTJiNTJiOTFjYWU5
ODIwNWQ1Cj4gIEdMSUJDX0lHTk9SRV9DVkVTICs9IENWRS0yMDI2LTU0NTAKPiArR0xJQkNfQ1ZF
LTIwMjYtNTQ1MF9TVEFUVVMgPSBmaXhlZAo+ICtHTElCQ19DVkUtMjAyNi01NDUwX0RFVEFJTCA9
IGdsaWJjLTIuNDMtMjctZzQwNzBkODA4YmVhMWMwNzdlYjdlN2Q1MmI1MmI5MWNhZTk4MjA1ZDUK
PiAgCj4gLSMgVGhpcyBDVkUgaXMgY29uc2lkZXJlZCBhcyBub3QgYmVpbmcgc2VjdXJpdHkgaXNz
dWVzIGJ5Cj4gLSMgdXBzdHJlYW0gZ2xpYmM6Cj4gLSMgIGh0dHBzOi8vc2VjdXJpdHktdHJhY2tl
ci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIwMTAtNDc1Ngo+ICBHTElCQ19JR05PUkVfQ1ZFUyAr
PSBDVkUtMjAxMC00NzU2Cj4gK0dMSUJDX0NWRS0yMDEwLTQ3NTZfU1RBVFVTID0gZml4ZWQKPiAr
R0xJQkNfQ1ZFLTIwMTAtNDc1Nl9ERVRBSUwgPSBUaGlzIENWRSBpcyBjb25zaWRlcmVkIGFzIG5v
dCBiZWluZyBzZWN1cml0eSBpc3N1ZXMgYnkgdXBzdHJlYW0gZ2xpYmM6IGh0dHBzOi8vc2VjdXJp
dHktdHJhY2tlci5kZWJpYW4ub3JnL3RyYWNrZXIvQ1ZFLTIwMTAtNDc1Ngo+ICAKPiAgIyBnbGli
YyBpcyBwYXJ0IG9mIHRoZSB0b29sY2hhaW4gc28gZGlzYWJsZSB0aGUgdG9vbGNoYWluIGRlcGVu
ZGVuY3kKPiAgR0xJQkNfQUREX1RPT0xDSEFJTl9ERVBFTkRFTkNZID0gTk8KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
