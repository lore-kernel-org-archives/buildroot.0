Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7116BC77B75
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 20:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0AFE4271E;
	Tue,  9 May 2023 20:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0AFE4271E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZaEZu63Lm62; Tue,  9 May 2023 20:13:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F13742778;
	Tue,  9 May 2023 20:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F13742778
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BB8F1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D93F161678
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D93F161678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wy8fdE4wTE8v for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6436E6166D
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6436E6166D
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:12:36 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso11954181a12.2
 for <buildroot@buildroot.org>; Tue, 09 May 2023 13:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683663154; x=1686255154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CsMEMz4poztavjJuQuyIlPm7n7LLI/hD/3TXsH2Gb4g=;
 b=FFmUjPzpgERbffV0Fd+XEi2/9LOMFRkQ/MZP/N/3mVJfgquU3oxkBNoL9XlcMOIvHg
 UmAL7K9kLL3QrpWtbzEWQK/TNlGqxuAWP/7e5DpkhtfibwWBSBOkuf1ZfobMJkOiPWyR
 aazfGQaPRdsReI87YizFseSYuJwIi2NAdYlKmGwGJeLn73iw86y/mlSKz3Q9wYiqwbv/
 ILhvLG6RAJ8xECsZusIzaZDjAPycOFOPPEdGh2eYFTmRx11OFYcvM870eHNzOcGWnPrD
 hynGQhLWtoPd3XQepJLg5NoUjgKFJmnAPQyR1x4wIR4xeOZvvRDg8ewvsEiZhvn+Nm8X
 5rEQ==
X-Gm-Message-State: AC+VfDxwJf05/78GuNDuC9K01JcuRKepX9r3lmotVq8Po/zHIESFeyuM
 K/IoBmtXs4R/HG5On47Ay7iVd8eRSuoiITbJ8dbhQA==
X-Google-Smtp-Source: ACHHUZ7KNiTFmeCZExY5vVvren6206yPB9x5KSmZUWbtJkyup5T/YZqf0Io36KW5xE62zQSLQ2qruw==
X-Received: by 2002:a05:6402:1256:b0:50b:c5dc:28d8 with SMTP id
 l22-20020a056402125600b0050bc5dc28d8mr12400716edw.16.1683663154039; 
 Tue, 09 May 2023 13:12:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-40-97-5.business.telecomitalia.it. [79.40.97.5])
 by smtp.gmail.com with ESMTPSA id
 r23-20020aa7da17000000b00506987c5c71sm1157936eds.70.2023.05.09.13.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 May 2023 13:12:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  9 May 2023 22:11:51 +0200
Message-Id: <20230509201153.2413972-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
References: <20230509201153.2413972-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1683663154; x=1686255154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CsMEMz4poztavjJuQuyIlPm7n7LLI/hD/3TXsH2Gb4g=;
 b=MYr6VytjXnPaWA10EPKoRSKca+DGg2AsNqxF0ZBRZDFUA8GddG1dgATxjQkIdnBZ8g
 4eExxOZKIsu6Ryt5SmYwpR2fumjvWQ7UXCtK9UD+mSu4BV4P/pii79IF6lwP6dm9u0fn
 p9Q320SXeKarFiutPJpJZxNnwItrR45tlXkMw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=MYr6Vytj
Subject: [Buildroot] [PATCH 2/4] package/can-utils: enable compilation on
 MMU-less systems
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Systems that lack a MMU cannot use fork() to create the child process.
The added upstream patch does not compile the affected programs on
MMU-less systems.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...ograms-using-fork-on-MMU-less-system.patch | 257 ++++++++++++++++++
 package/can-utils/Config.in                   |   1 -
 2 files changed, 257 insertions(+), 1 deletion(-)
 create mode 100644 package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch

