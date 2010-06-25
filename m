From: cmchao <cmchao@gmail.com>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] dash : convert to autotools
	infrastructure & bump to 0.5.5.1
Message-ID: <20100625103240.C810281DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1e3d5d2a192339efe3f27eb8363c6229cfa5a30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 * No need to strip
 * Target installation is the default
 * No installation to staging is the default
 * Remove DASH_BINARY/DASH_SOURCE variables
 * Fix minor mistakes
 * Simplify: no need to pass CC/CC_FOR_BUILD

Signed-off-by: cmchao <cmchao@gmail.com>

merge dash
---
 package/dash/dash.mk |   73 +++++++-------------------------------------------
 1 files changed, 10 insertions(+), 63 deletions(-)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 63a102a..e5da642 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -3,71 +3,18 @@
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
-DASH_BINARY:=src/dash
-DASH_TARGET_BINARY:=bin/dash
+DASH_PATCH:=dash_$(DASH_VERSION)-6.diff.gz
 
-$(DL_DIR)/$(DASH_SOURCE):
-	$(call DOWNLOAD,$(DASH_SITE),$(DASH_SOURCE))
+define DASH_INSTALL_TARGET_CMDS
+	cp -a $(@D)/src/dash $(TARGET_DIR)/bin/dash
+endef
 
-$(DL_DIR)/$(DASH_PATCH1):
-	$(call DOWNLOAD,$(DASH_SITE),$(DASH_PATCH1))
+define DASH_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+	rm -f $(TARGET_DIR)/bin/dash
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
-	cp -a $(DASH_DIR)/$(DASH_BINARY) $(TARGET_DIR)/$(DASH_TARGET_BINARY)
-	touch -c $(TARGET_DIR)/$(DASH_TARGET_BINARY)
-
-dash: $(TARGET_DIR)/$(DASH_TARGET_BINARY)
-
-dash-clean:
-	$(MAKE1) CC=$(TARGET_CC) -C $(DASH_DIR) clean
-	rm -f $(TARGET_DIR)/$(DASH_TARGET_BINARY)
-
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
1.7.1
