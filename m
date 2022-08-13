Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A2EC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 10:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B583383E4A;
	Sat, 13 Aug 2022 10:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B583383E4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDK5Ssh0s7qg; Sat, 13 Aug 2022 10:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D635A83E47;
	Sat, 13 Aug 2022 10:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D635A83E47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 411221BF95C
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 285E041925
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 10:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 285E041925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0NKP21WknbR for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 10:26:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA2AB4191D
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA2AB4191D
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 10:26:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 p12-20020a7bcc8c000000b003a5360f218fso5409930wma.3
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 03:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=9U4lmgMIDq5JuzKkYQd9kXjbq9X9wY55qLwq3qb50KE=;
 b=nAdU3dD+/kDyOtnOqv4MmS1Ecf81GsSJl0hguOwl//JJcEt7d1WVtGpKQTpi6KaE1L
 XO6ksrvxK3hQMa18irVOmZZNFw2gPwkxhoCeEQF9fH6Migc4BK0Qe+6/iAoExLuIrucU
 eXTT+UjD3vx4qO24k+tgFotA6uFfRGxXW+/w4RhhXOBlWFIQzeb57ILqIkSphYnbhy+S
 oEaYYUW4EJIBVxKPn+n/VFjkXfsKaZrslpy8ZNZGzCZs2+88BpyCSqffg88c1WI42djJ
 wq86bq7yg4KSvZRjmoBsYqMU72lX+Q77ntnyItiNXdPvADTnNhBqjNJ6kERtoY7lFoZB
 HP3A==
X-Gm-Message-State: ACgBeo0xzJu8aBHOm9gi1ll0tI4gnc75JwMFcAdcqw5FgdtLDAeCOClr
 3w0OrtNv0et/2AhKV4q2K/IkXRsaHW0=
X-Google-Smtp-Source: AA6agR7NYtjZPf4zPGQ5X4hPm2dJtrAEdVT6k9NrWICaza6WDbtf6H9xBzZGfsBLE4VWkIH+oQEsFQ==
X-Received: by 2002:a05:600c:5102:b0:3a5:a46d:5d4b with SMTP id
 o2-20020a05600c510200b003a5a46d5d4bmr5369072wms.68.1660386409914; 
 Sat, 13 Aug 2022 03:26:49 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00b0633a0acd4e884b.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:b063:3a0a:cd4e:884b])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003a5c2abc412sm2601556wmp.44.2022.08.13.03.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 03:26:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 12:26:43 +0200
Message-Id: <20220813102643.978802-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=9U4lmgMIDq5JuzKkYQd9kXjbq9X9wY55qLwq3qb50KE=;
 b=fI1JzjynNEdDGppW5fqKd6xHA30n3QkUsN3PQm0/heMopvwR6akq9RUoYajCwmybHs
 Upw1rFi/mefXs2uFlo0cqVcwZG5Mgmle7gCn/KSe6y6EMhTniyqkma2fCC4r3gh1wkFl
 3WfoAyV1vrvEnpPCZxTI190HEV4vUQpbBl492J4t6HCTlhzAMjWAyOte9sqDgJNxve9N
 lAR3TKFrU/n3C+ltZ4ixk9JVukaAdm3ba7VrnXDSFxXkep2ormTIX/4Fe6DHePNW3YEm
 aMgAp3b3BmgIo3stE7PBkmoCHLVneZ0tRtLkXWXs/klXbWygxop0DFkY7oE9xuR/Kgma
 amtw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fI1Jzjyn
Subject: [Buildroot] [PATCH 1/1] package/ne10: fix build without C++
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

Fix the following build failure without C++ raised since bump to version
1.2.0 in commit 8cdf680799d7055a272190387064f87c7c638906 and
https://github.com/projectNe10/Ne10/commit/20b1896fd6532336e6a46608778bd6e0396dc4dc:

CMake Error at /nvmedata/autobuild/instance-11/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/a86d09d569babe6b88cb8e5fbb47483772f42aed

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ne10/0002-fix-build-without-C.patch | 55 +++++++++++++++++++++
 package/ne10/ne10.mk                        |  6 +++
 2 files changed, 61 insertions(+)
 create mode 100644 package/ne10/0002-fix-build-without-C.patch

diff --git a/package/ne10/0002-fix-build-without-C.patch b/package/ne10/0002-fix-build-without-C.patch
new file mode 100644
index 0000000000..9dafffd5b0
--- /dev/null
+++ b/package/ne10/0002-fix-build-without-C.patch
@@ -0,0 +1,55 @@
+From f19b109f2a879af7b0753d94a2a312e4039adbed Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 8 May 2022 23:52:36 +0200
+Subject: [PATCH] fix build without C++
+
+Fix the following build failure without C++ raised since version 1.2.0
+and
+https://github.com/projectNe10/Ne10/commit/20b1896fd6532336e6a46608778bd6e0396dc4dc:
+
+CMake Error at /nvmedata/autobuild/instance-11/output-1/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
+  The C++ compiler
+
+    "/usr/bin/clang++"
+
+  is not able to compile a simple test program.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a86d09d569babe6b88cb8e5fbb47483772f42aed
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/projectNe10/Ne10/pull/280]
+---
+ CMakeLists.txt         | 2 +-
+ modules/CMakeLists.txt | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 40e1b72..10081f8 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -26,7 +26,7 @@
+ #
+ cmake_minimum_required(VERSION 2.6)
+ 
+-project(NE10 C CXX ASM)
++project(NE10 C ASM)
+ 
+ option(NE10_BUILD_SHARED "Build NE10 shared libraries" OFF)
+ option(NE10_BUILD_STATIC "Build NE10 static libraries" ON)
+diff --git a/modules/CMakeLists.txt b/modules/CMakeLists.txt
+index 4f158e9..951527a 100644
+--- a/modules/CMakeLists.txt
++++ b/modules/CMakeLists.txt
+@@ -173,6 +173,8 @@ endif(IOS_PLATFORM)
+ endif()
+ 
+ if(NE10_ENABLE_DSP)
++    enable_language(CXX)
++
+     #enable NE10_init_dsp
+     add_definitions(-DNE10_ENABLE_DSP)
+ 
+-- 
+2.35.1
+
diff --git a/package/ne10/ne10.mk b/package/ne10/ne10.mk
index e529caf2af..3946605556 100644
--- a/package/ne10/ne10.mk
+++ b/package/ne10/ne10.mk
@@ -16,6 +16,12 @@ NE10_CONF_OPTS = \
 	-DNE10_BUILD_UNIT_TEST=OFF \
 	-DNE10_LINUX_TARGET_ARCH=$(if $(BR2_aarch64),aarch64,armv7)
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+NE10_CONF_OPTS += -DNE10_ENABLE_DSP=ON
+else
+NE10_CONF_OPTS += -DNE10_ENABLE_DSP=OFF
+endif
+
 ifeq ($(BR2_STATIC_LIBS),)
 NE10_CONF_OPTS += \
 	-DNE10_BUILD_SHARED=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
