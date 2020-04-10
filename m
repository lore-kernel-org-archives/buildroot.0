From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Apr 2020 13:33:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcap-ng: bump version to 0.7.10
Message-ID: <20200410113317.2417536-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changelog: http://people.redhat.com/sgrubb/libcap-ng/ChangeLog

Removed patch applied upstream:
https://github.com/stevegrubb/libcap-ng/commit/1b8a7c9fdd500c74e96a9f6ab5f0a035b1d29aa1

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...01-Fix-compilation-without-pthread.h.patch | 47 -------------------
 package/libcap-ng/libcap-ng.hash              |  2 +-
 package/libcap-ng/libcap-ng.mk                |  4 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch

diff --git a/package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch b/package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch
deleted file mode 100644
index eb91d40631..0000000000
--- a/package/libcap-ng/0001-Fix-compilation-without-pthread.h.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 1d28cf070933568db8006ce45411723c5369e145 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 10 Apr 2018 19:54:50 +0200
-Subject: [PATCH] Fix compilation without pthread.h
-
-Commit 7759e6f8469eb33aef1a1d5eba5d300c3a8fcb63 broke compilation on
-systems without pthread.h. So add a call to AC_CHECK_HEADERS in
-configure.ac and put include <pthread.h> under HAVE_PTHREAD_H define
-
-Fixes:
- - http://autobuild.buildroot.net/results/6132f33fb282fda3c39deb292784b9006c9e7872
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 1 +
- src/cap-ng.c | 2 ++
- 2 files changed, 3 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 7a99c72..4d6afee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -56,6 +56,7 @@ AC_CHECK_HEADERS(sys/xattr.h, [], [
- 	AC_CHECK_HEADERS(attr/xattr.h, [], [AC_MSG_WARN(attr/xattr.h not found, disabling file system capabilities.)])
- 	])
- AC_CHECK_HEADERS(linux/securebits.h, [], [])
-+AC_CHECK_HEADERS(pthread.h, [], [AC_MSG_WARN(pthread.h not found, disabling pthread_atfork.)])
- 
- AC_C_CONST
- AC_C_INLINE
-diff --git a/src/cap-ng.c b/src/cap-ng.c
-index db647fd..240d2ba 100644
---- a/src/cap-ng.c
-+++ b/src/cap-ng.c
-@@ -34,7 +34,9 @@
- #include <errno.h>
- #include <fcntl.h>
- #include <byteswap.h>
-+#ifdef HAVE_PTHREAD_H
- #include <pthread.h>	// For pthread_atfork
-+#endif
- #ifdef HAVE_SYSCALL_H
- #include <sys/syscall.h>
- #endif
--- 
-2.14.1
-
diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index f8342ea928..883438e8ea 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 4a1532bcf3731aade40936f6d6a586ed5a66ca4c7455e1338d1f6c3e09221328 libcap-ng-0.7.9.tar.gz
+sha256 a84ca7b4e0444283ed269b7a29f5b6187f647c82e2b876636b49b9a744f0ffbf libcap-ng-0.7.10.tar.gz
 sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
 sha256 f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 0f29ef0972..ce63dd407f 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.7.9
+LIBCAP_NG_VERSION = 0.7.10
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
-# 0001-Fix-compilation-without-pthread.h.patch
-LIBCAP_NG_AUTORECONF = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python
-- 
2.25.0
