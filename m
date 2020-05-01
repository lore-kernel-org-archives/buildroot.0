From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 May 2020 12:50:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: fix build without C++
Message-ID: <20200501105024.2170906-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/831ecc34b51ee2be82a3c25f5ec94f0dd2103655

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...X-language-to-support-using-Generate.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/paho-mqtt-c/0002-Revert-Enable-CXX-language-to-support-using-Generate.patch

diff --git a/package/paho-mqtt-c/0002-Revert-Enable-CXX-language-to-support-using-Generate.patch b/package/paho-mqtt-c/0002-Revert-Enable-CXX-language-to-support-using-Generate.patch
new file mode 100644
index 0000000000..ee4c2307ef
--- /dev/null
+++ b/package/paho-mqtt-c/0002-Revert-Enable-CXX-language-to-support-using-Generate.patch
@@ -0,0 +1,46 @@
+From 342b3824d261f552a7be5dac7a242c263d9b9fd4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 1 May 2020 12:41:59 +0200
+Subject: [PATCH] Revert "Enable CXX language to support using
+ GenerateExportHeader"
+
+This reverts commit 23d68e8c798d29309a277fb3c869c23f9cac2bbf. Indeed,
+GenerateExportHeader has been removed with commit
+db5a2c216b122c57dc281aea2f3b7afa210dc0fc and ENABLE_LANGUAGE(CXX) will
+raise the following build failure if no C++ compiler is found:
+
+CMake Error at CMakeLists.txt:34 (ENABLE_LANGUAGE):
+  The CMAKE_CXX_COMPILER:
+
+    /home/buildroot/autobuild/instance-1/output-1/host/bin/arm-linux-g++
+
+  is not a full path to an existing compiler tool.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/831ecc34b51ee2be82a3c25f5ec94f0dd2103655
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/eclipse/paho.mqtt.c/pull/872]
+---
+ CMakeLists.txt | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c52a42e..a290730 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -31,7 +31,6 @@ file(READ version.minor PAHO_VERSION_MINOR)
+ file(READ version.patch PAHO_VERSION_PATCH)
+ SET(CLIENT_VERSION ${PAHO_VERSION_MAJOR}.${PAHO_VERSION_MINOR}.${PAHO_VERSION_PATCH})
+ 
+-ENABLE_LANGUAGE(CXX)
+ INCLUDE(GNUInstallDirs)
+ 
+ STRING(TIMESTAMP BUILD_TIMESTAMP UTC)
+-- 
+2.26.2
+
-- 
2.26.2
