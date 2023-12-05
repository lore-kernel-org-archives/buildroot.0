Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19554C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 21:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C42FA61404;
	Tue,  5 Dec 2023 21:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C42FA61404
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U2BlWjCReVr2; Tue,  5 Dec 2023 21:23:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C114B61396;
	Tue,  5 Dec 2023 21:23:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C114B61396
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A6D341BF35E
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 21:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7FA3D418BE
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 21:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA3D418BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vn3dbCNWGWZT for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 21:23:51 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D99540360
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 21:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D99540360
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ca02def690so36559311fa.3
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 13:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701811429; x=1702416229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vm25FlItunI2pBZGxblY7ZuOPRymHeLSv3AXAkbJVpo=;
 b=Er/Jf4DzbeLh7nAlkfLIxij83ExesecyE26jPtQZiJiSwUrHsJgYlm6+DEKqpp41Dw
 JN+H2Kr9P4woc6zTK4ClWpgL4QHN1QCTRAd4q3lbDnS/cG7/7QBjUvAhasY787kN5KTJ
 kX60U4mmCTUumGGGRcCpqkwj3CXC40d1HcT71wP/T4KmsJgyVaPmExI30tqTcqsnKEDl
 WIQmc4umsHFZjodnHcYelXTdsm/OBFahXqhGjl9a6E4Coi6n1u+wHUO6kd8N/vtpmLZl
 O9ItnbG0EhiLO3sSHwUMVtbMhEnW776DuVvNPElWW0ggWiXRCqMkCewFzcgleugm6tmP
 MKUw==
X-Gm-Message-State: AOJu0YwhaLbfhwcZRiuAukAEVJvMT9SznAHfGa6ii1V104Ddxb4I8SPU
 bLbBj8d7tvxw50CKbITn7+vQ+y65rXthIQ==
X-Google-Smtp-Source: AGHT+IGMXCHmdkiTp9g2flvGT0Hx/dv4KYMTeRIV2gXxmsIxQmSxI6DZGagcAS7JS9oYywgnMaoKKw==
X-Received: by 2002:a2e:8805:0:b0:2c9:f507:5d6c with SMTP id
 x5-20020a2e8805000000b002c9f5075d6cmr2742530ljh.66.1701811428629; 
 Tue, 05 Dec 2023 13:23:48 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 n26-20020aa7c79a000000b0054cea9f91e9sm1549372eds.20.2023.12.05.13.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 13:23:48 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 22:23:41 +0100
Message-ID: <20231205212341.135861-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701811429; x=1702416229; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vm25FlItunI2pBZGxblY7ZuOPRymHeLSv3AXAkbJVpo=;
 b=DbX+h2QlXN858CH0OgWrBp3toS3r2rSo7lRz0B4RMuOY8XDpLVS55hUCiX1mCVhJf6
 lVJONKmwwaEMSjki85wE+WAUNGsJ0h+uujw2fPL5nKDzZ7FxJHQ8Z+63gmYHVO9QgHJ+
 4q4xSfkurHBb+xNqglY2EPq4LjDZ5L1V+6mDTefbwEtb3AubNq8j2oO1JOF3GrMtBuvz
 HmDwgDX58/ephzLfcgE62eq3iTMcvvrw1WrTkfvAgwxgOg8yPztNHGMCU1YNe0x6OVUY
 CrIY05Vw7q7wC++vnKvCF1AhMN6dTNqFxpdet/AFcPy3ldRmipYnkznWcHll0ln7q1rT
 F3Uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DbX+h2Ql
Subject: [Buildroot] [PATCH v2] package/nfs-utils: bump version to 2.6.4
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
Add host-util-linux to HOST_NFS_UTILS_DEPENDENCIES
(new uuid.h dependency).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2
* Add host-util-linux to HOST_NFS_UTILS_DEPENDENCIES (Giulio).

NOTE
* still not handled build failure [1]
* not tested the dependencies with utils/docker-run

[1] http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/

 ...event-and-libsqlite3-checked-when-nf.patch | 79 -------------------
 ...idd-reexport-.c-Add-missing-unistd.h.patch | 43 ++++++++++
 ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 -----------
 package/nfs-utils/Config.in                   |  1 +
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  4 +-
 6 files changed, 48 insertions(+), 127 deletions(-)
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
index 3c85be0558..a11ba154ad 100644
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
@@ -22,7 +22,7 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite host-util-linux
 
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
