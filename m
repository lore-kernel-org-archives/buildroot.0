Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D78C83F37
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 19:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB3D06133C;
	Thu, 31 Aug 2023 19:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB3D06133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49gRVTp4UoNF; Thu, 31 Aug 2023 19:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE90B61331;
	Thu, 31 Aug 2023 19:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE90B61331
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F27C71BF3D4
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8B2182023
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 19:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8B2182023
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oYDtPUU5zdMB for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 19:45:25 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D681F81F27
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 19:45:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D681F81F27
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3ff7d73a6feso11727205e9.1
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 12:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693511123; x=1694115923;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oKc9j+Gvr9BkaA2NBBvcetNnOCY9PYjzXg2KTeH24K8=;
 b=DPwrlO67/O+Nj2a9clm26pb++qWBKr2MkqsWuKEVjhfiljF6qjeCfWQf0iqRDYf49i
 N1q4q1U42kvOe78UHa11OTr+P6ZSVRKXHKXwPrCJFfxMMgYbhlqiKgghJ4hQNH5WJw95
 +ZZfwCBhQrf2tXD5GEcp+E9p2eX2eo/e6xpqRSdqIlML3ycHabrbdK3tq2pnY3oQtGAL
 0omNQg9W/gZQWGPNy+bmzywwjS5N3fG9VlrSCzOgeN/rZUEGkaJubv+T5zQiqdJ1vLWA
 a1DoxJVP8qKV8B1gbdD1Ei9TyAKWtSzZBSKaZ25FXPUjjuWSZHy8CrjFcSGuRzg/C5yz
 uQoA==
X-Gm-Message-State: AOJu0Yz4SzyRZY5lDIOsd2zMP5fGru/AFActD8aqJF1HUh9jgOAq0KGl
 6L9turdnGu8vlFtaP5+RkBw=
X-Google-Smtp-Source: AGHT+IEeLTCsepg1S8tpiy9HN+LF7WX76xk3lgtFAFNHsAP/QtUHo9gzQkNRPoRVsVRhNUKVFT6UfA==
X-Received: by 2002:a7b:c8ca:0:b0:401:519:c9 with SMTP id
 f10-20020a7bc8ca000000b00401051900c9mr258219wml.13.1693511122635; 
 Thu, 31 Aug 2023 12:45:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:87f8:ae36:66c2:3a18?
 (2a01cb05945b7e0087f8ae3666c23a18.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:87f8:ae36:66c2:3a18])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1c7409000000b003fee53feab5sm2837490wmc.10.2023.08.31.12.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 12:45:22 -0700 (PDT)
