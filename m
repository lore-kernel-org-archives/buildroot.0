From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 20:33:14 +0200
Subject: [Buildroot] [PATCH 2/5] dillo: remove deprecated package
In-Reply-To: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284316268.git.thomas.petazzoni@free-electrons.com>
Message-ID: <017f3e84478137fa3b11e5c4b709864dc03d4a45.1284316268.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version of Dillo, based on Gtk 1.x is no longer maintained.

If someone needs the newer version of Dillo, we'll have to package
FLTK2 first.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in       |    1 -
 package/dillo/Config.in |   13 ----------
 package/dillo/dillo.mk  |   58 -----------------------------------------------
 3 files changed, 0 insertions(+), 72 deletions(-)
 delete mode 100644 package/dillo/Config.in
 delete mode 100644 package/dillo/dillo.mk

diff --git a/package/Config.in b/package/Config.in
index ce730ac..1e57172 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -123,7 +123,6 @@ source "package/blackbox/Config.in"
 
 comment "X applications"
 source "package/alsamixergui/Config.in"
-source "package/dillo/Config.in"
 source "package/docker/Config.in"
 source "package/gqview/Config.in"
 source "package/gmpc/Config.in"
diff --git a/package/dillo/Config.in b/package/dillo/Config.in
deleted file mode 100644
index 63a4f7d..0000000
--- a/package/dillo/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_DILLO
-	bool "dillo"
-	depends on BR2_DEPRECATED
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBGLIB12
-	select BR2_PACKAGE_LIBGTK12
-	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LIBPNG
-	depends on BR2_PACKAGE_XORG7
-	help
-	  Dillo is a small GTK+ based web browser written in C.
-
-	  http://www.dillo.org/
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
deleted file mode 100644
index cffb827..0000000
--- a/package/dillo/dillo.mk
+++ /dev/null
@@ -1,58 +0,0 @@
-#############################################################
-#
-# dillo
-#
-#############################################################
-
-DILLO_VERSION=0.8.6
-DILLO_SOURCE=dillo-$(DILLO_VERSION).tar.bz2
-DILLO_SITE=http://www.dillo.org/download/
-DILLO_DIR=$(BUILD_DIR)/dillo-$(DILLO_VERSION)
-DILLO_CAT:=$(BZCAT)
-
-$(DL_DIR)/$(DILLO_SOURCE):
-	$(call DOWNLOAD,$(DILLO_SITE),$(DILLO_SOURCE))
-
-$(DILLO_DIR)/.unpacked: $(DL_DIR)/$(DILLO_SOURCE)
-	$(DILLO_CAT) $(DL_DIR)/$(DILLO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(DILLO_DIR)/.unpacked
-
-$(DILLO_DIR)/.configured: $(DILLO_DIR)/.unpacked
-	(cd $(DILLO_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
-		--program-transform-name='' \
-		--disable-dlgui \
-	)
-	touch $(DILLO_DIR)/.configured
-
-$(DILLO_DIR)/src/dillo: $(DILLO_DIR)/.configured
-	$(MAKE) CC="$(TARGET_CC)" -C $(DILLO_DIR)
-
-$(DILLO_DIR)/.installed: $(DILLO_DIR)/src/dillo
-	$(MAKE) -C $(DILLO_DIR) DESTDIR=$(TARGET_DIR) install
-	touch $(DILLO_DIR)/.installed
-
-dillo: xserver_xorg-server libglib12 libgtk12 jpeg libpng $(DILLO_DIR)/.installed
-
-dillo-source: $(DL_DIR)/$(DILLO_SOURCE)
-
-dillo-clean:
-	-$(MAKE) -C $(DILLO_DIR) clean
-
-dillo-dirclean:
-	rm -rf $(DILLO_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DILLO),y)
-TARGETS+=dillo
-endif
-- 
1.7.0.4
