From: cmchao <cmchao@gmail.com>
Date: Wed, 16 Jun 2010 19:47:21 +0800
Subject: [Buildroot] [PATCH 19/19] lrzsz : convert to autotools
	infrastructure
In-Reply-To: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
References: <1276688841-5252-1-git-send-email-cmchao@gmail.com>
Message-ID: <1276688841-5252-20-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: cmchao <cmchao@gmail.com>
---
 package/lrzsz/lrzsz.mk |   71 +++++++++++------------------------------------
 1 files changed, 17 insertions(+), 54 deletions(-)

diff --git a/package/lrzsz/lrzsz.mk b/package/lrzsz/lrzsz.mk
index 0a7de51..0b7f4e6 100644
--- a/package/lrzsz/lrzsz.mk
+++ b/package/lrzsz/lrzsz.mk
@@ -23,64 +23,27 @@
 LRZSZ_VERSION:=0.12.20
 LRZSZ_SITE:=http://www.ohse.de/uwe/releases
 LRZSZ_SOURCE:=lrzsz-$(LRZSZ_VERSION).tar.gz
-LRZSZ_DIR:=$(BUILD_DIR)/lrzsz-$(LRZSZ_VERSION)
 
-$(DL_DIR)/$(LRZSZ_SOURCE):
-	$(call DOWNLOAD,$(LRZSZ_SITE),$(LRZSZ_SOURCE))
+LRZSR_CONF_OPT = --disable-timesync
 
-lrzsz-source: $(DL_DIR)/$(LRZSZ_SOURCE)
+define LRZSZ_POST_CONFIGURE_HOOKS
+	$(SED) "s/-lnsl//;" $(@D)/src/Makefile
+	$(SED) "s~\(#define ENABLE_SYSLOG.*\)~/* \1 */~;" $(@D)/config.h
+endef
 
-$(LRZSZ_DIR)/.unpacked: $(DL_DIR)/$(LRZSZ_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(LRZSZ_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(LRZSZ_DIR)/.unpacked
+define LRZSZ_BUILD_HOOKS
+	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" prefix="$(TARGET_DIR)" -C $(@D)
+	$(STRIPCMD) $(@D)/src/lrz $(@D)/src/lsz
+endef
 
-$(LRZSZ_DIR)/.configured: $(LRZSZ_DIR)/.unpacked
-	(cd $(LRZSZ_DIR); rm -rf config.cache; \
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
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/tmp \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		--disable-timesync \
-	)
-	$(SED) "s/-lnsl//;" $(LRZSZ_DIR)/src/Makefile
-	$(SED) "s~\(#define ENABLE_SYSLOG.*\)~/* \1 */~;" $(LRZSZ_DIR)/config.h
-	touch $(LRZSZ_DIR)/.configured
+define LRZSZ_INSTALL_TARGET_CMDS
+	cp $(@D)/src/lrz $(TARGET_DIR)/usr/bin/rz
+	cp $(@D)/src/lsz $(TARGET_DIR)/usr/bin/sz
+endef
 
-$(LRZSZ_DIR)/src/lrz: $(LRZSZ_DIR)/.configured
-	$(MAKE) CROSS_COMPILE="$(TARGET_CROSS)" prefix="$(TARGET_DIR)" -C $(LRZSZ_DIR)
-	$(STRIPCMD) $(LRZSZ_DIR)/src/lrz $(LRZSZ_DIR)/src/lsz
-
-$(TARGET_DIR)/usr/bin/rz: $(LRZSZ_DIR)/src/lrz
-	cp $(LRZSZ_DIR)/src/lrz $(TARGET_DIR)/usr/bin/rz
-	cp $(LRZSZ_DIR)/src/lsz $(TARGET_DIR)/usr/bin/sz
-
-lrzsz: $(TARGET_DIR)/usr/bin/rz
-
-lrzsz-clean:
+define LRZSZ_CLEAN_CMDS
 	rm -f $(TARGET_DIR)/usr/bin/rz
-	-$(MAKE) -C $(LRZSZ_DIR) clean
+	-$(MAKE) -C $(@D) clean
+endef
 
-lrzsz-dirclean:
-	rm -rf $(LRZSZ_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LRZSZ),y)
-TARGETS+=lrzsz
-endif
+$(eval $(call AUTOTARGETS,package,lrzsz))
-- 
1.7.0.4
