Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137D0C54E65
	for <buildroot@archiver.kernel.org>; Wed, 21 May 2025 22:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B48AC83A80;
	Wed, 21 May 2025 22:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kvSajLvvlePs; Wed, 21 May 2025 22:18:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B500083AC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B500083AC9;
	Wed, 21 May 2025 22:18:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D8BE69
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 437EA40C1A
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QFY171cIAkHP for <buildroot@buildroot.org>;
 Wed, 21 May 2025 22:18:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA69940C09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA69940C09
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA69940C09
 for <buildroot@buildroot.org>; Wed, 21 May 2025 22:18:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so45044065e9.2
 for <buildroot@buildroot.org>; Wed, 21 May 2025 15:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747865912; x=1748470712;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=grmtkS8IhiN3wzAwl3Px2ZG+7JjyS/GwZ1f7jaCEOW0=;
 b=Xh4vfB5H2cS1y0z0rRreF99xa3Zc8Aso3flDDcgtFNZbPEo+O7jPGLi3nZLXFlMRA8
 130Q8ISfFtpfOOCQOkUS4lEyD30X29bvWIJxwEnflByitAlb25nMST55B1sYm+JVkEjy
 s7EjqRV7wvRtT8VoRjr4ynhCSkJpwlV1rQEmBM3AxXHD606e79Dpk+S0egx0K8BQy/XB
 Me8euTc4ya0sWaMwTlSzVWjpdZv3QZ3x3IZu9SI3smmufxg3k7vRnmbHFLWr6CdpuUb1
 KNgdo24Vxa4EW2reonfSFH1g+Ql8IwYvvB2oqQObzwHBQCXnNhUm/te1cj1xbHwg8D+A
 XafA==
X-Gm-Message-State: AOJu0YxpbIJUOP5rT2KtJI1KQ+FinzmYtD+Uo7+QCBT4rgsEbhC9TYTD
 HUcRQjcd/9o2xlF06+4o3uv2z0/M6+BujcBZMTYl+xDlTZH7kmUhsPXzaYgjg6+NpLA=
X-Gm-Gg: ASbGncusN/oBK43/pRshH6z/y2b37TN+eqFHIURkAZ1KH8gNY1uNtdL3OaKaClo7UMM
 K0POv+vdaI49KH2M4dk4iTtKJ86Obv4ybzToGFacRDVIOuDcHT/VDe51r1cZSETVYTJW/BmXK/r
 IHbN48onRghQQPcmVaG/7OxzfVSc5RsrEiR/FRzfwCKTIjk/XBY2zKM8nMCLaSf03PuyCLWKmH3
 /C3gtuidDgNRLuK7v/FbCmNWFmH5iMltne+kR11A9VFIVqqngV1lT9Xajhl73hqvQCmA7zxnYkK
 EQyNIwLyfCAqCHlocOfBp/DtMSJyPj7xx2AUm3cmg4s5wWGq7fhOz9bBXxE0eAWOoY/GNyy+DFS
 vGTCO2mlHmVghhiOMsqp127TXhqiqSVmdYTo=
X-Google-Smtp-Source: AGHT+IGh1EtwAH+IRWtorNyr0Bv+d0dixDXeF1CTubeTBWvz2YBPaSToH3E/Zo1P9GnFcskQrMgF0Q==
X-Received: by 2002:a05:600c:4f42:b0:442:dc75:5625 with SMTP id
 5b1f17b1804b1-442fd60cb7bmr207872195e9.5.1747865911895; 
 Wed, 21 May 2025 15:18:31 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f3dd99f9sm82787795e9.40.2025.05.21.15.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 15:18:31 -0700 (PDT)
Message-ID: <a0598fb2-b98c-4d12-aee9-84e7e0ffab30@mind.be>
Date: Thu, 22 May 2025 00:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 thomas.perale@mind.be
References: <20250519150314.4117224-1-titouan.christophe@mind.be>
 <e8e97e2086c469e0c1b93d6455f6991c@free.fr>
