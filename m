From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 21:26:38 +0200
Subject: [Buildroot] [git commit] libtirpc: fix musl build
Message-ID: <20180617192421.E7AEE8777A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64c3b03b664553a2669f46c07c951267b1557414
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't redefine existing typedef (u_char, u_long, ...) on musl

Fixes:
 - http://autobuild.buildroot.net/results/dbc07e383605a84eb19a2fd1899668612212518a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libtirpc/0006-rpc-types.h-fix-musl-build.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libtirpc/0006-rpc-types.h-fix-musl-build.patch b/package/libtirpc/0006-rpc-types.h-fix-musl-build.patch
new file mode 100644
index 0000000000..d4bcd80991
--- /dev/null
+++ b/package/libtirpc/0006-rpc-types.h-fix-musl-build.patch
@@ -0,0 +1,31 @@
+From 238f0a870f577e8fffd92820e1c1a88d4fc6d35f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 10 Jun 2018 19:48:21 +0200
+Subject: [PATCH] rpc/types.h: fix musl build
+
+Don't redefine existing typedef (u_char, u_long, ...) on musl
+
+Fixes:
+ - http://autobuild.buildroot.net/results/dbc07e383605a84eb19a2fd1899668612212518a
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tirpc/rpc/types.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tirpc/rpc/types.h b/tirpc/rpc/types.h
+index f069efa..0153a5c 100644
+--- a/tirpc/rpc/types.h
++++ b/tirpc/rpc/types.h
+@@ -66,7 +66,7 @@ typedef   int32_t rpc_inline_t;
+ #define mem_free(ptr, bsize)	free(ptr)
+ 
+ 
+-#if defined __APPLE_CC__ || defined __FreeBSD__
++#if defined __APPLE_CC__ || defined __FreeBSD__ || !defined (__GLIBC__)
+ # define __u_char_defined
+ # define __daddr_t_defined
+ #endif
+-- 
+2.14.1
+
