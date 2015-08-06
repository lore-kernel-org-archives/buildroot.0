From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:06:01 +0200
Subject: [Buildroot] [git commit] package/eudev: fix build with musl +
	libselinux
Message-ID: <20150806070609.5437880054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8541fc05a3f6d7495e31304619adcc9e210a6989
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to disable mallinfo statistics with musl toolchains
which doesn't have struct mallinfo.

Fixes:
selinux-util.c: In function ???mac_selinux_init???:
selinux-util.c:70:25: error: storage size of ???before_mallinfo??? isn???t known
         struct mallinfo before_mallinfo, after_mallinfo;

Add a second patch for strndupa() which is a GNU extension.

Fixes:
./.libs/libudev-core.a(selinux-util.o): In function `mac_selinux_bind':
selinux-util.c:(.text+0xd94): undefined reference to `strndupa'
collect2: error: ld returned 1 exit status

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../eudev/0002-build-sys-check-for-mallinfo.patch  |   93 ++++++++++++++++++++
 .../eudev/0003-build-sys-check-for-strndupa.patch  |   69 +++++++++++++++
 package/eudev/eudev.mk                             |    5 +
 3 files changed, 167 insertions(+), 0 deletions(-)

diff --git a/package/eudev/0002-build-sys-check-for-mallinfo.patch b/package/eudev/0002-build-sys-check-for-mallinfo.patch
new file mode 100644
index 0000000..c2fa2da
--- /dev/null
+++ b/package/eudev/0002-build-sys-check-for-mallinfo.patch
@@ -0,0 +1,93 @@
+From 1205e0b50067c5ebfa082f149f0996304aa04335 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 30 Jul 2015 16:55:45 +0200
+Subject: [PATCH] build-sys: check for mallinfo
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+mallinfo is not specified by POSIX or the C standards, therefore
+it's not available for all libc libraries (musl).
+
+Add the ability to disable mallinfo statistics.
+
+Fixes:
+selinux-util.c: In function ???mac_selinux_init???:
+selinux-util.c:70:25: error: storage size of ???before_mallinfo??? isn???t known
+         struct mallinfo before_mallinfo, after_mallinfo;
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac              |  3 +++
+ src/shared/selinux-util.c | 15 +++++++++++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index ec23ab5..4a293b2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -226,6 +226,9 @@ else
+ fi
+ AC_SUBST(sushell)
+ 
++# selinux-util.c uses struct mallinfo which is not available for all C libraries (musl).
++AC_CHECK_FUNCS([mallinfo])
++
+ # ------------------------------------------------------------------------------
+ 
+ AC_CHECK_DECL([unshare],
+diff --git a/src/shared/selinux-util.c b/src/shared/selinux-util.c
+index 756215e..4e0866b 100644
+--- a/src/shared/selinux-util.c
++++ b/src/shared/selinux-util.c
+@@ -67,7 +67,10 @@ int mac_selinux_init(const char *prefix) {
+ 
+ #ifdef HAVE_SELINUX
+         usec_t before_timestamp, after_timestamp;
++
++#ifdef HAVE_MALLINFO
+         struct mallinfo before_mallinfo, after_mallinfo;
++#endif
+ 
+         if (!mac_selinux_use())
+                 return 0;
+@@ -75,7 +78,10 @@ int mac_selinux_init(const char *prefix) {
+         if (label_hnd)
+                 return 0;
+ 
++#ifdef HAVE_MALLINFO
+         before_mallinfo = mallinfo();
++#endif
++
+         before_timestamp = now(CLOCK_MONOTONIC);
+ 
+         if (prefix) {
+@@ -92,9 +98,14 @@ int mac_selinux_init(const char *prefix) {
+                 r = security_getenforce() == 1 ? -errno : 0;
+         } else  {
+                 char timespan[FORMAT_TIMESPAN_MAX];
++
++#ifdef HAVE_MALLINFO
+                 int l;
++#endif
+ 
+                 after_timestamp = now(CLOCK_MONOTONIC);
++
++#ifdef HAVE_MALLINFO
+                 after_mallinfo = mallinfo();
+ 
+                 l = after_mallinfo.uordblks > before_mallinfo.uordblks ? after_mallinfo.uordblks - before_mallinfo.uordblks : 0;
+@@ -102,6 +113,10 @@ int mac_selinux_init(const char *prefix) {
+                 log_debug("Successfully loaded SELinux database in %s, size on heap is %iK.",
+                           format_timespan(timespan, sizeof(timespan), after_timestamp - before_timestamp, 0),
+                           (l+1023)/1024);
++#else
++                log_debug("Successfully loaded SELinux database in %s",
++                          format_timespan(timespan, sizeof(timespan), after_timestamp - before_timestamp, 0));
++#endif
+         }
+ #endif
+ 
+-- 
+2.4.3
+
diff --git a/package/eudev/0003-build-sys-check-for-strndupa.patch b/package/eudev/0003-build-sys-check-for-strndupa.patch
new file mode 100644
index 0000000..9cbd585
--- /dev/null
+++ b/package/eudev/0003-build-sys-check-for-strndupa.patch
@@ -0,0 +1,69 @@
+From 0b04a8347981ceb1030768c3002ac3c2bc0a0bf1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Thu, 30 Jul 2015 17:31:31 +0200
+Subject: [PATCH] build-sys: check for strndupa
+
+strndupa is a GNU extension, therefore it's not available
+for all libc libraries (musl).
+
+This patch is based on the one proposed by Emil Renner Berthing for
+systemd [1].
+
+[1] http://lists.freedesktop.org/archives/systemd-devel/2014-September/023190.html
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac              |  3 ++-
+ src/shared/missing.h      | 11 +++++++++++
+ src/shared/selinux-util.c |  1 +
+ 3 files changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4a293b2..9c383c2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -66,8 +66,9 @@ AC_C_INLINE
+ AC_TYPE_MODE_T
+ AC_TYPE_PID_T
+ AC_CHECK_MEMBERS([struct stat.st_rdev])
+-AC_CHECK_DECLS([getrandom, gettid, name_to_handle_at, accept4, mkostemp], [], [], [[#include <sys/types.h>
++AC_CHECK_DECLS([getrandom, gettid, name_to_handle_at, accept4, mkostemp, strndupa], [], [], [[#include <sys/types.h>
+ #include <unistd.h>
++#include <string.h>
+ #include <sys/mount.h>
+ #include <fcntl.h>
+ #include <sys/socket.h>
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index 2dc9d84..9031119 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -158,3 +158,14 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+ #ifndef AT_EMPTY_PATH
+ #define AT_EMPTY_PATH 0x1000
+ #endif
++
++#if !HAVE_DECL_STRNDUPA
++#define strndupa(s, n) \
++  ({ \
++    const char *__old = (s); \
++    size_t __len = strnlen(__old, (n)); \
++    char *__new = (char *)alloca(__len + 1); \
++    __new[__len] = '\0'; \
++    (char *)memcpy(__new, __old, __len); \
++  })
++#endif
+diff --git a/src/shared/selinux-util.c b/src/shared/selinux-util.c
+index 4e0866b..a18a5a7 100644
+--- a/src/shared/selinux-util.c
++++ b/src/shared/selinux-util.c
+@@ -31,6 +31,7 @@
+ #include "strv.h"
+ #include "path-util.h"
+ #include "selinux-util.h"
++#include "missing.h"
+ 
+ #ifdef HAVE_SELINUX
+ DEFINE_TRIVIAL_CLEANUP_FUNC(security_context_t, freecon);
+-- 
+2.4.3
+
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index f587acd..b916acd 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -11,6 +11,11 @@ EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
 EUDEV_INSTALL_STAGING = YES
 
+# configure.ac is patched by:
+# 0002-build-sys-check-for-mallinfo.patch
+# 0003-build-sys-check-for-strndupa.patch
+EUDEV_AUTORECONF = YES
+
 # mq_getattr is in librt
 EUDEV_CONF_ENV += LIBS=-lrt
 
