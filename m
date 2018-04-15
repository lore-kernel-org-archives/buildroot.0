From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 20:56:08 +0200
Subject: [Buildroot] [git commit] libcap-ng: fix compilation without
 pthread.h
Message-ID: <20180415190242.74ADD813BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=131cf9bf4b599e71d8621189b2b49fbb11c15649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/6132f33fb282fda3c39deb292784b9006c9e7872

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Thomas: add missing AUTORECONF = YES, since we're now patching
configure.ac]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-compilation-without-pthread.h.patch   | 47 ++++++++++++++++++++++
 package/libcap-ng/libcap-ng.mk                     |  2 +
 2 files changed, 49 insertions(+)

diff --git a/package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch b/package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch
new file mode 100644
index 0000000000..eb91d40631
--- /dev/null
+++ b/package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch
@@ -0,0 +1,47 @@
+From 1d28cf070933568db8006ce45411723c5369e145 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 10 Apr 2018 19:54:50 +0200
+Subject: [PATCH] Fix compilation without pthread.h
+
+Commit 7759e6f8469eb33aef1a1d5eba5d300c3a8fcb63 broke compilation on
+systems without pthread.h. So add a call to AC_CHECK_HEADERS in
+configure.ac and put include <pthread.h> under HAVE_PTHREAD_H define
+
+Fixes:
+ - http://autobuild.buildroot.net/results/6132f33fb282fda3c39deb292784b9006c9e7872
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 1 +
+ src/cap-ng.c | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 7a99c72..4d6afee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,6 +56,7 @@ AC_CHECK_HEADERS(sys/xattr.h, [], [
+ 	AC_CHECK_HEADERS(attr/xattr.h, [], [AC_MSG_WARN(attr/xattr.h not found, disabling file system capabilities.)])
+ 	])
+ AC_CHECK_HEADERS(linux/securebits.h, [], [])
++AC_CHECK_HEADERS(pthread.h, [], [AC_MSG_WARN(pthread.h not found, disabling pthread_atfork.)])
+ 
+ AC_C_CONST
+ AC_C_INLINE
+diff --git a/src/cap-ng.c b/src/cap-ng.c
+index db647fd..240d2ba 100644
+--- a/src/cap-ng.c
++++ b/src/cap-ng.c
+@@ -34,7 +34,9 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <byteswap.h>
++#ifdef HAVE_PTHREAD_H
+ #include <pthread.h>	// For pthread_atfork
++#endif
+ #ifdef HAVE_SYSCALL_H
+ #include <sys/syscall.h>
+ #endif
+-- 
+2.14.1
+
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 990c675018..0f29ef0972 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -9,6 +9,8 @@ LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
+# 0001-Fix-compilation-without-pthread.h.patch
+LIBCAP_NG_AUTORECONF = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python
