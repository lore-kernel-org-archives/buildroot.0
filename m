Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D82C7EE22
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 09:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE50341D3C;
	Wed, 10 May 2023 09:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE50341D3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0oW8zx81gflG; Wed, 10 May 2023 09:04:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAE3640359;
	Wed, 10 May 2023 09:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE3640359
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6EAA21BF2A6
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 09:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54AC240359
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 09:04:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54AC240359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-VtKTGoR5yt for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 09:04:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDBBB40220
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EDBBB40220
 for <buildroot@buildroot.org>; Wed, 10 May 2023 09:04:52 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f450815d0bso7869535e9.0
 for <buildroot@buildroot.org>; Wed, 10 May 2023 02:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683709491; x=1686301491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9ryqQDTPUcksFcVqCqZDZpF2WBaaWob8FgLp5ZuVD1M=;
 b=LrwiebLrivM1eBqPLnuk1RSmCGVTYQDKgTUSBp3odzw5WvMDU3jLHKHnh3aA6h2AsA
 pHzJejknq0aLW6nVOYbe0Bn+Yw4+Xnaifw17T1E1wEqheyVTjDrfsZD6QlSXUz83BAdI
 kIy2KD1xjMbPSbG/ad6fPzdmmAt/ksAnOJhn3V67CCzKKQ3Svzy0SPHnihCJuDSKxqbD
 2eV+lkpSETjnSItn9vEx6F1bdTh5LYJJpAjORZQEevk/etALMwoBgi1xuLEUWphd4/di
 nCe/cRdG9BdswpAVqh10OaBxxKfcFUU0Cpx/b/hDE0idHbZs7m/BBO9XmGbr/caI7USw
 F9vw==
X-Gm-Message-State: AC+VfDw/oSt3fgPeKJVdbtDDA4zQtGO3MAg/CUcCmKSnHf4zjXI9W86a
 KMEIdrAICnIWZNTUhyCzu4vDjg==
X-Google-Smtp-Source: ACHHUZ481NPgw7p0v6o1LnCpsThXaVDTgSiBr1GgSc8PktLjNCOyi1cnmy7R8affb9D2wKREzOny/w==
X-Received: by 2002:adf:f08b:0:b0:307:aec0:4296 with SMTP id
 n11-20020adff08b000000b00307aec04296mr1239680wro.12.1683709490842; 
 Wed, 10 May 2023 02:04:50 -0700 (PDT)
Received: from [10.5.2.122]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adfed8f000000b003047f7a7ad1sm16784865wro.71.2023.05.10.02.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:04:50 -0700 (PDT)
Message-ID: <960705d8-1d90-c1c3-e166-bafdcf1a53f1@smile.fr>
Date: Wed, 10 May 2023 11:04:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20230502220451.3087471-1-romain.naour@gmail.com>
 <20230507130347.GS252090@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230507130347.GS252090@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1683709491; x=1686301491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9ryqQDTPUcksFcVqCqZDZpF2WBaaWob8FgLp5ZuVD1M=;
 b=WrcehWN7bFNeCFwU/WaKdxpSK4kYf5QG+VgMkEki20hJJXLhKbSsbstTcK/rqK7ctu
 qCaW/U+eOb6MNA1gpQqXO3hUbTqlHevCqOhsOqYtNOdO0H2gVJSm5eID+CUSw4yv3d+O
 OOEMbRfmD48iswLB511mJkVHB5xO0PdcNd6FqIS5bhEjq1AgdzEj4jP5K180HWV1RYik
 lEr2CDD/BPJsUjmVgvl1BP02g3WIpk2jKRT4KMlwrE9BJAZrRPryJc+cxyXOtyUUZzTR
 ZZyweK4GY0HCk8FdtaQQY5BXX6Iaj8ZbKTAVmoW7u2gCJ3fPu01YD7wugt3tn7pzcjOz
 Ihaw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=WrcehWN7
