From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 17 Jul 2020 21:34:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix install path with
 FTDIPP
Message-ID: <20200717193419.669052-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix a build failure with libsigrok and libftdi1 in version
1.5.0

Fixes:
 - http://autobuild.buildroot.org/results/1427f44e36752c337791597fab47a1889552a2fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...sts.txt-fix-paths-when-FTDIPP-is-set.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch

diff --git a/package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch b/package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch
new file mode 100644
index 0000000000..14c248bb99
--- /dev/null
+++ b/package/libftdi1/0002-CMakeLists.txt-fix-paths-when-FTDIPP-is-set.patch
@@ -0,0 +1,46 @@
+From 3e68fd7da98a755403cf5719c3d7a3c2f4dcbb58 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 17 Jul 2020 21:04:45 +0200
+Subject: [PATCH] CMakeLists.txt: fix paths when FTDIPP is set
+
+Use the same project name (i.e. libftdi1 and not libftdipp1) when FTDIPP
+is enabled as suggested by Aurelien Jarno in
+http://developer.intra2net.com/mailarchive/html/libftdi/2020/msg00044.html
+
+Without this change, the libftdi1.pc config file defines the include
+path as /usr/local/include/libftdipp1 while the ftdi.h file is actually
+installed in /usr/local/include/libftdi1
+
+This is an issue for example for libsigrok which will fail on:
+
+In file included from src/hardware/asix-sigma/protocol.c:27:
+src/hardware/asix-sigma/protocol.h:28:10: fatal error: ftdi.h: No such file or directory
+   28 | #include <ftdi.h>
+      |          ^~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1427f44e36752c337791597fab47a1889552a2fe
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+http://developer.intra2net.com/mailarchive/html/libftdi/2020/msg00045.html]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5aecafc..3b0b87c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -136,7 +136,7 @@ endif ()
+ 
+ add_subdirectory(src)
+ if ( FTDIPP )
+-  project(libftdipp1 C CXX)
++  project(libftdi1 C CXX)
+   add_subdirectory(ftdipp)
+ endif ()
+ if ( PYTHON_BINDINGS )
+-- 
+2.27.0
+
-- 
2.27.0
