Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE1C5479A
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 20:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1400D83A92;
	Thu, 17 Aug 2023 20:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1400D83A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzqdDVRpCwwf; Thu, 17 Aug 2023 20:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21F67830A7;
	Thu, 17 Aug 2023 20:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21F67830A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE2981BF360
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 821B04015F
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 20:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 821B04015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKnSkTdJ48D8 for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 20:58:59 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3F2240003
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 20:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F2240003
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-26d1a17ce06so164170a91.0
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 13:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692305938; x=1692910738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y+xW0WiW/J3N1XNUNzi2NU5GNsGKmI0Q6XXPdzOIj1w=;
 b=X8iKAar9FaUACEOz4rS99xHyWF0IP9Q9i0sHOIPFVKr/2+Q9vBkmWI9T1QBzk3kOtl
 FcFdzJSiY/54Cbw8IN+tj8L/IznHV1B5gZ99nRpsHzzDNK4TDKcF8YztCmioouemSN+i
 pVDuJU1+ho1VSjYDHKKg+HSFcLdHUzckoEw4oprXUfKTPWwyaH24Dx6QQiri7XhKhsKN
 m3kyRTNkY8nCkB0PcuijdSIVY5Ghn8AWp78e7GZxNAa9Omm/x36F/upGVU3NFO2gZuUH
 SXaUr8hEsaVGZEwV88ivdxBgabDIbzUmyjXNc2Ncv/KNzoqa46Fh3zIlTOynkzrvkiEe
 Qe/w==
X-Gm-Message-State: AOJu0YzzlevGRAIPPegvgV+JShukLDJ4OvHfUKXkJYpJfuOwdlwl7Hub
 m9MjJsFeaqTxlkuqTwdYCf7BgT8yAztWO6XfNvg=
X-Google-Smtp-Source: AGHT+IFuDM0V6yb1lY0QqRF5M3Et78PZUvekBcndFk5d4Cht0SOUHrN0Yl8GVzs2IZopsqNshzfFag==
X-Received: by 2002:a17:90a:8a0e:b0:26d:15dd:6702 with SMTP id
 w14-20020a17090a8a0e00b0026d15dd6702mr614917pjn.5.1692305938436; 
 Thu, 17 Aug 2023 13:58:58 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([75.174.130.12])
 by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a3f1600b0026d034f6badsm243143pjc.38.2023.08.17.13.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 13:58:57 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 14:58:48 -0600
Message-ID: <20230817205855.1556239-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1692305938; x=1692910738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y+xW0WiW/J3N1XNUNzi2NU5GNsGKmI0Q6XXPdzOIj1w=;
 b=ZqBXq5cheT0fIxZxUnA5y42Vgvwej3XXe8CiHMu2I47Udyn8ymLBht2pbZ1x02+acS
 jFJCHJfovBNzzm9fgH+XRifZc/ckvE1ko5tPv/7ABFgFnAnncx5/WBMMG1OxP2FVFs2/
 QIz+vfgABSRh/3DQsbYSRJLz6BgYNcl6Ofd4E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZqBXq5ch
Subject: [Buildroot] [PATCH v4] flutter: new packages
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
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

Two changes:
 - Add BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y to flutter_x86_64_efi_demo_defconfig
 - Add :$(HOST_DIR)/usr/share/depot_tools/ to the path when calling ninja with
   flutter-engine. Some tools reach out and need the depot-tools path.

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
 configs/flutter_x86_64_efi_demo_defconfig     |  63 +++++
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
 29 files changed, 1039 insertions(+)
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
