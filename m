From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 24 Mar 2015 17:41:27 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: Fix incorrect use of AC_EGREP_CPP.
Message-ID: <1427215287-28980-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using 'AC_EGREP_CPP(yes' without restraining the pattern always return
true if it runs from a path containing the string 'yes'.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 ...04-erts-fix-incorrect-use-of-ac-egrep-cpp.patch | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)
 create mode 100644 package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch

diff --git a/package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch b/package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch
new file mode 100644
index 0000000..ca5a88d
--- /dev/null
+++ b/package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch
@@ -0,0 +1,117 @@
+diff -uprN erlang-17.4.orig/aclocal.m4 erlang-17.4.fixed/aclocal.m4
+--- erlang-17.4.orig/aclocal.m4	2015-03-24 14:42:36.176568511 +0100
++++ erlang-17.4.fixed/aclocal.m4	2015-03-24 14:59:22.463659414 +0100
+@@ -559,7 +559,7 @@ dnl
+ 
+ AC_DEFUN(LM_SYS_MULTICAST,
+ [AC_CACHE_CHECK([for multicast support], ac_cv_sys_multicast_support,
+-[AC_EGREP_CPP(yes,
++[AC_EGREP_CPP(^yes$,
+ [#include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+diff -uprN erlang-17.4.orig/erts/aclocal.m4 erlang-17.4.fixed/erts/aclocal.m4
+--- erlang-17.4.orig/erts/aclocal.m4	2015-03-24 14:42:36.904562066 +0100
++++ erlang-17.4.fixed/erts/aclocal.m4	2015-03-24 14:59:55.563366368 +0100
+@@ -559,7 +559,7 @@ dnl
+ 
+ AC_DEFUN(LM_SYS_MULTICAST,
+ [AC_CACHE_CHECK([for multicast support], ac_cv_sys_multicast_support,
+-[AC_EGREP_CPP(yes,
++[AC_EGREP_CPP(^yes$,
+ [#include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+diff -uprN erlang-17.4.orig/erts/configure.in erlang-17.4.fixed/erts/configure.in
+--- erlang-17.4.orig/erts/configure.in	2015-03-24 14:42:36.800562987 +0100
++++ erlang-17.4.fixed/erts/configure.in	2015-03-24 15:05:25.441505273 +0100
+@@ -1555,10 +1555,11 @@ if test "$have_gethostbyname_r" = yes; t
+ 				    [Define to flavour of gethostbyname_r]))
+ 		;;
+ 		*)
+-			AC_EGREP_CPP(yes,[#include <stdio.h>
+-			  #ifdef __GLIBC__
+-			  yes
+-			  #endif
++			AC_EGREP_CPP(^yes$,[
++#include <stdio.h>
++#ifdef __GLIBC__
++yes
++#endif
+ 			  ], AC_DEFINE(HAVE_GETHOSTBYNAME_R, GHBN_R_GLIBC,
+ 				[Define to flavour of gethostbyname_r]))
+ 		;;
+@@ -4303,10 +4304,10 @@ case "$erl_xcomp_without_sysroot-$with_s
+ 			SSL_INCLUDE="-I$dir/include"
+ 			old_CPPFLAGS=$CPPFLAGS
+ 			CPPFLAGS=$SSL_INCLUDE
+-			AC_EGREP_CPP(yes,[
++			AC_EGREP_CPP(^yes$,[
+ #include <openssl/opensslv.h>
+ #if OPENSSL_VERSION_NUMBER >= 0x0090700fL
+-  yes
++yes
+ #endif
+ 			],[
+ 			ssl_found=yes
+@@ -4501,10 +4502,10 @@ if test "x$SSL_APP" != "x" ; then
+     AC_MSG_CHECKING(for OpenSSL kerberos 5 support)
+     old_CPPFLAGS=$CPPFLAGS
+     CPPFLAGS=$SSL_INCLUDE
+-    AC_EGREP_CPP(yes,[
++    AC_EGREP_CPP(^yes$,[
+ #include <openssl/opensslconf.h>
+ #ifndef OPENSSL_NO_KRB5
+-  yes
++yes
+ #endif
+       ],[
+       AC_MSG_RESULT([yes])
+diff -uprN erlang-17.4.orig/lib/erl_interface/aclocal.m4 erlang-17.4.fixed/lib/erl_interface/aclocal.m4
+--- erlang-17.4.orig/lib/erl_interface/aclocal.m4	2015-03-24 14:42:33.828589299 +0100
++++ erlang-17.4.fixed/lib/erl_interface/aclocal.m4	2015-03-24 15:07:07.057508803 +0100
+@@ -559,7 +559,7 @@ dnl
+ 
+ AC_DEFUN(LM_SYS_MULTICAST,
+ [AC_CACHE_CHECK([for multicast support], ac_cv_sys_multicast_support,
+-[AC_EGREP_CPP(yes,
++[AC_EGREP_CPP(^yes$,
+ [#include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+diff -uprN erlang-17.4.orig/lib/megaco/aclocal.m4 erlang-17.4.fixed/lib/megaco/aclocal.m4
+--- erlang-17.4.orig/lib/megaco/aclocal.m4	2015-03-24 14:42:35.528574248 +0100
++++ erlang-17.4.fixed/lib/megaco/aclocal.m4	2015-03-24 15:06:18.081509514 +0100
+@@ -559,7 +559,7 @@ dnl
+ 
+ AC_DEFUN(LM_SYS_MULTICAST,
+ [AC_CACHE_CHECK([for multicast support], ac_cv_sys_multicast_support,
+-[AC_EGREP_CPP(yes,
++[AC_EGREP_CPP(^yes$,
+ [#include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+diff -uprN erlang-17.4.orig/lib/odbc/aclocal.m4 erlang-17.4.fixed/lib/odbc/aclocal.m4
+--- erlang-17.4.orig/lib/odbc/aclocal.m4	2015-03-24 14:42:34.388584341 +0100
++++ erlang-17.4.fixed/lib/odbc/aclocal.m4	2015-03-24 15:06:41.993509724 +0100
+@@ -559,7 +559,7 @@ dnl
+ 
+ AC_DEFUN(LM_SYS_MULTICAST,
+ [AC_CACHE_CHECK([for multicast support], ac_cv_sys_multicast_support,
+-[AC_EGREP_CPP(yes,
++[AC_EGREP_CPP(^yes$,
+ [#include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+diff -uprN erlang-17.4.orig/lib/wx/aclocal.m4 erlang-17.4.fixed/lib/wx/aclocal.m4
+--- erlang-17.4.orig/lib/wx/aclocal.m4	2015-03-24 14:42:34.928579560 +0100
++++ erlang-17.4.fixed/lib/wx/aclocal.m4	2015-03-24 15:07:36.105506283 +0100
+@@ -559,7 +559,7 @@ dnl
+ 
+ AC_DEFUN(LM_SYS_MULTICAST,
+ [AC_CACHE_CHECK([for multicast support], ac_cv_sys_multicast_support,
+-[AC_EGREP_CPP(yes,
++[AC_EGREP_CPP(^yes$,
+ [#include <sys/types.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
-- 
2.1.0
