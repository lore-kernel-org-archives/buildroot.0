Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F09C61D90
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 19:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65FBF81F44;
	Tue, 21 Nov 2023 19:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65FBF81F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yb16R1Q_8Nps; Tue, 21 Nov 2023 19:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77E498146D;
	Tue, 21 Nov 2023 19:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77E498146D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C867F1BF30C
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 19:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FB5981452
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 19:35:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FB5981452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-dHA5DkBUub for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 19:35:05 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E6DF813DA
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 19:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E6DF813DA
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2c887d1fb8fso23493351fa.0
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 11:35:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700595302; x=1701200102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HX/I6tXr8OhsrnEAiijyouHOGCHmRevmKh++OfeWseU=;
 b=TlOBaFvrh47/UTiKAAFzKQRwfEg295YCa5sa/5VI+HAnW+CnWsVB/9ECgSNZ5sc6MY
 Hs2RslYMxEN4VVPvMq0fATevMHZ71ROJAtVzj8+pB06v9+bgGnLFZ5+u1M+o715SCDsA
 j1bJEYZILVeLkaxJV+Sci+3+RSoGiq8awC/Y9WNSarkWmjqn+lkX564XLqogrernx5i/
 A/P1Go/h380q/ZLir3//04caV+lhgWfcLI5QDQd1gP2dFDHtlk5XnYGxUgN3+rahvRv1
 Ia2M/WjhXv/GMFtBjvzFLCdyGuKRThgvs4OotFe7RzFiknf+3nRvEgM+37T06M8/KW72
 5hog==
X-Gm-Message-State: AOJu0Yyr39n0YD1vJcNwawJSkmygR9keJB/ZZScnO6hbG3TfQZqVsa5H
 pWrAZ8wAkiWofpGlC4UUj3X31jfy25PDIKPEwRs=
X-Google-Smtp-Source: AGHT+IHsVgRbybl3/o19PwA6U3aKp93MucFH3zZuQHSDANxeQ3+XcGBh8caQflaAt7HKmVw4pvYelQ==
X-Received: by 2002:a2e:9582:0:b0:2c5:f8e:35cf with SMTP id
 w2-20020a2e9582000000b002c50f8e35cfmr118337ljh.20.1700595302589; 
 Tue, 21 Nov 2023 11:35:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b0040a44179a88sm21879043wmf.42.2023.11.21.11.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 11:35:02 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 20:34:46 +0100
Message-ID: <20231121193448.1151936-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231121193448.1151936-1-gael.portay@rtone.fr>
References: <20231121193448.1151936-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700595302; x=1701200102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HX/I6tXr8OhsrnEAiijyouHOGCHmRevmKh++OfeWseU=;
 b=J17Rg4q7MKm7AHpBfOQrj1xSzLiXJJNJ3E96+Lr0QVCgxAL5n3/bOayO2lEub4ELZ3
 7qgxl12/7ccEybn/rJG5A1a++4c71gb3SYWrMyC6t43BioBLBmF+O5vyz4LpTg6OxViy
 TSjW7DH4p7AM2IRn+LP6PQlt/vkU8SRB2PRTc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=J17Rg4q7
Subject: [Buildroot] [v1 2/4] package/rpi-firmware: bump version for pi5
 support
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
Cc: Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBidW1wcyB0byA3ZTljMjA2M2ZjMTUyNzRmYmM0ZGFiMWNhNjE0ZjkyMjg4MzRkODgxWzFd
IHRoYXQgc3RhdGVzCiJBZGQgc3VwcG9ydCBmb3IgUEkgNSIuCgpTaWduZWQtb2ZmLWJ5OiBHYcOr
bCBQT1JUQVkgPGdhZWwucG9ydGF5QHJ0b25lLmZyPgotLS0KIHBhY2thZ2UvcnBpLWZpcm13YXJl
L3JwaS1maXJtd2FyZS5oYXNoIHwgMiArLQogcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13
YXJlLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUu
aGFzaCBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoCmluZGV4IGVjMTMx
MTVmM2IuLjY1OTYxMzU5MWQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1m
aXJtd2FyZS5oYXNoCisrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNo
CkBAIC0xLDMgKzEsMyBAQAogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDMzYWVhMmNiOWMz
YmU5NGMzZGQ2YTk2ZmJiMzQ0M2VlZTVhZjFkYzVmYzkxNDBlMWZhZGM1MDgzMjk4MzA2NGUgIHJw
aS1maXJtd2FyZS0zZjIwYjgzMmIyN2NkNzMwZGViNjQxOWI1NzBmMzFhOTgxNjdlZWY2LnRhci5n
egorc2hhMjU2ICBmMzQ0MmZiODA5NjZmYWYxZTI4YTMyZjlkOWI5MWFjYjRiODdjNmZmMzNmMGNl
ZDQxNzllYzZjY2JmYTkyYzY1ICBycGktZmlybXdhcmUtN2U5YzIwNjNmYzE1Mjc0ZmJjNGRhYjFj
YTYxNGY5MjI4ODM0ZDg4MS50YXIuZ3oKIHNoYTI1NiAgYzcyODNmZjUxZjg2M2Q5M2EyNzVjNjZl
M2I0Y2IwODAyMWE1ZGQ0ZDhjMWU3YWNjNDdkODcyZmJlNTJkM2Q2YiAgYm9vdC9MSUNFTkNFLmJy
b2FkY29tCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsg
Yi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKaW5kZXggNTNkNmQ4Y2EwNi4u
ZTc2NWQwZWE4MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJl
Lm1rCisrKyBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawpAQCAtNCw3ICs0
LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgotUlBJX0ZJUk1XQVJFX1ZFUlNJT04g
PSAzZjIwYjgzMmIyN2NkNzMwZGViNjQxOWI1NzBmMzFhOTgxNjdlZWY2CitSUElfRklSTVdBUkVf
VkVSU0lPTiA9IDdlOWMyMDYzZmMxNTI3NGZiYzRkYWIxY2E2MTRmOTIyODgzNGQ4ODEKIFJQSV9G
SVJNV0FSRV9TSVRFID0gJChjYWxsIGdpdGh1YixyYXNwYmVycnlwaSxmaXJtd2FyZSwkKFJQSV9G
SVJNV0FSRV9WRVJTSU9OKSkKIFJQSV9GSVJNV0FSRV9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCiBS
UElfRklSTVdBUkVfTElDRU5TRV9GSUxFUyA9IGJvb3QvTElDRU5DRS5icm9hZGNvbQotLQoyLjQy
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
