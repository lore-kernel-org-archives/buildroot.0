From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sun, 12 Mar 2017 13:16:38 +0100
Subject: [Buildroot] [PATCH v2] boost: bump to version 1.63.0
Message-ID: <20170312121638.14911-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove getchar() patch which has been applied upstream.

Add recommanded post-release patch from upstream to fix 64-bit atomic
operations on 32-bit x86 with gcc versions older than 4.7.

Add a patch from upstream to fix FPE issue with uClibc-based toolchains.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
v2:
 * include FPE patch
---
 ...ted-register-usage-in-x86-DCAS-asm-blocks.patch |  65 +++++++++++
 ...fix-getchar-with-uclibc-and-gcc-bug-58952.patch |  45 --------
 package/boost/0005-fix-test-of-fpe-support.patch   | 119 +++++++++++++++++++++
 package/boost/boost.hash                           |   5 +-
 package/boost/boost.mk                             |   2 +-
 5 files changed, 187 insertions(+), 49 deletions(-)
 create mode 100644 package/boost/0004-Corrected-register-usage-in-x86-DCAS-asm-blocks.patch
 delete mode 100644 package/boost/0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
 create mode 100644 package/boost/0005-fix-test-of-fpe-support.patch

diff --git a/package/boost/0004-Corrected-register-usage-in-x86-DCAS-asm-blocks.patch b/package/boost/0004-Corrected-register-usage-in-x86-DCAS-asm-blocks.patch
new file mode 100644
index 000000000..a955c1e2d
--- /dev/null
+++ b/package/boost/0004-Corrected-register-usage-in-x86-DCAS-asm-blocks.patch
@@ -0,0 +1,65 @@
+From a67cc1b055cf09f371e2eca544884634a1ccc886 Mon Sep 17 00:00:00 2001
+From: Andrey Semashev <andrey.semashev@gmail.com>
+Date: Sun, 8 Jan 2017 18:09:12 +0300
+Subject: [PATCH] Corrected register usage in x86 DCAS asm blocks.
+
+In some of the asm blocks eax was modified as a result of cmpxchg8b but that
+was not reflected in the register constraints. This could cause incorrect code
+being generated.
+
+Fetch from:
+https://github.com/boostorg/atomic/commit/a67cc1b055cf09f371e2eca544884634a1ccc886
+
+[Adjust github patch to tarball release]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ boost/atomic/detail/ops_gcc_x86_dcas.hpp | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/boost/atomic/detail/ops_gcc_x86_dcas.hpp b/boost/atomic/detail/ops_gcc_x86_dcas.hpp
+index 2f51182..e356e8c 100644
+--- a/boost/atomic/detail/ops_gcc_x86_dcas.hpp
++++ b/boost/atomic/detail/ops_gcc_x86_dcas.hpp
+@@ -73,6 +73,7 @@ struct gcc_dcas_x86
+         {
+ #if !defined(BOOST_ATOMIC_DETAIL_NO_ASM_IMPLIED_ZERO_DISPLACEMENTS)
+ #if defined(__PIC__)
++            uint32_t v_lo = (uint32_t)v;
+             uint32_t scratch;
+             __asm__ __volatile__
+             (
+@@ -84,8 +85,8 @@ struct gcc_dcas_x86
+                 "1: lock; cmpxchg8b %[dest]\n\t"
+                 "jne 1b\n\t"
+                 "movl %[scratch], %%ebx\n\t"
+-                : [scratch] "=m" (scratch), [dest] "=o" (storage)
+-                : [value_lo] "a" ((uint32_t)v), "c" ((uint32_t)(v >> 32))
++                : [scratch] "=m" (scratch), [dest] "=o" (storage), [value_lo] "+a" (v_lo)
++                : "c" ((uint32_t)(v >> 32))
+                 : BOOST_ATOMIC_DETAIL_ASM_CLOBBER_CC_COMMA "edx", "memory"
+             );
+ #else // defined(__PIC__)
+@@ -103,6 +104,7 @@ struct gcc_dcas_x86
+ #endif // defined(__PIC__)
+ #else // !defined(BOOST_ATOMIC_DETAIL_NO_ASM_IMPLIED_ZERO_DISPLACEMENTS)
+ #if defined(__PIC__)
++            uint32_t v_lo = (uint32_t)v;
+             uint32_t scratch;
+             __asm__ __volatile__
+             (
+@@ -115,11 +117,11 @@ struct gcc_dcas_x86
+                 "jne 1b\n\t"
+                 "movl %[scratch], %%ebx\n\t"
+ #if !defined(BOOST_ATOMIC_DETAIL_NO_ASM_CONSTRAINT_ALTERNATIVES)
+-                : [scratch] "=m,m" (scratch)
+-                : [value_lo] "a,a" ((uint32_t)v), "c,c" ((uint32_t)(v >> 32)), [dest] "D,S" (&storage)
++                : [scratch] "=m,m" (scratch), [value_lo] "+a,a" (v_lo)
++                : "c,c" ((uint32_t)(v >> 32)), [dest] "D,S" (&storage)
+ #else
+-                : [scratch] "=m" (scratch)
+-                : [value_lo] "a" ((uint32_t)v), "c" ((uint32_t)(v >> 32)), [dest] "D" (&storage)
++                : [scratch] "=m" (scratch), [value_lo] "+a" (v_lo)
++                : "c" ((uint32_t)(v >> 32)), [dest] "D" (&storage)
+ #endif
+                 : BOOST_ATOMIC_DETAIL_ASM_CLOBBER_CC_COMMA "edx", "memory"
+             );
diff --git a/package/boost/0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch b/package/boost/0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
deleted file mode 100644
index 960f0ea2f..000000000
--- a/package/boost/0004-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 4f1c6784b37a11c78fe84bb238fb7cc377ce0d36 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Wed, 30 Mar 2016 23:28:33 +0200
-Subject: [PATCH] Fix for uClibc and gcc <= 4.8.2
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-getchar() is defined as a macro in uClibc. This hits gcc bug 58952 [1] for all
-gcc version <= 4.8.2 and building boost/test fails:
-
-./boost/test/impl/unit_test_main.ipp: In function 'int boost::unit_test::unit_test_main(boost::unit_test::init_unit_test_func, int, char**)':
-./boost/test/impl/unit_test_main.ipp:194:18: error: expected unqualified-id before '(' token
-
-To allow building boost/test with uClibc based toolchains with gcc <= 4.8.2 use
-parenthesis for std::getchar.
-
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58952
-
-Upstream status: Pending
-https://github.com/boostorg/test/pull/97
-
-Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
----
- include/boost/test/impl/unit_test_main.ipp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/boost/test/impl/unit_test_main.ipp b/boost/test/impl/unit_test_main.ipp
-index 1f30c02..db61930 100644
---- a/boost/test/impl/unit_test_main.ipp
-+++ b/boost/test/impl/unit_test_main.ipp
-@@ -191,7 +191,9 @@ unit_test_main( init_unit_test_func init_func, int argc, char* argv[] )
-         if( runtime_config::get<bool>( runtime_config::WAIT_FOR_DEBUGGER ) ) {
-             results_reporter::get_stream() << "Press any key to continue..." << std::endl;
- 
--            std::getchar();
-+            // getchar is defined as a macro in uClibc. Use parenthesis to fix
-+            // gcc bug 58952 for gcc <= 4.8.2.
-+            (std::getchar)();
-             results_reporter::get_stream() << "Continuing..." << std::endl;
-         }
- 
--- 
-2.7.4
-
diff --git a/package/boost/0005-fix-test-of-fpe-support.patch b/package/boost/0005-fix-test-of-fpe-support.patch
new file mode 100644
index 000000000..4d8f827e5
--- /dev/null
+++ b/package/boost/0005-fix-test-of-fpe-support.patch
@@ -0,0 +1,119 @@
+From 066e28ccecb4bad5c0477606a138591f1da1963e Mon Sep 17 00:00:00 2001
+From: Raffi Enficiaud <raffi.enficiaud@free.fr>
+Date: Mon, 30 Jan 2017 22:09:12 +0100
+Subject: [PATCH] Preventing the compilation of floating points with GCC when
+ glibc is not in use
+
+- Gathering the support of FPE in one place/several macros and using those in both
+  execution_monitor.hpp and execution_monitor.ipp in a more coherent way
+- Updating the support of the floating point exceptions: fenableexcept/fdisableexcept are
+  GLIBC extensions and the definition of FENV does not imply the existance of those functions
+
+Fetch from:
+https://github.com/boostorg/test/commit/066e28ccecb4bad5c0477606a138591f1da1963e
+
+[Adjust github patch to tarball release]
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ boost/test/execution_monitor.hpp      | 17 +++++++++++++++--
+ boost/test/impl/execution_monitor.ipp | 21 +++++++--------------
+ 2 files changed, 22 insertions(+), 16 deletions(-)
+
+diff --git a/boost/test/execution_monitor.hpp b/boost/test/execution_monitor.hpp
+index f53348a..12c5644 100644
+--- a/boost/test/execution_monitor.hpp
++++ b/boost/test/execution_monitor.hpp
+@@ -66,6 +66,19 @@
+ 
+ #endif
+ 
++#if defined(BOOST_SEH_BASED_SIGNAL_HANDLING) && !defined(UNDER_CE)
++  //! Indicates tha the floating point exception handling is supported
++  //! through SEH
++  #define BOOST_TEST_FPE_SUPPORT_WITH_SEH__
++#elif !defined(BOOST_SEH_BASED_SIGNAL_HANDLING) && !defined(UNDER_CE)
++  #if !defined(BOOST_NO_FENV_H) && !defined(BOOST_CLANG) && \
++      (defined(__GLIBC__) && defined(__USE_GNU))
++  //! Indicates that floating point exception handling is supported for the
++  //! non SEH version of it, for the GLIBC extensions only
++  #define BOOST_TEST_FPE_SUPPORT_WITH_GLIBC_EXTENSIONS__
++  #endif
++#endif
++
+ 
+ // Additional macro documentations not being generated without this hack
+ #ifdef BOOST_TEST_DOXYGEN_DOC__
+@@ -489,7 +502,7 @@ namespace fpe {
+ enum masks {
+     BOOST_FPE_OFF       = 0,
+ 
+-#ifdef BOOST_SEH_BASED_SIGNAL_HANDLING /* *** */
++#if defined(BOOST_TEST_FPE_SUPPORT_WITH_SEH__) /* *** */
+     BOOST_FPE_DIVBYZERO = EM_ZERODIVIDE,
+     BOOST_FPE_INEXACT   = EM_INEXACT,
+     BOOST_FPE_INVALID   = EM_INVALID,
+@@ -498,7 +511,7 @@ enum masks {
+ 
+     BOOST_FPE_ALL       = MCW_EM,
+ 
+-#elif defined(BOOST_NO_FENV_H) || defined(BOOST_CLANG) /* *** */
++#elif !defined(BOOST_TEST_FPE_SUPPORT_WITH_GLIBC_EXTENSIONS__)/* *** */
+     BOOST_FPE_ALL       = BOOST_FPE_OFF,
+ 
+ #else /* *** */
+diff --git a/boost/test/impl/execution_monitor.ipp b/boost/test/impl/execution_monitor.ipp
+index 416004d..0c5690c 100644
+--- a/boost/test/impl/execution_monitor.ipp
++++ b/boost/test/impl/execution_monitor.ipp
+@@ -1354,11 +1354,7 @@ unsigned
+ enable( unsigned mask )
+ {
+     boost::ignore_unused(mask);
+-
+-#if defined(UNDER_CE)
+-    /* Not Implemented in Windows CE */
+-    return BOOST_FPE_OFF;
+-#elif defined(BOOST_SEH_BASED_SIGNAL_HANDLING)
++#if defined(BOOST_TEST_FPE_SUPPORT_WITH_SEH__)
+     _clearfp();
+ 
+ #if BOOST_WORKAROUND( BOOST_MSVC, <= 1310)
+@@ -1373,9 +1369,10 @@ enable( unsigned mask )
+     if( ::_controlfp_s( 0, old_cw & ~mask, BOOST_FPE_ALL ) != 0 )
+         return BOOST_FPE_INV;
+ #endif
+-
+     return ~old_cw & BOOST_FPE_ALL;
+-#elif defined(__GLIBC__) && defined(__USE_GNU)
++
++#elif defined(BOOST_TEST_FPE_SUPPORT_WITH_GLIBC_EXTENSIONS__)
++    // same macro definition as in execution_monitor.hpp
+     if (BOOST_FPE_ALL == BOOST_FPE_OFF)
+         /* Not Implemented */
+         return BOOST_FPE_OFF;
+@@ -1395,12 +1392,8 @@ disable( unsigned mask )
+ {
+     boost::ignore_unused(mask);
+ 
+-#if defined(UNDER_CE)
+-    /* Not Implemented in Windows CE */
+-    return BOOST_FPE_INV;
+-#elif defined(BOOST_SEH_BASED_SIGNAL_HANDLING)
++#if defined(BOOST_TEST_FPE_SUPPORT_WITH_SEH__)
+     _clearfp();
+-
+ #if BOOST_WORKAROUND( BOOST_MSVC, <= 1310)
+     unsigned old_cw = ::_controlfp( 0, 0 );
+     ::_controlfp( old_cw | mask, BOOST_FPE_ALL );
+@@ -1413,9 +1406,9 @@ disable( unsigned mask )
+     if( ::_controlfp_s( 0, old_cw | mask, BOOST_FPE_ALL ) != 0 )
+         return BOOST_FPE_INV;
+ #endif
+-
+     return ~old_cw & BOOST_FPE_ALL;
+-#elif defined(__GLIBC__) && defined(__USE_GNU)
++
++#elif defined(BOOST_TEST_FPE_SUPPORT_WITH_GLIBC_EXTENSIONS__)
+     if (BOOST_FPE_ALL == BOOST_FPE_OFF)
+         /* Not Implemented */
+         return BOOST_FPE_INV;
diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index c4af22e57..7acb059ba 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,3 +1,2 @@
-# From http://sourceforge.net/projects/boost/files/boost/1.61.0/
-md5	6095876341956f65f9d35939ccea1a9f	boost_1_61_0.tar.bz2
-sha1	f84b1a1ce764108ec3c2b7bd7704cf8dfd3c9d01	boost_1_61_0.tar.bz2
+# From http://www.boost.org/users/history/version_1_63_0.html
+sha256  beae2529f759f6b3bf3f4969a19c2e9d6f0c503edcb2de4a61d1428519fcb3b0  boost_1_63_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index bb8d799c4..dbe0f09bc 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.61.0
+BOOST_VERSION = 1.63.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
-- 
2.12.0
