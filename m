Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE4BC3814E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 20:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69A9B4063E;
	Thu,  4 Jul 2024 20:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb-2XRYWZNoV; Thu,  4 Jul 2024 20:27:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8689840488
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8689840488;
	Thu,  4 Jul 2024 20:27:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A45871BF2C0
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 20:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91B428481A
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 20:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0M6rqw6JRHI for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 20:27:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78F4F84816
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78F4F84816
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78F4F84816
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 20:27:16 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4256eec963eso6465915e9.1
 for <buildroot@buildroot.org>; Thu, 04 Jul 2024 13:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720124835; x=1720729635;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=my1JHeViIjDL2uPAcuFSnbEg8oKLOAFuj8el69oF3iw=;
 b=SuCW8Wwc2wNWyRtthG6CWtMRNc6VtB7k63SbPHCaZ31r09FT2GRdD+Epx1JphvvfOj
 Gzl2feZrpPDRa13NEcKhvqNM8psPnnv9OE/MWmomBkngz/9twkMsZuWjIJaBg7yMqqtA
 Wurwfkb5WS4sPtNgbPA7Uh5VZeLOMwqXXDs+O7OhMCP9Kc9n1+tvy6KEWeD6QC2qcaJJ
 5PqbfDeTQLrNm28XNrBpbDTKSou6dq39PKMl2iYNicFegoyCP7C2cKQYTNeBTnZncILb
 5ppKNGfHqtOjNchKp8bdk0pjeMStvPNPrY/ijl83auuOjEDNo7tidbKs+lePGR7KS/wi
 FSHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTZRvEKUxk5TyPnhazg24pdk4lEyflzhzEYvZ5FReFd5oe5FIX/QV8giJGxBAuzfa2soHgee8YMKtCxnbVWdbkyB0k6/5joQ==
X-Gm-Message-State: AOJu0YzIM3WUv1lbWbQNa7JCoEPKPjb9liqsx9BkfwV5oyLXiXwbPA1I
 hw8vDrxQkUNGByGh2RBErIlqDY/Y2dZwQp/wtTz9wUvDCiDPRdUb1d97QGzKaQAjjsuukMlT/cq
 z
X-Google-Smtp-Source: AGHT+IFxtYXiVuoupEoj8XgQ+WQtHdSO9NbkZxabaw55qCbsnPqAHPxQHcDwegycFNv+hwpuwvEzqw==
X-Received: by 2002:a05:600c:158b:b0:425:6498:3b6c with SMTP id
 5b1f17b1804b1-4264a4689bamr17877985e9.26.1720124834935; 
 Thu, 04 Jul 2024 13:27:14 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a1d60e6sm35405065e9.11.2024.07.04.13.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 13:27:14 -0700 (PDT)
Message-ID: <23f08759-ba17-423a-b211-5401ad550676@mind.be>
Date: Thu, 4 Jul 2024 22:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240703190316.970385-1-james.hilliard1@gmail.com>
 <48b46a80-aace-4720-9311-9acf8da2a5b9@smile.fr>
