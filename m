From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Jun 2018 21:42:00 +0200
Subject: [Buildroot] [git commit] package/pulseaudio: bump version to 12.0
Message-ID: <20180621194030.1030E81469@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08c7b77803285440f7370db1c0e321266390fe6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.freedesktop.org/wiki/Software/PulseAudio/Notes/12.0/

Added license hashes, removed all patches after being applied upstream:
https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=66885ad633db0f371693475c72133e91f1e09ee5
https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=dfb0460fb4743aec047cdf755a660a9ac2d0f3fb

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-padsp-Make-it-compile-on-musl.patch       | 75 ----------------------
 ...ers-only-define-memfd_create-if-not-alrea.patch | 64 ------------------
 package/pulseaudio/pulseaudio.hash                 | 11 ++--
 package/pulseaudio/pulseaudio.mk                   |  2 +-
 4 files changed, 8 insertions(+), 144 deletions(-)

diff --git a/package/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch b/package/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
deleted file mode 100644
index 19842fadf0..0000000000
--- a/package/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From f6ab3c3aa7a1841c8add04828029356d2a8c88e7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Apr 2015 21:56:31 -0700
-Subject: [PATCH] padsp: Make it compile on musl
-
-break assumptions on glibc and there is no stat64 on non
-glibc C libraries
-
-See pulseaudio bug
-
-https://bugs.freedesktop.org/show_bug.cgi?id=85319
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-[Bernd: taken from
-http://git.alpinelinux.org/cgit/aports/tree/testing/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch,
-adjusted paths.]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
----
- src/utils/padsp.c | 15 +++++++++------
- 1 file changed, 9 insertions(+), 6 deletions(-)
-
-diff --git a/src/utils/padsp.c b/src/utils/padsp.c
-index e61373c..684721a 100644
---- a/src/utils/padsp.c
-+++ b/src/utils/padsp.c
-@@ -2368,7 +2368,7 @@ fail:
-     return ret;
- }
- 
--#ifdef sun
-+#ifndef __GLIBC__
- int ioctl(int fd, int request, ...) {
- #else
- int ioctl(int fd, unsigned long request, ...) {
-@@ -2508,10 +2508,13 @@ int stat(const char *pathname, struct stat *buf) {
- 
-     return 0;
- }
--
- #ifdef HAVE_OPEN64
--
-+#undef stat64
-+#ifdef __GLIBC__
- int stat64(const char *pathname, struct stat64 *buf) {
-+#else
-+int stat64(const char *pathname, struct stat *buf) {
-+#endif
-     struct stat oldbuf;
-     int ret;
- 
-@@ -2544,7 +2547,7 @@ int stat64(const char *pathname, struct stat64 *buf) {
- 
-     return 0;
- }
--
-+#undef open64
- int open64(const char *filename, int flags, ...) {
-     va_list args;
-     mode_t mode = 0;
-@@ -2670,8 +2673,8 @@ FILE* fopen(const char *filename, const char *mode) {
- }
- 
- #ifdef HAVE_OPEN64
--
--FILE *fopen64(const char *filename, const char *mode) {
-+#undef fopen64
-+FILE *fopen64(const char *__restrict filename, const char *__restrict mode) {
- 
-     debug(DEBUG_LEVEL_VERBOSE, __FILE__": fopen64(%s)\n", filename?filename:"NULL");
- 
--- 
-2.1.4
-
diff --git a/package/pulseaudio/0002-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch b/package/pulseaudio/0002-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
deleted file mode 100644
index 8f103bf201..0000000000
--- a/package/pulseaudio/0002-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From dfb0460fb4743aec047cdf755a660a9ac2d0f3fb Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Wed, 24 Jan 2018 03:51:49 +0200
-Subject: [PATCH] memfd-wrappers: only define memfd_create() if not already
- defined
-
-glibc 2.27 is to be released soon, and it will provide memfd_create().
-If glibc provides the function, we must not define it ourselves,
-otherwise building fails due to conflict between the two implementations
-of the same function.
-
-BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=104733
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- configure.ac                   | 3 +++
- src/pulsecore/memfd-wrappers.h | 7 ++++---
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0084c86e..0eb44b08 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -610,6 +610,9 @@ AS_IF([test "x$enable_memfd" = "xyes" && test "x$HAVE_MEMFD" = "x0"],
-     [AC_MSG_ERROR([*** Your Linux kernel does not support memfd shared memory.
-                   *** Use linux v3.17 or higher for such a feature.])])
- 
-+AS_IF([test "x$HAVE_MEMFD" = "x1"],
-+    AC_CHECK_FUNCS([memfd_create]))
-+
- AC_SUBST(HAVE_MEMFD)
- AM_CONDITIONAL([HAVE_MEMFD], [test "x$HAVE_MEMFD" = x1])
- AS_IF([test "x$HAVE_MEMFD" = "x1"], AC_DEFINE([HAVE_MEMFD], 1, [Have memfd shared memory.]))
-diff --git a/src/pulsecore/memfd-wrappers.h b/src/pulsecore/memfd-wrappers.h
-index 3bed9b2b..c7aadfd3 100644
---- a/src/pulsecore/memfd-wrappers.h
-+++ b/src/pulsecore/memfd-wrappers.h
-@@ -20,13 +20,14 @@
-   License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
- ***/
- 
--#ifdef HAVE_MEMFD
-+#if defined(HAVE_MEMFD) && !defined(HAVE_MEMFD_CREATE)
- 
- #include <sys/syscall.h>
- #include <fcntl.h>
- 
- /*
-- * No glibc wrappers exist for memfd_create(2), so provide our own.
-+ * Before glibc version 2.27 there was no wrapper for memfd_create(2),
-+ * so we have to provide our own.
-  *
-  * Also define memfd fcntl sealing macros. While they are already
-  * defined in the kernel header file <linux/fcntl.h>, that file as
-@@ -63,6 +64,6 @@ static inline int memfd_create(const char *name, unsigned int flags) {
- #define F_SEAL_WRITE    0x0008  /* prevent writes */
- #endif
- 
--#endif /* HAVE_MEMFD */
-+#endif /* HAVE_MEMFD && !HAVE_MEMFD_CREATE */
- 
- #endif
--- 
-2.14.3
-
diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 7e59afdf9a..f10ed82e90 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,5 +1,8 @@
-# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2017-September/028733.html
-md5 390de38231d5cdd6b43ada8939eb74f1  pulseaudio-11.1.tar.xz
-sha1 53bde72b6bfe715c19b1519db8845f7a58346b67  pulseaudio-11.1.tar.xz
+# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-June/030091.html
+md5 efe7683310080e80bc42707285df8c36  pulseaudio-12.0.tar.xz
+sha1 9b0dcd62ae4c24542e13644e5fac3de5b13d6db7  pulseaudio-12.0.tar.xz
 # Locally computed
-sha256 f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e  pulseaudio-11.1.tar.xz
+sha256 6e422dbdc9fd11c0cb6af869e5eda73dc24a8be3c14725440edd51ce6b464444  pulseaudio/pulseaudio-12.0.tar.xz
+sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
+sha256 a1064b9838b6b4feee61eaeb0925da4b4834c984b77716558860c4294ed6c015  LICENSE
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index f59828d43d..1f6bab2e3d 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 11.1
+PULSEAUDIO_VERSION = 12.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
