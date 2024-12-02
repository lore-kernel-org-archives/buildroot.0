Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B60E69E82
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 18:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5CE60621;
	Mon,  2 Dec 2024 18:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2nDwD0rIa4F5; Mon,  2 Dec 2024 18:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72233606D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72233606D4;
	Mon,  2 Dec 2024 18:21:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 77D372362
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63FE7401AE
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n8VSc5qut3L1 for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58080400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58080400D1
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58080400D1
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:21:06 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-385e3621518so1880667f8f.1
 for <buildroot@buildroot.org>; Mon, 02 Dec 2024 10:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733163663; x=1733768463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NCH8TYT7zQ4Wy1z6ntansaL+2h6ldX+vRX6LyKvIuQ0=;
 b=tDqTgU9ct4iUGEsXO6vZXtvRXQ5sIcMKfBWPjHf8WxVHH/SajZM0GE6yRH7/WF7hON
 HXWvRlDkR4RZY6S2XcSxpQkp4AAFRm3iM+W/Ie8ERzWz5jJyxi2pNItc1+FcSjBPjYIN
 RQkh7RbjPG5ZF2zclwa1EgvnTuPaV9wDIJ88tNvUrjsmfz/5HoAB03goaQopYs2gu9cl
 sQ+iuL27r1TkTXuIO5EErG/Cqceo728YdXJwmkx53IedFZ/oHnLBRpco9b8duT3LxVO3
 Gvcj9g0q18+ysJ2Q8y772l4ZtwDr1yP4s/Oa40FdknYH4VbYIq5ZjZQWWPLDs8V4X6Vo
 2hlg==
X-Gm-Message-State: AOJu0YyGDEorgAfI2srN8ACuWj59uq1Ky7siyGupR8XawpD5Gy1lR0Gy
 1kdAosQPRoh+6vKgMFSTqSEePvsRelFolJseprmkuix/WmqvOnBk6QQWLD4clfYoZkCmQImmqBA
 q7tU=
X-Gm-Gg: ASbGncuAG3AJl9E6L3BoJzZpnnNAFq9bw5NgBPe4NKTod5QWxhHHfW04Rnzrs69jdAP
 pJJ5/vDFIRXTQAwvNQBexBhDGBu2eTa4vza7cUGKtrq4qtwGrCzFzYJNhuUXGrfh65O8NRxNf7d
 //XwqpAs+UhpKu7OZG5oA1t0+Am42i6zZXbpHHgpjj4R+UTublUStGvpDf+DCGNy2bWuv5nmgRU
 SSUG9/EVnHR4RUuhL5Ykn2quI/hN4mYUWbMM2WwMbu48GDp
X-Google-Smtp-Source: AGHT+IEUz4pMOGPoABCuPsUVtEAzw5mMpgfdiW4fXXfC+50bezLXYUtm3mCMTfAx6jzTUfh6qGe0rw==
X-Received: by 2002:a05:6000:2cb:b0:385:f98f:2cc4 with SMTP id
 ffacd0b85a97d-385f98f2de1mr1849927f8f.44.1733163663280; 
 Mon, 02 Dec 2024 10:21:03 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd3a710sm13059312f8f.57.2024.12.02.10.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 10:21:02 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0710C5F945;
 Mon,  2 Dec 2024 18:21:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Mon,  2 Dec 2024 18:21:00 +0000
Message-Id: <20241202182101.410320-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241202182101.410320-1-alex.bennee@linaro.org>
References: <20241202182101.410320-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733163663; x=1733768463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NCH8TYT7zQ4Wy1z6ntansaL+2h6ldX+vRX6LyKvIuQ0=;
 b=BO8gLvqINpke43SF3vLIALE9zTqJ9YQ9gNOKpSaDoFlWzf27nv3JF6xzq19/aqsNST
 v3aFLwOCmtVkj9wPmQkVXvFMqNW32NTkNYMwVFxwuaNNfnFQsK0jlnWxrnnzjKmANL5/
 sj1+PljhG4UgLURZqKnNqFC4HXfl/7D0lbKbTfenYS1YmMAEml6fJITx63YXX5zXdy82
 7cK2fm4zaq/wC5kuKYAbTfDMd6cKoAjJWylqqgRh3HpaeMKOVxVkaMOEOS6ZFJr/F/rS
 WyAD2vXyR8gf3gRFShxYw4lz+ubFje2cuWiXaas+4BxGePV3aeW9FWmKuc/H+3kshsim
 HOwQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BO8gLvqI
Subject: [Buildroot] [PATCH 1/2] package/mesa3d: add option to enable VIRTIO
 vulkan driver
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
a2FnZS9tZXNhM2QvQ29uZmlnLmluCmluZGV4IGI0MmU1OTNiZTcuLjA4OTI4NmY3YzQgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL21lc2EzZC9Db25m
aWcuaW4KQEAgLTMzNCw2ICszMzQsMTIgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9WVUxL
QU5fRFJJVkVSX1NXUkFTVAogCWhlbHAKIAkgIFZ1bGthbiBzd3Jhc3QgZHJpdmVyLgogCitjb25m
aWcgQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfVklSVElPCisJYm9vbCAiVnVsa2Fu
IFZpcnRJTyBkcml2ZXIgKFZlbnVzKSIKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtB
Tl9EUklWRVIKKwloZWxwCisJICBWdWxrYW4gVmlydElPICh2ZW51cykgZHJpdmVyLgorCiBjb21t
ZW50ICJPZmYtc2NyZWVuIFJlbmRlcmluZyIKIAogY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9P
U01FU0FfR0FMTElVTQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFj
a2FnZS9tZXNhM2QvbWVzYTNkLm1rCmluZGV4IGQ3NDU5ZDBmMTkuLmJkNmU1M2Q4ZGEgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5taworKysgYi9wYWNrYWdlL21lc2EzZC9tZXNh
M2QubWsKQEAgLTExMSw2ICsxMTEsNyBAQCBNRVNBM0RfR0FMTElVTV9EUklWRVJTLSQoQlIyX1BB
Q0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVSX1ZJUkdMKSAgICArPSB2aXJnbAogTUVTQTNEX1ZV
TEtBTl9EUklWRVJTLSQoQlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfQlJPQURDT00p
ICs9IGJyb2FkY29tCiBNRVNBM0RfVlVMS0FOX0RSSVZFUlMtJChCUjJfUEFDS0FHRV9NRVNBM0Rf
VlVMS0FOX0RSSVZFUl9JTlRFTCkgICArPSBpbnRlbAogTUVTQTNEX1ZVTEtBTl9EUklWRVJTLSQo
QlIyX1BBQ0tBR0VfTUVTQTNEX1ZVTEtBTl9EUklWRVJfU1dSQVNUKSArPSBzd3Jhc3QKK01FU0Ez
RF9WVUxLQU5fRFJJVkVSUy0kKEJSMl9QQUNLQUdFX01FU0EzRF9WVUxLQU5fRFJJVkVSX1ZJUlRJ
TykgKz0gdmlydGlvCiAKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJVU1fRFJJVkVS
KSwpCiBNRVNBM0RfQ09ORl9PUFRTICs9IFwKLS0gCjIuMzkuNQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
