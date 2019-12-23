From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Dec 2019 22:36:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/libffi: fix build failure on power7
 and older
Message-ID: <20191223213610.142006-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/3ab73995b8393592c0b147670d8ff7f8ebc8c79c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-build-failure-on-power7-and-older.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch

diff --git a/package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch b/package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch
new file mode 100644
index 0000000000..d0b91dda68
--- /dev/null
+++ b/package/libffi/0005-powerpc-fix-build-failure-on-power7-and-older.patch
@@ -0,0 +1,39 @@
+From 01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Thu, 28 Nov 2019 12:42:41 +0000
+Subject: [PATCH] powerpc: fix build failure on power7 and older (#532)
+
+Build failure looks as:
+```
+libtool: compile:  powerpc-unknown-linux-gnu-gcc \
+    -O2 -mcpu=powerpc -mtune=powerpc -pipe ... -c src/powerpc/ffi.c ...
+In file included from src/powerpc/ffi.c:33:
+src/powerpc/ffi_powerpc.h:65:9: error: '__int128' is not supported on this target
+   65 | typedef __int128 float128;
+      |         ^~~~~~~~
+```
+
+The fix avoids using __int128 in favour of aligned char[16].
+
+Closes: https://github.com/libffi/libffi/issues/531
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+[Retrieved from:
+https://github.com/libffi/libffi/commit/01a75ed76ea7e57f1b7a5c183e2b1e890e6aa0fd]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/powerpc/ffi_powerpc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/powerpc/ffi_powerpc.h b/src/powerpc/ffi_powerpc.h
+index 5ee2a709..8e2f2f0e 100644
+--- a/src/powerpc/ffi_powerpc.h
++++ b/src/powerpc/ffi_powerpc.h
+@@ -62,7 +62,7 @@ typedef _Float128 float128;
+ #elif defined(__FLOAT128__)
+ typedef __float128 float128;
+ #else
+-typedef __int128 float128;
++typedef char float128[16] __attribute__((aligned(16)));
+ #endif
+ 
+ void FFI_HIDDEN ffi_closure_SYSV (void);
-- 
2.24.0
