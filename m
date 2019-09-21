From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Sep 2019 09:31:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-libust: fix build with glibc
 2.30
Message-ID: <20190921073159.22192-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/00a69be575224b9fa739acf5a5f8676d171ad992

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-Fix-namespace-our-gettid-wrapper.patch | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch

diff --git a/package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch b/package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch
new file mode 100644
index 0000000000..001235d476
--- /dev/null
+++ b/package/lttng-libust/0002-Fix-namespace-our-gettid-wrapper.patch
@@ -0,0 +1,90 @@
+From 3e2aaf78e6f8d57c7dbc42e39764862ba8c64bd7 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 3 Jun 2019 15:25:32 -0400
+Subject: [PATCH] Fix: namespace our gettid wrapper
+
+Since glibc 2.30, a gettid wrapper was added that conflicts with our
+static declaration. Namespace our wrapper so there is no conflict,
+we'll add support for the glibc provided wrapper in a further commit.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+[Retrieved from:
+https://github.com/lttng/lttng-ust/commit/3e2aaf78e6f8d57c7dbc42e39764862ba8c64bd7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/lttng/ust-tid.h           | 12 +++++++-----
+ include/usterr-signal-safe.h      |  2 +-
+ liblttng-ust/lttng-context-vtid.c |  4 ++--
+ 3 files changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/include/lttng/ust-tid.h b/include/lttng/ust-tid.h
+index e669d7e7..e637718a 100644
+--- a/include/lttng/ust-tid.h
++++ b/include/lttng/ust-tid.h
+@@ -31,23 +31,25 @@
+ #include <syscall.h>
+ #endif
+ 
+-#if defined(_syscall0)
+-_syscall0(pid_t, gettid)
+-#elif defined(__NR_gettid)
++#if defined(__NR_gettid)
++
+ #include <unistd.h>
+-static inline pid_t gettid(void)
++static inline pid_t lttng_gettid(void)
+ {
+ 	return syscall(__NR_gettid);
+ }
++
+ #else
++
+ #include <sys/types.h>
+ #include <unistd.h>
+ 
+ /* Fall-back on getpid for tid if not available. */
+-static inline pid_t gettid(void)
++static inline pid_t lttng_gettid(void)
+ {
+ 	return getpid();
+ }
++
+ #endif
+ 
+ #endif /* _LTTNG_UST_TID_H */
+diff --git a/include/usterr-signal-safe.h b/include/usterr-signal-safe.h
+index 1df5ada0..d987c1f0 100644
+--- a/include/usterr-signal-safe.h
++++ b/include/usterr-signal-safe.h
+@@ -95,7 +95,7 @@ do {									\
+ 	do {					\
+ 		sigsafe_print_err(UST_STR_COMPONENT "[%ld/%ld]: " fmt " (in %s() at " __FILE__ ":" UST_XSTR(__LINE__) ")\n", \
+ 		(long) getpid(),		\
+-		(long) gettid(),		\
++		(long) lttng_gettid(),		\
+ 		## args, __func__);		\
+ 	} while(0)
+ 
+diff --git a/liblttng-ust/lttng-context-vtid.c b/liblttng-ust/lttng-context-vtid.c
+index f28e470a..2f721fa0 100644
+--- a/liblttng-ust/lttng-context-vtid.c
++++ b/liblttng-ust/lttng-context-vtid.c
+@@ -62,7 +62,7 @@ void vtid_record(struct lttng_ctx_field *field,
+ 		 struct lttng_channel *chan)
+ {
+ 	if (caa_unlikely(!URCU_TLS(cached_vtid)))
+-		URCU_TLS(cached_vtid) = gettid();
++		URCU_TLS(cached_vtid) = lttng_gettid();
+ 	lib_ring_buffer_align_ctx(ctx, lttng_alignof(URCU_TLS(cached_vtid)));
+ 	chan->ops->event_write(ctx, &URCU_TLS(cached_vtid),
+ 		sizeof(URCU_TLS(cached_vtid)));
+@@ -73,7 +73,7 @@ void vtid_get_value(struct lttng_ctx_field *field,
+ 		struct lttng_ctx_value *value)
+ {
+ 	if (caa_unlikely(!URCU_TLS(cached_vtid)))
+-		URCU_TLS(cached_vtid) = gettid();
++		URCU_TLS(cached_vtid) = lttng_gettid();
+ 	value->u.s64 = URCU_TLS(cached_vtid);
+ }
+ 
-- 
2.23.0
