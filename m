Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65E7C5B555
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 14:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58A8E81E9D;
	Tue,  3 Jun 2025 14:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFDV1hY_59Ic; Tue,  3 Jun 2025 14:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CE9F81DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CE9F81DBF;
	Tue,  3 Jun 2025 14:01:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CCFE255
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63D8F612E1
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mR7-AslVCROW for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 14:01:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E6CF6130B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6CF6130B
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E6CF6130B
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:06 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so893258766b.1
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 07:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748959264; x=1749564064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NLDOhVbQ9zfGts69JD+wP31kp64IZmljlzhU4Zs2oOc=;
 b=SbtSoklw7YTvS7W4Y/qPgZQVvnUusH9y7uOC+uRnnHOR7Hdz3XvVwBSTlzSMTS5lIZ
 KKVJCaYWzusTVKLwdDQQnPg8ta85sQeI5yfW063R24xAH41n79mDF1ya0gMhntEOK165
 9ZE5cA8n1olWO8HaN22rncWtPQDr8C5ZzxOYtChMcZxRtAfYOEhIrxHO7rmwtxh9A4gx
 G62Za9fhYwQ6YK+bBIK3qAoM8MZGj5P6zruAjSF2d6UNZbtUt7fZqOrFsaJM0BTaVLiw
 DU6wu4tJDRLcRweZNd5VzeOEIF8WnT8icOlpgnXKnrfVdlPKMhR1cNOdpCZMhwzl/EXy
 zvLw==
X-Gm-Message-State: AOJu0Yyt2/lZOCPkdhBiJmUDzrRUZkEGzUBi2qomP31H5RNr4zw3ZM+P
 2u4jAtGyKfudPVRmlBwG+elGhwY44k8jkyLAiiRvNRqSkAD17AAzbHCBqVYdIYNdVWYGqSYPJU6
 k2wVfEos=
X-Gm-Gg: ASbGnctX1uDiDvYg/u7ipT2T0gxvYLvCGlo7cYmv7iA43bW88SvsQA1RUU7hSqhQoqK
 V7LX/8FcLPgk1+dNpv6obyeCC9cxSt9Y8frzg8kcbRqFhGLTyq4zq9+q1Wu6JuaBAggn6anGhnh
 lU/NCtUyaU8iyyx6c04SqUNjXrSc+h9dcsINlXse7e4vpE8COkD//syoyZvJ/C+jpfu5AsuQ9hx
 wOBtFtbmvxe0W4qPsJA5CfgvWd8+Mczx3ZJf4SFeVBOVzbIBaoq1Pt/J+XHCZjr+qzxH0fuodkY
 Om7Mm7lU53YMnMmPdQbo/Spa9Ai+taQsHhdkFm3bv01DX9127R/Th5jLrQGstRI=
X-Google-Smtp-Source: AGHT+IFPI2QfRsbALPxZvp7dDeeIo4Z2hECHmQl/xBIyXRIJ+QCcE4BD2Jxv34SvtIFnv5tBoVMmNQ==
X-Received: by 2002:a17:906:4794:b0:ad8:8efe:31fe with SMTP id
 a640c23a62f3a-adb36c0afd3mr1629924966b.43.1748959262064; 
 Tue, 03 Jun 2025 07:01:02 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7fee1esm959236466b.25.2025.06.03.07.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:01:01 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B10BB5F9CC;
 Tue, 03 Jun 2025 15:01:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  3 Jun 2025 15:00:55 +0100
Message-ID: <20250603140100.1910123-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250603140100.1910123-1-alex.bennee@linaro.org>
References: <20250603140100.1910123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748959264; x=1749564064; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NLDOhVbQ9zfGts69JD+wP31kp64IZmljlzhU4Zs2oOc=;
 b=aNqdUH2kK4jr11tWR15dCCytPlHTYhrGmYLpXtZLxJEHt1pHzhmnpLbCQnaqH3gIB/
 YzIEdG8EJyErs7UcFyrFwkzjSG6aWwmvwkKO+ngbXkZTYfKIqCIn4GkToHfmQ8XOPe17
 KOl3eYWU0nuKBZcV8XMVaP5tsSeGeBTbOdudrDayzXx/MPOHPmfMLqtt2aLAvzQQp/dR
 12N7kURsSX8OwCrXUkG+Z9PLHCJNTpKeuA6xLVlChpUZs7bYAPykkjiMHjmse+nUnUci
 DrLI/FJjy7mxTTkze3KL6Ry79Y20emW8MsVaQFTw6N8xyxQAzO0PKqO+z7v7KZt58LzC
 HSng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aNqdUH2k
