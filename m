From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Date: Wed, 29 Mar 2017 12:14:05 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/synergy: bump to version 1.8.5
Message-ID: <1490782445-12144-1-git-send-email-pieterjan.camerlynck@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project moved from SourceForge to GitHub.

The buildsystem changed from autotools to CMake.

Removed patches:
- 0001-includes.patch
    Not needed anymore, was fixed upstream.
- 0002-remove-werror.patch
    Autotools patch, no longer applicable.
- 0003-Fix-build-with-gcc-6.patch
    This patch was applied upstream:
    https://github.com/symless/synergy/commit/3d963bfbe7897d0a33ad477c06a6341c7708780d

Add patch to disable building of tests and allow building without gtest.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
Changes v2 -> v3:
 - improve commit log (Baruch Siach)
Changes v1 -> v2:
 - drop gtest dependency, updated patch (Thomas Petazzoni)
 - use full path in install (Thomas Petazzoni)
---
 DEVELOPERS                                         |   1 +
 ...1-allow-building-of-synergy-without-tests.patch |  86 +++++++++++
 package/synergy/0001-includes.patch                | 167 ---------------------
 package/synergy/0002-remove-werror.patch           |  16 --
 package/synergy/0003-Fix-build-with-gcc-6.patch    |  86 -----------
 package/synergy/Config.in                          |   5 +-
 package/synergy/synergy.hash                       |   2 +-
 package/synergy/synergy.mk                         |  37 +++--
 8 files changed, 118 insertions(+), 282 deletions(-)
 create mode 100644 package/synergy/0001-allow-building-of-synergy-without-tests.patch
 delete mode 100644 package/synergy/0001-includes.patch
 delete mode 100644 package/synergy/0002-remove-werror.patch
 delete mode 100644 package/synergy/0003-Fix-build-with-gcc-6.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 215a3b4..d89772a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1270,6 +1270,7 @@ F:	package/libvips/
 N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
+F:	package/synergy/
 
 N:	Pranit Sirsat <Pranit.Sirsat@imgtec.com>
 F:	package/paho-mqtt-c/
