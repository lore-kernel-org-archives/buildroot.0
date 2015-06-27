From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Jun 2015 08:33:31 -0300
Subject: [Buildroot] [PATCH] gcc: bump 4.9.x series to version 4.9.3
Message-ID: <1435404811-17745-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 110-pr64896.patch and 920-libgcc-remove-unistd-header.patch since
they're upstream.

Tweak 850-libstdcxx-uclibc-c99.patch for this new release.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/4.9.2/110-pr64896.patch                |  59 -----
 package/gcc/4.9.2/850-libstdcxx-uclibc-c99.patch   | 273 ---------------------
 .../4.9.2/920-libgcc-remove-unistd-header.patch    |  12 -
 package/gcc/{4.9.2 => 4.9.3}/100-uclibc-conf.patch |   0
 ...00-powerpc-link-with-math-lib.patch.conditional |   0
 package/gcc/{4.9.2 => 4.9.3}/111-pr65730.patch     |   0
 .../{4.9.2 => 4.9.3}/301-missing-execinfo_h.patch  |   0
 .../810-arm-softfloat-libgcc.patch                 |   0
 .../{4.9.2 => 4.9.3}/830-arm_unbreak_armv4t.patch  |   0
 .../840-microblaze-enable-dwarf-eh-support.patch   |   0
 package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch   | 255 +++++++++++++++++++
 package/gcc/{4.9.2 => 4.9.3}/860-cilk-wchar.patch  |   0
 .../gcc/{4.9.2 => 4.9.3}/900-musl-support.patch    |   0
 .../910-gcc-poison-system-directories.patch        |   0
 package/gcc/Config.in.host                         |   2 +-
 package/gcc/gcc.hash                               |   4 +-
 16 files changed, 258 insertions(+), 347 deletions(-)
 delete mode 100644 package/gcc/4.9.2/110-pr64896.patch
 delete mode 100644 package/gcc/4.9.2/850-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch
 rename package/gcc/{4.9.2 => 4.9.3}/100-uclibc-conf.patch (100%)
 rename package/gcc/{4.9.2 => 4.9.3}/1000-powerpc-link-with-math-lib.patch.conditional (100%)
 rename package/gcc/{4.9.2 => 4.9.3}/111-pr65730.patch (100%)
 rename package/gcc/{4.9.2 => 4.9.3}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{4.9.2 => 4.9.3}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{4.9.2 => 4.9.3}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{4.9.2 => 4.9.3}/840-microblaze-enable-dwarf-eh-support.patch (100%)
 create mode 100644 package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch
 rename package/gcc/{4.9.2 => 4.9.3}/860-cilk-wchar.patch (100%)
 rename package/gcc/{4.9.2 => 4.9.3}/900-musl-support.patch (100%)
 rename package/gcc/{4.9.2 => 4.9.3}/910-gcc-poison-system-directories.patch (100%)

