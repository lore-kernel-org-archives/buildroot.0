From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Sep 2006 03:35:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2
Message-ID: <20060928103512.8E7E348582@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-09-28 03:35:12 -0700 (Thu, 28 Sep 2006)
New Revision: 16247

Log:
- rediff against current trunk.
  Now compiles again if locale is turned off..


Modified:
   trunk/buildroot/toolchain/gcc/4.2/205-uclibc-locale-update.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2/205-uclibc-locale-update.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2/205-uclibc-locale-update.patch	2006-09-28 10:30:29 UTC (rev 16246)
+++ trunk/buildroot/toolchain/gcc/4.2/205-uclibc-locale-update.patch	2006-09-28 10:35:12 UTC (rev 16247)
@@ -81,27 +81,6 @@
        __freelocale(__cloc); 
    }
  
---- gcc/libstdc++-v3/config/locale/uclibc/c_locale.h.uclibc200_update~	2006-03-10 15:32:37 +0100
-+++ gcc/libstdc++-v3/config/locale/uclibc/c_locale.h	2006-03-10 15:39:14 +0100
-@@ -45,15 +45,16 @@
- #ifdef __UCLIBC_MJN3_ONLY__
- #warning fix this
- #endif
--#ifdef __UCLIBC_HAS_LOCALE__
-+#ifdef _GLIBCXX_USE_ICONV
- #include <iconv.h>		// For codecvt using iconv, iconv_t
- #endif
--#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
-+#ifdef HAVE_LIBINTL_H
- #include <libintl.h> 		// For messages
- #endif
- #include <cstdarg>
- #ifdef __UCLIBC_MJN3_ONLY__
- #warning what is _GLIBCXX_C_LOCALE_GNU for
-+// psm: used in os/gnu-linux/ctype_noninline.h
- #endif
- #define _GLIBCXX_C_LOCALE_GNU 1
- 
 --- gcc/libstdc++-v3/config/locale/uclibc/ctype_members.cc.uclibc200_update~	2006-03-10 15:32:37 +0100
 +++ gcc/libstdc++-v3/config/locale/uclibc/ctype_members.cc	2006-03-10 15:39:14 +0100
 @@ -33,9 +33,14 @@
@@ -279,3 +258,90 @@
      }
  
    template<typename _CharT>
+--- gcc-4.2/libstdc++-v3/config/locale/uclibc/c_locale.h.old	2006-09-28 11:39:00.000000000 +0200
++++ gcc-4.2/libstdc++-v3/config/locale/uclibc/c_locale.h	2006-09-28 12:10:41.000000000 +0200
+@@ -39,21 +39,23 @@
+ #pragma GCC system_header
+ 
+ #include <cstring>              // get std::strlen
+-#include <cstdio>               // get std::snprintf or std::sprintf
++#include <cstdio>               // get std::vsnprintf or std::vsprintf
+ #include <clocale>
+ #include <langinfo.h>		// For codecvt
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning fix this
+ #endif
+-#ifdef __UCLIBC_HAS_LOCALE__
++#ifdef _GLIBCXX_USE_ICONV
+ #include <iconv.h>		// For codecvt using iconv, iconv_t
+ #endif
+-#ifdef __UCLIBC_HAS_GETTEXT_AWARENESS__
+-#include <libintl.h> 		// For messages
++#ifdef HAVE_LIBINTL_H
++#include <libintl.h>		// For messages
+ #endif
++#include <cstdarg>
+ 
+ #ifdef __UCLIBC_MJN3_ONLY__
+ #warning what is _GLIBCXX_C_LOCALE_GNU for
++// psm: used in os/gnu-linux/ctype_noninline.h
+ #endif
+ #define _GLIBCXX_C_LOCALE_GNU 1
+ 
+@@ -62,7 +64,7 @@
+ #endif
+ // #define _GLIBCXX_NUM_CATEGORIES 6
+ #define _GLIBCXX_NUM_CATEGORIES 0
+- 
++
+ #ifdef __UCLIBC_HAS_XLOCALE__
+ namespace __gnu_cxx
+ {
+@@ -79,22 +81,24 @@
+   typedef int*			__c_locale;
+ #endif
+ 
+-  // Convert numeric value of type _Tv to string and return length of
+-  // string.  If snprintf is available use it, otherwise fall back to
+-  // the unsafe sprintf which, in general, can be dangerous and should
++  // Convert numeric value of type double to string and return length of
++  // string.  If vsnprintf is available use it, otherwise fall back to
++  // the unsafe vsprintf which, in general, can be dangerous and should
+   // be avoided.
+-  template<typename _Tv>
+-    int
+-    __convert_from_v(char* __out, 
+-		     const int __size __attribute__ ((__unused__)),
+-		     const char* __fmt,
+-#ifdef __UCLIBC_HAS_XCLOCALE__
+-		     _Tv __v, const __c_locale& __cloc, int __prec)
++    inline int
++    __convert_from_v(const __c_locale&
++#ifndef __UCLIBC_HAS_XCLOCALE__
++					__cloc __attribute__ ((__unused__))
++#endif
++		     ,
++		     char* __out,
++		     const int __size,
++		     const char* __fmt, ...)
+     {
++      va_list __args;
++#ifdef __UCLIBC_HAS_XCLOCALE__
+       __c_locale __old = __gnu_cxx::__uselocale(__cloc);
+ #else
+-		     _Tv __v, const __c_locale&, int __prec)
+-    {
+ # ifdef __UCLIBC_HAS_LOCALE__
+       char* __old = std::setlocale(LC_ALL, NULL);
+       char* __sav = new char[std::strlen(__old) + 1];
+@@ -103,7 +107,9 @@
+ # endif
+ #endif
+ 
+-      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
++      va_start(__args, __fmt);
++      const int __ret = std::vsnprintf(__out, __size, __fmt, __args);
++      va_end(__args);
+ 
+ #ifdef __UCLIBC_HAS_XCLOCALE__
+       __gnu_cxx::__uselocale(__old);
