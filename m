From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 15:32:56 +0200
Subject: [Buildroot] [git commit] package/paho-mqtt-c: bump to version 1.3.4
Message-ID: <20200618133116.00D2F85F7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57053f29b762117004d22e2e45234b3c3cf87c10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a crucial bugfix release that fixes a backward incompatible ABI
change introduced in 1.3.2.

Also drop patches that are now applied upstream.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...MakeLists.txt-fix-build-on-uclibc-or-musl.patch | 45 ---------------------
 ...le-CXX-language-to-support-using-Generate.patch | 46 ----------------------
 package/paho-mqtt-c/paho-mqtt-c.hash               |  2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk                 |  2 +-
 4 files changed, 2 insertions(+), 93 deletions(-)

diff --git a/package/paho-mqtt-c/0001-src-CMakeLists.txt-fix-build-on-uclibc-or-musl.patch b/package/paho-mqtt-c/0001-src-CMakeLists.txt-fix-build-on-uclibc-or-musl.patch
deleted file mode 100644
index 7989f045b9..0000000000
--- a/package/paho-mqtt-c/0001-src-CMakeLists.txt-fix-build-on-uclibc-or-musl.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 517e8659ab566b15cc409490a432e8935b164de8 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 24 Apr 2020 11:55:41 +0200
-Subject: [PATCH] src/CMakeLists.txt: fix build on uclibc or musl
-
-Build of version 1.3.2 with uclibc or musl fails on:
-
-[ 58%] Linking C shared library libpaho-mqtt3c.so
-/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/5.5.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find -lanl
-collect2: error: ld returned 1 exit status
-
-This is due to commit 21ffebcb749fc8bd8578df85550f03f74e571620 which
-added a link to anl which is not available on uclibc or musl.
-
-Fix this by checking if anl is found on the system before using it
-
-Fixes:
- - http://autobuild.buildroot.org/results/4beb96d43180813906578b42875a1c3d4a905ed7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/eclipse/paho.mqtt.c/commit/517e8659ab566b15cc409490a432e8935b164de8]
----
- src/CMakeLists.txt | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index fb367b37..95fd43e7 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -60,7 +60,13 @@ IF (WIN32)
-     SET(LIBS_SYSTEM ws2_32 crypt32 RpcRT4)
- ELSEIF (UNIX)
-     IF(CMAKE_SYSTEM_NAME MATCHES "Linux")
--        SET(LIBS_SYSTEM c dl pthread anl rt)
-+        SET(LIBS_SYSTEM c dl pthread rt)
-+        # anl is only available with glibc so check if it is found before using
-+        # it or build will fail on uclibc or musl
-+        FIND_LIBRARY(LIB_ANL anl)
-+        IF(LIB_ANL)
-+            SET(LIBS_SYSTEM "${LIBS_SYSTEM} ${LIB_ANL}")
-+        ENDIF()
-         ADD_DEFINITIONS(-D_GNU_SOURCE -fvisibility=hidden)
-     ELSEIF (CMAKE_SYSTEM_NAME MATCHES "Android")
-         SET(LIBS_SYSTEM c dl)
diff --git a/package/paho-mqtt-c/0002-Revert-Enable-CXX-language-to-support-using-Generate.patch b/package/paho-mqtt-c/0002-Revert-Enable-CXX-language-to-support-using-Generate.patch
deleted file mode 100644
index ee4c2307ef..0000000000
--- a/package/paho-mqtt-c/0002-Revert-Enable-CXX-language-to-support-using-Generate.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 342b3824d261f552a7be5dac7a242c263d9b9fd4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 1 May 2020 12:41:59 +0200
-Subject: [PATCH] Revert "Enable CXX language to support using
- GenerateExportHeader"
-
-This reverts commit 23d68e8c798d29309a277fb3c869c23f9cac2bbf. Indeed,
-GenerateExportHeader has been removed with commit
-db5a2c216b122c57dc281aea2f3b7afa210dc0fc and ENABLE_LANGUAGE(CXX) will
-raise the following build failure if no C++ compiler is found:
-
-CMake Error at CMakeLists.txt:34 (ENABLE_LANGUAGE):
-  The CMAKE_CXX_COMPILER:
-
-    /home/buildroot/autobuild/instance-1/output-1/host/bin/arm-linux-g++
-
-  is not a full path to an existing compiler tool.
-
-  Tell CMake where to find the compiler by setting either the environment
-  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
-  to the compiler, or to the compiler name if it is in the PATH.
-
-Fixes:
- - http://autobuild.buildroot.org/results/831ecc34b51ee2be82a3c25f5ec94f0dd2103655
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/eclipse/paho.mqtt.c/pull/872]
----
- CMakeLists.txt | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c52a42e..a290730 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -31,7 +31,6 @@ file(READ version.minor PAHO_VERSION_MINOR)
- file(READ version.patch PAHO_VERSION_PATCH)
- SET(CLIENT_VERSION ${PAHO_VERSION_MAJOR}.${PAHO_VERSION_MINOR}.${PAHO_VERSION_PATCH})
- 
--ENABLE_LANGUAGE(CXX)
- INCLUDE(GNUInstallDirs)
- 
- STRING(TIMESTAMP BUILD_TIMESTAMP UTC)
--- 
-2.26.2
-
diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 8f6ca61480..bbfa2da386 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  c426334c2ffc9f7a230e3de5162bdbc1762f8f60ffe27460e553edb74c7e0681  paho-mqtt-c-1.3.2.tar.gz
+sha256  1ae9b657b693254ed0710350df3dcf5232d1f479409a52861b5e5bb5cc3da046  paho-mqtt-c-1.3.4.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  99d3a5c5cc2812f0593a85ec7c1b6dd83e8477b5090c01d9de0d49d49f367a4a  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index c7ecf412cd..aa2a0b026e 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.2
+PAHO_MQTT_C_VERSION = 1.3.4
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
