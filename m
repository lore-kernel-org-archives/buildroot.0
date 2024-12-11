Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F0AE77182
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 15:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 587AF402FB;
	Wed, 11 Dec 2024 15:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWXEN5So5Pm1; Wed, 11 Dec 2024 15:50:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F444406E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F444406E9;
	Wed, 11 Dec 2024 15:50:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B948A6F
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A1A580F31
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2zHwazS9Dlh for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 15:50:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC32880F46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC32880F46
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC32880F46
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 15:50:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43622267b2eso1443975e9.0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 07:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733932217; x=1734537017;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VKxw3zB3EBsUvJZBmOl+oMnPwCHbPNXUkuRdsyoOlVs=;
 b=Y58bzR2p40lW2iL1/dAyLK29Cx0Gjec4xpk1ib4bpwEUYFG9J3GP4SpHusqo+kValH
 Hm/XP5P/wVglGodUcSr+skUQ107hmprpTpLIlEhX2mt+ZVYZv7+NX+0gwuH1yeuvlo6k
 1OUxErEObwPe3kpVY8ghxO7iu4MYfLbPDDt3qr5rc5X76VSVAYDHAW2zCNpb4gVo0B61
 TySbj+5qY8mo8f3LSUlhwiQpHzrTMHqwv7qRNq+NpXXPbHNh5YxXNAgxl7kLPTl/FVor
 ZSh+VceX0P7nPVAIH8tVIsW8ef7+v92cra9mXBcQW7o74MGmf4s7nHxV7mRc3L2UC8PB
 R9VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1YRXnJTEhvgnEwSZxxvZsDNqXOJboDHL51f9EMkXEc0ZE2L5wLTNNREe+Fdm16PrKJ4MnguvcNck=@buildroot.org
X-Gm-Message-State: AOJu0YwtWUcvzCwXokYXP6cNp547W/FVvS0UD47sITYdd9HW2ZsUWydA
 F6f8MJAv+1dMX/4V08P+IIgWplWQFu0vyxlSyere7g3DF8Be/v8/Xf0Re6VFagzZr3JY+8oDSKG
 A0gg=
X-Gm-Gg: ASbGncvw7fI7HK4cL9+CrtW6vY6CU4KuAkHHSuaVUbDP0FE/yHmdOpeLp33oUnIccOD
 A8xtGcj6U2175VsmqfiVLt8Y3BVTH4A9C1IOBb8fcF7/TtVZ3/pAYygaLj4pbX7PDqkgNOovyrY
 59dO8jZlyQqfRK/7XiJBAd4pDc/6KQ/yd8TtMm34iG899Z/qfPC08HX/WRUo7Hlmyp/Tv9/K+WD
 l7eZigIGLcLkLmarO7fgknLdYY17C8RqZeuFkCRi0Jdi6giHhg7NpNsTnOgnNvu6F5uV01Da6xX
 ExPVe9gBKg7MITxSuaYP59kdwVqrYB7FPvJtmM4ILQ==
X-Google-Smtp-Source: AGHT+IE9C0DKmDVUHpDNd+pL0gJoJRIvpEdA4VuSpv1elOyO6IPOraNAYLErW9U0rDyMYFpDUTMcyQ==
X-Received: by 2002:a05:600c:3b94:b0:434:a94f:f8a9 with SMTP id
 5b1f17b1804b1-4361c41972amr21116495e9.28.1733932216678; 
 Wed, 11 Dec 2024 07:50:16 -0800 (PST)
