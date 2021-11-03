Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A908C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 08:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20FFA61175
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 08:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20FFA61175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E30C840437;
	Wed,  3 Nov 2021 08:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5wmoDczTPmt; Wed,  3 Nov 2021 08:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1962C40439;
	Wed,  3 Nov 2021 08:31:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E93B21BF315
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 08:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D849E6081D
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 08:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIhPk1dYr7X6 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 08:31:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF082606A7
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 08:31:15 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id f5so1732058pgc.12
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cKZZTDPNph+OPwDSaqR9RHxfhBRLUyE0wr0DozkwH1s=;
 b=B3JKMTlTy0C4ZXMyHjG2w3Pcv14wCfvZsN8Q9H0MK/lHpjFEb/mv11zSx3OlPOFLdA
 q7E+i36J3YyrAV1pfoL2XxmlVA4ur85gEWsJ9PsB+0wxHaudeMLHn5x5nQkzL7AGJ4ox
 Sl1FmWqg57LxGNwgOb99wYvik12Nz8LfHexTc8TNyjDr771iIMhzdxyOuOrghljZVLWN
 y4/nTy9Gf98KYFVKeg5aIgKcI0BfZ2QyOqDB2AMBHPsRPGaWjBvE90BMrfT0MxwparMB
 7OB7dtP9jq+hXv+ils37sGHKePfP2HlGFdMk7P1/wA0I1lfzzpnqoxVGGkSvBeOg1Akg
 6RNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cKZZTDPNph+OPwDSaqR9RHxfhBRLUyE0wr0DozkwH1s=;
 b=td6LWVJM0Fq+ktTqgnkFq3aW7RPpHHOazb//sh6foXjAx5nUr4hQCh7hCoA0/7sSmV
 ba8CLIqPhlknm1Tz77v0OgUhgJldTm8n2s92P7AipJpRwAuc3WHv4UDl+USZT9CzJ9ig
 nQA2nkxgUpo6TMFRYX1hJtA80XN+qXjm1Mv6UkbuciLC4Wg68RlQQ/2lkOj4r/zeNyb+
 ABAdddHfzvQKZ1oVXN4ZNbtao6MuYmrG4TvzvLn/1Be+uFn4ctjzh8obu/goRZgWQAXG
 KFKJBlafZ8oLEGWKqfaJ2mN70uTDmmBgCrWZ78HWjMxeJ4FM6MJB4fwpfK7FMgDsSuqp
 ioBw==
X-Gm-Message-State: AOAM533qNtCHaIOH9hfdlpT5PtFpWR5VGbrc0kpC9ZXsDvWAsOqySl6I
 yhyu/Y2+SEvkK89Hva9/h59v55b0Wa9P37GB
X-Google-Smtp-Source: ABdhPJwH5tFFaGI9kSzUpr9/Q64+TUMhnGoKYHSq1rfynvGdZHcVW1EEylv2rPCjuGJd9mP7ShkJ/Q==
X-Received: by 2002:a63:7308:: with SMTP id o8mr32018697pgc.77.1635928275186; 
 Wed, 03 Nov 2021 01:31:15 -0700 (PDT)
Received: from lxb-server.lan ([2403:18c0:2:7e::1926:817])
 by smtp.gmail.com with ESMTPSA id mg12sm4235822pjb.10.2021.11.03.01.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 01:31:14 -0700 (PDT)
From: Yunhao Tian <t123yh.xyz@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 16:31:09 +0800
Message-Id: <20211103083111.4016058-1-t123yh.xyz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libopenaptx: new package
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
Cc: Samuel Martin <s.martin49@gmail.com>, Yunhao Tian <t123yh.xyz@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This adds support for libopenaptx, an aptX encoder and decoder.

Because the original project has no proper Makefile for cross
compilation, we provide a new CMakeLists file.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 package/Config.in                             |  1 +
 .../libopenaptx/0001-fix-include-format.patch | 21 ++++++++
 package/libopenaptx/0002-add-cmake.patch      | 48 +++++++++++++++++++
 package/libopenaptx/Config.in                 |  9 ++++
 package/libopenaptx/libopenaptx.hash          |  3 ++
 package/libopenaptx/libopenaptx.mk            | 15 ++++++
 6 files changed, 97 insertions(+)
 create mode 100644 package/libopenaptx/0001-fix-include-format.patch
 create mode 100644 package/libopenaptx/0002-add-cmake.patch
 create mode 100644 package/libopenaptx/Config.in
 create mode 100644 package/libopenaptx/libopenaptx.hash
 create mode 100644 package/libopenaptx/libopenaptx.mk

diff --git a/package/Config.in b/package/Config.in
index 2f83c87582..0412dfc13c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1721,6 +1721,7 @@ menu "Multimedia"
 	source "package/libmms/Config.in"
 	source "package/libmpeg2/Config.in"
 	source "package/libogg/Config.in"
