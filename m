Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF20C83030
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 21:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFEDC83DDB;
	Sat,  5 Jul 2025 21:32:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oodfDl1RRBzB; Sat,  5 Jul 2025 21:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3855683DCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3855683DCD;
	Sat,  5 Jul 2025 21:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 595EF12E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B748401D2
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:32:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRQZuFXKNHJj for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 21:32:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 94FFF40186
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94FFF40186
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94FFF40186
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 21:32:20 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a548a73ff2so1906091f8f.0
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 14:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751751138; x=1752355938;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SvvsZ2BJstEjKRDiT0HLKYoYBuF5i+U7Nlt0JjfRKF0=;
 b=TmfufJJUluWxQHHrQKr8rdtLXS1gSoNyxC4YdYfxCdDAYQQIHiD2UbV918YOfqZ59j
 rgRCZSLm0xeY2ch29ODFKqQeAKtsbLnmaUUp4Ni6MzqsNfWSWP/SYKXCuHVOZfyF/tig
 jP2ltFC1tJD88CjNSAka2xOjXaDoxzF4pKSOthXJqGdm2K02iEDBs6ddBmY2qey4dJ4b
 MEDWylh56Ub6WnBpIXsSEKDqUSDWe2yG2c98VBUfSEoBHD8ALQGR0OZD20KSxclh4t+S
 0+SMO+eaeiFk68jWHgJY69Fpbp/S4lJEWo4OBGGkkw4RavwcrIlpSnDVbilbuXNEHGuz
 eIpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsoVMXCDu2udShs2p4kSrlnIQqB/F7PISSnsIPtEj2yT5DKhaxfRKPzQH84FnOz9aGlOgAllF2FuI=@buildroot.org
X-Gm-Message-State: AOJu0Ywlfv7f+gfY/RDFUERAjd6cDjZCiffPgijaEnnsgVEC+E+yM02m
 rd5KRjiF0Twg8+Wzv+WhDvUbS4oz43uAf10HIIYnyvp0eHXhkabR3kJLoYLIblXmvrg=
X-Gm-Gg: ASbGncv17j5OhvOGyLAUMSUi6k1/SuNzsWuooWjBMPXl1kI1Kp+m+znW+wzA7FDxJRG
 mOw6OEWXu6eQyFl9OmHTzjvKdDP/eHQ3CyQo0pGWPlI1a44Fm65ViLw8dll59AZYTZtysaaXiQ6
 WuvI9BCnQB3dPeierKEPMlnO5qX0tL1xXsDqW3JlLNZ+Ifrvh0DSYrIA5fC932cUI1sEXr2onot
 UF3HreQ7lWm27t07aZgdhn4LNrFyV3hLJcgWnLeFZNwgGP96SYGw68MBBiS8SrmX6ImbgxMoeJ2
 tAghPe0j1dnAm72gNkoqp/ncjsKMzJ+F6FJlksXXUah0z1o8mLXhM4QZZoi/9mpj9oJ0Dg9Gvr/
 C0PfPtjg5CbfTADpXfkJuyBmEQcZgtpw7lfJrv/JEk/qIQgjRxE01FDjQkq3IZtTw40Qux2II4S
 wkeQzb0OEEMxTU4SeosqxlfiBh
X-Google-Smtp-Source: AGHT+IFgT8YFtkIgCM6VGeba10YPG1NqOvNfsquzktR3bpM4ibDbXjRSEbPFEfhYlkv/YGClmu+bfA==
X-Received: by 2002:a5d:64c9:0:b0:3b1:9259:3ead with SMTP id
 ffacd0b85a97d-3b49aa73e31mr2210537f8f.28.1751751138466; 
 Sat, 05 Jul 2025 14:32:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47030ba14sm5871338f8f.6.2025.07.05.14.32.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jul 2025 14:32:18 -0700 (PDT)
