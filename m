Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F55C46CD4
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 16:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0198960D5F;
	Tue, 26 Dec 2023 16:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0198960D5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QxyJXuzMqG6T; Tue, 26 Dec 2023 16:27:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D8160A5F;
	Tue, 26 Dec 2023 16:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D8160A5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48F121BF300
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221C960A5F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 16:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 221C960A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g--YOz3dSGqg for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 16:27:48 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DC0D0605E9
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 16:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC0D0605E9
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ccbded5aa4so16345111fa.1
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 08:27:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703608065; x=1704212865;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQ9V+P6FFvrfIXOXCWQjTSchBnZcOjuZtZHwfJhZl/c=;
 b=C+tYqJvuiTfNisjXgEWcma+oo83ee6lVeUEcYp+L5s69cplfenN7WZpKtFke22LLDo
 24RrhbFZ8JXEI8YwpLEhN5/lEqXeP3MYQucuFa0zL5y1uvZp5jytguC+yOCbWaaxixvS
 2lNx6zg8sP6Xp2oyeUEJTt1POgwXxqXAEenZ/UfbGpLalY/IGdkYknXBzzF04rbEaAD1
 poFjZYp55VUm3Ls2B+PfrAcssECnXA8tmmQ1g0FKi407cvQO0UkaGylscGxlB1TerdG/
 duehxlIuQSNSz+bV5MttwB+LjvrSjj/VnbBlGBzKwtaIPn7QmlV20PCYAnDXqiOfNjex
 lxpQ==
X-Gm-Message-State: AOJu0YyZpe9b1a11VNXIilpb/I2umdmYxZmnjUj6qrMU9FEGgVIJ3J3W
 SiQ9qF3su16SHOS7o5ECOr8VkyNPlro=
X-Google-Smtp-Source: AGHT+IGF89mJ1KhybH7CqCeF5QdVw+hui8ETxv/wAztXpVAaU3sADf/Oyve8Fp12ZXTsh5HkI6K/Eg==
X-Received: by 2002:a2e:87d7:0:b0:2cc:d574:6057 with SMTP id
 v23-20020a2e87d7000000b002ccd5746057mr500292ljj.73.1703608064637; 
 Tue, 26 Dec 2023 08:27:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 df2-20020a5d5b82000000b00336be33649csm5661268wrb.9.2023.12.26.08.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 08:27:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 17:27:42 +0100
Message-ID: <20231226162742.754692-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703608065; x=1704212865; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zQ9V+P6FFvrfIXOXCWQjTSchBnZcOjuZtZHwfJhZl/c=;
 b=l8hyeZeBAeaI8uQaJZ+Vm6g8/A/G6Ba1GGok8+q1zvSHaz5PbCQdr3Q9lUcy34vQWs
 uaIcJ6ynWGvY8KP0ZOvN3FZfFjCBaMWiVQ1EzBwLL3qJFsgBhSc7sXXH8d62Swv1wAJ0
 r2AsVa1Qk7khETyefAP/5Yxj/cc1gAEmTXwAcC3Xj5+4LMGQ4N2SH3rzXbgtZaQFvOmM
 nc1MF1RDgWhY7c6nDo97orUfac71y2+CAdlS4eJ5Eu8FNiBb2u7MBV3B9UiPPDzbYprp
 ceFG931Y9dNM7c7ydGGuiN8fR47XFCUI4gPuGnPtFdNfoA1Tm8nOe6B/LY2RV1n+eApI
 /rAQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l8hyeZeB
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: bump to version 23.11
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://github.com/merbanan/rtl_433/releases/tag/23.11

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  2 -
 ...se-pkg-config-to-detect-openssl-when.patch | 42 -------------------
 ...r-Fix-mongoose-build-without-threads.patch | 42 -------------------
 package/rtl_433/rtl_433.hash                  |  2 +-
 package/rtl_433/rtl_433.mk                    |  2 +-
 5 files changed, 2 insertions(+), 88 deletions(-)
 delete mode 100644 package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
 delete mode 100644 package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index fe0a3b94aa..d6a4a849e2 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1207,8 +1207,6 @@ package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.p
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch Upstream
 package/rt-tests/0002-Makefile-drop-explicit-undefine-PYLIB-for-compatibil.patch Upstream