+	source "package/libopenaptx/Config.in"
 	source "package/libopenh264/Config.in"
 	source "package/libopusenc/Config.in"
 	source "package/libtheora/Config.in"
diff --git a/package/libopenaptx/0001-fix-include-format.patch b/package/libopenaptx/0001-fix-include-format.patch
new file mode 100644
index 0000000000..01bd6e01a1
--- /dev/null
+++ b/package/libopenaptx/0001-fix-include-format.patch
@@ -0,0 +1,21 @@
+Fix include style in openaptx.c
+
+As openaptx.h resides in the same directory with the .c,
+we should use quotes to include rather than using angle
+brackets.
+
+Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
+
+Index: libopenaptx/openaptx.c
+===================================================================
+--- libopenaptx.orig/openaptx.c
++++ libopenaptx/openaptx.c
+@@ -24,7 +24,7 @@
+ #include <stdint.h>
+ #include <string.h>
+ 
+-#include <openaptx.h>
++#include "openaptx.h"
+ 
+ #if (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 199901L) && !defined(inline)
+ #define inline
diff --git a/package/libopenaptx/0002-add-cmake.patch b/package/libopenaptx/0002-add-cmake.patch
new file mode 100644
index 0000000000..73735d6b4a
--- /dev/null
+++ b/package/libopenaptx/0002-add-cmake.patch
@@ -0,0 +1,48 @@
+Add CMakeLists.txt and libopenaptx.pc.in files.
+
+The original Makefile provided by the project is not suitable for
+cross-compilation. This patch provides cmake build infrastructure
+and pkg-config support.
+
+Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
+
+Index: libopenaptx/CMakeLists.txt
+===================================================================
+--- /dev/null
++++ libopenaptx/CMakeLists.txt
+@@ -0,0 +1,20 @@
++cmake_minimum_required(VERSION 3.10)
++
++project(openaptx VERSION 0.2.1 LANGUAGES C
++  DESCRIPTION "Open Source implementation of aptX codec")
++
++include(GNUInstallDirs)
++
++add_library(openaptx SHARED openaptx.c)
++
++set_target_properties(openaptx PROPERTIES PUBLIC_HEADER openaptx.h)
++
++# generate pc file for pkg-config
++set(target1 openaptx)
++configure_file(libopenaptx.pc.in libopenaptx.pc @ONLY)
++
++install(TARGETS openaptx
++    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
++    PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
++install(FILES ${CMAKE_BINARY_DIR}/libopenaptx.pc
++    DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+Index: libopenaptx/libopenaptx.pc.in
+===================================================================
+--- /dev/null
++++ libopenaptx/libopenaptx.pc.in
+@@ -0,0 +1,10 @@
++prefix="@CMAKE_INSTALL_PREFIX@"
++exec_prefix="${prefix}"
++libdir="${prefix}/lib"
++includedir="${prefix}/include"
++
++Name: @PROJECT_NAME@
++Description: @CMAKE_PROJECT_DESCRIPTION@
++Version: @PROJECT_VERSION@
++Cflags: -I${includedir}
++Libs: -L${libdir} -l@target1@
diff --git a/package/libopenaptx/Config.in b/package/libopenaptx/Config.in
new file mode 100644
index 0000000000..1fdcbdd4a6
--- /dev/null
+++ b/package/libopenaptx/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBOPENAPTX
+	bool "libopenaptx"
+	help
+          This is Open Source implementation of Audio Processing 
+          Technology codec (aptX) originally derived from ffmpeg 
+          4.0 project and licensed under GPLv3+. This codec is 
+          mainly used in Bluetooth A2DP profile.
+
+	  https://github.com/pali/libopenaptx
diff --git a/package/libopenaptx/libopenaptx.hash b/package/libopenaptx/libopenaptx.hash
new file mode 100644
index 0000000000..76b4e66c9b
--- /dev/null
+++ b/package/libopenaptx/libopenaptx.hash
@@ -0,0 +1,3 @@
+# Locally calculated:
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256 a19b3b642def6f86441b73dd4efda6e6f13d49e7e2d6e5e91cc7eb464ebb505a libopenaptx-0.2.1.tar.gz
diff --git a/package/libopenaptx/libopenaptx.mk b/package/libopenaptx/libopenaptx.mk
new file mode 100644
index 0000000000..1b4bfa956c
--- /dev/null
+++ b/package/libopenaptx/libopenaptx.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libogg
+#
+################################################################################
+
+LIBOPENAPTX_VERSION = 0.2.1
+LIBOPENAPTX_SITE = $(call github,pali,libopenaptx,$(LIBOPENAPTX_VERSION))
+LIBOPENAPTX_LICENSE = GPL-3.0
+LIBOPENAPTX_LICENSE_FILES = COPYING
+
+LIBOPENAPTX_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
