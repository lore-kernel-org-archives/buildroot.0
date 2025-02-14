Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D239C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 279AE60771;
	Fri, 14 Feb 2025 11:10:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q1ysAMZ6Yz2C; Fri, 14 Feb 2025 11:10:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 207C76F80C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 207C76F80C;
	Fri, 14 Feb 2025 11:10:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF891C2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 935836FB21
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAOGLCMFT6Ys for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EA106F7F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EA106F7F8
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EA106F7F8
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:49 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ab7c501bbecso285197666b.2
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531447; x=1740136247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XHE414pBrCOuuIuy+jmIkyH1u0jLJZvP1v/3kq8WpNE=;
 b=fnqn7UE7rtcGw8CAzBr8YW98NxJ5W+CsEroJ9pdI9m6vuuMD1Z+FmLFPL/58UuxpH0
 lbLhc892UbS0PNb/2or96TeujJYxEMMRPLL5COAChoS+rIaw+hv8ndzibycFvAeNHFcl
 4p6A+QLcHTbCDBF5Tthbdk22eZD8lwt4Kk5Yee/8fg+oGf9/lUA320+t0pBnsbYhsQRU
 wZs4iVOlYe00HuFrR5kuqqLbaxXCjeVcbO0eQMNEuBHUHjGb95J1gPW+9Godaj2HZ+dF
 eMItf+8jusDeF4RLqQi6dv4Wq8m/OEVhoKeQ2SNjr6fSDAqlKI6lSZgiLip8IiBu/5iz
 /r8w==
X-Gm-Message-State: AOJu0YzFZYDm6YHTujoLupzsE72d6mTWQsNdNppxShWXkjZ9O7ymNkzV
 kCp331iZEe+cQ5xfadtdh4uQoOHOxBFkR41E0mJjyeU7sjTF1O4KTcrkI1uhwmwrVnwx1ZA0m+Q
 cS+A=
X-Gm-Gg: ASbGncvMgoD0MK8TCzKTjSCoVuji7Pw2E1BSarnsFgPklTZ3fz59IeOaFHCZ8CQzuDp
 JDNn7h4Nb/J3lUhdtLnKJ98MIE1nXCJjf4DTITApm4u0gMIBTqU5VfedFc062JwHaPtTIJIRNk4
 3hIEWEqiZyBCK8GL96Fe/+RlwBhKbrkuTdZODi4t/wP6w9HY9wtIP/ksB1WyPSF9nTBzO/rG25r
 gWeCAJGTeeU9mz3NmP8p3K+SvgPkv/LiNSum3A3Ad2yI43/jJX92V7rUKegmm/thSeY4eXeLC31
 uBH0+W1HJracNl5iRQ==
X-Google-Smtp-Source: AGHT+IGHmalAKLBz/TSqNexLkzyN7bLaPmtQ9ZGUQP+mlB38Thx0Y3lft0+J6lHvwKsA8bSD40kFOg==
X-Received: by 2002:a17:907:86a7:b0:ab7:c284:7245 with SMTP id
 a640c23a62f3a-ab7f339c875mr927718566b.18.1739531446433; 
 Fri, 14 Feb 2025 03:10:46 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba5339d94asm321375566b.143.2025.02.14.03.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:10:45 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 11548619BA;
 Fri, 14 Feb 2025 11:10:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 11:10:39 +0000
Message-Id: <20250214111044.4096837-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214111044.4096837-1-alex.bennee@linaro.org>
References: <20250214111044.4096837-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531447; x=1740136247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XHE414pBrCOuuIuy+jmIkyH1u0jLJZvP1v/3kq8WpNE=;
 b=laZq2hgiY57gY4mDdXhqG5cIg4nXxMQrPs40mkfrHlP2ZNwuKHn1RAJg+YK5dWrcf1
 ez1hDGLPkLevM8jlGoJthAyOcnSHCtwF0gfgBx3xVgzMS3y/35L/dYwLgmsCXtXOZ5Sa
 O+ub6B6Wz+guWrMGtMdnWE779KuE9FRUOaMcsO2AMtXKtNsSrvdlXiCLYHcn0omxGa2r
 arKT66jdb/qJfYgDR+0XQ0NcKyEvm7IoIawmDjYQ7p54gWlVoaFLRQom4s6hv8UjNGky
 Yb3HiJ1f6Wa9E91mFQzUlWiiV7rtL7GonigXgnNgaQkzL74Yl3ITW5RSBYeJZOAOXRA9
 +Lzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=laZq2hgi
Subject: [Buildroot] [PATCH v3 3/7] package/vulkan-sdk: new package
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
aWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBk
YWMxZmM1NjhkLi41OGU5OTM5ZWE2IDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMzczLDYgKzM3Myw3IEBAIGNvbW1lbnQgIkdyYXBoaWMg
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
YWtlLXBhY2thZ2UpKQotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
