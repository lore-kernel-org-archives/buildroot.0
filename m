Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83076CD128A
	for <buildroot@archiver.kernel.org>; Mon,  1 Apr 2024 20:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D838179A;
	Mon,  1 Apr 2024 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQtBcSqre1NW; Mon,  1 Apr 2024 20:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 354D4819FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 354D4819FC;
	Mon,  1 Apr 2024 20:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C033C1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8DF2406F8
 for <buildroot@lists.busybox.net>; Mon,  1 Apr 2024 20:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m1_x_hpMxOoJ for <buildroot@lists.busybox.net>;
 Mon,  1 Apr 2024 20:06:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D8064049A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D8064049A
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D8064049A
 for <buildroot@buildroot.org>; Mon,  1 Apr 2024 20:06:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33ed4dd8659so3268098f8f.0
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 13:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712001968; x=1712606768;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BDrlY2w4vszQSd/oDM29+3MaVsZ9lvNmoeaI6v/fX6E=;
 b=U4UdHMqhDc58q7ZaHrUnPDSNeLyQyjQFpQFIMD5u0dX1Cm5E6Li4AFOtLh8zCbRCrr
 w8QKzf4Z+T5M/lui066qaxZYhu9ry0meEVafXP7ls5hhRUggqRHg3/bIe5WiuCk+8GUM
 ianmCO34kDzVWFcZJsccO0MfBAMKWmIDDw/9g7CeN90ch7Lb3nckHXyZckOh7EfOUeG6
 YqKDNDfd1AD+5Zv+BRxROH8XZ0O28SZiv4z8pqz9zgp7qNnpRMRGLGSBT9Ntxyx1I/db
 YFfAXhsRUGCGlbJEFUpi8LICvBzPhfCAgkCuSyhk7OlcI3+vfkqA2TSdLMADeqNS+Hiy
 PWdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUByCPpxPjrR7vsgbn+KvB1XBHIaA+xUiXu3X5m4G+g5zc5wxwNmMx6i+54YFsiGx8oYWpecdt0fgyz3ql2/uuR0vNcg8VmjQ==
X-Gm-Message-State: AOJu0YzRAQ3MXPFive4pfz75vEDbvl264beZjNi00GA+J9yMZPf+0YUp
 YNxD+pNhxYye+hLcJ4XkmS5PgjcCToduoLNFEMCbQxajj9d+uJSu2gnPokUaGPvliG3OBAQuk3V
 3
X-Google-Smtp-Source: AGHT+IGE3CNRuZXHDMMHn8UhDt3uR/Ik4J3aJgW7awI64oMpXLSNyn5cIsbw1/KuO7AGWwoWaMnQkg==
X-Received: by 2002:a5d:5281:0:b0:33d:754c:8daf with SMTP id
 c1-20020a5d5281000000b0033d754c8dafmr7543756wrv.10.1712001968438; 
 Mon, 01 Apr 2024 13:06:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 bn10-20020a056000060a00b0034354a99d43sm1903861wrb.43.2024.04.01.13.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Apr 2024 13:06:07 -0700 (PDT)
Message-ID: <ffe31d50-5eae-4838-89fb-4f142d74071e@mind.be>
Date: Mon, 1 Apr 2024 22:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
References: <20240216211344.1807353-1-raphael.melotte@mind.be>
 <20240216211344.1807353-4-raphael.melotte@mind.be>
Content-Language: en-GB
In-Reply-To: <20240216211344.1807353-4-raphael.melotte@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712001968; x=1712606768; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BDrlY2w4vszQSd/oDM29+3MaVsZ9lvNmoeaI6v/fX6E=;
 b=X0jC2pxRZlQyoxaomSv7iuWsldyyhELm9qGdR2fGowBbMgh6VRXvclDRj8ANBzrou1
 1BkY1NPZrcjSw/ejqqXFVPiM+Jw9yqUFtUbKzrF6Mc3aBUVPHLBCWRfFB2I7NeCwsM6B
 u6iPglUKbsqM94yZgngyk1FdFIju8Wk5o1/+uOn7tZ5HGal68SPdsXUGui1ekLF29enm
 /LBFdUfrXOp2wTdiDkuPiLMO6oZBjbp1yt5SYD9RCo5T8ra9Fi6McJzCKM6CeU8DAGNG
 w9BrTOKn+FVKcxJimxKMjOjp6dZ8RuozHxESGyZ4E1FuQxriSkVxXfNTUqirVlE77nvI
 kVbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=X0jC2pxR
