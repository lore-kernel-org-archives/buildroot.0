From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 2 Sep 2018 23:02:28 +0200
Subject: [Buildroot] [git commit branch/next] jpeg-turbo: fix install with a
 static only lib
Message-ID: <20180902212004.1EB23825FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f905250bf66542efa3cd4dfbbb672aa1db0ce3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Define CMAKE_INSTALL_RPATH only if ENABLE_SHARED is set otherwise the
following error is raised when installing binaries:

CMake Error at cmake_install.cmake:73 (file):
  file RPATH_CHANGE could not write new RPATH:

    /usr/lib

  to the file:

    /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/rdjpgcom

  No valid ELF RPATH or RUNPATH entry exists in the file;

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ll-of-binaries-with-a-static-only-library.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/jpeg-turbo/0001-fix-install-of-binaries-with-a-static-only-library.patch b/package/jpeg-turbo/0001-fix-install-of-binaries-with-a-static-only-library.patch
new file mode 100644
index 0000000000..87f9c48382
--- /dev/null
+++ b/package/jpeg-turbo/0001-fix-install-of-binaries-with-a-static-only-library.patch
@@ -0,0 +1,42 @@
+From f8c7732e24502c06739944f9a721c9d84a50319d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 26 Aug 2018 19:11:55 +0200
+Subject: [PATCH] fix install of binaries with a static only library
+
+Define CMAKE_INSTALL_RPATH only if ENABLE_SHARED is set otherwise the
+following error is raised:
+
+CMake Error at cmake_install.cmake:73 (file):
+  file RPATH_CHANGE could not write new RPATH:
+
+    /usr/lib
+
+  to the file:
+
+    /home/fabrice/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/bin/rdjpgcom
+
+  No valid ELF RPATH or RUNPATH entry exists in the file;
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/libjpeg-turbo/libjpeg-turbo/pull/273]
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1719522..862ab11 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -109,7 +109,9 @@ endif()
+ 
+ include(cmakescripts/GNUInstallDirs.cmake)
+ 
++if(ENABLE_SHARED)
+ set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
++endif()
+ 
+ macro(report_directory var)
+   if(CMAKE_INSTALL_${var} STREQUAL CMAKE_INSTALL_FULL_${var})
+-- 
+2.14.1
+