diff --git a/package/synergy/0001-allow-building-of-synergy-without-tests.patch b/package/synergy/0001-allow-building-of-synergy-without-tests.patch
new file mode 100644
index 0000000..ceab3b5
--- /dev/null
+++ b/package/synergy/0001-allow-building-of-synergy-without-tests.patch
@@ -0,0 +1,86 @@
+From cb6b00947ea125c3246654bb3dd3986b64e974d4 Mon Sep 17 00:00:00 2001
+From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+Date: Mon, 27 Mar 2017 21:51:59 +0200
+Subject: [PATCH 1/1] allow building of synergy without tests
+
+Upstream status: https://github.com/symless/synergy/pull/5943
+
+Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+---
+ CMakeLists.txt                             | 2 ++
+ src/CMakeLists.txt                         | 2 +-
+ src/lib/synergy/KeyMap.h                   | 4 ++++
+ src/test/unittests/synergy/KeyMapTests.cpp | 2 ++
+ 4 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 94c474e..cceac45 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -39,6 +39,8 @@ endif()
+ # First, declare project (important for prerequisite checks).
+ project(synergy C CXX)
+ 
++option(BUILD_TESTS "Override building of tests" ON)
++
+ # put binaries in a different dir to make them easier to find.
+ set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
+ set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 237ba48..96dadd2 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -50,6 +50,6 @@ add_subdirectory(lib)
+ add_subdirectory(cmd)
+ add_subdirectory(micro)
+ 
+-if (NOT ${CMAKE_SYSTEM_NAME} MATCHES "IRIX")
++if (BUILD_TESTS AND NOT ${CMAKE_SYSTEM_NAME} MATCHES "IRIX")
+ 	add_subdirectory(test)
+ endif()
+diff --git a/src/lib/synergy/KeyMap.h b/src/lib/synergy/KeyMap.h
+index de869e6..51e7e07 100644
+--- a/src/lib/synergy/KeyMap.h
++++ b/src/lib/synergy/KeyMap.h
+@@ -24,7 +24,9 @@
+ #include "common/stdset.h"
+ #include "common/stdvector.h"
+ 
++#ifdef TEST_ENV
+ #include "gtest/gtest_prod.h"
++#endif
+ 
+ namespace synergy {
+ 
+@@ -326,6 +328,7 @@ public:
+ 
+ 	//@}
+ 
++#ifdef TEST_ENV
+ private:
+ 	FRIEND_TEST(KeyMapTests,
+ 				findBestKey_requiredDown_matchExactFirstItem);
+@@ -340,6 +343,7 @@ private:
+ 	FRIEND_TEST(KeyMapTests,
+ 				findBestKey_onlyOneRequiredDown_matchTwoRequiredChangesItem);
+ 	FRIEND_TEST(KeyMapTests, findBestKey_noRequiredDown_cannotMatch);
++#endif
+ 
+ private:
+ 	//! Ways to synthesize a key
+diff --git a/src/test/unittests/synergy/KeyMapTests.cpp b/src/test/unittests/synergy/KeyMapTests.cpp
+index 1a195af..fe2a5e4 100644
+--- a/src/test/unittests/synergy/KeyMapTests.cpp
++++ b/src/test/unittests/synergy/KeyMapTests.cpp
+@@ -15,6 +15,8 @@
+  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
++#define TEST_ENV
++
+ #include "synergy/KeyMap.h"
+ 
+ #include "test/global/gtest.h"
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
diff --git a/package/synergy/0003-Fix-build-with-gcc-6.patch b/package/synergy/0003-Fix-build-with-gcc-6.patch
deleted file mode 100644
index 843078f..0000000
--- a/package/synergy/0003-Fix-build-with-gcc-6.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From b79d478c21ed6af20554ead97da72de845dc3206 Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <peter@korsgaard.com>
-Date: Sat, 25 Feb 2017 21:57:19 +0100
-Subject: [PATCH] Fix build with gcc 6
-
-Gcc 6.x defaults to C++14, and the iostream operator bool behaviour changed
-in C++11.  In previous versions, a somewhat odd operator void* was used to
-return the status of the stream as a pointer.  Since C++11 a more sensible
-operator bool is used to return the stream staus.
-
-For details, see:
-
-http://en.cppreference.com/w/cpp/io/basic_ios/operator_bool
-
-The code in CConfigReadContext assumes the pre-C++11 behaviour and provides
-its own operator void overload to return the status of the embedded
-iostream.  With C++11, iostream no longer provides this overload, breaking
-the build:
-
-CConfig.cpp: In member function 'CConfigReadContext::operator void*() const':
-CConfig.cpp:1851:9: error: cannot convert 'std::istream {aka std::basic_istream<char>}' to 'void*' in return
-  return m_stream;
-
-To fix it, backport part of upstream commit 3d963bfbe7897d0a33ad (possible
-fix for mavericks) which changes the code to simply provide a getStream()
-method which returns a reference to the embedded stream and the calling code
-is changed to use operator bool on the returned stream, making the code
-compatible with both old and new compilers.
-
-This upstream commit is part of the 1.6.0 release, so can be dropped when
-the version is bumped.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- lib/server/CConfig.cpp | 7 +------
- lib/server/CConfig.h   | 2 +-
- 2 files changed, 2 insertions(+), 7 deletions(-)
-
-diff --git a/lib/server/CConfig.cpp b/lib/server/CConfig.cpp
-index a502fe78..d67dde20 100644
---- a/lib/server/CConfig.cpp
-+++ b/lib/server/CConfig.cpp
-@@ -607,7 +607,7 @@ void
- CConfig::read(CConfigReadContext& context)
- {
- 	CConfig tmp;
--	while (context) {
-+	while (context.getStream()) {
- 		tmp.readSection(context);
- 	}
- 	*this = tmp;
-@@ -1846,11 +1846,6 @@ CConfigReadContext::getLineNumber() const
- 	return m_line;
- }
- 
--CConfigReadContext::operator void*() const
--{
--	return m_stream;
--}
--
- bool
- CConfigReadContext::operator!() const
- {
-diff --git a/lib/server/CConfig.h b/lib/server/CConfig.h
-index c0d2faa8..0ee453cb 100644
---- a/lib/server/CConfig.h
-+++ b/lib/server/CConfig.h
-@@ -480,7 +480,6 @@ public:
- 	bool			readLine(CString&);
- 	UInt32			getLineNumber() const;
- 
--	operator void*() const;
- 	bool			operator!() const;
- 
- 	OptionValue		parseBoolean(const CString&) const;
-@@ -502,6 +501,7 @@ public:
- 	IPlatformScreen::CButtonInfo*
- 					parseMouse(const CString& mouse) const;
- 	KeyModifierMask	parseModifier(const CString& modifiers) const;
-+	std::istream&	getStream() const { return m_stream; };
- 
- private:
- 	// not implemented
--- 
-2.11.0
-
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
index 7b52085..82d672b 100644
--- a/package/synergy/synergy.mk
+++ b/package/synergy/synergy.mk
@@ -4,16 +4,31 @@
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
+define SYNERGY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/synergyc $(TARGET_DIR)/usr/bin/synergyc
+	$(INSTALL) -D -m 0755 $(@D)/bin/synergys $(TARGET_DIR)/usr/bin/synergys
+endef
+
+$(eval $(cmake-package))
-- 
2.7.4
