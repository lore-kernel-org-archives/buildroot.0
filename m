Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792F3C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0961741883;
	Tue, 25 Apr 2023 20:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0961741883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlhCuLziRQ6G; Tue, 25 Apr 2023 20:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B184404CB;
	Tue, 25 Apr 2023 20:25:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B184404CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CF2601BF5F8
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 20:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A84BD81F9B
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 20:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A84BD81F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlZjBVS2IUH0 for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 20:25:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0E5A81B14
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0E5A81B14
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 20:25:36 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso1149255166b.0
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 13:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682454335; x=1685046335;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cyDUGaIFP9TsmTfE6Y1ANE/Ka1HKyEg60drWHfeE+1w=;
 b=he+PbktNO+jObVJegakB0Nh+ZYo1DwWDYHSzFF1RB6bQFxqd/N0lRuCIungbszVzdK
 YBP1s8jMUDrphI86qFYMdEqdHJzAJ736Ph3nfS6w2u5JArqe5SGMsravXemEH2LKvond
 cXRg2rCNsiQ8IqJZ14MrntADsWkBuc2XWLZXCqzzFmE75ts9a4iz9xsBM9xdMM2fEQY6
 HAF9UjYF6hnaL5mGWF6tSSuOilJV+bskZpfe5ZkOGC0wDziGWU9JNgFKUXXXw084rLZR
 JPy50OrQnvCbeiwaSCKCnlaobfEBRIl7BnGiNNchQkQ437PvScua2sWWVil+e7HlZiaI
 l37A==
X-Gm-Message-State: AAQBX9e+mB1GxqD2qq50Zdtoz2zdbVJZqFZLmlOB1bZ5/Ref+az2jPEN
 kpe21cK2oGuqKwvjZ6s0IBbTocC7UDr/7yr6izqTGA==
X-Google-Smtp-Source: AKy350a0JPRbpLcRQQtG/rhAk38bUM8dBALpRzkAvp3q7lUQULYAJzgZItTuLp4BwDLl6BuVPy1S+g==
X-Received: by 2002:a17:906:a3da:b0:94f:3482:e607 with SMTP id
 ca26-20020a170906a3da00b0094f3482e607mr14648509ejb.11.1682454334784; 
 Tue, 25 Apr 2023 13:25:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a17090694d500b0094efe88a037sm7163532ejy.9.2023.04.25.13.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 13:25:34 -0700 (PDT)
Message-ID: <ca66b08b-e69f-2cc0-102e-241f0a03fa93@mind.be>
Date: Tue, 25 Apr 2023 22:25:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: =?UTF-8?Q?Niclas_G=c3=b6tting?= <niclas.goetting@t-online.de>,
 buildroot@buildroot.org
References: <00604ac1-606d-ab11-8302-619aab02bcfe@t-online.de>
In-Reply-To: <00604ac1-606d-ab11-8302-619aab02bcfe@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1682454335; x=1685046335;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cyDUGaIFP9TsmTfE6Y1ANE/Ka1HKyEg60drWHfeE+1w=;
 b=eT0d2FfXkDV0H6HC8xG/piaRI7bat1NN0hhPpy7hibcFownqxZUBNYA04jok3ZT0Kr
 6xNJBuqMxFgneHfvxLuPKcrrEq2jT99oRUCc1kR5lbkgf7QkTnzFi1gpqCDA11e03Wrh
 aTOJGX/oC0UVo6VkfhIvmg7n4eTQeN3P7OZq0zsvOaLkLAcz4eIrZ/CFNEBvq6uI8db2
 nhTlATRRCu80AkuTYIKFUP5tFib3014VomTvAPZTN6xZHn5mdxJpvgpfrn3J6YfKev7x
 SukFY/8ineXjzFaUpNZQ4wcB4GPndzvNVBHQbvlMaW/gdn93/+Rc1JiPTQi9/rBfUqaq
 hMKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eT0d2FfX