Subject: [Buildroot] [PATCH v5 1/4] package/vulkan-sdk: new package
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHByaW5jaXBsZSBjb21wb25lbnQgb2YgdGhpcyBpcyB0aGUgbmV3IHZvbGsgbWV0YS1sb2Fk
ZXIgd2hpY2ggaXMKcmVxdWlyZWQgZm9yIG1vcmUgcmVjZW50IHZlcnNpb25zIG9mIHZ1bGthbi10
b29scy4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4KLS0tCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2Fn
ZS92dWxrYW4tc2RrL0NvbmZpZy5pbiAgICAgICB8ICA4ICsrKysrKysrCiBwYWNrYWdlL3Z1bGth
bi1zZGsvdnVsa2FuLXNkay5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2Fu
LXNkay5tayAgIHwgMTggKysrKysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDMwIGlu
c2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Z1bGthbi1zZGsvQ29uZmln
LmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92dWxrYW4tc2RrL3Z1bGthbi1zZGsuaGFz
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLm1rCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCA1
NzliNWZmYzg3Li4yZGI1NTUzNTBkIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMzc1LDYgKzM3NSw3IEBAIGNvbW1lbnQgIkdyYXBoaWMg
bGlicmFyaWVzIgogCXNvdXJjZSAicGFja2FnZS90ay9Db25maWcuaW4iCiAJc291cmNlICJwYWNr
YWdlL3Z1bGthbi1oZWFkZXJzL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdnVsa2FuLWxv
YWRlci9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3Z1bGthbi1zZGsvQ29uZmlnLmluIgog
CXNvdXJjZSAicGFja2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmluIgogCiBjb21tZW50ICJPdGhl
ciBHVUlzIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbiBiL3BhY2th
Z2UvdnVsa2FuLXNkay9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uMDViZGEyMzdiYgotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdnVsa2FuLXNkay9D
b25maWcuaW4KQEAgLTAsMCArMSw4IEBACitjb25maWcgQlIyX1BBQ0tBR0VfVlVMS0FOX1NESwor
CWJvb2wgInZ1bGthbi1zZGsiCisJc2VsZWN0IEJSMl9QQUNLQUdFX1ZVTEtBTl9IRUFERVJTCisK
KwloZWxwCisJICBUaGUgVnVsa2FuIG1ldGEtbG9hZGVyCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNv
bS96ZXV4L3ZvbGsKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLmhh
c2ggYi9wYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLjUxMDZlNTM1MjcKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNr
YWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNoCkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5
IGNhbGN1bGF0ZWQKK3NoYTI1NiAgYWIzZDRhOGNjYWViMzI2NTIyNTljZGQwMDgzOTk1MDRhNDE3
OTI2NzViMDQyMWQ5MGI2NzcyOWVlMjc0NzQ2ZiAgMS40LjMwNC50YXIuZ3oKK3NoYTI1NiAgMzNj
ODMxZjc2Yjc5NTAxNjY1ZTY2YzIzYWM4Zjg3NjAyMDQ1N2MyMTZkNDQ1MjZhOGY3NDdkYTg5Nzk5
OWIzNSAgTElDRU5TRS5tZApkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tc2RrL3Z1bGthbi1z
ZGsubWsgYi9wYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5tawpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwLi5kNmFkMDgxOWM3Ci0tLSAvZGV2L251bGwKKysrIGIvcGFj
a2FnZS92dWxrYW4tc2RrL3Z1bGthbi1zZGsubWsKQEAgLTAsMCArMSwxOCBAQAorIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKKyMKKyMgdnVsa2FuLXNkaworIworIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKKworVlVMS0FOX1NES19WRVJTSU9OID0gMS40LjMwNAorVlVMS0FOX1NES19TSVRFID0gaHR0
cHM6Ly9naXRodWIuY29tL3pldXgvdm9say9hcmNoaXZlCitWVUxLQU5fU0RLX1NPVVJDRT0gJChW
VUxLQU5fU0RLX1ZFUlNJT04pLnRhci5negorVlVMS0FOX1NES19MSUNFTlNFID0gTUlUCitWVUxL
QU5fU0RLX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCitWVUxLQU5fU0RLX0lOU1RBTExfU1RB
R0lORyA9IFlFUworCitWVUxLQU5fU0RLX0RFUEVOREVOQ0lFUyA9IHZ1bGthbi1oZWFkZXJzCisK
K1ZVTEtBTl9TREtfQ09ORl9PUFRTICs9IC1EVk9MS19JTlNUQUxMPU9OCisKKyQoZXZhbCAkKGNt
YWtlLXBhY2thZ2UpKQotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
