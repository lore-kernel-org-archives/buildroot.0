Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E439C3064D
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 13:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDBC6820CE;
	Tue,  2 Jul 2024 13:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1mYzqf2Afp8; Tue,  2 Jul 2024 13:37:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 043598210B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 043598210B;
	Tue,  2 Jul 2024 13:37:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 58B021BF313
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:37:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4229260BB6
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 13:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CTGcRyXAXpN for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 13:37:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C8E6E60BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8E6E60BA1
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8E6E60BA1
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 13:37:01 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58b447c513aso1095953a12.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 06:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719927419; x=1720532219;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2e2nTwTPlWAqGliBlWMjMaIexTa1UASw5WM/DGk1g4=;
 b=jcgOkEAWdEhaB6Kk0Oljm76IQxx5BumRYEmsuQld7FfxQIydTsH9GVvGqv6wWorI3F
 9C2ksL+GtdIfUKPtCt7clCx0/QGqmn+6OJ5N53LwrYBWtv+338i+r6/BXJeTmmxKmW1u
 BXMtfB+j0/fmRaDX+OF5lpipDDznTuQE6ZQYLR543dUzhzka6A6RMX9oBnGNRm1Dy/hU
 gVROtomczzLUJwf4RtFx5lszJLozA8pMS9FUZ0AwxGaUmhPqxQOsN6IxlzNjlncvtAYt
 AlEFQ++vZZOxQxkwIAAmFB4f6jMyZSrpAVeUde2EFIQHWi5Jxz4VLGLcnbr05lGkkfSc
 E6hg==
X-Gm-Message-State: AOJu0Yw8h5a9kQXzFUxTvkLJIsy9+QMq9dJSP1Qu7eyB9DvUPhpww4Hd
 FgB4857/PJ766XB1M/VJnGvNnXWH/9ag9SNsqxuQkhm60fwvsdpf4nms1sCEvz1TnZbK3FOpRnY
 P6Pk=
X-Google-Smtp-Source: AGHT+IER7fo6T9KH6LygppatMguaSP6bJGIQc9KmwNZ5YU/7wxBQHXNfcmyfqlpJLmp0XimCz7+AwQ==
X-Received: by 2002:a05:6402:5113:b0:58a:d4f4:e866 with SMTP id
 4fb4d7f45d1cf-58ad4f4e9afmr2505873a12.6.1719927419381; 
 Tue, 02 Jul 2024 06:36:59 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c733:f73f:670d:ca47])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58614f3d51asm5682813a12.81.2024.07.02.06.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 06:36:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 15:36:55 +0200
Message-ID: <20240702133655.2425922-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702133655.2425922-1-dario.binacchi@amarulasolutions.com>
References: <20240702133655.2425922-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719927419; x=1720532219;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2e2nTwTPlWAqGliBlWMjMaIexTa1UASw5WM/DGk1g4=;
 b=ENgehxXP3VEt+P5xinVDROqt/U9tWmstzqyFHa9oH03ReuPiyk74iRrgPLVONJPAta
 LxiyI5m6YChdVRADPVIhuUPcizPp8KYEMU3nG7OaJgxNdYyWRrwoP2ZOp0VZhZ5J0b8H
 SokxNV3AcrgoU2TkuPF2YDQgClU1TJLm3d9uA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ENgehxXP