Subject: Re: [Buildroot] SWUpdate default services
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBBZGRpbmcgSmFtZXMgaW4gQ2MsIGhlIGFkZGVkIHRoaXMuCgpPbiAyNC8wNC8yMDIzIDEyOjA2
LCBOaWNsYXMgR8O2dHRpbmcgd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IGN1cnJlbnRseSwgdGhlIGBz
d3VwZGF0ZWAtcGFja2FnZSAoZm9yIGluaXQtc3lzdGVtcyBvdGhlciB0aGFuIHN5c3RlbWQpIAo+
IGF1dG9tYXRpY2FsbHkgaW5zdGFsbHMgYSBmaWxlIGNhbGxlZCAKPiBgL3Vzci9saWIvc3d1cGRh
dGUvY29uZi5kLzkwLXN0YXJ0LXByb2dyZXNzYCwgd2l0aCB0aGUgb25seSBjb250ZW50IGJlaW5n
Cj4gCj4gZXhlYyAvdXNyL2Jpbi9zd3VwZGF0ZS1wcm9ncmVzcyAtdyAtciAmCgogIFRoaXMgd2Fz
IGRvbmUgaW4gY29tbWl0IDBlOTQ0NTlhZDUyZTg3MDMzYzE3MDUyMjYxMGU4MzIxNWE0NDQyNDIg
dG8gYWxpZ24gCkJ1aWxkcm9vdCB3aXRoIHRoZSB1cHN0cmVhbS1tYWludGFpbmVkIG1ldGEtc3d1
cGRhdGUuIEkuZS4sIGluIG1ldGEtc3d1cGRhdGUgCnRoaXMgaXMgZG9uZSBieSBkZWZhdWx0LgoK
ICBJIGd1ZXNzIHRoZSBpZGVhIGlzIHRoYXQgbW9zdCBwZW9wbGUgd2FudCB0aGlzIHByb2dyZXNz
IGZlYXR1cmUuCgo+IEZvciBtZSwgdGhpcyBpcyBwcm9ibGVtYXRpYyBiZWNhdXNlIG9mIHR3byBy
ZWFzb25zOgo+IAo+ICAxLiBIYXZpbmcgYHN3dXBkYXRlLXByb2dyZXNzYCBydW5uaW5nIGluIHRo
ZSBiYWNrZ3JvdW5kIGlzIG9wdGlvbmFsIGFuZCBzaG91bGQKPiAgICAgdGhlcmVmb3JlIG5vdCBi
ZSB0aGUgZGVmYXVsdC4KCiAgSWYgeW91IGRvbid0IHdhbnQgaXQsIHlvdSBjYW4gYWx3YXlzIHJl
bW92ZSBpdCBpbiBhIHBvc3QtYnVpbGQgc2NyaXB0LgoKPiAgMi4gVGhlIHByb2Nlc3MgaXMgbm90
IGhhbmRsZWQgdmlhIGEgc2VydmljZSwgYnV0IGlzIHN0YXJ0ZWQgZXZlcnkgdGltZSB0aGUKPiAg
ICAgYHN3dXBkYXRlYCBzZXJ2aWNlIGlzIHN0YXJ0ZWQuIElmIHlvdSByZXN0YXJ0IFNXVXBkYXRl
IGZpdmUgdGltZXMsIHRoZXJlCj4gICAgIHdpbGwgYmUgZml2ZSBgc3d1cGRhdGUtcHJvZ3Jlc3Ng
IHByb2Nlc3Nlcy4KCiAgVGhhdCBpcyBpbmRlZWQgYW5ub3lpbmcuIEknbSBub3QgcmVhbGx5IHN1
cmUgaG93IHRoaXMgY29uZi5kIHdvcmtzLiBXb3VsZCAKdGhlcmUgYmUgYSB3YXkgdG8gdXNlIHN0
YXJ0LXN0b3AgZGFlbW9uIGluc3RlYWQgKGFuZCBjcmVhdGUgYSBwaWQgZmlsZSksIGFuZCAKc3Rv
cCBpdCBpbiB0aGUgaW5pdCBzY3JpcHQ/CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IE1heWJlIEkg
aGF2ZSBvdmVyc2VlbiBzb21ldGhpbmcsIGJ1dCBJIGJlbGlldmUgdGhlIGZpbGUgc2hvdWxkIG5v
dCBoYXZlIGJlZW4gCj4gdGhlcmUgaW4gdGhlIGZpcnN0IHBsYWNlIGFuZCBJIHdvdWxkIHByZWZl
ciB0byBhZGQgbXkgb3duIHNjcmlwdHMgaWYgSSBuZWVkZWQgCj4gdGhlbS4gSW4gYW55IGNhc2Us
IEkgd291bGQgcHJvcG9zZSBhbiBvcHRpb24gdG8gZGlzYWJsZSBpbnN0YWxsaW5nIHRoaXMgZmls
ZS4KPiAKPiBCZXN0IHJlZ2FyZHMKPiBOaWNsYXMKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
