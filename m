Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FA2C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 11:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D9666FC10;
	Fri, 14 Feb 2025 11:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xO9HsxxRnMgB; Fri, 14 Feb 2025 11:21:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B0E46FC2F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B0E46FC2F;
	Fri, 14 Feb 2025 11:21:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08BD51E6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB5D140768
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loO06UoNmMVw for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 11:21:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 06DDF4080C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06DDF4080C
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 06DDF4080C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 11:21:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5de63846e56so3592689a12.1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 03:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739532114; x=1740136914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Xsg3SJ7iFT5v0tCmljURb/jlXO7SYwEQF9Oq9QLnUI=;
 b=PQJf/t9qNPWjwzSZo3+qsVFO+N7/bSU4w3y7JdebIEPmgC4CyR/yyNIketnDoKazP5
 Bpiw5R98u/QbKDGwmuLooVLGIWTwmMjlCk+B0tgxrvJN+i8DPEv+nqe+2B05H3Q2Uljg
 nBNyOyEPMTksLYK9jsxDZdOeHOHNoTgTx0ANJm3pqj3AUTB/1UDHPToNXcaXEXjc9bIc
 KPFzYRVG4ThQtwUOukq1tDqw1901LPANzt9kCcIG+fsQkX3Y77l2ENaEIk12WWLB3m/y
 qijtOmWry5jJdYyLNiMJimGsLb4EAj5STPv5Lqkb+MwVOmmMMNW71hagzlPxBxKahCjG
 K57w==
X-Gm-Message-State: AOJu0Yw6zAcwpcfWHDsyXwJAjdJcVSAcUCoLq7DAGWdeoKtjFhVybt+c
 HbGCotzFypPvJaBfJQg2DXblXT+GrnWWYjEiHkq86MRNodE7B6J1F8F3IZxoPM6Eozeg/Pfn/CI
 9
X-Gm-Gg: ASbGncvY6tcgn3VamAU/GC5jubUktA4Bvy0P5pIdV3DKRzE+DR4Bu7rN+CtKAH4YB6m
 SUoWSQs/SulCnS4eBJHhclrw+w7b9jTHUuw0sphcfMK3KL5kshq8poPZDzl75EyPBWJftS4ZopL
 GKL5y6RZqKny2CUZzd02Yy/3SxDC/lSlBipYIFxcuiDIghz8djtegYeQdztAn29q82Gh4GElneX
 l/9xMGYDvZfGDClrNpdIceLdQbUx4Fad0wZ6ZQbAtXAIHAeo1eMjA3mpma8yJ6mmdC8ST96pGUh
 W0O5ML2nHH6nt/SpXx5O7Y0SjhQLZULPTTKLfpJ6DCQ=
X-Google-Smtp-Source: AGHT+IH2ci9ggvhKb8V6+1oCynpkCmOR5ay/CE8ked54ysnCZbAPTxUo7YxiGcadU1qBTfhmN/Rm1Q==
X-Received: by 2002:a05:6402:348b:b0:5de:aaa4:750b with SMTP id
 4fb4d7f45d1cf-5deb086a511mr10295037a12.3.1739532114010; 
 Fri, 14 Feb 2025 03:21:54 -0800 (PST)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece270b17sm2725181a12.62.2025.02.14.03.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 03:21:53 -0800 (PST)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri, 14 Feb 2025 12:21:38 +0100