diff --git a/package/gcc/4.9.2/110-pr64896.patch b/package/gcc/4.9.2/110-pr64896.patch
deleted file mode 100644
index 92b6cb8..0000000
--- a/package/gcc/4.9.2/110-pr64896.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From fc39d7d6f0ac90086814306a43de38ad65c13f13 Mon Sep 17 00:00:00 2001
-From: yroux <yroux@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Tue, 10 Mar 2015 19:20:30 +0000
-Subject: [PATCH] gcc/ 2015-03-10  Yvan Roux  <yvan.roux@linaro.org>
-
-	Backport from trunk r220489.
-	2015-02-06  Jakub Jelinek  <jakub@redhat.com>
-
-	PR ipa/64896
-	* cgraphunit.c (cgraph_node::expand_thunk): If
-	restype is not is_gimple_reg_type nor the thunk_fndecl
-	returns aggregate_value_p, set restmp to a temporary variable
-	instead of resdecl.
-
-gcc/testsuite/
-2015-03-10  Yvan Roux  <yvan.roux@linaro.org>
-
-	Backport from trunk r220489.
-	2015-02-06  Jakub Jelinek  <jakub@redhat.com>
-
-	PR ipa/64896
-	* g++.dg/ipa/pr64896.C: New test.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_9-branch at 221333 138bc75d-0d04-0410-961f-82ee72b054a4
----
- gcc/ChangeLog                      | 11 +++++++++++
- gcc/cgraphunit.c                   | 11 ++++++++---
- gcc/testsuite/ChangeLog            |  8 ++++++++
- gcc/testsuite/g++.dg/ipa/pr64896.C | 29 +++++++++++++++++++++++++++++
- 4 files changed, 56 insertions(+), 3 deletions(-)
- create mode 100644 gcc/testsuite/g++.dg/ipa/pr64896.C
-
-diff --git a/gcc/cgraphunit.c b/gcc/cgraphunit.c
-index 8f57607..130fc0d 100644
---- a/gcc/cgraphunit.c
-+++ b/gcc/cgraphunit.c
-@@ -1572,9 +1572,14 @@ expand_thunk (struct cgraph_node *node, bool output_asm_thunks)
- 	    restmp = gimple_fold_indirect_ref (resdecl);
- 	  else if (!is_gimple_reg_type (restype))
- 	    {
--	      restmp = resdecl;
--	      add_local_decl (cfun, restmp);
--	      BLOCK_VARS (DECL_INITIAL (current_function_decl)) = restmp;
-+	      if (aggregate_value_p (resdecl, TREE_TYPE (thunk_fndecl)))
-+		{
-+		  restmp = resdecl;
-+		  add_local_decl (cfun, restmp);
-+		  BLOCK_VARS (DECL_INITIAL (current_function_decl)) = restmp;
-+		}
-+	      else
-+		restmp = create_tmp_var (restype, "retval");
- 	    }
- 	  else
- 	    restmp = create_tmp_reg (restype, "retval");
--- 
-1.8.1.4
-
diff --git a/package/gcc/4.9.2/850-libstdcxx-uclibc-c99.patch b/package/gcc/4.9.2/850-libstdcxx-uclibc-c99.patch
deleted file mode 100644
index 331cdcb..0000000
--- a/package/gcc/4.9.2/850-libstdcxx-uclibc-c99.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-Allow C99-depending features of libstdc++ with uClibc
-
-The libstdc++ code is fairly restrictive on how it checks for C99
-compatibility: it requires *complete* C99 support to enable certain
-features. For example, uClibc provides a good number of C99 features,
-but not C99 complex number support. For this reason, libstdc++
-completely disables many the standard C++ methods that can in fact
-work because uClibc provides the necessary functions.
-
-This patch is similar and highly inspired from
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58393, but implemented in
-a way that doesn't involve changing the configure.ac script, as
-autoreconfiguring gcc is complicated. It simply relies on the fact
-that uClibc defines the __UCLIBC__ definition.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/libstdc++-v3/config/locale/generic/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/generic/c_locale.h
-+++ b/libstdc++-v3/config/locale/generic/c_locale.h
-@@ -70,7 +70,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/config/locale/gnu/c_locale.h
-===================================================================
---- a/libstdc++-v3/config/locale/gnu/c_locale.h
-+++ b/libstdc++-v3/config/locale/gnu/c_locale.h
-@@ -88,7 +88,7 @@
-     __builtin_va_list __args;
-     __builtin_va_start(__args, __fmt);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
- #else
-     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
-Index: b/libstdc++-v3/include/bits/basic_string.h
-===================================================================
---- a/libstdc++-v3/include/bits/basic_string.h
-+++ b/libstdc++-v3/include/bits/basic_string.h
-@@ -2828,7 +2828,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99) \
-+#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)) \
-      && !defined(_GLIBCXX_HAVE_BROKEN_VSWPRINTF))
- 
- #include <ext/string_conversions.h>
-Index: b/libstdc++-v3/include/bits/locale_facets.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets.tcc
-@@ -987,7 +987,7 @@
- 	char __fbuf[16];
- 	__num_base::_S_format_float(__io, __fbuf, __mod);
- 
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 	// First try a buffer perhaps big enough (most probably sufficient
- 	// for non-ios_base::fixed outputs)
- 	int __cs_size = __max_digits * 3;
-Index: b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-===================================================================
---- a/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-+++ b/libstdc++-v3/include/bits/locale_facets_nonio.tcc
-@@ -572,7 +572,7 @@
-     {
-       const locale __loc = __io.getloc();
-       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       // First try a buffer perhaps big enough.
-       int __cs_size = 64;
-       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
-Index: b/libstdc++-v3/include/c_compatibility/math.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/math.h
-+++ b/libstdc++-v3/include/c_compatibility/math.h
-@@ -56,7 +56,7 @@
- using std::floor;
- using std::fmod;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::fpclassify;
- using std::isfinite;
- using std::isinf;
-Index: b/libstdc++-v3/include/c_compatibility/wchar.h
-===================================================================
---- a/libstdc++-v3/include/c_compatibility/wchar.h
-+++ b/libstdc++-v3/include/c_compatibility/wchar.h
-@@ -103,7 +103,7 @@
- using std::wmemset;
- using std::wcsftime;
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- using std::wcstold;
- using std::wcstoll;
- using std::wcstoull;
-Index: b/libstdc++-v3/include/c_global/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdlib
-+++ b/libstdc++-v3/include/c_global/cstdlib
-@@ -182,7 +182,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_global/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_global/cwchar
-+++ b/libstdc++-v3/include/c_global/cwchar
-@@ -232,7 +232,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-@@ -289,7 +289,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/c_std/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdio
-+++ b/libstdc++-v3/include/c_std/cstdio
-@@ -144,7 +144,7 @@
-   using ::vsprintf;
- } // namespace std
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
-Index: b/libstdc++-v3/include/c_std/cstdlib
-===================================================================
---- a/libstdc++-v3/include/c_std/cstdlib
-+++ b/libstdc++-v3/include/c_std/cstdlib
-@@ -180,7 +180,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef _Exit
- #undef llabs
-Index: b/libstdc++-v3/include/c_std/cwchar
-===================================================================
---- a/libstdc++-v3/include/c_std/cwchar
-+++ b/libstdc++-v3/include/c_std/cwchar
-@@ -228,7 +228,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef wcstold
- #undef wcstoll
-Index: b/libstdc++-v3/include/ext/vstring.h
-===================================================================
---- a/libstdc++-v3/include/ext/vstring.h
-+++ b/libstdc++-v3/include/ext/vstring.h
-@@ -2680,7 +2680,7 @@
- _GLIBCXX_END_NAMESPACE_VERSION
- } // namespace
- 
--#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
-+#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
- 
- #include <ext/string_conversions.h>
- 
-Index: b/libstdc++-v3/include/tr1/cstdio
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdio
-+++ b/libstdc++-v3/include/tr1/cstdio
-@@ -33,7 +33,7 @@
- 
- #include <cstdio>
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cstdlib
-===================================================================
---- a/libstdc++-v3/include/tr1/cstdlib
-+++ b/libstdc++-v3/include/tr1/cstdlib
-@@ -35,7 +35,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- namespace std _GLIBCXX_VISIBILITY(default)
- {
-Index: b/libstdc++-v3/include/tr1/cwchar
-===================================================================
---- a/libstdc++-v3/include/tr1/cwchar
-+++ b/libstdc++-v3/include/tr1/cwchar
-@@ -52,7 +52,7 @@
-   using std::vwscanf;
- #endif
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-   using std::wcstold;
-   using std::wcstoll;
-   using std::wcstoull;
-Index: b/libstdc++-v3/include/tr1/stdlib.h
-===================================================================
---- a/libstdc++-v3/include/tr1/stdlib.h
-+++ b/libstdc++-v3/include/tr1/stdlib.h
-@@ -33,7 +33,7 @@
- 
- #if _GLIBCXX_HOSTED
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- using std::tr1::atoll;
- using std::tr1::strtoll;
-Index: b/libstdc++-v3/src/c++11/debug.cc
-===================================================================
---- a/libstdc++-v3/src/c++11/debug.cc
-+++ b/libstdc++-v3/src/c++11/debug.cc
-@@ -788,7 +788,7 @@
- 				     int __n __attribute__ ((__unused__)), 
- 				     const char* __fmt, _Tp __s) const throw ()
-     {
--#ifdef _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
-       std::snprintf(__buf, __n, __fmt, __s);
- #else
-       std::sprintf(__buf, __fmt, __s);
-Index: b/libstdc++-v3/include/c_global/cstdio
-===================================================================
---- a/libstdc++-v3/include/c_global/cstdio
-+++ b/libstdc++-v3/include/c_global/cstdio
-@@ -146,7 +146,7 @@
-   using ::vsprintf;
- } // namespace
- 
--#if _GLIBCXX_USE_C99
-+#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
- 
- #undef snprintf
- #undef vfscanf
diff --git a/package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch b/package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch
deleted file mode 100644
index df5372b..0000000
--- a/package/gcc/4.9.2/920-libgcc-remove-unistd-header.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream status: In progress
-
---- a/libgcc/config/nios2/linux-atomic.c
-+++ b/libgcc/config/nios2/linux-atomic.c
-@@ -20,7 +20,6 @@
- see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
- <http://www.gnu.org/licenses/>.  */
- 
--#include <asm/unistd.h>
- #define EFAULT  14
- #define EBUSY   16
- #define ENOSYS  38
diff --git a/package/gcc/4.9.2/100-uclibc-conf.patch b/package/gcc/4.9.3/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/4.9.2/100-uclibc-conf.patch
rename to package/gcc/4.9.3/100-uclibc-conf.patch
diff --git a/package/gcc/4.9.2/1000-powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.9.3/1000-powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.9.2/1000-powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.9.3/1000-powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/4.9.2/111-pr65730.patch b/package/gcc/4.9.3/111-pr65730.patch
similarity index 100%
rename from package/gcc/4.9.2/111-pr65730.patch
rename to package/gcc/4.9.3/111-pr65730.patch
diff --git a/package/gcc/4.9.2/301-missing-execinfo_h.patch b/package/gcc/4.9.3/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/4.9.2/301-missing-execinfo_h.patch
rename to package/gcc/4.9.3/301-missing-execinfo_h.patch
diff --git a/package/gcc/4.9.2/810-arm-softfloat-libgcc.patch b/package/gcc/4.9.3/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/4.9.2/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.9.3/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/4.9.2/830-arm_unbreak_armv4t.patch b/package/gcc/4.9.3/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/4.9.2/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.9.3/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/4.9.2/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/4.9.3/840-microblaze-enable-dwarf-eh-support.patch
similarity index 100%
rename from package/gcc/4.9.2/840-microblaze-enable-dwarf-eh-support.patch
rename to package/gcc/4.9.3/840-microblaze-enable-dwarf-eh-support.patch
diff --git a/package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch b/package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch
new file mode 100644
index 0000000..d103af1
--- /dev/null
+++ b/package/gcc/4.9.3/850-libstdcxx-uclibc-c99.patch
@@ -0,0 +1,255 @@
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
+[Gustavo: update for 4.9.3]
+
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/config/locale/generic/c_locale.h gcc-4.9.3/libstdc++-v3/config/locale/generic/c_locale.h
+--- gcc-4.9.3.orig/libstdc++-v3/config/locale/generic/c_locale.h	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/config/locale/generic/c_locale.h	2015-06-27 06:46:04.420022179 -0300
+@@ -70,7 +70,7 @@
+     __builtin_va_list __args;
+     __builtin_va_start(__args, __fmt);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
+ #else
+     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/config/locale/gnu/c_locale.h gcc-4.9.3/libstdc++-v3/config/locale/gnu/c_locale.h
+--- gcc-4.9.3.orig/libstdc++-v3/config/locale/gnu/c_locale.h	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/config/locale/gnu/c_locale.h	2015-06-27 06:46:04.465023743 -0300
+@@ -88,7 +88,7 @@
+     __builtin_va_list __args;
+     __builtin_va_start(__args, __fmt);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+     const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);
+ #else
+     const int __ret = __builtin_vsprintf(__out, __fmt, __args);
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/basic_string.h gcc-4.9.3/libstdc++-v3/include/bits/basic_string.h
+--- gcc-4.9.3.orig/libstdc++-v3/include/bits/basic_string.h	2015-05-28 13:27:46.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/bits/basic_string.h	2015-06-27 06:49:04.741284648 -0300
+@@ -2844,7 +2844,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if __cplusplus >= 201103L && defined(_GLIBCXX_USE_C99)
++#if __cplusplus >= 201103L && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__))
+ 
+ #include <ext/string_conversions.h>
+ 
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets_nonio.tcc gcc-4.9.3/libstdc++-v3/include/bits/locale_facets_nonio.tcc
+--- gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets_nonio.tcc	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/bits/locale_facets_nonio.tcc	2015-06-27 06:46:04.466023777 -0300
+@@ -572,7 +572,7 @@
+     {
+       const locale __loc = __io.getloc();
+       const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+       // First try a buffer perhaps big enough.
+       int __cs_size = 64;
+       char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets.tcc gcc-4.9.3/libstdc++-v3/include/bits/locale_facets.tcc
+--- gcc-4.9.3.orig/libstdc++-v3/include/bits/locale_facets.tcc	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/bits/locale_facets.tcc	2015-06-27 06:46:04.466023777 -0300
+@@ -987,7 +987,7 @@
+ 	char __fbuf[16];
+ 	__num_base::_S_format_float(__io, __fbuf, __mod);
+ 
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 	// First try a buffer perhaps big enough (most probably sufficient
+ 	// for non-ios_base::fixed outputs)
+ 	int __cs_size = __max_digits * 3;
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/math.h gcc-4.9.3/libstdc++-v3/include/c_compatibility/math.h
+--- gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/math.h	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/c_compatibility/math.h	2015-06-27 06:46:04.466023777 -0300
+@@ -56,7 +56,7 @@
+ using std::floor;
+ using std::fmod;
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ using std::fpclassify;
+ using std::isfinite;
+ using std::isinf;
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/wchar.h gcc-4.9.3/libstdc++-v3/include/c_compatibility/wchar.h
+--- gcc-4.9.3.orig/libstdc++-v3/include/c_compatibility/wchar.h	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/c_compatibility/wchar.h	2015-06-27 06:46:04.466023777 -0300
+@@ -103,7 +103,7 @@
+ using std::wmemset;
+ using std::wcsftime;
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ using std::wcstold;
+ using std::wcstoll;
+ using std::wcstoull;
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdio gcc-4.9.3/libstdc++-v3/include/c_global/cstdio
+--- gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdio	2014-01-23 18:17:15.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/c_global/cstdio	2015-06-27 06:46:04.481024298 -0300
+@@ -146,7 +146,7 @@
+   using ::vsprintf;
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdlib gcc-4.9.3/libstdc++-v3/include/c_global/cstdlib
+--- gcc-4.9.3.orig/libstdc++-v3/include/c_global/cstdlib	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/c_global/cstdlib	2015-06-27 06:46:04.466023777 -0300
+@@ -182,7 +182,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef _Exit
+ #undef llabs
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_global/cwchar gcc-4.9.3/libstdc++-v3/include/c_global/cwchar
+--- gcc-4.9.3.orig/libstdc++-v3/include/c_global/cwchar	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/c_global/cwchar	2015-06-27 06:46:04.466023777 -0300
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
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdio gcc-4.9.3/libstdc++-v3/include/c_std/cstdio
+--- gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdio	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/c_std/cstdio	2015-06-27 06:46:04.480024263 -0300
+@@ -144,7 +144,7 @@
+   using ::vsprintf;
+ } // namespace std
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef snprintf
+ #undef vfscanf
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdlib gcc-4.9.3/libstdc++-v3/include/c_std/cstdlib
+--- gcc-4.9.3.orig/libstdc++-v3/include/c_std/cstdlib	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/c_std/cstdlib	2015-06-27 06:46:04.480024263 -0300
+@@ -180,7 +180,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef _Exit
+ #undef llabs
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/c_std/cwchar gcc-4.9.3/libstdc++-v3/include/c_std/cwchar
+--- gcc-4.9.3.orig/libstdc++-v3/include/c_std/cwchar	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/c_std/cwchar	2015-06-27 06:46:04.480024263 -0300
+@@ -228,7 +228,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ #undef wcstold
+ #undef wcstoll
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/ext/vstring.h gcc-4.9.3/libstdc++-v3/include/ext/vstring.h
+--- gcc-4.9.3.orig/libstdc++-v3/include/ext/vstring.h	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/ext/vstring.h	2015-06-27 06:46:04.480024263 -0300
+@@ -2680,7 +2680,7 @@
+ _GLIBCXX_END_NAMESPACE_VERSION
+ } // namespace
+ 
+-#if ((__cplusplus >= 201103L) && defined(_GLIBCXX_USE_C99))
++#if ((__cplusplus >= 201103L) && (defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)))
+ 
+ #include <ext/string_conversions.h>
+ 
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdio gcc-4.9.3/libstdc++-v3/include/tr1/cstdio
+--- gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdio	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/tr1/cstdio	2015-06-27 06:46:04.480024263 -0300
+@@ -33,7 +33,7 @@
+ 
+ #include <cstdio>
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdlib gcc-4.9.3/libstdc++-v3/include/tr1/cstdlib
+--- gcc-4.9.3.orig/libstdc++-v3/include/tr1/cstdlib	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/tr1/cstdlib	2015-06-27 06:46:04.480024263 -0300
+@@ -35,7 +35,7 @@
+ 
+ #if _GLIBCXX_HOSTED
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ namespace std _GLIBCXX_VISIBILITY(default)
+ {
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/cwchar gcc-4.9.3/libstdc++-v3/include/tr1/cwchar
+--- gcc-4.9.3.orig/libstdc++-v3/include/tr1/cwchar	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/tr1/cwchar	2015-06-27 06:46:04.480024263 -0300
+@@ -52,7 +52,7 @@
+   using std::vwscanf;
+ #endif
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+   using std::wcstold;
+   using std::wcstoll;
+   using std::wcstoull;
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/include/tr1/stdlib.h gcc-4.9.3/libstdc++-v3/include/tr1/stdlib.h
+--- gcc-4.9.3.orig/libstdc++-v3/include/tr1/stdlib.h	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/include/tr1/stdlib.h	2015-06-27 06:46:04.481024298 -0300
+@@ -33,7 +33,7 @@
+ 
+ #if _GLIBCXX_HOSTED
+ 
+-#if _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+ 
+ using std::tr1::atoll;
+ using std::tr1::strtoll;
+diff -Nura gcc-4.9.3.orig/libstdc++-v3/src/c++11/debug.cc gcc-4.9.3/libstdc++-v3/src/c++11/debug.cc
+--- gcc-4.9.3.orig/libstdc++-v3/src/c++11/debug.cc	2014-01-02 19:30:10.000000000 -0300
++++ gcc-4.9.3/libstdc++-v3/src/c++11/debug.cc	2015-06-27 06:46:04.481024298 -0300
+@@ -788,7 +788,7 @@
+ 				     int __n __attribute__ ((__unused__)), 
+ 				     const char* __fmt, _Tp __s) const throw ()
+     {
+-#ifdef _GLIBCXX_USE_C99
++#if defined(_GLIBCXX_USE_C99) || defined(__UCLIBC__)
+       std::snprintf(__buf, __n, __fmt, __s);
+ #else
+       std::sprintf(__buf, __fmt, __s);
diff --git a/package/gcc/4.9.2/860-cilk-wchar.patch b/package/gcc/4.9.3/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/4.9.2/860-cilk-wchar.patch
rename to package/gcc/4.9.3/860-cilk-wchar.patch
diff --git a/package/gcc/4.9.2/900-musl-support.patch b/package/gcc/4.9.3/900-musl-support.patch
similarity index 100%
rename from package/gcc/4.9.2/900-musl-support.patch
rename to package/gcc/4.9.3/900-musl-support.patch
diff --git a/package/gcc/4.9.2/910-gcc-poison-system-directories.patch b/package/gcc/4.9.3/910-gcc-poison-system-directories.patch
similarity index 100%
rename from package/gcc/4.9.2/910-gcc-poison-system-directories.patch
rename to package/gcc/4.9.3/910-gcc-poison-system-directories.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 7189407..712f8e9 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -95,7 +95,7 @@ config BR2_GCC_VERSION
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
-	default "4.9.2"     if BR2_GCC_VERSION_4_9_X
+	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
 	default "5.1.0"     if BR2_GCC_VERSION_5_1_X
 	default "arc-2014.12" if BR2_GCC_VERSION_4_8_ARC
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 1a27d1c..fe956a7 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  78696b287d46aacd6f150920da376ea32f58ad9f0dafd2d3b7fa6dbdd8dd7afe659108d1
 sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e3f0f227eb43cdf90e0d34cde5abdc9ac892c1e111a911062a66c9189  gcc-4.7.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.8.5/sha512.sum
 sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbcc30e80832fd244a7d98f562c20198056915c70cfef0977545073a8ea  gcc-4.8.5.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.2/sha512.sum
-sha512  e96cba06d572dbe7f382a2b00fd9297dcf9f9219d46a9ad0bd904dc36d5e7db3335e422640b79a27fed6fde91b0731732b94a0e2fbcd47344d6779f8ba1f4f9c  gcc-4.9.2.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.3/sha512.sum
+sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a3144a79cc8fcba3443f7b44c7337d79d704b522d053f54f79aa6b442df  gcc-4.9.3.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.1.0/sha512.sum
 sha512  30f6a94d3adb25bc51fcaddf32a6c41429f569eeb9ed64330445b1296f99998fbfa03277b375be4f7b2b80f519910ef88e4149db7cd9031e2c61a49f501bde94  gcc-5.1.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
-- 
2.3.6
