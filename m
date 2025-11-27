Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D5DD116EA
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 21:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB4A40AC3;
	Thu, 27 Nov 2025 21:02:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0S_OKp1fZ5l; Thu, 27 Nov 2025 21:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08CEC40C13
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08CEC40C13;
	Thu, 27 Nov 2025 21:02:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 998B42A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 21:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8002D84442
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 21:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJZBNFUMM3Xt for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 21:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7950E8443E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7950E8443E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7950E8443E
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 21:02:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0558.dip0.t-ipconnect.de [91.58.5.88])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7AEE9A4C7161
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 22:02:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36024)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vOj8a-000000000Q1-0Rq0
 for buildroot@buildroot.org; Thu, 27 Nov 2025 21:02:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 27 Nov 2025 22:02:48 +0100
Message-ID: <20251127210248.3344440-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1764277368;
 bh=n+keLD6dCgQma+NLDJ1/F4Of0/XQs9acfHJEFMdLO4w=;
 h=From:To:Subject:Date:From;
 b=Ix7kRGSHlPYJAYXoDdp72Wm4oyNMvL8bpNmayXasD0Vt3yLfRBDnWTzHjRCBTTc8J
 Y4jxu+vT5leSs+cbTs/EDKR8fxS2di6UnFLKHvEKedRRKKbZid38aG+PbMifQ4kgw9
 O1htYsGBAMdhnmqdruyvHpNecqvVR96802VN7KmHy+FKmWhB53Qb2KVEEmy23vWcFa
 sBSACEp354eyl5bdT8heosVeZCw80z0h9DqKDRAiFnvRRVlRopSRPvTj1SQlha4hTl
 CoucuNglns29q5CkLic/w0PT/aRn0Om6zj9E3quar4FGfgOWzIHGL4bXzIyVoKx9ja
 0wyiUT0Q17YoQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=Ix7kRGSH
Subject: [Buildroot] [PATCH 1/1] package/libargtable2: Remove package
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

The last release dates back to 2012[1], no other package depends on
libargtable2 and the successor package libargtable3 is not backward-
compatible: https://www.argtable.org/

Due to build errors with newer gcc

/home/autobuild/autobuild/instance-15/output-1/host/microblazeel-buildroot-linux-musl/sysroot/usr/include/unistd.h:127:5:
 error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
  127 | int getopt(int, char * const [], const char *);

we remove the package from buildroot.

Fixes:
https://autobuild.buildroot.net/results/e6c/e6c039cb92fecbd93a91d2d1dab68e803875e62c/

[1] https://sourceforge.net/projects/argtable/files/argtable/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                              |  6 +++++
 package/Config.in                             |  1 -
 .../libargtable2/0001-apply-uint-patch.patch  | 25 -------------------
 package/libargtable2/Config.in                |  7 ------
 package/libargtable2/libargtable2.hash        |  3 ---
 package/libargtable2/libargtable2.mk          | 21 ----------------
 6 files changed, 6 insertions(+), 57 deletions(-)
 delete mode 100644 package/libargtable2/0001-apply-uint-patch.patch
 delete mode 100644 package/libargtable2/Config.in
 delete mode 100644 package/libargtable2/libargtable2.hash
 delete mode 100644 package/libargtable2/libargtable2.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 36296ca843..81396a2ce7 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LIBARGTABLE2
+	bool "libargtable2 has been removed"
+	select BR2_LEGACY
+	help
+	  libargtable2 is unmaintained and has been removed
+
 config BR2_PACKAGE_OLA
 	bool "ola has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 12f327cb27..83414b3e0b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2205,7 +2205,6 @@ menu "Other"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
-	source "package/libargtable2/Config.in"
 	source "package/libatomic_ops/Config.in"
 	source "package/libavl/Config.in"
 	source "package/libb64/Config.in"
diff --git a/package/libargtable2/0001-apply-uint-patch.patch b/package/libargtable2/0001-apply-uint-patch.patch
deleted file mode 100644
index fed0307852..0000000000
--- a/package/libargtable2/0001-apply-uint-patch.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11 Mon Sep 17 00:00:00 2001
-From: Chris McClelland <prophet3636@gmail.com>
-Date: Thu, 12 Nov 2020 14:18:27 +0000
-Subject: [PATCH] Apply uint patch
-
-Upstream: https://github.com/makestuff/libargtable2/commit/3fe1ce4d7aa7c4fc16471a9ab023ecf6628c2f11
-[thomas: strip to only have the include]
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- src/arg_int.c     |  2 ++
- 1 files changed, 2 insertions(+)
-
-diff --git a/src/arg_int.c b/src/arg_int.c
-index 29c20e5..c51706a 100644
---- a/src/arg_int.c
-+++ b/src/arg_int.c
-@@ -24,6 +24,8 @@ USA.
- #include "config.h"
- #endif
- 
-+#include <ctype.h>
-+
- /* #ifdef HAVE_STDLIB_H */
- #include <stdlib.h>
- /* #endif */
diff --git a/package/libargtable2/Config.in b/package/libargtable2/Config.in
deleted file mode 100644
index 42d067becd..0000000000
--- a/package/libargtable2/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBARGTABLE2
-	bool "libargtable2"
-	help
-	  A greatly simplified and yet quite robust argument parsing
-	  set of library calls.
-
-	  http://argtable.sourceforge.net/
diff --git a/package/libargtable2/libargtable2.hash b/package/libargtable2/libargtable2.hash
deleted file mode 100644
index 7df3a18041..0000000000
--- a/package/libargtable2/libargtable2.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  8f77e8a7ced5301af6e22f47302fdbc3b1ff41f2b83c43c77ae5ca041771ddbf  argtable2-13.tar.gz
-sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING
diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
deleted file mode 100644
index d033e28f40..0000000000
--- a/package/libargtable2/libargtable2.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# libargtable2
-#
-################################################################################
-
-LIBARGTABLE2_MAJOR_VERSION = 2
-LIBARGTABLE2_MINOR_VERSION = 13
-LIBARGTABLE2_VERSION = $(LIBARGTABLE2_MAJOR_VERSION).$(LIBARGTABLE2_MINOR_VERSION)
-LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_MINOR_VERSION).tar.gz
-LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-$(LIBARGTABLE2_VERSION)
-LIBARGTABLE2_INSTALL_STAGING = YES
-LIBARGTABLE2_CONF_OPTS = \
-	--disable-example \
-	--disable-kernel-module \
-	--enable-lib \
-	--enable-util
-LIBARGTABLE2_LICENSE = LGPL-2.0+
-LIBARGTABLE2_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
