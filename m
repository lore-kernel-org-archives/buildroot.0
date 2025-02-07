Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4000C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3B4384BCB;
	Fri,  7 Feb 2025 19:53:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BgksXMxvTJM; Fri,  7 Feb 2025 19:53:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1794D84BCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1794D84BCD;
	Fri,  7 Feb 2025 19:53:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C8B91B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B0C77051A
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMYlSld3L45Z for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15B8D70500
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15B8D70500
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 039D38718C; Fri,  7 Feb 2025 19:53:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 20:43:22 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 61f1fe83bfc078db2094951e5c22b09afd02e212
X-Git-Newrev: f05a18206f524d16bc074cb2e53a1ada38c1ee77
X-Patchwork-Hint: ignore
Message-Id: <20250207195348.039D38718C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/util-linux: fix
 libuuid build without pthread
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f05a18206f524d16bc074cb2e53a1ada38c1ee77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Since Buildroot commit [1], util-linux libuuid is failing to build
with uclibc toolchains, when there is no thread support
(that is, when BR2_PTHREADS_NONE=y).

Builds are failing with error:

    libuuid/src/gen_uuid.c:83:10: fatal error: pthread.h: No such file or directory
       83 | #include <pthread.h>
          |          ^~~~~~~~~~~

This failure is due to the upstream commit [2], which introduced the
pthread dependency.

This commit fixes the issue by adding package patches, disabling
the uuidd cache in case the libptread (or the pthread_atfork function)
is not available.

Fixes:
https://autobuild.buildroot.org/results/e5856cf6f3b8512ededa17d20db2b330a478dd8e/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/f14929c657a7b1794dcd39ac469d2ad826465d98
[2] https://github.com/util-linux/util-linux/commit/25bd5396ab700623134b491f42a3280556cb674c

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8489cb0932b6ca00104dab3bd54e76d1bcf6c65c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-c.h-consolidate-THREAD_LOCAL.patch        | 65 +++++++++++++++++
 ...s-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch | 47 +++++++++++++
 .../0004-meson-add-HAVE_LIBPTHREAD.patch           | 27 +++++++
 ...port-non-cached-scenarios-when-lpthread-i.patch | 82 ++++++++++++++++++++++
 4 files changed, 221 insertions(+)

