Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB05BC48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 11:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 732A94176F;
	Wed, 14 Feb 2024 11:20:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bii87uLXrrOM; Wed, 14 Feb 2024 11:20:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E69641766
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E69641766;
	Wed, 14 Feb 2024 11:20:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE28B1BF3C0
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:20:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8CEA41776
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 11:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7dypVeKsqHM8 for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 11:20:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=alexander.sverdlin@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DB62404DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DB62404DF
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DB62404DF
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 11:20:28 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-410ca9e851bso23729635e9.3
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 03:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707909626; x=1708514426;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I28ytyD8lWp+q0Ba80VjWHxzrHjrcsoX02zyw000uA4=;
 b=coD0tJhRdnq9oL8NawhqPsOlkDI9zy/hv1JN2KuBAqD++pHLDEs2JK7G67a+ryDTO7
 bsWJLj4A9Q694Mgn6XSbQa1YEnRwTKi10YGn5srKZFbGmAgqwaludqkioCmfMrpr68Gv
 mf8xYNMK/5EyuMFAShevrQMwtZHkuIzEZLjdH8eF6c+0KisqDQorSM/g/G2mAMmou3Md
 QtcHkkqwIc3TE4wAC+jOYfqH52icvDXU8a1fs8rLe6iE5XVdzQIxm/bUfU6zXlsDduAZ
 r/e/iyGFP1hAbsrznz1+o7nwI7XMHUC1w5yxS1R41wLw6Wr1D7A4RQUYodYDT1TQQNyK
 KA+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOhM2z6xhezfN94Ockgg6SalnVa3W7jHFvFli3Wf+bXX2awli9f90gLFEwAmwREmB0HL1Fh7NNpLgMUjB8gvmmjnCoZTDK+g==
X-Gm-Message-State: AOJu0Yx89C/zb9DJUP6FgLW4jLKJFYi9EzeQvOaUD+Horgqtc3dsHnas
 X5CgMUN4+idsV/eoovI0ysWE7XFcHNWa/9JUnzNLQjRzZuGvUZcD
X-Google-Smtp-Source: AGHT+IHG8uVV3ioyLH20y4ZkAi0MrBUobwDgDeO14p6TVxNNT/QaqhI35IaUaB5/M2BxooFtqn2VEQ==
X-Received: by 2002:a5d:4986:0:b0:337:8f98:8ab4 with SMTP id
 r6-20020a5d4986000000b003378f988ab4mr1293413wrq.37.1707909626237; 
 Wed, 14 Feb 2024 03:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXFTdlHD7aj0MBqZEK2VNm+LiLB88bboXy9j81vMuYhLcFWWNfWJz8Gjt9c1p8JUtuTKXnB+LzW9I5EVbBGeDvqffwLsvRd6g==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with ESMTPSA id
 dd18-20020a0560001e9200b0033b3d28ef1fsm12040714wrb.65.2024.02.14.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 03:20:25 -0800 (PST)
Message-ID: <766f0b7f72ef1fd10596bc84d23269fe969134e4.camel@gmail.com>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Date: Wed, 14 Feb 2024 12:20:25 +0100
In-Reply-To: <20240213172817.2872849-13-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-13-romain.naour@smile.fr>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual;
 keydata=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
User-Agent: Evolution 3.50.4 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707909626; x=1708514426; darn=buildroot.org;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I28ytyD8lWp+q0Ba80VjWHxzrHjrcsoX02zyw000uA4=;
 b=SaFLDsI0VAcEEKIXSwp2it9oP1r64KYgWdE+M8ClwYX4ZCJSVuAei/MzYi/JhK2n2R
 f2rQnnaWoCE1LsafiT3SLen3bAAjn/QqbOW5BGOfc4zusjak9b2WvYhSvTBGwdhA1uqx
 1k+EgoHJmgu94sUrjFN1jGGXsI619P8r4p04RaaBwjQGu0Av2eMyzC5iaN1F+C5kViP4
 vR1NfS++iYQXSg4c4oMwnppNIYEDgMsAKgdOKOIoXyo24GJ5uW50HOIG9ZqO53660dlm
 9989TkjT74zI2DILldscgbRwsoZUAxeRvl/lRWNaYDduvkI461z1QTpPsk/xqYXs+l5H
 /ZJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SaFLDsI0
