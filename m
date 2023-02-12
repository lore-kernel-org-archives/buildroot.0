Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22703C636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 14:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7D7410A6;
	Sun, 12 Feb 2023 14:43:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D7D7410A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqbFjhu1a_bh; Sun, 12 Feb 2023 14:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F79A4032E;
	Sun, 12 Feb 2023 14:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F79A4032E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 368361BF3B0
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 14:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 116234052C
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 14:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 116234052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOiqwXrFV8Wp for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 14:43:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0590740528
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0590740528
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 14:43:23 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bu23so9801024wrb.8
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 06:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=exMfaiCzuWWbsnRU/trk5jPRM1pxEzZ5SpK8NqlM7tQ=;
 b=ffcikZOWZ7qF+NJSTNhTsvtJRrKv3wd6EQiKcfp/MNGrzZsQtczUBbhmQ/j7HKmEHp
 k292dRvivUALaRXjD8qCWD1FZdNOYUtcYU9jy3q44jhNCblQpjfjOqicHnbOrB7cjaPB
 E9uABXDzZxXbqcqeu5+Si1ivB0NHL5X2kcqpBvVjEgP8stfrQ16ZMAEb23BYJmT79III
 mjSCs3ATXX0fPQQV8xogDkjsc25NNOnnyen4kdPkvJVhVOWWsh9Fj0qPvMoOJheMNfe6
 XlKMPa17JxpCULtrmC8SIgULWrGUFIJ1Q0yQ9HqKtjFloEsU9ZRC4h50j1Z8tngd+uYj
 keuw==
X-Gm-Message-State: AO0yUKXnNHdXtlyCcsqZOblvc1pvx7/6MLfiTmcPlEa5dDIKZMwd0kCm
 Jc3aHBeZ7I+X6fyOczmbofdUVqyPXRs=
X-Google-Smtp-Source: AK7set+Ja+eOA4+p6vEa/Z0nVe05EkA3++3mP91/h7DMIx9y71QdXwGt5eXzKDagOU7fbARQd5uIqA==
X-Received: by 2002:adf:f311:0:b0:2c5:530d:404e with SMTP id
 i17-20020adff311000000b002c5530d404emr2264705wro.30.1676213001760; 
 Sun, 12 Feb 2023 06:43:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r8-20020adff708000000b002c53cd6d281sm8248280wrp.4.2023.02.12.06.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 06:43:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 15:43:16 +0100
Message-Id: <20230212144316.1181860-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230212144316.1181860-1-fontaine.fabrice@gmail.com>
References: <20230212144316.1181860-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=exMfaiCzuWWbsnRU/trk5jPRM1pxEzZ5SpK8NqlM7tQ=;
 b=F10/H57rc3RI1xXvuCCH257VgSxSntf2yZsPrZszapQI2Vfm25CR2N3FlBCquAB3xB
 G9Yb67pfk+lo38/F7xvEy53JhO7TpedlbwutNJNP/P/O32XnkkF3Q7hYmR6qilHPLyLV
 59zRXSrYl3jcPAuiNPJXQF2Tci4eFIRcj6667NiMjSEp+sb+ses7GG1gpSqjWEjlzHz2
 8rZKLkY1SYi37JznnWLECWoXzQJj8LfU7+gqofGpl5Ok4SrRDSQLG+lau+XRDncYQ1y0
 PfLMXm2fdi85uNXLFjCk4DPCCtJiNLvLagStlgLu6eDwBTlF1VWCb6+RrGO60EFHlnRF
 nMjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F10/H57r
Subject: [Buildroot] [PATCH 2/2] package/libsolv: fix build without C++
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without C++ raised since the addition ot
the package in commit 93ce3c1be0753189d6af3ee9968b935037519c25:

CMake Error at CMakeLists.txt:1 (PROJECT):
  No CMAKE_CXX_COMPILER could be found.

  Tell CMake where to find the compiler by setting either the environment
  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
  to the compiler, or to the compiler name if it is in the PATH.

Fixes:
 - http://autobuild.buildroot.org/results/a7f2176d40f156c319754ef5d3b7fd0decfe754f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../libsolv/0001-Fix-build-without-C.patch    | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/libsolv/0001-Fix-build-without-C.patch

diff --git a/package/libsolv/0001-Fix-build-without-C.patch b/package/libsolv/0001-Fix-build-without-C.patch
new file mode 100644
index 0000000000..2389aebcde
--- /dev/null
+++ b/package/libsolv/0001-Fix-build-without-C.patch
@@ -0,0 +1,49 @@
+From 5691f58d1f8ce1332b02536e48f1ac5864629c6c Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Feb 2023 15:27:27 +0100
+Subject: [PATCH] Fix build without C++
+
+Fix the following build failure without C++:
+
+CMake Error at CMakeLists.txt:1 (PROJECT):
+  No CMAKE_CXX_COMPILER could be found.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a7f2176d40f156c319754ef5d3b7fd0decfe754f
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/openSUSE/libsolv/pull/520]
+---
+ CMakeLists.txt     | 2 +-
+ ext/CMakeLists.txt | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 3541f496..f899c49a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-PROJECT (libsolv)
++PROJECT (libsolv C)
+ 
+ CMAKE_MINIMUM_REQUIRED (VERSION 2.8.5)
+ 
+diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
+index f01c0238..589fa946 100644
+--- a/ext/CMakeLists.txt
++++ b/ext/CMakeLists.txt
+@@ -103,6 +103,7 @@ IF (ENABLE_CUDFREPO)
+ ENDIF (ENABLE_CUDFREPO)
+ 
+ IF (ENABLE_HAIKU)
++    enable_language(CXX)
+     SET (libsolvext_SRCS ${libsolvext_SRCS}
+ 	repo_haiku.cpp)
+     SET (libsolvext_HEADERS ${libsolvext_HEADERS}
+-- 
+2.39.0
+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
