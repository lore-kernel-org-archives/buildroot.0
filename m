Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6448FE69E81
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 18:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A2814080A;
	Mon,  2 Dec 2024 18:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSZfYUBVytOA; Mon,  2 Dec 2024 18:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC4744080B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC4744080B;
	Mon,  2 Dec 2024 18:21:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40E9660
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E76B60621
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sqQTCNJMdVFt for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EB9860740
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB9860740
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EB9860740
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385e1f12c82so2913850f8f.2
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 10:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733163664; x=1733768464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QbmejfyLlFDt16fEgZU3ZHxR3lbbhnqeRVjDlm4yIEo=;
 b=BaTqywXBu2laPDtT5FlMg4NMe2Owu8XYfIV45CkSXfXX1m7qqu/OUiJGkv6BsAvVeZ
 XTbDS8OOse/1tVcDfqQh0GrVj3Uv/tHp+hqzseIKK1uVNRAOn5w0zlP9a3rFE0seB0pb
 1nkbZ1ntGu4TWJh3+p/05PTDEQCGdRKDshbKhe/LUZvrKfxxyGT9zmS2RMtLRvijR2jW
 T7FRDafbBfN5720RlicPAPuMbeJwCemVVv+jZLEFEsjTXHaNDm3LkpwqgG3v8oVZtVzs
 r3e7nDhcg7YH+ZpDh9xRX0Co8rTioKChtEsPURS5gN/sJgZRnYa/VfYK4XbyVHAkTAC4
 4YLQ==
X-Gm-Message-State: AOJu0YzAzObnh+9pMXF7+g4dXuUHoE9WNYH6xSMHAeXvlkbSwJL/LuTH
 5+iSLxI3OYqIm8XMtvUtcX176y2knm6CSTOnaFw2xzsDm4GD21wC/v1Bj12yYcF3g6lfHtQB/WE
 WTFE=
X-Gm-Gg: ASbGnctW4Vc5kr2MObIfHgQqtsBAr5Sxl+B81+/yhnEcvLjxSBsAaoEJU1+txiYXAAy
 4BP7hZOOVVTKY8gmC0mmOCEhkIuDP/co+APdiOqmqH9pbgmQo7ykqIbqYAfQOvSgv4x01o93mh8
 7R7HXmx/gVxwG0dyWpg+Ll3GON5Fk33tOMaeLTHKRwCuIltjG4DNk37gv51fmeRZURHwHnEC2ou
 BMKK8g5/JFJ9ap7Orp7gbbYtx9hivtiQNYNrMwK+9M/vHG7
X-Google-Smtp-Source: AGHT+IHOyjfgsBXF4PpGf5vxHtzV0IhknQgXs+L0/pWQv3vOukkqu3qh3+GJuSfNMeEdmspYHHZ6EA==
X-Received: by 2002:a05:6000:4813:b0:385:fb40:e549 with SMTP id
 ffacd0b85a97d-385fb40e682mr1249880f8f.55.1733163664071; 
 Mon, 02 Dec 2024 10:21:04 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ee60549dsm4878200f8f.34.2024.12.02.10.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 10:21:03 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 503625F954;
 Mon,  2 Dec 2024 18:21:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon,  2 Dec 2024 18:21:01 +0000
Message-Id: <20241202182101.410320-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202182101.410320-1-alex.bennee@linaro.org>
References: <20241202182101.410320-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733163664; x=1733768464; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QbmejfyLlFDt16fEgZU3ZHxR3lbbhnqeRVjDlm4yIEo=;
 b=JmbQ0HZS3YetJmtwVAmRg1aLGKFXTT3qzu2ZtmhKpA75/0v6vPSZ0cYnenbdRtF0W+
 sMa2qCk/kqhhcI8NeZ0aFyAiAdTrKEj6kJHJ6fbC5TEWJ9ooVbEqP8bePzOi/KE0kZRB
 clbJefvISYFhhtBnpguN5AwyxvyP1WRm1ixTK7EUOc/+pZdLPVfoT7UParoHAhQ9Z+wg
 rdK1KjtYXmJyvFnbxvrgyqdZljHB0sOLgpeI/P9oz3D5LBsLYDKO2A5d3htthr7z9kq4
 h8+TyVExCI7RIkMeRvpgwuBo8MozpzvPoQUL4q47fqIRtW87gz4R1pKRlKDSIM4JOF8p
 WdtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=JmbQ0HZS
