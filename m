Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC61DCCFA05
	for <buildroot@archiver.kernel.org>; Thu,  6 Nov 2025 20:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84B63407F7;
	Thu,  6 Nov 2025 20:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pImSmuf5Z1AZ; Thu,  6 Nov 2025 20:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BED8407F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BED8407F9;
	Thu,  6 Nov 2025 20:46:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 30B6F93E
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1789740071
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wws6XxQcQ6en for <buildroot@buildroot.org>;
 Thu,  6 Nov 2025 20:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 01795410E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01795410E1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 01795410E1
 for <buildroot@buildroot.org>; Thu,  6 Nov 2025 20:46:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d15.dip0.t-ipconnect.de [91.58.13.21])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9BB11A4C1F0E;
 Thu,  6 Nov 2025 21:45:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46844)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vH6rG-0000000007X-0jup;
 Thu, 06 Nov 2025 20:45:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  6 Nov 2025 21:45:10 +0100
Message-ID: <20251106204522.3273683-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251106204522.3273683-1-bernd@kuhls.net>
References: <20251106204522.3273683-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762461926;
 bh=OCynu/Uwnfq211Z09/lC/E+9+73lkWh/cYc32qNId6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=q3ypAAGWOu3KTv3jfK7+nEaDboEPfosJ3a7sdCSj3DMbGxUrkxZDiYIQu0/nCZxtj
 GnOOYXSoYHgL/r7stF/vDzYKzxKTj2UXSChUMbiyjbv0gRe7JON47fKQFdr9iBkozB
 1fivmlzWo2NX/KKQn4+vHGoXuZTms3ZcWsstjP7GhfGM/nHfWJZQ78Wz9i30ZI/Yd1
 56JD8OWXgdV8mOrjbLmaBuxHp0J2Znl3bjY6b1EMuNY1FEUZuixXXqaHnuQTG8adw1
 tLJW4jiS5mMyBy6OriEegrgWSMkl+8mxxwijuIVz5V3PljYxrJbCS0A+fpQAB4D7dq
 M1KjOkQn51hpA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=q3ypAAGW
Subject: [Buildroot] [PATCH v3 03/14] package/linphone: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Carsten Schoenert <c.schoenert@gmail.com>, Lionel Orry <lionel.orry@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This package is no longer maintained in Buildroot: no maintainer in
DEVELOPERS file, and doesn't build since we bumped mbedtls to version
3.x in commit 3481a9643fc7223e400ed877f08ade34d44e6b78, which first
appeared in 2025.05.

Also, upstream linphone has changed their strategy, and now their
specific dependencies (bctoolbox, belle-sip, etc.) are bundled in
linphone, so anyway the packaging needs to be adapted significantly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  1 -
 Config.in.legacy                              |  8 ++++
 package/Config.in                             |  1 -
 ...re-paths-paths.cpp-fix-powerpc-build.patch | 35 ----------------
 package/linphone/Config.in                    | 41 ------------------
 package/linphone/linphone.hash                |  4 --
 package/linphone/linphone.mk                  | 42 -------------------
 7 files changed, 8 insertions(+), 124 deletions(-)
 delete mode 100644 package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
 delete mode 100644 package/linphone/Config.in
 delete mode 100644 package/linphone/linphone.hash
 delete mode 100644 package/linphone/linphone.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 7b0b2971aa..e73e7100a5 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -635,7 +635,6 @@ package/lighttpd/0001-Modify-the-default-lighttpd-configuration-file-to-ha.patch
 package/lighttpd/S50lighttpd Shellcheck lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/linknx/0001-configure-ac-tweak-CPPUNIT-conditional.patch lib_patch.Upstream
 package/linknx/0002-src-Makefile.am-fix-linking-with-log4cpp.patch lib_patch.Upstream
-package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch lib_patch.Upstream
 package/linux-zigbee/0001-test-serial-Remove-test-serial.patch lib_patch.Upstream
 package/linux-zigbee/0002-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch lib_patch.Upstream
 package/linuxptp/S65ptp4l Shellcheck lib_sysv.Indent
diff --git a/Config.in.legacy b/Config.in.legacy
index 5aa271183e..b33798e7ed 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LINPHONE
+	bool "linphone has been removed"
+	select BR2_LEGACY
+	help
+	  This package was no longer maintained in Buildroot and was
+	  no longer building. It can be re-added if someone volunteers
+	  to fix the issues, update the package and maintain it.
+
 config BR2_PACKAGE_LIBJWT
 	bool "libjwt has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 07244a86e2..f7f5755315 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2550,7 +2550,6 @@ endif
 	source "package/lighttpd/Config.in"
 	source "package/linknx/Config.in"
 	source "package/links/Config.in"
-	source "package/linphone/Config.in"
 	source "package/linux-zigbee/Config.in"
 	source "package/linuxptp/Config.in"
 	source "package/lldpd/Config.in"
