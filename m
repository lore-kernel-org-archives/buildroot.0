Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B468C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1D180C2C;
	Fri, 12 Jul 2024 08:13:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hdANjlQIJMxt; Fri, 12 Jul 2024 08:13:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E11E80C61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E11E80C61;
	Fri, 12 Jul 2024 08:13:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B71371BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A49386062E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vlfgel9VW_Me for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:13:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 67E1660604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67E1660604
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67E1660604
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:13:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-367b0cc6c65so1058987f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 01:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720772032; x=1721376832;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TTvP/ftRCXUoeyVk4rxqPokasSZI7g+6eYBG3lTWVG0=;
 b=xUng6wAFrFNaIArKochY+RdDMmo/c/geS//KXxO93/LwsSlC/LWt67SMUu83dJo17U
 QIOf7nxd9xI4wo/PGzv0SAAt74PrvAqeNV8Kq5y9mf2csd3Lm/Nv0XmppsM1+fxl3kQq
 fCNOSgh3QoewrA1OyN2kGZ+KUQnlEOwbJSuumNKplvFzFhrGpHdNtO8QtMwmjkTy2lWx
 yhdQNGBB99SL5pYS8UY4UERjR7HVMrmCAGQN311hTYp8UfRDSjVrzKJCFdXdTQnyKuwh
 7jjLVMDViJEr49kxgXSL5cS9cdXJuAWfY93gijAvPsl4V8g3UFACpKf5fc/levGjQIHI
 Z2Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbIYlNf/9tqSnB2hWksj1tY2/SBcbaaYHUSvHO2ekymLYh68Fk2pfOxCSCxRvQmqsmSW8/TLtomPutD9Us07mONpf7kYeKEg==
X-Gm-Message-State: AOJu0Yz+ZRqfmer6RWdYi2+hHhn702tMXECb0DvtjzWBJJLw8JYmMMlP
 iEUHCp3w/ZfJRvSI9mWG6q5dCWSNpsZMuFkHYFly1o1DdtH7SQoMQdlUcGn0BHLo878S2bfu8B8
 3qiE=
X-Google-Smtp-Source: AGHT+IFCjJdfRWIeGWSdtmtqLYNWqoBXHIJC+vJlsqTlnkk3UFESeYfRNwKJESorqpgFrdNP2EHheQ==
X-Received: by 2002:a5d:5847:0:b0:366:f001:78d5 with SMTP id
 ffacd0b85a97d-367cea46c97mr9684530f8f.13.1720772031943; 
 Fri, 12 Jul 2024 01:13:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7df3dsm9528949f8f.16.2024.07.12.01.13.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 01:13:51 -0700 (PDT)
Message-ID: <1e5e26ad-a563-4198-bdd4-769e5fbf0d62@mind.be>
Date: Fri, 12 Jul 2024 10:13:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, Brandon Maier <brandon.maier@collins.com>
References: <20240522154616.1265769-1-brandon.maier@collins.com>
 <a27d5bf51fad0eb68dfbc1faee805b8d@free.fr>
Content-Language: en-GB
In-Reply-To: <a27d5bf51fad0eb68dfbc1faee805b8d@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720772032; x=1721376832; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TTvP/ftRCXUoeyVk4rxqPokasSZI7g+6eYBG3lTWVG0=;
 b=Yl49363l9v7jXvBx0spVK3bcfpO9LvkvB9lvjfh0lIWSsaegWdc605UMUojunf4BrZ
 0BM+xpgBSCzwZp6tILGSmkhUKZdIK453WR06jCrLPn6jZHIdqBOZWUXbWykr/9HA7mx7
 VoJ55iFdJvEo4qhopXviHyLdbxwpKYaywOMvLzHm2lYEgyOZSFkOGJMQGQFruMv/gFdx
 i4OB3wRyt+kRBOR0xWfNjMWVW2iq3260bTKaLqKGysWito10udFdWysSWd90LCIwB018
 Fm3WLOWYuZjSSwZvsFu8OPVdt9CZFZqceOgYVdgyATjV5OOXlicaoeamXqzq7ISG7naV
 TZ7Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Yl49363l