Subject: [Buildroot] [PATCH 2/2] package/vkmark: add vkmark benchmarking tool
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
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2MgogIC0gZml4IHdoaXRlc3Bh
Y2UgZXJyb3JzIGluIENvbmZpZy5pbgogIC0gZml4IHNvcnRpbmcgb2Ygc291cmNlcwogIC0gYWRk
IERFVkVMT1BFUlMgZW50cnkKICAtIHJld29yayBLQ29uZmlnIGJhc2VkIG9uIHJldmlldwogIC0g
ZHJvcCB1bnVzZWQgc2hhMjU2c3VtCiAgLSBleHBsaWNpdGx5IGVuYWJsZS9kaXNhYmxlIHRoZSBi
YWNrZW5kcwotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgIHwgIDMgKysrCiBwYWNrYWdl
L0NvbmZpZy5pbiAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbiAgIHwg
NDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvdmttYXJr
L3ZrbWFyay5oYXNoIHwgIDIgKysKIHBhY2thZ2UvdmttYXJrL3ZrbWFyay5tayAgIHwgMzQgKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW4KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3ZrbWFyay92a21hcmsuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvdmttYXJrL3ZrbWFyay5tawoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IGQ3NWRmNWNjNTUuLmVlMTFhZTM2MjggMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMTM4LDYgKzEzOCw5IEBAIEY6CXBhY2thZ2UvbGlibG9n
NGMtbG9jYWx0aW1lLwogTjoJQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJv
b3RsaW4uY29tPgogRjoJcGFja2FnZS90ei8KIAorTjoJQWxleCBCZW5uw6llIDxhbGV4LmJlbm5l
ZUBsaW5hcm8ub3JnPgorRjoJcGFja2FnZS92a21hcmsvCisKIE46CUFsZXhhbmRyZSBFc3NlIDxh
bGV4YW5kcmUuZXNzZS5kZXZAZ21haWwuY29tPgogRjoJcGFja2FnZS9rdmF6YWFyLwogRjoJcGFj
a2FnZS92NGwybG9vcGJhY2svCmRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2th
Z2UvQ29uZmlnLmluCmluZGV4IDU3NTc4YTcyMDQuLjc4Y2I2NzU0M2IgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvQ29uZmlnLmluCkBAIC0zNDIsNiArMzQyLDcg
QEAgY29tbWVudCAiR3JhcGhpYyBhcHBsaWNhdGlvbnMiCiAJc291cmNlICJwYWNrYWdlL3N3YXli
Zy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3Rlc3NlcmFjdC1vY3IvQ29uZmlnLmluIgog
CXNvdXJjZSAicGFja2FnZS90aW5pZmllci9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3Zr
bWFyay9Db25maWcuaW4iCiAKIGNvbW1lbnQgIkdyYXBoaWMgbGlicmFyaWVzIgogCXNvdXJjZSAi
cGFja2FnZS9jZWd1aS9Db25maWcuaW4iCmRpZmYgLS1naXQgYS9wYWNrYWdlL3ZrbWFyay9Db25m
aWcuaW4gYi9wYWNrYWdlL3ZrbWFyay9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uZTAzOTdkOWMzMAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2Uvdmtt
YXJrL0NvbmZpZy5pbgpAQCAtMCwwICsxLDQ3IEBACitjb25maWcgQlIyX1BBQ0tBR0VfVktNQVJL
X0ZMQVZPUl9BTlkKKwlib29sCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0tN
UworCWJvb2wKKwlkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfSEFTX0xJQkdCTQorICAgICAgICBz
ZWxlY3QgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9BTlkKKworY29uZmlnIEJSMl9QQUNLQUdF
X1ZLTUFSS19GTEFWT1JfV0FZTEFORAorCWJvb2wKKwlkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0Vf
V0FZTEFORAorCXNlbGVjdCBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0FOWQorCitjb25maWcg
QlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9YMTEKKwlib29sCisJZGVmYXVsdCB5IGlmIEJSMl9Q
QUNLQUdFX1hPUkc3CisgICAgICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0FO
WQorCitjb25maWcgQlIyX1BBQ0tBR0VfVktNQVJLCisJYm9vbCAidmttYXJrIgorCWRlcGVuZHMg
b24gQlIyX0lOU1RBTExfTElCU1REQ1BQCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19B
VF9MRUFTVF80XzkgIyBDKysxNAorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZP
Ul9BTlkKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfVlVMS0FOX0hFQURFUlMKKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfVlVMS0FOX0xPQURFUgorICAgICAgICBkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMg
IyB2dWxrYW4tbG9hZGVyCisgICAgICAgIGRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhS
RUFEUyAjIHZ1bGthbi1sb2FkZXIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfR0xNCisgICAgICAgIGRl
cGVuZHMgb24gQlIyX1VTRV9XQ0hBUiAjIGFzc2ltcAorICAgICAgICBkZXBlbmRzIG9uIEJSMl9U
T09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgIyBhc3NpbXAKKwlkZXBlbmRzIG9uIEJSMl9JTlNUQUxM
X0xJQlNURENQUCAjIHZ1bGthbi1sb2FkZXIsIGdsbSwgYXNzaW1wLCB2a21hcmsKKwlzZWxlY3Qg
QlIyX1BBQ0tBR0VfQVNTSU1QCisJc2VsZWN0IEJSMl9QQUNLQUdFX1dBWUxBTkRfUFJPVE9DT0xT
IGlmIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfV0FZTEFORAorCXNlbGVjdCBCUjJfUEFDS0FH
RV9MSUJYQ0IgaWYgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9YMTEKKwlzZWxlY3QgQlIyX1BB
Q0tBR0VfTElCRFJNIGlmIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfS01TCisJaGVscAorCSAg
dm1tYXJrIGlzIGFuIFZ1bGthbiBHUFUgYmVuY2htYXJrLgorCisJICBodHRwczovL2dpdGh1Yi5j
b20vdmttYXJrL3ZrbWFyaworCitpZiBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0FOWQorCitj
b21tZW50ICJ2a21hcmsgbmVlZHMgYSB0b29sY2hhaW4gdy8gQysrLCBkeW5hbWljIGxpYnJhcnks
IHRocmVhZHMiCitjb21tZW50ICJhbmQgc29tZSBmb3JtIG9mIGJhY2tlbmQgKHdheWxhbmQsIHhj
YiBvciBkcm0pIgorCWRlcGVuZHMgb24gIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCBCUjJfU1RB
VElDX0xJQlMgfHwgXAorCQkhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUworZW5kaWYKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoIGIvcGFja2FnZS92a21hcmsvdmttYXJr
Lmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZWU4MjQxZDdkZQot
LS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoCkBAIC0wLDAgKzEs
MiBAQAorIyBMb2NhbGx5IGNvbXB1dGVkCitzaGEyNTYgIGQwODE0M2U4ODI4ZDViOWVkMDA1Y2I2
ZGNlZjRkODhhNDlkZjBhYzRjOWUxMzU2YWNlNzM5YjQ0OWMxNjVmNTQgIHZrbWFyay1hYjZlNmYz
NDA3NzcyMmQ1YWUzM2Y2YmQ0MGIxOGVmOWMwZTk5YTE1LnRhci5negpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS92a21hcmsvdmttYXJrLm1rIGIvcGFja2FnZS92a21hcmsvdmttYXJrLm1rCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjU3NDllYmY4NzgKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL3ZrbWFyay92a21hcmsubWsKQEAgLTAsMCArMSwzNCBAQAorIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMKKyMKKyMgdmttYXJrCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwor
CitWS01BUktfVkVSU0lPTiA9IGFiNmU2ZjM0MDc3NzIyZDVhZTMzZjZiZDQwYjE4ZWY5YzBlOTlh
MTUKK1ZLTUFSS19TSVRFID0gJChjYWxsIGdpdGh1Yix2a21hcmssdmttYXJrLCQoVktNQVJLX1ZF
UlNJT04pKQorVktNQVJLX0xJQ0VOU0UgPSBMR1BMLTIuMQorVktNQVJLX0xJQ0VOU0VfRklMRVMg
PSBDT1BZSU5HLUxHUEwyLjEKK1ZLTUFSS19ERVBFTkRFTkNJRVMgPSBob3N0LXBrZ2NvbmYgdnVs
a2FuLWhlYWRlcnMgdnVsa2FuLWxvYWRlciBnbG0KKworaWZlcSAoJChCUjJfUEFDS0FHRV9WS01B
UktfRkxBVk9SX0tNUykseSkKK1ZLTUFSS19ERVBFTkRFTkNJRVMgKz0gbGliZHJtIGxpYmdibQor
VktNQVJLX0NPTkZfT1BUUyArPSAtRGttcz10cnVlCitlbHNlCitWS01BUktfQ09ORl9PUFRTICs9
IC1Ea21zPWZhbHNlCitlbmRpZgorCitpZmVxICgkKEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1Jf
V0FZTEFORCkseSkKK1ZLTUFSS19ERVBFTkRFTkNJRVMgKz0gd2F5bGFuZCB3YXlsYW5kLXByb3Rv
Y29scworVktNQVJLX0NPTkZfT1BUUyArPSAtRHdheWxhbmQ9dHJ1ZQorZWxzZQorVktNQVJLX0NP
TkZfT1BUUyArPSAtRHdheWxhbmQ9ZmFsc2UKK2VuZGlmCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0Vf
VktNQVJLX0ZMQVZPUl9YMTEpLHkpCitWS01BUktfREVQRU5ERU5DSUVTICs9IGxpYnhjYgorVktN
QVJLX0NPTkZfT1BUUyArPSAtRHhjYj10cnVlCitlbHNlCitWS01BUktfQ09ORl9PUFRTICs9IC1E
eGNiPWZhbHNlCitlbmRpZgorCiskKGV2YWwgJChtZXNvbi1wYWNrYWdlKSkKLS0gCjIuMzkuNQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
