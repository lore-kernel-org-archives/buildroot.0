Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE169E7716E
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 17:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77DD9416DA;
	Thu,  5 Dec 2024 17:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BR15ss8br5_t; Thu,  5 Dec 2024 17:36:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 412DA416F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 412DA416F2;
	Thu,  5 Dec 2024 17:36:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 938D9AE8
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC8343462
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWgJEi1Wq7np for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 17:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1EA34345B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1EA34345B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1EA34345B
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-434a0fd9778so12268815e9.0
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 09:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733420206; x=1734025006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/6DmG68ERGRMVWBi1YfN5BRM9mg9KtrQvIpIJsrgTHM=;
 b=JxkwMjZBHC6HP6QgGhsbzIRgq6MtGnTwg50wYLfifEex6CKPHJbwUWeTEnWaSFC8AI
 YWiUmT/rAsk5LZYpfmBqqSVsZvIqmPVvMhwuB9lEtnPG8i32rY3ejVlTe98Zqfkogrc6
 giri+QLdrLt0RvIOmJi494pGX6J+B+3O7PiJf+L16j4ZFADdE0jh1OfDW36maHEYxEnh
 Ag5PCDgtlJ1K6V/kyfJHo08jL9XAP+nGVnD3tGRj5/ckxLf57ogEgvsXoDLuNOso4K4b
 sEwjWuf4wOrVsqsJQFnZ2St+E2feGq8ukECt9ZiPmsVVl/71Yoqkxx4MI7Vv249XmRvp
 lo7A==
X-Gm-Message-State: AOJu0YyHS4SoTZHgXdgy6O6ZUJzK028UiqoDhy8+Va4QzzrVWNaeyf1P
 zApjzoEBbaQkEge5a7os2p/ds7614JAdQJPZSf32knIB2cPtMRrY4NkrjfwCbqkRRj5kdcwrHeX
 q73c=
X-Gm-Gg: ASbGncvUs2Cpfx5SAHsvZKEe3pc8hD+gNaZ+n/gJQxpVbKw0+7d9K5VzmKvy5hlbj0+
 iAQRBieSJXcIzbcrR1ryzzLARiDAWX/l9sQzyNWCS/KYJrCkkUzxeni98xlaf1H5GDX4PuhQTiC
 b1CXk/vASTMihqJeczZple1Q0BbwuJnIrACQLQvbcNcTu02CAHiKSlOHi7PSsMtPdR7iHfpOrr/
 qzO2AUv4L+DfqJksYhKXuedtDMSX3hmp0738FT738wN94BF
X-Google-Smtp-Source: AGHT+IG5VhHw6vh2wINSNnvGMHBe30nNBxKLLOQZ+Skj94dRh4PXOn/wk5dXBGZDNLrlmzuV9Q3FDA==
X-Received: by 2002:a05:600c:1390:b0:434:a19a:5965 with SMTP id
 5b1f17b1804b1-434ddead1e1mr1564175e9.6.1733420206406; 
 Thu, 05 Dec 2024 09:36:46 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d52cbd5asm66527015e9.40.2024.12.05.09.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 09:36:45 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A7C615F9EA;
 Thu,  5 Dec 2024 17:36:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu,  5 Dec 2024 17:36:41 +0000
Message-Id: <20241205173643.2334343-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205173643.2334343-1-alex.bennee@linaro.org>
References: <20241205173643.2334343-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733420206; x=1734025006; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/6DmG68ERGRMVWBi1YfN5BRM9mg9KtrQvIpIJsrgTHM=;
 b=ydV7QqdiLjm80c3MSIA9IHUQz/R2nO4eHmjyXsQIuBxNeJbUDLciMjGA+3H806jRJp
 BOwLDielVjuEPkFvQwLWnFyiyM0k96xoQfQzBvdtartidG8I6Q9Q6ShnI62tO42v2zaq
 RhgskC/RdSuJTSixg26dQWxpohdYpvfZP+uO9+10iG0o59NqweHi6XisBYi+nP9UU19d
 EI0+ftpyhCycf0eL80vIT1J/wwwFILB4Y4nIZkNc4Pqkc2e/hXJmxqQ/gxHxPRqIOXCK
 BmUlEXOecQXYGlGu25uLm4byuUjbKSRbdJllffx/UA4D2Bf0AsTTum+7nhT1vKv1sWer
 ZnYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ydV7Qqdi
