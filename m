Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61569C021A4
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3116A416C3;
	Fri, 14 Feb 2025 11:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rBxgTLWOumAu; Fri, 14 Feb 2025 11:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC01C4149C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC01C4149C;
	Fri, 14 Feb 2025 11:11:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CAA791E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE7E78483C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l88s4-mwHRIg for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6798284837
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6798284837
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6798284837
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:10:51 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-abadccdfe5aso20949166b.0
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739531449; x=1740136249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZ6O3w9IK5e/xG39D95WQOimBoaRH7PzFFsC1IL+u+k=;
 b=CnXKPCWaWJ4P4ehYhhKadb6hXmmTULFv83Zju/UszJkbRr9+da+zguz6FhGFsxkB/N
 dSNx13B4pKAo/LOrOV4M7DqCl3ws1v4aOgZSK36fGRwhbTX4ghmRQTKTcLw125fYHwPG
 QnSOCGidC5ytKvupCEA35eMH8B9B/UufD0PpWbLliFpS4XSZMS8xAi2EnznSjerf3x3z
 X/mREcnk5HWos9QkunosG8ynOGm6J38OJEiV+THxv6SolJVyHq0LCzhpC6r+es0BRVwl
 PCViJD5NctO+9z20v9ILm8crl/qvsVy3fgHFeAZojONEd2nqjsMQr6M+QuiVYDxmkzFy
 Efpw==
X-Gm-Message-State: AOJu0YzjUUVNB5udM3/FWZD0XsbAlVpADld28aJE15CSCIBDSk37+6V4
 0zAssWHpQj32AVouM6PJ1XaoRydxo98fNEQ2x1dfygoXUr/lcEOeebgST7cwEKkuMC8p68WmTWN
 6fCA=
X-Gm-Gg: ASbGnctEJzXr1j1uqS+CGxoLLvaWkQ17+Hd2BjFCzp8JBNHjKlhMMTwGMvK6xSZ6A7e
 xn0HetwppDkY+GK39pqTOFECBpLdPTQ4a6BWP5ezVeoVbErRHGxts+tHnJsASTA34LrK6Zt75cy
 cVAng968rDzgMZ6Jal3+SP/0Q88s+IU89Ted3kM2wF4YnNiT9q3C37SEVMAoGcFnihlcCrDo3fH
 G4M+NOtWzDw/ScsDpkdmUMR3waaeHXxtoK3BraxK3/SeqqL1bmykl1dG1kPjj822EHwFlT2X6eu
 cX/jR2txh5FpmDcAWQ==
X-Google-Smtp-Source: AGHT+IHSev9O+kwKPpg1oFEjbUd3bma/G1oLmL+ZrKnRAd47hfW2Sa8H77/E0dhfgCtVxS20hNoBPw==
X-Received: by 2002:a17:907:724c:b0:ab7:d10b:e1de with SMTP id
 a640c23a62f3a-ab7f339c868mr1077188566b.13.1739531448750; 
 Fri, 14 Feb 2025 03:10:48 -0800 (PST)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf4bfsm323617966b.179.2025.02.14.03.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:10:46 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E584B5F7DF;
 Fri, 14 Feb 2025 11:10:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 11:10:42 +0000
Message-Id: <20250214111044.4096837-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250214111044.4096837-1-alex.bennee@linaro.org>
References: <20250214111044.4096837-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739531449; x=1740136249; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZ6O3w9IK5e/xG39D95WQOimBoaRH7PzFFsC1IL+u+k=;
 b=b7Z9TBK7mexaIi/6FCZfk7aQYk++W4etPn2Wn9SBPY/Fr+WBM2Er3ePs90jiQbDfs9
 MEyK2R/bVOIZ1f72uLciZjDZSEL4kBO2x2KDUr2VMmlwsH7nNmwQANz8AGeR5zexFC1C
 QA6cCYXggkj7bDYlPHgBGwmtSJxfuxOL8uLW+iLxBCtw8/wSBQyCLTy63jUlFnf8rI+N
 BBhipQ7Wq92vfrbKQ2Ndo0Iw03WddB7C33otzrioprvhLNUVNkU9P1iuwr0BqGoj5FEJ
 4Qky/P8HnUQpxat+IHHvwU8/PMnhdZtOmotsajvFZMC3cebRVJUUICdz8mWpWJ02sc1M
 1FUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=b7Z9TBK7
