Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55141CAC58F
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EE94426FE;
	Thu, 11 Sep 2025 21:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPNL8Nno_T4c; Thu, 11 Sep 2025 21:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A029426FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A029426FF;
	Thu, 11 Sep 2025 21:28:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF63925B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9608461132
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jpg7bg1Zfv3 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8198260B3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8198260B3C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8198260B3C
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:27:59 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3e7428c4cbdso887771f8f.0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 14:27:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757626077; x=1758230877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ARVmGrFKYXwZLwlCVuKBky2CFtf/tzO/HRZaAfdTHU=;
 b=E7GH4T39pV2jb4DsAfhvqvXI8mnZn9v7hThYzRmzWbw9nqJjKf+shD0dopVK28vOnC
 ama0WH3r7ptyj5vygTctqXsTLo7/kxjT4ha5cw0Zfw1oFkJdBmGAY0n+R+EBqAKktI7P
 cIri0zbMsEuF8eHb8o2nGdpj2BYsSYvZNkzAK9mNTb0Fq+HynL7+u5berLDVb9MtBok9
 rJck+RVNnvmPxjmKeRkKNrZTjwcWPxfwaCpXZUr8B5d2ce5pXI+hjnQy21Mi5QI0nRr0
 djznpndRfyWdx/nWdulJ+VVKUGJFHU8d3G3Bxmsb8VSeN+4bIKLdNyGoexuWdc/2i/ct
 T2vQ==
X-Gm-Message-State: AOJu0YzehN0p9nLJSuVVNEMN+WHM6y/DNQYXwBKWU3GE6RS6upMl/IYI
 xtSq8301Ycw3kElA1X+vSV3dpRarYtaTW15Moe1/3Vm7lclBlzXfEzAkLRTbxmGISS11KCC44eb
 ePtoKAJw=
X-Gm-Gg: ASbGncu2Q6E0d07xYIXm+50Omj9/7SiG1Q/DFt6I9cGvsTHygedWbDK+UPkqHVZPWMj
 YvG5LoMbUps/cn6lWisFLQ4+n9sPgTRnzwToiQwpFVGivju0DnnwKTHohhI53UXrOQyVfBr3ZRa
 T94vo/4hIjrJFFSvqmCrlsKkLGaugBy0pV+VpyMhWD1tWuMzgohok4SNZL0ZLOx2+Jisw8E2L6L
 COefCfZLuL7q6geUZ5v33w48UnzlzULMrz1Yh2DfJq6VMoxl0jy+QStJ0dmtIExsaKss62925Df
 fmqi+bRKf8/gS/FsBeQe/rmDaUQ3vcD462PO81aSwcNFU6uDkCM/uRKnci6wZCqD47HifInzIFX
 f/rGsXX7qccqqe+zcoCYnsXY=
X-Google-Smtp-Source: AGHT+IHG3c8NOz5Jc21sofTwQPTpznAxpn71zlwYtcbOLT1BmeTtsZM/I7UdWtFiqq2IM1Ff6CS5lA==
X-Received: by 2002:a05:6000:2d83:b0:3d0:e221:892e with SMTP id
 ffacd0b85a97d-3e765a2368bmr471994f8f.27.1757626076597; 
 Thu, 11 Sep 2025 14:27:56 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e760776bb8sm4042776f8f.3.2025.09.11.14.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 14:27:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 990AF5F89D;
 Thu, 11 Sep 2025 22:27:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:27:45 +0100
Message-ID: <20250911212752.266940-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250911212752.266940-1-alex.bennee@linaro.org>
References: <20250911212752.266940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757626077; x=1758230877; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ARVmGrFKYXwZLwlCVuKBky2CFtf/tzO/HRZaAfdTHU=;
 b=bilk6c8wqp2n7tkuuQ88krwU2XBRmMbec+PlhSLkNy+md7QgtkolRC326fWKt9zZGg
 lnmrkBGzxTqbHU3mQUeGhB5uu/K17s01qyhJb3siwAYIw1UlkF190Pl4anyzfnngAcg/
 hpHIS1/x48/H/Ui7ybrtbv8pnFg9x23DXbwDlZ0g4sL+QagGtV3ZAJ6sN7YPUAoKhJLm
 4JGXZ2/2H6xI72G2KsOWxwRjcGRNh9WBEj8TqVyjjYkI/YJS9XgeXh7LThNXykQ/8Qvo
 YJtsyZqIJjmQikqjBRXrP7wMRIf6eUA38a9VZDpSgqgWkMrwZfQ0r+GJeHsiZKLZoYI/
 Ua3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bilk6c8w
