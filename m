Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47E0E77170
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 17:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 740E1416F4;
	Thu,  5 Dec 2024 17:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqPdMxG2vyXL; Thu,  5 Dec 2024 17:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADEAB416F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADEAB416F9;
	Thu,  5 Dec 2024 17:36:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D3491DD1
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B5AA43461
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-FBHrLaPi2i for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 17:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DCF9243460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCF9243460
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DCF9243460
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-434a766b475so12154075e9.1
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 09:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733420207; x=1734025007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RCQEmjfsG+mUlsN7pfWMDfi3y6NJAl9DLaar5GPvwxg=;
 b=c34yf6tC++ScWcCgq/LLoPQEm0LiRpRmW4puwiNMeoF2iH83ElzyUJMPFpKL/VG3UK
 znO8Eji9UKkiSBLFZDaw3BKeyHfMGB7PO4Ox7doUUS0KLpN1jZZJH/MuJqzFQIKv+y0G
 K/SwOOalKLrn1kZYnUYnBvXcCNHkt4jqhcPS81OveJ02aNn5pIaZCFXui+6YcXmA8HrP
 D/ZS+L6Tfr4ZqncYhgRz+Fjxby4jGoxbUXiEaj60DSXwGfWHd6+R9eJ0B1pB2lQhLSvb
 xagjq5/9htx1KEZGeUYYeYrNO/Zzw9G9fD+WqV/EnarIZ926hWLI1pW1KuPR4EqXeorb
 GB2Q==
X-Gm-Message-State: AOJu0YzXFz6Ckr4cSpYXN1TmLx7k63JzVRvZGFEjC+uqpANWDTzrlZXJ
 YygLnWH9gLHxkbAa4CeIkIiCie9+GDfugUpjz+3Ci1bVITEei+Rx9+0W5REZlQiIjISYK9VrOC/
 nxuU=
X-Gm-Gg: ASbGncuCYqpNNFNPDIh+NLpBYXOT3W+/SGsrrOnGi3zljYl6eRYOirb5TyzLsZDFZPf
 85xnEVyPM7yUDE1Pkt9qqv+Ou68QU2l8xgoXRunSj4SsTClshSf8pADQhx+6Gm8r+LRSj5x4mrw
 udF89dxEqSNpInBU1xIs6knhwvDUJzMD7bY6i3eDyRpFtwVD+5u+TJbJqz+feqQaKDL9QA2DBL7
 5v8w2fRZrYqGeizh0SGiL4vgd6QzTshP5U2mvI+y41EuI9D
X-Google-Smtp-Source: AGHT+IFwwCFfnYRxF2ZPgXK0LNnDjE6g7GXkOAubqcR7iWxMsEMrA4a3+zn0BArfuQxVgKQ5X5e8YQ==
X-Received: by 2002:a05:600c:3ca3:b0:434:a0bf:98ea with SMTP id
 5b1f17b1804b1-434ddeb04bemr1673335e9.9.1733420207567; 
 Thu, 05 Dec 2024 09:36:47 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d5273440sm68718865e9.18.2024.12.05.09.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 09:36:45 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F2EF25F9FA;
 Thu,  5 Dec 2024 17:36:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu,  5 Dec 2024 17:36:42 +0000
Message-Id: <20241205173643.2334343-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205173643.2334343-1-alex.bennee@linaro.org>
References: <20241205173643.2334343-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733420207; x=1734025007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCQEmjfsG+mUlsN7pfWMDfi3y6NJAl9DLaar5GPvwxg=;
 b=fTaVmuQWwiktsXWwIky4d/hL9czM2HjJTROYom5cMcofYy5TWD6H8LPkhkwl6PjrsY
 u0A/pbhldDGVPuyWtwRCeuSADdsPXgVtJCn3SylSkPLNbjKAT2khD+GfideZSyeCOI5G
 lKSJPlZh9sbgE8D7hDsKK1fRuIaSHnoMVE3ThkXMFnaugwTFVIY57Oe8YWKZYE54955j
 mZwTXzv9drBv2qYP96NAfBmRCt/kf4q4Dvns4nippPjCs9FGbqHH8z+IaHTAaQxnlIaw
 HYOvaH9N/mh+mlvCrv6WywlwnpCQg2LeVYGb+V/HQxKbGFUgOWyYsDQUNlu/RnZ1FebJ
 Ixdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=fTaVmuQW
