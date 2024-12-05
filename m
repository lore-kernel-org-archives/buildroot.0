Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11100E7716E
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 17:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2D6881336;
	Thu,  5 Dec 2024 17:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTEnOHxikCiD; Thu,  5 Dec 2024 17:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2963849B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2963849B1;
	Thu,  5 Dec 2024 17:37:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A90D21FDB
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84FC6416E2
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zfB--ncIxNEu for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 17:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44FB8416DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44FB8416DA
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44FB8416DA
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 17:36:49 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-434a2033562so11879455e9.1
 for <buildroot@buildroot.org>; Thu, 05 Dec 2024 09:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733420208; x=1734025008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bWvhLSyYIFd/v/mVWJ51tXA40Jrakic4hDmWfJ1XD3Y=;
 b=VLKglaiORILUGHgFf+AYra3PRmmBJoqHF/izirYP8uy1vpSGlklEWncyzYUDwWNtTA
 l75+mGgXZLcgRozeontLz4xGDpQPE9/Sqbzsd4I0hOsnjaJZYVi5vyHzRyQt3XPfd6Rp
 vu6lcJcrOjtq8USrkqr5+XdNbRp8K1/lxXlORvv5wU7BUF7T4U3dJl94TFs+PwUuCUBA
 iuAh+Zo76lNeIu04EncP18u8Vj1R8GY2t+SHEhHY4s93F8iqunbLzCWuhgYuZjHZ+eiQ
 xEibWCMTifkGimIHtqdsUMeMERKTkOys1n6b/2NZ2y88oPderlCXT/7CIC4tSjci8L/g
 XH+w==
X-Gm-Message-State: AOJu0YyxhMZDFsvKsowaTsaWGhuavJPUSlhdaRtCCcQzuiBqcktPHcCW
 M0h5OaYGlRwXOf3oaN6dLiy/IL0sgYNyRy8owVhmyUijW9/qWJhIJINPWEsIWiFXisCb7r1DKOk
 sQd4=
X-Gm-Gg: ASbGnctsrFHcUJtc/IkK0B2GN79nxuQ5cltfptlFO8L8x+QKnjSHMePVLC+Leu/GbW1
 7ntrvykzoDjDpGFHLscgPlRTAkk+SxkFVc8tic2V6Jv4omEnxrrm5Ur6UEV07vopyDYgmzm/fUY
 nm60U9KI/fj7LIP4jePBxztXSpVfUWOJRLsenLvMbnr+lo5V6MhHYeVM8qXwj8KawTlJDvopaoO
 Upu3tGJABVcwinuqAiP5YE3xjJ+BjMkfBSLPzD4Dj0tqxrB
X-Google-Smtp-Source: AGHT+IHaHTNrGsmjuHwMZoqd5HwXOsJ3RmujpdKC38Tk7im4aosHHJLtd7E6+k1xRSOOn+8bH17voQ==
X-Received: by 2002:a05:600c:3581:b0:434:a4a6:51ee with SMTP id
 5b1f17b1804b1-434ddeba5d9mr1432535e9.16.1733420207868; 
 Thu, 05 Dec 2024 09:36:47 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d526b312sm69582965e9.6.2024.12.05.09.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2024 09:36:45 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 4585D5F9FB;
 Thu,  5 Dec 2024 17:36:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu,  5 Dec 2024 17:36:43 +0000
Message-Id: <20241205173643.2334343-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205173643.2334343-1-alex.bennee@linaro.org>
References: <20241205173643.2334343-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733420208; x=1734025008; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bWvhLSyYIFd/v/mVWJ51tXA40Jrakic4hDmWfJ1XD3Y=;
 b=a14Umkj2JTUGTbDNVnZmElKGSCzfri2leYpthlxoDe0jybzSWqgv5lVrbXq0dsyzz2
 vf2324cAB6+besO9/L2ZujCdWvNbDoUDOYrSCzdvFI4c5RB0m7C9FhuDVBTmrA0wLzhQ
 tmVWd8xiRNuKF56mTsSS/vQ2exlWGUVL7pTgIuRvTOs8LMtbmGi0OWoQt0SniYRGmE09
 ND3g7Wy/AMEzdfQ1wsqAbTFtcE2NTkPCuGDrCa9DfWrVUWG2QdQgf9yCoLRu1ZU50WOH
 LEZfQojWmMT82v2fqjD4h6/6OqNsdZdRqGw7h7uslXJS4TZ4cUwYWfrrTne7UgwcuHfK
 Rzsw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=a14Umkj2
