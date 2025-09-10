Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC1CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 11:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA0060D6B;
	Wed, 10 Sep 2025 11:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XENIEq5ShYGy; Wed, 10 Sep 2025 11:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E21E60D7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E21E60D7E;
	Wed, 10 Sep 2025 11:31:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 961F410E
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F3E083F62
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7J-tIwZabi2i for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 11:31:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D6F783EFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D6F783EFB
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D6F783EFB
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 11:31:36 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-5608d792558so7294182e87.0
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 04:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757503894; x=1758108694;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M0r8lwOXN0p3kLHAVEqdA7dtgTi+oDWpaM/h4Hw6Kxk=;
 b=xLw6f9XkRuOIqplVrjC/96QggUbIPmWPNJ+hj/CadL0wtutS0a5yEd1PDUlYzbOTkC
 2jn7ZMSmtAeN6OsTKzaM38zuu76kZfmjT5rbGjfxm8oxQeYKS/MzeFWP720ZdkJ3JX1k
 DPMq6IvtR1WBNNweKWS7z1Zk8AZe5YmnxL+7N+fcMvqtLwUnHpHtszAxdKqmROYcOXTa
 iNqheICapCRpQtrlzTFl5dI1ffF5vcVWSL0RVJf+3qI4EAfTziJYBpolqTrclGkqxEMQ
 cerEboEbyl6U6n960ziCzv1PbW4/xNMlL9qvHQmh07NvW6oqsWzQ4pZO1FdXgMryInKI
 ykPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6ipB2QQ/PCkmE41iTI4HAY2crYlf8fazSQbp4X0c5eBTru6sqz9Ip6YMBZ2r1bE4R+MouF9nD26o=@buildroot.org
X-Gm-Message-State: AOJu0Yx/jElvyMnWiomMuJrHc12D/4G++iwfmL9BrBwu5wmjgjD0tA1R
 GnRWNX9yeg28Dd4LWEHGZAoGGJhSJi1NYX8piFPzFRMzMaZJIgN6aA+h6O5WmDImQe8=
X-Gm-Gg: ASbGncue6ZD2dQvWc4MCi9K7yRbNr25QjUtMGQqzZA2cw5c6nLkopNoihcVJiYp9WlA
 8UBRAGjmUzfLUa7YdeSMEbqiwfYSyetEB/SJGpCkZuVcReQIz1zm3Y7gaxraii86MeyuPLxQRd5
 1eNcwfq14e/+94huQJt7S38GL6k7UBuZSZ8tWPekmRmE75Rpcv/bXK/S1ArnspBdPriU9Ezv6D4
 dE/6gg35nZq7n8SoU1cNHiqowgIrPI5h63nQEwgSK1l5D+GrEPr6m30BMVy/8MIjO4G0V2E7Pqr
 qfrPGP+VwG2vvuVCfrPPKLGSnTZGdq6zvpsyQhIxQVUunZowGfuuaIMqS7TgBGh7vi69LKaGZGz
 p22woRUDXI2F9H5vnVemynfXidMQvWA1H2/9HpihNVkFQ23QFdKe4QVGy73TWG5Mpo2OQhAlW1w
 XlaXqGBuuQ3LOGBCsySr2/
X-Google-Smtp-Source: AGHT+IF6lPxrDSYrAFd9prfIoC5X+sKhp29Nejj74e37oXox5oG1bTo+H5T8PRnDJuCpblI7xhCj2g==
X-Received: by 2002:a05:6512:1289:b0:55f:4f1f:93f1 with SMTP id
 2adb3069b0e04-562618e1051mr4767968e87.43.1757503893646; 
 Wed, 10 Sep 2025 04:31:33 -0700 (PDT)
