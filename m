Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AF2C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 14:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EAFF80D76;
	Wed, 18 Jun 2025 14:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UosG5D5PsqtP; Wed, 18 Jun 2025 14:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52CD880D08
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CD880D08;
	Wed, 18 Jun 2025 14:28:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A4A92151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A3DB80D08
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ArJzLEQfu7a for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 14:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB2B280F56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB2B280F56
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB2B280F56
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:41 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so59405945e9.1
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 07:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750256919; x=1750861719;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f+EFl1fd0w2YxP94Yn+vzulkWZeL4dMs3zkMCByaYoY=;
 b=dGJ9+4lipGXyS8JfYDBIS/SENiQgdUjYtkjZNOMD17VfcWzZSte2HL9Kkitwvd9KZu
 NVYuAH2KOfMrvpVtQpKuxdRYE8SsMsahhUsSOsLIQqHl5XaWhdUnrlcBz3HNHwzW5kyM
 BczRxqx5cfGkuuZEyIaGWNWH/CmD0jKMkvla7mro2WNQXbo25Zluf8fpeylkZxeGNL9K
 rRriNtgJuaNw2oSPcFJsLmaz/vZRcIBLI/ZhnhwUO6o4nkzdT55XA1Q0TecouWCAQ7Wm
 /kGON4IUvC0IkKglmAGhWC5/CizaTMmsjNAxwZLL1VQPIqgMWirM0jAHjQZfFazCg7Cc
 1M7g==
X-Gm-Message-State: AOJu0Yy8BgJe7lCDWm34St2c53dcbT4/GKK6rD9/v7ZxSOS90uCvxvlR
 lSScBhTgH/9FLiVnbvm87vwyMP4ypL/zwaGuvPQc5zE5rnn6YlfxXXqcDOV12FECZ9p+gT/WFrP
 HKZLu7Bg=
X-Gm-Gg: ASbGncsJnca6uB3YkrwgqLtsvsScw0RcGNhYSMzZ+kOu2MVi+dPO/It49SJYjx/5fGe
 cizo+tcdX8zceB91X+qQ4qe2RP5FTKLcKLCHzRQWpOyXNG0zp/Rf4KUuiDY30yWNFpcOX6ldPz0
 SMnHCSQEh3VhJiv8vMwbmtydfJ2neJTFHBcJABFEZWhCbNCcKeZTlNXoU/qtS8mqazLnBxyFOcC
 /U2H/9cMNh4CN4BMBzTB9HuV4/KAzWkyZvt4Q8UKjGmlRVGjE8U9uH9zGurgsneQK5A/HpL2nVk
 OeRt9cjFoAYaLdQ0jQImhiU9sgIQc0kYArX1qYhDTKTjqgnPG0utLs/QdFfu8R4=
X-Google-Smtp-Source: AGHT+IHnnK/iGq9wUJ5If3AaJ1N79AfVO3TA03hZjeXrMjRuTjRh6NZJ4UJaBqYywMLfx4Zuubi+pw==
X-Received: by 2002:a05:600c:5309:b0:43e:bdf7:7975 with SMTP id
 5b1f17b1804b1-45344e65f1cmr126526425e9.32.1750256919101; 
 Wed, 18 Jun 2025 07:28:39 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532de8c229sm207952945e9.6.2025.06.18.07.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:28:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 957D35F8B5;
 Wed, 18 Jun 2025 15:28:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 15:28:23 +0100
Message-ID: <20250618142825.758131-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250618142825.758131-1-alex.bennee@linaro.org>
References: <20250618142825.758131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750256919; x=1750861719; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f+EFl1fd0w2YxP94Yn+vzulkWZeL4dMs3zkMCByaYoY=;
 b=NXeyOszpcOf8Q1j6Hrr+NeBjTwYNhAVvvCNCL0DEk7k3cOb182mU80+ih8TjBpI1Po
 3kCTH3d8NV/ClPVCD6fa+KZnWyV2lEbSWyP3ajWu0HlE7RTed+RjJm/C05Tgq+ijNBUy
 TmFNbts4DcSsPhiQqdx5E1lANRTybBQf/89n0K2debCC8jqaooYvWe9sa+vx/bYkYlCm
 maa5+KcvSVmzouevS5AU4Dpvif+C8qOIp+S2HI/nFn/V61iWyiOD3nSWRx8dIQO4Sq2k
 cC8KGUTcqyRir9s+6YrYBwc2L1Wo0WdGU6UHiz1Tm6z6spDSaE/adtX/vxntXRM7nsEt
 EALg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=NXeyOszp
