From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 22:19:56 +0100
Subject: [Buildroot] [git commit] boost: bump to version 1.55.0
Message-ID: <20140113212822.E57999C49F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4258f82e1aecdc6bb91a6ea05ce8ac549849a63a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ilation-of-Boost.Variants-move-assignment.patch |   50 --------------------
 ...oost-0003-fix-64bit-build-with-recent-gcc.patch |   33 -------------
 package/boost/boost.mk                             |    2 +-
 3 files changed, 1 insertions(+), 84 deletions(-)

diff --git a/package/boost/boost-0002-Fix-compilation-of-Boost.Variants-move-assignment.patch b/package/boost/boost-0002-Fix-compilation-of-Boost.Variants-move-assignment.patch
deleted file mode 100644
index 00dc7c6..0000000
--- a/package/boost/boost-0002-Fix-compilation-of-Boost.Variants-move-assignment.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Fix compilation of Boost.Variants move assignment for situations when one of the variant template classes has nothrow copy constructor and throwing move constructor (refs #8772)
-
-Fixes compilation error:
-
-.../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/boost/variant/variant.hpp: In member function 'void boost::variant<T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19>::move_assigner::internal_visit(RhsT&, int) [with RhsT = boost::shared_ptr<void>, T0_ = boost::shared_ptr<void>, T1 = boost::signals2::detail::foreign_void_shared_ptr, T2 = boost::detail::variant::void_, ..., T18 = boost::detail::variant::void_, T19 = boost::detail::variant::void_]':
-...
-.../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/boost/variant/variant.hpp:2058:13: error: no matching function for call to 'boost::variant<boost::shared_ptr<void>, boost::signals2::detail::foreign_void_shared_ptr>::move_assigner::assign_impl(boost::shared_ptr<void>&, nothrow_copy, nothrow_move_constructor, boost::variant<boost::shared_ptr<void>, boost::signals2::detail::foreign_void_shared_ptr>::has_fallback_type_)'
-
-Reported here: https://svn.boost.org/trac/boost/ticket/8772
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Backported-from: https://svn.boost.org/trac/boost/changeset/85080
-
---- a/boost/variant/variant.hpp	(revision 85079)
-+++ b/boost/variant/variant.hpp	(revision 85080)
-@@ -1981,5 +1981,5 @@
-     private: // helpers, for internal visitor interface (below)
- 
--        template <typename RhsT, typename B1, typename B2>
-+        template <typename RhsT, typename B2>
-         void assign_impl(
-               RhsT& rhs_content
---- a/libs/variant/test/rvalue_test.cpp	(revision 85079)
-+++ b/libs/variant/test/rvalue_test.cpp	(revision 85080)
-@@ -197,4 +197,19 @@
- #endif
- 
-+struct nothrow_copyable_throw_movable {
-+    nothrow_copyable_throw_movable(){}
-+    nothrow_copyable_throw_movable(const nothrow_copyable_throw_movable&) BOOST_NOEXCEPT {}
-+#ifndef BOOST_NO_CXX11_RVALUE_REFERENCES
-+    nothrow_copyable_throw_movable(nothrow_copyable_throw_movable&&) BOOST_NOEXCEPT_IF(false) {}
-+#endif
-+};
-+
-+// This test is created to cover the following situation:
-+// https://svn.boost.org/trac/boost/ticket/8772
-+void run_tricky_compilation_test()
-+{
-+    boost::variant<int, nothrow_copyable_throw_movable> v;
-+    v = nothrow_copyable_throw_movable();
-+}
- 
- int test_main(int , char* [])
-@@ -204,4 +219,5 @@
-    run_move_only();
-    run_moves_are_noexcept();
-+   run_tricky_compilation_test();
-    return 0;
- }
diff --git a/package/boost/boost-0003-fix-64bit-build-with-recent-gcc.patch b/package/boost/boost-0003-fix-64bit-build-with-recent-gcc.patch
deleted file mode 100644
index 5fdfb01..0000000
--- a/package/boost/boost-0003-fix-64bit-build-with-recent-gcc.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Patch for recent versions of glibc which always assume int64_t support.
-
-Fixes compilation error with aarch64 target:
-
-./boost/atomic/atomic.hpp: At global scope:
-./boost/atomic/atomic.hpp:202:16: error: 'uintptr_t' was not declared in this scope
- typedef atomic<uintptr_t> atomic_uintptr_t;
-                ^
-./boost/atomic/atomic.hpp:202:25: error: template argument 1 is invalid
- typedef atomic<uintptr_t> atomic_uintptr_t;
-                         ^
-./boost/atomic/atomic.hpp:202:43: error: invalid type in declaration before ';' token
- typedef atomic<uintptr_t> atomic_uintptr_t;
-                                           ^
-
-Reported here: https://svn.boost.org/trac/boost/ticket/8973
-Fix reported here: https://svn.boost.org/trac/boost/ticket/8731
-
-Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-Backported-from: https://svn.boost.org/trac/boost/changeset/84950
-
---- a/boost/cstdint.hpp	(revision 84805)
-+++ b/boost/cstdint.hpp	(revision 84950)
-@@ -42,5 +42,8 @@
- // See https://svn.boost.org/trac/boost/ticket/3548 and http://sources.redhat.com/bugzilla/show_bug.cgi?id=10990
- //
--#if defined(BOOST_HAS_STDINT_H) && (!defined(__GLIBC__) || defined(__GLIBC_HAVE_LONG_LONG))
-+#if defined(BOOST_HAS_STDINT_H)					\
-+  && (!defined(__GLIBC__)					\
-+      || defined(__GLIBC_HAVE_LONG_LONG)			\
-+      || (defined(__GLIBC__) && ((__GLIBC__ > 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ >= 17)))))
- 
- // The following #include is an implementation artifact; not part of interface.
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 799eb13..9ead1dd 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.54.0
+BOOST_VERSION = 1.55.0
 BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
