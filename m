Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53AFC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 11:53:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DC4284036;
	Wed,  6 Aug 2025 11:53:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFN456MGHyef; Wed,  6 Aug 2025 11:53:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C18DF8417F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C18DF8417F;
	Wed,  6 Aug 2025 11:53:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EC1931
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E087409A3
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PFAil-bvaS0s for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 11:53:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A696401CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A696401CC
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A696401CC
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 11:53:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4538bc52a8dso41571245e9.2
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 04:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754481196; x=1755085996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rsvvz2Xuj8bshm+T5fm76y3WEMb0R0xUAyWQRsreW5U=;
 b=b2nGyrFq0avHf5dmiH12X7TydGkd/DJSl5Pit0ixiVXPoaIjKacFpdC4GSJncXUzzR
 dvSgU6QttOCj8Z92mTxNs7WVInOUwfY3WGcOyg+51S+0g+7lGu6Vc2iG3fiFEavxRsU2
 +85BXfiEW6mOMjnw7UBNZlHJkrTmaUXZisllmqwfUXjj8PGu820TJxzePmVz+frEc85z
 RjQjUVlDOuRbkf17zbDly2ugVgj+K9s30By0NYpGI0HwI7kVDZ51+hbgWBManVy56XpH
 fq2zQIYDesArMsuuCQ1IzHnqByGNIPJsZtH17wRoQpqqXSkqBn4NV224hTIKsdSKLkgb
 rI2Q==
X-Gm-Message-State: AOJu0Ywv6UY054a6/rUY/Ct5Ne0/U7wqyUzVOTkE3mjQe/rNSkFXLdK8
 vE/U1M3PUbgHfzrbZiuQCp9WNnlSMhHooDy+sYPqBZh72nzJDFbkOLPTUCJbDv2813sR1RNiQOQ
 ou+p1
X-Gm-Gg: ASbGncv7xCOVqNips3/7CrtHAGQyBR2jm+sYMvwG5564e3S0QRSUnWfN0aewfpAiDdb
 MI5cWm1Xm8IkKeiyUkKtQ+/ierut/noT8VU+wNsoEo1HBis3mPr8LpgBGxRThlXxg7sTp3nx1DK
 Gs7REUe+rrp6/Wfk/bqJzbJ0DXvb/cs85sCZ7Y1ytmR0R1ODUM7Ud761//wl2YLhYugnB//R2dT
 0lwGHkqUkoJgZjlohiTvFJyuBcArdg/tYZ7FtMHIbLTb98Y9X+2dSV7YtUzGfN5EwvANhlI6CQC
 fVRhfOTPyMpKL+eCFjKvMxFDzPfTxWwh6Hc1yAMmyEqKxon0dqNc8TkocBvPqjW3FXw0pDrQRYi
 X4qckunMttYyfgrjRToJT9AtY6yRoRudYYsSpuP2bNEGdatb2kF6/wPPMuG//8V0a2n8nvRoC+n
 DRjWaU+aE3IJTWi1+MGg==
X-Google-Smtp-Source: AGHT+IF1zUeUBww/jgown2yiMOVneMqqBChTEvhNrQ7lF/QpkapNehFT43zegBhW9SZLixFAnNbv6w==
X-Received: by 2002:a05:600c:46cb:b0:456:19b2:6aa8 with SMTP id
 5b1f17b1804b1-459e70eec16mr24975935e9.19.1754481196243; 
 Wed, 06 Aug 2025 04:53:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 ([2001:b07:6474:ebbf:3f96:8759:f916:8982])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed07fsm142606555e9.22.2025.08.06.04.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 04:53:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  6 Aug 2025 13:52:15 +0200
Message-ID: <20250806115219.3307438-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1754481196; x=1755085996;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rsvvz2Xuj8bshm+T5fm76y3WEMb0R0xUAyWQRsreW5U=;
 b=oydTvj36Hr+TfrXxciJ2Uq4LGS4G/LmRHU7vZ+tp2qr0cU0st/eJHnYpEspHF2mQZH
 uhnfzIWVitimmwlKYBUvOjpdkniKkf4LZDNEVYwRP+aSx4+KR8fZLtU4FtnBLIHzc5WA
 Wt/nSky61imb9ZzkkTsyqodzG13CmOM+w1LEY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=oydTvj36
Subject: [Buildroot] [RFC PATCH 0/4] Support qmake for Qt6
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The series supports qmake for qt6.

As stated in https://doc.qt.io/qt-6/qt6-buildsystem.html:

  "This only affects users that want to build Qt from sources.
   You can still use qmake as a build tool for your applications."

This series revives an older patch that exported qmake for Qt6,
applying a minimal fix. It extends pkg-qmake to support Qt6 and uses
qwt as a test case to validate the changes.

The series is marked as RFC because hardcoding the Qt5 and Qt6 version
numbers in pkg-qmake is not ideal, even if the Qt5 versions were
already hardcoded.

An alternative approach could be to add a BR2_PACKAGE_QT{5,6}_VERSION_VALUE
option, but this can be discussed during review.

Dario Binacchi (3):
  package/qwt: bump to version 6.3.0
  package/pkg-qmake: support Qt6
  package/qwt: enable build with Qt6

Jesse Van Gavere (1):
  package/qt6: Add qmake functionality

 package/pkg-qmake.mk                |  21 +-
 package/qt6/qt6.mk                  |  18 ++
 package/qt6/qt6base/qmake.conf.in   |  36 +++
 package/qt6/qt6base/qplatformdefs.h |   1 +
 package/qt6/qt6base/qt.conf.in      |   7 +
 package/qt6/qt6base/qt6base.mk      |  18 ++
 package/qt6/qt6base/qt6base.mk.save | 455 ++++++++++++++++++++++++++++
 package/qwt/Config.in               |  22 +-
 package/qwt/qwt.hash                |   8 +-
 package/qwt/qwt.mk                  |   6 +-
 10 files changed, 574 insertions(+), 18 deletions(-)
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in
 create mode 100644 package/qt6/qt6base/qt6base.mk.save

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
