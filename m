Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58463C61CE7
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 11:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0728F4239C;
	Wed, 11 Jun 2025 11:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXzUuHU9gJ1b; Wed, 11 Jun 2025 11:16:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0283B42397
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0283B42397;
	Wed, 11 Jun 2025 11:16:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C4083237
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 11:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE53A40074
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 11:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6u8dU58Bu1WI for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 11:16:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7017D40414
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7017D40414
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7017D40414
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 11:16:46 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so1054912666b.0
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 04:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749640604; x=1750245404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2RLrLetbZ3pQ1hLFJKR8gh3BVRBWM2/ixPx/yt+w3f8=;
 b=tEWNjgvWCValtMUgOo6Jh6JuxnRx6pjGzxh3ogyOpg6cuvUSHdJyqbQBq2jVRIg6V3
 TyfvkYijRSTAuXl28GG+x7+05Ct1C/uxxA700eamULZH8n2VZQkHl1j66eW4ZY26o41u
 30+1ZhMuLHvgSwmTWsTXM72Pi7obSTTNZ0ECrSomoJEx++VoC93409LHj3PwkFxnhs6o
 t/LeE4LjJgWfSgSZrcOvQzYFBy0iompn094W4McaSp7wXUr333wy87SjY0Gg5ogdMYj5
 u14pVASJ8hO0HA3lQpn09WhBQdtRChfAqNrHJjACwq7zlHzecwH4jngYN0O9Q4uyH5ax
 y5fQ==
X-Gm-Message-State: AOJu0Ywr5s3nrlzPCC1kx2zGd+xbCB6Gds3j4CEDSSRUTCyRO4vIMmC+
 TEm/DHjfYsxWVNH1ms3izVh1iHq7aATLrqfxhWhijrNPMfu5Wh/EsBk+6kwI4NGas/p7zgzeADB
 d16hb
X-Gm-Gg: ASbGncvpovZqxleGUrgbI5QFygq2APNpD0VptHj8mVZ5F6SHWLTbCEXcOQh8wkiLx/H
 jHGxgNPCYeIOO5YwvaBVGX5AEs6giHokjZIOqfxMzUp6GhtlNk1J0rl8lUzCXV+nIFFy95FAJ8T
 XdDqJTkUHuIei1h+FVDtiiO6YkHSyKfCtSeW/ptMh6saWbtxveZNuphxEdVMdngXfxwqPnZfnoP
 wWoxcdqSdYuWD0JfBNxXUDuL/Bo2LCAvz+etptZ308OHtkBoGCpNsnSj5qZJqQO+gwtXDQsSpfm
 G1QUTHoENsfJ680O+S9bpe3nd42wcgsK/1QAshhwnDkVtW0Qr3ufy42m6h7Vo4o=
X-Google-Smtp-Source: AGHT+IFUZ0FL3q2VxJ5QXcN3skBOwg8OEAnzr8sen71/9RDUd1JHPTwDhVTHKqWiTWxQ6psvHdkT1Q==
X-Received: by 2002:a17:907:7b88:b0:ade:4339:9358 with SMTP id
 a640c23a62f3a-ade8c76cb06mr221116666b.22.1749640604021; 
 Wed, 11 Jun 2025 04:16:44 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade44af8215sm687188566b.15.2025.06.11.04.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 04:16:42 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 20FAB5F8A4;
 Wed, 11 Jun 2025 12:16:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 11 Jun 2025 12:16:35 +0100
Message-ID: <20250611111640.702572-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611111640.702572-1-alex.bennee@linaro.org>
References: <20250611111640.702572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749640604; x=1750245404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2RLrLetbZ3pQ1hLFJKR8gh3BVRBWM2/ixPx/yt+w3f8=;
 b=tejaD20ZQ4yBalKToblzFf/FSsYQK7lkc+7Iu5ZKMxH/FRiyfNmZpoXkaq13oxoLtR
 DXJeYx2M/RgqlK/QSXlTRZl6PCBc0ccQYvTKduLZLFTTXPjPgTvuhhpm+SqljZFv/Ix0
 LKYMwgBVgLqcvWVvR5CActIoP2abcfbhDMzT0nsVRN0Xdyjh68MGikuxpiiaN/Df9ILL
 Hq9PYXb4BW4BCin/of3c1pr06HQePy2MF49l3kuRkokM/ZrrrIKu2tNPZwJ4LpyWsZJT
 YAmj+7M2g1orp7ASYS1vVs2OkAZQ1ZaVnVKY2AQHr9jfMtOIN2jWGglRxjQam4Ne44Ro
 VcIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tejaD20Z