Subject: [Buildroot] [PATCH v2 4/4] support/testing: add test for vkmark
 package (PENDING!)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gdGVzdCB2a21hcmsgd2UgbmVlZCBhIGhlYWRsZXNzIFdlc3RvbiBjb21wb3NpdG9yIHNvIHdl
IGNhbiBydW4gdGhlCnRlc3Qgd2l0aG91dCBtZXNzaW5nIGFyb3VuZCB3aXRoIGFjdHVhbCBkaXNw
bGF5cy4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4KCi0tLQpDdXJyZW50bHkgdGhpcyB3b24ndCB3b3JrIHdpdGggdGhlIGhvc3QgUUVNVS4gWW91
IHdpbGwgbmVlZCBRRU1VIDkuMi4wCndpdGggYSBtb2Rlcm4gdmlyZ2xyZW5kZXJlciAoYXMgaW4g
VHJpeGllKSB0byBleHBvc2UgdGhlIFZ1bGthbiBHUFUgdG8KdGhlIGd1ZXN0LgotLS0KIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfdmttYXJrLnB5IHwgNzUgKysrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF92a21hcmsucHkKCmRpZmYg
LS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay5weSBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfdmttYXJrLnB5Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjllZWJkZDk4OWIKLS0tIC9kZXYvbnVsbAorKysgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3ZrbWFyay5weQpAQCAtMCwwICsxLDc1
IEBACitpbXBvcnQgb3MKKworaW1wb3J0IGluZnJhLmJhc2V0ZXN0CisKK1ZVTEtBTklORk9fVElN
RU9VVCA9IDEyMAorCisKK2NsYXNzIFRlc3RWa01hcmsoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToK
KyAgICBjb25maWcgPSBcCisgICAgICAgICIiIgorICAgICAgICBCUjJfYWFyY2g2ND15CisgICAg
ICAgIEJSMl9jb3J0ZXhfYTc2PXkKKyAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cisg
ICAgICAgIEJSMl9ST09URlNfREVWSUNFX0NSRUFUSU9OX0RZTkFNSUNfRVVERVY9eQorICAgICAg
ICBCUjJfUk9PVEZTX01FUkdFRF9VU1I9eQorICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKKyAg
ICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0VfQ1VTVE9NX0NPTkZJRz15CisgICAgICAgIEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC9s
aW51eC5jb25maWciCisgICAgICAgIEJSMl9QQUNLQUdFX0dMTUFSSzI9eQorICAgICAgICBCUjJf
UEFDS0FHRV9WS01BUks9eQorICAgICAgICBCUjJfUEFDS0FHRV9NRVNBM0Q9eQorICAgICAgICBC
UjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfVklSR0w9eQorICAgICAgICBCUjJfUEFD
S0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9WSVJUSU89eQorICAgICAgICBCUjJfUEFDS0FHRV9N
RVNBM0RfT1BFTkdMX0dMWD15CisgICAgICAgIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfRVM9
eQorICAgICAgICBCUjJfUEFDS0FHRV9XRVNUT049eQorICAgICAgICBCUjJfUEFDS0FHRV9XRVNU
T05fSEVBRExFU1M9eQorICAgICAgICBCUjJfUEFDS0FHRV9XRVNUT05fWFdBWUxBTkQ9eQorICAg
ICAgICBCUjJfUEFDS0FHRV9YT1JHNz15CisgICAgICAgIEJSMl9QQUNLQUdFX0RCVVM9eQorICAg
ICAgICBCUjJfUEFDS0FHRV9MSUJNRD15CisgICAgICAgIEJSMl9QQUNLQUdFX0xJQlNDUllQVD15
CisgICAgICAgIEJSMl9QQUNLQUdFX0xJQlhDUllQVD15CisgICAgICAgIEJSMl9QQUNLQUdFX09Q
RU5TU0w9eQorICAgICAgICBCUjJfUEFDS0FHRV9MSUJEUk1fSU5URUw9eQorICAgICAgICBCUjJf
UEFDS0FHRV9MSUJEUk1fUkFERU9OPXkKKyAgICAgICAgQlIyX1BBQ0tBR0VfTElCRVBPWFk9eQor
ICAgICAgICBCUjJfUEFDS0FHRV9ZQUpMPXkKKyAgICAgICAgQlIyX1BBQ0tBR0VfVVRJTF9MSU5V
WF9CSU5BUklFUz15CisgICAgICAgIEJSMl9QQUNLQUdFX1VUSUxfTElOVVhfQUdFVFRZPXkKKyAg
ICAgICAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0eUFNQTAiCisgICAgICAgIEJS
Ml9UQVJHRVRfUk9PVEZTX0VYVDI9eQorICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19FWFQyX1NJ
WkU9IjI1ME0iCisgICAgICAgIEJSMl9ST09URlNfT1ZFUkxBWT0ie30iCisgICAgICAgICIiIi5m
b3JtYXQoCisgICAgICAgICAgaW5mcmEuZmlsZXBhdGgoInRlc3RzL3BhY2thZ2UvdGVzdF92a21h
cmsvcm9vdGZzLW92ZXJsYXkiKSkKKworICAgIGRlZiBsb2dpbihzZWxmKToKKyAgICAgICAgaW1n
ID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmV4dDIiKQor
ICAgICAgICBrZXJuID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiYnpJ
bWFnZSIpCisgICAgICAgICMgZ2x4aW5mbyBvdmVyYWxsb2NhdGUgbWVtb3J5IGFuZCB0aGUgbWlu
aW11bSB0aGF0IHNlZW1lZCB0byB3b3JrIHdhcyA1MTJNQgorICAgICAgICBzZWxmLmVtdWxhdG9y
LmJvb3QoYXJjaD0iYWFyY2g2NCIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWw9
a2VybiwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbF9jbWRsaW5lPVsicm9vdD0v
ZGV2L3ZkYSBjb25zb2xlPXR0eUFNQTAiXSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG9w
dGlvbnM9WyItTSIsICJ2aXJ0IiwgIi1jcHUiLCAiY29ydGV4LWE3NiIsICItbSIsICI1MTIiLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIi1kcml2ZSIsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAiZmlsZT17fSxpZj12aXJ0aW8sZm9ybWF0PXJhdyIu
Zm9ybWF0KGltZyksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLWRldmlj
ZSB2aXJ0aW8tZ3B1LWdsLXBjaSxob3N0bWVtPTRHIl0pCisKKyAgICAgICAgIyB3aGVuIGJ1aWxk
cm9vdCdzIFFFTVUgZ2V0cyBWZW51cyBzdXBwb3J0ICItZGV2aWNlIHZpcnRpby1ncHUtZ2wtcGNp
LGhvc3RtZW09NEcsYmxvYj1vbix2ZW51cz1vbiJdKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmxv
Z2luKCkKKworICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKKyAgICAgICAgc2VsZi5sb2dpbigpCisK
KyAgICAgICAgIyBUaGUgdGVzdCBjYXNlIHZlcmlmaWVzIHRoYXQgdGhlIHhzZXJ2ZXIgd2l0aCBH
TFggaXMgd29ya2luZworICAgICAgICBjbWQgPSAid2VzdG9uIC1CIGhlYWRsZXNzIC0tcmVuZGVy
ZXIgZ2wgLS1zaGVsbCBraW9zayAtLSB2a21hcmsiCisgICAgICAgIG91dHB1dCwgZXhpdF9jb2Rl
ID0gc2VsZi5lbXVsYXRvci5ydW4oY21kLCBWVUxLQU5JTkZPX1RJTUVPVVQpCisKKyAgICAgICAg
c2VsZi5hc3NlcnRFcXVhbChleGl0X2NvZGUsIDApCisgICAgICAgIGZvdW5kX3ZlbnVzID0gRmFs
c2UKKyAgICAgICAgZm9yIGxpbmUgaW4gb3V0cHV0OgorICAgICAgICAgICAgZm91bmRfdmVudXMg
fD0gIlZpcnRpby1HUFUgVmVudXMiIGluIGxpbmUKKworICAgICAgICBzZWxmLmFzc2VydEVxdWFs
KGZvdW5kX3ZlbnVzLCBUcnVlKQotLSAKMi4zOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
