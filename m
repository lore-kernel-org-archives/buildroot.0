From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 29 May 2019 23:35:30 +0200
Subject: [Buildroot] [PATCH v3,
 1/1] package/wireshark: security bump to version 3.0.2
Message-ID: <20190529213530.20748-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following vulnerabilities have been fixed:
 - wnpa-sec-2019-19 Wireshark dissection engine crash. Bug 15778.

Update patches to use the ones merged upstream

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3:
 - Use patch from upstream instead of updating current patches

Changes v1 -> v2:
 - Fix static linking with glib2

 .../0001-CMake-add-USE_STATIC-option.patch    | 70 +++++++++++++++++++
 ...001-FindGLIB2.cmake-fix-static-build.patch | 39 -----------
 ...ts.txt-disable-rpath-in-static-build.patch | 42 -----------
 ...pkg-config-to-find-pcap-dependencies.patch | 45 ++++++++++++
 ...0003-FindPCAP.cmake-fix-static-build.patch | 46 ------------
 ...-config-to-find-libxml2-dependencies.patch | 48 +++++++++++++
 ...-config-to-find-libxml2-dependencies.patch | 33 ---------
 package/wireshark/wireshark.hash              |  4 +-
 package/wireshark/wireshark.mk                |  8 ++-
 9 files changed, 170 insertions(+), 165 deletions(-)
 create mode 100644 package/wireshark/0001-CMake-add-USE_STATIC-option.patch
 delete mode 100644 package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
 delete mode 100644 package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch
 create mode 100644 package/wireshark/0002-FindPCAP-use-pkg-config-to-find-pcap-dependencies.patch
 delete mode 100644 package/wireshark/0003-FindPCAP.cmake-fix-static-build.patch
 create mode 100644 package/wireshark/0003-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
 delete mode 100644 package/wireshark/0004-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch

