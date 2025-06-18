Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF255C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 14:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A960A40913;
	Wed, 18 Jun 2025 14:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6l_PNya6GUC4; Wed, 18 Jun 2025 14:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE558408EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE558408EC;
	Wed, 18 Jun 2025 14:28:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 698F816B
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FFD380801
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJlQIf1VKgN3 for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 14:28:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3CD03807E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CD03807E6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3CD03807E6
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 14:28:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-453066fad06so52811765e9.2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 07:28:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750256908; x=1750861708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6W4lrm96nYfJwnzAIVh8Y7vIDT/A4AmgKbdlAjyGiG4=;
 b=aqfS2Ltu8QcK9ez9Od1I0XzD21eQGJyNW8XYmX5bQT3HSrZUmHMoFI1RqnaxCAz+kR
 +BAc8H7TnTzUGn06QGlo9xTRAflszil4BoYm20z9MsZ6QaFiLXlmPkwmA9FhrxFokxbC
 W3HUMGtyXwO+2zgwh3nVKPTUCh9FueXElwCTy1y2KeX7pmBeguYVDxxNcYKulOdZTVj6
 bmQiqDI7XnIoPEhLbLDvyva+e87samklHUl32LFOs4Rk6Ah79ioDWjvT+Ru7PoF0MQ7q
 GfV6/BZqUGi0zdBHnrtwlXJMFDW9uzF1FglZzT0edZGe4sI3PqOXXMLOJmZTlepaLctB
 SREw==
X-Gm-Message-State: AOJu0Yyb9or+lljJELJGJ316I4TYUy3jpur0SX17j/SxysfE/ODvb2KL
 hOW4O0mf2YS8ObA7/3HY0mKe3CZ3qYPJTQxCBwwBDc5mu98okLd2D1FHcZDBYj+QiVyMG2dp6DQ
 fu+sIXuk=
X-Gm-Gg: ASbGncvfsrchWy+/l4xcpHA5mOWlLk5YC56/Tq4eQbatIrP58+hfC1X2IFMiGaWWrlX
 Fifbmt81B5gI4N9T4c6QOdK1u8oxp1eJTz1niKaYNrAbBAc1yXwLNwuVmPs6h9yRprBmL3GeF7R
 nWK3HMgn9H6vCt/gOv/nI9ou/y6x8Ai9dpF8RiD9emAsFNDmqjn/bo9Jh/vwt/qMXQsOzcqTTnA
 HiOeM0uqF0kdKpDzLjAWBvqZ52idEFwqNQ4Irv7QFXGLZ7Ml3Pu+0kSOKNWyFHA4M2DCL4MOumd
 O7q4G1WTX1XHBlUKyLKLigoFrVxn9xOzZVU4+lfFCON0UUVgCktdvIly1lBdHdo=
X-Google-Smtp-Source: AGHT+IG5zHgAi70+8u1oOCsJSH1PUuYwNo5LWM11PUK/2efzzYy0frnO4Y4I3rbtz3U8qI4FUzLWBA==
X-Received: by 2002:a05:600c:5248:b0:43c:f81d:34 with SMTP id
 5b1f17b1804b1-4533ca4fa68mr169444595e9.9.1750256908313; 
 Wed, 18 Jun 2025 07:28:28 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e256630sm214769435e9.29.2025.06.18.07.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:28:26 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 69BBF5F878;
 Wed, 18 Jun 2025 15:28:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 18 Jun 2025 15:28:19 +0100
Message-ID: <20250618142825.758131-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750256908; x=1750861708; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6W4lrm96nYfJwnzAIVh8Y7vIDT/A4AmgKbdlAjyGiG4=;
 b=oroA1P/ygbAZ4r9GSbyvA1kJwzRt8HY0XnokOTcuSAMLted6jy0qZd3fJvP+FGJ/dy
 RL7o4wAJ7vNMVInHfboA1APY6skgPILQlXFIaG3dWFUy/gzMfZs0dMdGnFogrVEWZadk
 dFK89U10LPWK3xidLGCwE1vh1Bbf1Kt9g9eKEwppdYiMCaF+uXZS8CCk3cLrargYh3sx
 BTHiUSCF2W24m/rAa7t/JgRehhndCpj2FXTuzVv5OlUbhf6TfZ6hXQ64cmG9JVgpi5E6
 Zo1Ceg8UzXJzqVk65TbyzMfNbCGHq7vDPgrjU1oieYplVlFTFpxwm5g4Vej7PXhLm6YR
 +etw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oroA1P/y
