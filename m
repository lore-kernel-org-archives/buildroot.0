Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAA8CA0FF0
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 20:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E5F283EB7;
	Mon,  1 Sep 2025 20:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3OzBkv3TSti; Mon,  1 Sep 2025 20:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1177D83EA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1177D83EA8;
	Mon,  1 Sep 2025 20:32:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D3581A6
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DC7F4039D
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZPWolFHE7xq for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 20:32:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B084405AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B084405AC
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B084405AC
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 20:32:46 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61cc281171cso7956822a12.0
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 13:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756758765; x=1757363565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=34lHZpYuhPJmg7pJ/CuGrbX9x2eF2XT3pNmFbol1hWk=;
 b=o0APrdmu2e4FDr/jd7ivVfifA6QEiOARc8UmN7aFZwZklDm0bHasZ5hiWcVgZDZXIF
 QHQaWSl+SeXiD7rLXE/1l1uSH/MeInO3DDRSsiWVcUDPb4+mixF7VH76U35rT+PXdisV
 oItp5sqa/amJAmPzmn4coN6YeijUSUqANjbx3cX2VLK4lEW9gdjcM7B2/nv1bO80M6Rn
 W3JN5l05Nrf1eyuEy/oOYyG4sBWY/j2iOJX4204asw3mK57lBIlYnLZNHdUn2OZ0m9HF
 rwRakQDi4J4sIJcXE7E1Nf8z1ZwHkq1szVMY4r4ojAniNB5MTLZna9SbnAHJb9DauQr6
 yPxg==
X-Gm-Message-State: AOJu0Yz5g/Wxn24Q0MrsNqAgcQ3MfKiTRSPoWKUoV9HHOoPLY/y9qsVg
 jW34gn9WWKTmKKF4+SGnPMBX2HXCfSkVYigFWxR7caLHiQzO91B3lFJTSyNOoyH9vONru3k+1K1
 EQcpr
X-Gm-Gg: ASbGncs8Ohbada4a2B744CmVVt33A29cnMWh3cbWgctOjyxFLO36M+89l53YhHxU0Z7
 68yB5li0N+3F7ghnS5P6Ns7dy5b3ZvGe1i9Xl7Anew8WzADSvx4GbZTbn/vUBb9b+hKEXKeUBoF
 7KAbzcC9f886sf5uJuAwQnEDgTJDUgnFJ2vR2TffmOePCDWAWM7JGp70jvIaJ3D5aPh6FoHJyR2
 WBYdGegiogiWaet3UJxzOZsxwAk1Yi1tROepomFJCy6TSCQsQbzKHxiLqpI3JbVMLfohKqos0e+
 9AA9Holb4dBWbqXLhbmIJbQKxOfQ3tEwWR60xRSnrvAKjWIc7pVOuzR8/MkTTOWGGc2xqx8FpPA
 VknhHyTvIzuMKLxr1w+OtQ2BUd5ol9ejmEcwvHaP8tfXlbInBusqflHw64S1wL58nCHbmy6ejNy
 VWhVzl/50wCQw=
X-Google-Smtp-Source: AGHT+IH7oV6+e5epbOfhhndxnDnhPQrTCLxYaee+8oV8itq6kGqekUbxKf5StHhyoEzOgyQUrEOhOw==
X-Received: by 2002:a17:907:5c1:b0:afe:d2e1:9018 with SMTP id
 a640c23a62f3a-b01d8c86721mr941034166b.25.1756758764537; 
 Mon, 01 Sep 2025 13:32:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.39])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0411bf1b09sm553530166b.79.2025.09.01.13.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 13:32:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  1 Sep 2025 22:32:05 +0200
Message-ID: <20250901203210.804061-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1756758765; x=1757363565;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=34lHZpYuhPJmg7pJ/CuGrbX9x2eF2XT3pNmFbol1hWk=;
 b=nxec8f9wDgGMCv8hVg+s23BoWaS7icLn2p35mmyprdXU7h1MfJfbwoCIMtt1a1VUdA
 ZpjJ0vP9WHYwwCHNzZ8Ur4e1dB5D2kj98yvpMsvKCxEhXWWt4Pj61xdRTy7coDNote7o
 kTa++2tPunwEsxLuzOAIbWcaLRp6X9LbTNMSM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=nxec8f9w
Subject: [Buildroot] [RFC v4 0/5] Support qmake for Qt6
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
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard Genoud <richard.genoud@bootlin.com>,
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
qwt and cutekeyboard as test cases to validate the changes.

The series is marked as RFC because hardcoding the Qt5 and Qt6 version
numbers in pkg-qmake is not ideal, even if the Qt5 versions were
already hardcoded.

An alternative approach could be to add a BR2_PACKAGE_QT{5,6}_VERSION_VALUE
option, but this can be discussed during review.

Dario Binacchi (4):
  package/qwt: bump to version 6.3.0
  package/pkg-qmake: support Qt6
  package/qwt: enable build with Qt6
  package/cutekeyboard: enable build with Qt6

Jesse Van Gavere (1):
  package/qt6: Add qmake functionality

 package/cutekeyboard/Config.in       | 13 +++++++----
 package/cutekeyboard/cutekeyboard.mk |  6 ++++-
 package/pkg-qmake.mk                 | 21 +++++++++++++----
 package/qt6/qt6.mk                   | 12 ++++++++++
 package/qt6/qt6base/qmake.conf       | 34 ++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h  |  1 +
 package/qt6/qt6base/qt.conf.in       |  7 ++++++
 package/qt6/qt6base/qt6base.mk       | 17 ++++++++++++++
 package/qwt/Config.in                | 22 +++++++++++-------
 package/qwt/qwt.hash                 |  8 +++----
 package/qwt/qwt.mk                   |  6 ++++-
 11 files changed, 123 insertions(+), 24 deletions(-)
 create mode 100644 package/qt6/qt6base/qmake.conf
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