Message-ID: <e3a769b8-1e3b-475a-bc43-28fd74e9864d@smile.fr>
Date: Sat, 5 Jul 2025 23:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>
References: <20250630185854.9826-1-ju.o@free.fr>
Content-Language: fr, en-US
In-Reply-To: <20250630185854.9826-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751751138; x=1752355938; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SvvsZ2BJstEjKRDiT0HLKYoYBuF5i+U7Nlt0JjfRKF0=;
 b=v+6VYzhTvJK6ehml4OUV5NuWnGiRgmKxp4EOGWcGZzas1CUNFwJIV9Pb7wp/Y3KiV6
 Qicl0DIvJwJ9Up/myIe270r/acwiDGwGSPn+b5Mrd/JYRVqG7v6sHB17dLBvlPc64c7o
 3hpfJglPkRm55ziR7MMGDAHmdu2OyfebO4xHg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=v+6VYzhT
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: add a new Kconfig option to
 pass arbitrary build options
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

SGVsbG8gSnVsaWVuLCBBbGwsCgpMZSAzMC8wNi8yMDI1IMOgIDIwOjU4LCBKdWxpZW4gT2xpdmFp
biB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gRURLMiBidWlsZCBtYXkgaW5jbHVkZSBleHRy
YSBvcHRpb25zLiBUaG9zZSBhcmUgdXN1YWxseSBpbiB0aGUgZm9ybQo+IG9mICItRCBTT01FRkxB
R19FTkFCTEUiIGFuZCBtaWdodCBiZSBzcGVjaWZpYyBmb3IgYSBwcm9jZXNzb3IKPiBhcmNoaXRl
Y3R1cmUgb3IgYSBwbGF0Zm9ybS4gRm9yIGV4YW1wbGU6Cj4gIi1EIE5FVFdPUktfSFRUUF9CT09U
X0VOQUJMRSIsICItRCBORVRXT1JLX1RMU19FTkFCTEUiLCAuLi4KPiAKPiBUaG9zZSBvcHRpb25z
IGFyZSBnZW5lcmFsbHkgZG9jdW1lbnRlZCBpbiB0aGVpciByZXNwZWN0aXZlIHBhY2thZ2VzLgo+
IFNlZSBmb3IgZXhhbXBsZToKPiBodHRwczovL2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvYmxv
Yi9tYXN0ZXIvT3ZtZlBrZy9SRUFETUUKPiAKPiBUaGlzIGNvbW1pdCBhZGRzIGEgbmV3IEtjb25m
aWcgc3RyaW5nIG9wdGlvbiB0byBsZXQgdGhlIHVzZSBkZWZpbmUKPiBhcmJpdHJhcnkgYnVpbGQg
ZmxhZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4K
PiAtLS0KPiAgYm9vdC9lZGsyL0NvbmZpZy5pbiB8IDE1ICsrKysrKysrKysrKysrKwo+ICBib290
L2VkazIvZWRrMi5tayAgIHwgIDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9lZGsyL0NvbmZpZy5pbiBiL2Jvb3QvZWRrMi9Db25m
aWcuaW4KPiBpbmRleCA2MzViYjAxMDBhLi5lZGExNWRmMmExIDEwMDY0NAo+IC0tLSBhL2Jvb3Qv
ZWRrMi9Db25maWcuaW4KPiArKysgYi9ib290L2VkazIvQ29uZmlnLmluCj4gQEAgLTExOSw2ICsx
MTksMjEgQEAgY29uZmlnIEJSMl9UQVJHRVRfRURLMl9PVk1GX0RFQlVHX09OX1NFUklBTAo+ICAJ
ICBTZWUgT1ZNRiBSRUFETUU6Cj4gIAkgIGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRr
Mi9ibG9iL21hc3Rlci9Pdm1mUGtnL1JFQURNRQo+ICAKPiArY29uZmlnIEJSMl9UQVJHRVRfRURL
Ml9FWFRSQV9CVUlMRF9PUFRTCj4gKwlzdHJpbmcgIkV4dHJhIGJ1aWxkIG9wdGlvbnMiCj4gKwlo
ZWxwCj4gKwkgIEVESzIgYnVpbGQgbWF5IGluY2x1ZGUgZXh0cmEgb3B0aW9ucy4gVGhvc2UgYXJl
IHVzdWFsbHkgaW4KPiArCSAgdGhlIGZvcm0gb2YgIi1EIFNPTUVGTEFHX0VOQUJMRSIgYW5kIG1p
Z2h0IGJlIHNwZWNpZmljIGZvciBhCj4gKwkgIHByb2Nlc3NvciBhcmNoaXRlY3R1cmUgb3IgYSBw
bGF0Zm9ybS4gRm9yIGV4YW1wbGU6ICItRAo+ICsJICBORVRXT1JLX0hUVFBfQk9PVF9FTkFCTEUi
LCAiLUQgTkVUV09SS19UTFNfRU5BQkxFIiwgLi4uCj4gKwo+ICsJICBUaG9zZSBvcHRpb25zIGFy
ZSBnZW5lcmFsbHkgZG9jdW1lbnRlZCBpbiB0aGVpciByZXNwZWN0aXZlCj4gKwkgIHBhY2thZ2Vz
LiBTZWUgZm9yIGV4YW1wbGU6Cj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRr
Mi9ibG9iL21hc3Rlci9Pdm1mUGtnL1JFQURNRQo+ICsKPiArCSAgVGhpcyBjb25maWd1cmF0aW9u
IGlzIGFuIGFyYml0cmFyeSBzdHJpbmcgdGhhdCB3aWxsIGJlCj4gKwkgIHBhc3NlZCB0byB0aGUg
YnVpbGQgY29tbWFuZC4KPiArCj4gIGNvbmZpZyBCUjJfVEFSR0VUX0VESzJfRkRfTkFNRQo+ICAJ
c3RyaW5nCj4gIAlkZWZhdWx0ICJPVk1GIiBpZiBCUjJfVEFSR0VUX0VESzJfUExBVEZPUk1fT1ZN
Rl9JMzg2Cj4gZGlmZiAtLWdpdCBhL2Jvb3QvZWRrMi9lZGsyLm1rIGIvYm9vdC9lZGsyL2VkazIu
bWsKPiBpbmRleCAzNmJjYmZjODhiLi41N2Q0NWU1ZmNhIDEwMDY0NAo+IC0tLSBhL2Jvb3QvZWRr
Mi9lZGsyLm1rCj4gKysrIGIvYm9vdC9lZGsyL2VkazIubWsKPiBAQCAtMTQ2LDYgKzE0Niw3IEBA
IEVESzJfQlVJTERfRU5WICs9IFwKPiAgCUdDQzVfJChFREsyX0FSQ0gpX1BSRUZJWD0kKFRBUkdF
VF9DUk9TUykKPiAgCj4gIEVESzJfQlVJTERfT1BUUyArPSBcCj4gKwkkKGNhbGwgcXN0cmlwLCQo
QlIyX1RBUkdFVF9FREsyX0VYVFJBX0JVSUxEX09QVFMpKSBcCgpNYXliZSB3ZSBzaG91bGQgdXNl
IGEgbG9vcCBoZXJlIGFkZGluZyAiLUQiIHdpdGggdGhlIG9wdGlvbnMgcHJvdmlkZWQgYnkKQlIy
X1RBUkdFVF9FREsyX0VYVFJBX0JVSUxEX09QVFMuIE90aGVyd2lzZSB0aGUgdXNlciBjYW4gYWRk
IHdoYXRldmVyIGhlIHdhbnQKdGhhdCBjb3VsZCBjb25mbGljdCB3aXRoIG90aGVyIGJ1aWxkIGFy
Z3VtZW50cy4KCkkgZm91bmQgYW4gZXhhbXBsZSBvZiBzdWNoIGV4dHJhIG9wdGlvbnMgdG8gZGlz
YWJsZSBQWEUgYm9vdGluZyBpbiBxZW11OgotRCBORVRXT1JLX1BYRV9CT09UX0VOQUJMRT1GQUxT
RQoKaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9tZXRhLWFybS9kaWZmL21ldGEtYXJtL3Jl
Y2lwZXMtYnNwL3VlZmkvZWRrMi1maXJtd2FyZV8lMjUuYmJhcHBlbmQ/aWQ9NjkxMjFmZjRlNWIy
OThkY2ExNjc4MWY2N2Y0NGYzNDVlMTQzNjY3YwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICAJ
LXQgR0NDNSBcCj4gIAktbiAkKEJSMl9KTEVWRUwpIFwKPiAgCS1hICQoRURLMl9BUkNIKSBcCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
