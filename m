Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CCFC54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 14:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37DC360852;
	Sat, 28 Jun 2025 14:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqCKeDbfmTQv; Sat, 28 Jun 2025 14:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80FFE6083C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80FFE6083C;
	Sat, 28 Jun 2025 14:06:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 906BDAF7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8234F400BD
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XS60ZcSRZjXQ for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 14:06:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 538B24008E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 538B24008E
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 538B24008E
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 14:06:08 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-553dceb345eso869619e87.1
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 07:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751119566; x=1751724366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8y/byGfon/C2cqy6ktYfpMqRdAdneEWPcmqMp19xYe4=;
 b=bk8YZbOdkxG4INDrnYIyJPdKcipoz7KlXE1dAFFcvZqn0IFoJbWbDD/H9S137Rbwz9
 LTS2i6CFD1qn+JFvWKq5dvP9UTCJWMTRUKQE2X8Z5pkFdjQo60L2Jwpw70dqGDfZNzAQ
 3PbSbWahoN9pm6Ne0YgnJ5fn4JP1dgiRUcIJH8i4ZN20i3wP/RsJFQs6gFulYQZEpJ2U
 cLJjyParKVma3mZDRcUfjus/mOywPUdolK1raz4O12gd39QHXhuQMu5EEH3fV/w80xEH
 ghUdQPLaJ7NyDBiOZ7set9X0PRJZIVwvYx8tqnCAdbpHx0++gmIK+rSWT3b6u/FIEsz9
 mJaA==
X-Gm-Message-State: AOJu0YwTIo07SFcpHD+mahCc6laZSorwt+ZhRmnhacPnP3VFGbE12HW1
 ta8amHdrpUb4vYPJ19BkeTSL1vEJ4cxfEm4IOk1P3GHDHyBvd/LlwJxMLigF1g==
X-Gm-Gg: ASbGnctLEJrgOoDoJZeEeaz453fU9SOOWzCgP1wrmMbyZWQ7noukNQSQiSdk/XjQtjY
 6yo+2oQaeooxw8PtDus/h0XNl56s9YFoNKwV0EDjlIOfI7P+S7tTo4poV5HyonsJLOpPC8OOjbx
 /gDFd/H+k4h3bT7O+k4SBYfS9P00HxF/YIrkC5+4G95hS6jdHItuyIMSQW1PEAvemLWW4KHKUcv
 b4f00Sry32+HaPqYO0aLVWu6gU9TUeSOMwq0FmGrrf1+EJ7WYX/8DN08rNNQQnbDfXZRrG18YLx
 xUZeITFqDHxpp0MuZZAb/QjAIWQlOXH8dcbNyloTm/Wf92XBA6Pn+C1qN7gommaUVTg0BfmrsFN
 755zi2vtqrFiGShI5FWE6
X-Google-Smtp-Source: AGHT+IEdOLnOoahgoY+zQgS3oQLPCAtNSCyDfD2+iCN4wldF0i9Ph6Mxa63D+NGY8pIOgG4WTvtJOg==
X-Received: by 2002:a05:6512:e96:b0:553:314e:81f7 with SMTP id
 2adb3069b0e04-5550b817b57mr2616560e87.17.1751119565732; 
 Sat, 28 Jun 2025 07:06:05 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b2b8d6dsm814507e87.109.2025.06.28.07.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 07:06:04 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Jun 2025 16:05:46 +0200
Message-ID: <20250628140550.4030996-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751119566; x=1751724366; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8y/byGfon/C2cqy6ktYfpMqRdAdneEWPcmqMp19xYe4=;
 b=PHtc+TZwwImNyQ1cjoYGabhsQw8PpTPAIgpxXY0lQkc5YqNnjzdHRoej3fInQ64eiV
 +iCQm7fniJe/Lf5tuWJk9RPRRjXguflZDERe0GW/yGE/dhv5O6vUTD2gAnrRT8UtM0zD
 Ui0Md9Nqg09SoH1x3FVEbSK3BDHd09SaHEzhV6zhkOPVmkZGdYM1xKIxOGxSqIYFAzWs
 MjlvbBECUKE/6N46w/pru4A6+zvhSW5XM7ZYG1Ma4JxpPeWzAZ3CCM8KME4mkULZIsgV
 m0NGsqV7Ns/oSAOw+iwCixPyR/qrjeDg2fMG/Mj8bzAwq+3u2qXu7Hk3c4lE0HwTgHc3
 ytDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PHtc+TZw
Subject: [Buildroot] [RFC 0/2] Add qt6webchannel and qt6webengine packages
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I'm in the process of adding packages for Qt6 WebEngine and Qt6 WebChannel.
Reviews and testing will be appreciated.

This builds on the qt6.9.1 series available on Patchwork.

Roy Kollen Svendsen (2):
  package/qt6/qt6webchannel: new package
  package/qt6/qt6webengine: new package

 package/qt6/Config.in                         |   2 +
 package/qt6/qt6webchannel/Config.in           |   7 +
 package/qt6/qt6webchannel/qt6webchannel.hash  |   9 +
 package/qt6/qt6webchannel/qt6webchannel.mk    |  38 ++
 ...ld-in-buildroot-caused-by-duplicated.patch |  25 ++
 package/qt6/qt6webengine/Config.in            |  79 ++++
 package/qt6/qt6webengine/qt6webengine.hash    |  15 +
 package/qt6/qt6webengine/qt6webengine.mk      | 417 ++++++++++++++++++
 8 files changed, 592 insertions(+)
 create mode 100644 package/qt6/qt6webchannel/Config.in
 create mode 100644 package/qt6/qt6webchannel/qt6webchannel.hash
 create mode 100644 package/qt6/qt6webchannel/qt6webchannel.mk
 create mode 100644 package/qt6/qt6webengine/0001-fix-chromium-build-in-buildroot-caused-by-duplicated.patch
 create mode 100644 package/qt6/qt6webengine/Config.in
 create mode 100644 package/qt6/qt6webengine/qt6webengine.hash
 create mode 100644 package/qt6/qt6webengine/qt6webengine.mk

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
