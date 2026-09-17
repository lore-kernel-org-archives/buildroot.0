Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD19C982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 09:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43A596083A;
	Thu, 17 Sep 2026 09:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ofQ-ZgwciMmu; Thu, 17 Sep 2026 09:20:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5BDF960859
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789636830;
	b=a6S9/3L/OGxyoQdf5sUMProEmdQvna3oSnj+LS7jSIBs5zWXhwHL6bbif0aiZ8v4GkOI
	 iLGog3/YcqAx2tahyd7DVJX7pycCtUVsZblCqfFkyrWgEnb/PDZCr7v83kO/342UQ0oRh
	 uVb0KqAQxZVD0bwlwkUaf2XHC/I4xQSw5YfhLO/DXBi8R9CatULQyOtlctLzBRX+uP/xs
	 KkIABgkaOhPNta6V+nopKi1MKzNTalhNtORr1ALTB/3samOSAEEs7QiLjMj0r4eZ8YB7c
	 TteXe6XqTDFt+nwk41w06842jLBUGoY321UhlK7PBRO6e3LJEmF+ceusjV82Cj9zZ9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789636830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=vahJ6uZ6n/9RzuMAz6B0U2wvJUQWts8WO58vbrI29dE=;
	b=qDZVZd22woCcUBhsVejjpDUWJtp7B0W0ZKhmjCEXRCdWecpapYL5pP+zxcE1A6HJL4dg
	 L7ai+R1eHOqSIAxeH/j7x2AjMQtMwBJZUm+p2pVbRQZbCEYB8KGiCd+Vf9vZ6JuywQGok
	 kRsKB0syKt/0EF2iMeJZMdubZ1yl1qySwCuQzpJ0TB1b7gGIctlhG7UuWMSyEdaJ1gTvM
	 uHkUSxQ3qgsMB0YwNAVdCCmOEgymNI3vKaOCkN4ISQRJhcgQ8JgpRk1HEbvH6P47D2wjS
	 0FDv0N61gSCJtWaXqYK9t85RciQdabDn9Y7NSxo3Gp/k++T6WpDOpGqfYNDleAfba+A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789636830;
	bh=vahJ6uZ6n/9RzuMAz6B0U2wvJUQWts8WO58vbrI29dE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VXoWzoIZ6QQJ7BxOBUHoHHiUuzL3ot2Hb2SDPbbwZlOEZN2H/FhlNmceboFsSGCNR
	 J6FIKR6ZMgIZuDor987NPFsF/7vS1gYtd+T09WvsCLY92EOCcwkBWaHvcC4qdIw9Sa
	 dVM2cYOXfNkFmHT6oqU8D9Q27hhDXcARr+JGPqg8RWm9vkzXm+Xt92yQ9lFWKD585D
	 vQ7JrUSXWLQU5QYfBbvskp9/d7UZqt+Cj+BI4A2C7ECwlnCYQ/G7dRB9y/kB/494KG
	 dQ0eouP01yT+zCxsLQoPM1Sf7l6Psp8J1U14e1Fn26cczdf+nn/NNlWRB5zT8od4xD
	 al0Iqt6MUXNCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BDF960859;
	Thu, 17 Sep 2026 09:20:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C6C629B
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18BCD4079D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4tnSz9Hg4O08 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 09:20:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 48A844076D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789636827;
 b=MFiIOg2s8Y9PnFa64RfA9DwJQFqhdb/tcn+T0uGXbG/VVbx7MOXRJkjNsjPdZApUwOMj
 qPskFlY8evcYqi23jtA4EV8qLhGAyh6AaSmw8N6/g5eOyVqDwIMDnrRni0GuEf7E+LXzr
 1fXFu0quX0g7BYWI13P+kBIyvn57Tgd7RykhWarq4orRXtIDA3JariOl3OeL7dKspuL8l
 tLD8xymwT1/drvCUN5uOPmelaMtVb2M8omhrbd0Y27fHllzEStyEgnwrP29aXpRkYu5Cf
 +86m+/Th4JD1KDg1S5Utdt+FvLWW4brHZ17dE1jt1XUm4Qi2a6G/dAiauRbPljztguQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789636827;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=kvFEJNHocq90k9qgLnFQWnp4HCsR7q3Kbo5tIFkWHVs=;
 b=msf/SELjoNyLjXPjqfHH8JnDqcPkHNPBTcx/pWtMihJmpm1JxR8wqBs6tyE8iau4ScfZ
 oBilRFHXKX8vJfZU/l97FIkPHNVMOUJo0gyB6y2n06Ch6eYtUpSke5lNdb3RXlvgOvRRu
 ZHJRKIzXG+nwoFpCUpfem3FPgFiSrbM1bKzU/UrmkWatLhxxUcwNo+w65Wt90QSuCJXYO
 Oy3yHe9dUqYOSS33akQCk0adq/3YKe8EWExATo58uTeeg53IAAKwd+wQYxGBmoKMlbZwi
 fg6DvuRXFYtdpqlEi1JcuDE7lBACxrowWwspK0klUJwfjeBGo6yXxohm0QKKTb9vd6g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=HKgnT0gl; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48A844076D
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 09:20:25 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912e4ad9so3267905e9.2
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 02:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789636823; x=1790241623;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kvFEJNHocq90k9qgLnFQWnp4HCsR7q3Kbo5tIFkWHVs=;
 b=ZzeC8cxD7Kal7TNj5tXTmsFGqbS6yjQr4umALZhO63iYfL6JKeHRF4zhNJ1qY4kFD4
 XjMNrfxNo6ensk0F56aN8Nzbn4jLkoWd6H/ot+iAjVazcyg9mZQrkTapX/X4opqXm6WY
 I2Mr9n2TNw8P5O3WaMsVeo0+uJhTJBxjcWtepo1AludzoEFqqErasCpXa4adbX4YN1Fh
 Z7OhkMnsUA1PScGp083hKH5V+2sYMF+s/XLtx4f86abQn01FjU9r5WST4vywreX49XUl
 U9EMDiQ3vbtHzD/VTs7pVlsU6kNARisDIZBqIuOND/QlV6W+tZbEwjKRJqhJ0oMCLHrn
 uIsw==
