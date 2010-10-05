From: Martin Banky <martin.banky@gmail.com>
Date: Tue,  5 Oct 2010 01:22:37 -0700
Subject: [Buildroot] [PATCH 04/10] memtester: convert to gentargets and bump
	to 4.2.0
In-Reply-To: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286266963-23413-4-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, memtester requires largefile support

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/memtester/Config.in    |    4 +++
 package/memtester/memtester.mk |   55 ++++++++++++++--------------------------
 2 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/package/memtester/Config.in b/package/memtester/Config.in
index 7a504dc..82769f5 100644
--- a/package/memtester/Config.in
+++ b/package/memtester/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_MEMTESTER
 	bool "memtester"
+	depends on BR2_LARGEFILE
 	help
 	  A userspace utility for testing the memory subsystem for faults.
 
 	  http://pyropus.ca/software/memtester/
+
+comment "memtester requires a toolchain with LARGEFILE support"
+       depends on !BR2_LARGEFILE
diff --git a/package/memtester/memtester.mk b/package/memtester/memtester.mk
index ed8470b..6e72152 100644
--- a/package/memtester/memtester.mk
+++ b/package/memtester/memtester.mk
@@ -3,45 +3,28 @@
 # memtester
 #
 #############################################################
-MEMTESTER_VERSION:=4.0.6
-MEMTESTER_SOURCE:=memtester-$(MEMTESTER_VERSION).tar.gz
-MEMTESTER_SITE:=http://pyropus.ca/software/memtester/old-versions/
-MEMTESTER_DIR:=$(BUILD_DIR)/memtester-$(MEMTESTER_VERSION)
-MEMTESTER_BINARY:=memtester
-MEMTESTER_TARGET_BINARY:=usr/bin/memtester
+MEMTESTER_VERSION = 4.2.0
+MEMTESTER_SOURCE = memtester-$(MEMTESTER_VERSION).tar.gz
+MEMTESTER_SITE = http://pyropus.ca/software/memtester/old-versions/
 
-$(DL_DIR)/$(MEMTESTER_SOURCE):
-	 $(call DOWNLOAD,$(MEMTESTER_SITE),$(MEMTESTER_SOURCE))
+MEMTESTER_TARGET_INSTALL_OPTS = INSTALLPATH=$(TARGET_DIR)/usr
 
-memtester-source: $(DL_DIR)/$(MEMTESTER_SOURCE)
+define MEMTESTER_BUILD_CMDS
+	$(SED) "s,cc,$(TARGET_CC)," $(@D)/conf-*
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
 
-$(MEMTESTER_DIR)/.unpacked: $(DL_DIR)/$(MEMTESTER_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(MEMTESTER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	#toolchain/patch-kernel.sh $(MEMTESTER_DIR) package/memtester/ memtester\*.patch
-	$(SED) "s,cc,$(TARGET_CC)," $(MEMTESTER_DIR)/conf-*
-	touch $(MEMTESTER_DIR)/.unpacked
+define MEMTESTER_INSTALL_TARGET_CMDS
+	$(MAKE) $(MEMTESTER_TARGET_INSTALL_OPTS) -C $(@D) install
+endef
 
-$(MEMTESTER_DIR)/$(MEMTESTER_BINARY): $(MEMTESTER_DIR)/.unpacked
-	$(MAKE) -C $(MEMTESTER_DIR)
-	$(STRIPCMD) $(MEMTESTER_DIR)/$(MEMTESTER_BINARY)
+define MEMTESTER_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/memtester
+endef
 
-$(TARGET_DIR)/$(MEMTESTER_TARGET_BINARY): $(MEMTESTER_DIR)/$(MEMTESTER_BINARY)
-	$(INSTALL) -m 0755 -D $(MEMTESTER_DIR)/$(MEMTESTER_BINARY) $(TARGET_DIR)/$(MEMTESTER_TARGET_BINARY)
+define MEMTESTER_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
-memtester: $(TARGET_DIR)/$(MEMTESTER_TARGET_BINARY)
-
-memtester-clean:
-	rm -f $(TARGET_DIR)/$(MEMTESTER_TARGET_BINARY)
-	-$(MAKE) -C $(MEMTESTER_DIR) clean
-
-memtester-dirclean:
-	rm -rf $(MEMTESTER_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_MEMTESTER),y)
-TARGETS+=memtester
-endif
+$(eval $(call GENTARGETS,package,memtester))
-- 
1.7.3.1
