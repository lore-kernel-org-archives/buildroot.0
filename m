From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:21:56 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: fix musl build
Message-ID: <20160207142258.F006F80462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1cffb454320aeba80a56985ecfc44c3c1d293802
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build errors in previous version which are still present
http://autobuild.buildroot.net/results/879/879260f0efc80c2c9061d89d3e99ad107083f72a/
http://autobuild.buildroot.net/results/1e5/1e5f6a5f349800226d8b07601dab68ffe7794461/
http://autobuild.buildroot.net/results/0f8/0f8d68b11c6807a9d1d4c40a66430ac096902720/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Romain Naour <romain.naour@gmail.com>

[Thomas:
 - Rework patch 0001-padsp-Make-it-compile-on-musl.patch to put
   Bernd's comment and SoB *after* the original commit log.
 - Rework patch 0002-musl-fixes.patch for the same reason, and also to
   remove the xlocale.h part, which has already been fixed upstream.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-padsp-Make-it-compile-on-musl.patch       | 75 ++++++++++++++++++++++
 package/pulseaudio/0002-musl-fixes.patch           | 41 ++++++++++++
 package/pulseaudio/pulseaudio.mk                   |  2 +
 3 files changed, 118 insertions(+)

diff --git a/package/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch b/package/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
new file mode 100644
index 0000000..19842fa
--- /dev/null
+++ b/package/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
@@ -0,0 +1,75 @@
+From f6ab3c3aa7a1841c8add04828029356d2a8c88e7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Apr 2015 21:56:31 -0700
+Subject: [PATCH] padsp: Make it compile on musl
+
+break assumptions on glibc and there is no stat64 on non
+glibc C libraries
+
+See pulseaudio bug
+
+https://bugs.freedesktop.org/show_bug.cgi?id=85319
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+[Bernd: taken from
+http://git.alpinelinux.org/cgit/aports/tree/testing/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch,
+adjusted paths.]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+---
+ src/utils/padsp.c | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/utils/padsp.c b/src/utils/padsp.c
+index e61373c..684721a 100644
+--- a/src/utils/padsp.c
++++ b/src/utils/padsp.c
+@@ -2368,7 +2368,7 @@ fail:
+     return ret;
+ }
+ 
+-#ifdef sun
++#ifndef __GLIBC__
+ int ioctl(int fd, int request, ...) {
+ #else
+ int ioctl(int fd, unsigned long request, ...) {
+@@ -2508,10 +2508,13 @@ int stat(const char *pathname, struct stat *buf) {
+ 
+     return 0;
+ }
+-
+ #ifdef HAVE_OPEN64
+-
++#undef stat64
++#ifdef __GLIBC__
+ int stat64(const char *pathname, struct stat64 *buf) {
++#else
++int stat64(const char *pathname, struct stat *buf) {
++#endif
+     struct stat oldbuf;
+     int ret;
+ 
+@@ -2544,7 +2547,7 @@ int stat64(const char *pathname, struct stat64 *buf) {
+ 
+     return 0;
+ }
+-
++#undef open64
+ int open64(const char *filename, int flags, ...) {
+     va_list args;
+     mode_t mode = 0;
+@@ -2670,8 +2673,8 @@ FILE* fopen(const char *filename, const char *mode) {
+ }
+ 
+ #ifdef HAVE_OPEN64
+-
+-FILE *fopen64(const char *filename, const char *mode) {
++#undef fopen64
++FILE *fopen64(const char *__restrict filename, const char *__restrict mode) {
+ 
+     debug(DEBUG_LEVEL_VERBOSE, __FILE__": fopen64(%s)\n", filename?filename:"NULL");
+ 
+-- 
+2.1.4
+
diff --git a/package/pulseaudio/0002-musl-fixes.patch b/package/pulseaudio/0002-musl-fixes.patch
new file mode 100644
index 0000000..fedb3a0
--- /dev/null
+++ b/package/pulseaudio/0002-musl-fixes.patch
@@ -0,0 +1,41 @@
+Portability fixes for musl taken from voidlinux:
+
+- _WORDIZE is declared in <bits/user.h> via <sys/user.h>.
+
+	--xtraeme
+
+[Bernd: Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/testing/pulseaudio/musl-fixes.patch
+and adjusted paths.]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Thomas: remove xlocale.h part, it was fixed upstream.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+--- a/configure.ac.orig	2015-09-24 11:36:06.107661526 +0200
++++ b/configure.ac	2015-09-24 11:36:40.420036775 +0200
+@@ -407,7 +407,7 @@ AC_HEADER_STDC
+ # POSIX
+ AC_CHECK_HEADERS_ONCE([arpa/inet.h glob.h grp.h netdb.h netinet/in.h \
+     netinet/in_systm.h netinet/tcp.h poll.h pwd.h sched.h \
+-    sys/mman.h sys/select.h sys/socket.h sys/wait.h \
++    sys/mman.h sys/select.h sys/socket.h sys/wait.h sys/user.h \
+     sys/uio.h syslog.h sys/dl.h dlfcn.h linux/sockios.h])
+ AC_CHECK_HEADERS([netinet/ip.h], [], [],
+                  [#include <sys/types.h>
+--- a/src/pulsecore/sample-util.h.orig	2015-09-24 11:37:57.773677238 +0200
++++ b/src/pulsecore/sample-util.h	2015-09-24 11:38:46.668208677 +0200
+@@ -24,6 +24,14 @@
+ #include <inttypes.h>
+ #include <limits.h>
+ 
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#ifdef HAVE_SYS_USER_H
++#include <sys/user.h>	/* required by _WORDIZE with musl */
++#endif
++
+ #include <pulse/gccmacro.h>
+ #include <pulse/sample.h>
+ #include <pulse/volume.h>
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 86bbb2f..c51e1d7 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -7,6 +7,8 @@
 PULSEAUDIO_VERSION = 8.0
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
+# 0002-musl-fixes.patch patches configure.ac
+PULSEAUDIO_AUTORECONF = YES
 PULSEAUDIO_INSTALL_STAGING = YES
 PULSEAUDIO_LICENSE = LGPLv2.1+ (specific license for modules, see LICENSE file)
 PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
