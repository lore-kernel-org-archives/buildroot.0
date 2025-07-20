Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08879C83F22
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 17:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7911641279;
	Sun, 20 Jul 2025 17:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGVpDWzaP2ds; Sun, 20 Jul 2025 17:14:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6F20412BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F20412BE;
	Sun, 20 Jul 2025 17:14:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6171F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D8AE40224
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBXgduW9Lujw for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 17:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.43;
 helo=mail-ej1-f43.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B6AF40212
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B6AF40212
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B6AF40212
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 17:14:17 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ae0a0cd709bso860163166b.0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 10:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753031656; x=1753636456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y1/2onaE+socZxzTg4Sujbv3TyBduJy2ox80SlNsMVM=;
 b=NXjsfEOlhrkj/aUu+e/wEyi+pXuA1sXbe9m5fRIyTK8xRpRTBFVsxo28l7mFRvI/c/
 eTFQ3vdQOnuk0XMWKqacvAYKYsu75aBmyhXWfXG5p/RxdaLi628p19owVwPNwLOd25FE
 GHP5F3y4XoOsXU7dAT3REwTAMlwFNmLyMbEgxGluFrLyAtVH2xQn6H9CFXUag/jQUMN9
 jfg8QiTh+DuTw+d9Tm1zKH2aIoKqqssngikwuo7t5CEsVfb5vbrncgtshl+kDdFrz3zd
 BFP4iYSnESisO+d/Zgr9G8ggS6d9YpTBqFiSpObnZmsN16O3culCuJKzXzv/XqVmQZuh
 rotQ==
X-Gm-Message-State: AOJu0Yx/Oz58sK6YtyyrflD9wtm8J36Dzn5fQIO1JeaNPCO3JCYH3M7x
 gY0R8W28bGa9EBBYrLMmpYE5oqYcmPvwPjmTXoMjZackkyf/lHo96HdL
X-Gm-Gg: ASbGncs//I2J3hGs4VA2OYIKweDzGMUVj65xJHJQf8tKswhNLk0K77MFIMcZGB4JYKz
 K5FDnrAEq24fmCrlEL8MNwShJQfubHt2nmLB/TczPY8QxHF0VsrbKvE2IhKR7QTZBu8DFmqsN0b
 1WVZwwv+2S8jP5Lh1M0/ZkJenvncOvgDzH0u8BQ0V17WYj981kqPla7RuyadkkIBA2HY2erFwer
 ICINQ2p7j76MrUUfZ2UhHk2SS7TiVkb9m3FDN87XvPAaAvBMJaeBTGvAQoNV0bnZZRgLkhQN/wO
 kwVk0s8YRx7nrADxtitrMVFpYLTvpfQ7leADNpsMyk+OVfQSJVfLiTdfcaPu0Sxr/rmtSJ9UjEd
 8NWwg5qsL3pk7Mgr5pbFwJQ/zlUziz/jvEO4YKdXL9wBpXEqmtNHS
X-Google-Smtp-Source: AGHT+IGPYN6Qjrnp92nI6MkctW4+wibdkob/k+OV7Lbe6N8oTLxUi2JYWX4SnwSqPj+Wk7Wc4Gp99w==
X-Received: by 2002:a17:907:3f18:b0:ae9:cc51:40d6 with SMTP id
 a640c23a62f3a-aec4df0c3aamr1339145666b.28.1753031655258; 
 Sun, 20 Jul 2025 10:14:15 -0700 (PDT)