Subject: Re: [Buildroot] [PATCH] package/busybox: disable sha1/sha256
 hwaccel with x86 musl toolchains
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwgQWxsLAoKTGUgMDcvMDUvMjAyMyDDoCAxNTowMywgWWFubiBFLiBNT1JJTiBhIMOp
Y3JpdMKgOgo+IFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjMtMDUtMDMgMDA6MDQgKzAyMDAsIFJv
bWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+IEJ1eHlib3gncyBpbml0IHNlZ2ZhdWx0IHdoZW4g
YnVpbHQgd2l0aCB4ODYgbXVzbCB0b29sY2hhaW4gZHVlIHRvCj4+IHJlY2VudCBjaGFuZ2VzIGFi
b3V0IHNoYTEgYW5kIHNoYTE1NiBod2FjY2VsIHN1cHBvcnQgaW4gQnVzeWJveCAxLjM2LjAuCj4+
Cj4+IEZyb20gQWxwaW5lbGludXggWzFdOgo+PiAibWFpbi9idXN5Ym94OiBkaXNhYmxlIHNoYSBo
d2FjY2VsCj4+ICB0aGUgZmxhZyBjaGVjayBmb3IgdGhpcyBzZWVtcyBpbmNvcnJlY3QtIGl0IHRy
aWdnZXJzIHNoYV9uaSB1c2Ugd2hlbgo+PiAgdGhlIGluc3RydWN0aW9ucyBhcmVuJ3QgYXZhaWxh
YmxlLCBidXQgYXZ4NTEydmwvYncgaXMgLSBFbGx5IG9uIGlyYwo+Pgo+PiAgY2F1c2VzIGZhaWx1
cmVzIGluIGdpdGh1YiBhY3Rpb25zLCB3aGljaCBoYXZlIGF2eDUxMiBidXQgbm8gc2hhX25vIgo+
Pgo+PiBUaGUgZmxhZyBjaGVjayBzaG91bGQgYmUgZml4ZWQgdXBzdHJlYW0gYnkgY29tbWl0IFsy
XS4KPj4KPj4gQnV0IGluaXQgc3RpbGwgY3Jhc2ggd2l0aCB0aGUgbGF0ZXN0IDFfMzZfc3RhYmxl
ICh3aXRoIGJhY2twb3J0ZWQgcGF0Y2gpCj4+IGFuZCBtYXN0ZXIgYnJhbmNoLi4uCj4+Cj4+IERp
c2FibGUgc2hhIGh3YWNjZWwgd2l0aCB4ODYgbXVzbCB0b29sY2hhaW5zIHVudGlsIHRoZSBpc3N1
ZSBpcyBmaXhlZC4KPiAKPiBCdXQgd2h5IGlzIGl0IHNwZWNpYWwgdG8gbXVzbCwgaWYgdGhlIGlz
c3VlIGlmIGFib3V0IGhhcmR3YXJlCj4gaW5zdHJ1Y3Rpb25zIG5vdCBiZWluZyBhdmFpbGFibGU/
CgpTb3JyeSwgSSB3YXMgcnVubmluZyBvdXQgb2YgdGltZSB0byBpbnZlc3RpZ2F0ZSBmdXJ0aGVy
IHRoZSBpc3N1ZS4KCj4gCj4gQW5kIGluZGVlZCwgdGhlIE9FIHBhdGNoIHlvdSByZWZlcmVuY2Vk
IGFsc28gc3RhdGVzICJ3ZSBzZWUgc2FtZSBvbgo+IGdsaWJjIHN5c3RlbXMgdG9vIi4KCkkgd2Fz
IG5vdCBhYmxlIHRvIHJlcHJvZHVjZSB3aXRoIGdsaWJjLgoKPiAKPiBUaGUgcmVmZXJlbmNlZCB0
aHJlYWQgaW4gdGhlIGJ1c3lib3ggTUwgc2VlbSB0byBoaW50IGF0IGEgbXVzbCBkeW5hbWljCj4g
bGlua2VyIGlzc3VlLCBiZWNhdXNlIGVieCBpcyBjbG9iYmVyZWQuIFNvIHRoZXJlIGlzIG5vIHJl
YXNvbiB0aGUgaXNzdWUKPiBjYW4ndCBoYXBwZW4gd2l0aCB0aGUgb3RoZXIgQyBsaWJyYXJpZXMu
Li4KCk9rLgoKPiAKPiBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKTm90ZTogdGhlIGRlZmlu
ZSBpcyBzdGlsbCBuYW1lZCBCVVNZQk9YX01VU0xfRElTQUJMRV9TSEFfSFdBQ0NFTCBhZnRlciB5
b3VyCnJld29yayA6KQoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gUmVnYXJkcywKPiBZYW5u
IEUuIE1PUklOLgo+IAo+PiBDaGVja2VkIHRoYXQgcWVtdV94ODZfNjRfZGVmY29uZmlnIHdpdGgg
bXVzbCBmb3IgeDg2XzY0IGZvciBjb3JlMiBib290Cj4+IGFzIGV4cGVjdGVkIHdpdGggc2hhIGh3
YWNjZWwgZW5hYmxlZC4KPj4KPj4gVGhlIHNhbWUgd29ya2Fyb3VuZCBoYXMgYmVlbiBhcHBsaWVk
IHRvIG9wZW5lbWJlZGRlZC1jb3JlIFszXS4KPj4KPj4gWzFdIGh0dHBzOi8vZ2l0LmFscGluZWxp
bnV4Lm9yZy9hcG9ydHMvY29tbWl0L21haW4vYnVzeWJveD9pZD1hZTJjZmRmNmY2ZGEzZGM0NmVl
MDlkOGNlYWZhMjY5MjFmNmUwNThlCj4+IFsyXSBodHRwczovL2dpdC5idXN5Ym94Lm5ldC9idXN5
Ym94L2NvbW1pdC8/aWQ9YmQ3NmI3NWY3MmY3MTcxNTBiOTA5ZThjNjRlZGZkYTcyNWNhYmUxMQo+
PiBbM10gaHR0cHM6Ly9naXRodWIuY29tL29wZW5lbWJlZGRlZC9vcGVuZW1iZWRkZWQtY29yZS9j
b21taXQvMjJmNjM5ZDYxMTI3ZjRiODJhNzkwMDhjNTMwNWU0NGUwOTBhMzY4MAo+Pgo+PiBGaXhl
czoKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvdG9vbGNoYWlucy1idWlsZGVy
Ly0vam9icy80MjAyMjc2NzIxCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9t
YWluLm5hb3VyQGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBwYWNrYWdlL2J1c3lib3gvYnVzeWJveC5t
ayB8IDEwICsrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2J1c3lib3gvYnVzeWJveC5tayBiL3BhY2thZ2UvYnVz
eWJveC9idXN5Ym94Lm1rCj4+IGluZGV4IDE2MzNjYTUyNWQuLmViNzBmMTJmODYgMTAwNjQ0Cj4+
IC0tLSBhL3BhY2thZ2UvYnVzeWJveC9idXN5Ym94Lm1rCj4+ICsrKyBiL3BhY2thZ2UvYnVzeWJv
eC9idXN5Ym94Lm1rCj4+IEBAIC0yNzYsNiArMjc2LDE1IEBAIGRlZmluZSBCVVNZQk9YX0lOU1RB
TExfSU5ESVZJRFVBTF9CSU5BUklFUwo+PiAgZW5kZWYKPj4gIGVuZGlmCj4+ICAKPj4gKyMgRGlz
YWJsZSBTSEExIGFuZCBTSEEyNTYgSFdBQ0NFTCB3aXRoIHg4NiBtdXNsIHRvb2xjaGFpbnMKPj4g
KyMgdG8gYXZvaWQgc2VnZmF1bHQgd2l0aCBpbml0Lgo+PiAraWZlcSAoJChCUjJfVE9PTENIQUlO
X1VTRVNfTVVTTCk6JChCUjJfaTM4NikseTp5KQo+PiArZGVmaW5lIEJVU1lCT1hfTVVTTF9ESVNB
QkxFX1NIQV9IV0FDQ0VMCj4+ICsJJChjYWxsIEtDT05GSUdfRElTQUJMRV9PUFQsQ09ORklHX1NI
QTFfSFdBQ0NFTCkKPj4gKwkkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfU0hBMjU2
X0hXQUNDRUwpCj4+ICtlbmRlZgo+PiArZW5kaWYKPj4gKwo+PiAgIyBPbmx5IGluc3RhbGwgb3Vy
IGxvZ2dpbmcgc2NyaXB0cyBpZiBubyBvdGhlciBwYWNrYWdlIGRvZXMgaXQuCj4+ICBpZmVxICgk
KEJSMl9QQUNLQUdFX1NZU0tMT0dEKSQoQlIyX1BBQ0tBR0VfUlNZU0xPRykkKEJSMl9QQUNLQUdF
X1NZU0xPR19ORyksKQo+PiAgZGVmaW5lIEJVU1lCT1hfSU5TVEFMTF9MT0dHSU5HX1NDUklQVAo+
PiBAQCAtMzY0LDYgKzM3Myw3IEBAIGVuZGVmCj4+ICBCVVNZQk9YX1RBUkdFVF9GSU5BTElaRV9I
T09LUyArPSBCVVNZQk9YX0lOU1RBTExfQUREX1RPX1NIRUxMUwo+PiAgCj4+ICBkZWZpbmUgQlVT
WUJPWF9LQ09ORklHX0ZJWFVQX0NNRFMKPj4gKwkkKEJVU1lCT1hfTVVTTF9ESVNBQkxFX1NIQV9I
V0FDQ0VMKQo+PiAgCSQoQlVTWUJPWF9TRVRfTU1VKQo+PiAgCSQoQlVTWUJPWF9QUkVGRVJfU1RB
VElDKQo+PiAgCSQoQlVTWUJPWF9TRVRfTURFVikKPj4gLS0gCj4+IDIuMzQuMwo+Pgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
