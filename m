Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30258C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C669581F33;
	Thu, 16 Mar 2023 08:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C669581F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id so6Ruba9mjux; Thu, 16 Mar 2023 08:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD94381F47;
	Thu, 16 Mar 2023 08:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD94381F47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16BE71BF3D5
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D910408D4
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D910408D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZYWIdMs1NpD for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D39D6408A5
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D39D6408A5
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:03 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id m22so450239ioy.4
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ToZBQfiHuQuDFKwD93uO4eXCNw/XmN8vvT493SXP+4=;
 b=5mrebc94bxBdRGc+Cb1GGsGJuEqiN0LwT2kYQUd4vzvfEtqJDmZOTxXUIMR4rdGdVe
 nsfL8MzpKkq8Rvxjj5q44Enf3secSvJYNCz2ibfp+pufDZCyJnvJXQUVg5sJdj1EDPre
 D1SVRUekCkLLYB6y+2519Rkohbesq+58qkTN5w5UTddwcAKjGLetUOJcc5/Gsg+WKNyK
 pDHkCOk1o1TUYabhQJGhMeDfTg/8UvQG2q5A7uQUO9fyAYxp+EGVA/7dVZJpSnjP6ma+
 H5hN406zJOzJHXcEUTniIz/Q6o/pxJiCxzIN80c0WjQakQOMIWPph+9MFCKvFcIcMEdp
 +jvA==
X-Gm-Message-State: AO0yUKXrom+HXN3SSjsQphfUqi3qhlnINgZVTq7Frgc1KhtLVTeyMFkF
 8IAT5uYGgEctgVuxwnQa+PzcFJ9AcVDHrQ==
X-Google-Smtp-Source: AK7set9TyX9Xm4i2HcdWBCyuBTr1RQbhfS1UYTCzyjPiF+2QTWdvFVVuFMB6p4W7sIlJS5BkSeV/Mg==
X-Received: by 2002:a6b:d601:0:b0:74f:a1c6:762 with SMTP id
 w1-20020a6bd601000000b0074fa1c60762mr5806751ioa.11.1678955703289; 
 Thu, 16 Mar 2023 01:35:03 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:35:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:36 -0600
Message-Id: <20230316083440.3466725-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955703;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ToZBQfiHuQuDFKwD93uO4eXCNw/XmN8vvT493SXP+4=;
 b=DgJcK7ZrpQwoG3uRicS5OOQzg9LErbG+6/0cQKzwxP0jn7m0XNIIJackkM1eNBFg2d
 JnMqdxNKS4D7Sx9/sFFFNQXJ07KXAuZMlJ5AI/hKwUdR4jhSz4820y9EzwrjcH3c1Q/L
 q8oHx9Bp1h/TKlzCUZEHWIZd2PvP2SBHFUi52DK/kLBq+00RSbTyDi0QEttm6DfXFtNl
 Ff2e+yIgEPL+qHTrfk1Sif66m0uhZn/6xH19meSUGraDOuB/D2UtO7aV0n21M83A58jn
 ZpGDjE4zqYZmUCvDA7kYuO3hTJ6a0mBpSiGoRE0mBQ9Pgr+TFP+cLlsFLxu5UJ967E44
 Apdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DgJcK7Zr
Subject: [Buildroot] [PATCH v6 06/10] package/fp16: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

We need to add a patch to remove the c++ requirement.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - add patch fixing build without c++
Changes v4 -> v5:
  - add comment indicating library is header only
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 ...le-CXX-unless-building-tests-benchma.patch | 48 +++++++++++++++++++
 package/fp16/Config.in                        |  8 ++++
 package/fp16/fp16.hash                        |  4 ++
 package/fp16/fp16.mk                          | 20 ++++++++
 6 files changed, 82 insertions(+)
 create mode 100644 package/fp16/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
 create mode 100644 package/fp16/Config.in
 create mode 100644 package/fp16/fp16.hash
 create mode 100644 package/fp16/fp16.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 24c571544d..12b33c5fbc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2687,6 +2687,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/fp16/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index ac9241f18b..4878e8ba2f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2036,6 +2036,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
+	source "package/fp16/Config.in"
 	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
diff --git a/package/fp16/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch b/package/fp16/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
new file mode 100644
index 0000000000..b3c5219d59
--- /dev/null
+++ b/package/fp16/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch
@@ -0,0 +1,48 @@
+From eba14b5277ed8f155eb333f4bbe9f99366e3dece Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Sun, 29 Jan 2023 21:43:50 -0700
+Subject: [PATCH] CMake: don't enable CXX unless building tests/benchmarks
+
+We only need CXX support when building tests/benchmarks.
+
+Fixes:
+CMake Error at CMakeLists.txt:6 (PROJECT):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/Maratyszcza/FP16/pull/22]
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5e7d127..8028c07 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,13 +3,17 @@ CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12 FATAL_ERROR)
+ INCLUDE(GNUInstallDirs)
+ 
+ # ---[ Project
+-PROJECT(FP16 C CXX)
++PROJECT(FP16 C)
+ 
+ # ---[ Options.
+ OPTION(FP16_BUILD_TESTS "Build FP16 unit tests" ON)
+ OPTION(FP16_BUILD_BENCHMARKS "Build FP16 micro-benchmarks" ON)
+ 
+ # ---[ CMake options
++IF(FP16_BUILD_TESTS OR FP16_BUILD_BENCHMARKS)
++  ENABLE_LANGUAGE(CXX)
++ENDIF()
++
+ IF(FP16_BUILD_TESTS)
+   ENABLE_TESTING()
+ ENDIF()
+-- 
+2.34.1
+
diff --git a/package/fp16/Config.in b/package/fp16/Config.in
new file mode 100644
index 0000000000..e07c6ebb8a
--- /dev/null
+++ b/package/fp16/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FP16
+	bool "fp16"
+	select BR2_PACKAGE_PSIMD
+	help
+	  Header-only library for conversion to/from half-precision
+	  floating point formats.
+
+	  https://github.com/Maratyszcza/FP16
diff --git a/package/fp16/fp16.hash b/package/fp16/fp16.hash
new file mode 100644
index 0000000000..63634eb2cf
--- /dev/null
+++ b/package/fp16/fp16.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  a91f4770ff9c39f4d72e339c379f566b3bbb359fa66122d85fc0bae3dde7abc7  fp16-0a92994d729ff76a58f692d3028ca1b64b145d91.tar.gz
+# License files, locally calculated
+sha256  17e4f539024be2749ee729d1e2f01d24cef12ece8c9bf18e91a4349be29c80bf  LICENSE
diff --git a/package/fp16/fp16.mk b/package/fp16/fp16.mk
new file mode 100644
index 0000000000..80710523fb
--- /dev/null
+++ b/package/fp16/fp16.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# fp16
+#
+################################################################################
+
+FP16_VERSION = 0a92994d729ff76a58f692d3028ca1b64b145d91
+FP16_SITE = $(call github,Maratyszcza,FP16,$(FP16_VERSION))
+FP16_LICENSE = MIT
+FP16_LICENSE_FILES = LICENSE
+FP16_INSTALL_STAGING = YES
+# Only installs a header
+FP16_INSTALL_TARGET = NO
+FP16_DEPENDENCIES = psimd
+FP16_CONF_OPTS = \
+	-DFP16_BUILD_TESTS=OFF \
+	-DFP16_BUILD_BENCHMARKS=OFF \
+	-DPSIMD_SOURCE_DIR="$(PSIMD_DIR)"
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
