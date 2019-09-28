From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Sep 2019 09:27:55 +0200
Subject: [Buildroot] [PATCH 1/3] package/lttng-libust: bump to version 2.10.5
Message-ID: <20190928072757.27041-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove second patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-Fix-namespace-our-gettid-wrapper.patch | 90 -------------------
 package/lttng-libust/lttng-libust.hash        |  8 +-
 package/lttng-libust/lttng-libust.mk          |  2 +-
 3 files changed, 6 insertions(+), 94 deletions(-)
 delete mode 100644 package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch

diff --git a/package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch b/package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch
deleted file mode 100644
index 001235d476..0000000000
--- a/package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 3e2aaf78e6f8d57c7dbc42e39764862ba8c64bd7 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 3 Jun 2019 15:25:32 -0400
-Subject: [PATCH] Fix: namespace our gettid wrapper
-
-Since glibc 2.30, a gettid wrapper was added that conflicts with our
-static declaration. Namespace our wrapper so there is no conflict,
-we'll add support for the glibc provided wrapper in a further commit.
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-[Retrieved from:
-https://github.com/lttng/lttng-ust/commit/3e2aaf78e6f8d57c7dbc42e39764862ba8c64bd7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/lttng/ust-tid.h           | 12 +++++++-----
- include/usterr-signal-safe.h      |  2 +-
- liblttng-ust/lttng-context-vtid.c |  4 ++--
- 3 files changed, 10 insertions(+), 8 deletions(-)
-
-diff --git a/include/lttng/ust-tid.h b/include/lttng/ust-tid.h
-index e669d7e7..e637718a 100644
---- a/include/lttng/ust-tid.h
-+++ b/include/lttng/ust-tid.h
-@@ -31,23 +31,25 @@
- #include <syscall.h>
- #endif
- 
--#if defined(_syscall0)
--_syscall0(pid_t, gettid)
--#elif defined(__NR_gettid)
-+#if defined(__NR_gettid)
-+
- #include <unistd.h>
--static inline pid_t gettid(void)
-+static inline pid_t lttng_gettid(void)
- {
- 	return syscall(__NR_gettid);
- }
-+
- #else
-+
- #include <sys/types.h>
- #include <unistd.h>
- 
- /* Fall-back on getpid for tid if not available. */
--static inline pid_t gettid(void)
-+static inline pid_t lttng_gettid(void)
- {
- 	return getpid();
- }
-+
- #endif
- 
- #endif /* _LTTNG_UST_TID_H */
-diff --git a/include/usterr-signal-safe.h b/include/usterr-signal-safe.h
-index 1df5ada0..d987c1f0 100644
---- a/include/usterr-signal-safe.h
-+++ b/include/usterr-signal-safe.h
-@@ -95,7 +95,7 @@ do {									\
- 	do {					\
- 		sigsafe_print_err(UST_STR_COMPONENT "[%ld/%ld]: " fmt " (in %s() at " __FILE__ ":" UST_XSTR(__LINE__) ")\n", \
- 		(long) getpid(),		\
--		(long) gettid(),		\
-+		(long) lttng_gettid(),		\
- 		## args, __func__);		\
- 	} while(0)
- 
-diff --git a/liblttng-ust/lttng-context-vtid.c b/liblttng-ust/lttng-context-vtid.c
-index f28e470a..2f721fa0 100644
---- a/liblttng-ust/lttng-context-vtid.c
-+++ b/liblttng-ust/lttng-context-vtid.c
-@@ -62,7 +62,7 @@ void vtid_record(struct lttng_ctx_field *field,
- 		 struct lttng_channel *chan)
- {
- 	if (caa_unlikely(!URCU_TLS(cached_vtid)))
--		URCU_TLS(cached_vtid) = gettid();
-+		URCU_TLS(cached_vtid) = lttng_gettid();
- 	lib_ring_buffer_align_ctx(ctx, lttng_alignof(URCU_TLS(cached_vtid)));
- 	chan->ops->event_write(ctx, &URCU_TLS(cached_vtid),
- 		sizeof(URCU_TLS(cached_vtid)));
-@@ -73,7 +73,7 @@ void vtid_get_value(struct lttng_ctx_field *field,
- 		struct lttng_ctx_value *value)
- {
- 	if (caa_unlikely(!URCU_TLS(cached_vtid)))
--		URCU_TLS(cached_vtid) = gettid();
-+		URCU_TLS(cached_vtid) = lttng_gettid();
- 	value->u.s64 = URCU_TLS(cached_vtid);
- }
- 
diff --git a/package/lttng-libust/lttng-libust.hash b/package/lttng-libust/lttng-libust.hash
index 6e5fdf23ce..2767332545 100644
--- a/package/lttng-libust/lttng-libust.hash
+++ b/package/lttng-libust/lttng-libust.hash
@@ -1,3 +1,5 @@
-# From http://lttng.org/files/lttng-ust/lttng-ust-2.10.1.tar.bz2.{md5,sha1}
-md5 4863cc2f9f0a070b42438bb646bbba06  lttng-ust-2.10.1.tar.bz2
-sha1 3779c9ed75e3fa532797431f2c47979ce73614a7  lttng-ust-2.10.1.tar.bz2
+# From http://lttng.org/files/lttng-ust/lttng-ust-2.10.5.tar.bz2.sha256
+sha256 06f9ed9b2198855b1c7fcbf15fe57297ee259409ffa1b3bad87321412d98bc35  lttng-ust-2.10.5.tar.bz2
+
+# Hash for license file
+sha256 74125a84c2166300776980166e29de40d5f98d1a75e487f0bbc0c03b4cd2342e  COPYING
diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index d645220ba6..ec855c5a5e 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE = http://lttng.org/files/lttng-ust
-LTTNG_LIBUST_VERSION = 2.10.1
+LTTNG_LIBUST_VERSION = 2.10.5
 LTTNG_LIBUST_SOURCE = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPL-2.1, MIT (system headers), GPL-2.0 (liblttng-ust-ctl/ustctl.c used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
-- 
2.23.0