Content-Language: en-GB
In-Reply-To: <48b46a80-aace-4720-9311-9acf8da2a5b9@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720124835; x=1720729635; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=my1JHeViIjDL2uPAcuFSnbEg8oKLOAFuj8el69oF3iw=;
 b=VQBktyMIrPO7nri4+A8mfRkB7ms8N9Tbtucs3wjVent8Uh0PRRuFzwQqSdReNnU+66
 QHjMI4jZ2bWFJXR881Ox7PBQAyLMRCiYu6VqF1dh8tJLxwyRyMYY54y9wOZQvI0t22T+
 J2YeLpMZnu0Ob4bdKyyaKYt/l0p6mD2Za0XrP4t9HPm3X81NoGhcxgovQU8X5vBWn4km
 5ASJQBbAjfOG9EU+Qyh7LVTjfSsSTKjXri7RTopuMdHh9AVbb/GR5xrAg+WWzvv5bqGm
 EmaYEnCg3YSzWQkAPlekgK9ZPLxU10sV7OB/Q4h6xH2i8c/y1VzQVFadIeCtcjtSSr2h
 vysA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VQBktyMI
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwMy8wNy8yMDI0IDIzOjE3LCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToK
PiBIZWxsbyBKYW1lcywKPiAKPiBMZSAwMy8wNy8yMDI0IMOgIDIxOjAzLCBKYW1lcyBIaWxsaWFy
ZCBhIMOpY3JpdMKgOgo+PiBJbiBvcmRlciBmb3Igc3lzdGVtZC1vb21kIHRvIHJ1biBDT05GSUdf
UFNJIGFuZCBDT05GSUdfTUVNQ0cgbXVzdCBiZQo+PiBlbmFibGVkIGluIHRoZSBrZXJuZWwgY29u
ZmlnLgo+IAo+IE1heWJlIGEgbGluayB0byB0aGUgdXBzdHJlYW0gZG9jdW1lbnRhdGlvbiB3b3Vs
ZCBoZWxwIHRvIHJldmlldyB0aGlzIGNoYW5nZToKPiAKPiBodHRwczovL2dpdGh1Yi5jb20vc3lz
dGVtZC9zeXN0ZW1kL2NvbW1pdC9lN2IzZjFhNmMzNThkZDNlYWYwYjUwNTQ3YmQ1MjEzMGFkNDEy
NmFlCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9jb21taXQvYWEzMjli
ODkyMjNhNzk3OTNjZGU4Mjg4YjFiYzZlOTNkYjE3NDkzOAo+IAo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICAg
cGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsgfCA2ICsrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0
ZW1kLm1rIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKPj4gaW5kZXggNmIzNTUzNzIzYy4u
NTJmYTM0NDgwNyAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKPj4g
KysrIGIvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKPj4gQEAgLTQ4MCw2ICs0ODAsMTAgQEAg
ZW5kaWYKPj4gICBpZmVxICgkKEJSMl9QQUNLQUdFX1NZU1RFTURfT09NRCkseSkKPj4gICBTWVNU
RU1EX0NPTkZfT1BUUyArPSAtRG9vbWQ9dHJ1ZQo+PiAgIFNZU1RFTURfT09NRF9VU0VSID0gc3lz
dGVtZC1vb20gLTEgc3lzdGVtZC1vb20gLTEgKiAtIC0gLSBzeXN0ZW1kIFVzZXJzcGFjZSBPT00g
S2lsbGVyCj4+ICtkZWZpbmUgU1lTVEVNRF9PT01EX0xJTlVYX0NPTkZJR19GSVhVUFMKPiAKPiBE
b24ndCB1c2UgX0xJTlVYX0NPTkZJR19GSVhVUFMgaGVyZSB0byBhdm9pZCBhbnkgY29uZnVzaW9u
IHdpdGgKPiBTWVNURU1EX0xJTlVYX0NPTkZJR19GSVhVUFMuCgogIFdlbGwsIHdlIHNvbWVob3cg
bmVlZCB0byBhcHBlbmQgdGhlc2UgZml4dXBzIHRvIFNZU1RFTURfTElOVVhfQ09ORklHX0ZJWFVQ
UywgCmFuZCB0aGVyZSdzIG5vICs9IGVxdWl2YWxlbnQgZm9yIG11bHRpbGluZSB2YXJpYWJsZXMu
IFNvIGRlZmluaW5nIGEgaGVscGVyIAp2YXJpYWJsZSB0aGF0IGlzIGxhdGVyIGluY2x1ZGVkIGlu
IFNZU1RFTURfTElOVVhfQ09ORklHX0ZJWFVQUyBpcyB0aGUgY2xlYW5lc3QgCndheSB0byBkbyBp
dC4KCj4gQWxzbyBfTElOVVhfQ09ORklHX0ZJWFVQUyBzdWZmaXggY291bGQgYmUgaGFuZGxlZAo+
IGJ5IHRoZSBnZW5lcmljIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgaWYgc3lzdGVtZC1vb21kIHBh
Y2thZ2UgaXMgYWRkZWQgbGF0ZXIgYnkKPiBzb21lb25lLgoKICBVaCwgeWVzLCBidXQgdGhhdCB3
b3VsZCBpbXBseSB0aGF0IHRoaXMgY29uZGl0aW9uIG5lZWRzIHRvIGJlIG1vdmVkIG91dCBvZiAK
c3lzdGVtZC5tayBhbmQgaW50byBzeXN0ZW1kLW9vbWQubWssIHNvIEkgZG9uJ3Qgc2VlIHdoYXQg
dGhlIHByb2JsZW0gaXM/IEFueXdheSwgCkkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBjb25zaWRl
ciB0aGUgdW5saWtlbHkgZnV0dXJlIG9mIHNvbWVvbmUgYnJlYWtpbmcgdGhlIApzeXN0ZW1kIHBh
Y2thZ2UgaW50byBzZXBhcmF0ZSBwYWNrYWdlcy4KCiAgKE9yIHBlcmhhcHMgeW91IG1lYW50LCBp
ZiBzb21lb25lIHdvdWxkIGltcGxlbWVudCBhIGNvbXBsZXRlbHkgdW5yZWxhdGVkIApzeXN0ZW1k
LW9vbWQgcGFja2FnZS4gVGhhdCB3b3VsZCBiZSBpbXBvc3NpYmxlLCBiZWNhdXNlIEJSMl9QQUNL
QUdFX1NZU1RFTURfT09NRCAKaXMgYWxyZWFkeSBkZWZpbmVkIGluIHN5c3RlbWQncyBDb25maWcu
aW4uKQoKICBTbyAod2l0aCB0aGUgYWRkaXRpb25hbCBsaW5rcyB0byBkb2N1bWVudGF0aW9uKSBJ
IHRoaW5rIHRoaXMgcGF0Y2ggaXMgZ29vZCBhcy1pcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4g
Cj4+ICsJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfUFNJKQo+PiArCSQoY2FsbCBL
Q09ORklHX0VOQUJMRV9PUFQsQ09ORklHX01FTUNHKQo+PiArZW5kZWYKPj4gICBlbHNlCj4+ICAg
U1lTVEVNRF9DT05GX09QVFMgKz0gLURvb21kPWZhbHNlCj4+ICAgZW5kaWYKPj4gQEAgLTgwNCw2
ICs4MDgsOCBAQCBkZWZpbmUgU1lTVEVNRF9MSU5VWF9DT05GSUdfRklYVVBTCj4+ICAgCSQoY2Fs
bCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX0FVVE9GUzRfRlMpCj4+ICAgCSQoY2FsbCBLQ09O
RklHX0VOQUJMRV9PUFQsQ09ORklHX1RNUEZTX1BPU0lYX0FDTCkKPj4gICAJJChjYWxsIEtDT05G
SUdfRU5BQkxFX09QVCxDT05GSUdfVE1QRlNfWEFUVFIpCj4+ICsKPiAKPiBJJ20gbm90IHN1cmUg
YWJvdXQgdGhpcyBuZXcgbGluZS4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4gCj4+
ICsJJChTWVNURU1EX09PTURfTElOVVhfQ09ORklHX0ZJWFVQUykKPj4gICBlbmRlZgo+PiAgIAo+
PiAgICMgV2UgbmVlZCBhIHZlcnkgbWluaW1hbCBob3N0IHZhcmlhbnQsIHNvIHdlIGRpc2FibGUg
YXMgbXVjaCBhcyBwb3NzaWJsZS4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
