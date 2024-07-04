Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDE8C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 06:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC1F24048E;
	Thu,  4 Jul 2024 06:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xk4HO2AwXuuG; Thu,  4 Jul 2024 06:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D82F340481
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D82F340481;
	Thu,  4 Jul 2024 06:37:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 214C21BF391
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BB7C607B2
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 06:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r8qSY2V_8OWg for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 06:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61D5B60715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61D5B60715
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61D5B60715
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 06:37:28 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso27663866b.1
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 23:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720075046; x=1720679846;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0hTsGcgKsNq8ORZiYuuqTf6twvNl1sd8w2ywRFaNF20=;
 b=ZeraSD9kib9LQndF0wwGGLor61Lu9+xm2OwWryPoSl5vVFf0HwKgKsQhZCD8BP47+3
 b+JlOsByE6YljrEP/PVWHmErwrkQxWbR+Cg2DeDsESI769AkzzGyrwHaXnrNqytSu/VU
 NHCxccvXMVIF7F0qxiaz4PrkdKQbSRPupUYJUCW7CL0QyAlyAbP5y6AywvtQQwPesg/f
 sf4sGPsdHMAQgSdUBHd5RAje58WAqorrCaBQ44/VrRETV12o3L+bZ7nVmHsApXkId/oS
 smCwS39d09wELm9G8GSx8+DqU4CpAAY4UoxYNVxIS/2XgRLeaeIJLhgYcdW0sW6XkD7v
 OOvQ==
X-Gm-Message-State: AOJu0YwzCgc90DgEAmv0h1ZK6U9f47BosBQ8D3Y57U675rnyzd9DfFng
 TaHTrkBaozgJ8OMAfm3+tmfHo3B+Syr+sEi0llQdOs29RsgZV9+tGVXGK7pOGrUEH86k+72UYsK
 U4MU=
X-Google-Smtp-Source: AGHT+IHlSIlnNYBSw5O9IDVsukNhBGRVfOjG3G3A5CWK4NJgCC4P8gBPKjwhRMdDlF7fMmvlYQaoHA==
X-Received: by 2002:a17:907:7e8b:b0:a72:46f3:ffc5 with SMTP id
 a640c23a62f3a-a77ba6fbb8cmr47898966b.28.1720075046079; 
 Wed, 03 Jul 2024 23:37:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:ea87:116:a8d5:fa85])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77b8eb56c1sm21713066b.176.2024.07.03.23.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 23:37:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  4 Jul 2024 08:37:22 +0200
Message-ID: <20240704063722.2902990-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720075046; x=1720679846;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0hTsGcgKsNq8ORZiYuuqTf6twvNl1sd8w2ywRFaNF20=;
 b=HbSpCUEzfInECpErf6Z1ji7SowMuqHugv0AxSldRSi1RRSl4wDfEjEYSR+B363LdvD
 cYLPs3mDtOGLONJP0JdgHVasy+9IVwZzMbdqAvNCVIqewd91LsIST2fmaBUOXIIZBwCU
 cZ80FCnripvo/lxDZqy904uVgDnrYXY7aFdps=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=HbSpCUEz
Subject: [Buildroot] [PATCH v2] package/libglfw: update the patches to be
 applied with fuzz 0
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libglfw fails to build with output:

    Applying 0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch using patch:
    patching file src/CMakeLists.txt
    Hunk #1 FAILED at 75.
    1 out of 1 hunk FAILED -- saving rejects to file src/CMakeLists.txt.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
Changes v1 -> v2:
 - Drop hunks also for patch 1 even if it doesn't report any error applying it
   with fuzz 0.
   
 .checkpackageignore                           |  1 -
 ...emove-extra-cmake-modules-dependency.patch | 18 ++++++++++-------
 ...xt-allow-override-of-wayland-pkgdata.patch | 20 ++++++++++---------
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d2627455e..9f4331d206d1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -825,7 +825,6 @@ package/libfuse/0001-fix-aarch64-build.patch lib_patch.Upstream
 package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-glibc-2-34.patch lib_patch.Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch lib_patch.Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch lib_patch.Upstream
-package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch lib_patch.Upstream
 package/libgpiod/0001-build-add-a-configure-switch-for-building-examples.patch lib_patch.Upstream
 package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk2/0001-reduce-dependencies.patch lib_patch.Upstream
