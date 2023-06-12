Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6203C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 17:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 659BC400B7;
	Mon, 12 Jun 2023 17:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 659BC400B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4zhsyFvM_GN; Mon, 12 Jun 2023 17:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E7AF4155E;
	Mon, 12 Jun 2023 17:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E7AF4155E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8C431BF306
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9239561295
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9239561295
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MjbCUUUYdv0R for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 17:57:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54BDA61294
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54BDA61294
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 17:57:55 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-51492ae66a4so6603721a12.1
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 10:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686592673; x=1689184673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IU5liCCFTougWHEXY0i6v5vi1uTQs7QogAXTdFeoprY=;
 b=eq7P9xpwzQhBLMguLYC/Kn+RIkeG/eGRi/skjeEB7Ao1IwT9QktGYGc8rQHN9bu3MX
 7Mdy0pEDcXeea1jLiIBA0z3Da7wC5n9MI34JSz8OwvVOxBzzHQVhbFCVwiheerzuYun5
 9DXvBGGL7M4uqmth0ktWcJOdZ1wSOLPl01l/GzcN/IHPn6pB0akMP5pPr5017GIAGD/V
 APkZFzV2p9i9GhquBEiShXEAu7ZqcT5zlZglxXR72epmTEjK7mNNvJdFO3QcKFv/MmCG
 y3uzZHuDBRMUBHOxmlwxHRHUEwzFJBgU1cg8x8FrhzBTqm3OeG3eeRpLQy8YpuF1TfzZ
 Pa3Q==
X-Gm-Message-State: AC+VfDy3eiAEAFfN4nc4MYhNQryCX8QYiyt9rKT+T8c27YaZcvQFRUPI
 3BfUkzPgpkfU3PtQ6rm1k5QKZxOFwPDLVT/x7DA=
X-Google-Smtp-Source: ACHHUZ6ReuSjNVPhCof2Y77MMJnBHvR/SNVEG+EDUoOT/F19CXTKjqGeD+DsMVdYiLFPv+mTvjT3UQ==
X-Received: by 2002:aa7:cf02:0:b0:514:ae18:1637 with SMTP id
 a2-20020aa7cf02000000b00514ae181637mr5268971edy.23.1686592673307; 
 Mon, 12 Jun 2023 10:57:53 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a056402124400b00510de087302sm5289911edw.47.2023.06.12.10.57.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 10:57:52 -0700 (PDT)
Message-ID: <e659cf98-e6dd-9975-ee03-84338214b99d@mind.be>
Date: Mon, 12 Jun 2023 19:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
References: <20230608175538.1347170-1-salvador.joseluis@gmail.com>
 <ZIN33i5P-uTd5O3M@hs>
In-Reply-To: <ZIN33i5P-uTd5O3M@hs>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1686592673; x=1689184673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IU5liCCFTougWHEXY0i6v5vi1uTQs7QogAXTdFeoprY=;
 b=G5gcXRFXd/WEcqpGVIL+d7dIuw8ACOF6aJVAtivgaCkYTw8tutxJt2+SHVmZijZlOT
 6bieBPQpiW9jg7h8VyLERl5pIMLDZQrOqjnl8EhoeIfRKJ2Qk0CyrTAkS9FHqo9P2xgT
 4zRXq6xnbLh4dSECZcHaaXFcvZhUTdTFW5LiK85lLV9yBxmfKwIQDhseDf93D66cCcy8
 lvDi0OsfBnsF7UQIUZNoz+nf7ekmErXnkh1qjJwQLbs1N8pWD+qmmsaOoZHiDYGHVJuk
 npQ4I99ywncKHOLCPzehBVIGAKuL9aVpZG79PKGWVi/VUg9mR1uAu9Btm78R/tuq8nDp
 KwIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G5gcXRFX
