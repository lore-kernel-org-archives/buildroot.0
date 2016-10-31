From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 31 Oct 2016 03:46:18 -0400
Subject: [Buildroot] [PATCH v3 3/9] lttng-tools: bump to version 2.8.2
In-Reply-To: <20161031074624.7576-1-eeppeliteloop@gmail.com>
References: <20161031074624.7576-1-eeppeliteloop@gmail.com>
Message-ID: <20161031074624.7576-4-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current patches are dropped because they were merged upstream.

The new patches exist to fix the build with musl. They were submitted on
the lttng-dev mailing list, but not merged yet, or not merged in 2.8.2.

LTTng-tools now has its man pages written in AsciiDoc and they get
converted to troff at build time. This is not needed in a Buildroot
image anyway.

The --enable-lttng-ust/--disable-lttng-ust configure options are renamed
to --with-lttng-ust/--without-lttng-ust in v2.8.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
Changes v2 -> v3:
  - Add links to original patches in patch files.
  - Remove the original patch index from the subject of patch files.

Changes v1 -> v2:
  - Detailed commit message.
  - Complete patches with author and date.

 ...ld-failure-when-__GLIBC_PREREQ-is-missing.patch |  55 ---
 ...Fix-snapshot-del-output-with-name-on-musl.patch |  32 ++
 .../0002-Fix-add-missing-sys-types.h-header.patch  |  29 --
 ...Fix-strerror_r-behavior-is-glibc-specific.patch |  30 ++
 ...et-thread-stack-size-to-ulimit-soft-value.patch | 431 +++++++++++++++++++++
 package/lttng-tools/lttng-tools.hash               |   6 +-
 package/lttng-tools/lttng-tools.mk                 |  10 +-
 7 files changed, 502 insertions(+), 91 deletions(-)
 delete mode 100644 package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
 create mode 100644 package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
 delete mode 100644 package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
 create mode 100644 package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
 create mode 100644 package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch

