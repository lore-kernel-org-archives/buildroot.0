Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F3FC83F11
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 17:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9BD340176;
	Mon, 28 Aug 2023 17:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9BD340176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryoVKSZZcI4i; Mon, 28 Aug 2023 17:59:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16CBC404FC;
	Mon, 28 Aug 2023 17:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16CBC404FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 266C11BF271
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 17:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06909817C0
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 17:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06909817C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ob0OoN8bPJJB for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 17:59:15 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A19C817AB
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 17:59:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A19C817AB
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68a3e271491so2188976b3a.0
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 10:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693245554; x=1693850354;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KPJ0gcg9xHn2tu+VJj3inrtePfe1kC0JzDqeTPXSbG0=;
 b=YkdAGwZ7twKBp6zqmOmDMlk01erqZQhEPQHpFpTchuiAnw+YxcbHI3pP5mLoTD29G5
 +BqA1Ngd+9gbhhx93PGS2GmPXAph/3EcyxTv2XFDJdhubOk1JIGC0ySxaSy3QhMOHBP5
 yO7szMTOw86ll8MSi/rdouEIbbY7r7NaoTGFhAfrZAJ5RtDgpj62AxKiPFCViE39k+pQ
 Xe5XGQYz9raVJyBKIbFhw4hOi+vcspUthe50Z0tTmwOa7lPdoZvDPsvqy5eiMuXKyeE4
 30EmSrEIOFpiWZcwr1hjEwNzs87O2jXVPVa2K0BzZl4vOuyPnM8UgjI76OJuQJf/wMvU
 j87w==
X-Gm-Message-State: AOJu0Yx3vPMUq9XON5310fp6jKwk2OOt6379dlUW6bNClPbNf7we8V+c
 h34vW4FWESnVnChov7url2+bS7dGpCPwofw/+mE=
X-Google-Smtp-Source: AGHT+IF117LSdNnwWzyjL0fY9d0Rmxe8yakSbl7qZKUdKlx4z8dIB/44x2bspgqWopRHXXB+BU/Ptw==
X-Received: by 2002:a05:6a20:440e:b0:14d:6309:fc90 with SMTP id
 ce14-20020a056a20440e00b0014d6309fc90mr3761982pzb.8.1693245553859; 
 Mon, 28 Aug 2023 10:59:13 -0700 (PDT)
Received: from DESKTOP-OI0KN2B.lan ([172.56.201.202])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a63505a000000b00570132a022csm1823143pgl.79.2023.08.28.10.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Aug 2023 10:59:13 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 28 Aug 2023 11:58:51 -0600
Message-ID: <20230828175858.309974-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693245554; x=1693850354;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KPJ0gcg9xHn2tu+VJj3inrtePfe1kC0JzDqeTPXSbG0=;
 b=E4EQL8lr4thhJGtCyl/znfHd/nSdNnPCurEQ5MnDR+E3l6SYdhYEyzQHFKzae79Kmn
 lT/kA53nF9DuskxhgdX3vHo4SQMxprD4c492HMp8dAWDXN5g+fxmd1frItB7KGPHZCyP
 dVKA2tNlRjLr32K8Fs3iPh82G/v8KA7DXIvRk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=E4EQL8lr
Subject: [Buildroot] [PATCH v6 0/7] flutter: new package series.
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

Version 6 includes the following changes:
  - After a bit of research, I can confidently say that the flutter-sdk-bin
    package was far too complicated. This is one of those times were I should
    not have blindly followed a recipe from Yocto. In fact, not only is
    flutter-sdk-bin more simple, it now no longer downloads any additional
    files. We do have to pass the HOME variable as the HOST_FLUTTER_SDK_BIN_SDK
    directory to prevent the sdk from dumping files and creating directories in
    ~/, which yes, is insane but I couldn't find a different way.

  - Drop support for i386. Even though flutter claims they support i386, I ran
    into several configuration logic issues around the analyze_snapshot tool.
    Arm works, AARCH64 works, and x86_64 works.

  - Drop the configs/flutter_x86_64_efi_demo_defconfig: new flutter demo config
    patch in favor of a unit test. Now that flutter-sdk-bin is cleaned up, it is
    possible to automate testing of flutter.

Adam Duskett (7):
  package/python-httplib2: add host variant
  package/depot-tools: new package
  package/flutter-sdk-bin: new package
  package/flutter-engine: new package
  package/flutter-pi: new package
  package/flutter-gallery: new package
  support/testing/tests/package/test_flutter.py: new runtime test

 DEVELOPERS                                    |   8 +
 package/Config.in                             |   3 +
 package/Config.in.host                        |   2 +
 package/depot-tools/Config.in.host            |  10 +
 package/depot-tools/depot-tools.hash          |   3 +
 package/depot-tools/depot-tools.mk            |  25 ++
 .../0001-disable-pre-canned-sysroot.patch     |  32 +++
 .../0002-remove-explicit-x11-dependency.patch |  33 +++
 .../0003-fix-toolchain-paths.patch            |  40 +++
 ...onfig.py-do-not-prepend-sysroot-path.patch |  37 +++
 package/flutter-engine/Config.in              |  55 ++++
 package/flutter-engine/dot-gclient            |  16 ++
 package/flutter-engine/flutter-engine.mk      | 234 ++++++++++++++++++
 package/flutter-engine/gen-tarball            | 111 +++++++++
 .../0001-remove-GetStorage.patch              |  84 +++++++
 package/flutter-gallery/Config.in             |  16 ++
 package/flutter-gallery/flutter-gallery.hash  |   3 +
 package/flutter-gallery/flutter-gallery.mk    |  44 ++++
 package/flutter-pi/Config.in                  |  41 +++
 package/flutter-pi/flutter-pi.hash            |   3 +
 package/flutter-pi/flutter-pi.mk              |  53 ++++
 package/flutter-sdk-bin/Config.in.host        |  16 ++
 package/flutter-sdk-bin/flutter-sdk-bin.hash  |   3 +
 package/flutter-sdk-bin/flutter-sdk-bin.mk    |  95 +++++++
 package/python-httplib2/python-httplib2.mk    |   1 +
 support/testing/tests/package/test_flutter.py |  56 +++++
 .../package/test_flutter/linux-vkms.fragment  |   2 +
 .../flutter-gallery.service                   |   1 +
 .../systemd/system/flutter-gallery.service    |  11 +
 29 files changed, 1038 insertions(+)
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
 create mode 100644 package/flutter-sdk-bin/Config.in.host
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.hash
 create mode 100644 package/flutter-sdk-bin/flutter-sdk-bin.mk
 create mode 100644 support/testing/tests/package/test_flutter.py
 create mode 100644 support/testing/tests/package/test_flutter/linux-vkms.fragment
 create mode 120000 support/testing/tests/package/test_flutter/overlay/etc/systemd/system/multi-user.target.wants/flutter-gallery.service
 create mode 100644 support/testing/tests/package/test_flutter/overlay/usr/lib/systemd/system/flutter-gallery.service

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
