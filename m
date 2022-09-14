Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D05C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 22:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1ECD40913;
	Wed, 14 Sep 2022 22:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1ECD40913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASjNGtGXUVUE; Wed, 14 Sep 2022 22:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585B040351;
	Wed, 14 Sep 2022 22:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 585B040351
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88EA31C115D
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 653BE40528
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 22:29:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 653BE40528
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Yap--xjNQAu for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 481F9404E5
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 481F9404E5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3675E83B2F; Wed, 14 Sep 2022 22:29:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 00:22:06 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 916e3e98979905d1eb1be51adc8d7c056704c054
X-Git-Newrev: 6e4e92fc2d9a565f86129d6bcd0565ba418654f4
X-Patchwork-Hint: ignore
Message-Id: <20220914222919.3675E83B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/xfsprogs: fix
 build for architectures without MAP_SYNC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6e4e92fc2d9a565f86129d6bcd0565ba418654f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Back port a patch from upstream that will be in the next xfsprogs release:

https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git/commit/?h=for-next&id=28965957f4ea5c79fc0b91b997168c656a4426c5

required a tiny bit of massaging to apply cleanly to xfsprogs-5.14.2.

Fixes: http://autobuild.buildroot.net/results/407131b767fc8241e8f5f5001c0b5d4e2c488dea

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8acfedf922325a0fb7d7d6e7a1287eab6fae386a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-overriding-MAP_SYNC-in-publicly-exported.patch | 187 +++++++++++++++++++++
 1 file changed, 187 insertions(+)

