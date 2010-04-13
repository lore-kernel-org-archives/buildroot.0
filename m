From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:01 +0200
Subject: [Buildroot] [PATCH 28/41] valgrind: conversion to autotool
	infrastructure
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-29-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/valgrind/valgrind.mk |   97 ++++++++++--------------------------------
 1 files changed, 23 insertions(+), 74 deletions(-)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 5bf0a9d..ef36023 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,85 +4,34 @@
 #
 #############################################################
 
-VALGRIND_VERSION=3.2.3
-VALGRIND_SITE:=http://valgrind.org/downloads/
-VALGRIND_DIR:=$(BUILD_DIR)/valgrind-$(VALGRIND_VERSION)
-VALGRIND_SOURCE:=valgrind-$(VALGRIND_VERSION).tar.bz2
-VALGRIND_CAT:=$(BZCAT)
-
-$(DL_DIR)/$(VALGRIND_SOURCE):
-	$(call DOWNLOAD,$(VALGRIND_SITE),$(VALGRIND_SOURCE))
-
-$(VALGRIND_DIR)/.unpacked: $(DL_DIR)/$(VALGRIND_SOURCE)
-	$(VALGRIND_CAT) $(DL_DIR)/$(VALGRIND_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(VALGRIND_DIR)/.unpacked
-
-$(VALGRIND_DIR)/.patched: $(VALGRIND_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(VALGRIND_DIR) package/valgrind/ valgrind\*.patch
-	touch $(VALGRIND_DIR)/.patched
-
-$(VALGRIND_DIR)/.configured: $(VALGRIND_DIR)/.patched
-	(cd $(VALGRIND_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CC="$(TARGET_CC) $(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_NLS) \
-		--without-uiout --disable-valgrindmi \
-		--disable-tui --disable-valgrindtk \
-		--without-x --without-included-gettext \
-		--disable-tls \
-	)
-	touch $(VALGRIND_DIR)/.configured
-
-$(VALGRIND_DIR)/coregrind/valgrind: $(VALGRIND_DIR)/.configured
-	$(MAKE) -C $(VALGRIND_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/usr/bin/valgrind: $(VALGRIND_DIR)/coregrind/valgrind
-	$(MAKE) \
-	    prefix=$(TARGET_DIR)/usr \
-	    exec_prefix=$(TARGET_DIR)/usr \
-	    bindir=$(TARGET_DIR)/usr/bin \
-	    sbindir=$(TARGET_DIR)/usr/sbin \
-	    libexecdir=$(TARGET_DIR)/usr/lib \
-	    datadir=$(TARGET_DIR)/usr/share \
-	    sysconfdir=$(TARGET_DIR)/etc \
-	    sharedstatedir=$(TARGET_DIR)/usr/com \
-	    localstatedir=$(TARGET_DIR)/var \
-	    libdir=$(TARGET_DIR)/usr/lib \
-	    infodir=$(TARGET_DIR)/usr/info \
-	    mandir=$(TARGET_DIR)/usr/man \
-	    includedir=$(TARGET_DIR)/usr/include \
-	    -C $(VALGRIND_DIR) install
+VALGRIND_VERSION = 3.2.3
+VALGRIND_SITE = http://valgrind.org/downloads/
+VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
+
+VALGRIND_CONF_OPT = \
+	--without-uiout \
+	--disable-valgrindmi \
+	--disable-tui \
+	--disable-valgrindtk \
+	--without-x \
+	--without-included-gettext \
+	--disable-tls
+
+define VALGRIND_EXTRA_INSTALL
 	mv $(TARGET_DIR)/usr/bin/valgrind $(TARGET_DIR)/usr/bin/valgrind.bin
 	cp package/valgrind/uclibc.supp $(TARGET_DIR)/usr/lib/valgrind/
 	cp package/valgrind/valgrind.sh $(TARGET_DIR)/usr/bin/valgrind
 	chmod a+x $(TARGET_DIR)/usr/bin/valgrind
-	rm -rf $(TARGET_DIR)/usr/share/doc/valgrind
-	touch -c $@
+endef
 
-valgrind: $(TARGET_DIR)/usr/bin/valgrind
+VALGRIND_POST_TARGET_INSTALL_HOOK += VALGRIND_EXTRA_INSTALL
 
-valgrind-source: $(DL_DIR)/$(VALGRIND_SOURCE)
+define VALGRIND_EXTRA_UNINSTALL
+	rm -f $(TARGET_DIR)/usr/bin/valgrind.bin
+	rm -f $(TARGET_DIR)/usr/bin/valgrind/valgrind.sh
+	rm -f $(TARGET_DIR)/usr/lib/valgrind/uclibc.supp
+endef
 
-valgrind-clean:
-	-$(MAKE) -C $(VALGRIND_DIR) clean
-	-rm -f $(TARGET_DIR)/usr/bin/valgrind*
-	rm -rf $(TARGET_DIR)/usr/lib/valgrind
+VALGRIND_POST_UNINSTALL_TARGET_HOOKS += VALGRIND_EXTRA_UNINSTALL
 
-valgrind-dirclean:
-	rm -rf $(VALGRIND_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_VALGRIND),y)
-TARGETS+=valgrind
-endif
+$(eval $(call AUTOTARGETS,package,valgrind))
-- 
1.7.0.4
