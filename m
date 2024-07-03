Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23B9C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 08:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA25641798;
	Wed,  3 Jul 2024 08:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gysXHVfATQIP; Wed,  3 Jul 2024 08:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 544BC41793
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 544BC41793;
	Wed,  3 Jul 2024 08:29:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE161BF2EC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A69E60A54
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DJMj61tYSOub for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 08:29:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A79C607E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A79C607E1
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A79C607E1
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 08:29:22 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58d24201934so348511a12.0
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 01:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719995360; x=1720600160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2tLX9g82nIuwUMIm/AUnUOCh9ot5EJ0oVz7x0PaBAI=;
 b=lwphAWv0+67EybbqSFeJf/BWEb3fIlPSSOTVJKsdCgUYdRTgIelGjZS7UI4DbaInw4
 tO/uFnlcAq0X+KJ71AgBRlF8ieJZncLx0i4LLrmsc9GxJ7SVzmqQelttjYdREffy5Vk3
 aFyvEYkgkbeEvRt5qRt6Wb8kV7OJwwMHeEhS4hIxOlLO6ivNYXFis1hr285VDfS3OTYt
 U1cJtNvOaL2pmpsmuKk+jtiMIbwKVGii5Cts6ImbnQ0/JZGmjOjr023Zycm0w9kf5O7p
 sFHicBixOrqIJrWxB+QaKYfZSG/rw8DwDWSvyS/K63xXojbQb/OxrepIuWt8MnzZZhR/
 LhIA==
X-Gm-Message-State: AOJu0YxeirddZH4++Tiiz3+ZPmLZ3yK9l++vnOIg8Aa8ecbHcwttRbfA
 JLwV+y6NNomsPw8gSo//Vu/XFKDZXLsT277QYuCa+brRDsjUKqv6RkTtOPCiqlz+bosmvxh55rz
 g
X-Google-Smtp-Source: AGHT+IEkOfk4XukmlukF5qjP0mg+2UnAv5k4jqSsrBQ3xo/VTn0xuQptKtBYaMvwr/C/SvrdB62ziw==
X-Received: by 2002:a05:6402:1603:b0:578:6360:aa11 with SMTP id
 4fb4d7f45d1cf-58ce4ab0382mr765414a12.5.1719995360307; 
 Wed, 03 Jul 2024 01:29:20 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f0a3sm6725115a12.35.2024.07.03.01.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 01:29:20 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 10:28:50 +0200
Message-Id: <20240703082850.750420-5-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240703082850.750420-1-sairon@sairon.cz>
References: <20240703082850.750420-1-sairon@sairon.cz>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1719995360; x=1720600160; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2tLX9g82nIuwUMIm/AUnUOCh9ot5EJ0oVz7x0PaBAI=;
 b=dXO25ISOZKSbR3JRZQEPWYFRbenjndeG/iXE5jjZ8pkdsLxgcaqxwXisAV3ihOhuVQ
 tT0tdC5MWuIKnx6QGzb09HRXscBjClseHOBdB0bzTeFhBnVJaRF+qoHhWQpdCcocAdUj
 cT8rxuYCy36NtMn9dPWGEbj6rLKxLPzd6DCE0xUerPmpI4FjwoDV6rJnP8O/OsNj1xDX
 kLSLE/XqC0QvxluzsphaOCJMuasoc3sDZzawXnoBmMerz5vy5f+1kdyhTCTFBd3nVwVv
 8KqlpfHP0Y7VKmKf5QJoK5ufng0PY/cCxcbFt+RrGCBcZ8b3VZr4Cp2XhfSmzh9u50JS
 u4Mw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=sairon.cz header.i=@sairon.cz
 header.a=rsa-sha256 header.s=google header.b=dXO25ISO
Subject: [Buildroot] [PATCH 4/4] fs/erofs: add config options for dedupe,
 fragments and ztailpacking
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Gao Xiang <hsiangkao@aol.com>
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
IGEvZnMvZXJvZnMvQ29uZmlnLmluIGIvZnMvZXJvZnMvQ29uZmlnLmluCmluZGV4IGQ1OTdkZTA5
NDAuLjM2MzQxNTBhNTcgMTAwNjQ0Ci0tLSBhL2ZzL2Vyb2ZzL0NvbmZpZy5pbgorKysgYi9mcy9l
cm9mcy9Db25maWcuaW4KQEAgLTUwLDYgKzUwLDM0IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1JPT1RG
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
ZXggZjAwZmI3MmM5NS4uZTRlMGRhNDMxZSAxMDA2NDQKLS0tIGEvZnMvZXJvZnMvZXJvZnMubWsK
KysrIGIvZnMvZXJvZnMvZXJvZnMubWsKQEAgLTI0LDYgKzI0LDIyIEBAIGlmbmVxICgkKEJSMl9U
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
