From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Oct 2011 11:38:32 -0300
Subject: [Buildroot] [PATCH 6/6] lzma: remove deprecated
In-Reply-To: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318343912-5480-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318343912-5480-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in         |    1 -
 package/lzma/Config.in    |   12 ------------
 package/lzma/lzma.mk      |   16 ----------------
 package/lzma/lzmacheck.sh |    9 ---------
 4 files changed, 0 insertions(+), 38 deletions(-)
 delete mode 100644 package/lzma/Config.in
 delete mode 100644 package/lzma/lzma.mk
 delete mode 100755 package/lzma/lzmacheck.sh

diff --git a/package/Config.in b/package/Config.in
index 6b9d750..466ea4d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -12,7 +12,6 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gzip/Config.in"
 endif
 source "package/lzop/Config.in"
-source "package/lzma/Config.in"
 source "package/xz/Config.in"
 endmenu
 
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
deleted file mode 100644
index 2b94dde..0000000
--- a/package/lzma/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_LZMA
-	bool "lzma"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_DEPRECATED
-	help
-	  Lempel Ziv compression method (LZMA) is a compression
-	  algorithm with high compression ratio.
-
-	  http://tukaani.org/lzma/
-
-comment "lzma requires a toolchain with C++ support"
-        depends on !BR2_INSTALL_LIBSTDCPP && BR2_DEPRECATED
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
deleted file mode 100644
index 4614116..0000000
--- a/package/lzma/lzma.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-#############################################################
-#
-# lzma
-#
-#############################################################
-LZMA_VERSION:=4.32.7
-LZMA_SOURCE:=lzma-$(LZMA_VERSION).tar.gz
-LZMA_SITE:=http://tukaani.org/lzma/
-LZMA_INSTALL_STAGING = YES
-LZMA_INSTALL_TARGET = YES
-LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
-
-$(eval $(call AUTOTARGETS))
-$(eval $(call AUTOTARGETS,host))
-
-LZMA=$(HOST_DIR)/usr/bin/lzma
diff --git a/package/lzma/lzmacheck.sh b/package/lzma/lzmacheck.sh
deleted file mode 100755
index bcb0423..0000000
--- a/package/lzma/lzmacheck.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/sh
-
-bin=$(toolchain/dependencies/check-host-lzma.sh)
-if [ "x$bin" = "x" ] ; then
-  echo build-lzma-host-binary
-else
-  echo use-lzma-host-binary
-fi
-
-- 
1.7.3.4
