From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 14 May 2016 20:42:27 +0200
Subject: [Buildroot] [PATCH] stress-ng: workaround sparc64 gcc ICE
Message-ID: <20160514184227.GA2898@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable vector code to avoid gcc ICE while
cross-compiling for sparc64.

Fixes autobuilder failures:
http://autobuild.buildroot.net/results/b527ccdbdfeaba6789528e68df93d9c7216e758a/
http://autobuild.buildroot.net/results/d658f82c66d93515276dcb6cec8d3690459fbf05/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/stress-ng/0001-disable-vector-sparc64.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/stress-ng/0001-disable-vector-sparc64.patch

diff --git a/package/stress-ng/0001-disable-vector-sparc64.patch b/package/stress-ng/0001-disable-vector-sparc64.patch
new file mode 100644
index 0000000..e740b76
--- /dev/null
+++ b/package/stress-ng/0001-disable-vector-sparc64.patch
@@ -0,0 +1,21 @@
+Reported upstream:
+https://bugs.launchpad.net/ubuntu/+source/stress-ng/+bug/1581843
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
+diff -Nur stress-ng-0.04.16.orig/stress-ng.h stress-ng-0.04.16/stress-ng.h
+--- stress-ng-0.04.16.orig/stress-ng.h	2015-09-07 11:04:09.000000000 +0200
++++ stress-ng-0.04.16/stress-ng.h	2016-05-14 20:16:10.543917851 +0200
+@@ -457,9 +457,12 @@
+ #define STRESS_X86	1
+ #endif
+ 
++/* triggers gcc ICE */
++#if !defined(__sparc_v9__)
+ #if NEED_GNUC(4,7,0)
+ #define STRESS_VECTOR	1
+ #endif
++#endif
+ 
+ /* NetBSD does not define MAP_ANONYMOUS */
+ #if defined(MAP_ANON) && !defined(MAP_ANONYMOUS)
-- 
2.1.4
