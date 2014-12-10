From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 10 Dec 2014 22:24:56 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/openpowerlink: enable dynamic
	build
In-Reply-To: <1418246696-27658-1-git-send-email-romain.naour@openwide.fr>
References: <1418246696-27658-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1418246696-27658-3-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove the install hook, all static libraries are
removed from TARGET_DIR/usr/lib by target-finalize target

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: new patch
---
 ...-fix-user-space-stack-enable-shared-build.patch | 54 ++++++++++++++++++++++
 package/openpowerlink/openpowerlink.mk             | 10 +---
 2 files changed, 55 insertions(+), 9 deletions(-)
 create mode 100644 package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch

diff --git a/package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch b/package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch
new file mode 100644
index 0000000..2345594
--- /dev/null
+++ b/package/openpowerlink/0002-fix-user-space-stack-enable-shared-build.patch
@@ -0,0 +1,54 @@
+From 9c11eef037dc1137ab7a4656e45afde7d1a615c4 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 22 Nov 2014 16:38:01 +0100
+Subject: [PATCH 2/2] [FIX]: user space stack: enable dynamic build
+
+The build fail if BUILD_SHARED_LIBS is set to ON.
+
+Depending on BUILD_SHARED_LIBS, link with STATIC or SHARED.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt b/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
+index 40b7756..27360f2 100644
+--- a/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
++++ b/Examples/X86/Generic/powerlink_user_lib/CMakeLists.txt
+@@ -93,7 +93,13 @@ ENDIF(CFG_STORE_RESTORE)
+ #
+ # Set type of library
+ #
+-IF (WIN32)
++IF (UNIX)
++    IF (BUILD_SHARED_LIBS)
++        SET(LIB_TYPE "SHARED")
++    ELSE (BUILD_SHARED_LIBS)
++        SET(LIB_TYPE "STATIC")
++    ENDIF(BUILD_SHARED_LIBS)
++ELSEIF (WIN32)
+     IF(CFG_X86_WINDOWS_DLL)
+         SET(LIB_TYPE "SHARED")
+     ELSE(CFG_X86_WINDOWS_DLL)
+@@ -313,7 +319,7 @@ ENDIF ()
+ # Define library source code
+ #
+ IF (UNIX)
+-    ADD_LIBRARY(powerlink ${LIB_SOURCES} ${LIB_SOURCES_KERNEL} ${LIB_SOURCES_USER} ${LIB_HEADERS} ${LIB_HEADERS_KERNEL} ${LIB_HEADERS_USER} ${LIB_OBJDICT})
++    ADD_LIBRARY(powerlink ${LIB_TYPE} ${LIB_SOURCES} ${LIB_SOURCES_KERNEL} ${LIB_SOURCES_USER} ${LIB_HEADERS} ${LIB_HEADERS_KERNEL} ${LIB_HEADERS_USER} ${LIB_OBJDICT})
+ 
+     SET_PROPERTY(TARGET powerlink
+                  PROPERTY COMPILE_DEFINITIONS_DEBUG DEBUG;DEF_DEBUG_LVL=${CFG_DEBUG_LVL})
+@@ -330,7 +336,7 @@ ENDIF ()
+ # Installation
+ #
+ IF (UNIX)
+-    INSTALL(TARGETS powerlink ARCHIVE DESTINATION lib)
++    INSTALL(TARGETS powerlink ARCHIVE DESTINATION lib LIBRARY DESTINATION lib COMPONENT library)
+ ELSEIF (WIN32)
+     IF (CFG_X86_WINDOWS_DLL)
+         INSTALL(TARGETS openPOWERLINK RUNTIME DESTINATION bin)
+-- 
+1.9.3
+
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index 37cc90e..31c533e 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -11,20 +11,12 @@ OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
 OPENPOWERLINK_LICENSE_FILES = license.txt
 OPENPOWERLINK_INSTALL_STAGING = YES
 
-# There is no shared lib in openpowerlink,
-# so force static lib to build libpowerlink.a
-OPENPOWERLINK_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
-
-OPENPOWERLINK_CONF_OPTS += -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
+OPENPOWERLINK_CONF_OPTS = -DCFG_DEBUG_LVL=$(call qstrip,$(BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL))
 
 ifeq ($(BR2_PACKAGE_OPENPOWERLINK_LIBPCAP),y)
 #  use the user space stack (libpcap)
 OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=OFF
 OPENPOWERLINK_DEPENDENCIES = libpcap
-define OPENPOWERLINK_REMOVE_LIB
-	rm $(TARGET_DIR)/usr/lib/libpowerlink.a
-endef
-OPENPOWERLINK_POST_INSTALL_TARGET_HOOKS += OPENPOWERLINK_REMOVE_LIB
 else
 # use the kernel stack
 OPENPOWERLINK_CONF_OPTS += -DCFG_KERNEL_STACK=ON \
-- 
1.9.3
