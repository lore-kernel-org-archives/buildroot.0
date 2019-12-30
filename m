From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 14:04:24 +0100
Subject: [Buildroot] [git commit] package/wireshark: bump to version 3.2.0
Message-ID: <20191230125500.EC7BA8E7B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=632dd3a518ccde1e4d55c9c97a8dbaac4a1c2a2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patches (already in version)
- Add patch to fix static build with pcap by reverting an upstream
  commit. This patch has been sent upstream and there is already some
  comments on it. However, upstream does not seem to really care/test
  static builds. So, perhaps an easier road would to add a dynamic
  library dependency on wireshark instead of fixing things again and
  again each time wireshark is bumped...
- Add mandatory speexdsp dependency to avoid using internal one when
  building wireshark or sharkd:
  https://github.com/wireshark/wireshark/commit/186f985793cceb7d7222955987df72ab5a82beeb
- Disable -Werror (it is now enabled by default)
- Add brotli optional dependency:
  https://github.com/wireshark/wireshark/commit/9ce60b173bf17b7d20695d9dc1de050989019664

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-CMake-add-USE_STATIC-option.patch         |  70 --------------
 ...t-CMake-Add-libpcap-imported-library-targ.patch | 104 +++++++++++++++++++++
 ...-use-pkg-config-to-find-pcap-dependencies.patch |  45 ---------
 ...e-pkg-config-to-find-libxml2-dependencies.patch |  48 ----------
 package/wireshark/Config.in                        |   1 +
 package/wireshark/wireshark.hash                   |   6 +-
 package/wireshark/wireshark.mk                     |  13 ++-
 7 files changed, 119 insertions(+), 168 deletions(-)

