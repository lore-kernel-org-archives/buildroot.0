From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 21 Sep 2018 00:03:19 +0200
Subject: [Buildroot] [PATCH 1/1] cppzmq: bump to version v4.3.0
Message-ID: <20180920220319.4866-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- move to cmake-infrastructure
- add patch to fix install without static libzmq
- add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-fix-install-without-static-libzmq.patch | 47 +++++++++++++++++++
 package/cppzmq/cppzmq.hash                    |  3 +-
 package/cppzmq/cppzmq.mk                      | 11 ++---
 3 files changed, 53 insertions(+), 8 deletions(-)
 create mode 100644 package/cppzmq/0001-fix-install-without-static-libzmq.patch

diff --git a/package/cppzmq/0001-fix-install-without-static-libzmq.patch b/package/cppzmq/0001-fix-install-without-static-libzmq.patch
new file mode 100644
index 0000000000..15936f3f8f
--- /dev/null
+++ b/package/cppzmq/0001-fix-install-without-static-libzmq.patch
@@ -0,0 +1,47 @@
+From bffb0eda34195339f2af49f2879d9d0b9dee5c28 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 20 Sep 2018 19:37:26 +0200
+Subject: [PATCH] fix install without static libzmq
+
+If libzmq is only available as a shared library and not a static one
+then cmake fails with:
+
+-- CMake libzmq package not found, trying again with pkg-config (normal install of zeromq)
+-- Found PkgConfig: /home/fabrice/buildroot/output/host/bin/pkg-config (found version "0.28")
+CMake Error at CMakeLists.txt:20 (message):
+  ZeroMQ was not found, neither as a CMake package nor via pkg-config
+
+This is due to the fact that ZeroMQ_FOUND is not set to ON even if
+ZEROMQ_LIBRARY is TRUE:
+
+if(ZeroMQ_LIBRARY AND ZeroMQ_STATIC_LIBRARY)
+    set(ZeroMQ_FOUND ON)
+endif()
+
+So change AND by OR as suggested in
+https://github.com/zeromq/cppzmq/issues/266
+
+Fix #266
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zeromq/cppzmq/pull/267]
+---
+ libzmq-pkg-config/FindZeroMQ.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libzmq-pkg-config/FindZeroMQ.cmake b/libzmq-pkg-config/FindZeroMQ.cmake
+index 89d8236..1b84c95 100644
+--- a/libzmq-pkg-config/FindZeroMQ.cmake
++++ b/libzmq-pkg-config/FindZeroMQ.cmake
+@@ -8,7 +8,7 @@ find_library(ZeroMQ_LIBRARY NAMES libzmq.so libzmq.dylib libzmq.dll
+ find_library(ZeroMQ_STATIC_LIBRARY NAMES libzmq-static.a libzmq.a libzmq.dll.a
+              PATHS ${PC_LIBZMQ_LIBDIR} ${PC_LIBZMQ_LIBRARY_DIRS})
+ 
+-if(ZeroMQ_LIBRARY AND ZeroMQ_STATIC_LIBRARY)
++if(ZeroMQ_LIBRARY OR ZeroMQ_STATIC_LIBRARY)
+     set(ZeroMQ_FOUND ON)
+ endif()
+ 
+-- 
+2.17.1
+
diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 792fb17b2f..52308d1ea6 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 812b47f76c609e194b2607a186ff0d1b03b6a0c8ea13b20faa47570ddf38ef2c  cppzmq-68a7b09cfce01c4c279fba2cf91686fcfc566848.tar.gz
+sha256 27d1f56406ba94ee779e639203218820975cf68174f92fbeae0f645df0fcada4  cppzmq-v4.3.0.tar.gz
+sha256 7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 113b9a070e..d23366e1d3 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 68a7b09cfce01c4c279fba2cf91686fcfc566848
+CPPZMQ_VERSION = v4.3.0
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
-CPPZMQ_DEPENDENCIES = zeromq
+CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
 CPPZMQ_LICENSE = MIT
 CPPZMQ_LICENSE_FILES = LICENSE
+CPPZMQ_CONF_OPTS = -DCPPZMQ_BUILD_TESTS=OFF
 
-define CPPZMQ_INSTALL_STAGING_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/zmq.hpp $(STAGING_DIR)/usr/include/zmq.hpp
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.17.1