diff --git a/package/xfsprogs/0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch b/package/xfsprogs/0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch
new file mode 100644
index 0000000000..510ed5b642
--- /dev/null
+++ b/package/xfsprogs/0003-libxfs-stop-overriding-MAP_SYNC-in-publicly-exported.patch
@@ -0,0 +1,187 @@
+From b82bd75c80aadcc2890b23f63eec9ba2c560b2e5 Mon Sep 17 00:00:00 2001
+From: "Darrick J. Wong" <djwong@kernel.org>
+Date: Thu, 4 Aug 2022 21:26:43 -0500
+Subject: [PATCH] libxfs: stop overriding MAP_SYNC in publicly exported header
+ files
+
+Florian Fainelli most recently reported that xfsprogs doesn't build with
+musl on mips:
+
+"MIPS platforms building with recent kernel headers and the musl-libc
+toolchain will expose the following build failure:
+
+mmap.c: In function 'mmap_f':
+mmap.c:196:12: error: 'MAP_SYNC' undeclared (first use in this function); did you mean 'MS_SYNC'?
+  196 |    flags = MAP_SYNC | MAP_SHARED_VALIDATE;
+      |            ^~~~~~~~
+      |            MS_SYNC
+mmap.c:196:12: note: each undeclared identifier is reported only once for each function it appears in
+make[4]: *** [../include/buildrules:81: mmap.o] Error 1"
+
+At first glance, the build failure here is caused by the fact that:
+
+1. The configure script doesn't detect MAP_SYNC support
+2. The build system doesn't set HAVE_MAP_SYNC
+2. io/mmap.c includes input.h -> projects.h -> xfs.h and later sys/mman.h
+3. include/linux.h #define's MAP_SYNC to 0 if HAVE_MAP_SYNC is not set
+4. musl's sys/mman.h #undef MAP_SYNC on platforms that don't support it
+5. io/mmap.c tries to use MAP_SYNC, not realizing that libc undefined it
+
+Normally, xfs_io only exports functionality that is defined by the libc
+and/or kernel headers on the build system.  We often make exceptions for
+new functionality so that we have a way to test them before the header
+file packages catch up, hence this '#ifndef HAVE_FOO #define FOO'
+paradigm.
+
+MAP_SYNC is a gross and horribly broken example of this.  These support
+crutches are supposed to be *private* to xfsprogs for benefit of early
+testing, but they were instead added to include/linux.h, which we
+provide to user programs in the xfslibs-dev package.  IOWs, we've been
+
+Worst yet, gcc 11.3 doesn't even warn about overriding a #define to 0:
+
+int main(int argc, char *argv[]) {
+	printf("MAP_SYNC 0x%x\n", MAP_SYNC);
+}
+
+$ gcc -o a a.c -Wall
+$ ./a
+MAP_SYNC 0x80000
+$ gcc -DSTUPID -o a a.c -Wall
+$ ./a
+MAP_SYNC 0x0
+
+Four years have gone by since the introduction of MAP_SYNC, so let's get
+rid of the override code entirely -- any platform that supports MAP_SYNC
+has had plenty of chances to ensure their header files have the right
+bits.  While we're at it, fix AC_HAVE_MAP_SYNC to look for MAP_SYNC in
+the same header file that the one user (io/mmap.c) uses -- sys/mman.h.
+
+Annoyingly, I had to test this by hand because the sole fstest that
+exercises MAP_SYNC (generic/470) requires dm-logwrites and dm-thinp,
+neither of which support fsdax on current kernels.
+
+Reported-by: info@mobile-stream.com
+Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reported-by: Florian Fainelli <f.fainelli@gmail.com>
+Signed-off-by: Darrick J. Wong <djwong@kernel.org>
+Tested-by: Florian Fainelli <f.fainelli@gmail.com>
+Reviewed-by: Carlos Maiolino <cmaiolino@redhat.com>
+Signed-off-by: Eric Sandeen <sandeen@sandeen.net>
+---
+ include/linux.h       |  8 --------
+ io/io.h               |  2 +-
+ io/mmap.c             | 25 +++++++++++++------------
+ m4/package_libcdev.m4 |  3 +--
+ 4 files changed, 15 insertions(+), 23 deletions(-)
+
+diff --git a/include/linux.h b/include/linux.h
+index de8a71221146..052facc15db5 100644
+--- a/include/linux.h
++++ b/include/linux.h
+@@ -356,14 +356,6 @@ fsmap_advance(
+ #define HAVE_GETFSMAP
+ #endif /* HAVE_GETFSMAP */
+ 
+-#ifndef HAVE_MAP_SYNC
+-#define MAP_SYNC 0
+-#define MAP_SHARED_VALIDATE 0
+-#else
+-#include <asm-generic/mman.h>
+-#include <asm-generic/mman-common.h>
+-#endif /* HAVE_MAP_SYNC */
+-
+ /*
+  * Reminder: anything added to this file will be compiled into downstream
+  * userspace projects!
+diff --git a/io/io.h b/io/io.h
+index 49db902fc44f..64b7a663a8cf 100644
+--- a/io/io.h
++++ b/io/io.h
+@@ -55,7 +55,7 @@ typedef struct mmap_region {
+ 	size_t		length;		/* length of mapping */
+ 	off64_t		offset;		/* start offset into backing file */
+ 	int		prot;		/* protection mode of the mapping */
+-	bool		map_sync;	/* is this a MAP_SYNC mapping? */
++	int		flags;		/* MAP_* flags passed to mmap() */
+ 	char		*name;		/* name of backing file */
+ } mmap_region_t;
+ 
+diff --git a/io/mmap.c b/io/mmap.c
+index 8c048a0ab6d0..425957d4b487 100644
+--- a/io/mmap.c
++++ b/io/mmap.c
+@@ -46,8 +46,11 @@ print_mapping(
+ 	for (i = 0, p = pflags; p->prot != PROT_NONE; i++, p++)
+ 		buffer[i] = (map->prot & p->prot) ? p->mode : '-';
+ 
+-	if (map->map_sync)
++#ifdef HAVE_MAP_SYNC
++	if ((map->flags & (MAP_SYNC | MAP_SHARED_VALIDATE)) ==
++			  (MAP_SYNC | MAP_SHARED_VALIDATE))
+ 		sprintf(&buffer[i], " S");
++#endif
+ 
+ 	printf("%c%03d%c 0x%lx - 0x%lx %s  %14s (%lld : %ld)\n",
+ 		braces? '[' : ' ', index, braces? ']' : ' ',
+@@ -139,7 +142,9 @@ mmap_help(void)
+ " -r -- map with PROT_READ protection\n"
+ " -w -- map with PROT_WRITE protection\n"
+ " -x -- map with PROT_EXEC protection\n"
++#ifdef HAVE_MAP_SYNC
+ " -S -- map with MAP_SYNC and MAP_SHARED_VALIDATE flags\n"
++#endif
+ " -s <size> -- first do mmap(size)/munmap(size), try to reserve some free space\n"
+ " If no protection mode is specified, all are used by default.\n"
+ "\n"));
+@@ -193,18 +198,14 @@ mmap_f(
+ 			prot |= PROT_EXEC;
+ 			break;
+ 		case 'S':
++#ifdef HAVE_MAP_SYNC
+ 			flags = MAP_SYNC | MAP_SHARED_VALIDATE;
+-
+-			/*
+-			 * If MAP_SYNC and MAP_SHARED_VALIDATE aren't defined
+-			 * in the system headers we will have defined them
+-			 * both as 0.
+-			 */
+-			if (!flags) {
+-				printf("MAP_SYNC not supported\n");
+-				return 0;
+-			}
+ 			break;
++#else
++			printf("MAP_SYNC not supported\n");
++			exitcode = 1;
++			return command_usage(&mmap_cmd);
++#endif
+ 		case 's':
+ 			length2 = cvtnum(blocksize, sectsize, optarg);
+ 			break;
+@@ -281,7 +282,7 @@ mmap_f(
+ 	mapping->offset = offset;
+ 	mapping->name = filename;
+ 	mapping->prot = prot;
+-	mapping->map_sync = (flags == (MAP_SYNC | MAP_SHARED_VALIDATE));
++	mapping->flags = flags;
+ 	return 0;
+ }
+ 
+diff --git a/m4/package_libcdev.m4 b/m4/package_libcdev.m4
+index adab9bb9773a..3a0c23453176 100644
+--- a/m4/package_libcdev.m4
++++ b/m4/package_libcdev.m4
+@@ -339,8 +339,7 @@ AC_DEFUN([AC_HAVE_STATFS_FLAGS],
+ AC_DEFUN([AC_HAVE_MAP_SYNC],
+   [ AC_MSG_CHECKING([for MAP_SYNC])
+     AC_TRY_COMPILE([
+-#include <asm-generic/mman.h>
+-#include <asm-generic/mman-common.h>
++#include <sys/mman.h>
+     ], [
+         int flags = MAP_SYNC | MAP_SHARED_VALIDATE;
+     ], have_map_sync=yes
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
