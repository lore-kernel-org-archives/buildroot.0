Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C24FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 22:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F17CE4090F;
	Thu, 25 Nov 2021 22:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qor48YtXYnCt; Thu, 25 Nov 2021 22:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40B8140250;
	Thu, 25 Nov 2021 22:33:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8E2B1BF311
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 22:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD57F401FC
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 22:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fP7ZF7nTpV8P for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 22:33:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A29A6400A4
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 22:33:19 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id a18so14537486wrn.6
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 14:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qE4sem+F5WnvP+xS2UBEZqeiF2WZFdIIrKzkZzCmiKg=;
 b=Dk3gFC847NeMiC2f0v7Ye409xLUowRTDeYN5tJA0g3oB4skw79cnJ1F3HUQ9wJTamI
 jPYE7b6aroKISpnEc/KxWLCR3C+p2iff+jI15eyZMC9qzn2TfPghHo8AVDRTtadnIAAi
 iXwRMygZo2t8fw362EfgM/nyU9AIeuqSC4EqLcyYpIxcp1tGpCkzVD/8hPmOgmwtvGuV
 ov5jQ+OVi/IDwx2WUQFQVdRZrKtC4T2cpih3KBOvgR6AKyGWQUxg+2IZ12LblVkU5MZv
 451NWPA/C83u3q1Pmz8AAJYgBNcewSSXnAIi4T34Q7W43CpYSDL49R767sy6eHBb9uCA
 9MVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qE4sem+F5WnvP+xS2UBEZqeiF2WZFdIIrKzkZzCmiKg=;
 b=MAO9MAF3pGGEBehBM89EwQ2BPTNmOtOTgp/66SezlBCEAzgxJ/YJD+EaUol01OYOLf
 ioi7lbXkKa1Fi8WfgAqXVKYinaRZrYGmBxDaMigByTsQw21DKYnxV9DTzBj7psB9lI28
 XXhVkAVAkINnb4KZ2to64/wEAqIu9yTFVlwJyS55XLxeNY5Lx+At33OcsWtKxmsLCzU/
 3j9IfPj/JYFXsoejclA3wbpigCc77GkAktoQXv5byYtSQBHS0dtbc3DuaOKazqkdkyHE
 WqCkG+cu+2k+fwiHTlACqGS/5ODoIVY+hXZ+BSNb+maZNvNHYsE5Ei4GntH8G8DHtvcJ
 Hn+g==
X-Gm-Message-State: AOAM532RfUGSGAjbe2i2MOdx06T35xP6bPqnELQPsY1PFU22VIdRWiu6
 hGSJyLC6FVmQVMxeybvJFrl5Q31ySL4=
X-Google-Smtp-Source: ABdhPJwFT4Ot0aVQfGOuWp+ChP7vwHSachWkYi/Hg8JTjS5xu3WTb/j1HQ984dw2pZGpb6yRdJ65mw==
X-Received: by 2002:a05:6000:162b:: with SMTP id
 v11mr10017959wrb.481.1637879597714; 
 Thu, 25 Nov 2021 14:33:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id v6sm9042897wmh.8.2021.11.25.14.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 14:33:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 23:30:43 +0100
Message-Id: <20211125223043.397316-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/azmq: bump to version 1.0.3
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
Cc: RJ Ascani <rj.ascani@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patch and use AZMQ_NO_TESTS which is available since
  https://github.com/zeromq/azmq/commit/3548638b9b3452a0526a1acb340ca7a92acf4f7c
- boost log (and so NPTL) is not a dependency since
  https://github.com/zeromq/azmq/commit/3548638b9b3452a0526a1acb340ca7a92acf4f7c
- boost regex is not a dependency since
  https://github.com/zeromq/azmq/commit/209ccdc318bee195c92eaf86ed2fcc4acf08be1e
- Update indentation in hash file (two spaces)

https://github.com/zeromq/azmq/releases/tag/v1.0.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...tionally-disable-test-and-doc-builds.patch | 43 -------------------
 package/azmq/Config.in                        |  8 ++--
 package/azmq/azmq.hash                        |  5 +--
 package/azmq/azmq.mk                          |  4 +-
 4 files changed, 8 insertions(+), 52 deletions(-)
 delete mode 100644 package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch

