Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A42CCD195
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 19:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 979A960E2D;
	Sat, 18 Oct 2025 19:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZP7nKU2-Us4h; Sat, 18 Oct 2025 19:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A747660E39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A747660E39;
	Sat, 18 Oct 2025 19:46:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D70AD8
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EA6240FC2
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:46:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNN-JbWZzqHV for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 19:46:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 885BB40FA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 885BB40FA0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 885BB40FA0
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 19:46:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3C06CA4C00D7
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 21:46:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34054)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vACsf-000000007AZ-0zeI
 for buildroot@buildroot.org; Sat, 18 Oct 2025 19:46:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 21:46:20 +0200
Message-ID: <20251018194620.3446578-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760816781;
 bh=sErry/5FECLJCUfLo7pkJ/d86wjUSAOc+npA3TGf6yY=;
 h=From:To:Subject:Date:From;
 b=MIwbZCnIj7ZBKZfnOU7fxsx69c1vZ6p7IrXrEWTbuBUNniU0JXIScgHeQAc5/RiNm
 T6rvsRuTTXs/DJcsWg0b2NgKKSZJfSbVfCAljLWcdO2D1SIuyDyrQqm/DXe3rc6dMh
 QHq4UBin+3BO38lZY32maEx1fgnw2LpHU0NDhEUB9cA9/LfX43xymzZP+Si2qxq61U
 TN+LnYYILBK7RV3J26tDXN1spGk0f1B/+tqyLuIO4IJgF1WW6eiZF54jutODcjzSup
 kHUPgDZXCmIUzbwtWvAcRvX/X0CPxBpwrc+RHYp7E3MkLEwb8oE83sWxArzPcUkgyY
 gj/AkCXI+5Vzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=MIwbZCnI
Subject: [Buildroot] [PATCH 1/1] package/pound: bump version to 4.17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch 0001, upstream committed a different fix:
https://github.com/graygnuorg/pound/pull/17#issuecomment-1757235640

Removed "--with-owner" and "--with-group" configure options:
https://github.com/graygnuorg/pound/commit/6537e9c97bce1f84254ada0104f72264406a1d0d

Added optional dependency to libxcrypt for glibc needed due to commit:
https://github.com/graygnuorg/pound/commit/32c32b248fe99650f3949b7ee7502a2ff5335f24

Updated pcre-related configure options due to commit:
https://github.com/graygnuorg/pound/commit/a3d2b9e0d41c2d5c0487dba0ea5d5178cdfae9c7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/pound/0001-include-limits.h.patch | 75 -----------------------
 package/pound/Config.in                   |  1 +
 package/pound/pound.hash                  |  2 +-
 package/pound/pound.mk                    | 16 +++--
 4 files changed, 9 insertions(+), 85 deletions(-)
 delete mode 100644 package/pound/0001-include-limits.h.patch

diff --git a/package/pound/0001-include-limits.h.patch b/package/pound/0001-include-limits.h.patch
deleted file mode 100644
index 8f188af07c..0000000000
--- a/package/pound/0001-include-limits.h.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From a0374d946e55129b36ba1e0024e1d94675a8f044 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 17 Sep 2023 22:01:21 +0200
-Subject: [PATCH] include limits.h
-
-Include limits.h to avoid the following build failure:
-
-poundctl.c: In function 'oi_getn':
-poundctl.c:232:29: error: 'INT_MAX' undeclared (first use in this function)
-  232 |   if (errno || n < 0 || n > INT_MAX)
-      |                             ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/4edfffcd5d4383c57947d97139331e0bf2cb6155
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/graygnuorg/pound/pull/17
----
- src/config.c   | 1 +
- src/poundctl.c | 1 +
- src/svc.c      | 1 +
- src/tmpl.c     | 1 +
- 4 files changed, 4 insertions(+)
-
-diff --git a/src/config.c b/src/config.c
-index b7e3150..12f5cfa 100644
---- a/src/config.c
-+++ b/src/config.c
-@@ -21,6 +21,7 @@
- #include "extern.h"
- #include <openssl/x509v3.h>
- #include <assert.h>
-+#include <limits.h>
- 
- 
- /*
-diff --git a/src/poundctl.c b/src/poundctl.c
-index bd1459f..7fa18c8 100644
---- a/src/poundctl.c
-+++ b/src/poundctl.c
-@@ -19,6 +19,7 @@
- #include "pound.h"
- #include "json.h"
- #include <assert.h>
-+#include <limits.h>
- 
- char *conf_name = POUND_CONF;
- char *socket_name;
-diff --git a/src/svc.c b/src/svc.c
-index 6e810a6..457f1e0 100644
---- a/src/svc.c
-+++ b/src/svc.c
-@@ -20,6 +20,7 @@
- #include "pound.h"
- #include "extern.h"
- #include "json.h"
-+#include <limits.h>
- 
- /*
-  * basic hashing function, based on fmv
-diff --git a/src/tmpl.c b/src/tmpl.c
-index 2efa72f..0e5b65d 100644
---- a/src/tmpl.c
-+++ b/src/tmpl.c
-@@ -26,6 +26,7 @@
- 
- #include "pound.h"
- #include <assert.h>
-+#include <limits.h>
- #include "json.h"
- 
- static void
--- 
-2.40.1
-
diff --git a/package/pound/Config.in b/package/pound/Config.in
index aa0f103273..9a42af2cc9 100644
--- a/package/pound/Config.in
+++ b/package/pound/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_POUND
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
diff --git a/package/pound/pound.hash b/package/pound/pound.hash
index c5b08891be..020e5cb605 100644
--- a/package/pound/pound.hash
+++ b/package/pound/pound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f1a041e060124941b090ad2d4fec5a72be37a5f8a50f0e0ca821dcbbe4b5925b  pound-4.8.tar.gz
+sha256  b8759d94546027f0090dbb51455e2ff12ad2f95fe34edc4559a5a1dc07639a2e  pound-4.17.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 7bd7eaef2a..6ed2fc656d 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -4,28 +4,26 @@
 #
 ################################################################################
 
-POUND_VERSION = 4.8
+POUND_VERSION = 4.17
 POUND_SITE = https://github.com/graygnuorg/pound/releases/download/v$(POUND_VERSION)
 POUND_LICENSE = GPL-3.0+
 POUND_LICENSE_FILES = COPYING
 POUND_DEPENDENCIES = openssl host-openssl
 
-# Force owner/group to us, otherwise it will try proxy:proxy by
-# default.
-POUND_CONF_OPTS = \
-	--with-owner=$(shell id -un) \
-	--with-group=$(shell id -gn)
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+POUND_DEPENDENCIES += libxcrypt
+endif
 
 ifeq ($(BR2_PACKAGE_PCRE2),y)
-POUND_CONF_OPTS += --enable-pcreposix=pcre2
+POUND_CONF_OPTS += --enable-pcre=2
 POUND_CONF_ENV += \
 	ac_cv_path_PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
 POUND_DEPENDENCIES += pcre2
 else ifeq ($(BR2_PACKAGE_PCRE),y)
-POUND_CONF_OPTS += --enable-pcreposix=pcre1
+POUND_CONF_OPTS += --enable-pcre=1
 POUND_DEPENDENCIES += pcre
 else
-POUND_CONF_OPTS += --disable-pcreposix
+POUND_CONF_OPTS += --disable-pcre
 endif
 
 $(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
