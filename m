Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D25C61D90
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 19:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BDF8813DA;
	Tue, 21 Nov 2023 19:35:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BDF8813DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2dDKfnuFZcf; Tue, 21 Nov 2023 19:35:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AA981452;
	Tue, 21 Nov 2023 19:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0AA981452
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE07A1BF30C
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 19:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FD78403A7
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 19:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FD78403A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xBEJBo-PDCmC for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 19:35:03 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 713C1401D3
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 19:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 713C1401D3
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40839807e82so682575e9.0
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 11:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700595301; x=1701200101;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MglA3DR1IT3JhVMdDF/N/h0pNZ03us7dUiDvpgM34U=;
 b=Of6eUl2FIyF5Pw4myweM7LgA1tykLA1l8gmgl7w3O9Iuc1qVKtxBAATuOrqcVzMcq4
 vj/C+XKME3mc1qIqmGbsj1eZNad+uXprGBwl3sO6OBV7syPDYwcqEzlAHxx3iDmbFwLP
 OSCYglqLzHPdvPxC8ua94bcmLt7BTtfpnKPkDLhjyangFmHC3YursFzmAuCXGzqW8AMD
 GPfPkBlak2Pxl4cuSdUqS+dkBhShHOn5DKZm67K3G+IxOhSRnEeoNntiMU1oLGL2M79j
 1l9LFkXQwq34u4I7bT9rTfyT/unOtyNGBrTnvMAq5Avzzpwpkk93XXTRm9LrwhosRHu6
 yeyA==
X-Gm-Message-State: AOJu0YxrrL5ra8T58gjuWFX71W4hdQJ3UyciXUOkrLZ5vlTQmMmrvWUY
 uIkodaAD3y21bQ6mMV6u9CRgz5SF+kJOw3xMClI=
X-Google-Smtp-Source: AGHT+IEwRLILzvT8AO1LOTM3nfSV8iUXe/p+F6JjEHpR6cKiUdjmaiF1Df6fvVarU6idQ317AwsQ7g==
X-Received: by 2002:a05:600c:1686:b0:40b:20a5:d4cf with SMTP id
 k6-20020a05600c168600b0040b20a5d4cfmr3257586wmn.16.1700595300964; 
 Tue, 21 Nov 2023 11:35:00 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b0040a44179a88sm21879043wmf.42.2023.11.21.11.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 11:35:00 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 20:34:45 +0100
Message-ID: <20231121193448.1151936-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121193448.1151936-1-gael.portay@rtone.fr>
References: <20231121193448.1151936-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700595301; x=1701200101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MglA3DR1IT3JhVMdDF/N/h0pNZ03us7dUiDvpgM34U=;
 b=etmT1+TEXr+87vMhi2aXgJNBC1UuqszfjMRK3ovIh8yLmT6LSeWyZ48k2a6Am0lGdA
 dbMnLJhnSmieCQbDmGj7bY02Y2QnBKpk55oTWjfvahYIU/9G+0K0KlymRl5TgCgcBCIi
 lBSfRJWSLHySVocz6RUnaDbrKjajBGwx0KJe8=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=etmT1+TE
