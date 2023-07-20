Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D844EC0015E
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 23:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F5C8404FE;
	Thu, 20 Jul 2023 23:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F5C8404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpQfI2Jk595Y; Thu, 20 Jul 2023 23:36:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46809402EB;
	Thu, 20 Jul 2023 23:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46809402EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 374701BF39A
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A67E611EE
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 23:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A67E611EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sjqaPABxRGya for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 23:36:34 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13D7D611CD
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 23:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D7D611CD
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-55b0e7efb1cso734337a12.1
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 16:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689896193; x=1690500993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gtJZYTv3A8q5MtXaRIQfpBzT79yW6AGYQfi/kbCLrL0=;
 b=bl2Ftiq9DhEYcMMe/Zsb4h8/xUQRytM8IgMIEVm3QbEo7TqTCo7guwx/z1NZUwzHlj
 6NYZ+e70wLj49DHBiYbXTVm7GxPjAIEdBxOdwWYQzCogSBeLgsd+4gkly93g/uJI9esy
 q5ZSi6FYIs4yOq0kpcQuloxGeRoRZ5YFh80yF28IQY3H3vIgMwB2A64hMiE8e0QTw6n6
 w46bTL8Sx+UoElD1T5jrY7C86wiqh8h5RyV9DQmkYZBvpu5nVpsEojv2V2FvIdQ1W4qO
 CPCb3VcAyLHr6y3/tt/vNPKeqQoasT8SfwY9ggJujxFaHKBlPKdK8UJIyBI9Glp5oNCe
 HPCQ==
X-Gm-Message-State: ABy/qLaRngg4ouL22YyEdLFl0BPgbuhWi9bGOJMoRBHDuxoX01h2mb8N
 QjTiwP2SFAJNQWcyQUZmvTld+fwYtAce3WaR1IIZ7w==
X-Google-Smtp-Source: APBJJlGArQhSCat9rt8biIh/OB1r3hgixUwNlbQ2Ky1YeHYznyWrio4k0nB+ejUtWqKnA/ZY8pzMJw==
X-Received: by 2002:a05:6a20:b919:b0:134:73f6:467d with SMTP id
 fe25-20020a056a20b91900b0013473f6467dmr284304pzb.58.1689896193115; 
 Thu, 20 Jul 2023 16:36:33 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([2601:603:217f:25e0::99d])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170902cec300b001b89b7e208fsm1981790plg.88.2023.07.20.16.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 16:36:32 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 16:36:26 -0700
Message-ID: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689896193; x=1690500993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gtJZYTv3A8q5MtXaRIQfpBzT79yW6AGYQfi/kbCLrL0=;
 b=m+mmGlpz/19ygcLAAqM0sEE4hakGKxYj/wJAru0XqKNoDnde5hDGOU6RehusHnVJ6r
 nLWngpCDxQrH/8TmxmfOU17pWjGWtgfIZ5Mjq7QBbaHnlTyQHlEEgzVpRayblHW0Yryu
 4l/QsRerdYYPamMKDV7f4yOLJnvaBoqdxlomg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=m+mmGlpz
Subject: [Buildroot] [PATCH vRFC 0/3] Initial flutter packages
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

- The clang toolchain wrapper does not work properly, resulting in the immediate
  errors of:
    -Wl,-z,now: 'linker' input unused
    -Wl,-z,relro: 'linker' input unused
  The solution is to use clang.br_real and clang++.br_real.

- If using per_package builds, flutter-engine tries to use the host /usr/bin/ld
  instead of the one provided by the compiler, resulting in linking errors.
  As such, if BR2_PER_PACKAGE_DIRECTORIES is enabled, we search for the ld
  provided by the compiler in the host directory and set the path accordingly.

- libtessellator.so (built by flutter) requires three files:
  crtbeginS.o crtendS.o libgcc.a. However, the toolchain path isn't referenced
  when linking. The solution is to copy those three files to the staging lib
  directory before building.

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
 .../0001-Disable-ninjalog-upload.patch        |  35 +++
 package/depot-tools/Config.in.host            |  10 +
 package/depot-tools/depot-tools.hash          |   3 +
 package/depot-tools/depot-tools.mk            |  33 ++
 .../0001-disable-pre-canned-sysroot.patch     |  32 ++
 .../0002-remove-explicit-x11-dependency.patch |  33 ++
 .../0003-disable-undefined-version.patch      |  32 ++
 ...onfig.py-do-not-prepend-sysroot-path.patch |  34 +++
 package/flutter-engine/Config.in              |  93 ++++++
 package/flutter-engine/flutter-engine.mk      | 286 ++++++++++++++++++
 package/flutter-engine/gclient                |  16 +
 package/python-httplib2/python-httplib2.mk    |   1 +
 15 files changed, 614 insertions(+)
 create mode 100644 package/depot-tools/0001-Disable-ninjalog-upload.patch
 create mode 100644 package/depot-tools/Config.in.host
 create mode 100644 package/depot-tools/depot-tools.hash
 create mode 100644 package/depot-tools/depot-tools.mk
 create mode 100644 package/flutter-engine/0001-disable-pre-canned-sysroot.patch
 create mode 100644 package/flutter-engine/0002-remove-explicit-x11-dependency.patch
 create mode 100644 package/flutter-engine/0003-disable-undefined-version.patch
 create mode 100644 package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
 create mode 100644 package/flutter-engine/Config.in
 create mode 100644 package/flutter-engine/flutter-engine.mk
 create mode 100644 package/flutter-engine/gclient

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
