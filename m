Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4024C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 14:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8251A80F3F;
	Thu,  3 Jul 2025 14:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zU6c5kVxPpmf; Thu,  3 Jul 2025 14:38:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BA4C80F53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BA4C80F53;
	Thu,  3 Jul 2025 14:38:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D14AD128
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 14:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C29CD40FD6
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 14:38:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g9mwX5N0sRhB for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 14:38:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0FC840F03
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0FC840F03
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0FC840F03
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 14:38:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so3925355f8f.2
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 07:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751553502; x=1752158302;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5t8SLqxC0cpdxhVa6vWGewOmZJW5IjkpLpOEcneOcgk=;
 b=lK0l6Y+Rcmg5t5jhKOR54XI3OEqzdKZR36iNJx1MpIxHkhAIvB20zk175tacITdlfg
 C1JW+ZZmNjbfNP6w+hAEVybInBd1X41PfdaA0zTg/GFeEi7/KuBoVTYU1PnRi0KFVxPi
 a3g7MC4G6MJRSedvt1m4o5Qc7CNxyvyXdQFYQufEt/afQpV7Ak7uFuyzE0rmgkTHMtws
 dNcHnuwTyp4knguiOeJC0LGKY6zlRZyYZBxj8xN9CqDZHAhSLLIaldgP1yo7ziExeRQ8
 1Yv8get8iRxO8+WoJatkLvfZiFcE9lyGDbFUZz/jfiGy0c+ZXxMvRvNVQ5BZDef8XVwq
 XLTA==
X-Gm-Message-State: AOJu0YwZwx62I2koVC95Am0oGqcrBVr1rTZY2zmfdL0Tu07NqNNBV5VZ
 jC7hui4oKG6oeNamb+xraLedMdwJcpdvSwusn/xoJRCp+cG3ZK0B6k0HNjH2HfWnCO5/MPMsM3m
 C1z8b
X-Gm-Gg: ASbGncv3uitA9PPAbJwHjwQvCFodfX5xSZHiyRyIagsZdAoHV530XhG93HKI/fr4SBL
 ZqGGqu1xVvKy6UtloWrnck9XCnCKICqdyCmu4/D/bfZRoX+A68J4Ol+idgQRScZUN9Ym5j+4qsJ
 LSkcSn3oyfqLt/qNoEMdOzwqsSk0HtInEBAkaL14XatFG0PrFcBW819x2kF+a5POcFJq/3R9XZP
 dLozktbn6ViqAugyChErCnQweGhKuj/BoDTWKmNJMoKkKFuuBRmMqpKbaWCH+m7HpioayeviXrw
 ejaouU8PJtuyVl622dbmQpFAQtwu80KicNsewfrVhdg6UnyOoYTKn9UyFlEHovJFZnhtGFzGUA7
 N/oTVLKsUD4wu8pGEAW5rUfs=
X-Google-Smtp-Source: AGHT+IEQrmT5ffRptXh1vg99f6Jme/PQ8sE06/ZIVmYlTwwFfpkdldKK1Rz6EDDoExyJt0u/SiMwjA==
X-Received: by 2002:a05:6000:717:b0:3a4:eec5:441c with SMTP id
 ffacd0b85a97d-3b2013efefemr5367607f8f.47.1751553502440; 
 Thu, 03 Jul 2025 07:38:22 -0700 (PDT)
