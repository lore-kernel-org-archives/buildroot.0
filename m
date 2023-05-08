Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A10C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 21:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D92596148E;
	Mon,  8 May 2023 21:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D92596148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwCt9ssdikLd; Mon,  8 May 2023 21:41:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7446613AA;
	Mon,  8 May 2023 21:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7446613AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3ADB1BF34C
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:41:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C01F41DE6
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 21:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C01F41DE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4UYJUckUuqm3 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 21:41:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5C2241DCB
 for <buildroot@buildroot.org>; Mon,  8 May 2023 21:41:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C2241DCB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C190A81221; Mon,  8 May 2023 21:41:53 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 May 2023 23:40:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b20eb56440fd2a7b8f578bf9eda89160c8053434
X-Git-Newrev: 4938d2d232496b58c1093664fe9a86b6ea62bc72
X-Patchwork-Hint: ignore
Message-Id: <20230508214153.C190A81221@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package: busybox: backport fix for
 missing getrandom()"
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
Content-Type: multipart/mixed; boundary="===============5433452773618361940=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5433452773618361940==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4938d2d232496b58c1093664fe9a86b6ea62bc72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This casues build failures:

..../build/busybox-1.36.0/Makefile.flags:165: *** unterminated call to function 'shell': missing ')'.  Stop.

This reverts commit 441c44626f3c8b6181b7b4be0757d4eb2659dcee.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ix-for-glibc-2.24-not-providing-getrandom.patch |  39 --------
 ...-for-glibc-2.24-not-providing-random-head.patch |  60 ------------
 ...ix-getrandom-detection-for-non-glibc-libc.patch | 106 ---------------------
 3 files changed, 205 deletions(-)

