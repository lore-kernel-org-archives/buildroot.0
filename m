From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 31 Jul 2015 21:13:42 +0200
Subject: [Buildroot] [RFC] package/pulseaudio: fix musl build
Message-ID: <1438370022-25257-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pulseaudio doesn't build properly on musl due to
a OSS wrapper called padsp. It provide a software OSS
interface on systems without OSS.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
Patches not upstreamed yet.
---
 .../pulseaudio/0001-fix-__WORDSIZE-warning.patch   |  46 +++++++++
 ...fix-warning-when-__GLIBC__-is-not-defined.patch |  29 ++++++
 .../pulseaudio/0003-add-posix-ioctl-check.patch    |  72 ++++++++++++++
 .../0004-avoid-stat64-redifinition-with-musl.patch | 107 +++++++++++++++++++++
 package/pulseaudio/0005-undef-fopen64.patch        |  36 +++++++
 package/pulseaudio/pulseaudio.mk                   |   3 +
 6 files changed, 293 insertions(+)
 create mode 100644 package/pulseaudio/0001-fix-__WORDSIZE-warning.patch
 create mode 100644 package/pulseaudio/0002-fix-warning-when-__GLIBC__-is-not-defined.patch
 create mode 100644 package/pulseaudio/0003-add-posix-ioctl-check.patch
 create mode 100644 package/pulseaudio/0004-avoid-stat64-redifinition-with-musl.patch
 create mode 100644 package/pulseaudio/0005-undef-fopen64.patch

