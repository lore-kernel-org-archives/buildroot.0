From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 21:19:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/coreutils: fix build without threads
Message-ID: <20210404191944.3439677-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build of coreutils without threads is broken since bump to version 8.32
in commit b4a0f9fb0e45aded46eb7259e25a1113eabf93c0

Fixes:
 - http://autobuild.buildroot.org/results/8d00bdabef73daa2a1d1f4c6e183dda447a82134

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ad-cond.m4-fix-build-without-threads.patch | 58 +++++++++++++++++++
 ...ond.c-use-tv.nsec-instead-of-tv.usec.patch | 34 +++++++++++
 package/coreutils/coreutils.mk                |  2 +
 3 files changed, 94 insertions(+)
 create mode 100644 package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch
 create mode 100644 package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch

diff --git a/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch b/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch
new file mode 100644
index 0000000000..cd92e8bc43
--- /dev/null
+++ b/package/coreutils/0002-m4-pthread-cond.m4-fix-build-without-threads.patch
@@ -0,0 +1,58 @@
+From 823cb5f4b01ca98b784fc234c84c0b909335960f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 4 Apr 2021 20:54:24 +0200
+Subject: [PATCH] m4/pthread-cond.m4: fix build without threads
+
+HAVE_PTHREAD_COND_xxx variables are wrongly set to 1 instead of 0 if
+HAVE_PTHREAD_H is set to 0 since
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e08989ca11a13c8a09cb0c34f797af5a40753379
+
+This will result in the following build failure if threads are not
+available, for example with coreutils in version 8.32:
+
+/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: src/libsinglebin_sort.a(libsinglebin_sort_a-sort.o): in function `queue_insert':
+sort.c:(.text+0x1d5c): undefined reference to `pthread_cond_signal'
+/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: src/libsinglebin_sort.a(libsinglebin_sort_a-sort.o): in function `sortlines':
+sort.c:(.text+0x2868): undefined reference to `pthread_cond_wait'
+/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: src/libsinglebin_sort.a(libsinglebin_sort_a-sort.o): in function `single_binary_main_sort':
+sort.c:(.text+0x5a24): undefined reference to `pthread_cond_init
+
+Fixes:
+ - http://autobuild.buildroot.org/results/acb58a76642c6ffd8f0b752349a6e754fc011e86
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to bug-gnulib at gnu.org]
+---
+ m4/pthread-cond.m4 | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/m4/pthread-cond.m4 b/m4/pthread-cond.m4
+index 75e37c613..f6ff6c0e6 100644
+--- a/m4/pthread-cond.m4
++++ b/m4/pthread-cond.m4
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
index 0000000000..9c031840ac
--- /dev/null
+++ b/package/coreutils/0003-lib-pthread-cond.c-use-tv.nsec-instead-of-tv.usec.patch
@@ -0,0 +1,34 @@
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
-- 
2.30.2
