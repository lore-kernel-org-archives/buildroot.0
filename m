Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A515C636D7
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 22:47:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401A8606FF;
	Fri, 10 Feb 2023 22:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401A8606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7R0QOXejWppA; Fri, 10 Feb 2023 22:47:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5073861136;
	Fri, 10 Feb 2023 22:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5073861136
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDD5A1BF973
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C078230D
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 22:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97C078230D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8QPc8ab-v8y2 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 22:47:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC228230B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEC228230B
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 22:47:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id co8so2790179wrb.1
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x3N/dzg9FcLGUpPVcwmZyYoJL/FoCbEgNiIHHqq/nyE=;
 b=Hg2WBhMY/w/k7jrjZRaQv7DneKvKFeqFVbn3XQk2wdH80aFh/ho4aZKTdzy31+yuBD
 qRq88L8mU1gRzqjtySIuMyfB+YUcvZBtTqZRIwAV6rTk7/LXnWXE5EoQg8IRD8z48Atd
 qbw6uL3GBOFKh/eH+6lxBWvQgdtoUqT89JXWvH4Ybt7x27+mvqcjycc+kbBszFXV7J34
 T3Z9S/zUpy2Cnxk9rfRZE2u9fUjoAEyI+kcfcARHbsYxfHDuTwPux7d4O+U8Tq5pbISA
 GnAnEZYzFoPy+CAq1/EsZbXcEPsCSWvo18VHl/zaJiaQszx3xkC4dj2zG9vKsN6rKm93
 XCrw==
X-Gm-Message-State: AO0yUKWy4PEygt9EI9xKpG1F/kEs+qwqDfA9jrYZzUF/5K6UMGFMQ3bJ
 gI3QTU8884APC89tke36mkb4+HWWLuhGfY5n
X-Google-Smtp-Source: AK7set/asUOXSrrQoICVlVHjoi+KSWj4p4UAitUSCzn/xH30o/HsulePVwGVA1rM3EJjLPXJ8xFKgA==
X-Received: by 2002:a5d:488b:0:b0:2c3:db9e:4b07 with SMTP id
 g11-20020a5d488b000000b002c3db9e4b07mr14165039wrq.64.1676069244872; 
 Fri, 10 Feb 2023 14:47:24 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t9-20020adfeb89000000b002be0b1e556esm4576128wrn.59.2023.02.10.14.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 14:47:24 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:47:07 +0100
Message-Id: <20230210224717.3293906-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x3N/dzg9FcLGUpPVcwmZyYoJL/FoCbEgNiIHHqq/nyE=;
 b=ubwjmJwMLkG/qfVexYydY0tv0DDDdFOniyUuti8Xp3ppODPjyUgj3UOUPEvfzMgS87
 8XzsDGvHOjwYKouH0f4lI538nDyMHuFpq91VCr8CH3KOkFdwORCJSYGGGbf1OoJbhBWU
 kHEipNPAFEAvF98T9PBJlfbMH3WjMZicuSYETswJ3cd8kLqUggnhQHkoeEMrufveAR4i
 5jFOWYXfGHrDvMN5R1y2MG0ryhh9fWlPHXe3hCKwpq8J926ZQdOn6zVEurHPkoTxKYQ6
 rdm5hxgsmnamoDQOhwEP9SheioRyNhsHjXm05cGfxejyPh3iZIfoGmQv2evz6jcxpP2n
 2zvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ubwjmJwM
Subject: [Buildroot] [PATCH v3 00/10] group llvm projects and bump to
 version 15.0.3
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series attempts two things:
- Move the different llvm subprojects into one folder
and share version and site information.

- Bump the version to the latest 15.0.3

Starting with version 12 different subprojects added
dependencies or sources that would be available when
building from the "monorepo". These have been added
as new host packages.

v3:
- move libclc before llvm 15.0.3 version bump commit
- force llvm-cmake and llvm-libunwind version to 15.0.3 since
  LLVM_PROJECT_VERSION is still at 11.1.0
- Keep cp as install command since there is no CMakefiles.txt
- llvm, clang, lld: keep LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN since
  this option is still used to check C++17 compiler support:
  llvm/cmake/modules/CheckCompilerVersion.cmake


