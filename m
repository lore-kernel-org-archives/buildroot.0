From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Aug 2014 09:16:27 +0200
Subject: [Buildroot] [git commit] gcc/4.8: add patch to enable more C++
	features with uClibc
Message-ID: <20140817072258.5226D9C769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3d19b047aa38244e4eee7e826d68d54bb18101a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes bug #7250, by allowing more libstdc++ features to be
enabled with uClibc. libstdc++ wants an absolutely complete C99
support in the C library before enabling *any* feature that needs some
C99 functions. However, uClibc doesn't provide C99 complex numbers, so
libstdc++ disables a lot of C++ standard methods, even though they are
not related to C99 complex numbers.

A partial solution already existed in the patch
302-c99-snprintf.patch, but this commit replaces it by the more
complete 850-libstdcxx-uclibc-c99.patch, which is highly inspired by
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, except that it
doesn't rely on configure.ac checks, but simply on testing
defined(__UCLIBC__) like was done in 302-c99-snprintf.patch. This
allows to avoid having to autoreconf gcc, which is quite complicated
to achieve.

Reported-by: Richard <tarka.t.otter@gmail.com>
Cc: Richard <tarka.t.otter@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/4.8.3/302-c99-snprintf.patch         |   13 -
 package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch |  273 ++++++++++++++++++++++
 2 files changed, 273 insertions(+), 13 deletions(-)

