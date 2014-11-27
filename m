From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 23:25:48 +0100
Subject: [Buildroot] [git commit] package/libtirpc: add -pthread to the
	private libraries
Message-ID: <20141127224642.1C8C67FF3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85802bb9808b087f5ec422680e9cac2f6c8b2ab7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/17d/17d1d94e6f1617851e374f4fe9804f1e5ea9e99f/
    http://autobuild.buildroot.net/results/c08/c08b7be40c8f208147a4f95ad897e4a1df7e108d/
    and maybe a bunch of others...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libtirpc/0007-needs-pthread.patch |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/libtirpc/0007-needs-pthread.patch b/package/libtirpc/0007-needs-pthread.patch
new file mode 100644
index 0000000..6cdf98a
--- /dev/null
+++ b/package/libtirpc/0007-needs-pthread.patch
@@ -0,0 +1,25 @@
+pkg-config: needs pthread as private library
+
+libtirpc needs pthreads. This is automatically pulled in when linking
+with the shared library, thanks to the DT_NEEDED ELF tags.
+
+But for a static library, there is no such mechanism to identify
+required libraries.
+
+Thus, add -pthread to the private libraries in the pkg-config file.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Patch sent upstream:
+    http://sourceforge.net/p/libtirpc/mailman/message/33072076/
+
+diff -durN libtirpc-0.2.4.orig/libtirpc.pc.in libtirpc-0.2.4/libtirpc.pc.in
+--- libtirpc-0.2.4.orig/libtirpc.pc.in	2013-12-09 21:59:51.000000000 +0100
++++ libtirpc-0.2.4/libtirpc.pc.in	2014-11-23 14:02:58.677760108 +0100
+@@ -8,4 +8,5 @@
+ Requires:
+ Version: @PACKAGE_VERSION@
+ Libs: -L at libdir@ -ltirpc
++Libs.private: -pthread
+ Cflags: -I at includedir@/tirpc
