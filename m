Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902B3C02194
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 14:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A774812BA;
	Wed,  5 Feb 2025 14:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8L9w9QfaBf0z; Wed,  5 Feb 2025 14:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F66081275
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F66081275;
	Wed,  5 Feb 2025 14:59:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4566F12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35849804E0
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:59:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCXugmQazxAl for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 14:59:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5F028120B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5F028120B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5F028120B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 14:59:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38daa53a296so948754f8f.3
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 06:59:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738767587; x=1739372387;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xjyAj4xxHB40e7A/fx3SzB+eB4uBkNRyNtYNzekwaE4=;
 b=M4k2Dem//JK7zmLch0e/P+/K3Drl7TsjskEqWTuSUZRD3tAxj8mqq8RzcN8oIVAQml
 xjTrzIep1rULT9RS97JBtIUwJr4GisvsCP3nY4GezkpQ7hO5jFOB3Y9bLlL22AulpvVL
 I7PeZtW4t1txoxPNpDlO7327DUjGRIPIVwdutSi1ZcX7VOcGvFHcVkKZ0wNIJcLFR0KP
 xrPF6B6DMN2kO2ElPDxY3jSN+hcmGRGGdInzBGazAOkrl1xsBnbaYUw0pcl3/eWcQBDI
 jf0T3GofQBMeTcMuU/8yuU2+Qygjw7llaPxYWk4ZS3qykRREHCVjLnVnR2+n/ENTS2p7
 6Pdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUc5sRqH7o+b9r7csoIde5U82+TuIbdjrqOMefE9U9rYAf62S8AiQUHTOJ9YYpzHelYvqUllH07aq8=@buildroot.org
X-Gm-Message-State: AOJu0Yz6hh/6aoxh1pF554uh54k3i4MZG5EtQ3WTmx7o+cecsHkeFySK
 FsDd6LynQTAg6nBv3TtKBAWPi3vZxjukGd0BhA74RpdbD8iQz70vwjXjQ7lgSZQ=
X-Gm-Gg: ASbGnct41veOaKM43SzdhfVGNT6n14YocKLSQ/oDIFCdf3mQbVVHTmCjLMdkJU4i6lR
 pe4uBe1czcWC2ieoU5Ml3l61wVHTmPZ2OMxJPGoD2bld0godcY0Xo48eRn/ej1uIthzb/cZjnFf
 z81IOe18FyeaVSfYZAjpUy14XHq0aoWI+eXg6zUvkG6wC4hPVYyWbn1m/9PdPdxOyemJtGQ8JfE
 yFp22UZy0A7vz2y7AvOJ2/pgNqETjoONFUy1N1tFxjLiZGOmLVjXi8hCG84AX8plV7XZ1e9Jt8n
 0ULx3tHKjpbV040Swdva+OqnLcWXMztfoPWW6yssJ7Ml534su8qUkHOu
X-Google-Smtp-Source: AGHT+IF0GoZPNaGYz6P3qzrtYxOOUokYzALDxCW75MuLOZ1fWb6bpNu863o6PiX3Cv8xILyqPd/KVA==
X-Received: by 2002:a5d:47c7:0:b0:38d:b282:bbb2 with SMTP id
 ffacd0b85a97d-38db48bb6b0mr2625451f8f.23.1738767586568; 
 Wed, 05 Feb 2025 06:59:46 -0800 (PST)
Received: from [172.16.2.119] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d933948sm24503705e9.1.2025.02.05.06.59.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 06:59:46 -0800 (PST)
Message-ID: <efa6291d-82d2-4f5a-9b73-05c1a6cf3e9f@smile.fr>
Date: Wed, 5 Feb 2025 15:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vladimir Oltean <olteanv@gmail.com>, buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
References: <20241208143802.1048266-1-olteanv@gmail.com>
 <20241208143802.1048266-5-olteanv@gmail.com>
Content-Language: fr
In-Reply-To: <20241208143802.1048266-5-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738767587; x=1739372387; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xjyAj4xxHB40e7A/fx3SzB+eB4uBkNRyNtYNzekwaE4=;
 b=m6eEiIRmHq8p4MGKoTo7Sjmjdqw/Pi4KRXwEAx8e5eT/wm+eiJAlCpBH5gYGZgfp5U
 nvbmp8Z13J7Ua+raIgbEvVgzVSzmC57sMLHIS4J7tgFPWSdboMfrizQ+3pqP/H7d0BVv
 +s0bOJtKZ/GH8JwCwvl0GxlAISEDLXVq77j3c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=m6eEiIRm
Subject: Re: [Buildroot] [PATCH v2 04/11] package/qoriq-mc-utils: new package
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