diff --git a/package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch b/package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
deleted file mode 100644
index 2c01dea..0000000
--- a/package/lttng-tools/0001-Fix-build-failure-when-__GLIBC_PREREQ-is-missing.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 8 Mar 2016 14:25:34 +0200
-Subject: [PATCH] Fix: build failure when __GLIBC_PREREQ is missing
-
-The musl C library does not provide the __GLIBC_PREREQ macro. Instead of
-relying on glibc version test, check directly for the availability of
-epoll_create1().
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: sent upstream rebased on master branch
-(http://lists.lttng.org/pipermail/lttng-dev/2016-March/025593.html)
-
- configure.ac             | 2 +-
- src/common/compat/poll.h | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 66d83b60b017..4fc1160c9a08 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,7 +70,7 @@ AC_CHECK_FUNCS([ \
- 	gethostbyname gethostname getpagesize localtime_r memchr memset \
- 	mkdir munmap putenv realpath rmdir socket strchr strcspn strdup \
- 	strncasecmp strndup strpbrk strrchr strstr strtol strtoul \
--	strtoull \
-+	strtoull epoll_create1 \
- ])
-
- # Babeltrace viewer check
-diff --git a/src/common/compat/poll.h b/src/common/compat/poll.h
-index 699901848dc1..84f25d5c85aa 100644
---- a/src/common/compat/poll.h
-+++ b/src/common/compat/poll.h
-@@ -73,7 +73,7 @@ enum {
- 	LPOLLNVAL = EPOLLHUP,
- 	LPOLLRDHUP = EPOLLRDHUP,
- 	/* Close on exec feature of epoll */
--#if __GLIBC_PREREQ(2, 9)
-+#if defined(HAVE_EPOLL_CREATE1) && defined(EPOLL_CLOEXEC)
- 	LTTNG_CLOEXEC = EPOLL_CLOEXEC,
- #else
- 	/*
-@@ -127,7 +127,7 @@ extern int compat_epoll_create(struct lttng_poll_event *events,
- #define lttng_poll_create(events, size, flags) \
- 	compat_epoll_create(events, size, flags)
-
--#if __GLIBC_PREREQ(2, 9)
-+#if defined(HAVE_EPOLL_CREATE1) && defined(EPOLL_CLOEXEC)
- static inline int compat_glibc_epoll_create(int size __attribute__((unused)),
- 		int flags)
- {
---
-2.7.0
-
diff --git a/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch b/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
new file mode 100644
index 0000000..b8e9e2a
--- /dev/null
+++ b/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
@@ -0,0 +1,32 @@
+From: mjeanson at efficios.com Michael Jeanson
+Date: Wed, 15 Jun 2016 17:18:02 -0400
+Subject: [lttng-dev] [PATCH] Fix: snapshot del-output with name on musl
+
+Some implementations of strtol() like the one in musl will
+return EINVAL in perror when no valid number was found in
+the string.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+[Philippe: grabbed from the mailing list:
+    https://lists.lttng.org/pipermail/lttng-dev/2016-June/026192.html
+]
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+---
+ src/bin/lttng/commands/snapshot.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/bin/lttng/commands/snapshot.c b/src/bin/lttng/commands/snapshot.c
+index d948226..00aa5b7 100644
+--- a/src/bin/lttng/commands/snapshot.c
++++ b/src/bin/lttng/commands/snapshot.c
+@@ -350,7 +350,7 @@ static int cmd_del_output(int argc, const char **argv)
+
+ 	errno = 0;
+ 	id = strtol(argv[1], &name, 10);
+-	if (id == 0 && errno == 0) {
++	if (id == 0 && (errno == 0 || errno == EINVAL)) {
+ 		ret = del_output(UINT32_MAX, name);
+ 	} else if (errno == 0 && *name == '\0') {
+ 		ret = del_output(id, NULL);
+--
+2.7.4
diff --git a/package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch b/package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
deleted file mode 100644
index 5ce2da5..0000000
--- a/package/lttng-tools/0002-Fix-add-missing-sys-types.h-header.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 8 Mar 2016 14:40:49 +0200
-Subject: [PATCH] Fix: add missing sys/types.h header
-
-The musl C library requires inclusion of sys/types.h for mode_t.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: sent upstream
-(http://lists.lttng.org/pipermail/lttng-dev/2016-March/025594.html)
-
- src/common/runas.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common/runas.h b/src/common/runas.h
-index 2c5565af3646..ac1143eecf84 100644
---- a/src/common/runas.h
-+++ b/src/common/runas.h
-@@ -19,6 +19,7 @@
-  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-  */
-
-+#include <sys/types.h>
- #include <unistd.h>
- #include <pthread.h>
-
---
-2.7.0
-
diff --git a/package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch b/package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
new file mode 100644
index 0000000..5608a1e
--- /dev/null
+++ b/package/lttng-tools/0002-Fix-strerror_r-behavior-is-glibc-specific.patch
@@ -0,0 +1,30 @@
+From fc743b22fc26eab9f9dbf48e4505ed2394924bba Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 13 Jun 2016 18:44:17 -0400
+Subject: [PATCH lttng-tools 4/4] Fix: strerror_r behavior is glibc specific
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+[Philippe: grabbed from the mailing list:
+    https://lists.lttng.org/pipermail/lttng-dev/2016-June/026194.html
+]
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+---
+ src/common/error.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/error.h b/src/common/error.h
+index 0fbd3a2..e8c811e 100644
+--- a/src/common/error.h
++++ b/src/common/error.h
+@@ -198,7 +198,7 @@ static inline void __lttng_print_check_abort(enum lttng_error_level type)
+
+ #define _PERROR(fmt, args...) _ERRMSG("PERROR", PRINT_ERR, fmt, ## args)
+
+-#if !defined(__linux__) || ((_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600) && !defined(_GNU_SOURCE))
++#if !defined(__GLIBC__) || ((_POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE >= 600) && !defined(_GNU_SOURCE))
+
+ /*
+  * Version using XSI strerror_r.
+--
+2.7.4
+
diff --git a/package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch b/package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch
new file mode 100644
index 0000000..c0dd067
--- /dev/null
+++ b/package/lttng-tools/0003-Set-thread-stack-size-to-ulimit-soft-value.patch
@@ -0,0 +1,431 @@
+From 451f4d875537c073a966d6ccfb2fe08a497fbd7b Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Wed, 15 Jun 2016 11:01:08 -0500
+Subject: [PATCH] Set thread stack size to ulimit soft value
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+[Philippe: grabbed from the mailing list:
+    https://lists.lttng.org/pipermail/lttng-dev/2016-June/026196.html
+]
+Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
+---
+ src/bin/lttng-consumerd/lttng-consumerd.c | 17 ++++++----
+ src/bin/lttng-relayd/live.c               | 10 +++---
+ src/bin/lttng-relayd/live.h               |  2 +-
+ src/bin/lttng-relayd/main.c               | 14 +++++---
+ src/bin/lttng-sessiond/main.c             | 27 +++++++++------
+ src/common/utils.c                        | 56 +++++++++++++++++++++++++++++++
+ src/common/utils.h                        |  1 +
+ 7 files changed, 99 insertions(+), 28 deletions(-)
+
+diff --git a/src/bin/lttng-consumerd/lttng-consumerd.c b/src/bin/lttng-consumerd/lttng-consumerd.c
+index 00660fc..2f1d01c 100644
+--- a/src/bin/lttng-consumerd/lttng-consumerd.c
++++ b/src/bin/lttng-consumerd/lttng-consumerd.c
+@@ -57,6 +57,8 @@
+ static pthread_t channel_thread, data_thread, metadata_thread,
+ 		sessiond_thread, metadata_timer_thread, health_thread;
+
++static pthread_attr_t *tattr;
++
+ /* to count the number of times the user pressed ctrl+c */
+ static int sigintcount = 0;
+
+@@ -351,6 +353,9 @@ int main(int argc, char **argv)
+ 		}
+ 	}
+
++	/* Get stacksize limit */
++	tattr = get_pthread_attr_stacksize();
++
+ 	/*
+ 	 * Starting from here, we can create threads. This needs to be after
+ 	 * lttng_daemonize due to RCU.
+@@ -498,7 +503,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to manage the client socket */
+-	ret = pthread_create(&health_thread, NULL,
++	ret = pthread_create(&health_thread, tattr,
+ 			thread_manage_health, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -517,7 +522,7 @@ int main(int argc, char **argv)
+ 	cmm_smp_mb();	/* Read ready before following operations */
+
+ 	/* Create thread to manage channels */
+-	ret = pthread_create(&channel_thread, NULL,
++	ret = pthread_create(&channel_thread, tattr,
+ 			consumer_thread_channel_poll,
+ 			(void *) ctx);
+ 	if (ret) {
+@@ -528,7 +533,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to manage the polling/writing of trace metadata */
+-	ret = pthread_create(&metadata_thread, NULL,
++	ret = pthread_create(&metadata_thread, tattr,
+ 			consumer_thread_metadata_poll,
+ 			(void *) ctx);
+ 	if (ret) {
+@@ -539,7 +544,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to manage the polling/writing of trace data */
+-	ret = pthread_create(&data_thread, NULL, consumer_thread_data_poll,
++	ret = pthread_create(&data_thread, tattr, consumer_thread_data_poll,
+ 			(void *) ctx);
+ 	if (ret) {
+ 		errno = ret;
+@@ -549,7 +554,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create the thread to manage the receive of fd */
+-	ret = pthread_create(&sessiond_thread, NULL,
++	ret = pthread_create(&sessiond_thread, tattr,
+ 			consumer_thread_sessiond_poll,
+ 			(void *) ctx);
+ 	if (ret) {
+@@ -563,7 +568,7 @@ int main(int argc, char **argv)
+ 	 * Create the thread to manage the UST metadata periodic timer and
+ 	 * live timer.
+ 	 */
+-	ret = pthread_create(&metadata_timer_thread, NULL,
++	ret = pthread_create(&metadata_timer_thread, tattr,
+ 			consumer_timer_thread, (void *) ctx);
+ 	if (ret) {
+ 		errno = ret;
+diff --git a/src/bin/lttng-relayd/live.c b/src/bin/lttng-relayd/live.c
+index e2096ec..32efab1 100644
+--- a/src/bin/lttng-relayd/live.c
++++ b/src/bin/lttng-relayd/live.c
+@@ -2147,13 +2147,13 @@ int relayd_live_join(void)
+ /*
+  * main
+  */
+-int relayd_live_create(struct lttng_uri *uri)
++int relayd_live_create(struct lttng_uri *uri, const pthread_attr_t *tattr)
+ {
+ 	int ret = 0, retval = 0;
+ 	void *status;
+ 	int is_root;
+
+-	if (!uri) {
++	if (!uri || !tattr) {
+ 		retval = -1;
+ 		goto exit_init_data;
+ 	}
+@@ -2186,7 +2186,7 @@ int relayd_live_create(struct lttng_uri *uri)
+ 	}
+
+ 	/* Setup the dispatcher thread */
+-	ret = pthread_create(&live_dispatcher_thread, NULL,
++	ret = pthread_create(&live_dispatcher_thread, tattr,
+ 			thread_dispatcher, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -2196,7 +2196,7 @@ int relayd_live_create(struct lttng_uri *uri)
+ 	}
+
+ 	/* Setup the worker thread */
+-	ret = pthread_create(&live_worker_thread, NULL,
++	ret = pthread_create(&live_worker_thread, tattr,
+ 			thread_worker, NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -2206,7 +2206,7 @@ int relayd_live_create(struct lttng_uri *uri)
+ 	}
+
+ 	/* Setup the listener thread */
+-	ret = pthread_create(&live_listener_thread, NULL,
++	ret = pthread_create(&live_listener_thread, tattr,
+ 			thread_listener, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+diff --git a/src/bin/lttng-relayd/live.h b/src/bin/lttng-relayd/live.h
+index 2b8a3a0..6cd85e9 100644
+--- a/src/bin/lttng-relayd/live.h
++++ b/src/bin/lttng-relayd/live.h
+@@ -24,7 +24,7 @@
+
+ #include "lttng-relayd.h"
+
+-int relayd_live_create(struct lttng_uri *live_uri);
++int relayd_live_create(struct lttng_uri *live_uri, const pthread_attr_t *tattr);
+ int relayd_live_stop(void);
+ int relayd_live_join(void);
+
+diff --git a/src/bin/lttng-relayd/main.c b/src/bin/lttng-relayd/main.c
+index 6ad6566..505e884 100644
+--- a/src/bin/lttng-relayd/main.c
++++ b/src/bin/lttng-relayd/main.c
+@@ -119,6 +119,8 @@ static pthread_t dispatcher_thread;
+ static pthread_t worker_thread;
+ static pthread_t health_thread;
+
++static pthread_attr_t *tattr;
++
+ /*
+  * last_relay_stream_id_lock protects last_relay_stream_id increment
+  * atomicity on 32-bit architectures.
+@@ -2778,6 +2780,8 @@ int main(int argc, char **argv)
+ 		}
+ 	}
+
++	/* Get stack size limit */
++	tattr = get_pthread_attr_stacksize();
+
+ 	/* Initialize thread health monitoring */
+ 	health_relayd = health_app_create(NR_HEALTH_RELAYD_TYPES);
+@@ -2840,7 +2844,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to manage the client socket */
+-	ret = pthread_create(&health_thread, NULL,
++	ret = pthread_create(&health_thread, tattr,
+ 			thread_manage_health, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -2850,7 +2854,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Setup the dispatcher thread */
+-	ret = pthread_create(&dispatcher_thread, NULL,
++	ret = pthread_create(&dispatcher_thread, tattr,
+ 			relay_thread_dispatcher, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -2860,7 +2864,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Setup the worker thread */
+-	ret = pthread_create(&worker_thread, NULL,
++	ret = pthread_create(&worker_thread, tattr,
+ 			relay_thread_worker, NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -2870,7 +2874,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Setup the listener thread */
+-	ret = pthread_create(&listener_thread, NULL,
++	ret = pthread_create(&listener_thread, tattr,
+ 			relay_thread_listener, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -2879,7 +2883,7 @@ int main(int argc, char **argv)
+ 		goto exit_listener_thread;
+ 	}
+
+-	ret = relayd_live_create(live_uri);
++	ret = relayd_live_create(live_uri, tattr);
+ 	if (ret) {
+ 		ERR("Starting live viewer threads");
+ 		retval = -1;
+diff --git a/src/bin/lttng-sessiond/main.c b/src/bin/lttng-sessiond/main.c
+index c8e4e53..b8f1bde 100644
+--- a/src/bin/lttng-sessiond/main.c
++++ b/src/bin/lttng-sessiond/main.c
+@@ -212,6 +212,8 @@ static pthread_t ht_cleanup_thread;
+ static pthread_t agent_reg_thread;
+ static pthread_t load_session_thread;
+
++static pthread_attr_t *tattr;
++
+ /*
+  * UST registration command queue. This queue is tied with a futex and uses a N
+  * wakers / 1 waiter implemented and detailed in futex.c/.h
+@@ -2402,7 +2404,7 @@ static int spawn_consumer_thread(struct consumer_data *consumer_data)
+ 		goto error;
+ 	}
+
+-	ret = pthread_create(&consumer_data->thread, NULL, thread_manage_consumer,
++	ret = pthread_create(&consumer_data->thread, tattr, thread_manage_consumer,
+ 			consumer_data);
+ 	if (ret) {
+ 		errno = ret;
+@@ -5638,6 +5640,9 @@ int main(int argc, char **argv)
+ 		goto exit_create_run_as_worker_cleanup;
+ 	}
+
++	/* Get stack size limit */
++	tattr = get_pthread_attr_stacksize();
++
+ 	/*
+ 	 * Starting from here, we can create threads. This needs to be after
+ 	 * lttng_daemonize due to RCU.
+@@ -5672,7 +5677,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to clean up RCU hash tables */
+-	ret = pthread_create(&ht_cleanup_thread, NULL,
++	ret = pthread_create(&ht_cleanup_thread, tattr,
+ 			thread_ht_cleanup, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -6044,7 +6049,7 @@ int main(int argc, char **argv)
+ 	load_info->path = opt_load_session_path;
+
+ 	/* Create health-check thread */
+-	ret = pthread_create(&health_thread, NULL,
++	ret = pthread_create(&health_thread, tattr,
+ 			thread_manage_health, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -6054,7 +6059,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to manage the client socket */
+-	ret = pthread_create(&client_thread, NULL,
++	ret = pthread_create(&client_thread, tattr,
+ 			thread_manage_clients, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -6064,7 +6069,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to dispatch registration */
+-	ret = pthread_create(&dispatch_thread, NULL,
++	ret = pthread_create(&dispatch_thread, tattr,
+ 			thread_dispatch_ust_registration, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -6074,7 +6079,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to manage application registration. */
+-	ret = pthread_create(&reg_apps_thread, NULL,
++	ret = pthread_create(&reg_apps_thread, tattr,
+ 			thread_registration_apps, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -6084,7 +6089,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to manage application socket */
+-	ret = pthread_create(&apps_thread, NULL,
++	ret = pthread_create(&apps_thread, tattr,
+ 			thread_manage_apps, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -6094,7 +6099,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create thread to manage application notify socket */
+-	ret = pthread_create(&apps_notify_thread, NULL,
++	ret = pthread_create(&apps_notify_thread, tattr,
+ 			ust_thread_manage_notify, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -6104,7 +6109,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create agent registration thread. */
+-	ret = pthread_create(&agent_reg_thread, NULL,
++	ret = pthread_create(&agent_reg_thread, tattr,
+ 			agent_thread_manage_registration, (void *) NULL);
+ 	if (ret) {
+ 		errno = ret;
+@@ -6116,7 +6121,7 @@ int main(int argc, char **argv)
+ 	/* Don't start this thread if kernel tracing is not requested nor root */
+ 	if (is_root && !opt_no_kernel) {
+ 		/* Create kernel thread to manage kernel event */
+-		ret = pthread_create(&kernel_thread, NULL,
++		ret = pthread_create(&kernel_thread, tattr,
+ 				thread_manage_kernel, (void *) NULL);
+ 		if (ret) {
+ 			errno = ret;
+@@ -6127,7 +6132,7 @@ int main(int argc, char **argv)
+ 	}
+
+ 	/* Create session loading thread. */
+-	ret = pthread_create(&load_session_thread, NULL, thread_load_session,
++	ret = pthread_create(&load_session_thread, tattr, thread_load_session,
+ 			load_info);
+ 	if (ret) {
+ 		errno = ret;
+diff --git a/src/common/utils.c b/src/common/utils.c
+index 1e52ae0..593d6cc 100644
+--- a/src/common/utils.c
++++ b/src/common/utils.c
+@@ -31,6 +31,8 @@
+ #include <pwd.h>
+ #include <sys/file.h>
+ #include <unistd.h>
++#include <stdbool.h>
++#include <sys/resource.h>
+
+ #include <common/common.h>
+ #include <common/runas.h>
+@@ -1383,3 +1385,57 @@ int utils_show_man_page(int section, const char *page_name)
+ 		section_string, page_name, NULL);
+ 	return ret;
+ }
++
++static bool pthread_ss_done = false;
++static pthread_attr_t *tattr = NULL;
++static pthread_attr_t tattr_value;
++
++LTTNG_HIDDEN
++pthread_attr_t *get_pthread_attr_stacksize() {
++	int ret = 0;
++	size_t ptstacksize;
++	struct rlimit rlim;
++
++	/* Return cached value */
++	if (pthread_ss_done) {
++		goto end;
++	}
++
++	/* Get stack size limits */
++	ret = getrlimit(RLIMIT_STACK, &rlim);
++	if (ret < 0) {
++		PERROR("getrlimit");
++		goto end;
++	}
++	DBG("Stack size limits: soft %lld, hard %lld bytes",
++			(long long) rlim.rlim_cur,
++			(long long) rlim.rlim_max);
++
++	/* Get default thread stack size */
++	ret = pthread_attr_getstacksize(&tattr_value, &ptstacksize);
++	if (ret < 0) {
++		PERROR("pthread_attr_getstacksize");
++		goto end;
++	}
++	DBG("Default pthread stack size is %zu bytes", ptstacksize);
++
++	/* Check if default thread stack size respects ulimits */
++	if (ptstacksize < rlim.rlim_cur) {
++		DBG("Your libc doesn't honor stack size limits, setting thread stack size to soft limit (%lld bytes)", (long long) rlim.rlim_cur);
++
++		/* Create pthread_attr_t struct with ulimit stack size */
++		ret = pthread_attr_setstacksize(&tattr_value, rlim.rlim_cur);
++		if (ret < 0) {
++			PERROR("pthread_attr_setstacksize");
++			goto end;
++		}
++
++		/* Set pointer */
++		tattr = &tattr_value;
++	}
++
++	/* Enable cached value */
++	pthread_ss_done = true;
++end:
++	return tattr;
++}
+diff --git a/src/common/utils.h b/src/common/utils.h
+index 7285f5c..568c123 100644
+--- a/src/common/utils.h
++++ b/src/common/utils.h
+@@ -60,5 +60,6 @@ int utils_create_lock_file(const char *filepath);
+ int utils_recursive_rmdir(const char *path);
+ int utils_truncate_stream_file(int fd, off_t length);
+ int utils_show_man_page(int section, const char *page_name);
++pthread_attr_t *get_pthread_attr_stacksize();
+
+ #endif /* _COMMON_UTILS_H */
+--
+2.7.4
+
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index f05b0e3..267da80 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,2 +1,6 @@
+# From http://lttng.org/files/lttng-tools/lttng-tools-2.8.2.tar.bz2.{md5,sha1}
+md5     cac8d64111711ae1b632d0dc12fe92c1  lttng-tools-2.8.2.tar.bz2
+sha1    870874ba9644691de8e564a1fa1459aa5fef42ba  lttng-tools-2.8.2.tar.bz2
+
 # Locally generated
-sha256  0c799fb21dfa42475feaa1507ded934608b2e531039b46c40e944a5b81c7b21c  lttng-tools-2.7.1.tar.bz2
+sha256  a07e00e9519dad2577d9330bcaf040ab3dc1b289fbcb8c702c39d520422e7565  lttng-tools-2.8.2.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index e5b1207..3d884d3 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################

-LTTNG_TOOLS_VERSION = 2.7.1
+LTTNG_TOOLS_VERSION = 2.8.2
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
-LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr
-# Patching configure.ac
-LTTNG_TOOLS_AUTORECONF = YES
+LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr --disable-man-pages

 # The host-lttng-babeltrace technically isn't a required build
 # dependency. However, having the babeltrace utilities built for the
@@ -20,10 +18,10 @@ LTTNG_TOOLS_AUTORECONF = YES
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt host-lttng-babeltrace util-linux

 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
-LTTNG_TOOLS_CONF_OPTS += --enable-lttng-ust
+LTTNG_TOOLS_CONF_OPTS += --with-lttng-ust
 LTTNG_TOOLS_DEPENDENCIES += lttng-libust
 else
-LTTNG_TOOLS_CONF_OPTS += --disable-lttng-ust
+LTTNG_TOOLS_CONF_OPTS += --without-lttng-ust
 endif

 $(eval $(autotools-package))
--
2.9.3
