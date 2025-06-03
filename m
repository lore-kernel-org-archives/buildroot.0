Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F97DC5AE59
	for <buildroot@archiver.kernel.org>; Tue,  3 Jun 2025 14:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0115C8186B;
	Tue,  3 Jun 2025 14:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J77o8pMfpp9G; Tue,  3 Jun 2025 14:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B88B839DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B88B839DD;
	Tue,  3 Jun 2025 14:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 516EE1F7
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 334726130B
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wPk3_z6fnVG for <buildroot@buildroot.org>;
 Tue,  3 Jun 2025 14:01:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D7A1612E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D7A1612E1
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D7A1612E1
 for <buildroot@buildroot.org>; Tue,  3 Jun 2025 14:01:08 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad883afdf0cso1074849066b.0
 for <buildroot@buildroot.org>; Tue, 03 Jun 2025 07:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748959266; x=1749564066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vPlFUP3vi8Afig9HryJFODiDkOsB74HqndX6W5Sz6+c=;
 b=u63vOSB6JTn+mCGYMkZBFsLK/kj1qmO8wqEf+QH4iNR1COi/sMov5MoV/4jqH2owee
 iPOZNgYp3FfN6OV12FNTvmhcu+kzPFbswLVk5UEqdGmKHXcAZnOh64sj2xi4jMEYjt4T
 P/8oBset8E8C9o9ungMiwwplxcMLy3ylY9ynHdTb+3qvHO3kjCgMrUB1GZjXlpxefDVN
 BJbsvz0P9biYy1UqwgrJmOBIfKqDIdiVjfwn1pElpOUTZ+AsdN+tdu9IVX71fmIepHve
 nU+kqNydZqTb5HDbtWlfCmUJBqwp+II8wnZRUJmXtdy83oUUeXSv8EU8u1P1KciSvr3h
 OqJA==
X-Gm-Message-State: AOJu0YytXllEHQYTfX20RiiNxrE6p1pzh4iH5pZtLpmlGeg5E93TAiWJ
 o+7/Zy8R4dgozqoHQcHBSOAaxSvmfPMAOZTIusNXDW+WkruIgH2cy7nOmZB4WoWSmpbrTKyIh6/
 +Vv8uXaE=
X-Gm-Gg: ASbGnctoBPeAN4feBU4k0znHpiLi8O57YAJ+RkVrs32iTCuRMcGrlWVH5BXU5S2txHI
 ote5VccGj5NpKCkIDurBsiNGKrRZMghLB5cakUaCqfpfNKma2jgd7+IyFQITgD91y41wZQ4uQMn
 cQNIrf5s6tmR6BJ0wmatareQXwHBK0R3mOc2jneahKXfqa5t5gN+pDGGuGCpsYOKzA97ph4XEan
 dMsVHo5hFI0aJij4gC6f/SLAE+e/jcSoc4mXoaCBkCAd27QU8AltEiTEW65p2S7L+A7VeWhfyXr
 ejv2Oj2qu7svTjjbD3c4Ljt69pqi2S5M9SctAtFa72IfqioW2QuKRpIQPZTgSpI=
X-Google-Smtp-Source: AGHT+IEJgM2q+6fZA5GUADkHBneiok/YIGHEek+pu+XaHbAXEnu3S05HoW/bk7ncY7sO0mJXv71SSQ==
X-Received: by 2002:a17:907:7fa2:b0:ad2:52c3:2083 with SMTP id
 a640c23a62f3a-adb36ba4b43mr1726527066b.28.1748959263897; 
 Tue, 03 Jun 2025 07:01:03 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d7fecc5sm966177266b.10.2025.06.03.07.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 07:01:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 474335F9CE;
 Tue, 03 Jun 2025 15:01:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Tue,  3 Jun 2025 15:00:57 +0100
Message-ID: <20250603140100.1910123-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250603140100.1910123-1-alex.bennee@linaro.org>
References: <20250603140100.1910123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748959266; x=1749564066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPlFUP3vi8Afig9HryJFODiDkOsB74HqndX6W5Sz6+c=;
 b=Il0gD9wvQ0O+bBibb1OSw/7aMawGWWtNn9ashVCqFkPu6Zo6uMvuCQDlQc1E2tmLez
 70DVy1g0wELebLuFlcjGVd7E3GL18A0PYS7FpN0gOcplzk2IfUVLXQQNyiO4RypL0Cee
 RZgVAPfH9uGw6hUe3PZUn3vibvPRC4SUyqQbhT+NB+dfCCmRCqqmsCvTSd47nM0VdXFd
 lqQY4AN+u//6GB7Nc57BtzgDNCpXAdJXusEaBsuV4FyzHA4CPtzsLKIX1PG8eIyibNCM
 vmzmkJeC9Wtt4/BsLebj0D6Hqp7p34LtatXY+rgE2+mntMKiPq4Rp4cvoPCFbrG5uSkT
 Ipyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=Il0gD9wv
