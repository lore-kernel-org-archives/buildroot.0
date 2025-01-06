Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2BAE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 09:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2179D60667;
	Mon,  6 Jan 2025 09:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIScpDLVic8J; Mon,  6 Jan 2025 09:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BF3160678
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF3160678;
	Mon,  6 Jan 2025 09:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E58AF6B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 09:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3C448057E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 09:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkSB_HRnifrh for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 09:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=dfgdust@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B7D78058F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B7D78058F
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B7D78058F
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 09:07:53 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-540254357c8so216265e87.1
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 01:07:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736154471; x=1736759271;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=srwGEnXm9dkdSAJkYgtbYrOBXNgZotj0a9qLvBoLFV4=;
 b=oPV8jPoaqRGHq2BdQlQFco7MS00drGR/wS+zmUF6WNuuyKQbz8m3aiOgQnsEvnUEtk
 1PtAEx9C75UUS6bbhfJ6ed2IHfVTspoFY7Fzc0oG8gBs+Gcdi47t5n2bhMMPpgaELGc0
 NyiPECF8BAyxOrcRkj36PiDGfAKKeoExsIihIj4sw6J5iQERyPel6jLJE4sYqHe5dU1o
 iKFRt/4K8lu2LNpLvXeQ/pu5GpCX8eboM6PoN0M1JOhP56NWBTc6blhlAQ6fL4EDHtJa
 WfkCgNo54xYRt1EJ8UTU6MplVqC2sLdcbMtN2+4qCbcwNtfMwYNkiOCTXvU+SwTKCMXr
 LNFA==
X-Gm-Message-State: AOJu0YzSm2ZtLR23ml2dw50fDKmLy8MDLvPy10UIp26TU2cGHMCQLrWx
 DyxBWu9vVz1AZltr9ViDK3PjbeNTvNC5jWnZGlDPJAAJSTCRfLLpyh5hyw==
X-Gm-Gg: ASbGncsx5d1yIXNzdj6MrME8Ip4mmFaKp2L28UTwzFv34xVQEuTXfquTIiYx6sVd620
 /HMIKk/1bkLpOxI57CkOKZBndovB5FplUPBpfheVVCOhNR/0I4cfDj0/yPXUeth6yjHSJxCvLQW
 4wcEE+YLXtbFND1J2JP6/61upN3v3OHxWgx91c5DydaUI2Xze/Md2wGmc248pSYtTODk6hHGgF1
 uF5IKeTD0khy34Q9enl6yJhiPeqWzQhsp1JKSqsEbL+jGDee2JMKk4H
X-Google-Smtp-Source: AGHT+IFjS/xb9LepQjykuWRcf/j4KpW5w2c89mYRc5E6Ccc7lxRiU0f3zeD1WgB9mbTWz9N5CML0rA==
X-Received: by 2002:a05:6512:2387:b0:542:2e04:edb4 with SMTP id
 2adb3069b0e04-5422e04f19fmr13403069e87.13.1736154471240; 
 Mon, 06 Jan 2025 01:07:51 -0800 (PST)
