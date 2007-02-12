From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:02 -0800
Subject: [Buildroot] [buildroot 0000376]: libstdc++ LFS support with
	gcc4.0.0 missing declarations of fseeko64 , ftello64
Message-ID: <16d1622b5e92c43f10a88755c69abbcd@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=376 
====================================================================== 
Reported By:                mdeschamps
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   376
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-11-2005 02:46 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    libstdc++ LFS support with gcc4.0.0 missing 
declarations of  fseeko64 , ftello64
Description: 
See below trace. ftello64 and fseeko64 are undeclared and it gets the
compiler 
crying.

1. #undefining _GLIBCXX_USE_LFS is a quick fix, for :

include/ext/stdio_sync_filebuf.h :

#ifdef _GLIBCXX_USE_LFS
        if (!fseeko64(_M_file, __off, __whence))
          __ret = std::streampos(ftello64(_M_file));
#else
        if (!fseek(_M_file, __off, __whence))
          __ret = std::streampos(std::ftell(_M_file));
#endif


2. or telling -fpermissive (like to the compiler propose it) in the
Makefile is another 
====================================================================== 

---------------------------------------------------------------------- 
 mdeschamps - 08-11-05 03:32  
---------------------------------------------------------------------- 
BTW, integrated Bug http://busybox.net/bugs/view.php?id=00051 patch on
crossconfig.m4 file seems not be doing
its work , I mean ...

-----

*-linux* | *-uclinux* | *-gnu* | *-kfreebsd*-gnu | *-knetbsd*-gnu)
    AC_CHECK_HEADERS([nan.h ieeefp.h endian.h sys/isa_defs.h \
      machine/endian.h machine/param.h sys/machine.h sys/types.h \
      fp.h float.h endian.h inttypes.h locale.h float.h stdint.h])
    SECTION_FLAGS='-ffunction-sections -fdata-sections'
    AC_SUBST(SECTION_FLAGS)
    GLIBCXX_CHECK_LINKER_FEATURES
    GLIBCXX_CHECK_COMPLEX_MATH_SUPPORT
    GLIBCXX_CHECK_WCHAR_T_SUPPORT

    # For LFS.
    AC_DEFINE(HAVE_INT64_T)
    case "$target" in
      *-uclinux*)
        # Don't enable LFS with uClinux
        ;;
      *)
        AC_DEFINE(_GLIBCXX_USE_LFS)
    esac

-----
... still defines _GLIBCXX_USE_LFS 

---------------------------------------------------------------------- 
 vapier - 08-11-05 05:35  
---------------------------------------------------------------------- 
gcc bug, not uClibc bug, file a bug at the gcc bugzilla please 

---------------------------------------------------------------------- 
 mdeschamps - 08-18-05 08:00  
---------------------------------------------------------------------- 
I have made upon a anti-LFS-patch which works if you still want to use
stdlibc++ with gcc.4.0.0 without Large File Support. Thus it will use good
old stdin::fseek, stdin::ftell. It must be a bit less optimized all the
same do we need large files onto embedded target :) ?

------------


diff -Nur gcc-4.0.0/libstdc++-v3/./config/io/basic_file_stdio.cc.orig
gcc-4.0.0/libstdc++-v3/./config/io/basic_file_stdio.cc
--- gcc-4.0.0/libstdc++-v3/./config/io/basic_file_stdio.cc.orig 2005-08-11
17:00:34.000000000 +0200
+++ gcc-4.0.0/libstdc++-v3/./config/io/basic_file_stdio.cc      2005-08-11
17:03:22.000000000 +0200
@@ -70,6 +70,12 @@

 #include <limits> // For <off_t>::max() and min() and
<streamsize>::max()

+// Dumb mode : undefining LFS !
+//$ mercredi 08/10/05 09:03:42 md(root)$
+//
+#undef _GLIBCXX_USE_LFS
+
+
 namespace __gnu_internal
 {
   // Map ios_base::openmode flags to a string for use in fopen().
diff -Nur gcc-4.0.0/libstdc++-v3/./acinclude.m4.orig
gcc-4.0.0/libstdc++-v3/./acinclude.m4
--- gcc-4.0.0/libstdc++-v3/./acinclude.m4.orig  2005-08-11
17:03:32.000000000 +0200
+++ gcc-4.0.0/libstdc++-v3/./acinclude.m4       2005-08-11
17:07:45.000000000 +0200
@@ -560,37 +560,38 @@
   fi
 ])

