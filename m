Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0370FC3ABDD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 21:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5037140D70;
	Mon, 19 May 2025 21:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-NuFXFgt630; Mon, 19 May 2025 21:06:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A48F40DA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A48F40DA4;
	Mon, 19 May 2025 21:06:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4631ED4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BBD04192E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3N5DIKCULPA9 for <buildroot@buildroot.org>;
 Mon, 19 May 2025 21:06:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 406A7400EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 406A7400EC
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 406A7400EC
 for <buildroot@buildroot.org>; Mon, 19 May 2025 21:06:07 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-328114b262aso30289491fa.3
 for <buildroot@buildroot.org>; Mon, 19 May 2025 14:06:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747688765; x=1748293565;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bh95CvUFeinZzaS+hB9LuevvM4EX4IWU1wc3ELyd66c=;
 b=LDHs/yZ+Hh5ILQ7IBEvIMGemqz5CwsV6/cIvdHzc0b030bbpdaw0Ox4GCfCyepmPMH
 BYjwx/dZDwcKvcxzVv4J4byd2EWngGGUN6BaHUkOyAZM/EJAfOXorZADeos8W7XSvpbP
 o2+3bqoTbxO1740dvw1pVc6nGZkNqe7HpZD2zE7Ov2uAfof2CsoRoHalXY8TvUwImAFj
 dW8yFW/jK8LBEDr0gL9I65vfmfSFgkCdi4bTRmAh0Vo9nyBqdUKiKAx/CqBCfLTiIu2F
 eTsmmNkYxllMrJLxnt8G8snK0uecYcK5XZA1EA6hIQ+A333G2Ww48wGdz+A8inz+fF7r
 EbRw==
X-Gm-Message-State: AOJu0YxhUagGUmfa6uWd4CUshN0vOXQ+OWXJgxquZkDgqiT3HJ/Ea7Wx
 UkD+0z4xJaorRAq/thymCGWOA9N0CN6ACUfVHUiL1Q5qaweaZcvVG0vUKwUfcg==
X-Gm-Gg: ASbGncuRkmUMj474IOYFDAQDFZAQMNa2CdzuGItzQakoqjearwDd/yDn4doNp9X4qs1
 O5A7CyJ7oCuto1erByeA4iYcPOBN5Z263Av2Sgt6jogL5accHpTMKuRGVMJMc9w3KmM+790aWqz
 A7Zge5PHo3TSWaOMGg3KnokhR6+68zyls4vN2x9aEY/R4fQ/Vn/+21OHFFnrdHx3evztGZ8B9pD
 uEDWReDT8eRjxYDcqWalG8XeIC6e4R/4DIVh2yBppr6jJtiKXZ6+zN8C6FDvB7Dv+yu+oD6/zij
 wTA0OCsREp0Htj6RqvKEE0VGUHaDY9psXTZj0HDntSKNjtaPuRbS4pp7qb1smto+xIHWR5R7NXG
 +2uXQiWKr7pXv9QyZ
X-Google-Smtp-Source: AGHT+IGLYmBd9mstFDuHqAXWkWqvNMraSbdJ11WmWvda2mIXO0g2bfMTWBys9aHHPJWnsc/xb/e37Q==
X-Received: by 2002:a05:651c:2229:b0:30c:1fc4:418e with SMTP id
 38308e7fff4ca-3280779134emr47399011fa.26.1747688764506; 
 Mon, 19 May 2025 14:06:04 -0700 (PDT)
Received: from precision7530-arch-roy.lan ([79.161.254.180])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328085cfaebsm20181171fa.100.2025.05.19.14.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 14:06:03 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 May 2025 23:05:34 +0200
Message-ID: <20250519210553.265725-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747688765; x=1748293565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bh95CvUFeinZzaS+hB9LuevvM4EX4IWU1wc3ELyd66c=;
 b=BhaO/pGur3dnNkSs2OqcYaTVy5tpXk59S5kRMeu/M/bnSg6EsyD1UoYCvcvMt/kl1T
 KF51403smQB6c7+HfR0F1eGOluUCpteOVVnSdPtbc03hEeywA5EYlwoAHBow6UfUCTRD
 fBeInPCOdWUE+hbrvNkgUBrDdXnwicwBjWihC1i+Kxvg3mGAizyr3jaFZW0lO/5hdUwx
 RN0SshJzS92o/maz1DavBsFX34quusa3PhQfF7sdAcDA2R4nQBXrwO5vJYvO29faeraG
 AQ5Ee0XqD4tTAnPoY4UdFLEWCSwmKt9sJI3RHhtNeJbNyOTS2/fDVVHR/9qZMtYKYXme
 5xiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BhaO/pGu
Subject: [Buildroot] [PATCH v2 00/11] Update Qt 6 to 6.9.0
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
Cc: Christian Hitz <christian@klarinett.li>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Baxiche Su <baxiche@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In v1 of the patchset I avoided build failures by removing the option to
build for target. Here I try to tackle the issues instead.

Bernd Kuhls (1):
  package/qt6/qt6positioning: new package

Christian Hitz (1):
  package/qt6/qt6connectivity: new package

Jack Rubacha (1):
  package/qt6/qt6grpc: new package

