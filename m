From: stefan at astylos.dk <stefan@astylos.dk>
Date: Tue, 23 Jun 2020 12:15:33 +0200
Subject: [Buildroot] [PATCH] package/gnutls: Fix build with uClibc
Message-ID: <20200623101533.1459806-1-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Stefan S?rensen <stefan.sorensen@spectralink.com>

Since v3.6.14 gnutls wants to use the 'e' flag with fopen to set the
O_CLOEXEC flags. Since this is a glibc extension, it will trigger a
gnulib override of fopen on non-glibc systems, but that override
breaks the uClibc stdio.h header.

Fixes:
http://autobuild.buildroot.org/results/02f/02f2b524add307c8f7cc1af1ed0783bb1baf029a

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 ...Fix-gnulib-stdio.h-include-on-uclibc.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch

diff --git a/package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch b/package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch
new file mode 100644
index 0000000000..758e7cca73
--- /dev/null
+++ b/package/gnutls/0001-Fix-gnulib-stdio.h-include-on-uclibc.patch
@@ -0,0 +1,49 @@
+From 60fa934ffba3c230040328fdbbbf51f417f12871 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Mon, 22 Jun 2020 14:11:05 +0200
+Subject: [PATCH] Fix gnulib stdio.h include on uclibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The __need_FILE define used by gnulib interferes with the uClibc stdio.h
+header, so move the inclusion the stdio.h to after __need_FILE has been
+undefined again.
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+---
+ gl/fopen.c     | 2 +-
+ src/gl/fopen.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gl/fopen.c b/gl/fopen.c
+index 8d6625a..248692c 100644
+--- a/gl/fopen.c
++++ b/gl/fopen.c
+@@ -23,8 +23,8 @@
+ #include <config.h>
+ 
+ /* Get the original definition of fopen.  It might be defined as a macro.  */
+-#include <stdio.h>
+ #undef __need_FILE
++#include <stdio.h>
+ 
+ static FILE *
+ orig_fopen (const char *filename, const char *mode)
+diff --git a/src/gl/fopen.c b/src/gl/fopen.c
+index 47d7f19..1f22f4f 100644
+--- a/src/gl/fopen.c
++++ b/src/gl/fopen.c
+@@ -23,8 +23,8 @@
+ #include <config.h>
+ 
+ /* Get the original definition of fopen.  It might be defined as a macro.  */
+-#include <stdio.h>
+ #undef __need_FILE
++#include <stdio.h>
+ 
+ static FILE *
+ orig_fopen (const char *filename, const char *mode)
+-- 
+2.25.4
+
-- 
2.25.4