SGVsbG8sCgpMZSAwOC8xMi8yMDI0IMOgIDE1OjM3LCBWbGFkaW1pciBPbHRlYW4gYSDDqWNyaXTC
oDoKPiBUaGUgY29uZmlndXJhdGlvbiBmaWxlcyBmb3IgdGhlIE1DIGZpcm13YXJlIGJpbmFyeSBh
cmUgZGlzdHJpYnV0ZWQKPiB0aHJvdWdoIGEgc2VwYXJhdGUgcmVwb3NpdG9yeSBvbiBHaXRIdWIs
IGFuZCBuZWVkIGEgZGlmZmVyZW50IHBhY2thZ2UuCj4gVGhleSBhcmUgbGljZW5zZWQgZGlmZmVy
ZW50bHkgdGhhbiB0aGUgZmlybXdhcmUgaXRzZWxmLCBhbmQgdW5saWtlIHRoZQo+IGZpcm13YXJl
LCB0aGV5IGFyZSBjdXN0b21pemFibGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmxhZGltaXIgT2x0
ZWFuIDxvbHRlYW52QGdtYWlsLmNvbT4KPiAtLS0KPiB2MS0+djI6IG5vbmUKPiAKPiAgREVWRUxP
UEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2UvcW9yaXEt
bWMtdXRpbHMvQ29uZmlnLmluICAgICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysK
PiAgcGFja2FnZS9xb3JpcS1tYy11dGlscy9xb3JpcS1tYy11dGlscy5oYXNoIHwgIDMgKysKPiAg
cGFja2FnZS9xb3JpcS1tYy11dGlscy9xb3JpcS1tYy11dGlscy5tayAgIHwgMjIgKysrKysrKysr
KysrKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCA2MiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3FvcmlxLW1jLXV0aWxzL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9xb3JpcS1tYy11dGlscy9xb3JpcS1tYy11dGlscy5oYXNoCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3FvcmlxLW1jLXV0aWxzL3FvcmlxLW1jLXV0aWxzLm1rCj4g
Cj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXggNjhjOGFmMGRk
YzE1Li40NDYyOGRiM2JlZjUgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVM
T1BFUlMKPiBAQCAtMzMwNCw2ICszMzA0LDcgQEAgRjoJY29uZmlncy90czU1MDBfZGVmY29uZmln
Cj4gIE46CVZsYWRpbWlyIE9sdGVhbiA8b2x0ZWFudkBnbWFpbC5jb20+Cj4gIEY6CXBhY2thZ2Uv
cW9yaXEtZGRyLXBoeS1iaW5hcnkvCj4gIEY6CXBhY2thZ2UvcW9yaXEtbWMtYmluYXJ5Lwo+ICtG
OglwYWNrYWdlL3FvcmlxLW1jLXV0aWxzLwo+ICAKPiAgTjoJVm9sa292IFZpYWNoZXNsYXYgPHN2
OTlAaW5ib3gucnU+Cj4gIEY6CXBhY2thZ2UvdjRsMmdyYWIvCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCAzNjMzNzgzNGYyODQuLjUy
YjI4ODcxZTk2ZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2th
Z2UvQ29uZmlnLmluCj4gQEAgLTQ1Nyw2ICs0NTcsNyBAQCBtZW51ICJGaXJtd2FyZSIKPiAgCXNv
dXJjZSAicGFja2FnZS9xb3JpcS1kZHItcGh5LWJpbmFyeS9Db25maWcuaW4iCj4gIAlzb3VyY2Ug
InBhY2thZ2UvcW9yaXEtZm0tdWNvZGUvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3Fv
cmlxLW1jLWJpbmFyeS9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvcW9yaXEtbWMtdXRp
bHMvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3Jjdy1zbWFyYy1zYWwyOC9Db25maWcu
aW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcnBpLWZpcm13YXJlL0NvbmZpZy5pbiIKPiAgCXNvdXJj
ZSAicGFja2FnZS9zdW54aS1ib2FyZHMvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3FvcmlxLW1jLXV0aWxzL0NvbmZpZy5pbiBiL3BhY2thZ2UvcW9yaXEtbWMtdXRpbHMvQ29uZmln
LmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJiNDVmZmJj
OWNhNwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL3FvcmlxLW1jLXV0aWxzL0NvbmZp
Zy5pbgo+IEBAIC0wLDAgKzEsMzUgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX1FPUklRX01DX1VU
SUxTCj4gKwlib29sICJxb3JpcS1tYy11dGlscyIKPiArCWhlbHAKPiArCSAgVGhlIE1hbmFnZW1l
bnQgQ29tcGxleCAoTUMpIGlzIGEga2V5IGNvbXBvbmVudCBvZiB0aGUgbmV0d29ya2luZwo+ICsJ
ICBzdWJzeXN0ZW0gbmFtZWQgRFBBQTIgKERhdGEgUGF0aCBBY2NlbGVyYXRpb24gQXJjaGl0ZWN0
dXJlLCBzZWNvbmQKPiArCSAgdmVyc2lvbikgaW4gc29tZSBOWFAgTGF5ZXJzY2FwZSBTb0NzLgo+
ICsKPiArCSAgVGhlIE1DIGZpcm13YXJlIGlzIGNvbmZpZ3VyZWQgdGhyb3VnaCB0d28gZGlzdGlu
Y3QgZmlsZXMgbmFtZWQgRFBMCj4gKwkgIGFuZCBEUEMsIHdoaWNoIGFyZSBjdXN0b21pemFibGUg
YnkgdGhlIGVuZCB1c2VyLiBFeGFtcGxlCj4gKwkgIGNvbmZpZ3VyYXRpb24gZmlsZXMgZm9yIE5Y
UCByZWZlcmVuY2UgYm9hcmRzIGFyZSBkaXN0cmlidXRlZCB0aHJvdWdoCj4gKwkgIHRoaXMgcGFj
a2FnZSwgYW5kIGFyZSBmcmVxdWVudGx5IHBhdGNoZWQgdG8gcHJvZHVjZSB0aGUgY29uZmlndXJh
dGlvbgo+ICsJICByZXF1aXJlZCBpbiBvdGhlciBzY2VuYXJpb3MuCj4gKwo+ICsJICBodHRwczov
L2dpdGh1Yi5jb20vbnhwLXFvcmlxL21jLXV0aWxzCj4gKwkgIGh0dHBzOi8vd3d3Lm54cC5jb20v
d2ViYXBwL0Rvd25sb2FkP2NvbENvZGU9RFBBQTJVTSAjIHNpZ24gaW4gcmVxdWlyZWQKCiQgLi91
dGlscy9jaGVjay1wYWNrYWdlIHBhY2thZ2UvcW9yaXEtbWMtdXRpbHMvKgpwYWNrYWdlL3Fvcmlx
LW1jLXV0aWxzL0NvbmZpZy5pbjo0OiBoZWxwIHRleHQ6IDx0YWI+PDIgc3BhY2VzPjw2MiBjaGFy
cz4KKGh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyN3cml0aW5nLXJ1bGVzLWNvbmZpZy1p
bikKCj4gKwo+ICtpZiBCUjJfUEFDS0FHRV9RT1JJUV9NQ19VVElMUwo+ICsKPiArY29uZmlnIEJS
Ml9QQUNLQUdFX1FPUklRX01DX1VUSUxTX0RQQwo+ICsJc3RyaW5nICJEYXRhIFBhdGggQ29uZmln
dXJhdGlvbiAoRFBDKSBmaWxlIgo+ICsJaGVscAo+ICsJICBUaGUgRFBDIGZpbGUgY29udGFpbnMg
dGhlIHNldHRpbmdzIGRlZmluaW5nIHRoZSBiZWhhdmlvciBvZiB0aGUgTUMKPiArCSAgZmlybXdh
cmUuIEl0cyBzb3VyY2UgY29kZSBmb2xsb3dzIHRoZSBkZXZpY2UgdHJlZSBzeW50YXggYW5kIGlz
Cj4gKwkgIGNvbXBpbGVkIHRvIGEgZGV2aWNlIHRyZWUgYmxvYiwgd2hpY2ggaXMgdGhlIGZpbGUg
dGhhdCBtdXN0IGJlCj4gKwkgIHNwZWNpZmllZCBoZXJlLgoKU2FtZSBoZXJlLgoKPiArCj4gK2Nv
bmZpZyBCUjJfUEFDS0FHRV9RT1JJUV9NQ19VVElMU19EUEwKPiArCXN0cmluZyAiRGF0YSBQYXRo
IExheW91dCAoRFBMKSBmaWxlIgo+ICsJaGVscAo+ICsJICBUaGUgRFBMIGZpbGUgY29udGFpbnMg
YSBkZXNjcmlwdGlvbiBvZiB0aGUgaW5pdGlhbCBuZXR3b3JraW5nIG9iamVjdHMKPiArCSAgY3Jl
YXRlZCBieSB0aGUgTUMgZmlybXdhcmUgd2hlbiBpdCBib290cy4gSXRzIHNvdXJjZSBjb2RlIGZv
bGxvd3MgdGhlCj4gKwkgIGRldmljZSB0cmVlIHN5bnRheCBhbmQgaXMgY29tcGlsZWQgdG8gYSBk
ZXZpY2UgdHJlZSBibG9iLCB3aGljaCBpcwo+ICsJICB0aGUgZmlsZSB0aGF0IG11c3QgYmUgc3Bl
Y2lmaWVkIGhlcmUuCgpTYW1lIGhlcmUuCgo+ICsKPiArZW5kaWYKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9xb3JpcS1tYy11dGlscy9xb3JpcS1tYy11dGlscy5oYXNoIGIvcGFja2FnZS9xb3JpcS1t
Yy11dGlscy9xb3JpcS1tYy11dGlscy5oYXNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmYwMjM0YjlkMWZmOAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL3FvcmlxLW1jLXV0aWxzL3FvcmlxLW1jLXV0aWxzLmhhc2gKPiBAQCAtMCwwICsxLDMgQEAK
PiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICAxZDNmNGE2YjI2NjFjZmY5Y2ZiNWQ0
ZmNiYTNiMTgxZWI2ZmViZGQ4OGExMjdmYTA2OWUzMDZmNTFkNzc4ZmM1ICBxb3JpcS1tYy11dGls
cy0xMC4zOS4wLnRhci5nego+ICtzaGEyNTYgIDdhMjIzMDMxZDc2MzM5ZGYwZTRlNWE5NGQxOTNh
MjcwZmI5OTYzZDQyYjU3N2FhNDJmZTEzMGE0NjU3ZjNlMTcgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9xb3JpcS1tYy11dGlscy9xb3JpcS1tYy11dGlscy5tayBiL3BhY2thZ2UvcW9y
aXEtbWMtdXRpbHMvcW9yaXEtbWMtdXRpbHMubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uZDRmYzVlMjczODVlCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3Bh
Y2thZ2UvcW9yaXEtbWMtdXRpbHMvcW9yaXEtbWMtdXRpbHMubWsKPiBAQCAtMCwwICsxLDIyIEBA
Cj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBxb3JpcS1tYy11dGlscwo+ICsj
Cj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtRT1JJUV9NQ19VVElMU19WRVJTSU9O
ID0gMTAuMzkuMAo+ICtRT1JJUV9NQ19VVElMU19TSVRFID0gJChjYWxsIGdpdGh1YixueHAtcW9y
aXEsbWMtdXRpbHMsbWNfcmVsZWFzZV8kKFFPUklRX01DX1VUSUxTX1ZFUlNJT04pKQo+ICtRT1JJ
UV9NQ19VVElMU19MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gK1FPUklRX01DX1VUSUxTX0lOU1RB
TExfSU1BR0VTID0gWUVTCj4gK1FPUklRX01DX1VUSUxTX0lOU1RBTExfVEFSR0VUID0gTk8KPiAr
Cj4gK2RlZmluZSBRT1JJUV9NQ19VVElMU19CVUlMRF9DTURTCj4gKwkkKE1BS0UpIC1DICQoQEQp
L2NvbmZpZy8KPiArZW5kZWYKPiArCj4gK2RlZmluZSBRT1JJUV9NQ19VVElMU19JTlNUQUxMX0lN
QUdFU19DTURTCj4gKwkkKElOU1RBTEwpIC1EICQoQEQpL2NvbmZpZy8kKGNhbGwgcXN0cmlwLCQo
QlIyX1BBQ0tBR0VfUU9SSVFfTUNfVVRJTFNfRFBDKSkgJChCSU5BUklFU19ESVIpL2RwYy5kdGIK
PiArCSQoSU5TVEFMTCkgLUQgJChARCkvY29uZmlnLyQoY2FsbCBxc3RyaXAsJChCUjJfUEFDS0FH
RV9RT1JJUV9NQ19VVElMU19EUEwpKSAkKEJJTkFSSUVTX0RJUikvZHBsLmR0YgoKSWYgYW55IG9m
IEJSMl9QQUNLQUdFX1FPUklRX01DX1VUSUxTX0RQQyBhbmQgQlIyX1BBQ0tBR0VfUU9SSVFfTUNf
VVRJTFNfRFBMIGFyZQplbXB0eSBvZiBpbmNvcmVjdCwgdGhlIGluc3RhbGwgc3RlcCB3aWxsIGZh
aWwuCgpDYW4gZ2VuaW1hZ2UgY29uZmlnIGZpbGUgdXNlZCBieSBhIHNwZWNpZmljIGJvYXJkIGNh
biAic2VsZWN0IiB0aGUgcmlnaHQgYmluYXJ5PwpEb2luZyBzbywgYWxsIGJpbmFyaWVzIGJ1aWx0
IGJ5IHFvcmlxLW1jLXV0aWxzIGNhbiBlbmR1cCBpbiBhIHN1YmRpcmVjdG9yeSBvZgokKEJJTkFS
SUVTX0RJUikuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gK2VuZGVmCj4gKwo+ICskKGV2YWwg
JChnZW5lcmljLXBhY2thZ2UpKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