diff --git a/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch b/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
new file mode 100644
index 0000000000..bb1a63ecc2
--- /dev/null
+++ b/package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
@@ -0,0 +1,65 @@
+From 7b3db914fa9073c667ea482c8b6b4e07fe6202cc Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 27 Jan 2025 13:40:23 +0100
+Subject: [PATCH] c.h: consolidate THREAD_LOCAL.
+
+Let's define this macro in one place only.
+
+Upstream: https://github.com/util-linux/util-linux/pull/3383
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ include/c.h            | 9 +++++++++
+ lib/randutils.c        | 5 -----
+ libuuid/src/gen_uuid.c | 1 -
+ 3 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/include/c.h b/include/c.h
+index 61b95ab2d..848c48536 100644
+--- a/include/c.h
++++ b/include/c.h
+@@ -595,4 +595,13 @@ static inline void *reallocarray(void *ptr, size_t nmemb, size_t size)
+ }
+ #endif
+ 
++/*
++ * thread-local storage
++ */
++#ifdef HAVE_TLS
++# define THREAD_LOCAL static __thread
++#else
++# define THREAD_LOCAL static
++#endif
++
+ #endif /* UTIL_LINUX_C_H */
+diff --git a/lib/randutils.c b/lib/randutils.c
+index 15c2f7834..4c806e682 100644
+--- a/lib/randutils.c
++++ b/lib/randutils.c
+@@ -20,11 +20,6 @@
+ #include "randutils.h"
+ #include "nls.h"
+ 
+-#ifdef HAVE_TLS
+-#define THREAD_LOCAL static __thread
+-#else
+-#define THREAD_LOCAL static
+-#endif
+ 
+ #ifdef HAVE_GETRANDOM
+ # include <sys/random.h>
+diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
+index 3b76ddc9a..69712267f 100644
+--- a/libuuid/src/gen_uuid.c
++++ b/libuuid/src/gen_uuid.c
+@@ -92,7 +92,6 @@
+ #include "md5.h"
+ #include "sha1.h"
+ 
+-#define THREAD_LOCAL static __thread
+ 
+ #ifdef _WIN32
+ static void gettimeofday (struct timeval *tv, void *dummy)
+-- 
+2.48.1
+
diff --git a/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch b/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
new file mode 100644
index 0000000000..843253a56a
--- /dev/null
+++ b/package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
@@ -0,0 +1,47 @@
+From 0735eb8bc0ed4bc9820ea7e4e600fed246457b18 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 27 Jan 2025 14:01:38 +0100
+Subject: [PATCH] autotools: define HAVE_LIBPTHREAD and PTHREAD_LIBS
+
+Upstream: https://github.com/util-linux/util-linux/pull/3383
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ configure.ac              | 7 +++++++
+ libuuid/src/Makemodule.am | 2 +-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 82d0e4bf9..9a7f260c5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -738,6 +738,13 @@ AS_IF([test x"$have_timer" = xno], [
+ ])
+ 
+ 
++AC_CHECK_LIB([pthread], [pthread_atfork], [
++	PTHREAD_LIBS="-lpthread"
++	AC_DEFINE([HAVE_LIBPTHREAD], [1], [Define if libpthred exist])
++])
++AC_SUBST([PTHREAD_LIBS])
++
++
+ AC_CHECK_LIB([rtas], [rtas_get_sysparm], [
+ 	RTAS_LIBS="-lrtas"
+ 	AC_DEFINE([HAVE_LIBRTAS], [1], [Define if librtas exists])
+diff --git a/libuuid/src/Makemodule.am b/libuuid/src/Makemodule.am
+index 867ad7be5..58b64fe9b 100644
+--- a/libuuid/src/Makemodule.am
++++ b/libuuid/src/Makemodule.am
+@@ -31,7 +31,7 @@ libuuid_la_SOURCES = \
+ EXTRA_libuuid_la_DEPENDENCIES = \
+ 	libuuid/src/libuuid.sym
+ 
+-libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) -lpthread
++libuuid_la_LIBADD       = $(LDADD) $(SOCKET_LIBS) $(PTHREAD_LIBS)
+ 
+ libuuid_la_CFLAGS = \
+ 	$(AM_CFLAGS) \
+-- 
+2.48.1
+
diff --git a/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch b/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
new file mode 100644
index 0000000000..19e0697769
--- /dev/null
+++ b/package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
@@ -0,0 +1,27 @@
+From f540cc6fed7224fb9ca162cb2f33c338260ae1d2 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 27 Jan 2025 14:11:35 +0100
+Subject: [PATCH] meson: add HAVE_LIBPTHREAD
+
+Upstream: https://github.com/util-linux/util-linux/pull/3383
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/meson.build b/meson.build
+index 6d1f986af..ac5fdd799 100644
+--- a/meson.build
++++ b/meson.build
+@@ -748,6 +748,7 @@ endif
+ conf.set('HAVE_CLOCK_GETTIME', have ? 1 : false)
+ 
+ thread_libs = dependency('threads')
++conf.set('HAVE_LIBPTHREAD', thread_libs.found() ? 1 : false)
+ 
+ have = cc.has_function('timer_create')
+ if not have
+-- 
+2.48.1
+
diff --git a/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch b/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
new file mode 100644
index 0000000000..0d90f8aec9
--- /dev/null
+++ b/package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch
@@ -0,0 +1,82 @@
+From eecaa2c0dda817eba2d493f6ddb42c39cf789fc2 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 27 Jan 2025 14:28:36 +0100
+Subject: [PATCH] libuuid: support non-cached scenarios (when -lpthread is
+ unavailable)
+
+This patch makes the dependence on pthread optional for libuuid. In
+certain cases, such as Buildroot Linux, uClibc-ng, and very low
+resource systems, libpthread may be unavailable.
+
+If libuuid is compiled without pthread, it will not use a local cache
+and will instead request a UUID from uuidd for each call. This may
+result in less efficient performance, but the UUIDs generated will
+still be unique and reliable.
+
+On minimalistic systems, it is highly likely that uuidd will not be
+installed, making this change important for portability and robust
+code.
+
+Upstream: https://github.com/util-linux/util-linux/pull/3383
+Addresses: https://github.com/util-linux/util-linux/pull/3375
+Signed-off-by: Karel Zak <kzak@redhat.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ libuuid/src/gen_uuid.c | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
+index 69712267f..1ed82b46b 100644
+--- a/libuuid/src/gen_uuid.c
++++ b/libuuid/src/gen_uuid.c
+@@ -80,7 +80,10 @@
+ #if defined(__linux__) && defined(HAVE_SYS_SYSCALL_H)
+ #include <sys/syscall.h>
+ #endif
+-#include <pthread.h>
++#ifdef HAVE_LIBPTHREAD
++# include <pthread.h>
++#endif
++
+ #include <signal.h>
+ 
+ #include "all-io.h"
+@@ -580,8 +583,7 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
+  * If neither of these is possible (e.g. because of insufficient permissions), it generates
+  * the UUID anyway, but returns -1. Otherwise, returns 0.
+  */
+-
+-/* thread local cache for uuidd based requests */
++#ifdef HAVE_LIBPTHREAD
+ THREAD_LOCAL struct {
+ 	int		num;
+ 	int		cache_size;
+@@ -597,8 +599,10 @@ static void reset_uuidd_cache(void)
+ 	memset(&uuidd_cache, 0, sizeof(uuidd_cache));
+ 	uuidd_cache.cache_size = CS_MIN;
+ }
++#endif /* HAVE_LIBPTHREAD */
+ 
+ static int uuid_generate_time_generic(uuid_t out) {
++#ifdef HAVE_LIBPTHREAD
+ 	static volatile sig_atomic_t atfork_registered;
+ 	time_t	now;
+ 
+@@ -651,6 +655,14 @@ static int uuid_generate_time_generic(uuid_t out) {
+ 		return 0;
+ 	}
+ 
++#else /* !HAVE_LIBPTHREAD */
++	{
++		int num = 1;
++		if (get_uuid_via_daemon(UUIDD_OP_TIME_UUID, out, &num) == 0)
++			return 0;
++	}
++#endif /* HAVE_LIBPTHREAD */
++
+ 	return __uuid_generate_time(out, NULL);
+ }
+ 
+-- 
+2.48.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