Subject: [Buildroot] [PATCH v2 3/4] package/vkmark: add vkmark benchmarking
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
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2MwogIC0gYWRkIHhjYi11dGls
LXdtIGRlcHMgdW5kZXIgWDExCiAgLSBhZGQgYXNzaW1wIGRpcmVjdGx5IHRvIFZLTUFSS19ERVBF
TkRFTkNJRVMKICAtIGRyb3AgZHVwbGljYXRlIEJSMl9JTlNUQUxMX0xJQlNURENQUAogIC0gZHJv
cCBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkKdjIKICAtIGZpeCB3aGl0ZXNwYWNlIGVy
cm9ycyBpbiBDb25maWcuaW4KICAtIGZpeCBzb3J0aW5nIG9mIHNvdXJjZXMKICAtIGFkZCBERVZF
TE9QRVJTIGVudHJ5CiAgLSByZXdvcmsgS0NvbmZpZyBiYXNlZCBvbiByZXZpZXcKICAtIGRyb3Ag
dW51c2VkIHNoYTI1NnN1bQogIC0gZXhwbGljaXRseSBlbmFibGUvZGlzYWJsZSB0aGUgYmFja2Vu
ZHMKLS0tCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICB8ICAzICsrKwogcGFja2FnZS9Db25m
aWcuaW4gICAgICAgICAgfCAgMSArCiBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW4gICB8IDQ2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3ZrbWFyay92a21h
cmsuaGFzaCB8ICAyICsrCiBwYWNrYWdlL3ZrbWFyay92a21hcmsubWsgICB8IDM0ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS92a21hcmsvdmttYXJrLm1rCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BF
UlMKaW5kZXggZDc1ZGY1Y2M1NS4uZWUxMWFlMzYyOCAxMDA2NDQKLS0tIGEvREVWRUxPUEVSUwor
KysgYi9ERVZFTE9QRVJTCkBAIC0xMzgsNiArMTM4LDkgQEAgRjoJcGFja2FnZS9saWJsb2c0Yy1s
b2NhbHRpbWUvCiBOOglBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxp
bi5jb20+CiBGOglwYWNrYWdlL3R6LwogCitOOglBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxp
bmFyby5vcmc+CitGOglwYWNrYWdlL3ZrbWFyay8KKwogTjoJQWxleGFuZHJlIEVzc2UgPGFsZXhh
bmRyZS5lc3NlLmRldkBnbWFpbC5jb20+CiBGOglwYWNrYWdlL2t2YXphYXIvCiBGOglwYWNrYWdl
L3Y0bDJsb29wYmFjay8KZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9D
b25maWcuaW4KaW5kZXggNTc1NzhhNzIwNC4uNzhjYjY3NTQzYiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25maWcuaW4KQEAgLTM0Miw2ICszNDIsNyBAQCBj
b21tZW50ICJHcmFwaGljIGFwcGxpY2F0aW9ucyIKIAlzb3VyY2UgInBhY2thZ2Uvc3dheWJnL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvdGVzc2VyYWN0LW9jci9Db25maWcuaW4iCiAJc291
cmNlICJwYWNrYWdlL3RpbmlmaWVyL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvdmttYXJr
L0NvbmZpZy5pbiIKIAogY29tbWVudCAiR3JhcGhpYyBsaWJyYXJpZXMiCiAJc291cmNlICJwYWNr
YWdlL2NlZ3VpL0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdmttYXJrL0NvbmZpZy5p
biBiL3BhY2thZ2UvdmttYXJrL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi4zZTg5OTIyNWVkCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS92a21hcmsv
Q29uZmlnLmluCkBAIC0wLDAgKzEsNDYgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9WS01BUktfRkxB
Vk9SX0FOWQorCWJvb2wKKworY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfS01TCisJ
Ym9vbAorCWRlZmF1bHQgeSBpZiBCUjJfUEFDS0FHRV9IQVNfTElCR0JNCisgICAgICAgIHNlbGVj
dCBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0FOWQorCitjb25maWcgQlIyX1BBQ0tBR0VfVktN
QVJLX0ZMQVZPUl9XQVlMQU5ECisJYm9vbAorCWRlZmF1bHQgeSBpZiBCUjJfUEFDS0FHRV9XQVlM
QU5ECisJc2VsZWN0IEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfQU5ZCisKK2NvbmZpZyBCUjJf
UEFDS0FHRV9WS01BUktfRkxBVk9SX1gxMQorCWJvb2wKKwlkZWZhdWx0IHkgaWYgQlIyX1BBQ0tB
R0VfWE9SRzcKKyAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfQU5ZCisK
K2NvbmZpZyBCUjJfUEFDS0FHRV9WS01BUksKKwlib29sICJ2a21hcmsiCisJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0FOWQorCXNlbGVjdCBCUjJfUEFDS0FHRV9WVUxLQU5f
SEVBREVSUworCXNlbGVjdCBCUjJfUEFDS0FHRV9WVUxLQU5fTE9BREVSCisgICAgICAgIGRlcGVu
ZHMgb24gIUJSMl9TVEFUSUNfTElCUyAjIHZ1bGthbi1sb2FkZXIKKyAgICAgICAgZGVwZW5kcyBv
biBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgdnVsa2FuLWxvYWRlcgorCXNlbGVjdCBCUjJf
UEFDS0FHRV9HTE0KKyAgICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFSICMgYXNzaW1wCisg
ICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNyAjIGFzc2ltcAor
CWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgdnVsa2FuLWxvYWRlciwgZ2xtLCBh
c3NpbXAsIHZrbWFyaworCXNlbGVjdCBCUjJfUEFDS0FHRV9BU1NJTVAKKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfV0FZTEFORF9QUk9UT0NPTFMgaWYgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9XQVlM
QU5ECisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhDQiBpZiBCUjJfUEFDS0FHRV9WS01BUktfRkxB
Vk9SX1gxMQorCXNlbGVjdCBCUjJfUEFDS0FHRV9YQ0JfVVRJTF9XTSBpZiBCUjJfUEFDS0FHRV9W
S01BUktfRkxBVk9SX1gxMQorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJEUk0gaWYgQlIyX1BBQ0tB
R0VfVktNQVJLX0ZMQVZPUl9LTVMKKwloZWxwCisJICB2bW1hcmsgaXMgYW4gVnVsa2FuIEdQVSBi
ZW5jaG1hcmsuCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS92a21hcmsvdmttYXJrCisKK2lmIEJS
Ml9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfQU5ZCisKK2NvbW1lbnQgInZrbWFyayBuZWVkcyBhIHRv
b2xjaGFpbiB3LyBDKyssIGR5bmFtaWMgbGlicmFyeSwgdGhyZWFkcyIKK2NvbW1lbnQgImFuZCBz
b21lIGZvcm0gb2YgYmFja2VuZCAod2F5bGFuZCwgeGNiIG9yIGRybSkiCisJZGVwZW5kcyBvbiAh
QlIyX0lOU1RBTExfTElCU1REQ1BQIHx8IEJSMl9TVEFUSUNfTElCUyB8fCBcCisJCSFCUjJfVE9P
TENIQUlOX0hBU19USFJFQURTCitlbmRpZgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92a21hcmsvdmtt
YXJrLmhhc2ggYi9wYWNrYWdlL3ZrbWFyay92a21hcmsuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwMDAwLi5lZTgyNDFkN2RlCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2Fn
ZS92a21hcmsvdmttYXJrLmhhc2gKQEAgLTAsMCArMSwyIEBACisjIExvY2FsbHkgY29tcHV0ZWQK
K3NoYTI1NiAgZDA4MTQzZTg4MjhkNWI5ZWQwMDVjYjZkY2VmNGQ4OGE0OWRmMGFjNGM5ZTEzNTZh
Y2U3MzliNDQ5YzE2NWY1NCAgdmttYXJrLWFiNmU2ZjM0MDc3NzIyZDVhZTMzZjZiZDQwYjE4ZWY5
YzBlOTlhMTUudGFyLmd6CmRpZmYgLS1naXQgYS9wYWNrYWdlL3ZrbWFyay92a21hcmsubWsgYi9w
YWNrYWdlL3ZrbWFyay92a21hcmsubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAw
MDAwMC4uZDgyZmI0MmU0MwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdmttYXJrL3ZrbWFy
ay5tawpAQCAtMCwwICsxLDM0IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyB2a21h
cmsKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1ZLTUFSS19WRVJTSU9OID0gYWI2ZTZm
MzQwNzc3MjJkNWFlMzNmNmJkNDBiMThlZjljMGU5OWExNQorVktNQVJLX1NJVEUgPSAkKGNhbGwg
Z2l0aHViLHZrbWFyayx2a21hcmssJChWS01BUktfVkVSU0lPTikpCitWS01BUktfTElDRU5TRSA9
IExHUEwtMi4xCitWS01BUktfTElDRU5TRV9GSUxFUyA9IENPUFlJTkctTEdQTDIuMQorVktNQVJL
X0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiB2dWxrYW4taGVhZGVycyB2dWxrYW4tbG9hZGVy
IGdsbSBhc3NpbXAKKworaWZlcSAoJChCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0tNUykseSkK
K1ZLTUFSS19ERVBFTkRFTkNJRVMgKz0gbGliZHJtIGxpYmdibQorVktNQVJLX0NPTkZfT1BUUyAr
PSAtRGttcz10cnVlCitlbHNlCitWS01BUktfQ09ORl9PUFRTICs9IC1Ea21zPWZhbHNlCitlbmRp
ZgorCitpZmVxICgkKEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfV0FZTEFORCkseSkKK1ZLTUFS
S19ERVBFTkRFTkNJRVMgKz0gd2F5bGFuZCB3YXlsYW5kLXByb3RvY29scworVktNQVJLX0NPTkZf
T1BUUyArPSAtRHdheWxhbmQ9dHJ1ZQorZWxzZQorVktNQVJLX0NPTkZfT1BUUyArPSAtRHdheWxh
bmQ9ZmFsc2UKK2VuZGlmCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9YMTEp
LHkpCitWS01BUktfREVQRU5ERU5DSUVTICs9IGxpYnhjYiB4Y2ItdXRpbC13bQorVktNQVJLX0NP
TkZfT1BUUyArPSAtRHhjYj10cnVlCitlbHNlCitWS01BUktfQ09ORl9PUFRTICs9IC1EeGNiPWZh
bHNlCitlbmRpZgorCiskKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKLS0gCjIuMzkuNQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
