Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E211DC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 21:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6833740C28;
	Sun, 18 May 2025 21:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0cgxR4pt5jW; Sun, 18 May 2025 21:07:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B96C540BF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B96C540BF8;
	Sun, 18 May 2025 21:07:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 134011BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F1640BE6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvuaV5OmlD0G for <buildroot@buildroot.org>;
 Sun, 18 May 2025 21:07:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D7C4040810
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C4040810
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7C4040810
 for <buildroot@buildroot.org>; Sun, 18 May 2025 21:07:03 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a361b8a66cso1311414f8f.2
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747602422; x=1748207222;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tw2LtODUiSuX7D2Zm/UCUqEfmu6lXx7+YW/UIbt4+Ug=;
 b=FjzKg79l+hLsKMnphbPLI/zqCoV/qHuwL6Rqywlj0VbPJjBSegREbsMXMqGw/UeVbv
 mTbv9TpekYbReb7jtlaQpXJXf+YNFSA4Ig8tblFwfC5XcvSlwxTF9y0M9d4ioXMNMGum
 iD61o2xR9AeKnedpWDvq2Y3twIQ1zHGF3LUQ9dKccUVTCKx3XGGbZPssbsWouyG+T46o
 Fy1pEVRiHYN/gV/lOKFmI8ajrHMl+UNn6smAWPMys8XD/zmeiZqNDcmArqHUYtsuQ316
 frkVaRmbrda0ERn6IbXTJg+k8yOh24g+5SbfZap1cQHraQQc34vY2OX9lrWtrTtvMz/Y
 A3tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdMgwhBiFVcNesEo9bMJ7rUp0QavFxF8UqkKvHK7KsdL3kioyktxqUc+L3qOAtt3vRPaEf77mMjA8=@buildroot.org
X-Gm-Message-State: AOJu0YyYdKr2Ym2y+RvBUWVUNrb4ZOg+IEd53DsTW9eI9zvMUVVLKr3g
 gUJ5z7Y5vMu2RwSp8kwBVRXGLlU66SiZBC1trNjF1uAlUSv6uaEsUKGvbaMRacbyitTqf5i467W
 boJV8
X-Gm-Gg: ASbGncul4egxZzASGAV8592tVu4M4hVEcmXDovfLtIv/I/cVhEMLj7p6D6UzOwbKYr+
 SdULCirBNEDPa/Qqg3ol3sOWTYqBZrGg1y34jpUGZipSujw0V/GXDPXUPuvJQ8ZZJw77x4jgxm5
 1vUA3Ls/hAWrOYj/Ki0ycjNJr5Qsd/cILOe3wJgI3ywCuwZ0nc92OmHw2wLIybRHovFNMpHn+Uw
 7BThufsfIs/PmKBcRdjJ+wwmaaKPhk/fXfJwg2OFzJXO0wQ09yLHWmVpZLiMOSn7JaWCVN2ibWK
 cNxJGhhDeGxKduc/bds+wx0MXi6x5axU6H8zfUU9fEp0V8r02c6QdewJnMdCvA6p59YWFFN2hBT
 joqGEFvVe7ZAnv82ECJGO8isidc8HdZwPyLV/u8Omz2ktc5a7a2EmndHgIo/xt7GkGSKp5tLKVB
 cD33gymmeobafypQ==
