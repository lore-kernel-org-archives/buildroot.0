From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 21:28:11 +0200
Subject: [Buildroot] [git commit] uclibc: add patch fixing build failures
	related to time structures
Message-ID: <20170404192930.A7905826EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75915e5f74f34d106a4355de8fc5bdaba5430918
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The latest bump of uClibc-ng 1.0.23 contains a commit touching <fcntl.h>
that causes a large number of build failures related to time
structures. For the moment, let's revert this patch to avoid the build
failures.

Fixes:

  http://autobuild.buildroot.net/results/fcd024f6658890861fd7165e15edc65f77a9d8e7/
  http://autobuild.buildroot.net/results/431135d9f985f3b3f935cc29fe16728b2412dd3a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...l.h-fix-a-missing-struct-timespec-definit.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/uclibc/0001-Revert-fcntl.h-fix-a-missing-struct-timespec-definit.patch b/package/uclibc/0001-Revert-fcntl.h-fix-a-missing-struct-timespec-definit.patch
new file mode 100644
index 0000000..f481b8f
--- /dev/null
+++ b/package/uclibc/0001-Revert-fcntl.h-fix-a-missing-struct-timespec-definit.patch
@@ -0,0 +1,34 @@
+From 6d7cc87cb64dc8df20b0d1c7b3e3566f9ec5a3dc Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 4 Apr 2017 21:26:41 +0200
+Subject: [PATCH] Revert "fcntl.h: fix a missing `struct timespec` definition"
+
+This reverts commit 657c4a9d6c2e649d86307f46ce9d5e44192f6e7a, it breaks
+many packages in Buildroot:
+
+  http://autobuild.buildroot.net/results/fcd024f6658890861fd7165e15edc65f77a9d8e7/
+  http://autobuild.buildroot.net/results/431135d9f985f3b3f935cc29fe16728b2412dd3a/
+  etc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/fcntl.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/include/fcntl.h b/include/fcntl.h
+index 5a73a98..adcd7ef 100644
+--- a/include/fcntl.h
++++ b/include/fcntl.h
+@@ -34,9 +34,6 @@ __BEGIN_DECLS
+ 
+ /* For XPG all symbols from <sys/stat.h> should also be available.  */
+ #ifdef __USE_XOPEN
+-# ifdef __USE_XOPEN2K8
+-#  define __need_timespec
+-# endif
+ # include <sys/stat.h>
+ #endif
+ 
+-- 
+2.7.4
+