Subject: [Buildroot] [v1 1/4] arch: add support 16k page size on ARM64
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
Cc: Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIEJDTTI3MTIgb2YgdGhlIFJhc3BiZXJyeVBpIDUgc3VwcG9ydHMgZm9yIDE2S0IgcGFnZSBz
aXplLgoKVGhpcyBhZGRzIHN1cHBvcnQgZm9yIDE2IEtCIG9uIEFSTTY0LgoKU2lnbmVkLW9mZi1i
eTogR2HDq2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KLS0tCiBhcmNoL0NvbmZpZy5p
bi5hcm0gfCA0ICsrKysKIGFyY2gvYXJjaC5tayAgICAgICB8IDIgKy0KIGxpbnV4L2xpbnV4Lm1r
ICAgICB8IDQgKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbi5hcm0gYi9hcmNoL0NvbmZpZy5pbi5h
cm0KaW5kZXggNzg2MjFlMzIxYy4uYjQ0YTE2NGUwMyAxMDA2NDQKLS0tIGEvYXJjaC9Db25maWcu
aW4uYXJtCisrKyBiL2FyY2gvQ29uZmlnLmluLmFybQpAQCAtNzgxLDYgKzc4MSw5IEBAIGNob2lj
ZQogY29uZmlnIEJSMl9BUk02NF9QQUdFX1NJWkVfNEsKIAlib29sICI0S0IiCiAKK2NvbmZpZyBC
UjJfQVJNNjRfUEFHRV9TSVpFXzE2SworCWJvb2wgIjE2S0IiCisKIGNvbmZpZyBCUjJfQVJNNjRf
UEFHRV9TSVpFXzY0SwogCWJvb2wgIjY0S0IiCiAKQEAgLTc4OSw2ICs3OTIsNyBAQCBlbmRjaG9p
Y2UKIGNvbmZpZyBCUjJfQVJNNjRfUEFHRV9TSVpFCiAJc3RyaW5nCiAJZGVmYXVsdCAiNEsiIGlm
IEJSMl9BUk02NF9QQUdFX1NJWkVfNEsKKwlkZWZhdWx0ICIxNksiIGlmIEJSMl9BUk02NF9QQUdF
X1NJWkVfMTZLCiAJZGVmYXVsdCAiNjRLIiBpZiBCUjJfQVJNNjRfUEFHRV9TSVpFXzY0SwogCiBj
b25maWcgQlIyX0FSQ0gKZGlmZiAtLWdpdCBhL2FyY2gvYXJjaC5tayBiL2FyY2gvYXJjaC5tawpp
bmRleCAyZTczN2I5MmFjLi40MTc0ZDMzZGY1IDEwMDY0NAotLS0gYS9hcmNoL2FyY2gubWsKKysr
IGIvYXJjaC9hcmNoLm1rCkBAIC0yMyw3ICsyMyw3IEBAIGlmZXEgKCQoQlIyX0FSQ19QQUdFX1NJ
WkVfNEspJChCUjJfQVJNNjRfUEFHRV9TSVpFXzRLKSx5KQogQVJDSF9UT09MQ0hBSU5fV1JBUFBF
Ul9PUFRTICs9IC1XbCwteixtYXgtcGFnZS1zaXplPTQwOTYgLVdsLC16LGNvbW1vbi1wYWdlLXNp
emU9NDA5NgogZWxzZSBpZmVxICgkKEJSMl9BUkNfUEFHRV9TSVpFXzhLKSx5KQogQVJDSF9UT09M
Q0hBSU5fV1JBUFBFUl9PUFRTICs9IC1XbCwteixtYXgtcGFnZS1zaXplPTgxOTIgLVdsLC16LGNv
bW1vbi1wYWdlLXNpemU9ODE5MgotZWxzZSBpZmVxICgkKEJSMl9BUkNfUEFHRV9TSVpFXzE2Syks
eSkKK2Vsc2UgaWZlcSAoJChCUjJfQVJDX1BBR0VfU0laRV8xNkspJChCUjJfQVJNNjRfUEFHRV9T
SVpFXzE2SykseSkKIEFSQ0hfVE9PTENIQUlOX1dSQVBQRVJfT1BUUyArPSAtV2wsLXosbWF4LXBh
Z2Utc2l6ZT0xNjM4NCAtV2wsLXosY29tbW9uLXBhZ2Utc2l6ZT0xNjM4NAogZWxzZSBpZmVxICgk
KEJSMl9BUk02NF9QQUdFX1NJWkVfNjRLKSx5KQogQVJDSF9UT09MQ0hBSU5fV1JBUFBFUl9PUFRT
ICs9IC1XbCwteixtYXgtcGFnZS1zaXplPTY1NTM2IC1XbCwteixjb21tb24tcGFnZS1zaXplPTY1
NTM2CmRpZmYgLS1naXQgYS9saW51eC9saW51eC5tayBiL2xpbnV4L2xpbnV4Lm1rCmluZGV4IDFk
YjVjNjA0NmQuLjUzZTJhZDZkNDggMTAwNjQ0Ci0tLSBhL2xpbnV4L2xpbnV4Lm1rCisrKyBiL2xp
bnV4L2xpbnV4Lm1rCkBAIC00MTEsNiArNDExLDEwIEBAIGRlZmluZSBMSU5VWF9LQ09ORklHX0ZJ
WFVQX0NNRFMKIAkJJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfQVJNNjRfNEtfUEFH
RVMpCiAJCSQoY2FsbCBLQ09ORklHX0RJU0FCTEVfT1BULENPTkZJR19BUk02NF8xNktfUEFHRVMp
CiAJCSQoY2FsbCBLQ09ORklHX0RJU0FCTEVfT1BULENPTkZJR19BUk02NF82NEtfUEFHRVMpKQor
CSQoaWYgJChCUjJfQVJNNjRfUEFHRV9TSVpFXzE2SyksCisJCSQoY2FsbCBLQ09ORklHX0RJU0FC
TEVfT1BULENPTkZJR19BUk02NF80S19QQUdFUykKKwkJJChjYWxsIEtDT05GSUdfRU5BQkxFX09Q
VCxDT05GSUdfQVJNNjRfMTZLX1BBR0VTKQorCQkkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxD
T05GSUdfQVJNNjRfNjRLX1BBR0VTKSkKIAkkKGlmICQoQlIyX0FSTTY0X1BBR0VfU0laRV82NEsp
LAogCQkkKGNhbGwgS0NPTkZJR19ESVNBQkxFX09QVCxDT05GSUdfQVJNNjRfNEtfUEFHRVMpCiAJ
CSQoY2FsbCBLQ09ORklHX0RJU0FCTEVfT1BULENPTkZJR19BUk02NF8xNktfUEFHRVMpCi0tIAoy
LjQyLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