diff --git a/package/wireshark/0001-CMake-add-USE_STATIC-option.patch b/package/wireshark/0001-CMake-add-USE_STATIC-option.patch
deleted file mode 100644
index ebfa723697..0000000000
--- a/package/wireshark/0001-CMake-add-USE_STATIC-option.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 900b9f137910c0ad0fe95d7354af8315ffeb0b04 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 22 Apr 2019 18:39:52 +0200
-Subject: [PATCH] CMake: add USE_STATIC option
-
-USE_STATIC will:
- - always link statically with external libraries (such as glib2)
- - will not set rpath to avoid the following error:
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
-Change-Id: I242dc1a091cc211ee891568a2dee5080c9974fba
-Ping-Bug: 15713
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-on: https://code.wireshark.org/review/32945
-Petri-Dish: Peter Wu <peter@lekensteyn.nl>
-Tested-by: Petri Dish Buildbot
-Reviewed-by: Peter Wu <peter@lekensteyn.nl>
-[Retrieved from:
-https://github.com/wireshark/wireshark/commit/900b9f137910c0ad0fe95d7354af8315ffeb0b04]
----
- CMakeLists.txt   | 6 +++++-
- CMakeOptions.txt | 1 +
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index df62819651..e2fdafc227 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -185,7 +185,7 @@ set(PROJECT_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}")
- set(LIBRARY_INSTALL_RPATH "")
- set(EXECUTABLE_INSTALL_RPATH "")
- set(EXTCAP_INSTALL_RPATH "")
--if(NOT (WIN32 OR APPLE))
-+if(NOT (WIN32 OR APPLE OR USE_STATIC))
- 	# Try to set a RPATH for installed binaries if the library directory is
- 	# not already included in the default search list.
- 	list(FIND CMAKE_C_IMPLICIT_LINK_DIRECTORIES "${CMAKE_INSTALL_FULL_LIBDIR}" IS_SYSTEM_DIR)
-@@ -325,6 +325,10 @@ if(OSS_FUZZ)
- 		message(FATAL_ERROR "Cannot force libFuzzer when using oss-fuzz")
- 	endif()
- 	# Must not depend on external dependencies so statically link all libs.
-+	set(USE_STATIC ON)
-+endif()
-+
-+if(USE_STATIC)
- 	set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
- endif()
- 
-diff --git a/CMakeOptions.txt b/CMakeOptions.txt
-index b99e949c44..a605f7b49c 100644
---- a/CMakeOptions.txt
-+++ b/CMakeOptions.txt
-@@ -59,6 +59,7 @@ if(WIN32)
- 	option(ENABLE_AIRPCAP    "Enable AirPcap support" ON)
- endif()
- option(ENABLE_STATIC            "Build Wireshark libraries statically" OFF)
-+option(USE_STATIC               "Always link statically with external libraries" OFF)
- option(ENABLE_PLUGINS           "Build with plugins" ON)
- option(ENABLE_PLUGIN_IFDEMO     "Build with plugin interface demo" OFF)
- option(ENABLE_PCAP_NG_DEFAULT   "Enable pcapng as default file format" ON)
diff --git a/package/wireshark/0001-CMake-revert-CMake-Add-libpcap-imported-library-targ.patch b/package/wireshark/0001-CMake-revert-CMake-Add-libpcap-imported-library-targ.patch
new file mode 100644
index 0000000000..20225f2204
--- /dev/null
+++ b/package/wireshark/0001-CMake-revert-CMake-Add-libpcap-imported-library-targ.patch
@@ -0,0 +1,104 @@
+From 19b407fd65a11d3aa7bc70ac95d7b6f130914866 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 11 Aug 2019 12:10:34 +0200
+Subject: [PATCH] CMake: revert "CMake: Add libpcap imported library target"
+
+${PCAP_LIBRARIES} is added to IMPORTED_LOCATION since
+https://github.com/wireshark/wireshark/commit/4c5d2f5ccf822c07746853b065322c34dc322e8a
+
+However, this breaks static build because cmake considers that
+IMPORTED_LOCATION is a string:
+
+[ 19%] Building C object epan/dissectors/CMakeFiles/dissectors.dir/packet-aim.c.o
+x86_64-linux-gcc.br_real: error: /home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libpcap.a;/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libnl-genl-3.a;/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libnl-3.a: No such file or directory
+make[3]: *** [CMakeFiles/mergecap.dir/build.make:102: run/mergecap] Error 1
+make[3]: Leaving directory '/home/fabrice/buildroot/output/build/wireshark-3.1.0'
+make[2]: *** [CMakeFiles/Makefile2:195: CMakeFiles/mergecap.dir/all] Error 2
+make[2]: *** Waiting for unfinished jobs....
+
+So revert this change to use PCAP_LIBRARIES which is used to save the
+paths of libpcap as well as its static dependencies, IMPORTED_LOCATION
+can't be used for this purpose as cmake considers this variable to be a
+single library path and not a list of library paths
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://code.wireshark.org/review/#/c/35567]
+---
+ CMakeLists.txt               | 2 +-
+ capchild/CMakeLists.txt      | 2 +-
+ caputils/CMakeLists.txt      | 2 +-
+ cmake/modules/FindPCAP.cmake | 8 --------
+ extcap/CMakeLists.txt        | 2 +-
+ 5 files changed, 4 insertions(+), 12 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 07d40e4ba6..cada0434ea 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2633,7 +2633,7 @@ if(BUILD_dumpcap AND PCAP_FOUND)
+ 		wsutil
+ 		caputils
+ 		ui
+-		pcap::pcap
++		${PCAP_LIBRARIES}
+ 		${CAP_LIBRARIES}
+ 		${GLIB2_LIBRARIES}
+ 		${GTHREAD2_LIBRARIES}
+diff --git a/capchild/CMakeLists.txt b/capchild/CMakeLists.txt
+index 5eba74a28d..059c399d39 100644
+--- a/capchild/CMakeLists.txt
++++ b/capchild/CMakeLists.txt
+@@ -29,7 +29,7 @@ add_library(capchild STATIC
+ target_link_libraries(capchild
+ 	PRIVATE
+ 		wsutil
+-		$<$<BOOL:${PCAP_FOUND}>:pcap::pcap>
++		${PCAP_LIBRARIES}
+ )
+ 
+ set_target_properties(capchild PROPERTIES
+diff --git a/caputils/CMakeLists.txt b/caputils/CMakeLists.txt
+index 74c9496834..e4e9beccdc 100644
+--- a/caputils/CMakeLists.txt
++++ b/caputils/CMakeLists.txt
+@@ -50,7 +50,7 @@ add_library(caputils STATIC
+ target_link_libraries(caputils
+ 	PUBLIC
+ 		wsutil
+-		$<$<BOOL:${PCAP_FOUND}>:pcap::pcap>
++		${PCAP_LIBRARIES}
+ 	PRIVATE
+ 		${NL_LIBRARIES}
+ )
+diff --git a/cmake/modules/FindPCAP.cmake b/cmake/modules/FindPCAP.cmake
+index eab41f185c..8bb9b524f7 100644
+--- a/cmake/modules/FindPCAP.cmake
++++ b/cmake/modules/FindPCAP.cmake
+@@ -262,11 +262,3 @@ if(PCAP_FOUND)
+ 
+   cmake_pop_check_state()
+ endif()
+-
+-if(PCAP_FOUND AND NOT TARGET pcap::pcap)
+-  add_library(pcap::pcap UNKNOWN IMPORTED)
+-  set_target_properties(pcap::pcap PROPERTIES
+-    IMPORTED_LOCATION "${PCAP_LIBRARIES}"
+-    INTERFACE_INCLUDE_DIRECTORIES "${PCAP_INCLUDE_DIRS}"
+-  )
+-endif()
+diff --git a/extcap/CMakeLists.txt b/extcap/CMakeLists.txt
+index 03b2b0273e..8802d93678 100644
+--- a/extcap/CMakeLists.txt
++++ b/extcap/CMakeLists.txt
+@@ -93,7 +93,7 @@ if(BUILD_androiddump)
+ 				ui
+ 				${GLIB2_LIBRARIES}
+ 				${WIN_WS2_32_LIBRARY}
+-				$<$<BOOL:${PCAP_FOUND}>:pcap::pcap>
++				${PCAP_LIBRARIES}
+ 			)
+ 		else()
+ 			message(FATAL_ERROR "You are trying to build androiddump with libpcap but do not have it")
+-- 
+2.20.1
+
diff --git a/package/wireshark/0002-FindPCAP-use-pkg-config-to-find-pcap-dependencies.patch b/package/wireshark/0002-FindPCAP-use-pkg-config-to-find-pcap-dependencies.patch
deleted file mode 100644
index d9ac80e982..0000000000
--- a/package/wireshark/0002-FindPCAP-use-pkg-config-to-find-pcap-dependencies.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 1799b24aa397e98f7c894d17b37c087f1ae29d95 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 22 Apr 2019 18:40:25 +0200
-Subject: [PATCH] FindPCAP: use pkg-config to find pcap dependencies
-
-On UNIX, when statically built, pcap can depends on other libraries such
-as -lnl-3. Add a call to pkg-config to find them and append them to
-PCAP_LIBRARIES (and so to CMAKE_REQUIRED_LIBRARIES) otherwise all
-check_function_exists calls will fail
-
-Change-Id: I98361c05553738d015310fae76c17dfc08e131ff
-Ping-Bug: 15713
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-on: https://code.wireshark.org/review/32946
-Reviewed-by: Peter Wu <peter@lekensteyn.nl>
-Petri-Dish: Peter Wu <peter@lekensteyn.nl>
-Tested-by: Petri Dish Buildbot
-Reviewed-by: Guy Harris <guy@alum.mit.edu>
-[Retrieved from:
-https://github.com/wireshark/wireshark/commit/1799b24aa397e98f7c894d17b37c087f1ae29d95]
----
- cmake/modules/FindPCAP.cmake | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/cmake/modules/FindPCAP.cmake b/cmake/modules/FindPCAP.cmake
-index dfd80415f6..6fe2d0f4dc 100644
---- a/cmake/modules/FindPCAP.cmake
-+++ b/cmake/modules/FindPCAP.cmake
-@@ -38,6 +38,16 @@ find_package_handle_standard_args( PCAP DEFAULT_MSG PCAP_LIBRARY PCAP_INCLUDE_DI
- if( PCAP_FOUND )
-   set( PCAP_INCLUDE_DIRS ${PCAP_INCLUDE_DIR} )
-   set( PCAP_LIBRARIES ${PCAP_LIBRARY} )
-+
-+  # Include transitive dependencies for static linking.
-+  # This requires:
-+  #??1) a system with pkg-config installed
-+  # 2) libpcap >= 1.9.0 with its .pc files installed
-+  if( UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a" )
-+    find_package( PkgConfig )
-+    pkg_search_module( PC_LIBPCAP libpcap )
-+    list( APPEND PCAP_LIBRARIES ${PC_LIBPCAP_LIBRARIES} )
-+  endif()
- else()
-   set( PCAP_INCLUDE_DIRS )
-   set( PCAP_LIBRARIES )
diff --git a/package/wireshark/0003-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch b/package/wireshark/0003-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
deleted file mode 100644
index fe2d15ff2b..0000000000
--- a/package/wireshark/0003-FindXml2-use-pkg-config-to-find-libxml2-dependencies.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 580098d875b497e5d5aa36dfad10291668e7d392 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 24 Apr 2019 22:22:29 +0200
-Subject: [PATCH] FindXml2: use pkg-config to find libxml2 dependencies
-
-On UNIX, when statically built, libxml2 can depends on other libraries
-such as lzma. These dependencies are already retrieved through
-pkg-config so append them to LIBXML2_LIBRARIES otherwise static build
-will fail
-
-Change-Id: I362064969488ec53042aa323eadb54fef026d8a5
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-on: https://code.wireshark.org/review/32968
-Petri-Dish: Guy Harris <guy@alum.mit.edu>
-Tested-by: Petri Dish Buildbot
-Reviewed-by: Peter Wu <peter@lekensteyn.nl>
-[Retrieved from:
-https://github.com/wireshark/wireshark/commit/580098d875b497e5d5aa36dfad10291668e7d392]
----
- cmake/modules/FindLibXml2.cmake | 15 +++++++++++----
- 1 file changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/cmake/modules/FindLibXml2.cmake b/cmake/modules/FindLibXml2.cmake
-index 99d70af57d..34121ef01b 100644
---- a/cmake/modules/FindLibXml2.cmake
-+++ b/cmake/modules/FindLibXml2.cmake
-@@ -106,10 +106,17 @@ FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibXml2
- 
- mark_as_advanced(LIBXML2_INCLUDE_DIR LIBXML2_LIBRARY LIBXML2_XMLLINT_EXECUTABLE)
- 
--if(LibXml2_FOUND AND NOT TARGET LibXml2::LibXml2)
--   add_library(LibXml2::LibXml2 UNKNOWN IMPORTED)
--   set_target_properties(LibXml2::LibXml2 PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${LIBXML2_INCLUDE_DIRS}")
--   set_property(TARGET LibXml2::LibXml2 APPEND PROPERTY IMPORTED_LOCATION "${LIBXML2_LIBRARY}")
-+if(LibXml2_FOUND)
-+    # Include transitive dependencies for static linking.
-+    if(UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a")
-+        list(APPEND LIBXML2_LIBRARIES ${PC_LIBXML_LIBRARIES})
-+    endif()
-+
-+    if (NOT TARGET LibXml2::LibXml2)
-+        add_library(LibXml2::LibXml2 UNKNOWN IMPORTED)
-+        set_target_properties(LibXml2::LibXml2 PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${LIBXML2_INCLUDE_DIRS}")
-+        set_property(TARGET LibXml2::LibXml2 APPEND PROPERTY IMPORTED_LOCATION "${LIBXML2_LIBRARY}")
-+    endif()
- endif()
- 
- AddWSWinDLLS(LibXml2 LIBXML2_HINTS "libxml2*" "lzma*")
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 416b334df6..a3ad808b86 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_WIRESHARK
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_SPEEXDSP
 	help
 	  Network traffic sniffer and protocol decoder.
 
diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 403def6460..5635f2525b 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.0.5.txt
-sha1 82883e96ee247d3fcacb0cafa0bed9112824ee3a wireshark-3.0.5.tar.xz
-sha256 c551fce475c49cea317ccbf9d22404bc827dde9cee0ccdf6648bfed3ecd9f820 wireshark-3.0.5.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-3.2.0.txt
+sha1 6c7d9784809fb16b57ca557864f78509aaf4f82a wireshark-3.2.0.tar.xz
+sha256 4cfd33a19a454ff4002243e9d04d6afd64280a109a21ae652a192f2be2b1b66c wireshark-3.2.0.tar.xz
 
 # Locally calculated
 sha256 7cdbed2b697efaa45576a033f1ac0e73cd045644a91c79bbf41d4a7d81dac7bf  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 1be6a4e81c..c365a9feec 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,18 +4,20 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 3.0.5
+WIRESHARK_VERSION = 3.2.0
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
 WIRESHARK_LICENSE_FILES = COPYING
-WIRESHARK_DEPENDENCIES = host-pkgconf host-python3 libgcrypt libpcap libglib2
+WIRESHARK_DEPENDENCIES = host-pkgconf host-python3 libgcrypt libpcap libglib2 \
+	speexdsp
 
 WIRESHARK_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	PATH="$(@D)/bin:$(BR_PATH)"
 
 WIRESHARK_CONF_OPTS = \
+	-DDISABLE_WERROR=ON \
 	-DENABLE_PCAP=ON \
 	-DENABLE_SMI=OFF
 
@@ -47,6 +49,13 @@ else
 WIRESHARK_CONF_OPTS += -DENABLE_BCG729=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+WIRESHARK_CONF_OPTS += -DENABLE_BROTLI=ON
+WIRESHARK_DEPENDENCIES += brotli
+else
+WIRESHARK_CONF_OPTS += -DENABLE_BROTLI=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_C_ARES),y)
 WIRESHARK_CONF_OPTS += -DENABLE_CARES=ON
 WIRESHARK_DEPENDENCIES += c-ares
