From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Nov 2014 01:26:26 +0100
Subject: [Buildroot] [PATCH 1/2] package/x265: New package
Message-ID: <1415492787-10993-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in           |    1 +
 package/x265/0001-arm.patch |   71 +++++++++++++++++++++++++++++++++++++++++++
 package/x265/Config.in      |   23 ++++++++++++++
 package/x265/x265.mk        |   45 +++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)
 create mode 100644 package/x265/0001-arm.patch
 create mode 100644 package/x265/Config.in
 create mode 100644 package/x265/x265.mk

diff --git a/package/Config.in b/package/Config.in
index 9a73995..0084f9b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -773,6 +773,7 @@ menu "Multimedia"
 	source "package/live555/Config.in"
 	source "package/mediastreamer/Config.in"
 	source "package/x264/Config.in"
+	source "package/x265/Config.in"
 endmenu
 
 menu "Networking"
diff --git a/package/x265/0001-arm.patch b/package/x265/0001-arm.patch
new file mode 100644
index 0000000..69ae458
--- /dev/null
+++ b/package/x265/0001-arm.patch
@@ -0,0 +1,71 @@
+Fix ARM build
+
+Fetched from https://github.com/archlinuxarm/PKGBUILDs/blob/master/extra/x265/arm.patch
+and adjusted paths so patch applies with -p1.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- a/source/CMakeLists.txt.orig	2014-10-04 17:02:08.482815493 +0200
++++ b/source/CMakeLists.txt	2014-10-04 17:11:52.536865262 +0200
+@@ -46,10 +46,18 @@
+         set(X64 1)
+         add_definitions(-DX86_64=1)
+     endif()
+-elseif(${SYSPROC} STREQUAL "armv6l")
+-    message(STATUS "Detected ARM target processor")
+-    set(ARM 1)
+-    add_definitions(-DX265_ARCH_ARM=1 -DHAVE_ARMV6=1)
++elseif(${SYSPROC} MATCHES "armv5.*")
++    message(STATUS "Detected ARMV5 system processor")
++    set(ARMV5 1)
++    add_definitions(-DX265_ARCH_ARM=1 -DHAVE_ARMV6=0 -DHAVE_NEON=0)
++elseif(${SYSPROC} STREQUAL "armv6l")
++    message(STATUS "Detected ARMV6 system processor")
++    set(ARMV6 1)
++    add_definitions(-DX265_ARCH_ARM=1 -DHAVE_ARMV6=1 -DHAVE_NEON=0)
++elseif(${SYSPROC} STREQUAL "armv7l")
++    message(STATUS "Detected ARMV7 system processor")
++    set(ARMV7 1)
++    add_definitions(-DX265_ARCH_ARM=1 -DHAVE_ARMV6=1 -DHAVE_NEON=0)
+ else()
+     message(STATUS "CMAKE_SYSTEM_PROCESSOR value `${CMAKE_SYSTEM_PROCESSOR}` is unknown")
+     message(STATUS "Please add this value near ${CMAKE_CURRENT_LIST_FILE}:${CMAKE_CURRENT_LIST_LINE}")
+@@ -127,8 +135,8 @@
+     if(X86 AND NOT X64)
+         add_definitions(-march=i686)
+     endif()
+-    if(ARM)
+-        add_definitions(-march=armv6 -mfloat-abi=hard -mfpu=vfp)
++    if(ARMV7)
++        add_definitions(-fPIC)
+     endif()
+     check_cxx_compiler_flag(-Wno-narrowing CC_HAS_NO_NARROWING) 
+     check_cxx_compiler_flag(-ffast-math CC_HAS_FAST_MATH) 
+--- a/source/common/cpu.cpp.orig	2014-10-04 17:13:58.507875996 +0200
++++ b/source/common/cpu.cpp	2014-10-04 17:21:11.170912864 +0200
+@@ -37,7 +37,7 @@
+ #include <machine/cpu.h>
+ #endif
+ 
+-#if X265_ARCH_ARM && !defined(HAVE_NEON)
++#if X265_ARCH_ARM && (!defined(HAVE_NEON) || HAVE_NEON==0)
+ #include <signal.h>
+ #include <setjmp.h>
+ static sigjmp_buf jmpbuf;
+@@ -340,7 +340,6 @@
+     }
+ 
+     canjump = 1;
+-    x265_cpu_neon_test();
+     canjump = 0;
+     signal(SIGILL, oldsig);
+ #endif // if !HAVE_NEON
+@@ -356,7 +355,7 @@
+     // which may result in incorrect detection and the counters stuck enabled.
+     // right now Apple does not seem to support performance counters for this test
+ #ifndef __MACH__
+-    flags |= x265_cpu_fast_neon_mrc_test() ? X265_CPU_FAST_NEON_MRC : 0;
++    //flags |= x265_cpu_fast_neon_mrc_test() ? X265_CPU_FAST_NEON_MRC : 0;
+ #endif
+     // TODO: write dual issue test? currently it's A8 (dual issue) vs. A9 (fast mrc)
+ #endif // if HAVE_ARMV6
diff --git a/package/x265/Config.in b/package/x265/Config.in
new file mode 100644
index 0000000..bf8bd12
--- /dev/null
+++ b/package/x265/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_X265
+	bool "x265"
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  x265 is an open-source project and free application library for encoding
+	  video streams into the H.265/High Efficiency Video Coding (HEVC) format.
+
+	  http://x265.org
+
+if BR2_PACKAGE_X265
+
+config BR2_PACKAGE_X265_CLI
+	bool "CLI"
+	help
+	  Build standalone CLI application
+endif
+
+comment "x265 needs a toolchain w/ C++"
+	depends on BR2_i386 || BR2_x86_64 || BR2_arm
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
new file mode 100644
index 0000000..4cab05b
--- /dev/null
+++ b/package/x265/x265.mk
@@ -0,0 +1,45 @@
+################################################################################
+#
+# x265
+#
+################################################################################
+
+X265_VERSION = 1.4
+X265_SOURCE = $(X265_VERSION).tar.bz2
+X265_SITE = https://bitbucket.org/multicoreware/x265/get
+X265_INSTALL_STAGING = YES
+X265_LICENSE = GPLv2
+X265_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_i386)$(BR2_x86_64),y)
+X265_DEPENDENCIES += host-yasm
+X265_CMAKE_SYSTEM_PROCESSOR = x86
+else
+X265_CONF_OPTS += --disable-asm
+endif
+ifeq ($(BR2_ARM_CPU_ARMV5),y)
+X265_CMAKE_SYSTEM_PROCESSOR = armv5
+endif
+ifeq ($(BR2_ARM_CPU_ARMV6),y)
+X265_CMAKE_SYSTEM_PROCESSOR = armv6l
+endif
+ifeq ($(BR2_ARM_CPU_ARMV7A),y)
+X265_CMAKE_SYSTEM_PROCESSOR = armv7l
+endif
+
+# CMakeLists.txt is stored in $(@D)/source/, not in $(@D)/
+define X265_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(HOST_DIR)/usr/bin/cmake -G "Unix Makefiles" source/ \
+			-DCMAKE_TOOLCHAIN_FILE="$(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake" \
+			-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release) \
+			-DCMAKE_INSTALL_PREFIX="/usr" \
+			-DCMAKE_COLOR_MAKEFILE=OFF \
+		-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON) \
+		-DUSE_CCACHE=$(if $(BR2_CCACHE),ON,OFF) \
+		-DENABLE_CLI=$(if $(BR2_PACKAGE_X265_CLI),ON,OFF) \
+		-DCMAKE_SYSTEM_PROCESSOR=$(X265_CMAKE_SYSTEM_PROCESSOR) \
+	)
+endef
+
+$(eval $(cmake-package))
-- 
1.7.10.4
