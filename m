From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Fri,  2 Aug 2019 21:27:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/cppzmq: bump to version 4.4.1
Message-ID: <1564774042-9857-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../0001-fix-install-without-static-libzmq.patch   | 47 ----------------------
 package/cppzmq/cppzmq.hash                         |  2 +-
 package/cppzmq/cppzmq.mk                           |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/cppzmq/0001-fix-install-without-static-libzmq.patch

diff --git a/package/cppzmq/0001-fix-install-without-static-libzmq.patch b/package/cppzmq/0001-fix-install-without-static-libzmq.patch
deleted file mode 100644
index 15936f3..0000000
--- a/package/cppzmq/0001-fix-install-without-static-libzmq.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From bffb0eda34195339f2af49f2879d9d0b9dee5c28 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 20 Sep 2018 19:37:26 +0200
-Subject: [PATCH] fix install without static libzmq
-
-If libzmq is only available as a shared library and not a static one
-then cmake fails with:
-
--- CMake libzmq package not found, trying again with pkg-config (normal install of zeromq)
--- Found PkgConfig: /home/fabrice/buildroot/output/host/bin/pkg-config (found version "0.28")
-CMake Error at CMakeLists.txt:20 (message):
-  ZeroMQ was not found, neither as a CMake package nor via pkg-config
-
-This is due to the fact that ZeroMQ_FOUND is not set to ON even if
-ZEROMQ_LIBRARY is TRUE:
-
-if(ZeroMQ_LIBRARY AND ZeroMQ_STATIC_LIBRARY)
-    set(ZeroMQ_FOUND ON)
-endif()
-
-So change AND by OR as suggested in
-https://github.com/zeromq/cppzmq/issues/266
-
-Fix #266
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zeromq/cppzmq/pull/267]
----
- libzmq-pkg-config/FindZeroMQ.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libzmq-pkg-config/FindZeroMQ.cmake b/libzmq-pkg-config/FindZeroMQ.cmake
-index 89d8236..1b84c95 100644
---- a/libzmq-pkg-config/FindZeroMQ.cmake
-+++ b/libzmq-pkg-config/FindZeroMQ.cmake
-@@ -8,7 +8,7 @@ find_library(ZeroMQ_LIBRARY NAMES libzmq.so libzmq.dylib libzmq.dll
- find_library(ZeroMQ_STATIC_LIBRARY NAMES libzmq-static.a libzmq.a libzmq.dll.a
-              PATHS ${PC_LIBZMQ_LIBDIR} ${PC_LIBZMQ_LIBRARY_DIRS})
- 
--if(ZeroMQ_LIBRARY AND ZeroMQ_STATIC_LIBRARY)
-+if(ZeroMQ_LIBRARY OR ZeroMQ_STATIC_LIBRARY)
-     set(ZeroMQ_FOUND ON)
- endif()
- 
--- 
-2.17.1
-
diff --git a/package/cppzmq/cppzmq.hash b/package/cppzmq/cppzmq.hash
index 54406ad..58b91b5 100644
--- a/package/cppzmq/cppzmq.hash
+++ b/package/cppzmq/cppzmq.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 27d1f56406ba94ee779e639203218820975cf68174f92fbeae0f645df0fcada4  cppzmq-4.3.0.tar.gz
+sha256 117fc1ca24d98dbe1a60c072cde13be863d429134907797f8e03f654ce679385  cppzmq-4.4.1.tar.gz
 sha256 7e6db90e2e805c72b3daa77849d1cb5f1f92da0e69750c8a4aa1d86d70704748  LICENSE
diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index aab6e71..95c0880 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 4.3.0
+CPPZMQ_VERSION = 4.4.1
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,v$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = host-pkgconf zeromq
-- 
2.7.4
