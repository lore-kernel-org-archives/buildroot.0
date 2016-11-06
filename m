From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun,  6 Nov 2016 22:30:09 +0100
Subject: [Buildroot] [PATCH] libpjsip: bump to 2.5.5
Message-ID: <1478467809-25561-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patches now upstream.
Disable new optional features: webrtc and opus.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 ...ypes-compatible-with-musl-fixes-musl-buil.patch | 53 --------------
 ...ched_priority-with-sched_priority-fixes-m.patch | 82 ----------------------
 package/libpjsip/libpjsip.hash                     |  6 +-
 package/libpjsip/libpjsip.mk                       |  4 +-
 4 files changed, 6 insertions(+), 139 deletions(-)
 delete mode 100644 package/libpjsip/0001-Use-mutex-types-compatible-with-musl-fixes-musl-buil.patch
 delete mode 100644 package/libpjsip/0002-Replace-__sched_priority-with-sched_priority-fixes-m.patch

diff --git a/package/libpjsip/0001-Use-mutex-types-compatible-with-musl-fixes-musl-buil.patch b/package/libpjsip/0001-Use-mutex-types-compatible-with-musl-fixes-musl-buil.patch
deleted file mode 100644
index ab3444b710e1..000000000000
--- a/package/libpjsip/0001-Use-mutex-types-compatible-with-musl-fixes-musl-buil.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ba1057d74aac6c2dde5477bd6a2deea79f14962c Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Sat, 12 Mar 2016 15:19:34 +0100
-Subject: [PATCH 1/2] Use mutex types compatible with musl (fixes musl build)
-
-PTHREAD_MUTEX_FAST_NP and PTHREAD_MUTEX_RECURSIVE_NP are not defined
-in the musl C library. Use values that map to the same mutex type in
-GNU libc and uClibc-ng.
-
-Fixes the following build errors when building with musl:
-
-  ../src/pj/os_core_unix.c: In function 'init_mutex':
-  ../src/pj/os_core_unix.c:1128:40: error: 'PTHREAD_MUTEX_FAST_NP' undeclared (first use in this function)
-    rc = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_FAST_NP);
-                                          ^
-  ../src/pj/os_core_unix.c:1128:40: note: each undeclared identifier is reported only once for each function it appears in
-  ../src/pj/os_core_unix.c:1138:40: error: 'PTHREAD_MUTEX_RECURSIVE_NP' undeclared (first use in this function)
-    rc = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
-                                          ^
-
-Original patch:
-http://git.alpinelinux.org/cgit/aports/plain/main/pjproject/musl-fixes.patch
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
----
- pjlib/src/pj/os_core_unix.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/pjlib/src/pj/os_core_unix.c b/pjlib/src/pj/os_core_unix.c
-index 1c87b2f..f08ba27 100644
---- a/pjlib/src/pj/os_core_unix.c
-+++ b/pjlib/src/pj/os_core_unix.c
-@@ -1125,7 +1125,7 @@ static pj_status_t init_mutex(pj_mutex_t *mutex, const char *name, int type)
-     if (type == PJ_MUTEX_SIMPLE) {
- #if (defined(PJ_LINUX) && PJ_LINUX!=0) || \
-     defined(PJ_HAS_PTHREAD_MUTEXATTR_SETTYPE)
--	rc = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_FAST_NP);
-+	rc = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_NORMAL);
- #elif (defined(PJ_RTEMS) && PJ_RTEMS!=0) || \
-        defined(PJ_PTHREAD_MUTEXATTR_T_HAS_RECURSIVE)
- 	/* Nothing to do, default is simple */
-@@ -1135,7 +1135,7 @@ static pj_status_t init_mutex(pj_mutex_t *mutex, const char *name, int type)
-     } else {
- #if (defined(PJ_LINUX) && PJ_LINUX!=0) || \
-      defined(PJ_HAS_PTHREAD_MUTEXATTR_SETTYPE)
--	rc = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
-+	rc = pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
- #elif (defined(PJ_RTEMS) && PJ_RTEMS!=0) || \
-        defined(PJ_PTHREAD_MUTEXATTR_T_HAS_RECURSIVE)
- 	// Phil Torre <ptorre@zetron.com>:
--- 
-1.9.1
-
diff --git a/package/libpjsip/0002-Replace-__sched_priority-with-sched_priority-fixes-m.patch b/package/libpjsip/0002-Replace-__sched_priority-with-sched_priority-fixes-m.patch
deleted file mode 100644
index e1cb00229a77..000000000000
--- a/package/libpjsip/0002-Replace-__sched_priority-with-sched_priority-fixes-m.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From cca93ce25f993c97ef3d96fa32461d5717c30518 Mon Sep 17 00:00:00 2001
-From: Luca Ceresoli <luca@lucaceresoli.net>
-Date: Sat, 12 Mar 2016 15:31:47 +0100
-Subject: [PATCH 2/2] Replace __sched_priority with sched_priority(fixes musl
- build)
-
-The musl C library defines sched_priority, not __sched_priority as GNU
-libc and uClibc-ng do. Use sched_priority instead.
-
-This does not break compatibility with GNU libc and uClibc-ng because
-both define in sched.h:
-
-  #define sched_priority	  __sched_priority
-
-Fixes the following build errors when building with musl:
-
-  ../src/samples/siprtp.c: In function 'boost_priority':
-  ../src/samples/siprtp.c:1137:7: error: 'struct sched_param' has no member named '__sched_priority'
-       tp.__sched_priority = max_prio;
-         ^
-  In file included from /home/murray/devel/buildroot/test-musl-eabi/build/libpjsip-2.4.5/pjlib/include/pj/except.h:30:0,
-                   from /home/murray/devel/buildroot/test-musl-eabi/build/libpjsip-2.4.5/pjlib/include/pjlib.h:35,
-                   from ../src/samples/siprtp.c:76:
-  ../src/samples/siprtp.c:1146:18: error: 'struct sched_param' has no member named '__sched_priority'
-          policy, tp.__sched_priority));
-                    ^
-
-Original patch:
-http://git.alpinelinux.org/cgit/aports/plain/main/pjproject/musl-fixes.patch
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
----
- pjsip-apps/src/samples/siprtp.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/pjsip-apps/src/samples/siprtp.c b/pjsip-apps/src/samples/siprtp.c
-index 796464f..6e32a8f 100644
---- a/pjsip-apps/src/samples/siprtp.c
-+++ b/pjsip-apps/src/samples/siprtp.c
-@@ -1134,7 +1134,7 @@ static void boost_priority(void)
- 		    PJ_RETURN_OS_ERROR(rc));
- 	return;
-     }
--    tp.__sched_priority = max_prio;
-+    tp.sched_priority = max_prio;
- 
-     rc = sched_setscheduler(0, POLICY, &tp);
-     if (rc != 0) {
-@@ -1143,7 +1143,7 @@ static void boost_priority(void)
-     }
- 
-     PJ_LOG(4, (THIS_FILE, "New process policy=%d, priority=%d",
--	      policy, tp.__sched_priority));
-+	      policy, tp.sched_priority));
- 
-     /*
-      * Adjust thread scheduling algorithm and priority
-@@ -1156,10 +1156,10 @@ static void boost_priority(void)
-     }
- 
-     PJ_LOG(4, (THIS_FILE, "Old thread policy=%d, priority=%d",
--	      policy, tp.__sched_priority));
-+	      policy, tp.sched_priority));
- 
-     policy = POLICY;
--    tp.__sched_priority = max_prio;
-+    tp.sched_priority = max_prio;
- 
-     rc = pthread_setschedparam(pthread_self(), policy, &tp);
-     if (rc != 0) {
-@@ -1169,7 +1169,7 @@ static void boost_priority(void)
-     }
- 
-     PJ_LOG(4, (THIS_FILE, "New thread policy=%d, priority=%d",
--	      policy, tp.__sched_priority));
-+	      policy, tp.sched_priority));
- }
- 
- #else
--- 
-1.9.1
-
diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index e0d3d14323ab..99760652cb11 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,5 +1,5 @@
-# From http://www.pjsip.org/release/2.4.5/MD5SUM.TXT
-md5	f58b3485977b3a700256203a554b3869  pjproject-2.4.5.tar.bz2
+# From http://www.pjsip.org/release/2.5.5/MD5SUM.TXT
+md5	183f7144b9aa238884243c0fc52ece36  pjproject-2.5.5.tar.bz2
 
 # Locally computed
-sha256	086f5e70dcaee312b66ddc24dac6ef85e6f1fec4eed00ff2915cebe0ee3cdd8d	pjproject-2.4.5.tar.bz2
+sha256	ab39207b761d3485199cd881410afeb2d171dff7c2bf75e8caae91c6dca508f3	pjproject-2.5.5.tar.bz2
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 2b5e18f2230e..cb0d866e255b 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.4.5
+LIBPJSIP_VERSION = 2.5.5
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
 LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
 LIBPJSIP_DEPENDENCIES = libsrtp
@@ -34,6 +34,8 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-opencore-amr \
 	--disable-g7221-codec \
 	--disable-ilbc-codec \
+	--disable-webrtc \
+	--disable-opus \
 	--with-external-srtp=$(STAGING_DIR)/usr
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.7.4
