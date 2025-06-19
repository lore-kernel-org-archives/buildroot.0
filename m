Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFBEC7115A
	for <buildroot@archiver.kernel.org>; Thu, 19 Jun 2025 14:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F63C81D46;
	Thu, 19 Jun 2025 14:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gmPVaXgN-5jq; Thu, 19 Jun 2025 14:48:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44A3A81DE5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44A3A81DE5;
	Thu, 19 Jun 2025 14:48:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 88F6DE2
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F98E4020A
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfonymlUOe6C for <buildroot@buildroot.org>;
 Thu, 19 Jun 2025 14:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 680034005D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 680034005D
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 680034005D
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 14:48:43 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so639423f8f.1
 for <buildroot@buildroot.org>; Thu, 19 Jun 2025 07:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750344521; x=1750949321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCc9qo75Zt7SLzOp2uLJMHpD/ehPsfootsyb5fUPMdE=;
 b=X/kA+68RhbNviuzJ2gdKtL8NJ6irFSAFHzDe/BLe1IMip6KSeMK2QqPDjzYDl+4qlR
 /lF0eUSSYotA3nBrgtoNrgtK3G5eJNlDP8eF7py7lgnJAYJ39n5H5PT9OwscKhOoab9X
 3AW9Qk7BljjwbmxkJsdxnwBeWUZS8IXarBnQqnoSkzh9mtW/TvccrhqoRhffcW4YJA6o
 k3z+p3sKJfoSAFQbs8y6YaGa4E8M4U1H0G6rUeTw91G63pPqSRobcZsCpa+tM1G3szzC
 vMSzQYFKTZDZPjiz7Fh/mJqtI5rfml0H5RzrmGo+d+acttUjGgAYF5KkKFkt+S8Oh6Wy
 0p/g==
X-Gm-Message-State: AOJu0Yy4XeZ7/qxkJI0ffJbKRoxrLPTg1o3VX/d0dufRprxNgsVNomL4
 bcaqopZy1hc7jGw1MFYSaj/AnMC/+RBSTg1a3m16WDtG1wxRgiaqM6Yt+0m8SWxznxPEPm71g1a
 qrQCSres=
X-Gm-Gg: ASbGnctkrBn53Ttpab99rb6oFoxWg/pmI4kMmYt4LML6MFobmCRDGkaYFswoTSgkVAL
 aDY3oLKjVLviunZPHj5ixDy4J7qzCstI7ReeXPyU6ylA7RX5amMzSpArZcQAdc2lLja+7RN6m47
 nSb8iyTMAtNJ93+BR/uRzuuoFTMN85jg5cnNvKviK7TwkOqK7/h+c7bhjtzabAZVvUrr4xc7wqE
 qEopxYim3EBIyyuy7rK3tDRNE85zudsXlAC0kHmI6oBfJwNuH8WYjDSm0mYadllM2dRbiu47i+H
 5vfsHSeCmSGmfI1f9LhOBjDdo6lwTLJc/jZ1DAZfAEa6yG4m1NOuk2EHkGQDmws=
X-Google-Smtp-Source: AGHT+IFqfm5ijfqBOhjsoUsAIhPO2KHf7kaeBgH47BVUSI+inv1vJk/2Dev1zEk5PytbJpRacGzn6Q==
X-Received: by 2002:a05:6000:718:b0:3a5:3b63:58f0 with SMTP id
 ffacd0b85a97d-3a57237178dmr17215582f8f.18.1750344520836; 
 Thu, 19 Jun 2025 07:48:40 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535ead2a84sm31049885e9.32.2025.06.19.07.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 07:48:39 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0D5D05F876;
 Thu, 19 Jun 2025 15:48:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 19 Jun 2025 15:48:35 +0100
Message-ID: <20250619144837.1298990-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250619144837.1298990-1-alex.bennee@linaro.org>
References: <20250619144837.1298990-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750344521; x=1750949321; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCc9qo75Zt7SLzOp2uLJMHpD/ehPsfootsyb5fUPMdE=;
 b=xFexZQHfCKZ/3g2qXI/fIRDg/pmIQDa5slqMdVciTC4C3puUfFlDXOIZ4H/LSENHAA
 kp2EY95bzbQ8n4sA/7PlZXz6tKeKOnE4+t2rGLGQ31z5IRaaaIkRhKXAK3y5nCofPs5E
 lf4LBhZv/j9tv3SNmtO++wh+fzypi1Vhx6jP3pnlU8O6D2Uwch8t/v/HywxO+SckwQdv
 ivGoHqInDNbkGbyCKUhm9Y757J2gkFggeoYCvtz1O9Z1OcSwWTRl2LLX46uUEnJzQuEc
 XVZv42COwjR4LXtbqNw9B3GBFj2Govi094W6ITKjTb/Db/drVxB88HmnAB4++QUwWpsm
 fKmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xFexZQHf