Message-ID: <8fd73e29-f78f-8039-37e8-856df4ae6d9a@gmail.com>
Date: Thu, 31 Aug 2023 21:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20230831173736.84288-1-ju.o@free.fr>
Content-Language: en-US
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20230831173736.84288-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693511123; x=1694115923; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oKc9j+Gvr9BkaA2NBBvcetNnOCY9PYjzXg2KTeH24K8=;
 b=TCQ2Z5aDDUKJpo2eKxifiUw9DMcGCuREdmRefqY1cbiCnHbmRufMvnWcqi4tiYl6he
 8qJMwL26HoPDaDN+tSPOIeqQloj848EHV4gJcqkmiyID95KaWoGT5CyVlx3QFWauy/hh
 +A6/JkwxXZlJcC4YMSa74cSLzlnc1DbfpfdwLF3a5siqll50fqWpGkk//3qvwPJdmbUd
 Nrz9Sns8mOzcxJdfIsOnT1W4++xvJ8dhKUdB6KPIKfSR+e/EmMa+5lr/WCjZjdG4yA0p
 5CGxqUyk/sU8sLhTHwWJhGjox0JWCx9YwNlo1Nt5yg8tHzXRjJeyAnDQ4bCF45G4cL1h
 nHZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TCQ2Z5aD
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: python-magic-wormhole:
 fix random failures
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMzEvMDgvMjAyMyDDoCAxOTozNywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgbWFnaWMtd29ybWhvbGUgInJlY2VpdmUiIGNvbW1hbmQgY2FuIG91dHB1
dCAid2FpdGluZyIgbWVzc2FnZXMKPiB3aGVuIGtleSByZWNlaXZhbCBvciB2ZXJpZmljYXRpb24g
YXJlIGxvbmdlciB0aGFuIGEgcHJlZGVmaW5lZAo+IHRpbWVvdXQ6Cj4gaHR0cHM6Ly9naXRodWIu
Y29tL21hZ2ljLXdvcm1ob2xlL21hZ2ljLXdvcm1ob2xlL2Jsb2IvMC4xMy4wL3NyYy93b3JtaG9s
ZS9jbGkvY21kX3JlY2VpdmUucHkjTDEzNQo+IAo+IFRoZSBpbnRlbnQgaXMgdG8gaGF2ZSBhbiBp
bnRlcmFjdGl2ZSB1c2VyIGV4cGVyaWVuY2UuCj4gCj4gVGhpcyBiZWhhdmlvciBtYWtlcyB0aGUg
cnVudGltZSB0ZXN0IHVucmVsaWFibGUgYXMgdGhlIHRlc3QgYWx3YXlzCj4gZXhwZWN0IHRoZSBz
ZW50IG1lc3NhZ2UgYXMgdGhlIGV4YWN0IG91dHB1dC4gV2hlbiB0aGUgdGVzdCBleGVjdXRpb24K
PiBpcyBzbG93ZXIsIGl0IHNvbWV0aW1lcyBnZXQgdGhlICJ3YWl0aW5nIiBtZXNzYWdlIGluc3Rl
YWQgb2YgdGhlCj4gZXhwZWN0ZWQgbWVzc2FnZS4KPiAKPiBTb21lIHRlc3Qgam9icyBhcmUgc3Vj
Y2VlZGluZzoKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9q
b2JzLzQ5NjgwNTk3MzcKPiB3aGlsZSBzb21lIG90aGVyIGFyZSBmYWlsaW5nLgo+IAo+IG1hZ2lj
LXdvcm1ob2xlIGNhbiBvdmVycmlkZSB0aG9zZSB0aW1lcnMgd2l0aCBlbnZpcm9ubWVudCB2YXJp
YWJsZXMuCj4gU2VlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9tYWdpYy13b3JtaG9sZS9tYWdpYy13
b3JtaG9sZS9ibG9iLzAuMTMuMC9zcmMvd29ybWhvbGUvY2xpL2NtZF9yZWNlaXZlLnB5I0wyNgo+
IAo+IFRoaXMgY29tbWl0IHNldHMgdGhvc2UgZW52aXJvbm1lbnQgdmFyaWFibGUgdG8gbGFyZ2Vy
IHZhbHVlcwo+ICgxMDAgc2Vjb25kcyBpbnN0cmVhZCBvZiAxIGJ5IGRlZmF1bHQpLCB0byBtYWtl
IHN1cmUgdGhlIHRlc3Qgd2lsbAo+IGFsd2F5cyBwYXNzLgo+IAo+IEZpeGVzOgo+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNDk2MjkyMzIzNQo+IAo+
IFJlcG9ydGVkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KClJldmlld2VkLWJ5OiBS
b21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+ClRlc3RlZC1ieTogUm9tYWluIE5h
b3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IC0t
LQo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9tYWdpY193b3Jt
aG9sZS5weSB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfcHl0aG9uX21hZ2ljX3dvcm1ob2xlLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF9weXRob25fbWFnaWNfd29ybWhvbGUucHkKPiBpbmRleCBhYmQzNGJjYTUwLi41
YTBmMDI3N2IwIDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfcHl0aG9uX21hZ2ljX3dvcm1ob2xlLnB5Cj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9weXRob25fbWFnaWNfd29ybWhvbGUucHkKPiBAQCAtNTAsNyArNTAsOSBA
QCBjbGFzcyBUZXN0UHl0aG9uUHkzTWFnaWNXb3JtaG9sZShUZXN0UHl0aG9uUGFja2FnZUJhc2Up
Ogo+ICAgICAgICAgIGNtZCArPSAic2xlZXAgMjUiCj4gICAgICAgICAgc2VsZi5hc3NlcnRSdW5P
ayhjbWQsIHRpbWVvdXQ9MzApCj4gIAo+IC0gICAgICAgIGNtZCA9IHdvcm1ob2xlX2NtZCArICIg
cmVjZWl2ZSB7fSIuZm9ybWF0KGNvZGUpCj4gKyAgICAgICAgd29ybWhvbGVfZW52ID0gIl9NQUdJ
Q19XT1JNSE9MRV9URVNUX0tFWV9USU1FUj0xMDAgIgo+ICsgICAgICAgIHdvcm1ob2xlX2VudiAr
PSAiX01BR0lDX1dPUk1IT0xFX1RFU1RfVkVSSUZZX1RJTUVSPTEwMCAiCj4gKyAgICAgICAgY21k
ID0gd29ybWhvbGVfZW52ICsgd29ybWhvbGVfY21kICsgIiByZWNlaXZlIHt9Ii5mb3JtYXQoY29k
ZSkKPiAgICAgICAgICBvdXRwdXQsIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVuKGNtZCwg
dGltZW91dD0zNSkKPiAgICAgICAgICBzZWxmLmFzc2VydEVxdWFsKGV4aXRfY29kZSwgMCkKPiAg
ICAgICAgICBzZWxmLmFzc2VydEVxdWFsKG91dHB1dFswXSwgdGV4dCkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
