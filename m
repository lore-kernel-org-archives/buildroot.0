Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAAFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 16:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6542B60F84;
	Wed, 15 Jun 2022 16:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y2jx3LPM7Q8c; Wed, 15 Jun 2022 16:18:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 500EE60C0E;
	Wed, 15 Jun 2022 16:18:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE8111BF4DB
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBAB682EB4
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HwJnmQK6qHxn for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 16:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AAA782DD9
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 16:18:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 j5-20020a05600c1c0500b0039c5dbbfa48so1426061wms.5
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 09:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GB6ygA0kEM0YQpBWRAJm8mWN7WtWLE7h2PxFILEZZk=;
 b=OhsdnTY7T1O2OKuFPDwyhk7F4nEk4Yflv/Td1QxA44Dybt+U0YZAqICOJBInM5sC2r
 VbRgLh9vyR7E/okFlc1iKqxLnq5ctGFGuWxum2LLT89eN+4yJ5uGyJru4IUHsdNskFJZ
 5qn3/BaS0aRj6tgFADx2cv4BdGWb45NV8PikoiCXA0pgfQXDsTQP4N+xhjLqUq1u0g/9
 ZND20o771m21lI61G4vj004F4O2lL2DQQgvysKtPQsOjHtpNirEQAyVUbi+VdxCGfa+O
 3VquJZtnYMcIGElYv28sA29mZ8yHmYVaHrQJX3wHMNxLXZilWlNKt7kfDaB0YqHh3Q1K
 Kypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+GB6ygA0kEM0YQpBWRAJm8mWN7WtWLE7h2PxFILEZZk=;
 b=1fZ7Wf4vzxUw7qlx3ZEuQWq1xjr05OWp1EfmbkbQaOpW8lbeEhiix+mnoZbrHUnS8K
 7eUNcZoQwN740n5/YfjRBe7E5hLVSi9gOL+7ZHtvd0z4eqzgavRtXBjalOUMO0qU15Vz
 8HlOYdpD6ipISroHezTDUvHrF89eyFQc0wnlNNN3aaHB8O+RHkfGnhHOPCXrrsqtAfCd
 WD2YO8W+C62v+t8K/uShf9BUGMwNV0fZZkHkmOAtoJfvQ4nPrg3TVyumnebbMlfPAF7j
 /9Vc+YGYPi6+NWusXrbOqC5e68DzLSJ5vYbYbXWEMHwj96gnSdaTnTrfAUk95lGeSkc8
 /5Yw==
X-Gm-Message-State: AOAM530R5xWnfT2u2Ad4Akf+kFEwudPO5Mi4BPAwtAgV0pjrKl0HlIyi
 0Bbwz2w2YUSDlIOo3G2pjla8kqlb3djDqQ==
X-Google-Smtp-Source: ABdhPJwpAQhUGhTcqoel2QYe8oODnZmvCd6IdCowqOmFoyxoXARoCwOo7Eyf/j8qHEfnXP0U6GkLWA==
X-Received: by 2002:a05:600c:23d0:b0:39c:63d4:69a6 with SMTP id
 p16-20020a05600c23d000b0039c63d469a6mr10923429wmb.5.1655309884530; 
 Wed, 15 Jun 2022 09:18:04 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adffc8d000000b002102f2fac37sm17723325wrr.51.2022.06.15.09.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:18:04 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Jun 2022 18:17:49 +0200
Message-Id: <20220615161753.2580142-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/open62541: bump to version 1.3.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove patches

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...sts.txt-project-only-contains-C-code.patch | 27 ----------
 ...eLists.txt-fix-build-without-threads.patch | 37 -------------
 ...licit-cast-to-avoid-compiler-warning.patch | 25 ---------
 ...4-CMakeLists.txt-add-UA_FORCE_WERROR.patch | 54 -------------------
 package/open62541/open62541.hash              |  2 +-
 package/open62541/open62541.mk                |  2 +-
 6 files changed, 2 insertions(+), 145 deletions(-)
 delete mode 100644 package/open62541/0001-CMakeLists.txt-project-only-contains-C-code.patch
 delete mode 100644 package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
 delete mode 100644 package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch
 delete mode 100644 package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch

