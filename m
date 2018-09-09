From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun,  9 Sep 2018 11:59:39 +0200
Subject: [Buildroot] [PATCH] android-tools: fix minor()/major() build
 failure due to glibc 2.28
Message-ID: <20180909095939.17089-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major()/minor() are used.

This commit adds a patch to directly include <sys/sysmacros.h> into
all usb_linux.c files where minor() and major() macros are used.

Fixes:
http://autobuild.buildroot.net/results/901/9011c6af71fb81988c2a05f2acee913a2bae2eff//
http://autobuild.buildroot.net/results/142/142c5672fdc44f2d68f18df3509e5051b3295df5//
http://autobuild.buildroot.net/results/b55/b55aa69654e758af5232ae69618ba1ea5c245074//

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 ...smacros.h-to-compile-with-glibc-2.28.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch

diff --git a/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch b/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
new file mode 100644
index 0000000000..77b457f604
--- /dev/null
+++ b/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
@@ -0,0 +1,42 @@
+usb_linux.c: fix minor()/major() build failure due to glibc 2.28
+
+glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
+and therefore <sys/sysmacros.h> must be included explicitly when
+major()/minor() are used.
+
+This commit adds a patch to directly include <sys/sysmacros.h> into
+all usb_linux.c files where minor() and major() macros are used.
+
+diff -urpN host-android-tools-4.2.2+git20130218.orig/core/adb/usb_linux.c host-android-tools-4.2.2+git20130218/core/adb/usb_linux.c
+--- host-android-tools-4.2.2+git20130218.orig/core/adb/usb_linux.c	2013-02-18 15:49:03.000000000 +0100
++++ host-android-tools-4.2.2+git20130218/core/adb/usb_linux.c	2018-09-09 11:47:16.476292546 +0200
+@@ -20,6 +20,7 @@
+ #include <string.h>
+ 
+ #include <sys/ioctl.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <dirent.h>
+diff -urpN host-android-tools-4.2.2+git20130218.orig/core/adbd/usb_linux.c host-android-tools-4.2.2+git20130218/core/adbd/usb_linux.c
+--- host-android-tools-4.2.2+git20130218.orig/core/adbd/usb_linux.c	2018-09-09 02:32:57.154503866 +0200
++++ host-android-tools-4.2.2+git20130218/core/adbd/usb_linux.c	2018-09-09 11:47:28.148353880 +0200
+@@ -20,6 +20,7 @@
+ #include <string.h>
+ 
+ #include <sys/ioctl.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <dirent.h>
+diff -urpN host-android-tools-4.2.2+git20130218.orig/core/fastboot/usb_linux.c host-android-tools-4.2.2+git20130218/core/fastboot/usb_linux.c
+--- host-android-tools-4.2.2+git20130218.orig/core/fastboot/usb_linux.c	2013-02-18 15:49:03.000000000 +0100
++++ host-android-tools-4.2.2+git20130218/core/fastboot/usb_linux.c	2018-09-09 11:46:53.028169154 +0200
+@@ -33,6 +33,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <dirent.h>
+ #include <fcntl.h>
-- 
2.17.1