diff --git a/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch b/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
deleted file mode 100644
index 4a194612b4..0000000000
--- a/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 200a9669fbf6f06894e4243cccc9fc11a1a6073a Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 10 Apr 2023 17:26:04 +0200
-Subject: [PATCH] seedrng: fix for glibc <= 2.24 not providing getrandom()
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream: https://git.busybox.net/busybox/commit/?id=200a9669fbf6f06894e4243cccc9fc11a1a6073a
----
- miscutils/seedrng.c | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
-index 967741dc7..7cc855141 100644
---- a/miscutils/seedrng.c
-+++ b/miscutils/seedrng.c
-@@ -45,6 +45,20 @@
- #include <sys/random.h>
- #include <sys/file.h>
- 
-+/* Fix up glibc <= 2.24 not having getrandom() */
-+#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
-+#include <sys/syscall.h>
-+# define getrandom(...) bb_getrandom(__VA_ARGS__)
-+static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
-+{
-+# if defined(__NR_getrandom)
-+	return syscall(__NR_getrandom, buffer, length, flags);
-+# else
-+	return ENOSYS;
-+# endif
-+}
-+#endif
-+
- #ifndef GRND_INSECURE
- #define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
- #endif
--- 
-2.39.1
-
diff --git a/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch b/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
deleted file mode 100644
index d729884805..0000000000
--- a/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From cb57abb46f06f4ede8d9ccbdaac67377fdf416cf Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Mon, 10 Apr 2023 19:58:15 +0200
-Subject: [PATCH] seedrng: fix for glibc <= 2.24 not providing random header
-
- - dropped the wrong define (not sure why it was there)
- - <sys/random.h> not available if glibc <= 2.24
- - GRND_NONBLOCK not defined if <sys/random.h> not included
- - ret < 0 && errno == ENOSYS has to be true to get creditable set
-
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Upstream: https://git.busybox.net/busybox/commit/?id=cb57abb46f06f4ede8d9ccbdaac67377fdf416cf
----
- miscutils/seedrng.c | 14 ++++++++++----
- 1 file changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
-index 7cc855141..3bf6e2ea7 100644
---- a/miscutils/seedrng.c
-+++ b/miscutils/seedrng.c
-@@ -42,25 +42,31 @@
- #include "libbb.h"
- 
- #include <linux/random.h>
--#include <sys/random.h>
- #include <sys/file.h>
- 
- /* Fix up glibc <= 2.24 not having getrandom() */
- #if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
- #include <sys/syscall.h>
--# define getrandom(...) bb_getrandom(__VA_ARGS__)
- static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
- {
- # if defined(__NR_getrandom)
- 	return syscall(__NR_getrandom, buffer, length, flags);
- # else
--	return ENOSYS;
-+	errno = ENOSYS;
-+	return -1;
- # endif
- }
-+#else
-+#include <sys/random.h>
-+#endif
-+
-+/* Apparently some headers don't ship with this yet. */
-+#ifndef GRND_NONBLOCK
-+#define GRND_NONBLOCK 0x0001
- #endif
- 
- #ifndef GRND_INSECURE
--#define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
-+#define GRND_INSECURE 0x0004
- #endif
- 
- #define DEFAULT_SEED_DIR         "/var/lib/seedrng"
--- 
-2.39.1
-
diff --git a/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch b/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
deleted file mode 100644
index 90cace7968..0000000000
--- a/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From b8d32dba741daea2ed01a0da32083b1bc994aa04 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
-Date: Tue, 18 Apr 2023 15:54:43 +0200
-Subject: [PATCH] seedrng: fix getrandom() detection for non-glibc libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-glibc <= 2.24 does not provide getrandom(). A check for it has been
-added in 200a9669fbf6f06894e4243cccc9fc11a1a6073a and fixed in
-cb57abb46f06f4ede8d9ccbdaac67377fdf416cf.
-
-However, building with a libc other than glibc can lead to the same
-problem as not every other libc has getrandom() either:
-
-- uClibc provides it from v1.0.2 onwards, but requires to define
-_GNU_SOURCE (all versions - we already define it by default), and
-stddef to be included first (when using uClibc < 1.0.35 - we already
-include it through libbb.h).
-
-- musl libc has getrandom(), but only from version 1.1.20 onwards. As
-musl does not provide __MUSL__ or version information, it's not
-possible to check for it like we did for glibc.
-
-All of this makes it difficult (or impossible in case of musl) to
-check what we need to do to have getrandom() based on each libc
-versions.
-
-On top of that, getrandom() is also not available on older kernels. As
-an example, when using a 3.10 kernel with uClibc 1.0.26, getrandom()
-is declared so compiling works, but it fails at link time because
-getrandom() is not defined.
-
-To make it easier, take a similar approach to what was done for the
-crypt library: try to build a sample program to see if we have
-getrandom().
-
-Based on the new Makefile variable, we now either use the
-libc-provided getrandom() when it's available, or use our own
-implementation when it's not (like it was the case already for glibc <
-2.25).
-
-This should fix compiling with many libc/kernel combinations.
-
-Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
-Upstream: http://lists.busybox.net/pipermail/busybox/2023-April/090285.html
----
-Note that I was not able to test every single combination, but I could
-confirm it builds successfully for:
-uClibc 10.0.24, linux headers 3.10 (libc getrandom NOT used)
-uClibc 1.0.36, linux headers 4.9 (libc getrandom used)
-musl 1.1.16, linux headers 4.12 (libc getrandom NOT used)
-musl 1.2.1, linux headers (libc getrandom used)
-glibc 2.25, linux headers 4.10 (libc getrandom used)
-
- Makefile.flags      | 7 +++++++
- miscutils/seedrng.c | 8 ++++----
- 2 files changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.flags b/Makefile.flags
-index 1cec5ba20..88c11862f 100644
---- a/Makefile.flags
-+++ b/Makefile.flags
-@@ -161,6 +161,13 @@ ifeq ($(RT_AVAILABLE),y)
- LDLIBS += rt
- endif
- 
-+# Not all libc versions have getrandom, so check for it.
-+HAVE_GETRANDOM := $(shell printf '#include <stddef.h>\n#include <sys/random.h>\nint main(void){char buf[256];\ngetrandom(buf,sizeof(buf),GRND_NONBLOCK);}' >bb_libtest.c; $(CC) $(CFLAGS) $(CFLAGS_busybox) -D_GNU_SOURCE -o /dev/null bb_libtest.c >/dev/null 2>&1 && echo "y"; rm bb_libtest.c)
-+
-+ifeq ($(HAVE_GETRANDOM),y)
-+CFLAGS += -DHAVE_GETRANDOM
-+endif
-+
- # libpam may use libpthread, libdl and/or libaudit.
- # On some platforms that requires an explicit -lpthread, -ldl, -laudit.
- # However, on *other platforms* it fails when some of those flags
-diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
-index 3bf6e2ea7..2f1e18c32 100644
---- a/miscutils/seedrng.c
-+++ b/miscutils/seedrng.c
-@@ -44,8 +44,10 @@
- #include <linux/random.h>
- #include <sys/file.h>
- 
--/* Fix up glibc <= 2.24 not having getrandom() */
--#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
-+/* Fix up some libc (e.g. glibc <= 2.24) not having getrandom() */
-+#if defined HAVE_GETRANDOM
-+#include <sys/random.h>
-+#else /* No getrandom */
- #include <sys/syscall.h>
- static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
- {
-@@ -56,8 +58,6 @@ static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
- 	return -1;
- # endif
- }
--#else
--#include <sys/random.h>
- #endif
- 
- /* Apparently some headers don't ship with this yet. */
--- 
-2.39.1
-

--===============5433452773618361940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5433452773618361940==--
