From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 28 Aug 2007 11:21:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc/4.2.1
Message-ID: <20070828182101.CB388A466A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-28 11:21:00 -0700 (Tue, 28 Aug 2007)
New Revision: 19714

Log:
Looking at the the gcc-4.2.1 patches for uClibc, I found that the
200-uclibc-locale and 205-uclibc-locale-update patches uses a not 
existing macro
__UCLIBC_HAS_XCLOCALE__ while they should refer to __UCLIBC_HAS_XLOCALE__

Find attached the patches to fix the above mentioned patches

Signed-off-by: Carmelo Amoroso <carmelo.amoroso@st.com>


Modified:
   trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch
   trunk/buildroot/toolchain/gcc/4.2.1/205-uclibc-locale-update.patch


Changeset:
Modified: trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch	2007-08-28 18:18:10 UTC (rev 19713)
+++ trunk/buildroot/toolchain/gcc/4.2.1/200-uclibc-locale.patch	2007-08-28 18:21:00 UTC (rev 19714)
@@ -381,7 +381,7 @@
 +    __convert_from_v(char* __out, 
 +		     const int __size __attribute__ ((__unused__)),
 +		     const char* __fmt,
-+#ifdef __UCLIBC_HAS_XCLOCALE__
++#ifdef __UCLIBC_HAS_XLOCALE__
 +		     _Tv __v, const __c_locale& __cloc, int __prec)
 +    {
 +      __c_locale __old = __gnu_cxx::__uselocale(__cloc);
@@ -398,7 +398,7 @@
 +
 +      const int __ret = std::snprintf(__out, __size, __fmt, __prec, __v);
 +
-+#ifdef __UCLIBC_HAS_XCLOCALE__
++#ifdef __UCLIBC_HAS_XLOCALE__
 +      __gnu_cxx::__uselocale(__old);
 +#elif defined __UCLIBC_HAS_LOCALE__
 +      std::setlocale(LC_ALL, __sav);

Modified: trunk/buildroot/toolchain/gcc/4.2.1/205-uclibc-locale-update.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.2.1/205-uclibc-locale-update.patch	2007-08-28 18:18:10 UTC (rev 19713)
+++ trunk/buildroot/toolchain/gcc/4.2.1/205-uclibc-locale-update.patch	2007-08-28 18:21:00 UTC (rev 19714)
@@ -313,11 +313,11 @@
 -    __convert_from_v(char* __out, 
 -		     const int __size __attribute__ ((__unused__)),
 -		     const char* __fmt,
--#ifdef __UCLIBC_HAS_XCLOCALE__
+-#ifdef __UCLIBC_HAS_XLOCALE__
 -		     _Tv __v, const __c_locale& __cloc, int __prec)
 +    inline int
 +    __convert_from_v(const __c_locale&
-+#ifndef __UCLIBC_HAS_XCLOCALE__
++#ifndef __UCLIBC_HAS_XLOCALE__
 +					__cloc __attribute__ ((__unused__))
 +#endif
 +		     ,
@@ -326,7 +326,7 @@
 +		     const char* __fmt, ...)
      {
 +      va_list __args;
-+#ifdef __UCLIBC_HAS_XCLOCALE__
++#ifdef __UCLIBC_HAS_XLOCALE__
        __c_locale __old = __gnu_cxx::__uselocale(__cloc);
  #else
 -		     _Tv __v, const __c_locale&, int __prec)
@@ -343,5 +343,5 @@
 +      const int __ret = std::vsnprintf(__out, __size, __fmt, __args);
 +      va_end(__args);
  
- #ifdef __UCLIBC_HAS_XCLOCALE__
+ #ifdef __UCLIBC_HAS_XLOCALE__
        __gnu_cxx::__uselocale(__old);
