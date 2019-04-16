From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 16 Apr 2019 11:41:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: enable back static build
Message-ID: <20190416094106.30125-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-FindGLIB2.cmake-fix-static-build.patch | 39 +++++++++++++++++
 ...ts.txt-disable-rpath-in-static-build.patch | 42 +++++++++++++++++++
 package/wireshark/Config.in                   | 11 +++--
 package/wireshark/wireshark.mk                | 14 ++++++-
 4 files changed, 98 insertions(+), 8 deletions(-)
 create mode 100644 package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
 create mode 100644 package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch

diff --git a/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch b/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
new file mode 100644
index 0000000000..5335fbf901
--- /dev/null
+++ b/package/wireshark/0001-FindGLIB2.cmake-fix-static-build.patch
@@ -0,0 +1,39 @@
+From 388cd212f3f055600a37f550dd79b156193f3ce5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 16 Apr 2019 11:19:13 +0200
+Subject: [PATCH] FindGLIB2.cmake: fix static build
+
+captype, editcap and capinfos needs glib2 and its depedencies such as
+pcre otherwise static build will fail on missing references
+
+Currenttly, FindGLIB2.cmake sets GLIB2_LIBRARIES to GLIB2_LIBRARY then
+it checks for pcre library only when CMAKE_FIND_LIBRARIES_SUFFIXES is
+equal to ".a". When it is equal to ".so;.a", pcre is not added even
+if pkg-config has only found a static library.
+
+To fix this error, update FindGLIB2.cmake to append GLIB_LIBRARY to the
+GLIB2_LIBRARIES. In the UNIX context, GLIB2_LIBRARIES will contain all
+the needed dependencies returned by pkg-config
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://code.wireshark.org/review/#/c/32869/]
+---
+ cmake/modules/FindGLIB2.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/modules/FindGLIB2.cmake b/cmake/modules/FindGLIB2.cmake
+index 2b55b742fe..46ad3c41a6 100644
+--- a/cmake/modules/FindGLIB2.cmake
++++ b/cmake/modules/FindGLIB2.cmake
+@@ -92,7 +92,7 @@ find_package_handle_standard_args( GLIB2
+ )
+ 
+ if( GLIB2_FOUND )
+-	set( GLIB2_LIBRARIES ${GLIB2_LIBRARY} )
++	list( APPEND GLIB2_LIBRARIES ${GLIB2_LIBRARY} )
+ 	# Include transitive dependencies for static linking.
+ 	if(UNIX AND CMAKE_FIND_LIBRARY_SUFFIXES STREQUAL ".a")
+ 		find_library(PCRE_LIBRARY pcre)
+-- 
+2.20.1
+
diff --git a/package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch b/package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch
new file mode 100644
index 0000000000..5fe0e58bf9
--- /dev/null
+++ b/package/wireshark/0002-CMakeLists.txt-disable-rpath-in-static-build.patch
@@ -0,0 +1,42 @@
+From e4cbd1964bcb7e989acd97c4c17508160ec31c5a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 16 Apr 2019 10:54:01 +0200
+Subject: [PATCH] CMakeLists.txt: disable rpath in static build
+
+Trying to set RPATH to a static binary results in a build failure:
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
+To fix this error, do not set RPATH if ENABLE_STATIC is set by the user
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: will be sent after first patch is merged]
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 95822cd0a6..38ba2382bb 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -185,7 +185,7 @@ set(PROJECT_INSTALL_INCLUDEDIR "${CMAKE_INSTALL_INCLUDEDIR}/${PROJECT_NAME}")
+ set(LIBRARY_INSTALL_RPATH "")
+ set(EXECUTABLE_INSTALL_RPATH "")
+ set(EXTCAP_INSTALL_RPATH "")
+-if(NOT (WIN32 OR APPLE))
++if(NOT (WIN32 OR APPLE OR ENABLE_STATIC))
+ 	# Try to set a RPATH for installed binaries if the library directory is
+ 	# not already included in the default search list.
+ 	list(FIND CMAKE_C_IMPLICIT_LINK_DIRECTORIES "${CMAKE_INSTALL_FULL_LIBDIR}" IS_SYSTEM_DIR)
+-- 
+2.20.1
+
diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index f3c6cfabcd..0a94a00c09 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_WIRESHARK
 	depends on BR2_USE_MMU # fork(), glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
@@ -20,6 +19,7 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	default y
 	depends on BR2_INSTALL_LIBSTDCPP # qt5
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # qt5
+	depends on !BR2_STATIC_LIBS # qt5
 	depends on BR2_PACKAGE_HAS_UDEV # qt5 input
 	select BR2_PACKAGE_QT5
 	select BR2_PACKAGE_QT5BASE
@@ -33,14 +33,13 @@ config BR2_PACKAGE_WIRESHARK_GUI
 	help
 	  Enable Qt5 GUI
 
-comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL"
+comment "Qt5 GUI needs a udev /dev management and a toolchain w/ C++, NPTL, dynamic library"
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 
 endif # BR2_PACKAGE_WIRESHARK
 
-comment "wireshark needs a toolchain w/ wchar, threads, dynamic library"
+comment "wireshark needs a toolchain w/ wchar, threads"
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 13da31d5c3..b15e7a2a84 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -17,8 +17,7 @@ WIRESHARK_MAKE_ENV = \
 
 WIRESHARK_CONF_OPTS = \
 	-DENABLE_PCAP=ON \
-	-DENABLE_SMI=OFF \
-	-DENABLE_STATIC=OFF
+	-DENABLE_SMI=OFF
 
 # wireshark needs the host version of lemon during compilation.
 # This binrary is provided by sqlite-src (which is different from
@@ -147,6 +146,17 @@ else
 WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=OFF
 endif
 
+# Disable plugins as some of them (like l16mono) can't be built statically
+ifeq ($(BR2_STATIC_LIBS),y)
+WIRESHARK_CONF_OPTS += \
+	-DENABLE_PLUGINS=OFF \
+	-DENABLE_STATIC=ON
+else
+WIRESHARK_CONF_OPTS += \
+	-DENABLE_PLUGINS=ON \
+	-DENABLE_STATIC=OFF
+endif
+
 define WIRESHARK_REMOVE_DOCS
 	find $(TARGET_DIR)/usr/share/wireshark -name '*.txt' -print0 \
 		-o -name '*.html' -print0 | xargs -0 rm -f
-- 
2.20.1
