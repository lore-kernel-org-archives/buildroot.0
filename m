Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F438C4167B
	for <buildroot@archiver.kernel.org>; Tue,  5 Dec 2023 22:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B81754186B;
	Tue,  5 Dec 2023 22:51:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81754186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YExVPJF9iD1F; Tue,  5 Dec 2023 22:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E7D418B2;
	Tue,  5 Dec 2023 22:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E7D418B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C73E1BF2F4
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 22:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E9CF813DB
 for <buildroot@lists.busybox.net>; Tue,  5 Dec 2023 22:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E9CF813DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FcmNpMZgEtBI for <buildroot@lists.busybox.net>;
 Tue,  5 Dec 2023 22:50:56 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AB7A813CC
 for <buildroot@buildroot.org>; Tue,  5 Dec 2023 22:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AB7A813CC
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-54ca339ae7aso4245277a12.3
 for <buildroot@buildroot.org>; Tue, 05 Dec 2023 14:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701816654; x=1702421454;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mt+jBBwe/F/30345sFCvHhioZ9uNsb5Wu6Z4CyS6LeU=;
 b=NkMIZcVsquQk0vyx3IWVkhsvCwL0JhZvkKWNXv22B+Wb+f96lhboot21y5bPGg/7DT
 InG91qMMDZevKGXDPmOwedVJXT2QoEE4RkiaCMDQA4tOaiRATl2XgUPiwFleKtRIwpaJ
 qynLMuOp7J1EEyg+0fil77BQQKJJtr32H7YkVm8RwKjwYALESY0aYhesMVeO+u5rRxXz
 l+9QwJ0c6Sto3TNQlk0sFZyTYOw7pw0568wBeNwSVmU2LB2umAvzcTluC60LLWCnKrf2
 MVx2/c3uIu9GOt9Rdz4VDenQmRb+n8yMVPYl2VCnE+TUb3ZObPlFThUgX0VcqayF8Wzi
 Q3Ew==
X-Gm-Message-State: AOJu0YzgwdIDvoEZi48QrDI4EbUMCeQwZucxmoXMMYGJCeHdsJ4udGDk
 fs9kXPw+tmjqsWokqX/k5FR6g0n3T4c2wg==
X-Google-Smtp-Source: AGHT+IFC+k8fVgbi5iSaQp7wWwMcQk8ySBipz/IkvhghIHLzG32gRciT03U5idavd4SS/rAt/osSdg==
X-Received: by 2002:a50:f692:0:b0:54c:4837:a65d with SMTP id
 d18-20020a50f692000000b0054c4837a65dmr30762edn.74.1701816654279; 
 Tue, 05 Dec 2023 14:50:54 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a056402134a00b0054c86f882bcsm1635357edw.22.2023.12.05.14.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 14:50:53 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Dec 2023 23:50:50 +0100
Message-ID: <20231205225050.142513-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701816654; x=1702421454; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mt+jBBwe/F/30345sFCvHhioZ9uNsb5Wu6Z4CyS6LeU=;
 b=ggq9GWwv+C606TvVdjVPq23tHOOQ8SrpD4eZpmCatcTa+LGG938bGaL38TmDPetyRz
 CayniiL41tEwg1iDz5h0SnsvGewQh/jQUOnWQUcvCjkHGk3yVQgidkm7AxY9Owj8fmUc
 XTKqxRziHrB0i4N+RRR34il7MpK/33Tc8OrGzLKxrsQgs0Knzb9ST6+XcIhmjlcFu5ph
 xn3udHdW9WbF7v5CGP2h8dSqfhQKS5Sn1gxfSZLKexdzFEi6Tra7VSASx/M/KourveIO
 ozuIkqPvfIbpTBt0lpoVLwU4YYMI3l8zx/XZC4F1AoiTil6X2wz2Mt3gQ3eGkPfsVtBB
 bYgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ggq9GWwv
Subject: [Buildroot] [PATCH v3 1/1] package/nfs-utils: bump version to 2.6.4
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
Backport 2 patches from upstream ML needed for uClibc-ng on mips.

Require kernel 3.17 due getrandom() dependency.
Add host-util-linux to HOST_NFS_UTILS_DEPENDENCIES
(new uuid.h dependency).

Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...event-and-libsqlite3-checked-when-nf.patch | 79 -------------------
 ...-reexport-.c-Re-add-missing-includes.patch | 45 +++++++++++
 ...d_sqlite.c-Add-missing-sys-syscall.h.patch | 32 ++++++++
 ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 -----------
 package/nfs-utils/Config.in                   |  1 +
 package/nfs-utils/nfs-utils.hash              |  4 +-
 package/nfs-utils/nfs-utils.mk                |  4 +-
 7 files changed, 82 insertions(+), 127 deletions(-)
 delete mode 100644 package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 create mode 100644 package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
 create mode 100644 package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
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
diff --git a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
new file mode 100644
index 0000000000..f5b9becf34
--- /dev/null
+++ b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
@@ -0,0 +1,45 @@
+From 4710e469cd0f512ac5e2c3c4335d8e21b97f21b0 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Tue, 5 Dec 2023 20:40:36 +0100
+Subject: [PATCH] reexport/{fsidd,reexport}.c: Re-add missing includes
+Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-1-pvorel@suse.cz/
+
+Older uClibc-ng requires <unistd.h> for close(2), unlink(2) and write(2),
+<sys/un.h> for struct sockaddr_un.
+
+Fixes: 1a4edb2a ("reexport/fsidd.c: Remove unused headers")
+Fixes: bdc79f02 ("support/reexport.c: Remove unused headers")
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+---
+ support/reexport/fsidd.c    | 2 ++
+ support/reexport/reexport.c | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
+index 3e62b3fc..814fb48e 100644
+--- a/support/reexport/fsidd.c
++++ b/support/reexport/fsidd.c
+@@ -7,6 +7,8 @@
+ #include <dlfcn.h>
+ #endif
+ #include <event2/event.h>
++#include <sys/un.h>
++#include <unistd.h>
+ 
+ #include "conffile.h"
+ #include "reexport_backend.h"
+diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
+index 78516586..1900b336 100644
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
diff --git a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
new file mode 100644
index 0000000000..ee77d69868
--- /dev/null
+++ b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
@@ -0,0 +1,32 @@
+From aee92881ba80cf2ae7381d19f09e7fbeda57974c Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Tue, 5 Dec 2023 23:20:33 +0100
+Subject: [PATCH] support/backend_sqlite.c: Add missing <sys/syscall.h>
+Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-2-pvorel@suse.cz/
+
+This fixes build on systems which actually needs getrandom()
+(to get SYS_getrandom).
+
+Fixes: f92fd6ca ("support/backend_sqlite.c: Add getrandom() fallback")
+Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
+Reported-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+---
+ support/reexport/backend_sqlite.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
+index 0eb5ea37..54dfe447 100644
+--- a/support/reexport/backend_sqlite.c
++++ b/support/reexport/backend_sqlite.c
+@@ -7,6 +7,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/syscall.h>
+ #include <unistd.h>
+ 
+ #ifdef HAVE_GETRANDOM
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
