From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Dec 2019 16:09:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/apitrace: fix build on uclibc
Message-ID: <20191224150918.933173-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/d5a12c35ecd712c54aa0cd64f9db54bdcc66eafd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...t-libc-that-don-t-have-RTLD_DEEPBIND.patch | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/apitrace/0002-Support-libc-that-don-t-have-RTLD_DEEPBIND.patch

diff --git a/package/apitrace/0002-Support-libc-that-don-t-have-RTLD_DEEPBIND.patch b/package/apitrace/0002-Support-libc-that-don-t-have-RTLD_DEEPBIND.patch
new file mode 100644
index 0000000000..e34357428a
--- /dev/null
+++ b/package/apitrace/0002-Support-libc-that-don-t-have-RTLD_DEEPBIND.patch
@@ -0,0 +1,25 @@
+From d495d15e20bf655afa3be62ada792e8dfc8d29b6 Mon Sep 17 00:00:00 2001
+From: Gleb Mazovetskiy <glex.spb@gmail.com>
+Date: Fri, 13 Dec 2019 13:39:19 +0000
+Subject: [PATCH] Support libc that don't have RTLD_DEEPBIND
+
+[Retrieved from: https://github.com/apitrace/apitrace/pull/646]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ dispatch/glproc_gl.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/dispatch/glproc_gl.cpp b/dispatch/glproc_gl.cpp
+index 5d7903a0c..456fcc42e 100644
+--- a/dispatch/glproc_gl.cpp
++++ b/dispatch/glproc_gl.cpp
+@@ -148,6 +148,9 @@ _getPrivateProcAddress(const char *procName)
+ 
+ #else
+ 
++#ifndef RTLD_DEEPBIND
++#define RTLD_DEEPBIND 0
++#endif
+ 
+ static inline void
+ logSymbol(const char *name, void *ptr) {
-- 
2.24.0
