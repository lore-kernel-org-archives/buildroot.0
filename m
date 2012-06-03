From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  3 Jun 2012 18:35:37 +0200
Subject: [Buildroot] [PATCH 1/1] libnfc: make example build optional
Message-ID: <1338741337-12019-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts libnfc to CMAKETARGET and makes example build
optional.

Fixes http://autobuild.buildroot.org/results/a963924b15e185d0144809a98feac52dec0d1cc3

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libnfc/Config.in                           |    5 +++++
 package/libnfc/libnfc-make-examples-optional.patch |   22 ++++++++++++++++++++
 package/libnfc/libnfc.mk                           |   16 ++++++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 package/libnfc/libnfc-make-examples-optional.patch

diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index 42418e0..3d67d58 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -6,3 +6,8 @@ config BR2_PACKAGE_LIBNFC
 	  Public platform independent Near Field Communication (NFC) library.
 
 	  http://www.libnfc.org/
+
+config BR2_PACKAGE_LIBNFC_EXAMPLES
+	bool "build libnfc examples"
+	depends on BR2_PACKAGE_LIBNFC
+	select BR2_PACKAGE_READLINE
diff --git a/package/libnfc/libnfc-make-examples-optional.patch b/package/libnfc/libnfc-make-examples-optional.patch
new file mode 100644
index 0000000..da8bc3f
--- /dev/null
+++ b/package/libnfc/libnfc-make-examples-optional.patch
@@ -0,0 +1,22 @@
+--- libnfc-1.5.1.orig/CMakeLists.txt	2012-06-03 17:57:20.308085744 +0200
++++ libnfc-1.5.1/CMakeLists.txt	2012-06-03 18:13:37.502570332 +0200
+@@ -27,6 +27,7 @@ INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOUR
+ SET(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/modules/")
+ 
+ # Options
++SET(BUILD_EXAMPLES OFF CACHE BOOL "Build examples")
+ SET(LIBNFC_DEBUG_OUTPUT OFF CACHE BOOL "Debug output of communication with the NFC chip")
+ IF(LIBNFC_DEBUG_OUTPUT)
+   ADD_DEFINITIONS(-DDEBUG -g3)
+@@ -101,7 +102,10 @@ ENDIF(LIBUSB_INCLUDE_DIRS)
+ ADD_SUBDIRECTORY(libnfc)
+ ADD_SUBDIRECTORY(include)
+ ADD_SUBDIRECTORY(utils)
+-ADD_SUBDIRECTORY(examples)
++
++IF(BUILD_EXAMPLES)
++  ADD_SUBDIRECTORY(examples)
++ENDIF(BUILD_EXAMPLES)
+ 
+ # Binary Package
+ IF(WIN32)
diff --git a/package/libnfc/libnfc.mk b/package/libnfc/libnfc.mk
index f1028b1..54cc5f9 100644
--- a/package/libnfc/libnfc.mk
+++ b/package/libnfc/libnfc.mk
@@ -11,6 +11,18 @@ LIBNFC_INSTALL_STAGING = YES
 LIBNFC_DEPENDENCIES = host-pkg-config libusb libusb-compat
 
 # N.B. The acr122 driver requires pcsc-lite.
-LIBNFC_CONF_OPT = --with-drivers=arygon,pn53x_usb
+LIBNFC_CONF_OPT += \
+	-DLIBNFC_DRIVER_ACR122=OFF \
+	-DLIBNFC_DRIVER_ARYGON=ON \
+	-DLIBNFC_DRIVER_PN532_UART=OFF \
+	-DLIBNFC_DRIVER_PN532_USB=ON \
+	-DLIBNFC_SERIAL_AUTOPROBE_ENABLED=OFF
 
-$(eval $(call AUTOTARGETS))
+ifeq ($(BR2_PACKAGE_LIBNFC_EXAMPLES),y)
+LIBNFC_CONF_OPT += -DBUILD_EXAMPLES=ON
+LIBNFC_DEPENDENCIES += readline
+else
+LIBNFC_CONF_OPT += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(call CMAKETARGETS))
-- 
1.7.10.3
