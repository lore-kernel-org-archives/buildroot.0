Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D4AECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C35E40117;
	Sun, 30 Oct 2022 22:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C35E40117
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4VRLON-NWcM; Sun, 30 Oct 2022 22:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 334DC400D1;
	Sun, 30 Oct 2022 22:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 334DC400D1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3141BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 549EC402C3
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 549EC402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-eqgELVuavg for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:34:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DE00402B5
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DE00402B5
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:34:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id bk15so13633889wrb.13
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=viOB9XRj0lsdhAs+/CGOFd18G9YH1Yp8GI5QdCNToHQ=;
 b=xeyS1qKO6vOQlvXfuaAK2eTV+PXHz8CfHtpk6/A/KIjjE+isVRtnUyQmR8aaIus4za
 5A6tpHN2wWrKuXrGO0sOBODo2M9X5jHWi3LyuxwkG3D+iy1jrAQEGQ2I1xXIW3FQvBud
 m7wSwTD4x1NxGfSbP4yGssdB2sTnkBINIFpy+4R/PuxvciKPRDdRa5+ioJ98mti3io/V
 xP47O247MC6VlJfgcR30P97thIH3QDroJovqMV42uRaNZTDBlU/5x8mpr6esuGA+YHii
 Mi0ksz9gJpMRbYUb/+W7iKKodTrDE1zpqcP6zS+2yjBiW+HEUWqea6uDQopujWCYxug6
 Tn3A==
X-Gm-Message-State: ACrzQf2enJ45OvUe+etjgWLJMdp7SCfY2jqB8dIgMkFBugqfs/7KBUu8
 A/2xPWegMNn7zhOlJ8SYs9pRJTvivXM=
X-Google-Smtp-Source: AMsMyM4T4OfwMtI1+sLQ0j7vgEADGcOwmOUW0pdrs3ZU9ixIGcqMnYOPfD8q7YzbUNc4CgA0AWN6IQ==
X-Received: by 2002:a05:6000:1d83:b0:22c:aa0a:12 with SMTP id
 bk3-20020a0560001d8300b0022caa0a0012mr5973474wrb.471.1667169282832; 
 Sun, 30 Oct 2022 15:34:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l3-20020a05600c4f0300b003cf702b2fddsm1786178wmq.16.2022.10.30.15.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 15:34:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:34:40 +0100
Message-Id: <20221030223440.678755-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=viOB9XRj0lsdhAs+/CGOFd18G9YH1Yp8GI5QdCNToHQ=;
 b=CehHUqMLGXt/qUOlwW0U56O1XrkS/t9lb9YQy+fARxoK5IaLrWt7eYL4wNS+q7/uE0
 cWkcTfdNvyfTrAihsxlh19G8+YZwGvgWzLZOSCjF5w3SA8WgR5croIrYh06j/Muzhw1s
 QW+f1l+3qQ6KTmqsmgVJl7kqPHPnCKZ9dKE+N1lYsl6q+/IHgPtOGP3Rt/eNshwhXU1d
 hKCGOhwxzUMPElUQBGlFHPT7oCcdUECcLQDa0cTY6SFaB2tUueKvB2qIR5lwm5fClldA
 7U8A/FX1/THfxCJSnpWBgwv4LinBCmGIDdsqVbi5vg5rYTNH3P8fCdJqp7VDghTpZMEP
 boYA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CehHUqML
Subject: [Buildroot] [PATCH 1/1] package/log4cxx: bump to version 0.13.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which was merged:
https://github.com/apache/logging-log4cxx/commit/5240a3db1ba10e657b29c67ae8330f3a5b3d8774
and updated:
https://github.com/apache/logging-log4cxx/commit/b7284609ae0b6ae3798b19d3920480c4d7e670ba

https://logging.apache.org/log4cxx/latest_stable/changelog.html#0.13.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nly-check-for-boost-if-really-needed.patch | 36 -------------------
 package/log4cxx/log4cxx.hash                  |  4 +--
 package/log4cxx/log4cxx.mk                    |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch

diff --git a/package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch b/package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch
deleted file mode 100644
index 7df29ea120..0000000000
--- a/package/log4cxx/0001-boost-fallback-only-check-for-boost-if-really-needed.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 24e7adc8d67b3c8f7d275b4f9a7e70a61b73fcd4 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 28 Jan 2022 13:11:01 +0100
-Subject: [PATCH] boost-fallback: only check for boost if really needed
-
-- only check for boost if really needed (in case of legacy c++ standard < c++17)
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- src/cmake/boost-fallback/boost-fallback.cmake | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/cmake/boost-fallback/boost-fallback.cmake b/src/cmake/boost-fallback/boost-fallback.cmake
-index 8285b0b9..0ecf8c6c 100644
---- a/src/cmake/boost-fallback/boost-fallback.cmake
-+++ b/src/cmake/boost-fallback/boost-fallback.cmake
-@@ -55,6 +55,8 @@ try_compile(STD_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tes
- try_compile(STD_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
-     "${CMAKE_CURRENT_LIST_DIR}/test-stdatomic.cpp")
- 
-+# search for boost only in case needed for legacy c++ standard < c++17
-+if(NOT ${STD_THREAD_FOUND} OR NOT ${STD_MUTEX_FOUND} OR NOT ${STD_SHARED_MUTEX_FOUND} OR NOT ${STD_SHARED_PTR_FOUND} OR NOT ${STD_ATOMIC_FOUND})
- find_package(Boost COMPONENTS thread)
- if( ${Boost_FOUND} )
-     try_compile(Boost_SHARED_PTR_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
-@@ -67,6 +69,7 @@ if( ${Boost_FOUND} )
-     try_compile(Boost_ATOMIC_FOUND "${CMAKE_BINARY_DIR}/boost-fallback-compile-tests"
-         "${CMAKE_CURRENT_LIST_DIR}/test-boostatomic.cpp")
- endif( ${Boost_FOUND} )
-+endif()
- 
- # Link the target with the appropriate boost libraries(if required)
- function(boostfallback_link target)
--- 
-2.34.1
-
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 12633c8e57..8190f94aa3 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/logging/log4cxx/0.12.1/apache-log4cxx-0.12.1.tar.gz.sha512
-sha512  807058734cebf7c92e99484313becbc6be63e48bd930889c733318bb78dfec498b66aaa12255ed30879abb005b32e2b965f9dd87ec50d0421ca067f3f66280d9  apache-log4cxx-0.12.1.tar.gz
+# From https://www.apache.org/dist/logging/log4cxx/0.13.0/apache-log4cxx-0.13.0.tar.gz.sha512
+sha512  2a5f4fecc0415d942658c588774f0666082c497b6fd49bf64ab3328a997775206788c9b10a8c89208896c57da52fcc12c18d5d11ca1d3bf699e4633b8fcea6e5  apache-log4cxx-0.13.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index d20cc792a6..f50267d737 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 0.12.1
+LOG4CXX_VERSION = 0.13.0
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