Message-ID: <20250214112140.1862254-3-sairon@sairon.cz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214112140.1862254-1-sairon@sairon.cz>
References: <20250214112140.1862254-1-sairon@sairon.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1739532114; x=1740136914; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Xsg3SJ7iFT5v0tCmljURb/jlXO7SYwEQF9Oq9QLnUI=;
 b=Yi+gNFlXvXzW3TegP7NxIxBNF/6Vcm0bkg3eSr3s/NIv9fzpfVGsYNdmlPKMG8HeCk
 XWAAkUnL7DNdGxKxDyLmu2AoL7bxSN+2DMeLeEIxRPtE58pEgZ/9HTIl+sD9a2O6ZpfH
 /cBiyKyYqiwRGFwxidZ0ng9lSdADaIMQyQLQ8YdFXFZBE8K2SjI1ljjo12OXKPNAqazR
 WkN+YVOcI4NAxkcjzGdFZ1eu10kuqdu1jNAzgaWlZmA5SFwaBJMv5JByuUeU03MeWNcY
 ltz3mG6UyhpRzEplQptz4SFmqkeKVDA6tcOwFC9d7tBqLd25tUKxIjb2jv65/b8Q5ucN
 BedQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=Yi+gNFlX
Subject: [Buildroot] [v2 2/3] fs/erofs: add config options for dedupe,
 fragments and ztailpacking
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIEtjb25maWcgdG9nZ2xlcyBmb3IgYSBmZXcgbW9yZSBleHRlbmRlZCBvcHRpb25zIHRoYXQg
YXJlIHVzZWZ1bCBmb3IKcmVkdWNpbmcgc2l6ZSBhbmQgaW1wcm92aW5nIHBlcmZvcm1hbmNlIG9m
IEVST0ZTIGltYWdlcy4gRGVzY3JpcHRpb25zIG9mIHRoZQpjb25maWcgb3B0aW9ucyB3ZXJlIHRh
a2VuIGZyb20gdGhlIGVyb2ZzLXV0aWxzIG1hbnBhZ2UuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gxIxl
cm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0tLQogZnMvZXJvZnMvQ29uZmlnLmluIHwgMjggKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogZnMvZXJvZnMvZXJvZnMubWsgIHwgMTYgKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZnMvZXJvZnMvQ29uZmlnLmluIGIvZnMvZXJvZnMvQ29uZmlnLmluCmluZGV4IDIwNDFhMDAz
NGUuLmZlYzhlZmExNWUgMTAwNjQ0Ci0tLSBhL2ZzL2Vyb2ZzL0NvbmZpZy5pbgorKysgYi9mcy9l
cm9mcy9Db25maWcuaW4KQEAgLTU4LDYgKzU4LDM0IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1JPT1RG
U19FUk9GU19MWk1BX0xFVkVMCiAKIGVuZGlmICMgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfTFpN
QQogCitjb25maWcgQlIyX1RBUkdFVF9ST09URlNfRVJPRlNfREVEVVBFCisJYm9vbCAiZW5hYmxl
IGRhdGEgZGVkdXBsaWNhdGlvbiIKKwlkZXBlbmRzIG9uICFCUjJfVEFSR0VUX1JPT1RGU19FUk9G
U19OT05FCisJaGVscAorCSBFbmFibGUgZ2xvYmFsIGNvbXByZXNzZWQgZGF0YSBkZWR1cGxpY2F0
aW9uIHRvIHJlZHVjZSBGUyBpbWFnZQorCSBzaXplLiBJbnRyb2R1Y2VkIGluIExpbnV4IDYuMS4K
KworY29uZmlnIEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0ZSQUdNRU5UUworCWJvb2wgImVuYWJs
ZSBmcmFnbWVudHMgcGFja2luZyIKKwloZWxwCisJICBQYWNrIHRoZSB0YWlsIHBhcnQgKHBjbHVz
dGVyKSBvZiBjb21wcmVzc2VkIGZpbGVzLCBvciBlbnRpcmUKKwkgIGZpbGVzLCBpbnRvIGEgc3Bl
Y2lhbCBpbm9kZSBmb3Igc21hbGxlciBpbWFnZSBzaXplLgorCSAgSW50cm9kdWNlZCBpbiBMaW51
eCA2LjEuCisKK2NvbmZpZyBCUjJfVEFSR0VUX1JPT1RGU19FUk9GU19BTExfRlJBR01FTlRTCisJ
Ym9vbCAiZW5hYmxlIGZyYWdtZW50cyBwYWNraW5nIgorCWhlbHAKKwkgIEZvcmNlbHkgcmVjb3Jk
IHRoZSB3aG9sZSBmaWxlcyBpbnRvIGEgc3BlY2lhbCBpbm9kZSBmb3IKKwkgIGJldHRlciBjb21w
cmVzc2lvbi4gZmlsZXMsIGludG8gYSBzcGVjaWFsIGlub2RlIGZvciBzbWFsbGVyCisJICBpbWFn
ZSBzaXplLiBJbnRyb2R1Y2VkIGluIExpbnV4IDYuMS4KKworY29uZmlnIEJSMl9UQVJHRVRfUk9P
VEZTX0VST0ZTX1pUQUlMUEFDS0lORworCWJvb2wgImVuYWJsZSB6dGFpbHBhY2tpbmciCisJaGVs
cAorCSAgUGFjayB0aGUgdGFpbCBwYXJ0IChwY2x1c3Rlcikgb2YgY29tcHJlc3NlZCBmaWxlcyBp
bnRvIGl0cworCSAgbWV0YWRhdGEgdG8gc2F2ZSBtb3JlIHNwYWNlIGFuZCB0aGUgdGFpbCBwYXJ0
IEkvTy4gSW50cm9kdWNlZAorCSAgaW4gTGludXggNS4xNy4KKwogY29uZmlnIEJSMl9UQVJHRVRf
Uk9PVEZTX0VST0ZTX1BDTFVTVEVSU0laRQogCWludCAicGNsdXN0ZXIgc2l6ZSIKIAlkZWZhdWx0
IDAKZGlmZiAtLWdpdCBhL2ZzL2Vyb2ZzL2Vyb2ZzLm1rIGIvZnMvZXJvZnMvZXJvZnMubWsKaW5k
ZXggZThkMzBiYWNlOC4uM2I2NGNiMWM2ZSAxMDA2NDQKLS0tIGEvZnMvZXJvZnMvZXJvZnMubWsK
KysrIGIvZnMvZXJvZnMvZXJvZnMubWsKQEAgLTIyLDYgKzIyLDIyIEBAIGlmbmVxICgkKEJSMl9U
QVJHRVRfUk9PVEZTX0VST0ZTX1BDTFVTVEVSU0laRSksMCkKIFJPT1RGU19FUk9GU19BUkdTICs9
IC1DJChzdHJpcCAkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX1BDTFVTVEVSU0laRSkpCiBlbmRp
ZgogCitpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0RFRFVQRSkseSkKK1JPT1RGU19F
Uk9GU19BUkdTICs9IC1FZGVkdXBlCitlbmRpZgorCitpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZT
X0VST0ZTX0ZSQUdNRU5UUykseSkKK1JPT1RGU19FUk9GU19BUkdTICs9IC1FZnJhZ21lbnRzCitl
bmRpZgorCitpZmVxICgkKEJSMl9UQVJHRVRfUk9PVEZTX0VST0ZTX0FMTF9GUkFHTUVOVFMpLHkp
CitST09URlNfRVJPRlNfQVJHUyArPSAtRWFsbC1mcmFnbWVudHMKK2VuZGlmCisKK2lmZXEgKCQo
QlIyX1RBUkdFVF9ST09URlNfRVJPRlNfWlRBSUxQQUNLSU5HKSx5KQorUk9PVEZTX0VST0ZTX0FS
R1MgKz0gLUV6dGFpbHBhY2tpbmcKK2VuZGlmCisKIGRlZmluZSBST09URlNfRVJPRlNfQ01ECiAJ
JChIT1NUX0RJUikvYmluL21rZnMuZXJvZnMgJChST09URlNfRVJPRlNfQVJHUykgJEAgJChUQVJH
RVRfRElSKQogZW5kZWYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