X-Google-Smtp-Source: AGHT+IGpiitHboqKe/PCC5xUanzCLBHW5BKdOF7d0RkE+7NNEl1wGDtO2GH8RwuinYPV4qv8JxMlIQ==
X-Received: by 2002:a05:6000:2283:b0:3a1:fa6c:4736 with SMTP id
 ffacd0b85a97d-3a35c85816cmr10017139f8f.57.1747602421867; 
 Sun, 18 May 2025 14:07:01 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f?
 (2a01cb05949d580083fd25921c9c7a4f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:83fd:2592:1c9c:7a4f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d224sm10689612f8f.12.2025.05.18.14.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 14:07:01 -0700 (PDT)
Message-ID: <68aebffd-9d96-4b49-97d4-687e9a7ea92f@smile.fr>
Date: Sun, 18 May 2025 23:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour
 <romain.naour@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
References: <20250518115519.3649662-1-bernd@kuhls.net>
 <20250518115519.3649662-3-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20250518115519.3649662-3-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1747602422; x=1748207222; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tw2LtODUiSuX7D2Zm/UCUqEfmu6lXx7+YW/UIbt4+Ug=;
 b=2Q1xsGSGFq8Eh+zKNKW9R8S5qE+FnEW9DuFhTuDFXv5Haa2/kzskzhrj5Hia7WhMQc
 AJONG92FI1fR6ptzuIZ3ZU0kydHE11oq9eEc4INILnUu8bZVV3sgAvxVOQA8MFeJ2/UE
 iGURMVyB7+2Bm5CyBDf/niTkYcwDBhPDsXG9g=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2Q1xsGSG
Subject: Re: [Buildroot] [PATCH v2 3/5] package/spirv-llvm-translator: bump
 version to 20.1.2
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

SGVsbG8gQmVybmQsIE1laGRpLCBBbGwsCgpMZSAxOC8wNS8yMDI1IMOgIDEzOjU1LCBCZXJuZCBL
dWhscyBhIMOpY3JpdMKgOgo+IEZyb206IEVsIE1laGRpIFlPVU5FUyA8ZWxtZWhkaS55b3VuZXNA
c21pbGUuZnI+Cj4gCj4gVXBkYXRlIHNwaXJ2LWxsdm0tdHJhbnNsYXRvciB0byBhbGlnbiB3aXRo
IExMVk0gMjAuMS4zCj4gCj4gUmVsZWFzZToKPiBodHRwczovL2dpdGh1Yi5jb20vS2hyb25vc0dy
b3VwL1NQSVJWLUxMVk0tVHJhbnNsYXRvci9yZWxlYXNlcy90YWcvdjIwLjEuMgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEVsIE1laGRpIFlPVU5FUyA8ZWxtZWhkaS55b3VuZXNAc21pbGUuZnI+Cj4gU2ln
bmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KPiBbQmVybmQ6IHVzZWQg
J2dpdCBkZXNjcmliZScgdG8gc2V0IHRoZSB2ZXJzaW9uIG51bWJlcl0KPiAtLS0KPiB2MjogdXNl
ZCAnZ2l0IGRlc2NyaWJlJyB0byBzZXQgdGhlIHZlcnNpb24gbnVtYmVyCj4gCj4gIHBhY2thZ2Uv
c3BpcnYtbGx2bS10cmFuc2xhdG9yL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci5oYXNoIHwgMiArLQo+
ICBwYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci9zcGlydi1sbHZtLXRyYW5zbGF0b3IubWsg
ICB8IDQgKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zcGlydi1sbHZtLXRyYW5zbGF0b3Ivc3Bp
cnYtbGx2bS10cmFuc2xhdG9yLmhhc2ggYi9wYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci9z
cGlydi1sbHZtLXRyYW5zbGF0b3IuaGFzaAo+IGluZGV4IDQ1MDBmYzRmNjIuLjZjZDQ3NzYyZjcg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zcGlydi1sbHZtLXRyYW5zbGF0b3Ivc3BpcnYtbGx2bS10
cmFuc2xhdG9yLmhhc2gKPiArKysgYi9wYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci9zcGly
di1sbHZtLXRyYW5zbGF0b3IuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+ICAjIGxvY2FsbHkgY2Fs
Y3VsYXRlZAo+IC1zaGEyNTYgIDBhMDBhNzJhNWIwMDRlZWI3M2Y5Yzk2YzljNmJhMmQ2ZGUyMzJj
YmYzYzIyYTdiMzIyMDQ3NjA0ZDI0NDAyYmEgIHNwaXJ2LWxsdm0tdHJhbnNsYXRvci12MTUuMC4w
LTQ2LWdlODJlY2MyYmQ3Mjk1NjA0ZmNmMTgyNGU0N2M5NWZhNmEwOWM2ZTYzLnRhci5nego+ICtz
aGEyNTYgIGNhODljMzVjYmM1NWNmZTY5YWI5ZmExYTJmM2VlNTg1ZDMwY2IyODVlMDFlMmNhZTMw
OWZlMGUxZjFkZmQ3OWUgIHNwaXJ2LWxsdm0tdHJhbnNsYXRvci12MjAuMS4yLTctZzgzNGRiMWEx
OTg1YWMzNmQ1YTNlMWI0YjM0ZGMxY2EzZjkxOWFkNWIudGFyLmd6Cj4gIHNoYTI1NiAgZTNiYzM2
NDQwZmM5MjdjNjJkNWNjMjRlZmVlZmUyMjVhMTRkNGUzNGZmZWIwYzkyZTQzMDYyNWNjZTllZTQ0
NCAgTElDRU5TRS5UWFQKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zcGlydi1sbHZtLXRyYW5zbGF0
b3Ivc3BpcnYtbGx2bS10cmFuc2xhdG9yLm1rIGIvcGFja2FnZS9zcGlydi1sbHZtLXRyYW5zbGF0
b3Ivc3BpcnYtbGx2bS10cmFuc2xhdG9yLm1rCj4gaW5kZXggZmZjOGE2M2I4OS4uNmJhNThjMzky
ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci9zcGlydi1sbHZt
LXRyYW5zbGF0b3IubWsKPiArKysgYi9wYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci9zcGly
di1sbHZtLXRyYW5zbGF0b3IubWsKPiBAQCAtNSw4ICs1LDggQEAKPiAgIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKPiAgCj4gICMgR2VuZXJhdGUgdmVyc2lvbiBzdHJpbmcgdXNpbmc6Cj4gLSMgICBn
aXQgZGVzY3JpYmUgLS10YWdzIC0tbWF0Y2ggJ3YxNSonIC0tYWJicmV2PTQwIG9yaWdpbi9sbHZt
X3JlbGVhc2VfMTUwCj4gLVNQSVJWX0xMVk1fVFJBTlNMQVRPUl9WRVJTSU9OID0gdjE1LjAuMC00
Ni1nZTgyZWNjMmJkNzI5NTYwNGZjZjE4MjRlNDdjOTVmYTZhMDljNmU2Mwo+ICsjICAgZ2l0IGRl
c2NyaWJlIC0tdGFncyAtLW1hdGNoICd2MjAqJyAtLWFiYnJldj00MCBvcmlnaW4vbGx2bV9yZWxl
YXNlXzIwMAo+ICtTUElSVl9MTFZNX1RSQU5TTEFUT1JfVkVSU0lPTiA9IHYyMC4xLjItNy1nODM0
ZGIxYTE5ODVhYzM2ZDVhM2UxYjRiMzRkYzFjYTNmOTE5YWQ1YgoKQ2FuIHdlIHJlYWxseSBkbyB0
aGlzIHZlcnNpb24gYnVtcCBiZWZvcmUgdXBkYXRpbmcgbGx2bSB0byAyMC4xIChmb3IgdGhlIHNh
a2Ugb2YKImNvcnJlY3QgYmlzc2VjdGFiaWxpdHkiKT8KClRoZSBsbHZtIHZlcnNpb24gYnVtcCBw
YXRjaCBpcyBhbHJlYWR5ICJiaWciLiBBdCBsZWFzdCwgaXQncyBlYXNpZXIgdG8gcmV2aWV3IGFz
IGlzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICBTUElSVl9MTFZNX1RSQU5TTEFUT1JfU0lU
RSA9ICQoY2FsbCBnaXRodWIsS2hyb25vc0dyb3VwLFNQSVJWLUxMVk0tVHJhbnNsYXRvciwkKFNQ
SVJWX0xMVk1fVFJBTlNMQVRPUl9WRVJTSU9OKSkKPiAgU1BJUlZfTExWTV9UUkFOU0xBVE9SX0xJ
Q0VOU0UgPSBOQ1NBCj4gIFNQSVJWX0xMVk1fVFJBTlNMQVRPUl9MSUNFTlNFX0ZJTEVTID0gTElD
RU5TRS5UWFQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
