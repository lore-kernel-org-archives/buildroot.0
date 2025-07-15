Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302B1C83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 09:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D464083A45;
	Tue, 15 Jul 2025 09:49:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LP3hTe6mu1Io; Tue, 15 Jul 2025 09:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDBDD82189
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDBDD82189;
	Tue, 15 Jul 2025 09:49:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C9CDDCA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52A8940BFD
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJ5bu17mf3QM for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 09:49:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 239F540B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 239F540B91
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 239F540B91
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 09:49:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4561514c7f0so17803575e9.0
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 02:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752572959; x=1753177759;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y7CAKfBKcPRYgPlOdrmpLjjVtE34yuvAh/DjlaQbBEg=;
 b=hcFssYtmUsxxyC9R+V2ObdIphLq8EZYJlxlKcfNytDdZlPfLZqYkLRpIE5e1Es9WIo
 oAQBtI458iO+n6Mfa0vqq5b1kJ3+hyY0YBgbnt70R5V9/ekJq6Y0pRP5HCo7AX4oer5D
 xqd+Ftu+wFnS3vf9LgZgszvHeNUbnRCBy3kEOeFMn+eoDsi23snlvWMy0e+q3u9pwVY8
 qbnX7ovFY6vjvlDx2XfvYTXJcgsTiBDXo+Bi27gbKlFKq3s8W22cPw3Qb6SbouYbSwDO
 UA6NMG/st3mpJFsPBZraNWsy49u1c36mKCv/jBfudKeIfEK4RxA5xJ4nz3oJ3Y/r5B1n
 IQ2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtUbaa10hHytNHJbTC7N+0FwiUOVbdNs1OyYl21WyE6qpWdq3Ukh4LtyvtlneypMEFuoe46z1RN+k=@buildroot.org
X-Gm-Message-State: AOJu0YzKjLIotjH5hgvvtxQwQjo/zs2Ry4S33Ty3q45Nsa5liVyCQa4e
 oMnaLiISbzDFUTfYTiCkwIPSqf8kpGIhfSu+0vH/PQXoqfdn6VZsvffeLCSuV4q/8Do=
X-Gm-Gg: ASbGncuFcQ0w6D1u+bUQaLb3GzEYJKL8P/yse5z3dqizjmA2mOdwoyfPi9BEZgKsYwO
 Tv+6p7z8LlMrnAltkdDgHU0WYe3Gn2KM4rw7eVO+AxdR06oe4CE67r77Cg3p4dfFlWnEaeoG8WX
 2aZy5ZuLQ34+HXhXWPnDxaMJyBCM+62mZmziPtQFi/CnFaq000UTwHCHj5jcsyyzXMYJnW8IE/2
 jO6JD4V6e8pdlbeH98C6qped203nYEZWZiXcSYB512hBw4oX23okCSVU+NpN9kSvBC7JYx9Zr+m
 hkqnT+5ty5Sjur2mASrlzvXZLb1tbjircE9hMH8ylLp8RBjfQaz34nL6TWrx5iCQW4dUg2eG1eC
 x2bBikUa5yydjJ9uIetoOwqb77KzozMYhRKsdBN1ZdCsT+F/ZQ1rFN7oXkQl/fp97TzKNZSE2gz
 tLRZt20Q==
X-Google-Smtp-Source: AGHT+IGBpgFjl7Bze7TbYhLn8pJe/fpkjIeYMtuPedRmBi9vOQUlcYcvA8LdERPoVzFgWcLecll9Kw==
X-Received: by 2002:a05:600c:3b17:b0:455:fc16:9eb3 with SMTP id
 5b1f17b1804b1-455fc16a2ccmr101168145e9.33.1752572959461; 
 Tue, 15 Jul 2025 02:49:19 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560ceb130fsm92718585e9.26.2025.07.15.02.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 02:49:19 -0700 (PDT)
Message-ID: <8e6d38ab-9800-4a57-b550-1810e615f5ee@mind.be>
Date: Tue, 15 Jul 2025 11:49:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20250711173633.20222-1-fl@n621.de>
Content-Language: en-US
In-Reply-To: <20250711173633.20222-1-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752572959; x=1753177759; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y7CAKfBKcPRYgPlOdrmpLjjVtE34yuvAh/DjlaQbBEg=;
 b=JEPYf9vSrBzqqb9o29DZKfbpoVr6vn3gCgHAieL54FScK30co8c1Mw8kOGkU1q9auA
 1IR0kbtlYEG/77eqyRPZZNX4GDtqzHqXx2O9iZ4XfglBnDF2kYvIrVfbWDWtrkguJU/a
 ub4CMOiCG8HP7Eqsb0vNe7LMK2RQuyGS6Hhcl4sWstJcrMLlk7wjB2wOWy+zgx/87ENr
 uyJ+3Ws4RtWGkKfLHAFnwHjwGBeo/Vfj94/lUtOGBl1TRkXWNeiZfBDlg/qyhEa4squh
 k2+8/wfcU4USWqmQyz30Q68AvSyNyblqdZFX/HCJWMVbou5okbUw+NeVcR0zIbwSzhW1
 bMpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=JEPYf9vS
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: add support for
 pulseaudio
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

