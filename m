From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Wed,  7 Dec 2016 19:46:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/synergy: bump to version 1.8.5
Message-ID: <1481136388-11727-1-git-send-email-pieterjan.camerlynck@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 DEVELOPERS                                         |   1 +
 ...-only-build-tests-when-BUILD_TESTS-is-set.patch |  25 +++
 package/synergy/0001-includes.patch                | 167 ---------------------
 package/synergy/0002-remove-werror.patch           |  16 --
 package/synergy/Config.in                          |   5 +-
 package/synergy/synergy.hash                       |   2 +-
 package/synergy/synergy.mk                         |  43 ++++--
 7 files changed, 63 insertions(+), 196 deletions(-)
 create mode 100644 package/synergy/0001-cmake-only-build-tests-when-BUILD_TESTS-is-set.patch
 delete mode 100644 package/synergy/0001-includes.patch
 delete mode 100644 package/synergy/0002-remove-werror.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index e411b42..4eea4b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1210,6 +1210,7 @@ F:	package/libvips/
 N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
+F:	package/synergy/
 
 N:	Pranit Sirsat <Pranit.Sirsat@imgtec.com>
 F:	package/paho-mqtt-c/
diff --git a/package/synergy/0001-cmake-only-build-tests-when-BUILD_TESTS-is-set.patch b/package/synergy/0001-cmake-only-build-tests-when-BUILD_TESTS-is-set.patch
new file mode 100644
index 0000000..9caf8d3
--- /dev/null
+++ b/package/synergy/0001-cmake-only-build-tests-when-BUILD_TESTS-is-set.patch
@@ -0,0 +1,25 @@
+From 2ac678edfefc796884c4366e8ea6db890a3859ca Mon Sep 17 00:00:00 2001
+From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+Date: Wed, 7 Dec 2016 18:46:31 +0100
+Subject: [PATCH] cmake: only build tests when BUILD_TESTS is set
+
+Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+---
+ src/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 237ba48..174a3c3 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -50,6 +50,6 @@ add_subdirectory(lib)
+ add_subdirectory(cmd)
+ add_subdirectory(micro)
+ 
+-if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "IRIX")
++if(BUILD_TESTS AND NOT ${CMAKE_SYSTEM_NAME} MATCHES "IRIX")
+ 	add_subdirectory(test)
+ endif()
+-- 
+2.7.4
+
diff --git a/package/synergy/0001-includes.patch b/package/synergy/0001-includes.patch
deleted file mode 100644
index accaf82..0000000
--- a/package/synergy/0001-includes.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-[PATCH] fix build with modern toolchains
-
-Several files are missing the correct includes for exit/getenvmemcpy/strlen/..
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- lib/arch/CArchDaemonUnix.cpp        |    1 +
- lib/arch/CMultibyte.cpp             |    1 +
- lib/base/CStringUtil.cpp            |    1 +
- lib/client/CClient.cpp              |    3 ++-
- lib/client/CServerProxy.cpp         |    1 +
- lib/net/CTCPSocket.cpp              |    2 +-
- lib/platform/CXWindowsScreen.cpp    |    1 +
- lib/server/CClientProxy1_3.cpp      |    1 +
- lib/server/CServer.cpp              |    1 +
- lib/synergy/CPacketStreamFilter.cpp |    1 +
- lib/synergy/IKeyState.cpp           |    1 +
- lib/synergy/IPrimaryScreen.cpp      |    1 +
- 12 files changed, 13 insertions(+), 2 deletions(-)
-
-Index: synergy-1.3.1/lib/arch/CArchDaemonUnix.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/arch/CArchDaemonUnix.cpp
-+++ synergy-1.3.1/lib/arch/CArchDaemonUnix.cpp
-@@ -19,6 +19,7 @@
- #include <sys/stat.h>
- #include <fcntl.h>
- #include <errno.h>
-+#include <stdlib.h>
- 
- //
- // CArchDaemonUnix
-Index: synergy-1.3.1/lib/arch/CMultibyte.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/arch/CMultibyte.cpp
-+++ synergy-1.3.1/lib/arch/CMultibyte.cpp
-@@ -19,6 +19,7 @@
- #include "CArch.h"
- #include <limits.h>
- #include <string.h>
-+#include <stdlib.h>
- #if HAVE_LOCALE_H
- #	include <locale.h>
- #endif
-Index: synergy-1.3.1/lib/base/CStringUtil.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/base/CStringUtil.cpp
-+++ synergy-1.3.1/lib/base/CStringUtil.cpp
-@@ -19,6 +19,7 @@
- #include <cctype>
- #include <cstdio>
- #include <cstdlib>
-+#include <cstring>
- #include <algorithm>
- 
- //
-Index: synergy-1.3.1/lib/client/CClient.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/client/CClient.cpp
-+++ synergy-1.3.1/lib/client/CClient.cpp
-@@ -26,7 +26,8 @@
- #include "CLog.h"
- #include "IEventQueue.h"
- #include "TMethodEventJob.h"
--
-+#include <string.h>
-+#include <stdlib.h>
- //
- // CClient
- //
-Index: synergy-1.3.1/lib/client/CServerProxy.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/client/CServerProxy.cpp
-+++ synergy-1.3.1/lib/client/CServerProxy.cpp
-@@ -24,6 +24,7 @@
- #include "TMethodEventJob.h"
- #include "XBase.h"
- #include <memory>
-+#include <string.h>
- 
- //
- // CServerProxy
-Index: synergy-1.3.1/lib/net/CTCPSocket.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/net/CTCPSocket.cpp
-+++ synergy-1.3.1/lib/net/CTCPSocket.cpp
-@@ -24,7 +24,7 @@
- #include "CArch.h"
- #include "XArch.h"
- #include <string.h>
--
-+#include <stdlib.h>
- //
- // CTCPSocket
- //
-Index: synergy-1.3.1/lib/platform/CXWindowsScreen.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/platform/CXWindowsScreen.cpp
-+++ synergy-1.3.1/lib/platform/CXWindowsScreen.cpp
-@@ -27,6 +27,7 @@
- #include "IEventQueue.h"
- #include "TMethodEventJob.h"
- #include <cstring>
-+#include <stdlib.h>
- #if X_DISPLAY_MISSING
- #	error X11 is required to build synergy
- #else
-Index: synergy-1.3.1/lib/server/CClientProxy1_3.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/server/CClientProxy1_3.cpp
-+++ synergy-1.3.1/lib/server/CClientProxy1_3.cpp
-@@ -17,6 +17,7 @@
- #include "CLog.h"
- #include "IEventQueue.h"
- #include "TMethodEventJob.h"
-+#include <string.h>
- 
- //
- // CClientProxy1_3
-Index: synergy-1.3.1/lib/server/CServer.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/server/CServer.cpp
-+++ synergy-1.3.1/lib/server/CServer.cpp
-@@ -29,6 +29,7 @@
- #include "TMethodEventJob.h"
- #include "CArch.h"
- #include <string.h>
-+#include <stdlib.h>
- 
- //
- // CServer
-Index: synergy-1.3.1/lib/synergy/CPacketStreamFilter.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/synergy/CPacketStreamFilter.cpp
-+++ synergy-1.3.1/lib/synergy/CPacketStreamFilter.cpp
-@@ -16,6 +16,7 @@
- #include "IEventQueue.h"
- #include "CLock.h"
- #include "TMethodEventJob.h"
-+#include <string.h>
- 
- //
- // CPacketStreamFilter
-Index: synergy-1.3.1/lib/synergy/IKeyState.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/synergy/IKeyState.cpp
-+++ synergy-1.3.1/lib/synergy/IKeyState.cpp
-@@ -14,6 +14,7 @@
- 
- #include "IKeyState.h"
- #include <string.h>
-+#include <stdlib.h>
- 
- //
- // IKeyState
-Index: synergy-1.3.1/lib/synergy/IPrimaryScreen.cpp
-===================================================================
---- synergy-1.3.1.orig/lib/synergy/IPrimaryScreen.cpp
-+++ synergy-1.3.1/lib/synergy/IPrimaryScreen.cpp
-@@ -13,6 +13,7 @@
-  */
- 
- #include "IPrimaryScreen.h"
-+#include <stdlib.h>
- 
- //
- // IPrimaryScreen
diff --git a/package/synergy/0002-remove-werror.patch b/package/synergy/0002-remove-werror.patch
deleted file mode 100644
index 31a8c2b..0000000
--- a/package/synergy/0002-remove-werror.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Remove -Werror from CXXFLAGS
-
-Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
-
-Index: synergy-1.3.1/configure.in
-===================================================================
---- synergy-1.3.1.orig/configure.in
-+++ synergy-1.3.1/configure.in
-@@ -239,7 +239,6 @@ dnl checks for system services
- 
- dnl enable maximum compiler warnings and warnings are errors.
- ACX_CXX_WARNINGS
--ACX_CXX_WARNINGS_ARE_ERRORS
- 
- dnl adjust compiler and linker variables
- CXXFLAGS="$CXXFLAGS $SYNERGY_CXXFLAGS $ARCH_CFLAGS"
diff --git a/package/synergy/Config.in b/package/synergy/Config.in
index 6b64b79..3bb8b8e 100644
--- a/package/synergy/Config.in
+++ b/package/synergy/Config.in
@@ -4,6 +4,9 @@ config BR2_PACKAGE_SYNERGY
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXTST
 	help
 	  Synergy lets you easily share a single mouse and