Content-Language: en-US
In-Reply-To: <e8e97e2086c469e0c1b93d6455f6991c@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1747865912; x=1748470712; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=grmtkS8IhiN3wzAwl3Px2ZG+7JjyS/GwZ1f7jaCEOW0=;
 b=PjQsZ0N0U0v+Crqx4ydxfqqoYhLlbPqe7buDITyMB4FsnApzc5Z6UD9HGuiw2XP8wA
 u46xGuRkqT8rLYNrAyKDF1llp5aORAKLXG1/g5ZjPsth/xvYsFeb8R5mb7KpAsogNupU
 RuWMbE+THrH/jK1YyMm2Oni0i8Wit1mmbS6eI3RN9afmKO0+qcBohYFvcTMTOZnrbsLe
 qMBeeMl8SF7VzpfZssF0cWrrtbUEJthAlgDyP613z+6y0pymNh9339cWIsTPcGTfl2b6
 F55hMA6VLMCURZns9NyO4+z7P+gBD8D0f0FYKEV0yNl6Z84XycEoQYi4gA2P6TzcMn4D
 +sRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PjQsZ0N0
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/python-tornado: apply
 security patch for CVE-2025-47287
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

SGVsbG8gSnVsaWVuLAoKU29ycnkgSSB0aG91Z2h0IEkgdGVzdGVkIHRoaXMgb25lLiBJIGp1c3Qg
c2VudCBhIHYyLgoKUmVnYXJkcywKClRpdG91YW4KCk9uIDIxLzA1LzI1IDIxOjA3LCBKdWxpZW4g
T2xpdmFpbiB3cm90ZToKPiBIaSBUaXRvdWFuLAo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guCj4K
PiBVbmZvcnR1bmF0ZWx5LCB0aGUgcGFja2FnZSBwYXRjaCBpcyBub3QgYXBwbHlpbmcgYXMgaXMu
IFNlZSBiZWxvdy4KPgo+IE9uIDE5LzA1LzIwMjUgMTc6MDMsIFRpdG91YW4gQ2hyaXN0b3BoZSB2
aWEgYnVpbGRyb290IHdyb3RlOgo+PiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgQ1ZFOgo+PiAt
IENWRS0yMDI1LTQ3Mjg3OiBXaGVuIFRvcm5hZG8ncyBgYG11bHRpcGFydC9mb3JtLWRhdGFgYCBw
YXJzZXIgCj4+IGVuY291bnRlcnMKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjZXJ0YWluIGVycm9ycywgaXQgbG9ncyBhIHdhcm5pbmcgYnV0IGNvbnRpbnVlcyAKPj4gdHJ5
aW5nIHRvCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFyc2UgdGhlIHJl
bWFpbmRlciBvZiB0aGUgZGF0YS4gVGhpcyBhbGxvd3MgcmVtb3RlCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYXR0YWNrZXJzIHRvIGdlbmVyYXRlIGFuIGV4dHJlbWVseSBo
aWdoIHZvbHVtZSBvZiAKPj4gbG9ncywKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb25zdGl0dXRpbmcgYSBEb1MgYXR0YWNrLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUaXRv
dWFuIENocmlzdG9waGUgPHRpdG91YW4uY2hyaXN0b3BoZUBtaW5kLmJlPgo+PiAtLS0KPj4gVGhl
IHBhdGNoIGhlcmViZWxvdyBpcyBhbiBhbHRlcm5hdGl2ZSB0byB0aGUgdmVyc2lvbiBidW1wIG9m
IAo+PiBweXRob24tdG9ybmFkbwo+PiB2Ni40LjIgLT4gdjYuNSBwcm9wb3NlZCBpbiBteSBwcmV2
aW91cyBlbWFpbAo+PiAoaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWls
ZHJvb3QvMjAyNS1NYXkvNzc5ODMzLmh0bWwpLgo+PiBJbmRlZWQsIHdlIG1heSBub3Qgd2FudCB0
byBwZXJmb3JtIGEgbWlub3IgdmVyc2lvbiBidW1wIG9mIHRoYXQgCj4+IHBhY2thZ2UgaW4KPj4g
QnVpbGRyb290IExUUyAyMDI1LjAyLng7IG90aGVyd2lzZSBzaW1wbHkgaWdub3JlIHRoaXMgcGF0
Y2gKPj4gLS0tCj4+IMKgLi4ubC1yYWlzZS1lcnJvcnMtaW5zdGVhZC1vZi1sb2dnaW5nLWluLnBh
dGNoIHwgMjM0ICsrKysrKysrKysrKysrKysrKwo+PiDCoHBhY2thZ2UvcHl0aG9uLXRvcm5hZG8v
cHl0aG9uLXRvcm5hZG8ubWvCoMKgwqDCoMKgIHzCoMKgIDMgKwo+PiDCoDIgZmlsZXMgY2hhbmdl
ZCwgMjM3IGluc2VydGlvbnMoKykKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgCj4+IHBhY2thZ2Uv
cHl0aG9uLXRvcm5hZG8vMDAwMS1odHRwdXRpbC1yYWlzZS1lcnJvcnMtaW5zdGVhZC1vZi1sb2dn
aW5nLWluLnBhdGNoCj4+Cj4+IGRpZmYgLS1naXQgCj4+IGEvcGFja2FnZS9weXRob24tdG9ybmFk
by8wMDAxLWh0dHB1dGlsLXJhaXNlLWVycm9ycy1pbnN0ZWFkLW9mLWxvZ2dpbmctaW4ucGF0Y2gg
Cj4+IGIvcGFja2FnZS9weXRob24tdG9ybmFkby8wMDAxLWh0dHB1dGlsLXJhaXNlLWVycm9ycy1p
bnN0ZWFkLW9mLWxvZ2dpbmctaW4ucGF0Y2ggCj4+Cj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+
IGluZGV4IDAwMDAwMDAwMDAuLmVlODk0MmVhNmQKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgCj4+
IGIvcGFja2FnZS9weXRob24tdG9ybmFkby8wMDAxLWh0dHB1dGlsLXJhaXNlLWVycm9ycy1pbnN0
ZWFkLW9mLWxvZ2dpbmctaW4ucGF0Y2gKPj4gQEAgLTAsMCArMSwyMzQgQEAKPj4gK0Zyb20gY2M2
MTA1MGU4ZjI2Njk3NDYzMTQyZDk5ODY0YjU2MmU4NDcwYjQxZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKPj4gK0Zyb206IEJlbiBEYXJuZWxsIDxiZW5AYmVuZGFybmVsbC5jb20+Cj4+ICtEYXRl
OiBUaHUsIDggTWF5IDIwMjUgMTM6Mjk6NDMgLTA0MDAKPj4gK1N1YmplY3Q6IFtQQVRDSF0gaHR0
cHV0aWw6IFJhaXNlIGVycm9ycyBpbnN0ZWFkIG9mIGxvZ2dpbmcgaW4KPj4gKyBtdWx0aXBhcnQv
Zm9ybS1kYXRhIHBhcnNpbmcKPj4gKwo+PiArV2UgdXNlZCB0byBjb250aW51ZSBhZnRlciBsb2dn
aW5nIGFuIGVycm9yLCB3aGljaCBhbGxvd2VkIHJlcGVhdGVkCj4+ICtlcnJvcnMgdG8gc3BhbSB0
aGUgbG9ncy4gVGhlIGVycm9yIHJhaXNlZCBoZXJlIHdpbGwgc3RpbGwgYmUgbG9nZ2VkLAo+PiAr
YnV0IG9ubHkgb25jZSBwZXIgcmVxdWVzdCwgY29uc2lzdGVudCB3aXRoIG90aGVyIGVycm9yIGhh
bmRsaW5nIGluCj4+ICtUb3JuYWRvLgo+PiArCj4+ICtVcHN0cmVhbTogCj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS90b3JuYWRvd2ViL3Rvcm5hZG8vY29tbWl0L2IzOWI4OTJiZjc4ZmU4ZmVhMDFkZDQ1
MTk5YWE4ODMwN2U3MTYyZjMKPj4gKwo+PiArQ1ZFOiBDVkUtMjAyNS00NzI4Nwo+PiArCj4+ICtT
aWduZWQtb2ZmLWJ5OiBUaXRvdWFuIENocmlzdG9waGUgPHRpdG91YW4uY2hyaXN0b3BoZUBtaW5k
LmJlPgo+PiArLS0tCj4+ICsgdG9ybmFkby9odHRwdXRpbC5wecKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMwICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiArIHRvcm5hZG8vdGVz
dC9odHRwc2VydmVyX3Rlc3QucHkgfMKgIDQgKystLQo+PiArIHRvcm5hZG8vdGVzdC9odHRwdXRp
bF90ZXN0LnB5wqDCoCB8IDEzICsrKysrKysrLS0tLS0KPj4gKyB0b3JuYWRvL3dlYi5wecKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxNyArKysrKysrKysrKysrLS0tLQo+PiAr
IDQgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCj4+ICsK
Pj4gK2RpZmYgLS1naXQgYS90b3JuYWRvL2h0dHB1dGlsLnB5IGIvdG9ybmFkby9odHRwdXRpbC5w
eQo+PiAraW5kZXggNzA0NGFjYTAyLi5lZjQ2MDk4NWUgMTAwNjQ0Cj4+ICstLS0gYS90b3JuYWRv
L2h0dHB1dGlsLnB5Cj4+ICsrKysgYi90b3JuYWRvL2h0dHB1dGlsLnB5Cj4+ICtAQCAtMzQsNyAr
MzQsNiBAQAo+PiArIGZyb20gdXJsbGliLnBhcnNlIGltcG9ydCB1cmxlbmNvZGUsIHVybHBhcnNl
LCB1cmx1bnBhcnNlLCBwYXJzZV9xc2wKPj4gKwo+PiArIGZyb20gdG9ybmFkby5lc2NhcGUgaW1w
b3J0IG5hdGl2ZV9zdHIsIHBhcnNlX3FzX2J5dGVzLCB1dGY4LCAKPj4gdG9fdW5pY29kZQo+PiAr
LWZyb20gdG9ybmFkby5sb2cgaW1wb3J0IGdlbl9sb2cKPgo+IFJ1bm5pbmcgdGhlIGNvbW1hbmQ6
Cj4KPiDCoMKgwqAgbWFrZSBweXRob24tdG9ybmFkby1wYXRjaAo+Cj4gZmFpbHMgaGVyZSB3aXRo
IG91dHB1dDoKPgo+IMKgwqDCoCA+Pj4gcHl0aG9uLXRvcm5hZG8gNi40LjIgUGF0Y2hpbmcKPgo+
IMKgwqDCoCBBcHBseWluZyAwMDAxLWh0dHB1dGlsLXJhaXNlLWVycm9ycy1pbnN0ZWFkLW9mLWxv
Z2dpbmctaW4ucGF0Y2ggCj4gdXNpbmcgcGF0Y2g6Cj4gwqDCoMKgIHBhdGNoaW5nIGZpbGUgdG9y
bmFkby9odHRwdXRpbC5weQo+IMKgwqDCoCBIdW5rICMxIEZBSUxFRCBhdCAzNC4KPiDCoMKgwqAg
Li4uCj4KPiBDb3VsZCB5b3Ugc2VuZCBhbiB1cGRhdGVkIHBhdGNoIGFkZHJlc3NpbmcgdGhpcyBp
c3N1ZSwgcGxlYXNlPwo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVsaWVuLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
