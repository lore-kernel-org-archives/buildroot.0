From: Simon Dawson <spdawson@gmail.com>
Date: Wed,  2 Jul 2014 18:40:20 +0100
Subject: [Buildroot] [PATCH] zyre: remove spurious dependency on filemq
Message-ID: <1404322820-20409-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zyre doesn't actually depend on filemq; it just needs czmq and zeromq

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/zyre/Config.in | 17 +++++++++--------
 package/zyre/zyre.mk   |  2 +-
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index fbfc6f9..86fff35 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -1,15 +1,16 @@
 config BR2_PACKAGE_ZYRE
 	bool "zyre"
-	depends on BR2_INSTALL_LIBSTDCPP # filemq
-	depends on BR2_INET_IPV6 # filemq
-	depends on BR2_LARGEFILE # filemq
-	depends on BR2_USE_WCHAR # filemq
-	depends on BR2_TOOLCHAIN_HAS_THREADS # filemq
-	depends on BR2_USE_MMU # filemq -> czmq
+	depends on BR2_INSTALL_LIBSTDCPP # zeromq
+	depends on BR2_INET_IPV6 # zeromq
+	depends on BR2_LARGEFILE # zeromq
+	depends on BR2_USE_WCHAR # zeromq
+	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	depends on BR2_USE_MMU # czmq
 	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
-	# support, needed by filemq -> czmq
+	# support, needed by czmq
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
-	select BR2_PACKAGE_FILEMQ
+	select BR2_PACKAGE_CZMQ
+	select BR2_PACKAGE_ZEROMQ
 	help
 	  An open-source framework for proximity-based peer-to-peer
 	  applications.
diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 66952aa..77302b1 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -9,7 +9,7 @@ ZYRE_SITE = $(call github,zeromq,zyre,$(ZYRE_VERSION))
 ZYRE_LICENSE = LGPLv3+
 ZYRE_LICENSE_FILES = COPYING COPYING.LESSER
 ZYRE_INSTALL_STAGING = YES
-ZYRE_DEPENDENCIES = filemq
+ZYRE_DEPENDENCIES = czmq zeromq
 ZYRE_AUTORECONF = YES
 
 define ZYRE_CREATE_CONFIG_DIR
-- 
1.9.1
