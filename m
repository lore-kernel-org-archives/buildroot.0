From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 26 Oct 2019 16:38:44 +0300
Subject: [Buildroot] [PATCH v3 1/1] package/uvw: new package
Message-ID: <20191026133844.10536-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A header-only libuv wrapper in C++.

A patch is added to enable in-tree build, which is
checked and prevented by the package and fails the build.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
v2->v3: select libuv, depend on gcc7, and add comment on libuv.mk
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/libuv/libuv.mk                        |  2 ++
 ...-CMakeLists.txt-allow-in-place-build.patch | 32 +++++++++++++++++++
 package/uvw/Config.in                         | 19 +++++++++++
 package/uvw/uvw.hash                          |  3 ++
 package/uvw/uvw.mk                            | 15 +++++++++
 7 files changed, 73 insertions(+)
 create mode 100644 package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch
 create mode 100644 package/uvw/Config.in
 create mode 100644 package/uvw/uvw.hash
 create mode 100644 package/uvw/uvw.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ec4f50a79e..b9e6881419 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -239,6 +239,7 @@ F:	package/python*
 F:	package/snmpclitools/
 F:	package/spdlog/
 F:	package/uftp/
+F:	package/uvw/
 F:	package/zeromq/
 
 N:	Ash Charles <ashcharles@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index d78b4c444b..901c25fe02 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1805,6 +1805,7 @@ endif
 	source "package/tinycbor/Config.in"
 	source "package/tz/Config.in"
 	source "package/tzdata/Config.in"
+	source "package/uvw/Config.in"
 	source "package/xapian/Config.in"
 endmenu
 
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index d5f1d7dbab..618b25d5f6 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When bumping libuv, check if a new version of uvw is available
+# and bump it too.
 LIBUV_VERSION = 1.33.1
 LIBUV_SITE = $(call github,libuv,libuv,v$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
diff --git a/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch b/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch
new file mode 100644
index 0000000000..01068d0427
--- /dev/null
+++ b/package/uvw/0001-CMakeLists.txt-allow-in-place-build.patch
@@ -0,0 +1,32 @@
+From 1d784a0067b7123971c834c77f4f137acca56ae6 Mon Sep 17 00:00:00 2001
+From: Asaf Kahlon <asafka7@gmail.com>
+Date: Fri, 25 Oct 2019 19:09:14 +0300
+Subject: [PATCH 1/1] CMakeLists.txt: allow in-tree build
+
+Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
+---
+ CMakeLists.txt | 8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9fc5538..4aaabf7 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -4,14 +4,6 @@
+ 
+ cmake_minimum_required(VERSION 3.2)
+ 
+-#
+-# Building in-tree is not allowed (we take care of your craziness).
+-#
+-
+-if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
+-    message(FATAL_ERROR "Prevented in-tree built. Please create a build directory outside of the source code and call cmake from there. Thank you.")
+-endif()
+-
+ #
+ # Project configuration
+ #
+-- 
+2.20.1
+
diff --git a/package/uvw/Config.in b/package/uvw/Config.in
new file mode 100644
index 0000000000..c539693831
--- /dev/null
+++ b/package/uvw/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_UVW
+	bool "uvw"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_USE_MMU # libuv
+	depends on !BR2_STATIC_LIBS # libuv
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	select BR2_PACKAGE_LIBUV
+	help
+	  Header-only, event based, tiny and easy to use
+	  libuv wrapper in modern C++.
+
+	  https://github.com/skypjack/uvw
+
+comment "uvw needs a toolchain w/ NPTL, dynamic library, gcc >= 7"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/uvw/uvw.hash b/package/uvw/uvw.hash
new file mode 100644
index 0000000000..e6129e559d
--- /dev/null
+++ b/package/uvw/uvw.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  266a354f0c64a8e85f29b10f20f4d08a35bc1e8caa7cc94a8afecf9ca43f4442  uvw-2.2.0_libuv-v1.33.tar.gz
+sha256  ea786619b4d1b2ba0a188e923111122dfefea1d01c86e37f9e8c80bdbc3ea400  LICENSE
diff --git a/package/uvw/uvw.mk b/package/uvw/uvw.mk
new file mode 100644
index 0000000000..6b3621e55d
--- /dev/null
+++ b/package/uvw/uvw.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# uvw
+#
+################################################################################
+
+UVW_VERSION = 2.2.0_libuv-v1.33
+UVW_SITE = $(call github,skypjack,uvw,v$(UVW_VERSION))
+UVW_INSTALL_STAGING = YES
+UVW_INSTALL_TARGET = NO
+UVW_DEPENDENCIES = libuv
+UVW_LICENSE = MIT
+UVW_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.20.1
