From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 22:57:40 +0200
Subject: [Buildroot] [git commit] package/libcap-ng: bump to version 0.7.11
Message-ID: <20200902161639.4CD5885EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf776ee995ecf667405b46bf5dc3057b46ea5fe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version) and so autoreconf
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-compilation-without-pthread.h.patch   | 47 ----------------------
 package/libcap-ng/libcap-ng.hash                   |  6 +--
 package/libcap-ng/libcap-ng.mk                     |  4 +-
 3 files changed, 4 insertions(+), 53 deletions(-)

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
index f8342ea928..d1c7034c08 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 4a1532bcf3731aade40936f6d6a586ed5a66ca4c7455e1338d1f6c3e09221328 libcap-ng-0.7.9.tar.gz
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 COPYING
-sha256 f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa COPYING.LIB
+sha256  85815c711862d01a440db471f12fba462c9949e923966f5859607e652d9c0ae9  libcap-ng-0.7.11.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 102b472d1a..914a72333b 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.7.9
+LIBCAP_NG_VERSION = 0.7.11
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_INSTALL_STAGING = YES
-# 0001-Fix-compilation-without-pthread.h.patch
-LIBCAP_NG_AUTORECONF = YES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python