diff --git a/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch b/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch
deleted file mode 100644
index 98975d27ed..0000000000
--- a/package/azmq/0001-Conditionally-disable-test-and-doc-builds.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From d960f93fb52e373f76cfedbee5f4fb0c5276856a Mon Sep 17 00:00:00 2001
-From: RJ Ascani <rj.ascani@gmail.com>
-Date: Thu, 20 Jul 2017 15:53:40 -0700
-Subject: [PATCH] Conditionally disable test and doc builds
-
-Signed-off-by: RJ Ascani <rj.ascani@gmail.com>
----
- CMakeLists.txt | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5b5b9cc..97006a4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -49,7 +49,9 @@ include_directories(${Boost_INCLUDE_DIRS}
-                     ${ZeroMQ_INCLUDE_DIRS}
-                     ${PROJECT_SOURCE_DIR})
-
--enable_testing()
-+if (BUILD_TESTING)
-+    enable_testing()
-+endif()
-
- macro(add_catch_test name)
-     if (TEST_REPORT_FORMAT)
-@@ -59,8 +61,12 @@ macro(add_catch_test name)
-     endif()
- endmacro()
-
--add_subdirectory(test)
--add_subdirectory(doc)
-+if (BUILD_TESTING)
-+    add_subdirectory(test)
-+endif()
-+if (BUILD_DOC)
-+    add_subdirectory(doc)
-+endif()
-
- install(DIRECTORY ${PROJECT_SOURCE_DIR}/azmq
-         DESTINATION include)
---
-2.13.3
-
diff --git a/package/azmq/Config.in b/package/azmq/Config.in
index 37131a260a..7bdd07ebf8 100644
--- a/package/azmq/Config.in
+++ b/package/azmq/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_AZMQ
 	bool "azmq"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # boost-log
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, zeromq
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_WCHAR # boost
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
@@ -11,9 +11,7 @@ config BR2_PACKAGE_AZMQ
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_CHRONO
 	select BR2_PACKAGE_BOOST_DATE_TIME
-	select BR2_PACKAGE_BOOST_LOG
 	select BR2_PACKAGE_BOOST_RANDOM
-	select BR2_PACKAGE_BOOST_REGEX
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	help
@@ -21,10 +19,10 @@ config BR2_PACKAGE_AZMQ
 
 	  https://github.com/zeromq/azmq
 
-comment "azmq needs a toolchain w/ C++11, wchar and NPTL"
+comment "azmq needs a toolchain w/ C++11, wchar and threads"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS_NPTL)
+		&& BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
 
 comment "azmq needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/azmq/azmq.hash b/package/azmq/azmq.hash
index f5d24e79ce..6caf53582a 100644
--- a/package/azmq/azmq.hash
+++ b/package/azmq/azmq.hash
@@ -1,4 +1,3 @@
 # Locally calculated
-# https://github.com/zeromq/azmq/archive/v1.0.2.tar.gz
-sha256 25fa8b07756cffae95e25a55c7ea42efe02e8cd797552201aa771dd69cfc8fbf  azmq-1.0.2.tar.gz
-sha256 c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-BOOST_1_0
+sha256  80cfb951c5614b8c2e55a59ea2e5723a18ebed08da80e5420e525d6bf273771a  azmq-1.0.3.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-BOOST_1_0
diff --git a/package/azmq/azmq.mk b/package/azmq/azmq.mk
index 918c6e1a36..a72b155664 100644
--- a/package/azmq/azmq.mk
+++ b/package/azmq/azmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AZMQ_VERSION = 1.0.2
+AZMQ_VERSION = 1.0.3
 AZMQ_SITE = $(call github,zeromq,azmq,v$(AZMQ_VERSION))
 AZMQ_DEPENDENCIES = boost zeromq
 AZMQ_LICENSE = BSL-1.0
@@ -15,4 +15,6 @@ AZMQ_LICENSE_FILES = LICENSE-BOOST_1_0
 AZMQ_INSTALL_STAGING = YES
 AZMQ_INSTALL_TARGET = NO
 
+AZMQ_CONF_OPTS = -DAZMQ_NO_TESTS=ON
+
 $(eval $(cmake-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
