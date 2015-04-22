From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:14:00 +0200
Subject: [Buildroot] [git commit] package/zeromq: enable kernel-based
	feature flags
Message-ID: <20150422201409.D115881D82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d2448e46d48809e110cf0d347dd5c845c20eaa7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current configuration system does not check for cached variables for
these flags, and thus they are always disabled when cross-compiling.
This patch fixes the configuration system to use cached variables and
enables them at configuration time.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e.m4-make-kernel-specific-flags-cacheable.patch |  199 ++++++++++++++++++++
 package/zeromq/zeromq.mk                           |   10 +
 2 files changed, 209 insertions(+), 0 deletions(-)

diff --git a/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch b/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
new file mode 100644
index 0000000..ff225d3
--- /dev/null
+++ b/package/zeromq/0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
@@ -0,0 +1,199 @@
+commit 9daf6dd7c4947ce74ca729de5c3cfe8cbc304702
+Author: Lionel Orry <lionel.orry@gmail.com>
+Date:   Fri Feb 6 15:11:07 2015 +0100
+
+    acinclude.m4: make kernel-specific flags cacheable
+    
+    Specifically when cross-compiling, one can be willing to force these
+    variable values using the environment of a config.cache file. This
+    commit makes this possible.
+    
+    The affected variables are:
+    
+    * libzmq_cv_sock_cloexec
+    * libzmq_cv_so_keepalive
+    * libzmq_cv_tcp_keepcnt
+    * libzmq_cv_tcp_keepidle
+    * libzmq_cv_tcp_keepintvl
+    * libzmq_cv_tcp_keepalive
+    
+    Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 4bbd19e..456740d 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -586,8 +586,8 @@ dnl # LIBZMQ_CHECK_SOCK_CLOEXEC([action-if-found], [action-if-not-found])
+ dnl # Check if SOCK_CLOEXEC is supported                                           #
+ dnl ################################################################################
+ AC_DEFUN([LIBZMQ_CHECK_SOCK_CLOEXEC], [{
+-    AC_MSG_CHECKING(whether SOCK_CLOEXEC is supported)
+-    AC_TRY_RUN([/* SOCK_CLOEXEC test */
++    AC_CACHE_CHECK([whether SOCK_CLOEXEC is supported], [libzmq_cv_sock_cloexec],
++        [AC_TRY_RUN([/* SOCK_CLOEXEC test */
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ 
+@@ -596,11 +596,13 @@ int main (int argc, char *argv [])
+     int s = socket (PF_INET, SOCK_STREAM | SOCK_CLOEXEC, 0);
+     return (s == -1);
+ }
+-    ],
+-    [AC_MSG_RESULT(yes) ; libzmq_cv_sock_cloexec="yes" ; $1],
+-    [AC_MSG_RESULT(no)  ; libzmq_cv_sock_cloexec="no"  ; $2],
+-    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_sock_cloexec="no"]
++        ],
++        [libzmq_cv_sock_cloexec="yes"],
++        [libzmq_cv_sock_cloexec="no"],
++        [libzmq_cv_sock_cloexec="not during cross-compile"]
++        )]
+     )
++    AS_IF([test "x$libzmq_cv_sock_cloexec" = "xyes"], [$1], [$2])
+ }])
+ 
+ dnl ################################################################################
+@@ -628,8 +630,8 @@ dnl # LIBZMQ_CHECK_SO_KEEPALIVE([action-if-found], [action-if-not-found])
+ dnl # Check if SO_KEEPALIVE is supported                                           #
+ dnl ################################################################################
+ AC_DEFUN([LIBZMQ_CHECK_SO_KEEPALIVE], [{
+-    AC_MSG_CHECKING(whether SO_KEEPALIVE is supported)
+-    AC_TRY_RUN([/* SO_KEEPALIVE test */
++    AC_CACHE_CHECK([whether SO_KEEPALIVE is supported], [libzmq_cv_so_keepalive],
++        [AC_TRY_RUN([/* SO_KEEPALIVE test */
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ 
+@@ -641,11 +643,13 @@ int main (int argc, char *argv [])
+         ((rc = setsockopt (s, SOL_SOCKET, SO_KEEPALIVE, (char*) &opt, sizeof (int))) == -1)
+     );
+ }
+-    ],
+-    [AC_MSG_RESULT(yes) ; libzmq_cv_so_keepalive="yes" ; $1],
+-    [AC_MSG_RESULT(no)  ; libzmq_cv_so_keepalive="no"  ; $2],
+-    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_so_keepalive="no"]
++        ],
++        [libzmq_cv_so_keepalive="yes"],
++        [libzmq_cv_so_keepalive="no"],
++        [libzmq_cv_so_keepalive="not during cross-compile"]
++        )]
+     )
++    AS_IF([test "x$libzmq_cv_so_keepalive" = "xyes"], [$1], [$2])
+ }])
+ 
+ dnl ################################################################################
+@@ -653,8 +657,8 @@ dnl # LIBZMQ_CHECK_TCP_KEEPCNT([action-if-found], [action-if-not-found])
+ dnl # Check if TCP_KEEPCNT is supported                                            #
+ dnl ################################################################################
+ AC_DEFUN([LIBZMQ_CHECK_TCP_KEEPCNT], [{
+-    AC_MSG_CHECKING(whether TCP_KEEPCNT is supported)
+-    AC_TRY_RUN([/* TCP_KEEPCNT test */
++    AC_CACHE_CHECK([whether TCP_KEEPCNT is supported], [libzmq_cv_tcp_keepcnt],
++        [AC_TRY_RUN([/* TCP_KEEPCNT test */
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+@@ -669,11 +673,13 @@ int main (int argc, char *argv [])
+         ((rc = setsockopt (s, IPPROTO_TCP, TCP_KEEPCNT, (char*) &opt, sizeof (int))) == -1)
+     );
+ }
+-    ],
+-    [AC_MSG_RESULT(yes) ; libzmq_cv_tcp_keepcnt="yes" ; $1],
+-    [AC_MSG_RESULT(no)  ; libzmq_cv_tcp_keepcnt="no"  ; $2],
+-    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_tcp_keepcnt="no"]
++        ],
++        [libzmq_cv_tcp_keepcnt="yes"],
++        [libzmq_cv_tcp_keepcnt="no"],
++        [libzmq_cv_tcp_keepcnt="not during cross-compile"]
++        )]
+     )
++    AS_IF([test "x$libzmq_cv_tcp_keepcnt" = "xyes"], [$1], [$2])
+ }])
+ 
+ dnl ################################################################################
+@@ -681,8 +687,8 @@ dnl # LIBZMQ_CHECK_TCP_KEEPIDLE([action-if-found], [action-if-not-found])
+ dnl # Check if TCP_KEEPIDLE is supported                                           #
+ dnl ################################################################################
+ AC_DEFUN([LIBZMQ_CHECK_TCP_KEEPIDLE], [{
+-    AC_MSG_CHECKING(whether TCP_KEEPIDLE is supported)
+-    AC_TRY_RUN([/* TCP_KEEPIDLE test */
++    AC_CACHE_CHECK([whether TCP_KEEPIDLE is supported], [libzmq_cv_tcp_keepidle],
++        [AC_TRY_RUN([/* TCP_KEEPIDLE test */
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+@@ -697,11 +703,13 @@ int main (int argc, char *argv [])
+         ((rc = setsockopt (s, IPPROTO_TCP, TCP_KEEPIDLE, (char*) &opt, sizeof (int))) == -1)
+     );
+ }
+-    ],
+-    [AC_MSG_RESULT(yes) ; libzmq_cv_tcp_keepidle="yes" ; $1],
+-    [AC_MSG_RESULT(no)  ; libzmq_cv_tcp_keepidle="no"  ; $2],
+-    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_tcp_keepidle="no"]
++        ],
++        [libzmq_cv_tcp_keepidle="yes"],
++        [libzmq_cv_tcp_keepidle="no"],
++        [libzmq_cv_tcp_keepidle="not during cross-compile"]
++        )]
+     )
++    AS_IF([test "x$libzmq_cv_tcp_keepidle" = "xyes"], [$1], [$2])
+ }])
+ 
+ dnl ################################################################################
+@@ -709,8 +717,8 @@ dnl # LIBZMQ_CHECK_TCP_KEEPINTVL([action-if-found], [action-if-not-found])
+ dnl # Check if TCP_KEEPINTVL is supported                                           #
+ dnl ################################################################################
+ AC_DEFUN([LIBZMQ_CHECK_TCP_KEEPINTVL], [{
+-    AC_MSG_CHECKING(whether TCP_KEEPINTVL is supported)
+-    AC_TRY_RUN([/* TCP_KEEPINTVL test */
++    AC_CACHE_CHECK([whether TCP_KEEPINTVL is supported], [libzmq_cv_tcp_keepintvl],
++        [AC_TRY_RUN([/* TCP_KEEPINTVL test */
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+@@ -725,11 +733,13 @@ int main (int argc, char *argv [])
+         ((rc = setsockopt (s, IPPROTO_TCP, TCP_KEEPINTVL, (char*) &opt, sizeof (int))) == -1)
+     );
+ }
+-    ],
+-    [AC_MSG_RESULT(yes) ; libzmq_cv_tcp_keepintvl="yes" ; $1],
+-    [AC_MSG_RESULT(no)  ; libzmq_cv_tcp_keepintvl="no"  ; $2],
+-    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_tcp_keepintvl="no"]
++        ],
++        [libzmq_cv_tcp_keepintvl="yes"],
++        [libzmq_cv_tcp_keepintvl="no"],
++        [libzmq_cv_tcp_keepintvl="not during cross-compile"]
++        )]
+     )
++    AS_IF([test "x$libzmq_cv_tcp_keepintvl" = "xyes"], [$1], [$2])
+ }])
+ 
+ dnl ################################################################################
+@@ -737,8 +747,8 @@ dnl # LIBZMQ_CHECK_TCP_KEEPALIVE([action-if-found], [action-if-not-found])
+ dnl # Check if TCP_KEEPALIVE is supported                                          #
+ dnl ################################################################################
+ AC_DEFUN([LIBZMQ_CHECK_TCP_KEEPALIVE], [{
+-    AC_MSG_CHECKING(whether TCP_KEEPALIVE is supported)
+-    AC_TRY_RUN([/* TCP_KEEPALIVE test */
++    AC_CACHE_CHECK([whether TCP_KEEPALIVE is supported], [libzmq_cv_tcp_keepalive],
++        [AC_TRY_RUN([/* TCP_KEEPALIVE test */
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+@@ -753,11 +763,13 @@ int main (int argc, char *argv [])
+         ((rc = setsockopt (s, IPPROTO_TCP, TCP_KEEPALIVE, (char*) &opt, sizeof (int))) == -1)
+     );
+ }
+-    ],
+-    [AC_MSG_RESULT(yes) ; libzmq_cv_tcp_keepalive="yes" ; $1],
+-    [AC_MSG_RESULT(no)  ; libzmq_cv_tcp_keepalive="no"  ; $2],
+-    [AC_MSG_RESULT(not during cross-compile) ; libzmq_cv_tcp_keepalive="no"]
++        ],
++        [libzmq_cv_tcp_keepalive="yes"],
++        [libzmq_cv_tcp_keepalive="no"],
++        [libzmq_cv_tcp_keepalive="not during cross-compile"]
++        )]
+     )
++    AS_IF([test "x$libzmq_cv_tcp_keepalive" = "xyes"], [$1], [$2])
+ }])
+ 
+ dnl ################################################################################
diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index dbd6fc7..7e9ed19 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -11,8 +11,18 @@ ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_LICENSE = LGPLv3+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
 # For 0001-tests-disable-test_fork-if-fork-is-not-available.patch
+# and 0002-acinclude.m4-make-kernel-specific-flags-cacheable.patch
 ZEROMQ_AUTORECONF = YES
 
+# Assume these flags are always available. It is true, at least for
+# SOCK_CLOEXEC, since linux v2.6.27.
+# Note: the flag TCP_KEEPALIVE is NOT available so we do not include it.
+ZEROMQ_CONF_ENV = libzmq_cv_sock_cloexec=yes \
+	libzmq_cv_so_keepalive=yes \
+	libzmq_cv_tcp_keepcnt=yes \
+	libzmq_cv_tcp_keepidle=yes \
+	libzmq_cv_tcp_keepintvl=yes
+
 # Only tools/curve_keygen.c needs this, but it doesn't hurt to pass it
 # for the rest of the build as well (which automatically includes stdc++).
 ifeq ($(BR2_STATIC_LIBS),y)
