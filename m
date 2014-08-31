From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Aug 2014 22:49:31 +0200
Subject: [Buildroot] [git commit] package/libplist: fix static link
Message-ID: <20140831214441.2C3759D330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d7993654da0c5934e76fc56c54385c2e9ab813e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- libplist depends on libm and optionally on zlib and libiconv (via
  libxml2), so add a patch fixing the build-system that way
- disable shared object build when BR2_PREFER_STATIC_LIB is set

Fixes:
  http://autobuild.buildroot.net/results/9a3/9a364e3d91634a2da2bc481da1dee0ad0e870941/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-cmake-let-CMake-drives-the-library-type.patch |   37 +++++++++++++++
 ...sure-the-libxml2-module-correctly-set-all.patch |   48 ++++++++++++++++++++
 2 files changed, 85 insertions(+), 0 deletions(-)

diff --git a/package/libplist/libplist-0001-cmake-let-CMake-drives-the-library-type.patch b/package/libplist/libplist-0001-cmake-let-CMake-drives-the-library-type.patch
new file mode 100644
index 0000000..247f3f0
--- /dev/null
+++ b/package/libplist/libplist-0001-cmake-let-CMake-drives-the-library-type.patch
@@ -0,0 +1,37 @@
+From 13150b8e2b49a9c95eaad831ff69429ff9f66aa4 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 30 Aug 2014 11:20:36 +0200
+Subject: [PATCH 1/2] cmake: let CMake drives the library type
+
+Do not force CMake to build shared object when BUILD_SHARED_LIBS is off.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ src/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index a0d6179..78946b1 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -34,7 +34,7 @@ SET(libcnary_object_files
+ 
+ SET_SOURCE_FILES_PROPERTIES(${libcnary_object_files} PROPERTIES EXTERNAL_OBJECT true GENERATED true)
+ 
+-ADD_LIBRARY( plist SHARED ${libplist_SRC} ${libcnary_object_files} )
++ADD_LIBRARY( plist ${libplist_SRC} ${libcnary_object_files} )
+ TARGET_LINK_LIBRARIES( plist ${LIBXML2_LIBRARIES} )
+ SET_TARGET_PROPERTIES( plist PROPERTIES VERSION ${LIBPLIST_LIBVERSION} )
+ SET_TARGET_PROPERTIES( plist PROPERTIES SOVERSION ${LIBPLIST_SOVERSION} )
+@@ -42,7 +42,7 @@ if(APPLE)
+   SET_TARGET_PROPERTIES( plist PROPERTIES INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib")
+ endif()
+ 
+-ADD_LIBRARY( plist++ SHARED ${libplist++_SRC} )
++ADD_LIBRARY( plist++ ${libplist++_SRC} )
+ TARGET_LINK_LIBRARIES( plist++ plist )
+ SET_TARGET_PROPERTIES( plist++ PROPERTIES VERSION ${LIBPLIST_LIBVERSION} )
+ SET_TARGET_PROPERTIES( plist++ PROPERTIES SOVERSION ${LIBPLIST_SOVERSION} )
+-- 
+2.1.0
+
diff --git a/package/libplist/libplist-0002-cmake-make-sure-the-libxml2-module-correctly-set-all.patch b/package/libplist/libplist-0002-cmake-make-sure-the-libxml2-module-correctly-set-all.patch
new file mode 100644
index 0000000..2a807be
--- /dev/null
+++ b/package/libplist/libplist-0002-cmake-make-sure-the-libxml2-module-correctly-set-all.patch
@@ -0,0 +1,48 @@
+From 49f7f7566ecd45ce87be07ac46bb27cf2abf9c3c Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 31 Aug 2014 10:08:47 +0200
+Subject: [PATCH] cmake: make sure the libxml2 module correctly set all ldflags
+ in case of static link
+
+libxml2 dependencies against zlib and libiconv are optional.
+
+When executing a statically linked build, the default libxml2 CMake
+module fails to get the libxml2 dependencies (both the required and
+optional ones); so the link phase fails.
+
+However, pkg-config correctly gives these dependencies, even for static
+build. So, extend the libxml2 library list with what the pkg_check_modules
+CMake primitive (which will uses pkg-config) found.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ cmake/modules/FindLibXml2.cmake | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/cmake/modules/FindLibXml2.cmake b/cmake/modules/FindLibXml2.cmake
+index 8d3c77e..19bc930 100644
+--- a/cmake/modules/FindLibXml2.cmake
++++ b/cmake/modules/FindLibXml2.cmake
+@@ -39,6 +39,19 @@ FIND_LIBRARY(LIBXML2_LIBRARIES NAMES xml2 libxml2
+    ${PC_LIBXML_LIBRARY_DIRS}
+    )
+ 
++# Make sure we get all ldflags in case of static link
++IF(NOT BUILD_SHARED_LIBS)
++    FOREACH(_lib ${PC_LIBXML_STATIC_LIBRARIES})
++        STRING(TOUPPER ${_lib} _Ulib)
++        FIND_LIBRARY(_${_Ulib}_LIBRARIES NAMES ${_lib} lib${_lib}
++            HINTS
++            ${PC_LIBXML_LIBDIR}
++            ${PC_LIBXML_LIBRARY_DIRS}
++            )
++        LIST(APPEND LIBXML2_LIBRARIES ${_${_Ulib}_LIBRARIES})
++    ENDFOREACH()
++ENDIF(NOT BUILD_SHARED_LIBS)
++
+ FIND_PROGRAM(LIBXML2_XMLLINT_EXECUTABLE xmllint)
+ # for backwards compat. with KDE 4.0.x:
+ SET(XMLLINT_EXECUTABLE "${LIBXML2_XMLLINT_EXECUTABLE}")
+-- 
+2.1.0
+
