From: Guillermo A. Amaral <g@maral.me>
Date: Wed, 10 Jul 2013 22:19:20 -0700
Subject: [Buildroot] [PATCH] Raspberry Pi - WiringPi Library Package
In-Reply-To: <1373519841-6138-1-git-send-email-g@maral.me>
References: <1373519841-6138-1-git-send-email-g@maral.me>
Message-ID: <1373519960-6212-1-git-send-email-g@maral.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Guillermo A. Amaral" <g@maral.me>


Signed-off-by: Guillermo A. Amaral <g@maral.me>
---
 package/Config.in                                 |   1 +
 package/wiringpi/Config.in                        |   8 ++
 package/wiringpi/wiringpi-CLOEXEC-undefined.patch |  29 +++++
 package/wiringpi/wiringpi-cmake-support.patch     | 122 ++++++++++++++++++++++
 package/wiringpi/wiringpi.mk                      |  14 +++
 5 files changed, 174 insertions(+)
 create mode 100644 package/wiringpi/Config.in
 create mode 100644 package/wiringpi/wiringpi-CLOEXEC-undefined.patch
 create mode 100644 package/wiringpi/wiringpi-cmake-support.patch
 create mode 100644 package/wiringpi/wiringpi.mk

diff --git a/package/Config.in b/package/Config.in
index 3186bb7..2824904 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -303,6 +303,7 @@ source "package/usb_modeswitch_data/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
 source "package/wipe/Config.in"
+source "package/wiringpi/Config.in"
 source "package/w_scan/Config.in"
 endmenu
 
