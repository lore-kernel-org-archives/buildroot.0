Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFCEC021A0
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 18:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA41060B25;
	Thu, 13 Feb 2025 18:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wrl3hnVNFetG; Thu, 13 Feb 2025 18:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFB8D61AC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFB8D61AC0;
	Thu, 13 Feb 2025 18:16:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99888199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 18:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 865BA83FFD
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 18:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4oNa11GNgh86 for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 18:16:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98A4983FFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98A4983FFC
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98A4983FFC
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 18:16:02 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab7e9254bb6so194661166b.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 10:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739470560; x=1740075360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2L+4tMm0V5nAE1uFOwjXaEYOQyG1L+ogQdym3PZXb1M=;
 b=jm+xOxDDWlF2/AN/418RPqgHY7xsw/eMT18YQzs3mZ4koRpPN8Ju/rfBu2y2MrJK3G
 kK1TrAlNzXxjhaL1/DJ3+/ZvDvUTH3IVzT+EM5zexYOmM8MkuvfB2zjk00osOxlezJi7
 0FoKrLcGPFm4etIkezq8j4bWxq+zqqeVAqxOGqjKQHWkyWvEVULJ2JzqTrmwOR7jF6UM
 ILcFHRpjWRjLwFfoYV30y3hbgUUETz6KXO+A1PDVLxzLsKmitFKkN1ABxpVKfReLSvuu
 XZ/VXu3nMWDKtOHJBdah51H50Ei76OOvBqenPy2j6zCmqnQZB3vo5weOQ8TT7/y4Jl7k
 ipFQ==
X-Gm-Message-State: AOJu0Ywu9Fcof0+2+PZvZ7cfITNtdZtWCwUZRdABV6MX0va2H99EZY/9
 gsgg5tzaJm+hdZ8PG6pMIfWnUH7SeozrCkD96ma+yLtHUCL08gvE2GYpWUBCYdlsy3VLUXITrI9
 iNwM=
X-Gm-Gg: ASbGncvlVv2cMWkflIjjpiZIpY+CuJnTWzy/zvfiAd89iZaoMOXc6j0vaS2XkxbkpLU
 Wvwu4oUkZKla7xC9e6uLC2RAqfSxxwbXSyYaUVi+/eDemMTLp4DshUvKiOHJdm//ts5Fqs1oRUO
 bH/t7JQ6o62B1pjctcFoCGQBH4foH4wpOWhJZ4M+dWpC75J8ggoVfXDNAVs/DzzGg3+uLRs+DRj
 A5Y/Nsaq5EhAJ9pnd3kw74jjDWzXuA2nCydSfgj8bCZJWj6gASRmz4xUQyG+KskNqgt254mtSxD
 k4yHsLVeOq8LbJ5koQ==
X-Google-Smtp-Source: AGHT+IF/bqVmd0iVCzpl/coL6FwEDSKqzxN/u1uOw1cXPH70brmX6QaDfauVynibdEhKtYtEG2mlKQ==
X-Received: by 2002:a17:907:9448:b0:aa5:225f:47d9 with SMTP id
 a640c23a62f3a-ab7f33daf5fmr803407866b.29.1739470559985; 
 Thu, 13 Feb 2025 10:15:59 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532594a0sm180967866b.68.2025.02.13.10.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 10:15:59 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 900EE5F7DE;
 Thu, 13 Feb 2025 18:15:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 13 Feb 2025 18:15:52 +0000
