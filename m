From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  6 Jan 2013 21:56:21 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
Message-ID: <175bbe60c696b921f074714aac68427ae0561b22.1357505417.git.maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introducing a package to build the userland part of the Raspberry,
needed by anyone who would want to build a rootfs for a RaspberryPi.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |    1 +
 package/rpi-userland/Config.in                     |   18 +++++
 ...0002-Test-for-the-existence-of-execinfo-h.patch |   69 ++++++++++++++++++++
 ...make-vmcs.cmake-allow-to-override-VMCS_IN.patch |   26 ++++++++
 package/rpi-userland/rpi-userland.mk               |   20 ++++++
 5 files changed, 134 insertions(+)
 create mode 100644 package/rpi-userland/Config.in
 create mode 100644 package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch
 create mode 100644 package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
 create mode 100644 package/rpi-userland/rpi-userland.mk

diff --git a/package/Config.in b/package/Config.in
index 9b50f4b..17205fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -580,6 +580,7 @@ source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
+source "package/rpi-userland/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/snowball-init/Config.in"
 source "package/sound-theme-borealis/Config.in"
diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
new file mode 100644
index 0000000..646d74e
--- /dev/null
+++ b/package/rpi-userland/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_RPI_USERLAND
+	bool "RaspberryPi userland"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
+	help
+	  Raspberry Pi Userland contains the necessary library to use the
+	  VideoCore driver.
+
+	  Includes source for the ARM side code to interface to: 
+	  EGL, mmal, GLESv2, vcos, openmaxil, vchiq_arm, bcm_host, WFC, OpenVG.
+
+	  https://github.com/raspberrypi/userland/
+
+comment "RaspberryPi userland requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "RaspberryPi userland requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch b/package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch
new file mode 100644
index 0000000..ccc67d9
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-0002-Test-for-the-existence-of-execinfo-h.patch
@@ -0,0 +1,69 @@
+From 93ae1bcd8005216baf7361ba860b53a2cf2e0401 Mon Sep 17 00:00:00 2001
+From: Floris Bos <bos@je-eigen-domein.nl>
+Date: Sun, 25 Nov 2012 19:05:07 +0100
+Subject: [PATCH] Test for the existence of execinfo.h
+
+Previous code assumed that on Linux the execinfo.h functions are always available, which is a glibc extension.
+This change fixes building the library under buildroot, which uses uClibc by default
+---
+ interface/vcos/glibc/vcos_backtrace.c |    7 +++++--
+ makefiles/cmake/arm-linux.cmake       |    4 ++++
+ makefiles/cmake/cmake_config.h.in     |    3 +++
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/interface/vcos/glibc/vcos_backtrace.c b/interface/vcos/glibc/vcos_backtrace.c
+index 474a328..3bb8aa3 100644
+--- a/interface/vcos/glibc/vcos_backtrace.c
++++ b/interface/vcos/glibc/vcos_backtrace.c
+@@ -26,7 +26,10 @@
+ */
+ 
+ #include <interface/vcos/vcos.h>
+-#ifdef __linux__
++#ifdef HAVE_CMAKE_CONFIG
++#include "cmake_config.h"
++#endif
++#ifdef HAVE_EXECINFO_H
+ #include <execinfo.h>
+ #endif
+ #include <stdio.h>
+@@ -35,7 +38,7 @@
+ 
+ void vcos_backtrace_self(void)
+ {
+-#ifdef __linux__
++#ifdef HAVE_EXECINFO_H
+    void *stack[64];
+    int depth = backtrace(stack, sizeof(stack)/sizeof(stack[0]));
+    char **names = backtrace_symbols(stack, depth);
+diff --git a/makefiles/cmake/arm-linux.cmake b/makefiles/cmake/arm-linux.cmake
+index 89d8bbf..6f2114f 100644
+--- a/makefiles/cmake/arm-linux.cmake
++++ b/makefiles/cmake/arm-linux.cmake
+@@ -115,6 +115,10 @@ try_compile(HAVE_MTRACE
+             ${CMAKE_SOURCE_DIR}/makefiles/cmake/srcs/test-mtrace.c
+             OUTPUT_VARIABLE foo)
+ 
++# test for existence of execinfo.h header
++include(CheckIncludeFile)
++check_include_file(execinfo.h HAVE_EXECINFO_H)
++
+ add_definitions(-DHAVE_CMAKE_CONFIG)
+ configure_file (
+     "makefiles/cmake/cmake_config.h.in"
+diff --git a/makefiles/cmake/cmake_config.h.in b/makefiles/cmake/cmake_config.h.in
+index 5f08ad5..080b8e8 100644
+--- a/makefiles/cmake/cmake_config.h.in
++++ b/makefiles/cmake/cmake_config.h.in
+@@ -8,5 +8,8 @@
+ /** Do we have support for GLIBC mtrace() ? */
+ #cmakedefine                    HAVE_MTRACE
+ 
++/** Do we have the execinfo.h include file ? */
++#cmakedefine                    HAVE_EXECINFO_H
++
+ #endif
+ 
+-- 
+1.7.10
+
diff --git a/package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch b/package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
new file mode 100644
index 0000000..e54d29e
--- /dev/null
+++ b/package/rpi-userland/rpi-userland-makefiles-0001-cmake-vmcs.cmake-allow-to-override-VMCS_IN.patch
@@ -0,0 +1,26 @@
+From fec2560cfcb8d3398e4f1ccc3de7923365873676 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 5 Jan 2013 16:04:55 +0100
+Subject: [PATCH] makefiles/cmake/vmcs.cmake: allow to override
+ VMCS_INSTALL_PREFIX
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ makefiles/cmake/vmcs.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/makefiles/cmake/vmcs.cmake b/makefiles/cmake/vmcs.cmake
+index 0f8641b..cc70cca 100644
+--- a/makefiles/cmake/vmcs.cmake
++++ b/makefiles/cmake/vmcs.cmake
+@@ -9,7 +9,7 @@ INCLUDE(CPack)
+ # Where shall we install?
+ if (ANDROID)
+   SET(VMCS_INSTALL_PREFIX "/vendor/brcm/islands" CACHE PATH "Prefix prepended to install directories" FORCE)
+-else()
++elseif(NOT DEFINED VMCS_INSTALL_PREFIX)
+   SET(VMCS_INSTALL_PREFIX "/opt/vc" CACHE PATH "Prefix prepended to install directories" FORCE)
+ endif()
+ 
+-- 
+1.8.1
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
new file mode 100644
index 0000000..ece37d4
--- /dev/null
+++ b/package/rpi-userland/rpi-userland.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# rpi-userland
+#
+#############################################################
+
+RPI_USERLAND_VERSION = 9852ce28826889e50c4d6786b942f51bccccac54
+RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
+RPI_USERLAND_LICENSE = BSD-3c
+RPI_USERLAND_LICENSE_FILE = LICENCE
+RPI_USERLAND_INSTALL_STAGING = YES
+RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
+
+define RPI_USERLAND_POST_TARGET_CLEANUP
+    rm -Rf $(TARGET_DIR)/usr/src
+endef
+
+RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
+
+$(eval $(cmake-package))
-- 
1.7.10.4