diff --git a/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
index d5ee7c829a45..ffa1d13f5134 100644
--- a/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
+++ b/package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch
@@ -1,4 +1,4 @@
-From 2747e47393cbca2d09db56223e735bd94b21e2eb Mon Sep 17 00:00:00 2001
+From 8ebf1067390948d03330a5a0c814e5f7f860e678 Mon Sep 17 00:00:00 2001
 From: Joel Winarske <joel.winarske@gmail.com>
 Date: Mon, 28 Sep 2020 22:23:02 -0700
 Subject: [PATCH] Wayland: Remove extra-cmake-modules dependency
@@ -8,17 +8,18 @@ Fixes #1774.
 [Retrieved (and backported) from:
 https://github.com/glfw/glfw/commit/2747e47393cbca2d09db56223e735bd94b21e2eb]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0 dropping all Hunks]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- .gitignore         |  4 ---
  CMakeLists.txt     | 16 ++++++------
  src/CMakeLists.txt | 62 ++++++++++++++++++++++++++++------------------
- 3 files changed, 45 insertions(+), 37 deletions(-)
+ 2 files changed, 45 insertions(+), 33 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 42bfa1806d..394827520b 100644
+index 75069161fc36..b315eaa15305 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -191,20 +191,18 @@ endif()
+@@ -249,20 +249,18 @@ endif()
  # Use Wayland for window creation
  #--------------------------------------------------------------------
  if (_GLFW_WAYLAND)
@@ -47,10 +48,10 @@ index 42bfa1806d..394827520b 100644
      include(CheckIncludeFiles)
      include(CheckFunctionExists)
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 2f2bdd883d..e834506c6c 100644
+index b6dd86c54512..29be6515ae58 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -45,30 +45,44 @@ if (_GLFW_X11 OR _GLFW_WAYLAND)
+@@ -40,30 +40,44 @@ elseif (_GLFW_WAYLAND)
                       posix_time.c posix_thread.c xkb_unicode.c
                       egl_context.c osmesa_context.c)
  
@@ -119,3 +120,6 @@ index 2f2bdd883d..e834506c6c 100644
  elseif (_GLFW_OSMESA)
      set(glfw_HEADERS ${common_HEADERS} null_platform.h null_joystick.h
                       posix_time.h posix_thread.h osmesa_context.h)
+-- 
+2.43.0
+
diff --git a/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
index 4bcb5e4eb705..268b1248518b 100644
--- a/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
+++ b/package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch
@@ -1,4 +1,4 @@
-From 46aaf2b2b4d3ec240b9aad175bb3eddb6ae11ead Mon Sep 17 00:00:00 2001
+From a2c88988b6cfe4023fe78f13519b56a8ac9f568b Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 4 Mar 2022 17:59:19 +0100
 Subject: [PATCH] src/CMakeLists.txt: allow override of wayland pkgdatadir
@@ -7,17 +7,19 @@ Allow the user to override WAYLAND_{PROTOCOLS_BASE,CLIENT_PKGDATADIR}
 (needed when cross-compiling)
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/glfw/glfw/pull/2053]
+Upstream: https://github.com/glfw/glfw/pull/2053
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
- src/CMakeLists.txt | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
+ src/CMakeLists.txt | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 01f191c9..475ce882 100644
+index 29be6515ae58..1767b3c8ad8f 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -75,7 +75,9 @@ if (GLFW_BUILD_WAYLAND)
-     include(FindPkgConfig)
+@@ -42,7 +42,9 @@ elseif (_GLFW_WAYLAND)
+ 
      find_program(WAYLAND_SCANNER_EXECUTABLE NAMES wayland-scanner)
      pkg_check_modules(WAYLAND_PROTOCOLS REQUIRED wayland-protocols>=1.15)
 -    pkg_get_variable(WAYLAND_PROTOCOLS_BASE wayland-protocols pkgdatadir)
@@ -26,7 +28,7 @@ index 01f191c9..475ce882 100644
 +    endif()
  
      macro(wayland_generate protocol_file output_file)
-         add_custom_command(OUTPUT "${output_file}.h"
+           add_custom_command(OUTPUT ${output_file}.h
 -- 
-2.34.1
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
