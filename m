From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Apr 2021 20:24:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/protozero: disable tests
Message-ID: <20210422182443.654635-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch to disable tests through the standard BUILD_TESTING variable
which is already passed by cmake-package.

While at it, drop protobuf dependency which is only needed for tests

This will fix a build failure on toolchains without wchar, toolchains
for sh4 (ICE) or toolchains where gcc is affected by bug 64735.

Upstream thinks that this is unecessary but no additional feedback was
received on how we should handle those build failures

Fixes:
 - http://autobuild.buildroot.org/results/1cd24b757d87b963c70bc7ff927c6d983d0b142a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...CMakeLists.txt-respect-BUILD_TESTING.patch | 47 +++++++++++++++++++
 package/protozero/protozero.mk                |  4 --
 2 files changed, 47 insertions(+), 4 deletions(-)
 create mode 100644 package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch

diff --git a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch b/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
new file mode 100644
index 0000000000..d0267e3283
--- /dev/null
+++ b/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
@@ -0,0 +1,47 @@
+From 03daae49c8fa94513b508bd12f1597e8e5e086f2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 17 Apr 2021 13:06:44 +0200
+Subject: [PATCH] CMakeLists.txt: respect BUILD_TESTING
+
+Don't build tests if the standard cmake BUILD_TESTING variable is set to
+OFF.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/mapbox/protozero/pull/105]
+---
+ CMakeLists.txt | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f9702d6..7a40212 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -23,6 +23,7 @@ set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
+ 
+ #-----------------------------------------------------------------------------
+ 
++option(BUILD_TESTING "Build tests" ON)
+ option(WERROR "Add -Werror flag to build (turns warnings into errors)" ON)
+ 
+ if(MSVC)
+@@ -134,13 +135,13 @@ install(DIRECTORY include/protozero DESTINATION include)
+ 
+ #-----------------------------------------------------------------------------
+ 
+-enable_testing()
+-
+ add_subdirectory(doc)
+ 
+ add_subdirectory(tools)
+ 
+-add_subdirectory(test)
+-
++if(BUILD_TESTING)
++    enable_testing()
++    add_subdirectory(test)
++endif()
+ 
+ #-----------------------------------------------------------------------------
+-- 
+2.30.2
+
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index e4ce1a4730..80d16192e3 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -10,8 +10,4 @@ PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
 PROTOZERO_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_PROTOBUF),y)
-PROTOZERO_DEPENDENCIES += protobuf
-endif
-
 $(eval $(cmake-package))
-- 
2.30.2
