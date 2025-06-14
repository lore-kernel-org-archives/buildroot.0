Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACC4C71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8544260BA2;
	Sat, 14 Jun 2025 13:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_5oqICfNIfm; Sat, 14 Jun 2025 13:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51E060B43
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51E060B43;
	Sat, 14 Jun 2025 13:50:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E168E1A4
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE89760B43
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSREiZQgW9hY for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:50:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 261CE60AD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 261CE60AD0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 261CE60AD0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:50:16 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a54700a463so2132086f8f.1
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 06:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749909014; x=1750513814;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MyqQpRAUPw2NJSNozsgrvju2aElly6gM7h+xUYje5/8=;
 b=a1jDGoaG9EZlBLOy0SKGufhQ/0//AtWkX1moPJpnrc+AmGdz6bQVFvmW6H+CdWSTwA
 3qQakNkcRDn4vI6ykvCD5daAruvfAAq97lDc3MGvUjG7+4gnkkRsLaLzwGsppRXtENOc
 Cfdk8FYchohy58FZXGopzr2Ybs0Iq34jgWBtYCY6Uf4dEVFAD6z19d57302M/q2C4TOJ
 UTi6MRL4UdXtZJNnoQDniG/F3mUrbbRlOybZ/FIVaBGpVEyul4nsg9cmMsolFV/DnnIY
 2j8BDe4dMpxIPwSBuW2IUjA2CcGAMJEubpw1KynyXoUZ47I7Y+F0aghN34G4UaCaHMRZ
 B7sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpvq8IO0u97hWRQREJXC8vJtSVJaulr+uyPtZbeEQ7lHB/BhKCnGMwHWeGsGUlyjeo+E+s59OYKdk=@buildroot.org
X-Gm-Message-State: AOJu0Yxdks9fvsMVkF7iUK3R8vwnnr2hvIfNW5E+jqF/0akHmZpY3EQ+
 Z9K89sPQX7QcIUIuUzjlWwlrnh0O2jylzg4T1bX2ObvBU3cu4Cfcd4E5wvGfc8EydbY=
X-Gm-Gg: ASbGncu34Arjr8v/u0pbHr/VrFgplGeLnuRsSpOOLZo0UCeGKOULSENY+ilZSd3DpLl
 TbhKF33PbguTP0rfEJiJcf16wCBMM0tZMUByIbuobCHrPAwMFW9oJlQepXoUrf4YaG4tcMSkrqT
 c7e+d1QFgNGSfRhZcnVyyp/e117zgO/FJXDjNI9cK0mB4gIfuzUhBGAFV4mVWpVsnfxMqCONssK
 mPz0yt6NSe1Q3x0/mjrHWJ+tGhCTxOzAg/Fa2fyQ1HFteJPL/SskQU8Oq/8OsryTavKBx//8NlT
 9LlEen8jF67FpJg8niVJZZ7KJClGqgA2bQ0M3enEXGwyU8WYybAyBp9SCsRACrXFHiGBGfa04Gz
 O7KaxzGB/2wcJaMRfZSUzu1roVCP+5wQmzQbSbzRCHGNGL2kvEu3KKr/mJ6/lwor7lj8LqFvuRi
 C5bE07EV9OhkK/jMOMzoOtA8Kb
X-Google-Smtp-Source: AGHT+IGfnjCY4gKJAFj3Av2RbwTWuY5upgrbe3KmcAtGdxZHzkyKzlLk/0aN6Vs9aSzZGX7lmHKoSQ==
X-Received: by 2002:a05:6000:2912:b0:3a5:271e:c684 with SMTP id
 ffacd0b85a97d-3a56d837ee6mr4837351f8f.24.1749909014164; 
 Sat, 14 Jun 2025 06:50:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e24420csm82129725e9.20.2025.06.14.06.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 06:50:13 -0700 (PDT)
Message-ID: <c98cc340-3764-41f8-8eba-885d1d94a1e4@smile.fr>
Date: Sat, 14 Jun 2025 15:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dick Olsson <hi@senzilla.io>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-8-90bc4fda9080@flygoat.com>
Content-Language: fr, en-US
In-Reply-To: <20250607-loongarch-v2-8-90bc4fda9080@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749909014; x=1750513814; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MyqQpRAUPw2NJSNozsgrvju2aElly6gM7h+xUYje5/8=;
 b=0UZLMs/PQoYnDqe/I0gc6hZ5oC9onLnEa5H1orOlLhtAfL/iGJc0SN/LjcDQZ6btgr
 QQSWSMa0ovrO7/Dnsxy7cVp8zDxaYnVEURbYnrkUFso3PxI/E87zYMwXrQXJIIbadllf
 H8YffENYzxcv6o6IPyeHGoARtLGqZvZxl/zlo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=0UZLMs/P
