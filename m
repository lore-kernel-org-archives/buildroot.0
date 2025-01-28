Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9D1C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 20:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01D3582027;
	Tue, 28 Jan 2025 20:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqFtqJeG_4ph; Tue, 28 Jan 2025 20:28:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96BC982012
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96BC982012;
	Tue, 28 Jan 2025 20:28:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A262031
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 20:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FF2082012
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 20:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0s13zYYksjdC for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 20:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E87580B0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E87580B0B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E87580B0B
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 20:28:35 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D3AF9B00579;
 Tue, 28 Jan 2025 21:28:31 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 28 Jan 2025 21:28:23 +0100
Message-ID: <20250128202823.1905913-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738096113;
 bh=uKY5g9MeREOhXxXEpoJRyh2bDRJyXIcNsXK7zd/eh0o=;
 h=From:To:Cc:Subject:Date:From;
 b=h2s8v/nefdU2+VdYN/Wa+Wu1iTuMz8I3N5oJGqUtW7td9GkUAccOWNh2W5ToEobAO
 C9loRNvC3bHFVkt+9zB0gAyc6+aCKdEXOrI6Uw5nA1ODTQHO0SB49ra59p4tgcTNsD
 qB2FnG7FQyoe7gVl3TFeBHCQYuhz8/5d+9x0dD9QSFXykgWHhOfTDe725XC7FHGowY
 6zC8yYZnu54ey/S9sKruWt78T38leUIN8VT7vnM3y2YlZfep/fvD0D9ATylv4HRlsK
 QhaIdjmSXdiuxwOmsXCAvVSrV9u9XafVjyeBfk3zy1AtkVpUH9w4pcIOGa27xGbO3Q
 HEB17zfcYwh1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h2s8v/ne
Subject: [Buildroot] [PATCH v2 1/1] package/util-linux: fix libuuid build
 without pthread
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
Changes v1 -> v2:
changed package patches:
v1 was using https://github.com/util-linux/util-linux/pull/3375
v2 is using https://github.com/util-linux/util-linux/pull/3383
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1645583168

Note: there is two build failures, unrelated to this patch.
---
 .../0002-c.h-consolidate-THREAD_LOCAL.patch   | 65 +++++++++++++++
 ...ine-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch | 47 +++++++++++
 .../0004-meson-add-HAVE_LIBPTHREAD.patch      | 27 ++++++
 ...non-cached-scenarios-when-lpthread-i.patch | 82 +++++++++++++++++++
 4 files changed, 221 insertions(+)
 create mode 100644 package/util-linux/0002-c.h-consolidate-THREAD_LOCAL.patch
 create mode 100644 package/util-linux/0003-autotools-define-HAVE_LIBPTHREAD-and-PTHREAD_LIBS.patch
 create mode 100644 package/util-linux/0004-meson-add-HAVE_LIBPTHREAD.patch
 create mode 100644 package/util-linux/0005-libuuid-support-non-cached-scenarios-when-lpthread-i.patch

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
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
