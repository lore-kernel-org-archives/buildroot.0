From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 6 Dec 2009 19:58:45 +0100
Subject: [Buildroot] [git commit master] Bump usbutils package to 0.86
Message-ID: <20091206190101.BA2D1777F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d8968c6794d3cee4e2ed228745b0783c09aff59a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #749.

[Peter: remove redundant ac_cv_func_malloc_0_nonnull setting]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    1 +
 package/usbutils/Config.in   |   10 ++++++
 package/usbutils/usbutils.mk |   67 ++++++++++-------------------------------
 3 files changed, 28 insertions(+), 50 deletions(-)

diff --git a/CHANGES b/CHANGES
index 87543e0..904bb48 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,6 +4,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#749: Bump usbutils package to version 0.86
 	#751: Kernel 2.6 snapshot fetch fail
 	#753: Bump lighttpd package to 1.4.25
 	#761: Add binutils 2.20 to toolchain options
diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 01c9fc3..23004d9 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -5,3 +5,13 @@ config BR2_PACKAGE_USBUTILS
 	  USB enumeration utilities
 
 	  http://linux-usb.sourceforge.net/
+
+config BR2_PACKAGE_USBUTILS_ZLIB
+	bool "compressed data support"
+	depends on BR2_PACKAGE_USBUTILS
+	select BR2_PACKAGE_ZLIB
+	help
+	  Enable use of zlib for a compressed usb.ids.gz
+	  This makes the data file smaller if you're not using a compressed
+	  filesystem, but it also makes lsusb slower since it has
+	  to decompress the file every time it's run.
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 6a5dd4a..1d21a08 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -3,59 +3,26 @@
 # usbutils
 #
 #############################################################
-USBUTILS_VERSION:=0.72
-USBUTILS_SOURCE:=usbutils-$(USBUTILS_VERSION).tar.gz
-USBUTILS_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-usb/
-USBUTILS_DIR:=$(BUILD_DIR)/usbutils-$(USBUTILS_VERSION)
-USBUTILS_CAT:=$(ZCAT)
-USBUTILS_BINARY:=lsusb
-USBUTILS_TARGET_BINARY:=usr/sbin/lsusb
 
-$(DL_DIR)/$(USBUTILS_SOURCE):
-	$(call DOWNLOAD,$(USBUTILS_SITE),$(USBUTILS_SOURCE))
+USBUTILS_VERSION = 0.86
+USBUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-usb/
+USBUTILS_DEPENDENCIES = host-pkgconfig
 
-usbutils-source: $(DL_DIR)/$(USBUTILS_SOURCE)
-
-usbutils-unpacked: $(USBUTILS_DIR)/.unpacked
-$(USBUTILS_DIR)/.unpacked: $(DL_DIR)/$(USBUTILS_SOURCE)
-	$(USBUTILS_CAT) $(DL_DIR)/$(USBUTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(USBUTILS_DIR)/.unpacked
-
-$(USBUTILS_DIR)/.configured: $(USBUTILS_DIR)/.unpacked
-	(cd $(USBUTILS_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		ac_cv_func_malloc_0_nonnull=yes \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-	)
-	touch $(USBUTILS_DIR)/.configured
-
-$(USBUTILS_DIR)/$(USBUTILS_BINARY): $(USBUTILS_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(USBUTILS_DIR)
-
-$(TARGET_DIR)/$(USBUTILS_TARGET_BINARY): $(USBUTILS_DIR)/$(USBUTILS_BINARY)
-	$(MAKE) -C $(USBUTILS_DIR) DESTDIR=$(TARGET_DIR) install
-	rm -rf $(TARGET_DIR)/usr/man
+ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
+	USBUTILS_DEPENDENCIES += zlib
+else
+	USBUTILS_CONF_OPT = --disable-zlib
+endif
 
-usbutils: libusb $(TARGET_DIR)/$(USBUTILS_TARGET_BINARY)
+$(eval $(call AUTOTARGETS,package,usbutils))
 
-usbutils-clean:
-	rm -f $(TARGET_DIR)/$(USBUTILS_TARGET_BINARY)
+$(USBUTILS_HOOK_POST_INSTALL):
+	rm -f $(TARGET_DIR)/usr/bin/usb-devices
+	rm -f $(TARGET_DIR)/usr/sbin/update-usbids.sh
+	rm -f $(TARGET_DIR)/usr/share/pkgconfig/usbutils.pc
+ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	rm -f $(TARGET_DIR)/usr/share/usb.ids
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
-	-$(MAKE) -C $(USBUTILS_DIR) clean
-
-usbutils-dirclean:
-	rm -rf $(USBUTILS_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_USBUTILS),y)
-TARGETS+=usbutils
+else
+	rm -f $(TARGET_DIR)/usr/share/usb.ids.gz
 endif
+	touch $@
-- 
1.6.3.3
