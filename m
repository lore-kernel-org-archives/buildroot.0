Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEF8C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 20:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C00F4190B;
	Sun, 16 Apr 2023 20:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C00F4190B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwMIHl9HPGeK; Sun, 16 Apr 2023 20:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7759F4190C;
	Sun, 16 Apr 2023 20:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7759F4190C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B46B71C4175
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A5B84190C
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A5B84190C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Udbe1KjJb42a for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 20:44:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12146418B7
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 20:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12146418B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1E928189F; Sun, 16 Apr 2023 20:44:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 22:33:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6bb759e2cb14ebaf2603e69652c44d337a39c72
X-Git-Newrev: 5e1c238b7202c3b04d9eab94e429c5580c77444b
X-Patchwork-Hint: ignore
Message-Id: <20230416204412.F1E928189F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: require 5.11
 headers for musl
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0940208525733120470=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0940208525733120470==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5e1c238b7202c3b04d9eab94e429c5580c77444b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There was a conflict between musl and kernel headers prior to 5.11, due
to a bug in kernel headers, which was fixed in a85cbe6159ff ("uapi: move
constants from <linux/kernel.h> to <linux/const.h>") in v5.11, and
backported to stable/LTS kernels.

Upsteam ltp-testsuite has been unreceptive to accepting the workaround,
as they argue that the kernel headers have been fixed, and people should
update their toolchains.

However, it is not always practical, or even possible, to update the
toolchain, so lets require kernel headers at least 5.11 for musl-based
toolchains.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998@free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch | 211 ---------------------
 package/ltp-testsuite/Config.in                    |   1 +
 2 files changed, 1 insertion(+), 211 deletions(-)

diff --git a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
deleted file mode 100644
index 1553908cf8..0000000000
--- a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
+++ /dev/null
@@ -1,211 +0,0 @@
-From f34c6ca3d543968e900d6327d8b5900db63f08ad Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Thu, 1 Oct 2020 23:28:39 +0200
-Subject: [PATCH] lapi: Add sysinfo.h to fix build with MUSL libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The reason is to avoid indirect <linux/sysinfo.h> include when using
-some network headers: <linux/netlink.h> or others -> <linux/kernel.h>
--> <linux/sysinfo.h>
-
-This indirect include causes on MUSL redefinition of struct sysinfo when
-included both <sys/sysinfo.h> and some of UAPI headers:
-
-In file included from x86_64-buildroot-linux-musl/sysroot/usr/include/linux/kernel.h:5,
-                 from x86_64-buildroot-linux-musl/sysroot/usr/include/linux/netlink.h:5,
-                 from ../include/tst_netlink.h:14,
-                 from tst_crypto.c:13:
-x86_64-buildroot-linux-musl/sysroot/usr/include/linux/sysinfo.h:8:8: error: redefinition of ‘struct sysinfo’
- struct sysinfo {
-        ^~~~~~~
-In file included from ../include/tst_safe_macros.h:15,
-                 from ../include/tst_test.h:93,
-                 from tst_crypto.c:11:
-x86_64-buildroot-linux-musl/sysroot/usr/include/sys/sysinfo.h:10:8: note: originally defined here
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
-
-[ upstream status:
-https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-petr.vorel@gmail.com/,
-rebased for 20220527 ]
-
-But this patch is not going to get upstreamed because it got fixed in Linux kernel:
-a85cbe6159ff "uapi: move constants from <linux/kernel.h> to <linux/const.h>"
-
-This patch was also backported to stable and LTS versions,
-which we use since buildroot 54584d233b "{linux, linux-headers}: bump
-5.{4, 10}.x 4.{4, 9, 14, 19} series".
-We just wait for all musl based toolchains to be rebuilt. ]
-
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- include/lapi/sysinfo.h                        | 22 +++++++++++++++++++
- include/tst_safe_macros.h                     |  2 +-
- lib/safe_macros.c                             |  2 +-
- lib/tst_memutils.c                            |  2 +-
- testcases/kernel/mem/mtest01/mtest01.c        |  2 +-
- testcases/kernel/syscalls/madvise/madvise06.c |  2 +-
- testcases/kernel/syscalls/sysinfo/sysinfo01.c |  2 +-
- testcases/kernel/syscalls/sysinfo/sysinfo02.c |  2 +-
- testcases/kernel/syscalls/sysinfo/sysinfo03.c |  2 +-
- .../interfaces/pthread_cond_broadcast/1-2.c   |  2 +-
- 10 files changed, 31 insertions(+), 9 deletions(-)
- create mode 100644 include/lapi/sysinfo.h
-
-diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
-new file mode 100644
-index 000000000..d0e0e93d7
---- /dev/null
-+++ b/include/lapi/sysinfo.h
-@@ -0,0 +1,22 @@
-+// SPDX-License-Identifier: GPL-2.0-or-later
-+/*
-+ * Copyright (c) 2020 Petr Vorel <petr.vorel@gmail.com>
-+ */
-+
-+#ifndef SYSINFO_H__
-+
-+/*
-+ * Don't use <sys/sysinfo.h> as it breaks build MUSL toolchain.
-+ * Use <linux/sysinfo.h> instead.
-+ *
-+ * Some kernel UAPI headers do indirect <linux/sysinfo.h> include:
-+ * <linux/netlink.h> or others -> <linux/kernel.h> -> <linux/sysinfo.h>
-+ *
-+ * This indirect include causes on MUSL redefinition of struct sysinfo when
-+ * included both <sys/sysinfo.h> and some of UAPI headers:
-+ */
-+#include <linux/sysinfo.h>
-+
-+#define SYSINFO_H__
-+
-+#endif /* SYSINFO_H__ */
-diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
-index 81c4b0844..a8c02d7df 100644
---- a/include/tst_safe_macros.h
-+++ b/include/tst_safe_macros.h
-@@ -12,7 +12,7 @@
- #include <sys/resource.h>
- #include <sys/stat.h>
- #include <sys/vfs.h>
--#include <sys/sysinfo.h>
-+#include <linux/sysinfo.h>
- #include <fcntl.h>
- #include <libgen.h>
- #include <signal.h>
-diff --git a/lib/safe_macros.c b/lib/safe_macros.c
-index a5b6bc504..87d922a92 100644
---- a/lib/safe_macros.c
-+++ b/lib/safe_macros.c
-@@ -11,7 +11,7 @@
- #include <sys/wait.h>
- #include <sys/mount.h>
- #include <sys/xattr.h>
--#include <sys/sysinfo.h>
-+#include "lapi/sysinfo.h"
- #include <errno.h>
- #include <fcntl.h>
- #include <libgen.h>
-diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
-index 0d20bb17c..21a3a5ba0 100644
---- a/lib/tst_memutils.c
-+++ b/lib/tst_memutils.c
-@@ -6,7 +6,7 @@
- #include <stdio.h>
- #include <unistd.h>
- #include <limits.h>
--#include <sys/sysinfo.h>
-+#include "lapi/sysinfo.h"
- #include <stdlib.h>
-
- #define TST_NO_DEFAULT_MAIN
-diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
-index fb991ce8b..0fccd5405 100644
---- a/testcases/kernel/mem/mtest01/mtest01.c
-+++ b/testcases/kernel/mem/mtest01/mtest01.c
-@@ -20,7 +20,6 @@
-  */
-
- #include <sys/types.h>
--#include <sys/sysinfo.h>
- #include <sys/wait.h>
- #include <limits.h>
- #include <signal.h>
-@@ -29,6 +28,7 @@
- #include <unistd.h>
-
- #include "lapi/abisize.h"
-+#include "lapi/sysinfo.h"
- #include "tst_test.h"
-
- #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
-diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
-index 6d218801c..8af11a030 100644
---- a/testcases/kernel/syscalls/madvise/madvise06.c
-+++ b/testcases/kernel/syscalls/madvise/madvise06.c
-@@ -46,7 +46,7 @@
- #include <errno.h>
- #include <stdio.h>
- #include <sys/mount.h>
--#include <sys/sysinfo.h>
-+#include "lapi/sysinfo.h"
- #include "tst_test.h"
-
- #define CHUNK_SZ (400*1024*1024L)
-diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
-index 2ea44a2be..a237345ef 100644
---- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
-+++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
-@@ -69,7 +69,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/signal.h>
--#include <sys/sysinfo.h>
-+#include "lapi/sysinfo.h"
-
- #include "test.h"
-
-diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
-index 7ad0e8bdc..61fa1ab75 100644
---- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
-+++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
-@@ -65,7 +65,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/signal.h>
--#include <sys/sysinfo.h>
-+#include "lapi/sysinfo.h"
- #include <stdint.h>
-
- #include "test.h"
-diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
-index af7cb6421..dc5ae65e3 100644
---- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
-+++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
-@@ -13,7 +13,7 @@
-
-  */
-
--#include <sys/sysinfo.h>
-+#include "lapi/sysinfo.h"
- #include "lapi/namespaces_constants.h"
- #include "lapi/posix_clocks.h"
- #include "tst_test.h"
-diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
-index 22e7c3638..572701f9f 100644
---- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
-+++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
-@@ -43,7 +43,7 @@
- #include <sys/wait.h>
- #include <semaphore.h>
- #ifdef	__linux__
--#include <sys/sysinfo.h>
-+#include "lapi/sysinfo.h"
- #endif
-
- #include "../testfrmw/testfrmw.h"
---
-2.36.1
-
diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 272c2ede37..b42082e2cc 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -12,6 +12,7 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC

--===============0940208525733120470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0940208525733120470==--
