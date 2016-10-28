From: Mathieu Mirmont <mat@ampyxpower.com>
Date: Fri, 28 Oct 2016 14:31:06 +0200
Subject: [Buildroot] [PATCH 1/1] cminpack: new package
Message-ID: <20161028123106.32072-1-mat@ampyxpower.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mathieu Mirmont <mat@ampyxpower.com>
---
 package/Config.in                                  |  1 +
 package/cminpack/Config.in                         | 12 +++++++
 ...-not-install-to-lib64-on-x86_64-platforms.patch | 28 ++++++++++++++++
 ...tall-headers-cminpack.pc-and-FindCMinpack.patch | 39 ++++++++++++++++++++++
 package/cminpack/cminpack.hash                     |  2 ++
 package/cminpack/cminpack.mk                       |  7 ++++
 6 files changed, 89 insertions(+)
 create mode 100644 package/cminpack/Config.in
 create mode 100644 package/cminpack/cminpack-0001-Do-not-install-to-lib64-on-x86_64-platforms.patch
 create mode 100644 package/cminpack/cminpack-0002-Do-not-install-headers-cminpack.pc-and-FindCMinpack.patch
 create mode 100644 package/cminpack/cminpack.hash
 create mode 100644 package/cminpack/cminpack.mk

diff --git a/package/Config.in b/package/Config.in
index 0f6260b..599f14a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1275,6 +1275,7 @@ menu "Other"
 	source "package/boost/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
+	source "package/cminpack/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
diff --git a/package/cminpack/Config.in b/package/cminpack/Config.in
new file mode 100644
index 0000000..0f20983
--- /dev/null
+++ b/package/cminpack/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_CMINPACK
+       bool "cminpack"
+       depends on BR2_TOOLCHAIN_BUILDROOT_CXX
+       help
+         A C/C++ rewrite of the MINPACK software (originally in
+         FORTRAN) for solving nonlinear equations and nonlinear least
+         squares problems.
+
+	 http://devernay.free.fr/hacks/cminpack/
+
+comment "cminpack needs a toolchain w/ C++"
+	depends on !BR2_TOOLCHAIN_BUILDROOT_CXX
diff --git a/package/cminpack/cminpack-0001-Do-not-install-to-lib64-on-x86_64-platforms.patch b/package/cminpack/cminpack-0001-Do-not-install-to-lib64-on-x86_64-platforms.patch
new file mode 100644
index 0000000..d7d66e2
--- /dev/null
+++ b/package/cminpack/cminpack-0001-Do-not-install-to-lib64-on-x86_64-platforms.patch
@@ -0,0 +1,28 @@
+From 86f361b980f009ec2bdeea6de6972fe5523420e3 Mon Sep 17 00:00:00 2001
+From: Mathieu Mirmont <mat@ampyxpower.com>
+Date: Wed, 24 Jun 2015 11:32:51 +0200
+Subject: [PATCH 1/2] Do not install to lib64 on x86_64 platforms.
+
+---
+ cmake/cminpack_utils.cmake | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/cmake/cminpack_utils.cmake b/cmake/cminpack_utils.cmake
+index e380d5c..a0896d5 100644
+--- a/cmake/cminpack_utils.cmake
++++ b/cmake/cminpack_utils.cmake
+@@ -8,11 +8,6 @@ macro(GET_OS_INFO)
+     if(NOT DEFINED CMINPACK_LIB_INSTALL_DIR)
+     set(CMINPACK_LIB_INSTALL_DIR "lib")
+     if(OS_LINUX)
+-        if(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
+-            set(CMINPACK_LIB_INSTALL_DIR "lib64")
+-        else(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
+-            set(CMINPACK_LIB_INSTALL_DIR "lib")
+-        endif(${CMAKE_SYSTEM_PROCESSOR} STREQUAL "x86_64")
+         message (STATUS "Operating system is Linux")
+     elseif(OS_BSD)
+         message (STATUS "Operating system is BSD")
+-- 
+2.1.4
+
diff --git a/package/cminpack/cminpack-0002-Do-not-install-headers-cminpack.pc-and-FindCMinpack.patch b/package/cminpack/cminpack-0002-Do-not-install-headers-cminpack.pc-and-FindCMinpack.patch
new file mode 100644
index 0000000..c517ed1
--- /dev/null
+++ b/package/cminpack/cminpack-0002-Do-not-install-headers-cminpack.pc-and-FindCMinpack.patch
@@ -0,0 +1,39 @@
+From 2a213a12674c76e70171cf6f0813479613511a07 Mon Sep 17 00:00:00 2001
+From: Mathieu Mirmont <mat@ampyxpower.com>
+Date: Wed, 24 Jun 2015 12:26:22 +0200
+Subject: [PATCH 2/2] Do not install headers, cminpack.pc and
+ FindCMinpack.cmake
+
+---
+ CMakeLists.txt       | 2 --
+ cmake/CMakeLists.txt | 4 ----
+ 2 files changed, 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7cd09bc..f1f5cc0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -62,8 +62,6 @@ install (TARGETS cminpack
+    LIBRARY DESTINATION ${CMINPACK_LIB_INSTALL_DIR} COMPONENT library
+    ARCHIVE DESTINATION ${CMINPACK_LIB_INSTALL_DIR} COMPONENT library
+    RUNTIME DESTINATION ${CMINPACK_LIB_INSTALL_DIR} COMPONENT library)
+-install (FILES ${cminpack_hdrs} DESTINATION ${CMINPACK_INCLUDE_INSTALL_DIR}
+-    COMPONENT cminpack_hdrs)
+ 
+ if (USE_FPIC AND NOT SHARED_LIBS)
+   set_target_properties (cminpack PROPERTIES COMPILE_FLAGS -fPIC)
+diff --git a/cmake/CMakeLists.txt b/cmake/CMakeLists.txt
+index 6ef1033..eee3361 100644
+--- a/cmake/CMakeLists.txt
++++ b/cmake/CMakeLists.txt
+@@ -2,7 +2,3 @@ set(PKG_DESC "CMinPack")
+ set(PKG_EXTERNAL_DEPS "")
+ set(pkg_conf_file ${CMAKE_CURRENT_BINARY_DIR}/cminpack.pc)
+ configure_file(cminpack.pc.in ${pkg_conf_file} @ONLY)
+-install(FILES ${pkg_conf_file}
+-    DESTINATION ${CMINPACK_LIB_INSTALL_DIR}/pkgconfig/ COMPONENT pkgconfig)
+-
+-install(FILES FindCMinpack.cmake DESTINATION ${CMAKE_ROOT}/Modules)
+-- 
+2.1.4
+
diff --git a/package/cminpack/cminpack.hash b/package/cminpack/cminpack.hash
new file mode 100644
index 0000000..23f1bd2
--- /dev/null
+++ b/package/cminpack/cminpack.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	3b517bf7dca68cc9a882883db96dac0a0d37d72aba6dfb0c9c7e78e67af503ca  cminpack-1.3.4.tar.gz
diff --git a/package/cminpack/cminpack.mk b/package/cminpack/cminpack.mk
new file mode 100644
index 0000000..229c5c2
--- /dev/null
+++ b/package/cminpack/cminpack.mk
@@ -0,0 +1,7 @@
+CMINPACK_VERSION = 1.3.4
+CMINPACK_SOURCE = cminpack-$(CMINPACK_VERSION).tar.gz
+CMINPACK_SITE = http://devernay.free.fr/hacks/cminpack
+
+CMINPACK_CONF_OPTS = -DUSE_FPIC=ON -DSHARED_LIBS=ON
+
+$(eval $(cmake-package))
-- 
2.9.3
