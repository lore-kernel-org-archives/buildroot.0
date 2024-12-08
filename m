Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5DAE77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 21:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D12FF605F9;
	Sun,  8 Dec 2024 21:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7F2f-uLPolGf; Sun,  8 Dec 2024 21:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1F6E60608
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F6E60608;
	Sun,  8 Dec 2024 21:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB279ED2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C0C340282
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl0Mk1wBviWB for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 21:48:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B2D8F40273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D8F40273
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2D8F40273
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:48:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5401bd6ccadso659977e87.2
 for <buildroot@buildroot.org>; Sun, 08 Dec 2024 13:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733694481; x=1734299281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pRyRgfNSB9kBODvCSObzaWTR68OiW+YRoDIptoKzABM=;
 b=oJ3qmKqspNfXQRKb4zsvZtPayp2WDb6g1VlG4ItfRF0AYtx63UibiU753bFhTTAgGd
 McYZNe8zEf0HF0TD918ICekkue3Vvg9Ll3d8QAJBYDmssQxAY79Rusl9i3/pyAc/PVMo
 JJQ9zwlb8LCP7MiGypOYsHLtdudHmCthyrzR2mzbkIK1IsF0tRYjwNHYo3HC6mbYrLYk
 QhuwYNUyEO6RtArUoKJRNDYNAgWR6teVLY4FySbdYsNbH6EjmXSaPUrpcmzW6tkQSAwc
 OX/Y+qUn5YiRSXCjhXMts5nn/rVmFqdkNI2nevJPn52A/kptPH4oKXfBD1cppQL3N8Tz
 ULeA==
X-Gm-Message-State: AOJu0YzqLtJSHa8MoBne7zm2NepGwuaAdBJtQBwoAf12gHOR7FESLrPK
 KGSjGj+TGmgJQiTrixR3UWobDgB9ZSfhpFhHfHqJICKfmHbwAw+Ivs1BHw==
X-Gm-Gg: ASbGnctyPYmIWm+d7iy/Lx7YoD4xrPh6RkxbvsfXwFRHUjXrSJpzaf/cUzUMajQKP43
 gSHHQQpDaH41XRf82v67OaS2VvMza02EsT25T6pv7rFVTvijUaM8BvifrhikG0lhxrlWN+gioqY
 RpXyXI/VVEBY1mznjgKL0ddKJTcF6crqeyDYCmVN97G4MhG7iFb+cjhEBoSb6z40OiEjZ6sMA7y
 qt6VOhchHxqf2Rl0UjamPu4/LTQbhR2LCOrADIfi7ZFUGD1drul3IX3VX8O
X-Google-Smtp-Source: AGHT+IExQm9sp0Go60ZWJ3/b7fLLonk6qjLo85hYpRp5jui5TiCEeBSl+ki88eQeBi/ix93No0QYCw==
X-Received: by 2002:a05:6512:3087:b0:53d:f6fd:515e with SMTP id
 2adb3069b0e04-53e2c2b1afamr3440136e87.4.1733694480503; 
 Sun, 08 Dec 2024 13:48:00 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-54020798a43sm49328e87.12.2024.12.08.13.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 13:47:58 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon,  9 Dec 2024 00:46:16 +0300
Message-ID: <20241208214748.524923-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733694481; x=1734299281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pRyRgfNSB9kBODvCSObzaWTR68OiW+YRoDIptoKzABM=;
 b=QEP2ZUsEaySnrLeHcCS49cK8ZFwL75rEgPfF8XbRLUvKeOFZLQZFMH7OztnG754OPj
 lXLsarsv0xH4iLQcf5wSjwITHwvdqTKxeloR0+xgMOvr3DDDHf8f6eWpxucKch6ft25f
 wop+Ti7j62AOeSdtAFxDTidNDtMcvoSa+iambjUau/TfrntAIgp47wBZmzC21qtNGJfo
 6luQE7+uUemF2ggC9gDtlHTg/s9vc5Rkos4PRSutUCs+DRDkTXTAhgqW4zJ+08VFNaVM
 Vedh+EE20byQXB0oTjR+kWcpr+cy+b1eAmrd61kOjIPWkdNkIuOwFcYZBI3olp2AsqgG
 2ukw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QEP2ZUsE
Subject: [Buildroot] [PATCH 0/3] {linux, linux-headers}: add support for 6.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Bernd, and all

I have been waiting for the new LTS Linux v6.12 in Buildroot to start
sending Christmas updates for some of my OrangePi boards. Now v6.12.3
is already available, but the latest kernel is still have 6.11.x.
So I decided to undertake a copy-paste exercise using the latest kernel
and headers update series by Bernd. Hope I didn't miss a thing taking
into account that this is a new LTS.

Regards,
Sergey

Sergey Matyukevich (3):
  {toolchain, linux-headers}: add support for 6.12 headers
  linux: bump latest version to 6.12
  package/linux-headers: drop 6.11.x option

 Config.in.legacy                                 |  7 +++++++
 linux/Config.in                                  |  6 +++---
 linux/linux.hash                                 |  2 +-
 package/linux-headers/Config.in.host             | 16 ++++++++++------
 toolchain/Config.in                              |  5 +++++
 .../toolchain-external-custom/Config.in.options  |  6 +++++-
 6 files changed, 31 insertions(+), 11 deletions(-)

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