diff --git a/package/wireshark/0001-CMake-add-USE_STATIC-option.patch b/package/wireshark/0001-CMake-add-USE_STATIC-option.patch
new file mode 100644
index 0000000000..ebfa723697
--- /dev/null
+++ b/package/wireshark/0001-CMake-add-USE_STATIC-option.patch
@@ -0,0 +1,70 @@
+From 900b9f137910c0ad0fe95d7354af8315ffeb0b04 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 22 Apr 2019 18:39:52 +0200
+Subject: [PATCH] CMake: add USE_STATIC option
+
+USE_STATIC will:
+ - always link statically with external libraries (such as glib2)
+ - will not set rpath to avoid the following error:
+
+CMake Error at cmake_install.cmake:50 (file):
+  file RPATH_CHANGE could not write new RPATH:
+
+    /usr/lib
+
+  to the file:
+
+    /home/fabrice/br-test-pkg/br-arm-full-static/target/usr/bin/tshark
+
+  No valid ELF RPATH or RUNPATH entry exists in the file;
+
+Change-Id: I242dc1a091cc211ee891568a2dee5080c9974fba
+Ping-Bug: 15713
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reviewed-on: https://code.wireshark.org/review/32945
+Petri-Dish: Peter Wu <peter@lekensteyn.nl>
+Tested-by: Petri Dish Buildbot
+Reviewed-by: Peter Wu <peter@lekensteyn.nl>
+[Retrieved from:
+https://github.com/wireshark/wireshark/commit/900b9f137910c0ad0fe95d7354af8315ffeb0b04]
+---
+ CMakeLists.txt   | 6 +++++-
+ CMakeOptions.txt | 1 +
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index df62819651..e2fdafc227 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -185,7 +185,7 @@ set(PROJECT_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}")
+ set(LIBRARY_INSTALL_RPATH "")
+ set(EXECUTABLE_INSTALL_RPATH "")
+ set(EXTCAP_INSTALL_RPATH "")
+-if(NOT (WIN32 OR APPLE))
++if(NOT (WIN32 OR APPLE OR USE_STATIC))
+ 	# Try to set a RPATH for installed binaries if the library directory is
+ 	# not already included in the default search list.
+ 	list(FIND CMAKE_C_IMPLICIT_LINK_DIRECTORIES "${CMAKE_INSTALL_FULL_LIBDIR}" IS_SYSTEM_DIR)
+@@ -325,6 +325,10 @@ if(OSS_FUZZ)
+ 		message(FATAL_ERROR "Cannot force libFuzzer when using oss-fuzz")
+ 	endif()
+ 	# Must not depend on external dependencies so statically link all libs.
++	set(USE_STATIC ON)
++endif()
++
++if(USE_STATIC)
+ 	set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
+ endif()
+ 
+diff --git a/CMakeOptions.txt b/CMakeOptions.txt
+index b99e949c44..a605f7b49c 100644
+--- a/CMakeOptions.txt
++++ b/CMakeOptions.txt
+@@ -59,6 +59,7 @@ if(WIN32)
+ 	option(ENABLE_AIRPCAP    "Enable AirPcap support" ON)
+ endif()
+ option(ENABLE_STATIC            "Build Wireshark libraries statically" OFF)
++option(USE_STATIC               "Always link statically with external libraries" OFF)
+ option(ENABLE_PLUGINS           "Build with plugins" ON)
+ option(ENABLE_PLUGIN_IFDEMO     "Build with plugin interface demo" OFF)
+ option(ENABLE_PCAP_NG_DEFAULT   "Enable pcapng as default file format" ON)
diff --git a/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch b/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
deleted file mode 100644
index 5335fbf901..0000000000
--- a/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 388cd212f3f055600a37f550dd79b156193f3ce5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 16 Apr 2019 11:19:13 +0200
-Subject: [PATCH] FindGLIB2.cmake: fix static build
-
-captype, editcap and capinfos needs glib2 and its depedencies such as
-pcre otherwise static build will fail on missing references
-
-Currenttly, FindGLIB2.cmake sets GLIB2_LIBRARIES to GLIB2_LIBRARY then
-it checks for pcre library only when CMAKE_FIND_LIBRARIES_SUFFIXES is
-equal to ".a". When it is equal to ".so;.a", pcre is not added even
-if pkg-config has only found a static library.
-
-To fix this error, update FindGLIB2.cmake to append GLIB_LIBRARY to the
-GLIB2_LIBRARIES. In the UNIX context, GLIB2_LIBRARIES will contain all
-the needed dependencies returned by pkg-config
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://code.wireshark.org/review/#/c/32869/]
----
- cmake/modules/FindGLIB2.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/modules/FindGLIB2.cmake b/cmake/modules/FindGLIB2.cmake
-index 2b55b742fe..46ad3c41a6 100644
---- a/cmake/modules/FindGLIB2.cmake
-+++ b/cmake/modules/FindGLIB2.cmake
-@@ -92,7 +92,7 @@ find_package_handle_standard_args( GLIB2
- )
- 
- if( GLIB2_FOUND )
--	set( GLIB2_LIBRARIES ${GLIB2_LIBRARY} )
-+	list( APPEND GLIB2_LIBRARIES ${GLIB2_LIBRARY} )
- 	# Include transitive dependencies for static linking.
- 	if(UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a")
- 		find_library(PCRE_LIBRARY pcre)
--- 
-2.20.1
-
diff --git a/package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch b/package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch
deleted file mode 100644
index 5fe0e58bf9..0000000000
--- a/package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e4cbd1964bcb7e989acd97c4c17508160ec31c5a Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 16 Apr 2019 10:54:01 +0200
-Subject: [PATCH] CMakeLists.txt: disable rpath in static build
-
-Trying to set RPATH to a static binary results in a build failure:
-
-CMake Error at cmake_install.cmake:50 (file):
-  file RPATH_CHANGE could not write new RPATH:
-
-    /usr/lib
-
-  to the file:
-
-    /home/fabrice/br-test-pkg/br-arm-full-static/target/usr/bin/tshark
-
-  No valid ELF RPATH or RUNPATH entry exists in the file;
-
-To fix this error, do not set RPATH if ENABLE_STATIC is set by the user
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: will be sent after first patch is merged]
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 95822cd0a6..38ba2382bb 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -185,7 +185,7 @@ set(PROJECT_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}")
- set(LIBRARY_INSTALL_RPATH "")
- set(EXECUTABLE_INSTALL_RPATH "")
- set(EXTCAP_INSTALL_RPATH "")
--if(NOT (WIN32 OR APPLE))
-+if(NOT (WIN32 OR APPLE OR ENABLE_STATIC))
- 	# Try to set a RPATH for installed binaries if the library directory is
- 	# not already included in the default search list.
- 	list(FIND CMAKE_C_IMPLICIT_LINK_DIRECTORIES "${CMAKE_INSTALL_FULL_LIBDIR}" IS_SYSTEM_DIR)
--- 
-2.20.1
-
diff --git a/package/wireshark/0002-FindPCAP-use-pkg-config-to-find-pcap-dependencies.patch b/package/wireshark/0002-FindPCAP-use-pkg-config-to-find-pcap-dependencies.patch
new file mode 100644
index 0000000000..d9ac80e982
--- /dev/null
+++ b/package/wireshark/0002-FindPCAP-use-pkg-config-to-find-pcap-dependencies.patch
@@ -0,0 +1,45 @@
+From 1799b24aa397e98f7c894d17b37c087f1ae29d95 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 22 Apr 2019 18:40:25 +0200
+Subject: [PATCH] FindPCAP: use pkg-config to find pcap dependencies
+
+On UNIX, when statically built, pcap can depends on other libraries such
+as -lnl-3. Add a call to pkg-config to find them and append them to
+PCAP_LIBRARIES (and so to CMAKE_REQUIRED_LIBRARIES) otherwise all
+check_function_exists calls will fail
+
+Change-Id: I98361c05553738d015310fae76c17dfc08e131ff
+Ping-Bug: 15713
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reviewed-on: https://code.wireshark.org/review/32946
+Reviewed-by: Peter Wu <peter@lekensteyn.nl>
+Petri-Dish: Peter Wu <peter@lekensteyn.nl>
+Tested-by: Petri Dish Buildbot
+Reviewed-by: Guy Harris <guy@alum.mit.edu>
+[Retrieved from:
+https://github.com/wireshark/wireshark/commit/1799b24aa397e98f7c894d17b37c087f1ae29d95]
+---
+ cmake/modules/FindPCAP.cmake | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/cmake/modules/FindPCAP.cmake b/cmake/modules/FindPCAP.cmake
+index dfd80415f6..6fe2d0f4dc 100644
+--- a/cmake/modules/FindPCAP.cmake
++++ b/cmake/modules/FindPCAP.cmake
+@@ -38,6 +38,16 @@ find_package_handle_standard_args( PCAP DEFAULT_MSG PCAP_LIBRARY PCAP_INCLUDE_DI
+ if( PCAP_FOUND )
+   set( PCAP_INCLUDE_DIRS ${PCAP_INCLUDE_DIR} )
+   set( PCAP_LIBRARIES ${PCAP_LIBRARY} )
++
++  # Include transitive dependencies for static linking.
++  # This requires:
++  #?1) a system with pkg-config installed
++  # 2) libpcap >= 1.9.0 with its .pc files installed
++  if( UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a" )
++    find_package( PkgConfig )
++    pkg_search_module( PC_LIBPCAP libpcap )
++    list( APPEND PCAP_LIBRARIES ${PC_LIBPCAP_LIBRARIES} )
++  endif()
+ else()
+   set( PCAP_INCLUDE_DIRS )
+   set( PCAP_LIBRARIES )
diff --git a/package/wireshark/0003-FindPCAP.cmake-fix-static-build.patch b/package/wireshark/0003-FindPCAP.cmake-fix-static-build.patch
deleted file mode 100644
index 425fa35ffc..0000000000
--- a/package/wireshark/0003-FindPCAP.cmake-fix-static-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 1ffe04d0f2ef3c7737f1f9667cfcdd6c4239bbbe Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 17 Apr 2019 23:58:55 +0200
-Subject: [PATCH] FindPCAP.cmake: fix static build
-
-When statically built, pcap can depends on other libraries such as
--lnl-3. Add a call to pkg-config to find them and don't overwrite
-PCAP_LIBRARIES with PCAP_LIBRARY (use APPEND instead)
-
-Fixes:
- - http://autobuild.buildroot.org/results/277a24ad543a8f54cc8afde4f359f5d77b42eb7f
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet (waiting feedback on first patch)]
----
- cmake/modules/FindPCAP.cmake | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/cmake/modules/FindPCAP.cmake b/cmake/modules/FindPCAP.cmake
-index dfd80415f6..826ccfbdcc 100644
---- a/cmake/modules/FindPCAP.cmake
-+++ b/cmake/modules/FindPCAP.cmake
-@@ -9,6 +9,11 @@
- include( FindWSWinLibs )
- FindWSWinLibs( "WpdPack" "PCAP_HINTS" )
- 
-+if (NOT WIN32)
-+  find_package(PkgConfig)
-+  pkg_search_module( PCAP libpcap )
-+endif()
-+
- # The 64-bit wpcap.lib is under /x64
- set ( _PLATFORM_SUBDIR "" )
- if( WIN32 AND "${WIRESHARK_TARGET_PLATFORM}" STREQUAL "win64" )
-@@ -37,7 +42,7 @@ find_package_handle_standard_args( PCAP DEFAULT_MSG PCAP_LIBRARY PCAP_INCLUDE_DI
- 
- if( PCAP_FOUND )
-   set( PCAP_INCLUDE_DIRS ${PCAP_INCLUDE_DIR} )
--  set( PCAP_LIBRARIES ${PCAP_LIBRARY} )
-+  list( APPEND PCAP_LIBRARIES ${PCAP_LIBRARY} )
- else()
-   set( PCAP_INCLUDE_DIRS )
-   set( PCAP_LIBRARIES )
--- 
-2.20.1
-
diff --git a/package/wireshark/0003-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch b/package/wireshark/0003-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
new file mode 100644
index 0000000000..fe2d15ff2b
--- /dev/null
+++ b/package/wireshark/0003-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
@@ -0,0 +1,48 @@
+From 580098d875b497e5d5aa36dfad10291668e7d392 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 24 Apr 2019 22:22:29 +0200
+Subject: [PATCH] FindXml2: use pkg-config to find libxml2 dependencies
+
+On UNIX, when statically built, libxml2 can depends on other libraries
+such as lzma. These dependencies are already retrieved through
+pkg-config so append them to LIBXML2_LIBRARIES otherwise static build
+will fail
+
+Change-Id: I362064969488ec53042aa323eadb54fef026d8a5
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Reviewed-on: https://code.wireshark.org/review/32968
+Petri-Dish: Guy Harris <guy@alum.mit.edu>
+Tested-by: Petri Dish Buildbot
+Reviewed-by: Peter Wu <peter@lekensteyn.nl>
+[Retrieved from:
+https://github.com/wireshark/wireshark/commit/580098d875b497e5d5aa36dfad10291668e7d392]
+---
+ cmake/modules/FindLibXml2.cmake | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/cmake/modules/FindLibXml2.cmake b/cmake/modules/FindLibXml2.cmake
+index 99d70af57d..34121ef01b 100644
+--- a/cmake/modules/FindLibXml2.cmake
++++ b/cmake/modules/FindLibXml2.cmake
+@@ -106,10 +106,17 @@ FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibXml2
+ 
+ mark_as_advanced(LIBXML2_INCLUDE_DIR LIBXML2_LIBRARY LIBXML2_XMLLINT_EXECUTABLE)
+ 
+-if(LibXml2_FOUND AND NOT TARGET LibXml2::LibXml2)
+-   add_library(LibXml2::LibXml2 UNKNOWN IMPORTED)
+-   set_target_properties(LibXml2::LibXml2 PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${LIBXML2_INCLUDE_DIRS}")
+-   set_property(TARGET LibXml2::LibXml2 APPEND PROPERTY IMPORTED_LOCATION "${LIBXML2_LIBRARY}")
++if(LibXml2_FOUND)
++    # Include transitive dependencies for static linking.
++    if(UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a")
++        list(APPEND LIBXML2_LIBRARIES ${PC_LIBXML_LIBRARIES})
++    endif()
++
++    if (NOT TARGET LibXml2::LibXml2)
++        add_library(LibXml2::LibXml2 UNKNOWN IMPORTED)
++        set_target_properties(LibXml2::LibXml2 PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${LIBXML2_INCLUDE_DIRS}")
++        set_property(TARGET LibXml2::LibXml2 APPEND PROPERTY IMPORTED_LOCATION "${LIBXML2_LIBRARY}")
++    endif()
+ endif()
+ 
+ AddWSWinDLLS(LibXml2 LIBXML2_HINTS "libxml2*" "lzma*")
diff --git a/package/wireshark/0004-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch b/package/wireshark/0004-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
deleted file mode 100644
index ab549021e4..0000000000
--- a/package/wireshark/0004-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e6a2e71831f0699e9759e0579a00eea5fcb93696 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 24 Apr 2019 20:23:00 +0200
-Subject: [PATCH] FindXml2: use pkg-config to find libxml2 dependencies
-
-On UNIX, when statically built, libxml2 can depends on other libraries such
-as lzma. These dependencies are already retrieved through pkg-config so
-append them to LIBXML2_LIBRARIES otherwise static build will fail
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent yet]
----
- cmake/modules/FindLibXml2.cmake | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cmake/modules/FindLibXml2.cmake b/cmake/modules/FindLibXml2.cmake
-index 99d70af57d..2a4b1f470f 100644
---- a/cmake/modules/FindLibXml2.cmake
-+++ b/cmake/modules/FindLibXml2.cmake
-@@ -98,6 +98,10 @@ endif()
- 
- set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR} ${PC_LIBXML_INCLUDE_DIRS})
- set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
-+# Include transitive dependencies for static linking.
-+if(UNIX)
-+    list(APPEND LIBXML2_LIBRARIES ${PC_LIBXML_LIBRARIES})
-+endif()
- 
- include(FindPackageHandleStandardArgs)
- FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibXml2
--- 
-2.20.1
-
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 99aa433bb4..8498f59140 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,4 +1,4 @@
-# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.1.txt
-sha256 86864c3d0f6c2311992a98d8ea7dfd429097fe62dae2e5516e1a2f6bef2ac08c  wireshark-3.0.1.tar.xz
+# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.2.txt
+sha256 7e1ec5664a0dba4493d8729f9922378bdd05040fb159c2b03b42111efda2e53b  wireshark-3.0.2.tar.xz
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 60cde3f838..a7401aa6dc 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.0.1
+WIRESHARK_VERSION = 3.0.2
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
@@ -154,11 +154,13 @@ endif
 ifeq ($(BR2_STATIC_LIBS),y)
 WIRESHARK_CONF_OPTS += \
 	-DENABLE_PLUGINS=OFF \
-	-DENABLE_STATIC=ON
+	-DENABLE_STATIC=ON \
+	-DUSE_STATIC=ON
 else
 WIRESHARK_CONF_OPTS += \
 	-DENABLE_PLUGINS=ON \
-	-DENABLE_STATIC=OFF
+	-DENABLE_STATIC=OFF \
+	-DUSE_STATIC=OFF
 endif
 
 define WIRESHARK_REMOVE_DOCS
-- 
2.20.1
