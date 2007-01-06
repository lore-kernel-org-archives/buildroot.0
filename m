From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  6 Jan 2007 11:39:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20070106193952.8C35F4864B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-06 11:39:51 -0800 (Sat, 06 Jan 2007)
New Revision: 17172

Log:
- simpler patch from Paolo Carlini for http://gcc.gnu.org/PR30365


Modified:
   trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch	2007-01-06 10:31:45 UTC (rev 17171)
+++ trunk/buildroot/toolchain/gcc/4.2/307-libstdc++-largefile-reconf.patch	2007-01-06 19:39:51 UTC (rev 17172)
@@ -1,450 +1,131 @@
-diff -dup gcc-4.2.orig/libstdc++-v3/acinclude.m4 gcc-4.2/libstdc++-v3/acinclude.m4
---- gcc-4.2.orig/libstdc++-v3/acinclude.m4	2006-12-27 12:58:40.000000000 +0100
-+++ gcc-4.2/libstdc++-v3/acinclude.m4	2006-12-27 13:38:30.000000000 +0100
-@@ -554,7 +554,7 @@ AC_DEFUN([GLIBCXX_CHECK_LFS], [
-       [glibcxx_cv_LFS=yes],
-       [glibcxx_cv_LFS=no])
-   ])
--  if test $glibcxx_cv_LFS = yes; then
-+  if test $glibcxx_cv_LFS = yes && test $enable_largefile = yes; then
-     AC_DEFINE(_GLIBCXX_USE_LFS, 1, [Define if LFS support is available.])
-   fi
-   AC_MSG_RESULT($glibcxx_cv_LFS)
-diff -dup gcc-4.2.orig/libstdc++-v3/configure.ac gcc-4.2/libstdc++-v3/configure.ac
---- gcc-4.2.orig/libstdc++-v3/configure.ac	2006-12-27 12:58:40.000000000 +0100
-+++ gcc-4.2/libstdc++-v3/configure.ac	2006-12-27 13:38:30.000000000 +0100
-@@ -96,6 +96,7 @@ GLIBCXX_ENABLE_HOSTED
- GLIBCXX_ENABLE_SJLJ_EXCEPTIONS
- GLIBCXX_ENABLE_PCH($is_hosted)
+--- gcc-4.2.orig/libstdc++-v3/configure	(revision 120449)
++++ gcc-4.2/libstdc++-v3/configure	(working copy)
+@@ -99359,17 +99359,104 @@
+ #define HAVE_INT64_T 1
+ _ACEOF
  
-+AC_SYS_LARGEFILE
- # Enable all the variable C++ runtime options.  
- GLIBCXX_ENABLE_CSTDIO
- GLIBCXX_ENABLE_CLOCALE
-diff -dup gcc-4.2.orig/libstdc++-v3/crossconfig.m4 gcc-4.2/libstdc++-v3/crossconfig.m4
---- gcc-4.2.orig/libstdc++-v3/crossconfig.m4	2006-12-27 12:08:05.000000000 +0100
-+++ gcc-4.2/libstdc++-v3/crossconfig.m4	2006-12-27 13:25:16.000000000 +0100
-@@ -162,7 +162,9 @@ case "${host}" in
-         # Don't enable LFS with uClinux
-         ;;
-       *)
-+	if test x"$enable_largefile" = x"yes"; then
-         AC_DEFINE(_GLIBCXX_USE_LFS)
-+	fi
-     esac
- 
-     # For showmanyc_helper().
-diff -dup gcc-4.2.orig/libstdc++-v3/configure gcc-4.2/libstdc++-v3/configure
---- gcc-4.2.orig/libstdc++-v3/configure	2006-12-27 12:58:40.000000000 +0100
-+++ gcc-4.2/libstdc++-v3/configure	2006-12-27 13:38:30.000000000 +0100
-@@ -858,6 +858,7 @@ Optional Features:
-                           [default=auto]
-   --enable-libstdcxx-pch  build pre-compiled libstdc++ headers
-                           [default=$is_hosted]
-+  --disable-largefile     omit support for large files
-   --enable-cstdio=PACKAGE use target-specific I/O package
-                           [default=stdio]
-   --enable-clocale[=MODEL]
-@@ -4740,7 +4741,7 @@ test x"$pic_mode" = xno && libtool_flags
- case $host in
- *-*-irix6*)
-   # Find out which ABI we are using.
--  echo '#line 4743 "configure"' > conftest.$ac_ext
-+  echo '#line 4744 "configure"' > conftest.$ac_ext
-   if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-   (eval $ac_compile) 2>&5
-   ac_status=$?
-@@ -5489,6 +5490,370 @@ echo "${ECHO_T}$enable_libstdcxx_pch" >&
- 
- 
- 
-+# Check whether --enable-largefile or --disable-largefile was given.
-+if test "${enable_largefile+set}" = set; then
-+  enableval="$enable_largefile"
+-    case "$target" in
+-      *-uclinux*)
+-        # Don't enable LFS with uClinux
+-        ;;
+-      *)
+-        cat >>confdefs.h <<\_ACEOF
 +
