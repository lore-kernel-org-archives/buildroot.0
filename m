Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F6BC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 13:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7AEF402B2;
	Wed,  3 Jul 2024 13:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzmSRPclYrpp; Wed,  3 Jul 2024 13:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93EAF402FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93EAF402FD;
	Wed,  3 Jul 2024 13:58:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F0FD41BF980
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DED878206C
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNLLzMoGbf47 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 13:58:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA74480B40
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA74480B40
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA74480B40
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 13:58:30 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6fd513f18bso713891166b.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 06:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720015109; x=1720619909;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+mJHX5f/rS5j6wGr8XQz+O5teukquuR/0ZxYT32DfWg=;
 b=FpsF+jH7hiouoI8MoQPIlUJU/QRHE9iSDi9lN8gaHG1H0Ux9t5Ln0Lug65CqfPxTxN
 SLAI6Veqx2EIKS0GT3cWFfg8sy6LW4pSqzbmYXduu+tNlxLqNxIMJXdkeWNqqNgowphE
 Ls74OssfZvb422g+6Otlsw8t46AuFtI27ea6Qn3/hIQQChOlRqETEjVcdYfIwwG6Y1L4
 4zmfvPX2Hr9FbM26Xai4PVDqzFcYvLSp9/fB1hs4R2GqYfl76hKoqhA9TqBnJMLuC5yM
 VdO+ssnVxEp6Y4vDee5SqUTvYYyc7gaIdLw0hnCYSffuVU9IZOIHAcDn6fmDqfMulgyW
 NcBg==
X-Gm-Message-State: AOJu0YyVkGYeMbjQhzLOLaMo7ZpvCgxKnGY2vxi/rpSHFyL8rVbvqWWZ
 7SycJG0Uc9g5osjdPb0c5FX8R5WJ+yrKtTGC+i4gAf6+XUbZN01wGgSqj/z4k3Suc5mrgb0mzPZ
 mLl4=
X-Google-Smtp-Source: AGHT+IHrTJ6GwFJbWnAUUdigOtsO5bw1VFiRbq8yCHW/rLPO8fp3DxnEK1gRTH1VNc6F8hHP/XQp2w==
X-Received: by 2002:a17:907:d8f:b0:a74:bef:7079 with SMTP id
 a640c23a62f3a-a751441996bmr1026382866b.16.1720015106480; 
 Wed, 03 Jul 2024 06:58:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1a37:2bf3:7cf8:1941])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab065187sm513915866b.139.2024.07.03.06.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 06:58:26 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  3 Jul 2024 15:58:20 +0200
Message-ID: <20240703135820.2739707-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720015109; x=1720619909;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+mJHX5f/rS5j6wGr8XQz+O5teukquuR/0ZxYT32DfWg=;
 b=aLnhdqMq3w+uG9lK8o/1YPpCrpk52oE/TS5HKU4PY13OPtYusQXsxN2RZzgtFr1fje
 KcMFV3zDKIg7l+GvRYgrhfJUvOG5jX6nKZBEXnDS1tQEZlKdls6Dir7oowdxANuDjZtx
 oX+tnjYT9KH7CAO06o2t+awoUGTznAM1ofRE4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=aLnhdqMq
Subject: [Buildroot] [PATCH 1/1] package/libglfw: update the patches to be
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
 .checkpackageignore                           |  1 -
 ...xt-allow-override-of-wayland-pkgdata.patch | 20 ++++++++++---------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ca94fb56b092..fe2545c13db2 100644
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
