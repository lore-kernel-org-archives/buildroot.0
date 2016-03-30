From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 31 Mar 2016 00:11:10 +0200
Subject: [Buildroot] [PATCH] boost: fix getchar issue with uClibc and gcc <=
	4.8.2
Message-ID: <1459375870-18823-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

getchar() is defined as a macro in uClibc. This hits gcc bug 58952 [1] for all
gcc versions <= 4.8.2 and building boost/test fails:

./boost/test/impl/unit_test_main.ipp: In function 'int boost::unit_test::unit_test_main(boost::unit_test::init_unit_test_func, int, char**)':
./boost/test/impl/unit_test_main.ipp:194:18: error: expected unqualified-id before '(' token

To allow building boost/test with uClibc based toolchains with gcc <= 4.8.2 use
parenthesis for std::getchar.

Upstream status: Pending
https://github.com/boostorg/test/pull/97

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58952

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...fix-getchar-with-uclibc-and-gcc-bug-58952.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/boost/0007-fix-getchar-with-uclibc-and-gcc-bug-58952.patch

diff --git a/package/boost/0007-fix-getchar-with-uclibc-and-gcc-bug-58952.patch b/package/boost/0007-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
new file mode 100644
index 0000000..960f0ea
--- /dev/null
+++ b/package/boost/0007-fix-getchar-with-uclibc-and-gcc-bug-58952.patch
@@ -0,0 +1,45 @@
+From 4f1c6784b37a11c78fe84bb238fb7cc377ce0d36 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 30 Mar 2016 23:28:33 +0200
+Subject: [PATCH] Fix for uClibc and gcc <= 4.8.2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+getchar() is defined as a macro in uClibc. This hits gcc bug 58952 [1] for all
+gcc version <= 4.8.2 and building boost/test fails:
+
+./boost/test/impl/unit_test_main.ipp: In function 'int boost::unit_test::unit_test_main(boost::unit_test::init_unit_test_func, int, char**)':
+./boost/test/impl/unit_test_main.ipp:194:18: error: expected unqualified-id before '(' token
+
+To allow building boost/test with uClibc based toolchains with gcc <= 4.8.2 use
+parenthesis for std::getchar.
+
+[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58952
+
+Upstream status: Pending
+https://github.com/boostorg/test/pull/97
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ include/boost/test/impl/unit_test_main.ipp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/boost/test/impl/unit_test_main.ipp b/boost/test/impl/unit_test_main.ipp
+index 1f30c02..db61930 100644
+--- a/boost/test/impl/unit_test_main.ipp
++++ b/boost/test/impl/unit_test_main.ipp
+@@ -191,7 +191,9 @@ unit_test_main( init_unit_test_func init_func, int argc, char* argv[] )
+         if( runtime_config::get<bool>( runtime_config::WAIT_FOR_DEBUGGER ) ) {
+             results_reporter::get_stream() << "Press any key to continue..." << std::endl;
+ 
+-            std::getchar();
++            // getchar is defined as a macro in uClibc. Use parenthesis to fix
++            // gcc bug 58952 for gcc <= 4.8.2.
++            (std::getchar)();
+             results_reporter::get_stream() << "Continuing..." << std::endl;
+         }
+ 
+-- 
+2.7.4
+
-- 
2.7.4
