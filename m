From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jun 2020 22:49:26 +0200
Subject: [Buildroot] [git commit] package/ttyd: new package
Message-ID: <20200617205529.906888447F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b74bb5984a38e6671ca2bdc65cae97917b19503d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ttyd is a simple command-line tool for sharing terminal over the web.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 package/ttyd/0001-cmake-fix-build-without-C.patch | 41 +++++++++++++++++++++++
 package/ttyd/Config.in                            | 21 ++++++++++++
 package/ttyd/ttyd.hash                            |  3 ++
 package/ttyd/ttyd.mk                              | 13 +++++++
 6 files changed, 80 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 76a153d695..cbe6bc1856 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -294,6 +294,7 @@ F:	board/stmicroelectronics/stm32mp157a-dk1/
 F:	configs/stm32mp157a_dk1_defconfig
 F:	package/python-esptool/
 F:	package/python-pyaes/
+F:	package/ttyd/
 F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
 
diff --git a/package/Config.in b/package/Config.in
index d32eadab88..1f44fe7ca9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2310,6 +2310,7 @@ comment "Utilities"
 	source "package/time/Config.in"
 	source "package/tini/Config.in"
 	source "package/tmux/Config.in"
+	source "package/ttyd/Config.in"
 	source "package/which/Config.in"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
diff --git a/package/ttyd/0001-cmake-fix-build-without-C.patch b/package/ttyd/0001-cmake-fix-build-without-C.patch
new file mode 100644
index 0000000000..8d5d35ca19
--- /dev/null
+++ b/package/ttyd/0001-cmake-fix-build-without-C.patch
@@ -0,0 +1,41 @@
+From cec921a680576865847d98552ded2a67efd8eb50 Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Mon, 15 Jun 2020 17:32:26 +0200
+Subject: [PATCH] cmake: fix build without C++
+
+Specify that ttyd is a C project to avoid the
+following build failure if a C++ compiler isn't found.
+
+CMake Error at CMakeLists.txt:3 (project):
+  The CMAKE_CXX_COMPILER:
+
+    /home/bartekk/Projects/buildroots/buildroot-dev/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabihf-g++
+
+  is not a full path to an existing compiler tool.
+
+  Tell CMake where to find the compiler by setting either the environment
+  variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
+  to the compiler, or to the compiler name if it is in the PATH.
+
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ Upstream status: https://github.com/tsl0922/ttyd/pull/382
+
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8061f47..efd76d2 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,6 +1,6 @@
+ cmake_minimum_required(VERSION 2.8)
+ 
+-project(ttyd)
++project(ttyd C)
+ set(PROJECT_VERSION "1.6.0")
+ 
+ find_package(Git)
+-- 
+2.27.0
+
diff --git a/package/ttyd/Config.in b/package/ttyd/Config.in
new file mode 100644
index 0000000000..23d188e650
--- /dev/null
+++ b/package/ttyd/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_TTYD
+	bool "ttyd"
+	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv, json-c
+	depends on BR2_USE_MMU # libuv, libwebsockets
+	select BR2_PACKAGE_JSON_C
+	select BR2_PACKAGE_LIBUV
+	select BR2_PACKAGE_LIBWEBSOCKETS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	help
+	  ttyd is a simple command-line tool for sharing terminal
+	  over the web.
+
+	  https://github.com/tsl0922/ttyd
+
+comment "ttyd needs a toolchain w/ NPTL, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
new file mode 100644
index 0000000000..c73af44af3
--- /dev/null
+++ b/package/ttyd/ttyd.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  d14740bc82be0d0760dd0a3c97acbcbde490412a4edc61edabe46d311b068f83  ttyd-1.6.0.tar.gz
+sha256  711762f081c180ade3d09d7b0b7537eaf35eca8d1671e47bc66eaa39376edb12  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
new file mode 100644
index 0000000000..a7e2ee9bb5
--- /dev/null
+++ b/package/ttyd/ttyd.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# ttyd
+#
+################################################################################
+
+TTYD_VERSION = 1.6.0
+TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
+TTYD_LICENSE = MIT
+TTYD_LICENSE_FILES = LICENSE
+TTYD_DEPENDENCIES = json-c libuv libwebsockets openssl zlib
+
+$(eval $(cmake-package))
