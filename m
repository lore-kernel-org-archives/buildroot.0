From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Sat, 26 Apr 2014 08:08:51 +0200
Subject: [Buildroot] [PATCH v2 1/1] zeromq: don't use fork() on noMMU
	platforms
Message-ID: <1398492531-2946-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/439/439df2ad4482d08f295dbc40b2e88bf9167a7794/

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
Changes v1 -> v2:
  - change subject
  - use an AC_CHECK_FUNCS(fork) test to build conditionally test_fork

 package/zeromq/zeromq-01-no-mmu.patch |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/zeromq/zeromq-01-no-mmu.patch

diff --git a/package/zeromq/zeromq-01-no-mmu.patch b/package/zeromq/zeromq-01-no-mmu.patch
new file mode 100644
index 0000000..0e0a4ca
--- /dev/null
+++ b/package/zeromq/zeromq-01-no-mmu.patch
@@ -0,0 +1,20 @@
+Don't use fork() on noMMU platforms
+
+Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
+
+diff -rupN a/tests/test_fork.cpp b/tests/test_fork.cpp
+--- a/tests/test_fork.cpp	2013-11-13 18:57:50.000000000 +0100
++++ b/tests/test_fork.cpp	2014-04-24 08:57:01.000000000 +0200
+@@ -35,7 +35,11 @@ int main (void)
+     int rc = zmq_bind (pull, address);
+     assert (rc == 0);
+ 
+-    int pid = fork ();
++#ifdef HAVE_FORK
++    int pid = fork();
++#else
++    int pid = vfork();
++#endif
+     if (pid == 0) {
+         //  Child process
+         //  Immediately close parent sockets and context
-- 
1.7.9.5
