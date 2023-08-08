Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90125C001DB
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 00:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE44781D5A;
	Tue,  8 Aug 2023 00:35:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE44781D5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tR93e3Cyxw_l; Tue,  8 Aug 2023 00:35:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F2A81CD0;
	Tue,  8 Aug 2023 00:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F2A81CD0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 108CA1BF30B
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 00:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE4F740179
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 00:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE4F740179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KA51ZDJxUDdU for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 00:35:31 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CDA840022
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 00:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CDA840022
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1bba04b9df3so45128595ad.0
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 17:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691454930; x=1692059730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XbNyag+w0LBCW2S641a6EzXiiy2JQvOg9IqZUzcKQPo=;
 b=YCwNCTExqmEAE7ZQiKon+krI+NbS03jU5WPl+d7yJCxqKxbRAAxD4KG6L7vDEtGuM8
 Cxg3PjmEzypIn1Fv0Do05+nhbR35NdyWGvVaCtFCs6HCV3Hu1iX3yjgmhhd+Rat+Aj69
 1cnWw7/dZeB3xnJgKuUUsTnqveaQWADfWLVb/fGNDiW0NENMPedwoK94do8QFYjd6XIx
 zFDFewro/GcB4jCn9Cg/P0v2BguKn0ngRmmZHXlDlxwWizWXJJR1BTPIN46g9PcpkP4b
 kdKBBUbm4g2bljCCKjl8IyCmvl6kU+k9cbP2g5Ixt+qfQ8wl71S6xOiAF0sso1QNh6qq
 VuIA==
X-Gm-Message-State: AOJu0YzlFjLqd1CvPqR14qSyjUmEH0s3HWCSX8TrBDCh24LnwU29M/sM
 Yw8qG0f6YbcRbrWChFVmTAvA12DxkAA9T2xBYboi0Q==
X-Google-Smtp-Source: AGHT+IEudaCF5GLgaSHjgpOEc0oRxTco2AwJm5SByZhF8zJuWjkfTEeZHb8npS/Vs4eS4y6QsKJKBA==
X-Received: by 2002:a17:903:2449:b0:1b8:6cac:ffe8 with SMTP id
 l9-20020a170903244900b001b86cacffe8mr13213148pls.51.1691454930552; 
 Mon, 07 Aug 2023 17:35:30 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([174.27.153.162])
 by smtp.gmail.com with ESMTPSA id
 ix10-20020a170902f80a00b001b03b7f8adfsm7531923plb.246.2023.08.07.17.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 17:35:30 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 18:35:24 -0600
Message-ID: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691454930; x=1692059730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XbNyag+w0LBCW2S641a6EzXiiy2JQvOg9IqZUzcKQPo=;
 b=UgtqjjAQWwAvXnGavnKv9AzYqd905zdYbAN9iGf1RdJ+gZrFoEuCfalNKu88euwEP3
 RBYF1hxwfANKhyQ/fxmqlLfHS/F5M61CmaOyLr+5LEcAFDWe3RFxV6X0BSdTy5BoZsXo
 VB6NdIV8AtnzN6de2khTJ5bUfFPHcrt6LDscg=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UgtqjjAQ
Subject: [Buildroot] [PATCH/next vRFCv2 0/3] Initial flutter packages
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

Preface: Thank you for all the help, thoughts and insight for this initial
RFC of the flutter-engine library. There are many other flutter packages that
need to be ported, but this is the largest hurdle to overcome.

There are many issues with the flutter-engine package:

- The release tarballs from https://github.com/flutter/engine are in no state
  to compile. They are only for the use of gclient to download a source
  directory structure suitable to build the Flutter engine! If you download,
  extract and attempt to run `./tools/gn --no-goma --no-prebuilt-dart-sdk`, you
  receive the error message:
  `No such file or directory: 'flutter/flutter/third_party/gn/gn.'

  But wait! Wasn't the gn binary just called? No, that's a wrapper in the
  Flutter source tree that formats arguments to call the real gn binary.
  The real gn is not provided in the tarball but is downloaded via gclient
  (among many other supporting repositories.)

  Even worse, the flutter repository depends on the .git dirs being present.
  (https://github.com/meta-flutter/meta-flutter/issues/271) This dependency
  means it is not possible to create a reproducible tarball from the downloaded
  sources, which is why there is no .hash file provided.

  I have asked the flutter project to release full tarballs suitable for
  compiling here: https://github.com/flutter/flutter/issues/130734

- Flutter engine includes a patched copy of clang that must be used to compile.
  Using a Buildroot-build clang results in linking warning and errors.
  As such, we depend on LLVM_ARCH_SUPPORTS but use the included clang for
  building. On the plus side, this saves time having to compile clang.

Tested with:
  - Debian 11 and 12
  - Ubuntu 18.04, 20.04, and 22.04
  - Fedora 38
  - Per package directory enabled and disabled
  - x86_64, arm64

Adam Duskett (3):
  package/python-httplib2: add host variant
  package/depot-tools: new package
  package/flutter-engine: new package

 DEVELOPERS                                    |   4 +
 package/Config.in                             |   1 +
 package/Config.in.host                        |   1 +
 package/depot-tools/Config.in.host            |  10 +
 package/depot-tools/depot-tools.hash          |   3 +
 package/depot-tools/depot-tools.mk            |  30 +++
 .../0001-disable-pre-canned-sysroot.patch     |  32 +++
 .../0002-remove-explicit-x11-dependency.patch |  33 +++
 .../0003-fix-toolchain-paths.patch            |  40 +++
 ...onfig.py-do-not-prepend-sysroot-path.patch |  34 +++
 package/flutter-engine/Config.in              |  60 +++++
 package/flutter-engine/dot-gclient            |  16 ++
 package/flutter-engine/flutter-engine.mk      | 239 ++++++++++++++++++
 package/flutter-engine/gen-tarball            | 108 ++++++++
 package/python-httplib2/python-httplib2.mk    |   1 +
 15 files changed, 612 insertions(+)
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

-- 
Changes v1 -> v2:
  - Remove unecessary patch (We aren't using ninjalog)
  - Formatting cleanup [Yann]
  - Remove uncessary environment variables for gclient [Yann]
  - Use the flutter-engine provided clang.
  - Remove 0003-disable-undefined-version.patch
  - Add 0003-fix-toolchain-paths.patch
  - Fix signed-off-by lines in the patches [Yann]
  - Remove "Runtime mode" option in favor of checking BR2_ENABLE_RUNTIME_DEBUG [Yann]
  - Use positive logic in flutter-engine.mk [Yann]
  - Add comments when --disable-${option} doesn't exist. [Yann]
  - Remove unecessary subshells in flutter-engine.mk [Yann]
  - Rename flutter-engine/gclient to flutter-engine/dot-gclient [Yann]
  - Create flutter-engine/gen-tarball to generate the flutter-engine tarball. [Yann]
  - Remove finding and copying crtbeginS.o crtendS.o libgcc.a as it's
    unecessary when using the flutter-engine provided clang.
  - FLUTTER_ENGINE_INSTALL_STAGING_FILES -> FLUTTER_ENGINE_INSTALL_FILES [Yann]
  - Reword comments at the top of flutter-engine.mk for clarity.
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
