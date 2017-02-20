From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 23:43:22 +0100
Subject: [Buildroot] [git commit] gcc: add patches for or1k specific gcc
	version
Message-ID: <20170220231337.7B5C38215E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7c7a8bf5481e898e7591442b0d924c2952797ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a number of patches from package/gcc/5.4.0 to
package/gcc/musl-5.4.0, so that they apply to the or1k specific gcc
version. All patches from package/gcc/5.4.0 that are not architecture
specific and not related to the musl C library have been added to
package/gcc/musl-5.4.0/.

Note that doing a symbolic link does not work, as some patches from
package/gcc/5.4.0 do not apply as-is to the or1k gcc version.

The most important patch is 850-libstdcxx-uclibc-c99.patch, which fixes
a number of build issues.

Fixes:

  http://autobuild.buildroot.net/results/eebf4ce5ecb896e54912cfa21268e81ff5fb6593/
  (alljoyn)

  http://autobuild.buildroot.net/results/8dbf406898a59e36ac6a1e16f543b6260da775c8/
  (jsoncpp)

  http://autobuild.buildroot.net/results/206fbd5473c8c6840489990cb2552566c62ef3c8/
  (dawgic)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/musl-5.4.0/100-uclibc-conf.patch       |  15 ++
 .../gcc/musl-5.4.0/301-missing-execinfo_h.patch    |  13 +
 .../gcc/musl-5.4.0/850-libstdcxx-uclibc-c99.patch  | 273 +++++++++++++++++++++
 package/gcc/musl-5.4.0/860-cilk-wchar.patch        |  56 +++++
 .../930-libgcc-disable-split-stack-nothreads.patch |  14 ++
 5 files changed, 371 insertions(+)