diff --git a/package/gcc/4.8.3/302-c99-snprintf.patch b/package/gcc/4.8.3/302-c99-snprintf.patch
deleted file mode 100644
index cd4d2cc..0000000
--- a/package/gcc/4.8.3/302-c99-snprintf.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: gcc-4.8.0/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- gcc-4.8.0.orig/libstdc++-v3/include/c_global/cstdio	2013-02-03 18:54:05.000000000 +0100
-+++ gcc-4.8.0/libstdc++-v3/include/c_global/cstdio	2013-03-23 17:39:32.000000000 +0100
-@@ -138,7 +138,7 @@
-   using ::vsprintf;
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if _GLIBCXX_USE_C99 || defined __UCLIBC__
- 
- #undef snprintf
- #undef vfscanf
diff --git a/package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch b/package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch
new file mode 100644
index 0000000..792976f
--- /dev/null
+++ b/package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch
@@ -0,0 +1,273 @@
+Allow C99-depending features of libstdc++ with uClibc
+
+The libstdc++ code is fairly restrictive on how it checks for C99
+compatibility: it requires *complete* C99 support to enable certain
+features. For example, uClibc provides a good number of C99 features,
+but not C99 complex number support. For this reason, libstdc++
+completely disables many the standard C++ methods that can in fact
+work because uClibc provides the necessary functions.
+
+This patch is similar and highly inspired from
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, but implemented in
+a way that doesn't involve changing the configure.ac script, as
+autoreconfiguring gcc is complicated. It simply relies on the fact
+that uClibc defines the __UCLIBC__ definition.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libstdc++-v3/config/locale/generic/c_locale.h
+===================================================================
+--- a/libstdc++-v3/config/locale/generic/c_locale.h
++++ b/libstdc++-v3/config/locale/generic/c_locale.h
+@@ -70,7 +70,7 @@
+     __builtin_va_list __args;
+     __builtin_va_start(__args, __fmt);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
+ #else
+     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
+Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
+===================================================================
+--- a/libstdc++-v3/config/locale/gnu/c_locale.h
++++ b/libstdc++-v3/config/locale/gnu/c_locale.h
+@@ -88,7 +88,7 @@
+     __builtin_va_list __args;
+     __builtin_va_start(__args, __fmt);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
+ #else
+     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
+Index: b/libstdc++-v3/include/bits/basic_string.h
+===================================================================
+--- a/libstdc++-v3/include/bits/basic_string.h
++++ b/libstdc++-v3/include/bits/basic_string.h
+@@ -2809,7 +2809,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99) \
++#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)) \
+      && !defined(_GLIBCXX_HAVE_BROKEN_VSWPRINTF))
+ 
+ #include <ext/string_conversions.h>
+Index: b/libstdc++-v3/include/bits/locale_facets.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets.tcc
++++ b/libstdc++-v3/include/bits/locale_facets.tcc
+@@ -987,7 +987,7 @@
+ 	char __fbuf[16];
+ 	__num_base::_S_format_float(__io, __fbuf, __mod);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 	// First try a buffer perhaps big enough (most probably sufficient
+ 	// for non-ios_base::fixed outputs)
+ 	int __cs_size = __max_digits * 3;
+Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
++++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+@@ -572,7 +572,7 @@
+     {
+       const locale __loc = __io.getloc();
+       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+       // First try a buffer perhaps big enough.
+       int __cs_size = 64;
+       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
+Index: b/libstdc++-v3/include/c_compatibility/math.h
+===================================================================
+--- a/libstdc++-v3/include/c_compatibility/math.h
++++ b/libstdc++-v3/include/c_compatibility/math.h
+@@ -56,7 +56,7 @@
+ using std::floor;
+ using std::fmod;
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ using std::fpclassify;
+ using std::isfinite;
+ using std::isinf;
+Index: b/libstdc++-v3/include/c_compatibility/wchar.h
+===================================================================
+--- a/libstdc++-v3/include/c_compatibility/wchar.h
++++ b/libstdc++-v3/include/c_compatibility/wchar.h
+@@ -103,7 +103,7 @@
+ using std::wmemset;
+ using std::wcsftime;
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ using std::wcstold;
+ using std::wcstoll;
+ using std::wcstoull;
+Index: b/libstdc++-v3/include/c_global/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/c_global/cstdlib
++++ b/libstdc++-v3/include/c_global/cstdlib
+@@ -182,7 +182,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef _Exit
+ #undef llabs
+Index: b/libstdc++-v3/include/c_global/cwchar
+===================================================================
+--- a/libstdc++-v3/include/c_global/cwchar
++++ b/libstdc++-v3/include/c_global/cwchar
+@@ -232,7 +232,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef wcstold
+ #undef wcstoll
+@@ -289,7 +289,7 @@
+   using std::vwscanf;
+ #endif
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+   using std::wcstold;
+   using std::wcstoll;
+   using std::wcstoull;
+Index: b/libstdc++-v3/include/c_std/cstdio
+===================================================================
+--- a/libstdc++-v3/include/c_std/cstdio
++++ b/libstdc++-v3/include/c_std/cstdio
+@@ -139,7 +139,7 @@
+   using ::vsprintf;
+ } // namespace std
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
+Index: b/libstdc++-v3/include/c_std/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/c_std/cstdlib
++++ b/libstdc++-v3/include/c_std/cstdlib
+@@ -180,7 +180,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef _Exit
+ #undef llabs
+Index: b/libstdc++-v3/include/c_std/cwchar
+===================================================================
+--- a/libstdc++-v3/include/c_std/cwchar
++++ b/libstdc++-v3/include/c_std/cwchar
+@@ -228,7 +228,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef wcstold
+ #undef wcstoll
+Index: b/libstdc++-v3/include/ext/vstring.h
+===================================================================
+--- a/libstdc++-v3/include/ext/vstring.h
++++ b/libstdc++-v3/include/ext/vstring.h
+@@ -2571,7 +2571,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
++#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
+ 
+ #include <ext/string_conversions.h>
+ 
+Index: b/libstdc++-v3/include/tr1/cstdio
+===================================================================
+--- a/libstdc++-v3/include/tr1/cstdio
++++ b/libstdc++-v3/include/tr1/cstdio
+@@ -33,7 +33,7 @@
+ 
+ #include <cstdio>
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+Index: b/libstdc++-v3/include/tr1/cstdlib
+===================================================================
+--- a/libstdc++-v3/include/tr1/cstdlib
++++ b/libstdc++-v3/include/tr1/cstdlib
+@@ -35,7 +35,7 @@
+ 
+ #if _GLIBCXX_HOSTED
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+Index: b/libstdc++-v3/include/tr1/cwchar
+===================================================================
+--- a/libstdc++-v3/include/tr1/cwchar
++++ b/libstdc++-v3/include/tr1/cwchar
+@@ -52,7 +52,7 @@
+   using std::vwscanf;
+ #endif
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+   using std::wcstold;
+   using std::wcstoll;
+   using std::wcstoull;
+Index: b/libstdc++-v3/include/tr1/stdlib.h
+===================================================================
+--- a/libstdc++-v3/include/tr1/stdlib.h
++++ b/libstdc++-v3/include/tr1/stdlib.h
+@@ -33,7 +33,7 @@
+ 
+ #if _GLIBCXX_HOSTED
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ using std::tr1::atoll;
+ using std::tr1::strtoll;
+Index: b/libstdc++-v3/src/c++11/debug.cc
+===================================================================
+--- a/libstdc++-v3/src/c++11/debug.cc
++++ b/libstdc++-v3/src/c++11/debug.cc
+@@ -787,7 +787,7 @@
+ 				     int __n __attribute__ ((__unused__)), 
+ 				     const char* __fmt, _Tp __s) const throw ()
+     {
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+       std::snprintf(__buf, __n, __fmt, __s);
+ #else
+       std::sprintf(__buf, __fmt, __s);
+Index: b/libstdc++-v3/include/c_global/cstdio
+===================================================================
+--- a/libstdc++-v3/include/c_global/cstdio
++++ b/libstdc++-v3/include/c_global/cstdio
+@@ -139,7 +139,7 @@
+   using ::vsprintf;
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
