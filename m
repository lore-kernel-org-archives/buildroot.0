From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 19:11:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: depends on dynamic
 library
Message-ID: <20200103181143.1507204-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable wireshark with static library (and so remove first patch) as
upstream doesn't care/test static builds and I'm tired to spend time on
fixing these issues and upstreaming them.

This will avoid static build failures with brotli and snappy

Fixes:
 - http://autobuild.buildroot.org/results/2387d4590c5dce73d5f6d72bccf253e79f9a73d8
 - http://autobuild.buildroot.org/results/3159c696c6d5b56e22bbb02c89e5aa94bc313755

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ke-Add-libpcap-imported-library-targ.patch | 104 ------------------
 package/wireshark/Config.in                   |  11 +-
 2 files changed, 6 insertions(+), 109 deletions(-)
 delete mode 100644 package/wireshark/0001-CMake-revert-CMake-Add-libpcap-imported-library-targ.patch

diff --git a/package/wireshark/0001-CMake-revert-CMake-Add-libpcap-imported-library-targ.patch b/package/wireshark/0001-CMake-revert-CMake-Add-libpcap-imported-library-targ.patch
deleted file mode 100644
index 20225f2204..0000000000
--- a/package/wireshark/0001-CMake-revert-CMake-Add-libpcap-imported-library-targ.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 19b407fd65a11d3aa7bc70ac95d7b6f130914866 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 11 Aug 2019 12:10:34 +0200
-Subject: [PATCH] CMake: revert "CMake: Add libpcap imported library target"
-
-${PCAP_LIBRARIES} is added to IMPORTED_LOCATION since
-https://github.com/wireshark/wireshark/commit/4c5d2f5ccf822c07746853b065322c34dc322e8a
-
-However, this breaks static build because cmake considers that
-IMPORTED_LOCATION is a string:
-
-[ 19%] Building C object epan/dissectors/CMakeFiles/dissectors.dir/packet-aim.c.o
-x86_64-linux-gcc.br_real: error: /home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libpcap.a;/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libnl-genl-3.a;/home/fabrice/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libnl-3.a: No such file or directory
-make[3]: *** [CMakeFiles/mergecap.dir/build.make:102: run/mergecap] Error 1
-make[3]: Leaving directory '/home/fabrice/buildroot/output/build/wireshark-3.1.0'
-make[2]: *** [CMakeFiles/Makefile2:195: CMakeFiles/mergecap.dir/all] Error 2
-make[2]: *** Waiting for unfinished jobs....
-
-So revert this change to use PCAP_LIBRARIES which is used to save the
-paths of libpcap as well as its static dependencies, IMPORTED_LOCATION
-can't be used for this purpose as cmake considers this variable to be a
-single library path and not a list of library paths
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://code.wireshark.org/review/#/c/35567]
----
- CMakeLists.txt               | 2 +-
- capchild/CMakeLists.txt      | 2 +-
- caputils/CMakeLists.txt      | 2 +-
- cmake/modules/FindPCAP.cmake | 8 --------
- extcap/CMakeLists.txt        | 2 +-
- 5 files changed, 4 insertions(+), 12 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 07d40e4ba6..cada0434ea 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2633,7 +2633,7 @@ if(BUILD_dumpcap AND PCAP_FOUND)
- 		wsutil
- 		caputils
- 		ui
--		pcap::pcap
-+		${PCAP_LIBRARIES}
- 		${CAP_LIBRARIES}
- 		${GLIB2_LIBRARIES}
- 		${GTHREAD2_LIBRARIES}
-diff --git a/capchild/CMakeLists.txt b/capchild/CMakeLists.txt
-index 5eba74a28d..059c399d39 100644
---- a/capchild/CMakeLists.txt
-+++ b/capchild/CMakeLists.txt
-@@ -29,7 +29,7 @@ add_library(capchild STATIC
- target_link_libraries(capchild
- 	PRIVATE
- 		wsutil
--		$<$<BOOL:${PCAP_FOUND}>:pcap::pcap>
-+		${PCAP_LIBRARIES}
- )
- 
- set_target_properties(capchild PROPERTIES
-diff --git a/caputils/CMakeLists.txt b/caputils/CMakeLists.txt
-index 74c9496834..e4e9beccdc 100644
---- a/caputils/CMakeLists.txt
-+++ b/caputils/CMakeLists.txt
-@@ -50,7 +50,7 @@ add_library(caputils STATIC
- target_link_libraries(caputils
- 	PUBLIC
- 		wsutil
--		$<$<BOOL:${PCAP_FOUND}>:pcap::pcap>
-+		${PCAP_LIBRARIES}
- 	PRIVATE
- 		${NL_LIBRARIES}
- )
-diff --git a/cmake/modules/FindPCAP.cmake b/cmake/modules/FindPCAP.cmake
-index eab41f185c..8bb9b524f7 100644
---- a/cmake/modules/FindPCAP.cmake
-+++ b/cmake/modules/FindPCAP.cmake
-@@ -262,11 +262,3 @@ if(PCAP_FOUND)
- 
-   cmake_pop_check_state()
- endif()
--
--if(PCAP_FOUND AND NOT TARGET pcap::pcap)
--  add_library(pcap::pcap UNKNOWN IMPORTED)
--  set_target_properties(pcap::pcap PROPERTIES
--    IMPORTED_LOCATION "${PCAP_LIBRARIES}"
--    INTERFACE_INCLUDE_DIRECTORIES "${PCAP_INCLUDE_DIRS}"
--  )
--endif()
-diff --git a/extcap/CMakeLists.txt b/extcap/CMakeLists.txt
-index 03b2b0273e..8802d93678 100644
---- a/extcap/CMakeLists.txt
-+++ b/extcap/CMakeLists.txt
-@@ -93,7 +93,7 @@ if(BUILD_androiddump)
- 				ui
- 				${GLIB2_LIBRARIES}
- 				${WIN_WS2_32_LIBRARY}
--				$<$<BOOL:${PCAP_FOUND}>:pcap::pcap>
-+				${PCAP_LIBRARIES}
- 			)
- 		else()
- 			message(FATAL_ERROR "You are trying to build androiddump with libpcap but do not have it")
--- 
-2.20.1
-
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index a3ad808b86..382e429a9c 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WIRESHARK
 	bool "wireshark"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt -> libgpg-error
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
@@ -20,7 +21,6 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # qt5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
-	depends on !BR2_STATIC_LIBS # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
@@ -34,13 +34,14 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	help
 	  Enable Qt5 GUI
 
-comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, dynamic library"
+comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 endif # BR2_PACKAGE_WIRESHARK
 
-comment "wireshark needs a toolchain w/ wchar, threads"
+comment "wireshark needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
-- 
2.24.0