Subject: Re: [Buildroot] [PATCH 3/5] package/mupdf: fix building shared
 libraries
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
Cc: james.hilliard1@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNi8wMi8yMDI0IDIyOjEzLCBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IHdy
b3RlOgo+IEJ5IGRlZmF1bHQgbXVwZGYgZ2VuZXJhdGVzIHN0YXRpYyBsaWJyYXJpZXMsIHNoYXJl
ZCBsaWJyYXJpZXMgbXVzdCBiZQo+IGVuYWJsZWQgZXhwbGljaXRlbHkuCj4gCj4gVGhlIE1ha2Vm
aWxlIGRvZXNuJ3QgbWFrZSBpdCBwb3NzaWJsZSB0byBidWlsZCBib3RoIHN0YXRpYyBhbmQgc2hh
cmVkCj4gbGlicywgc28gYWRkIGEgJ2RlcGVuZHMgb24nIGFjY29yZGluZ2x5LgoKICBUaGVyZSBh
cmUgbWFueSBwYWNrYWdlcyBmb3Igd2hpY2ggaXMgdGhlIGNhc2UsIGZvciBleGFtcGxlIChhbG1v
c3QpIGFsbCBDTWFrZSAKcGFja2FnZXMgLSB1bmxlc3MgYSBwYWNrYWdlIGRvZXMgc29tZXRoaW5n
IHNwZWNpZmljLCBDTWFrZSBzdXBwb3J0cyBvbmx5IHN0YXRpYyAKX29yXyBkeW5hbWljIGxpYnJh
cmllcy4KCiAgV2Ugc29sdmUgdGhhdCBieSBidWlsZGluZyBvbmx5IHNoYXJlZCBsaWJyYXJpZXMg
ZXZlbiBpZiBCUjJfU0hBUkVEX1NUQVRJQ19MSUJTIAppcyBzZXQuCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiAtLS0KPiAg
IHBhY2thZ2UvbXVwZGYvQ29uZmlnLmluIHwgNCArKysrCj4gICBwYWNrYWdlL211cGRmL211cGRm
Lm1rICB8IDUgKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVwZGYvQ29uZmlnLmluIGIvcGFja2FnZS9tdXBkZi9Db25m
aWcuaW4KPiBpbmRleCBjZjk3NzExMTYwLi4wOTJlMWQ4YWM2IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvbXVwZGYvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9tdXBkZi9Db25maWcuaW4KPiBAQCAt
MSw5ICsxLDEzIEBACj4gK2NvbW1lbnQgIk11UERGIGNhbiBidWlsZCBzdGF0aWMgb3Igc2hhcmVk
IGxpYnMsIGJ1dCBub3QgYm90aCBhdCB0aGUgc2FtZSB0aW1lLiIKPiArCWRlcGVuZHMgb24gQlIy
X1NIQVJFRF9TVEFUSUNfTElCUwo+ICsKPiAgIGNvbmZpZyBCUjJfUEFDS0FHRV9NVVBERgo+ICAg
CWJvb2wgIm11cGRmIgo+ICAgCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgaGFy
ZmJ1enoKPiAgIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfNCAjIGhhcmZidXp6
Cj4gICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBoYXJmYnV6
ego+ICAgCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfWE9SRzcKPiArCWRlcGVuZHMgb24gIUJSMl9T
SEFSRURfU1RBVElDX0xJQlMKCiAgU28gdGhpcyBiaXQgc2hvdWxkIGp1c3QgYmUgcmVtb3ZlZC4K
Cj4gICAJc2VsZWN0IEJSMl9QQUNLQUdFX0ZSRUVUWVBFCj4gICAJc2VsZWN0IEJSMl9QQUNLQUdF
X0dVTUJPX1BBUlNFUgo+ICAgCXNlbGVjdCBCUjJfUEFDS0FHRV9IQVJGQlVaWgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL211cGRmL211cGRmLm1rIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawo+IGlu
ZGV4IDA4ODk0ZDc5ODAuLmQyMTA1NDk3YmUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9tdXBkZi9t
dXBkZi5tawo+ICsrKyBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKPiBAQCAtNTAsNiArNTAsMTEg
QEAgTVVQREZfTUFLRV9PUFRTID0gXAo+ICAgCUhBVkVfT0JKQ09QWT1ubyBcCj4gICAJcHJlZml4
PSIvdXNyIgo+ICAgCj4gKyMgVGhlIGRlZmF1bHQgaW4gTXVQREYgaXMgc3RhdGljIGxpYnMKPiAr
aWZlcSAoJChCUjJfU0hBUkVEX0xJQlMpLHkpCgogIEFuZCBoZXJlIGl0IHNob3VsZCBjaGVjayBm
b3IgQlIyX1NUQVRJQ19MSUJTLgoKPiArTVVQREZfTUFLRV9PUFRTICs9IHNoYXJlZD15ZXMKCiAg
QW5kIHdlIHByb2JhYmx5IHdhbnQgYm90aCB0aGUgeWVzIGFuZCBubyBleHBsaWNpdGx5LiBTbzoK
CmlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQpNVVBERl9NQUtFX09QVFMgKz0gc2hhcmVkPW5v
CmVsc2UKTVVQREZfTUFLRV9PUFRTICs9IHNoYXJlZD15ZXMKZW5kaWYKCgogIFJlZ2FyZHMsCiAg
QXJub3V0Cgo+ICtlbmRpZgo+ICsKPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCRlJFRUdMVVQp
LHkpCj4gICBNVVBERl9ERVBFTkRFTkNJRVMgKz0gbGliZnJlZWdsdXQKPiAgIGVsc2UKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