Subject: [Buildroot] [PATCH v7 0/4] Add vkmark graphics benchmarking tool
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

SGksCgpOb3cgdGhhdCB0aGUgTWVzYSBiaXRzIGhhdmUgYmVlbiBtZXJnZWQgdGhlIHNlcmllcyBp
cyBjb25zaWRlcmFibHkKc2hvcnRlci4gSSd2ZSB1cC1yZXZ2ZWQgYSB2dWxrYW4taGVhZGVyL2xv
YWRlci90b29scyBsaWJyYXJ5IHdoaWNoCmFsc28gc2VlbXMgdG8gaGF2ZSBzb2x2ZWQgc29tZSBv
ZiB0aGUgY3Jvc3MgYnVpbGRpbmcgYml0cyBzbyBJIG5vCmxvbmdlciBuZWVkIHRoZSBoYWNreSBw
YXRjaC4KCkkndmUgYWxzbyBzaW1wbGlmaWVkIHRoZSBUZXN0VmtNYXJrIHRlc3Qgc28gaXQgd2ls
bCB3b3JrIHdpdGggYW4KdW4tYWNjZWxlcmF0ZWQgZGlzcGxheSBhbmQgc2ltcGx5IHRlc3Qgdmtt
YXJrIHdvcmtzLgoKRm9yIHY3CiAgLSByZWJhc2UKICAtIGRyb3AgcGF0Y2hlcyBub3cgbWVyZ2Vk
IHVwc3RyZWFtCiAgLSBhZGRyZXNzIHRlc3QtcGtnIGZhaWx1cmVzIHdpdGggbW9yZSBkZXBzCiAg
LSBkcm9wIG1lc2EzZCBidW1wCgpGb3IgdjUKICAtIHJlYmFzZQogIC0gZHJvcCB1bm5lZWRlZCBw
YXRjaGVzCiAgLSBkcm9wIGFscmVhZHkgbWVyZ2VkIHBhdGNoZXMKICAtIHR3ZWFrIHRoZSB0ZXN0
CiAgLSBpbmNsdWRlIGh0dHBzOi8vZ2l0aHViLmNvbS92a21hcmsvdmttYXJrL3B1bGwvNzYgcGF0
Y2hlcwoKRm9yIHY0CiAgLSBuZXcgcGF0Y2ggdG8gdmttYXJrIHRvIHJ1biB1bmRlciBWaXJ0SU8K
ICAtIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIG90aGVyIHVwZGF0ZXMKCkZvciB2MwogIC0g
cmUtYmFzZWQgb24gY3VycmVudCBtYXN0ZXIKICAtIG5ldyB2dWxrYW4tc2RrIHBhY2thZ2UgKGZv
ciB2b2xrIGxvYWRlcikKICAtIGJ1bXAgdnVsa2FuIHN1cHBvcnQgdG8gMS40LjMwNwogIC0gaW5j
bHVkZSBpc3lzdGVtIHBhdGNoIChtYXliZSBzcXVhc2ggd2l0aCBePykKICAtIHZrbWFyayBub3cg
aGFzIGEgdGFnZ2VkIHJlbGVhc2UgKDIwMjUuMDEpCiAgLSBhZGRyZXNzZWQgcmV2aWV3IGNvbW1l
bnRzIChzZWUgaW5kaXZpZHVhbCBwYXRjaGVzKQoKRm9yIHYyCiAgLSBhZGRlZCBTT0ZUUElQRSBm
aXhlcyAodGhlc2UgbmVlZCBtZXJnaW5nIGludG8gQmVybmQncyBzZXJpZXMpCiAgLSBhZGRyZXNz
ZWQgcmVtYWluaW5nIGNvbW1lbnRzIGZvciBkZXBlbmRlbmNpZXMKICAtIHR3ZWFrZWQgYSBmZXcg
bW9yZSBkZXBlbmRhbmNpZXMKICAtIGFkZGVkIGEgdmttYXJrIHRlc3QKCldoaWxlIHRoZSB2a21h
cmsgdGVzdCB3aWxsIGhhcHBpbHkgcnVuIHdpdGggbHZwaXBlIHN3IHJlbmRlcmluZyB5b3UKd2ls
bCBuZWVkIGEgcmVjZW50IFFFTVUgOS4yLjArIChyZWxlYXNlZCAxMS8xMi8yMDI0KSBidWlsdCB3
aXRoIGFuIHVwdG8KZGF0ZSB2aXJnbHJlbmRlcmVyIChhdmFpbGFibGUgaW4gRGViaWFuIFRyaXhp
ZS9UZXN0aW5nKS4KCkkgcGxhbiB0byB1c2UgYnVpbGRyb290IGdlbmVyYXRlZCBpbWFnZXMgZm9y
IFFFTVUncyBvd24gZnVuY3Rpb25hbAp0ZXN0cyBmb3IgVmVudXMuCgpJJ3ZlIHJ1biB0aHJvdWdo
OgoKICAgdXRpbHMvZG9ja2VyLXJ1biBtYWtlIGNoZWNrLXBhY2thZ2UKCmFuZCBldmVyeXRoaW5n
IGxvb2tzIGNsZWFuLiBGdWxsIGRldGFpbHMgYWJvdXQgdGhlIGNoYW5nZXMgYXJlIGJlbGxvdwp0
aGUgLS0tJ3MgaW4gdGhlIGluZGl2aWR1YWwgY29tbWl0cy4KCkFsZXggQmVubsOpZSAoNCk6CiAg
cGFja2FnZS92dWxrYW4tc2RrOiBuZXcgcGFja2FnZQogIHBhY2thZ2UvdnVsa2FuLVtoZWFkZXJz
fGxvYWRlcnx0b29sc106IGJ1bXAgdG8gMS40LjMxNyByZWxlYXNlCiAgcGFja2FnZS92a21hcms6
IGFkZCB2a21hcmsgYmVuY2htYXJraW5nIHRvb2wKICBzdXBwb3J0L3Rlc3Rpbmc6IGFkZCB0ZXN0
IGZvciB2a21hcmsgcGFja2FnZQoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICsKIHBhY2thZ2UvdmttYXJrL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICB8IDQ4ICsrKysrKysrKysrCiBwYWNrYWdlL3ZrbWFyay92a21hcmsuaGFzaCAgICAgICAg
ICAgICAgICAgICAgfCAgMyArCiBwYWNrYWdlL3ZrbWFyay92a21hcmsubWsgICAgICAgICAgICAg
ICAgICAgICAgfCAzNCArKysrKysrKwogcGFja2FnZS92dWxrYW4taGVhZGVycy92dWxrYW4taGVh
ZGVycy5oYXNoICAgIHwgIDIgKy0KIHBhY2thZ2UvdnVsa2FuLWhlYWRlcnMvdnVsa2FuLWhlYWRl
cnMubWsgICAgICB8ICAyICstCiBwYWNrYWdlL3Z1bGthbi1sb2FkZXIvdnVsa2FuLWxvYWRlci5o
YXNoICAgICAgfCAgMiArLQogcGFja2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgIHwgMTIgKysrCiBwYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5oYXNoICAgICAg
ICAgICAgfCAgMyArCiBwYWNrYWdlL3Z1bGthbi1zZGsvdnVsa2FuLXNkay5tayAgICAgICAgICAg
ICAgfCAxOCArKysrKwogcGFja2FnZS92dWxrYW4tdG9vbHMvQ29uZmlnLmluICAgICAgICAgICAg
ICAgIHwgIDUgKy0KIHBhY2thZ2UvdnVsa2FuLXRvb2xzL3Z1bGthbi10b29scy5oYXNoICAgICAg
ICB8ICAyICstCiBwYWNrYWdlL3Z1bGthbi10b29scy92dWxrYW4tdG9vbHMubWsgICAgICAgICAg
fCAgMyArLQogc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5ICAgICAgICAgICAgIHwg
IDQgKy0KIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfdmttYXJrLnB5ICB8IDgw
ICsrKysrKysrKysrKysrKysrKysKIC4uLi9ldGMvcHJvZmlsZS5kLzEwLXhkZy1ydW50aW1lLnNo
ICAgICAgICAgICB8ICAxICsKIDE3IGZpbGVzIGNoYW5nZWQsIDIxNiBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdmttYXJrL0NvbmZpZy5p
bgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdmttYXJrL3ZrbWFyay5oYXNoCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS92a21hcmsvdmttYXJrLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS92dWxrYW4tc2RrL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
dnVsa2FuLXNkay92dWxrYW4tc2RrLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Z1
bGthbi1zZGsvdnVsa2FuLXNkay5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfdmttYXJrLnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF92a21hcmsvcm9vdGZzLW92ZXJsYXkvZXRjL3By
b2ZpbGUuZC8xMC14ZGctcnVudGltZS5zaAoKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
