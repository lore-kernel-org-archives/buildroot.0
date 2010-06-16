From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:09 +0800
Subject: [Buildroot] [PATCH 07/19] dash : convert to autotools
	infrastructure & bump to 0.5.5.1
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-8-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/dash/dash.mk |   71 ++++++++++----------------------------------------
 1 files changed, 14 insertions(+), 57 deletions(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 63a102a..1f229de 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -3,71 +3,28 @@
 # dash
 #
 #############################################################
-DASH_VERSION:=0.5.3
+DASH_VERSION:=0.5.5.1
 DASH_SOURCE:=dash_$(DASH_VERSION).orig.tar.gz
 DASH_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/d/dash
-DASH_CAT:=$(ZCAT)
-DASH_DIR:=$(BUILD_DIR)/dash-$(DASH_VERSION)
-DASH_PATCH1:=dash_$(DASH_VERSION)-7.diff.gz
+DASH_PATCH:=dash_$(DASH_VERSION)-6.diff.gz
 DASH_BINARY:=src/dash
 DASH_TARGET_BINARY:=bin/dash
 
-$(DL_DIR)/$(DASH_SOURCE):
-	$(call DOWNLOAD,$(DASH_SITE),$(DASH_SOURCE))
+DASH_INSTALL_STAGING = NO
+DASH_INSTALL_TARGET = YES
 
-$(DL_DIR)/$(DASH_PATCH1):
-	$(call DOWNLOAD,$(DASH_SITE),$(DASH_PATCH1))
+define DASH_BUILD_CMDS
+	$(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(@D)
+endef
 
-dash-source: $(DL_DIR)/$(DASH_SOURCE) $(DL_DIR)/$(DASH_PATCH1)
-
-$(DASH_DIR)/.unpacked: $(DL_DIR)/$(DASH_SOURCE) $(DL_DIR)/$(DASH_PATCH1)
-	$(DASH_CAT) $(DL_DIR)/$(DASH_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	$(ZCAT) $(DL_DIR)/$(DASH_PATCH1) | patch -p1 -d $(DASH_DIR)
-	touch $(DASH_DIR)/.unpacked
-
-$(DASH_DIR)/.configured: $(DASH_DIR)/.unpacked
-	(cd $(DASH_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-	)
-	touch $(DASH_DIR)/.configured
-
-$(DASH_DIR)/$(DASH_BINARY): $(DASH_DIR)/.configured
-	$(MAKE1) CC=$(TARGET_CC) CC_FOR_BUILD="$(HOSTCC)" -C $(DASH_DIR)
-	touch -c $(DASH_DIR)/$(DASH_BINARY)
-
-$(TARGET_DIR)/$(DASH_TARGET_BINARY): $(DASH_DIR)/$(DASH_BINARY)
+define DASH_INSTALL_TARGET_CMDS
 	cp -a $(DASH_DIR)/$(DASH_BINARY) $(TARGET_DIR)/$(DASH_TARGET_BINARY)
-	touch -c $(TARGET_DIR)/$(DASH_TARGET_BINARY)
-
-dash: $(TARGET_DIR)/$(DASH_TARGET_BINARY)
+	-$(STRIPCMD) $(TARGET_DIR)/$(DASH_TARGET_BINARY)
+endef
 
-dash-clean:
-	$(MAKE1) CC=$(TARGET_CC) -C $(DASH_DIR) clean
+define DASH_CLEAN_CMDS
+	$(MAKE1) CC=$(TARGET_CC) -C $(@@D) clean
 	rm -f $(TARGET_DIR)/$(DASH_TARGET_BINARY)
+endef
 
-dash-dirclean:
-	rm -rf $(DASH_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_DASH),y)
-TARGETS+=dash
-endif
+$(eval $(call AUTOTARGETS,package,dash))
-- 
1.7.0.4