Subject: Re: [Buildroot] [PATCH] package/zfs: fix autotools crosscompilations
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
Cc: Michael Zimmermann <sigmaepsilon92@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOS8wNi8yMDIzIDIxOjA1LCBBbGV4YW5kZXIgTXVraGluIHdyb3RlOgo+IEpvc8OpLAo+
IAo+IEkgYW0gZ2xhZCB0byBjb25maXJtIHRoYXQgeW91ciBwYXRjaCBmaXhlcyB0aGUgaXNzdWUu
IFRlc3RlZCBvbjoKPiAKPiBIb3N0Ogo+IERlYmlhbiAxMS43IHg4Ni02NAo+IAo+IFRvb2xjaGFp
bnM6Cj4geDg2LTY0LS1nbGliYy0tYmxlZWRpbmctZWRnZS0yMDIyLjA4Cj4gYXJtdjYtZWFiaWhm
LS1nbGliYy0tYmxlZWRpbmctZWRnZS0yMDIyLjA4ID4KPiBUaGFuayB5b3UhCj4gCj4gLS0gCj4g
QWxleGFuZGVyLgo+IAoKICBIaSBBbGV4YW5kZXIsCgogIFRoYW5rIHlvdSBmb3IgdGhpcyB0ZXN0
LiBJbiB0aGUgZnV0dXJlLCBwbGVhc2UgYWRkIHRoZSBmb2xsb3dpbmcgdGFnIAoocHJlZmVyYWJs
eSBiZWxvdyB0aGUgc2lnbmVkLW9mZi1ieSwgbGlrZSBJIGRvIGJlbG93KS4KCj4gT24gVGh1LCBK
dW4gMDgsIDIwMjMgYXQgMDc6NTU6MzhQTSArMDIwMCwgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZv
IHdyb3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZh
ZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4KClRlc3RlZC1ieTogQWxleGFuZGVyIE11a2hpbiA8YWxl
eGFuZGVyLmkubXVraGluQGdtYWlsLmNvbT4KCihhbmQgcHV0IHRoZSBkZXRhaWxzIGFib3V0IGhv
dyB5b3UgdGVzdGVkIGJlbG93IHRoYXQpLgoKVGhpcyBnZXRzIHBpY2tlZCB1cCBieSBwYXRjaHdv
cmsgYW5kOgoKLSBhZGRzIHRvIHRoZSBUIGNvbHVtbiBpbiB0aGUgcGF0Y2h3b3JrIG92ZXJ2aWV3
LCBzbyB3ZSBjYW4gc2VlIGF0IGEgZ2xhbmNlIHRoYXQgCml0J3MgYSBwYXRjaCB0aGF0IGhhcyBi
ZWVuIHRlc3RlZCBieSBzb21lb25lOwotIGJlY29tZXMgcGFydCBvZiB0aGUgY29tbWl0IG1lc3Nh
Z2Ugd2hlbiBhcHBseWluZyB0byB0aGUgbWFpbmxpbmUgdHJlZSwgc28gaWYgCnRoZXJlJ3MgYSBw
cm9ibGVtIGxhdGVyIHdlIGNhbiBlYXNpbHkgc2VlIGluIGhpc3RvcnkgdGhhdCB5b3Ugb3JpZ2lu
YWxseSB0ZXN0ZWQgCml0LiBBbHNvLCB0aGF0IHdheSBQZXRlciBjYW4gZ2l2ZSB5b3UgY3JlZGl0
IGluIHRoZSByZWxlYXNlIG5vdGVzLgoKICBSZWdhcmRzLAogIEFybm91dAoKPj4gLS0tCj4+ICBw
YWNrYWdlL3pmcy96ZnMubWsgfCA4ICsrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdl
L3pmcy96ZnMubWsKPj4gaW5kZXggOTdlOTQ0MmNmOC4uZTk5NDEzZTYxMSAxMDA2NDQKPj4gLS0t
IGEvcGFja2FnZS96ZnMvemZzLm1rCj4+ICsrKyBiL3BhY2thZ2UvemZzL3pmcy5tawo+PiBAQCAt
NTgsNiArNTgsMTQgQEAgZWxzZQo+PiAgWkZTX0NPTkZfT1BUUyArPSAtLWRpc2FibGUtcGFtCj4+
ICBlbmRpZgo+PiAgCj4+ICsjIFNldHMgdGhlIGVudmlyb25tZW50IGZvciB0aGUgYG1ha2VgIHRo
YXQgd2lsbCBiZSBydW4gWkZTIGF1dG90b29scyBjaGVja3MuCj4+ICtaRlNfQ09ORl9FTlYgKz0g
XAo+PiArCUFSQ0g9JChLRVJORUxfQVJDSCkgXAo+PiArCUNST1NTX0NPTVBJTEU9IiQoVEFSR0VU
X0NST1NTKSIKPj4gK1pGU19NQUtFX0VOViArPSBcCj4+ICsJQVJDSD0kKEtFUk5FTF9BUkNIKSBc
Cj4+ICsJQ1JPU1NfQ09NUElMRT0iJChUQVJHRVRfQ1JPU1MpIgo+PiArCj4+ICAjIFpGUyB1c2Vy
bGFuZCB0b29scyBhcmUgdW5mdW5jdGlvbmFsIHdpdGhvdXQgdGhlIExpbnV4IGtlcm5lbCBtb2R1
bGVzLgo+PiAgWkZTX01PRFVMRV9TVUJESVJTID0gXAo+PiAgCW1vZHVsZS9hdmwgXAo+PiAtLSAK
Pj4gMi40MS4wCj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