Subject: Re: [Buildroot] [PATCH] support/testing/infra/emulator.py: fix qemu
 prompt detection
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBCcmFuZG9uLCBKdWxpZW4sCgpPbiAyMi8wNS8yMDI0IDIxOjA0LCBKdWxpZW4gT2xpdmFp
biB3cm90ZToKPiBIaSBCcmFuZG9uLCBBbGwsCj4gCj4gT24gMjIvMDUvMjAyNCAxNzo0NiwgQnJh
bmRvbiBNYWllciB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBUaGUgcWVtdS5ydW4oKSBtZXRob2Qg
Y2FuIGJyZWFrIHdoZW4gYSBjb21tYW5kIGhhcHBlbnMgdG8gb3V0cHV0IHRoZQo+PiBzdHJpbmcg
IiMgIiB0byBzdGRvdXQuIFRoaXMgaXMgYmVjYXVzZSBxZW11LnJ1bigpIGRldGVjdHMgd2hlbiBh
IGNvbW1hbmQKPj4gaGFzIGNvbXBsZXRlZCBieSBzZWFyY2hpbmcgZm9yIHRoZSBzaGVsbCBwcm9t
cHQsIHdoaWNoIGJ5IGRlZmF1bHQgaXMKPj4gIiMgIi4gSXQgdGhlbiBjYXB0dXJlcyBldmVyeXRo
aW5nIGJlZm9yZSB0aGUgIiMgIiBhcyB0aGUgY29tbWFuZHMKPj4gb3V0cHV0LCBjYXVzaW5nIHRo
ZSByZXN0IG9mIG91dHB1dCB0byBiZSBsb3N0Lgo+Pgo+PiBUbyB3b3JrIGFyb3VuZCB0aGUgaXNz
dWUgc2V0IHRoZSBwcm9tcHQgdG8gc29tZXRoaW5nIG1vcmUgdW5pcXVlLiBUaGlzCj4+IG1ha2Vz
IGl0IGxlc3MgbGlrZWx5IHRvIGFwcGVhciBpbiBjb21tYW5kIG91dHB1dC4KPiAKPiBJIHByb3Bv
c2VkIGEgc2ltaWxhciBwYXRjaCBsYXN0IHllYXI6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9MzYyNzYxCj4gCj4gQ2hhbmdpbmcg
dGhpcyBwcm9tcHQgcmVxdWlyZXMgdG8gYWxzbyBwYXRjaCB0aGUgImJhc2giIHJ1bnRpbWUgdGVz
dCwKPiB3aGljaCBpcyBmYWlsaW5nIGlmIHRoZSBwcm9tcHQgaXMgY2hhbmdlZCBpbiB0aGUgZW11
bGF0b3IuCgogIEluc3RlYWQgb2Ygcm9sbGluZyBvdXIgb3duLCB3b3VsZG4ndCBpdCBiZSBiZXR0
ZXIgdG8gc2ltcGx5IHVzZSByZXBsd3JhcCBbMV0/IApXZSdyZSBhbHJlYWR5IHVzaW5nIHBleHBl
Y3Qgc28gSSBleHBlY3QgKHB1biBpbnRlbmRlZCkgc3dpdGNoaW5nIGZyb20gc3Bhd24gdG8gCnJl
cGx3cmFwIHNob3VsZCBiZSBxdWl0ZSB0cml2aWFsLi4uCgoKPiBJIHRoaW5rIG15IHBhdGNoZXMg
d2VyZSBub3QgaW5jbHVkZWQgZHVlIHRvIGxvc3QgMy80IGFuZCA0LzQgcGF0Y2hlcwo+IGluIHRo
ZSBzZXJpZXMgZnJvbSBteSBlbWFpbCBwcm92aWRlci4gVGhvc2UgcGF0Y2hlcyB3ZXJlIG9yaWdp
bmFsbHkKPiBpbiB0aGUgdjIuIFNlZToKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L2xpc3QvP3Nlcmllcz0zNTkxODUmc3RhdGU9KgoKICBQZXJoYXBzIHlv
dSBndXlzIGNhbiBzeW5jIGJldHdlZW4gdGhlIHR3byBvZiB5b3Ugd2hvIHdpbGwgdGFrZSB0aGlz
IHdvcmsgYW5kIAp0aGVuIHJlc2VuZCB0aGUgZW50aXJlIHNlcmllcz8KCiAgUmVnYXJkcywKICBB
cm5vdXQKClsxXSBodHRwczovL3BleHBlY3QucmVhZHRoZWRvY3MuaW8vZW4vc3RhYmxlL2FwaS9y
ZXBsd3JhcC5odG1sCgo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCcmFuZG9uIE1haWVyIDxicmFu
ZG9uLm1haWVyQGNvbGxpbnMuY29tPgo+PiAtLS0KPj4gwqBzdXBwb3J0L3Rlc3RpbmcvaW5mcmEv
ZW11bGF0b3IucHkgfCAxMSArKysrKysrKystLQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCA5IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rp
bmcvaW5mcmEvZW11bGF0b3IucHkgCj4+IGIvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9y
LnB5Cj4+IGluZGV4IDYyNDc0MGZjYjEuLmFhNTc5NDQzYTYgMTAwNjQ0Cj4+IC0tLSBhL3N1cHBv
cnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weQo+PiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvaW5m
cmEvZW11bGF0b3IucHkKPj4gQEAgLTEwMCw2ICsxMDAsMTMgQEAgY2xhc3MgRW11bGF0b3Iob2Jq
ZWN0KToKPj4gwqDCoMKgwqDCoMKgwqDCoCBpbmRleCA9IHNlbGYucWVtdS5leHBlY3QoWyIjICIs
IHBleHBlY3QuVElNRU9VVF0pCj4+IMKgwqDCoMKgwqDCoMKgwqAgaWYgaW5kZXggIT0gMDoKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJhaXNlIFN5c3RlbUVycm9yKCJDYW5ub3QgbG9naW4i
KQo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCAjIFNldCBhIHByb21wdCB0aGF0IGlzIHVubGlrZWx5
IHRvIGFwcGVhciBpbiBjb21tYW5kIG91dHB1dAo+PiArwqDCoMKgwqDCoMKgwqAgc2VsZi5xZW11
LnNlbmRsaW5lKCJQUzE9J2JyLXFlbXUtdGVzdCMgJyIpCj4+ICvCoMKgwqDCoMKgwqDCoCBpbmRl
eCA9IHNlbGYucWVtdS5leHBlY3QoWyJcclxuYnItcWVtdS10ZXN0IyAiLCBwZXhwZWN0LlRJTUVP
VVRdKQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgaW5kZXggIT0gMDoKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmFpc2UgU3lzdGVtRXJyb3IoIkNhbm5vdCBzZXQgdGVzdCBwcm9tcHQiKQo+PiAr
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5ydW4oImRtZXNnIC1uIDEiKQo+PiDCoMKgwqDCoMKg
wqDCoMKgICMgUHJldmVudCB0aGUgc2hlbGwgZnJvbSB3cmFwcGluZyB0aGUgY29tbWFuZHMgYXQg
ODAgY29sdW1ucy4KPj4gwqDCoMKgwqDCoMKgwqDCoCBzZWxmLnJ1bigic3R0eSBjb2x1bW5zIDI5
OTk5IikKPj4gQEAgLTExMCwxMyArMTE3LDEzIEBAIGNsYXNzIEVtdWxhdG9yKG9iamVjdCk6Cj4+
IMKgwqDCoMKgwqDCoMKgwqAgc2VsZi5xZW11LnNlbmRsaW5lKGNtZCkKPj4gwqDCoMKgwqDCoMKg
wqDCoCBpZiB0aW1lb3V0ICE9IC0xOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGltZW91
dCAqPSBzZWxmLnRpbWVvdXRfbXVsdGlwbGllcgo+PiAtwqDCoMKgwqDCoMKgwqAgc2VsZi5xZW11
LmV4cGVjdCgiIyAiLCB0aW1lb3V0PXRpbWVvdXQpCj4+ICvCoMKgwqDCoMKgwqDCoCBzZWxmLnFl
bXUuZXhwZWN0KCJici1xZW11LXRlc3QjICIsIHRpbWVvdXQ9dGltZW91dCkKPj4gwqDCoMKgwqDC
oMKgwqDCoCAjIFJlbW92ZSBkb3VibGUgY2FycmlhZ2UgcmV0dXJuIGZyb20gcWVtdSBzdGRvdXQg
c28gc3RyLnNwbGl0bGluZXMoKQo+PiDCoMKgwqDCoMKgwqDCoMKgICMgd29ya3MgYXMgZXhwZWN0
ZWQuCj4+IMKgwqDCoMKgwqDCoMKgwqAgb3V0cHV0ID0gc2VsZi5xZW11LmJlZm9yZS5yZXBsYWNl
KCJcclxyIiwgIlxyIikuc3BsaXRsaW5lcygpWzE6XQo+Pgo+PiDCoMKgwqDCoMKgwqDCoMKgIHNl
bGYucWVtdS5zZW5kbGluZSgiZWNobyAkPyIpCj4+IC3CoMKgwqDCoMKgwqDCoCBzZWxmLnFlbXUu
ZXhwZWN0KCIjICIpCj4+ICvCoMKgwqDCoMKgwqDCoCBzZWxmLnFlbXUuZXhwZWN0KCJici1xZW11
LXRlc3QjICIpCj4+IMKgwqDCoMKgwqDCoMKgwqAgZXhpdF9jb2RlID0gc2VsZi5xZW11LmJlZm9y
ZS5zcGxpdGxpbmVzKClbMl0KPj4gwqDCoMKgwqDCoMKgwqDCoCBleGl0X2NvZGUgPSBpbnQoZXhp
dF9jb2RlKQo+Pgo+PiAtLSAKPj4gMi40NS4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGllbi4KPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
