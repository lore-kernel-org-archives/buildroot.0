From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat,  7 Apr 2018 10:29:09 +0300
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.2.5
Message-ID: <20180407072909.25962-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the ZEROMQ_SITE with the active repository.
Remove the two patches because they were both applied on zeromq.
As a result, the ZEROMQ_AUTORECONF was removed.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 ...e.m4-make-kernel-specific-flags-cacheable.patch | 199 ---------------------
 ...q-Fix-pkg-config-files-for-static-linking.patch |  29 ---
 package/zeromq/zeromq.hash                         |   9 +-
 package/zeromq/zeromq.mk                           |   6 +-
 4 files changed, 7 insertions(+), 236 deletions(-)
 delete mode 100644 package/zeromq/0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
 delete mode 100644 package/zeromq/0002-libzmq-Fix-pkg-config-files-for-static-linking.patch

diff --git a/package/zeromq/0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch b/package/zeromq/0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
deleted file mode 100644
index ff225d3592..0000000000
--- a/package/zeromq/0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
+++ /dev/null
@@ -1,199 +0,0 @@
-commit 9daf6dd7c4947ce74ca729de5c3cfe8cbc304702
-Author: Lionel Orry <lionel.orry@gmail.com>
-Date:   Fri Feb 6 15:11:07 2015 +0100
-
-    acinclude.m4: make kernel-specific flags cacheable
-    
-    Specifically when cross-compiling, one can be willing to force these
-    variable values using the environment of a config.cache file. This
-    commit makes this possible.
-    
-    The affected variables are:
-    
-    * libzmq_cv_sock_cloexec
-    * libzmq_cv_so_keepalive
-    * libzmq_cv_tcp_keepcnt
-    * libzmq_cv_tcp_keepidle
-    * libzmq_cv_tcp_keepintvl
-    * libzmq_cv_tcp_keepalive
-    
-    Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
-
-diff --git a/acinclude.m4 b/acinclude.m4
-index 4bbd19e..456740d 100644
---- a/acinclude.m4
-+++ b/acinclude.m4
-@@ -586,8 +586,8 @@ dnl # LIBZMQ_CHECK_SOCK_CLOEXEC([action-if-found], [action-if-not-found])
- dnl # Check if SOCK_CLOEXEC is supported                                           #
- dnl ################################################################################
- AC_DEFUN([LIBZMQ_CHECK_SOCK_CLOEXEC], [{
--    AC_MSG_CHECKING(whether SOCK_CLOEXEC is supported)
--    AC_TRY_RUN([/* SOCK_CLOEXEC test */
-+    AC_CACHE_CHECK([whether SOCK_CLOEXEC is supported], [libzmq_cv_sock_cloexec],
-+        [AC_TRY_RUN([/* SOCK_CLOEXEC test */
- #include <sys/types.h>
- #include <sys/socket.h>
- 
-@@ -596,11 +596,13 @@ int main (int argc, char *argv [])
-     int s = socket (PF_INET, SOCK_STREAM | SOCK_CLOEXEC, 0);
-     return (s == -1);
- }
--    ],
--    [AC_MSG_RESULT(yes) ; libzmq_cv_sock_cloexec="yes" ; $1],
--    [AC_MSG_RESULT(no)  ; libzmq_cv_sock_cloexec="no"  ; $2],
--    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_sock_cloexec="no"]
-+        ],
-+        [libzmq_cv_sock_cloexec="yes"],
-+        [libzmq_cv_sock_cloexec="no"],
-+        [libzmq_cv_sock_cloexec="not during cross-compile"]
-+        )]
-     )
-+    AS_IF([test "x$libzmq_cv_sock_cloexec" = "xyes"], [$1], [$2])
- }])
- 
- dnl ################################################################################
-@@ -628,8 +630,8 @@ dnl # LIBZMQ_CHECK_SO_KEEPALIVE([action-if-found], [action-if-not-found])
- dnl # Check if SO_KEEPALIVE is supported                                           #
- dnl ################################################################################
- AC_DEFUN([LIBZMQ_CHECK_SO_KEEPALIVE], [{
--    AC_MSG_CHECKING(whether SO_KEEPALIVE is supported)
--    AC_TRY_RUN([/* SO_KEEPALIVE test */
-+    AC_CACHE_CHECK([whether SO_KEEPALIVE is supported], [libzmq_cv_so_keepalive],
-+        [AC_TRY_RUN([/* SO_KEEPALIVE test */
- #include <sys/types.h>
- #include <sys/socket.h>
- 
-@@ -641,11 +643,13 @@ int main (int argc, char *argv [])
-         ((rc = setsockopt (s, SOL_SOCKET, SO_KEEPALIVE, (char*) &opt, sizeof (int))) == -1)
-     );
- }
--    ],
--    [AC_MSG_RESULT(yes) ; libzmq_cv_so_keepalive="yes" ; $1],
--    [AC_MSG_RESULT(no)  ; libzmq_cv_so_keepalive="no"  ; $2],
--    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_so_keepalive="no"]
-+        ],
-+        [libzmq_cv_so_keepalive="yes"],
-+        [libzmq_cv_so_keepalive="no"],
-+        [libzmq_cv_so_keepalive="not during cross-compile"]
-+        )]
-     )
-+    AS_IF([test "x$libzmq_cv_so_keepalive" = "xyes"], [$1], [$2])
- }])
- 
- dnl ################################################################################
-@@ -653,8 +657,8 @@ dnl # LIBZMQ_CHECK_TCP_KEEPCNT([action-if-found], [action-if-not-found])
- dnl # Check if TCP_KEEPCNT is supported                                            #
- dnl ################################################################################
- AC_DEFUN([LIBZMQ_CHECK_TCP_KEEPCNT], [{
--    AC_MSG_CHECKING(whether TCP_KEEPCNT is supported)
--    AC_TRY_RUN([/* TCP_KEEPCNT test */
-+    AC_CACHE_CHECK([whether TCP_KEEPCNT is supported], [libzmq_cv_tcp_keepcnt],
-+        [AC_TRY_RUN([/* TCP_KEEPCNT test */
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
-@@ -669,11 +673,13 @@ int main (int argc, char *argv [])
-         ((rc = setsockopt (s, IPPROTO_TCP, TCP_KEEPCNT, (char*) &opt, sizeof (int))) == -1)
-     );
- }
--    ],
--    [AC_MSG_RESULT(yes) ; libzmq_cv_tcp_keepcnt="yes" ; $1],
--    [AC_MSG_RESULT(no)  ; libzmq_cv_tcp_keepcnt="no"  ; $2],
--    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_tcp_keepcnt="no"]
-+        ],
-+        [libzmq_cv_tcp_keepcnt="yes"],
-+        [libzmq_cv_tcp_keepcnt="no"],
-+        [libzmq_cv_tcp_keepcnt="not during cross-compile"]
-+        )]
-     )
-+    AS_IF([test "x$libzmq_cv_tcp_keepcnt" = "xyes"], [$1], [$2])
- }])
- 
- dnl ################################################################################
-@@ -681,8 +687,8 @@ dnl # LIBZMQ_CHECK_TCP_KEEPIDLE([action-if-found], [action-if-not-found])
- dnl # Check if TCP_KEEPIDLE is supported                                           #
- dnl ################################################################################
- AC_DEFUN([LIBZMQ_CHECK_TCP_KEEPIDLE], [{
--    AC_MSG_CHECKING(whether TCP_KEEPIDLE is supported)
--    AC_TRY_RUN([/* TCP_KEEPIDLE test */
-+    AC_CACHE_CHECK([whether TCP_KEEPIDLE is supported], [libzmq_cv_tcp_keepidle],
-+        [AC_TRY_RUN([/* TCP_KEEPIDLE test */
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
-@@ -697,11 +703,13 @@ int main (int argc, char *argv [])
-         ((rc = setsockopt (s, IPPROTO_TCP, TCP_KEEPIDLE, (char*) &opt, sizeof (int))) == -1)
-     );
- }
--    ],
--    [AC_MSG_RESULT(yes) ; libzmq_cv_tcp_keepidle="yes" ; $1],
--    [AC_MSG_RESULT(no)  ; libzmq_cv_tcp_keepidle="no"  ; $2],
--    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_tcp_keepidle="no"]
-+        ],
-+        [libzmq_cv_tcp_keepidle="yes"],
-+        [libzmq_cv_tcp_keepidle="no"],
-+        [libzmq_cv_tcp_keepidle="not during cross-compile"]
-+        )]
-     )
-+    AS_IF([test "x$libzmq_cv_tcp_keepidle" = "xyes"], [$1], [$2])
- }])
- 
- dnl ################################################################################
-@@ -709,8 +717,8 @@ dnl # LIBZMQ_CHECK_TCP_KEEPINTVL([action-if-found], [action-if-not-found])
- dnl # Check if TCP_KEEPINTVL is supported                                           #
- dnl ################################################################################
- AC_DEFUN([LIBZMQ_CHECK_TCP_KEEPINTVL], [{
--    AC_MSG_CHECKING(whether TCP_KEEPINTVL is supported)
--    AC_TRY_RUN([/* TCP_KEEPINTVL test */
-+    AC_CACHE_CHECK([whether TCP_KEEPINTVL is supported], [libzmq_cv_tcp_keepintvl],
-+        [AC_TRY_RUN([/* TCP_KEEPINTVL test */
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
-@@ -725,11 +733,13 @@ int main (int argc, char *argv [])
-         ((rc = setsockopt (s, IPPROTO_TCP, TCP_KEEPINTVL, (char*) &opt, sizeof (int))) == -1)
-     );
- }
--    ],
--    [AC_MSG_RESULT(yes) ; libzmq_cv_tcp_keepintvl="yes" ; $1],
--    [AC_MSG_RESULT(no)  ; libzmq_cv_tcp_keepintvl="no"  ; $2],
--    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_tcp_keepintvl="no"]
-+        ],
-+        [libzmq_cv_tcp_keepintvl="yes"],
-+        [libzmq_cv_tcp_keepintvl="no"],
-+        [libzmq_cv_tcp_keepintvl="not during cross-compile"]
-+        )]
-     )
-+    AS_IF([test "x$libzmq_cv_tcp_keepintvl" = "xyes"], [$1], [$2])
- }])
- 
- dnl ################################################################################
-@@ -737,8 +747,8 @@ dnl # LIBZMQ_CHECK_TCP_KEEPALIVE([action-if-found], [action-if-not-found])
- dnl # Check if TCP_KEEPALIVE is supported                                          #
- dnl ################################################################################
- AC_DEFUN([LIBZMQ_CHECK_TCP_KEEPALIVE], [{
--    AC_MSG_CHECKING(whether TCP_KEEPALIVE is supported)
--    AC_TRY_RUN([/* TCP_KEEPALIVE test */
-+    AC_CACHE_CHECK([whether TCP_KEEPALIVE is supported], [libzmq_cv_tcp_keepalive],
-+        [AC_TRY_RUN([/* TCP_KEEPALIVE test */
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <netinet/in.h>
-@@ -753,11 +763,13 @@ int main (int argc, char *argv [])
-         ((rc = setsockopt (s, IPPROTO_TCP, TCP_KEEPALIVE, (char*) &opt, sizeof (int))) == -1)
-     );
- }
--    ],
--    [AC_MSG_RESULT(yes) ; libzmq_cv_tcp_keepalive="yes" ; $1],
--    [AC_MSG_RESULT(no)  ; libzmq_cv_tcp_keepalive="no"  ; $2],
--    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_tcp_keepalive="no"]
-+        ],
-+        [libzmq_cv_tcp_keepalive="yes"],
-+        [libzmq_cv_tcp_keepalive="no"],
-+        [libzmq_cv_tcp_keepalive="not during cross-compile"]
-+        )]
-     )
-+    AS_IF([test "x$libzmq_cv_tcp_keepalive" = "xyes"], [$1], [$2])
- }])
- 
- dnl ################################################################################
diff --git a/package/zeromq/0002-libzmq-Fix-pkg-config-files-for-static-linking.patch b/package/zeromq/0002-libzmq-Fix-pkg-config-files-for-static-linking.patch
deleted file mode 100644
index 11acec26ae..0000000000
--- a/package/zeromq/0002-libzmq-Fix-pkg-config-files-for-static-linking.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e89577d30c278fba0f9e40266ceb6fb2821907d5 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Wed, 13 May 2015 08:01:34 +0200
-Subject: [PATCH] libzmq: Fix pkg-config files for static linking
-
-Libzmq uses C++ standard library features, so users of it should link
-against that as well when statically linking.
-
-Add it to Libs.private so users using pkg-config automatically gets the
-correct linker flags.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/libzmq.pc.in       | 1 +
- 1 file changed, 1 insertions(+)
-
-diff --git a/src/libzmq.pc.in b/src/libzmq.pc.in
-index ba155a3..52a39f7 100644
---- a/src/libzmq.pc.in
-+++ b/src/libzmq.pc.in
-@@ -7,4 +7,5 @@ Name: libzmq
- Description: 0MQ c++ library
- Version: @VERSION@
- Libs: -L${libdir} -lzmq
-+Libs.private: -lstdc++
- Cflags: -I${includedir}
--- 
-2.1.4
-
diff --git a/package/zeromq/zeromq.hash b/package/zeromq/zeromq.hash
index 486656e429..86380c0295 100644
--- a/package/zeromq/zeromq.hash
+++ b/package/zeromq/zeromq.hash
@@ -1,4 +1,5 @@
-# From https://github.com/zeromq/zeromq4-1/releases
-sha1 b956df8c6f77c174683b51fbee67f99c94945651  zeromq-4.1.6.tar.gz
-# Calculated based on the hash above
-sha256 02ebf60a43011e770799336365bcbce2eb85569e9b5f52aa0d8cc04672438a0a  zeromq-4.1.6.tar.gz
+# From https://github.com/zeromq/libzmq/releases
+md5  a1c95b34384257e986842f4d006957b8  zeromq-4.2.5.tar.gz
+sha1 1132f839d703486c4ee1cf22f056585dfbb329c2  zeromq-4.2.5.tar.gz
+# Locally computed
+sha256 cc9090ba35713d59bb2f7d7965f877036c49c5558ea0c290b0dcc6f2a17e489f  zeromq-4.2.5.tar.gz
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index caf5643718..debaf413b4 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,15 +4,13 @@
 #
 ################################################################################
 
-ZEROMQ_VERSION = 4.1.6
-ZEROMQ_SITE = https://github.com/zeromq/zeromq4-1/releases/download/v$(ZEROMQ_VERSION)
+ZEROMQ_VERSION = 4.2.5
+ZEROMQ_SITE = https://github.com/zeromq/libzmq/releases/download/v$(ZEROMQ_VERSION)
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
-# For 0001-acinclude.m4-make-kernel-specific-flags-cacheable.patch
-ZEROMQ_AUTORECONF = YES
 
 # Assume these flags are always available. It is true, at least for
 # SOCK_CLOEXEC, since linux v2.6.27.
-- 
2.16.2
