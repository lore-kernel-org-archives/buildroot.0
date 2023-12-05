Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359C2C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 20:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D39682AB9;
	Tue,  5 Dec 2023 20:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D39682AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3cB4j2UJaBwH; Tue,  5 Dec 2023 20:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A899482AC6;
	Tue,  5 Dec 2023 20:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A899482AC6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7E5F1BF593
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 20:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B13CC82AC6
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 20:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13CC82AC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IayZYL15X8Wq for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 20:39:44 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 458B682AB9
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 20:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 458B682AB9
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a06e59384b6so10499566b.1
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 12:39:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701808782; x=1702413582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fJoSbJtpkc27Opz65paiL4zjkmfZmjYpCmb78aZVe/k=;
 b=F04FwR7lGYnIaJbW3SGovFrLjZinzL1SOwqg0g+GTBoHIMbBOdBnk9UiVkHBM+QnCP
 XHmXuteSHgXGcv0xLUV0XearJ0ZLxxkAPZm/HTq9A1FGhQvSa7zck5t0AvXtHXLO42eR
 eRwTRPx27cAbDqfCj2B3XYvszlxlheHLCIqM1Z6xfU2JG+UHw6T78kjeHe+kp9AN5epx
 TXWLMP1YEr4v1Wu1DBCgWfzDVqOMu8NSnhGNpWHaVa8V63NOTBOw739F2ECJo53BXn76
 FWzB7M01v9H0qLbi2owgWj2bD9nixNlKENGTKNX9139FIW6FysxvCqI0rGemi8mZuOuK
 Csww==
X-Gm-Message-State: AOJu0YwrMDZhKr0lBHpbNcV/t2Dg9sGpnZtzBeNtukcWywCYjTfNbMyK
 h3Yf/sn0ENDovEibHEr7LEYHzLeKqcxlRA==
X-Google-Smtp-Source: AGHT+IHB/n4OPPE3V0RRKG89kCVzA5inSCy1Mwjwh+b3HuwFzWSMe0jLOIghzYXTLU7dDX3pJ38e1w==
X-Received: by 2002:a17:906:10c7:b0:a1c:f745:e0b6 with SMTP id
 v7-20020a17090610c700b00a1cf745e0b6mr492324ejv.61.1701808782045; 
 Tue, 05 Dec 2023 12:39:42 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a17090639d000b00a1b73154eacsm3188048eje.194.2023.12.05.12.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 12:39:41 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 21:39:37 +0100
Message-ID: <20231205203938.131558-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701808782; x=1702413582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fJoSbJtpkc27Opz65paiL4zjkmfZmjYpCmb78aZVe/k=;
 b=TGbWiliYFSIGqD38q7cnVGDKH76iUSbAvw26Xa4uimlIiruQBtfCKiXxNg18YqVI3l
 zo522564JZAYeWW3W0S9Up2SwnlUGD+HBt+rdTQ1Ygtuy8TCEwVKZYLAMkDMPx8qJgcj
 v7s9mNG++7k5ZxYjrBpg3Usad9/HeThqGWQjRwYSX+0+rOyYyXcyJzJnw9iHfQDeHXAu
 XqBvi0bTQHQ+Lj5QkCPm9iBrAElBkA0KtxhH0SVGYI5zbjj2SfW6tspqIdqAjAUoDB9h
 tq9dCXXwZIa5wEhkC2yw5+cJfLtB0aCunlbULDAas5MrKTOnH6zwTsCPRTsqJ3qNRaip
 HIlg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TGbWiliY
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.6.4
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove patches backported from this release.
Backport patch from upstream ML needed for uClibc-ng.

Require kernel 3.17 due getrandom() dependency.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi Giulio, Yann,

I'm sorry, while I was able to reproduce the problem on nfs-utils master
Giulio reported [2], I'm not able to reproduce it on this patch due
failure on libressl (nfs-utils dependency):

buildroot/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/output/build/libressl-3.8.2/crypto/bn/bn_add.c:65:21: fatal error: bn_arch.h: No such file or directory
 #include "bn_arch.h"

Can we please merge this first?

Kind regards,
Petr

[1] http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
[2] https://lore.kernel.org/buildroot/309e8ae9-47a4-4c49-9e69-09eec14b225a@benettiengineering.com/

I was not able to verify if thi

 ...event-and-libsqlite3-checked-when-nf.patch | 79 -------------------
 ...idd-reexport-.c-Add-missing-unistd.h.patch | 43 ++++++++++
 ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 -----------
 package/nfs-utils/Config.in                   |  1 +
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  2 +-
 6 files changed, 47 insertions(+), 126 deletions(-)
 delete mode 100644 package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 create mode 100644 package/nfs-utils/0001-reexport-fsidd-reexport-.c-Add-missing-unistd.h.patch
 delete mode 100644 package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch

