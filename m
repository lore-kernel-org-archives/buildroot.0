From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Apr 2020 19:53:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libspatialindex: fix build with
 microblaze
Message-ID: <20200424175345.829372-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream patch so the microblaze workaround for gcc bug 68485
won't get ignored

Fixes:
 - http://autobuild.buildroot.org/results/e4ad8fdeafce9d4a07d5554d98dfcb2fa5c05568

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch

diff --git a/package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch b/package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch
new file mode 100644
index 0000000000..fe94020fd8
--- /dev/null
+++ b/package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch
@@ -0,0 +1,30 @@
+From 26d417b9f981cf9a6df42d89fd297539b96180cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Apr 2020 18:03:31 +0200
+Subject: [PATCH] CMakeLists.txt: fix CMAKE_BUILD_TYPE (#188)
+
+The user is unable to override CMAKE_BUILD_TYPE since version 1.9.1 and
+https://github.com/libspatialindex/libspatialindex/commit/e3bcccf38d9f100b59ccf29f7e1cfa174969decd
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/libspatialindex/libspatialindex/commit/26d417b9f981cf9a6df42d89fd297539b96180cb]
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 191ac72..84676a2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -93,8 +93,10 @@ INCLUDE (CheckIncludeFiles)
+ 
+ # note we default to RelWithDebInfo mode
+ if(NOT MSVC_IDE)
++  if(NOT CMAKE_BUILD_TYPE)
+   set(CMAKE_BUILD_TYPE RelWithDebInfo CACHE STRING
+     "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel" FORCE)
++  endif()
+   message(STATUS "Setting libspatialindex build type - ${CMAKE_BUILD_TYPE}")
+ endif()
+ 
-- 
2.25.1
