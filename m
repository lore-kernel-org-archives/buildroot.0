From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Nov 2014 20:22:35 +0100
Subject: [Buildroot] [PATCH] package/clamav: fix static build
Message-ID: <1416943355-19766-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

clamav unconditionally includes dlfcn.h which is missing on a uClibc
that is configured as a pure-static C library.

Thus, the build fails.

But the including file does not even makes use of any function from the
dlopen() familly, so it does not need to include dlfcn.h to start with.

Add a patch to clamav to not include dlfcn.h where not needed.

Fixes:
    http://autobuild.buildroot.net/results/b49/b491f4e5e1760248adb8d21b404e8aa15f7dbdd1/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/clamav/clamav-0004-fix-static-build.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/clamav/clamav-0004-fix-static-build.patch

diff --git a/package/clamav/clamav-0004-fix-static-build.patch b/package/clamav/clamav-0004-fix-static-build.patch
new file mode 100644
index 0000000..97aac2d
--- /dev/null
+++ b/package/clamav/clamav-0004-fix-static-build.patch
@@ -0,0 +1,21 @@
+stats: fix static link
+
+The stats.c file does not use the dlopen() familly of functions, but
+includes dlfcn.h, which is missing on uClibc when it is configured as
+a static-only C library.
+
+Do, simply do not include dlfcn.h.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN clamav-0.98.5.orig/libclamav/stats.c clamav-0.98.5/libclamav/stats.c
+--- clamav-0.98.5.orig/libclamav/stats.c	2014-11-13 23:30:43.000000000 +0100
++++ clamav-0.98.5/libclamav/stats.c	2014-11-25 19:57:14.344291266 +0100
+@@ -41,7 +41,6 @@
+ #include <sys/sysctl.h>
+ #endif
+ #endif
+-#include <dlfcn.h>
+ #else
+ #include <Windows.h>
+ #include <tchar.h>
-- 
1.9.1
