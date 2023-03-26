Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C9CC74A5B
	for <buildroot@archiver.kernel.org>; Sun, 26 Mar 2023 21:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFB8D81E22;
	Sun, 26 Mar 2023 21:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFB8D81E22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6JIp0-Yq8q2U; Sun, 26 Mar 2023 21:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C37D081E2A;
	Sun, 26 Mar 2023 21:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C37D081E2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84D441BF309
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AAFF404F0
 for <buildroot@lists.busybox.net>; Sun, 26 Mar 2023 21:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AAFF404F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dkw6Uf4XBLHd for <buildroot@lists.busybox.net>;
 Sun, 26 Mar 2023 21:10:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB324400E2
 for <buildroot@buildroot.org>; Sun, 26 Mar 2023 21:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB324400E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAE8D82E77; Sun, 26 Mar 2023 21:10:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 26 Mar 2023 22:32:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05d3fdfd1314cce610f4fd2a55599b0595fcf2fc
X-Git-Newrev: c5e94221974326685dba526397747658c28bba4e
X-Patchwork-Hint: ignore
Message-Id: <20230326211024.AAE8D82E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lvm2: enable package with musl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c5e94221974326685dba526397747658c28bba4e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LVM relies on the glibc-specific behaviour of assigning to the
standard streams (stdin etc). As a result the package is currently
disabled when using musl.

This commit backports two patches from upstream lvm2 (not yet in a
release) that fix some build issues with musl, and two additional
patches taken from the Gentoo distribution to address more issues.

With those 4 patches combined, lvm2 builds fine with musl and can
therefore be re-enabled in musl configurations.

Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...g-possible-better-compilation-with-musl-c.patch | 30 ++++++++++
 ...002-mm-preallocate-memory-only-with-glibc.patch | 34 +++++++++++
 ...ne-use-freopen-to-reopen-standard-streams.patch | 68 ++++++++++++++++++++++
 ...og-use-freopen-to-reopen-standard-streams.patch | 44 ++++++++++++++
 package/lvm2/Config.in                             |  5 --
 5 files changed, 176 insertions(+), 5 deletions(-)

