From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Oct 2014 15:23:22 +0200
Subject: [Buildroot] [PATCH] [RFC] package/libplist: bump version
Message-ID: <1412515402-22348-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libplist has switched to using autotools, so remove our cmake-related
patches.

Completely disable Python bindings:
  - it requires cython, which we do not have packaged (so far)
  - the only user of libplist is XBMC, which does not need the Python
    bindings.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Note: this is only an RFC patch for now, so Maxime can properly test
against XBMC.
---
 ...1-cmake-let-CMake-drives-the-library-type.patch | 37 -----------------
 ...sure-the-libxml2-module-correctly-set-all.patch | 48 ----------------------
 ...support-python2-and-python3-when-defining.patch | 27 ------------
 package/libplist/libplist.mk                       | 28 ++++++-------
 4 files changed, 12 insertions(+), 128 deletions(-)
 delete mode 100644 package/libplist/libplist-0001-cmake-let-CMake-drives-the-library-type.patch
 delete mode 100644 package/libplist/libplist-0002-cmake-make-sure-the-libxml2-module-correctly-set-all.patch
 delete mode 100644 package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch

diff --git a/package/libplist/libplist-0001-cmake-let-CMake-drives-the-library-type.patch b/package/libplist/libplist-0001-cmake-let-CMake-drives-the-library-type.patch
deleted file mode 100644
index 247f3f0..0000000
--- a/package/libplist/libplist-0001-cmake-let-CMake-drives-the-library-type.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 13150b8e2b49a9c95eaad831ff69429ff9f66aa4 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sat, 30 Aug 2014 11:20:36 +0200
-Subject: [PATCH 1/2] cmake: let CMake drives the library type
-
-Do not force CMake to build shared object when BUILD_SHARED_LIBS is off.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- src/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index a0d6179..78946b1 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -34,7 +34,7 @@ SET(libcnary_object_files
- 
- SET_SOURCE_FILES_PROPERTIES(${libcnary_object_files} PROPERTIES EXTERNAL_OBJECT true GENERATED true)
- 
--ADD_LIBRARY( plist SHARED ${libplist_SRC} ${libcnary_object_files} )
-+ADD_LIBRARY( plist ${libplist_SRC} ${libcnary_object_files} )
- TARGET_LINK_LIBRARIES( plist ${LIBXML2_LIBRARIES} )
- SET_TARGET_PROPERTIES( plist PROPERTIES VERSION ${LIBPLIST_LIBVERSION} )
- SET_TARGET_PROPERTIES( plist PROPERTIES SOVERSION ${LIBPLIST_SOVERSION} )
-@@ -42,7 +42,7 @@ if(APPLE)
-   SET_TARGET_PROPERTIES( plist PROPERTIES INSTALL_NAME_DIR "${CMAKE_INSTALL_PREFIX}/lib")
- endif()
- 
--ADD_LIBRARY( plist++ SHARED ${libplist++_SRC} )
-+ADD_LIBRARY( plist++ ${libplist++_SRC} )
- TARGET_LINK_LIBRARIES( plist++ plist )
- SET_TARGET_PROPERTIES( plist++ PROPERTIES VERSION ${LIBPLIST_LIBVERSION} )
- SET_TARGET_PROPERTIES( plist++ PROPERTIES SOVERSION ${LIBPLIST_SOVERSION} )
--- 
-2.1.0
-
diff --git a/package/libplist/libplist-0002-cmake-make-sure-the-libxml2-module-correctly-set-all.patch b/package/libplist/libplist-0002-cmake-make-sure-the-libxml2-module-correctly-set-all.patch
deleted file mode 100644
index 2a807be..0000000
--- a/package/libplist/libplist-0002-cmake-make-sure-the-libxml2-module-correctly-set-all.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 49f7f7566ecd45ce87be07ac46bb27cf2abf9c3c Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 31 Aug 2014 10:08:47 +0200
-Subject: [PATCH] cmake: make sure the libxml2 module correctly set all ldflags
- in case of static link
-
-libxml2 dependencies against zlib and libiconv are optional.
-
-When executing a statically linked build, the default libxml2 CMake
-module fails to get the libxml2 dependencies (both the required and
-optional ones); so the link phase fails.
-
-However, pkg-config correctly gives these dependencies, even for static
-build. So, extend the libxml2 library list with what the pkg_check_modules
-CMake primitive (which will uses pkg-config) found.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- cmake/modules/FindLibXml2.cmake | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/cmake/modules/FindLibXml2.cmake b/cmake/modules/FindLibXml2.cmake
-index 8d3c77e..19bc930 100644
---- a/cmake/modules/FindLibXml2.cmake
-+++ b/cmake/modules/FindLibXml2.cmake
-@@ -39,6 +39,19 @@ FIND_LIBRARY(LIBXML2_LIBRARIES NAMES xml2 libxml2
-    ${PC_LIBXML_LIBRARY_DIRS}
-    )
- 
-+# Make sure we get all ldflags in case of static link
-+IF(NOT BUILD_SHARED_LIBS)
-+    FOREACH(_lib ${PC_LIBXML_STATIC_LIBRARIES})
-+        STRING(TOUPPER ${_lib} _Ulib)
-+        FIND_LIBRARY(_${_Ulib}_LIBRARIES NAMES ${_lib} lib${_lib}
-+            HINTS
-+            ${PC_LIBXML_LIBDIR}
-+            ${PC_LIBXML_LIBRARY_DIRS}
-+            )
-+        LIST(APPEND LIBXML2_LIBRARIES ${_${_Ulib}_LIBRARIES})
-+    ENDFOREACH()
-+ENDIF(NOT BUILD_SHARED_LIBS)
-+
- FIND_PROGRAM(LIBXML2_XMLLINT_EXECUTABLE xmllint)
- # for backwards compat. with KDE 4.0.x:
- SET(XMLLINT_EXECUTABLE "${LIBXML2_XMLLINT_EXECUTABLE}")
--- 
-2.1.0
-
diff --git a/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch b/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch
deleted file mode 100644
index a5218e8..0000000
--- a/package/libplist/libplist-0003-cmake-swig-support-python2-and-python3-when-defining.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 114d242a3b6b749b404cda80304e621556325d34 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Sun, 5 Oct 2014 10:13:06 +0200
-Subject: [PATCH] cmake: swig: support python2 and python3 when defining
- DISTUTILS_PYTHON_ILIBRARY_PATH
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- swig/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/swig/CMakeLists.txt b/swig/CMakeLists.txt
-index 379cb95..ae6f0e7 100644
---- a/swig/CMakeLists.txt
-+++ b/swig/CMakeLists.txt
-@@ -9,7 +9,7 @@ SWIG_ADD_MODULE( plist python plist.i )
- SWIG_LINK_LIBRARIES( plist plist plist++ ${PYTHON_LIBRARIES} )
- 
- EXEC_PROGRAM("${PYTHON_EXECUTABLE}"
--    ARGS "-c 'try:\n import distutils.sysconfig; print distutils.sysconfig.get_python_lib(plat_specific=1)\nexcept: pass\n'"
-+    ARGS "-c 'from __future__ import print_function\ntry:\n import distutils.sysconfig; print(distutils.sysconfig.get_python_lib(plat_specific=1))\nexcept: pass\n'"
-     OUTPUT_VARIABLE DISTUTILS_PYTHON_ILIBRARY_PATH
-     )
- 
--- 
-2.1.2
-
diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
index 1e44fff..1185370 100644
--- a/package/libplist/libplist.mk
+++ b/package/libplist/libplist.mk
@@ -4,25 +4,21 @@
 #
 ################################################################################
 
-LIBPLIST_VERSION = 1.6
+LIBPLIST_VERSION = 1.11
 LIBPLIST_SITE = http://cgit.sukimashita.com/libplist.git/snapshot
-LIBPLIST_DEPENDENCIES = libxml2
+LIBPLIST_DEPENDENCIES = libxml2 host-pkgconf
 LIBPLIST_INSTALL_STAGING = YES
-LIBPLIST_MAKE = $(MAKE1)
 LIBPLIST_LICENSE = LGPLv2.1+
 LIBPLIST_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
-LIBPLIST_DEPENDENCIES += \
-	python$(if $(BR2_PACKAGE_PYTHON3),3) \
-	host-swig
-LIBPLIST_CONF_OPTS += \
-	-DENABLE_PYTHON=ON \
-	-DSWIG_EXECUTABLE=$(SWIG)
-else
-LIBPLIST_CONF_OPTS += \
-	-DENABLE_PYTHON=OFF \
-	-DSWIG_EXECUTABLE=SWIG_EXECUTABLE-NOTFOUND
-endif
+# Straight out of the git tree:
+LIBPLIST_AUTORECONF = YES
+
+# Does not build in parallel
+LIBPLIST_MAKE = $(MAKE1)
+
+# Disable building Python bindings, because it requires host-cython, which
+# is not packaged in Buildroot at all.
+LIBPLIST_CONF_OPTS = --without-cython
 
-$(eval $(cmake-package))
+$(eval $(autotools-package))
-- 
1.9.1
