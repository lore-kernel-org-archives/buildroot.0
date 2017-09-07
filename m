From: Bradford Barr <bradford@density.io>
Date: Thu,  7 Sep 2017 11:51:08 -0400
Subject: [Buildroot] [PATCH 1/1] msgpack: bump to version 2.1.5
Message-ID: <20170907155108.3449-1-bradford@density.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: bradford barr <bradford@density.io>

Signed-off-by: bradford barr <bradford@density.io>
---
 package/msgpack/Config.in    | 12 ++++++++++++
 package/msgpack/msgpack.hash |  2 +-
 package/msgpack/msgpack.mk   | 16 ++++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/package/msgpack/Config.in b/package/msgpack/Config.in
index b8e8213..e0626b2 100644
--- a/package/msgpack/Config.in
+++ b/package/msgpack/Config.in
@@ -13,3 +13,15 @@ config BR2_PACKAGE_MSGPACK
 comment "msgpack needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+
+if BR2_PACKAGE_MSGPACK
+
+config BR2_PACKAGE_MSGPACK_HEADER_ONLY
+	bool "header only"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  MessagePack can be installed as a header only library.
+
+	  https://github.com/msgpack/msgpack-c#c-header-only-library
+
+endif
diff --git a/package/msgpack/msgpack.hash b/package/msgpack/msgpack.hash
index 8cd8cb6..173717d 100644
--- a/package/msgpack/msgpack.hash
+++ b/package/msgpack/msgpack.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  97a371ef950c89f48e8dba6abeccab07f1887e9ba6dab921de0f985c7d5075fe  msgpack-0.5.4.tar.gz
+sha256  9c87f80fc651b900772deaef0ab154b63160c74d292529b5be6d06d6485d4640	msgpack-2.1.5.tar.gz
diff --git a/package/msgpack/msgpack.mk b/package/msgpack/msgpack.mk
index 9e23948..0d6217d 100644
--- a/package/msgpack/msgpack.mk
+++ b/package/msgpack/msgpack.mk
@@ -4,9 +4,17 @@
 #
 ################################################################################
 
-MSGPACK_VERSION = 0.5.4
-MSGPACK_SITE = http://downloads.sourceforge.net/project/msgpack/msgpack/cpp
-MSGPACK_LICENSE = Apache-2.0
+MSGPACK_VERSION = 2.1.5
+MSGPACK_SITE = $(call github,msgpack,msgpack-c,cpp-$(MSGPACK_VERSION))
+MSGPACK_LICENSE = BSL-1.0
 MSGPACK_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+MSGPACK_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_MSGPACK_HEADER_ONLY),y)
+MSGPACK_INSTALL_TARGET = NO
+else
+MSGPACK_INSTALL_TARGET = YES
+endif
+
+$(eval $(cmake-package))
-- 
2.9.3
