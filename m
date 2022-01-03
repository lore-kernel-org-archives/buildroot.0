Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF6BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 20:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 167FD817BD;
	Mon,  3 Jan 2022 20:09:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzIDTnyYgHed; Mon,  3 Jan 2022 20:09:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CB90817AA;
	Mon,  3 Jan 2022 20:09:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4729E1BF302
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3983B817AA
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 20:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tYl04tHvijJR for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 20:09:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AA92817A5
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 20:09:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8277D82B2E; Mon,  3 Jan 2022 20:03:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jan 2022 20:49:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 779501290f7205de2dcb7a7eadff9e456b0e2d3e
X-Git-Newrev: 85c7bd0602715dc6a148cc79db8910dca27c4e76
X-Patchwork-Hint: ignore
Message-Id: <20220103200326.8277D82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: bump to version 6.2.0
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
Content-Type: multipart/mixed; boundary="===============8723297361752368128=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8723297361752368128==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=85c7bd0602715dc6a148cc79db8910dca27c4e76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove uclibc workaround which was deprecated by upstream :
  commit a30bfaa7bd1f ("linux-user/host/arm: Populate host_signal.h")

Remove upstream patches :
  commit 304332039014 ("block/export/fuse.c: fix musl build")
  commit 28031d5c7427 ("block/export/fuse.c: fix fuse-lseek on uclibc or musl")

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ix-usage-of-mcontext-structure-on-ARM-uCl.patch | 35 ----------------
 ...t-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch | 44 -------------------
 .../0004-block-export-fuse.c-fix-musl-build.patch  | 49 ----------------------
 package/qemu/qemu.hash                             |  2 +-
 package/qemu/qemu.mk                               |  2 +-
 5 files changed, 2 insertions(+), 130 deletions(-)