Subject: [Buildroot] [PATCH v2 2/4] package/mesa3d: add option to enable
 VIRTIO vulkan driver
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHN1cHBvcnQgZm9yIFZlbnVzICh0aGUgVnVsa2FuIFZpcnRJTyBlbmNhcHN1bGF0aW9uKSBp
biBNRVNBIGhhcwpiZWVuIHN0YWJsZSBzaW5jZSAyMy4yIHNvIGFkZCBhbiBvcHRpb24gdG8gZW5h
YmxlIGl0LgoKU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpNZXNzYWdl
LUlkOiA8MjAyNDA4MjIxODE1NDYuNjQ5MDAtNi1iZXJuZEBrdWhscy5uZXQ+CgotLS0KdjIKICAt
IHJlLWJhc2VkIG9uIEJlcm5kJ3Mgc2VyaWVzCiAgLSBtYWtlIGNsZWFyIFZlbnVzIGlzIHRoZSBl
bmNhcHN1bGF0aW9uIGZvciBWdWxrYW4KICAtIGRyb3BwZWQgcHl0aG9uLXB5eWFtbCBhcyBtZXJn
ZWQgaW4gZWFybGllciBidW1wcwotLS0KIHBhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiB8IDYgKysr
KysrCiBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIGIvcGFj
a2FnZS9tZXNhM2QvQ29uZmlnLmluCmluZGV4IDA1ODMwOGZiYjIuLjJmMmI0ODY5YTQgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL21lc2EzZC9Db25m
aWcuaW4KQEAgLTMzNCw2ICszMzQsMTIgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9WVUxL
QU5fRFJJVkVSX1NPRlRQSVBFCiAJaGVscAogCSAgVnVsa2FuIHNvZnRwaXBlIGRyaXZlci4KIAor
Y29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1ZJUlRJTworCWJvb2wgIlZ1
bGthbiBWaXJ0SU8gZHJpdmVyIChWZW51cykiCisJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9W
VUxLQU5fRFJJVkVSCisJaGVscAorCSAgVnVsa2FuIFZpcnRJTyAodmVudXMpIGRyaXZlci4KKwog
Y29tbWVudCAiT2ZmLXNjcmVlbiBSZW5kZXJpbmciCiAKIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNB
M0RfT1NNRVNBX0dBTExJVU0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tayBi
L3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawppbmRleCBkNzQ1OWQwZjE5Li5iZDZlNTNkOGRhIDEw
MDY0NAotLS0gYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKKysrIGIvcGFja2FnZS9tZXNhM2Qv
bWVzYTNkLm1rCkBAIC0xMTEsNiArMTExLDcgQEAgTUVTQTNEX0dBTExJVU1fRFJJVkVSUy0kKEJS
Ml9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RSSVZFUl9WSVJHTCkgICAgKz0gdmlyZ2wKIE1FU0Ez
RF9WVUxLQU5fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX0JST0FE
Q09NKSArPSBicm9hZGNvbQogTUVTQTNEX1ZVTEtBTl9EUklWRVJTLSQoQlIyX1BBQ0tBR0VfTUVT
QTNEX1ZVTEtBTl9EUklWRVJfSU5URUwpICAgKz0gaW50ZWwKIE1FU0EzRF9WVUxLQU5fRFJJVkVS
Uy0kKEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1NXUkFTVCkgKz0gc3dyYXN0CitN
RVNBM0RfVlVMS0FOX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9W
SVJUSU8pICs9IHZpcnRpbwogCiBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9HQUxMSVVNX0RS
SVZFUiksKQogTUVTQTNEX0NPTkZfT1BUUyArPSBcCi0tIAoyLjM5LjUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
