From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  2 May 2014 16:21:38 +0200
Subject: [Buildroot] [PATCH] zeromq: disable test using fork() when fork()
	is no available
Message-ID: <1399040498-30168-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zeromp's configure script correctly detects the fork availability, but
unconditionally build all tests.

This patch just disables the piece of code using fork() in the given
test. This avoids the autoreconf step of the package.

Fixes:
  http://autobuild.buildroot.org/results/359/3599cc3b7bf2bb22a78961cd84d21cb03cbd7015/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...le-code-using-fork-when-fork-is-not-avail.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/zeromq/zeromq-0001-tests-disable-code-using-fork-when-fork-is-not-avail.patch

diff --git a/package/zeromq/zeromq-0001-tests-disable-code-using-fork-when-fork-is-not-avail.patch b/package/zeromq/zeromq-0001-tests-disable-code-using-fork-when-fork-is-not-avail.patch
new file mode 100644
index 0000000..0c17b6a
--- /dev/null
+++ b/package/zeromq/zeromq-0001-tests-disable-code-using-fork-when-fork-is-not-avail.patch
@@ -0,0 +1,32 @@
+From 694440779ae41f46e01a1486cbe702982c29ef0e Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Fri, 2 May 2014 16:12:20 +0200
+Subject: [PATCH] tests: disable code using fork() when fork() is not available
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ tests/test_fork.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/test_fork.cpp b/tests/test_fork.cpp
+index 637b6e9..67bc957 100644
+--- a/tests/test_fork.cpp
++++ b/tests/test_fork.cpp
+@@ -35,6 +35,7 @@ int main (void)
+     int rc = zmq_bind (pull, address);
+     assert (rc == 0);
+ 
++#ifdef HAVE_FORK
+     int pid = fork ();
+     if (pid == 0) {
+         //  Child process
+@@ -77,5 +78,6 @@ int main (void)
+         }
+         exit (0);
+     }
++#endif
+     return 0;
+ }
+-- 
+1.9.2
+
-- 
1.9.2