Received: from [192.168.99.4] ([77.222.156.83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f5f74sm4916365e87.43.2025.01.06.01.07.48
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 01:07:50 -0800 (PST)
Message-ID: <3fcf016f-79cc-47f6-8b53-5ae85448dc20@gmail.com>
Date: Mon, 6 Jan 2025 11:07:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: "Yevhen Babiichuk (DustDFG)" <dfgdust@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736154471; x=1736759271; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=srwGEnXm9dkdSAJkYgtbYrOBXNgZotj0a9qLvBoLFV4=;
 b=eNDfs/Ntt64gsjScJxhgOHPtZxQ4+dqVSdOo0wCPMiKsrOPocCCgK58SyO24fdGLjo
 2i5/pZEthGPb7zdfJtvalkdcrke+E+lCkz+lTaOCdylEuzA3SceAKY8foxUQkiksSV3k
 0rcWmy4yuaKn2dcV84FKDan3HMFz+HUri3jlnonaNDfSSzHv2ZiLHV4G/yHIhr1FtPP3
 /bmKEyrcQ9NABjtNpd7HLvDxUpOBUepku8SHdkVrZq05GRD53Ge4KGV+k5JAg4nyW4qN
 UiSuTaykxtpo0AoeXwVp+amqViqHaNspsxglh7Bx96zBsmE3kQf8wlJsBWa7WNT021C6
 krJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eNDfs/Nt
Subject: [Buildroot] Typo fixes
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

IEZyb20gYzlhYWEyNzI0ZmY0OWNlNzY4Nzg3Zjc2MjkxY2RkNTk5ZTRjYTEwYSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKRnJvbTogIllldmhlbiBCYWJpaWNodWsgKER1c3RERkcpIiA8ZGZnZHVz
dEBnbWFpbC5jb20+CkRhdGU6IE1vbiwgNiBKYW4gMjAyNSAwOToyMTowNiArMDIwMApTdWJqZWN0
OiBbUEFUQ0ggMS8yXSBIb3N0IHBhY2thZ2VzOiBmaXggdHlwb3MKCkFsbCB0aGUgaG9zdCBwYWNr
YWdlcyBpbnNpZGUgJ0hvc3QgdXRpbGl0aWVzJyB1c2UgJ2hvc3QgPG5hbWU+JyBzeW50YXggCndo
aWxlCidvZGInIGFuZCAnc2RidXNwbHVzJyB1c2VkIG1pc3NwZWxsZWQgJ2hvc3QtPG5hbWU+JyBz
eW50YXggd2hpY2ggd2FzIHZlcnkKbm90aWNlYWJsZSBpbiB0aGUgbGlzdAoKU2lnbmVkLW9mZi1i
eTogWWV2aGVuIEJhYmlpY2h1ayAoRHVzdERGRykgPGRmZ2R1c3RAZ21haWwuY29tPgotLS0KIMKg
cGFja2FnZS9vZGIvQ29uZmlnLmluLmhvc3TCoMKgwqDCoMKgwqAgfCAyICstCiDCoHBhY2thZ2Uv
c2RidXNwbHVzL0NvbmZpZy5pbi5ob3N0IHwgMiArLQogwqAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL29kYi9Db25m
aWcuaW4uaG9zdCBiL3BhY2thZ2Uvb2RiL0NvbmZpZy5pbi5ob3N0CmluZGV4IGU4MGExNDFiZTYu
LmJmZjMxNDJlZTUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb2RiL0NvbmZpZy5pbi5ob3N0CisrKyBi
L3BhY2thZ2Uvb2RiL0NvbmZpZy5pbi5ob3N0CkBAIC0xLDUgKzEsNSBAQAogwqBjb25maWcgQlIy
X1BBQ0tBR0VfSE9TVF9PREIKLcKgwqDCoCBib29sICJob3N0LW9kYiIKK8KgwqDCoCBib29sICJo
b3N0IG9kYiIKIMKgwqDCoMKgIHNlbGVjdCBCUjJfTkVFRFNfSE9TVF9HQ0NfUExVR0lOX1NVUFBP
UlQKIMKgwqDCoMKgIGhlbHAKIMKgwqDCoMKgwqAgVGhpcyBpcyBhIGNvbXBpbGVyIHRoYXQgdGFr
ZXMgYSBzcGVjaWFsbHkgY3JhZnRlZCBjKysgaGVhZGVyCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Nk
YnVzcGx1cy9Db25maWcuaW4uaG9zdCAKYi9wYWNrYWdlL3NkYnVzcGx1cy9Db25maWcuaW4uaG9z
dAppbmRleCAyYjFkMWNlMzFkLi5hOWY4YWZlMDJiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3NkYnVz
cGx1cy9Db25maWcuaW4uaG9zdAorKysgYi9wYWNrYWdlL3NkYnVzcGx1cy9Db25maWcuaW4uaG9z
dApAQCAtMSw1ICsxLDUgQEAKIMKgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfU0RCVVNQTFVTCi3C
oMKgwqAgYm9vbCAiaG9zdC1zZGJ1c3BsdXMiCivCoMKgwqAgYm9vbCAiaG9zdCBzZGJ1c3BsdXMi
CiDCoMKgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfSE9TVF9QS0dDT05GCiDCoMKgwqDCoCBoZWxw
CiDCoMKgwqDCoMKgIEEgQysrIGxpYnJhcnkgZm9yIHNkLWJ1cyB3aXRoIGEgYmluZGluZ3MgYW5k
IGRvYyBnZW5lcmF0b3IuCi0tIAoyLjQ1LjIKCiBGcm9tIDc1NDJhNDdmODU3NGIyYzVlY2RhYmY3
YTAwM2RkNWVlYjNkZGU4NzUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCkZyb206ICJZZXZoZW4g
QmFiaWljaHVrIChEdXN0REZHKSIgPGRmZ2R1c3RAZ21haWwuY29tPgpEYXRlOiBNb24sIDYgSmFu
IDIwMjUgMDk6Mjc6MzkgKzAyMDAKU3ViamVjdDogW1BBVENIIDIvMl0gcGFja2FnZS9sbHZtLXBy
b2plY3QvY29tcGlsZXItcnQ6IHJlbW92ZSBkdXBsaWNhdGUKIMKgcGFyYW1ldGVyCgpUaGUgJ0NP
TVBJTEVSX1JUX1NUQU5EQUxPTkVfQlVJTEQnIHBhcmFtdGVyIHdhcyBwYXNzZWQgdHdpY2UuIE9u
ZSB0aW1lCmFzIEZBTFNFIGFuZCBpbW1lZGlhdGVseSBhZnRlciBhcyBUUlVFIHdoaWNoIG92ZXJy
aWRlZCBwcmV2aW91cyB2YWx1ZQoKU2lnbmVkLW9mZi1ieTogWWV2aGVuIEJhYmlpY2h1ayAoRHVz
dERGRykgPGRmZ2R1c3RAZ21haWwuY29tPgotLS0KIMKgcGFja2FnZS9sbHZtLXByb2plY3QvY29t
cGlsZXItcnQvY29tcGlsZXItcnQubWsgfCAzICstLQogwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sbHZtLXByb2pl
Y3QvY29tcGlsZXItcnQvY29tcGlsZXItcnQubWsgCmIvcGFja2FnZS9sbHZtLXByb2plY3QvY29t
cGlsZXItcnQvY29tcGlsZXItcnQubWsKaW5kZXggZDRiYzRkMzA1Yi4uOTEwNjNkMmNmOSAxMDA2
NDQKLS0tIGEvcGFja2FnZS9sbHZtLXByb2plY3QvY29tcGlsZXItcnQvY29tcGlsZXItcnQubWsK
KysrIGIvcGFja2FnZS9sbHZtLXByb2plY3QvY29tcGlsZXItcnQvY29tcGlsZXItcnQubWsKQEAg
LTE2LDggKzE2LDcgQEAgQ09NUElMRVJfUlRfU1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8K
IMKgQ09NUElMRVJfUlRfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiDCoENPTVBJTEVSX1JUX0lOU1RB
TExfVEFSR0VUID0gTk8KCi1DT01QSUxFUl9SVF9DT05GX09QVFM9LURDT01QSUxFUl9SVF9TVEFO
REFMT05FX0JVSUxEPU9GRiBcCi3CoMKgwqAgLURDT01QSUxFUl9SVF9TVEFOREFMT05FX0JVSUxE
PU9OIFwKK0NPTVBJTEVSX1JUX0NPTkZfT1BUUz0tRENPTVBJTEVSX1JUX1NUQU5EQUxPTkVfQlVJ
TEQ9T04gXAogwqDCoMKgwqAgLURDT01QSUxFUl9SVF9ERUZBVUxUX1RBUkdFVF9UUklQTEU9JChH
TlVfVEFSR0VUX05BTUUpIFwKIMKgwqDCoMKgIC1ETExWTV9DT05GSUdfUEFUSD0kKEhPU1RfRElS
KS9iaW4vbGx2bS1jb25maWcgXAogwqDCoMKgwqAgLURDTUFLRV9NT0RVTEVfUEFUSD0kKEhPU1Rf
RElSKS9saWIvY21ha2UvbGx2bQotLSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