-+fi;
-+if test "$enable_largefile" != no; then
 +
-+  echo "$as_me:$LINENO: checking for special C compiler options needed for large files" >&5
-+echo $ECHO_N "checking for special C compiler options needed for large files... $ECHO_C" >&6
-+if test "${ac_cv_sys_largefile_CC+set}" = set; then
-+  echo $ECHO_N "(cached) $ECHO_C" >&6
-+else
-+  ac_cv_sys_largefile_CC=no
-+     if test "$GCC" != yes; then
-+       ac_save_CC=$CC
-+       while :; do
-+     	 # IRIX 6.2 and later do not support large files by default,
-+     	 # so use the C compiler's -n32 option if that helps.
-+	 cat >conftest.$ac_ext <<_ACEOF
-+/* confdefs.h.  */
-+_ACEOF
-+cat confdefs.h >>conftest.$ac_ext
-+cat >>conftest.$ac_ext <<_ACEOF
-+/* end confdefs.h.  */
-+#include <sys/types.h>
-+ /* Check that off_t can represent 2**63 - 1 correctly.
-+    We can't simply define LARGE_OFF_T to be 9223372036854775807,
-+    since some C++ compilers masquerading as C compilers
-+    incorrectly reject 9223372036854775807.  */
-+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
-+  int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
-+		       && LARGE_OFF_T % 2147483647 == 1)
-+		      ? 1 : -1];
-+int
-+main ()
-+{
 +
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+     	 rm -f conftest.$ac_objext
-+if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-+  (eval $ac_compile) 2>conftest.er1
-+  ac_status=$?
-+  grep -v '^ *+' conftest.er1 >conftest.err
-+  rm -f conftest.er1
-+  cat conftest.err >&5
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); } &&
-+	 { ac_try='test -z "$ac_c_werror_flag"
-+			 || test ! -s conftest.err'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; } &&
-+	 { ac_try='test -s conftest.$ac_objext'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }; then
-+  break
-+else
-+  echo "$as_me: failed program was:" >&5
-+sed 's/^/| /' conftest.$ac_ext >&5
++  ac_ext=cc
++ac_cpp='$CXXCPP $CPPFLAGS'
++ac_compile='$CXX -c $CXXFLAGS $CPPFLAGS conftest.$ac_ext >&5'
++ac_link='$CXX -o conftest$ac_exeext $CXXFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
++ac_compiler_gnu=$ac_cv_cxx_compiler_gnu
 +
-+fi
-+rm -f conftest.err conftest.$ac_objext
-+     	 CC="$CC -n32"
-+     	 rm -f conftest.$ac_objext
-+if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-+  (eval $ac_compile) 2>conftest.er1
-+  ac_status=$?
-+  grep -v '^ *+' conftest.er1 >conftest.err
-+  rm -f conftest.er1
-+  cat conftest.err >&5
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); } &&
-+	 { ac_try='test -z "$ac_c_werror_flag"
-+			 || test ! -s conftest.err'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; } &&
-+	 { ac_try='test -s conftest.$ac_objext'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }; then
-+  ac_cv_sys_largefile_CC=' -n32'; break
-+else
-+  echo "$as_me: failed program was:" >&5
-+sed 's/^/| /' conftest.$ac_ext >&5
-+
-+fi
-+rm -f conftest.err conftest.$ac_objext
-+	 break
-+       done
-+       CC=$ac_save_CC
-+       rm -f conftest.$ac_ext
-+    fi
-+fi
-+echo "$as_me:$LINENO: result: $ac_cv_sys_largefile_CC" >&5
-+echo "${ECHO_T}$ac_cv_sys_largefile_CC" >&6
-+  if test "$ac_cv_sys_largefile_CC" != no; then
-+    CC=$CC$ac_cv_sys_largefile_CC
-+  fi
-+
-+  echo "$as_me:$LINENO: checking for _FILE_OFFSET_BITS value needed for large files" >&5
-+echo $ECHO_N "checking for _FILE_OFFSET_BITS value needed for large files... $ECHO_C" >&6
-+if test "${ac_cv_sys_file_offset_bits+set}" = set; then
++  ac_save_CXXFLAGS="$CXXFLAGS"
++  CXXFLAGS="$CXXFLAGS -fno-exceptions"
++  echo "$as_me:$LINENO: checking for LFS support" >&5
++echo $ECHO_N "checking for LFS support... $ECHO_C" >&6
++  if test "${glibcxx_cv_LFS+set}" = set; then
 +  echo $ECHO_N "(cached) $ECHO_C" >&6
 +else
-+  while :; do
-+  ac_cv_sys_file_offset_bits=no
-+  cat >conftest.$ac_ext <<_ACEOF
-+/* confdefs.h.  */
-+_ACEOF
-+cat confdefs.h >>conftest.$ac_ext
-+cat >>conftest.$ac_ext <<_ACEOF
-+/* end confdefs.h.  */
-+#include <sys/types.h>
-+ /* Check that off_t can represent 2**63 - 1 correctly.
-+    We can't simply define LARGE_OFF_T to be 9223372036854775807,
-+    since some C++ compilers masquerading as C compilers
-+    incorrectly reject 9223372036854775807.  */
-+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
-+  int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
-+		       && LARGE_OFF_T % 2147483647 == 1)
-+		      ? 1 : -1];
-+int
-+main ()
-+{
 +
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+rm -f conftest.$ac_objext
-+if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-+  (eval $ac_compile) 2>conftest.er1
-+  ac_status=$?
-+  grep -v '^ *+' conftest.er1 >conftest.err
-+  rm -f conftest.er1
-+  cat conftest.err >&5
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); } &&
-+	 { ac_try='test -z "$ac_c_werror_flag"
-+			 || test ! -s conftest.err'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; } &&
-+	 { ac_try='test -s conftest.$ac_objext'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }; then
-+  break
-+else
-+  echo "$as_me: failed program was:" >&5
-+sed 's/^/| /' conftest.$ac_ext >&5
-+
++    if test x$gcc_no_link = xyes; then
++  { { echo "$as_me:$LINENO: error: Link tests are not allowed after GCC_NO_EXECUTABLES." >&5
++echo "$as_me: error: Link tests are not allowed after GCC_NO_EXECUTABLES." >&2;}
++   { (exit 1); exit 1; }; }
 +fi
-+rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
-+  cat >conftest.$ac_ext <<_ACEOF
++cat >conftest.$ac_ext <<_ACEOF
 +/* confdefs.h.  */
 +_ACEOF
 +cat confdefs.h >>conftest.$ac_ext
 +cat >>conftest.$ac_ext <<_ACEOF
 +/* end confdefs.h.  */
-+#define _FILE_OFFSET_BITS 64
-+#include <sys/types.h>
-+ /* Check that off_t can represent 2**63 - 1 correctly.
-+    We can't simply define LARGE_OFF_T to be 9223372036854775807,
-+    since some C++ compilers masquerading as C compilers
-+    incorrectly reject 9223372036854775807.  */
-+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
-+  int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
-+		       && LARGE_OFF_T % 2147483647 == 1)
-+		      ? 1 : -1];
-+int
-+main ()
-+{
++#include <unistd.h>
++       #include <stdio.h>
++       #include <sys/stat.h>
 +
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+rm -f conftest.$ac_objext
-+if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-+  (eval $ac_compile) 2>conftest.er1
-+  ac_status=$?
-+  grep -v '^ *+' conftest.er1 >conftest.err
-+  rm -f conftest.er1
-+  cat conftest.err >&5
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); } &&
-+	 { ac_try='test -z "$ac_c_werror_flag"
-+			 || test ! -s conftest.err'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; } &&
-+	 { ac_try='test -s conftest.$ac_objext'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }; then
-+  ac_cv_sys_file_offset_bits=64; break
-+else
-+  echo "$as_me: failed program was:" >&5
-+sed 's/^/| /' conftest.$ac_ext >&5
-+
-+fi
-+rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
-+  break
-+done
-+fi
-+echo "$as_me:$LINENO: result: $ac_cv_sys_file_offset_bits" >&5
-+echo "${ECHO_T}$ac_cv_sys_file_offset_bits" >&6
-+if test "$ac_cv_sys_file_offset_bits" != no; then
-+
-+cat >>confdefs.h <<_ACEOF
-+#define _FILE_OFFSET_BITS $ac_cv_sys_file_offset_bits
-+_ACEOF
-+
-+fi
-+rm -f conftest*
-+  echo "$as_me:$LINENO: checking for _LARGE_FILES value needed for large files" >&5
-+echo $ECHO_N "checking for _LARGE_FILES value needed for large files... $ECHO_C" >&6
-+if test "${ac_cv_sys_large_files+set}" = set; then
-+  echo $ECHO_N "(cached) $ECHO_C" >&6
-+else
-+  while :; do
-+  ac_cv_sys_large_files=no
-+  cat >conftest.$ac_ext <<_ACEOF
-+/* confdefs.h.  */
-+_ACEOF
-+cat confdefs.h >>conftest.$ac_ext
-+cat >>conftest.$ac_ext <<_ACEOF
-+/* end confdefs.h.  */
-+#include <sys/types.h>
-+ /* Check that off_t can represent 2**63 - 1 correctly.
-+    We can't simply define LARGE_OFF_T to be 9223372036854775807,
-+    since some C++ compilers masquerading as C compilers
-+    incorrectly reject 9223372036854775807.  */
-+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
-+  int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
-+		       && LARGE_OFF_T % 2147483647 == 1)
-+		      ? 1 : -1];
 +int
 +main ()
 +{
-+
++FILE* fp;
++       fopen64("t", "w");
++       fseeko64(fp, 0, SEEK_CUR);
++       ftello64(fp);
++       lseek64(1, 0, SEEK_CUR);
++       struct stat64 buf;
++       fstat64(1, &buf);
 +  ;
 +  return 0;
 +}
 +_ACEOF
