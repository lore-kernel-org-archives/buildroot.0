From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 22:00:58 +0100
Subject: [Buildroot] [git commit] package/apitrace: fix build on uclibc
Message-ID: <20191225205151.4A92D8E437@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0217d7d0e0a948d44f65df7ee9d76a6b829eb0b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/d5a12c35ecd712c54aa0cd64f9db54bdcc66eafd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...upport-libc-that-don-t-have-RTLD_DEEPBIND.patch | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

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
