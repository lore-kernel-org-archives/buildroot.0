Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5BCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6253A40A18;
	Sun, 17 Jul 2022 07:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6253A40A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8EYU1xBW6B4; Sun, 17 Jul 2022 07:53:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3426940190;
	Sun, 17 Jul 2022 07:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3426940190
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 187E01BF2CA
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3FF541859
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3FF541859
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNJzwCe8AZIR for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:53:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48D5441779
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48D5441779
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:53:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so5792105wmb.5
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 00:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HuL8j8HUjHKdxj0CrH+OwwL54ZlaUlPcCzixy6Ui/N4=;
 b=OO+Lqf4+lEKkcuUnJconnkO49b0c16wD7h9BGQy9itDW1Y2Ux+iAKRa0+JgfU6Tc2e
 eSy19e2oFy2HU5l0XgfD3Ac57yf3FW8CwlmR/Ws5oJqcfzhmGMJis6ZZy70HCk64SvOW
 Dj8L1PZYoR5REeUZDJ1mFR42GzZqP5Iqommi81wc0urwre/YWs8pUCihZGwzfmawu8SO
 i80op4Pwh6XdK4I/0MZhGfmeX1oaZD+QnKs0xWllNh4h7cVICG3BngA+JqM27T1elmq0
 b/bZrk+qG5QJRp2dYfZnA0pR3rL4XG14pU2DnDf9kqbDQdOJkCcp4etX+REBdsRDymJG
 Xt4g==
X-Gm-Message-State: AJIora9HDUz7WapDkSytPO1CPMcB/INunKiypFgIux04+8h5LvqTqJ26
 z/S8VLAofAfszxVw9e1m8zFXOdaQx5g=
X-Google-Smtp-Source: AGRyM1tXC4ZYXgTFVVFceYAGT6ylzEMchzcNxt0PS6z/EGHrkqD3yo40GtkwsDz6nwTGmPP9zEqLqg==
X-Received: by 2002:a05:600c:1c2a:b0:3a2:ed0a:420c with SMTP id
 j42-20020a05600c1c2a00b003a2ed0a420cmr27585663wms.126.1658044427998; 
 Sun, 17 Jul 2022 00:53:47 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a6-20020adfdd06000000b0021b970a68f9sm7642292wrm.26.2022.07.17.00.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 00:53:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 09:50:33 +0200
Message-Id: <20220717075034.2246639-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HuL8j8HUjHKdxj0CrH+OwwL54ZlaUlPcCzixy6Ui/N4=;
 b=gUGP9L7pKKtqlxJ3kr5Qp4f14xnaN8kXBuH+VGn8OgGPWNAWkqh3s4OmN49u/3jnmm
 /Sy3A0Zao/E82IcjhC3u8nsDBhrrQ+EwUddHWRsPcLdHUc0jJOa9RLKgb9VlsjyX4n3+
 GKFVMLdtRxMpBYVAh3LtGwPXC3z5KZWAIjUiMh8deVFbv3xWg93sP4EDtcT3/s5wUVur
 /Y7fJIpfNla5DKsscrW1LJQ7m3j+dAgDWCVu253yh5G8Mkw5vMsSQ1FPybliednfzLiS
 3Qn6cOaepyah7pi/c3JMLRpq6TPVv2D1eqpAPD/JMydcH6PQkAeJPvlca3F9boQj+iFH
 6/gQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gUGP9L7p
Subject: [Buildroot] [PATCH 1/2] package/libwebsockets: bump to version 4.3.2
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

Drop first and second patches (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-CMakeLists.txt-fix-build-without-C.patch | 44 -------------------
 ...Lists.txt-fix-build-without-threads.patch} |  0
 ...emove-duplicate-LwsCheckRequirements.patch | 26 -----------
 package/libwebsockets/libwebsockets.hash      |  2 +-
 package/libwebsockets/libwebsockets.mk        |  2 +-
 5 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
 rename package/libwebsockets/{0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch => 0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch} (100%)
 delete mode 100644 package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch

diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
deleted file mode 100644
index c6d6d07dcc..0000000000
--- a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 726b36eca158063d8871c91ad99a29113ea35aea Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 13 Apr 2022 21:03:26 +0200
-Subject: [PATCH] CMakeLists.txt: fix build without C++
-
-Fix the following build failure without C++ raised since version 4.2.0
-and
-https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:
-
-CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
-  The C++ compiler
-
-    "/usr/bin/clang++"
-
-  is not able to compile a simple test program.
-
-Fixes:
- - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/warmcat/libwebsockets/pull/2613]
----
- CMakeLists.txt | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 08aaf8c6..96e3ad18 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -71,7 +71,10 @@ if (ESP_PLATFORM)
- endif()
- 
- # it's at this point any toolchain file is brought in
--project(libwebsockets C CXX)
-+project(libwebsockets C)
-+if (LWS_WITH_SECURE_STREAMS_CPP)
-+	enable_language(CXX)
-+endif()
- include(CTest)
- 
- if (PICO_SDK_PATH)
--- 
-2.35.1
-
diff --git a/package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch b/package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
similarity index 100%
rename from package/libwebsockets/0003-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
rename to package/libwebsockets/0001-lib-tls-CMakeLists.txt-fix-build-without-threads.patch
diff --git a/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch b/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
deleted file mode 100644
index fc76a2b610..0000000000
--- a/package/libwebsockets/0002-cmake-remove-duplicate-LwsCheckRequirements.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 99a8b9c4422bed45c8b7412a1e121056f2a6132a Mon Sep 17 00:00:00 2001
-From: Andy Green <andy@warmcat.com>
-Date: Mon, 7 Feb 2022 14:48:55 +0000
-Subject: [PATCH] cmake: remove duplicate LwsCheckRequirements
-
-Signed-off-by: Andy Green <andy@warmcat.com>
-Signed-off-by: Bartosz Bilas <bartosz.bilas@hotmail.com>
-Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
----
- cmake/libwebsockets-config.cmake.in | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/cmake/libwebsockets-config.cmake.in b/cmake/libwebsockets-config.cmake.in
-index 6247b2cb..8ba97e6f 100644
---- a/cmake/libwebsockets-config.cmake.in
-+++ b/cmake/libwebsockets-config.cmake.in
-@@ -32,6 +32,5 @@ endforeach()
- 
- include(CheckIncludeFile)
- include(CheckCSourceCompiles)
--include(LwsCheckRequirements)
- set(requirements 1)
- 
--- 
-2.35.3
-
diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index e39d6e1853..4bff068241 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8fdb1454a1b34cd9a6351beaab237a485e6853806101de7e62bd2bc250bb50af  libwebsockets-4.3.1.tar.gz
+sha256  6a85a1bccf25acc7e8e5383e4934c9b32a102880d1e4c37c70b27ae2a42406e1  libwebsockets-4.3.2.tar.gz
 sha256  2b5dd8030691f3d1870a040f085c37e45d9ab9c684a7f1284f5f379c1e829b28  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 3a9b9ea88f..f5cde37109 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.3.1
+LIBWEBSOCKETS_VERSION = 4.3.2
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