Message-Id: <20250213181552.966148-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739470560; x=1740075360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2L+4tMm0V5nAE1uFOwjXaEYOQyG1L+ogQdym3PZXb1M=;
 b=CFmtEetRSwhWUVJYC+dRE/bu6nH40khYyRGcK26iPk3EdDTD9GokbGOz0uupCXDimG
 Jkl3NXMCcwEvJxmOiNZi0+467j1gHsvkEO9piW+zTncJjkMTJq/TOZYNbroQQ9pTLrnM
 +7i9rUWihW5J4TSlnykCnUY83O4lYgWcXDuisInVNDObsfX5yOmuai/s9NuGQp8uDZc8
 Eh7PGonVcWB13GdcrSArlIMNk/ypBoyk/QNKqHIHGSOPDpNWC1djakcGlA9mEKEmzQTq
 zMEEeD0fX3u9ZGHkXAhbLFWQ3mGXevg3RoGSbuOKKkp8IMs7YhepdoNTNTOGLZ5NmUB1
 gDow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CFmtEetR
Subject: [Buildroot] [PATCH] package/elfutils: ensure we have 5.0 kernel
 headers
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SXQgc2VlbXMgc29tZSBvZiB0aGUgZXh0ZXJuYWwgdG9vbGNoYWlucyBoYXZlIGZhaXJseSBvbGQg
aGVhZGVycy4gVGhpcwpjYW4gY2F1c2UgYSBidWlsZCBmYWlsdXJlIG9mIGVsZnV0aWxzIG9uIEFh
cmNoNjQgZHVlIHRvIGEgbWlzc2luZwpkZWZpbml0aW9uIG9mIHN0cnVjdCB1c2VyX3BhY19tYXNr
LgoKUHJldmVudCB0aGUgdXNlciBzZWxlY3RpbmcgZWxmdXRpbHMgdW5sZXNzIHRoZSBrZXJuZWwg
aGVhZGVycyB3aWxsCmFsbG93IGl0IHRvIGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogQWxleCBCZW5u
w6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgotLS0KIHBhY2thZ2UvZWxmdXRpbHMvQ29uZmln
LmluIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9lbGZ1dGlscy9Db25maWcuaW4gYi9wYWNrYWdl
L2VsZnV0aWxzL0NvbmZpZy5pbgppbmRleCBjMzU1MDQ4YzZkLi40OTk1YjRmMGQyIDEwMDY0NAot
LS0gYS9wYWNrYWdlL2VsZnV0aWxzL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2VsZnV0aWxzL0Nv
bmZpZy5pbgpAQCAtMSwxMiArMSwxNCBAQAotY29tbWVudCAiZWxmdXRpbHMgbmVlZHMgYSB0b29s
Y2hhaW4gdy8gd2NoYXIsIGR5bmFtaWMgbGlicmFyeSwgdGhyZWFkcyIKK2NvbW1lbnQgImVsZnV0
aWxzIG5lZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFyLCBkeW5hbWljIGxpYnJhcnksIHRocmVhZHMs
IChrZXJuZWwgaGVhZGVycyA+NS4wIGZvciBBQXJjaDY0KSIKIAlkZXBlbmRzIG9uICFCUjJfVVNF
X1dDSEFSIHx8IEJSMl9TVEFUSUNfTElCUyBcCi0JCXx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJF
QURTCisJCXx8ICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIFwKKwkJJiYgKEJSMl9UT09MQ0hB
SU5fSEVBREVSU19BVF9MRUFTVF81XzAgfHwgIUJSMl9hYXJjaDY0KQogCiBjb25maWcgQlIyX1BB
Q0tBR0VfRUxGVVRJTFMKIAlib29sICJlbGZ1dGlscyIKIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NI
QVIKIAlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hB
SU5fSEFTX1RIUkVBRFMKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFT
VF81XzAgfHwgIUJSMl9hYXJjaDY0ICMgdXNlcl9wYWNfbWFzawogCXNlbGVjdCBCUjJfUEFDS0FH
RV9aTElCCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0FSR1BfU1RBTkRBTE9ORSBpZiAhQlIyX1RPT0xD
SEFJTl9VU0VTX0dMSUJDCiAJc2VsZWN0IEJSMl9QQUNLQUdFX01VU0xfRlRTIGlmICFCUjJfVE9P
TENIQUlOX1VTRVNfR0xJQkMKLS0gCjIuMzkuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
