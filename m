Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82939C54E90
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 22:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 350D383B3F;
	Wed, 21 May 2025 22:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLHBYwjQcB_W; Wed, 21 May 2025 22:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 321E183B4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 321E183B4A;
	Wed, 21 May 2025 22:37:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDA0169
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF06A408DD
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9IwKlfPEsR-O for <buildroot@buildroot.org>;
 Wed, 21 May 2025 22:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C44B440784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C44B440784
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C44B440784
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:37:02 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so60407085e9.1
 for <buildroot@buildroot.org>; Wed, 21 May 2025 15:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747867020; x=1748471820;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CaAV3D4sqm77lOTfcQnuQMq87ry7Yn31mv6vGGjpSbY=;
 b=GL6G6hEqOLXl+AmMia5zlmIJKCzXCGJ0Hp1YOUE8rrQ6ch1Cy1gQLXlHqbwOGQ052R
 t2cIfVxCfYQk/+HrbI5H9zREgMt2e+2rwwfokOArJW86IaW1FE/iRTQiLircZ9TEDn0e
 mQwP4JW2S/wwMPV0jyyNIoTRuv5eWp3ush8Nm+raMDD4u1swii1rfVEz09et4mG/Y7lH
 Nti40Jb78ZqoIZmH9UcZGtLKpChJH45WpReCNeoxEuEokiJXyyvJYOjwS1GspG9wfkRp
 skKG4LDcHvM7po7GKJ1Vaq4yOcQVKE3px2ZVjB26zSGLgWT9Xc1pIvUlIbQ2wQ/lYVTO
 r0lA==
X-Gm-Message-State: AOJu0Yyg5ysueqqkdkr+Cwp2rp2zPT5+zN+sGxZ0KQaxFGiNiPlqy6/q
 kEkk6gTOyTDItTV7pRbKzP+RRaO+l0kakEb9fJuUa9ItvhmKfLY0idMRME0ng9OKBMqiWaUdcEv
 g6AyhwAA=
X-Gm-Gg: ASbGncvMHDWyvNiH5ONhrHbsqNCFHa8SP4vHdC6RrJ7Vry9yMHFNjVquRs3E9lXzfRz
 Lto840xDI0Fw2AddLFNLVLb5d0WxTd+67gCq/hgLHCnUkED8FKtU8ddt0nw86Nl+ma/aHCC2+/W
 srRe8imGWlnOXOh1Qv+GPQcqIaSg8AWRIi+im4qXX/YwGQr6VPQWCG54pYTdLXN9xhnQA5vnUFb
 WVAmRtkjYA+kn0Bu2+Y7svc+SnBuAClIEGj+M5oo2zCirs4BbXy7w7gVPI3blIzNkHC6LeVN3iY
 YFzrFr+zSIlF94HRCFlcwvgkoMRHxm8onNN2JwbEwhh9Kam08JHGSxMowgtiCr0G/W9+fy8zzfr
 xb3CHrMTAx9d/lzaoB7pOJgSoEOJ1a+hwaNw=
X-Google-Smtp-Source: AGHT+IGW1rRyG7xn01kKCENFZqHKSoaLPd6meQmbX82FeEr9qLmdBx7OyjwnOIG12Vb/c9BjZGzC+Q==
X-Received: by 2002:a05:600d:c:b0:442:ff8e:11ac with SMTP id
 5b1f17b1804b1-442ff8e1221mr187046605e9.12.1747867020566; 
 Wed, 21 May 2025 15:37:00 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f38142f1sm83351525e9.31.2025.05.21.15.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 15:37:00 -0700 (PDT)
Message-ID: <0ee9d6bc-3088-46c3-ac65-1251df8d5c2a@mind.be>
Date: Thu, 22 May 2025 00:36:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, thomas.perale@mind.be
References: <20250519142045.4025181-1-titouan.christophe@mind.be>
 <4b74d4f679cd99c41533fd5dc7e1cd40@free.fr>
