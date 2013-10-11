From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 11 Oct 2013 22:37:43 +0200
Subject: [Buildroot] [PATCH] boost: Fix compilation of Boost.Variants move
	assignment
Message-ID: <1381523863-5285-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix compilation of Boost.Variants move assignment for situations when one of the variant template classes has nothrow copy constructor and throwing move constructor (refs #8772)

Fixes compilation error:

.../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/boost/variant/variant.hpp: In member function 'void boost::variant<T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19>::move_assigner::internal_visit(RhsT&, int) [with RhsT = boost::shared_ptr<void>, T0_ = boost::shared_ptr<void>, T1 = boost::signals2::detail::foreign_void_shared_ptr, T2 = boost::detail::variant::void_, ..., T18 = boost::detail::variant::void_, T19 = boost::detail::variant::void_]':
...
.../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/boost/variant/variant.hpp:2058:13: error: no matching function for call to 'boost::variant<boost::shared_ptr<void>, boost::signals2::detail::foreign_void_shared_ptr>::move_assigner::assign_impl(boost::shared_ptr<void>&, nothrow_copy, nothrow_move_constructor, boost::variant<boost::shared_ptr<void>, boost::signals2::detail::foreign_void_shared_ptr>::has_fallback_type_)'

Reported here: https://svn.boost.org/trac/boost/ticket/8772

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Backported-from: https://svn.boost.org/trac/boost/changeset/85080
---
 ...ilation-of-Boost.Variants-move-assignment.patch | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/boost/boost-0002-Fix-compilation-of-Boost.Variants-move-assignment.patch

diff --git a/package/boost/boost-0002-Fix-compilation-of-Boost.Variants-move-assignment.patch b/package/boost/boost-0002-Fix-compilation-of-Boost.Variants-move-assignment.patch
new file mode 100644
index 0000000..00dc7c6
--- /dev/null
+++ b/package/boost/boost-0002-Fix-compilation-of-Boost.Variants-move-assignment.patch
@@ -0,0 +1,50 @@
+Fix compilation of Boost.Variants move assignment for situations when one of the variant template classes has nothrow copy constructor and throwing move constructor (refs #8772)
+
+Fixes compilation error:
+
+.../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/boost/variant/variant.hpp: In member function 'void boost::variant<T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19>::move_assigner::internal_visit(RhsT&, int) [with RhsT = boost::shared_ptr<void>, T0_ = boost::shared_ptr<void>, T1 = boost::signals2::detail::foreign_void_shared_ptr, T2 = boost::detail::variant::void_, ..., T18 = boost::detail::variant::void_, T19 = boost::detail::variant::void_]':
+...
+.../output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/boost/variant/variant.hpp:2058:13: error: no matching function for call to 'boost::variant<boost::shared_ptr<void>, boost::signals2::detail::foreign_void_shared_ptr>::move_assigner::assign_impl(boost::shared_ptr<void>&, nothrow_copy, nothrow_move_constructor, boost::variant<boost::shared_ptr<void>, boost::signals2::detail::foreign_void_shared_ptr>::has_fallback_type_)'
+
+Reported here: https://svn.boost.org/trac/boost/ticket/8772
+
+Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+Backported-from: https://svn.boost.org/trac/boost/changeset/85080
+
+--- a/boost/variant/variant.hpp	(revision 85079)
++++ b/boost/variant/variant.hpp	(revision 85080)
+@@ -1981,5 +1981,5 @@
+     private: // helpers, for internal visitor interface (below)
+ 
+-        template <typename RhsT, typename B1, typename B2>
++        template <typename RhsT, typename B2>
+         void assign_impl(
+               RhsT& rhs_content
+--- a/libs/variant/test/rvalue_test.cpp	(revision 85079)
++++ b/libs/variant/test/rvalue_test.cpp	(revision 85080)
+@@ -197,4 +197,19 @@
+ #endif
+ 
++struct nothrow_copyable_throw_movable {
++    nothrow_copyable_throw_movable(){}
++    nothrow_copyable_throw_movable(const nothrow_copyable_throw_movable&) BOOST_NOEXCEPT {}
++#ifndef BOOST_NO_CXX11_RVALUE_REFERENCES
++    nothrow_copyable_throw_movable(nothrow_copyable_throw_movable&&) BOOST_NOEXCEPT_IF(false) {}
++#endif
++};
++
++// This test is created to cover the following situation:
++// https://svn.boost.org/trac/boost/ticket/8772
++void run_tricky_compilation_test()
++{
++    boost::variant<int, nothrow_copyable_throw_movable> v;
++    v = nothrow_copyable_throw_movable();
++}
+ 
+ int test_main(int , char* [])
+@@ -204,4 +219,5 @@
+    run_move_only();
+    run_moves_are_noexcept();
++   run_tricky_compilation_test();
+    return 0;
+ }
-- 
1.8.1.2
