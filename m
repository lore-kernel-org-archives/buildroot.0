From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 20 Jul 2009 09:16:29 +0200
Subject: [Buildroot] [git commit] busybox: 1.14.2 test fix
Message-ID: <20090720071807.0BF4C77763@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=214da03d145fd7cd1fd2ac3ec6a44ca76e00e2c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.14.2-test.patch |   64 +++++++++++++++++++++++++++++
 1 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.14.2-test.patch

diff --git a/package/busybox/busybox-1.14.2-test.patch b/package/busybox/busybox-1.14.2-test.patch
new file mode 100644
index 0000000..ce0d9a7
--- /dev/null
+++ b/package/busybox/busybox-1.14.2-test.patch
@@ -0,0 +1,64 @@
+diff -urpN busybox-1.14.2/coreutils/test.c busybox-1.14.2-test/coreutils/test.c
+--- busybox-1.14.2/coreutils/test.c	2009-07-05 22:59:28.000000000 +0200
++++ busybox-1.14.2-test/coreutils/test.c	2009-07-17 01:46:28.000000000 +0200
+@@ -571,7 +571,14 @@ static number_t nexpr(enum token n)
+ 
+ 	nest_msg(">nexpr(%s)\n", TOKSTR[n]);
+ 	if (n == UNOT) {
+-		res = !nexpr(check_operator(*++args));
++		n = check_operator(*++args);
++		if (n == EOI) {
++			/* special case: [ ! ], [ a -a ! ] are valid */
++			/* IOW, "! ARG" may miss ARG */
++			unnest_msg("<nexpr:1 (!EOI)\n");
++			return 1;
++		}
++		res = !nexpr(n);
+ 		unnest_msg("<nexpr:%lld\n", res);
+ 		return res;
+ 	}
+@@ -742,7 +749,7 @@ int test_main(int argc, char **argv)
+ 		check_operator(argv[1]);
+ 		if (last_operator->op_type == BINOP) {
+ 			/* "test [!] arg1 <binary_op> arg2" */
+-			args = &argv[0];
++			args = argv;
+ 			res = (binop() == 0);
+ 			goto ret;
+ 		}
+@@ -755,7 +762,7 @@ int test_main(int argc, char **argv)
+ 		argv--;
+ 	}
+ #endif
+-	args = &argv[0];
++	args = argv;
+ 	res = !oexpr(check_operator(*args));
+ 
+ 	if (*args != NULL && *++args != NULL) {
+diff -urpN busybox-1.14.2/testsuite/test.tests busybox-1.14.2-test/testsuite/test.tests
+--- busybox-1.14.2/testsuite/test.tests	2009-07-05 22:59:22.000000000 +0200
++++ busybox-1.14.2-test/testsuite/test.tests	2009-07-17 01:46:28.000000000 +0200
+@@ -21,6 +21,11 @@ testing "test '': should be false (1)" \
+ 	"1\n" \
+ 	"" ""
+ 
++testing "test !: should be true (0)" \
++	"busybox test !; echo \$?" \
++	"0\n" \
++	"" ""
++
+ testing "test a: should be true (0)" \
+ 	"busybox test a; echo \$?" \
+ 	"0\n" \
+@@ -51,6 +56,11 @@ testing "test -lt = -gt: should be false
+ 	"1\n" \
+ 	"" ""
+ 
++testing "test a -a !: should be true (0)" \
++	"busybox test a -a !; echo \$?" \
++	"0\n" \
++	"" ""
++
+ testing "test -f = a -o b: should be true (0)" \
+ 	"busybox test -f = a -o b; echo \$?" \
+ 	"0\n" \
-- 
1.6.3.3