X-Gm-Message-State: AFuF++mIr3ZuQKRsey4PkTCG8I28HT+OGqpNRgriairI1z2mLSYUOrwn
 q0Bhttv+0dRy1sDbZFqkCPE7bh/P7umKGsLCM3ep0dSLgXQkWbzwZrCdb5LmsI+sFZSfyI/xspf
 cY7G2B5A=
X-Gm-Gg: AYBFou1SoJEnLiErwkC1ix2vP6NFIcde20y60ZjZTysFT/Sod6EYZkZS+M1eyz0C5lK
 7KiYpWA8TXaOBPAR2dytTxjC1calKXvonuolMmtYMlYO54w0GrDitUQplvcdEmL8vav0LQU1Vt5
 XDtVpycG7pGzQhZeE8iiGLK7qSXLnsVnWZVBEGO4hr9JBA/6ipnUvjQLsDFqCIqNewnmfSadoP6
 002DtP/mOipcwrlY2mg95QedTXhTEccaGf+qcqyJJk09OV4/czeOEeF0z3vsYRbNRcHGHPs5Bzl
 vD+dTP+yyq5exrptpfeG1Imu6XrDacMK03O8nuKu3l6304tdfP4/9wvLYCEmjWafYMsaiT/Jet/
 ForXjGyTANHwXsAwLRnIHGF+vPPT4bw6o5E9vhohIX4hm00krkkY5N68jA4tJ8CV9No2Jrd1AhJ
 qL1by1SqSAfXnLQ6qta5p4h48KfbVvDzQ10bkdO0fdoBrNOnun50P4R/DVTvs1viYrl55C7hON
X-Received: by 2002:a05:600c:6208:b0:49e:660a:935e with SMTP id
 5b1f17b1804b1-49eb7340978mr71611195e9.29.1789636823594; 
 Thu, 17 Sep 2026 02:20:23 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd24034esm71985845e9.15.2026.09.17.02.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2026 02:20:23 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 17 Sep 2026 11:18:55 +0200
Message-ID: <20260917091904.2560461-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917091904.2560461-1-raphael.melotte@mind.be>
References: <20260917091904.2560461-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH 2/2] package/qemu/Config.in.host: fix typo
 in comment dependency
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlICJob3N0LXFlbXUgbmVlZHMgYSBob3N0IGdjYyA+PSA4IiBjb21tZW50IGRlcGVuZHMgb24K
QlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1VTRVJfQVJDSF9TVVBQT1JULCBtaXNzaW5nIHRoZSB0cmFp
bGluZyAiUyIKb2YgdGhlIGFjdHVhbCBzeW1ib2wgQlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1VTRVJf
QVJDSF9TVVBQT1JUUywKZGVmaW5lZCBhIGZldyBsaW5lcyBhYm92ZSBhbmQgdXNlZCBjb3JyZWN0
bHkgZXZlcnl3aGVyZSBlbHNlIGluCnRoaXMgZmlsZS4KCkJlY2F1c2UgdGhpcyB0eXBvJ2Qgc3lt
Ym9sIGlzIG5ldmVyIGRlZmluZWQgYW55d2hlcmUsIGl0IGlzIGFsd2F5cwpjb25zaWRlcmVkIGZh
bHNlIGJ5IEtjb25maWcsIHNvIHRoZSBjb21tZW50J3MgImRlcGVuZHMgb24iIGNsYXVzZQpzaWxl
bnRseSBsb3NlcyBvbmUgb2YgaXRzIHR3byBpbnRlbmRlZCBjb25kaXRpb25zLgoKQXNzaXN0ZWQt
Ynk6IExMTQpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRl
QG1pbmQuYmU+Ci0tLQogcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0Cmlu
ZGV4IGM3ZGQ1ODc2ZTUuLjY0NGRmZDRkODIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcWVtdS9Db25m
aWcuaW4uaG9zdAorKysgYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKQEAgLTM3LDcgKzM3
LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfUUVNVV9VU0VSX0FSQ0hfU1VQUE9SVFMKIAog
Y29tbWVudCAiaG9zdC1xZW11IG5lZWRzIGEgaG9zdCBnY2MgPj0gOCIKIAlkZXBlbmRzIG9uIEJS
Ml9QQUNLQUdFX0hPU1RfUUVNVV9TWVNURU1fQVJDSF9TVVBQT1JUUyB8fCBcCi0JCUJSMl9QQUNL
QUdFX0hPU1RfUUVNVV9VU0VSX0FSQ0hfU1VQUE9SVAorCQlCUjJfUEFDS0FHRV9IT1NUX1FFTVVf
VVNFUl9BUkNIX1NVUFBPUlRTCiAJZGVwZW5kcyBvbiAhQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzgK
IAogY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfUUVNVQotLSAKMi41NC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
