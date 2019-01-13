From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jan 2019 11:23:32 +0100
Subject: [Buildroot] [PATCH 1/1] syslog-ng: fix build on m68k with uclibc
Message-ID: <20190113102332.9810-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibc on m68k defines pthread_spinlock_t but does not define
pthread_spin_trylock so check for this function before using it

Fixes:
 - http://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463d1b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/syslog-ng/0001-fix-build-on-uclibc.patch | 51 ++++++++++++++++++++++++
 package/syslog-ng/syslog-ng.mk                   |  2 +
 2 files changed, 53 insertions(+)
 create mode 100644 package/syslog-ng/0001-fix-build-on-uclibc.patch

diff --git a/package/syslog-ng/0001-fix-build-on-uclibc.patch b/package/syslog-ng/0001-fix-build-on-uclibc.patch
new file mode 100644
index 0000000000..dbb9b66b5c
--- /dev/null
+++ b/package/syslog-ng/0001-fix-build-on-uclibc.patch
@@ -0,0 +1,51 @@
+From 98bd6106f8c48bc8f0a27bd712ed4ba6249e9a5f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 13 Jan 2019 11:03:51 +0100
+Subject: [PATCH] fix build on m68k with uclibc
+
+uclibc on m68k defines pthread_spinlock_t but does not define
+pthread_spin_trylock so check for this function before using it
+
+Fixes:
+ - http://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463d1b
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/buytenh/ivykis/pull/17]
+---
+ configure.ac   | 3 +++
+ src/spinlock.h | 4 ++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/lib/ivykis/configure.ac b/lib/ivykis/configure.ac
+index e9b10c0..24152a9 100644
+--- a/lib/ivykis/configure.ac
++++ b/lib/ivykis/configure.ac
+@@ -110,6 +110,9 @@ AC_CACHE_CHECK(for linux/netfilter_ipv4.h, ac_cv_header_linux_netfilter_ipv4_h,
+ # Check for pthread_spinlock_t.
+ AC_CHECK_TYPES([pthread_spinlock_t], [], [], [[#include <pthread.h>]])
+ 
++# Check for pthread_spin_trylock
++AC_CHECK_FUNCS([pthread_spin_trylock])
++
+ # Check which header file defines 'struct timespec'.
+ for hdr in sys/time.h sys/timers.h time.h pthread.h
+ do
+diff --git a/lib/ivykis/src/spinlock.h b/lib/ivykis/src/spinlock.h
+index ebcdbec..d837df8 100644
+--- a/lib/ivykis/src/spinlock.h
++++ b/lib/ivykis/src/spinlock.h
+@@ -76,7 +76,11 @@ static inline void fallback_spin_unlock(fallback_spinlock_t *lock)
+ 
+ static inline int pthread_spinlocks_available(void)
+ {
++#ifdef HAVE_PTHREAD_SPIN_TRYLOCK
+ 	return !!(pthread_spin_trylock != NULL);
++#else
++	return 0;
++#endif
+ }
+ 
+ 
+-- 
+2.14.1
+
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 4316382153..ecde9e8181 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -12,6 +12,8 @@ SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	eventlog libglib2 openssl pcre
+# We're patching configure.ac
+SYSLOG_NG_AUTORECONF = YES
 # rabbit-mq needs -lrt
 SYSLOG_NG_CONF_ENV = LIBS=-lrt
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
-- 
2.14.1
