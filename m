From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 29 Aug 2007 23:00:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1
Message-ID: <20070830060037.3D54DA462D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-29 23:00:36 -0700 (Wed, 29 Aug 2007)
New Revision: 19737

Log:
Revert patch causing g++-4.2.1 build to fail

Modified:
   trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch
   trunk/buildroot/toolchain/gcc/4.2.1/205-uclibc-locale-update.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch	2007-08-29 18:34:26 UTC (rev 19736)
+++ trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch	2007-08-30 06:00:36 UTC (rev 19737)
@@ -381,7 +381,7 @@
 +    __convert_from_v(char* __out, 
 +		     const int __size __attribute__ ((__unused__)),
 +		     const char* __fmt,
-+#ifdef __UCLIBC_HAS_XLOCALE__
++#ifdef __UCLIBC_HAS_XCLOCALE__
 +		     _Tv __v, const __c_locale& __cloc, int __prec)
 +    {
 +      __c_locale __old = __gnu_cxx::__uselocale(__cloc);
@@ -398,7 +398,7 @@
 +
 +      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
 +
-+#ifdef __UCLIBC_HAS_XLOCALE__
++#ifdef __UCLIBC_HAS_XCLOCALE__
 +      __gnu_cxx::__uselocale(__old);
 +#elif defined __UCLIBC_HAS_LOCALE__
 +      std::setlocale(LC_ALL, __sav);

Modified: trunk/buildroot/toolchain/gcc/4.2.1/205-uclibc-locale-update.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/205-uclibc-locale-update.patch	2007-08-29 18:34:26 UTC (rev 19736)
+++ trunk/buildroot/toolchain/gcc/4.2.1/205-uclibc-locale-update.patch	2007-08-30 06:00:36 UTC (rev 19737)
@@ -313,11 +313,11 @@
 -    __convert_from_v(char* __out, 
 -		     const int __size __attribute__ ((__unused__)),
 -		     const char* __fmt,
--#ifdef __UCLIBC_HAS_XLOCALE__
+-#ifdef __UCLIBC_HAS_XCLOCALE__
 -		     _Tv __v, const __c_locale& __cloc, int __prec)
 +    inline int
 +    __convert_from_v(const __c_locale&
-+#ifndef __UCLIBC_HAS_XLOCALE__
++#ifndef __UCLIBC_HAS_XCLOCALE__
 +					__cloc __attribute__ ((__unused__))
 +#endif
 +		     ,
@@ -326,7 +326,7 @@
 +		     const char* __fmt, ...)
      {
 +      va_list __args;
-+#ifdef __UCLIBC_HAS_XLOCALE__
++#ifdef __UCLIBC_HAS_XCLOCALE__
        __c_locale __old = __gnu_cxx::__uselocale(__cloc);
  #else
 -		     _Tv __v, const __c_locale&, int __prec)
@@ -343,5 +343,5 @@
 +      const int __ret = std::vsnprintf(__out, __size, __fmt, __args);
 +      va_end(__args);
  
- #ifdef __UCLIBC_HAS_XLOCALE__
+ #ifdef __UCLIBC_HAS_XCLOCALE__
        __gnu_cxx::__uselocale(__old);