Subject: [Buildroot] [PATCH 2/2] package/libmad: drop GCC's "-fforce-mem"
 option
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGNvbW1pdCBmaXhlcyB0aGUgZm9sbG93aW5nIGNvbXBpbGF0aW9uIGVycm9yOgoKICAgIGk2
ODYtYnVpbGRyb290LWxpbnV4LWdudS1nY2MuYnJfcmVhbDogZXJyb3I6IHVucmVjb2duaXplZCBj
b21tYW5kLWxpbmUgb3B0aW9uIOKAmC1mZm9yY2UtbWVt4oCZCgpGcm9tIEdDQyA0LjMgcmVsZWFz
ZSBub3RlcyBbMV06CgogICAgVGhlIC1mZm9yY2UtbWVtIG9wdGlvbiBoYXMgYmVlbiByZW1vdmVk
IGJlY2F1c2UgaXQgaGFzIGhhZCBubyBlZmZlY3QKICAgIGluIHRoZSBsYXN0IGZldyBHQ0MgcmVs
ZWFzZXMuCgpbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9nY2MtNC4zL2NoYW5nZXMuaHRtbApTaWdu
ZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Ci0tLQogLi4uLzAwMDMtZHJvcC1HQ0MtZmZvcmNlLW1lbS1vcHRpb24ucGF0Y2ggICAg
ICB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYm1hZC8wMDAzLWRyb3AtR0NDLWZmb3Jj
ZS1tZW0tb3B0aW9uLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtYWQvMDAwMy1kcm9w
LUdDQy1mZm9yY2UtbWVtLW9wdGlvbi5wYXRjaCBiL3BhY2thZ2UvbGlibWFkLzAwMDMtZHJvcC1H
Q0MtZmZvcmNlLW1lbS1vcHRpb24ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMDAwLi5kYzgzMmFjNzA1MTQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xpYm1h
ZC8wMDAzLWRyb3AtR0NDLWZmb3JjZS1tZW0tb3B0aW9uLnBhdGNoCkBAIC0wLDAgKzEsMTggQEAK
K2NvbmZpZ3VyZS5hYzogZHJvcCBHQ0MgIi1mZm9yY2UtbWVtIiBvcHRpb24gCisKK0FzIHJlcG9y
dGVkIGF0IFsxXSwgdGhlIG9wdGlvbiBoYXMgYmVlbiByZW1vdmVkIGZyb20gdmVyc2lvbiA0LjMg
b2YgR0NDLgorCitbMV0gaHR0cHM6Ly9lei5hbmFsb2cuY29tL2RzcC9zb2Z0d2FyZS1hbmQtZGV2
ZWxvcG1lbnQtdG9vbHMvbGludXgtYmxhY2tmaW4vbGludXgtYnVnLWFyY2hpdmUvdy9kb2N1bWVu
dHMvNzQ2MC81NjI2LWJ1aWxkLWxpYi1tYWQtZmFpbC1hdC1vcHRpb24tLWZmb3JjZS1tZW0td2l0
aC1nY2MtNC0zCitTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlA
YW1hcnVsYXNvbHV0aW9ucy5jb20+CitVcHN0cmVhbTogTi9BIFtCdWlsZHJvb3Qgc3BlY2lmaWNd
CisKKy0tLSBsaWJtYWQtMC4xNS4xYi1vcmlnL2NvbmZpZ3VyZS5hYwkyMDI0LTA3LTAyIDE0OjI2
OjQwLjY1Nzk4NDc5MSArMDIwMAorKysrIGxpYm1hZC0wLjE1LjFiL2NvbmZpZ3VyZS5hYwkyMDI0
LTA3LTAyIDE0OjI3OjA3LjA5ODE5ODk5NyArMDIwMAorQEAgLTE0MCw3ICsxNDAsNiBAQAorICAg
ICBjYXNlICIkb3B0aW1pemUiIGluCisgCS1PfCItTyAiKikKKyAJICAgIG9wdGltaXplPSItTyIK
Ky0JICAgIG9wdGltaXplPSIkb3B0aW1pemUgLWZmb3JjZS1tZW0iCisgCSAgICBvcHRpbWl6ZT0i
JG9wdGltaXplIC1mZm9yY2UtYWRkciIKKyAJICAgIDogI3ggb3B0aW1pemU9IiRvcHRpbWl6ZSAt
ZmlubGluZS1mdW5jdGlvbnMiCisgCSAgICA6ICMtIG9wdGltaXplPSIkb3B0aW1pemUgLWZzdHJl
bmd0aC1yZWR1Y2UiCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