Subject: [Buildroot] [PATCH v3 6/7] package/vkmark: add vkmark benchmarking
 tool
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2UgYnVpbGQgZnJvbSB0aGUgY3VycmVudCBtYXN0ZXIgYXMgd2UgbmVlZCBmYWlybHkgdXB0byBk
YXRlIGJpdHMgZm9yCmNyb3NzIGNvbXBpbGUgc3VwcG9ydC4KClNpZ25lZC1vZmYtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2NAogIC0gZml4IHRhYiB2cyBz
cGFjZSBkYW1hZ2UKICAtIGRvbid0IGlmIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfQU5ZCiAg
LSBtYWtlIGNvbW1lbnRzIHByb3Blcmx5IGRlcGVuZAogIC0gdXNlIHRoZSBuZXcgMjAyNS4wMSBy
ZWxlYXNlCiAgLSBhZGQgc2hhMjU2c3VtIG9mIENPUFlJTkctTEdQTDIuMQogIC0gYWxwaGFiZXRp
YyBzb3J0IG9mIGluaXRpYWwgVktNQVJLX0RFUEVOREVOQ0lFUwp2MwogIC0gYWRkIHhjYi11dGls
LXdtIGRlcHMgdW5kZXIgWDExCiAgLSBhZGQgYXNzaW1wIGRpcmVjdGx5IHRvIFZLTUFSS19ERVBF
TkRFTkNJRVMKICAtIGRyb3AgZHVwbGljYXRlIEJSMl9JTlNUQUxMX0xJQlNURENQUAogIC0gZHJv
cCBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkKdjIKICAtIGZpeCB3aGl0ZXNwYWNlIGVy
cm9ycyBpbiBDb25maWcuaW4KICAtIGZpeCBzb3J0aW5nIG9mIHNvdXJjZXMKICAtIGFkZCBERVZF
TE9QRVJTIGVudHJ5CiAgLSByZXdvcmsgS0NvbmZpZyBiYXNlZCBvbiByZXZpZXcKICAtIGRyb3Ag
dW51c2VkIHNoYTI1NnN1bQogIC0gZXhwbGljaXRseSBlbmFibGUvZGlzYWJsZSB0aGUgYmFja2Vu
ZHMKLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25m
aWcuaW4gICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW4gICB8IDQ4ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3ZrbWFyay92a21h
cmsuaGFzaCB8ICAzICsrKwogcGFja2FnZS92a21hcmsvdmttYXJrLm1rICAgfCAzNCArKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS92a21hcmsvdmttYXJrLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BF
UlMKaW5kZXggNWY5ODI1N2I4Ni4uNjhmMTRhZWQ2MSAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUwor
KysgYi9ERVZFTE9QRVJTCkBAIC0xNDQsNiArMTQ0LDkgQEAgRjoJcGFja2FnZS9saWJsb2c0Yy1s
b2NhbHRpbWUvCiBOOglBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxp
bi5jb20+CiBGOglwYWNrYWdlL3R6LwogCitOOglBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxp
bmFyby5vcmc+CitGOglwYWNrYWdlL3ZrbWFyay8KKwogTjoJQWxleGFuZHJlIEVzc2UgPGFsZXhh
bmRyZS5lc3NlLmRldkBnbWFpbC5jb20+CiBGOglwYWNrYWdlL2t2YXphYXIvCiBGOglwYWNrYWdl
L3Y0bDJsb29wYmFjay8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9D
b25maWcuaW4KaW5kZXggNThlOTkzOWVhNi4uNmY0NDcxNDJiMCAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTMzNyw2ICszMzcsNyBAQCBj
b21tZW50ICJHcmFwaGljIGFwcGxpY2F0aW9ucyIKIAlzb3VyY2UgInBhY2thZ2Uvc3dheWJnL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdGVzc2VyYWN0LW9jci9Db25maWcuaW4iCiAJc291
cmNlICJwYWNrYWdlL3RpbmlmaWVyL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvdmttYXJr
L0NvbmZpZy5pbiIKIAogY29tbWVudCAiR3JhcGhpYyBsaWJyYXJpZXMiCiAJc291cmNlICJwYWNr
YWdlL2NlZ3VpL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdmttYXJrL0NvbmZpZy5p
biBiL3BhY2thZ2UvdmttYXJrL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi4wMzJlYjQ3ZGM5Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS92a21hcmsv
Q29uZmlnLmluCkBAIC0wLDAgKzEsNDggQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9WS01BUktfRkxB
Vk9SX0FOWQorCWJvb2wKKworY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfS01TCisJ
Ym9vbAorCWRlZmF1bHQgeSBpZiBCUjJfUEFDS0FHRV9IQVNfTElCR0JNCisJc2VsZWN0IEJSMl9Q
QUNLQUdFX1ZLTUFSS19GTEFWT1JfQU5ZCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9WS01BUktfRkxB
Vk9SX1dBWUxBTkQKKwlib29sCisJZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX1dBWUxBTkQKKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9BTlkKKworY29uZmlnIEJSMl9QQUNLQUdF
X1ZLTUFSS19GTEFWT1JfWDExCisJYm9vbAorCWRlZmF1bHQgeSBpZiBCUjJfUEFDS0FHRV9YT1JH
NworCXNlbGVjdCBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0FOWQorCitjb25maWcgQlIyX1BB
Q0tBR0VfVktNQVJLCisJYm9vbCAidmttYXJrIgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfVktN
QVJLX0ZMQVZPUl9BTlkKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfVlVMS0FOX0hFQURFUlMKKwlzZWxl
Y3QgQlIyX1BBQ0tBR0VfVlVMS0FOX0xPQURFUgorCWRlcGVuZHMgb24gIUJSMl9TVEFUSUNfTElC
UyAjIHZ1bGthbi1sb2FkZXIKKwlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMg
IyB2dWxrYW4tbG9hZGVyCisJc2VsZWN0IEJSMl9QQUNLQUdFX0dMTQorCWRlcGVuZHMgb24gQlIy
X1VTRV9XQ0hBUiAjIGFzc2ltcAorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVB
U1RfNyAjIGFzc2ltcAorCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgdnVsa2Fu
LWxvYWRlciwgZ2xtLCBhc3NpbXAsIHZrbWFyaworCXNlbGVjdCBCUjJfUEFDS0FHRV9BU1NJTVAK
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfV0FZTEFORF9QUk9UT0NPTFMgaWYgQlIyX1BBQ0tBR0VfVktN
QVJLX0ZMQVZPUl9XQVlMQU5ECisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhDQiBpZiBCUjJfUEFD
S0FHRV9WS01BUktfRkxBVk9SX1gxMQorCXNlbGVjdCBCUjJfUEFDS0FHRV9YQ0JfVVRJTF9XTSBp
ZiBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX1gxMQorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJE
Uk0gaWYgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9LTVMKKwloZWxwCisJICB2bW1hcmsgaXMg
YW4gVnVsa2FuIEdQVSBiZW5jaG1hcmsuCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS92a21hcmsv
dmttYXJrCisKK2NvbW1lbnQgInZrbWFyayBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxp
YnJhcnksIHRocmVhZHMsIHdjaGFyLCBnY2MgPj0gNywgQysrIgorCWRlcGVuZHMgb24gQlIyX1NU
QVRJQ19MSUJTIHx8IFwKKwkhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCBcCisJIUJSMl9V
U0VfV0NIQVIgfHwgXAorCSFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF83IHx8IFwKKwkhQlIy
X0lOU1RBTExfTElCU1REQ1BQCisKK2NvbW1lbnQgInZrbWFyayBuZWVkcyBhIGJhY2tlbmQ6IGdi
bSwgd2F5bGFuZCBvciB4Y2IiCisJZGVwZW5kcyBvbiAhQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZP
Ul9BTlkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoIGIvcGFja2FnZS92
a21hcmsvdmttYXJrLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
MjY1MGY0Y2NkNAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNo
CkBAIC0wLDAgKzEsMyBAQAorIyBMb2NhbGx5IGNvbXB1dGVkCitzaGEyNTYgIDFhZTM2Mjg0NDM0
NGQwZjk4NzhiN2EzZjEzMDA1Zjc3ZWFlNzA1MTA4ODkyYTRlOGFiZjIzN2Q0NTJkMzdlZGMgIHZr
bWFyay0yMDI1LjAxLnRhci5negorc2hhMjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJj
NzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBDT1BZSU5HLUxHUEwyLjEKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvdmttYXJrL3ZrbWFyay5tayBiL3BhY2thZ2UvdmttYXJrL3ZrbWFy
ay5tawpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi43YjcyMWM2Yzk5Ci0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS92a21hcmsvdmttYXJrLm1rCkBAIC0wLDAgKzEsMzQg
QEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHZrbWFyaworIworIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKKworVktNQVJLX1ZFUlNJT04gPSAyMDI1LjAxCitWS01BUktfU0lURSA9ICQo
Y2FsbCBnaXRodWIsdmttYXJrLHZrbWFyaywkKFZLTUFSS19WRVJTSU9OKSkKK1ZLTUFSS19MSUNF
TlNFID0gTEdQTC0yLjEKK1ZLTUFSS19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORy1MR1BMMi4xCitW
S01BUktfREVQRU5ERU5DSUVTID0gYXNzaW1wIGdsbSBob3N0LXBrZ2NvbmYgdnVsa2FuLWhlYWRl
cnMgdnVsa2FuLWxvYWRlcgorCitpZmVxICgkKEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfS01T
KSx5KQorVktNQVJLX0RFUEVOREVOQ0lFUyArPSBsaWJkcm0gbGliZ2JtCitWS01BUktfQ09ORl9P
UFRTICs9IC1Ea21zPXRydWUKK2Vsc2UKK1ZLTUFSS19DT05GX09QVFMgKz0gLURrbXM9ZmFsc2UK
K2VuZGlmCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9XQVlMQU5EKSx5KQor
VktNQVJLX0RFUEVOREVOQ0lFUyArPSB3YXlsYW5kIHdheWxhbmQtcHJvdG9jb2xzCitWS01BUktf
Q09ORl9PUFRTICs9IC1Ed2F5bGFuZD10cnVlCitlbHNlCitWS01BUktfQ09ORl9PUFRTICs9IC1E
d2F5bGFuZD1mYWxzZQorZW5kaWYKKworaWZlcSAoJChCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9S
X1gxMSkseSkKK1ZLTUFSS19ERVBFTkRFTkNJRVMgKz0gbGlieGNiIHhjYi11dGlsLXdtCitWS01B
UktfQ09ORl9PUFRTICs9IC1EeGNiPXRydWUKK2Vsc2UKK1ZLTUFSS19DT05GX09QVFMgKz0gLUR4
Y2I9ZmFsc2UKK2VuZGlmCisKKyQoZXZhbCAkKG1lc29uLXBhY2thZ2UpKQotLSAKMi4zOS41Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