diff --git a/package/wiringpi/Config.in b/package/wiringpi/Config.in
new file mode 100644
index 0000000..f368bf7
--- /dev/null
+++ b/package/wiringpi/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_WIRINGPI
+	bool "wiringpi"
+	depends on BR2_arm
+	help
+	  GPIO Interface library for the Raspberry Pi.
+
+	  http://wiringpi.com/
+
diff --git a/package/wiringpi/wiringpi-CLOEXEC-undefined.patch b/package/wiringpi/wiringpi-CLOEXEC-undefined.patch
new file mode 100644
index 0000000..ca0ed99
--- /dev/null
+++ b/package/wiringpi/wiringpi-CLOEXEC-undefined.patch
@@ -0,0 +1,29 @@
+From 728b2634cbf661e5303b1e8cb791b909ad4e907c Mon Sep 17 00:00:00 2001
+From: "Guillermo A. Amaral" <g@maral.me>
+Date: Wed, 10 Jul 2013 22:05:12 -0700
+Subject: [PATCH] Declare O_CLOEXEC on systems with an older kernel and/or
+ glibc.
+
+Signed-off-by: Guillermo A. Amaral <g@maral.me>
+---
+ wiringPi/wiringPi.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/wiringPi/wiringPi.c b/wiringPi/wiringPi.c
+index ba61d9f..2ee23b9 100644
+--- a/wiringPi/wiringPi.c
++++ b/wiringPi/wiringPi.c
+@@ -77,6 +77,10 @@
+ #define	FALSE	(1==2)
+ #endif
+ 
++#ifndef O_CLOEXEC
++#define O_CLOEXEC 0
++#endif
++
+ // Environment Variables
+ 
+ #define	ENV_DEBUG	"WIRINGPI_DEBUG"
+-- 
+1.8.1.5
+
diff --git a/package/wiringpi/wiringpi-cmake-support.patch b/package/wiringpi/wiringpi-cmake-support.patch
new file mode 100644
index 0000000..05ccd72
--- /dev/null
+++ b/package/wiringpi/wiringpi-cmake-support.patch
@@ -0,0 +1,122 @@
+From 8feae03a9b77f4a4504d00423d70d318ee08296a Mon Sep 17 00:00:00 2001
+From: "Guillermo A. Amaral" <g@maral.me>
+Date: Wed, 10 Jul 2013 22:02:44 -0700
+Subject: [PATCH] CMake support for WiringPi
+
+
+Signed-off-by: Guillermo A. Amaral <g@maral.me>
+---
+ CMakeLists.txt          |  9 +++++++++
+ devLib/CMakeLists.txt   | 27 +++++++++++++++++++++++++++
+ gpio/CMakeLists.txt     | 20 ++++++++++++++++++++
+ wiringPi/CMakeLists.txt | 21 +++++++++++++++++++++
+ 4 files changed, 77 insertions(+)
+ create mode 100644 CMakeLists.txt
+ create mode 100644 devLib/CMakeLists.txt
+ create mode 100644 gpio/CMakeLists.txt
+ create mode 100644 wiringPi/CMakeLists.txt
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+new file mode 100644
+index 0000000..324ccff
+--- /dev/null
++++ b/CMakeLists.txt
+@@ -0,0 +1,9 @@
++cmake_minimum_required(VERSION 2.8)
++
++project(wiringPi)
++
++set(BUILD_SHARED_LIBS ON CACHE BOOL "Build shared objects")
++
++add_subdirectory(wiringPi)
++add_subdirectory(devLib)
++add_subdirectory(gpio)
+diff --git a/devLib/CMakeLists.txt b/devLib/CMakeLists.txt
+new file mode 100644
+index 0000000..6a7199d
+--- /dev/null
++++ b/devLib/CMakeLists.txt
+@@ -0,0 +1,27 @@
++set(CMAKE_INCLUDE_CURRENT_DIR ON)
++
++set(devLib_SOVERSION "2.0")
++set(devLib_CFLAGS "-Wformat=2 -Winline")
++
++file(GLOB devLib_SRCS *.c)
++file(GLOB devLib_HDRS *.h)
++list(REMOVE_ITEM devLib_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/piFaceOld.c)
++
++find_library(PTHREAD_LIBRARY pthread)
++
++include_directories("../wiringPi")
++
++add_library(wiringPiDev ${devLib_SRCS})
++target_link_libraries(wiringPiDev ${PTHREAD_LIBRARY})
++set_target_properties(wiringPiDev PROPERTIES COMPILE_FLAGS ${devLib_CFLAGS})
++set_target_properties(wiringPiDev PROPERTIES SOVERSION ${devLib_SOVERSION})
++
++install(TARGETS wiringPiDev
++        LIBRARY DESTINATION lib COMPONENT target
++        ARCHIVE DESTINATION lib COMPONENT staging
++)
++
++install(FILES ${devLib_HDRS}
++        DESTINATION include/wiringPi COMPONENT staging
++)
++
+diff --git a/gpio/CMakeLists.txt b/gpio/CMakeLists.txt
+new file mode 100644
+index 0000000..a39e511
+--- /dev/null
++++ b/gpio/CMakeLists.txt
+@@ -0,0 +1,20 @@
++set(CMAKE_INCLUDE_CURRENT_DIR ON)
++
++set(gpio_CFLAGS "-Wformat=2 -Winline")
++
++file(GLOB gpio_SRCS *.c)
++
++include_directories("../wiringPi")
++include_directories("../devLib")
++
++find_library(M_LIBRARY m)
++find_library(PTHREAD_LIBRARY pthread)
++
++add_executable(gpio ${gpio_SRCS})
++target_link_libraries(gpio ${M_LIBRARY} ${PTHREAD_LIBRARY} wiringPi wiringPiDev)
++set_target_properties(gpio PROPERTIES COMPILE_FLAGS ${gpio_CFLAGS})
++
++install(TARGETS gpio
++        RUNTIME DESTINATION bin COMPONENT target
++)
++
+diff --git a/wiringPi/CMakeLists.txt b/wiringPi/CMakeLists.txt
+new file mode 100644
+index 0000000..e54eaf6
+--- /dev/null
++++ b/wiringPi/CMakeLists.txt
+@@ -0,0 +1,21 @@
++set(CMAKE_INCLUDE_CURRENT_DIR ON)
++
++set(wiringPi_SOVERSION "2.0")
++set(wiringPi_CFLAGS "-Wformat=2 -Winline")
++
++file(GLOB wiringPi_SRCS *.c)
++file(GLOB wiringPi_HDRS *.h)
++
++add_library(wiringPi ${wiringPi_SRCS})
++set_target_properties(wiringPi PROPERTIES COMPILE_FLAGS ${wiringPi_CFLAGS})
++set_target_properties(wiringPi PROPERTIES SOVERSION ${wiringPi_SOVERSION})
++
++install(TARGETS wiringPi
++        LIBRARY DESTINATION lib COMPONENT target
++        ARCHIVE DESTINATION lib COMPONENT staging
++)
++
++install(FILES ${wiringPi_HDRS}
++        DESTINATION include/wiringPi COMPONENT staging
++)
++
+-- 
+1.8.1.5
+
diff --git a/package/wiringpi/wiringpi.mk b/package/wiringpi/wiringpi.mk
new file mode 100644
index 0000000..4341f49
--- /dev/null
+++ b/package/wiringpi/wiringpi.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# wiringpi
+#
+#############################################################
+
+WIRINGPI_VERSION = 02a3bd8d8f2ae5c873e63875a8faef5b627f9db6
+WIRINGPI_SITE = git://git.drogon.net/wiringPi
+WIRINGPI_LICENSE = LGPLv3+
+WIRINGPI_LICENSE_FILES = COPYING.LESSER
+WIRINGPI_INSTALL_STAGING = YES
+WIRINGPI_CONF_OPT = -DCMAKE_BUILD_TYPE=Release
+
+$(eval $(cmake-package))
-- 
1.8.1.5