Content-Language: en-US
In-Reply-To: <4b74d4f679cd99c41533fd5dc7e1cd40@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747867020; x=1748471820; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CaAV3D4sqm77lOTfcQnuQMq87ry7Yn31mv6vGGjpSbY=;
 b=IKM+k0faAq5Mhz/nZK9RZinYb2q5O+ZgJm/9mjsOae3rp/rnMtoQVrS45LGoLg15Wv
 A/Omp7uSDZk3B9C7svDYVFcmau7j8WxxF6Q/UJz/OuTVjIMVOX1KaLM2IqluiaLZA7Vi
 83bfEwdkZnFhBq1PNaXKNb3bkLJuq6rfLkx/AMIDOF0o1I4EVJScGCkrxC5iVuG80LZ7
 AqmoMQpi6XiD6TvncQQY2UOlL3YU9hsqdH1ydD9cjE/tzhSMz/cy+MJCQOrMFxyZ+bEr
 7wqkkU+m4vCJolYEM/Ve/qLUaHN99V7u9rt8+ckXHS9fcHMPyWeiSWKzNkXiWA97zPBr
 +o7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IKM+k0fa
Subject: Re: [Buildroot] [PATCH] package/bootstrap: apply security patch for
 CVE-2024-6531
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKU29ycnkgYWdhaW4gZm9yIG5vdCBoYXZpbmcgcHJvcGVybHkgdGVzdGVk
IHRoaXMuCgpVbmZvcnR1bmF0ZWx5LCB0aGUgcGF0Y2ggaXMgaW50ZW5kZWQgZm9yIEJvb3RzdHJh
cCdzIG9yaWdpbmFsIHNvdXJjZSAKY29kZSwgYnV0IEJ1aWxkcm9vdCBkb3dubG9hZHMgYSBkaXN0
IGFyY2hpdmUsIHdoZXJlIGFsbCBKYXZhc2NyaXB0L0NTUyAKZmlsZXMgaGF2ZSBiZWVuIGNvbXBp
bGVkIGFuZCBidW5kbGVkIHRvZ2V0aGVyLiBIZW5jZSB3aHkgdGhlIHBhdGNoIApkb2Vzbid0IGFw
cGx5LgoKU2luY2UgQm9vdHN0cmFwIDQgaXMgbm8gbG9uZ2VyIHN1cHBvcnRlZCB1cHN0cmVhbSAo
b25seSBhIGNvbW1lcmNpYWwgCmZvcmsgYXQgaHR0cHM6Ly93d3cuaGVyb2RldnMuY29tL3N1cHBv
cnQvbmVzLWJvb3RzdHJhcCksIGFuZCBjb21pbmcgdXAgCndpdGggYSBtb2RpZmllZCBwYXRjaCBm
b3IgdGhlIEJvb3RzdHJhcCBkaXN0IGFyY2hpdmUgaXMgYSBsb3Qgb2Ygd29yaywgSSAKd291bGQg
cmF0aGVyIHVwZ3JhZGUgQm9vdHN0cmFwIHRvIGEgbWFpbnRhaW5lZCB2ZXJzaW9uLCBhbmQgbGl2
ZSB3aXRoIAp0aGUgQ1ZFIGZvciBub3cuCgpUaGFuayB5b3UgZm9yIHJldmlld2luZyAhCgpSZWdh
cmRzLAoKVGl0b3VhbgoKT24gMjEvMDUvMjUgMTk6NTgsIEp1bGllbiBPbGl2YWluIHdyb3RlOgo+
IEhpIFRpdG91YW4sCj4KPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPgo+IFVuZm9ydHVuYXRlbHks
IHRoZSBwYWNrYWdlIHBhdGNoIGRvZXMgbm90IGFwcGx5LiBTZWUgYmVsb3cuCj4KPiBPbiAxOS8w
NS8yMDI1IDE2OjIwLCBUaXRvdWFuIENocmlzdG9waGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4g
Rml4ZXMgdGhlIGZvbGxvd2luZyBDVkU6Cj4+IC0gQ1ZFLTIwMjQtNjUzMTogQSB2dWxuZXJhYmls
aXR5IGhhcyBiZWVuIGlkZW50aWZpZWQgaW4gQm9vdHN0cmFwCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHRoYXQgZXhwb3NlcyB1c2VycyB0byBDcm9zcy1TaXRlIFNjcmlwdGlu
ZyAoWFNTKSAKPj4gYXR0YWNrcy4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
VGhlIGlzc3VlIGlzIHByZXNlbnQgaW4gdGhlIGNhcm91c2VsIGNvbXBvbmVudCwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2hlcmUgdGhlIGRhdGEtc2xpZGUgYW5kIGRhdGEt
c2xpZGUtdG8gYXR0cmlidXRlcwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
YW4gYmUgZXhwbG9pdGVkIHRocm91Z2ggdGhlIGhyZWYgYXR0cmlidXRlIG9mIGFuIDxhPgo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YWcgZHVlIHRvIGluYWRlcXVhdGUgc2Fu
aXRpemF0aW9uLgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGlzIHZ1bG5l
cmFiaWxpdHkgY291bGQgcG90ZW50aWFsbHkgZW5hYmxlIAo+PiBhdHRhY2tlcnMgdG8KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXhlY3V0ZSBhcmJpdHJhcnkgSmF2YVNjcmlw
dCB3aXRoaW4gdGhlIHZpY3RpbSdzIAo+PiBicm93c2VyLgo+Pgo+PiBObyAib2ZmaWNpYWwiIHBh
dGNoIGhhcyBiZWVuIHJlbGVhc2VkIHVwc3RyZWFtLCBhcyBCb290c3RyYXAgNCBpcyBFT0wKPj4g
c2luY2UgMjAyMy0wMS0wMSwgYW5kIHNlY3VyaXR5IHVwZGF0ZXMgYXJlIHNoaXBwZWQgb25seSB3
aXRoIGNvbW1lcmNpYWwKPj4gc3VwcG9ydC4gU28gd2UgdXNlIERlYmlhbidzIHVub2ZmaWNpYWwg
cGF0Y2ggaW5zdGVhZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGl0b3VhbiBDaHJpc3RvcGhlIDx0
aXRvdWFuLmNocmlzdG9waGVAbWluZC5iZT4KPj4gLS0tCj4+IMKgcGFja2FnZS9ib290c3RyYXAv
MDAwMS1DVkUtMjAyNC02NTMxLnBhdGNoIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKwo+PiDC
oHBhY2thZ2UvYm9vdHN0cmFwL2Jvb3RzdHJhcC5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMyArKwo+PiDCoDIgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQo+PiDCoGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Jvb3RzdHJhcC8wMDAxLUNWRS0yMDI0LTY1MzEucGF0Y2gK
Pj4KPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYm9vdHN0cmFwLzAwMDEtQ1ZFLTIwMjQtNjUzMS5w
YXRjaCAKPj4gYi9wYWNrYWdlL2Jvb3RzdHJhcC8wMDAxLUNWRS0yMDI0LTY1MzEucGF0Y2gKPj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uMWUxNzJkNDQ0ZAo+PiAt
LS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvYm9vdHN0cmFwLzAwMDEtQ1ZFLTIwMjQtNjUz
MS5wYXRjaAo+PiBAQCAtMCwwICsxLDQ5IEBACj4+ICtGcm9tOiBCYXN0aWVuX1JvdWNhcmllcyA8
cm91Y2FAZGViaWFuLm9yZz4KPj4gK0RhdGU6IFN1biwgMTMgQXByIDIwMjUgMTI6MzM6MjIgKzAy
MDAKPj4gK1N1YmplY3Q6IENWRS0yMDI0LTY1MzEKPj4gKwo+PiArQW4gYW5jaG9yIGVsZW1lbnQg
KDxhPiksIHdoZW4gdXNlZCBmb3IgY2Fyb3VzZWwgbmF2aWdhdGlvbiB3aXRoIGEgCj4+IGRhdGEt
c2xpZGUgYXR0cmlidXRlLAo+PiArY2FuIGNvbnRhaW4gYW4gaHJlZiBhdHRyaWJ1dGUgdmFsdWUg
dGhhdCBpcyBub3Qgc3ViamVjdCB0byBwcm9wZXIgCj4+IGNvbnRlbnQgc2FuaXRpemF0aW9uLgo+
PiArSW1wcm9wZXIgZXh0cmFjdGlvbiBvZiB0aGUgaW50ZW5kZWQgdGFyZ2V0IGNhcm91c2VsJ3Mg
I2lkIGZyb20gdGhlIAo+PiBocmVmIGF0dHJpYnV0ZQo+PiArY2FuIGxlYWQgdG8gdXNlIGNhc2Vz
IHdoZXJlIHRoZSBjbGljayBldmVudCdzIHByZXZlbnREZWZhdWx0KCkKPj4gK2lzIG5vdCBhcHBs
aWVkIGFuZCB0aGUgaHJlZiBpcyBldmFsdWF0ZWQgYW5kIGV4ZWN1dGVkLgo+PiArQXMgYSByZXN1
bHQsIHJlc3RyaWN0aW9ucyBhcmUgbm90IGFwcGxpZWQgdG8gdGhlIGRhdGEgdGhhdCBpcyAKPj4g
ZXZhbHVhdGVkLCB3aGljaAo+PiArY2FuIGxlYWQgdG8gcG90ZW50aWFsIFhTUyB2dWxuZXJhYmls
aXRpZXMuCj4+ICsKPj4gK3JldHVybiBmYWxzZSBpbiBjYXNlIG9mIGVycm9yIHRoYXQgd2lsbCBh
dm9pZCB0aGUgWFNTIGF0dGFjaywgYW5kIAo+PiBhdm9pZCBmdXJ0aGVyCj4+ICt0cmVhdG1lbnQg
YnkgdGhlIGhhbmRsZXIuCj4+ICsKPj4gK2J1ZzogaHR0cHM6Ly93d3cuaGVyb2RldnMuY29tL3Z1
bG5lcmFiaWxpdHktZGlyZWN0b3J5L2N2ZS0yMDI0LTY1MzEKPj4gK2J1Zy1kZWJpYW46IGh0dHBz
Oi8vYnVncy5kZWJpYW4ub3JnL2NnaS1iaW4vYnVncmVwb3J0LmNnaT9idWc9MTA4NDA1OQo+PiAr
YnVnLWRlYmlhbi1zZWN1cml0eTogCj4+IGh0dHBzOi8vc2VjdXJpdHktdHJhY2tlci5kZWJpYW4u
b3JnL3RyYWNrZXIvQ1ZFLTIwMjQtNjUzMQo+PiArCj4+ICtVcHN0cmVhbTogCj4+IGh0dHBzOi8v
c2Fsc2EuZGViaWFuLm9yZy9qcy10ZWFtL3R3aXR0ZXItYm9vdHN0cmFwNC8tL2Jsb2IvMTkyNTAw
NzA0MWNmODhiZGUwMmFmMjNjOTUwN2FkOWU3NDI2ZTM2Mi9kZWJpYW4vcGF0Y2hlcy8wMDAzLUNW
RS0yMDI0LTY1MzEucGF0Y2gKPj4gKwo+PiArQ1ZFOiBDVkUtMjAyNC02NTMxCj4+ICsKPj4gK1tU
aXRvdWFuOiBzdHJpcHBlZCBhd2F5IFVURi04IGNoYXJhY3RlcnMgZnJvbSB0aGUgcGF0Y2ggYm9k
eSBhbmQgCj4+IGF1dGhvciBuYW1lXQo+PiArU2lnbmVkLW9mZi1ieTogVGl0b3VhbiBDaHJpc3Rv
cGhlIDx0aXRvdWFuLmNocmlzdG9waGVAbWluZC5iZT4KPj4gKy0tLQo+PiArIGpzL3NyYy9jYXJv
dXNlbC5qcyB8IDQgKystLQo+Cj4gVGhlIGJvb3RzdHJhcCBzb3VyY2UgYXJjaGl2ZSB1c2VkIGlu
IEJ1aWxkcm9vdCBkb2VzIG5vdCBjb250YWluIHRoaXMgCj4gZmlsZS4KPiBSdW5uaW5nIHRoZSBj
b21tYW5kOgo+Cj4gwqDCoMKgIG1ha2UgYm9vdHN0cmFwLXBhdGNoCj4KPiBmYWlscyB3aXRoIG91
dHB1dDoKPgo+IMKgwqDCoCA+Pj4gYm9vdHN0cmFwIDQuMy4xIFBhdGNoaW5nCj4KPiDCoMKgwqAg
QXBwbHlpbmcgMDAwMS1DVkUtMjAyNC02NTMxLnBhdGNoIHVzaW5nIHBhdGNoOgo+IMKgwqDCoCBj
YW4ndCBmaW5kIGZpbGUgdG8gcGF0Y2ggYXQgaW5wdXQgbGluZSAzNAo+Cj4gQ291bGQgeW91IGhh
dmUgYSBsb29rIHRvIHNvbHZlIHRoaXMgaXNzdWUsIHBsZWFzZT8KPgo+IEJlc3QgcmVnYXJkcywK
Pgo+IEp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
