Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8659AC531DC
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 19:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFC0360BA9;
	Thu, 17 Aug 2023 19:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFC0360BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68AyOsz2RQUw; Thu, 17 Aug 2023 19:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3BD660C16;
	Thu, 17 Aug 2023 19:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3BD660C16
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 271451BF37F
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C1A960BCF
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C1A960BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RKBobBdipZkT for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 19:46:42 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A09EC60BA9
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 19:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A09EC60BA9
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-26b2beae166so135600a91.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 12:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692301602; x=1692906402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YPfqpIeHX1BUmXElk1GMS5+mvP9FGPSwW73dTEs5r8U=;
 b=TqPCL3mnlepi3BPt3bfNpIN+e4S3AvI8rHoDBxrpElXos2XayknuUMGLrz8bn6gYXa
 OsOM2ij2Ycs5VGGCGexc/gV8X/2wWMLUtQxHn1K6k1rpWhMG79QtPTFji+qgz3K4HzoA
 dnN9E5Bavr3+gai+PcB+ghrHZWR9xAJFmhTIyNBeRi5Il/4ZaQNyWer7XTA6YVsVmgkA
 Ph2Lw+zOGfls2+zHO68P9xLyCoNnAPb4V6Ee27a+8PkGDIKcJCNm7HMJ7aDPO3oGSo/8
 dK0w+jda4X9K1624zLu8qU5LPMNTjoRhofzGTTHv8y6bI+L6k3ashY173JycM4ByRPxm
 mcHw==
X-Gm-Message-State: AOJu0YznSZcZxDomRjYtVjdkHIC9tTlilrjv3clbh7P1SPp47538vFdF
 fX83UmcXaVZt4cLJd4qinOeYvNoZbg2e3O44Lb4=
X-Google-Smtp-Source: AGHT+IFkxJ7K3+ZuQYsYVaJ2H1LR8SFbmyLIaNIAzpKoV9+nFIVwKVLUEpH7X5P8Gfqs6yuS+diGcg==
X-Received: by 2002:a17:90a:cb8c:b0:262:d661:2963 with SMTP id
 a12-20020a17090acb8c00b00262d6612963mr392657pju.39.1692301601648; 
 Thu, 17 Aug 2023 12:46:41 -0700 (PDT)
Received: from fedora.. ([75.174.130.12]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b001bdd62cf7a1sm137569pll.236.2023.08.17.12.46.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 12:46:41 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 13:46:31 -0600
Message-ID: <20230817194638.780863-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692301602; x=1692906402;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YPfqpIeHX1BUmXElk1GMS5+mvP9FGPSwW73dTEs5r8U=;
 b=A1Nko04EgJyKKD8oaOsPxNfeA5btofCU3nkftwNlZO5vCX2zNbCxX3HJFGQkBUsJx3
 duoYPxUV1WNGVmykHFkl/YiGqXLJpVr1t14pgQ5DEKJjRHPylsE1GsbnojHwg9GqLjJu
 Giu0f9rVbUyuPzRUh9B97/95i/xlzZR6eJvl8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=A1Nko04E
Subject: [Buildroot] [PATCH v3] flutter: new packages
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch series should provide Buildroot with everything necessary to build
and run flutter applications. I even included a demo config and board file for
new users to quickly get started.

Tested with:
  - Debian 11 and 12
  - Ubuntu 18.04, 20.04, and 22.04
  - Fedora 38
  - Per package directory enabled and disabled
  - x86_64, arm64


Adam Duskett (7):
  package/python-httplib2: add host variant
  package/depot-tools: new package
  package/flutter-sdk-bin: new package
  package/flutter-engine: new package
  package/flutter-pi: new package
  package/flutter-gallery: new package
  configs/flutter_x86_64_efi_demo_defconfig: new flutter demo config

 DEVELOPERS                                    |   9 +
 board/flutter_x86_64/linux-vkms.fragment      |   2 +
 .../flutter-gallery.service                   |   1 +
 .../systemd/system/flutter-gallery.service    |  10 +
 board/flutter_x86_64/readme.txt               |  18 ++
 configs/flutter_x86_64_efi_demo_defconfig     |  62 +++++
 package/Config.in                             |   3 +
 package/Config.in.host                        |   1 +
 package/depot-tools/Config.in.host            |  10 +
 package/depot-tools/depot-tools.hash          |   3 +
 package/depot-tools/depot-tools.mk            |  25 ++
 .../0001-disable-pre-canned-sysroot.patch     |  32 +++
 .../0002-remove-explicit-x11-dependency.patch |  33 +++
 .../0003-fix-toolchain-paths.patch            |  40 +++
 ...onfig.py-do-not-prepend-sysroot-path.patch |  37 +++
 package/flutter-engine/Config.in              |  56 +++++
 package/flutter-engine/dot-gclient            |  16 ++
 package/flutter-engine/flutter-engine.mk      | 237 ++++++++++++++++++
 package/flutter-engine/gen-tarball            | 111 ++++++++
 .../0001-remove-GetStorage.patch              |  84 +++++++
 package/flutter-gallery/Config.in             |  13 +
 package/flutter-gallery/flutter-gallery.hash  |   3 +
 package/flutter-gallery/flutter-gallery.mk    |  44 ++++
 package/flutter-pi/Config.in                  |  41 +++
 package/flutter-pi/flutter-pi.hash            |   3 +
 package/flutter-pi/flutter-pi.mk              |  53 ++++
 package/flutter-sdk-bin/flutter-sdk-bin.hash  |   3 +
 package/flutter-sdk-bin/flutter-sdk-bin.mk    |  87 +++++++
 package/python-httplib2/python-httplib2.mk    |   1 +
 29 files changed, 1038 insertions(+)
 create mode 100644 board/flutter_x86_64/linux-vkms.fragment
 create mode 120000 board/flutter_x86_64/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
 create mode 100644 board/flutter_x86_64/overlay/usr/lib/systemd/system/flutter-gallery.service
 create mode 100644 board/flutter_x86_64/readme.txt
 create mode 100644 configs/flutter_x86_64_efi_demo_defconfig
 create mode 100644 package/depot-tools/Config.in.host
 create mode 100644 package/depot-tools/depot-tools.hash
 create mode 100644 package/depot-tools/depot-tools.mk
 create mode 100644 package/flutter-engine/0001-disable-pre-canned-sysroot.patch
 create mode 100644 package/flutter-engine/0002-remove-explicit-x11-dependency.patch
 create mode 100644 package/flutter-engine/0003-fix-toolchain-paths.patch
 create mode 100644 package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
 create mode 100644 package/flutter-engine/Config.in
 create mode 100644 package/flutter-engine/dot-gclient
 create mode 100644 package/flutter-engine/flutter-engine.mk
 create mode 100755 package/flutter-engine/gen-tarball
 create mode 100644 package/flutter-gallery/0001-remove-GetStorage.patch
 create mode 100644 package/flutter-gallery/Config.in
 create mode 100644 package/flutter-gallery/flutter-gallery.hash
 create mode 100644 package/flutter-gallery/flutter-gallery.mk
 create mode 100644 package/flutter-pi/Config.in
 create mode 100644 package/flutter-pi/flutter-pi.hash
 create mode 100644 package/flutter-pi/flutter-pi.mk
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.hash
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.mk

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