@@ -11,7 +14,7 @@ config BR2_PACKAGE_SYNERGY
 	  operating systems, each with its own display,
 	  without special hardware.
 
-	  http://synergy2.sourceforge.net/
+	  https://github.com/symless/synergy/
 
 comment "synergy needs a toolchain w/ C++, wchar"
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/synergy/synergy.hash b/package/synergy/synergy.hash
index 2a6950e..bbf196f 100644
--- a/package/synergy/synergy.hash
+++ b/package/synergy/synergy.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  4a15e26456498dda5f3aa7d688a4892e0c50394a2f01685136fbc954bacc9691  synergy-1.3.1.tar.gz
+sha256  d913005e911bb6e5aa459f88fe91b40d59c37ea7207399814e4d450fd8634ec1  synergy-v1.8.5-stable.tar.gz
diff --git a/package/synergy/synergy.mk b/package/synergy/synergy.mk
index 7b52085..9be7016 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -4,16 +4,37 @@
 #
 ################################################################################
 
-SYNERGY_VERSION = 1.3.1
-SYNERGY_SITE = http://downloads.sourceforge.net/project/synergy2/Sources/$(SYNERGY_VERSION)
-SYNERGY_AUTORECONF = YES
-SYNERGY_CONF_OPTS = \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib
-SYNERGY_DEPENDENCIES = \
-	xlib_libXtst \
-	$(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
+SYNERGY_VERSION = v1.8.5-stable
+SYNERGY_SITE = $(call github,symless,synergy,$(SYNERGY_VERSION))
 SYNERGY_LICENSE = GPLv2
-SYNERGY_LICENSE_FILES = COPYING
+SYNERGY_LICENSE_FILES = LICENSE
+SYNERGY_DEPENDENCIES = libcurl openssl xlib_libX11 xlib_libXtst
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT),y)
+SYNERGY_DEPENDENCIES += xlib_libXext
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXI),y)
+SYNERGY_DEPENDENCIES += xlib_libXi
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
+SYNERGY_DEPENDENCIES += xlib_libXinerama
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+SYNERGY_DEPENDENCIES += xlib_libXrandr
+endif
+
+# synergy cannot be built without extracting the included gtest
+define SYNERGY_EXTRACT_GTEST
+	$(UNZIP) $(@D)/ext/gtest-1.6.0.zip -d $(@D)/ext/gtest-1.6.0
+endef
+SYNERGY_POST_EXTRACT_HOOKS += SYNERGY_EXTRACT_GTEST
+
+define SYNERGY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/synergyc $(TARGET_DIR)/usr/bin
+	$(INSTALL) -D -m 0755 $(@D)/bin/synergys $(TARGET_DIR)/usr/bin
+endef
+
+$(eval $(cmake-package))
-- 
2.7.4
