From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:16 -0000
Subject: [Buildroot] [git commit] package/pulseaudio: only define
 memfd_create() if not already defined
Message-ID: <20180305200711.112B6810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e14eea82acb4cf95f0064afa2c98c27a0fc97269
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before glibc version 2.27 there was no wrapper for memfd_create(2).

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ers-only-define-memfd_create-if-not-alrea.patch | 64 ++++++++++++++++++++++
 package/pulseaudio/pulseaudio.mk                   |  3 +
 2 files changed, 67 insertions(+)

diff --git a/package/pulseaudio/0002-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch b/package/pulseaudio/0002-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
new file mode 100644
index 0000000000..8f103bf201
--- /dev/null
+++ b/package/pulseaudio/0002-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
@@ -0,0 +1,64 @@
+From dfb0460fb4743aec047cdf755a660a9ac2d0f3fb Mon Sep 17 00:00:00 2001
+From: Tanu Kaskinen <tanuk@iki.fi>
+Date: Wed, 24 Jan 2018 03:51:49 +0200
+Subject: [PATCH] memfd-wrappers: only define memfd_create() if not already
+ defined
+
+glibc 2.27 is to be released soon, and it will provide memfd_create().
+If glibc provides the function, we must not define it ourselves,
+otherwise building fails due to conflict between the two implementations
+of the same function.
+
+BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=104733
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ configure.ac                   | 3 +++
+ src/pulsecore/memfd-wrappers.h | 7 ++++---
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0084c86e..0eb44b08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -610,6 +610,9 @@ AS_IF([test "x$enable_memfd" = "xyes" && test "x$HAVE_MEMFD" = "x0"],
+     [AC_MSG_ERROR([*** Your Linux kernel does not support memfd shared memory.
+                   *** Use linux v3.17 or higher for such a feature.])])
+ 
++AS_IF([test "x$HAVE_MEMFD" = "x1"],
++    AC_CHECK_FUNCS([memfd_create]))
++
+ AC_SUBST(HAVE_MEMFD)
+ AM_CONDITIONAL([HAVE_MEMFD], [test "x$HAVE_MEMFD" = x1])
+ AS_IF([test "x$HAVE_MEMFD" = "x1"], AC_DEFINE([HAVE_MEMFD], 1, [Have memfd shared memory.]))
+diff --git a/src/pulsecore/memfd-wrappers.h b/src/pulsecore/memfd-wrappers.h
+index 3bed9b2b..c7aadfd3 100644
+--- a/src/pulsecore/memfd-wrappers.h
++++ b/src/pulsecore/memfd-wrappers.h
+@@ -20,13 +20,14 @@
+   License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
+-#ifdef HAVE_MEMFD
++#if defined(HAVE_MEMFD) && !defined(HAVE_MEMFD_CREATE)
+ 
+ #include <sys/syscall.h>
+ #include <fcntl.h>
+ 
+ /*
+- * No glibc wrappers exist for memfd_create(2), so provide our own.
++ * Before glibc version 2.27 there was no wrapper for memfd_create(2),
++ * so we have to provide our own.
+  *
+  * Also define memfd fcntl sealing macros. While they are already
+  * defined in the kernel header file <linux/fcntl.h>, that file as
+@@ -63,6 +64,6 @@ static inline int memfd_create(const char *name, unsigned int flags) {
+ #define F_SEAL_WRITE    0x0008  /* prevent writes */
+ #endif
+ 
+-#endif /* HAVE_MEMFD */
++#endif /* HAVE_MEMFD && !HAVE_MEMFD_CREATE */
+ 
+ #endif
+-- 
+2.14.3
+
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 13fcec52a3..f59828d43d 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -15,6 +15,9 @@ PULSEAUDIO_CONF_OPTS = \
 	--disable-legacy-database-entry-format \
 	--disable-manpages
 
+# 0001-memfd-wrappers-only-define-memfd_create-if-not-alrea.patch
+PULSEAUDIO_AUTORECONF = YES
+
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
