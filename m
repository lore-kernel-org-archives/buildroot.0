From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  8 Mar 2015 12:26:02 +0100
Subject: [Buildroot] [PATCH v2 2/4] package/libftdi1: new package
In-Reply-To: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
References: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1425813964-5295-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Daniel Sangue <daniel.sangue@sangue.ch>

This version of libftdi can coexists beside the 0.x version.

Signed-off-by: Daniel Sangue <daniel.sangue@sangue.ch>
[Samuel Martin:
  - libftdi1.mk: bump to version 1.2 and add hash
  - cleanup uneeded libusb-compat stuff
  - Config.in: add comment when ftdipp1 deps are not met
  - fix typos in variable names and legit CMake options for *_CONF_OPTS
  - add support for python bindings and ftdi_eeprom
  - fix static build
  - fix build with toolchain w/o C++ support
]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
change v1->v2
- rebase on top of master
- libftdi1.mk: bump to version 1.2
- add hash
- Config.in: cleanup deps for ftdipp1
- Config.in: add comment when ftdipp1 deps are not met
- libftdi1.mk: fix typos in LIBFTDI1_CONF_OPTS variable name
- libftdi1.mk: use proper CMake options for *_CONF_OPTS
- libftdi1.mk: update libftdi1 deps and conf. opts.
- libftdi1.mk: add support for python bindings and ftdi_eeprom
- libftdi1.mk: add patch fixing static build
- libftdi1.mk: add patch fixing FindUSB1.cmake module (for static build)
- libftdi1.mk: add patch correctly disabling ftdipp when the toolchain
  does not install libstdc++
- reword commit message
---
 package/Config.in                                  |  1 +
 ...he-standard-CMake-flag-to-drive-the-share.patch | 96 ++++++++++++++++++++++
 .../libftdi1/0002-cmake-fix-FindUSB1.cmake.patch   | 34 ++++++++
 ...o-not-check-for-g-when-FTDIPP-is-disabled.patch | 46 +++++++++++
 package/libftdi1/Config.in                         | 37 +++++++++
 package/libftdi1/libftdi1.hash                     |  2 +
 package/libftdi1/libftdi1.mk                       | 37 +++++++++
 7 files changed, 253 insertions(+)
 create mode 100644 package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
 create mode 100644 package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
 create mode 100644 package/libftdi1/0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
 create mode 100644 package/libftdi1/Config.in
 create mode 100644 package/libftdi1/libftdi1.hash
 create mode 100644 package/libftdi1/libftdi1.mk

diff --git a/package/Config.in b/package/Config.in
index 1bce00a..b46eb79 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -752,6 +752,7 @@ menu "Hardware handling"
 	source "package/libcec/Config.in"
 	source "package/libfreefare/Config.in"
 	source "package/libftdi/Config.in"
+	source "package/libftdi1/Config.in"
 	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