Subject: [Buildroot] [PATCH v5 5/9] package/kvm-unit-tests: bump to
 v2025-07-31
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
Cc: Thomas Huth <huth@tuxfamily.org>, Thomas Huth <th.huth+br@posteo.eu>,
 Cyril Bur <cyrilbur@gmail.com>, Jesse Taube <jesse@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIHRvIHRoZSBjdXJyZW50IHZlcnNpb24gb2YgS1ZNIHVuaXQgdGVzdHMuIFRoZSBtYWlu
IGNoYW5nZQpzaW5jZSB0aGUgbGFzdCBjaGVjayBwb2ludCBpcyBzdXBwb3J0IGZvciBrdm10b29s
IHRvIGxhdW5jaCB0ZXN0cy4KClJldmlld2VkLWJ5OiBKZXNzZSBUYXViZSA8amVzc2VAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5Lm9yZz4KU2ln
bmVkLW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoKLS0tCnYz
CiAgLSByZXdvcmQgY29tbWl0CiAgLSBtb3ZlIHRvIGN1cnJlbnQgbWFzdGVyIHNvIHdlIGNhbiB1
c2Uga3ZtdG9vbCBhcyB3ZWxsCiAgLSBkaWRuJ3QgYXBwbHkgdGhfaHV0aCdzIHItYiBhcyBtb3Zl
ZCB0byBtYXN0ZXIKdjQKICAtIGNoYW5nZSBmcm9tIHNuYXBzaG90IHRvIHYyMDI1LTA3LTMxCiAg
LSByZXdvcmQgY29tbWl0IG1lc3NhZ2UgYWdhaW4KLS0tCiBwYWNrYWdlL2t2bS11bml0LXRlc3Rz
L2t2bS11bml0LXRlc3RzLmhhc2ggfCAyICstCiBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11
bml0LXRlc3RzLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11
bml0LXRlc3RzLmhhc2ggYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhh
c2gKaW5kZXggYWQwOTIyZGY1OS4uNmZiN2RlYTJjNiAxMDA2NDQKLS0tIGEvcGFja2FnZS9rdm0t
dW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoCisrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVz
dHMva3ZtLXVuaXQtdGVzdHMuaGFzaApAQCAtMSw0ICsxLDQgQEAKICMgTG9jYWxseSBjb21wdXRl
ZAotc2hhMjU2ICA2MDAxNWIwMjNmMzQyNjFjMTM0ZDcxNGY0NjcwOTI2YWM4MTQ4M2UyODZhMTY0
NzVlYjRhNWNlZGFiMDBlZWZhICBrdm0tdW5pdC10ZXN0cy12MjAyNS0wNi0wNS50YXIuYnoyCitz
aGEyNTYgIDgwNTJlMWY3MGJmYjNiMGM4OTRiOGVmNzFlMzg0N2Y1MzNiM2Q5NTcyNzdkZDA0YjMy
NzBmMzMzMzJkNDE3MGIgIGt2bS11bml0LXRlc3RzLXYyMDI1LTA3LTMxLnRhci5iejIKIHNoYTI1
NiAgYjNjOWNhOWUyNTdmMmVhYWUwNzBjZjBjY2RmODc3MDc2NGYwNWE5NDdhMzlhODM1ZTYzMzQx
Mzc1MGE1Nzc3YiAgQ09QWVJJR0hUCiBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRk
OGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIExJQ0VOU0UKZGlmZiAtLWdp
dCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsgYi9wYWNrYWdlL2t2
bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rCmluZGV4IDFlZDkwMmIxYTAuLjFkN2VlYzJk
MjEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsK
KysrIGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUtWTV9VTklUX1RFU1RTX1ZFUlNJ
T04gPSAyMDI1LTA2LTA1CitLVk1fVU5JVF9URVNUU19WRVJTSU9OID0gMjAyNS0wNy0zMQogS1ZN
X1VOSVRfVEVTVFNfU09VUkNFID0ga3ZtLXVuaXQtdGVzdHMtdiQoS1ZNX1VOSVRfVEVTVFNfVkVS
U0lPTikudGFyLmJ6MgogS1ZNX1VOSVRfVEVTVFNfU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9r
dm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy8tL2FyY2hpdmUvdiQoS1ZNX1VOSVRfVEVTVFNf
VkVSU0lPTikKIEtWTV9VTklUX1RFU1RTX0xJQ0VOU0UgPSBHUEwtMi4wLCBMR1BMLTIuMAotLSAK
Mi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
