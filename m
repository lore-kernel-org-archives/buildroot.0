Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14943C369D7
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 09:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84174414D3;
	Thu, 24 Apr 2025 09:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2d_rglcb4vEh; Thu, 24 Apr 2025 09:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74F68414C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74F68414C7;
	Thu, 24 Apr 2025 09:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 955742A6
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 09:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8613583A0C
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 09:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v67pQStom5Mb for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 09:56:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 736CB810BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 736CB810BD
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 736CB810BD
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 09:56:05 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso584462f8f.1
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 02:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745488563; x=1746093363;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fXiB7cssGGZ1P/YEPAv5OL8mD8LO105bP+otKI1a+jc=;
 b=FcnmFtxWtFaHxwwr0ucEErhVkZScMcPYtm8LhXQAy8Mja6m68mr4lV5fNJ7XCbd3tS
 C7gEk4J1TRBLe7wcxzAIvg6piTAnjNcv5+SfRJcjVXzfwd1D/B/5hna81spHTvjd1SO+
 UQkJRq6FQ889YmSjXlnKGzSjzCq/gifO3jim3Mc7ju9Z4i175En0pcOF1yN9ux7CzE9C
 8u2kp8pEFB701jks5ZrRRwBz3Ep7vVuhCzoeAjdhZ8+QEFYtQ76XHu0MvwLHmatWZyLc
 rlUMFYi/hua+rCe+dVaxYuAI4wwHsGKE2qZgy0oDvVeFUfdcHy5bMMWIBtiPSsXIpTY0
 LueQ==
X-Gm-Message-State: AOJu0YxSq6ADEpblijymuzdSdJiD/Yga/2DMt1fY7o2fJrf2C/21mF2p
 qDhPMQKyOt0CBUaA9hU+KQGU/PM5SYfs/YLFSmGvNG3o5HqMOcQPGVcDraOjnTw7s0+wY2CTYxV
 5ebo=
X-Gm-Gg: ASbGnct7iU9mp24yvGIqMwFocQaTa5PmwJKVDlTVQTOMTDz5bOe5cC0v9XLbuBk4330
 doYodHab9aHkyBmCwOk03GzklSzNlhaPWcsIKg337f61N3dpXuWPlNMJkcK4gwBPPSapKeKm10H
 1NG1hBd3y7pyCTtEPYIBmG/5QlH+kLI6bt0HWUA+ajx7ZZAJ5I+QGbRlUh1VAHmVjGXgbvi4yzU
 47i6o9xlQnW/hHQax8BfLkm/VNvkGZFidAOj4PGCLeAFR/LXKQUQDuBg568tBcUC8/IZQ5oaN8Y
 wQXzW+QlKwf5LVjObvvL9QRcBkSqLPQivB/a27lydOJ8A5dUgMr4X4ArhaC5cz1v5mqBF74N2zx
 tkE8hq/dzjjtx+JtLZEjuXRU/2JC4LWM=
X-Google-Smtp-Source: AGHT+IGIRSv677gZqVMvM4Scr2OwiiLRaj9ovSxpxkDq1zMr12/C6trnmYKjG0RgDiXrlBoXIl4cCw==
X-Received: by 2002:a5d:588f:0:b0:39a:c9ed:8555 with SMTP id
 ffacd0b85a97d-3a06cf5da72mr1469041f8f.23.1745488563509; 
 Thu, 24 Apr 2025 02:56:03 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4a807bsm1535873f8f.20.2025.04.24.02.56.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 02:56:03 -0700 (PDT)
Message-ID: <bb89af11-a7c2-4a0f-a6cf-182b1a6574be@smile.fr>
Date: Thu, 24 Apr 2025 11:56:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, David Pierret <david.pierret@smile.fr>
References: <20250422085337.901025-1-elmehdi.younes@smile.fr>
 <20250422085337.901025-2-elmehdi.younes@smile.fr>
 <8cceb503700c740599f9047e9fe6cd0b@free.fr>