diff --git a/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
new file mode 100644
index 0000000..487fc28
--- /dev/null
+++ b/package/libftdi1/0001-cmake-use-the-standard-CMake-flag-to-drive-the-share.patch
@@ -0,0 +1,96 @@
+From 7e57ff280b55b45e74329b9988279e8831d32eab Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 25 Jan 2015 09:45:04 +0100
+Subject: [PATCH 1/2] cmake: use the standard CMake flag to drive the shared
+ object build
+
+Remove the STATICLIBS CMake option (and the code handling it) and let
+the standard CMake flags drive the shared object build.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt        |  2 --
+ ftdipp/CMakeLists.txt | 15 +--------------
+ src/CMakeLists.txt    | 13 +------------
+ 3 files changed, 2 insertions(+), 28 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 74f80f4..0ba0b08 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -46,8 +46,6 @@ set(CPACK_COMPONENT_SHAREDLIBS_GROUP "Development")
+ set(CPACK_COMPONENT_STATICLIBS_GROUP "Development")
+ set(CPACK_COMPONENT_HEADERS_GROUP    "Development")
+ 
+-option ( STATICLIBS "Build static libraries" ON )
+-
+ # guess LIB_SUFFIX, don't take debian multiarch into account 
+ if ( NOT DEFINED LIB_SUFFIX )
+   if( CMAKE_SYSTEM_NAME MATCHES "Linux"
+diff --git a/ftdipp/CMakeLists.txt b/ftdipp/CMakeLists.txt
+index 7500211..27e7884 100644
+--- a/ftdipp/CMakeLists.txt
++++ b/ftdipp/CMakeLists.txt
+@@ -23,8 +23,7 @@ if (FTDIPP)
+     set(FTDI_BUILD_CPP True PARENT_SCOPE)
+     message(STATUS "Building libftdi1++")
+ 
+-    # Shared library
+-    add_library(ftdipp1 SHARED ${cpp_sources})
++    add_library(ftdipp1 ${cpp_sources})
+ 
+     math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatiblity with previous releases
+     set_target_properties(ftdipp1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 2)
+@@ -41,18 +40,6 @@ if (FTDIPP)
+               LIBRARY DESTINATION lib${LIB_SUFFIX}
+               ARCHIVE DESTINATION lib${LIB_SUFFIX}
+             )
+-            
+-    # Static library
+-    if ( STATICLIBS )
+-      add_library(ftdipp1-static STATIC ${cpp_sources})
+-      set_target_properties(ftdipp1-static PROPERTIES OUTPUT_NAME "ftdipp1")
+-      set_target_properties(ftdipp1-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
+-
+-      install ( TARGETS ftdipp1-static
+-                ARCHIVE DESTINATION lib${LIB_SUFFIX}
+-                COMPONENT staticlibs
+-              )
+-    endif ()
+ 
+     install ( FILES ${cpp_headers}
+               DESTINATION include/${PROJECT_NAME}
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 9fd86a6..501d4a8 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -21,7 +21,7 @@ configure_file(ftdi_version_i.h.in "${CMAKE_CURRENT_BINARY_DIR}/ftdi_version_i.h
+ set(c_sources     ${CMAKE_CURRENT_SOURCE_DIR}/ftdi.c ${CMAKE_CURRENT_SOURCE_DIR}/ftdi_stream.c CACHE INTERNAL "List of c sources" )
+ set(c_headers     ${CMAKE_CURRENT_SOURCE_DIR}/ftdi.h CACHE INTERNAL "List of c headers" )
+ 
+-add_library(ftdi1 SHARED ${c_sources})
++add_library(ftdi1 ${c_sources})
+ 
+ math(EXPR VERSION_FIXUP "${MAJOR_VERSION} + 1")    # Compatiblity with previous releases
+ set_target_properties(ftdi1 PROPERTIES VERSION ${VERSION_FIXUP}.${MINOR_VERSION}.0 SOVERSION 2)
+@@ -38,17 +38,6 @@ install ( TARGETS ftdi1
+           ARCHIVE DESTINATION lib${LIB_SUFFIX}
+         )
+ 
+-if ( STATICLIBS )
+-  add_library(ftdi1-static STATIC ${c_sources})
+-  target_link_libraries(ftdi1-static ${LIBUSB_LIBRARIES})
+-  set_target_properties(ftdi1-static PROPERTIES OUTPUT_NAME "ftdi1")
+-  set_target_properties(ftdi1-static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
+-  install ( TARGETS ftdi1-static
+-            ARCHIVE DESTINATION lib${LIB_SUFFIX}
+-            COMPONENT staticlibs
+-          )
+-endif ()
+-
+ install ( FILES ${c_headers}
+           DESTINATION include/${PROJECT_NAME}
+           COMPONENT headers
+-- 
+2.2.2
+
diff --git a/package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch b/package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
new file mode 100644
index 0000000..5619a0c
--- /dev/null
+++ b/package/libftdi1/0002-cmake-fix-FindUSB1.cmake.patch
@@ -0,0 +1,34 @@
+From 81275d75ae88fe8ab1915d3ba260ea935e63c362 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 25 Jan 2015 10:01:17 +0100
+Subject: [PATCH 2/2] cmake: fix FindUSB1.cmake
+
+Make sure all ldflags are correctly set, especially for static build.
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ cmake/FindUSB1.cmake | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/FindUSB1.cmake b/cmake/FindUSB1.cmake
+index b90e297..e7f1b3c 100644
+--- a/cmake/FindUSB1.cmake
++++ b/cmake/FindUSB1.cmake
+@@ -26,8 +26,12 @@ else (LIBUSB_INCLUDE_DIR AND LIBUSB_LIBRARIES)
+     PATH_SUFFIXES libusb-1.0
+     PATHS ${PC_LIBUSB_INCLUDEDIR} ${PC_LIBUSB_INCLUDE_DIRS})
+ 
+-  FIND_LIBRARY(LIBUSB_LIBRARIES NAMES usb-1.0
+-    PATHS ${PC_LIBUSB_LIBDIR} ${PC_LIBUSB_LIBRARY_DIRS})
++  set(LIBUSB_LIBRARIES ${PC_LIBUSB_STATIC_LDFLAGS} ${PC_LIBUSB_STATIC_LDFLAGS_OTHER})
++  foreach(libname ${PC_LIBUSB_STATIC_LIBRARIES})
++    FIND_LIBRARY(lib NAMES ${libname}
++      PATHS ${PC_LIBUSB_LIBDIR} ${PC_LIBUSB_LIBRARY_DIRS})
++    list(APPEND LIBUSB_LIBRARIES ${lib})
++  endforeach()
+ 
+   include(FindPackageHandleStandardArgs)
+   FIND_PACKAGE_HANDLE_STANDARD_ARGS(LIBUSB DEFAULT_MSG LIBUSB_LIBRARIES LIBUSB_INCLUDE_DIR)
+-- 
+2.2.2
+
diff --git a/package/libftdi1/0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch b/package/libftdi1/0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
new file mode 100644
index 0000000..be0913d
--- /dev/null
+++ b/package/libftdi1/0003-cmake-do-not-check-for-g-when-FTDIPP-is-disabled.patch
@@ -0,0 +1,46 @@
+From c215d5ecd985b57700e817920d0e99112b4a571b Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sun, 25 Jan 2015 13:35:24 +0100
+Subject: [PATCH] cmake: do not check for g++ when FTDIPP is disabled
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ CMakeLists.txt        | 6 ++++--
+ ftdipp/CMakeLists.txt | 1 +
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 0ba0b08..e880211 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ # Project
+-project(libftdi1)
++project(libftdi1 C)
+ set(MAJOR_VERSION 1)
+ set(MINOR_VERSION 2)
+ set(PACKAGE libftdi1)
+@@ -145,7 +145,9 @@ else(DOCUMENTATION AND DOXYGEN_FOUND)
+ endif(DOCUMENTATION AND DOXYGEN_FOUND)
+ 
+ add_subdirectory(src)
+-add_subdirectory(ftdipp)
++if(FTDIPP)
++  add_subdirectory(ftdipp)
++endif()
+ add_subdirectory(python)
+ add_subdirectory(ftdi_eeprom)
+ add_subdirectory(examples)
+diff --git a/ftdipp/CMakeLists.txt b/ftdipp/CMakeLists.txt
+index 27e7884..2d080f4 100644
+--- a/ftdipp/CMakeLists.txt
++++ b/ftdipp/CMakeLists.txt
+@@ -1,4 +1,5 @@
+ # Check
++project(libftdipp1 C CXX)
+ set(FTDI_BUILD_CPP False PARENT_SCOPE)
+ 
+ option ( FTDIPP "Build C++ binding library libftdi1++" ON )
+-- 
+2.2.2
+
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
new file mode 100644
index 0000000..1bb0bfd
--- /dev/null
+++ b/package/libftdi1/Config.in
@@ -0,0 +1,37 @@
+config BR2_PACKAGE_LIBFTDI1
+	bool "libftdi1"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Userspace access to FTDI USB interface chips (version 1.x)
+
+	  http://www.intra2net.com/en/developer/libftdi/index.php
+
+if BR2_PACKAGE_LIBFTDI1
+
+config BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on BR2_LARGEFILE # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
+	select BR2_PACKAGE_BOOST
+	bool "libfdtipp1"
+	help
+	  C++ bindings for libftdi
+
+comment "libfdtipp1 needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	bool "python bindings"
+	help
+	  Python bindings for libftdi
+
+config BR2_PACKAGE_LIBTFDI1_FDTI_EEPROM
+	select BR2_PACKAGE_LIBCONFUSE
+	bool "ftdi_eeprom tool"
+
+endif # BR2_PACKAGE_LIBFTDI1
+
+comment "libftdi1 needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
new file mode 100644
index 0000000..e53bc8f
--- /dev/null
+++ b/package/libftdi1/libftdi1.hash
@@ -0,0 +1,2 @@
+# Locally computed (after checking the signature from http://www.intra2net.com/en/developer/libftdi/download.php)
+sha256  a6ea795c829219015eb372b03008351cee3fb39f684bff3bf8a4620b558488d6  libftdi1-1.2.tar.bz2
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
new file mode 100644
index 0000000..608c29a
--- /dev/null
+++ b/package/libftdi1/libftdi1.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# libftdi1
+#
+################################################################################
+
+LIBFTDI1_VERSION = 1.2
+LIBFTDI1_SOURCE = libftdi1-$(LIBFTDI1_VERSION).tar.bz2
+LIBFTDI1_SITE = http://www.intra2net.com/en/developer/libftdi/download/
+LIBFTDI1_INSTALL_STAGING = YES
+LIBFTDI1_DEPENDENCIES = libusb
+LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
+
+ifeq ($(BR2_PACKAGE_LIBTFDI1_LIBFTDIPP1),y)
+LIBFTDI1_DEPENDENCIES += boost
+LIBFTDI1_CONF_OPTS += -DFTDIPP=ON
+else
+LIBFTDI1_CONF_OPTS += -DFTDIPP=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTFDI1_PYTHON_BINDINGS),y)
+LIBFTDI1_DEPENDENCIES += $(if BR2_PACKAGE_PYTHON,python,python3) host-swig
+LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=ON
+else
+LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTFDI1_FDTI_EEPROM),y)
+# ftdi_eeprom optionally depends on libintl, so make sure gettext is built
+# _before_ libfitdi1 when gettext is enbaled.
+LIBFTDI1_DEPENDENCIES += libconfuse $(if $(BR2_PACKAGE_GETTEXT),gettext)
+LIBFTDI1_CONF_OPTS += -DFTDI_EEPROM=ON
+else
+LIBFTDI1_CONF_OPTS += -DFTDI_EEPROM=OFF
+endif
+
+$(eval $(cmake-package))
-- 
2.3.2
