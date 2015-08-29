From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 11:33:13 +0200
Subject: [Buildroot] [git commit] ipkg: add patch to fix musl build
Message-ID: <20150829093448.4558C81950@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f52f17e0c379312cea7c87fdb037584eede1abe4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like Romain Naour did for util-linux, this commit adds a patch for the
ipkg package to remove the use of the __P, which is useless for modern
compilers, and not defined by the musl C library.

Fixes:

  http://autobuild.buildroot.net/results/c27d1d1e6a9bb52fead7b48625bb456f42b2f056/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ipkg/0001-fix-musl-build.patch |   50 ++++++++++++++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)

diff --git a/package/ipkg/0001-fix-musl-build.patch b/package/ipkg/0001-fix-musl-build.patch
new file mode 100644
index 0000000..fce3ec4
--- /dev/null
+++ b/package/ipkg/0001-fix-musl-build.patch
@@ -0,0 +1,50 @@
+Remove __P macro usage to fix musl build
+
+__P() is used for compatibility with old K&R C compilers. With ANSI C
+this macro has no effect.
+
+This fixes a compilation error with musl libc because of undeclared
+__P.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/md5.c
+===================================================================
+--- a/md5.c
++++ b/md5.c
+@@ -97,21 +97,21 @@
+ 
+ /* Initialize structure containing state of computation.
+    (RFC 1321, 3.3: Step 3)  */
+-static void md5_init_ctx __P ((struct md5_ctx *ctx));
++static void md5_init_ctx (struct md5_ctx *ctx);
+ 
+ /* Starting with the result of former calls of this function (or the
+    initialization function update the context for the next LEN bytes
+    starting at BUFFER.
+    It is necessary that LEN is a multiple of 64!!! */
+-static void md5_process_block __P ((const void *buffer, size_t len,
+-				    struct md5_ctx *ctx));
++static void md5_process_block (const void *buffer, size_t len,
++				    struct md5_ctx *ctx);
+ 
+ /* Starting with the result of former calls of this function (or the
+    initialization function update the context for the next LEN bytes
+    starting at BUFFER.
+    It is NOT required that LEN is a multiple of 64.  */
+-static void md5_process_bytes __P ((const void *buffer, size_t len,
+-				    struct md5_ctx *ctx));
++static void md5_process_bytes (const void *buffer, size_t len,
++				    struct md5_ctx *ctx);
+ 
+ /* Process the remaining bytes in the buffer and put result from CTX
+    in first 16 bytes following RESBUF.  The result is always in little
+@@ -120,7 +120,7 @@
+ 
+    IMPORTANT: On some systems it is required that RESBUF is correctly
+    aligned for a 32 bits value.  */
+-static void *md5_finish_ctx __P ((struct md5_ctx *ctx, void *resbuf));
++static void *md5_finish_ctx (struct md5_ctx *ctx, void *resbuf);
+ 
+ //----------------------------------------------------------------------------
+ //--------end of md5.h