Received: from [10.5.90.80]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5680c8f9e52sm1202498e87.40.2025.09.10.04.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 04:31:33 -0700 (PDT)
Message-ID: <8c5eb5e5-c469-4e8f-ba11-b2d1689934ec@smile.fr>
Date: Wed, 10 Sep 2025 13:31:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>, buildroot@buildroot.org
Cc: Anand Gadiyar <gadiyar@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Xuanhao Shi <X15000177@gmail.com>
References: <20250909-ti-k3-boot-firmware-src-v1-0-542b606ef0c7@ti.com>
Content-Language: fr
In-Reply-To: <20250909-ti-k3-boot-firmware-src-v1-0-542b606ef0c7@ti.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1757503894; x=1758108694; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M0r8lwOXN0p3kLHAVEqdA7dtgTi+oDWpaM/h4Hw6Kxk=;
 b=HulwT1tl6A9i7nwO3vqJdYGlvOkUCDHGRy5ryfKZLkNz5VfR3it87K1dOBuPOpKaIR
 HMFtryTWJe4YObMNAIJsVlCVLzW69NV4g3T62edEiDMgNSMKGOXhrvbsyVV/p3v4yIfX
 xYJBMgMSMbEIQXYyhHikmBe3xRtLqh2N7lta0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=HulwT1tl
Subject: Re: [Buildroot] [PATCH 0/2] boot/ti-k3-boot-firmware: source change
 and a version bump
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

SGVsbG8gQnJ5YW4sIEFsbCwKCkxlIDA5LzA5LzIwMjUgw6AgMTQ6MjEsIEJyeWFuIEJyYXR0bG9m
IHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBIZWxsbyBFdmVyeW9uZSEKPiAKPiBXaGVuIGxv
b2tpbmcgaW50byBidW1waW5nIHRoZSB2ZXJzaW9uIG9mIHRpLWxpbnV4LWZpcm13YXJlLCBJIG5v
dGljZWQgCj4gZ2l0LnRpLmNvbSBpcyBubyBsb25nZXIgcHJvdmlkaW5nIGFyY2hpdmUgZG93bmxv
YWRzIG9mIGFueSBvZiB0aGUgCj4gcHJvamVjdHMgaG9zdGVkIHRoZXJlLiAKPiAKPiBTbywgd2hp
bGUgd2Ugd29yayBpbnRlcm5hbGx5IHRvIHVuZGVyc3RhbmQgaWYgd2UgY2FuIGdldCB0aGlzIGZl
YXR1cmUgCj4gYmFjaywgbW92ZSB0aS1rMy1ib290LWZpcm13YXJlIHRvIGRvd25sb2FkIGZyb20g
VEkncyBHaXRodWIgbWlycm9yIAo+IGJlZm9yZSBidW1waW5nIHRoZSB2ZXJzaW9uIHRvIDExLjAx
LjEyIHRvIHB1bGwgaW4gbmV3ZXIgdmVyc2lvbnMgb2YgVEkncyAKPiBETSBhbmQgVElGUyBmaXJt
d2FyZQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAKPiBIYXBweSBIYWNraW5nCj4gfkJyeWFuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJ5YW4gQnJh
dHRsb2YgPGJiQHRpLmNvbT4KPiAtLS0KPiBCcnlhbiBCcmF0dGxvZiAoMik6Cj4gICAgICAgYm9v
dC90aS1rMy1ib290LWZpcm13YXJlOiBzd2l0Y2ggdG8gZ2l0aHViIG1pcnJvcgo+ICAgICAgIGJv
b3QvdGktazMtYm9vdC1maXJtd2FyZTogYnVtcCB0byAxMS4wMS4xMgo+IAo+ICBib290L3RpLWsz
LWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5oYXNoIHwgMiArLQo+ICBib290L3Rp
LWszLWJvb3QtZmlybXdhcmUvdGktazMtYm9vdC1maXJtd2FyZS5tayAgIHwgNSArKy0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAtLS0KPiBi
YXNlLWNvbW1pdDogMGFmMTU5YWUyYjAzNjNhOTBiOGM1NDMyY2Q0Y2I5YmZkMzQ3NmM1YQo+IGNo
YW5nZS1pZDogMjAyNTA5MDktdGktazMtYm9vdC1maXJtd2FyZS1zcmMtOGMxZmE0NWEwZmRhCj4g
Cj4gQmVzdCByZWdhcmRzLAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
