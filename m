From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  1 Jul 2021 19:47:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/exiv2: fix build without SSP
Message-ID: <20210701174719.112866-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build without SSP fails since bump to version 0.27.4 in commit
bcace429426ee91aac56f3dcc33b69e22141d384

This is due to the fact that
https://github.com/Exiv2/exiv2/commit/bbe0b70840cf28b7dd8c0b7e9bb1b741aeda2efd
removed the wrong GCC_ prefix from HAS_FSTACK_PROTECTOR_STRONG variable

Fixes:
 - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...dd-BUILD_WITH_STACK_PROTECTOR-option.patch | 52 +++++++++++++++++++
 package/exiv2/exiv2.mk                        |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch

diff --git a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
new file mode 100644
index 0000000000..aced5ab311
--- /dev/null
+++ b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
@@ -0,0 +1,52 @@
+From 8651c9f823ace70b6609b10aeef0c0740636b570 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 1 Jul 2021 19:31:25 +0200
+Subject: [PATCH] add BUILD_WITH_STACK_PROTECTOR option
+
+Add BUILD_WITH_STACK_PROTECTOR to avoid the following build failure with
+toolchains that don't support stack-protector:
+
+/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/9.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: utils.cpp:(.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag[_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag]+0xd0): undefined reference to `__stack_chk_fail'
+
+Indeed, support for -fstack-protector-strong can't be detected through
+check_cxx_compiler_flag as some toolchains need to link with -lssp to
+enable SSP support
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/Exiv2/exiv2/pull/1756]
+---
+ CMakeLists.txt            | 1 +
+ cmake/compilerFlags.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9fe8b5f9..aabb3dca 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,6 +52,7 @@ mark_as_advanced(
+     EXIV2_TEAM_USE_SANITIZERS
+ )
+ 
++option( BUILD_WITH_STACK_PROTECTOR    "Build with stack protector"                            ON )
+ option( BUILD_WITH_CCACHE             "Use ccache to speed up compilations"                   OFF )
+ option( BUILD_WITH_COVERAGE           "Add compiler flags to generate coverage stats"         OFF )
+ include(cmake/gcovr.cmake REQUIRED)
+diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
+index c8a85c59..20f6ac53 100644
+--- a/cmake/compilerFlags.cmake
++++ b/cmake/compilerFlags.cmake
+@@ -44,7 +44,7 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
+             if(HAS_FCF_PROTECTION)
+                 add_compile_options(-fcf-protection)
+             endif()
+-            if(HAS_FSTACK_PROTECTOR_STRONG)
++            if(BUILD_WITH_STACK_PROTECTOR AND HAS_FSTACK_PROTECTOR_STRONG)
+                 add_compile_options(-fstack-protector-strong)
+             endif()
+         endif()
+-- 
+2.30.2
+
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 52bf03fc63..33222e6381 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -12,7 +12,9 @@ EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
 EXIV2_CPE_ID_VENDOR = exiv2
 
-EXIV2_CONF_OPTS += -DEXIV2_BUILD_SAMPLES=OFF
+EXIV2_CONF_OPTS += \
+	-DBUILD_WITH_STACK_PROTECTOR=OFF \
+	-DEXIV2_BUILD_SAMPLES=OFF
 
 ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
-- 
2.30.2
