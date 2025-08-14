Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC34CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 15:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED2EF60B8F;
	Thu, 14 Aug 2025 15:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4F4o8aUmKLg8; Thu, 14 Aug 2025 15:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07498608E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07498608E7;
	Thu, 14 Aug 2025 15:33:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25C27271
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B8540DDD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fcCJQshRqO3 for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 15:33:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FFDE40EE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FFDE40EE4
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FFDE40EE4
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 15:33:20 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7a2befdso167238166b.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 08:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755185599; x=1755790399;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nlQEuqvY8AJy9AIEY77qLMukR5dPU6gtBv6K6fSiY6U=;
 b=qSIvqTfaZScuqdUwA9yWTkczPKD2Y6BFTUhL0OGRCvG8yscMp4S9Lt35CxempA7tNO
 W30GAobfh/EGuAKpxLHiaj5WdginPyAm/FqzHQBPJVXBdXuWUqOS62AsFYhO3rlx6lQ9
 wQJD6YpfhaeRHhTNdJunYlligg6lXNXvlGZJzW5WaRE0XrjhF6DaM/TCfOD9MRMS065p
 /a6XLIOgbim7U14LqqMCyYZHts/gZheQ5yLMRjmEmh4mStAMRahyEvTHNrqXUr/PEL6X
 fsHWQJ03Yfoewa1fbp3sK6mCE2yk+PSYkHBXgq6M2soY/49P8zKHG8l7HmcLBL8UrGiW
 h/EQ==
X-Gm-Message-State: AOJu0YxHRYA8pSJ1iLaK4AY6aGugCfobZg5Ar9pl7F1Y6lKafCZZVuWq
 HJ7rqxOps1Qwx3VDjpoDLw/xeCbYYpKdiLNJy5aWCNsuHFPKeJM5caO9f8o99ooWvHRCmWJb20O
 Nn5IauJc=
X-Gm-Gg: ASbGnctv5U8fQtqJ28ZvpKIawfQ5ZyP8WJIODWEyREOnNMhcmSCcefCRlCU7EcYVTNA
 NNat7I1DfcUSC+ccWj+0KGo9D2WmWOPqHgQaL/qKauFbMby7sey6pLC77uQ8g2vPgczBIt8JsiL
 lytMyyoD/1cl5fwvC0w+fCpQv+yMTIHnzN8n181nwLf/5N4C1SS1w1ecxCe6o4CAh1IxZBOeWlM
 pzEOiSFlEdnQDkcZjtkGpkoiL+QD0gwy4z0GqsZYRpZbbPoxBCDxep7KB78uRVBtoZlIx8NS/q8
 /Xzi6dv3iPCe1olYDKWtXAiXNNQGAhn/Y26I7L+Jk9b/jBvCsr+ifCE50G+v49PF2kFF/WpPGdu
 1HDxTCSf4aR8wMxqMiO2Xtck89uCfDczsNmrVhZo1ZNHK29b8VrqCpdqzsAYWc0W5f8oawoz8V7
 tz
X-Google-Smtp-Source: AGHT+IHYgQ+wgWr+IkBz1OxWq1FSphH4/vY30jH481dtWiuqVsw+VO4P/xX3N1kx+RLXKjpMzZ0uRA==
X-Received: by 2002:a17:907:8294:b0:af9:7b49:c0 with SMTP id
 a640c23a62f3a-afcb98cf5bemr266155966b.29.1755185598745; 
 Thu, 14 Aug 2025 08:33:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:9b30:e43:d6cd:c58f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c022sm2561928966b.101.2025.08.14.08.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 08:33:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 17:32:54 +0200
Message-ID: <20250814153259.6822-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755185599; x=1755790399;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nlQEuqvY8AJy9AIEY77qLMukR5dPU6gtBv6K6fSiY6U=;
 b=AsCNaNEbO8ht22bwUE445Pi9n8q1TZ65akkn1FbKsb0umM44SzxBWEr+AR6pju6VzW
 S8PusD0Wvlt+WuwukuibgGZ5V0AVnzL7KOUrwKNsZPTux7fwYmMgTskKs+l/PQINCOJv
 idXQSi1VntadTHG3yIYPxxz6BfyA7an2HyMxw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=AsCNaNEb
Subject: [Buildroot] [RFC v3 0/5] Support qmake for Qt6
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

 package/cutekeyboard/Config.in       | 13 ++++++----
 package/cutekeyboard/cutekeyboard.mk |  6 ++++-
 package/pkg-qmake.mk                 | 21 ++++++++++++----
 package/qt6/qt6.mk                   | 18 ++++++++++++++
 package/qt6/qt6base/qmake.conf.in    | 36 ++++++++++++++++++++++++++++
 package/qt6/qt6base/qplatformdefs.h  |  1 +
 package/qt6/qt6base/qt.conf.in       |  7 ++++++
 package/qt6/qt6base/qt6base.mk       | 18 ++++++++++++++
 package/qwt/Config.in                | 22 ++++++++++-------
 package/qwt/qwt.hash                 |  8 +++----
 package/qwt/qwt.mk                   |  6 ++++-
 11 files changed, 132 insertions(+), 24 deletions(-)
 create mode 100644 package/qt6/qt6base/qmake.conf.in
 create mode 100644 package/qt6/qt6base/qplatformdefs.h
 create mode 100644 package/qt6/qt6base/qt.conf.in

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