diff --git a/package/pulseaudio/0001-fix-__WORDSIZE-warning.patch b/package/pulseaudio/0001-fix-__WORDSIZE-warning.patch
new file mode 100644
index 0000000..6b4f929
--- /dev/null
+++ b/package/pulseaudio/0001-fix-__WORDSIZE-warning.patch
@@ -0,0 +1,46 @@
+From d296d83b601ab5394d16d021787c0708710ef668 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 29 Jul 2015 21:18:03 +0200
+Subject: [PATCH 1/5] fix __WORDSIZE warning
+
+src/tests/mult-s16-test.c and src/pulsecore/sample-util.h uses
+the glibc-specific internal macro __WORDSIZE
+
+On musl this macro is defined in sys/reg.h
+
+Related to:
+https://bugs.freedesktop.org/show_bug.cgi?id=90880
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/pulsecore/sample-util.h | 1 +
+ src/tests/mult-s16-test.c   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/pulsecore/sample-util.h b/src/pulsecore/sample-util.h
+index 7e7fb92..4b183fa 100644
+--- a/src/pulsecore/sample-util.h
++++ b/src/pulsecore/sample-util.h
+@@ -25,6 +25,7 @@
+ 
+ #include <inttypes.h>
+ #include <limits.h>
++#include <sys/reg.h>
+ 
+ #include <pulse/gccmacro.h>
+ #include <pulse/sample.h>
+diff --git a/src/tests/mult-s16-test.c b/src/tests/mult-s16-test.c
+index 931866a..d0f3ca3 100644
+--- a/src/tests/mult-s16-test.c
++++ b/src/tests/mult-s16-test.c
+@@ -25,6 +25,7 @@
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <math.h>
++#include <sys/reg.h>
+ 
+ #include <pulse/rtclock.h>
+ #include <pulsecore/random.h>
+-- 
+2.4.3
+
diff --git a/package/pulseaudio/0002-fix-warning-when-__GLIBC__-is-not-defined.patch b/package/pulseaudio/0002-fix-warning-when-__GLIBC__-is-not-defined.patch
new file mode 100644
index 0000000..8e7a0c7
--- /dev/null
+++ b/package/pulseaudio/0002-fix-warning-when-__GLIBC__-is-not-defined.patch
@@ -0,0 +1,29 @@
+From 47f215ce18ef17c6748c4fcc94e8b7c0245ac2b7 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 29 Jul 2015 21:25:37 +0200
+Subject: [PATCH 2/5] fix warning when __GLIBC__ is not defined
+
+__GLIBC__ must be defined before testing the glibc version
+with (__GLIBC__ <= 2 && __GLIBC_MINOR__ <= 2).
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/daemon/caps.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/daemon/caps.c b/src/daemon/caps.c
+index 669d6e2..a9cf7d4 100644
+--- a/src/daemon/caps.c
++++ b/src/daemon/caps.c
+@@ -39,7 +39,7 @@
+ #include "caps.h"
+ 
+ /* Glibc <= 2.2 has broken unistd.h */
+-#if defined(__linux__) && (__GLIBC__ <= 2 && __GLIBC_MINOR__ <= 2)
++#if defined(__linux__) && defined(__GLIBC__) && (__GLIBC__ <= 2 && __GLIBC_MINOR__ <= 2)
+ int setresgid(gid_t r, gid_t e, gid_t s);
+ int setresuid(uid_t r, uid_t e, uid_t s);
+ #endif
+-- 
+2.4.3
+
diff --git a/package/pulseaudio/0003-add-posix-ioctl-check.patch b/package/pulseaudio/0003-add-posix-ioctl-check.patch
new file mode 100644
index 0000000..f0b5751
--- /dev/null
+++ b/package/pulseaudio/0003-add-posix-ioctl-check.patch
@@ -0,0 +1,72 @@
+From e751085b1fd141ceb6c6256cd24273aac27f122c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 29 Jul 2015 22:13:25 +0200
+Subject: [PATCH 3/5] add posix ioctl check
+
+The POSIX specification specifies the ioctl(int, int, ...) prototype:
+http://pubs.opengroup.org/onlinepubs/9699919799/functions/ioctl.html
+
+So the padsp ioctl reimplantation must follow the posix prototype if
+ioctl(int, unsigned long, ...) is not available in the libc.
+
+The chech is based on the Eric Blake's proposal found in autoconf
+mailing list [1].
+
+This should fix the bug #85319:
+https://bugs.freedesktop.org/show_bug.cgi?id=85319
+
+[1] http://lists.gnu.org/archive/html/autoconf/2014-04/msg00020.html
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac      | 20 ++++++++++++++++++++
+ src/utils/padsp.c |  2 +-
+ 2 files changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4854711..2b4508e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -432,6 +432,26 @@ AC_CHECK_HEADERS_ONCE([sys/atomic.h])
+ 
+ # Other
+ AC_CHECK_HEADERS_ONCE([sys/ioctl.h])
++
++# With Glibc ioctl takes an 'unsigned long' instead of the POSIX 'int'
++# for the second parameter.
++AC_CACHE_CHECK([for ioctl with POSIX signature],
++    [gl_cv_func_ioctl_posix_signature],
++    [AC_COMPILE_IFELSE(
++        [AC_LANG_PROGRAM(
++        [[#include <sys/ioctl.h>]],
++        [[extern
++            #ifdef __cplusplus
++            "C"
++            #endif
++            int ioctl (int, int, ...);
++        ]])
++        ],
++        [gl_cv_func_ioctl_posix_signature=yes],
++        [gl_cv_func_ioctl_posix_signature=no])
++    ])
++AS_IF([test "x$gl_cv_func_ioctl_posix_signature" = "xyes"], AC_DEFINE([HAVE_POSIX_IOCTL], 1, [Have a POSIX ioctl?]))
++
+ AC_CHECK_HEADERS_ONCE([byteswap.h])
+ AC_CHECK_HEADERS_ONCE([sys/syscall.h])
+ AC_CHECK_HEADERS_ONCE([sys/eventfd.h])
+diff --git a/src/utils/padsp.c b/src/utils/padsp.c
+index b5250b3..d0dc765 100644
+--- a/src/utils/padsp.c
++++ b/src/utils/padsp.c
+@@ -2370,7 +2370,7 @@ fail:
+     return ret;
+ }
+ 
+-#ifdef sun
++#ifdef HAVE_POSIX_IOCTL
+ int ioctl(int fd, int request, ...) {
+ #else
+ int ioctl(int fd, unsigned long request, ...) {
+-- 
+2.4.3
+
diff --git a/package/pulseaudio/0004-avoid-stat64-redifinition-with-musl.patch b/package/pulseaudio/0004-avoid-stat64-redifinition-with-musl.patch
new file mode 100644
index 0000000..ebfacb0
--- /dev/null
+++ b/package/pulseaudio/0004-avoid-stat64-redifinition-with-musl.patch
@@ -0,0 +1,107 @@
+From b1e8f150900b5ae8135678333dac5a4d61cf7218 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 29 Jul 2015 23:38:06 +0200
+Subject: [PATCH 4/5] avoid stat64 redifinition with musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+musl define stat64() as an alias to stat(), this leads to a
+stat() function redefinition.
+
+On Glibc stat64() is an alias to __xstat64() which is has an
+hidden prototype, that is why stat64() can be defined in padsp.c.
+
+stat64 can't be undef since it's also the name of the type
+"struct stat64".
+
+Rename padsp stat64() to _stat64(), also rename the function
+pointer _stat64 to __stat64.
+
+Fixes:
+In file included from utils/padsp.c:40:0:
+utils/padsp.c:2516:5: error: redefinition of ?stat?
+ int stat64(const char *pathname, struct stat64 *buf) {
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/utils/padsp.c | 20 ++++++++++++--------
+ 1 file changed, 12 insertions(+), 8 deletions(-)
+
+diff --git a/src/utils/padsp.c b/src/utils/padsp.c
+index d0dc765..cf01c3a 100644
+--- a/src/utils/padsp.c
++++ b/src/utils/padsp.c
+@@ -110,6 +110,10 @@ struct fd_info {
+ static int dsp_drain(fd_info *i);
+ static void fd_info_remove_from_list(fd_info *i);
+ 
++#ifdef HAVE_OPEN64
++int _stat64(const char *pathname, struct stat64 *buf);
++#endif
++
+ static pthread_mutex_t fd_infos_mutex = PTHREAD_MUTEX_INITIALIZER;
+ static pthread_mutex_t func_mutex = PTHREAD_MUTEX_INITIALIZER;
+ 
+@@ -128,7 +132,7 @@ static int (*___xstat)(int, const char *, struct stat *) = NULL;
+ static int (*_open64)(const char *, int, mode_t) = NULL;
+ static int (*___open64_2)(const char *, int) = NULL;
+ static FILE* (*_fopen64)(const char *path, const char *mode) = NULL;
+-static int (*_stat64)(const char *, struct stat64 *) = NULL;
++static int (*__stat64)(const char *, struct stat64 *) = NULL;
+ #ifdef _STAT_VER
+ static int (*___xstat64)(int, const char *, struct stat64 *) = NULL;
+ #endif
+@@ -210,8 +214,8 @@ do { \
+ #define LOAD_STAT64_FUNC() \
+ do { \
+     pthread_mutex_lock(&func_mutex); \
+-    if (!_stat64) \
+-        _stat64 = (int (*)(const char *, struct stat64 *)) dlsym_fn(RTLD_NEXT, "stat64"); \
++    if (!__stat64) \
++        __stat64 = (int (*)(const char *, struct stat64 *)) dlsym_fn(RTLD_NEXT, "stat64"); \
+     pthread_mutex_unlock(&func_mutex); \
+ } while(0)
+ 
+@@ -2483,7 +2487,7 @@ int stat(const char *pathname, struct stat *buf) {
+ #endif
+ #else
+ #ifdef HAVE_OPEN64
+-    ret = stat64("/dev", &parent);
++    ret = _stat64("/dev", &parent);
+ #else
+     ret = stat("/dev", &parent);
+ #endif
+@@ -2513,17 +2517,17 @@ int stat(const char *pathname, struct stat *buf) {
+ 
+ #ifdef HAVE_OPEN64
+ 
+-int stat64(const char *pathname, struct stat64 *buf) {
++int _stat64(const char *pathname, struct stat64 *buf) {
+     struct stat oldbuf;
+     int ret;
+ 
+-    debug(DEBUG_LEVEL_VERBOSE, __FILE__": stat64(%s)\n", pathname?pathname:"NULL");
++    debug(DEBUG_LEVEL_VERBOSE, __FILE__": _stat64(%s)\n", pathname?pathname:"NULL");
+ 
+     if (!pathname ||
+         !buf ||
+         !is_audio_device_node(pathname)) {
+         LOAD_STAT64_FUNC();
+-        return _stat64(pathname, buf);
++        return __stat64(pathname, buf);
+     }
+ 
+     ret = stat(pathname, &oldbuf);
+@@ -2623,7 +2627,7 @@ int __xstat64(int ver, const char *pathname, struct stat64 *buf) {
+         return -1;
+     }
+ 
+-    return stat64(pathname, buf);
++    return _stat64(pathname, buf);
+ }
+ 
+ #endif
+-- 
+2.4.3
+
diff --git a/package/pulseaudio/0005-undef-fopen64.patch b/package/pulseaudio/0005-undef-fopen64.patch
new file mode 100644
index 0000000..5ebcae9
--- /dev/null
+++ b/package/pulseaudio/0005-undef-fopen64.patch
@@ -0,0 +1,36 @@
+From fa2db4605942f301ff4a2bfa28bc8e7f8a9c9ec4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Wed, 29 Jul 2015 23:45:00 +0200
+Subject: [PATCH 5/5] undef fopen64
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+musl define fopen64 as an alias of fopen, this leads to a
+fopen() function redefinition.
+
+Fixes:
+In file included from utils/padsp.c:46:0:
+utils/padsp.c:2680:7: error: redefinition of ?fopen?
+ FILE *fopen64(const char *filename, const char *mode) {
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ src/utils/padsp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/utils/padsp.c b/src/utils/padsp.c
+index cf01c3a..ac594d9 100644
+--- a/src/utils/padsp.c
++++ b/src/utils/padsp.c
+@@ -63,6 +63,7 @@
+ /* make sure gcc doesn't redefine open and friends as macros */
+ #undef open
+ #undef open64
++#undef fopen64
+ 
+ typedef enum {
+     FD_INFO_MIXER,
+-- 
+2.4.3
+
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 0fcfe38..fc854c9 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -16,6 +16,9 @@ PULSEAUDIO_CONF_OPTS = \
 	--disable-legacy-database-entry-format \
 	--disable-manpages
 
+# configure.ac is patched by 0003-add-posix-ioctl-check.patch
+PULSEAUDIO_AUTORECONF = YES
+
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool json-c libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
-- 
2.4.3