diff --git a/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch b/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
deleted file mode 100644
index 1655fa59a1..0000000000
--- a/package/linphone/0001-src-core-paths-paths.cpp-fix-powerpc-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d5d528e7562f358b9564e64cea0678020c51479a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 15 Mar 2020 18:56:19 +0100
-Subject: [PATCH] src/core/paths/paths.cpp: fix powerpc build
-
-Fix the following build failure on powerpc:
-
-/home/test/autobuild/run/instance-2/output-1/build/linphone-4.3.1/src/core/paths/paths.cpp:32:3: error: #error "Unsupported system."
-  #error "Unsupported system."
-   ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/d90bca02c2771df8dfbf39892d529fb5f9069656
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/core/paths/paths.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/core/paths/paths.cpp b/src/core/paths/paths.cpp
-index 0442282fe..2c6508a51 100644
---- a/src/core/paths/paths.cpp
-+++ b/src/core/paths/paths.cpp
-@@ -26,7 +26,7 @@
- 	#include "paths-android.h"
- #elif defined(_WIN32)
- 	#include "paths-windows.h"
--#elif defined(__linux)
-+#elif defined(__linux) || defined(__linux__)
- 	#include "paths-linux.h"
- #else
- 	#error "Unsupported system."
--- 
-2.25.1
-
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
deleted file mode 100644
index 3fe25c1659..0000000000
--- a/package/linphone/Config.in
+++ /dev/null
@@ -1,41 +0,0 @@
-config BR2_PACKAGE_LINPHONE
-	bool "linphone"
-	depends on BR2_USE_MMU
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_STATIC_LIBS # belle-sip, mediastreamer
-	depends on BR2_TOOLCHAIN_HAS_THREADS # belr, belle-sip, mediastreamer
-	# belr, belle-sip, mediastreamer
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-	depends on BR2_USE_WCHAR # belle-sip
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # mediastreamer
-	select BR2_PACKAGE_BELLE_SIP
-	select BR2_PACKAGE_BELR
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_MEDIASTREAMER
-	select BR2_PACKAGE_SQLITE
-	help
-	  Linphone is an internet phone or Voice Over IP phone (VoIP).
-
-	  With linphone you can communicate freely with people over
-	  the internet, with voice, video, and text instant messaging.
-	  Linphone makes use of the SIP protocol, an open standard
-	  for internet telephony. You can use Linphone with any SIP
-	  VoIP operator, including our free SIP audio/video service.
-	  linphone is free-software (or open-source), you can download
-	  and redistribute it freely.
-	  Linphone is available for desktop computers: Linux, Windows,
-	  MacOSX, and for mobile phones: Android, iPhone, Blackberry.
-
-	  Linphone support in Buildroot is limited to the commandline
-	  client, linphonec, and video support is not enabled.
-
-	  http://www.linphone.org/
-
-comment "linphone needs a toolchain w/ threads, C++, dynamic library, wchar, gcc >= 5"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
-
-comment "linphone needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/linphone/linphone.hash b/package/linphone/linphone.hash
deleted file mode 100644
index 6d456ac9c9..0000000000
--- a/package/linphone/linphone.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  9956f6785a787041328da000cee5fcc1e41d6f17956ffe5e0402fac0f9a9676b  linphone-4.4.8.tar.gz
-# Locally computed
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
deleted file mode 100644
index bb79e2f782..0000000000
--- a/package/linphone/linphone.mk
+++ /dev/null
@@ -1,42 +0,0 @@
-################################################################################
-#
-# linphone
-#
-################################################################################
-
-LINPHONE_VERSION = 4.4.8
-LINPHONE_SITE = \
-	https://gitlab.linphone.org/BC/public/liblinphone/-/archive/$(LINPHONE_VERSION)
-LINPHONE_CONF_OPTS = \
-	-DENABLE_ADVANCED_IM=OFF \
-	-DENABLE_CXX_WRAPPER=OFF \
-	-DENABLE_DB_STORAGE=OFF \
-	-DENABLE_LIME=OFF \
-	-DENABLE_LIME_X3DH=OFF \
-	-DENABLE_STRICT=OFF \
-	-DENABLE_TOOLS=OFF \
-	-DENABLE_TUTORIALS=OFF \
-	-DENABLE_UNIT_TESTS=OFF \
-	-DENABLE_VCARD=OFF \
-	-DENABLE_VIDEO=OFF \
-	-DGIT_EXECUTABLE=OFF
-LINPHONE_INSTALL_STAGING = YES
-LINPHONE_DEPENDENCIES = \
-	belle-sip \
-	belr \
-	libxml2 \
-	mediastreamer \
-	sqlite \
-	$(if $(BR2_PACKAGE_ZLIB),zlib)
-LINPHONE_LICENSE = GPL-3.0+
-LINPHONE_LICENSE_FILES = LICENSE.txt
-
-ifeq ($(BR2_STATIC_LIBS),y)
-LINPHONE_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LINPHONE_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
-else ifeq ($(BR2_SHARED_LIBS),y)
-LINPHONE_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
-endif
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
