Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0824BC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81667417CE;
	Sun,  5 Nov 2023 21:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81667417CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ojRB0jSshGp; Sun,  5 Nov 2023 21:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19133417CC;
	Sun,  5 Nov 2023 21:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19133417CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF1B91BF45A
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87EED61056
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87EED61056
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIO10tfD6dD7 for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:46:40 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6F0D961054
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F0D961054
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so2901314f8f.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 13:46:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699220797; x=1699825597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZY/eglJAmKcrMaIzScz5DtCaWP8NZ2HvndFjdx2AtCU=;
 b=hqLCur3TLEtNGJANhAOfTV9Cj6nNB6Ie7MtsjK3k6zO+pE+HYvvdJULO6qId2peiev
 iuTUEquEjQGF8DQv6eIs3pTsN0YhfYlq8HfT0LDNFmeJ4EnnCpmuPynKFXg9dzAr21A1
 VYUCMWZPIQQHKK/LhqlNWycfQKOdzLe2UTd1Rt5c+m571V5HkMc1tTW0JL2/fDNPduK8
 L1pOrCLTHixGx3LJgo71kN3z53aCZWQswP2kjYxj/57EqHqe/dIGQDvz1kyc0n6nq7n3
 2Xig8OPSQQdz1nUBIECc2Ubvxost0m530ZKW6Y7zjlFQPiwUEEGoTCt7B7WJKZZXUSay
 e8ig==
X-Gm-Message-State: AOJu0Yw3iDFyJ3t5bFwQ/r6E0OyU3xMYZ+A/5k0obBDxFOVzJUsxMUqP
 bpC435umZ1nmaW8faoVuYoBWfMAJui0=
X-Google-Smtp-Source: AGHT+IHGyfWloO/D9OfBZ2TIKMQ3gi7drMFngBmTS2FoMx9wwGFOZx6kBxXxqcBebrutZs+hfDgnkg==
X-Received: by 2002:a5d:5847:0:b0:32f:88f9:ba44 with SMTP id
 i7-20020a5d5847000000b0032f88f9ba44mr9242162wrf.25.1699220797284; 
 Sun, 05 Nov 2023 13:46:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 dd23-20020a0560001e9700b0032f7f4d008dsm7716706wrb.20.2023.11.05.13.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 13:46:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 22:46:27 +0100
Message-ID: <20231105214627.90376-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699220797; x=1699825597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZY/eglJAmKcrMaIzScz5DtCaWP8NZ2HvndFjdx2AtCU=;
 b=HFNbGyVM7Y/8bxOSWycksoQanAewyCZmPCUlGflqHnIaXijIRRXqzFpaq7dY8nTo8j
 J1KyMVXGW9XDGsZr1SYzcC4z44tCMnt31YxEpUScgevHIJFTwg06orVqY6XfoZ9YiP6g
 iyhqZkQR70eTMpppvCbbV36kTuPeuBCABN3C7lZs09l5o7mOoZOvR2wWQnltn3ovXY65
 GveyASL0S/APJJppP3lYTGZ/4DRwmb0zwPDfeXHnGu2CIRwM/00LQmM0SWeQG3PrXlaE
 ODy/SEQDzsGIbrpCiQ4Flov0O7zWP4B3H4v0cpmOVYQAOIbh/68pXH66b38/yl01XHrd
 3PWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HFNbGyVM
Subject: [Buildroot] [PATCH 1/1] package/libsolv: bump to version 0.7.25
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

Drop patch (already in version)

https://github.com/openSUSE/libsolv/blob/0.7.25/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  1 -
 .../libsolv/0001-Fix-build-without-C.patch    | 49 -------------------
 package/libsolv/libsolv.hash                  |  2 +-
 package/libsolv/libsolv.mk                    |  2 +-
 4 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 package/libsolv/0001-Fix-build-without-C.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 2ea44d79f4..0c67afdd7e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -743,7 +743,6 @@ package/libsigrok/0001-Support-glibmm-2.68.patch Upstream
 package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-9.patch Upstream
 package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch Upstream
 package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch Upstream
-package/libsolv/0001-Fix-build-without-C.patch Upstream
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch Upstream
 package/libsoxr/0001-Add-Libs.private-for-static-linking.patch Upstream
 package/libspatialindex/0001-allow-building-static-libs.patch Upstream
diff --git a/package/libsolv/0001-Fix-build-without-C.patch b/package/libsolv/0001-Fix-build-without-C.patch
deleted file mode 100644
index 2389aebcde..0000000000
--- a/package/libsolv/0001-Fix-build-without-C.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5691f58d1f8ce1332b02536e48f1ac5864629c6c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 12 Feb 2023 15:27:27 +0100
-Subject: [PATCH] Fix build without C++
-
-Fix the following build failure without C++:
-
-CMake Error at CMakeLists.txt:1 (PROJECT):
-  No CMAKE_CXX_COMPILER could be found.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Fixes:
- - http://autobuild.buildroot.org/results/a7f2176d40f156c319754ef5d3b7fd0decfe754f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/openSUSE/libsolv/pull/520]
----
- CMakeLists.txt     | 2 +-
- ext/CMakeLists.txt | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3541f496..f899c49a 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--PROJECT (libsolv)
-+PROJECT (libsolv C)
- 
- CMAKE_MINIMUM_REQUIRED (VERSION 2.8.5)
- 
-diff --git a/ext/CMakeLists.txt b/ext/CMakeLists.txt
-index f01c0238..589fa946 100644
---- a/ext/CMakeLists.txt
-+++ b/ext/CMakeLists.txt
-@@ -103,6 +103,7 @@ IF (ENABLE_CUDFREPO)
- ENDIF (ENABLE_CUDFREPO)
- 
- IF (ENABLE_HAIKU)
-+    enable_language(CXX)
-     SET (libsolvext_SRCS ${libsolvext_SRCS}
- 	repo_haiku.cpp)
-     SET (libsolvext_HEADERS ${libsolvext_HEADERS}
--- 
-2.39.0
-
diff --git a/package/libsolv/libsolv.hash b/package/libsolv/libsolv.hash
index 162e46e54d..b18a682ccf 100644
--- a/package/libsolv/libsolv.hash
+++ b/package/libsolv/libsolv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  968aef452b5493751fa0168cd58745a77c755e202a43fe8d549d791eb16034d5  libsolv-0.7.22.tar.gz
+sha256  b382bba4196b19c36eb34e0ef02546c0b922be601c6f73390c9ab643895b656a  libsolv-0.7.25.tar.gz
 sha256  57f15acfb29fbef7749779e096a5885c60b716633e34484a21bb717554c0198f  LICENSE.BSD
diff --git a/package/libsolv/libsolv.mk b/package/libsolv/libsolv.mk
index 04fdb387fd..2a9f1bf208 100644
--- a/package/libsolv/libsolv.mk
+++ b/package/libsolv/libsolv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOLV_VERSION = 0.7.22
+LIBSOLV_VERSION = 0.7.25
 LIBSOLV_SITE = $(call github,openSUSE,libsolv,$(LIBSOLV_VERSION))
 LIBSOLV_LICENSE = BSD-3-Clause
 LIBSOLV_LICENSE_FILES = LICENSE.BSD
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
