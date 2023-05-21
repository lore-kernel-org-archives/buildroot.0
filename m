Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E671FC77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 08:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 662DF60B9A;
	Sun, 21 May 2023 08:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 662DF60B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lLL4LDxLxie3; Sun, 21 May 2023 08:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C7FD60B12;
	Sun, 21 May 2023 08:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C7FD60B12
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B513A1BF3D8
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E6DF82C3C
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 08:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E6DF82C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hn-0tXRz8sHU for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 08:20:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E1F482C35
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E1F482C35
 for <buildroot@busybox.net>; Sun, 21 May 2023 08:20:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6007edea5so3645795e9.0
 for <buildroot@busybox.net>; Sun, 21 May 2023 01:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684657238; x=1687249238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DXqTZJE3MxHsu5a+6Ye7VPXaXQAmzxRrd4u4Z/vNd7c=;
 b=L2f5U5z8rAEhmM6iH1GQtvPkYJHTbYqOef4NgPr3jcxpfF2771Ctp/pOlD4k9BxW+b
 vmFDeK0qW9PeTHrLuSHRiiDbhEEMu2DLEIuLKUHrs5R9H6itI7xHADBOolAomjeSv7TA
 h2K7CBmlcin/V1cb2vL5zrduVd3K4qW879MFuuPG1tYIxz5wlZ0RUwQIFwoQpqGNqWao
 EF3ZI2ejpmZDInSeo+N0jbcVEAneCYcCIuQ7g/RFtNw9RIaXLX+4VMSEIXMFR4ZYBXcE
 xMOs7tbCS+DiYt8MCmwEVa1I57Tq85vhQwM6zULSc6gulodCRSxNZd/ZGTCVYqhb5lMt
 7UcQ==
X-Gm-Message-State: AC+VfDy3jbJgEnzp1hh9E49aDo9Yt7iSpRy9eqVlgMMt7fXpBARhhA35
 O3F+5kFEqMbDVWzrbYNgqhp9e8PxKys=
X-Google-Smtp-Source: ACHHUZ4R6QQr6AzpI7e2GZicOZggJItIsm5VzPmGzI2FiydYFOHkfbz2KWI76NAlcOHhOy5ojHJNsQ==
X-Received: by 2002:adf:e401:0:b0:309:4176:702 with SMTP id
 g1-20020adfe401000000b0030941760702mr5452457wrm.37.1684657238040; 
 Sun, 21 May 2023 01:20:38 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:e03:bd00:5ffe:deec:ec3f:c958])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a056000104e00b00307b5376b2csm3965668wrx.90.2023.05.21.01.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 01:20:37 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Sun, 21 May 2023 10:20:32 +0200
Message-Id: <20230521082032.17237-1-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684657238; x=1687249238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DXqTZJE3MxHsu5a+6Ye7VPXaXQAmzxRrd4u4Z/vNd7c=;
 b=VbA0bAX3elgcw34XJWlLXxbZGgFps2odl9OqN67OEeVOT7jlJIUNsbFNSN66tyzXHF
 pe/hWPwGywL2a+34PkndfaSJEhyS056weW7lIU9JUPLvv+9YwoyGBWxqhE4bxNrnZePT
 uqh5oEtJ1nZh/05zeNoePkL8GJwA6kkuXKeYcn54bA3J2/y86T/YfjXFychhATKEx6jj
 xfaZo0l4nFh6IHLWJWFVjHA6hOAFROcVFLaN5Z44iWd/RL3vtWHk6M82i6J0bVf4xS9K
 fLe5GH4dAM47erWhuQNuzjreHRWSIZco8gI4hIUPd7vh3eLRxdV69LAAs2iCTteB9A0k
 gHWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VbA0bAX3
Subject: [Buildroot] [PATCH 1/1] package/mbw: bump to version 2.0
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 ...1-CMakeLists.txt-fix-build-without-C.patch | 38 -------------------
 package/mbw/mbw.hash                          |  4 +-
 package/mbw/mbw.mk                            |  6 +--
 3 files changed, 5 insertions(+), 43 deletions(-)
 delete mode 100644 package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch

diff --git a/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch b/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index 2c2585ebe2..0000000000
--- a/package/mbw/0001-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 059f67459912bba6d7f605b7c43519ff547f3a80 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 7 Aug 2022 11:34:19 +0200
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Fix the following build failure without C++:
-
-CMake Error at CMakeLists.txt:3 (project):
-  No CMAKE_CXX_COMPILER could be found.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Fixes:
- - http://autobuild.buildroot.org/results/17e2d6e6d6ddf7845a37a8bbf733faf40d9faa61
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/raas/mbw/pull/14]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d3d4fcd..3b2cb3e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,6 +1,6 @@
- cmake_minimum_required(VERSION 3.10)
- 
--project(mbw VERSION 1.5)
-+project(mbw VERSION 1.5 LANGUAGES C)
- 
- add_executable(mbw mbw.c)
- install(TARGETS mbw DESTINATION bin)
--- 
-2.35.1
-
diff --git a/package/mbw/mbw.hash b/package/mbw/mbw.hash
index 74e38992de..d58d7a5d44 100644
--- a/package/mbw/mbw.hash
+++ b/package/mbw/mbw.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3c396ce09bb78c895e4d45e99b1ae07f80e3ea5eee59d78ed2048a7f2ae591ae  mbw-1.5.tar.gz
-sha256  1afb2b8258506742238b9ceb8a865d7030c5889c56ba2911a0c0c042aa1335d1  mbw.spec
+sha256  557f670e13ff663086fe239e4184d8ca6154b004bd5fde2b0a748e5aa543c87f  mbw-2.0.tar.gz
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/mbw/mbw.mk b/package/mbw/mbw.mk
index 755a9f5293..04d6ea3494 100644
--- a/package/mbw/mbw.mk
+++ b/package/mbw/mbw.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MBW_VERSION = 1.5
+MBW_VERSION = 2.0
 MBW_SITE = $(call github,raas,mbw,v$(MBW_VERSION))
-MBW_LICENSE = LGPL-2.1
-MBW_LICENSE_FILES = mbw.spec
+MBW_LICENSE = GPL-3.0+
+MBW_LICENSE_FILES = LICENSE
 
 $(eval $(cmake-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