Subject: [Buildroot] [PATCH v6 2/5] package/vulkan-sdk: new package
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHByaW5jaXBsZSBjb21wb25lbnQgb2YgdGhpcyBpcyB0aGUgbmV3IHZvbGsgbWV0YS1sb2Fk
ZXIgd2hpY2ggaXMKcmVxdWlyZWQgZm9yIG1vcmUgcmVjZW50IHZlcnNpb25zIG9mIHZ1bGthbi10
b29scy4gVGhlcmUgZG9lcyBzZWVtIHRvCmJlIGEgbGl0dGxlIGNvbmZ1c2lvbiB3aXRoIGdpdGh1
YiBSZWxlYXNlcyBsYWdnaW5nIGJlaGluZCB0YWdnZWQKdmVyc2lvbnMgb2YgdGhlIHNkay4gSSd2
ZSBnb25lIGZvciB0aGUgbGF0ZXN0IFNESyB2ZXJzaW9uIHRvIHN0YXkgYXMKY2xvc2VseSBhbGln
bmVkIHRvIHRoZSByZXN0IG9mIHRoZSBzeXN0ZW0gYXMgSSBjYW4uCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+CgotLS0KdjYKICAtIGJ1bXAgdG8g
dnVsa2FuLXNkay0xLjQuMzEzLjAKLS0tCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgIHwgIDEgKwogcGFja2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbiAgICAgICB8ICA4ICsrKysr
KysrCiBwYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNoIHwgIDMgKysrCiBwYWNrYWdl
L3Z1bGthbi1zZGsvdnVsa2FuLXNkay5tayAgIHwgMTggKysrKysrKysrKysrKysrKysrCiA0IGZp
bGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3Z1bGthbi1zZGsvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS92dWxrYW4t
c2RrL3Z1bGthbi1zZGsuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdnVsa2FuLXNk
ay92dWxrYW4tc2RrLm1rCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdl
L0NvbmZpZy5pbgppbmRleCA1NzliNWZmYzg3Li4yZGI1NTUzNTBkIDEwMDY0NAotLS0gYS9wYWNr
YWdlL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL0NvbmZpZy5pbgpAQCAtMzc1LDYgKzM3NSw3IEBA
IGNvbW1lbnQgIkdyYXBoaWMgbGlicmFyaWVzIgogCXNvdXJjZSAicGFja2FnZS90ay9Db25maWcu
aW4iCiAJc291cmNlICJwYWNrYWdlL3Z1bGthbi1oZWFkZXJzL0NvbmZpZy5pbiIKIAlzb3VyY2Ug
InBhY2thZ2UvdnVsa2FuLWxvYWRlci9Db25maWcuaW4iCisJc291cmNlICJwYWNrYWdlL3Z1bGth
bi1zZGsvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmlu
IgogCiBjb21tZW50ICJPdGhlciBHVUlzIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS92dWxrYW4tc2Rr
L0NvbmZpZy5pbiBiL3BhY2thZ2UvdnVsa2FuLXNkay9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMDViZGEyMzdiYgotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2UvdnVsa2FuLXNkay9Db25maWcuaW4KQEAgLTAsMCArMSw4IEBACitjb25maWcgQlIyX1BB
Q0tBR0VfVlVMS0FOX1NESworCWJvb2wgInZ1bGthbi1zZGsiCisJc2VsZWN0IEJSMl9QQUNLQUdF
X1ZVTEtBTl9IRUFERVJTCisKKwloZWxwCisJICBUaGUgVnVsa2FuIG1ldGEtbG9hZGVyCisKKwkg
IGh0dHBzOi8vZ2l0aHViLmNvbS96ZXV4L3ZvbGsKZGlmZiAtLWdpdCBhL3BhY2thZ2UvdnVsa2Fu
LXNkay92dWxrYW4tc2RrLmhhc2ggYi9wYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNo
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmYwZjNkYTBlNzkKLS0tIC9k
ZXYvbnVsbAorKysgYi9wYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNoCkBAIC0wLDAg
KzEsMyBAQAorIyBMb2NhbGx5IGNhbGN1bGF0ZWQKK3NoYTI1NiAgZDg2YmNmMWFmZjQ5OWY0MWEz
ZTQ0NWI1NWRmNWUzOTNhNWNlNDliMWJkYTY4OWViNzMzNWIwYTBhNTRhM2MwYiAgdnVsa2FuLXNk
ay0xLjQuMzEzLjAudGFyLmd6CitzaGEyNTYgIDMzYzgzMWY3NmI3OTUwMTY2NWU2NmMyM2FjOGY4
NzYwMjA0NTdjMjE2ZDQ0NTI2YThmNzQ3ZGE4OTc5OTliMzUgIExJQ0VOU0UubWQKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2RrLm1rIGIvcGFja2FnZS92dWxrYW4tc2Rr
L3Z1bGthbi1zZGsubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMDUw
ZjZjMDNmMwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvdnVsa2FuLXNkay92dWxrYW4tc2Rr
Lm1rCkBAIC0wLDAgKzEsMTggQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHZ1bGth
bi1zZGsKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1ZVTEtBTl9TREtfVkVSU0lPTiA9
IDEuNC4zMTMuMAorVlVMS0FOX1NES19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3pldXgvdm9s
ay9hcmNoaXZlL3JlZnMvdGFncworVlVMS0FOX1NES19TT1VSQ0U9IHZ1bGthbi1zZGstJChWVUxL
QU5fU0RLX1ZFUlNJT04pLnRhci5negorVlVMS0FOX1NES19MSUNFTlNFID0gTUlUCitWVUxLQU5f
U0RLX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCitWVUxLQU5fU0RLX0lOU1RBTExfU1RBR0lO
RyA9IFlFUworCitWVUxLQU5fU0RLX0RFUEVOREVOQ0lFUyA9IHZ1bGthbi1oZWFkZXJzCisKK1ZV
TEtBTl9TREtfQ09ORl9PUFRTICs9IC1EVk9MS19JTlNUQUxMPU9OCisKKyQoZXZhbCAkKGNtYWtl
LXBhY2thZ2UpKQotLSAKMi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
