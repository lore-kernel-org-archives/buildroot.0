Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250E7C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 19:59:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3053409B2;
	Tue,  8 Aug 2023 19:59:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3053409B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0wbIhoSh-Nd; Tue,  8 Aug 2023 19:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CC194169B;
	Tue,  8 Aug 2023 19:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CC194169B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 841191BF25F
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D2CC60D4C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 19:59:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D2CC60D4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NzwTDusGzamW for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 19:59:42 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CEC760C25
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 19:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CEC760C25
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-686f94328a4so167211b3a.0
 for <buildroot@buildroot.org>; Tue, 08 Aug 2023 12:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691524781; x=1692129581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Di6BLlMuDFq+5HNhroP5EIumXxLWjaEu5UoxrihAlG0=;
 b=HOdXsWTZXn6ApeOKZ6E6ibbSP3RmKWlrDmdFSUWGBYA11cYoeVdhmaEejRv1Kjn80U
 bwmAPyE0IqrF8e/MRyeKczONoZWHAzuML3JrWP6+NR0UVmIQP3+oF96DT67hd13eYIpD
 sioSQJwPfq12hRHkUlvDK8Nz+SmxDiU7+9GoRjLUmnr8Ntho7JTK2IQsZCordvPRVX1Z
 2aR4wR7gp6d0ZamgoARWoHi0AVmE4a2NrGAB48evzEF6jn/Kz/5DUqGn59zaogienC34
 lIMc5WyYmYGo7wwwNyLdrvw80TEv2Ijm7qOsiuVwIhzk7KlA89BsCbKp7sFFfaRMPoaj
 yYFQ==
X-Gm-Message-State: AOJu0YwGmT7+DRKpugsJ06GsVVM34842hX0yZqTtNxSCgzQXx5n3Q0sM
 yl9CAHUOI3UTTUNCLy5qcxwgQ4gNNc5h3CzyTD4pJw==
X-Google-Smtp-Source: AGHT+IGZwxhKJZDVHf9FqV6EB82inJI+jU9aSZ8DYYsLELg/35m6q8kT7zen5ryLWxynUHm6u8tgkQ==
X-Received: by 2002:a05:6a20:5487:b0:127:72c3:6428 with SMTP id
 i7-20020a056a20548700b0012772c36428mr1019246pzk.18.1691524781347; 
 Tue, 08 Aug 2023 12:59:41 -0700 (PDT)
Received: from fedora.amarulasolutions.com ([174.27.153.162])
 by smtp.gmail.com with ESMTPSA id
 d6-20020aa78686000000b0067a50223e3bsm8483958pfo.111.2023.08.08.12.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 12:59:41 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 13:59:35 -0600
Message-ID: <20230808195938.454382-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691524781; x=1692129581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Di6BLlMuDFq+5HNhroP5EIumXxLWjaEu5UoxrihAlG0=;
 b=msiyl+hK44kmDT0j8dH13NJoAmwQZjqvK6cjlseQKN+CmWQKjrLUCCdd0gFGcqgrOD
 O0XLMtK0uTc784a98H3Dwf8+1ZeHxUG748NwHq0ZnQnjmv4RtL3OJy/wH+Mjv3CwmH62
 7idnhTIxPH2ESIZnc/Dy/TyvdVYEaOOSVdWW8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=msiyl+hK
Subject: [Buildroot] [PATCH 0/3] flutter-engine: new package
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

- Flutter engine includes a patched vendored copy of clang that must be used to compile.
  Using a Buildroot-build clang results in linking warning and errors.
  As such, we depend on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS with only the
  known supported flutter architectures instead of LLVM_ARCH_SUPPORTS.
  On the plus side, this saves time having to compile clang.

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
 .../0003-fix-toolchain-paths.patch            |  40 ++++
 ...onfig.py-do-not-prepend-sysroot-path.patch |  37 +++
 package/flutter-engine/Config.in              |  56 +++++
 package/flutter-engine/dot-gclient            |  16 ++
 package/flutter-engine/flutter-engine.mk      | 220 ++++++++++++++++++
 package/flutter-engine/gen-tarball            | 106 +++++++++
 package/python-httplib2/python-httplib2.mk    |   1 +
 15 files changed, 590 insertions(+)
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
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