Subject: [Buildroot] [PATCH 2/3] package/kvm-unit-tests: add some missing
 deps
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
Cc: Thomas Huth <huth@tuxfamily.org>, Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gcnVuIHRoZSB0ZXN0cyB3ZSBuZWVkIGEgc3lzdGVtIFFFTVUsIHRpbWVvdXQsIGdldGNvbmYg
YW5kIG5tYXAtbmNhdApzbyB1cGRhdGUgdGhlIGRlcGVuZHMgZm9yIHRoZW0uCgpTaWduZWQtb2Zm
LWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLS0KVE9ETzoKICAt
IHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBiZSBhIHdheSB0byBkZXBlbmQgb24gdXRpbHMgZm9yIGdl
dGNvbmYKLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiAgICAgICAgIHwgOCAr
KysrKysrLQogcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayB8IDEgKwog
MiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL0NvbmZpZy5pbiBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluCmluZGV4IDAwMGY1ZGNlY2YuLjM5NDRhMjI0ZjMgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQt
dGVzdHMvQ29uZmlnLmluCkBAIC0xOSw2ICsxOSwxMCBAQCBjb25maWcgQlIyX1BBQ0tBR0VfS1ZN
X1VOSVRfVEVTVFMKIAkjIHg4Ni02NCB3ZSB1c2UgdGhlIGhvc3QgZ2NjIChzZWUgLm1rIGZpbGUg
Zm9yIGRldGFpbHMpCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzUg
fHwgIUJSMl9pMzg2CiAJZGVwZW5kcyBvbiBCUjJfSE9TVEFSQ0ggPSAieDg2XzY0IiB8fCAhQlIy
X3g4Nl82NAorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfUUVNVV9TWVNURU0gIyBmb3IgcWVtdS1z
eXN0ZW0tJEFSQ0gKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0NPUkVVVElMUyAjIGZvciB0aW1l
b3V0CisJZGVwZW5kcyBvbiAoQlIyX1BBQ0tBR0VfR0xJQkNfVVRJTFMgfHwgQlIyX1VDTElCQ19J
TlNUQUxMX1VUSUxTKSAjIGdldGNvbmYKKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX05NQVBfTkNB
VCAjIGZvciBuY2F0CiAJc2VsZWN0IEJSMl9IT1NUQVJDSF9ORUVEU19JQTMyX0NPTVBJTEVSIGlm
IEJSMl94ODZfNjQKIAloZWxwCiAJICBrdm0tdW5pdC10ZXN0cyBpcyBhIHByb2plY3QgYXMgb2xk
IGFzIEtWTS4gQXMgaXRzIG5hbWUKQEAgLTM4LDYgKzQyLDggQEAgY29uZmlnIEJSMl9QQUNLQUdF
X0tWTV9VTklUX1RFU1RTCiAKIAkgIGh0dHA6Ly93d3cubGludXgta3ZtLm9yZy9wYWdlL0tWTS11
bml0LXRlc3RzCiAKLWNvbW1lbnQgImt2bS11bml0LXRlc3RzIG5lZWRzIGEgdG9vbGNoYWluIHcv
IGdjYyA+PSA0LjUiCitjb21tZW50ICJrdm0tdW5pdC10ZXN0cyBuZWVkcyBhIHRvb2xjaGFpbiB3
LyBnY2MgPj0gNC41LCBxZW11LXN5c3RlbSwgdGltZW91dCwgZ2V0Y29uZiBhbmQgbmNhdCIKIAlk
ZXBlbmRzIG9uIEJSMl9pMzg2CiAJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVB
U1RfNF81CisJZGVwZW5kcyBvbiAhKEJSMl9QQUNLQUdFX1FFTVVfU1lTVEVNICYmIEJSMl9QQUNL
QUdFX0NPUkVVVElMUyAmJiBCUjJfUEFDS0FHRV9OTUFQX05DQVQpCisJZGVwZW5kcyBvbiAhKEJS
Ml9QQUNLQUdFX0dMSUJDX1VUSUxTIHx8IEJSMl9VQ0xJQkNfSU5TVEFMTF9VVElMUykKZGlmZiAt
LWdpdCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgYi9wYWNrYWdl
L2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCmluZGV4IDczZDIwZDZiMmUuLjYyMzRh
OTk4NmMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMu
bWsKKysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawpAQCAtOSw2
ICs5LDcgQEAgS1ZNX1VOSVRfVEVTVFNfU09VUkNFID0ga3ZtLXVuaXQtdGVzdHMtdiQoS1ZNX1VO
SVRfVEVTVFNfVkVSU0lPTikudGFyLmJ6MgogS1ZNX1VOSVRfVEVTVFNfU0lURSA9IGh0dHBzOi8v
Z2l0bGFiLmNvbS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy8tL2FyY2hpdmUvdiQoS1ZN
X1VOSVRfVEVTVFNfVkVSU0lPTikKIEtWTV9VTklUX1RFU1RTX0xJQ0VOU0UgPSBHUEwtMi4wLCBM
R1BMLTIuMAogS1ZNX1VOSVRfVEVTVFNfTElDRU5TRV9GSUxFUyA9IENPUFlSSUdIVCBMSUNFTlNF
CitLVk1fVU5JVF9URVNUU19ERVBFTkRFTkNJRVMgPSBjb3JldXRpbHMgbm1hcC1uY2F0CiAKIGlm
ZXEgKCQoQlIyX2FhcmNoNjQpJChCUjJfYWFyY2g2NF9iZSkseSkKIEtWTV9VTklUX1RFU1RTX0FS
Q0ggPSBhYXJjaDY0Ci0tIAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