diff --git a/package/open62541/0001-CMakeLists.txt-project-only-contains-C-code.patch b/package/open62541/0001-CMakeLists.txt-project-only-contains-C-code.patch
deleted file mode 100644
index 52a9cbaac..000000000
--- a/package/open62541/0001-CMakeLists.txt-project-only-contains-C-code.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 61f9440dfeacad517965451773371aca0332d700 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Tue, 5 Jan 2021 23:08:53 +0100
-Subject: [PATCH] CMakeLists.txt: project only contains C code
-
-Make sure CMake doesn't check for a C++ compiler when it's not needed,
-as open62541 is in C.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94ceb127..acc41ab2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
- cmake_minimum_required(VERSION 3.0...3.12)
--project(open62541)
-+project(open62541 C)
- # set(CMAKE_VERBOSE_MAKEFILE ON)
- if(${CMAKE_VERSION} VERSION_LESS 3.12)
-     cmake_policy(VERSION ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION})
--- 
-2.29.2
-
diff --git a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
deleted file mode 100644
index bdf360804..000000000
--- a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a312e82124fb8c9f139d5a40fa5a28123bb77a33 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 10 Jan 2021 14:25:56 +0100
-Subject: [PATCH] arch/posix/CMakeLists.txt: fix build without threads
-
-Fix the following build failure without threads:
-
-[100%] Linking C shared library bin/libopen62541.so
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: cannot find -lpthread
-collect2: error: ld returned 1 exit status
-CMakeFiles/open62541.dir/build.make:192: recipe for target 'bin/libopen62541.so.0.0.0' failed
-make[3]: *** [bin/libopen62541.so.0.0.0] Error 1
-
-Fixes:
- - http://autobuild.buildroot.org/results/87ec3c987c991f790757276316d6caf81e635fa2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- arch/posix/CMakeLists.txt | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/arch/posix/CMakeLists.txt b/arch/posix/CMakeLists.txt
-index bb24757c..a53c9f2c 100644
---- a/arch/posix/CMakeLists.txt
-+++ b/arch/posix/CMakeLists.txt
-@@ -20,8 +20,6 @@ if (${_index} GREATER -1 OR "${UA_ARCHITECTURE}" STREQUAL "posix")
-           ua_architecture_append_to_library(netdb ndblib socket)
-         else()
-           ua_architecture_append_to_library(m)
--          #TODO - Error on first make run if pthread is included conditional?
--          ua_architecture_append_to_library(pthread)
-           if(UA_MULTITHREADING OR UA_BUILD_UNIT_TESTS)
-             ua_architecture_append_to_library(pthread)
-           endif()
--- 
-2.29.2
-
diff --git a/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch b/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch
deleted file mode 100644
index dea325c17..000000000
--- a/package/open62541/0003-fix-core-Explicit-cast-to-avoid-compiler-warning.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 0c53fd776af9631c915c8722e1d68ce9a69fa3f6 Mon Sep 17 00:00:00 2001
-From: Andreas Walter <andreas.walter@waltronix.de>
-Date: Fri, 26 Feb 2021 11:49:25 +0100
-Subject: [PATCH] fix(core): Explicit cast to avoid compiler warning (#4203)
-
-[Retrieved from:
-https://github.com/open62541/open62541/commit/0c53fd776af9631c915c8722e1d68ce9a69fa3f6]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/ua_types_encoding_binary.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/ua_types_encoding_binary.c b/src/ua_types_encoding_binary.c
-index 0fe88eb98e0..abbd23735d3 100644
---- a/src/ua_types_encoding_binary.c
-+++ b/src/ua_types_encoding_binary.c
-@@ -319,7 +319,7 @@ static long double
- unpack754(uint64_t i, unsigned bits, unsigned expbits) {
-     unsigned significandbits = bits - expbits - 1;
-     long double result = (long double)(i&(uint64_t)((1LL<<significandbits)-1));
--    result /= (1LL<<significandbits);
-+    result /= (long double)(1LL<<significandbits);
-     result += 1.0f;
-     unsigned bias = (unsigned)(1<<(expbits-1)) - 1;
-     long long shift = (long long)((i>>significandbits) & (uint64_t)((1LL<<expbits)-1)) - bias;
diff --git a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
deleted file mode 100644
index 9e6dda26e..000000000
--- a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From a439daafdc98391eed13e23f93ecfca81d71c731 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 2 Aug 2021 09:49:48 +0200
-Subject: [PATCH] CMakeLists.txt: add UA_FORCE_WERROR
-
-Allow the user to disable -Werror to avoid the following build failures:
-
-/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c: In function 'connection_recv':
-/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c:96:5: error: conversion to 'unsigned int' from 'int' may change the sign of the result [-Werror=sign-conversion]
-   96 |     UA_fd_set(connection->sockfd, &fdset);
-      |     ^~~~~~~~~
-
-/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c: In function 'UA_PubSubChannelUDPMC_receive':
-/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c:477:21: error: conversion to '__suseconds_t' {aka 'int'} from 'UA_UInt32' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
-  477 |     tmptv.tv_usec = (long int)(timeout % 1000000);
-      |                     ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/911811de81d8abb2a31feb8f27af1592641c6fbc
- - http://autobuild.buildroot.org/results/f0187b3f2d62e955fddeef4e90f84ba4fd642bd2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/open62541/open62541/pull/4572]
----
- CMakeLists.txt | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index bc839f27..963460d0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -257,6 +257,8 @@ if(UA_FORCE_CPP)
-     add_definitions(-D__STDC_CONSTANT_MACROS) # We need the UINT32_C define
- endif()
- 
-+option(UA_FORCE_WERROR "Force compilation with -Werror" ON)
-+
- #General PubSub setup
- option(UA_ENABLE_PUBSUB "Enable publish/subscribe" OFF)
- mark_as_advanced(UA_ENABLE_PUBSUB)
-@@ -526,7 +528,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
-     check_add_cc_flag("-Wall")      # Warnings
-     check_add_cc_flag("-Wextra")    # More warnings
-     check_add_cc_flag("-Wpedantic") # Standard compliance
--    check_add_cc_flag("-Werror")    # All warnings are errors
-+    if(UA_FORCE_WERROR)
-+        check_add_cc_flag("-Werror")    # All warnings are errors
-+    endif()
- 
-     check_add_cc_flag("-Wno-static-in-inline") # Clang doesn't like the use of static inline methods inside static inline methods
-     check_add_cc_flag("-Wno-overlength-strings") # May happen in the nodeset compiler when complex values are directly encoded
--- 
-2.30.2
-
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 3257bfe47..c7234fd81 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e2e1b8e6285c4fd6d8e07f37d61a8728376d525e169fadb3d61918fa6a7c271a  open62541-v1.2.4-br1.tar.gz
+sha256  b8f4bf73d50d3dc0e2e7343f03df7cd07ad169ff66056d5c392215662b1f8fc8  open62541-v1.3.1-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 87bd3449b..1958befae 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.2.4
+OPEN62541_VERSION = v1.3.1
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