-+rm -f conftest.$ac_objext
-+if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-+  (eval $ac_compile) 2>conftest.er1
++rm -f conftest.$ac_objext conftest$ac_exeext
++if { (eval echo "$as_me:$LINENO: \"$ac_link\"") >&5
++  (eval $ac_link) 2>conftest.er1
 +  ac_status=$?
 +  grep -v '^ *+' conftest.er1 >conftest.err
 +  rm -f conftest.er1
 +  cat conftest.err >&5
 +  echo "$as_me:$LINENO: \$? = $ac_status" >&5
 +  (exit $ac_status); } &&
-+	 { ac_try='test -z "$ac_c_werror_flag"
++	 { ac_try='test -z "$ac_cxx_werror_flag"
 +			 || test ! -s conftest.err'
 +  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
 +  (eval $ac_try) 2>&5
 +  ac_status=$?
 +  echo "$as_me:$LINENO: \$? = $ac_status" >&5
 +  (exit $ac_status); }; } &&
-+	 { ac_try='test -s conftest.$ac_objext'
++	 { ac_try='test -s conftest$ac_exeext'
 +  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
 +  (eval $ac_try) 2>&5
 +  ac_status=$?
 +  echo "$as_me:$LINENO: \$? = $ac_status" >&5
 +  (exit $ac_status); }; }; then