SGVsbG8gRmxvcmlhbiBhbmQgYWxsLAoKT24gMTEvMDcvMjUgMTk6MzYsIEZsb3JpYW4gTGFyeXNj
aCB3cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIExhcnlzY2ggPGZsQG42MjEuZGU+Cj4g
LS0tCj4gICBwYWNrYWdlL2ZmbXBlZy9mZm1wZWcubWsgfCA3ICsrKysrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ZmbXBlZy9m
Zm1wZWcubWsgYi9wYWNrYWdlL2ZmbXBlZy9mZm1wZWcubWsKPiBpbmRleCAyZDY1NjIzOTI2Li45
YmE3YWMwZjYxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZmZtcGVnL2ZmbXBlZy5tawo+ICsrKyBi
L3BhY2thZ2UvZmZtcGVnL2ZmbXBlZy5tawo+IEBAIC05NCw2ICs5NCwxMyBAQCBlbHNlCj4gICBG
Rk1QRUdfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1saWJqYWNrCj4gICBlbmRpZgo+ICAgCj4gK2lm
ZXEgKCQoQlIyX1BBQ0tBR0VfUFVMU0VBVURJTykseSkKPiArRkZNUEVHX0RFUEVOREVOQ0lFUyAr
PSBwdWxzZWF1ZGlvCj4gK0ZGTVBFR19DT05GX09QVFMgKz0gLS1lbmFibGUtbGlicHVsc2UKPiAr
ZWxzZQo+ICtGRk1QRUdfQ09ORl9PUFRTICs9IC0tZGlzYWJsZS1saWJwdWxzZQo+ICtlbmRpZgo+
ICsKPiAgIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCVjRMKSx5KQo+ICAgRkZNUEVHX0RFUEVOREVO
Q0lFUyArPSBsaWJ2NGwKPiAgIEZGTVBFR19DT05GX09QVFMgKz0gLS1lbmFibGUtbGlidjRsMgoK
SW4gb3VyIG5pZ2h0bHkgR2l0bGFiIHBpcGVsaW5lIGZvciBMVFMgbWFpbnRlbmFuY2UsIEkgbm90
aWNlIHRoYXQgdGhpcyAKY3JlYXRlZCBhIGRlcGVuZGVuY3kgY3ljbGU6CgoqIGZmbXBlZyBub3cg
ZGVwZW5kcyBvbiBwdWxzZWF1ZGlvCgoqIHB1bHNlYXVkaW8gZGVwZW5kcyBvbiBsaWJzb3hyCgoq
IGxpYnNveHIgZGVwZW5kcyBvbiBmZm1wZWcKCgpGb3IgZXhhbXBsZSB3aXRoIHRoaXMgZGVmY29u
ZmlnOgoKIMKgIMKgIEJSMl9QQUNLQUdFX0ZGTVBFRz15CiDCoCDCoCBCUjJfUEFDS0FHRV9QVUxT
RUFVRElPPXkKIMKgIMKgIEJSMl9QQUNLQUdFX0xJQlNPWFI9eQoKCiQgbWFrZSBzaG93LWluZm8K
cGFja2FnZS9mZm1wZWcvZmZtcGVnLm1rOjYzOTogKioqIFJlY3Vyc2l2ZSB2YXJpYWJsZSAKJ0ZG
TVBFR19GSU5BTF9SRUNVUlNJVkVfREVQRU5ERU5DSUVTJyByZWZlcmVuY2VzIGl0c2VsZiAoZXZl
bnR1YWxseSkuwqAgU3RvcC4KCgpJIHBlcnNvbmFsbHkgZG9uJ3QgdXNlIGFueSBvZiB0aGVzZSBz
byBJJ20gdW5zdXJlIG9mIHdoYXQgd291bGQgYmUgdGhlIApiZXN0IHdheSB0byBoYW5kbGUgdGhp
cyBjYXNlLgoKUmVnYXJkcywKClRpdG91YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