diff --git a/package/gcc/musl-5.4.0/100-uclibc-conf.patch b/package/gcc/musl-5.4.0/100-uclibc-conf.patch
new file mode 100644
index 0000000..73d1f0d
--- /dev/null
+++ b/package/gcc/musl-5.4.0/100-uclibc-conf.patch
@@ -0,0 +1,15 @@
+Index: b/contrib/regression/objs-gcc.sh
+===================================================================
+--- a/contrib/regression/objs-gcc.sh
++++ b/contrib/regression/objs-gcc.sh
+@@ -106,6 +106,10 @@
+  then
+   make all-gdb all-dejagnu all-ld || exit 1
+   make install-gdb install-dejagnu install-ld || exit 1
++elif [ $H_REAL_TARGET = $H_REAL_HOST -a $H_REAL_TARGET = i686-pc-linux-uclibc ]
++ then
++  make all-gdb all-dejagnu all-ld || exit 1
++  make install-gdb install-dejagnu install-ld || exit 1
+ elif [ $H_REAL_TARGET = $H_REAL_HOST ] ; then
+   make bootstrap || exit 1
+   make install || exit 1
diff --git a/package/gcc/musl-5.4.0/301-missing-execinfo_h.patch b/package/gcc/musl-5.4.0/301-missing-execinfo_h.patch
new file mode 100644
index 0000000..2d0e7ba
--- /dev/null
+++ b/package/gcc/musl-5.4.0/301-missing-execinfo_h.patch
@@ -0,0 +1,13 @@
+Index: b/boehm-gc/include/gc.h
+===================================================================
+--- a/boehm-gc/include/gc.h
++++ b/boehm-gc/include/gc.h
+@@ -503,7 +503,7 @@
+ #if defined(__linux__) || defined(__GLIBC__)
+ # include <features.h>
+ # if (__GLIBC__ == 2 && __GLIBC_MINOR__ >= 1 || __GLIBC__ > 2) \
+-     && !defined(__ia64__)
++     && !defined(__ia64__) && !defined(__UCLIBC__)
+ #   ifndef GC_HAVE_BUILTIN_BACKTRACE
+ #     define GC_HAVE_BUILTIN_BACKTRACE
+ #   endif
diff --git a/package/gcc/musl-5.4.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/musl-5.4.0/850-libstdcxx-uclibc-c99.patch
new file mode 100644
index 0000000..9e97d94
--- /dev/null
+++ b/package/gcc/musl-5.4.0/850-libstdcxx-uclibc-c99.patch
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
+@@ -5239,7 +5239,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if __cplusplus >= 201103L && defined(_GLIBCXX_USE_C99)
++#if __cplusplus >= 201103L && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__))
+ 
+ #include <ext/string_conversions.h>
+ 
+Index: b/libstdc++-v3/include/bits/locale_facets.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets.tcc
++++ b/libstdc++-v3/include/bits/locale_facets.tcc
+@@ -992,7 +992,7 @@
+ 	char __fbuf[16];
+ 	__num_base::_S_format_float(__io, __fbuf, __mod);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 	// Precision is always used except for hexfloat format.
+ 	const bool __use_prec =
+ 	  (__io.flags() & ios_base::floatfield) != ios_base::floatfield;
+Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+===================================================================
+--- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
++++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+@@ -578,7 +578,7 @@
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
+@@ -195,7 +195,7 @@
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
+@@ -144,7 +144,7 @@
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
+@@ -192,7 +192,7 @@
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
+@@ -2680,7 +2680,7 @@
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
+@@ -788,7 +788,7 @@
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
+@@ -146,7 +146,7 @@
+   using ::vsprintf;
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
diff --git a/package/gcc/musl-5.4.0/860-cilk-wchar.patch b/package/gcc/musl-5.4.0/860-cilk-wchar.patch
new file mode 100644
index 0000000..1d9916f
--- /dev/null
+++ b/package/gcc/musl-5.4.0/860-cilk-wchar.patch
@@ -0,0 +1,56 @@
+[PATCH] cilk: fix build without wchar
+
+When building against uClibc with wchar support disabled, WCHAR_MIN and
+WCHAR_MAX are not defined leading to compilation errors.
+
+Fix it by only including the wchar code if available.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ libcilkrts/include/cilk/reducer_min_max.h |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+Index: b/libcilkrts/include/cilk/reducer_min_max.h
+===================================================================
+--- a/libcilkrts/include/cilk/reducer_min_max.h
++++ b/libcilkrts/include/cilk/reducer_min_max.h
+@@ -3154,7 +3154,9 @@
+ CILK_C_REDUCER_MAX_INSTANCE(char,               char,       CHAR_MIN)
+ CILK_C_REDUCER_MAX_INSTANCE(unsigned char,      uchar,      0)
+ CILK_C_REDUCER_MAX_INSTANCE(signed char,        schar,      SCHAR_MIN)
++#ifdef WCHAR_MIN
+ CILK_C_REDUCER_MAX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
++#endif
+ CILK_C_REDUCER_MAX_INSTANCE(short,              short,      SHRT_MIN)
+ CILK_C_REDUCER_MAX_INSTANCE(unsigned short,     ushort,     0)
+ CILK_C_REDUCER_MAX_INSTANCE(int,                int,        INT_MIN)
+@@ -3306,7 +3308,9 @@
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(char,               char,       CHAR_MIN)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned char,      uchar,      0)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(signed char,        schar,      SCHAR_MIN)
++#ifdef WCHAR_MIN
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MIN)
++#endif
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(short,              short,      SHRT_MIN)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(unsigned short,     ushort,     0)
+ CILK_C_REDUCER_MAX_INDEX_INSTANCE(int,                int,        INT_MIN)
+@@ -3432,7 +3436,9 @@
+ CILK_C_REDUCER_MIN_INSTANCE(char,               char,       CHAR_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(signed char,        schar,      SCHAR_MAX)
++#ifdef WCHAR_MAX
+ CILK_C_REDUCER_MIN_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
++#endif
+ CILK_C_REDUCER_MIN_INSTANCE(short,              short,      SHRT_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
+ CILK_C_REDUCER_MIN_INSTANCE(int,                int,        INT_MAX)
+@@ -3584,7 +3590,9 @@
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(char,               char,       CHAR_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned char,      uchar,      CHAR_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(signed char,        schar,      SCHAR_MAX)
++#ifdef WCHAR_MAX
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(wchar_t,            wchar_t,    WCHAR_MAX)
++#endif
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(short,              short,      SHRT_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(unsigned short,     ushort,     USHRT_MAX)
+ CILK_C_REDUCER_MIN_INDEX_INSTANCE(int,                int,        INT_MAX)
diff --git a/package/gcc/musl-5.4.0/930-libgcc-disable-split-stack-nothreads.patch b/package/gcc/musl-5.4.0/930-libgcc-disable-split-stack-nothreads.patch
new file mode 100644
index 0000000..07f9a73
--- /dev/null
+++ b/package/gcc/musl-5.4.0/930-libgcc-disable-split-stack-nothreads.patch
@@ -0,0 +1,14 @@
+disable split-stack for non-thread builds
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur gcc-5.3.0.orig/libgcc/config/t-stack gcc-5.3.0/libgcc/config/t-stack
+--- gcc-5.3.0.orig/libgcc/config/t-stack	2010-10-01 21:31:49.000000000 +0200
++++ gcc-5.3.0/libgcc/config/t-stack	2016-03-07 03:25:32.000000000 +0100
+@@ -1,4 +1,6 @@
+ # Makefile fragment to provide generic support for -fsplit-stack.
+ # This should be used in config.host for any host which supports
+ # -fsplit-stack.
++ifeq ($(enable_threads),yes)
+ LIB2ADD_ST += $(srcdir)/generic-morestack.c $(srcdir)/generic-morestack-thread.c
++endif
