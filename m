Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07289C7EE29
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 09:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A429983C26;
	Fri,  9 Jun 2023 09:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A429983C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uI6ni4F4ZDq; Fri,  9 Jun 2023 09:11:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40093841A0;
	Fri,  9 Jun 2023 09:11:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40093841A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F385E1BF334
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 09:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD44D40222
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 09:10:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD44D40222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VuBVyiRewoP8 for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DDCE4016F
 for <buildroot@buildroot.org>; Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DDCE4016F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C784821F5; Fri,  9 Jun 2023 09:10:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Jun 2023 11:09:42 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: a5ce02522a7c0c2ced03cd1b0350db68c1b28f6d
X-Git-Newrev: 2b8e7f2e40b7ea93964f4d6aa845925f0749d3d8
X-Patchwork-Hint: ignore
Message-Id: <20230609091042.6C784821F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package: busybox:
 backport fix for missing getrandom()
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
Content-Type: multipart/mixed; boundary="===============3068750607860038834=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3068750607860038834==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2b8e7f2e40b7ea93964f4d6aa845925f0749d3d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The current Busybox version (1.36.0) fails to build with some
libc/linux combinations where getrandom() is not available. Two fixes
for glibc already exists upstream, so backport them here. A third
one (submitted upstream, not part of the main branch yet) was needed
to be able to compile with older musl and uClibc versions (or older
kernels).

This fixes the following build failure raised since commit
d68b617993bd2f5c82a4936ed1e24e4fec6b94a2:

miscutils/seedrng.c:45:24: fatal error: sys/random.h: No such file or directory
 #include <sys/random.h>

Fixes:
- http://autobuild.buildroot.net/results/44a0476b86c579e6aa658f156f0292958d40513c
- http://autobuild.buildroot.net/results/ed028160db397581558fd8c96755621dd8298bb1
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624008
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624034
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624044
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624048
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624051

It also fixes the following (similar) build failure, raised since the
same commit:

