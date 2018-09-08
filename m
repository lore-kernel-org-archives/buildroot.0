From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat,  8 Sep 2018 02:15:58 +0200
Subject: [Buildroot] [PATCH] dvdrw-tools: fix minor()/major() build failure
 due to glibc 2.28
Message-ID: <20180908001558.71376-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major()/minor() are used.

This commit adds a patch to directly include <sys/sysmacros.h> into
growisofs.c and transport.hxx where minor() and major() macros are used.

Fixes:
http://autobuild.buildroot.net/results/763/763879f845ffd43343a7b4d548b1eba991d572bd//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...ysmacros.h-to-compile-with-newer-gcc.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch

diff --git a/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch b/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch
new file mode 100644
index 0000000000..8bf0ab48a4
--- /dev/null
+++ b/package/dvdrw-tools/0002-Include-sysmacros.h-to-compile-with-newer-gcc.patch
@@ -0,0 +1,26 @@
+growisofs.c transport.hxx: include sysmacros.h to compile with newer gcc
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+
+diff -urpN dvd+rw-tools-7.1.orig/growisofs.c dvd+rw-tools-7.1/growisofs.c
+--- dvd+rw-tools-7.1.orig/growisofs.c	2018-09-08 01:56:11.686656819 +0200
++++ dvd+rw-tools-7.1/growisofs.c	2018-09-08 02:11:45.868778471 +0200
+@@ -441,6 +441,7 @@
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <assert.h>
+ #include "mp.h"
+ 
+diff -urpN dvd+rw-tools-7.1.orig/transport.hxx dvd+rw-tools-7.1/transport.hxx
+--- dvd+rw-tools-7.1.orig/transport.hxx	2018-09-08 01:56:11.682656832 +0200
++++ dvd+rw-tools-7.1/transport.hxx	2018-09-08 02:11:20.556420301 +0200
+@@ -140,6 +140,7 @@ extern "C" char *plusminus_locale()
+ #if defined(__linux)
+ 
+ #include <sys/ioctl.h>
++#include <sys/sysmacros.h>
+ #include <linux/cdrom.h>
+ #include <mntent.h>
+ #include <sys/wait.h>
-- 
2.17.1