diff --git a/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch b/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
new file mode 100644
index 0000000000..f537331a2c
--- /dev/null
+++ b/package/lvm2/0001-clang-possible-better-compilation-with-musl-c.patch
@@ -0,0 +1,30 @@
+From bac596b3685520acaa404dc3ebd2131e6de96d47 Mon Sep 17 00:00:00 2001
+From: Zdenek Kabelac <zkabelac@redhat.com>
+Date: Wed, 16 Feb 2022 00:48:49 +0100
+Subject: [PATCH] clang: possible better compilation with musl c
+
+Try to help resolving reported compilation problem with
+clang & musl C.
+https://github.com/lvmteam/lvm2/issues/61
+
+Backported from: https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=4fd76de4b69f8e5e6d5afa03d54cb4b8986c4bcc
+Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+---
+ libdaemon/server/daemon-server.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libdaemon/server/daemon-server.c b/libdaemon/server/daemon-server.c
+index 88905a7dd..96cfc392e 100644
+--- a/libdaemon/server/daemon-server.c
++++ b/libdaemon/server/daemon-server.c
+@@ -18,6 +18,7 @@
+ 
+ #include <dlfcn.h>
+ #include <errno.h>
++#include <fcntl.h> /* help musl C */
+ #include <pthread.h>
+ #include <sys/file.h>
+ #include <sys/stat.h>
+-- 
+2.22.3
+
diff --git a/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch b/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
new file mode 100644
index 0000000000..db16d60ace
--- /dev/null
+++ b/package/lvm2/0002-mm-preallocate-memory-only-with-glibc.patch
@@ -0,0 +1,34 @@
+From b668022f9b8aecf52109c9e0b7e5847054231361 Mon Sep 17 00:00:00 2001
+From: Zdenek Kabelac <zkabelac@redhat.com>
+Date: Fri, 19 Aug 2022 16:15:17 +0200
+Subject: [PATCH] mm: preallocate memory only with glibc
+
+Use mallinfo() only with glibc.
+
+Backported from: https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=8370d117d7ef8a472c95315a3cd085696c90b3be
+Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+---
+ lib/mm/memlock.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
+index 3d1a3927c..efcc6d91f 100644
+--- a/lib/mm/memlock.c
++++ b/lib/mm/memlock.c
+@@ -160,7 +160,12 @@ static void _touch_memory(void *mem, size_t size)
+ 
+ static void _allocate_memory(void)
+ {
+-#ifndef VALGRIND_POOL
++#if defined(__GLIBC__) && !defined(VALGRIND_POOL)
++	/* Memory allocation is currently only tested with glibc
++	 * for different C libraries, some other mechanisms might be needed
++	 * meanwhile let users use lvm2 code without memory preallocation.
++	 * Compilation for VALGRIND tracing also goes without preallocation.
++	 */
+ 	void *stack_mem;
+ 	struct rlimit limit;
+ 	int i, area = 0, missing = _size_malloc_tmp, max_areas = 32, hblks;
+-- 
+2.22.3
+
diff --git a/package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch
new file mode 100644
index 0000000000..8d0be40320
--- /dev/null
+++ b/package/lvm2/0003-cmdline-use-freopen-to-reopen-standard-streams.patch
@@ -0,0 +1,68 @@
+From 7c74ad9c349e381decc84c218112ea8e7bcc0b9c Mon Sep 17 00:00:00 2001
+From: Simon Rowe <simon.rowe@nutanix.com>
+Date: Thu, 23 Mar 2023 09:57:59 +0000
+Subject: [PATCH] cmdline: use freopen() to reopen standard streams
+
+In glibc stdin, stdout & stderr are variables that can be assigned to
+(https://www.gnu.org/software/libc/manual/html_node/Standard-Streams.html)
+however this not necessarily true of other C libraries.
+
+The gentoo musl porting notes
+(https://wiki.gentoo.org/wiki/Musl_porting_notes)
+recommend the substitution of
+
+    stdX = fopen(...)
+
+with
+
+    freopen(..., stdX)
+
+Taken from: https://github.com/gentoo/gentoo/blob/master/sys-fs/lvm2/files/lvm2-2.03.14-r1-fopen-to-freopen.patch
+Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+---
+ tools/lvmcmdline.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/tools/lvmcmdline.c b/tools/lvmcmdline.c
+index 1e12bedca..534368575 100644
+--- a/tools/lvmcmdline.c
++++ b/tools/lvmcmdline.c
+@@ -3384,7 +3384,11 @@ static int _check_standard_fds(void)
+ 	int err = is_valid_fd(STDERR_FILENO);
+ 
+ 	if (!is_valid_fd(STDIN_FILENO) &&
++#ifdef __GLIBC__
+ 	    !(stdin = fopen(_PATH_DEVNULL, "r"))) {
++#else
++	    !freopen(_PATH_DEVNULL, "r", stdin)) {
++#endif
+ 		if (err)
+ 			perror("stdin stream open");
+ 		else
+@@ -3394,7 +3398,11 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDOUT_FILENO) &&
++#ifdef __GLIBC__
+ 	    !(stdout = fopen(_PATH_DEVNULL, "w"))) {
++#else
++	    !freopen(_PATH_DEVNULL, "w", stdout)) {
++#endif
+ 		if (err)
+ 			perror("stdout stream open");
+ 		/* else no stdout */
+@@ -3402,7 +3410,11 @@ static int _check_standard_fds(void)
+ 	}
+ 
+ 	if (!is_valid_fd(STDERR_FILENO) &&
++#ifdef __GLIBC__
+ 	    !(stderr = fopen(_PATH_DEVNULL, "w"))) {
++#else
++	    !freopen(_PATH_DEVNULL, "w", stderr)) {
++#endif
+ 		printf("stderr stream open: %s\n",
+ 		       strerror(errno));
+ 		return 0;
+-- 
+2.22.3
+
diff --git a/package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch b/package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch
new file mode 100644
index 0000000000..0b57fb6fd2
--- /dev/null
+++ b/package/lvm2/0004-log-use-freopen-to-reopen-standard-streams.patch
@@ -0,0 +1,44 @@
+From 6d6b953cf7d2b8d06e7b0363b1b06cb2e902aa0f Mon Sep 17 00:00:00 2001
+From: Simon Rowe <simon.rowe@nutanix.com>
+Date: Thu, 23 Mar 2023 10:07:02 +0000
+Subject: [PATCH] log: use freopen() to reopen standard streams
+
+In glibc stdin, stdout & stderr are variables that can be assigned to
+(https://www.gnu.org/software/libc/manual/html_node/Standard-Streams.html)
+however this not necessarily true of other C libraries.
+
+The gentoo musl porting notes
+(https://wiki.gentoo.org/wiki/Musl_porting_notes)
+recommend the substitution of
+
+    stdX = fopen(...)
+
+with
+
+    freopen(..., stdX)
+
+Taken from: https://github.com/gentoo/gentoo/blob/master/sys-fs/lvm2/files/lvm2-2.03.14-freopen_n2.patch
+Signed-off-by: Simon Rowe <simon.rowe@nutanix.com>
+---
+ lib/log/log.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/log/log.c b/lib/log/log.c
+index 7b4d537b3..5f62c048c 100644
+--- a/lib/log/log.c
++++ b/lib/log/log.c
+@@ -208,7 +208,11 @@ int reopen_standard_stream(FILE **stream, const char *mode)
+ 
+ 	_check_and_replace_standard_log_streams(old_stream, new_stream);
+ 
++#ifdef __GLIBC__
+ 	*stream = new_stream;
++#else
++	freopen(NULL, mode, *stream);
++#endif
+ 	return 1;
+ }
+ 
+-- 
+2.22.3
+
diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index cc740dd40c..577a90656a 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -27,15 +27,10 @@ if BR2_PACKAGE_LVM2
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
 	default y
-	# http://lists.busybox.net/pipermail/buildroot/2016-August/170592.html
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
 
-comment "lvm2 standard install needs a glibc or uClibc toolchain"
-	depends on BR2_TOOLCHAIN_USES_MUSL
-
 endif
 
 comment "lvm2 needs a toolchain w/ threads, dynamic library"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
