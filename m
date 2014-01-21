From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 21 Jan 2014 08:54:12 +0100
Subject: [Buildroot] [PATCH 4 of 5 v3] lzma: remove deprecated target package
In-Reply-To: <patchbomb.1390290848@argentina>
References: <patchbomb.1390290848@argentina>
Message-ID: <495b97b3a4948c4e8e1a.1390290852@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The on-target lzma package has been deprecated for a long time, so remove
it. This does not remove the support for generating lzma-compressed rootfs
images.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: rebase
v2: new patch

 Config.in              |   4 ----
 Config.in.legacy       |   8 ++++++++
 package/Config.in      |   1 -
 package/lzma/Config.in |  13 -------------
 package/lzma/lzma.mk   |   2 --
 5 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/Config.in b/Config.in
--- a/Config.in
+++ b/Config.in
@@ -264,10 +264,6 @@ config BR2_DEPRECATED
 
 if BR2_DEPRECATED
 
-config BR2_DEPRECATED_SINCE_2010_11
-	bool
-	default y
-
 config BR2_DEPRECATED_SINCE_2012_11
 	bool
 	default y
diff --git a/Config.in.legacy b/Config.in.legacy
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -101,6 +101,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2014.02"
 
+config BR2_PACKAGE_LZMA
+	bool "lzma target package has been removed"
+	select BR2_LEGACY
+	help
+	  The 'lzma' target package has been removed since it has been
+	  deprecated for more than four buildroot releases.
+	  Note: generating lzma-compressed rootfs images is still supported.
+
 config BR2_PACKAGE_TTCP
 	bool "ttcp has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -35,7 +35,6 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/gzip/Config.in"
 endif
 source "package/infozip/Config.in"
-source "package/lzma/Config.in"
 source "package/lzop/Config.in"
 source "package/xz/Config.in"
 endmenu
diff --git a/package/lzma/Config.in b/package/lzma/Config.in
deleted file mode 100644
--- a/package/lzma/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_LZMA
-	bool "lzma"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_DEPRECATED_SINCE_2010_11
-	help
-	  Lempel Ziv compression method (LZMA) is a compression
-	  algorithm with high compression ratio.
-
-	  http://tukaani.org/lzma/
-
-comment "lzma needs a toolchain w/ C++"
-	depends on BR2_DEPRECATED_SINCE_2010_11
-	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/lzma/lzma.mk b/package/lzma/lzma.mk
--- a/package/lzma/lzma.mk
+++ b/package/lzma/lzma.mk
@@ -7,10 +7,8 @@
 LZMA_VERSION = 4.32.7
 LZMA_SOURCE = lzma-$(LZMA_VERSION).tar.xz
 LZMA_SITE = http://tukaani.org/lzma/
-LZMA_INSTALL_STAGING = YES
 LZMA_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
 
-$(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
 LZMA = $(HOST_DIR)/usr/bin/lzma