Subject: Re: [Buildroot] [PATCH 12/21] boot/ti-k3-boot-firmware: introduce
 BR2_TARGET_TI_K3_BOOT_FIRMWARE_SOC_{AM62AX, AM62X, AM64X, AM65X}
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

SGkgUm9tYWluLAoKT24gVHVlLCAyMDI0LTAyLTEzIGF0IDE4OjI4ICswMTAwLCBSb21haW4gTmFv
dXIgd3JvdGU6Cj4gdGktazMtaW1hZ2UtZ2VuIHRvb2wgaXMgZGVwcmVjYXRlZCBhbiByZXBsYWNl
ZCBieSBiaW5tYW4gWzFdLgo+IAo+IEJ1dCBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9TT0Nf
e0FNNjJBWCxBTTYyWH0gaXMgdXNlZCBieSB1LWJvb3QKPiBwYWNrYWdlIHRvIHNlbGVjdCB3aGlj
aCBEZXZpY2UgTWFuYWdlciAoRE0pIGZpcm13YXJlIHRvIHVzZSBmb3IgdGhlCj4gVS1Cb290IGJ1
aWxkLgo+IAo+IEluIG9yZGVyIHRvIHJlbW92ZSB0aS1rMy1pbWFnZS1nZW4gcGFja2FnZSwgaW50
cm9kdWNlCj4gQlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX1NPQ197QU02MkFYLEFNNjJY
LEFNNjRYLEFNNjVYfSB0bwo+IHJlcGxhY2UgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU09D
X3tBTTYyQVgsQU02MlgsQU02NFgsQU02NVh9Lgo+IAo+IEluIG9yZGVyIHRvIGF2b2lkIGJyZWFr
aW5nIGV4aXN0aW5nIGRlZmNvbmZpZyBzdGlsbCB1c2luZwo+IHRpLWszLWltYWdlLWdlbiB0b29s
ICh0aV9hbTYyeF9za19kZWZjb25maWcsIHRpX2FtNjR4X3NrX2RlZmNvbmZpZykKPiBzZWxlY3Qg
QlIyX1RBUkdFVF9USV9LM19CT09UX0ZJUk1XQVJFX1NPQyBzeW1ib2wgZnJvbSB0aS1rMy1pbWFn
ZS1nZW4KPiBwYWNrYWdlLgo+IAo+IFdoaWxlIGF0IGl0LCBvbmx5IGluc3RhbGwgcmVxdWlyZWQg
ZmlybXdhcmUgdG8gQklOQVJJRVNfRElSIGJhc2VkCj4gb24gdGhlIHNlbGVjdGVkIFRJIEszIFNv
QyB2YXJpYW50Lgo+IAo+IFRoaXMgcmVxdWlyZXMgdHdvIGludGFsbCBzdGVwOgo+IMKgIC0gdGkt
c3lzZncgaW5zdGFsbGF0aW9uIGJhc2VkIG9uIHRoZSBTb0MgdmFyaWFudC4KPiDCoCAtIHRpLWRt
IGluc3RhbGxhdGlvbiBvbmx5IGZvciBTb0MgdXNpbmcgc3BsaXQgZmlybXdhcmUgYm9vdCBmbG93
Cj4gwqDCoMKgIChlZzogYW02MiwgajcyMWUpCj4gCj4gWzFdIGh0dHBzOi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcvbWV0YS10aS9jb21taXQvP2lkPTgzNTgxMWNmODU4NjkyNmNmNzhhOTYxZDA5MGY0
ZTYxNTA0MzIyMzUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBzbWlsZS5mcj4KClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5z
dmVyZGxpbkBnbWFpbC5jb20+Cgo+IC0tLQo+IMKgYm9vdC90aS1rMy1ib290LWZpcm13YXJlL0Nv
bmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzNCArKysrKysrKysrKysrKysrKysrCj4g
wqAuLi4vdGktazMtYm9vdC1maXJtd2FyZS5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTIgKysrKystLQo+IMKgYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmlu
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrKwo+IMKgMyBmaWxlcyBjaGFu
Z2VkLCA0OCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0gCkFsZXhhbmRlciBTdmVy
ZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