Subject: [Buildroot] [PATCH v5 3/4] package/vkmark: add vkmark benchmarking
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2UgYnVpbGQgZnJvbSBhIHJlY2VudCBIRUFEIHRvIGVuc3VyZSB3ZSBoYXZlIHRoZSBmaXhlcyB0
byBiZXR0ZXIKaGFuZGxlIHRoZSBtaXNzaW5nIEtIUl9kaXNwbGF5IGV4dGVuc2lvbi4KClNpZ25l
ZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tLQp2NQog
IC0gbW92ZSBmcm9tIDIwMjUuMSB0byBIRUFEICgzNmU3ZDliIGJ1aWxkOiBFbmFibGUgcHJlY29t
cGlsZWQgaGVhZGVycykKICAtIGRyb3Agb2xkIHBhdGNoIChzZWUgYWRmMWFhMyBmb3IgZmluYWwg
Zml4KQp2NAogIC0gZml4IHRhYiB2cyBzcGFjZSBkYW1hZ2UKICAtIGRvbid0IGlmIEJSMl9QQUNL
QUdFX1ZLTUFSS19GTEFWT1JfQU5ZCiAgLSBtYWtlIGNvbW1lbnRzIHByb3Blcmx5IGRlcGVuZAog
IC0gdXNlIHRoZSBuZXcgMjAyNS4wMSByZWxlYXNlCiAgLSBhZGQgc2hhMjU2c3VtIG9mIENPUFlJ
TkctTEdQTDIuMQogIC0gYWxwaGFiZXRpYyBzb3J0IG9mIGluaXRpYWwgVktNQVJLX0RFUEVOREVO
Q0lFUwogIC0gYWRkIHZ1bGthbiBlcnJvciBwcm9iaW5nIHBhdGNoCnYzCiAgLSBhZGQgeGNiLXV0
aWwtd20gZGVwcyB1bmRlciBYMTEKICAtIGFkZCBhc3NpbXAgZGlyZWN0bHkgdG8gVktNQVJLX0RF
UEVOREVOQ0lFUwogIC0gZHJvcCBkdXBsaWNhdGUgQlIyX0lOU1RBTExfTElCU1REQ1BQCiAgLSBk
cm9wIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzRfOQp2MgogIC0gZml4IHdoaXRlc3BhY2Ug
ZXJyb3JzIGluIENvbmZpZy5pbgogIC0gZml4IHNvcnRpbmcgb2Ygc291cmNlcwogIC0gYWRkIERF
VkVMT1BFUlMgZW50cnkKICAtIHJld29yayBLQ29uZmlnIGJhc2VkIG9uIHJldmlldwogIC0gZHJv
cCB1bnVzZWQgc2hhMjU2c3VtCiAgLSBleHBsaWNpdGx5IGVuYWJsZS9kaXNhYmxlIHRoZSBiYWNr
ZW5kcwotLS0KIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgIHwgIDMgKysrCiBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbiAgIHwgNDgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvdmttYXJrL3Zr
bWFyay5oYXNoIHwgIDMgKysrCiBwYWNrYWdlL3ZrbWFyay92a21hcmsubWsgICB8IDM0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvQ29uZmlnLmluCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS92a21hcmsvdmttYXJrLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3ZrbWFyay92a21hcmsubWsKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxP
UEVSUwppbmRleCBhN2JiM2JkODM0Li43NzQzODFlNzdjIDEwMDY0NAotLS0gYS9ERVZFTE9QRVJT
CisrKyBiL0RFVkVMT1BFUlMKQEAgLTE0MSw2ICsxNDEsOSBAQCBGOglwYWNrYWdlL2xpYmxvZzRj
LWxvY2FsdGltZS8KIE46CUFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBib290
bGluLmNvbT4KIEY6CXBhY2thZ2UvdHovCiAKK046CUFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVA
bGluYXJvLm9yZz4KK0Y6CXBhY2thZ2UvdmttYXJrLworCiBOOglBbGV4YW5kcmUgRXNzZSA8YWxl
eGFuZHJlLmVzc2UuZGV2QGdtYWlsLmNvbT4KIEY6CXBhY2thZ2Uva3ZhemFhci8KIEY6CXBhY2th
Z2UvdjRsMmxvb3BiYWNrLwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdl
L0NvbmZpZy5pbgppbmRleCAyZGI1NTUzNTBkLi44MDRjNzk3OWIwIDEwMDY0NAotLS0gYS9wYWNr
YWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMzM5LDYgKzMzOSw3IEBA
IGNvbW1lbnQgIkdyYXBoaWMgYXBwbGljYXRpb25zIgogCXNvdXJjZSAicGFja2FnZS9zd2F5Ymcv
Q29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS90ZXNzZXJhY3Qtb2NyL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2UvdGluaWZpZXIvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS92a21h
cmsvQ29uZmlnLmluIgogCiBjb21tZW50ICJHcmFwaGljIGxpYnJhcmllcyIKIAlzb3VyY2UgInBh
Y2thZ2UvY2VndWkvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92a21hcmsvQ29uZmln
LmluIGIvcGFja2FnZS92a21hcmsvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLjAzMmViNDdkYzkKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3ZrbWFy
ay9Db25maWcuaW4KQEAgLTAsMCArMSw0OCBAQAorY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFSS19G
TEFWT1JfQU5ZCisJYm9vbAorCitjb25maWcgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9LTVMK
Kwlib29sCisJZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX0hBU19MSUJHQk0KKwlzZWxlY3QgQlIy
X1BBQ0tBR0VfVktNQVJLX0ZMQVZPUl9BTlkKKworY29uZmlnIEJSMl9QQUNLQUdFX1ZLTUFSS19G
TEFWT1JfV0FZTEFORAorCWJvb2wKKwlkZWZhdWx0IHkgaWYgQlIyX1BBQ0tBR0VfV0FZTEFORAor
CXNlbGVjdCBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0FOWQorCitjb25maWcgQlIyX1BBQ0tB
R0VfVktNQVJLX0ZMQVZPUl9YMTEKKwlib29sCisJZGVmYXVsdCB5IGlmIEJSMl9QQUNLQUdFX1hP
Ukc3CisJc2VsZWN0IEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfQU5ZCisKK2NvbmZpZyBCUjJf
UEFDS0FHRV9WS01BUksKKwlib29sICJ2a21hcmsiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9W
S01BUktfRkxBVk9SX0FOWQorCXNlbGVjdCBCUjJfUEFDS0FHRV9WVUxLQU5fSEVBREVSUworCXNl
bGVjdCBCUjJfUEFDS0FHRV9WVUxLQU5fTE9BREVSCisJZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19M
SUJTICMgdnVsa2FuLWxvYWRlcgorCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFE
UyAjIHZ1bGthbi1sb2FkZXIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfR0xNCisJZGVwZW5kcyBvbiBC
UjJfVVNFX1dDSEFSICMgYXNzaW1wCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9M
RUFTVF83ICMgYXNzaW1wCisJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAgIyB2dWxr
YW4tbG9hZGVyLCBnbG0sIGFzc2ltcCwgdmttYXJrCisJc2VsZWN0IEJSMl9QQUNLQUdFX0FTU0lN
UAorCXNlbGVjdCBCUjJfUEFDS0FHRV9XQVlMQU5EX1BST1RPQ09MUyBpZiBCUjJfUEFDS0FHRV9W
S01BUktfRkxBVk9SX1dBWUxBTkQKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCWENCIGlmIEJSMl9Q
QUNLQUdFX1ZLTUFSS19GTEFWT1JfWDExCisJc2VsZWN0IEJSMl9QQUNLQUdFX1hDQl9VVElMX1dN
IGlmIEJSMl9QQUNLQUdFX1ZLTUFSS19GTEFWT1JfWDExCisJc2VsZWN0IEJSMl9QQUNLQUdFX0xJ
QkRSTSBpZiBCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX0tNUworCWhlbHAKKwkgIHZtbWFyayBp
cyBhbiBWdWxrYW4gR1BVIGJlbmNobWFyay4KKworCSAgaHR0cHM6Ly9naXRodWIuY29tL3ZrbWFy
ay92a21hcmsKKworY29tbWVudCAidmttYXJrIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMg
bGlicmFyeSwgdGhyZWFkcywgd2NoYXIsIGdjYyA+PSA3LCBDKysiCisJZGVwZW5kcyBvbiBCUjJf
U1RBVElDX0xJQlMgfHwgXAorCSFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8IFwKKwkhQlIy
X1VTRV9XQ0hBUiB8fCBcCisJIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzcgfHwgXAorCSFC
UjJfSU5TVEFMTF9MSUJTVERDUFAKKworY29tbWVudCAidmttYXJrIG5lZWRzIGEgYmFja2VuZDog
Z2JtLCB3YXlsYW5kIG9yIHhjYiIKKwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9WS01BUktfRkxB
Vk9SX0FOWQpkaWZmIC0tZ2l0IGEvcGFja2FnZS92a21hcmsvdmttYXJrLmhhc2ggYi9wYWNrYWdl
L3ZrbWFyay92a21hcmsuaGFzaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4zNGMzMTIxOTM5Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS92a21hcmsvdmttYXJrLmhh
c2gKQEAgLTAsMCArMSwzIEBACisjIExvY2FsbHkgY29tcHV0ZWQKK3NoYTI1NiAgMjIyNWVmNGUz
YmE3ODVhYmNjMjQ5NjY0NjQ0OTA4YjkwOTUxN2NhZTZjMDRiZjM3ZTlmM2QwY2YyMDZlZmU4MyAg
dmttYXJrLTM2ZTdkOWIyZWNmNzIzZTg3NmFkZDY1NTM0ZTk1ZjU1ZWMxYmM3OWQudGFyLmd6Citz
aGEyNTYgIGRjNjI2NTIwZGNkNTNhMjJmNzI3YWYzZWU0MmM3NzBlNTZjOTdhNjRmZTNhZGIwNjM3
OTlkOGFiMDMyZmU1NTEgIENPUFlJTkctTEdQTDIuMQpkaWZmIC0tZ2l0IGEvcGFja2FnZS92a21h
cmsvdmttYXJrLm1rIGIvcGFja2FnZS92a21hcmsvdmttYXJrLm1rCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAuLmQ3ZThlYTJlNmQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNr
YWdlL3ZrbWFyay92a21hcmsubWsKQEAgLTAsMCArMSwzNCBAQAorIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKKyMKKyMgdmttYXJrCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitWS01BUktf
VkVSU0lPTiA9IDM2ZTdkOWIyZWNmNzIzZTg3NmFkZDY1NTM0ZTk1ZjU1ZWMxYmM3OWQKK1ZLTUFS
S19TSVRFID0gJChjYWxsIGdpdGh1Yix2a21hcmssdmttYXJrLCQoVktNQVJLX1ZFUlNJT04pKQor
VktNQVJLX0xJQ0VOU0UgPSBMR1BMLTIuMQorVktNQVJLX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5H
LUxHUEwyLjEKK1ZLTUFSS19ERVBFTkRFTkNJRVMgPSBhc3NpbXAgZ2xtIGhvc3QtcGtnY29uZiB2
dWxrYW4taGVhZGVycyB2dWxrYW4tbG9hZGVyCisKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfVktNQVJL
X0ZMQVZPUl9LTVMpLHkpCitWS01BUktfREVQRU5ERU5DSUVTICs9IGxpYmRybSBsaWJnYm0KK1ZL
TUFSS19DT05GX09QVFMgKz0gLURrbXM9dHJ1ZQorZWxzZQorVktNQVJLX0NPTkZfT1BUUyArPSAt
RGttcz1mYWxzZQorZW5kaWYKKworaWZlcSAoJChCUjJfUEFDS0FHRV9WS01BUktfRkxBVk9SX1dB
WUxBTkQpLHkpCitWS01BUktfREVQRU5ERU5DSUVTICs9IHdheWxhbmQgd2F5bGFuZC1wcm90b2Nv
bHMKK1ZLTUFSS19DT05GX09QVFMgKz0gLUR3YXlsYW5kPXRydWUKK2Vsc2UKK1ZLTUFSS19DT05G
X09QVFMgKz0gLUR3YXlsYW5kPWZhbHNlCitlbmRpZgorCitpZmVxICgkKEJSMl9QQUNLQUdFX1ZL
TUFSS19GTEFWT1JfWDExKSx5KQorVktNQVJLX0RFUEVOREVOQ0lFUyArPSBsaWJ4Y2IgeGNiLXV0
aWwtd20KK1ZLTUFSS19DT05GX09QVFMgKz0gLUR4Y2I9dHJ1ZQorZWxzZQorVktNQVJLX0NPTkZf
T1BUUyArPSAtRHhjYj1mYWxzZQorZW5kaWYKKworJChldmFsICQobWVzb24tcGFja2FnZSkpCi0t
IAoyLjQ3LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
