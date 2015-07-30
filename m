From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 30 Jul 2015 18:01:38 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/eudev: fix build with musl +
	libselinux
In-Reply-To: <1438272098-28557-1-git-send-email-romain.naour@openwide.fr>
References: <1438272098-28557-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438272098-28557-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to disable mallinfo statistics with musl toolchains
which doesn't have struct mallinfo.

Fixes:
selinux-util.c: In function ?mac_selinux_init?:
selinux-util.c:70:25: error: storage size of ?before_mallinfo? isn?t known
         struct mallinfo before_mallinfo, after_mallinfo;

Add a second patch for strndupa() which is a GNU extension.

Fixes:
./.libs/libudev-core.a(selinux-util.o): In function `mac_selinux_bind':
selinux-util.c:(.text+0xd94): undefined reference to `strndupa'
collect2: error: ld returned 1 exit status

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Cc: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
v2: new patch
---
 .../eudev/0002-build-sys-check-for-mallinfo.patch  | 85 ++++++++++++++++++++++
 .../eudev/0003-build-sys-check-for-strndupa.patch  | 69 ++++++++++++++++++
 package/eudev/eudev.mk                             |  5 ++
 3 files changed, 159 insertions(+)
 create mode 100644 package/eudev/0002-build-sys-check-for-mallinfo.patch
 create mode 100644 package/eudev/0003-build-sys-check-for-strndupa.patch

diff --git a/package/eudev/0002-build-sys-check-for-mallinfo.patch b/package/eudev/0002-build-sys-check-for-mallinfo.patch
new file mode 100644
index 0000000..5189a06
--- /dev/null
+++ b/package/eudev/0002-build-sys-check-for-mallinfo.patch
@@ -0,0 +1,85 @@
+From a1e904cbad7e52d4eb079e7dff37d5affe67895b Mon Sep 17 00:00:00 2001
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
+selinux-util.c: In function ?mac_selinux_init?:
+selinux-util.c:70:25: error: storage size of ?before_mallinfo? isn?t known
+         struct mallinfo before_mallinfo, after_mallinfo;
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac              | 3 +++
+ src/shared/selinux-util.c | 8 ++++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index ec23ab5..4889b91 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -226,6 +226,9 @@ else
+ fi
+ AC_SUBST(sushell)
+ 
++# selinux-util.c use struct mallinfo which is not available for all C libraries (musl).
++AC_CHECK_FUNCS([mallinfo])
++
+ # ------------------------------------------------------------------------------
+ 
+ AC_CHECK_DECL([unshare],
+diff --git a/src/shared/selinux-util.c b/src/shared/selinux-util.c
+index 756215e..c811235 100644
+--- a/src/shared/selinux-util.c
++++ b/src/shared/selinux-util.c
+@@ -66,8 +66,10 @@ int mac_selinux_init(const char *prefix) {
+         int r = 0;
+ 
+ #ifdef HAVE_SELINUX
++#ifdef HAVE_MALLINFO
+         usec_t before_timestamp, after_timestamp;
+         struct mallinfo before_mallinfo, after_mallinfo;
++#endif
+ 
+         if (!mac_selinux_use())
+                 return 0;
+@@ -75,8 +77,10 @@ int mac_selinux_init(const char *prefix) {
+         if (label_hnd)
+                 return 0;
+ 
++#ifdef HAVE_MALLINFO
+         before_mallinfo = mallinfo();
+         before_timestamp = now(CLOCK_MONOTONIC);
++#endif
+ 
+         if (prefix) {
+                 struct selinux_opt options[] = {
+@@ -91,6 +95,7 @@ int mac_selinux_init(const char *prefix) {
+                 log_enforcing("Failed to initialize SELinux context: %m");
+                 r = security_getenforce() == 1 ? -errno : 0;
+         } else  {
++#ifdef HAVE_MALLINFO
+                 char timespan[FORMAT_TIMESPAN_MAX];
+                 int l;
+ 
+@@ -102,6 +107,9 @@ int mac_selinux_init(const char *prefix) {
+                 log_debug("Successfully loaded SELinux database in %s, size on heap is %iK.",
+                           format_timespan(timespan, sizeof(timespan), after_timestamp - before_timestamp, 0),
+                           (l+1023)/1024);
++#else
++                log_debug("Successfully loaded SELinux database");
++#endif
+         }
+ #endif
+ 
+-- 
+2.4.3
+
diff --git a/package/eudev/0003-build-sys-check-for-strndupa.patch b/package/eudev/0003-build-sys-check-for-strndupa.patch
new file mode 100644
index 0000000..f52b1b1
--- /dev/null
+++ b/package/eudev/0003-build-sys-check-for-strndupa.patch
@@ -0,0 +1,69 @@
+From ce46a29b2cd24e7565ece28fbbab89f1afa780b2 Mon Sep 17 00:00:00 2001
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
+index 4889b91..075123e 100644
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
+index c811235..69b3948 100644
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
 
-- 
2.4.3