diff --git a/package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch b/package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch
new file mode 100644
index 000000000000..3a18183b3d85
--- /dev/null
+++ b/package/can-utils/0001-Don-t-compile-programs-using-fork-on-MMU-less-system.patch
@@ -0,0 +1,257 @@
+From 5ed3b4ded6cf3e4de6fc8c8739b84231b0285b0e Mon Sep 17 00:00:00 2001
+From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Date: Fri, 5 May 2023 08:57:45 +0200
+Subject: [PATCH] Don't compile programs using fork() on MMU-less systems
+
+Systems that lack a MMU cannot use fork() to create the child process.
+The patch does not compile the affected programs on MMU-less systems.
+
+Co-developed-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://github.com/linux-can/can-utils/pull/426
+---
+ CMakeLists.txt | 15 ++++++++++++---
+ GNUmakefile.am | 10 +++++++---
+ Makefile       | 16 +++++++++++++---
+ check_cc.sh    | 16 ++++++++++++++++
+ configure.ac   |  2 ++
+ fork_test.c    | 27 +++++++++++++++++++++++++++
+ 6 files changed, 77 insertions(+), 9 deletions(-)
+ create mode 100755 check_cc.sh
+ create mode 100644 fork_test.c
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 09ccd805de66..aee8ff7fca02 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,6 +2,7 @@ cmake_minimum_required(VERSION 3.3)
+ 
+ project(can-utils LANGUAGES C)
+ 
++include (CheckFunctionExists)
+ include (CheckSymbolExists)
+ include (GNUInstallDirs)
+ 
+@@ -25,12 +26,13 @@ set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DSCM_TXTIME=SO_TXTIME")
+ include_directories (.)
+ include_directories (./include)
+ 
++check_function_exists(fork HAVE_FORK)
++
+ set(PROGRAMS_CANLIB
+     asc2log
+     canbusload
+     candump
+     cangen
+-    canlogserver
+     canplayer
+     cansend
+     cansequence
+@@ -39,6 +41,10 @@ set(PROGRAMS_CANLIB
+     slcanpty
+ )
+ 
++if(HAVE_FORK)
++    list(APPEND PROGRAMS_CANLIB canlogserver)
++endif()
++
+ set(PROGRAMS_J1939
+     j1939acd
+     j1939cat
+@@ -49,7 +55,6 @@ set(PROGRAMS_J1939
+ 
+ set(PROGRAMS
+     ${PROGRAMS_CANLIB}
+-    bcmserver
+     canfdtest
+     cangw
+     cansniffer
+@@ -57,13 +62,17 @@ set(PROGRAMS
+     isotpperf
+     isotprecv
+     isotpsend
+-    isotpserver
+     isotpsniffer
+     isotptun
+     slcan_attach
+     slcand
+ )
+ 
++if(HAVE_FORK)
++    list(APPEND PROGRAMS bcmserver)
++    list(APPEND PROGRAMS isotpserver)
++endif()
++
+ add_executable(can-calc-bit-timing
+     calc-bit-timing/can-calc-bit-timing.c
+ )
+diff --git a/GNUmakefile.am b/GNUmakefile.am
+index 5a7ad75f682e..e818754db3a4 100644
+--- a/GNUmakefile.am
++++ b/GNUmakefile.am
+@@ -75,14 +75,12 @@ EXTRA_DIST += \
+ 
+ bin_PROGRAMS = \
+ 	asc2log \
+-	bcmserver \
+ 	can-calc-bit-timing \
+ 	canbusload \
+ 	candump \
+ 	canfdtest \
+ 	cangen \
+ 	cangw \
+-	canlogserver \
+ 	canplayer \
+ 	cansend \
+ 	cansequence \
+@@ -91,7 +89,6 @@ bin_PROGRAMS = \
+ 	isotpperf \
+ 	isotprecv \
+ 	isotpsend \
+-	isotpserver \
+ 	isotpsniffer \
+ 	isotptun \
+ 	j1939acd \
+@@ -106,6 +103,13 @@ bin_PROGRAMS = \
+ 	slcanpty \
+ 	testj1939
+ 
++if HAVE_FORK
++bin_PROGRAMS += \
++	bcmserver \
++	canlogserver \
++	isotpserver
++endif
++
+ j1939acd_LDADD = libj1939.la
+ j1939cat_LDADD = libj1939.la
+ j1939spy_LDADD = libj1939.la
+diff --git a/Makefile b/Makefile
+index 29eef997b290..a26ff3d75e67 100644
+--- a/Makefile
++++ b/Makefile
+@@ -45,6 +45,8 @@ MAKEFLAGS := -k
+ 
+ CFLAGS := -O2 -Wall -Wno-parentheses
+ 
++HAVE_FORK := $(shell ./check_cc.sh "$(CC)" fork_test.c)
++
+ CPPFLAGS += \
+ 	-I. \
+ 	-Iinclude \
+@@ -66,10 +68,14 @@ PROGRAMS_ISOTP := \
+ 	isotpperf \
+ 	isotprecv \
+ 	isotpsend \
+-	isotpserver \
+ 	isotpsniffer \
+ 	isotptun
+ 
++ifeq ($(HAVE_FORK),1)
++PROGRAMS_ISOTP += \
++	isotpserver
++endif
++
+ PROGRAMS_J1939 := \
+ 	j1939acd \
+ 	j1939cat \
+@@ -87,14 +93,12 @@ PROGRAMS := \
+ 	$(PROGRAMS_J1939) \
+ 	$(PROGRAMS_SLCAN) \
+ 	asc2log \
+-	bcmserver \
+ 	can-calc-bit-timing \
+ 	canbusload \
+ 	candump \
+ 	canfdtest \
+ 	cangen \
+ 	cansequence \
+-	canlogserver \
+ 	canplayer \
+ 	cansend \
+ 	cansniffer \
+@@ -103,6 +107,12 @@ PROGRAMS := \
+ 	mcp251xfd-dump \
+ 	slcanpty
+ 
++ifeq ($(HAVE_FORK),1)
++PROGRAMS += \
++	canlogserver \
++	bcmserver
++endif
++
+ all: $(PROGRAMS)
+ 
+ clean:
+diff --git a/check_cc.sh b/check_cc.sh
+new file mode 100755
+index 000000000000..d85ad129da9d
+--- /dev/null
++++ b/check_cc.sh
+@@ -0,0 +1,16 @@
++#!/bin/sh
++# SPDX-License-Identifier: GPL-2.0-only
++# check_cc.sh - Helper to test userspace compilation support
++# Copyright (c) 2015 Andrew Lutomirski
++
++CC="$1"
++TESTPROG="$2"
++shift 2
++
++if [ -n "$CC" ] && $CC -o /dev/null "$TESTPROG" -O0 "$@"; then
++    echo 1
++else
++    echo 0
++fi
++
++exit 0
+diff --git a/configure.ac b/configure.ac
+index 5493c9c7ccdf..9bf62a5c6409 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -76,6 +76,8 @@ AC_CHECK_FUNCS([ \
+ 	strtoul \
+ ])
+ 
++AM_CONDITIONAL(HAVE_FORK, test "$ac_cv_func_fork_works" = "yes")
++
+ # glibc versions before 2.17 needs to link with -lrt for clock_nanosleep
+ AC_SEARCH_LIBS([clock_nanosleep], [rt])
+ 
+diff --git a/fork_test.c b/fork_test.c
+new file mode 100644
+index 000000000000..036692392483
+--- /dev/null
++++ b/fork_test.c
+@@ -0,0 +1,27 @@
++/* SPDX-License-Identifier: GPL-2.0-only */
++/*
++ * Copyright (C) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the version 2 of the GNU General Public License
++ * as published by the Free Software Foundation
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, see <http://www.gnu.org/licenses/>.
++ */
++
++#include <stdio.h>
++#include <sys/types.h>
++#include <unistd.h>
++
++int main(int argc, char **argv)
++{
++	fork();
++
++	return 0;
++}
+-- 
+2.32.0
+
diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index bdc84b461afc..a33919a20867 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_CAN_UTILS
 	bool "can-utils"
-	depends on BR2_USE_MMU # fork()
 	help
 	  SocketCAN is a set of open source CAN drivers and a
 	  networking stack.
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