diff --git a/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch b/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
deleted file mode 100644
index a6a6d56d7f..0000000000
--- a/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From bc4a5deef9f820c55fdac3c0070364c17cd91cca Mon Sep 17 00:00:00 2001
-From: Wiktor Jaskulski <wjaskulski@adva.com>
-Date: Thu, 11 May 2023 15:28:23 -0400
-Subject: [PATCH] configure.ac: libevent and libsqlite3 checked when nfsv4 is
- disabled
-
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- configure.ac | 38 +++++++++++++++-----------------------
- 1 file changed, 15 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9df52e9c..6fbcb974 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -338,42 +338,34 @@ CPPFLAGS="${nfsutils_save_CPPFLAGS}"
- AC_CHECK_HEADER(uuid/uuid.h, ,
- 	AC_MSG_ERROR([Cannot find needed header file uuid/uuid.h. Install libuuid-devel]))
- 
-+dnl check for libevent libraries and headers
-+AC_LIBEVENT
-+
-+dnl Check for sqlite3
-+AC_SQLITE3_VERS
-+
-+case $libsqlite3_cv_is_recent in
-+yes) ;;
-+unknown)
-+   dnl do not fail when cross-compiling
-+   AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
-+*)
-+   AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
-+esac
-+
- if test "$enable_nfsv4" = yes; then
--  dnl check for libevent libraries and headers
--  AC_LIBEVENT
- 
-   dnl check for the keyutils libraries and headers
-   AC_KEYUTILS
- 
--  dnl Check for sqlite3
--  AC_SQLITE3_VERS
--
-   if test "$enable_nfsdcld" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcld]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
--    esac
-   fi
- 
-   if test "$enable_nfsdcltrack" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcltrack]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcltrack requires sqlite-devel]) ;;
--    esac
-   fi
- 
- else
--- 
-2.34.1
-
diff --git a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Add-missing-unistd.h.patch b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Add-missing-unistd.h.patch
new file mode 100644
index 0000000000..3d00a93239
--- /dev/null
+++ b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Add-missing-unistd.h.patch
@@ -0,0 +1,43 @@
+From 8dbde05c4ed96bf043402f2f868ee2e62e1f89c6 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Tue, 5 Dec 2023 20:40:36 +0100
+Subject: [PATCH] reexport/{fsidd,reexport}.c: Add missing <unistd.h>
+Upstream: https://lore.kernel.org/linux-nfs/20231205201556.5477-1-pvorel@suse.cz/
+
+uClibc-ng requires this header for close(2), unlink(2) and write(2).
+
+Fixes: 1a4edb2a ("reexport/fsidd.c: Remove unused headers")
+Fixes: bdc79f02 ("support/reexport.c: Remove unused headers")
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+---
+ support/reexport/fsidd.c    | 1 +
+ support/reexport/reexport.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
+index 8a70b78f..307e73e5 100644
+--- a/support/reexport/fsidd.c
++++ b/support/reexport/fsidd.c
+@@ -7,6 +7,7 @@
+ #include <dlfcn.h>
+ #endif
+ #include <event2/event.h>
++#include <unistd.h>
+
+ #include "conffile.h"
+ #include "reexport_backend.h"
+diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
+index 0fb49a46..c7bff6a3 100644
+--- a/support/reexport/reexport.c
++++ b/support/reexport/reexport.c
+@@ -7,6 +7,7 @@
+ #endif
+ #include <sys/types.h>
+ #include <sys/vfs.h>
++#include <unistd.h>
+ #include <errno.h>
+
+ #include "nfsd_path.h"
+--
+2.43.0
+
diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
deleted file mode 100644
index 6612847be7..0000000000
--- a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 11 Jun 2023 08:57:11 +0200
-Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H
-
-Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=8125c6f4ad156a9bad0dc2cc42e0243380fc478d
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- support/reexport/fsidd.c    | 2 ++
- support/reexport/reexport.c | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
-index 37649d06..d4b245e8 100644
---- a/support/reexport/fsidd.c
-+++ b/support/reexport/fsidd.c
-@@ -3,7 +3,9 @@
- #endif
- 
- #include <assert.h>
-+#ifdef HAVE_DLFCN_H
- #include <dlfcn.h>
-+#endif
- #include <event2/event.h>
- #include <limits.h>
- #include <stdint.h>
-diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
-index d597a2f7..d9a700af 100644
---- a/support/reexport/reexport.c
-+++ b/support/reexport/reexport.c
-@@ -2,7 +2,9 @@
- #include <config.h>
- #endif
- 
-+#ifdef HAVE_DLFCN_H
- #include <dlfcn.h>
-+#endif
- #include <stdint.h>
- #include <stdio.h>
- #include <sys/random.h>
--- 
-2.39.2
-
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index b4568dc6f3..dccb3acaf3 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
 	select BR2_PACKAGE_SQLITE
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 015906553d..9d74991df1 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.3/sha256sums.asc
-sha256  38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1  nfs-utils-2.6.3.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.4/sha256sums.asc
+sha256  01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d  nfs-utils-2.6.4.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 3c85be0558..0ab852b045 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.6.3
+NFS_UTILS_VERSION = 2.6.4
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
