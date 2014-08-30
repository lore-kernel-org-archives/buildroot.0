From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 30 Aug 2014 11:52:26 +0200
Subject: [Buildroot] [PATCH 4/5] package/libplist: fix static link
In-Reply-To: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
References: <1409392347-16392-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409392347-16392-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- libplist depends on libm and zlib (via libxml2), so add a patch fixing
  the build-system that way
- disable shared object build when BR2_PREFER_STATIC_LIB is set

Fixes:
  http://autobuild.buildroot.net/results/9a3/9a364e3d91634a2da2bc481da1dee0ad0e870941/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 ...ibxml2-missing-dependencies-when-linking-.patch | 49 ++++++++++++++++++++++
 ...2-cmake-let-CMake-drives-the-library-type.patch | 37 ++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 package/libplist/libplist-0001-cmake-add-libxml2-missing-dependencies-when-linking-.patch
 create mode 100644 package/libplist/libplist-0002-cmake-let-CMake-drives-the-library-type.patch

diff --git a/package/libplist/libplist-0001-cmake-add-libxml2-missing-dependencies-when-linking-.patch b/package/libplist/libplist-0001-cmake-add-libxml2-missing-dependencies-when-linking-.patch
new file mode 100644
index 0000000..78a01b9
--- /dev/null
+++ b/package/libplist/libplist-0001-cmake-add-libxml2-missing-dependencies-when-linking-.patch
@@ -0,0 +1,49 @@
+From f7bda53dd85298884dd5d127de393a57400c6aea Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 30 Aug 2014 11:18:37 +0200
+Subject: [PATCH 1/2] cmake: add libxml2 missing dependencies when linking
+ statically
+
+libxml2 depends on libm and zlib, but CMake fails to add these dependencies
+to the LDFLAGS, especially when linking statically.
+
+So, extend the CMAKE_MODULE_PATH with the ones from libplist, then make
+sure libm and zlib libraries are correctly found and added to
+LIBXML2_LIBRARIES.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a13546e..c59d969 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -7,7 +7,7 @@ SET( LIBPLIST_VERSION "${LIBPLIST_VERSION_MAJOR}.${LIBPLIST_VERSION_MINOR}" )
+ SET( LIBPLIST_LIBVERSION "${LIBPLIST_SOVERSION}.${LIBPLIST_VERSION}" )
+ SET( PLUTIL_VERSION ${LIBPLIST_VERSION} )
+ 
+-SET( CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_SOURCE_DIR}/cmake/modules )
++list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake ${CMAKE_SOURCE_DIR}/cmake/modules )
+ 
+ cmake_minimum_required(VERSION 2.6)
+ 
+@@ -16,6 +16,14 @@ IF(NOT DEFINED CMAKE_INSTALL_LIBDIR)
+ ENDIF(NOT DEFINED CMAKE_INSTALL_LIBDIR)
+ 
+ FIND_PACKAGE( LibXml2 REQUIRED )
++# libxml2 depends on libm and zlib.
++# CMake fails to find these dependencies/LDFLAGS, especially when linking
++# statically.
++IF(NOT BUILD_SHARED_LIBS)
++    FIND_PACKAGE(ZLIB REQUIRED)
++    FIND_LIBRARY(LIBM libm.a)
++    list(APPEND LIBXML2_LIBRARIES ${LIBM} ${ZLIB_LIBRARIES})
++ENDIF()
+ 
+ OPTION(ENABLE_PYTHON "Enable Python bindings (needs Swig)" ON)
+ 
+-- 
+2.1.0
+
diff --git a/package/libplist/libplist-0002-cmake-let-CMake-drives-the-library-type.patch b/package/libplist/libplist-0002-cmake-let-CMake-drives-the-library-type.patch
new file mode 100644
index 0000000..97c6d24
--- /dev/null
+++ b/package/libplist/libplist-0002-cmake-let-CMake-drives-the-library-type.patch
@@ -0,0 +1,37 @@
+From f70208b93d120e46f201f11f31f42cf0ae5b6fee Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 30 Aug 2014 11:20:36 +0200
+Subject: [PATCH 2/2] cmake: let CMake drives the library type
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
-- 
2.1.0
