From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 15:30:09 +0200
Subject: [Buildroot] [git commit] libcgi: add patch to fix static library
	building
Message-ID: <20170903132355.9BB48817CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36cbff3ea53030923cd352f42d2e26e7450a512c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new libcgi build system was forcing the build of a shared library,
breaking the build on static-only configurations. This commit adds a
libcgi patch (submitted upstream) that makes its build system use the
default CMake behavior (rely on BUILD_SHARED_LIBS).

Fixes:

  http://autobuild.buildroot.net/results/c166aa1eda9d86083a1aeefd8631ed45dbcb05e7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...txt-don-t-force-the-build-of-a-shared-lib.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/libcgi/0002-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch b/package/libcgi/0002-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
new file mode 100644
index 0000000..ebf91b0
--- /dev/null
+++ b/package/libcgi/0002-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
@@ -0,0 +1,44 @@
+From 9bb9d67da0e4faf4bb3a47786dee127e66a49ed0 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 3 Sep 2017 15:22:30 +0200
+Subject: [PATCH] CMakeLists.txt: don't force the build of a shared library
+
+Building a shared library doesn't work on all platforms, so instead,
+let CMake rely on the standard BUILD_SHARED_LIBS variable to decide
+whether a static or shared library should be built.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Submitted-upstream: https://github.com/rafaelsteil/libcgi/pull/39
+---
+ src/CMakeLists.txt | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index f32d22e..3bde408 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -23,17 +23,18 @@ set(CGI_SRC
+ )
+ 
+ # create binary
+-add_library(${PROJECT_NAME}-shared SHARED ${CGI_SRC})
+-set_target_properties(${PROJECT_NAME}-shared PROPERTIES
++add_library(${PROJECT_NAME} ${CGI_SRC})
++set_target_properties(${PROJECT_NAME} PROPERTIES
+ 	OUTPUT_NAME	${PROJECT_NAME}
+ 	SOVERSION	${PROJECT_VERSION_MAJOR}
+ 	VERSION		${PROJECT_VERSION}
+ )
+ 
+ # install binary
+-install(TARGETS ${PROJECT_NAME}-shared
++install(TARGETS ${PROJECT_NAME}
+ 	EXPORT ${PROJECT_NAME}-targets
+ 	LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++	ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
+ )
+ 
+ # install cmake targets
+-- 
+2.13.5
+
