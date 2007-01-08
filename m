From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  8 Jan 2007 10:35:28 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20070108183528.430F048583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-08 10:35:27 -0800 (Mon, 08 Jan 2007)
New Revision: 17202

Log:
- Adjust patches to take recent upstream fixes into account.


Removed:
   trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch

Modified:
   trunk/buildroot/toolchain/gcc/4.2/100-uclibc-conf.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2/100-uclibc-conf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/100-uclibc-conf.patch	2007-01-08 16:38:33 UTC (rev 17201)
+++ trunk/buildroot/toolchain/gcc/4.2/100-uclibc-conf.patch	2007-01-08 18:35:27 UTC (rev 17202)
@@ -35,26 +35,6 @@
    lt_cv_deplibs_check_method=pass_all
    ;;
  
-@@ -99523,7 +99523,7 @@
- 
-     case "$target" in
-       *-uclinux*)
--        # Don't enable LFS with uClibc
-+        # Don't enable LFS with uClinux
-         ;;
-       *)
-         cat >>confdefs.h <<\_ACEOF
---- gcc/libstdc++-v3/crossconfig.m4
-+++ gcc/libstdc++-v3/crossconfig.m4
-@@ -161,7 +161,7 @@
-     AC_DEFINE(HAVE_INT64_T)
-     case "$target" in
-       *-uclinux*)
--        # Don't enable LFS with uClibc
-+        # Don't enable LFS with uClinux
-         ;;
-       *)
-         AC_DEFINE(_GLIBCXX_USE_LFS)
 --- gcc/zlib/configure
 +++ gcc/zlib/configure
 @@ -3422,7 +3422,7 @@

Deleted: trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch	2007-01-08 16:38:33 UTC (rev 17201)
+++ trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch	2007-01-08 18:35:27 UTC (rev 17202)
@@ -1,131 +0,0 @@
---- gcc-4.2.orig/libstdc++-v3/configure	(revision 120449)
-+++ gcc-4.2/libstdc++-v3/configure	(working copy)
-@@ -99359,17 +99359,104 @@
- #define HAVE_INT64_T 1
- _ACEOF
- 
--    case "$target" in
--      *-uclinux*)
--        # Don't enable LFS with uClinux
--        ;;
--      *)
--        cat >>confdefs.h <<\_ACEOF
-+
-+
-+
-+  ac_ext=cc
-+ac_cpp='$CXXCPP $CPPFLAGS'
-+ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-+ac_link='$CXX -o conftest$ac_exeext $CXXFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-+ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
-+
-+  ac_save_CXXFLAGS="$CXXFLAGS"
-+  CXXFLAGS="$CXXFLAGS -fno-exceptions"
-+  echo "$as_me:$LINENO: checking for LFS support" >&5
-+echo $ECHO_N "checking for LFS support... $ECHO_C" >&6
-+  if test "${glibcxx_cv_LFS+set}" = set; then
-+  echo $ECHO_N "(cached) $ECHO_C" >&6
-+else
-+
-+    if test x$gcc_no_link = xyes; then
-+  { { echo "$as_me:$LINENO: error: Link tests are not allowed after GCC_NO_EXECUTABLES." >&5
-+echo "$as_me: error: Link tests are not allowed after GCC_NO_EXECUTABLES." >&2;}
-+   { (exit 1); exit 1; }; }
-+fi
-+cat >conftest.$ac_ext <<_ACEOF
-+/* confdefs.h.  */
-+_ACEOF
-+cat confdefs.h >>conftest.$ac_ext
-+cat >>conftest.$ac_ext <<_ACEOF
-+/* end confdefs.h.  */
-+#include <unistd.h>
-+       #include <stdio.h>
-+       #include <sys/stat.h>
-+
-+int
-+main ()
-+{
-+FILE* fp;
-+       fopen64("t", "w");
-+       fseeko64(fp, 0, SEEK_CUR);
-+       ftello64(fp);
-+       lseek64(1, 0, SEEK_CUR);
-+       struct stat64 buf;
-+       fstat64(1, &buf);
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+rm -f conftest.$ac_objext conftest$ac_exeext
-+if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
-+  (eval $ac_link) 2>conftest.er1
-+  ac_status=$?
-+  grep -v '^ *+' conftest.er1 >conftest.err
-+  rm -f conftest.er1
-+  cat conftest.err >&5
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); } &&
-+	 { ac_try='test -z "$ac_cxx_werror_flag"
-+			 || test ! -s conftest.err'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; } &&
-+	 { ac_try='test -s conftest$ac_exeext'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }; then
-+  glibcxx_cv_LFS=yes
-+else
-+  echo "$as_me: failed program was:" >&5
-+sed 's/^/| /' conftest.$ac_ext >&5
-+
-+glibcxx_cv_LFS=no
-+fi
-+rm -f conftest.err conftest.$ac_objext \
-+      conftest$ac_exeext conftest.$ac_ext
-+
-+fi
-+
-+  if test $glibcxx_cv_LFS = yes; then
-+
-+cat >>confdefs.h <<\_ACEOF
- #define _GLIBCXX_USE_LFS 1
- _ACEOF
- 
--    esac
-+  fi
-+  echo "$as_me:$LINENO: result: $glibcxx_cv_LFS" >&5
-+echo "${ECHO_T}$glibcxx_cv_LFS" >&6
-+  CXXFLAGS="$ac_save_CXXFLAGS"
-+  ac_ext=c
-+ac_cpp='$CPP $CPPFLAGS'
-+ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
-+ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
-+ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
-+
-+
-     # For showmanyc_helper().
- 
- 
---- gcc-4.2.orig/libstdc++-v3/crossconfig.m4	(revision 120449)
-+++ gcc-4.2/libstdc++-v3/crossconfig.m4	(working copy)
-@@ -157,13 +157,7 @@
- 
-     # For LFS.
-     AC_DEFINE(HAVE_INT64_T)
--    case "$target" in
--      *-uclinux*)
--        # Don't enable LFS with uClinux
--        ;;
--      *)
--        AC_DEFINE(_GLIBCXX_USE_LFS)
--    esac
-+    GLIBCXX_CHECK_LFS
- 
-     # For showmanyc_helper().
-     AC_CHECK_HEADERS(sys/ioctl.h sys/filio.h)
