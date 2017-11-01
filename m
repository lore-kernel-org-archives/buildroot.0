From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed,  1 Nov 2017 15:19:55 +0300
Subject: [Buildroot] [PATCH] package/nmap: fix libssh2 test
Message-ID: <20171101121955.15426-1-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nmap configure script adds '-lm' to the list of included headers when it
runs the test that checks the presence of libssh2.h. The test fails and
nmap tries to build and use bundled libssh2.
Fix the test.

Fixes:
  http://autobuild.buildroot.net/results/9e636919c98cd31b5067c8306d0e481a672434cf
  http://autobuild.buildroot.net/results/912561f505ad10d1eaa96dbe247d5838e9968e14

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/nmap/0002-fix-libssh2-test.patch | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/nmap/0002-fix-libssh2-test.patch

diff --git a/package/nmap/0002-fix-libssh2-test.patch b/package/nmap/0002-fix-libssh2-test.patch
new file mode 100644
index 000000000000..2fe508cde9b0
--- /dev/null
+++ b/package/nmap/0002-fix-libssh2-test.patch
@@ -0,0 +1,28 @@
+configure: don't put '-lm' as a header into libssh2.h test
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+
+--- nmap-7.60/configure.ac	2017-11-01 14:56:21.288413822 +0300
++++ nmap-7.60/configure.ac.mod	2017-11-01 14:53:33.816028328 +0300
+@@ -674,7 +674,7 @@
+       AC_CHECK_LIB(ssh2, libssh2_version,
+         [have_libssh2=yes
+         LIBSSH2_INC=$with_libssh2/include
+-        LIBSSH2_LIB=$with_libssh2/lib])],,[-lm])
++        LIBSSH2_LIB=$with_libssh2/lib])],,)
+ 
+     LDFLAGS=$_ldflags
+     CPPFLAGS=$_cppflags
+--- nmap-7.60/configure	2017-07-31 22:09:47.000000000 +0300
++++ nmap-7.60/configure.mod	2017-11-01 15:01:12.266068760 +0300
+@@ -6801,8 +6801,8 @@
+     CPPFLAGS="-I$with_libssh2/include $CPPFLAGS"
+     LDFLAGS="-L$with_libssh2/lib $LDFLAGS"
+ 
+-    ac_fn_c_check_header_compile "$LINENO" "libssh2.h" "ac_cv_header_libssh2_h" "-lm
+-"
++    ac_fn_c_check_header_compile "$LINENO" "libssh2.h" "ac_cv_header_libssh2_h" ""
++
+ if test "x$ac_cv_header_libssh2_h" = xyes; then :
+ 
+       { $as_echo "$as_me:${as_lineno-$LINENO}: checking for libssh2_version in -lssh2" >&5
-- 
2.11.0