-
+dnl $ mercredi 08/10/05 09:03:42 md(root) $
+dnl Dumb mode : no check, no LFS mode leave my alone with it !
 dnl
 dnl Check whether LFS support is available.
 dnl
-AC_DEFUN([GLIBCXX_CHECK_LFS], [
-  AC_LANG_SAVE
-  AC_LANG_CPLUSPLUS
-  ac_save_CXXFLAGS="$CXXFLAGS"
-  CXXFLAGS="$CXXFLAGS -fno-exceptions"
-  AC_CACHE_VAL(glibcxx_cv_LFS, [
-    AC_TRY_LINK(
-      [#include <unistd.h>
-       #include <stdio.h>
-       #include <sys/stat.h>
-      ],
-      [FILE* fp;
-       fopen64("t", "w");
-       fseeko64(fp, 0, SEEK_CUR);
-       ftello64(fp);
-       lseek64(1, 0, SEEK_CUR);
-       struct stat64 buf;
-       fstat64(1, &buf);],
-      [glibcxx_cv_LFS=yes],
-      [glibcxx_cv_LFS=no])
-  ])
-  if test $glibcxx_cv_LFS = yes; then
-    AC_DEFINE(_GLIBCXX_USE_LFS)
-  fi
-  CXXFLAGS="$ac_save_CXXFLAGS"
-  AC_LANG_RESTORE
-])
+dnl AC_DEFUN([GLIBCXX_CHECK_LFS], [
+dnl  AC_LANG_SAVE
+dnl  AC_LANG_CPLUSPLUS
+dnl  ac_save_CXXFLAGS="$CXXFLAGS"
+dnl  CXXFLAGS="$CXXFLAGS -fno-exceptions"
+dnl  AC_CACHE_VAL(glibcxx_cv_LFS, [
+dnl    AC_TRY_LINK(
+dnl      [#include <unistd.h>
+dnl       #include <stdio.h>
+dnl       #include <sys/stat.h>
+dnl     ],
+dnl     [FILE* fp;
+dnl       fopen64("t", "w");
+dnl       fseeko64(fp, 0, SEEK_CUR);
+dnl      ftello64(fp);
+dnl       lseek64(1, 0, SEEK_CUR);
+dnl       struct stat64 buf;
+dnl       fstat64(1, &buf);],
+dnl      [glibcxx_cv_LFS=yes],
+dnl      [glibcxx_cv_LFS=no])
+dnl  ])
+dnl  if test $glibcxx_cv_LFS = yes; then
+dnl    AC_DEFINE(_GLIBCXX_USE_LFS)
+dnl  fi
+dnl  CXXFLAGS="$ac_save_CXXFLAGS"
+dnl  AC_LANG_RESTORE
+dnl ])


 dnl
diff -Nur gcc-4.0.0/libstdc++-v3/./configure.orig
gcc-4.0.0/libstdc++-v3/./configure
--- gcc-4.0.0/libstdc++-v3/./configure.orig     2005-08-11
17:07:54.000000000 +0200
+++ gcc-4.0.0/libstdc++-v3/./configure  2005-08-11 17:09:06.000000000
+0200
@@ -83552,8 +83552,11 @@
         # Don't enable LFS with uClibc
         ;;
       *)
+# Say no to LFS ! :)
+# $ mercredi 08/10/05 09:03:42 md(root) $
+#
         cat >>confdefs.h <<\_ACEOF
-#define _GLIBCXX_USE_LFS 1
+#undef _GLIBCXX_USE_LFS
 _ACEOF

     esac
diff -Nur gcc-4.0.0/libstdc++-v3/./configure.ac.orig
gcc-4.0.0/libstdc++-v3/./configure.ac
--- gcc-4.0.0/libstdc++-v3/./configure.ac.orig  2005-08-11
17:09:08.000000000 +0200
+++ gcc-4.0.0/libstdc++-v3/./configure.ac       2005-08-11
17:10:03.000000000 +0200
@@ -139,8 +139,10 @@
   # For the __streamoff_base_type typedef.
   GLIBCXX_CHECK_INT64_T

+  # LFS Go away ! don't even check ! :/
+  # $ mercredi 08/10/05 09:03:42 md$
   # For LFS support.
-  GLIBCXX_CHECK_LFS
+  # GLIBCXX_CHECK_LFS

   AC_LC_MESSAGES

