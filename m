From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 23:21:49 +0100
Subject: [Buildroot] [git commit] package/openpowerlink: do not override
	CMAKE_SYSTEM_PROCESSOR
Message-ID: <20141210224108.317487FDAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6554801512fda72f21bd807e474a2ad9b9f989af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...a-better-regex-for-cmake-system-processor.patch |   89 ++++++++++++++++++++
 package/openpowerlink/openpowerlink.mk             |   10 --
 2 files changed, 89 insertions(+), 10 deletions(-)

diff --git a/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch b/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
new file mode 100644
index 0000000..6fd1990
--- /dev/null
+++ b/package/openpowerlink/0001-fix-use-a-better-regex-for-cmake-system-processor.patch
@@ -0,0 +1,89 @@
+From 9fd3aef2f9bb7a2b05b6823281bb5c988fa25149 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Mon, 17 Nov 2014 23:27:05 +0100
+Subject: [PATCH 1/2] [FIX] use a better regex for CMAKE_SYSTEM_PROCESSOR
+
+According to CMake doc, CMAKE_SYSTEM_PROCESSOR is set to the
+output of the command "uname -p" (in fact it is the output of "uname
+-m"). This is only true for native compilation.
+
+In the case of cross-compilation, the CMake code does not set anything,
+it just expects the CMAKE_SYSTEM_* variables to be set in the
+toolchain file.
+
+Add a test matching the patern "^i.86$" and keep the old one "x86" for
+compatibility.
+By doing that, factorize this test using "^(i.86|x86(_64)?)$".
+
+Thanks to Samuel Martin [1]
+[1] http://lists.busybox.net/pipermail/buildroot/2014-November/112163.html
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt         | 15 ++++-----------
+ .../X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt  | 15 ++++-----------
+ 2 files changed, 8 insertions(+), 22 deletions(-)
+
+diff --git a/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt b/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
+index 271ecdc..b49ef53 100644
+--- a/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
++++ b/Examples/X86/Linux/gnu/demo_kernel/CMakeLists.txt
+@@ -154,21 +154,14 @@ SET(MODULE_SOURCE_FILES
+     ${POWERLINK_SOURCE_DIR}/ObjDicts/${OBJDICT}/Objdict.c
+ )
+ 
+-IF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
++IF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
+-
+-ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL arm
+-        OR CMAKE_SYSTEM_PROCESSOR STREQUAL armv7l)
++ELSEIF (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "armv7l")
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amiarm.c)
+-
+-ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL i686
+-    OR CMAKE_SYSTEM_PROCESSOR STREQUAL x86_64)
+-    SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
+-
+-ELSE (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
++ELSE (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     MESSAGE(FATAL_ERROR
+             "ami: CMAKE_SYSTEM_PROCESSOR is set to ${CMAKE_SYSTEM_PROCESSOR}. Valid targets are (x86, x86_64, arm, armv7l, i686).")
+-ENDIF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
++ENDIF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+ 
+ SET(MODULE_FILE
+     ${MODULE_NAME}.ko
+diff --git a/Examples/X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt b/Examples/X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt
+index 1b47c76..f534a4d 100644
+--- a/Examples/X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt
++++ b/Examples/X86/Linux/gnu/powerlink_kernel_module/CMakeLists.txt
+@@ -171,21 +171,14 @@ ELSE(CFG_POWERLINK_EDRV STREQUAL "I210")
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/Target/X86/Linux/gnu/generic/TimerHighReskX86.c)
+ ENDIF(CFG_POWERLINK_EDRV STREQUAL "I210")
+ 
+-IF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
++IF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
+-
+-ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL arm
+-        OR CMAKE_SYSTEM_PROCESSOR STREQUAL armv7l)
++ELSEIF (CMAKE_SYSTEM_PROCESSOR STREQUAL "arm" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "armv7l")
+     SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amiarm.c)
+-
+-ELSEIF (   CMAKE_SYSTEM_PROCESSOR STREQUAL i686
+-	OR CMAKE_SYSTEM_PROCESSOR STREQUAL x86_64)
+-    SET(MODULE_SOURCE_FILES ${MODULE_SOURCE_FILES} ${POWERLINK_SOURCE_DIR}/EplStack/amix86.c)
+-
+-ELSE (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
++ELSE (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+     MESSAGE(FATAL_ERROR
+             "ami: CMAKE_SYSTEM_PROCESSOR is set to ${CMAKE_SYSTEM_PROCESSOR}. Valid targets are (x86, x86_64, arm, armv7l, i686).")
+-ENDIF (CMAKE_SYSTEM_PROCESSOR STREQUAL x86)
++ENDIF (CMAKE_SYSTEM_PROCESSOR MATCHES "^(i.86|x86(_64)?)$")
+ 
+ SET(MODULE_FILE
+     ${MODULE_NAME}.ko
+-- 
+1.9.3
+
diff --git a/package/openpowerlink/openpowerlink.mk b/package/openpowerlink/openpowerlink.mk
index dcaf386..37cc90e 100644
--- a/package/openpowerlink/openpowerlink.mk
+++ b/package/openpowerlink/openpowerlink.mk
@@ -11,16 +11,6 @@ OPENPOWERLINK_LICENSE = BSD-2c, GPLv2
 OPENPOWERLINK_LICENSE_FILES = license.txt
 OPENPOWERLINK_INSTALL_STAGING = YES
 
-ifeq ($(BR2_i386),y)
-OPENPOWERLINK_ARCH = x86
-endif
-
-ifeq ($(BR2_x86_64),y)
-OPENPOWERLINK_ARCH = x86_64
-endif
-
-OPENPOWERLINK_CONF_OPTS = -DCMAKE_SYSTEM_PROCESSOR=$(OPENPOWERLINK_ARCH)
-
 # There is no shared lib in openpowerlink,
 # so force static lib to build libpowerlink.a
 OPENPOWERLINK_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
