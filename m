From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Apr 2010 15:11:20 +0200
Subject: [Buildroot] [PATCH 08/21] libcgicc: convert to the autotools
	infrastructure
In-Reply-To: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271077873.git.thomas.petazzoni@free-electrons.com>
Message-ID: <e81107484f504fd8580b79942018fe503b9a71de.1271077873.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgicc/libcgicc.mk |   64 +++--------------------------------------
 1 files changed, 5 insertions(+), 59 deletions(-)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index b4cf567..d792375 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -3,67 +3,13 @@
 # libcgicc
 #
 #############################################################
-
 LIBCGICC_VERSION=3.2.9
-LIBCGICC_DIR=$(BUILD_DIR)/cgicc-$(LIBCGICC_VERSION)
 LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
-LIBCGICC_CAT:=$(ZCAT)
-
-$(DL_DIR)/$(LIBCGICC_SOURCE):
-	$(call DOWNLOAD,$(LIBCGICC_SITE),$(LIBCGICC_SOURCE))
-
-libcgicc-source: $(DL_DIR)/$(LIBCGICC_SOURCE)
-
-$(LIBCGICC_DIR)/.unpacked: $(DL_DIR)/$(LIBCGICC_SOURCE)
-	$(LIBCGICC_CAT) $(DL_DIR)/$(LIBCGICC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBCGICC_DIR) package/libcgicc cgicc\*.patch
-	touch $@
-
-$(LIBCGICC_DIR)/.configured: $(LIBCGICC_DIR)/.unpacked
-	(cd $(LIBCGICC_DIR); rm -f config.cache; \
-		$(AUTORECONF); \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--disable-demos \
-		--disable-doc \
-	)
-	touch $@
-
-$(LIBCGICC_DIR)/.compiled: $(LIBCGICC_DIR)/.configured
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(LIBCGICC_DIR)
-	touch $@
-
-$(STAGING_DIR)/usr/lib/libcgicc.so: $(LIBCGICC_DIR)/.compiled
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBCGICC_DIR) install
-	touch -c $(STAGING_DIR)/usr/lib/libcgicc.so
-
-$(TARGET_DIR)/usr/lib/libcgicc.so: $(STAGING_DIR)/usr/lib/libcgicc.so
-	cp -dpf $(STAGING_DIR)/usr/lib/libcgicc.so* $(TARGET_DIR)/usr/lib/
+LIBCGICC_INSTALL_STAGING=YES
 
-libcgicc: $(TARGET_DIR)/usr/lib/libcgicc.so
+LIBCGICC_CONF_OPT = \
+	--disable-demos \
+	--disable-doc
 
-libcgicc-unpacked: $(LIBCGICC_DIR)/.unpacked
-
-libcgicc-clean:
-		-$(MAKE) -C $(LIBCGICC_DIR) clean
-
-libcgicc-dirclean:
-	rm -rf $(LIBCGICC_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBCGICC),y)
-TARGETS+=libcgicc
-endif
+$(eval $(call AUTOTARGETS,package,libcgicc))
\ No newline at end of file
-- 
1.6.3.3