Roy Kollen Svendsen (8):
  package/qt6: bump version to 6.9.0
  package/qt6/qt6sensors: new package
  package/qt6/qt6speech: new package
  package/qt6/qt6base: add hidden options needed by qt6tools
  package/qt6/qt6tools: fix assistant build failure
  package/qt6/qt6tools: fix designer build failure
  package/qt6/qt6tools: fix linguist build failure
  package/qt6/qt6tools: fix assistant build failure

 package/qt6/Config.in                         |  5 ++
 package/qt6/qt6.mk                            |  4 +-
 package/qt6/qt6base/Config.in.host            | 14 ++++++
 package/qt6/qt6base/qt6base.hash              |  4 +-
 package/qt6/qt6base/qt6base.mk                | 40 +++++++++++++++-
 package/qt6/qt6charts/qt6charts.hash          |  4 +-
 package/qt6/qt6connectivity/Config.in         | 17 +++++++
 .../qt6/qt6connectivity/qt6connectivity.hash  | 11 +++++
 .../qt6/qt6connectivity/qt6connectivity.mk    | 42 +++++++++++++++++
 .../qt6/qt6core5compat/qt6core5compat.hash    |  4 +-
 .../qt6/qt6declarative/qt6declarative.hash    |  4 +-
 package/qt6/qt6graphs/qt6graphs.hash          |  4 +-
 package/qt6/qt6grpc/Config.in                 |  7 +++
 package/qt6/qt6grpc/qt6grpc.hash              | 10 ++++
 package/qt6/qt6grpc/qt6grpc.mk                | 43 +++++++++++++++++
 .../qt6languageserver/qt6languageserver.hash  |  4 +-
 package/qt6/qt6mqtt/qt6mqtt.hash              |  2 +-
 package/qt6/qt6multimedia/qt6multimedia.hash  | 12 +----
 package/qt6/qt6multimedia/qt6multimedia.mk    |  8 ----
 package/qt6/qt6opcua/qt6opcua.hash            |  2 +-
 package/qt6/qt6positioning/Config.in          |  8 ++++
 .../qt6/qt6positioning/qt6positioning.hash    | 16 +++++++
 package/qt6/qt6positioning/qt6positioning.mk  | 47 +++++++++++++++++++
 package/qt6/qt6quick3d/qt6quick3d.hash        |  6 +--
 package/qt6/qt6quick3d/qt6quick3d.mk          |  4 +-
 .../qt6quicktimeline/qt6quicktimeline.hash    |  4 +-
 package/qt6/qt6scxml/qt6scxml.hash            |  4 +-
 package/qt6/qt6sensors/Config.in              |  6 +++
 package/qt6/qt6sensors/qt6sensors.hash        |  7 +++
 package/qt6/qt6sensors/qt6sensors.mk          | 32 +++++++++++++
 package/qt6/qt6serialbus/qt6serialbus.hash    |  4 +-
 package/qt6/qt6serialport/qt6serialport.hash  |  4 +-
 .../qt6/qt6shadertools/qt6shadertools.hash    |  4 +-
 package/qt6/qt6speech/Config.in               |  8 ++++
 package/qt6/qt6speech/qt6speech.hash          | 10 ++++
 package/qt6/qt6speech/qt6speech.mk            | 37 +++++++++++++++
 package/qt6/qt6svg/qt6svg.hash                |  5 +-
 package/qt6/qt6svg/qt6svg.mk                  |  3 +-
 package/qt6/qt6tools/Config.in                | 40 ++++++++++++++++
 package/qt6/qt6tools/Config.in.host           | 17 +++++--
 package/qt6/qt6tools/qt6tools.hash            |  4 +-
 package/qt6/qt6tools/qt6tools.mk              | 24 ++++++++++
 .../qt6virtualkeyboard.hash                   |  6 +--
 package/qt6/qt6wayland/qt6wayland.hash        |  4 +-
 package/qt6/qt6websockets/qt6websockets.hash  |  4 +-
 45 files changed, 479 insertions(+), 70 deletions(-)
 create mode 100644 package/qt6/qt6connectivity/Config.in
 create mode 100644 package/qt6/qt6connectivity/qt6connectivity.hash
 create mode 100644 package/qt6/qt6connectivity/qt6connectivity.mk
 create mode 100644 package/qt6/qt6grpc/Config.in
 create mode 100644 package/qt6/qt6grpc/qt6grpc.hash
 create mode 100644 package/qt6/qt6grpc/qt6grpc.mk
 create mode 100644 package/qt6/qt6positioning/Config.in
 create mode 100644 package/qt6/qt6positioning/qt6positioning.hash
 create mode 100644 package/qt6/qt6positioning/qt6positioning.mk
 create mode 100644 package/qt6/qt6sensors/Config.in
 create mode 100644 package/qt6/qt6sensors/qt6sensors.hash
 create mode 100644 package/qt6/qt6sensors/qt6sensors.mk
 create mode 100644 package/qt6/qt6speech/Config.in
 create mode 100644 package/qt6/qt6speech/qt6speech.hash
 create mode 100644 package/qt6/qt6speech/qt6speech.mk

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