Received: from tpx1 (ltea-047-064-114-097.pools.arcor-ip.net. [47.64.114.97])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6cad69basm525456466b.145.2025.07.20.10.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 10:14:14 -0700 (PDT)
Date: Sun, 20 Jul 2025 19:14:13 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20250720191413.47715a92@tpx1>
In-Reply-To: <8734ax24lx.fsf@draig.linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
 <20250711164407.799041-4-alex.bennee@linaro.org>
 <20250712083447.109f690b@tpx1> <8734ax24lx.fsf@draig.linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [RFC PATCH v2 3/7] package/kvm-unit-tests: update
 dependencies
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gVHVlLCAxNSBKdWwgMjAyNSAxMDoxOTozOCArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IFRob21hcyBIdXRoIDxodXRoQHR1eGZhbWlseS5v
cmc+IHdyaXRlczoKPiAKPiA+IEFtIEZyaSwgMTEgSnVsIDIwMjUgMTc6NDQ6MDEgKzAxMDAKPiA+
IHNjaHJpZWIgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjoKPiA+ICAKPiA+
PiBUbyBydW4gdGhlIHRlc3RzIHdlIG5lZWQgYSBzeXN0ZW0gUUVNVSwgdGltZW91dCwgZ2V0Y29u
ZiBhbmQgbm1hcC1uY2F0Cj4gPj4gc28gdXBkYXRlIHRoZSBzZWxlY3QvZGVwZW5kcyBmb3IgdGhl
bS4gQXMgd2UgbmVlZCBhdCBsZWFzdCBHQ0MgOCB3ZQo+ID4+IGNhbiBkcm9wIHRoZSBzcGVjaWZp
YyByZXF1aXJlbWVudCBmb3Igb2xkIHg4Ni02NCB0ZXN0cy4KPiA+PiAKPiA+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gPj4gCj4gPj4gLS0t
Cj4gPj4gdjIKPiA+PiAgIC0gcmVtb3ZlIG9sZCBnY2Mgbm90ZXMgYXMgd2UgbmVlZCBhdCBsZWFz
dCA4IGFueXdheQo+ID4+ICAgLSBzZWxlY3QgUUVNVSBhbmQgb3RoZXIgcnVudGltZSBkZXBzCj4g
Pj4gICAtIG1lbnRpb24gdGhlIHJ1bnRpbWUgZGVwcwo+ID4+ICAgLSBhZGQgc3VwcG9ydCBmb3Ig
Z2V0Y29uZiBmcm9tIGV4dGVybmFsIHRvb2xjaGFpbgo+ID4+ICAgLSB1cGRhdGUgY29tbWVudCBm
YWxsYmFjawo+ID4+IC0tLQo+ID4+ICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiB8
IDI0ICsrKysrKysrKysrKysrKysrLS0tLS0tLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiA+PiAKPiA+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4gYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZp
Zy5pbgo+ID4+IGluZGV4IDg3YjA3NWM0YjkuLjc3NWIyNTBkNWYgMTAwNjQ0Cj4gPj4gLS0tIGEv
cGFja2FnZS9rdm0tdW5pdC10ZXN0cy9Db25maWcuaW4KPiA+PiArKysgYi9wYWNrYWdlL2t2bS11
bml0LXRlc3RzL0NvbmZpZy5pbgo+ID4+IEBAIC0xNCwxMiArMTQsMTkgQEAgY29uZmlnIEJSMl9Q
QUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKPiA+PiAgCj4gPj4gIGNvbmZpZyBC
UjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwo+ID4+ICAJYm9vbCAia3ZtLXVuaXQtdGVzdHMiCj4g
Pj4gLQlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMK
PiA+PiAtCSMgb24gaTM4NiBhbmQgeDg2LTY0LCBfX2J1aWx0aW5fcmVhY2hhYmxlIGlzIHVzZWQs
IHNvIHdlIG5lZWQKPiA+PiAtCSMgZ2NjIDQuNSBhdCBsZWFzdC4gb24gaTM4Niwgd2UgdXNlIHRo
ZSB0YXJnZXQgZ2NjLCB3aGlsZSBvbgo+ID4+IC0JIyB4ODYtNjQgd2UgdXNlIHRoZSBob3N0IGdj
YyAoc2VlIC5tayBmaWxlIGZvciBkZXRhaWxzKQo+ID4+IC0JZGVwZW5kcyBvbiBCUjJfVE9PTENI
QUlOX0dDQ19BVF9MRUFTVF80XzUgfHwgIUJSMl9pMzg2Cj4gPj4gIAlkZXBlbmRzIG9uIEJSMl9I
T1NUQVJDSCA9ICJ4ODZfNjQiIHx8ICFCUjJfeDg2XzY0Cj4gPj4gKwlkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX0tWTV9VTklUX1RFU1RTX0FSQ0hfU1VQUE9SVFMKPiA+PiArCWRlcGVuZHMgb24gQlIy
X1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfOCAjIHFlbXUKPiA+PiArCWRlcGVuZHMgb24gQlIyX1BB
Q0tBR0VfUUVNVV9BUkNIX1NVUFBPUlRTX1RBUkdFVAo+ID4+ICsJZGVwZW5kcyBvbiAoQlIyX1BB
Q0tBR0VfR0xJQkNfVVRJTFMgfHwgXAo+ID4+ICsJCSAgICBCUjJfVUNMSUJDX0lOU1RBTExfVVRJ
TFMgfHwgXAo+ID4+ICsJCSAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJQkNfVVRJTFNfQ09Q
WSkgIyBydW50aW1lIGdldGNvbmYKPiA+PiArCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VCj4gPj4g
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBydW50aW1lIGZvciBxZW11LXN5c3Rl
bS0kQVJDSCAgCj4gPgo+ID4gQUZBSUsga3ZtLXVuaXQtdGVzdHMgY2FuIGJlIHVzZWQgd2l0aCBr
dm10b29sIGluc3RlYWQgb2YgUUVNVSwgdG9vIC4uLiBzbwo+ID4gaGFyZC1jb2RpbmcgUUVNVSBo
aWdoIG1pZ2h0IG5vdCBiZSB0aGUgYmVzdCBzb2x1dGlvbiBmb3IgdGhlIHVzZXI/ICAKPiAKPiBU
aGUgY3VycmVudCBidWlsZCBkb2Vzbid0IHN1cHBvcnQga3ZtdG9vbCBidXQgbWF5YmUgc29tZXRo
aW5nIGxpa2UgdGhpcwo+IGFzIGEgZm9sbG93LW9uIHBhdGNoOgo+IAo+IC0tODwtLS0tLS0tLS0t
LS0tLS1jdXQgaGVyZS0tLS0tLS0tLS0tLS0tLXN0YXJ0LS0tLS0tLS0tLS0tLT44LS0tCj4gbW9k
aWZpZWQgICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbgo+IEBAIC0yMSw4ICsyMSw4
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9LVk1fVU5JVF9URVNUUwo+ICAJZGVwZW5kcyBvbiAoQlIy
X1BBQ0tBR0VfR0xJQkNfVVRJTFMgfHwgXAo+ICAJCSAgICBCUjJfVUNMSUJDX0lOU1RBTExfVVRJ
TFMgfHwgXAo+ICAJCSAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0xJQkNfVVRJTFNfQ09QWSkg
IyBydW50aW1lIGdldGNvbmYKPiAtCXNlbGVjdCBCUjJfUEFDS0FHRV9RRU1VCj4gLQlzZWxlY3Qg
QlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBydW50aW1lIGZvciBxZW11LXN5c3RlbS0kQVJDSAo+
ICsJc2VsZWN0IEJSMl9QQUNLQUdFX1FFTVUgaWYgIUJSMl9QQUNLQUdFX0tWTVRPT0wKPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSBpZiAhQlIyX1BBQ0tBR0VfS1ZNVE9PTCAjIHJ1
bnRpbWUgZm9yIHFlbXUtc3lzdGVtLSRBUkNICj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQ09SRVVU
SUxTICMgcnVudGltZSBmb3IgdGltZW91dAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0JBU0ggIyBy
dW50aW1lCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfTk1BUAo+IG1vZGlmaWVkICAgcGFja2FnZS9r
dm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawo+IEBAIC0zNiw2ICszNiwxMyBAQCBLVk1f
VU5JVF9URVNUU19DT05GX09QVFMgPVwKPiAgCS0tcHJvY2Vzc29yPSIkKEdDQ19UQVJHRVRfQ1BV
KSIgXAo+ICAJLS1lbmRpYW49IiQoS1ZNX1VOSVRfVEVTVFNfRU5ESUFOKSIKPiAgCj4gKyMgVGhl
IGRlZmF1bHQgcnVubmVyIGlzIFFFTVUgYnV0IGt2bXRvb2wgY2FuIGJlIHVzZWQKPiAraWZlcSAo
JChCUjJfUEFDS0FHRV9RRU1VX1NZU1RFTSkseSkKPiArS1ZNX1VOSVRfVEVTVFNfQ09ORl9PUFRT
ICs9IC0tdGFyZ2V0PXFlbXUKPiArZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX0tWTVRPT0wpLHkp
Cj4gK0tWTV9VTklUX1RFU1RTX0NPTkZfT1BUUyArPSAtLXRhcmdldD1rdm10b29sCj4gK2VuZGlm
Cj4gKwo+ICBpZmVxICgkKEJSMl9BUk02NF9QQUdFX1NJWkVfNEspLHkpCj4gIEtWTV9VTklUX1RF
U1RTX0NPTkZfT1BUUyArPSAtLXBhZ2Utc2l6ZT00awo+ICBlbHNlIGlmZXEgKCQoQlIyX0FSTTY0
X1BBR0VfU0laRV8xNkspLHkpCj4gLS04PC0tLS0tLS0tLS0tLS0tLWN1dCBoZXJlLS0tLS0tLS0t
LS0tLS0tZW5kLS0tLS0tLS0tLS0tLS0tPjgtLS0KPiAKPiBXaGF0IGRvIHlvdSB0aGluaz8KCkxv
b2tzIGdvb2QhIC4uLiB0aG91Z2gga3ZtdG9vbCBjYW4gb25seSBiZSB1c2VkIGZvciBhYXJjaDY0
L2FybSBvciByaXNjdgphcyBmYXIgYXMgSSBrbm93LiBOb3Qgc3VyZSB3aGV0aGVyIHRoYXQgYWRk
aXRpb25hbCBkZXBlbmRlbmN5IHNob3VsZCBiZQpyZWZsZWN0ZWQgaGVyZSwgdG9vLCB0aG91Z2gu
CgogVGhvbWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
