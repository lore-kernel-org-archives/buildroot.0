Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100EAC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 941E3414BF;
	Fri, 12 Jul 2024 20:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmp9C9biekjn; Fri, 12 Jul 2024 20:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DC4C413B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DC4C413B8;
	Fri, 12 Jul 2024 20:30:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E018A1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC00E82111
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TY0Zh0c7hGQD for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:30:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7556A8210B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7556A8210B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7556A8210B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:30:47 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4257d5fc9b7so18855055e9.2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720816245; x=1721421045;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wnUA4tp+e/lFIIUNR/D/UAx6efrL9d5J1ifUNcq3vCs=;
 b=i5RUfNioDHp4bQ6RISCbfwcq4cNFYzZpZ2t2J+3tlgSD1aIhZ1LAFBe80EC6JidILv
 Eq0a1sdmqxfgiH1kkNsABwB9fpzLy+nmedhOQJHImek4b1LZvACJyBOEdi22Pmh/PmRH
 LLOWAt2CsoAIfYzl987b1VUQVLfnxAy0nSiV/gt9OAYdJq7xpn/QLsyTZAVSQpTDA95t
 Nf0ZpWDUiqFcEdWhFVQaLsS5QB8QxZpgyN2CuHkYFbRkmgWn99aq53YFdxZSxMfs1ENN
 R1gR+SlZRcB7x2n2rhUz60X2AbUPY7BBkR+hICiIYA6DLhnZ0/v8wrML3IeXA4CpPvcD
 duVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2fAuJgfn7Z/EPiko4mWvI450OvQEeTBCsDyCjE4DorFv1ShL39P1V/szJbfZjBR60aK9AlP1XbSBvUMpBLfOYrRtp7MOLow==
X-Gm-Message-State: AOJu0Yw6yiUw5xZDO9BYcKtS9WTtRb28bzMuo9H1WEzMJNjdQbVaPU5g
 ftAf8wTN3UnjYZ8NSpfgLPOugg3Jwa0kjlW/OIEIKPUP2YU3OyAIeZWmRWaIhas=
X-Google-Smtp-Source: AGHT+IFpbAbBPAc85PvsUqumknlMCBOI/6f5GsJLC0ZQfsa0QA7Qb6dj+C61Bah6/B/1zU/PIc7H6Q==
X-Received: by 2002:a5d:64c9:0:b0:367:8811:cab7 with SMTP id
 ffacd0b85a97d-367cea9649emr14241691f8f.41.1720816245218; 
 Fri, 12 Jul 2024 13:30:45 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89133sm10965099f8f.54.2024.07.12.13.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:30:44 -0700 (PDT)
Message-ID: <573858a0-8af5-4654-a3ed-ddc22547c932@smile.fr>
Date: Fri, 12 Jul 2024 22:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240703190316.970385-1-james.hilliard1@gmail.com>
 <48b46a80-aace-4720-9311-9acf8da2a5b9@smile.fr>
 <23f08759-ba17-423a-b211-5401ad550676@mind.be>