Received: from [10.5.90.20]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878248e61dsm1558179f8f.21.2024.12.11.07.50.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 07:50:16 -0800 (PST)
Message-ID: <7a998e85-ec0b-4ebb-8328-c4aa70c06cd4@smile.fr>
Date: Wed, 11 Dec 2024 16:50:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Scott Fan <fancp2007@gmail.com>, buildroot@buildroot.org
Cc: Gero Schwaericke <gero.schwaericke@posteo.de>
References: <20241206030618.249638-1-fancp2007@gmail.com>
Content-Language: fr
In-Reply-To: <20241206030618.249638-1-fancp2007@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733932217; x=1734537017; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VKxw3zB3EBsUvJZBmOl+oMnPwCHbPNXUkuRdsyoOlVs=;
 b=BEGy8mX0sIht753NPcNKgbLu0JeR6PMWKpZTTgOP12k2Fwr+Nx8IxZLVVyLXl/rSbU
 zCAszZ3U+On4k39/mu30SkDjF9u2UNvfgUnQnKGrgZm03joxAav5r/HsYD16tvPuJi+U
 lT/moOrgfzwPj300q8otWO2R7V4Qzw8IyoM9w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=BEGy8mX0
Subject: Re: [Buildroot] [PATCH v2 1/2] board/cubietech/cubieboard1: use
 lowercase keywords in extlinux.conf file
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

SGVsbG8gU2NvdHQsIEFsbCwKCkxlIDA2LzEyLzIwMjQgw6AgMDQ6MDYsIFNjb3R0IEZhbiBhIMOp
Y3JpdMKgOgo+IFRoaXMgY29tbWl0IGFsc28gdXBkYXRlcyB0aGUgbGFiZWwgbmFtZSwgYW5kIHRo
ZSB1bm5lY2Vzc2FyeSAiZGVmYXVsdCIKPiBlbnRyeSBpcyBhbHNvIHJlbW92ZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogU2NvdHQgRmFuIDxmYW5jcDIwMDdAZ21haWwuY29tPgoKQXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAtLS0KPiAgLi4uL3Jvb3Rm
c19vdmVybGF5L2Jvb3QvZXh0bGludXgvZXh0bGludXguY29uZiAgICAgICAgICAgfCA5ICsrKyst
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9ib2FyZC9jdWJpZXRlY2gvY3ViaWVib2FyZDEvcm9vdGZzX292ZXJs
YXkvYm9vdC9leHRsaW51eC9leHRsaW51eC5jb25mIGIvYm9hcmQvY3ViaWV0ZWNoL2N1YmllYm9h
cmQxL3Jvb3Rmc19vdmVybGF5L2Jvb3QvZXh0bGludXgvZXh0bGludXguY29uZgo+IGluZGV4IDJm
ZGU2ODNmMzguLjViMDcxZGNlODQgMTAwNjQ0Cj4gLS0tIGEvYm9hcmQvY3ViaWV0ZWNoL2N1Ymll
Ym9hcmQxL3Jvb3Rmc19vdmVybGF5L2Jvb3QvZXh0bGludXgvZXh0bGludXguY29uZgo+ICsrKyBi
L2JvYXJkL2N1YmlldGVjaC9jdWJpZWJvYXJkMS9yb290ZnNfb3ZlcmxheS9ib290L2V4dGxpbnV4
L2V4dGxpbnV4LmNvbmYKPiBAQCAtMSw1ICsxLDQgQEAKPiAtREVGQVVMVCBsaW51eAo+IC1MQUJF
TCBsaW51eAo+IC0gIEtFUk5FTCAvYm9vdC96SW1hZ2UKPiAtICBERVZJQ0VUUkVFIC9ib290L3N1
bjRpLWExMC1jdWJpZWJvYXJkLmR0Ygo+IC0gIEFQUEVORCBjb25zb2xlPXR0eVMwLDExNTIwMCBl
YXJseXByaW50ayByb290PS9kZXYvbW1jYmxrMHAxIHJvb3R3YWl0Cj4gK2xhYmVsIGN1YmllYm9h
cmQtYnVpbGRyb290Cj4gKyAga2VybmVsIC9ib290L3pJbWFnZQo+ICsgIGRldmljZXRyZWUgL2Jv
b3Qvc3VuNGktYTEwLWN1YmllYm9hcmQuZHRiCj4gKyAgYXBwZW5kIGNvbnNvbGU9dHR5UzAsMTE1
MjAwIGVhcmx5cHJpbnRrIHJvb3Q9L2Rldi9tbWNibGswcDEgcm9vdHdhaXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