Received: from [192.168.4.20] (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e5f92esm18999278f8f.90.2025.07.03.07.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 07:38:21 -0700 (PDT)
Message-ID: <b85d3e3b-1788-4ec0-9690-e87a20b5b18a@mind.be>
Date: Thu, 3 Jul 2025 16:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Herve Codina <herve.codina@bootlin.com>
References: <20250630072423.1126928-1-thomas.perale@mind.be>
 <20250703123359.5bca4a98@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250703123359.5bca4a98@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751553502; x=1752158302; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5t8SLqxC0cpdxhVa6vWGewOmZJW5IjkpLpOEcneOcgk=;
 b=eeRW+1UWOEkn5b58DS1ARU4iFI4f4zosRzAwSOouljG2wf47tGa/Xs2+Gv/UJlrczN
 k6dapC77b2OqqfAiVqaEhF4cMipFsA9de/kaLpfBIZ0/UXKPFP4TAsm9To9XX9Ze5UgN
 FWNSrr/QEKXQzCQgAjw1vS4yojAgIQ0uWjqUdJSiOCypGbTYX7tm7BeZ9tQMdHiysRuI
 Z1GyjVDO0VVpMGLyAmyuzXegHrCcxleCVP0GYP4RNpq0DIn7eCkKVRwF2thlUyudnKbG
 TwCer+z1fDLpe+gH6A6mIwFzeVvR9xbECBXOura9qvhRF4lBgXGiwo7ItwFcC0RBTYiX
 EHZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eeRW+1UW
Subject: Re: [Buildroot] [PATCH] package/modsecurity2: security bump to
 v2.9.10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSGVydsOpLAoKSnVsaWVuIGFscmVhZHkgdG9vayBjYXJlIG9mIGZpeGluZyBteSBtaXN0YWtl
IHdoZW4gY29tbWl0aW5nIChzZWUgCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2NvbW1pdC8zZDU5M2E4MTQ0YWQ4ODkwZGFlNGFiNmZkMjM1ZWVmNzAwZDNjMTQ0
KS4KClRoYW5rcyBmb3IgZ2l2aW5nIGEgbG9vay4KUmVnYXJkcywKVGhvbWFzCgpPbiA3LzMvMjUg
MTI6MzMgUE0sIEhlcnZlIENvZGluYSB3cm90ZToKPiBPbiBNb24sIDMwIEp1biAyMDI1IDA5OjI0
OjIzICswMjAwCj4gVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPiB3cm90ZToK
Pgo+PiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlczoKPj4KPj4gLSBDVkUgMjAy
NS00Nzk0NzogVmVyc2lvbnMgdXAgdG8gYW5kIGluY2x1ZGluZyAyLjkuOCBhcmUgdnVsbmVyYWJs
ZSB0bwo+PiAgICBkZW5pYWwgb2Ygc2VydmljZSBpbiBvbmUgc3BlY2lhbCBjYXNlIChpbiBzdGFi
bGUgcmVsZWFzZWQgdmVyc2lvbnMpOgo+PiAgICB3aGVuIHRoZSBwYXlsb2FkJ3MgY29udGVudCB0
eXBlIGlzIGFwcGxpY2F0aW9uL2pzb24sIGFuZCB0aGVyZSBpcyBhdAo+PiAgICBsZWFzdCBvbmUg
cnVsZSB3aGljaCBkb2VzIGEgc2FuaXRpc2VNYXRjaGVkQnl0ZXMgYWN0aW9uLiBBIHBhdGNoIGlz
Cj4+ICAgIGF2YWlsYWJsZSBhdCBwdWxsIHJlcXVlc3QgMzM4OSBhbmQgZXhwZWN0ZWQgdG8gYmUg
cGFydCBvZiB2ZXJzaW9uCj4+ICAgIDIuOS45LiBObyBrbm93biB3b3JrYXJvdW5kcyBhcmUgYXZh
aWxhYmxlLgo+Pgo+PiBGb3IgbW9yZSBpbmZvcm1hdGlvbiwgc2VlOgo+PiAgICAtIGh0dHBzOi8v
bnZkLm5pc3QuZ292L3Z1bG4vZGV0YWlsL0NWRS0yMDI1LTQ3OTQ3Cj4+ICAgIC0gaHR0cHM6Ly9n
aXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01vZFNlY3VyaXR5L3B1bGwvMzM4OQo+Pgo+PiAt
IENWRS0yMDI1LTQ4ODY2OiBWZXJzaW9ucyBwcmlvciB0byAyLjkuMTAgY29udGFpbiBhIGRlbmlh
bCBvZiBzZXJ2aWNlCj4+ICAgIHZ1bG5lcmFiaWxpdHkgc2ltaWxhciB0byBHSFNBLTg1OXItdnZ2
OC1ybThyL0NWRS0yMDI1LTQ3OTQ3LiBUaGUKPj4gICAgYHNhbml0aXNlQXJnYCAoYW5kIGBzYW5p
dGl6ZUFyZ2AgLSB0aGlzIGlzIHRoZSBzYW1lIGFjdGlvbiBidXQgYW4KPj4gICAgYWxpYXMpIGlz
IHZ1bG5lcmFibGUgdG8gYWRkaW5nIGFuIGV4Y2Vzc2l2ZSBudW1iZXIgb2YgYXJndW1lbnRzLAo+
PiAgICB0aGVyZWJ5IGxlYWRpbmcgdG8gZGVuaWFsIG9mIHNlcnZpY2UuIFZlcnNpb24gMi45LjEw
IGZpeGVzIHRoZSBpc3N1ZS4KPj4gICAgQXMgYSB3b3JrYXJvdW5kLCBhdm9pZCB1c2luZyBydWxl
cyB0aGF0IGNvbnRhaW4gdGhlIGBzYW5pdGlzZUFyZ2AgKG9yCj4+ICAgIGBzYW5pdGl6ZUFyZ2Ap
IGFjdGlvbi4KPj4KPj4gRm9yIG1vcmUgaW5mb3JtYXRpb24sIHNlZToKPj4gICAgLSBodHRwczov
L252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNS00ODg2Ngo+PiAgICAtIGh0dHBzOi8v
Z2l0aHViLmNvbS9vd2FzcC1tb2RzZWN1cml0eS9Nb2RTZWN1cml0eS9jb21taXQvM2E1NGNjZWE2
MmQzZjcxNTFiYjA4Y2I3OGQ2MGM1ZTkwYjUzY2EyZQo+Pgo+PiBGb3IgbW9yZSBkZXRhaWxzIG9u
IHRoZSB2ZXJzaW9uIGJ1bXAsIHNlZToKPj4gICAgLSBodHRwczovL2dpdGh1Yi5jb20vb3dhc3At
bW9kc2VjdXJpdHkvTW9kU2VjdXJpdHkvcmVsZWFzZXMvdGFnL3YyLjkuOAo+PiAgICAtIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vd2FzcC1tb2RzZWN1cml0eS9Nb2RTZWN1cml0eS9yZWxlYXNlcy90YWcv
djIuOS45Cj4+ICAgIC0gaHR0cHM6Ly9naXRodWIuY29tL293YXNwLW1vZHNlY3VyaXR5L01vZFNl
Y3VyaXR5L3JlbGVhc2VzL3RhZy92Mi45LjEwCj4+Cj4+IEFsc28gdGhpcyBwYXRjaCBjaGFuZ2Ug
dGhlIF9TT1VSQ0UgdmFyaWFibGUgdGhhdCBub3cgaW5jbHVkZSBhICd2Jwo+PiBwcmVmaXhpbmcg
dGhlIHZlcnNpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5w
ZXJhbGVAbWluZC5iZT4KPj4gLS0tCj4+ICAgcGFja2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJp
dHkyLmhhc2ggfCAyICstCj4+ICAgcGFja2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJpdHkyLm1r
ICAgfCA0ICsrLS0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbW9kc2VjdXJpdHkyL21vZHNlY3Vy
aXR5Mi5oYXNoIGIvcGFja2FnZS9tb2RzZWN1cml0eTIvbW9kc2VjdXJpdHkyLmhhc2gKPj4gaW5k
ZXggZmJiN2ZhYmIzYS4uY2Q4YTk2YWEwMCAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9tb2RzZWN1
cml0eTIvbW9kc2VjdXJpdHkyLmhhc2gKPj4gKysrIGIvcGFja2FnZS9tb2RzZWN1cml0eTIvbW9k
c2VjdXJpdHkyLmhhc2gKPj4gQEAgLTEsNSArMSw1IEBACj4+ICAgIyBGcm9tIGh0dHBzOi8vZ2l0
aHViLmNvbS9vd2FzcC1tb2RzZWN1cml0eS9Nb2RTZWN1cml0eS9yZWxlYXNlcy9kb3dubG9hZC92
Mi45LjcvbW9kc2VjdXJpdHktMi45LjcudGFyLmd6LnNoYTI1Ngo+IENhbiB5b3UgdXBkYXRlIHRo
aXMgY29tbWVudCB3aXRoIHRoZSBmb2xsb3dpbmc6Cj4gICAgRnJvbSBodHRwczovL2dpdGh1Yi5j
b20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHkvcmVsZWFzZXMvZG93bmxvYWQvdjIuOS4x
MC9tb2RzZWN1cml0eS12Mi45LjEwLnRhci5nei5zaGEyNTYKPgo+IEZvciBpbmZvcm1hdGlvbiwg
SSBoYXZlIGRvd25sb2FkZWQgdGhpcyAuc2hhMjU2IGZpbGUgYW5kIGhhdmUgY2hlY2tlZCB0aGUK
PiBzaGEgdmFsdWUgYWdhaW5zdCB0aGUgc2hhMjU2IHByb3ZpZGVkIGJlbG93LiBUaGV5IG1hdGNo
IHBlcmZlY3RseS4KPgo+PiAtc2hhMjU2ICAyYTI4ZmNmY2NmZWYyMTU4MTQ4NmY5OGQ4ZDVmZTAz
OTc0OTk3NDliODM4MGY2MGVjN2JiMWMwODQ3OGUxODM5ICBtb2RzZWN1cml0eS0yLjkuNy50YXIu
Z3oKPj4gK3NoYTI1NiAgMDgxY2RhNTI5NzU0OTQxMzk5MjJmYTRiNTRmNDc0ZmVkOGE2ZGI0Yjdm
NTg2Y2IwZDNhZWVjNjM1ZjdhNGQ1MyAgbW9kc2VjdXJpdHktdjIuOS4xMC50YXIuZ3oKPiBCZXN0
IHJlZ2FyZHMsCj4gSGVydsOpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
