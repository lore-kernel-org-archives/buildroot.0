From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 11:25:55 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/coreutils: fix
 build without threads
Message-ID: <20210406090707.C241182A9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb0f914729c5142456af4722010d49cf1a6bfdcd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Build of coreutils without threads is broken since bump to version 8.32
in commit b4a0f9fb0e45aded46eb7259e25a1113eabf93c0

Fixes:
 - http://autobuild.buildroot.org/results/8d00bdabef73daa2a1d1f4c6e183dda447a82134

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - do an actual backport of patch 0002
  - add upstream status for patch 0003
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b3ba0f1d2fba612a95a224b6d32f56015f1f28e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pthread-cond.m4-fix-build-without-threads.patch | 59 ++++++++++++++++++++++
 ...ead-cond.c-use-tv.nsec-instead-of-tv.usec.patch | 35 +++++++++++++
 package/coreutils/coreutils.mk                     |  2 +
 3 files changed, 96 insertions(+)

diff --git a/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch b/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch
new file mode 100644
index 0000000000..86e6f80d90
--- /dev/null
+++ b/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch
@@ -0,0 +1,59 @@
+From 7622a0a4c6309f9cecaeef72569da687eb5b6b93 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 5 Apr 2021 01:13:29 +0200
+Subject: [PATCH] pthread-cond: Fix wrong configure results when <pthread.h> is
+ absent.
+
+* m4/pthread-cond.m4 (gl_PTHREAD_COND): When <pthread.h> does not exist,
+set HAVE_PTHREAD_COND_* to 0, not to 1.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998 at free.fr:
+  - backport from upstream gnulib
+  - drop upstream's Changelog hunk
+  - reisntate Fabrice's SoB
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+
+---
+ m4/pthread-cond.m4 | 18 +++++++++---------
+ 2 files changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/m4/pthread-cond.m4 b/m4/pthread-cond.m4
+index 75e37c6138..8922a8a243 100644
+--- a/m4/pthread-cond.m4
++++ b/m4/pthread-cond.m4
+@@ -1,5 +1,5 @@
+-# pthread-cond.m4 serial 1
+-dnl Copyright (C) 2019-2020 Free Software Foundation, Inc.
++# pthread-cond.m4 serial 2
++dnl Copyright (C) 2019-2021 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+ dnl with or without modifications, as long as this notice is preserved.
+@@ -23,14 +23,14 @@ AC_DEFUN([gl_PTHREAD_COND],
+     REPLACE_PTHREAD_COND_DESTROY=1
+   else
+     if test $HAVE_PTHREAD_H = 0; then
+-      HAVE_PTHREAD_COND_INIT=1
+-      HAVE_PTHREAD_CONDATTR_INIT=1
+-      HAVE_PTHREAD_CONDATTR_DESTROY=1
+-      HAVE_PTHREAD_COND_WAIT=1
+-      HAVE_PTHREAD_COND_TIMEDWAIT=1
+-      HAVE_PTHREAD_COND_SIGNAL=1
+-      HAVE_PTHREAD_COND_BROADCAST=1
+-      HAVE_PTHREAD_COND_DESTROY=1
++      HAVE_PTHREAD_COND_INIT=0
++      HAVE_PTHREAD_CONDATTR_INIT=0
++      HAVE_PTHREAD_CONDATTR_DESTROY=0
++      HAVE_PTHREAD_COND_WAIT=0
++      HAVE_PTHREAD_COND_TIMEDWAIT=0
++      HAVE_PTHREAD_COND_SIGNAL=0
++      HAVE_PTHREAD_COND_BROADCAST=0
++      HAVE_PTHREAD_COND_DESTROY=0
+     fi
+   fi
+ ])
+-- 
+2.30.2
+
diff --git a/package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch b/package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch
new file mode 100644
index 0000000000..e1cdccf07c
--- /dev/null
+++ b/package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch
@@ -0,0 +1,35 @@
+From 67610020ce7c321678ef59af95fde0483e8e8149 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 4 Apr 2021 21:09:19 +0200
+Subject: [PATCH] lib/pthread-cond.c: use tv.nsec instead of tv.usec
+
+Use tv.nsec instead of tv.usec to avoid the following build failure:
+
+lib/pthread-cond.c: In function 'pthread_cond_wait':
+lib/pthread-cond.c:121:16: error: 'struct timespec' has no member named 'tv_usec'; did you mean 'tv_sec'?
+  121 |       duration.tv_usec = 0;
+      |                ^~~~~~~
+      |                tv_sec
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[upstream status: https://lists.gnu.org/archive/html/bug-gnulib/2021-04/msg00044.html]
+---
+ lib/pthread-cond.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/pthread-cond.c b/lib/pthread-cond.c
+index baa7c60bb..c2c00be03 100644
+--- a/lib/pthread-cond.c
++++ b/lib/pthread-cond.c
+@@ -118,7 +118,7 @@ pthread_cond_wait (pthread_cond_t *cond _GL_UNUSED,
+       struct timespec duration;
+ 
+       duration.tv_sec = 86400;
+-      duration.tv_usec = 0;
++      duration.tv_nsec = 0;
+       nanosleep (&duration, NULL);
+     }
+ }
+-- 
+2.30.2
+
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 18e9052dfd..0e75cdfcda 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -10,6 +10,8 @@ COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
 COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_CPE_ID_VENDOR = gnu
+# We're patching m4/pthread-cond.m4
+COREUTILS_AUTORECONF = YES
 
 COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