Content-Language: en-US
In-Reply-To: <8cceb503700c740599f9047e9fe6cd0b@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745488563; x=1746093363; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fXiB7cssGGZ1P/YEPAv5OL8mD8LO105bP+otKI1a+jc=;
 b=fsG1unLHnD1qxPpELhAYeL930v/hvrRaRMJs4JGimO8E8WjkWpXlpBSq3NvYlP/m1B
 2FHktZ3FPOUPY157ZY8tts03D+wlh6Pk5RPE80Yvh9+EsIcCi/zA34GvVU2y0FucZviL
 D9hMVp884uEKWNQAf3w7K6gq44rLmqmJVNMxw=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fsG1unLH
Subject: Re: [Buildroot] [PATCH 2/2] support/test: new bat runtime test
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLCBoaSBhbGwsCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpJJ3ZlIGp1c3Qgc2Vu
dCB0aGUgdjIgb2YgdGhpcyBwYXRjaCwgYWRkcmVzc2luZyB0aGUgcmVxdWVzdGVkIGNoYW5nZXMu
CgpMZXQgbWUga25vdyBpZiBhbnl0aGluZyBlbHNlIGlzIG5lZWRlZC4KCkJlc3QgcmVnYXJkcywK
CkVsIE1laGRpCgpMZSAyMy8wNC8yMDI1IMOgIDIxOjE5LCBKdWxpZW4gT2xpdmFpbiBhIMOpY3Jp
dMKgOgo+IEhpIEVsIE1lZGhpLAo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2ghCj4KPiBPbiAyMi8w
NC8yMDI1IDEwOjUzLCBFbCBNZWhkaSBZT1VORVMgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gQWRk
IGEgcnVudGltZSB0ZXN0IGZvciB0aGUgJ2JhdCcgcGFja2FnZSB0byB2ZXJpZnkgdGhhdCB0aGUg
YmluYXJ5IAo+PiBleGVjdXRlcwo+PiBjb3JyZWN0bHkgaW4gYSBtaW5pbWFsIEJ1aWxkcm9vdCBy
b290ZnMuVGhlIHRlc3QgY2hla3MgdGhhdDoKPj4gLSAnYmF0IC0tdmVyc2lvbicgcnVucyB3aXRo
b3V0IGVycm9yCj4+IC0gJ2JhdCcgY2FuIHJlYWQgYW5kIGRpc3BsYXkgYSB0ZXh0IGZpbGUKPj4g
LSB0aGUgZGlzcGxheWVkIGNvbnRlbnQgbWF0Y2hlcyB0aGUgZXhwZWN0ZWQgc3RyaW5nCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEVsIE1laGRpIFlPVU5FUyA8ZWxtZWhkaS55b3VuZXNAc21pbGUuZnI+
Cj4+IC0tLQo+PiDCoHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfYmF0LnB5IHwg
MjYgKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKQo+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X2JhdC5weQo+Pgo+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9iYXQucHkgCj4+IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9iYXQucHkKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4u
NzQ5ZmIzOGU4NQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfYmF0LnB5Cj4+IEBAIC0wLDAgKzEsMjYgQEAKPj4gK2ltcG9ydCBvcwo+
PiAraW1wb3J0IGluZnJhLmJhc2V0ZXN0Cj4+ICsKPj4gKwo+PiArY2xhc3MgVGVzdEJhdChpbmZy
YS5iYXNldGVzdC5CUlRlc3QpOgo+PiArwqDCoMKgIGNvbmZpZyA9IGluZnJhLmJhc2V0ZXN0LkJB
U0lDX1RPT0xDSEFJTl9DT05GSUcgKyBcCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIiIgo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBCUjJfUEFDS0FHRV9CQVQ9eQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiIiIKPj4gKwo+PiArwqDCoMKgIGRlZiB0ZXN0X3J1bihzZWxmKToKPj4g
K8KgwqDCoMKgwqDCoMKgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAi
aW1hZ2VzIiwgCj4+ICJyb290ZnMuY3BpbyIpCj4+ICvCoMKgwqDCoMKgwqDCoCBzZWxmLmVtdWxh
dG9yLmJvb3QoYXJjaD0iYXJtdjciLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBrZXJuZWw9ImJ1aWx0aW4iLAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcHRpb25zPVsiLWluaXRy
ZCIsIGNwaW9fZmlsZV0pCj4+ICvCoMKgwqDCoMKgwqDCoCBzZWxmLmVtdWxhdG9yLmxvZ2luKCkK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgIyBDaGVjayB0aGUgcHJvZ3JhbXMgY2FuIGV4ZWN1dGUK
Pj4gK8KgwqDCoMKgwqDCoMKgIHNlbGYuYXNzZXJ0UnVuT2soImJhdCAtLXZlcnNpb24iKQo+PiAr
wqDCoMKgwqDCoMKgwqAgc2VsZi5hc3NlcnRSdW5PaygiZWNobyAnaGVsbG8gdGVzdCcgPiB0ZXN0
LnR4dCIpCj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgICMgUnVuIGJhdCBhbmQgY2FwdHVyZSBvdXRw
dXQKPj4gK8KgwqDCoMKgwqDCoMKgIG91dHB1dCA9IHNlbGYuZW11bGF0b3IucnVuKCJiYXQgdGVz
dC50eHQiLCB0aW1lb3V0PTEwKQo+Cj4gVGhlIGVtdWx0b3IucnVuKCkgZnVuY3Rpb24gcmV0dXJu
cyBhIHR1cGxlIChvdXRwdXQsIGV4aXRfY29kZSkuIFNlZSBbMV0uCj4KPiBDb3VsZCB5b3U6Cj4g
MS4gZ2V0IHRoZSBvdXRwdXQgYXJyYXkgYW5kIHRoZSByZXR1cm4gY29kZSBpbiBzZXBhcmF0ZSB2
YXJpYWJsZXMKPiDCoCAoaW4geW91ciBwYXRjaCBvdXRwdXRbMV0gaXMgaW4gZmFjdCB0aGUgZXJy
b3IgY29kZSB3aGljaCBpcwo+IMKgwqAgbm90IGNoZWNrZWQpCj4gMi4gY2hlY2sgdGhlIHJldHVy
biBjb2RlIGlzIGEgc3VjY2VzcyAoYmVmb3JlIGNoZWNraW5nIHRoZQo+IMKgwqAgb3V0cHV0IGNv
bnRlbnQpCj4gMy4gam9pbiB0aGUgb3V0cHV0IHN0cmluZyB3aXRoIGEgbmV3LWxpbmUsIGUuZy4g
IlxuIi5qb2luKG91dHB1dCkKPiDCoMKgIHRvIGhhdmUgYSBzdHJpbmcgdGhhdCB3aWxsIGJldHRl
ciBsb29rIGxpa2UgdG8gdGhlIGFjdHVhbAo+IMKgwqAgb3V0cHV0Lgo+Cj4gU2VlIGZvciBleGFt
cGxlIFsyXS4KPgo+IEkgYWxyZWFkeSBhcHBsaWVkIHRoZSBmaXJzdCBwYXRjaCBvZiB0aGlzIHNl
cmllcywgc28geW91IGNhbgo+IHNpbXBseSBzZW5kIGEgdjIgb2YgdGhpcyBydW50aW1lIHRlc3Qu
Cj4KPj4gK8KgwqDCoMKgwqDCoMKgIHNlbGYuYXNzZXJ0SW4oImhlbGxvIHRlc3QiLCAnICcuam9p
bihvdXRwdXRbMF0pKQo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgo+Cj4gWzFdIAo+IGh0
dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNS4wMi4x
L3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weSNMMTg3Cj4gWzJdIAo+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNS4wMi4xL3N1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfYXR0ci5weSNMNjIKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