Content-Language: en-US
In-Reply-To: <23f08759-ba17-423a-b211-5401ad550676@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720816245; x=1721421045; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wnUA4tp+e/lFIIUNR/D/UAx6efrL9d5J1ifUNcq3vCs=;
 b=ojvYlKnzg1zHdmr716TU8W/gO/hemO+8nDRBDweKZJObvwccPctUAo9VDqJRvyouhZ
 wpmsx8qEPcD6gQaQg2E/iqDcDXRxWjlgx350CRyApfRST2x0SwM8oOSoHCVpI+ZBqa+E
 Hxcc5vpl+v8l/pc8S3m3azi5jub32DyhYyZ9A=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ojvYlKnz
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXJub3V0LCBKYW1lcywKCkxlIDA0LzA3LzIwMjQgw6AgMjI6MjcsIEFybm91dCBWYW5k
ZWNhcHBlbGxlIGEgw6ljcml0wqA6Cj4gCj4gCj4gT24gMDMvMDcvMjAyNCAyMzoxNywgUm9tYWlu
IE5hb3VyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IEhlbGxvIEphbWVzLAo+Pgo+PiBMZSAwMy8w
Ny8yMDI0IMOgIDIxOjAzLCBKYW1lcyBIaWxsaWFyZCBhIMOpY3JpdMKgOgo+Pj4gSW4gb3JkZXIg
Zm9yIHN5c3RlbWQtb29tZCB0byBydW4gQ09ORklHX1BTSSBhbmQgQ09ORklHX01FTUNHIG11c3Qg
YmUKPj4+IGVuYWJsZWQgaW4gdGhlIGtlcm5lbCBjb25maWcuCj4+Cj4+IE1heWJlIGEgbGluayB0
byB0aGUgdXBzdHJlYW0gZG9jdW1lbnRhdGlvbiB3b3VsZCBoZWxwIHRvIHJldmlldyB0aGlzIGNo
YW5nZToKPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9jb21taXQvZTdi
M2YxYTZjMzU4ZGQzZWFmMGI1MDU0N2JkNTIxMzBhZDQxMjZhZQo+Pgo+PiBodHRwczovL2dpdGh1
Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2NvbW1pdC9hYTMyOWI4OTIyM2E3OTc5M2NkZTgyODhiMWJj
NmU5M2RiMTc0OTM4Cj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+IMKgIHBhY2thZ2Uvc3lzdGVtZC9z
eXN0ZW1kLm1rIHwgNiArKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsgYi9wYWNr
YWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+Pj4gaW5kZXggNmIzNTUzNzIzYy4uNTJmYTM0NDgwNyAx
MDA2NDQKPj4+IC0tLSBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rCj4+PiArKysgYi9wYWNr
YWdlL3N5c3RlbWQvc3lzdGVtZC5tawo+Pj4gQEAgLTQ4MCw2ICs0ODAsMTAgQEAgZW5kaWYKPj4+
IMKgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfU1lTVEVNRF9PT01EKSx5KQo+Pj4gwqAgU1lTVEVNRF9D
T05GX09QVFMgKz0gLURvb21kPXRydWUKPj4+IMKgIFNZU1RFTURfT09NRF9VU0VSID0gc3lzdGVt
ZC1vb20gLTEgc3lzdGVtZC1vb20gLTEgKiAtIC0gLSBzeXN0ZW1kIFVzZXJzcGFjZQo+Pj4gT09N
IEtpbGxlcgo+Pj4gK2RlZmluZSBTWVNURU1EX09PTURfTElOVVhfQ09ORklHX0ZJWFVQUwo+Pgo+
PiBEb24ndCB1c2UgX0xJTlVYX0NPTkZJR19GSVhVUFMgaGVyZSB0byBhdm9pZCBhbnkgY29uZnVz
aW9uIHdpdGgKPj4gU1lTVEVNRF9MSU5VWF9DT05GSUdfRklYVVBTLgo+IAo+IMKgV2VsbCwgd2Ug
c29tZWhvdyBuZWVkIHRvIGFwcGVuZCB0aGVzZSBmaXh1cHMgdG8gU1lTVEVNRF9MSU5VWF9DT05G
SUdfRklYVVBTLAo+IGFuZCB0aGVyZSdzIG5vICs9IGVxdWl2YWxlbnQgZm9yIG11bHRpbGluZSB2
YXJpYWJsZXMuIFNvIGRlZmluaW5nIGEgaGVscGVyCj4gdmFyaWFibGUgdGhhdCBpcyBsYXRlciBp
bmNsdWRlZCBpbiBTWVNURU1EX0xJTlVYX0NPTkZJR19GSVhVUFMgaXMgdGhlIGNsZWFuZXN0Cj4g
d2F5IHRvIGRvIGl0Lgo+IAo+PiBBbHNvIF9MSU5VWF9DT05GSUdfRklYVVBTIHN1ZmZpeCBjb3Vs
ZCBiZSBoYW5kbGVkCj4+IGJ5IHRoZSBnZW5lcmljIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgaWYg
c3lzdGVtZC1vb21kIHBhY2thZ2UgaXMgYWRkZWQgbGF0ZXIgYnkKPj4gc29tZW9uZS4KPiAKPiDC
oFVoLCB5ZXMsIGJ1dCB0aGF0IHdvdWxkIGltcGx5IHRoYXQgdGhpcyBjb25kaXRpb24gbmVlZHMg
dG8gYmUgbW92ZWQgb3V0IG9mCj4gc3lzdGVtZC5tayBhbmQgaW50byBzeXN0ZW1kLW9vbWQubWss
IHNvIEkgZG9uJ3Qgc2VlIHdoYXQgdGhlIHByb2JsZW0gaXM/IEFueXdheSwKPiBJIGRvbid0IHRo
aW5rIHdlIG5lZWQgdG8gY29uc2lkZXIgdGhlIHVubGlrZWx5IGZ1dHVyZSBvZiBzb21lb25lIGJy
ZWFraW5nIHRoZQo+IHN5c3RlbWQgcGFja2FnZSBpbnRvIHNlcGFyYXRlIHBhY2thZ2VzLgo+IAo+
IMKgKE9yIHBlcmhhcHMgeW91IG1lYW50LCBpZiBzb21lb25lIHdvdWxkIGltcGxlbWVudCBhIGNv
bXBsZXRlbHkgdW5yZWxhdGVkCj4gc3lzdGVtZC1vb21kIHBhY2thZ2UuIFRoYXQgd291bGQgYmUg
aW1wb3NzaWJsZSwgYmVjYXVzZSBCUjJfUEFDS0FHRV9TWVNURU1EX09PTUQKPiBpcyBhbHJlYWR5
IGRlZmluZWQgaW4gc3lzdGVtZCdzIENvbmZpZy5pbi4pCj4gCj4gwqBTbyAod2l0aCB0aGUgYWRk
aXRpb25hbCBsaW5rcyB0byBkb2N1bWVudGF0aW9uKSBJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgZ29v
ZCBhcy1pcy4KCk9rLCB5b3UncmUgcmlnaHQuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4g
wqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4+Cj4+PiArwqDCoMKgICQoY2FsbCBLQ09ORklHX0VO
QUJMRV9PUFQsQ09ORklHX1BTSSkKPj4+ICvCoMKgwqAgJChjYWxsIEtDT05GSUdfRU5BQkxFX09Q
VCxDT05GSUdfTUVNQ0cpCj4+PiArZW5kZWYKPj4+IMKgIGVsc2UKPj4+IMKgIFNZU1RFTURfQ09O
Rl9PUFRTICs9IC1Eb29tZD1mYWxzZQo+Pj4gwqAgZW5kaWYKPj4+IEBAIC04MDQsNiArODA4LDgg
QEAgZGVmaW5lIFNZU1RFTURfTElOVVhfQ09ORklHX0ZJWFVQUwo+Pj4gwqDCoMKgwqDCoCAkKGNh
bGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19BVVRPRlM0X0ZTKQo+Pj4gwqDCoMKgwqDCoCAk
KGNhbGwgS0NPTkZJR19FTkFCTEVfT1BULENPTkZJR19UTVBGU19QT1NJWF9BQ0wpCj4+PiDCoMKg
wqDCoMKgICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX1RNUEZTX1hBVFRSKQo+Pj4g
Kwo+Pgo+PiBJJ20gbm90IHN1cmUgYWJvdXQgdGhpcyBuZXcgbGluZS4KPj4KPj4gQmVzdCByZWdh
cmRzLAo+PiBSb21haW4KPj4KPj4KPj4+ICvCoMKgwqAgJChTWVNURU1EX09PTURfTElOVVhfQ09O
RklHX0ZJWFVQUykKPj4+IMKgIGVuZGVmCj4+PiDCoCDCoCAjIFdlIG5lZWQgYSB2ZXJ5IG1pbmlt
YWwgaG9zdCB2YXJpYW50LCBzbyB3ZSBkaXNhYmxlIGFzIG11Y2ggYXMgcG9zc2libGUuCj4+Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