-+  break
++  glibcxx_cv_LFS=yes
 +else
 +  echo "$as_me: failed program was:" >&5
 +sed 's/^/| /' conftest.$ac_ext >&5
 +
++glibcxx_cv_LFS=no
 +fi
-+rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
-+  cat >conftest.$ac_ext <<_ACEOF
-+/* confdefs.h.  */
-+_ACEOF
-+cat confdefs.h >>conftest.$ac_ext
-+cat >>conftest.$ac_ext <<_ACEOF
-+/* end confdefs.h.  */
-+#define _LARGE_FILES 1
-+#include <sys/types.h>
-+ /* Check that off_t can represent 2**63 - 1 correctly.
-+    We can't simply define LARGE_OFF_T to be 9223372036854775807,
-+    since some C++ compilers masquerading as C compilers
-+    incorrectly reject 9223372036854775807.  */
-+#define LARGE_OFF_T (((off_t) 1 << 62) - 1 + ((off_t) 1 << 62))
-+  int off_t_is_large[(LARGE_OFF_T % 2147483629 == 721
-+		       && LARGE_OFF_T % 2147483647 == 1)
-+		      ? 1 : -1];
-+int
-+main ()
-+{
++rm -f conftest.err conftest.$ac_objext \
++      conftest$ac_exeext conftest.$ac_ext
 +
-+  ;
-+  return 0;
-+}
-+_ACEOF
-+rm -f conftest.$ac_objext
-+if { (eval echo "$as_me:$LINENO: \"$ac_compile\"") >&5
-+  (eval $ac_compile) 2>conftest.er1
-+  ac_status=$?
-+  grep -v '^ *+' conftest.er1 >conftest.err
-+  rm -f conftest.er1
-+  cat conftest.err >&5
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); } &&
-+	 { ac_try='test -z "$ac_c_werror_flag"
-+			 || test ! -s conftest.err'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; } &&
-+	 { ac_try='test -s conftest.$ac_objext'
-+  { (eval echo "$as_me:$LINENO: \"$ac_try\"") >&5
-+  (eval $ac_try) 2>&5
-+  ac_status=$?
-+  echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+  (exit $ac_status); }; }; then
-+  ac_cv_sys_large_files=1; break
-+else
-+  echo "$as_me: failed program was:" >&5
-+sed 's/^/| /' conftest.$ac_ext >&5
-+
 +fi
-+rm -f conftest.err conftest.$ac_objext conftest.$ac_ext
-+  break
-+done
-+fi
-+echo "$as_me:$LINENO: result: $ac_cv_sys_large_files" >&5
-+echo "${ECHO_T}$ac_cv_sys_large_files" >&6
-+if test "$ac_cv_sys_large_files" != no; then
 +
-+cat >>confdefs.h <<_ACEOF
-+#define _LARGE_FILES $ac_cv_sys_large_files
-+_ACEOF
++  if test $glibcxx_cv_LFS = yes; then
 +
-+fi
-+rm -f conftest*
-+fi
-+
- # Enable all the variable C++ runtime options.
++cat >>confdefs.h <<\_ACEOF
+ #define _GLIBCXX_USE_LFS 1
+ _ACEOF
  
-   echo "$as_me:$LINENO: checking for underlying I/O to use" >&5
-@@ -30152,7 +30517,7 @@ rm -f conftest.err conftest.$ac_objext \
+-    esac
++  fi
++  echo "$as_me:$LINENO: result: $glibcxx_cv_LFS" >&5
++echo "${ECHO_T}$glibcxx_cv_LFS" >&6
++  CXXFLAGS="$ac_save_CXXFLAGS"
++  ac_ext=c
++ac_cpp='$CPP $CPPFLAGS'
++ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
++ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
++ac_compiler_gnu=$ac_cv_c_compiler_gnu
  
- fi
++
++
+     # For showmanyc_helper().
  
--  if test $glibcxx_cv_LFS = yes; then
-+  if test $glibcxx_cv_LFS = yes && test $enable_largefile = yes; then
  
- cat >>confdefs.h <<\_ACEOF
- #define _GLIBCXX_USE_LFS 1
-@@ -99434,10 +99799,12 @@ _ACEOF
-         # Don't enable LFS with uClinux
-         ;;
-       *)
-+	if test x"$enable_largefile" = x"yes"; then
-         cat >>confdefs.h <<\_ACEOF
- #define _GLIBCXX_USE_LFS 1
- _ACEOF
+--- gcc-4.2.orig/libstdc++-v3/crossconfig.m4	(revision 120449)
++++ gcc-4.2/libstdc++-v3/crossconfig.m4	(working copy)
+@@ -157,13 +157,7 @@
  
-+	fi
-     esac
+     # For LFS.
+     AC_DEFINE(HAVE_INT64_T)
+-    case "$target" in
+-      *-uclinux*)
+-        # Don't enable LFS with uClinux
+-        ;;
+-      *)
+-        AC_DEFINE(_GLIBCXX_USE_LFS)
+-    esac
++    GLIBCXX_CHECK_LFS
  
      # For showmanyc_helper().
-
+     AC_CHECK_HEADERS(sys/ioctl.h sys/filio.h)