-package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch Upstream
-package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch Upstream
 package/rtmpdump/0001-include-limits.h.patch Upstream
 package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch Upstream
 package/rtty/0001-CMakeLists.txt-prefer-pkg_check_modules.patch Upstream
diff --git a/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch b/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
deleted file mode 100644
index 00858c8ff9..0000000000
--- a/package/rtl_433/0001-CMakeLists.txt-use-pkg-config-to-detect-openssl-when.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b860de9e207d8fe2ea37dad28fdd014493d87703 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 27 Dec 2022 16:29:16 +0100
-Subject: [PATCH] build: Fix CMake to use pkg-config openssl when possible
- (#2290)
-
-In order to take into account the libraries used by openssl when
-building statically, using pkg-config is recommended. This patch
-therefore improves the CMakeLists.txt to use pkg-config to detect
-openssl when pkg-config is available. This will avoid
-static build failure when openssl needs to link with -latomic.
-
-Fixes:
- - http://autobuild.buildroot.org/results/417c86963ffe038aa052ea3cf19fd52c3e9b7396
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/merbanan/rtl_433/commit/b860de9e207d8fe2ea37dad28fdd014493d87703]
----
- CMakeLists.txt | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d47a3eda2..cf30d8be2 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -175,7 +175,14 @@ set(ENABLE_OPENSSL AUTO CACHE STRING "Enable OpenSSL TLS support")
- set_property(CACHE ENABLE_OPENSSL PROPERTY STRINGS AUTO ON OFF)
- if(ENABLE_OPENSSL) # AUTO / ON
- 
--find_package(OpenSSL)
-+find_package(PkgConfig)
-+if(PKG_CONFIG_FOUND)
-+    pkg_check_modules(OPENSSL openssl)
-+    set(OPENSSL_LIBRARIES ${OPENSSL_LINK_LIBRARIES})
-+    set(OPENSSL_INCLUDE_DIR ${OPENSSL_INCLUDE_DIRS})
-+else()
-+    find_package(OpenSSL)
-+endif()
- if(OPENSSL_FOUND)
-     message(STATUS "OpenSSL TLS support will be compiled. Found version ${OPENSSL_VERSION}")
-     include_directories(${OPENSSL_INCLUDE_DIR})
diff --git a/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch b/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch
deleted file mode 100644
index 85bc45147a..0000000000
--- a/package/rtl_433/0002-minor-Fix-mongoose-build-without-threads.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 707b51ecbc5598eed2fb67962232bf3fe0e96f81 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 27 Dec 2022 21:30:54 +0100
-Subject: [PATCH] minor: Fix mongoose build without threads (#2291)
-
-Fix the following build failure without threads:
-
-In file included from /home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/src/data_tag.c:17:
-/home/buildroot/autobuild/instance-3/output-1/build/rtl_433-22.11/include/mongoose.h:407:10: fatal error: pthread.h: No such file or directory
-  407 | #include <pthread.h>
-      |          ^~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/9f1677fc5a4568be0b9c121060c5d821ac2ae21b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/merbanan/rtl_433/commit/707b51ecbc5598eed2fb67962232bf3fe0e96f81]
----
- include/mongoose.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/mongoose.h b/include/mongoose.h
-index 1173b3fc7..b111ea34e 100644
---- a/include/mongoose.h
-+++ b/include/mongoose.h
-@@ -404,7 +404,6 @@ unsigned int sleep(unsigned int seconds);
- #include <math.h>
- #include <netdb.h>
- #include <netinet/in.h>
--#include <pthread.h>
- #include <signal.h>
- #include <stdarg.h>
- #include <stdbool.h>
-@@ -4658,6 +4657,7 @@ size_t mg_fwrite(const void *ptr, size_t size, size_t count, FILE *f);
- #endif /* MG_ENABLE_FILESYSTEM */
- 
- #if MG_ENABLE_THREADS
-+#include <pthread.h>
- /*
-  * Starts a new detached thread.
-  * Arguments and semantics are the same as pthead's `pthread_create()`.
diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index 51fb29c78e..3a00e0cae7 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  61a9163d69cc4b1da46aebbcaf969bd180a055a6b90f42ad281218cc4fbefb86  rtl_433-22.11.tar.gz
+sha256  1260c58400bf35832ac1b76cb3cccf3dc1335ffa2416909c63c7d7060c74663b  rtl_433-23.11.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index e3be0e5ecf..7c33a71f31 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 22.11
+RTL_433_VERSION = 23.11
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