diff --git a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch b/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
deleted file mode 100644
index 6db4e8bc92..0000000000
--- a/package/qemu/0001-user-exec-fix-usage-of-mcontext-structure-on-ARM-uCl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 923d25365fbdff17fa4c8c2883960be07c3dad56 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 5 May 2017 09:07:15 +0200
-Subject: [PATCH] user-exec: fix usage of mcontext structure on ARM/uClibc
-
-user-exec.c has some conditional code to decide how to use the
-mcontext structure. Unfortunately, since uClibc defines __GLIBC__, but
-with old versions of __GLIBC__ and __GLIBC_MINOR__, an old code path
-gets used, which doesn't apply to uClibc.
-
-Fix this by excluding __UCLIBC__, which ensures we fall back to the
-general case of using uc_mcontext.arm_pc, which works fine with
-uClibc.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- accel/tcg/user-exec.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
-index 4ebe25461a..0496674fbd 100644
---- a/accel/tcg/user-exec.c
-+++ b/accel/tcg/user-exec.c
-@@ -540,7 +540,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
- 
- #if defined(__NetBSD__)
-     pc = uc->uc_mcontext.__gregs[_REG_R15];
--#elif defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
-+#elif defined(__GLIBC__) && !defined(__UCLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
-     pc = uc->uc_mcontext.gregs[R15];
- #else
-     pc = uc->uc_mcontext.arm_pc;
--- 
-2.25.3
-
diff --git a/package/qemu/0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch b/package/qemu/0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
deleted file mode 100644
index 50762055bf..0000000000
--- a/package/qemu/0003-block-export-fuse.c-fix-fuse-lseek-on-uclibc-or-musl.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 8c3fcbf23fe31cf56f21ce1737bf22fe65fc553b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 27 Aug 2021 23:40:01 +0200
-Subject: [PATCH] block/export/fuse.c: fix fuse-lseek on uclibc or musl
-
-Include linux/fs.h to avoid the following build failure on uclibc or
-musl raised since version 6.0.0:
-
-../block/export/fuse.c: In function 'fuse_lseek':
-../block/export/fuse.c:641:19: error: 'SEEK_HOLE' undeclared (first use in this function)
-  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
-      |                   ^~~~~~~~~
-../block/export/fuse.c:641:19: note: each undeclared identifier is reported only once for each function it appears in
-../block/export/fuse.c:641:42: error: 'SEEK_DATA' undeclared (first use in this function); did you mean 'SEEK_SET'?
-  641 |     if (whence != SEEK_HOLE && whence != SEEK_DATA) {
-      |                                          ^~~~~~~~~
-      |                                          SEEK_SET
-
-Fixes:
- - http://autobuild.buildroot.org/results/33c90ebf04997f4d3557cfa66abc9cf9a3076137
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://patchwork.ozlabs.org/project/qemu-devel/patch/20210827220301.272887-1-fontaine.fabrice@gmail.com/]
----
- block/export/fuse.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/block/export/fuse.c b/block/export/fuse.c
-index fc7b07d2b5..2e3bf8270b 100644
---- a/block/export/fuse.c
-+++ b/block/export/fuse.c
-@@ -31,6 +31,9 @@
- #include <fuse.h>
- #include <fuse_lowlevel.h>
- 
-+#ifdef __linux__
-+#include <linux/fs.h>
-+#endif
- 
- /* Prevent overly long bounce buffer allocations */
- #define FUSE_MAX_BOUNCE_BYTES (MIN(BDRV_REQUEST_MAX_BYTES, 64 * 1024 * 1024))
--- 
-2.32.0
-
diff --git a/package/qemu/0004-block-export-fuse.c-fix-musl-build.patch b/package/qemu/0004-block-export-fuse.c-fix-musl-build.patch
deleted file mode 100644
index 4856821843..0000000000
--- a/package/qemu/0004-block-export-fuse.c-fix-musl-build.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 304332039014679b809f606e2f227ee0fc43a451 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 22 Oct 2021 11:52:09 +0200
-Subject: [PATCH] block/export/fuse.c: fix musl build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Include linux/falloc.h if CONFIG_FALLOCATE_ZERO_RANGE is defined to fix
-https://gitlab.com/qemu-project/qemu/-/commit/50482fda98bd62e072c30b7ea73c985c4e9d9bbb
-and avoid the following build failure on musl:
-
-../block/export/fuse.c: In function 'fuse_fallocate':
-../block/export/fuse.c:643:21: error: 'FALLOC_FL_ZERO_RANGE' undeclared (first use in this function)
-  643 |     else if (mode & FALLOC_FL_ZERO_RANGE) {
-      |                     ^~~~~~~~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/be24433a429fda681fb66698160132c1c99bc53b
-
-Fixes: 50482fda98b ("block/export/fuse.c: fix musl build")
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Message-Id: <20211022095209.1319671-1-fontaine.fabrice@gmail.com>
-Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
-Signed-off-by: Kevin Wolf <kwolf@redhat.com>
-[Retrieved from:
-https://gitlab.com/qemu-project/qemu/-/commit/304332039014679b809f606e2f227ee0fc43a451]
----
- block/export/fuse.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/block/export/fuse.c b/block/export/fuse.c
-index 2e3bf8270b..823c126d23 100644
---- a/block/export/fuse.c
-+++ b/block/export/fuse.c
-@@ -31,6 +31,10 @@
- #include <fuse.h>
- #include <fuse_lowlevel.h>
- 
-+#if defined(CONFIG_FALLOCATE_ZERO_RANGE)
-+#include <linux/falloc.h>
-+#endif
-+
- #ifdef __linux__
- #include <linux/fs.h>
- #endif
--- 
-GitLab
-
diff --git a/package/qemu/qemu.hash b/package/qemu/qemu.hash
index 0613fce493..9411832384 100644
--- a/package/qemu/qemu.hash
+++ b/package/qemu/qemu.hash
@@ -1,4 +1,4 @@
 # Locally computed, tarball verified with GPG signature
-sha256  eebc089db3414bbeedf1e464beda0a7515aad30f73261abc246c9b27503a3c96  qemu-6.1.0.tar.xz
+sha256  68e15d8e45ac56326e0b9a4afa8b49a3dfe8aba3488221d098c84698bca65b45  qemu-6.2.0.tar.xz
 sha256  6f04ae8364d0079a192b14635f4b1da294ce18724c034c39a6a41d1b09df6100  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 919aef6599..97f9f885a1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QEMU_VERSION = 6.1.0
+QEMU_VERSION = 6.2.0
 QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.xz
 QEMU_SITE = http://download.qemu.org
 QEMU_LICENSE = GPL-2.0, LGPL-2.1, MIT, BSD-3-Clause, BSD-2-Clause, Others/BSD-1c

--===============8723297361752368128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8723297361752368128==--