Subject: Re: [Buildroot] [PATCH v2 8/9] boot/edk2: Add LoongArch64 OVMF
 support
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

SGVsbG8gSmlheHVuLCBBbGwsCgpMZSAwNy8wNi8yMDI1IMOgIDIwOjEyLCBKaWF4dW4gWWFuZyBh
IMOpY3JpdMKgOgo+IExvb25nQXJjaDY0IE9WTUYgdGFyZ2V0IGlzIGludHJvZHVjZWQgdG8gRURL
MiBpbiBlZGsyLTIwMjQwOC4KPiAKPiBFbmFibGUgYXJjaGl0ZWN0dXJlIHN1cHBvcnQgaGVyZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKaWF4dW4gWWFuZyA8amlheHVuLnlhbmdAZmx5Z29hdC5jb20+
Cj4gLS0tCj4gIGJvb3QvZWRrMi9Db25maWcuaW4gfCAxNCArKysrKysrKysrKysrLQo+ICBib290
L2VkazIvZWRrMi5tayAgIHwgIDYgKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L2VkazIvQ29uZmln
LmluIGIvYm9vdC9lZGsyL0NvbmZpZy5pbgo+IGluZGV4IDRlNmU3ZDEyMmNiNTUwY2JmNTdjZThm
ZGUzMTc3OWUyZDJjYmM5YTkuLjczNDgyNmE4YmU3MjJjMWM0NWFiMTU3YjQzZmVlNjBlYmI0YTMw
YTAgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9lZGsyL0NvbmZpZy5pbgo+ICsrKyBiL2Jvb3QvZWRrMi9D
b25maWcuaW4KPiBAQCAtMiw2ICsyLDcgQEAgY29uZmlnIEJSMl9UQVJHRVRfRURLMl9BUkNIX1NV
UFBPUlRTCj4gIAlib29sCj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQKPiAgCWRlZmF1bHQg
eSBpZiBCUjJfaTM4Ngo+ICsJZGVmYXVsdCB5IGlmIEJSMl9sb29uZ2FyY2g2NAo+ICAJZGVmYXVs
dCB5IGlmIEJSMl9SSVNDVl82NAo+ICAJZGVmYXVsdCB5IGlmIEJSMl94ODZfNjQKPiAgCj4gQEAg
LTIxLDYgKzIyLDggQEAgaWYgQlIyX1RBUkdFVF9FREsyCj4gIGNob2ljZQo+ICAJcHJvbXB0ICJQ
bGF0Zm9ybSIKPiAgCWRlZmF1bHQgQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX09WTUZfSTM4NiBp
ZiBCUjJfaTM4Ngo+ICsJZGVmYXVsdCBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9MT09O
R0FSQ0g2NCBpZiBcCj4gKwkJQlIyX2xvb25nYXJjaDY0CgpjaGVjay1wYWNrYWdlIHNlZW1zIGhh
cHB5IGV2ZW4gd2l0aG91dCBsaW5lIGJyZWFraW5nLgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91
ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICAJZGVm
YXVsdCBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9SSVNDViBpZiBCUjJfUklTQ1ZfNjQK
PiAgCWRlZmF1bHQgQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX09WTUZfWDY0IGlmIEJSMl94ODZf
NjQKPiAgCWRlZmF1bHQgQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX0FSTV9WSVJUX1FFTVUgaWYg
QlIyX2FhcmNoNjQKPiBAQCAtMzEsNyArMzQsMTUgQEAgY29uZmlnIEJSMl9UQVJHRVRfRURLMl9Q
TEFURk9STV9PVk1GX0kzODYKPiAgCWhlbHAKPiAgCSAgUGxhdGZvcm0gY29uZmlndXJhdGlvbiBm
b3IgYSBnZW5lcmljIGkzODYgdGFyZ2V0Lgo+ICAJICBUaGlzIHBsYXRmb3JtIHdpbGwgYm9vdCBm
cm9tIGZsYXNoIGFkZHJlc3MgMHgwLgo+IC0JICBJdCBzaG91bGQgdGhlcmVmb3JlIGJlIHVzZWQg
YXMgdGhlIGZpcnN0IGJvb3Rsb2FkZXIuCj4gKwo+ICtjb25maWcgQlIyX1RBUkdFVF9FREsyX1BM
QVRGT1JNX09WTUZfTE9PTkdBUkNINjQKPiArCWJvb2wgIkxvb25nQXJjaDY0Igo+ICsJZGVwZW5k
cyBvbiBCUjJfbG9vbmdhcmNoNjQKPiArCWhlbHAKPiArCSAgUGxhdGZvcm0gY29uZmlndXJhdGlv
biBmb3IgTG9vbmdBcmNoIFFFTVUgdGFyZ2V0aW5nIHRoZQo+ICsJICBWaXJ0IG1hY2hpbmUuIFRo
aXMgcGxhdGZvcm0gd2lsbCBvbmx5IGJvb3QgZnJvbSBmbGFzaAo+ICsJICBhZGRyZXNzIDB4MWMw
MDAwMDAuIEl0IHNob3VsZCB0aGVyZWZvcmUgYmUgdXNlZCBhcyB0aGUgZmlyc3QKPiArCSAgYm9v
dGxvYWRlci4KPiAgCj4gIGNvbmZpZyBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZNRl9SSVND
Vgo+ICAJYm9vbCAiUklTQy1WIgo+IEBAIC0xMzksNiArMTUwLDcgQEAgY29uZmlnIEJSMl9UQVJH
RVRfRURLMl9GRF9OQU1FCj4gIAlkZWZhdWx0ICJPVk1GIiBpZiBCUjJfVEFSR0VUX0VESzJfUExB
VEZPUk1fT1ZNRl9YNjQKPiAgCWRlZmF1bHQgIlFFTVVfRUZJIiBpZiBCUjJfVEFSR0VUX0VESzJf
UExBVEZPUk1fQVJNX1ZJUlRfUUVNVQo+ICAJZGVmYXVsdCAiUUVNVV9FRkkiIGlmIEJSMl9UQVJH
RVRfRURLMl9QTEFURk9STV9BUk1fVklSVF9RRU1VX0tFUk5FTAo+ICsJZGVmYXVsdCAiUUVNVV9F
RkkiIGlmIEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9PVk1GX0xPT05HQVJDSDY0Cj4gIAlkZWZh
dWx0ICJCTDMzX0FQX1VFRkkiIGlmIEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9BUk1fU0dJNTc1
Cj4gIAlkZWZhdWx0ICJGVlBfQUFSQ0g2NF9FRkkiIGlmIEJSMl9UQVJHRVRfRURLMl9QTEFURk9S
TV9BUk1fVkVYUFJFU1NfRlZQX0FBUkNINjQKPiAgCWRlZmF1bHQgIkZWUF9BQVJDSDY0X0VGSSIg
aWYgQlIyX1RBUkdFVF9FREsyX1BMQVRGT1JNX1NPQ0lPTkVYVF9ERVZFTE9QRVJCT1gKPiBkaWZm
IC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIubWsgYi9ib290L2VkazIvZWRrMi5tawo+IGluZGV4IGJj
NDA0OWIyZGVmM2U3NWExZTk1YmE4NTY5NmRlNzdkNTgzMzVhM2UuLjQ1NDBhOWJkZWE4OGU2ODJk
ZWRkMDJhYjQzOTM3MTI3ZTNlNDY0ZTcgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9lZGsyL2VkazIubWsK
PiArKysgYi9ib290L2VkazIvZWRrMi5tawo+IEBAIC0xNDIsNiArMTQyLDEyIEBAIEVESzJfUEFD
S0FHRV9OQU1FID0gT3ZtZlBrZy9SaXNjVlZpcnQKPiAgRURLMl9QTEFURk9STV9OQU1FID0gUmlz
Y1ZWaXJ0UWVtdQo+ICBFREsyX0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9STV9OQU1FKQo+ICAK
PiArZWxzZSBpZmVxICgkKEJSMl9UQVJHRVRfRURLMl9QTEFURk9STV9PVk1GX0xPT05HQVJDSDY0
KSx5KQo+ICtFREsyX0FSQ0ggPSBMT09OR0FSQ0g2NAo+ICtFREsyX1BBQ0tBR0VfTkFNRSA9IE92
bWZQa2cvTG9vbmdBcmNoVmlydAo+ICtFREsyX1BMQVRGT1JNX05BTUUgPSBMb29uZ0FyY2hWaXJ0
UWVtdQo+ICtFREsyX0JVSUxEX0RJUiA9ICQoRURLMl9QTEFURk9STV9OQU1FKQo+ICsKPiAgZW5k
aWYKPiAgCj4gIEVESzJfQkFTRVRPT0xTX09QVFMgPSBcCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