Subject: [Buildroot] [PATCH v7 4/4] support/testing: add test for vkmark
 package
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gdGVzdCB2a21hcmsgd2UgbmVlZCBhIGhlYWRsZXNzIFdlc3RvbiBjb21wb3NpdG9yIHNvIHdl
IGNhbiBydW4gdGhlCnRlc3Qgd2l0aG91dCBtZXNzaW5nIGFyb3VuZCB3aXRoIGFjdHVhbCBkaXNw
bGF5cy4gQmVjYXVzZSB0byBydW4gcHJvcGVyCmFjY2VsZXJhdGVkIFZ1bGthbiBwYXNzLXRocm91
Z2ggeW91IG5lZWQgYSBtb2Rlcm4gUUVNVSB3ZSBhbHNvIGVuYWJsZWQKdGhlIFZVTEtBTl9EUklW
RVJfU1dSQVNUIGRyaXZlci4gVGhpcyB3aWxsIGFsbG93IHVzIHRvIHJ1biB2a21hcmsKdW5kZXIg
Q0kgYW5kIG90aGVyIHBsYWNlcyB3aGVyZSB3ZSBkb24ndCBoYXZlIGEgdmVyeSBtb2Rlcm4gaG9z
dApzeXN0ZW0uCgpTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFy
by5vcmc+CgotLS0KdjUKICAtIHNpbXBsaWZ5IHBhY2thZ2UgbGlzdAogIC0gYWRkIFNXUkFTVCBk
cml2ZXIgZm9yIGZhbGwtYmFjawogIC0gZG9uJ3QgdXNlIGFjY2VsZXJhdGVkIGRldmljZSBpbiB0
ZXN0LCBkb2N1bWVudCB0aGUgZGlmZmVyZW5jZQp2NAogIC0gYWRkIEJSMl9QQUNLQUdFX1dFU1RP
Tl9TSEVMTF9LSU9TSz15CnYzCiAgLSBmaXggb3JkZXJpbmcgb2Ygc2VsZWN0L2RlcGVuZCBhcyBz
dWdnZXN0ZWQgYnkgY2hlY2stcGFja2FnZQogIC0gZml4IHNvbWUgZmxha2U4IGNvbXBsYWludHMK
djIKICAtIGFkZCBvdmVybGF5IGltYWdlCiAgLSBlbnN1cmUgd2UgZXhwb3NlIERJU1BMQVkvREJV
UyBlbnYgdmFycwogIC0gc2hvcnRlbiBydW50aW1lIG9mIHZrbWFyawotLS0KIHN1cHBvcnQvdGVz
dGluZy9pbmZyYS9lbXVsYXRvci5weSAgICAgICAgICAgICB8ICA0ICstCiBzdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay5weSAgfCA4MCArKysrKysrKysrKysrKysrKysr
CiAuLi4vZXRjL3Byb2ZpbGUuZC8xMC14ZGctcnVudGltZS5zaCAgICAgICAgICAgfCAgMSArCiAz
IGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay5weQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfdmtt
YXJrL3Jvb3Rmcy1vdmVybGF5L2V0Yy9wcm9maWxlLmQvMTAteGRnLXJ1bnRpbWUuc2gKCmRpZmYg
LS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkgYi9zdXBwb3J0L3Rlc3Rp
bmcvaW5mcmEvZW11bGF0b3IucHkKaW5kZXggMzcwMmVlMmQ0OC4uYTZmZTk2MTNiNyAxMDA2NDQK
LS0tIGEvc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5CisrKyBiL3N1cHBvcnQvdGVz
dGluZy9pbmZyYS9lbXVsYXRvci5weQpAQCAtMTIxLDcgKzEyMSw5IEBAIGNsYXNzIEVtdWxhdG9y
KG9iamVjdCk6CiAgICAgICAgIGhvc3RfYmluID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIs
ICJob3N0IiwgImJpbiIpCiAgICAgICAgIGJyX3BhdGggPSBob3N0X2JpbiArIG9zLnBhdGhzZXAg
KyBvcy5lbnZpcm9uWyJQQVRIIl0KICAgICAgICAgcWVtdV9lbnYgPSB7IlFFTVVfQVVESU9fRFJW
IjogIm5vbmUiLAotICAgICAgICAgICAgICAgICAgICAiUEFUSCI6IGJyX3BhdGh9CisgICAgICAg
ICAgICAgICAgICAgICJQQVRIIjogYnJfcGF0aCwKKyAgICAgICAgICAgICAgICAgICAgIkRCVVNf
U0VTU0lPTl9CVVNfQUREUkVTUyI6IG9zLmVudmlyb25bIkRCVVNfU0VTU0lPTl9CVVNfQUREUkVT
UyJdLAorICAgICAgICAgICAgICAgICAgICAiRElTUExBWSI6IG9zLmVudmlyb25bIkRJU1BMQVki
XX0KICAgICAgICAgcGV4cGVjdC5ydW4oZiJ7cWVtdV9jbWRbMF19IC0tdmVyc2lvbiIsCiAgICAg
ICAgICAgICAgICAgICAgIGVuY29kaW5nPSd1dGYtOCcsCiAgICAgICAgICAgICAgICAgICAgIGxv
Z2ZpbGU9c2VsZi5sb2dmaWxlLApkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2UvdGVzdF92a21hcmsucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3ZrbWFyay5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44MGNhYTAx
ZmRjCi0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF92a21hcmsucHkKQEAgLTAsMCArMSw4MCBAQAoraW1wb3J0IG9zCisKK2ltcG9ydCBpbmZyYS5i
YXNldGVzdAorCitWVUxLQU5JTkZPX1RJTUVPVVQgPSAxMjAKKworCitjbGFzcyBUZXN0VmtNYXJr
KGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CisgICAgY29uZmlnID0gXAorICAgICAgICAiIiIKKyAg
ICAgICAgQlIyX2FhcmNoNjQ9eQorICAgICAgICBCUjJfY29ydGV4X2E3Mj15CisgICAgICAgIEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUw9eQorICAgICAgICBCUjJfT1BUSU1JWkVfUz15CisgICAgICAg
IEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVERVY9eQorICAgICAgICBCUjJf
Uk9PVEZTX01FUkdFRF9VU1I9eQorICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKKyAgICAgICAg
QlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15CisgICAgICAgIEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC9saW51eC5j
b25maWciCisgICAgICAgIEJSMl9QQUNLQUdFX0RCVVM9eQorICAgICAgICBCUjJfUEFDS0FHRV9M
SUJNRD15CisgICAgICAgIEJSMl9QQUNLQUdFX01FU0EzRD15CisgICAgICAgIEJSMl9QQUNLQUdF
X01FU0EzRF9HQUxMSVVNX0RSSVZFUl9WSVJHTD15CisgICAgICAgIEJSMl9QQUNLQUdFX01FU0Ez
RF9MTFZNPXkKKyAgICAgICAgQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FUz15CisgICAgICAg
IEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1NXUkFTVD15CisgICAgICAgIEJSMl9Q
QUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1ZJUlRJTz15CisgICAgICAgIEJSMl9QQUNLQUdF
X1VUSUxfTElOVVhfQUdFVFRZPXkKKyAgICAgICAgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9CSU5B
UklFUz15CisgICAgICAgIEJSMl9QQUNLQUdFX1ZLTUFSSz15CisgICAgICAgIEJSMl9QQUNLQUdF
X1ZVTEtBTl9UT09MUz15CisgICAgICAgIEJSMl9QQUNLQUdFX1dFU1RPTj15CisgICAgICAgIEJS
Ml9QQUNLQUdFX1dFU1RPTl9ERUZBVUxUX0RSTT15CisgICAgICAgIEJSMl9QQUNLQUdFX1dFU1RP
Tl9IRUFETEVTUz15CisgICAgICAgIEJSMl9QQUNLQUdFX1dFU1RPTl9TSEVMTF9LSU9TSz15Cisg
ICAgICAgIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlBTUEwIgorICAgICAgICBC
UjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl9T
SVpFPSIyNTBNIgorICAgICAgICBCUjJfUk9PVEZTX09WRVJMQVk9Int9IgorICAgICAgICAiIiIu
Zm9ybWF0KAorICAgICAgICAgIGluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9wYWNrYWdlL3Rlc3Rfdmtt
YXJrL3Jvb3Rmcy1vdmVybGF5IikpCisKKyAgICBkZWYgbG9naW4oc2VsZik6CisgICAgICAgIGlt
ZyA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5leHQyIikK
KyAgICAgICAga2VybiA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgIklt
YWdlIikKKworICAgICAgICAjIFdlIGhhdmUgYnVpbHQgdGhlIGltYWdlIHRvIGNvbnRhaW4gYm90
aCB0aGUgU1dSQVNUIGFuZAorICAgICAgICAjIFZJUlRJTyB2dWxrYW4gZHJpdmVycy4gSG93ZXZl
ciB0byB0ZXN0IHdpdGggcHJvcGVyIHBhc3MKKyAgICAgICAgIyB0aHJvdWdoIHlvdSBuZWVkIGEg
bW9kZXJuIFFFTVUgd2l0aCBWZW51cyBzdXBwb3J0LgorICAgICAgICAjCisgICAgICAgICMgVGhh
dCB3b3VsZCBtb2RpZnkgdGhlIGNvbW1hbmQgbGluZSB0bzoKKyAgICAgICAgIyAgIC1kaXNwbGF5
IGRidXMsZ2w9b24KKyAgICAgICAgIyAgIC1kZXZpY2UgdmlydGlvLWdwdS1nbC1wY2ksaG9zdG1l
bT00RyxibG9iPW9uLHZlbnVzPW9uCisgICAgICAgICMKKyAgICAgICAgc2VsZi5lbXVsYXRvci5i
b290KGFyY2g9ImFhcmNoNjQiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPWtl
cm4sCisgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWxfY21kbGluZT1bInJvb3Q9L2Rl
di92ZGEgY29uc29sZT10dHlBTUEwIl0sCisgICAgICAgICAgICAgICAgICAgICAgICAgICBvcHRp
b25zPVsiLU0iLCAidmlydCIsICItY3B1IiwgImNvcnRleC1hNzIiLCAiLW0iLCAiNTEyIiwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICItZHJpdmUiLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZiJmaWxlPXtpbWd9LGlmPXZpcnRpbyxmb3JtYXQ9cmF3
IiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICItZGlzcGxheSIsICJlZ2wt
aGVhZGxlc3MiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIi1kaXNwbGF5
IiwgImRidXMiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIi1kZXZpY2Ui
LCAidmlydGlvLWdwdS1wY2kiXSkKKworICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKKwor
ICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKKyAgICAgICAgc2VsZi5sb2dpbigpCisKKyAgICAgICAg
IyBUaGUgdGVzdCBjYXNlIHZlcmlmaWVzIHRoYXQgVnVsa2FuIGlzIGVuYWJsZWQgYW5kIHZrbWFy
ayBjYW4gcnVuCisgICAgICAgIGNtZCA9ICJ3ZXN0b24gLUIgaGVhZGxlc3MgLS1yZW5kZXJlciBn
bCAtLXNoZWxsIGtpb3NrIC0tIHZrbWFyayAtYiA6ZHVyYXRpb249MS4wIgorICAgICAgICBvdXRw
dXQsIGV4aXRfY29kZSA9IHNlbGYuZW11bGF0b3IucnVuKGNtZCwgVlVMS0FOSU5GT19USU1FT1VU
KQorICAgICAgICBzZWxmLmFzc2VydEVxdWFsKGV4aXRfY29kZSwgMCkKKworICAgICAgICAjIGNo
ZWNrIHdlIGdvdCB0byB0aGUgZW5kIGFuZCBlbWl0dGVkIGEgc2NvcmUKKyAgICAgICAgZm91bmRf
dmttYXJrID0gRmFsc2UKKyAgICAgICAgZm9yIGxpbmUgaW4gb3V0cHV0OgorICAgICAgICAgICAg
Zm91bmRfdmttYXJrIHw9ICJ2a21hcmsgU2NvcmU6IiBpbiBsaW5lCisKKyAgICAgICAgc2VsZi5h
c3NlcnRFcXVhbChmb3VuZF92a21hcmssIFRydWUpCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay9yb290ZnMtb3ZlcmxheS9ldGMvcHJvZmlsZS5k
LzEwLXhkZy1ydW50aW1lLnNoIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF92
a21hcmsvcm9vdGZzLW92ZXJsYXkvZXRjL3Byb2ZpbGUuZC8xMC14ZGctcnVudGltZS5zaApuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi41ZTBjY2IxZDNlCi0tLSAvZGV2L251
bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF92a21hcmsvcm9vdGZz
LW92ZXJsYXkvZXRjL3Byb2ZpbGUuZC8xMC14ZGctcnVudGltZS5zaApAQCAtMCwwICsxIEBACitl
eHBvcnQgWERHX1JVTlRJTUVfRElSPS90bXAKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