diff -Nur gcc-4.0.0/libstdc++-v3/./include/ext/stdio_sync_filebuf.h.orig
gcc-4.0.0/libstdc++-v3/./include/ext/stdio_sync_filebuf.h
--- gcc-4.0.0/libstdc++-v3/./include/ext/stdio_sync_filebuf.h.orig     
2005-08-11 17:11:28.000000000 +0200
+++ gcc-4.0.0/libstdc++-v3/./include/ext/stdio_sync_filebuf.h   2005-08-11
17:12:32.000000000 +0200
@@ -44,6 +44,12 @@
 #include <cwchar>
 #endif

+
+// Anti-evil LFS action !
+//$ mercredi 08/10/05 09:03:42 md(root)$
+//
+#undef _GLIBCXX_USE_LFS
+
 namespace __gnu_cxx
 {
   /// @brief  class stdio_sync_filebuf.
diff -Nur gcc-4.0.0/libstdc++-v3/./testsuite/27_io/fpos/14775.cc.orig
gcc-4.0.0/libstdc++-v3/./testsuite/27_io/fpos/14775.cc
--- gcc-4.0.0/libstdc++-v3/./testsuite/27_io/fpos/14775.cc.orig 2005-08-11
17:12:32.000000000 +0200
+++ gcc-4.0.0/libstdc++-v3/./testsuite/27_io/fpos/14775.cc      2005-08-11
17:13:39.000000000 +0200
@@ -22,6 +22,11 @@

 #include <fstream>
 #include <testsuite_hooks.h>
+
+// Anti-eviliest LFS action !
+//$ mercredi 08/10/05 09:03:42 md(root) $
+//
+#undef _GLIBCXX_USE_LFS

 #define TWO_GB 2147483648UL

diff -Nur gcc-4.0.0/libstdc++-v3/./crossconfig.m4.orig
gcc-4.0.0/libstdc++-v3/./crossconfig.m4
--- gcc-4.0.0/libstdc++-v3/./crossconfig.m4.orig        2005-08-11
17:57:57.000000000 +0200
+++ gcc-4.0.0/libstdc++-v3/./crossconfig.m4     2005-08-11
17:58:42.000000000 +0200
@@ -153,15 +153,19 @@
     GLIBCXX_CHECK_COMPLEX_MATH_SUPPORT
     GLIBCXX_CHECK_WCHAR_T_SUPPORT

+#
+# Oh that's enough with !
+#$ mercredi 08/10/05 09:03:42 md(root) $
+#
     # For LFS.
-    AC_DEFINE(HAVE_INT64_T)
-    case "$target" in
-      *-uclinux*)
-        # Don't enable LFS with uClinux
-        ;;
-      *)
-        AC_DEFINE(_GLIBCXX_USE_LFS)
-    esac
+    #AC_DEFINE(HAVE_INT64_T)
+    #case "$target" in
+    #  *-uclinux*)
+    #    # Don't enable LFS with uClinux
+    #    ;;
+    #  *)
+    #    AC_DEFINE(_GLIBCXX_USE_LFS)
+    #esac

     # For showmanyc_helper().
     AC_CHECK_HEADERS(sys/ioctl.h sys/filio.h)

 

---------------------------------------------------------------------- 
 vapier - 10-17-05 15:12  
---------------------------------------------------------------------- 
dupe of http://busybox.net/bugs/view.php?id=51 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-11-05 02:46  mdeschamps     New Issue                                    
08-11-05 02:46  mdeschamps     Status                   new => assigned     
08-11-05 02:46  mdeschamps     Assigned To               => uClibc          
08-11-05 03:32  mdeschamps     Note Added: 0000402                          
08-11-05 05:35  vapier         Note Added: 0000404                          
08-11-05 05:35  vapier         Status                   assigned => closed  
08-11-05 05:35  vapier         Resolution               open => won't fix   
08-18-05 08:00  mdeschamps     Status                   closed => feedback  
08-18-05 08:00  mdeschamps     Resolution               won't fix => reopened
08-18-05 08:00  mdeschamps     Note Added: 0000425                          
08-18-05 08:00  mdeschamps     Note Edited: 0000425                         
10-17-05 15:12  vapier         Note Added: 0000631                          
10-17-05 15:12  vapier         Status                   feedback => closed  
10-17-05 15:12  vapier         Resolution               reopened => duplicate
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================