Changes v1 -> v2:
- Rebased onto current master
- Bump to 15.0.3 instead of 15.0.1
- llvm: use CMAKE_HOST_C_COMPILER instead of HOSTCC
- libclc: Add missing change to package/Config.in

Lang Daniel (10):
  package/llvm-project: new group for llvm packages
  package/llvm: move to llvm-project folder
  package/lld: move to llvm-project subfolder
  package/clang: move to llvm-project subfolder
  package/compiler-rt: move to llvm-project subfolder
  package/libclc: move to llvm-project subfolder
  package/llvm-project/llvm-cmake: new package
  package/llvm-project/llvm-libunwind: new package
  package/llvm-project: bump to version 15.0.3
  DEVELOPERS: add Daniel Lang for llvm-project

 DEVELOPERS                                    | 21 ++++++-------
 package/Config.in                             |  8 ++---
 package/Config.in.host                        |  2 +-
 ...hains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch |  0
 package/{ => llvm-project}/clang/Config.in    |  0
 package/{ => llvm-project}/clang/clang.hash   |  2 +-
 package/{ => llvm-project}/clang/clang.mk     | 16 +++++-----
 .../{ => llvm-project}/compiler-rt/Config.in  |  0
 .../compiler-rt/compiler-rt.hash              |  2 +-
 .../compiler-rt/compiler-rt.mk                |  9 +++---
 .../0001-support-out-of-tree-build.patch      |  0
 package/{ => llvm-project}/libclc/Config.in   |  0
 package/{ => llvm-project}/libclc/libclc.hash |  2 +-
 package/{ => llvm-project}/libclc/libclc.mk   |  4 +--
 package/{ => llvm-project}/lld/Config.in.host |  0
 package/{ => llvm-project}/lld/lld.hash       |  2 +-
 package/{ => llvm-project}/lld/lld.mk         | 15 +++++-----
 .../llvm-project/llvm-cmake/llvm-cmake.hash   |  2 ++
 package/llvm-project/llvm-cmake/llvm-cmake.mk | 17 +++++++++++
 .../llvm-libunwind/llvm-libunwind.hash        |  3 ++
 .../llvm-libunwind/llvm-libunwind.mk          | 18 +++++++++++
 package/llvm-project/llvm-project.mk          | 11 +++++++
 package/{ => llvm-project}/llvm/Config.in     |  0
 package/{ => llvm-project}/llvm/llvm.hash     |  2 +-
 package/{ => llvm-project}/llvm/llvm.mk       | 30 ++++++++++++-------
 .../llvm/0001-nfc-Fix-missing-include.patch   | 24 ---------------
 26 files changed, 112 insertions(+), 78 deletions(-)
 rename package/{ => llvm-project}/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch (100%)
 rename package/{ => llvm-project}/clang/Config.in (100%)
 rename package/{ => llvm-project}/clang/clang.hash (52%)
 rename package/{ => llvm-project}/clang/clang.mk (92%)
 rename package/{ => llvm-project}/compiler-rt/Config.in (100%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.hash (50%)
 rename package/{ => llvm-project}/compiler-rt/compiler-rt.mk (82%)
 rename package/{ => llvm-project}/libclc/0001-support-out-of-tree-build.patch (100%)
 rename package/{ => llvm-project}/libclc/Config.in (100%)
 rename package/{ => llvm-project}/libclc/libclc.hash (51%)
 rename package/{ => llvm-project}/libclc/libclc.mk (92%)
 rename package/{ => llvm-project}/lld/Config.in.host (100%)
 rename package/{ => llvm-project}/lld/lld.hash (52%)
 rename package/{ => llvm-project}/lld/lld.mk (67%)
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.hash
 create mode 100644 package/llvm-project/llvm-cmake/llvm-cmake.mk
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.hash
 create mode 100644 package/llvm-project/llvm-libunwind/llvm-libunwind.mk
 create mode 100644 package/llvm-project/llvm-project.mk
 rename package/{ => llvm-project}/llvm/Config.in (100%)
 rename package/{ => llvm-project}/llvm/llvm.hash (52%)
 rename package/{ => llvm-project}/llvm/llvm.mk (93%)
 delete mode 100644 package/llvm/0001-nfc-Fix-missing-include.patch

-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
