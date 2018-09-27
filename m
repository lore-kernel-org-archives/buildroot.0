From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu, 27 Sep 2018 17:09:10 +0200
Subject: [Buildroot] [PATCH-2018.02.x] cramfs: fix minor()/major() build
 failure due to glibc 2.28
Message-ID: <20180927150910.17401-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major()/minor() are used.

This commit adds a patch to directly include <sys/sysmacros.h> into
cramfsck.c and mkcramfs.c where minor() and major() macros are used.

Fixes:
http://autobuild.buildroot.net/results/8c5/8c5997017568f8be1d2f664998fb2fdc433a51d3/
http://autobuild.buildroot.net/results/fad/fad1553d45a8c35ba84c5c340410e99322e21c44/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...smacros.h-to-compile-with-glibc-2.28.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/cramfs/0004-Include-sysmacros.h-to-compile-with-glibc-2.28.patch

diff --git a/package/cramfs/0004-Include-sysmacros.h-to-compile-with-glibc-2.28.patch b/package/cramfs/0004-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
new file mode 100644
index 0000000000..6096cf3625
--- /dev/null
+++ b/package/cramfs/0004-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
@@ -0,0 +1,33 @@
+Fix minor()/major() build failure due to glibc 2.28
+
+glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
+and therefore <sys/sysmacros.h> must be included explicitly when
+major()/minor() are used.
+
+This commit directly includes <sys/sysmacros.h> into cramfsck.c and
+mkcramfs.c files where minor() and major() macros are used.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+diff -urpN host-cramfs-1.1.orig/cramfsck.c host-cramfs-1.1/cramfsck.c
+--- host-cramfs-1.1.orig/cramfsck.c	2018-09-27 16:48:09.704782201 +0200
++++ host-cramfs-1.1/cramfsck.c	2018-09-27 16:49:12.841138657 +0200
+@@ -38,6 +38,7 @@
+ 
+ #define _GNU_SOURCE
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <stdio.h>
+ #include <stdarg.h>
+ #include <sys/stat.h>
+diff -urpN host-cramfs-1.1.orig/mkcramfs.c host-cramfs-1.1/mkcramfs.c
+--- host-cramfs-1.1.orig/mkcramfs.c	2018-09-27 16:48:09.712782246 +0200
++++ host-cramfs-1.1/mkcramfs.c	2018-09-27 16:48:59.777064921 +0200
+@@ -24,6 +24,7 @@
+ 
+ #define _GNU_SOURCE
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <stdio.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
-- 
2.17.1
