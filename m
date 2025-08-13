Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A40CA0EE0
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 19:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD7DB61B90;
	Wed, 13 Aug 2025 19:26:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ri86ZEh-K0np; Wed, 13 Aug 2025 19:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C434F61BA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C434F61BA4;
	Wed, 13 Aug 2025 19:26:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61D691C9
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5367C83D23
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5blXjzT9xKSt for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 19:26:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C80A883FAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C80A883FAC
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C80A883FAC
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 19:26:22 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb72d5409so37526666b.0
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 12:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755113180; x=1755717980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iXchlouINpDfs/qYHrwx8jeY7ZKCgmLhhSQs/mDVksE=;
 b=HzzeJuoqAttQW67hXvVbU/VQ58OoZB8Pc6LFLcEybLU83YZmqjjhOxwBvX0bLM8mjX
 mizoygo15bPwZGCgGM407GNfsfu8oHTVH1BFhADAHUjkatRu6ulY1d5FLRaWO/cuXRJg
 cBoMDAAdw0LvpHz3k5DBgE7yihI0iBLEQwroD6xC+7P8Y5/C5aq38OfNsvpD0PyE6R+y
 12jce0ja8hDteWCcuIMopkaGI9IZ0Oed4Zo8RG6RQAHZIJSrjf1ND22cdaJOEJkLeZIZ
 vTWQdtXLBtBFKpuHUXnSaEKlMVHLQtMtrqQ/FcqFICQYY6wubOnhmomfCyYlHxXKPEJz
 ZV7g==
X-Gm-Message-State: AOJu0Yw3n2hURQRXu0340/SFFvuKgdlvYFwp22JRti8UEtS8LsL82C/r
 qxRz7DJ5S/6RqphWA8H83+QQLFj4XBNPf5gKaVr0lo9bm07DVsGkiIc2pfskj/hkITVilHQ6YKj
 FqV8lHtg=
X-Gm-Gg: ASbGncsEboZ06aRSvqS16W18jqjEgMm02MfHb6T8QlCTCcjuOuPdXfvndEtBWKXouRT
 EDJcYPgcBbtUjjOVf2lwM1n+XeJloVCkM6ayrLt+gkGOCqeq+sgOe0HeK6IXhMVtlOP9XewZXoc
 9rMHYrm5bW30CU4rnIlntn9GqGd9E2T+gEAEWXufVxENkftx8OfpmMxfFy2cG7nLv24bw5DS38I
 eOzoBcFCg5n2GhiW5lohBIbwvsBm/MZ8xXtJV1R4Kymo04FCm1/bvcN+ZxhefXLxoI6abAGITRz
 lsDiraViEaUwNgDR63q6CDE1lwqkoSHGZcyDgaNZVXq7dP+L4F7gFvYGtrT/Z9leHi3WuISNGZ4
 B+XzM17epJbscgjJz0se8Fs47ej/y2kpHOpfX1LF1NyQTwqzUfaa0J6ZEfxFrym9l1u395c89Sh
 Ar+g==
X-Google-Smtp-Source: AGHT+IEIeS9T/gn0s4BK71G/luYpR7DJvjwpVOilnJwA6vKBcgo9rtJGmDJSP6hJ/cxHPlAae6YX2Q==
X-Received: by 2002:a17:907:dac:b0:afc:b61a:df8 with SMTP id
 a640c23a62f3a-afcb98e1861mr29353666b.34.1755113180476; 
 Wed, 13 Aug 2025 12:26:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.fritz.box
 ([2001:871:248:acda:3fd1:eaf1:73ac:376f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm2453396166b.59.2025.08.13.12.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 12:26:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 21:26:00 +0200
Message-ID: <20250813192605.1540321-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1755113180; x=1755717980;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iXchlouINpDfs/qYHrwx8jeY7ZKCgmLhhSQs/mDVksE=;
 b=Frof9Jdz54rqlYi1L1txoA/cjIFBjSBk4O8NJec+/2dBeA6Vxk1ncRvyigDFKukFp3
 hLGRfkT2sHMZdfqAD0M9hjpVqojkR9c6kK6c4XOLODhOqiSrZPlV4JSKbYnihau1LScM
 b52+KZLsFQmzg1p9tuDlBU0g582rDQZEqax9U=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Frof9Jdz
Subject: [Buildroot] [RFC v2 0/5] Support qmake for Qt6
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
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com
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

 package/cutekeyboard/Config.in       |  13 +-
 package/cutekeyboard/cutekeyboard.mk |   6 +-
 package/pkg-qmake.mk                 |  21 +-
 package/qt6/qt6.mk                   |  18 ++
 package/qt6/qt6base/qmake.conf.in    |  36 +++
 package/qt6/qt6base/qplatformdefs.h  |   1 +
 package/qt6/qt6base/qt.conf.in       |   7 +
 package/qt6/qt6base/qt6base.mk       |  18 ++
 package/qt6/qt6base/qt6base.mk.save  | 455 +++++++++++++++++++++++++++
 package/qwt/Config.in                |  22 +-
 package/qwt/qwt.hash                 |   8 +-
 package/qwt/qwt.mk                   |   6 +-
 12 files changed, 587 insertions(+), 24 deletions(-)
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
