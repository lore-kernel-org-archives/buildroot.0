Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10239C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 16:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0380418BB;
	Mon, 11 Dec 2023 16:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0380418BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25r6VEUX6OeE; Mon, 11 Dec 2023 16:00:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D229741926;
	Mon, 11 Dec 2023 16:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D229741926
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39EBF1BF336
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:00:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12A79418A2
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:00:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12A79418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6chXDCs0lv1L for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 16:00:07 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E99B41899
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 16:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E99B41899
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40c32df9174so38231015e9.3
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702310404; x=1702915204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Y0xq9KR8rbuZG3oenr4m7MqrDhl43ANU9pv0CUY/h8=;
 b=pjAB/E07B7/RxpkoCSV8s85ksbyw1Jo6hBuYNqZnGUxhTNN5Oo6ODHASJm2GjiEqnC
 fpJsJ6Ee5eAzkGyRS4QHAJBP9GmyiPNCYTOk1U50exfHft65HyKYWbiJeIUh8alNy6Ir
 2fvdj5zwaZDBG2sN2gFwg0nmPHQGQtlEkRO1acsuv53BpSsS19X4s/oAD/L0+DpCADik
 tGdcO3ige6AVmXiMYFnszcOt1w6ZdON2EnM5ZMTZpVR22JsopsuJFKaujEj1otvXOXc+
 Ntw4NVeXGCIU2KWz5dpS5XSxMCUwTmlD1T2dOVUyDECxUljjwt/kBpBv+Cy02ICKVWiV
 J0ng==
X-Gm-Message-State: AOJu0YwJrbxgTL9TJuExNzdkD++bXRk0N8Tvc+dLAcGQqeCVVRTSsCUN
 5XCmNAbgCQYmZBtEKux5LmWteouPY2SPSO40M30=
X-Google-Smtp-Source: AGHT+IG8Vl2gWXz/t8pauClnVkkV2uOysob8mccf6kF+/W9+6VUtoJBdpkdCZmsCkZUyiAgV3sM9+w==
X-Received: by 2002:a05:600c:22c3:b0:40c:2b9d:5877 with SMTP id
 3-20020a05600c22c300b0040c2b9d5877mr1729979wmg.67.1702310404388; 
 Mon, 11 Dec 2023 08:00:04 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfe881000000b003334926fb81sm3800972wrm.90.2023.12.11.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 08:00:04 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 16:59:50 +0100
Message-ID: <20231211155951.4079886-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211155951.4079886-1-gael.portay@rtone.fr>
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1702310404; x=1702915204; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Y0xq9KR8rbuZG3oenr4m7MqrDhl43ANU9pv0CUY/h8=;
 b=aR7sY4zBXjgcyEOl2/X69PdjjsUvk4KhpxATw3JuDPu777HexTMGzmwqXagKz8RwJ4
 8+0oObVrp1vN32RRBncQx3xSXgeoPLcP/6PtXJheqZU2TW3h+5+8m5txZ/XiVl604Pbj
 HJJfXFqsahXNUUZ8ES5tVCxe0AFU3gKxM2IgY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=aR7sY4zB
Subject: [Buildroot] [PATCH v2 1/2] arch: add support 16k page size on ARM64
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
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
LjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
