From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:32:17 +0200
Subject: [Buildroot] [git commit] uclibc: add upstream patch to fix gdbm
	compile issue
Message-ID: <20170608193222.B37AB805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2a2826be557f661c88b607212c1469cc5820bcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patches fixes

gdbmopen.c:35:40: error: unknown type name 'blksize_t'
 compute_directory_size (GDBM_FILE dbf, blksize_t block_size,

Fixes
  http://autobuild.buildroot.net/results/592/59278fb8681d474883e6551df5173edd806b16fa/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-sys-types.h-sync-with-GNU-C-library.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/uclibc/0002-sys-types.h-sync-with-GNU-C-library.patch b/package/uclibc/0002-sys-types.h-sync-with-GNU-C-library.patch
new file mode 100644
index 0000000..ea940f1
--- /dev/null
+++ b/package/uclibc/0002-sys-types.h-sync-with-GNU-C-library.patch
@@ -0,0 +1,30 @@
+From 5244b9db8f17190413a4c6b10166cec7969178f5 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@uclibc-ng.org>
+Date: Tue, 6 Jun 2017 21:41:55 +0200
+Subject: [PATCH] sys/types.h: sync with GNU C library
+
+Fixed in glibc commit f9cfa295ae3f2556bd8808f0ff693cfe44f4ac25.
+Found via Buildroot autobuilder and gdbm package cross-compile.
+
+Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
+---
+ include/sys/types.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/sys/types.h b/include/sys/types.h
+index 2b45d03..078a29c 100644
+--- a/include/sys/types.h
++++ b/include/sys/types.h
+@@ -223,7 +223,8 @@ typedef int register_t __attribute__ ((__mode__ (__word__)));
+ #endif /* Use BSD.  */
+ 
+ 
+-#if defined __USE_UNIX98 && !defined __blksize_t_defined
++#if (defined __USE_UNIX98 || defined __USE_XOPEN2K8) \
++    && !defined __blksize_t_defined
+ typedef __blksize_t blksize_t;
+ # define __blksize_t_defined
+ #endif
+-- 
+2.1.4
+