miscutils/lib.a(seedrng.o): In function `seedrng_main':
seedrng.c:(.text.seedrng_main+0x26c): undefined reference to `getrandom'
seedrng.c:(.text.seedrng_main+0x2e8): undefined reference to `getrandom'
collect2: error: ld returned 1 exit status

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624028
- https://gitlab.com/buildroot.org/buildroot/-/jobs/4122624031

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cd02f96b871c9bed5fec92605806668b2aca2bf4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-for-glibc-2.24-not-providing-getrandom.patch |  39 +++++++
 ...-for-glibc-2.24-not-providing-random-head.patch |  60 ++++++++++
 ...ix-getrandom-detection-for-non-glibc-libc.patch | 124 +++++++++++++++++++++
 3 files changed, 223 insertions(+)

diff --git a/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch b/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
new file mode 100644
index 0000000000..4a194612b4
--- /dev/null
+++ b/package/busybox/0005-seedrng-fix-for-glibc-2.24-not-providing-getrandom.patch
@@ -0,0 +1,39 @@
+From 200a9669fbf6f06894e4243cccc9fc11a1a6073a Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 10 Apr 2023 17:26:04 +0200
+Subject: [PATCH] seedrng: fix for glibc <= 2.24 not providing getrandom()
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upstream: https://git.busybox.net/busybox/commit/?id=200a9669fbf6f06894e4243cccc9fc11a1a6073a
+---
+ miscutils/seedrng.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
+index 967741dc7..7cc855141 100644
+--- a/miscutils/seedrng.c
++++ b/miscutils/seedrng.c
+@@ -45,6 +45,20 @@
+ #include <sys/random.h>
+ #include <sys/file.h>
+ 
++/* Fix up glibc <= 2.24 not having getrandom() */
++#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
++#include <sys/syscall.h>
++# define getrandom(...) bb_getrandom(__VA_ARGS__)
++static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
++{
++# if defined(__NR_getrandom)
++	return syscall(__NR_getrandom, buffer, length, flags);
++# else
++	return ENOSYS;
++# endif
++}
++#endif
++
+ #ifndef GRND_INSECURE
+ #define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
+ #endif
+-- 
+2.39.1
+
diff --git a/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch b/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
new file mode 100644
index 0000000000..d729884805
--- /dev/null
+++ b/package/busybox/0006-seedrng-fix-for-glibc-2.24-not-providing-random-head.patch
@@ -0,0 +1,60 @@
+From cb57abb46f06f4ede8d9ccbdaac67377fdf416cf Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Mon, 10 Apr 2023 19:58:15 +0200
+Subject: [PATCH] seedrng: fix for glibc <= 2.24 not providing random header
+
+ - dropped the wrong define (not sure why it was there)
+ - <sys/random.h> not available if glibc <= 2.24
+ - GRND_NONBLOCK not defined if <sys/random.h> not included
+ - ret < 0 && errno == ENOSYS has to be true to get creditable set
+
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upstream: https://git.busybox.net/busybox/commit/?id=cb57abb46f06f4ede8d9ccbdaac67377fdf416cf
+---
+ miscutils/seedrng.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
+index 7cc855141..3bf6e2ea7 100644
+--- a/miscutils/seedrng.c
++++ b/miscutils/seedrng.c
+@@ -42,25 +42,31 @@
+ #include "libbb.h"
+ 
+ #include <linux/random.h>
+-#include <sys/random.h>
+ #include <sys/file.h>
+ 
+ /* Fix up glibc <= 2.24 not having getrandom() */
+ #if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
+ #include <sys/syscall.h>
+-# define getrandom(...) bb_getrandom(__VA_ARGS__)
+ static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
+ {
+ # if defined(__NR_getrandom)
+ 	return syscall(__NR_getrandom, buffer, length, flags);
+ # else
+-	return ENOSYS;
++	errno = ENOSYS;
++	return -1;
+ # endif
+ }
++#else
++#include <sys/random.h>
++#endif
++
++/* Apparently some headers don't ship with this yet. */
++#ifndef GRND_NONBLOCK
++#define GRND_NONBLOCK 0x0001
+ #endif
+ 
+ #ifndef GRND_INSECURE
+-#define GRND_INSECURE 0x0004 /* Apparently some headers don't ship with this yet. */
++#define GRND_INSECURE 0x0004
+ #endif
+ 
+ #define DEFAULT_SEED_DIR         "/var/lib/seedrng"
+-- 
+2.39.1
+
diff --git a/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch b/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
new file mode 100644
index 0000000000..140b27cae6
--- /dev/null
+++ b/package/busybox/0007-seedrng-fix-getrandom-detection-for-non-glibc-libc.patch
@@ -0,0 +1,124 @@
+From b2d26d449ec855602b9a88f58c2eb675de0224f2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
+Date: Tue, 18 Apr 2023 15:54:43 +0200
+Subject: [PATCH v4] seedrng: fix getrandom() detection for non-glibc libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+glibc <= 2.24 does not provide getrandom(). A check for it has been
+added in 200a9669fbf6f06894e4243cccc9fc11a1a6073a and fixed in
+cb57abb46f06f4ede8d9ccbdaac67377fdf416cf.
+
+However, building with a libc other than glibc can lead to the same
+problem as not every other libc has getrandom() either:
+
+- uClibc provides it from v1.0.2 onwards, but requires to define
+_GNU_SOURCE (all versions - we already define it by default), and
+stddef to be included first (when using uClibc < 1.0.35 - we already
+include it through libbb.h).
+
+- musl libc has getrandom(), but only from version 1.1.20 onwards. As
+musl does not provide __MUSL__ or version information, it's not
+possible to check for it like we did for glibc.
+
+All of this makes it difficult (or impossible in case of musl) to
+check what we need to do to have getrandom() based on each libc
+versions.
+
+On top of that, getrandom() is also not available on older kernels. As
+an example, when using a 3.10 kernel with uClibc 1.0.26, getrandom()
+is declared so compiling works, but it fails at link time because
+getrandom() is not defined.
+
+To make it easier, take a similar approach to what was done for the
+crypt library: try to build a sample program to see if we have
+getrandom(). To keep it compatible with different versions of
+make (for reference see [1]), a variable for '#' is also introduced.
+
+Based on the new Makefile variable, we now either use the
+libc-provided getrandom() when it's available, or use our own
+implementation when it's not (like it was the case already for glibc <
+2.25).
+
+This should fix compiling with many libc/kernel combinations.
+
+[1]: https://git.savannah.gnu.org/cgit/make.git/commit/?id=c6966b323811c37acedff05b576b907b06aea5f4
+
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+Upstream: http://lists.busybox.net/pipermail/busybox/2023-May/090317.html
+---
+Changes v3 -> v4:
+  - use a variable for '#' for compatibility with GNU make 4.2.1 and earlier.
+
+Changes v2 -> v3:
+  - fix _GNU_SOURCE define location
+
+Changes v1 -> v2:
+  - move _GNU_SOURCE to bb_libtest.c
+  - remove GRND_NONBLOCK
+
+Note that I was not able to test every single combination, but I could
+confirm it builds successfully for:
+uClibc 10.0.24, linux headers 3.10 (libc getrandom NOT used)
+uClibc 1.0.36, linux headers 4.9 (libc getrandom used)
+musl 1.1.16, linux headers 4.12 (libc getrandom NOT used)
+musl 1.2.1, linux headers (libc getrandom used)
+glibc 2.25, linux headers 4.10 (libc getrandom used)
+
+ Makefile.flags      | 12 ++++++++++++
+ miscutils/seedrng.c |  8 ++++----
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.flags b/Makefile.flags
+index 1cec5ba20..0d437303a 100644
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -161,6 +161,18 @@ ifeq ($(RT_AVAILABLE),y)
+ LDLIBS += rt
+ endif
+ 
++# GNU Make version 4.2.1 and earlier require number signs ('#')
++# inside function invocations to be escaped, while versions 4.3+
++# require them to be unescaped. Use a variable for it so that it works
++# for both versions:
++C := \#
++# Not all libc versions have getrandom, so check for it:
++HAVE_GETRANDOM := $(shell printf '$Cdefine _GNU_SOURCE\n$Cinclude <stddef.h>\n$Cinclude <sys/random.h>\nint main(void){char buf[256];\ngetrandom(buf,sizeof(buf),0);}' >bb_libtest.c; $(CC) $(CFLAGS) $(CFLAGS_busybox) -o /dev/null bb_libtest.c >/dev/null 2>&1 && echo "y"; rm bb_libtest.c)
++
++ifeq ($(HAVE_GETRANDOM),y)
++CFLAGS += -DHAVE_GETRANDOM
++endif
++
+ # libpam may use libpthread, libdl and/or libaudit.
+ # On some platforms that requires an explicit -lpthread, -ldl, -laudit.
+ # However, on *other platforms* it fails when some of those flags
+diff --git a/miscutils/seedrng.c b/miscutils/seedrng.c
+index 3bf6e2ea7..2f1e18c32 100644
+--- a/miscutils/seedrng.c
++++ b/miscutils/seedrng.c
+@@ -44,8 +44,10 @@
+ #include <linux/random.h>
+ #include <sys/file.h>
+ 
+-/* Fix up glibc <= 2.24 not having getrandom() */
+-#if defined(__GLIBC__) && __GLIBC__ == 2 && __GLIBC_MINOR__ <= 24
++/* Fix up some libc (e.g. glibc <= 2.24) not having getrandom() */
++#if defined HAVE_GETRANDOM
++#include <sys/random.h>
++#else /* No getrandom */
+ #include <sys/syscall.h>
+ static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
+ {
+@@ -56,8 +58,6 @@ static ssize_t getrandom(void *buffer, size_t length, unsigned flags)
+ 	return -1;
+ # endif
+ }
+-#else
+-#include <sys/random.h>
+ #endif
+ 
+ /* Apparently some headers don't ship with this yet. */
+-- 
+2.39.1
+

--===============3068750607860038834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3068750607860038834==--
